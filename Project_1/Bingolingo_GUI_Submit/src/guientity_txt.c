#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "ex_mem.h"
#include "guientity_div.h"
#include "guientity_cha.h"
#include "guientity_txt.h"
#include "guientity_attrvalue.h"
#include "events.h"

#define FONT_NUM 1
static uint fontSize[FONT_NUM][2];
static uchar* fontArray[FONT_NUM][128];
static uchar inited[FONT_NUM];
//===========================================
#define min(x,y) (x<y?x:y)
#define max(x,y) (x>y?x:y)
#define abs(x) (x>=0?(x):(-(x)))
//===========================================

//==============================================
void txt_initLock()
{
    memset(inited,0,sizeof(uchar)*FONT_NUM);
    memset(fontSize,0,sizeof(uint)*2*FONT_NUM);
    memset(fontArray,0,sizeof(uchar*)*128*FONT_NUM);
}

uint txt_createDom(int x, int y, uint w, uint h, uint parent, int pid)
{
    txt *t;
    int i;
    uint cursorDiv;
    if((t = (txt*)kalloc()) == 0)
    {
        panic("Bingolingo!");
        return 0;
    }
    for (i=0;i<FONT_NUM;i++)
        if (inited[i]==0){
            panic("Font not Initialized!");
            return 0;
        }
    memset((uchar*)(&(t->ds)),0,sizeof(dom));
    t->ds.x=x;
    t->ds.y=y;
    if (w<fontSize[0][0])
        t->ds.width=fontSize[0][0];
    else
        t->ds.width=w;
    t->ds.height=h;
    t->ds._id=(uint)t;
    t->ds.trans=255;

    t->ds.entity=(void*)t;
    t->ds.onRender=0;
    t->ds.pid=pid;
    t->ds.onPoint=typicalPointEvent;
    t->ds.onFocus=typicalFocusEvent;
    t->ds.isIntegral=0;

    t->blockHead=0;
    t->blockTail=0;
    t->head=0;
    t->tail=0;
    t->cursor=(txtContent*)(uint)-1;
    t->txtColor=rgb(0,255,0);
    t->chWidth=fontSize[0][0];
    t->chHeight=fontSize[0][1];
    t->chImgArray=fontArray[0];

    if (parent==0xffffffff)
        prepend(del,&t->ds);
    else
        prepend((dom*)parent,&t->ds);

    cursorDiv=div_createDom(0, 0, t->chWidth, t->chHeight, (uint)t, pid);
    div_changeBgcolor(cursorDiv, rgba(242,242,0,255));
    t->cursorDiv=(div*)cursorDiv;

    return (uint)t;
}

void txt_release(uint elem_)
{
    txt* elem=(txt*)elem_;
    txtContent* p;
    txtContent* q;
    void* pp;
    void* qq;

    p=elem->head;
    while (p!=0){
        q=p->next;
        cha_release((uint)p);
        p=q;
    }

    pp=elem->blockHead;
    while (pp!=0){
        qq=(void*)(*((uint*)pp));
        kfree(pp);
        pp=qq;
    }

    if (elem->ds.parent!=0)
        delete(&elem->ds);
    kfree((void*)&elem->ds);
}

uint initFont(void *val)
{
    uint index,num;
    uint w,h,size;
    uint i,k;
    char c;
    uchar* v=(uchar*)val;
    uchar* p;

    index=(uint)(v[0]);
    w=(uint)(v[1]);
    h=(uint)(v[2]);
    num=(uint)(v[3]);
    fontSize[index][0]=w;
    fontSize[index][1]=h;
    size=w*h;
    v=v+4;

    if ((p=(uchar*)kalloc()) == 0)
    {
        panic("Bingolingo!");
        return -1;
    }
    k=0;
    for (i=0;i<num;i++)
    {
        c=(char)(*v);
        v++;
        if (k+size>=4096)
        {
            if ((p=(uchar*)kalloc()) == 0)
            {
                panic("Bingolingo!");
                return -1;
            }
            k=0;
        }
        memmove(p+k,v,size);
        fontArray[index][(uint)c]=p+k;
        k+=size;
        v+=size;
    }
    if (k+size>=4096)
    {
        if ((p=(uchar*)kalloc()) == 0)
        {
            panic("Bingolingo!");
            return -1;
        }
        k=0;
    }
    memset(p+k,255,size);
    fontArray[index]['\n']=p+k;
    fontArray[index][' ']=p+k;

    inited[index]=1;
    return 0;
}

