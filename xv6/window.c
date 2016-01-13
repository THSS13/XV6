#include "types.h"
#include "defs.h"
#include "window.h"
#define MAXWINDOW 20

unsigned int mouse_lock = 0;
WindowLink window_list = 0;
WindowLink activated_window = 0;
WindowLink list_head = 0;
WindowLink list_tail = 0;

Window window_array[MAXWINDOW];
int next_window_id = 1;

//static color16* vesa_array = (color16*)VESA_ADDR;
static color16* vesa_array;
static color16 vesa_buffer[480000];
static color16 vesa_buffer2[480000];


static int mouseX = -1;
static int mouseY = -1;
void drawScreen();

void windowlistinit()
{
//	WindowLink p;
    vesa_array = (color16*)VESA_ADDR;
	memset(window_array, 0, sizeof(Window) * MAXWINDOW);
}

WindowLink getActivated()
{
	return activated_window;
}

WindowLink allocWindow(int left_x, int left_y, int right_x, int right_y, int pid)
{
	WindowLink p;
	for (p = window_array; p < &window_array[MAXWINDOW]; p++)
	{
		if (p->window_id <= 0)
		{
			p->window_id = next_window_id++;
			p->pid = pid;
			(p->window_position).left_x = left_x;
			(p->window_position).left_y = left_y;
			(p->window_position).right_x = right_x;
			(p->window_position).right_y = right_y;
			if (list_head == 0) list_head = p;
			if (list_tail != 0) list_tail->next_window = p;
			p->prior_window = list_tail;
			list_tail = p;
			p->next_window = 0;
            activated_window = p;
            memmove(vesa_buffer2, vesa_buffer, SCREEN_WIDTH * SCREEN_HEIGHT * sizeof(color16));
			createUpdateMsg(p->pid, 1);
      //drawWindow(p, )
      //cprintf("UpdateMsg created for process: %d\n", p->pid);
			return p;
		}
	}
	return 0;
}

int releaseWindow(int window_id)
{
	WindowLink p;
	for (p = list_head; p != 0; p = p->next_window)
	{
		if (p->window_id == window_id)
		{
			if (p->prior_window != 0)
				p->prior_window->next_window = p->next_window;
			else
				list_head = p->next_window;
			if (p->next_window != 0)
				p->next_window->prior_window = p->prior_window;
			else
				list_tail = p->prior_window;
			p->window_id = -1;
			createUpdateMsg(list_head->pid, 2);
			return 0;
		}
	}
	return -1;
}

int inClientRect(WindowLink pWindow, int position_x, int position_y)
{
	//cprintf("WindowID: %d, x: %d, y: %d\n", pWindow->window_id, position_x, position_y);
	return (pWindow->window_position).left_x <= position_x &&
		(pWindow->window_position).right_x > position_x &&
		(pWindow->window_position).left_y <= position_y &&
		(pWindow->window_position).right_y > position_y ? 1 : 0;
}

void setActivated(WindowLink p)
{
    if(p == list_head)
    {
        activated_window = p;
        return;
    }

	if (p->prior_window != 0)
		p->prior_window->next_window = p->next_window;
	else
		list_head = p->next_window;
	if (p->next_window != 0)
		p->next_window->prior_window = p->prior_window;
	else
		list_tail = p->prior_window;

	if (list_head == 0) list_head = p;
	if (list_tail != 0) list_tail->next_window = p;
	p->prior_window = list_tail;
	list_tail = p;
	p->next_window = 0;
    activated_window = p;
    mouse_lock = 1;
	createUpdateMsg(list_head->pid, 3);
}

int getClickedPid(int position_x, int position_y)
{
	WindowLink p = getWindowByPoint(position_x, position_y);
	return p == 0 ? -1 : p->pid;
}

WindowLink getWindowById(int window_id)
{
	WindowLink p = list_head;
	while (p != 0 && p->window_id != window_id)
	{
		//cprintf("now: %d, target: %d\n", p->window_id, window_id);
		//cprintf("next: %d\n", p->next_window);
		p = p->next_window;
	}
	return p;
}

WindowLink getWindowByPoint(int position_x, int position_y)
{
	WindowLink p = list_tail;
	while (p != 0 && !inClientRect(p, position_x, position_y)) p = p->prior_window;
	return p;
}

