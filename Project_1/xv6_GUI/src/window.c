#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "spinlock.h"
#include "window.h"
#include "gui.h"

WindowQueue windowLine[MAX_WINDOW_NUM];
WindowQueue windowQueue;
WindowQueue *lastWindow;
Widget *focusWidget = 0;
ImageView background;
ImageView closeTag;
struct spinlock window_lock;

void initWindow()
{
  int i;

  for (i = 0; i < MAX_WINDOW_NUM; i++)
  {
    windowLine[i].proc = 0;
    windowLine[i].window = 0;
    windowLine[i].next = 0;
    windowLine[i].prev = 0;
  }
  windowQueue.proc = 0;
  windowQueue.window = 0;
  windowQueue.next = 0;
  windowQueue.prev = 0;
  lastWindow = &windowQueue;
  initlock(&window_lock, "window");
}

int acquireWindow()
{
  int i;

  for (i = 0; i < MAX_WINDOW_NUM; i++)
    if (windowLine[i].proc == 0)
      return i;
  return -1;
}

void addWindow(int x)
{
  WindowQueue *p = &windowQueue;
  WindowQueue *q;
  while (p->next != 0)
    p = p->next;
  q = p;
  p->next = windowLine + x;
  p = p->next;
  p->prev = q;
  p->next = 0;
  lastWindow = windowLine + x;
}

int sys_createWindow(void)
{
  int window;

  if (argint(0, &window) < 0)
    return -1;

  acquire(&window_lock);
  int hWind = acquireWindow();
  if (hWind < 0)
  {
    release(&window_lock);
    return hWind;
  }
  windowLine[hWind].proc = proc;
  windowLine[hWind].window = (Window *)window;
  addWindow(hWind);
  release(&window_lock);
  updateBackWindows();
  return hWind;
}

int sys_deleteWindow(void)
{
  int hWind;
  if (argint(0, &hWind) < 0)
    return -1;

  acquire(&window_lock);
  WindowQueue *p = &windowQueue;
  while (p->next != 0)
  {
    if (p->next == windowLine + hWind)
    {
      p->next->proc = 0;
      p->next->window = 0;
      if (p->next == lastWindow)
        lastWindow = p;
      p->next = p->next->next;
      if (p->next)
        p->next->prev = p;
      release(&window_lock);
      updateBackWindows();
      return 0;
    }
    p = p->next;
  }
  release(&window_lock);
  return -1;
}

int sys_updateWindow(void)
{
  int hWind;
  if (argint(0, &hWind) < 0)
    return -1;

  acquire(&window_lock);
  if (windowLine + hWind == lastWindow)
    updateLastWindow();
  else
    updateBackWindows();
  release(&window_lock);

  return 0;
}

void moveWindow(Window *window, int fx, int fy, int tx, int ty, int isdraw)
{
  int dx = tx - fx;
  int dy = ty - fy;
  if (window->leftTopX + dx < 0)
    dx = -window->leftTopX;
  if (window->leftTopY + dy < 0)
    dy = -window->leftTopY;
  if (window->leftTopX + window->width + dx >= SCREEN_WIDTH)
    dx = SCREEN_WIDTH - (window->leftTopX + window->width);
  if (window->leftTopY + window->height + dy >= SCREEN_HEIGHT)
    dy = SCREEN_HEIGHT - (window->leftTopY + window->height);
  window->leftTopX += dx;
  window->leftTopY += dy;
  //cprintf("dx = %d, dy = %d\n",  window->leftTopX,  window->leftTopY);
  if (isdraw) 
    updateLastWindow();
}

void reorderQueue(WindowQueue *q)
{
  acquire(&window_lock);
  WindowQueue *p = lastWindow;
  while (p)
  {
    if (p == q)
      break;
    p = p->prev;
  }
  p->prev->next = p->next;
  p->next->prev = p->prev;
  lastWindow->next = q;
  q->prev = lastWindow;
  q->next = 0;
  lastWindow = q;
  release(&window_lock);
  updateBackWindows();
}