uint txt_setStr(uint elem_, char* str_)
{
    txt* elem=(txt*)elem_;
    txtContent* p;
    txtContent* q;
    void* pp;
    void* qq;
    char* str=str_;
    txtContent* nextPos;
    uint size=sizeof(txtContent);
    uint x;
    uint y;

    p=elem->head;
    while (p!=0){
        q=p->next;
        cha_release((uint)p);
        p=q;
    }

    pp=elem->blockHead;
    while (pp!=0){
        qq=(void*)(*((uint*)pp));
        kfree(pp);
        pp=qq;
    }

    elem->cursorDiv->ds.x=0;
    elem->cursorDiv->ds.y=0;
    elem->cursorDiv->ds.width=elem->chWidth;
    elem->cursorDiv->ds.height=elem->chHeight;
    elem->cursorDiv->bgColor.a=255;
    elem->cursor=(txtContent*)(uint)-1;

    if ((elem->blockTail=kalloc()) == 0)
    {
        panic("Bingolingo!");
        return -1;
    }
    elem->blockHead=elem->blockTail;
    elem->head=0;
    elem->tail=0;
    *(uint*)elem->blockTail=(uint)0;
    nextPos=(txtContent*)((uint)elem->blockTail+4);
    while (*str!=0)
    {
        if (elem->chImgArray[(uint)*str]==0)
        {
            str++;
            continue;
        }
        else if (elem->tail==0)
            x=y=0;
        else if (elem->tail->data.ch=='\n')
        {
            x=0;
            y=elem->tail->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        else if (elem->tail->data.ds.x+2*elem->chWidth<=elem->ds.width)
        {
            x=elem->tail->data.ds.x+elem->chWidth;
            y=elem->tail->data.ds.y;
        }
        else
        {
            x=0;
            y=elem->tail->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }

        cha_createDom((cha*)nextPos, x, y, elem->chWidth, elem->chHeight, (uint)elem, elem->ds.pid);
        cha_setContent((uint)nextPos, elem->chImgArray[(uint)*str], *str);
        cha_setColor((uint)nextPos, elem->txtColor);

        if (elem->tail==0)
        {
            elem->head=nextPos;
            elem->tail=nextPos;
            elem->tail->prev=0;
            elem->tail->next=0;
        }
        else
        {
            elem->tail->next=nextPos;
            nextPos->prev=elem->tail;
            nextPos->next=0;
            elem->tail=nextPos;
        }

        if ((uint)elem->tail+size-(uint)elem->blockTail>4096-size)
        {
            if ((*(uint*)elem->blockTail=(uint)kalloc()) == 0)
            {
                panic("Bingolingo!");
                return -1;
            }
            elem->blockTail=(void*)(*(uint*)elem->blockTail);
            *(uint*)elem->blockTail=(uint)0;
            nextPos=(txtContent*)((uint)elem->blockTail+4);
        }
        else
            nextPos=(txtContent*)((uint)nextPos+size);
        str++;
    }

    return 0;
}

uint txt_incCursor(uint elem_)
{
    txt* elem=(txt*)elem_;

    if (elem->cursor==(txtContent*)(uint)-1)
    {
        elem->cursor=0;
        elem->cursorDiv->bgColor.a=0;
        div_setXY((uint)elem->cursorDiv, 0, 0);
        return 0;
    }
    else if (elem->cursor!=0 && elem->cursor->next==0)
        return 0;
    else if (elem->cursor==0 && elem->head==0)
        return 0;
    else if (elem->cursor==0)
        elem->cursor=elem->head;
    else
        elem->cursor=elem->cursor->next;

    if (elem->cursor->data.ch=='\n')
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }
    else if (elem->cursor->data.ds.x+2*elem->chWidth<=elem->ds.width)
        div_setXY((uint)elem->cursorDiv, elem->cursor->data.ds.x+elem->chWidth, elem->cursor->data.ds.y);
    else
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }

    return 0;
}

