#include "types.h"
#include "stat.h"
#include "user.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

uint windowParent = 0xffffffff;
uint windowDom;

uint txtDomNum = 0;
#define minegrid_width 19
#define minegrid_height 19
#define UNKNOWN 9
#define GUESSMINE 10
#define NOMINE 11
#define MINE 12

uint grid_unit_width = 24;
uint grid_unit_height = 24;
uint grid_unit_interval = 1;
uint txtDomId[minegrid_width*minegrid_height+10];
uint gridvalue[minegrid_height][minegrid_width];//a grid has a mine or not
uint gridplayerknow[minegrid_height][minegrid_width];//grid status that a player has already known
uint minegrid[minegrid_height][minegrid_width];//paint dom id
uint gridTxt[minegrid_height][minegrid_width];//dom grid text
uint gridTxtWrite[minegrid_height][minegrid_width];
uint basex, basey;
color32 warning;
color32 error;
color32 safe;
color32 normal;
color32 bluetxt;
uint django;
#define parh(x) (django=x,&django)
char* shabi;
#define pars(x) (shabi=x,shabi)
char cha;
#define parc(x) (cha=x,&cha)
uchar uc;
#define paru(x) (uc=x,&uc)

uint holdrand;
void srand(unsigned int seed)
{
    holdrand = seed;
}
uint rand()
{
	return (((holdrand = holdrand * 214013 + 2531011) >> 16) & 0x7fff);
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

void randGrid()
{
	int ia, ja;
	srand((unsigned)uptime());
	for(ia = 0; ia < minegrid_height; ia++)
    {
    	for(ja = 0; ja < minegrid_width; ja++)
    	{
    		if(rand()%3 == 1)
    		{
    			gridvalue[ia][ja] = 1;
    		}
    		else
    		{
    			gridvalue[ia][ja] = 0;
    		}
    	}
    }
}

void showgrid(uint grid[minegrid_height][minegrid_width])
{
    int ia, ja;
	for(ia = 0; ia < minegrid_height; ia++)
    {
    	for(ja = 0; ja < minegrid_width; ja++)
    	{
    		printf(1, "%d ", grid[ia][ja]);
    	}
    	printf(1, "\n");
    }
}

void cleangrid(uint grid[minegrid_height][minegrid_width], uint value)
{
	int ia, ja;
	for(ia = 0; ia < minegrid_height; ia++)
    {
    	for(ja = 0; ja < minegrid_width; ja++)
    	{
    		grid[ia][ja] = value;
    	}
    }
}

uint win()
{
	uint ia, ja, flag;
	flag = 1;
	for(ia = 0; ia < minegrid_height; ia++)
	{
		for(ja = 0; ja < minegrid_width; ja++)
		{
            if(gridvalue[ia][ja] == 1 && gridplayerknow[ia][ja] != GUESSMINE)
            {
            	flag = 0;
            }

            if(gridplayerknow[ia][ja] == GUESSMINE && gridvalue[ia][ja] != 1)
            {
            	flag = 0;
            }
		}
	}
	return flag;
}

uint countaroundmine(uint xa, uint ya)
{
	//uint xb, yb;
	uint counter = 0;
	if(xa > 0 && ya > 0)
	{
		if(gridvalue[ya-1][xa-1] == 1)
		{
            counter++;
		}
	}
	if(xa < (minegrid_width-1) && ya > 0)
	{
        if(gridvalue[ya-1][xa+1] == 1)
		{
            counter++;
		}
	}
	if(ya > 0)
	{
        if(gridvalue[ya-1][xa] == 1)
		{
            counter++;
		}
	}
	if(xa > 0 && ya < (minegrid_height-1))
	{
		if(gridvalue[ya+1][xa-1] == 1)
		{
            counter++;
		}
	}
	if(xa < (minegrid_width-1) && ya < (minegrid_height-1))
	{
        if(gridvalue[ya+1][xa+1] == 1)
		{
            counter++;
		}
	}
	if(ya < (minegrid_height-1))
	{
        if(gridvalue[ya+1][xa] == 1)
		{
            counter++;
		}
	}
	if(xa > 0 && ya >= 0)
	{
		if(gridvalue[ya][xa-1] == 1)
		{
            counter++;
		}
	}
	if(xa < (minegrid_width-1) && ya >= 0)
	{
        if(gridvalue[ya][xa+1] == 1)
		{
            counter++;
		}
	}
	return counter;
}

uint validclick(uint someclick, uint *xa, uint *ya)
{// 0 for unvalid click + no action; 1 for left click on no mine grid; 2 for leftclick on mine
    int ia, ja;
    for(ia = 0; ia < minegrid_height; ia++)
    {
    	for(ja = 0; ja < minegrid_width; ja++)
    	{
    		if(minegrid[ia][ja] == someclick)
    		{
    			*xa = ja;
    			*ya = ia;
    			if(gridplayerknow[ia][ja] != UNKNOWN)
    			{
    				return 0;
    			}
    	        else if(gridvalue[ia][ja] == 0)
    	        {
    	        	return 1;
    	        }
    	        else
    	        {
    	        	return 2;
    	        }
    		}
    	}
    }
    return 0;
}
void setGridDom(uint xa, uint ya, uint ctype);
void setGridTxt(uint xa, uint ya, uint counter)
{
	if(xa < 0 || ya < 0 || xa >= minegrid_width || ya >= minegrid_height)
	{
		return;
	}
	if(gridplayerknow[ya][xa] != UNKNOWN && gridplayerknow[ya][xa] != GUESSMINE){
		return;
	}
	gridplayerknow[ya][xa] = counter;
    createdom(GUIENT_TXT, minegrid[ya][xa], &gridTxt[ya][xa]);   txtDomId[txtDomNum++] = gridTxt[ya][xa];
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_X, parh(4));
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_Y, parh(0));
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_WIDTH, parh(15));
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_HEIGHT, parh(24));
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_STR, parc(counter+'0'));
    setattr(GUIENT_TXT, gridTxt[ya][xa], GUIATTR_TXT_COLOR, &bluetxt);
}

