#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "guientity_div.h"
#include "guientity_attrvalue.h"
#include "events.h"

//===========================================
#define min(x,y) (x<y?x:y)
#define max(x,y) (x>y?x:y)
#define abs(x) (x>=0?(x):(-(x)))
//===========================================
//==============================================
uchar drawDiv_trans(dom* elem, int x, int y, int w, int h);

uchar drawDiv(dom* elem, int x, int y, int w, int h)
{
    int i,j;
    div *ent=(div*)(elem->entity);
    int xs;
    int ys;

    if (ent->bgColor.a>0)
    {
        if (ent->bgColor.a==255)
            return 1;
        drawDiv_trans(elem,x,y,w,h);
        return 1;
    }

    xs=getABSposx(elem)+x;
    ys=getABSposy(elem)+y;
    for (j=0;j<h;j++)
    {
        for (i=0;i<w;i++)
            setPixelColor(xs+i,ys+j,ent->bgColor.c);
    }
    return 1;
}
uchar drawDiv_trans(dom* elem, int x, int y, int w, int h)
{
    int i,j;
    div *ent=(div*)(elem->entity);
    int xs=getABSposx(elem)+x;
    int ys=getABSposy(elem)+y;

    for (j=0;j<h;j++)
    {
        for (i=0;i<w;i++)
            setPixelColor(xs+i,ys+j,mingle(getPixelColor(xs+i,ys+j),ent->bgColor));
    }
    return 1;
}
uint div_createDom(int x, int y, int w, int h, uint parent, int pid)
{
    div *t;
    if((t = (div*)kalloc()) == 0)
    {
        panic("Bingolingo!");
        return 0;
    }
    memset((uchar*)(&(t->ds)),0,sizeof(dom));
    t->ds.x=x;
    t->ds.y=y;
    t->ds.width=w;
    t->ds.height=h;
    t->ds._id=(uint)t;
    t->ds.trans=255;
    t->bgColor.a=255;

    t->ds.entity=(void*)t;
    t->ds.onRender=drawDiv;
    t->ds.pid=pid;
    t->ds.onPoint=typicalPointEvent;
    t->ds.onFocus=typicalFocusEvent;
    t->ds.isIntegral=0;

    if (parent==0xffffffff)
        prepend(del,&t->ds);
    else
        prepend((dom*)parent,&t->ds);

    return (uint)t;
}

void div_release(uint elem_)
{
    div* elem=(div*)elem_;
    if (elem->ds.parent!=0)
        delete(&elem->ds);
    _cascade_release(&elem->ds);
}
uint div_changeBgcolor(uint elem_, color32 color)
{
    div* elem=(div*)elem_;
    elem->bgColor=color;
    elem->ds.trans=color.a;

    reDraw(&elem->ds);

    return (uint)elem;
}

void div_setXY(uint elem_, int x, int y)
{
    div *elem=(div*)elem_;
    int i,j;

    i=elem->ds.x;
    j=elem->ds.y;
    elem->ds.x=x;
    elem->ds.y=y;
    reDraw_(elem->ds.parent,i,j,elem->ds.width,elem->ds.height);
    reDraw(&elem->ds);
}

uint div_setAttr(uint elem_, int attr, void *val)
{
    div *elem=(div*)elem_;
    int i,j,k,l;
    int q,w,e,r;

    switch (attr)
    {
    case GUIATTR_DIV_X:
        i=elem->ds.x;
        elem->ds.x=*((int*)val);

        q=min(i,elem->ds.x);
        w=elem->ds.y;
        e=elem->ds.width+abs(elem->ds.x-i);
        r=elem->ds.height;
        if (e*r<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,q,w,e,r);
            return 0;
        }

        reDraw_(elem->ds.parent,i,elem->ds.y,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_DIV_Y:
        j=elem->ds.y;
        elem->ds.y=*((int*)val);

        q=elem->ds.x;
        w=min(j,elem->ds.y);
        e=elem->ds.width;
        r=elem->ds.height+abs(elem->ds.y-j);
        if (e*r<=2*elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,q,w,e,r);
            return 0;
        }

        reDraw_(elem->ds.parent,elem->ds.x,j,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_DIV_WIDTH:
        i=elem->ds.width;
        elem->ds.width=*((uint*)val);

        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,max(i,elem->ds.width),elem->ds.height);

        //reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,i,elem->ds.height);
        //reDraw(&elem->ds);
        return 0;
    case GUIATTR_DIV_HEIGHT:
        j=elem->ds.height;
        elem->ds.height=*((uint*)val);

        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,elem->ds.width,max(j,elem->ds.height));

        //reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,elem->ds.width,j);
        //reDraw(&elem->ds);
        return 0;
    case GUIATTR_DIV_BGCOLOR:
        elem->bgColor=*((color32*)val);
        elem->ds.trans=((color32*)val)->a;
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_DIV_REFRESH:
        reDraw(elem->ds.parent);
        return 0;
    case GUIATTR_DIV_INTEG:
        elem->ds.isIntegral=1-elem->ds.isIntegral;
        return 0;
    case GUIATTR_DIV_TOPPIFY:
        reJoin(&elem->ds);
        return 0;
	case GUIATTR_DIV_INTEGRL:
        elem->ds.isIntegral=*(uchar*)val;
		return 0;
    case GUIATTR_DIV_FOCUS:
        setABSFocus(&elem->ds);
        return 0;
    case GUIATTR_DIV_XYWH:
        i=elem->ds.x;
        j=elem->ds.y;
        k=elem->ds.width;
        l=elem->ds.height;
        elem->ds.x=*((int*)val);
        elem->ds.y=*(((int*)val)+1);
        elem->ds.width=*(((uint*)val)+2);
        elem->ds.height=*(((uint*)val)+3);

        q=min(i,elem->ds.x);
        w=min(j,elem->ds.y);
        e=elem->ds.width+abs(elem->ds.x-i);
        r=elem->ds.height+abs(elem->ds.y-j);
        if (e*r<=k*l+elem->ds.width*elem->ds.height)
        {
            reDraw_(elem->ds.parent,q,w,e,r);
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
uint div_getAttr(uint elem_, int attr, void *des)
{
    div* elem=(div*)elem_;

    switch (attr)
    {
    case GUIATTR_DIV_X:
        *((int*)des) = (elem->ds).x;
        break;
    case GUIATTR_DIV_Y:
        *((int*)des) = (elem->ds).y;
        break;
    case GUIATTR_DIV_WIDTH:
        *((int*)des) = (elem->ds).width;
        break;
    case GUIATTR_DIV_HEIGHT:
        *((int*)des) = (elem->ds).height;
        break;
    case GUIATTR_DIV_BGCOLOR:
        *((color32*)des)=elem->bgColor;
        break;
    default:
        return -1;
    }
    return 0;
}
