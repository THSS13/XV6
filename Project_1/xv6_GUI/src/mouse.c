#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "traps.h"
#include "x86.h"
#include "spinlock.h"
#include "gui.h"
#include "mouse.h"
#include "window.h"

struct spinlock mouse_lock;
struct mouseinfo mouse_info;
static int to_read = 1;
static int left_down = 0;
static int right_down = 0;
static int x_sign = 0;
static int y_sign = 0;
static int x_overflow = 0;
static int y_overflow = 0;
static int counter = 0;
static int isdraw = 0;
static int dis_x = 0 , dis_y = 0;

//mouse event
static int left_btn_down = 0;
static int down_pos_x = 0;
static int down_pos_y = 0;
static int right_btn_down = 0;
static int last_tick = -30;
static int event = 0;
static int drag_state = 0;
static WindowQueue *pwque;
extern WindowQueue windowQueue;
extern WindowQueue *lastWindow;
extern WindowQueue windowLine[MAX_WINDOW_NUM];

void mouseinit()
{
  outb(0x64, 0xa8);
  outb(0x64, 0xd4);
  outb(0x60, 0xf4);
  outb(0x64, 0x60);
  outb(0x60, 0x47);
  setMousePosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
  initlock(&mouse_lock, "mouse");
  picenable(IRQ_MOUSE);
  ioapicenable(IRQ_MOUSE, 0);
}

int inWindowRange(Window *window, int x, int y)
{
  if (x >= window->leftTopX && x < window->leftTopX + window->width && y >= window->leftTopY && y < window->leftTopY + window->height)
    return 1;
  return 0;
}

int inWidgetRange(Window *window, Widget* widget, int x, int y)
{
  int leftTopX, leftTopY, width, height;

  switch (widget->type)
  {
  case button:
    leftTopX = window->leftTopX + widget->context.button->leftTopX;
    leftTopY = window->leftTopY + widget->context.button->leftTopY;
    width = widget->context.button->width;
    height = widget->context.button->height;
    if (x >= leftTopX && x < leftTopX + width && y >= leftTopY && y < leftTopY + height)
      return 1;
    break;
  case imageView:
    leftTopX = window->leftTopX + widget->context.imageView->leftTopX;
    leftTopY = window->leftTopY + widget->context.imageView->leftTopY;
    width = widget->context.imageView->width;
    height = widget->context.imageView->height;
    if (x >= leftTopX && x < leftTopX + width && y >= leftTopY && y < leftTopY + height)
      return 1;
    break;
  case iconView:
    leftTopX = window->leftTopX + widget->context.iconView->leftTopX;
    leftTopY = window->leftTopY + widget->context.iconView->leftTopY;
    width = widget->context.iconView->width;
    height = widget->context.iconView->height;
    if (x >= leftTopX && x < leftTopX + width && y >= leftTopY && y < leftTopY + height)
      return 1;
    break;
  default:
    break;
  }

  return 0;
}

WindowQueue* getClickedWindowQueue()
{
  WindowQueue *p = lastWindow;
  int x = mouse_info.x_position;
  int y = mouse_info.y_position;
  //get clicked window
  while (p)
  {
    switchuvm(p->proc);
    if (inWindowRange(p->window, x, y))
    {
      return (p);
    }
    p = p->prev;
  }
  return 0;
}

Widget* getClickedWidget(Window* pwindow)
{
  int x = mouse_info.x_position;
  int y = mouse_info.y_position;
  int i;
  for (i = pwindow->widgetsNum - 1; i >= 0; i--)
  {
    if (inWidgetRange(pwindow, pwindow->widgets + i, x, y))
    {
      return(pwindow->widgets + i);
    }
  }
  return 0;
}