void setGridDom(uint xa, uint ya, uint ctype)
{// 0 for left click, 1 for right click, 2 for left click's son
    if(xa < 0 || ya < 0 || xa >= minegrid_width || ya >= minegrid_height)
	{
		return;
	}
	if(gridplayerknow[ya][xa] != UNKNOWN && gridplayerknow[ya][xa] != GUESSMINE){
		return;
	}
    uint countaroundmines;
	if(ctype == 1)
	{
		if(gridplayerknow[ya][xa] == UNKNOWN)
		{
			gridplayerknow[ya][xa] = GUESSMINE;
		    setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &warning);
		}
		else if(gridplayerknow[ya][xa] == GUESSMINE)
		{
			gridplayerknow[ya][xa] = UNKNOWN;
		    setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &normal);
		}
	}
    else if(ctype == 0)
    {//ctype == 0
    	if(gridvalue[ya][xa] == 0)
    	{
    		countaroundmines = countaroundmine(xa,ya);
    		if(countaroundmines == 0)
    		{
    			gridplayerknow[ya][xa] = NOMINE;
    			setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &safe);
    			setGridDom(xa-1,ya-1,2);
		        setGridDom(xa-1,ya,2);
		        setGridDom(xa-1,ya+1,2);
		        setGridDom(xa,ya-1,2);
		        setGridDom(xa,ya+1,2);
		        setGridDom(xa+1,ya-1,2);
		        setGridDom(xa+1,ya,2);
		        setGridDom(xa+1,ya+1,2);
    		}
		    else
		    {
                setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &safe);
		    	setGridTxt(xa,ya,countaroundmines);
		    }
    	}
    	else
    	{
            int ia, ja;
            for(ia = 0; ia < minegrid_height; ia++)
            {
            	for(ja = 0; ja < minegrid_width; ja++)
            	{
            		if(gridvalue[ia][ja] == 1)
            		{
            			gridplayerknow[ia][ja] =  MINE;
            			setattr(GUIENT_DIV, minegrid[ia][ja], GUIATTR_DIV_BGCOLOR, &error);
            		}
            		else{
                        gridplayerknow[ia][ja] = NOMINE;
            		}
            	}
            }
    	}
    }
    else
    {
    	if(gridvalue[ya][xa] == 0)
    	{

    		countaroundmines = countaroundmine(xa,ya);
    		if(countaroundmines == 0)
            {
            	gridplayerknow[ya][xa] = NOMINE;
            	setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &safe);
		        setGridDom(xa-1,ya-1,2);
		        setGridDom(xa-1,ya,2);
		        setGridDom(xa-1,ya+1,2);
		        setGridDom(xa,ya-1,2);
		        setGridDom(xa,ya+1,2);
		        setGridDom(xa+1,ya-1,2);
		        setGridDom(xa+1,ya,2);
		        setGridDom(xa+1,ya+1,2);
		    }
		    else
		    {
                setattr(GUIENT_DIV, minegrid[ya][xa], GUIATTR_DIV_BGCOLOR, &safe);
		    	setGridTxt(xa,ya,countaroundmines);
		    }
    	}
    }
    return;
}




