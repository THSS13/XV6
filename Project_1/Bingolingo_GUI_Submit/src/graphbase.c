#include "types.h"
#include "defs.h"
#include "memlayout.h"
#include "graphbase.h"

uchar *_base;
uchar base[3*1024*768];

void sync(uint x,uint y,uint w,uint h)
{
    uint i;
    uchar *src=base+(y*WIDTH_RES+x)*3;
    uchar *des=_base+(y*WIDTH_RES+x)*3;
    uint delta=w*3;
    uint offset=WIDTH_RES*3;
    for (i=0;i<h;i++)
    {
        memmove(des,src,delta);
        src+=offset;
        des+=offset;
    }
}
void initGraphMode()
{
    uint GraphicMem=KERNBASE+0x1028;
    uint baseAdd=*((uint*)GraphicMem);
    _base=(uchar*)baseAdd;
    WIDTH_RES =*((ushort*)(KERNBASE+0x1012));
    HEIGHT_RES =*((ushort*)(KERNBASE+0x1014));
    memset(base,0,sizeof(base));

    cprintf("@Resolution Width: %d\n", WIDTH_RES);
    cprintf("@Resolution Height:  %d\n", HEIGHT_RES);
    cprintf("@Bits per pixel:    %d\n",*((uchar*)(KERNBASE+0x1019)));

    cprintf("@Video card drivers initialized successfully.\n");
}

void setPixelColor(uint x, uint y,color24 color)
{
    uint pos=(y*WIDTH_RES+x)*3;
    color24* add=(color24*)(base+pos);
    *add=color;
}
color24 getPixelColor(uint x, uint y)
{
    uint pos=(y*WIDTH_RES+x)*3;
    color24* add=(color24*)(base+pos);
    return *add;
}
void setRangeColor(color24 *src, uint len, uint x, uint y)
{
    uint pos=(y*WIDTH_RES+x)*3;
    color24* add=(color24*)(base+pos);
    memmove(add,src,len*3);
}

color24 rgb(uchar r,uchar g,uchar b)
{
    color24 t;
    t.r=r;
    t.g=g;
    t.b=b;
    return t;
}
color32 rgba(uchar r, uchar g, uchar b, uchar a)
{
    color32 t;
    t.c=rgb(r,g,b);
    t.a=a;
    return t;
}
color24 mingle(color24 c1, color32 c2)
{
    color24 t;
    uint op=255-(uint)c2.a;
    t.r=(uchar)(((uint)c2.c.r*op+(uint)c1.r*(255-op))/255);
    t.g=(uchar)(((uint)c2.c.g*op+(uint)c1.g*(255-op))/255);
    t.b=(uchar)(((uint)c2.c.b*op+(uint)c1.b*(255-op))/255);

    return t;
}
