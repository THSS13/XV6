#include "types.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

uint anc,forks,txt,ct;
char* mstr="About us\n\n\n\nGraph user interface based on xv6.\nDevelopped by BingoLingo. \n    (Bao Yu, Wang Anqi, Levy, Zhong Yangxin)\n\nAll the source code is stored in Github\n    (git@github.com:publicres/xv6_gui.git)\nTo issue a bug, please contact us by email\n    (zly.george@163.com)\n\n\n\n\n\n\n\n2015/01/22";

int parher;
#define parh(x) (parher=x,&parher)

uint cvtS2U(char* str)
{
    uint ret=0;
    while (*str!=0)
    {
        ret=ret*10+(*str-'0');
        str++;
    }
    return ret;
}
uchar *readImg(char *fileName, uchar picMode)   //0:3channel,1:4channel
{
    int fd1 = open(fileName, 0);
    if (fd1 < 0)
    {
        printf(1, "open file error\n");
        return 0;
    }
    uchar w,h;
    read(fd1, &w, 1);
    read(fd1, &h, 1);
    int size=(uint)w*(uint)h,i;
    uchar *p=malloc(size*4+10);
    uchar *q,*tp,*tq;
    p[0]=w;
    p[1]=h;
    if (picMode==1)
    {
        read(fd1, p+2, size*4);
    }
    else if (picMode==0)
    {
        q=malloc(size*3+4);
        read(fd1, q, size*3);
        tp=p+2;
        tq=q;
        for (i=0;i<size;i++)
        {
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=0;
        }
        free(tq);
    }
    close(fd1);

    return p;
}
void initDom()
{
    color32 cl;
    uchar ca[10];
    contentStruct tcs;

    createdom(GUIENT_DIV,anc,&ct);
    setattr(GUIENT_DIV,ct,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,ct,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,ct,GUIATTR_DIV_WIDTH,parh(1024));
    setattr(GUIENT_DIV,ct,GUIATTR_DIV_HEIGHT,parh(768));
    cl=rgba(0,156,0,0);
    setattr(GUIENT_DIV,ct,GUIATTR_DIV_BGCOLOR,&cl);

    createdom(GUIENT_IMG,ct,&forks);
    setattr(GUIENT_IMG,forks,GUIATTR_IMG_X,parh(990));
    setattr(GUIENT_IMG,forks,GUIATTR_IMG_Y,parh(17));
    setattr(GUIENT_IMG,forks,GUIATTR_IMG_WIDTH,parh(17));
    setattr(GUIENT_IMG,forks,GUIATTR_IMG_HEIGHT,parh(17));
    tcs.isRepeat=0;
    tcs.pics=readImg("close.mx",1);
    setattr(GUIENT_IMG,forks,GUIATTR_IMG_CONTENT,&tcs);
    free(tcs.pics);

    createdom(GUIENT_TXT,ct,&(txt));
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_X,parh(100));
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_Y,parh(150));
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_WIDTH,parh(824));
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_HEIGHT,parh(24));
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_STR,mstr);
    ca[0]=ca[1]=ca[2]=0xff;
    setattr(GUIENT_TXT,txt,GUIATTR_TXT_COLOR,ca);
}
int main(int argc, char *argv[])
{
    if (argc<1)
        exit();
    anc=cvtS2U(argv[0]);
    initprocessqueue();
    initDom();
    int *msg = (int*)malloc(100);
    MouseMsg* km;
    while (1)
    {
        getmsgfromqueue(msg);
        if (*msg==MOUSE_MESSAGE)
        {
            km=(MouseMsg*)msg;
            if (km->mouse_event_type & LEFT_BTN_UP)
            {
                if (km->dom_id==forks)
                {
                    releasedom(GUIENT_IMG,forks);
                    releasedom(GUIENT_TXT,txt);
                    releasedom(GUIENT_DIV,ct);
                    releaseprocessqueue();
                    exit();
                }
            }
        }
    }
}
