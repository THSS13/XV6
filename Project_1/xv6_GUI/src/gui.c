#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "spinlock.h"
#include "gui.h"
#include "window.h"
#include "bitmap.h"
#include "mouse.h"
#include "character.h"

GUI_MODE_INFO GUI_INFO;
extern WindowQueue windowQueue;
extern WindowQueue *lastWindow;
extern mouseinfo mouse_info;
RGB *screen, *screen_temp1, *screen_temp2;
IconView *focusIcon = 0;
RGB background[96 * 96];
int isBg[96 * 96];
struct spinlock gui_lock;

char dm[14][14] = {
    {0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0},
    {0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0},
    {0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0},
    {1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1},
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1},
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1},
    {1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1},
    {0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0},
    {0, 0, 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0},
    {0, 0, 0, 1, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0},
    {0, 0, 0, 0, 1, 1, 2, 2, 1, 1, 0, 0, 0, 0},
    {0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0},
  };

void initGUI()
{
  GUI_INFO = *((GUI_MODE_INFO *)(GUI_BUF << 4));
  screen = (RGB *)GUI_INFO.PhysBasePtr;
  screen_temp1 = (RGB *)(GUI_INFO.PhysBasePtr + 0x3c0000);
  screen_temp2 = (RGB *)(GUI_INFO.PhysBasePtr + 0x780000);
  initlock(&gui_lock, "gui");
}

inline int isAlpha(RGB *color)
{
  if ((color->R == color->G) && (color->R == color->B) && (color->R == 0x00))
    return 1;
  else
    return 0;
}

void drawPoint(RGB* color, unsigned char R, unsigned char G, unsigned char B)
{
  color->R = R;
  color->G = G;
  color->B = B;
}

int drawCharacter(RGB *buf, int x, int y, char ch, unsigned char R, unsigned char G, unsigned char B)
{
  int i, j, flag, tem_int, tem_width;
  RGB *t;
  int ord = ch - 0x20;

  if(ord > 94 || ord < 0)
    return -1;
  
  tem_int = 0;
  tem_width = 0;
  flag = 1;
  for (j = 0; j < CHARACTER_WIDTH; j++)
  {
    if(j > 1)
    {
      tem_int = 0;
      for (i = 0; i < CHARACTER_HEIGHT; i++)
      {
        if(character[ord][i][j] == 1)
        {
          tem_int = 1;
          break;
        }          
      }
      if(tem_int == 1)
        flag = 1;
      else
        flag = 0;
    }
    
    if(flag == 1)
    {
      tem_width ++;
      for (i = 0; i < CHARACTER_HEIGHT; i++)
      {
        t = buf + (y + i) * SCREEN_WIDTH + x + j;
        if (character[ord][i][j] == 1)
          drawPoint(t, R, G, B);
      }
    }
  }
  return (tem_width + 2);
}

void drawCharacters(RGB *buf, int x, int y, char *str, unsigned char R, unsigned char G, unsigned char B)
{
  int pos_x = 0;

  while (*str != '\0')
  {
    pos_x += drawCharacter(buf, x + pos_x, y, *str, R, G, B);
    str++;
  }
}