void handleLeftClick()
{
  WindowQueue *pwindowQueue;
  Widget *pwidget;

  pwindowQueue = getClickedWindowQueue();
  if (pwindowQueue)
  {
    if (pwindowQueue != lastWindow && pwindowQueue == &windowLine[0])
    {
      if (proc == 0)
        switchkvm();
      else
        switchuvm(proc);
      return;
    }
    if (pwindowQueue != lastWindow  && pwindowQueue != &windowLine[0])
    {
      focusDismiss();
      reorderQueue(pwindowQueue);
      switchuvm(pwindowQueue->proc);
    }
    pwidget = getClickedWidget(pwindowQueue->window);
    if (pwidget)
    {
      switch (pwidget->type)
      {
      case button:
        focusDismiss();
        switchuvm(pwindowQueue->proc);
        pwidget->context.button->onLeftClickHandler.triggered = 1;
        break;
      case imageView:
        focusDismiss();
        switchuvm(pwindowQueue->proc);
        pwidget->context.imageView->onLeftClickHandler.triggered = 1;
        break;
      case iconView:
        focusIconView(pwidget->context.iconView);
        break;
      default:
        focusDismiss();
        switchuvm(pwindowQueue->proc);
        break;
      }
    }
    else
    {
        focusDismiss();
        switchuvm(pwindowQueue->proc);
    }
  }
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

void handleLeftDoubleClick()
{
  WindowQueue *pwindowQueue;
  Widget *pwidget;

  pwindowQueue = getClickedWindowQueue();
  if (pwindowQueue)
  {
    focusDismiss();
    switchuvm(pwindowQueue->proc);
    pwidget = getClickedWidget(pwindowQueue->window);
    if (pwidget)
    {
      switch (pwidget->type)
      {
      case iconView:
        pwidget->context.iconView->onLeftDoubleClickHandler.triggered = 1;
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

void handleRightClick()
{
  WindowQueue *pwindowQueue;
  Widget *pwidget;

  pwindowQueue = getClickedWindowQueue();
  if (pwindowQueue)
  {
    pwidget = getClickedWidget(pwindowQueue->window);
    if (pwidget)
    {
    }
  }
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

WindowQueue* getDraggedWindowQueue()
{
  WindowQueue *p = lastWindow;
  int x = down_pos_x;
  int y = down_pos_y;
  if (!x || !y)
    return 0;
  //get dragged window
  while (p)
  {
    switchuvm(p->proc);
    if (inWindowRange(p->window, x, y))
    {
      if (y <= p->window->leftTopY + CAPTION_HEIGHT)
        return (p);
      else
        return 0;
    }
    p = p->prev;
  }
  return 0;
}

void handleMouseDrag()
{
  if (drag_state == 0)
  {
    pwque = getDraggedWindowQueue();
    if (pwque)
    {
      drag_state = 1;
      if (pwque != lastWindow && pwque != &windowLine[0])
        reorderQueue(pwque);
    }
    else
      drag_state = 2;
  }
  else
  if (drag_state == 1)
  {
    switchuvm(pwque->proc);
    counter = (counter + 1) % 20;
    if (counter == 0)
      isdraw = 1;
    else
      isdraw = 0;
    moveWindow(pwque->window, mouse_info.x_position, mouse_info.y_position, down_pos_x, down_pos_y, isdraw);
  }
  if (proc == 0)
    switchkvm();
  else
    switchuvm(proc);
}

void moveMousePosition(int x, int y)
{
  setMousePosition(mouse_info.x_position + x, mouse_info.y_position + y);
}

void setMousePosition(int x, int y)
{
  if (x < 0)
    x = 0;
  if (x > SCREEN_WIDTH)
    x = SCREEN_WIDTH;
  if (y < 0)
    y = 0;
  if (y > SCREEN_HEIGHT)
    y = SCREEN_HEIGHT;
  mouse_info.x_position = x;
  mouse_info.y_position = y;
  updateMouse();
}

void updateMouseEvent(uint tick, int x, int y)
{
  event = 0;
  if (left_down)
  {
    down_pos_x = x;
    down_pos_y = y;
    if (!left_btn_down)
    {
      left_btn_down = 1;
    }
    else
    {
      event = MOUSE_DRAGGING;
    }
  }
  else
  {
    if (left_btn_down)
    {
      left_btn_down = 0;
      down_pos_x = 0;
      down_pos_y = 0;
      if (tick - last_tick <= 30)
        event = LEFT_DOUBLE_CLICK;
      else
      {
        if (mouse_info.event == MOUSE_DRAGGING)
          event = 0;
        else
          event = LEFT_CLICK;
      }
      if (event == LEFT_DOUBLE_CLICK)
        last_tick = -30;
      else
        last_tick = tick;
    }
  }
  if (right_down)
  {
    if (!right_btn_down)
      right_btn_down = 1;
  }
  else
  {
    if (right_btn_down)
    {
      right_btn_down = 0;
      event = RIGHT_CLICK;
    }
  }
  mouse_info.event = event;
  if (event == LEFT_CLICK)
  {
    handleLeftClick();
  }
  if (event == LEFT_DOUBLE_CLICK)
  {
    handleLeftDoubleClick();
  }
  if (event == MOUSE_DRAGGING)
  {
    handleMouseDrag();
   }
  if (event == RIGHT_CLICK)
  {
    handleRightClick();
  }
  if (event == 0)
  {
    if (drag_state == 1)
      updateLastWindow();
    drag_state = 0;
  }
}

void mouseint(uint tick)
{
  uint ch;

  ch = inb(0x64);
  if ((ch & 0x01) == 0)
  {
    to_read = READ_MOUSE_INFO;
    return;
  }

  acquire(&mouse_lock);
  ch = inb(0x60);
  if (to_read == READ_MOUSE_INFO)
  {
    if ((ch & 0x08) == 0 || (ch & 0x04) != 0)
    {
      	release(&mouse_lock);
      	return;
    }
    left_down = (ch & 0x01) ? 1 : 0;
    right_down = (ch & 0x02) ? 1 : 0;
    x_sign = (ch & 0x10) ? 1 : 0;
    y_sign = (ch & 0x20) ? 1 : 0;
    x_overflow = (ch & 0x40) ? 1 : 0;
    y_overflow = (ch & 0x80) ? 1 : 0;
    to_read = READ_X_MOVEMENT;
    release(&mouse_lock);
    return;
  }
  else if (to_read == READ_X_MOVEMENT)
  {
    dis_x = ch;
    if (x_sign == 1)
      	dis_x = ch - 256;
    	to_read = READ_Y_MOVEMENT;
    	release(&mouse_lock);
    	return;
  }
  else if (to_read == READ_Y_MOVEMENT)
  {
    dis_y = ch;
    if (y_sign == 1)
      dis_y = ch - 256;
    dis_y = - dis_y;
    to_read = READ_MOUSE_INFO;
    release(&mouse_lock);
    updateMouseEvent(tick, mouse_info.x_position + dis_x, mouse_info.y_position +dis_y);
    moveMousePosition(dis_x, dis_y);
  }
}

