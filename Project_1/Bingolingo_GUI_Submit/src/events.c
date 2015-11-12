#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "events.h"
#include "eventpackage.h"
#include "message_queue.h"
#include "message.h"
#include "mouse.h"

uint mouse_within_dom = -1;

//We must judge whether our mouse has moved out of the dom, because the coordinates may out of range
uchar typicalPointEvent(dom* which ,int x,int y,uint msgType)
{
    if (which->pid==-1)
        return 1;
    MouseMsg* mm = (MouseMsg*)kalloc();
    mm->msg_type = MOUSE_MESSAGE;
    mm->x = x;
    mm->y = y;
    mm->mouse_event_type = msgType;
    mm->dom_id = which->_id;
    if (msgType & LEFT_BTN_UP)
        setABSFocus(which);

    if (mm->dom_id != mouse_within_dom) //move out
    {
        if (mouse_within_dom != -1)
        {
            dom* tmp = (dom*)mouse_within_dom;  //move out from this dom
            MouseMsg* mm_old = (MouseMsg*)kalloc();
            mm_old->msg_type = MOUSE_MESSAGE;
            mm_old->x = x;
            mm_old->y = y;
            mm_old->mouse_event_type = msgType;
            mm_old->dom_id = mouse_within_dom;
            mm_old->enter_or_leave = MOUSE_LEAVE;
            enqueue(tmp->pid, mm_old);
        }
        mouse_within_dom = which->_id;
        mm->enter_or_leave = MOUSE_ENTER;
        enqueue(which->pid, mm);
    }
    else if ((msgType | 0x0) != 0)  //click buton(s)
    {
        mm->enter_or_leave = MOUSE_NOT_CHANGE;
        enqueue(which->pid, mm);
    }
    return 1;
}

uchar typicalFocusEvent(dom* which,void* pkg)
{
    ((KBDMsg*)pkg)->dom_id=which->_id;
    enqueue(which->pid, pkg);
    return 1;
}
