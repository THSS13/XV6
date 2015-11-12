#include "types.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"
#include "message.h"
#include "window.h"

//全局消息队列
struct Msg MsgQueue[MAX_QUEUE_LENGTH];

//系统维护的各进程消息队列列表
struct MsgTableEntry MsgTable[MAX_PROCESS_NUMBER];

int mouse_x;
int mouse_y;

void msgqueueinit()
{
    mouse_x = -1;
    mouse_y = -1;
	int i;
	for(i = 0; i < MAX_QUEUE_LENGTH; i++)
	{
		MsgQueue[i].msg_type = MSG_UNUSED;
	}
}

void msgtableinit()
{
	int i;
	for(i = 0; i < MAX_PROCESS_NUMBER; i++)
	{
		MsgTable[i].pid = -1;
	}
}

//在MsgQueue中分配一个msg
int requireMsg(int msg_type, int pos_x, int pos_y, char key)
{
	int i;
	for(i = 0; i < MAX_QUEUE_LENGTH; i++)
	{
		if(MsgQueue[i].msg_type == MSG_UNUSED)
		{
			MsgQueue[i].msg_type = msg_type;
			if(msg_type == MSG_KEYDOWN)
			{
				MsgQueue[i].concrete_msg.msg_key.key = key;
			}
			else
			{
				MsgQueue[i].concrete_msg.msg_mouse.x = pos_x;
				MsgQueue[i].concrete_msg.msg_mouse.y = pos_y;
			}
			return i;
		}
	}
	return -1;
}

int requirePartialUpdateMsg(int x1, int y1, int x2, int y2)
{
    int i;
    for(i = 0; i < MAX_QUEUE_LENGTH; i++)
    {
        if(MsgQueue[i].msg_type == MSG_UNUSED)
        {
            MsgQueue[i].msg_type = MSG_PARTIAL_UPDATE;
            MsgQueue[i].concrete_msg.msg_partial_update.x1 = x1;
            MsgQueue[i].concrete_msg.msg_partial_update.y1 = y1;
            MsgQueue[i].concrete_msg.msg_partial_update.x2 = x2;
            MsgQueue[i].concrete_msg.msg_partial_update.y2 = y2;
            return i;
        }
    }
    return -1;
}

//将msg加入MsgTable中对应的pid项
void dispatch(int pid, int msg_index)
{
	int i;
	for(i = 0; i < MAX_PROCESS_NUMBER; i++)
	{
		if(MsgTable[i].pid == pid)
		{
			int temp_msg_index = MsgTable[i].first_msg;
			while(MsgQueue[temp_msg_index].next_msg != -1)
			{
				temp_msg_index = MsgQueue[temp_msg_index].next_msg;
			}
			MsgQueue[temp_msg_index].next_msg = msg_index;
			MsgQueue[msg_index].next_msg = -1;
			return;
		}
	}
	for (i = 0; i < MAX_PROCESS_NUMBER; i++)
	{
		if(MsgTable[i].pid == -1)
		{
			MsgTable[i].pid = pid;
			MsgTable[i].first_msg = msg_index;
			MsgQueue[msg_index].next_msg = -1;
			break;
		}
	}
}

