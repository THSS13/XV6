#include "types.h"
#include "x86.h"
#include "defs.h"
#include "traps.h"
#include "spinlock.h"
#include "mouse.h"
#include "graphbase.h"
#include "guilayout.h"
#include "guientity_img.h"

static struct spinlock mouselock;
static int x_position = 0;
static int y_position = 0;
static int x_sign = 0;
static int y_sign = 0;
static int left_button_down = 0;
static int right_button_down = 0;
static int left_button_pressed = 0;
static int right_button_pressed = 0;
static int count = 0;
static int recovery = -1;

img* mouseIcon=0;

void eventGenerate();
void SetMouseXY();

void mouseEnable()
{
	//int st;
	outb(0x64, 0xA8);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xE6);
	// inb(MSDATAP);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xE8);
	// inb(MSDATAP);
	// outb(0x64, 0xD4);
	// outb(0x60, 0x00);
	// inb(MSDATAP);

	// outb(0x64, 0xD4);	//3D
	// outb(0x60, 0xF2);
	// inb(MSDATAP);
	// st = inb(MSDATAP);
	// cprintf("****%x\r\n", st);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xF3);
	// inb(MSDATAP);
	// outb(0x64, 0xD4);
	// outb(0x60, 0xC8);
	// inb(MSDATAP);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xF3);
	// inb(MSDATAP);
	// outb(0x64, 0xD4);
	// outb(0x60, 0x64);
	// inb(MSDATAP);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xF3);
	// inb(MSDATAP);
	// outb(0x64, 0xD4);
	// outb(0x60, 0x50);
	// inb(MSDATAP);

	// outb(0x64, 0xD4);
	// outb(0x60, 0xF2);
	// inb(MSDATAP);
	// st = inb(MSDATAP);
	// cprintf("****%x\r\n", st);	//3D


	outb(0x64, 0xD4);
	outb(0x60, 0xF4);
	inb(MSDATAP);
	outb(0x64, 0x60);
	outb(0x60, 0x47);
	initlock(&mouselock,"mouse");
	picenable(IRQ_MOUSE);
	ioapicenable(IRQ_MOUSE, 0);

	mouseIcon = (img*)img_createDom(WIDTH_RES, HEIGHT_RES, 32, 32, (uint)bingolingo,-1);
	x_position = WIDTH_RES / 2;
	y_position = HEIGHT_RES / 2;
}

void mouseintr()
{
	int data;

	acquire(&mouselock);

	data = inb(MSDATAP);
	if (recovery == 0 && (data & 255) == 0)
		recovery = 1;
	else if (recovery == 1 && (data & 255) == 0)
		recovery = 2;
	else if ((data & 255) == 12)
		recovery = 0;
	else
		recovery = -1;
	//cprintf("%x\r\n", data);
	switch (++count)
	{
	case 1:
		//cprintf("flag:%d\r\n",data);
		left_button_down = (data & LEFT_BTN) ? 1 : 0;
		right_button_down = (data & RIGHT_BTN) ? 1 : 0;
		x_sign = (data & X_SIGN) ? 1 : 0;
		y_sign = (data & Y_SIGN) ? 1 : 0;
		break;
	case 2:
		if (x_sign == 1)
			data -= 256;
		//cprintf("dx:%d\r\n",data);
		x_position += data;
		x_position = (x_position > WIDTH_RES) ? WIDTH_RES : x_position;
		x_position = (x_position < 0) ? 0 : x_position;
		break;
	case 3:
		if (y_sign == 1)
			data -= 256;
		//cprintf("dy:%d\r\n",data);
		y_position -= data;
		y_position = (y_position > HEIGHT_RES) ? HEIGHT_RES : y_position;
		y_position = (y_position < 0) ? 0 : y_position;
		break;
	default:
		break;
	}

	//cprintf("count:%d\r\n", count);
	if (recovery == 2)
	{
		count = 0;
		recovery = -1;
	}
	else if (count == 3)
	{
		eventGenerate();
		count = 0;
	}


	release(&mouselock);
}

void eventGenerate()
{
	uint button_flag = 0;
	if (left_button_pressed == 0 && left_button_down == 1)
	{
		left_button_pressed = 1;
		button_flag |= LEFT_BTN_DN;
	}
	else if (left_button_pressed == 1 && left_button_down == 0)
	{
		left_button_pressed = 0;
		button_flag |= LEFT_BTN_UP;
	}

	if (right_button_pressed == 0 && right_button_down == 1)
	{
		right_button_pressed = 1;
		button_flag |= RIGHT_BTN_DN;
	}
	else if (right_button_pressed == 1 && right_button_down == 0)
	{
		right_button_pressed = 0;
		button_flag |= RIGHT_BTN_UP;
	}

	//cprintf("x: %d\r\n", x_position);
	//cprintf("y: %d\r\n", y_position);
	//cprintf("flag: %d\r\n", button_flag);
	//cprintf("------------%d\r\n", num);
	//num++;
	img_setXY((uint)mouseIcon, x_position, y_position);
	passPointEvent(del, x_position, y_position, button_flag);
}
