#include "types.h"
#include "x86.h"
#include "traps.h"
#include "defs.h"
#include "spinlock.h"
#include "mouse.h"
#include "window.h"
#include "windowStyle.h" //get TOPBAR_HEIGHT
#include "message.h"

static struct spinlock mouse_lock;

//large displacement
static int x_large_dispalecement = 0;
static int y_large_dispalecement = 0;

//origin info
static int state = 0;
static int left_down = 0;
static int right_down = 0;
static int x_sign = 0;
static int y_sign = 0;
static int x_overflow = 0;
static int y_overflow = 0;

//mid info
static int left_already_down = 0;
static int right_already_down = 0;
static int left_click_tick = -20;
static int is_dragging = 0;

//final info
static int event = 0;
static int x_position = 0;
static int y_position = 0;
static int x_drag_start = 0;
static int y_drag_start = 0;
//static int x_drag_window = -1;
//static int y_drag_window = -1;

//static int dragging_top_window = 0;
//static int dragging_count = 0;

void
mouseinit()
{
    outb( 0x64 , 0xa8 );
    outb( 0x64 , 0xd4 );
    outb( 0x60 , 0xf4 );
    outb( 0x64 , 0x60 );
    outb( 0x60 , 0x47 );
    initlock(&mouse_lock,"mouse");
    picenable(IRQ_MOUS);
    ioapicenable(IRQ_MOUS, 0);
}

