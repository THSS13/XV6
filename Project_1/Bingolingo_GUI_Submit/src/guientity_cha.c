#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "ex_mem.h"
#include "guientity_cha.h"
#include "guientity_attrvalue.h"
#include "events.h"

//==============================================
uchar drawCha(dom* elem, int x, int y, int w, int h)
{
    int i,j;
    uchar picw,pich;
    uchar k;
    color24 cl;
    cha *ent=(cha*)(elem->entity);
    int xs=getABSposx(elem)+x;
    int ys=getABSposy(elem)+y;
    if (ent->chaContent==0)
        return 1;

    picw=elem->width;
    pich=elem->height;
    cl = ent->chColor;
    for (j=0;j<h;j++)
    {
        if (y+j>=pich) break;
        for (i=0;i<w;i++)
        {
            if (x+i>=picw) break;
            k=*(uchar*)(ent->chaContent+ ((y+j)%pich*picw+(x+i)%picw)*sizeof(uchar) );
            if (k==0)
                setPixelColor(xs+i,ys+j,cl);
            else if (k<255)
                setPixelColor(xs+i,ys+j,mingle(getPixelColor(xs+i,ys+j),rgba(cl.r,cl.g,cl.b,k)));
        }
    }

    return 1;
}
uint cha_createDom(cha* chaPtr, int x, int y, int w, int h, uint parent, int pid)
{
    memset((uchar*)(&(chaPtr->ds)),0,sizeof(dom));
    chaPtr->ds.x=x;
    chaPtr->ds.y=y;
    chaPtr->ds.width=w;
    chaPtr->ds.height=h;
    chaPtr->ds._id=(uint)chaPtr;
    chaPtr->ds.trans=255;

    chaPtr->ds.entity=(void*)chaPtr;
    chaPtr->ds.onRender=drawCha;
    chaPtr->ds.pid=pid;
    chaPtr->ds.onPoint=typicalPointEvent;
    chaPtr->ds.onFocus=typicalFocusEvent;
    chaPtr->ds.isIntegral=0;

    chaPtr->chaContent=0;
    chaPtr->chColor=rgb(0,255,0);
    chaPtr->ch=0;

    if (parent==0xffffffff)
        prepend(del,&chaPtr->ds);
    else
        prepend((dom*)parent,&chaPtr->ds);

    return (uint)chaPtr;
}
uint cha_createDomOrphan(cha* chaPtr, int x, int y, int w, int h, int pid)
{
    memset((uchar*)(&(chaPtr->ds)),0,sizeof(dom));
    chaPtr->ds.x=x;
    chaPtr->ds.y=y;
    chaPtr->ds.width=w;
    chaPtr->ds.height=h;
    chaPtr->ds._id=(uint)chaPtr;
    chaPtr->ds.trans=255;

    chaPtr->ds.entity=(void*)chaPtr;
    chaPtr->ds.onRender=drawCha;
    chaPtr->ds.pid=pid;
    chaPtr->ds.onPoint=typicalPointEvent;
    chaPtr->ds.onFocus=typicalFocusEvent;
    chaPtr->ds.isIntegral=0;

    chaPtr->chaContent=0;
    chaPtr->chColor=rgb(0,255,0);
    chaPtr->ch=0;

    return (uint)chaPtr;
}

uint cha_setColor(uint elem_, color24 color)
{
    cha* elem=(cha*)elem_;
    elem->chColor=color;

    reDraw(&elem->ds);

    return (uint)elem;
}

void cha_release(uint elem_)
{
    cha* elem=(cha*)elem_;
    cha_setContent(elem_,0,0);
    if (elem->ds.parent!=0)
        delete(&elem->ds);
}

void cha_setContent(uint elem, void* cont, char ch)
{
    cha* ent=(cha*)elem;

    ent->chaContent=cont;
    ent->ch=ch;

    reDraw(&ent->ds);
}

void cha_setContentNotRedraw(uint elem, void* cont, char ch)
{
    cha* ent=(cha*)elem;

    ent->chaContent=cont;
    ent->ch=ch;
}

uint cha_setAttr(uint elem_, int attr, void *val)
{
    cha *elem=(cha*)elem_;
    int i,j;

    switch (attr)
    {
    case GUIATTR_CHA_X:
        i=elem->ds.x;
        elem->ds.x=*((int*)val);
        reDraw_(elem->ds.parent,i,elem->ds.y,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_CHA_Y:
        j=elem->ds.y;
        elem->ds.y=*((int*)val);
        reDraw_(elem->ds.parent,elem->ds.x,j,elem->ds.width,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_CHA_WIDTH:
        i=elem->ds.width;
        elem->ds.width=*((int*)val);
        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,i,elem->ds.height);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_CHA_HEIGHT:
        j=elem->ds.height;
        elem->ds.height=*((int*)val);
        reDraw_(elem->ds.parent,elem->ds.x,elem->ds.y,elem->ds.width,j);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_CHA_COLOR:
        elem->chColor=*((color24*)val);
        reDraw(&elem->ds);
        return 0;
    case GUIATTR_CHA_REFRESH:
        reDraw(elem->ds.parent);
        return 0;
    default:
        return -1;
    }
    return 0;
}
uint cha_getAttr(uint elem_, int attr, void *des)
{
    cha *elem=(cha*)elem_;

    switch (attr)
    {
    case GUIATTR_CHA_X:
        *((int*)des) = elem->ds.x;
        break;
    case GUIATTR_CHA_Y:
        *((int*)des) = elem->ds.y;
        break;
    case GUIATTR_CHA_WIDTH:
        *((int*)des) = elem->ds.width;
        break;
    case GUIATTR_CHA_HEIGHT:
        *((int*)des) = elem->ds.height;
        break;
    case GUIATTR_CHA_CH:
        *((uchar*)des) = elem->ch;
        break;
    case GUIATTR_CHA_COLOR:
        *((color24*)des) = elem->chColor;
        break;
    default:
        return -1;
    }
    return 0;
}
