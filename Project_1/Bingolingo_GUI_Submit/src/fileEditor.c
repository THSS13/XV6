#include "types.h"
#include "stat.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

uint windowParent = 0xffffffff;
uint windowDom;
uint txtDomId[20];
uint txtDomNum = 0;

uint j;
#define parh(x) (j=x,&j)
char* s;
#define pars(x) (s=x,s)
uchar uc;
#define paru(x) (uc=x,&uc)

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

void releaseTxtDom()
{
    int i;
    for (i = 0; i < txtDomNum; i++)
        releasedom(GUIENT_TXT, txtDomId[i]);
}

char* readFileTxt(int fd)
{
  int n;
  // int i;
  char* str=(char*)malloc(1024*80);

  memset(str, 0, 1024*80);
  n = read(fd, str, 1024*80);
  // for (i =0; i < n; i++)
  //   if (str[i]==0)
  //   {
  //       printf(1, "fileEditor: file contains \\0, refuse to open\r\n");
  //       free(str);
  //       releaseTxtDom();
  //       releasedom(GUIENT_DIV, windowDom);
  //       exit();
  //   }
  if(n < 0){
    printf(1, "fileEditor: read error\r\n");
    free(str);
    releaseTxtDom();
    releasedom(GUIENT_DIV, windowDom);
    exit();
  }
  return str;
}

int saveButton_onClick(char* fileName, char* str, uint contentTxt)
{
    int fd;
    int len;
    int n;

    if (unlink(fileName) < 0)
    {
        printf(1, "fileEditor: cannot remove old file \"%s\" while saving\r\n", fileName);
        return -1;
    }
    if((fd = open(fileName, 0x200)) < 0){
        printf(1, "fileEditor: cannot create new file \"%s\" while saving\r\n", fileName);
        return -1;
    }
    close(fd);
    if((fd = open(fileName, 1)) < 0){
        printf(1, "fileEditor: cannot open new file \"%s\" while saving\r\n", fileName);
        return -1;
    }
    getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_TXTLEN, &len);
    getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_STR, str);

    n = write(fd, str, len);
    if (n < 0)
    {
        printf(1, "fileEditor: save error\r\n");
        return -1;
    }
    close(fd);
    return 0;
}

void upButton_onClick(uint contentTxt)
{
    int y;
    int top = 0;

    getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    if (y == top)
        return;
    y += 72;
    if (y > top)
        y = top;
    setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
}

void downButton_onClick(uint contentTxt)
{
    int y;
    int h;
    int bottom = 720;

    getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_HEIGHT, &h);
    if (y + h <= bottom)
        return;
    y -= 72;
    if (y + h < bottom)
        y = bottom - h;
    setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
}

