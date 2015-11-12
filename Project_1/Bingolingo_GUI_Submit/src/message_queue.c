#include "types.h"
#include "defs.h"
#include "param.h"
#include "message.h"
#include "message_queue.h"
#include "spinlock.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "guilayout.h"

struct
{
	struct spinlock lock;
	void* msg;
} lockflag;

int initProcessMsgMap()
{
	if ((process_message_map = (MsgQueue**)kalloc()) == 0)
	{
		panic("init process messager map error!!");
		return 0;
	}
	memset((uchar*)process_message_map, 0, MAX_PROCESS_NUM * sizeof(MsgQueue**));
	initlock(&lockflag.lock, "msg");
	return 1;
}

int initProcessQueue(int pid)
{
	_Static_assert(sizeof(MsgQueue) == 4 * 1024, "hehe.\n");
 	int index = pid % MAX_PROCESS_NUM;
	*(process_message_map + index) = (MsgQueue*)kalloc();
	if (*(process_message_map + index) == 0)
	{
		panic("init queue error!!");
		return 0;
	}
	memset((uchar*)(*(process_message_map + index)), 0, sizeof(MsgQueue));
	(*(process_message_map + index))->head = 0;
	(*(process_message_map + index))->tail = 0;
	return 1;
}

int releaseProcessQueue(int pid)
{
	int index = pid % MAX_PROCESS_NUM;
	if (*(process_message_map + index) != 0)
	{
		kfree((char*)(*(process_message_map + index)));
		*(process_message_map + index) = (MsgQueue*)0;
		return 1;
	}
	else
		return 0;
}

void enqueue(int pid, void* message)
{
	if (pid==-1) return;
	int index = pid % MAX_PROCESS_NUM;
	if (*(process_message_map + index) == 0)	//when we did not
		return;
	MsgQueue* p = *(process_message_map + index);
	int next_tail = (p->tail + 2 > QUEUE_SIZE)? 0: (p->tail + 1);

	//cprintf("\n\nI'm in!!!!!!!!!!!!!!!!!!!!!!!\n");

	acquire(&lockflag.lock);
	if (p->head != next_tail)
	{
		*(p->queue + p->tail) = message;
		p->tail = next_tail;
		if (getstatusbypid(pid) == SLEEPING)
			wakeup(&lockflag.msg);
	}
	release(&lockflag.lock);
}

void dequeue(int pid, void* result)
{
	int index = pid % MAX_PROCESS_NUM;
	MsgQueue* p = *(process_message_map + index);
	int next_head;
	int pre_head;
	int *tmpptr;
	MouseMsg* tmp_mouse;
	KBDMsg* tmp_kbd;
	FocusMsg* tmp_fcs;
	CallMsg* tmp_call;

	acquire(&lockflag.lock);
	loop:
	next_head = (p->head + 2 > QUEUE_SIZE)? 0: (p->head + 1);
	pre_head = p->head;
	if (p->head != p->tail)
	{
		p->head = next_head;
		release(&lockflag.lock);
		tmpptr = (int*)(*(p->queue + pre_head));
		if (*tmpptr == MOUSE_MESSAGE)
		{
			tmp_mouse = (MouseMsg*)(*(p->queue + pre_head));
			((MouseMsg*)result)->msg_type = tmp_mouse->msg_type;
			((MouseMsg*)result)->x = tmp_mouse->x;
			((MouseMsg*)result)->y = tmp_mouse->y;
			((MouseMsg*)result)->mouse_event_type = tmp_mouse->mouse_event_type;
			((MouseMsg*)result)->dom_id = tmp_mouse->dom_id;
			((MouseMsg*)result)->enter_or_leave = tmp_mouse->enter_or_leave;
			kfree((char*)(*(p->queue + pre_head)));
			return;
		}
		else if (*tmpptr == KEYBOARD_MESSAGE)
		{
			tmp_kbd = (KBDMsg*)(*(p->queue + pre_head));
			((KBDMsg*)result)->msg_type = tmp_kbd->msg_type;
			((KBDMsg*)result)->key_value = tmp_kbd->key_value;
			((KBDMsg*)result)->dom_id = tmp_kbd->dom_id;
			kfree((char*)(*(p->queue + pre_head)));
			return;
		}
		else if (*tmpptr == FOCUS_MESSAGE)
		{
			tmp_fcs = (FocusMsg*)(*(p->queue + pre_head));
			*(FocusMsg*)result=*tmp_fcs;
			kfree((char*)(*(p->queue + pre_head)));
			return;
		}
		else if (*tmpptr == CALL_MESSAGE)
		{
			tmp_call = (CallMsg*)(*(p->queue + pre_head));
			*((CallMsg*)result) = *tmp_call;
			kfree((char*)(*(p->queue + pre_head)));
			return;
		}
	}
	sleep(&lockflag.msg, &lockflag.lock);
	goto loop;
}

void informHomeToOpenFile(char* process_name, char* file_name)
{
	CallMsg* cm = (CallMsg*)kalloc();
	int i;
	cm->msg_type = CALL_MESSAGE;
	for (i = 0; process_name[i] != '\0'; i++)
	{
		(cm->call_process_name)[i] = process_name[i];
	}
	(cm->call_process_name)[i] = '\0';
	
	for (i = 0; file_name[i] != '\0'; i++)
	{
		(cm->file_path)[i] = file_name[i];
	}
	(cm->file_path)[i] = '\0';
	enqueue(del->descent->pid, cm);
}