void drawLabel(RGB *buf, Label *label, Window *window)
{
  int i, j;
  RGB *t;

  for (j = 0; j < label->height; j++)
  {
    t = buf + (window->leftTopY + label->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + label->leftTopX;
    for (i = 0; i < label->width; i++)
    {
      drawPoint(t, 0xc8, 0xc8, 0xc8);
      t++;
    }
  }
}

void drawCursor(RGB *buf,TextBox *textBox,Window *window,int lines,int pos_x)
{
  int s;
  RGB *t;
  t = buf + (window->leftTopY + textBox->leftTopY + lines * 18) * SCREEN_WIDTH + window->leftTopX + textBox->leftTopX + pos_x;
  for (s = 0; s < CHARACTER_HEIGHT; s++)
  {
    drawPoint(t, 0x00, 0x00, 0x00);
    t += SCREEN_WIDTH;
  }
}

void drawTextBox(RGB *buf, TextBox *textBox, Window *window)
{
  int i, j, pos_x;
  RGB *t;

  for (j = 0; j < textBox->height; j++)
  {
    t = buf + (window->leftTopY + textBox->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + textBox->leftTopX;
    for (i = 0; i < textBox->width; i++)
    {
      drawPoint(t, 0xff, 0xff, 0xff);
      t++;
    }
  }

  for (j = 0; j < textBox->height; j++)
  {
    t = buf + (window->leftTopY + textBox->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + textBox->leftTopX;
    drawPoint(t, 0xcc, 0xcc, 0xcc);
    t += textBox->width - 1;
    drawPoint(t, 0xcc, 0xcc, 0xcc);
  }

  t =  buf + (window->leftTopY + textBox->leftTopY) * SCREEN_WIDTH + window->leftTopX + textBox->leftTopX;
  for (i = 0; i < textBox->width-1; i++)
  {
     drawPoint(t, 0xcc, 0xcc, 0xcc);
     t++;
  }
  t =  buf + (window->leftTopY + textBox->leftTopY + textBox->height - 1) * SCREEN_WIDTH + window->leftTopX + textBox->leftTopX;
  for (i = 0; i < textBox->width-1; i++)
  {
     drawPoint(t, 0xcc, 0xcc, 0xcc);
     t++;
  }

  i = 0;
  j = 0;
  pos_x = 9;
  
  //cprintf("%s\n", textBox->text);
  while(textBox->text[i] != '\0')
  {
    if(pos_x > (textBox->width - 9))  
    {
      pos_x = 9;
      j++;
    }
    if(textBox->text[i] == '\n')
    {
      pos_x = 9;
      j++;      
      if(i == textBox->cursor - 1)
      {
        drawCursor(buf,textBox,window,j,pos_x);
      }
      i++;
      if(textBox->text[i] == '\0')
      {        
        break;
      }
      continue;
    }
    pos_x += drawCharacter(buf, window->leftTopX + textBox->leftTopX + pos_x,window->leftTopY + textBox->leftTopY + j * CHARACTER_HEIGHT,textBox->text[i],0x00,0x00,0x00);  
    //printf(1,"%c",textBox->text[i]);  
    if(i == textBox->cursor - 1)
    {
      drawCursor(buf,textBox,window,j,pos_x);
    }
    i++;
  }
  if(textBox->cursor == 0)
  {
    drawCursor(buf,textBox,window,0,9);
  }
}

void drawButton(RGB *buf, Button *button, Window *window)
{
  int i, j, len;
  RGB *t, *t1, *t2;

  if (button->image)
  {
    for (j = 0; j < button->height; j++)
    {
      t1 = buf + (window->leftTopY + button->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + button->leftTopX;
      t2 = button->image + (button->height - 1 - j) * button->width;
      for (i = 0; i < button->width; i++)
      {
        if (isAlpha(t2) == 0)
          *t1 = *t2;
        t1++;
        t2++;
      }
    }
  }
  else
  {
    for (j = 0; j < button->height; j++)
    {
      t = buf + (window->leftTopY + button->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + button->leftTopX;
      for (i = 0; i < button->width; i++)
      {
        drawPoint(t, 0xc8, 0xc8, 0xc8);
        t++;
      }
    }
  }
  if (window->hasMenu)
    drawCharacters(buf, window->leftTopX + button->leftTopX + button->width + 10, window->leftTopY + button->leftTopY + button->height / 3, button->text, 0, 0, 0);
  else
  {
    len = strlen(button->text);
    drawCharacters(buf, window->leftTopX + button->leftTopX + button->width / 2 - len * 9 / 2, window->leftTopY + button->leftTopY + button->height / 3, button->text, 0, 0, 0);
  }
}

void drawImageView(RGB *buf, ImageView *imageView, Window *window)
{
  int i, j;
  RGB *t1, *t2;

  for (j = 0; j < imageView->height; j++)
  {
    t1 = buf + (window->leftTopY + imageView->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + imageView->leftTopX;
    t2 = imageView->image + (imageView->height - 1 - j) * imageView->width;
    for (i = 0; i < imageView->width; i++)
    {
      if (!(imageView->alphaBG && isAlpha(t2)))
      *t1 = *t2;
      t1++;
      t2++;
    }
  }
}

void drawIconView(RGB *buf, IconView *iconView, Window *window)
{
  int i, j, len;
  RGB *t1, *t2;

  for (j = 0; j < iconView->height; j++)
  {
    t1 = buf + (window->leftTopY + iconView->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + iconView->leftTopX;
    t2 = iconView->image + (iconView->height - 1 - j) * iconView->width;
    for (i = 0; i < iconView->width; i++)
    {
      if (isAlpha(t2) == 0)
        *t1 = *t2;
      t1++;
      t2++;
    }
  }
  len = strlen(iconView->text);
  drawCharacters(buf, window->leftTopX + iconView->leftTopX + iconView->width / 2 - len * 9 / 2, window->leftTopY + iconView->leftTopY + iconView->height + 5, iconView->text, 0, 0, 0);
}

void drawWindow(RGB *buf, Window *window, int focus)
{
  int i, j, len;
  RGB *t;
  
  if (window->hasCaption == 1)
  {
    for (j = 0; j < CAPTION_HEIGHT; j++)
    {
      t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
      for (i = 0; i < window->width; i++)
      {
        if (focus)
          drawPoint(t, 226, 149, 91);
        else
          drawPoint(t, 0xbb, 0xbb, 0xbb);
        t++;
      }
    }
    len = strlen(window->caption);
    drawCharacters(buf, window->leftTopX + window->width / 2 - len * 9 / 2, window->leftTopY + 5, window->caption, 0, 0, 0);
    for (j = CAPTION_HEIGHT; j < window->height - BORDER_WIDTH; j++)
    {
      t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
      for (i = 0; i < window->width; i++)
      {
        if (j < CAPTION_HEIGHT + MENU_HEIGHT && window->hasMenu)
          drawPoint(t, 220,226,241);
        else
        if (j == CAPTION_HEIGHT + MENU_HEIGHT && window->hasMenu)
          drawPoint(t, 0xcc, 0xcc, 0xcc);
        else
          drawPoint(t, 0xff, 0xff, 0xff);
        t++;
      }
    }
  }
  else
  {
    for (j = 0; j < window->height; j++)
    {
      t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
      for (i = 0; i < window->width; i++)
      {
        drawPoint(t, 0xff, 0xff, 0xff);
        t++;
      }
    }
  }
  //draw border
  for (j = CAPTION_HEIGHT; j <= window->height - BORDER_WIDTH; j++)
  {
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
    for (i = 0; i < BORDER_WIDTH; i++)
    {
        if (focus)
          drawPoint(t,  226, 149, 91);
        else
          drawPoint(t, 0xbb, 0xbb, 0xbb);
      t++;
    }
  }
  for (j = CAPTION_HEIGHT; j <= window->height - BORDER_WIDTH; j++)
  {
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + window->width - BORDER_WIDTH;
    for (i = window->width - BORDER_WIDTH; i < window->width; i++)
    {
        if (focus)
          drawPoint(t, 226, 149, 91);
        else
          drawPoint(t, 0xbb, 0xbb, 0xbb);
      t++;
    }
  }
  for (j = window->height - BORDER_WIDTH - 1; j < window->height; j++)
  {
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
    for (i = 0; i < window->width; i++)
    {
        if (focus)
          drawPoint(t, 226, 149, 91);
        else
          drawPoint(t, 0xbb, 0xbb, 0xbb);
      t++;
    }
  }
  //draw shadow
  t = buf + window->leftTopY * SCREEN_WIDTH + window->leftTopX;
  for (i = 0 ; i < window->width; i++)
  {
    drawPoint(t, 0xcc, 0xcc, 0xcc);
    t++;
  }
  t = buf + (window->leftTopY + window->height - 1) * SCREEN_WIDTH + window->leftTopX;
  for (i = 0 ; i < window->width; i++)
  {
    drawPoint(t, 0xcc, 0xcc, 0xcc);
    t++;
  }
  for (j = 0; j < window->height; j++)
  {
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX;
    drawPoint(t, 0xcc, 0xcc, 0xcc);
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + window->width - 1;
    drawPoint(t, 0xcc, 0xcc, 0xcc);
  }
  t = buf + (window->leftTopY - 1) * SCREEN_WIDTH + window->leftTopX - 1;
  for (i = -1 ; i < window->width+1; i++)
  {
    drawPoint(t, 0xff, 0xff, 0xff);
    t++;
  }
  t = buf + (window->leftTopY + window->height) * SCREEN_WIDTH + window->leftTopX - 1;
  for (i = -1 ; i < window->width+1; i++)
  {
    drawPoint(t, 0xff, 0xff, 0xff);
    t++;
  }
  for (j = -1; j < window->height + 1; j++)
  {
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX - 1;
    drawPoint(t, 0xff, 0xff, 0xff);
    t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + window->width;
    drawPoint(t, 0xff, 0xff, 0xff);
  }
  //draw footer
  if (window->hasFooter)
  {
    for (j = window->height - BORDER_WIDTH - FOOTER_HEIGHT - 1; j < window->height - BORDER_WIDTH; j++)
    {
      t = buf + (window->leftTopY + j) * SCREEN_WIDTH + window->leftTopX + BORDER_WIDTH;
      for (i = BORDER_WIDTH + 1; i < window->width - BORDER_WIDTH + 1; i++)
      {
        if (j == window->height - BORDER_WIDTH- FOOTER_HEIGHT - 1)
          drawPoint(t - SCREEN_WIDTH, 0xcc, 0xcc, 0xcc);
        drawPoint(t, 220,226,241);
        t++;
      }
    }
    len = strlen("COOL GUI\0");
    drawCharacters(buf, window->leftTopX + window->width - len * 9 - 20, window->leftTopY + window->height - 30, "COOL GUI\0", 0, 0, 0);
  }
}

void drawBackWindows()
{
  int k;
  WindowQueue *p = &windowQueue;

  while (p->next != lastWindow)
  {
    p = p->next;
    switchuvm(p->proc);
    if (p->window != 0)
      if (p->window->show == 1)
      {
        drawWindow(screen_temp1, p->window, 0);
        for (k = 0; k < p->window->widgetsNum; k++)
          switch (p->window->widgets[k].type)
          {
          case label:
            drawLabel(screen_temp1, p->window->widgets[k].context.label, p->window);
            break;
          case textBox:
            drawTextBox(screen_temp1, p->window->widgets[k].context.textBox, p->window);
            break;
          case button:
            drawButton(screen_temp1, p->window->widgets[k].context.button, p->window);
            break;
          case imageView:
            drawImageView(screen_temp1, p->window->widgets[k].context.imageView, p->window);
            break;
          case iconView:
            drawIconView(screen_temp1, p->window->widgets[k].context.iconView, p->window);
            break;
          default:
            break;
          }
      }
  }
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

void removeLastWindow()
{
  int i, j;
  RGB *t1, *t2;

  switchuvm(lastWindow->proc);
  for (j = -1; j <= lastWindow->window->height; j++)
  {
    t1 = screen_temp2 + (lastWindow->window->last_leftTopY + j) * SCREEN_WIDTH + lastWindow->window->last_leftTopX - 1;
    t2 = screen_temp1 + (lastWindow->window->last_leftTopY + j) * SCREEN_WIDTH + lastWindow->window->last_leftTopX - 1;
    for (i = -1; i <= lastWindow->window->width; i++)
    {
      *t1 = *t2;
      t1++;
      t2++;
    }
  }
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

void drawLastWindow()
{
  int k;

  switchuvm(lastWindow->proc);
  if (lastWindow->window != 0)
    if (lastWindow->window->show == 1)
    {
      drawWindow(screen_temp2, lastWindow->window, 1);
      for (k = 0; k < lastWindow->window->widgetsNum; k++)
        switch (lastWindow->window->widgets[k].type)
        {
        case label:
          drawLabel(screen_temp2, lastWindow->window->widgets[k].context.label, lastWindow->window);
          break;
        case textBox:
          drawTextBox(screen_temp2, lastWindow->window->widgets[k].context.textBox, lastWindow->window);
          break;
        case button:
          drawButton(screen_temp2, lastWindow->window->widgets[k].context.button, lastWindow->window);
          break;
        case imageView:
          drawImageView(screen_temp2, lastWindow->window->widgets[k].context.imageView, lastWindow->window);
          break;
        case iconView:
          drawIconView(screen_temp2, lastWindow->window->widgets[k].context.iconView, lastWindow->window);
          break;
        default:
          break;
        }
    }
  lastWindow->window->last_leftTopX = lastWindow->window->leftTopX;
  lastWindow->window->last_leftTopY = lastWindow->window->leftTopY;
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

void removeMouse()
{
  int i, j, x, y;
  RGB *t1, *t2;
    
  x = mouse_info.last_draw_x;
  y = mouse_info.last_draw_y;
  for (j = 0; j < MOUSE_HEIGHT; j++)
    if (y + j >= SCREEN_HEIGHT)
      break;
    else
    {
      t1 = screen + (y + j) * SCREEN_WIDTH + x;
      t2 = screen_temp2 + (y + j) * SCREEN_WIDTH + x;
      for (i = 0; i < MOUSE_WIDTH; i++)
        if (x + i >= SCREEN_WIDTH)
          break;
        else
        {
          *t1 = *t2;
          t1++;
          t2++;
        }
    }
}

void drawMouse()
{
  int i, j, x, y;
  RGB *t;
  
  x = mouse_info.x_position;
  y = mouse_info.y_position;
  if (mouse_info.event == MOUSE_DRAGGING)
  {
    for (j = 0; j < MOUSE_HEIGHT / 2; j++)
      if (y + j >= SCREEN_HEIGHT)
        break;
      else
      {
        t = screen + (y + j) * SCREEN_WIDTH + x;
        for (i = 0; i < MOUSE_WIDTH; i++)
          if (x + i >= SCREEN_WIDTH)
            break;
          else
          {
            if (dm[i][j] == 2)
              drawPoint(t, 0xff, 0xff, 0xff);
            if (dm[i][j] == 1)
              drawPoint(t, 0x00, 0x00, 0x00);
            t++;
          }
      } 
  }
  else
  {
    for (j = 0; j < MOUSE_HEIGHT / 2; j++)
      if (y + j >= SCREEN_HEIGHT)
        break;
      else
      {
        t = screen + (y + j) * SCREEN_WIDTH + x;
        for (i = 0; i < j; i++)
          if (x + i >= SCREEN_WIDTH)
            break;
          else
          {
            if (i == 0 || i == j-1 || (j == MOUSE_HEIGHT / 2 - 1 && i >= MOUSE_WIDTH / 2))
              drawPoint(t, 0xff, 0xff, 0xff);
            else
              drawPoint(t, 0x00, 0x00, 0x00);
            t++;
          }   
      }
    for (j = MOUSE_HEIGHT / 2; j < MOUSE_HEIGHT / 2 + MOUSE_HEIGHT / 4; j++)
      if (y + j >= SCREEN_HEIGHT)
        break;
      else
      {
        t = screen + (y + j) * SCREEN_WIDTH + x;
        for (i = 0; i < (MOUSE_WIDTH + MOUSE_WIDTH / 2 - 1 - j) ; i++)
          if (x + i >= SCREEN_WIDTH)
            break;
          else
          {
            if (i == 0 || i == MOUSE_WIDTH + MOUSE_WIDTH / 2 - 2 - j)
              drawPoint(t, 0xff, 0xff, 0xff);
            else
              drawPoint(t, 0x00, 0x00, 0x00);
            t++;
          }
      } 
  }

  mouse_info.last_draw_x = mouse_info.x_position;
  mouse_info.last_draw_y = mouse_info.y_position;
}

void updateBackWindows()
{
  int totalPels = SCREEN_WIDTH * SCREEN_HEIGHT;

  acquire(&gui_lock);
  memset(screen_temp1, 0x00, sizeof(RGB) * totalPels);
  drawBackWindows();
  memmove(screen_temp2, screen_temp1, sizeof(RGB) * totalPels);
  drawLastWindow();
  memmove(screen, screen_temp2, sizeof(RGB) * totalPels);
  drawMouse();
  release(&gui_lock);
}

void updateLastWindow()
{
  int totalPels = SCREEN_WIDTH * SCREEN_HEIGHT;

  acquire(&gui_lock);
  removeLastWindow();
  drawLastWindow();
  memmove(screen, screen_temp2, sizeof(RGB) * totalPels);
  drawMouse();
  release(&gui_lock);
}

void updateMouse()
{
  acquire(&gui_lock);
  removeMouse();
  drawMouse();
  release(&gui_lock);
}

void focusIconView(IconView *icon)
{
  int size = 0, i, x, y;
  acquire(&gui_lock);
  switchuvm(lastWindow->proc);
  Window *window = lastWindow->window;
  size = 96 * 96;
  if (focusIcon)
  {
    if (focusIcon == icon)
    {
      release(&gui_lock);
      return;
    }
    for (i = 0; i < size; i++)
    {
      x = i % 96;
      y = i / 96;
      focusIcon->image[(95-y)*96+x].R = background[i].R;
      focusIcon->image[(95-y)*96+x].G = background[i].G;
      focusIcon->image[(95-y)*96+x].B = background[i].B;
    }
    drawIconView(screen_temp2, focusIcon, window);
    drawIconView(screen, focusIcon, window);
    for (i = 0; i < size; i++)
    {
      if (isBg[i])
      {
        focusIcon->image[i].R = 0x00;
        focusIcon->image[i].G = 0x00;
        focusIcon->image[i].B = 0x00;
      }
      isBg[i] = 0;
    }
  }
  focusIcon = icon;
  for (i = 0; i < size; i++)
  {
    x = window->leftTopX + icon->leftTopX + i % 96;
    y = window->leftTopY + icon->leftTopY + i / 96;
    background[i].R = screen_temp2[y * SCREEN_WIDTH + x].R;
    background[i].G = screen_temp2[y * SCREEN_WIDTH + x].G;
    background[i].B = screen_temp2[y * SCREEN_WIDTH + x].B;
    if (isAlpha(&(focusIcon->image[i])))
    {
      isBg[i] = 1;
      drawPoint(&(focusIcon->image[i]),  226, 149, 91);
    }
  }
  drawIconView(screen_temp2, focusIcon, window);
  drawIconView(screen, focusIcon, window);
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
  release(&gui_lock);
}

void focusDismiss()
{
  // cprintf("dismiss!\n");
  //return;
  int size , i, x, y;
  acquire(&gui_lock);
  switchuvm(lastWindow->proc);
  Window *window = lastWindow->window;
  size = 96 * 96;
  if (focusIcon)
  {
    for (i = 0; i < size; i++)
    {
      x = i % 96;
      y = i / 96;
      focusIcon->image[(95-y)*96+x].R = background[i].R;
      focusIcon->image[(95-y)*96+x].G = background[i].G;
      focusIcon->image[(95-y)*96+x].B = background[i].B;
    }
    drawIconView(screen_temp2, focusIcon, window);
    drawIconView(screen, focusIcon, window);
  }
   for (i = 0; i < size; i++)
  {
    if (isBg[i])
    {
      focusIcon->image[i].R = 0x00;
      focusIcon->image[i].G = 0x00;
      focusIcon->image[i].B = 0x00;
    }
    isBg[i] = 0;
  }
  focusIcon = 0;
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
  release(&gui_lock);
}

