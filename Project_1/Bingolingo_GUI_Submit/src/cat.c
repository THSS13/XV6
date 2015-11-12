#include "types.h"
#include "stat.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"

char buf[512];

void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
    write(1, buf, n);
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
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
    uchar *p=malloc(size*4+2);
    uchar *q,*tp,*tq;
    p[0]=w;
    p[1]=h;
    if (picMode==1)
    {
        read(fd1, p+2, size*4);
    }
    else if (picMode==0)
    {
        q=malloc(size*3);
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

int
main(int argc, char *argv[])
{
  int fd, i;
  initprocessqueue();

  if(argc <= 1){
    cat(0);
    exit();
  }

//======test focus event and keyboard event demo

    contentStruct pic;
    int j;
    #define parh(x) (j=x,&j)
    uint huahua,rec;
    color32 cs;

    uchar *p=readImg("openfile.mx",1);

        createdom(GUIENT_IMG,0xffffffff,&huahua);
        setattr(GUIENT_IMG,huahua,GUIATTR_IMG_X,parh(-50));
        setattr(GUIENT_IMG,huahua,GUIATTR_IMG_Y,parh(50));
        setattr(GUIENT_IMG,huahua,GUIATTR_IMG_WIDTH,parh(320));
        setattr(GUIENT_IMG,huahua,GUIATTR_IMG_HEIGHT,parh(320));
        pic.pics=p;
        pic.isRepeat=1;
        setattr(GUIENT_IMG,huahua,GUIATTR_IMG_CONTENT,&pic);

        createdom(GUIENT_DIV,0xffffffff,&rec);
        setattr(GUIENT_DIV,rec,GUIATTR_DIV_X,parh(350));
        setattr(GUIENT_DIV,rec,GUIATTR_DIV_Y,parh(350));
        setattr(GUIENT_DIV,rec,GUIATTR_DIV_WIDTH,parh(320));
        setattr(GUIENT_DIV,rec,GUIATTR_DIV_HEIGHT,parh(320));
        cs.c.r=cs.c.g=cs.c.b=128;
        cs.a=128;
        setattr(GUIENT_DIV,rec,GUIATTR_DIV_BGCOLOR,&cs);

    int *msg = (int*)malloc(100);
    KBDMsg* km;
    FocusMsg* fm;

    while (1)
    {
        getmsgfromqueue(msg);
        printf(1,"%d\r\n",*msg);
        if (*msg==FOCUS_MESSAGE)
        {
            fm=(FocusMsg*)msg;
            if (fm->dom_id==rec)
            {
                cs.a=(fm->focus_or_not?0:128);
                setattr(GUIENT_DIV,rec,GUIATTR_DIV_BGCOLOR,&cs);
            }
        }
        else if (*msg==KEYBOARD_MESSAGE)
        {
            km=(KBDMsg*)msg;
            if (km->dom_id==rec)
            {
                cs.c.r=(uchar)km->key_value;
                cs.c.g=0xff-(uchar)km->key_value;
                cs.c.b=(uchar)km->key_value;
                setattr(GUIENT_DIV,rec,GUIATTR_DIV_BGCOLOR,&cs);
            }
        }
    }
//======

/*
//=======test mouse enter and leave event demo
    uint enter_leave1, enter_leave2;
    uint j;
    #define parh(x) (j=x,&j)
    color32 col_enter = rgba(255, 0, 0, 0);
    color32 col_leave = rgba(0, 255, 0, 0);
    createdom(GUIENT_DIV, 0xffffffff, &enter_leave1);
    createdom(GUIENT_DIV, 0xffffffff, &enter_leave2);
    setattr(GUIENT_DIV, enter_leave1, GUIATTR_DIV_X, parh(200));
    setattr(GUIENT_DIV, enter_leave1, GUIATTR_DIV_Y, parh(50));
    setattr(GUIENT_DIV, enter_leave1, GUIATTR_DIV_WIDTH, parh(100));
    setattr(GUIENT_DIV, enter_leave1, GUIATTR_DIV_HEIGHT, parh(100));
    setattr(GUIENT_DIV, enter_leave1, GUIATTR_DIV_BGCOLOR, &col_leave);
    setattr(GUIENT_DIV, enter_leave2, GUIATTR_DIV_X, parh(300));
    setattr(GUIENT_DIV, enter_leave2, GUIATTR_DIV_Y, parh(50));
    setattr(GUIENT_DIV, enter_leave2, GUIATTR_DIV_WIDTH, parh(100));
    setattr(GUIENT_DIV, enter_leave2, GUIATTR_DIV_HEIGHT, parh(100));
    setattr(GUIENT_DIV, enter_leave2, GUIATTR_DIV_BGCOLOR, &col_leave);

    int *msg = (int*)malloc(100);
    MouseMsg* mm;
    while(1)
    {
        getmsgfromqueue(msg);
        if (*msg == MOUSE_MESSAGE)
        {
            mm = (MouseMsg*)msg;
            if (mm->enter_or_leave == MOUSE_ENTER)
            {
                setattr(GUIENT_DIV, mm->dom_id, GUIATTR_DIV_BGCOLOR, &col_enter);
            }
            else if (mm->enter_or_leave == MOUSE_LEAVE)
            {
                setattr(GUIENT_DIV, mm->dom_id, GUIATTR_DIV_BGCOLOR, &col_leave);
            }
        }
    }
//========
*/
  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
    close(fd);
  }
 //====

 //===
 releaseprocessqueue();
  exit();
}
