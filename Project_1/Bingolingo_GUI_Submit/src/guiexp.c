#include "types.h"
#include "defs.h"
#include "graphbase.h"
#include "guilayout.h"
#include "guientity.h"
#include "guiexp.h"
#include "ex_mem.h"

uint r,n;
uint hua[9],pr[4],s[9];

void tryOnce()
{
    uint i;

    r=div_createDom(0,0,WIDTH_RES,HEIGHT_RES,0xffffffff,-1);
    div_changeBgcolor(r,rgba(1,64,81,0));
    pr[0]=div_createDom(457,135,50,50,r,-1);
    div_changeBgcolor(pr[0],rgba(232,79,23,0));
    pr[1]=div_createDom(517,135,50,50,r,-1);
    div_changeBgcolor(pr[1],rgba(124,186,0,0));
    pr[2]=div_createDom(457,195,50,50,r,-1);
    div_changeBgcolor(pr[2],rgba(0,162,242,0));
    pr[3]=div_createDom(517,195,50,50,r,-1);
    div_changeBgcolor(pr[3],rgba(255,187,0,0));

    for (i=0;i<9;i++)
    {
        hua[i]=div_createDom(257+i*60,570,30,30,r,-1);
        div_changeBgcolor(hua[i],rgba(255,255,255,25*(9-i)));
        s[i]=25*(9-i);
    }
}
void toggleOn()
{
    uint i,j;
    for (i=0;i<9;i++)
    {
        for (j=1;j<=25;j++)
        {
            s[i]+=1;
            s[i]&=0xff;
            div_changeBgcolor(hua[i],rgba(255,255,255,s[i]));
        }
    }
}
void endToggle()
{
    uint i,j;
    for (j=0;j<255;j++)
        for (i=0;i<9;i++)
        {
            if (s[i]<255)
            {
                s[i]++;
                div_changeBgcolor(hua[i],rgba(255,255,255,s[i]));
            }
        }

    //div_release(r);
}