int main(int argc, char *argv[])
{
    if (strcmp("minesweeper", argv[0]) != 0)
        windowParent = cvtS2U(argv[0]);

	initprocessqueue();
	//===========create window
    uint window;
        uint titleBar;
            uint appNameTxtFrame;
                uint appNameTxt;
            uint closeButton;
        uint statusFrame;
            uint statusTxt;
        uint contentFrame;

    warning = rgba(251, 237, 6, 0);
    error = rgba(251, 6, 6, 0);
    safe  = rgba(6, 251, 214, 0);
    normal  = rgba(194, 194, 194, 0);
    bluetxt = rgba(0, 0, 255, 0);
    color32 window_background = rgba(39, 40, 34, 0);
    color32 titleBar_color = rgba(77, 75, 69, 0);
    color32 appNameTxtFrame_color = rgba(20, 20, 20, 0);
    color24 appNameTxt_color = rgb(255, 255, 255);
    color32 closeButton_color = rgba(229, 94, 48, 0);
    color32 contentFrame_color = rgba(255, 255, 255, 255);
    color32 contentGridUnit_color = normal;
    //color32 statusFrame_color = rgba(20, 20, 20, 0);
    //color24 statusTxt_color = rgb(255, 255, 255);

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
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_WIDTH, parh(200));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_HEIGHT, parh(30));
            setattr(GUIENT_DIV, appNameTxtFrame, GUIATTR_DIV_BGCOLOR, &appNameTxtFrame_color);

                createdom(GUIENT_TXT, appNameTxtFrame, &appNameTxt);    txtDomId[txtDomNum++]=appNameTxt;
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_X, parh(5));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_Y, parh(3));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_WIDTH, parh(165));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_STR, pars("MineSweeper"));
                setattr(GUIENT_TXT, appNameTxt, GUIATTR_TXT_COLOR, &appNameTxt_color);

        createdom(GUIENT_DIV, titleBar, &closeButton);
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_X, parh(994));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_Y, parh(0));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_WIDTH, parh(30));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_HEIGHT, parh(30));
        setattr(GUIENT_DIV, closeButton, GUIATTR_DIV_BGCOLOR, &closeButton_color);

        createdom(GUIENT_DIV, window, &statusFrame);
        setattr(GUIENT_DIV, statusFrame, GUIATTR_DIV_X, parh(0));
        setattr(GUIENT_DIV, statusFrame, GUIATTR_DIV_Y, parh(30));
        setattr(GUIENT_DIV, statusFrame, GUIATTR_DIV_WIDTH, parh(1024));
        setattr(GUIENT_DIV, statusFrame, GUIATTR_DIV_HEIGHT, parh(24));
        setattr(GUIENT_DIV, statusFrame, GUIATTR_DIV_BGCOLOR, &appNameTxtFrame_color);



        createdom(GUIENT_DIV, window, &contentFrame);
        setattr(GUIENT_DIV, contentFrame, GUIATTR_DIV_X, parh(0));
        setattr(GUIENT_DIV, contentFrame, GUIATTR_DIV_Y, parh(45));
        setattr(GUIENT_DIV, contentFrame, GUIATTR_DIV_WIDTH, parh(1024));
        setattr(GUIENT_DIV, contentFrame, GUIATTR_DIV_HEIGHT, parh(720));
        setattr(GUIENT_DIV, contentFrame, GUIATTR_DIV_BGCOLOR, &contentFrame_color);

            uint i, j, contentWidth, contentHeight, gridx, gridy;
            contentWidth = minegrid_width * grid_unit_width + (minegrid_width - 1) * grid_unit_interval;
            contentHeight = minegrid_height * grid_unit_height + (minegrid_height -1) * grid_unit_interval;
            basex = 512 - (contentWidth/2);
            basey = 360 - (contentHeight/2);
            gridx = basex;
            gridy = basey;
            for(i = 0; i < minegrid_height; i++)
            {
            	gridy = basey + i * grid_unit_height + i * grid_unit_interval;

            	for(j = 0; j < minegrid_width; j++)
            	{
            		gridx = basex + j * grid_unit_width + j * grid_unit_interval;
            		createdom(GUIENT_DIV, contentFrame, &minegrid[i][j]);
            		setattr(GUIENT_DIV, minegrid[i][j], GUIATTR_DIV_X, parh(gridx));
            		setattr(GUIENT_DIV, minegrid[i][j], GUIATTR_DIV_Y, parh(gridy));
            		setattr(GUIENT_DIV, minegrid[i][j], GUIATTR_DIV_WIDTH, parh(grid_unit_width));
            		setattr(GUIENT_DIV, minegrid[i][j], GUIATTR_DIV_HEIGHT, parh(grid_unit_height));
            		setattr(GUIENT_DIV, minegrid[i][j], GUIATTR_DIV_BGCOLOR, &contentGridUnit_color);
            	}
            }

    randGrid();
    showgrid(gridvalue);
    cleangrid(gridplayerknow,UNKNOWN);
    //showgrid(gridplayerknow);
    uint clickx, clicky;
    uint clicktype;
    int *msg = (int*)malloc(100);
    MouseMsg* mm;
    uint timeafterwin = 0;
    while(1)
    {
    	getmsgfromqueue(msg);
    	if (*msg == MOUSE_MESSAGE)
    	{
    		mm = (MouseMsg*)msg;
    		if ((mm->mouse_event_type & LEFT_BTN_UP) != 0 && mm->dom_id == closeButton)
    		{
    			break;
    		}
    		else if((mm->mouse_event_type & LEFT_BTN_UP) != 0 )
    		{// valid click: 0 for unvalid click + no action; 1 for left click on no mine grid; 2 for leftclick on mine
    			clicktype = validclick(mm->dom_id, &clickx, &clicky);
    			if(clicktype == 1)
    			{
                    setGridDom(clickx, clicky, 0);
    			}
    			else if(clicktype == 2)
    			{
                    setGridDom(clickx, clicky, 0);
    			}
    		}
    		else if((mm->mouse_event_type & RIGHT_BTN_UP) != 0)
    		{
    			clicktype = validclick(mm->dom_id, &clickx, &clicky);
    			setGridDom(clickx, clicky, 1);
    		}
    		timeafterwin += win();
    		if(timeafterwin == 1)
    		{
    			createdom(GUIENT_TXT, statusFrame, &statusTxt);   txtDomId[txtDomNum++] = statusTxt;
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_X, parh(2));
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_Y, parh(0));
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_WIDTH, parh(165));
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_COLOR, &appNameTxt_color);
                setattr(GUIENT_TXT, statusTxt, GUIATTR_TXT_STR, pars("You are win"));
    		}
    	}
    }

    for(i = 0; i < txtDomNum; i++)
    {
    	releasedom(GUIENT_TXT, txtDomId[i]);
    }
    //releasedom(GUIENT_IMG, contentPic);
    releasedom(GUIENT_DIV, window);


    releaseprocessqueue();
    exit();
}
