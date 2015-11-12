#ifndef DRAWINGAPI_H
#define DRAWINGAPI_H

#define HANKAKU "hankaku.txt"
#define ASCII_NUM 256
#define ASCII_WIDTH 8
#define ASCII_HEIGHT 16
#define ACCII_SIZE 128
#define HZK16 "HZK16.fnt"

#include "bitmap.h"

struct File_Node
{
	unsigned char * buf;
	int size;
};
struct Context;
//struct PicNode;
typedef struct Icon {
    char name[32];
    int position_x;
    int position_y;
    PICNODE pic;
} ICON;

void initializeASCII();
void initializeGBK();
void freeASCII();
void freeGBK();
void draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color);
void fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color);
void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y);
void draw_picture(Context c, struct PicNode pic, int x, int y);
void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color);
void draw_window(Context c, char *title);
void load_iconlist(ICON* iconlist, int len);
void draw_iconlist(Context c, ICON* iconlist, int len);

#endif