//创建一则消息，包括将其加入MsgTable和MsgQueue中
void createMsg(int msg_type, int pos_x, int pos_y, char key)
{
    int x = pos_x;
    int y = pos_y;
    //if(msg_type != 0) cprintf("msg type: %d\n", msg_type);
    /*if(msg_type == MSG_LPRESS || msg_type == MSG_RPRESS || msg_type == MSG_DOUBLECLICK 
        || msg_type == MSG_KEYDOWN || msg_type == MSG_DRAG) 
        cprintf("msg type: %d\n", msg_type);*/
	int pid;
    int msg_index;
	if(msg_type == MSG_KEYDOWN)//键盘事件
	{
		pid = getActivated()->pid;
        msg_index = requireMsg(msg_type, x, y, key);
	    if (msg_index == -1) return;
        dispatch(pid, msg_index);
	}
	else//鼠标事件
	{
        if(mouse_x == -1) mouse_x = pos_x;
        if(mouse_y == -1) mouse_y = pos_y;

        struct Window* win_ptr = getWindowByPoint(pos_x, pos_y);
        //cprintf("%d\n", win_ptr);
        pid = win_ptr->pid;

        x = pos_x - win_ptr->window_position.left_x;//relative x
        y = pos_y - win_ptr->window_position.left_y;//relative y

        if(msg_type == MSG_LPRESS || msg_type == MSG_RPRESS || msg_type == MSG_DOUBLECLICK)
        {
            setActivated(win_ptr);
            msg_index = requireMsg(msg_type, x, y, key);
	        if (msg_index == -1) return;
            dispatch(pid, msg_index);
        }
        
        if(msg_type == MSG_DRAG)
        {
            setActivated(win_ptr);
        	if(win_ptr->prior_window == 0)//desktop
            {
                mouse_x = pos_x;
                mouse_y = pos_y;
		        drawMouse(pos_x, pos_y);
             	return;
            }
            
            int dx = pos_x - mouse_x;
            int dy = pos_y - mouse_y;
            
            int win_left_x = win_ptr->window_position.left_x;
            int win_left_y = win_ptr->window_position.left_y;
            int win_right_x = win_ptr->window_position.right_x;
            int win_right_y = win_ptr->window_position.right_y;

            int x1 = (dx > 0) ? win_left_x : (win_left_x + dx);
            int y1 = (dy > 0) ? win_left_y : (win_left_y + dy);
            int x2 = (dx > 0) ? (win_right_x + dx) : win_right_x;
            int y2 = (dy > 0) ? (win_right_y + dy) : win_right_y;

            /*if( (dx > -10 && dx < 10)|| (dy > -10 && dy < 10))
            {
                //cprintf("one tiny drag!\n");
                return;
            }*/
            if(win_left_x + dx >= 0 && win_left_y + dy >= 0
                && win_right_x + dx < SCREEN_WIDTH 
                && win_right_y + dy < SCREEN_HEIGHT)//判断合法位移
            {
                win_ptr->window_position.left_x += dx;           
                win_ptr->window_position.left_y += dy;
                win_ptr->window_position.right_x += dx;
                win_ptr->window_position.right_y += dy;
            }
            else
            {
                mouse_x = pos_x;
                mouse_y = pos_y;
		        drawMouse(pos_x, pos_y);
                return;
            }
            /*msg_index = requireMsg(msg_type, x, y, key);
	        if (msg_index == -1) return;*/
            //dispatch(pid, msg_index);
            cprintf("update area: x1: %d, y1: %d, x2: %d, y2:%d.\n", x1, y1, x2, y2);
            //drawScreenArea(x1, y1, x2, y2);
            drawScreen();
            mouse_x = pos_x;
            mouse_y = pos_y;
            setMouse(mouse_x, mouse_y);
            return;
        }
        
        mouse_x = pos_x;
        mouse_y = pos_y;
		drawMouse(pos_x, pos_y);
	}
}

void createUpdateMsg(int pid)
{
	int msg_index = requireMsg(MSG_UPDATE, 0, 0, ' ');
	if (msg_index == -1) return;
	
	dispatch(pid, msg_index);
}

void createPartialUpdateMsg(int pid, int x1, int y1, int x2, int y2)
{
    int msg_index = requirePartialUpdateMsg(x1, y1, x2, y2);
    if (msg_index == -1) return;
	
	dispatch(pid, msg_index);
}

//系统调用，获得一个进程当前需要处理的msg，并将其从MsgTable和MsgQueue中删除
void getMsg(int pid, struct Msg* ptr)
{
	int i;
	for(i = 0; i < MAX_PROCESS_NUMBER; i++)
	{
		if(MsgTable[i].pid == pid)
		{
			int msg_index = MsgTable[i].first_msg;
			ptr->msg_type = MsgQueue[msg_index].msg_type;
			ptr->concrete_msg = MsgQueue[msg_index].concrete_msg;
			if(MsgQueue[msg_index].next_msg == -1)
			{
				MsgTable[i].pid = -1;
			}
			else
			{
				MsgTable[i].first_msg = MsgQueue[msg_index].next_msg;
			}
			MsgQueue[msg_index].msg_type = MSG_UNUSED;
			return;
		}
	}
    ptr->msg_type = MSG_NONE;
}

int sys_getMsg()
{
	struct Msg* ptr;
	if (argptr(0, (void*)&ptr, sizeof(*ptr)) < 0)
		return -1;
	getMsg(proc->pid, ptr);
	return 0;
}
