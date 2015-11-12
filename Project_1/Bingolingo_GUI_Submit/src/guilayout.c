#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "eventpackage.h"
#include "message_queue.h"
#include "message.h"
#include "mmu.h"
#include "ex_mem.h"
#include "spinlock.h"

dom domRoot,delRoot;
dom* bingolingo=0;
dom* del=0;
uint expc=10;

typedef struct ori_DrawFrame
{
    dom* obj;
    int x;
    int y;
    int w;
    int h;
    uint step;
    struct ori_DrawFrame* prev;
} drawFrame;

struct {
  struct spinlock lock;
} glock;

void initDom()
{
    initlock(&glock.lock, "glock");

    domRoot._id=(uint)(&domRoot);
    domRoot.x=domRoot.y=0;
    domRoot.width=WIDTH_RES;
    domRoot.height=HEIGHT_RES;
    domRoot.focus=0;
    domRoot.trans=0;

    domRoot.onPoint=0;
    domRoot.onRender=0;
    domRoot.onFocus=0;

    domRoot.parent=0;
    domRoot.frater=0;
    domRoot.descent=0;
    domRoot.entity=0;
    domRoot.pid=-1;
    domRoot.isIntegral=0;

    bingolingo=&domRoot;
    delRoot=domRoot;
    del=&delRoot;

    prepend(bingolingo,del);

}

dom* prepend(dom* src, dom* des)
{
    des->frater=src->descent;
    des->parent=src;
    src->descent=des;

    reDraw(des);

    return src;
}
void outputDom(dom* src, uint lay)
{
    if (src==0) return;
    uint i;
    for (i=0;i<lay;i++)
        cprintf("*");
    cprintf("%d\n",src->_id);
    outputDom(src->descent,lay+1);
    outputDom(src->frater,lay);
}
dom* delete(dom* src)
{
    dom *p=src->parent;
    int x=src->x;
    int y=src->y;
    int w=src->width;
    int h=src->height;

    if (p->descent==src)
    {
        p->descent=src->frater;
    }
    else
    {
        dom* q=p->descent;
        while (q->frater!=src)
            q=q->frater;
        q->frater=src->frater;
    }
    if (p->focus==src)
        p->focus=0;
    src->parent=0;
    src->frater=0;

    reDraw_(p,x,y,w,h);

    return src;
}
void reJoin(dom* src)
{
    dom *p=src->parent;
    int x=src->x;
    int y=src->y;
    int w=src->width;
    int h=src->height;

    if (p->descent==src)
    {
        p->descent=src->frater;
    }
    else
    {
        dom* q=p->descent;
        while (q->frater!=src)
            q=q->frater;
        q->frater=src->frater;
    }
    src->parent=0;
    src->frater=0;

    src->frater=p->descent;
    src->parent=p;
    p->descent=src;

    reDraw_(p,x,y,w,h);
}
void _cascade_release(dom *elem)
{
    dom** q = (dom**)kalloc();
    uint st=1;
    *(q+1)=elem;
    while (st>0)
    {
        elem=*(q+st);
        st--;
        if (elem->frater!=0)
        {
            st++;
            *(q+st)=elem->frater;
        }
        if (elem->descent!=0)
        {
            st++;
            *(q+st)=elem->descent;
        }
        kfree((char*)(elem->entity));
    }
    kfree((char*)q);
}

dom* setFocus(dom* src)
{
    src->parent->focus=src;

    return src;
}
void setABSFocus(dom* src)
{
    if (testFocus(bingolingo)==src)
        return;
    dom* tsrc=src->parent;
    FocusMsg* ufmsg=(FocusMsg*)kalloc();
    ufmsg->msg_type=FOCUS_MESSAGE;
    ufmsg->focus_or_not=0;
    passFocusEvent(bingolingo,ufmsg);

    src->focus=0;
    while (tsrc!=0)
    {
        tsrc->focus=src;
        tsrc=tsrc->parent;
        src=src->parent;
    }

    ufmsg=(FocusMsg*)kalloc();
    ufmsg->msg_type=FOCUS_MESSAGE;
    ufmsg->focus_or_not=1;
    passFocusEvent(bingolingo,ufmsg);
}