uint txt_decCursor(uint elem_)
{
    txt* elem=(txt*)elem_;

    if (elem->cursor==(txtContent*)(uint)-1)
        return 0;
    else if (elem->cursor==0)
    {
        elem->cursor=(txtContent*)(uint)-1;
        elem->cursorDiv->bgColor.a=255;
        div_setXY((uint)elem->cursorDiv, 0, 0);
        return 0;
    }
    else if (elem->cursor==elem->head)
    {
        elem->cursor=0;
        div_setXY((uint)elem->cursorDiv, 0, 0);
        return 0;
    }
    else
        elem->cursor=elem->cursor->prev;

    if (elem->cursor->data.ch=='\n')
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }
    else if (elem->cursor->data.ds.x+2*elem->chWidth<=elem->ds.width)
        div_setXY((uint)elem->cursorDiv, elem->cursor->data.ds.x+elem->chWidth, elem->cursor->data.ds.y);
    else
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }

    return 0;
}

uint txt_setCursor(uint elem_, uint chaToSet_)
{
    txt* elem=(txt*)elem_;
    txtContent* chaToSet=(txtContent*)chaToSet_;

    if (chaToSet_==(uint)-1)
    {
        elem->cursor=(txtContent*)(uint)-1;
        elem->cursorDiv->bgColor.a=255;
        div_setXY((uint)elem->cursorDiv, 0, 0);
        return 0;
    }
    if (chaToSet_==0)
    {
        elem->cursor=0;
        elem->cursorDiv->bgColor.a=0;
        div_setXY((uint)elem->cursorDiv, 0, 0);
        return 0;
    }
    if (chaToSet->data.ds.parent!=&elem->ds)
        return -1;
    if (elem->cursor==(txtContent*)(uint)-1)
        elem->cursorDiv->bgColor.a=0;
    elem->cursor=chaToSet;

    if (elem->cursor->data.ch=='\n')
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }
    else if (elem->cursor->data.ds.x+2*elem->chWidth<=elem->ds.width)
        div_setXY((uint)elem->cursorDiv, elem->cursor->data.ds.x+elem->chWidth, elem->cursor->data.ds.y);
    else
    {
        if (elem->cursor->data.ds.y+elem->chHeight>elem->ds.height-elem->chHeight)
            elem->ds.height=elem->cursor->data.ds.y+2*elem->chHeight;
        div_setXY((uint)elem->cursorDiv, 0, elem->cursor->data.ds.y+elem->chHeight);
    }

    return 0;
}

uint min3(uint x, uint y, uint z)
{
    return (x<y?(x<z?x:z):(y<z?y:z));
}

uint max3(uint x, uint y, uint z)
{
    return (x>y?(x>z?x:z):(y>z?y:z));
}

