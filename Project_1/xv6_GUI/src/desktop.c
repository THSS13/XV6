#include "types.h"
#include "stat.h"
#include "user.h"
#include "uwindow.h"
#include "fs.h"
#include "bitmap.h"

Window window;
ImageView image;
IconView icon[50];
struct RGB temp[1310720];
struct RGB folder[50][10000];
int hWind;

//Result: T_DIR || T_FILE || T_DEV, define in stat.h
//-1: error occured.
int
getiNodeType(char *path)
{
  struct stat st;
  
  if (stat(path, &st) < 0)
  {
    return -1;
  }
  
  return st.type;
}

char*
fmtname(char *path)
{
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  return p;
}

void suffix(char *t, char *s)
{
  int point = 0;

  while (*s != 0)
  {
    if (*s == '.')
      point = 1;
    s++;
  }
  if (point == 0)
  {
    strcpy(t, "");
    return;
  }
  while (*s != '.')
    s--;
  s++;
  strcpy(t, s);
}

void iconOnLeftDoubleClick(Widget *widget, Window *window)
{
  char *s = widget->context.iconView->text;
  char *argv1[] = { s, 0 };
  char *argv2[] = { "", s, 0};
  char t[256];

  if (getiNodeType(s) == T_DIR)
  {
    if (fork() == 0)
    {
      strcpy(argv2[0], "explorer");
      exec(argv2[0], argv2);
      exit();
    }
    return;
  }
  suffix(t, s);
  if (strcmp(t, "") == 0)
  {
    if (fork() == 0)
    {
      exec(argv1[0], argv1);
      exit();
    }
  }
  else
    if (strcmp(t, "bmp") == 0)
    {
      if (fork() == 0)
      {
        strcpy(argv2[0], "imageviewer");
        exec(argv2[0], argv2);
        exit();
      }
    }
    if (strcmp(t, "txt") == 0)
    {
      if (fork() == 0)
      {
        strcpy(argv2[0], "editor");
        exec(argv2[0], argv2);
        exit();
      }
    }
}

void
ls(char *path)
{
  char buf[512], *p, *tmpName;
  int fd;
  struct dirent de;
  struct stat st;
  int i = 0, j;

  if ((fd = open(path, 0)) < 0) 
  {
    return;
  }

  if (fstat(fd, &st) < 0)
  {
    return;
  }
  
  strcpy(buf, path);
  p = buf + strlen(buf);
  *p++ = '/';
  while (read(fd, &de, sizeof(de)) == sizeof(de))
  {
    if (de.inum == 0)
    {
      continue;
    }
    memmove(p, de.name, DIRSIZ);
    p[DIRSIZ] = 0;
    if (stat(buf, &st) < 0)
    {
      continue;
    }
    tmpName = fmtname(buf);
    if (strcmp(tmpName, ".") == 0 || strcmp(tmpName, "..") == 0 || st.type == T_DEV)
    {
      continue;
    }
    memset(icon + i, 0, sizeof(IconView));
    icon[i].leftTopX = 50 + (i / 6) * 140;
    icon[i].leftTopY = 50 + (i % 6) * 140;
    icon[i].image = folder[i];
    icon[i].onLeftDoubleClickHandler.handlerFunction = iconOnLeftDoubleClick;
    for (j = 0; j < strlen(tmpName); j++)
    {
      if (tmpName[j] == '.')
        break;
    }
    switch (st.type)
    {
      case T_DIR:
        readBitmapFile("folder.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        break;
      case T_FILE:
        if (tmpName[j+1] == 'b' && tmpName[j+2] == 'm' && tmpName[j+3] == 'p')
          readBitmapFile("photo.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        else
        if (tmpName[j+1] == 't' && tmpName[j+2] == 'x' && tmpName[j+3] == 't')
          readBitmapFile("text.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        else
          readBitmapFile("exec.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        break;
    }
    strcpy(icon[i].text, tmpName);
    window.widgets[window.widgetsNum].type = iconView;
    window.widgets[window.widgetsNum].context.iconView = &icon[i];
    i++;
    window.widgetsNum++;
    if (i % 2 == 0) updateWindow(hWind);
  }
}

void refresh(Widget *widget, Window *window)
{
  window->widgetsNum = 1;
  updateWindow(hWind);
  ls(".");
  updateWindow(hWind);
}

int main(void)
{
  memset(&window, 0, sizeof(Window));
  window.leftTopX = 0;
  window.leftTopY = 0;
  window.width = 1280;
  window.height = 1024;
  window.show = 1;
  window.hasCaption = 0;
  window.onFileSystemChangedHandler.handlerFunction = refresh;
  memset(&image, 0, sizeof(ImageView));
  image.leftTopX = 0;
  image.leftTopY = 0;
  image.image = temp;
  readBitmapFile("desktop_bg.bmp", image.image, &image.height, &image.width);
  window.widgets[0].type = imageView;
  window.widgets[0].context.imageView = &image;
  window.widgetsNum = 1;
  hWind = createWindow(&window);
  ls(".");
  updateWindow(hWind);
  while (1) handleEvent(&window);
}