//detail : update case
// 0: not a update event
// 1: allocate a new window
// 2: release a window
// 3: activate a back window
// 4: drag event
void drawWindow(WindowLink pWindow, color16* context, int detail)
{
  cprintf("event %d\n", detail);
	int i, j;
	int x1 = (pWindow->window_position).left_x;
	int y1 = (pWindow->window_position).left_y;
	int x2 = (pWindow->window_position).right_x;
	int y2 = (pWindow->window_position).right_y;

  if (detail == 4){
    memmove(vesa_buffer, vesa_buffer2, SCREEN_WIDTH * SCREEN_HEIGHT * sizeof(color16));
    for (j = y1; j < y2; j++){
      for (i = x1; i < x2; i++){
        vesa_buffer[j * SCREEN_WIDTH + i] = context[(j - y1) * (x2 - x1) + i - x1];
      }
    }
  }
  else{
    if ((pWindow->next_window != 0) || (pWindow->next_window == 0 && pWindow->prior_window == 0)){
      cprintf("nima\n");
      for (j = y1; j < y2; j++){
        for (i = x1; i < x2; i++){
          vesa_buffer2[j * SCREEN_WIDTH + i] = context[(j - y1) * (x2 - x1) + i - x1];
          vesa_buffer[j * SCREEN_WIDTH + i] = context[(j - y1) * (x2 - x1) + i - x1];
        }
      }
    }
    else{
      cprintf("caonima\n");
      for (j = y1; j < y2; j++){
        for (i = x1; i < x2; i++){
          vesa_buffer[j * SCREEN_WIDTH + i] = context[(j - y1) * (x2 - x1) + i - x1];
        }
      }
    }
  }
  if (pWindow->next_window != 0 && detail != 4){
      createUpdateMsg(pWindow->next_window->pid, detail);
  }
  else
  {
  	memmove(vesa_array, vesa_buffer, SCREEN_WIDTH * SCREEN_HEIGHT * sizeof(color16));
    mouse_lock = 0;
 	drawMouse(mouseX, mouseY);
  }
}

//only used in mouse drag event
void drawScreen()
{
  //cprintf("draw screen\n");
	createUpdateMsg(list_tail->pid, 4);
}

void printRect(Rect rect)
{
	cprintf("partial x1: %d, y1: %d, x2: %d, y2: %d", rect.left_x, rect.left_y, rect.right_x, rect.right_y);
}

void drawArea(WindowLink pWindow, color16* context, int x1, int y1, int x2, int y2)
{
    cprintf("When dragging, pid:%d window update.\n", pWindow->pid);
	Rect area;
	Rect dest;
	int i, j;
	Rect clientRect = pWindow->window_position;
	area.left_x = x1;
	area.left_y = y1;
	area.right_x = x2;
	area.right_y = y2;
	dest = getIntersection(area, pWindow->window_position);
	//printRect(dest);
  if ((pWindow->next_window != 0) || (pWindow->next_window == 0 && pWindow->prior_window == 0)){
    for (j = dest.left_y; j < dest.right_y; j++){
      for (i = dest.left_x; i < dest.right_x; i++){
        vesa_buffer2[j * SCREEN_WIDTH + i] = context[(j - clientRect.left_y) * (clientRect.right_x - clientRect.left_x) + i - clientRect.left_x];
        vesa_buffer[j * SCREEN_WIDTH + i] = context[(j - clientRect.left_y) * (clientRect.right_x - clientRect.left_x) + i - clientRect.left_x];
      }
    }
  }
  else{
    for (j = dest.left_y; j < dest.right_y; j++){
      for (i = dest.left_x; i < dest.right_x; i++){
        vesa_buffer[j * SCREEN_WIDTH + i] = context[(j - clientRect.left_y) * (clientRect.right_x - clientRect.left_x) + i - clientRect.left_x];
      }
    }
  }
 	if (pWindow->next_window != 0)
 		createPartialUpdateMsg(pWindow->next_window->pid, x1, y1, x2, y2);
 	else
 	{
 		for (j = y1; j < y2; j++)
 			for (i = x1; i < x2; i++)
 				vesa_array[j * SCREEN_WIDTH + i] = vesa_buffer[j * SCREEN_WIDTH + i];
        mouse_lock = 0;
 		drawMouse(mouseX, mouseY);
 	}
}

