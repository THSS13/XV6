#ifndef WINDOW_H
#define WINDOW_H

//#define VESA_ADDR 0xFC000000
//#define SCREEN_WIDTH 800
//#define SCREEN_HEIGHT 600
#include "vesamode.h"

//size of mouse
#define SIZE_X_MOUSE 10
#define SIZE_Y_MOUSE 15

#define MIN(x, y) (x < y ? x : y)
#define MAX(x, y) (x > y ? x : y)
typedef unsigned short color16;

typedef struct Rect
{
	int left_x;
	int left_y;
	int right_x;
	int right_y;
	//int rect_index;
}Rect;

typedef struct Window
{
	int window_id;
	int pid;
//	int activated;//是否激活，1表示激活，0表示未激活，某一时刻只能有一个窗口被激活
//	char *window_title;//窗口标题栏字符串
	Rect window_position;
	//int z_order;
	struct Window *prior_window;
	struct Window *next_window;
}Window;

typedef Window* WindowLink;//用队列中的先后顺序表示窗口堆叠的次序

extern WindowLink window_list;

#endif
