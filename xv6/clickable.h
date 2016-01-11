#ifndef CLICKABLE_H
#define CLICKABLE_H

typedef struct Point
{
	int x;
	int y;
} Point;

Point initPoint(int x, int y);

typedef struct Rect
{
	Point start;
	int width;
	int height;
} Rect;

Rect initRect(int x, int y, int w, int h);
int isIn(Point p, Rect r);
typedef void(*Handler)(Point);
typedef struct Clickable
{
	Rect area;
	Handler handler;
	struct Clickable *next;
} Clickable;

typedef struct ClickableManager
{
	Clickable *left_click;
	Clickable *double_click;
	Clickable *right_click;
	int wndWidth;
	int wndHeight;
} ClickableManager;

struct Context;
ClickableManager initClickManager(struct Context c);

//MsgType 单击，双击还是右键
void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h);
//添加一个区域为r,处理事件为h的clickable,添加到链表头部
void addClickable(Clickable **head, Rect r, Handler h);
//删除起始坐标在region内部的所有Clickable
void deleteClickable(Clickable **head, Rect region);
//执行点击坐标在area内部的clickable函数
int executeHandler(Clickable *head, Point click);
void testClickable(struct Context c);
#endif
