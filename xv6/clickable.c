#include "clickable.h"
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
	Point p;
	p.x = x;
	p.y = y;
	return p;
}

Rect initRect(int x, int y, int w, int h)
{
	Rect r;
	r.start = initPoint(x, y);
	r.width = w;
	r.height = h;
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
}

ClickableManager initClickManager(struct Context c)
{
	ClickableManager cm;
	cm.left_click = 0;
	cm.double_click = 0;
	cm.right_click = 0;
	cm.wndWidth = c.width;
	cm.wndHeight = c.height;
	return cm;
}

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
	switch (MsgType)
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
	        break;
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
	    	break;
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
	    	break;
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
	    	break;
	}
}

void addClickable(Clickable **head, Rect r, Handler h)
{
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
	c->area = r;
	c->handler = h;
	c->next = *head;
	*head = c;
}

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
	{
		if (isIn(cur->area.start, region))
		{
			//如果当前指针指向头部
			if (cur == *head)
			{
				//删除头节点
				temp = *head;
				*head = cur->next;
				cur = prev = *head;
				free(temp);
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
				temp = cur;
				cur = cur->next;
				free(temp);
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
			{
				cur = cur->next;
			}
			else
			{
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
	{
		if (isIn(click, cur->area))
		{
			renaming = 0;
			isSearching = 0;
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
	if (renaming == 1){
		renaming = 0;
		return 1;
	}
	printf(0, "execute: none!\n");
	return 0;
}

void printClickable(Clickable *c)
{
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
}

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
}

void testHanler(struct Point p)
{
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
}
void testClickable(struct Context c)
{
	ClickableManager cm = initClickManager(c);

	Rect r1 = initRect(5,5,20,20);
	Rect r2 = initRect(20,20,20,20);
	Rect r3 = initRect(50,50,15,15);
	Rect r4 = initRect(0,0,30,30);
	Point p1 = initPoint(23, 23);
	Point p2 = initPoint(70, 70);
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
	printf(0, "left_click: %d\n", cm.left_click);
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
	printf(0, "left_click: %d\n", cm.left_click);
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
	printf(0, "left_click: %d\n", cm.left_click);
	printClickableList(cm.left_click);
	executeHandler(cm.left_click, p1);
	executeHandler(cm.left_click, p2);
	deleteClickable(&cm.left_click, r4);
	printClickableList(cm.left_click);
}