uint txt_insert(uint elem_, char val)
{
    txt* elem=(txt*)elem_;
    txtContent* nextPos;
    uint size=sizeof(txtContent);
    uint x,y;
    uint minX, minY, maxX, maxY;

    if (elem->cursor==(txtContent*)(uint)-1)
        return -1;
    if (elem->chImgArray[(uint)val]==0)
        return -1;
    if (elem->tail==0)
        nextPos=(txtContent*)((uint)elem->blockTail+4);
    else if ((uint)elem->tail+size-(uint)elem->blockTail>4096-size)
    {
        if ((*(uint*)elem->blockTail=(uint)kalloc()) == 0)
        {
            panic("Bingolingo!");
            return -1;
        }
        elem->blockTail=(void*)(*(uint*)elem->blockTail);
        *(uint*)elem->blockTail=(uint)0;
        nextPos=(txtContent*)((uint)elem->blockTail+4);
    }
    else
        nextPos=(txtContent*)((uint)elem->tail+size);

    if (elem->cursor==0)
        x=y=0;
    else if (elem->cursor->data.ch=='\n')
    {
        x=0;
        y=elem->cursor->data.ds.y+elem->chHeight;
        if (y+elem->chHeight>elem->ds.height)
            elem->ds.height=y+elem->chHeight;
    }
    else if (elem->cursor->data.ds.x+2*elem->chWidth<=elem->ds.width)
    {
        x=elem->cursor->data.ds.x+elem->chWidth;
        y=elem->cursor->data.ds.y;
    }
    else
    {
        x=0;
        y=elem->cursor->data.ds.y+elem->chHeight;
        if (y+elem->chHeight>elem->ds.height)
            elem->ds.height=y+elem->chHeight;
    }

    cha_createDomOrphan((cha*)nextPos, x, y, elem->chWidth, elem->chHeight, elem->ds.pid);
    ((cha*)nextPos)->ds.parent=&elem->ds;
    if (elem->cursor!=0)
        ((cha*)nextPos)->ds.frater=&(elem->cursor->data.ds);
    else
        ((cha*)nextPos)->ds.frater=&(elem->cursorDiv->ds);
    if (elem->cursor!=0 && elem->cursor->next!=0)
        elem->cursor->next->data.ds.frater=&(((cha*)nextPos)->ds);
    else if (elem->cursor==0 && elem->head!=0)
        elem->head->data.ds.frater=&(((cha*)nextPos)->ds);
    else
        elem->ds.descent=&(((cha*)nextPos)->ds);
    if (elem->cursor!=0 && elem->cursor->next==0)
        nextPos->next=0;
    else if (elem->cursor==0 && elem->head==0)
        nextPos->next=0;
    else if (elem->cursor==0 && elem->head!=0)
    {
        nextPos->next=elem->head;
        elem->head->prev=nextPos;
    }
    else
    {
        nextPos->next=elem->cursor->next;
        elem->cursor->next->prev=nextPos;
    }
    if (elem->cursor==0)
    {
        nextPos->prev=0;
        elem->head=nextPos;
    }
    else
    {
        nextPos->prev=elem->cursor;
        elem->cursor->next=nextPos;
    }
    elem->tail=nextPos;
    cha_setContentNotRedraw((uint)nextPos, elem->chImgArray[(uint)val], val);
    cha_setColor((uint)nextPos, elem->txtColor);

    elem->cursor=nextPos;
    minX=elem->cursor->data.ds.x;
    minY=elem->cursor->data.ds.y;
    maxX=elem->cursor->data.ds.x+elem->chWidth;
    maxY=elem->cursor->data.ds.y+elem->chHeight;

    while (nextPos!=0)
    {
        if (nextPos==0)
            x=y=0;
        else if (nextPos->data.ch=='\n')
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        else if (nextPos->data.ds.x+2*elem->chWidth<=elem->ds.width)
        {
            x=nextPos->data.ds.x+elem->chWidth;
            y=nextPos->data.ds.y;
        }
        else
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        if (nextPos==elem->cursor)
        {
            minX=min3(minX,x,elem->cursorDiv->ds.x);
            minY=min3(minY,y,elem->cursorDiv->ds.y);
            maxX=max3(maxX,x+elem->chWidth,elem->cursorDiv->ds.x+elem->chWidth);
            maxY=max3(maxY,y+elem->chHeight,elem->cursorDiv->ds.y+elem->chHeight);
            elem->cursorDiv->ds.x=x;
            elem->cursorDiv->ds.y=y;
        }
        if (nextPos->next==0)
            break;
        if (x==nextPos->next->data.ds.x && y==nextPos->next->data.ds.y)
            break;
        minX=min3(minX,x,nextPos->next->data.ds.x);
        minY=min3(minY,y,nextPos->next->data.ds.y);
        maxX=max3(maxX,x+elem->chWidth,nextPos->next->data.ds.x+elem->chWidth);
        maxY=max3(maxY,y+elem->chHeight,nextPos->next->data.ds.y+elem->chHeight);
        nextPos->next->data.ds.x=x;
        nextPos->next->data.ds.y=y;

        nextPos=nextPos->next;
    }

    reDraw_(&elem->ds,minX,minY,maxX-minX,maxY-minY);

    return 0;
}