int getABSposx(dom* src)
{
    if (src==0) return 0;
    return src->x+getABSposx(src->parent);
}
int getABSposy(dom* src)
{
    if (src==0) return 0;
    return src->y+getABSposy(src->parent);
}
//===========================================
#define min(x,y) (x<y?x:y)
#define max(x,y) (x>y?x:y)
//===========================================
void reDraw(dom *src)
{
    reDraw_(src,0,0,src->width,src->height);
}
void reDraw_(dom *src,int x,int y,int w,int h)
{
    acquire(&glock.lock);

    passRenderEvent(bingolingo,getABSposx(src)+x,getABSposy(src)+y,w,h);
    sync(max(getABSposx(src)+x,0),max(getABSposy(src)+y,0),w,h);

    release(&glock.lock);
}
//===========================================
void passFocusEvent(dom* now,void* pkg)
{
    if (now==0)
    {
        kfree(pkg);
        return;
    }
    if (now->isIntegral || now->focus==0)
    {
        if (now->onFocus)
            now->onFocus(now,pkg);
        else
            kfree(pkg);
    }
    else
        passFocusEvent(now->focus,pkg);
}
dom* testFocus(dom* now)
{
    if (now==0)
        return 0;
    if (now->isIntegral || now->focus==0)
        return now;
    return testFocus(now->focus);
}
int passPointEvent(dom* now,int x,int y,uint typ)
{

    while (now!=0 && (now->x>x || now->x+now->width<=x || now->y>y || now->y+now->height<=y))
        now=now->frater;
    if (now==0)
        return 0;
    if (now->isIntegral || !passPointEvent(now->descent,x-now->x,y-now->y,typ))
    {
        if (now->onPoint)
        {
            now->onPoint(now,x-now->x,y-now->y,typ);
            return 1;
        }
        return 0;
    }
    return 1;
}

drawFrame* stash(drawFrame* evq, dom* now,int x,int y,int w,int h)
{
    drawFrame* newE;
    if (evq==0 || ((uint)evq)%PGSIZE+2*sizeof(drawFrame)>=PGSIZE)
    {
        newE=(drawFrame*)kalloc();
    }
    else
        newE=evq+1;

    newE->prev=evq;
    newE->obj=now;
    newE->x=x;
    newE->y=y;
    newE->w=w;
    newE->h=h;
    newE->step=0;

    return newE;
}
drawFrame* checkout(drawFrame* evq)
{
    drawFrame* newE=evq->prev;
    if (((uint)evq)%PGSIZE==0)
    {
        kfree((char*)evq);
    }
    return newE;
}
void passRenderEvent(dom* now,int x,int y,int w,int h)
{
    drawFrame* evq = 0;
    int _w,_h;
    int _x,_y;

    evq=stash(evq,now,x,y,w,h);
    while (evq!=0)
    {
        //checkout
        x=evq->x;
        y=evq->y;
        w=evq->w;
        h=evq->h;
        now=evq->obj;
        //=====
        if (evq->step==0)
        {
            evq->step=1;
            if (w<=0 || h<=0)
            {
                evq=checkout(evq);
                continue;
            }
            while (now!=0 && (x+w<=now->x || x>=now->x+now->width || y+h<=now->y || y>=now->y+now->height))
            {
                now=now->frater;
            }
            if (now==0)
            {
                evq=checkout(evq);
                continue;
            }
            _x=max(x,now->x);
            _y=max(y,now->y);
            _w=min(x+w,now->x+now->width)-_x;
            _h=min(y+h,now->y+now->height)-_y;
            evq->x=_x;
            evq->y=_y;
            evq->w=_w;
            evq->h=_h;
            evq->obj=now;
            if (now->trans!=0)
            {
                evq=stash(evq,now->frater,x,y,w,h);
            }
            else
            {
                evq=stash(evq,now->frater,x,y,_x-x,h);
                evq=stash(evq,now->frater,_x+_w,y,x+w-_x-_w,h);
                evq=stash(evq,now->frater,_x,y,_w,_y-y);
                evq=stash(evq,now->frater,_x,_y+_h,_w,y+h-_y-_h);
            }
        }
        else
        {
            evq=checkout(evq);
            if (now->onRender==0 || now->onRender(now,x-now->x,y-now->y,w,h)!=0)
            {
                evq=stash(evq,now->descent,x-now->x,y-now->y,w,h);
            }
        }
    }
}
