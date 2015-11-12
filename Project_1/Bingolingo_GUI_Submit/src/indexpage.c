#include "types.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

int parher;
uint superhome,home,hometext,homepic;
uint slider;
uint bgc;
uint maincont;
uint starttext;
#define parh(x) (parher=x,&parher)
#define ntile 10

typedef struct ori_tile
{
    uint x;
    uint y;
    uint h;
    uint w;
    color32 bgcolor;

    uint tx;
    uint ty;
    char *text;

    uint px;
    uint py;
    char* picname;
    uint ph;
    uint pw;

    uchar* pic;
    uint tid;
    uint xid;
    uint pid;

    uint openpid;
    uint opentile;
    uint openinnertile;
    uint openpictile;
    uint openanc;
    char* execName;
} tile;
tile* ts;

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
tile* initTiles()
{
    int i;
    contentStruct tcs;
    uchar ca[3]={0xff,0xff,0xff};
    tile* p=malloc(sizeof(tile)*ntile);
    (p+0)->x=187; (p+0)->y=224; (p+0)->w=210; (p+0)->h=100; (p+0)->bgcolor=rgba(217,81,43,0);
    (p+0)->px=80; (p+0)->py=17; (p+0)->picname="search.mx";
    (p+0)->text="File";
    (p+0)->execName="guifilesystem";

    (p+1)->x=407; (p+1)->y=224; (p+1)->w=210; (p+1)->h=100; (p+1)->bgcolor=rgba(43,127,237,0);
    (p+1)->px=80; (p+1)->py=17; (p+1)->picname="filetext2.mx";
    (p+1)->text="Text";
    (p+1)->execName="fileEditor";

    (p+2)->x=627; (p+2)->y=224; (p+2)->w=210; (p+2)->h=100; (p+2)->bgcolor=rgba(184,28,67,0);
    (p+2)->px=80; (p+2)->py=17; (p+2)->picname="image.mx";
    (p+2)->text="Image";
    (p+2)->execName="picviewer";

    (p+3)->x=187; (p+3)->y=334; (p+3)->w=210; (p+3)->h=100; (p+3)->bgcolor=rgba(95,60,186,0);
    (p+3)->px=80; (p+3)->py=17; (p+3)->picname="bug.mx";
    (p+3)->text="Minesweeper";
    (p+3)->execName="minesweeper";

    (p+4)->x=407; (p+4)->y=334; (p+4)->w=210; (p+4)->h=100; (p+4)->bgcolor=rgba(0,156,0,0);
    (p+4)->px=80; (p+4)->py=17; (p+4)->picname="users.mx";
    (p+4)->text="About";
    (p+4)->execName="aboutus";

    (p+5)->x=627; (p+5)->y=334; (p+5)->w=100; (p+5)->h=100; (p+5)->bgcolor=rgba(42,127,237,0);
    (p+5)->px=25; (p+5)->py=17; (p+5)->picname="hp.mx";
    (p+5)->text="Music";
    (p+5)->execName="undefined";

    (p+6)->x=737; (p+6)->y=334; (p+6)->w=100; (p+6)->h=100; (p+6)->bgcolor=rgba(95,60,186,0);
    (p+6)->px=25; (p+6)->py=17; (p+6)->picname="cog.mx";
    (p+6)->text="Set";
    (p+6)->execName="undefined";

    (p+7)->x=187; (p+7)->y=444; (p+7)->w=210; (p+7)->h=100; (p+7)->bgcolor=rgba(43,127,237,0);
    (p+7)->px=80; (p+7)->py=17; (p+7)->picname="bubble2.mx";
    (p+7)->text="ReadMe";
    (p+7)->execName="readmegui";

    (p+8)->x=407; (p+8)->y=444; (p+8)->w=100; (p+8)->h=100; (p+8)->bgcolor=rgba(184,28,67,0);
    (p+8)->px=25; (p+8)->py=17; (p+8)->picname="alarm.mx";
    (p+8)->text="Clock";
    (p+8)->execName="undefined";

    (p+9)->x=517; (p+9)->y=444; (p+9)->w=100; (p+9)->h=100; (p+9)->bgcolor=rgba(155,37,163,0);
    (p+9)->px=25; (p+9)->py=17; (p+9)->picname="switch.mx";
    (p+9)->text="Shut";
    (p+9)->execName="undefined";

    for (i=0;i<ntile;i++)
    {
        (p+i)->tx=5;
        (p+i)->ty=73;
        (p+i)->pw=56;
        (p+i)->ph=50;
        (p+i)->pic=readImg((p+i)->picname,1);
        (p+i)->openpid=0;
        (p+i)->opentile=0;
    }

    for (i=0;i<ntile;i++)
    {
        createdom(GUIENT_DIV,maincont,&((p+i)->tid));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_X,&((p+i)->x));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_Y,&((p+i)->y));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_WIDTH,&((p+i)->w));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_HEIGHT,&((p+i)->h));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_BGCOLOR,&((p+i)->bgcolor));
        setattr(GUIENT_DIV,(p+i)->tid,GUIATTR_DIV_INTEG,0);

        createdom(GUIENT_IMG,(p+i)->tid,&((p+i)->pid));
        setattr(GUIENT_IMG,(p+i)->pid,GUIATTR_IMG_X,&((p+i)->px));
        setattr(GUIENT_IMG,(p+i)->pid,GUIATTR_IMG_Y,&((p+i)->py));
        setattr(GUIENT_IMG,(p+i)->pid,GUIATTR_IMG_WIDTH,&((p+i)->pw));
        setattr(GUIENT_IMG,(p+i)->pid,GUIATTR_IMG_HEIGHT,&((p+i)->ph));
        tcs.isRepeat=0;
        tcs.pics=(p+i)->pic;
        setattr(GUIENT_IMG,(p+i)->pid,GUIATTR_IMG_CONTENT,&tcs);
        free(tcs.pics);

        createdom(GUIENT_TXT,(p+i)->tid,&((p+i)->xid));
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_X,&((p+i)->tx));
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_Y,&((p+i)->ty));
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_WIDTH,&((p+i)->w));
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_HEIGHT,parh(24));
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_STR,(p+i)->text);
        setattr(GUIENT_TXT,(p+i)->xid,GUIATTR_TXT_COLOR,ca);
    }

    return p;
}
void setupGUI()
{
    color32 cl;
    uchar ca[10];
    contentStruct tcs;

    createdom(GUIENT_DIV,0xffffffff,&bgc);
    setattr(GUIENT_DIV,bgc,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,bgc,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,bgc,GUIATTR_DIV_WIDTH,parh(1024));
    setattr(GUIENT_DIV,bgc,GUIATTR_DIV_HEIGHT,parh(768));
    cl=rgba(1,64,81,0);
    setattr(GUIENT_DIV,bgc,GUIATTR_DIV_BGCOLOR,&cl);

    createdom(GUIENT_DIV,0xffffffff,&superhome);
    setattr(GUIENT_DIV,superhome,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,superhome,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,superhome,GUIATTR_DIV_WIDTH,parh(15));
    setattr(GUIENT_DIV,superhome,GUIATTR_DIV_HEIGHT,parh(15));

    createdom(GUIENT_DIV,0xffffffff,&slider);
    setattr(GUIENT_DIV,slider,GUIATTR_DIV_X,parh(-200));
    setattr(GUIENT_DIV,slider,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,slider,GUIATTR_DIV_WIDTH,parh(200));
    setattr(GUIENT_DIV,slider,GUIATTR_DIV_HEIGHT,parh(768));
    cl=rgba(0,0,0,55);
    setattr(GUIENT_DIV,slider,GUIATTR_DIV_BGCOLOR,&cl);

    createdom(GUIENT_DIV,slider,&home);
    setattr(GUIENT_DIV,home,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,home,GUIATTR_DIV_Y,parh(698));
    setattr(GUIENT_DIV,home,GUIATTR_DIV_WIDTH,parh(200));
    setattr(GUIENT_DIV,home,GUIATTR_DIV_HEIGHT,parh(70));
    setattr(GUIENT_DIV,home,GUIATTR_DIV_INTEG,0);

    createdom(GUIENT_TXT,home,&hometext);
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_X,parh(70));
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_Y,parh(12));
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_WIDTH,parh(200));
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_HEIGHT,parh(50));
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_STR,"Back to \nHOME");
    ca[0]=ca[1]=ca[2]=0xA0;
    setattr(GUIENT_TXT,hometext,GUIATTR_TXT_COLOR,ca);

    createdom(GUIENT_IMG,home,&homepic);
    setattr(GUIENT_IMG,homepic,GUIATTR_IMG_X,parh(14));
    setattr(GUIENT_IMG,homepic,GUIATTR_IMG_Y,parh(14));
    setattr(GUIENT_IMG,homepic,GUIATTR_IMG_WIDTH,parh(42));
    setattr(GUIENT_IMG,homepic,GUIATTR_IMG_HEIGHT,parh(42));
    tcs.isRepeat=0;
    tcs.pics=readImg("home.mx",1);
    setattr(GUIENT_IMG,homepic,GUIATTR_IMG_CONTENT,&tcs);

    createdom(GUIENT_DIV,bgc,&maincont);
    setattr(GUIENT_DIV,maincont,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,maincont,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,maincont,GUIATTR_DIV_WIDTH,parh(1024));
    setattr(GUIENT_DIV,maincont,GUIATTR_DIV_HEIGHT,parh(768));
    cl=rgba(1,64,81,0);
    setattr(GUIENT_DIV,maincont,GUIATTR_DIV_BGCOLOR,&cl);

    ts=initTiles();

    createdom(GUIENT_TXT,maincont,&starttext);
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_X,parh(187));
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_Y,parh(119));
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_WIDTH,parh(300));
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_HEIGHT,parh(24));
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_STR,"Start");
    ca[0]=ca[1]=ca[2]=0xff;
    setattr(GUIENT_TXT,starttext,GUIATTR_TXT_COLOR,ca);
}
void initAll()
{
    initprocessqueue();
    setupGUI();
}
void killAll()
{
    releaseprocessqueue();
    exit();
}
//==================taskbar=======================
//================================================
void buildTaskBar()
{
    uint i,j=0;
    for (i=0;i<ntile;i++)
    {
        if ((ts+i)->opentile>0)
        {
            setattr(GUIENT_DIV,(ts+i)->opentile,GUIATTR_DIV_Y,parh((100*j)));
            j++;
        }
        if (100*j+100>=698)
            break;
    }
}
void addTaskBar(int tid)
{
    tile* th=ts+tid;
    contentStruct tcs;

    createdom(GUIENT_DIV,slider,&(th->opentile));
    setattr(GUIENT_DIV,th->opentile,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,th->opentile,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,th->opentile,GUIATTR_DIV_WIDTH,parh(200));
    setattr(GUIENT_DIV,th->opentile,GUIATTR_DIV_HEIGHT,parh(100));
    setattr(GUIENT_DIV,th->opentile,GUIATTR_DIV_INTEG,0);

    createdom(GUIENT_DIV,th->opentile,&(th->openinnertile));
    setattr(GUIENT_DIV,th->openinnertile,GUIATTR_DIV_X,parh(10));
    setattr(GUIENT_DIV,th->openinnertile,GUIATTR_DIV_Y,parh(5));
    setattr(GUIENT_DIV,th->openinnertile,GUIATTR_DIV_WIDTH,parh(180));
    setattr(GUIENT_DIV,th->openinnertile,GUIATTR_DIV_HEIGHT,parh(90));
    setattr(GUIENT_DIV,th->openinnertile,GUIATTR_DIV_BGCOLOR,&(th->bgcolor));

    createdom(GUIENT_IMG,th->openinnertile,&(th->openpictile));
    setattr(GUIENT_IMG,th->openpictile,GUIATTR_IMG_X,parh(65));
    setattr(GUIENT_IMG,th->openpictile,GUIATTR_IMG_Y,parh(20));
    setattr(GUIENT_IMG,th->openpictile,GUIATTR_IMG_WIDTH,parh(56));
    setattr(GUIENT_IMG,th->openpictile,GUIATTR_IMG_HEIGHT,parh(50));
    tcs.isRepeat=0;
    tcs.pics=th->pic;
    setattr(GUIENT_IMG,th->openpictile,GUIATTR_IMG_CONTENT,&tcs);

    buildTaskBar();
}
void delTaskBar(int tid)
{
    tile* th=ts+tid;

    releasedom(GUIENT_IMG,th->openpictile);
    releasedom(GUIENT_DIV,th->opentile);
    th->opentile=0;

    buildTaskBar();
}
//==================procswitch====================
//================================================
void expireProgram(int pid)
{
    int i;
    for (i=0;i<ntile;i++)
    {
        if ((ts+i)->opentile>0 && (ts+i)->openpid==pid)
        {
            releasedom(GUIENT_DIV,(ts+i)->openanc);
            delTaskBar(i);
            (ts+i)->openpid=
                (ts+i)->opentile=
                (ts+i)->openinnertile=
                (ts+i)->openpictile=
                (ts+i)->openanc=0;
            return;
        }
    }
}
void setupProgram(int tid)
{
    uint pd;
    tile* th=ts+tid;
    char *demoARGC[2];
    uint tp,id;
    char cb[13];
    char acb[13];

    createdom(GUIENT_DIV,bgc,&(th->openanc));
    setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_X,parh(0));
    setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_Y,parh(0));
    setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_WIDTH,parh(1024));
    setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_HEIGHT,parh(768));

    id=0;
    tp=th->openanc;
    while (tp>0)
    {
        cb[++id]=tp%10+'0';
        tp/=10;
    }
    for (tp=1;tp<=id;tp++)
        acb[id-tp]=cb[tp];
    acb[id]=0;

    demoARGC[1]=0;
    demoARGC[0]=acb;
    //printf(0,"%s 0x%x\n",bgStr,bgc);

    if ((pd=fork())==0)
    {
        exec(th->execName,demoARGC);
        //NO RETURN!
    }
    th->openpid=pd;
}
void switchTo(int tid)
{
    tile* th=ts+tid;
    if (th->opentile>0)
    {
        setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_TOPPIFY,0);
    }
    else
    {
        if (th->openpid==0)
            setupProgram(tid);
        addTaskBar(tid);
        buildTaskBar();
    }
}
void callByName(char* actName, char *arg)
{
    int i;
    uint pd;
    tile* th;
    char *demoARGC[3];
    uint tp,id;
    char cb[13];
    char acb[13];

    for (i=0;i<ntile;i++)
    {
        if (strcmp(actName,(ts+i)->execName)==0) //HAVE NOT TEST YET !
        {
            th=ts+i;
            if (th->openpid==0)
            {
                createdom(GUIENT_DIV,bgc,&(th->openanc));
                setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_X,parh(0));
                setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_Y,parh(0));
                setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_WIDTH,parh(1024));
                setattr(GUIENT_DIV,th->openanc,GUIATTR_DIV_HEIGHT,parh(768));

                id=0;
                tp=th->openanc;
                while (tp>0)
                {
                    cb[++id]=tp%10+'0';
                    tp/=10;
                }
                for (tp=1;tp<=id;tp++)
                    acb[id-tp]=cb[tp];
                acb[id]=0;

                demoARGC[2]=0;
                demoARGC[1]=arg;
                demoARGC[0]=acb;
                //printf(0,"%s 0x%x\n",bgStr,bgc);

                if ((pd=fork())==0)
                {
                    exec(th->execName,demoARGC);
                    //NO RETURN!
                }
                th->openpid=pd;
            }
            switchTo(i);
            return;
        }
    }
}
//==================event=========================
//================================================
void OnMouseIn(uint domID)
{
    uint i;
    color32 p;
    if (domID==superhome)
    {
        setattr(GUIENT_DIV,slider,GUIATTR_DIV_FOCUS,0);
        setattr(GUIENT_DIV,slider,GUIATTR_DIV_X,parh(0));
        return;
    }
    if (domID==home)
    {
        p.a=0;
        p.c.r=p.c.g=p.c.b=0x80;
        setattr(GUIENT_DIV,home,GUIATTR_DIV_BGCOLOR,&p);
        return;
    }
    for (i=0;i<ntile;i++)
    {
        if ((ts+i)->tid==domID)
        {
            p.c=((ts+i)->bgcolor.c);
            p.a=0;
            p.c.r=p.c.r<225?p.c.r+30:0xff;
            p.c.g=p.c.g<225?p.c.g+30:0xff;
            p.c.b=p.c.b<225?p.c.b+30:0xff;
            setattr(GUIENT_DIV,(ts+i)->tid,GUIATTR_DIV_BGCOLOR,&p);
            return;
        }
        if ((ts+i)->opentile==domID)
        {
            p=rgba(255,255,0,20);
            setattr(GUIENT_DIV,(ts+i)->opentile,GUIATTR_DIV_BGCOLOR,&p);
            return;
        }
    }
}
void OnMouseOut(uint domID)
{
    uint i;
    color32 p;
    if (domID==home)
    {
        p.a=255;
        p.c.r=p.c.g=p.c.b=0x80;
        setattr(GUIENT_DIV,home,GUIATTR_DIV_BGCOLOR,&p);
        return;
    }
    for (i=0;i<ntile;i++)
    {
        if ((ts+i)->tid==domID)
        {
            setattr(GUIENT_DIV,(ts+i)->tid,GUIATTR_DIV_BGCOLOR,&((ts+i)->bgcolor));
            return;
        }
        if ((ts+i)->opentile==domID)
        {
            p=rgba(0,0,0,255);
            setattr(GUIENT_DIV,(ts+i)->opentile,GUIATTR_DIV_BGCOLOR,&p);
            return;
        }
    }
}
void OnBlur(uint domID)
{
    if (domID==slider)
    {
        setattr(GUIENT_DIV,slider,GUIATTR_DIV_X,parh(-200));
        return;
    }
}
void OnClick(uint domID)
{
    int i;
    for (i=0;i<ntile;i++)
        if ((ts+i)->tid==domID || (ts+i)->opentile==domID)
        {
            switchTo(i);
            return;
        }
    if (domID==home)
    {
        setattr(GUIENT_DIV,maincont,GUIATTR_DIV_TOPPIFY,0);
        return;
    }
}
//==================main=========================
//================================================
int main(int argc, char *argv[])
{
    initAll();
    int *msg = (int*)malloc(100);
    int pd;
    MouseMsg* km;
    FocusMsg* fm;
    CallMsg* cm;
    while (1)
    {
        if ((pd=asynwait())>0)
            expireProgram(pd);
        getmsgfromqueue(msg);
        if (*msg==MOUSE_MESSAGE)
        {
            km=(MouseMsg*)msg;
            if (km->enter_or_leave==MOUSE_ENTER)
                OnMouseIn(km->dom_id);
            else if (km->enter_or_leave==MOUSE_LEAVE)
                OnMouseOut(km->dom_id);
            else if (km->mouse_event_type & LEFT_BTN_UP)
                OnClick(km->dom_id);
        }
        else if (*msg==FOCUS_MESSAGE)
        {
            fm=(FocusMsg*)msg;
            if (fm->focus_or_not==0)
                OnBlur(fm->dom_id);
        }
        else if (*msg==CALL_MESSAGE)
        {
            cm=(CallMsg*)msg;
            printf(1,"sniff!%s,%s\n",cm->call_process_name,cm->file_path);
            callByName(cm->call_process_name,cm->file_path);
        }
    }
}