uint txt_bckspc(uint elem_, char* des)
{
    txt* elem=(txt*)elem_;
    txtContent* nextPos;
    uint x,y;
    uint minX, minY, maxX, maxY;

    if (elem->cursor==(txtContent*)(uint)-1)
        return -1;
    if (elem->cursor==0)
        return -1;

    *des=elem->cursor->data.ch;
    nextPos=elem->cursor;
    txt_decCursor(elem_);

    cha_release((uint)&nextPos->data);
    if (nextPos==elem->head && nextPos->next==0)
        elem->head=0;
    else if (nextPos==elem->head)
    {
        elem->head=nextPos->next;
        nextPos->next->prev=0;
    }
    else if (nextPos->next==0)
        nextPos->prev->next=0;
    else
    {
        nextPos->prev->next=nextPos->next;
        nextPos->next->prev=nextPos->prev;
    }

    nextPos=elem->cursor;
    if (nextPos!=0)
    {
        minX=nextPos->data.ds.x;
        minY=nextPos->data.ds.y;
        maxX=nextPos->data.ds.x+elem->chWidth;
        maxY=nextPos->data.ds.y+elem->chHeight;
    }
    else
    {
        minX=0;
        minY=0;
        maxX=elem->chWidth;
        maxY=elem->chHeight;
    }

    while (1)
    {
        if (nextPos==0)
            x=y=0;
        else if (nextPos->data.ch=='\n')
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        else if (nextPos->data.ds.x+2*elem->chWidth<=elem->ds.width)
        {
            x=nextPos->data.ds.x+elem->chWidth;
            y=nextPos->data.ds.y;
        }
        else
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        if ((nextPos==0&&elem->head==0) || nextPos->next==0)
            break;
        if (nextPos!=0)
        {
            if (x==nextPos->next->data.ds.x && y==nextPos->next->data.ds.y)
                break;
            minX=min3(minX,x,nextPos->next->data.ds.x);
            minY=min3(minY,y,nextPos->next->data.ds.y);
            maxX=max3(maxX,x+elem->chWidth,nextPos->next->data.ds.x+elem->chWidth);
            maxY=max3(maxY,y+elem->chHeight,nextPos->next->data.ds.y+elem->chHeight);
            nextPos->next->data.ds.x=x;
            nextPos->next->data.ds.y=y;

            nextPos=nextPos->next;
        }
        else
        {
            if (x==elem->head->data.ds.x && y==elem->head->data.ds.y)
                break;
            minX=min3(minX,x,elem->head->data.ds.x);
            minY=min3(minY,y,elem->head->data.ds.y);
            maxX=max3(maxX,x+elem->chWidth,elem->head->data.ds.x+elem->chWidth);
            maxY=max3(maxY,y+elem->chHeight,elem->head->data.ds.y+elem->chHeight);
            elem->head->data.ds.x=x;
            elem->head->data.ds.y=y;
            nextPos=elem->head;
        }
    }
    reDraw_(&elem->ds,minX,minY,maxX-minX,maxY-minY);

    return 0;
}

void txt_adjustXY(uint elem_)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;
    uint x,y;

    if (elem->head==0)
        return;
    elem->head->data.ds.x=0;
    elem->head->data.ds.y=0;
    nextPos=elem->head;

    while (1)
    {
        if (nextPos==0)
            x=y=0;
        else if (nextPos->data.ch=='\n')
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        else if (nextPos->data.ds.x+2*elem->chWidth<=elem->ds.width)
        {
            x=nextPos->data.ds.x+elem->chWidth;
            y=nextPos->data.ds.y;
        }
        else
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        if (nextPos->next==0)
            break;
        nextPos->next->data.ds.x=x;
        nextPos->next->data.ds.y=y;
        nextPos=nextPos->next;
    }

    if (elem->cursor==(txtContent*)(uint)-1 || elem->cursor==0)
        return;
    else
    {
        nextPos=elem->cursor;
        if (nextPos==0)
            x=y=0;
        else if (nextPos->data.ch=='\n')
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        else if (nextPos->data.ds.x+2*elem->chWidth<=elem->ds.width)
        {
            x=nextPos->data.ds.x+elem->chWidth;
            y=nextPos->data.ds.y;
        }
        else
        {
            x=0;
            y=nextPos->data.ds.y+elem->chHeight;
            if (y+elem->chHeight>elem->ds.height)
                elem->ds.height=y+elem->chHeight;
        }
        elem->cursorDiv->ds.x=x;
        elem->cursorDiv->ds.y=y;
    }
}

