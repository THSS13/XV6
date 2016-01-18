#include "types.h"
#include "context.h"
#include "drawingAPI.h"
#include "user.h"
#include "bitmap.h"
#include "windowStyle.h"

/**
*draw_point : if the point is outside the window
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
  if(x >= c.width)
    return;
  if(y >= c.height)
    return;
  c.addr[y*c.width+x] = color;
}

/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
	{
		if(((c << i) & 0x80) != 0)
		{
			printf(0, "1");
		}
		else
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
}
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
	{
		hankaku[i] = 0;
	}

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
			{
				if (buf[i] == '*')
				{
					hankaku[y] |= (0x80 >> x);
				}
				x ++;
				if (x >= ASCII_WIDTH)
				{
					x = 0;
					y ++;
				}
			}
		}
	}

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
	close(fd);
}

void freeASCII(){
	free(hankaku);
}

struct File_Node fontFile;
void initializeGBK(){
	int fd;
	printf(0,"initialzing gbk\n");
	if((fd = open(HZK16, 0)) < 0){
		printf(0,"cannot open %s\n", HZK16);
		return;
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
	fontFile.size = read(fd, fontFile.buf, 27000);
	printf(0,"initialzing gbk complete!\n");
	close(fd);
}

void freeGBK(){
	free(fontFile.buf);
}

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
	}
}

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
			xTmp += 8;
			i++;
		}
		else {
			wStr = (str[i] & 0x00FF) | ((((short)str[i + 1]) << 8) & 0xFF00);
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}

int _RGB16BIT565(int r,int g,int b){
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
}

void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
		{
			rgb = pic.data[i*pic.width+j];
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
	dy = y1 - y0;
	x = x0 << 10;
	y = y0 << 10;
	dx = (dx < 0) ? -dx : dx;
	dy = (dy < 0) ? -dy : dy;
	if(dx >= dy) {
		len = dx + 1;
		dx = (x1 > x0) ? 1024 : -1024;
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
	}
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}

void
draw_window(Context c, char *title)
{
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);

  loadBitmap(&pic, "close.bmp");
  draw_picture(c, pic, 3, 3);
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
  freepic(&pic);
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