void
mouseintr(uint tick)
{
	uint ch;
	ch = inb(0x64);
	if((ch & 0x01) == 0)
	{
		//cprintf("no data\n");
		state = 1;
		return;
	}

	acquire(&mouse_lock);
	ch = inb(0x60);

	if(state == 1)
	{
		if((ch & 0x08) == 0 || (ch & 0x04) != 0)
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
		state = 2;
		release(&mouse_lock);
		//cprintf("state1\n");
		//cprintf("overflow: %d\n", y_overflow);
		return;
	}
	else if(state == 2)
	{
		int dis;
		if(x_sign == 0)
			dis = ch;
		else
			dis = ch - 256;
		if(dis == 127 || dis == -127)
		{
			x_large_dispalecement = 1;
			//cprintf("error");
			// state = 1;
			// release(&mouse_lock);
			// return;
		}
		else x_large_dispalecement = 0;
		//cprintf("xdis: %d, sign: %d\n", dis, x_sign);
		x_position += dis;
		if(x_position < 0)
			x_position = 0;
		if(x_position > SCREEN_WIDTH - SIZE_X_MOUSE)
			x_position = SCREEN_WIDTH - SIZE_X_MOUSE;
		state = 3;
		release(&mouse_lock);
		//cprintf("state2\n");
		return;
	}
	else if(state == 3)
	{
		int dis;
		if(y_sign == 0)
			dis = ch;
		else
			dis = ch - 256;
		if(dis == 127 || dis == -127)
		{
			y_large_dispalecement = 1;
			//cprintf("error");
			// state = 1;
			// release(&mouse_lock);
			// return;
		}
		else y_large_dispalecement = 0;
		//cprintf("ydis: %d, sign: %d, overflow: %d\n", dis, y_sign, y_overflow);
		y_position -= dis;
		if(y_position < 0)
			y_position = 0;
		if(y_position > SCREEN_HEIGHT - SIZE_Y_MOUSE)
			y_position = SCREEN_HEIGHT - SIZE_Y_MOUSE;
		state = 1;
		release(&mouse_lock);
		//cprintf("state3\n");
	}
	else
	{
		state = 1;
		release(&mouse_lock);
		return;
	}

	event = 0;
	int win_left_y = 0;
	struct Window* win_ptr = getWindowByPoint(x_position, y_position);
	if(win_ptr != 0) {
		win_left_y = win_ptr->window_position.left_y;
	}
	
	if(left_already_down == 0 && right_already_down == 0)
	{
		if(left_down == 1)
		{
			left_already_down = 1;
			x_drag_start = x_position;
			y_drag_start = y_position;
		}
		else if(right_down == 1)
		{
			right_already_down = 1;
		}
	}

	else if(left_already_down == 1)
	{
		if(left_down == 0)
		{
			//cprintf("dragging: %d\n", is_dragging);
			if(is_dragging == 1)
			{
				event = DRAG_RELEASE;
				is_dragging = 0;
			}
			else
			{
				int dtick = tick - left_click_tick;
				//cprintf("tick: %d\n", dtick);
				if(dtick > DOUBLE_CLICK_DELAY)
				{
					event = LEFT_CLICK;
					left_click_tick = tick;
				}
				else
				{
					event = DOUBLE_CLICK;
					left_click_tick = -DOUBLE_CLICK_DELAY;
				}
			}
			left_already_down = 0;
		}
		else
		{
			if(y_position < win_left_y + TOPBAR_HEIGHT){
				event = DRAGGING;
			    is_dragging = 1;
			}
		}
	}

	else if(right_already_down == 1)
	{
		if(right_down == 0)
		{
			event = RIGHT_CLICK;
			right_already_down = 0;
		}
	}


	int MsgType = MSG_MOVE;
	switch (event) {
		case LEFT_CLICK:
			MsgType = MSG_LPRESS;
			break;
		case RIGHT_CLICK:
			MsgType = MSG_RPRESS;
			break;
		case DOUBLE_CLICK:
			MsgType = MSG_DOUBLECLICK;
			break;
		case DRAGGING:
			MsgType = MSG_DRAG;
			break;
		case DRAG_RELEASE:
			MsgType = MSG_NONE;
			break;
		default:
			break;
	}
	if (y_large_dispalecement == 0 && x_large_dispalecement == 0)
		createMsg(MsgType, x_position, y_position, 0);

	// struct Window* win;
	// int click_icon = -1;
	// if(y_position > ICON_Y && y_position < ICON_Y + 75 + 18)
	// {
	// 	if(event != LEFT_CLICK)
	// 	{
	// 		draw_mouse(x_position, y_position);
	// 		return;
	// 	}
	// 	if(x_position > ICON_X1 && x_position < ICON_X1 + 75)
	// 	{
	// 		click_icon = ICON_FINDER;
	// 	}
	// 	else if(x_position > ICON_X2 && x_position < ICON_X2 + 75)
	// 	{
	// 		click_icon = ICON_PHOTO;
	// 	}
	// 	else if(x_position > ICON_X3 && x_position < ICON_X3 + 75)
	// 	{
	// 		click_icon = ICON_TEXT;
	// 	}
	// 	else if(x_position > ICON_X4 && x_position < ICON_X4 + 75)
	// 	{
	// 		click_icon = ICON_GAME;
	// 	}
	// 	else if(x_position > ICON_X5 && x_position < ICON_X5 + 75)
	// 	{
	// 		click_icon = ICON_DRAW;
	// 	}
	// 	else if(x_position > ICON_X6 && x_position < ICON_X6 + 75)
	// 	{
	// 		click_icon = ICON_SETTING;
	// 	}
	// 	else
	// 	{
	// 		draw_mouse(x_position, y_position);
	// 		return;
	// 	}

	// 	win = get_window_by_icon(click_icon);
	// 	if(click_icon == ICON_FINDER || win == 0)
	// 	{
	// 		win = Add_Window(click_icon);
	// 		if(win != 0)
	// 			draw_window(win);
	// 	}
	// 	else if(win != 0 && WindowLine->next != win)
	// 	{
	// 		draw_window(win);
	// 		Focus(win);
	// 	}
 //  		display_to_screen(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	// 	draw_mouse(x_position, y_position);
	// 	return;
	// }

	// win = Click_Get_Window(x_position, y_position);
	// if(win != 0 && WindowLine->next != win)
	// {
	// 	//cprintf("window: %d\n", win->Cur_icon);
	// 	if(event == LEFT_CLICK)
	// 	{
	// 		draw_window(win);
	//   		display_to_screen(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	// 		Focus(win);
	// 	}
	// }
	// else if(win != 0)
	// {
	// 	int Pos_x, Pos_y;
	// 	Pos_x = x_position - win->Pos_x;
	// 	Pos_y = y_position - win->Pos_y;
	// 	if(Pos_x > 2 && Pos_x < 18 && Pos_y > 2 && Pos_y < 18)
	// 	{
	// 		Close_Window();
	// 		draw_again(get_current_bg());
	// 	}
	// 	else if(Pos_y < 20)
	// 	{
	// 		if(event == DRAGGING)
	// 		{
	// 			if(dragging_top_window == 0)
	// 			{
	// 				dragging_top_window = 1;
	// 				x_drag_window = win->Pos_x;
	// 				y_drag_window = win->Pos_y;
	// 				dragging_count = 0;
	// 			}
	// 			dragging_count = (dragging_count + 1) % 5;
	// 			if(dragging_count != 0)
	// 				return;
	// 			if(x_drag_window + (x_position - x_drag_start) < 0 || 
	// 				x_drag_window + (x_position - x_drag_start) + WindowWidth > SCREEN_WIDTH ||
	// 				y_drag_window + (y_position - y_drag_start) < 0 ||
	// 				y_drag_window + (y_position - y_drag_start) + WindowHeight > SCREEN_HEIGHT)
	// 				return;
	// 			draw_bottom(get_current_bg());
	// 			win->Pos_x = x_drag_window + (x_position - x_drag_start);
	// 			win->Pos_y = y_drag_window + (y_position - y_drag_start);
	// 			draw_window(win);
	// 			display_to_screen(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	// 		}
	// 		else if(event == DRAG_RELEASE)
	// 		{
	// 			if(dragging_top_window == 1)
	// 				dragging_top_window = 0;
	// 		}
	// 	}
	// 	else if(Pos_y > 20 && Pos_y < WindowHeight - 20)
	// 	{
	// 		switch(win->Cur_icon)
	// 		{
	// 			case ICON_DRAW:
	// 				draw(win, Pos_x, Pos_y, event);
	// 				break;
	// 			case ICON_SETTING:
	// 				setting(Pos_x, Pos_y, event);
	// 				break;
	// 			case ICON_FINDER:
	// 				Folder(win, Pos_x, Pos_y, event);
	// 				break;
	// 			case ICON_GAME:
	// 				pointInGameWindow(Pos_x, Pos_y, event);
	// 				break;
	// 			case 8://LIST_FINDER
	// 				Folder(win, Pos_x, Pos_y, event);
	// 				break;
	// 			case 9://LAYOUT_FINDER
	// 				Folder(win, Pos_x, Pos_y, event);
	// 				break;
	// 		}
	// 	}
	// }

	//draw_mouse(x_position, y_position);


}
