#include "types.h"
#include "stat.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

uint windowParent = 0xffffffff;
uint windowDom;
uint txtDomId[2];
uint txtDomNum = 0;

uint j;
#define parh(x) (j=x,&j)
char* s;
#define pars(x) (s=x,s)
uchar uc;
#define paru(x) (uc=x,&uc)

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

int main(int argc, char *argv[])
{
    int fd;
    char* fnm;
    printf(1,"111/%d/", argc);
    if(argc != 2){
        if(argc == 1 && strcmp("picviewer", argv[0]))
        {
            fnm = "bitmap.mx";
        }
        else{
            printf(1, "picviewer: only allows 1 argument\r\n");
            exit();
        }
    }
    else
    {
        fnm = argv[1];
    }

    if (strcmp("picviewer", argv[0]) != 0)
        windowParent = cvtS2U(argv[0]);

    if((fd = open(fnm, 0)) < 0){
    	printf(1, "picviewer:cannot open %s\r\n", fnm);
    	exit();
    }

    initprocessqueue();
    //===========create window
    uint window;
        uint titleBar;
            uint appNameTxtFrame;
                uint appNameTxt;
            uint closeButton;
            uint titleTxtFrame;
                uint titleTxt;
        uint contentPicFrame;
            uint contentPic;

    color32 window_background = rgba(39, 40, 34, 0);
    color32 titleBar_color = rgba(77, 75, 69, 0);
    color32 appNameTxtFrame_color = rgba(20, 20, 20, 0);
    color24 appNameTxt_color = rgb(255, 255, 255);
    color32 closeButton_color = rgba(229, 94, 48, 0);
    color32 titleTxtFrame_color = rgba(255, 255, 255, 255);
    color24 titleTxt_color = rgb(204, 219, 205);
    color32 contentPicFrame_color = rgba(255, 255, 255, 255);
    //color24 contentPic_color = rgba(255, 255, 255, 0);//Is it necessary?

    createdom(GUIENT_DIV, windowParent, &window);
    setattr(GUIENT_DIV, window, GUIATTR_DIV_X, parh(0));
    setattr(GUIENT_DIV, window, GUIATTR_DIV_Y, parh(0));
    setattr(GUIENT_DIV, window, GUIATTR_DIV_WIDTH, parh(1024));
    setattr(GUIENT_DIV, window, GUIATTR_DIV_HEIGHT, parh(768));
    setattr(GUIENT_DIV, window, GUIATTR_DIV_BGCOLOR, &window_background);

        createdom(GUIENT_DIV, window, &titleBar);
        setattr(GUIENT_DIV, titleBar, GUIATTR_DIV_X, parh(0));
        setattr(GUIENT_DIV, titleBar, GUIATTR_DIV_Y, parh(0));
        setattr(GUIENT_DIV, titleBar, GUIATTR_DIV_WIDTH, parh(1024));
        setattr(GUIENT_DIV, titleBar, GUIATTR_DIV_HEIGHT, parh(30));
        setattr(GUIENT_DIV, titleBar, GUIATTR_DIV_BGCOLOR, &titleBar_color);

            createdom(GUIENT_DIV, titleBar, &appNameTxtFrame);
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_X, parh(0));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_Y, parh(0));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_WIDTH, parh(160));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_HEIGHT, parh(30));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_BGCOLOR, &appNameTxtFrame_color);

                createdom(GUIENT_TXT, appNameTxtFrame, &appNameTxt);    txtDomId[txtDomNum++]=appNameTxt;
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_X, parh(5));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_Y, parh(3));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_WIDTH, parh(150));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_STR, pars("PicViewer"));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_COLOR, &appNameTxt_color);

        createdom(GUIENT_DIV, titleBar, &closeButton);
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_X, parh(994));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_Y, parh(0));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_WIDTH, parh(30));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_HEIGHT, parh(30));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_BGCOLOR, &closeButton_color);

        createdom(GUIENT_DIV, titleBar, &titleTxtFrame);
        setattr(GUIENT_DIV, titleTxtFrame, GUIATTR_DIV_X, parh(250));
        setattr(GUIENT_DIV, titleTxtFrame, GUIATTR_DIV_Y, parh(3));
        setattr(GUIENT_DIV, titleTxtFrame, GUIATTR_DIV_WIDTH, parh(630));
        setattr(GUIENT_DIV, titleTxtFrame, GUIATTR_DIV_HEIGHT, parh(24));
        setattr(GUIENT_DIV, titleTxtFrame, GUIATTR_DIV_BGCOLOR, &titleTxtFrame_color);

            createdom(GUIENT_TXT, titleTxtFrame, &titleTxt);    txtDomId[txtDomNum++]=titleTxt;
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_X, parh(0));
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_Y, parh(0));
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_WIDTH, parh(630));
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_HEIGHT, parh(24));
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_STR, pars(fnm));
            setattr(GUIENT_TXT, titleTxt, GUIATTR_TXT_COLOR, &titleTxt_color);

        createdom(GUIENT_DIV, window, &contentPicFrame);
        setattr(GUIENT_DIV, contentPicFrame, GUIATTR_DIV_X, parh(10));
        setattr(GUIENT_DIV, contentPicFrame, GUIATTR_DIV_Y, parh(45));
        setattr(GUIENT_DIV, contentPicFrame, GUIATTR_DIV_WIDTH, parh(920));
        setattr(GUIENT_DIV, contentPicFrame, GUIATTR_DIV_HEIGHT, parh(720));
        setattr(GUIENT_DIV, contentPicFrame, GUIATTR_DIV_BGCOLOR, &contentPicFrame_color);

    contentStruct pic;
    uchar *p = readImg(fnm,1);
    uint w, h, pic_x, pic_y;
    w = p[0];
    h = p[1];
    pic_x = 512 - (w/2);
    pic_y = 369 - (h/2);
        createdom(GUIENT_IMG, contentPicFrame, &contentPic);
        setattr(GUIENT_IMG, contentPic, GUIATTR_IMG_X, parh(pic_x));
        setattr(GUIENT_IMG, contentPic, GUIATTR_IMG_Y, parh(pic_y));
        setattr(GUIENT_IMG, contentPic, GUIATTR_IMG_WIDTH, parh(w));
        setattr(GUIENT_IMG, contentPic, GUIATTR_IMG_HEIGHT, parh(h));
        pic.pics = p;
        pic.isRepeat = 1;
        setattr(GUIENT_IMG, contentPic, GUIATTR_IMG_CONTENT, &pic);

    //==============receive events
    int *msg = (int*)malloc(100);
    MouseMsg* mm;
    while(1)
    {
    	getmsgfromqueue(msg);
    	printf(1,"%d\r\n",*msg);
    	if (*msg == MOUSE_MESSAGE)
    	{
    		mm = (MouseMsg*)msg;
    		if ((mm->mouse_event_type & LEFT_BTN_UP) != 0 && mm->dom_id == closeButton)
    		{
    			break;
    		}
    	}
    }

    //=========release window
    int i;
    for(i = 0; i < txtDomNum; i++)
    {
    	releasedom(GUIENT_TXT, txtDomId[i]);
    }
    releasedom(GUIENT_IMG, contentPic);
    releasedom(GUIENT_DIV, window);


    releaseprocessqueue();
    exit();
}