void txt_adjustFont(uint elem_)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;

    elem->cursorDiv->ds.width=elem->chWidth;
    elem->cursorDiv->ds.height=elem->chHeight;

    nextPos=elem->head;
    while (nextPos!=0)
    {
        nextPos->data.ds.width=elem->chWidth;
        nextPos->data.ds.height=elem->chHeight;
        nextPos->data.chaContent=elem->chImgArray[(uint)nextPos->data.ch];
        nextPos=nextPos->next;
    }
    txt_adjustXY(elem_);
}

void txt_adjustColor(uint elem_)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;

    nextPos=elem->head;
    while (nextPos!=0)
    {
        nextPos->data.chColor=elem->txtColor;
        nextPos=nextPos->next;
    }
}

void txt_getStr(uint elem_, char* des)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;
    char* d=des;

    nextPos=elem->head;
    while (nextPos!=0)
    {
        *d=nextPos->data.ch;
        d++;
        nextPos=nextPos->next;
    }
    *d=0;
}

void txt_getTxtLen(uint elem_, int* des)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;
    int len=0;

    nextPos=elem->head;
    while (nextPos!=0)
    {
        len++;
        nextPos=nextPos->next;
    }
    *des=len;
}

uint txt_isChild(uint elem_, uint val)
{
    txt *elem=(txt*)elem_;
    txtContent* nextPos;

    nextPos=elem->head;
    while (nextPos!=0)
    {
        if (nextPos == (txtContent*)val)
            return 1;
        nextPos=nextPos->next;
    }
    return 0;
}