int main(int argc, char *argv[])
{
    int fd;
    char* str;
    char* fnm;

    if(argc != 2){
        if (argc==1 && strcmp("fileEditor", argv[0]))
        {
            fnm="guide.txt";
        }
        else
        {
            printf(1, "fileEditor: only allows 1 argument\r\n");
            exit();
        }
    }
    else
        fnm=argv[1];

    if((fd = open(fnm, 0)) < 0){
        printf(1, "fileEditor: cannot open %s\r\n", fnm);
        exit();
    }

    if (strcmp("fileEditor", argv[0]) != 0)
        windowParent = cvtS2U(argv[0]);

    initprocessqueue();
    //===========create window
    uint window;
        uint titleBar;
            uint appNameTxtFrame;
                uint appNameTxt;
            uint closeButton;
            uint titleTxtFrame;
                uint titleTxt;
        uint toolBar;
            uint saveButton;
                uint saveTxt;
            uint upButton;
                uint upTxt;
            uint downButton;
                uint downTxt;
        uint contentTxtFame;
            uint contentTxt;
        uint affirmMask;
            uint affrimDialog;
                uint saveAndCloseButton;
                    uint saveAndCloseTxt;
                uint justCloseButton;
                    uint justCloseTxt;
                uint cancelButton;
                    uint cancelTxt;
                uint affirmTxt;

    color32 window_background = rgba(39, 40, 34, 0);
    color32 titleBar_color = rgba(77, 75, 69, 0);
    color32 appNameTxtFrame_color = rgba(20, 20, 20, 0);
    color24 appNameTxt_color = rgb(255, 255, 255);
    color32 closeButton_color = rgba(229, 94, 48, 0);
    color32 titleTxtFrame_color = rgba(255, 255, 255, 255);
    color24 titleTxt_color = rgb(204, 219, 205);
    color32 toolBar_color = rgba(99, 99, 99, 0);
    color32 saveButton_color = rgba(200, 220, 90, 0);
    color24 saveTxt_color = rgb(240, 255, 240);
    color32 upButton_color = rgba(255, 255, 255, 0);
    color24 upTxt_color = rgb(1, 1, 1);
    color32 downButton_color = rgba(255, 255, 255, 0);
    color24 downTxt_color = rgb(1, 1, 1);
    color32 contentTxtFame_color = rgba(255, 255, 255, 255);
    color24 contentTxt_color = rgb(248, 248, 242);
    color32 affirmMask_color = rgba(1, 1, 1, 255);
    color32 affrimDialog_color = rgba(208, 206, 206, 0);
    color32 saveAndCloseButton_color = rgba(0, 128, 0, 0);
    color24 saveAndCloseTxt_color = rgb(255, 255, 255);
    color32 justCloseButton_color = rgba(229, 94, 48, 0);
    color24 justCloseTxt_color = rgb(255, 255, 255);
    color32 cancelButton_color = rgba(255, 255, 255, 0);
    color24 cancelTxt_color = rgb(39, 40, 34);
    color24 affirmTxt_color = rgb(39, 40, 34);

    color24 saving_color = rgb(255, 127, 39);
    color24 unsaved_color = rgb(255, 0, 0);


    createdom(GUIENT_DIV, windowParent, &window);   windowDom=window;
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
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_STR, pars("FileEditor"));
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

        createdom(GUIENT_DIV, window, &toolBar);
        setattr(GUIENT_DIV, toolBar, GUIATTR_DIV_X, parh(934));
        setattr(GUIENT_DIV, toolBar, GUIATTR_DIV_Y, parh(30));
        setattr(GUIENT_DIV, toolBar, GUIATTR_DIV_WIDTH, parh(90));
        setattr(GUIENT_DIV, toolBar, GUIATTR_DIV_HEIGHT, parh(738));
        setattr(GUIENT_DIV, toolBar, GUIATTR_DIV_BGCOLOR, &toolBar_color);

            createdom(GUIENT_DIV, toolBar, &saveButton);
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_X, parh(10));
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_Y, parh(100));
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_WIDTH, parh(70));
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_HEIGHT, parh(40));
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_BGCOLOR, &saveButton_color);
            setattr(GUIENT_DIV, saveButton, GUIATTR_DIV_INTEGRL, paru(1));

                createdom(GUIENT_TXT, saveButton, &saveTxt);    txtDomId[txtDomNum++]=saveTxt;
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_X, parh(5));
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_Y, parh(8));
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_WIDTH, parh(60));
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_STR, pars("Save"));
                setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &saveTxt_color);

            createdom(GUIENT_DIV, toolBar, &upButton);
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_X, parh(15));
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_Y, parh(239));
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_WIDTH, parh(60));
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_HEIGHT, parh(60));
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_BGCOLOR, &upButton_color);
            setattr(GUIENT_DIV, upButton, GUIATTR_DIV_INTEGRL, paru(1));

                createdom(GUIENT_TXT, upButton, &upTxt);    txtDomId[txtDomNum++]=upTxt;
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_X, parh(15));
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_Y, parh(18));
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_WIDTH, parh(30));
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_STR, pars("Up"));
                setattr(GUIENT_TXT, upTxt, GUIATTR_TXT_COLOR, &upTxt_color);

            createdom(GUIENT_DIV, toolBar, &downButton);
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_X, parh(15));
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_Y, parh(379));
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_WIDTH, parh(60));
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_HEIGHT, parh(60));
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_BGCOLOR, &downButton_color);
            setattr(GUIENT_DIV, downButton, GUIATTR_DIV_INTEGRL, paru(1));

                createdom(GUIENT_TXT, downButton, &downTxt);    txtDomId[txtDomNum++]=downTxt;
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_X, parh(15));
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_Y, parh(18));
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_WIDTH, parh(30));
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_STR, pars("Dn"));
                setattr(GUIENT_TXT, downTxt, GUIATTR_TXT_COLOR, &downTxt_color);

        createdom(GUIENT_DIV, window, &contentTxtFame);
        setattr(GUIENT_DIV, contentTxtFame, GUIATTR_DIV_X, parh(10));
        setattr(GUIENT_DIV, contentTxtFame, GUIATTR_DIV_Y, parh(45));
        setattr(GUIENT_DIV, contentTxtFame, GUIATTR_DIV_WIDTH, parh(920));
        setattr(GUIENT_DIV, contentTxtFame, GUIATTR_DIV_HEIGHT, parh(720));
        setattr(GUIENT_DIV, contentTxtFame, GUIATTR_DIV_BGCOLOR, &contentTxtFame_color);

            createdom(GUIENT_TXT, contentTxtFame, &contentTxt);    txtDomId[txtDomNum++]=contentTxt;
            setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_X, parh(0));
            setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, parh(0));
            setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_WIDTH, parh(920));
            setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_HEIGHT, parh(720));
            setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_COLOR, &contentTxt_color);

        createdom(GUIENT_DIV, window, &affirmMask);
        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_X, parh(1024));
        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_Y, parh(0));
        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_WIDTH, parh(1024));
        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_HEIGHT, parh(768));
        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_BGCOLOR, &affirmMask_color);

            createdom(GUIENT_DIV, affirmMask, &affrimDialog);
            setattr(GUIENT_DIV, affrimDialog, GUIATTR_DIV_X, parh(243));
            setattr(GUIENT_DIV, affrimDialog, GUIATTR_DIV_Y, parh(304));
            setattr(GUIENT_DIV, affrimDialog, GUIATTR_DIV_WIDTH, parh(540));
            setattr(GUIENT_DIV, affrimDialog, GUIATTR_DIV_HEIGHT, parh(160));
            setattr(GUIENT_DIV, affrimDialog, GUIATTR_DIV_BGCOLOR, &affrimDialog_color);

                createdom(GUIENT_DIV, affrimDialog, &saveAndCloseButton);
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_X, parh(10));
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_Y, parh(100));
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_WIDTH, parh(160));
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_HEIGHT, parh(40));
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_BGCOLOR, &saveAndCloseButton_color);
                setattr(GUIENT_DIV, saveAndCloseButton, GUIATTR_DIV_INTEGRL, paru(1));

                    createdom(GUIENT_TXT, saveAndCloseButton, &saveAndCloseTxt);    txtDomId[txtDomNum++]=saveAndCloseTxt;
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_X, parh(5));
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_Y, parh(8));
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_WIDTH, parh(150));
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_HEIGHT, parh(24));
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_STR, pars("Save&Close"));
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_COLOR, &saveAndCloseTxt_color);

                createdom(GUIENT_DIV, affrimDialog, &justCloseButton);
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_X, parh(190));
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_Y, parh(100));
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_WIDTH, parh(160));
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_HEIGHT, parh(40));
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_BGCOLOR, &justCloseButton_color);
                setattr(GUIENT_DIV, justCloseButton, GUIATTR_DIV_INTEGRL, paru(1));

                    createdom(GUIENT_TXT, justCloseButton, &justCloseTxt);    txtDomId[txtDomNum++]=justCloseTxt;
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_X, parh(5));
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_Y, parh(8));
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_WIDTH, parh(150));
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_HEIGHT, parh(24));
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_STR, pars("Just Close"));
                    setattr(GUIENT_TXT, justCloseTxt, GUIATTR_TXT_COLOR, &justCloseTxt_color);

                createdom(GUIENT_DIV, affrimDialog, &cancelButton);
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_X, parh(370));
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_Y, parh(100));
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_WIDTH, parh(160));
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_HEIGHT, parh(40));
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_BGCOLOR, &cancelButton_color);
                setattr(GUIENT_DIV, cancelButton, GUIATTR_DIV_INTEGRL, paru(1));

                    createdom(GUIENT_TXT, cancelButton, &cancelTxt);    txtDomId[txtDomNum++]=cancelTxt;
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_X, parh(35));
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_Y, parh(8));
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_WIDTH, parh(90));
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_HEIGHT, parh(24));
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_STR, pars("Cancel"));
                    setattr(GUIENT_TXT, cancelTxt, GUIATTR_TXT_COLOR, &cancelTxt_color);

                createdom(GUIENT_TXT, affrimDialog, &affirmTxt);    txtDomId[txtDomNum++]=affirmTxt;
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_X, parh(90));
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_Y, parh(35));
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_WIDTH, parh(360));
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_STR, pars("Not saved, sure to exit?"));
                setattr(GUIENT_TXT, affirmTxt, GUIATTR_TXT_COLOR, &affirmTxt_color);

    str = readFileTxt(fd);
    close(fd);
    setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_STR, pars(str));
    setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_INCCURS, pars(str));

    //==========receive events
    int dirty = 0;
    int affirming = 0;
    int result = 0;
    char dc;
    int *msg = (int*)malloc(100);
    MouseMsg* mm;
    KBDMsg* km;
    while(1)
    {
        getmsgfromqueue(msg);
        if (*msg == MOUSE_MESSAGE)
        {
            mm = (MouseMsg*)msg;
            if ((mm->mouse_event_type & LEFT_BTN_UP) != 0) //left button up
            {
                if (mm->dom_id == closeButton)
                {
                    if (dirty == 0)
                        break;
                    else
                    {
                        affirming = 1;
                        setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_X, parh(0));
                    }
                }
                else if (mm->dom_id == saveButton)
                {
                    if (dirty != 0)
                    {
                        setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &saving_color);
                        result = saveButton_onClick(fnm, str, contentTxt);
                        if (result == 0)
                        {
                            setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &saveTxt_color);
                            dirty = 0;
                        }
                        else
                            setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &unsaved_color);
                    }
                }
                else if (mm->dom_id == upButton)
                    upButton_onClick(contentTxt);
                else if (mm->dom_id == downButton)
                    downButton_onClick(contentTxt);
                else if (mm->dom_id == saveAndCloseButton)
                {
                    setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_COLOR, &saving_color);
                    result = saveButton_onClick(fnm, str, contentTxt);
                    if (result == 0)
                    {
                        setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_COLOR, &saveAndCloseTxt_color);
                        break;
                    }
                    else
                        setattr(GUIENT_TXT, saveAndCloseTxt, GUIATTR_TXT_COLOR, &unsaved_color);
                }
                else if (mm->dom_id == justCloseButton)
                    break;
                else if (mm->dom_id == cancelButton)
                {
                    setattr(GUIENT_DIV, affirmMask, GUIATTR_DIV_X, parh(1024));
                    affirming = 0;
                }
                else
                {
                    result = setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_ISCHILD, &mm->dom_id);
                    if (result == 1)
                        setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_SETCURS, &mm->dom_id);
                }
            }
        }
        else if (*msg == KEYBOARD_MESSAGE)
        {
            if (affirming == 1)
                continue;
            km = (KBDMsg*)msg;
            if ((uchar)km->key_value == 0xE4)
                setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_DECCURS, parh(0));
            else if ((uchar)km->key_value == 0xE5)
                setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_INCCURS, parh(0));
            else if (km->key_value == (char)8)
            {
                dc = 0;
                getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_BCKSPC, &dc);
                if (dc != 0 && dirty == 0)
                {
                    dirty = 1;
                    setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &unsaved_color);
                }
            }
            else if ((uchar)km->key_value == 0xE9)
            {
                dc = 0;
                getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_DELETE, &dc);
                if (dc != 0 && dirty == 0)
                {
                    dirty = 1;
                    setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &unsaved_color);
                }
            }
            else
            {
                result = setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_INSERT, &km->key_value);
                if (result == 0 && dirty == 0)
                {
                    dirty = 1;
                    setattr(GUIENT_TXT, saveTxt, GUIATTR_TXT_COLOR, &unsaved_color);
                }
            }
        }
    }


    //=======release window
    releaseTxtDom();
    releasedom(GUIENT_DIV, window);

    free(str);
    releaseprocessqueue();
    exit();
}