void drawScreenArea(int x1, int y1, int x2, int y2)
{
	createPartialUpdateMsg(list_head->pid, x1, y1, x2, y2);
}

Rect getIntersection(Rect a, Rect b)
{
	Rect rect;
	rect.left_x = MAX(a.left_x, b.left_x);
	rect.right_x = MIN(a.right_x, b.right_x);
	rect.left_y = MAX(a.left_y, b.left_y);
	rect.right_y = MIN(a.right_y, b.right_y);
	return rect;
}

Rect getUnion(Rect a, Rect b)
{
	Rect rect;
	rect.left_x = MIN(a.left_x, b.left_x);
	rect.right_x = MAX(a.right_x, b.right_x);
	rect.left_y = MIN(a.left_y, b.left_y);
	rect.right_y = MAX(a.right_y, b.right_y);
	return rect;
}

static color16 mouse[10][15] = {
	{65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 65535, 2016, 2016, 2016},
	{65535, 2113, 0, 0, 0, 0, 0, 0, 0, 0, 27501, 65535, 2016, 2016, 2016},
	{65535, 65535, 6307, 0, 0, 0, 0, 0, 0, 27502, 65535, 65535, 2016, 2016, 2016},
	{2016, 65535, 65535, 2113, 0, 0, 0, 0, 0, 29614, 65535, 2016, 2016, 2016, 2016},
	{2016, 2016, 65535, 65535, 2113, 0, 0, 0, 0, 0, 6371, 65535, 65535, 65535, 2016},
	{2016, 2016, 2016, 65535, 65535, 32, 0, 0, 27437, 16968, 0, 0, 12710, 65535, 65535},
	{2016, 2016, 2016, 2016, 65535, 65535, 0, 0, 65535, 65535, 42292, 6371, 0, 0, 65535},
	{2016, 2016, 2016, 2016, 2016, 65535, 65535, 0, 65535, 65535, 65535, 65535, 31727, 2145, 65535},
	{2016, 2016, 2016, 2016, 2016, 2016, 65535, 65535, 65535, 2016, 2016, 65535, 65535, 65535, 65535},
	{2016, 2016, 2016, 2016, 2016, 2016, 2016, 65535, 65535, 2016, 2016, 2016, 2016, 2016, 2016}
};

//static color16 mouseBuffer[10][15];

//static int drawingMouse = 0;

/*void drawMouse(int newX, int newY)
{
	int i, j;
	//cprintf("x: %d, y: %d\n", newX, newY);
	if (drawingMouse) return;
	drawingMouse = 1;
	if (mouseX >= 0)
	{
		for (i = 0; i < 10; i++)
			for (j = 0; j < 15; j++)
			{
				vesa_array[(j + mouseY) * SCREEN_WIDTH + i + mouseX] = mouseBuffer[i][j];
			}
	}
	mouseX = newX;
	mouseY = newY;
	for (i = 0; i < 10; i++)
		for (j = 0; j < 15; j++)
		{
			mouseBuffer[i][j] = vesa_array[(j + mouseY) * SCREEN_WIDTH + i + mouseX];
		}
	for (i = 0; i < 10; i++)
		for (j = 0; j < 15; j++)
		{
			if (mouse[i][j] != 2016)
				vesa_array[(j + mouseY) * SCREEN_WIDTH + i + mouseX] = mouse[i][j];
		}
	drawingMouse = 0;
}
*/

void setMouse(int x, int y)
{
    mouseX = x;
    mouseY = y;
}

void drawMouse(int x, int y)
{
    if (mouse_lock) return;
	int i, j;
    if (x < 0) return;
	if (mouseX >= 0)
	{
		for (j = 0; j < 15; j++)
			for (i = 0; i < 10; i++)
			{
				vesa_array[(j + mouseY) * SCREEN_WIDTH + i + mouseX] = vesa_buffer[(j + mouseY) * SCREEN_WIDTH + i + mouseX];
			}
	}
	mouseX = x;
	mouseY = y;
	for (j = 0; j < 15; j++)
		for (i = 0; i < 10; i++)
		{
			if (mouse[i][j] != 2016)
				vesa_array[(j + mouseY) * SCREEN_WIDTH + i + mouseX] = mouse[i][j];
		}
}