uint txt_setAttr(uint elem_, int attr, void *val)
{
    txt *elem=(txt*)elem_;
    int i,j,k,l;
    int qq,ww,ee,rr;
    uint u;

    switch (attr)
    {
    case GUIATTR_TXT_X:
        i=elem->ds.x;
        elem->ds.x=*((int*)val);

        qq=min(i,elem->ds.x);
        ww=elem->ds.y;
        ee=elem->ds.width+abs(elem->ds.x-i);
        rr=elem->ds.height;
        if (ee*rr<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,qq,ww,ee,rr);
            return 0;
        }

        reDraw_(elem->ds.parent,i,elem->ds.y,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_Y:
        j=elem->ds.y;
        elem->ds.y=*((int*)val);

        qq=elem->ds.x;
        ww=min(j,elem->ds.y);
        ee=elem->ds.width;
        rr=elem->ds.height+abs(elem->ds.y-j);
        if (ee*rr<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,qq,ww,ee,rr);
            return 0;
        }

        reDraw_(elem->ds.parent,elem->ds.x,j,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_INCX:
        i=elem->ds.x;
        elem->ds.x=(*((int*)val))+i;

        qq=min(i,elem->ds.x);
        ww=elem->ds.y;
        ee=elem->ds.width+abs(elem->ds.x-i);
        rr=elem->ds.height;
        if (ee*rr<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,qq,ww,ee,rr);
            return 0;
        }

        reDraw_(elem->ds.parent,i,elem->ds.y,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_INCY:
        j=elem->ds.y;
        elem->ds.y=(*((int*)val))+j;

        qq=elem->ds.x;
        ww=min(j,elem->ds.y);
        ee=elem->ds.width;
        rr=elem->ds.height+abs(elem->ds.y-j);
        if (ee*rr<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,qq,ww,ee,rr);
            return 0;
        }

        reDraw_(elem->ds.parent,elem->ds.x,j,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_WIDTH:
        if (*((uint*)val)<elem->chWidth)
            return -1;
        i=elem->ds.width;
        elem->ds.width=*((uint*)val);
        txt_adjustXY((uint)elem);
        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,i,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_HEIGHT:
        if (*((uint*)val)<elem->ds.height)
            return -1;
        elem->ds.height=*((uint*)val);
        return 0;
    case GUIATTR_TXT_INCW:
        if (*((int*)val)+(int)elem->ds.width<(int)elem->chWidth)
            return -1;
        i=elem->ds.width;
        elem->ds.width=(*((int*)val))+i;
        txt_adjustXY((uint)elem);
        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,i,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_INCH:
        if ((*((int*)val))<0)
            return -1;
        elem->ds.height=(*((int*)val))+elem->ds.height;
        return 0;
    case GUIATTR_TXT_FONT:
        i=initFont(val);
        return i;
    case GUIATTR_TXT_FONTIDX:
        i=*((uint*)val);
        if (i>=FONT_NUM) return -1;
        if (elem->ds.width<fontSize[i][0]) return -1;
        elem->chWidth=fontSize[i][0];
        elem->chHeight=fontSize[i][1];
        elem->chImgArray=fontArray[i];
        txt_adjustFont((uint)elem);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_STR:
        u=txt_setStr((uint)elem, (char*)val);
        return u;
    case GUIATTR_TXT_COLOR:
        elem->txtColor=*((color24*)val);
        txt_adjustColor((uint)elem);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_TXT_REFRESH:
        reDraw(elem->ds.parent);
        return 0;
    case GUIATTR_TXT_INCCURS:
        u=txt_incCursor((uint)elem);
        return u;
    case GUIATTR_TXT_DECCURS:
        u=txt_decCursor((uint)elem);
        return u;
    case GUIATTR_TXT_SETCURS:
        u=txt_setCursor((uint)elem, *(uint*)val);
        return u;
    case GUIATTR_TXT_INSERT:
        u=txt_insert((uint)elem, *(char*)val);
        return u;
    case GUIATTR_TXT_ISCHILD:
        u=txt_isChild((uint)elem, *(uint*)val);
        return u;
    case GUIATTR_TXT_INTEGRL:
        elem->ds.isIntegral=*(uchar*)val;
        return 0;
    case GUIATTR_TXT_XYWH:
        i=elem->ds.x;
        j=elem->ds.y;
        k=elem->ds.width;
        l=elem->ds.height;
        elem->ds.x=*((int*)val);
        elem->ds.y=*(((int*)val)+1);
        elem->ds.width=*(((uint*)val)+2);
        elem->ds.height=*(((uint*)val)+3);

        qq=min(i,elem->ds.x);
        ww=min(j,elem->ds.y);
        ee=elem->ds.width+abs(elem->ds.x-i);
        rr=elem->ds.height+abs(elem->ds.y-j);
        if (ee*rr<=k*l+elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,qq,ww,ee,rr);
            return 0;
        }

        reDraw_(elem->ds.parent,i,j,k,l);
        reDraw(&elem->ds);
        return 0;
    default:
        return -1;
    }
    return 0;
}
uint txt_getAttr(uint elem_, int attr, void *des)
{
    txt *elem=(txt*)elem_;
    uint i;

    switch (attr)
    {
    case GUIATTR_TXT_X:
        *((int*)des) = elem->ds.x;
        break;
    case GUIATTR_TXT_Y:
        *((int*)des) = elem->ds.y;
        break;
    case GUIATTR_TXT_WIDTH:
        *((uint*)des) = elem->ds.width;
        break;
    case GUIATTR_TXT_HEIGHT:
        *((uint*)des) = elem->ds.height;
        break;
    case GUIATTR_TXT_FONTIDX:
        for (i=0;i<FONT_NUM;i++)
            if (elem->chImgArray==fontArray[i])
            {
                *((uint*)des) = i;
                break;
            }
        break;
    case GUIATTR_TXT_STR:
        txt_getStr((uint)elem, (char*)des);
        break;
    case GUIATTR_TXT_COLOR:
        *((color24*)des) = elem->txtColor;
        break;
    case GUIATTR_TXT_BCKSPC:
        i=txt_bckspc((uint)elem, (char*)des);
        return i;
    case GUIATTR_TXT_DELETE:
        if (elem->cursor==(txtContent*)(uint)-1)
            return -1;
        txt_incCursor((uint)elem);
        i=txt_bckspc((uint)elem, (char*)des);
        return i;
    case GUIATTR_TXT_TXTLEN:
        txt_getTxtLen((uint)elem, (int*)des);
        break;
    default:
        return -1;
    }
    return 0;
}
