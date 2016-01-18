#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "context.h"
#include "drawingAPI.h"
#include "message.h"
#include "bitmap.h"
#include "windowStyle.h"
#include "clickable.h"
#include "fcntl.h"


#define WINDOW_WIDTH 500
#define WINDOW_HEIGHT 400

#define TITLE_HEIGHT 50

#define RBAR_WIDTH 50

#define SAVEBUT_WIDTH 50
#define SAVEBUT_HEIGHT 35

#define UPDNBUT_WIDTH 30
#define UPDNBUT_HEIGHT 30

//--1
#define line_width 50
#define page_height 10
#define HEADER_HEIGHT 10
#define CHAR_HEIGHT 30
#define LEFT_WIDTH 10
#define CHAR_COLOR 1
//--1

struct Context context;
ClickableManager cm;
int isRun = 1;


//--2
char* str;
char* fnm;
int line_num = 0; // 当前显示的行数
int head_line[1024] = {0};
int total_line_num = 1024;
int cursor = 0;  //光标在当前页面的位置
int character_in_this_page = 0;  //当前页面的字符数量
//--2


//　draw the beautiful graphical user interface
void drawEditorWnd(Context context, char *fileName);
void drawTxtContent(Context context);

void saveButton_onClick();
void upButton_onClick();
void downButton_onClick();
void printCursor(int x, int y);
//Handlers
void hCloseWnd(Point p) {
    isRun = 0;
    printf(1, "close!!!");
}

void strncpy(char *s, char *t, int n)
{
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
    *s++ = 0;
}

void drawEditorWnd(Context content, char *fileName) {
    fill_rect(context, 0, 0, content.width, context.height, 0xFFFF);

    draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
    draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
    draw_line(context, 0, TITLE_HEIGHT, context.width-1, TITLE_HEIGHT, BORDERLINE_COLOR);
    draw_line(context, context.width-RBAR_WIDTH, TITLE_HEIGHT, context.width-RBAR_WIDTH, context.height-1, BORDERLINE_COLOR);

    // draw close icon
    PICNODE pic_close;
    PICNODE pic_up, pic_down, pic_save;
    loadBitmap(&pic_close, "close.bmp");
    loadBitmap(&pic_up, "up1.bmp");
    loadBitmap(&pic_down, "down.bmp");
    loadBitmap(&pic_save, "save.bmp");

    draw_picture(context, pic_close, context.width-50, 10);
    draw_picture(context, pic_up, context.width-RBAR_WIDTH+5, 160);
    draw_picture(context, pic_down, context.width-RBAR_WIDTH+5, 250);
    draw_picture(context, pic_save, context.width-150, 5);

    createClickable(&cm, initRect(450, 10, 30, 30), MSG_LPRESS, hCloseWnd);
    createClickable(&cm, initRect(465, 160, 40, 40), MSG_LPRESS, upButton_onClick);
    createClickable(&cm, initRect(465, 250, 40, 40), MSG_LPRESS, downButton_onClick);
    createClickable(&cm, initRect(350, 5, 40, 40), MSG_LPRESS, saveButton_onClick);

    puts_str(context, fileName, 0, 20, 3);
}

//--3
char* readFileTxt(int fd)
{
  int n;
  // int i;
  str=(char*)malloc(1024*80);

  memset(str, 0, 1024*80);
  n = read(fd, str, 1024*80);

  if(n < 0){
    printf(1, "fileEditor: read error\r\n");
    free(str);
    // releaseTxtDom();
    // releasedom(GUIENT_DIV, windowDom);
    exit();
  }
  return str;
}

void clearText() {
	fill_rect(context, 1, TITLE_HEIGHT+1, context.width-RBAR_WIDTH-2, context.height-TITLE_HEIGHT-2, 0xFFFF);
}

void reloadPage(){
	clearText();
    char temp_str[51];
    int temp_x=0, temp_y=0;
    int j = 0, i = 0;
    while(j <= cursor){
        j += head_line[line_num + temp_y + 1] - head_line[line_num + temp_y];
        temp_y++;
    }
    temp_y--;
    temp_x = cursor - head_line[temp_y+line_num]+head_line[line_num];
    printf(1,"%d,%d,%d\r\n", temp_x, temp_y, cursor);
    printCursor(temp_x,temp_y);
    // character_in_this_page = head_line[line_num + 20] - head_line[line_num];
    if(line_num < total_line_num - page_height){
    	for(i = 0;i < page_height; i++) {
	        memset(temp_str, 0, 51);
	        if(str[head_line[i + line_num + 1] - 1] != '\n')
	            strncpy(temp_str, str + head_line[i+line_num], head_line[i+line_num+1] - head_line[line_num+i]);
	        else
	            strncpy(temp_str, str + head_line[i+line_num], head_line[i+line_num+1] - head_line[line_num+i] - 1);
	        // printf(1,"%s\r\n",temp_str);
	        puts_str(context, temp_str, CHAR_COLOR, LEFT_WIDTH, TITLE_HEIGHT + HEADER_HEIGHT+i*CHAR_HEIGHT);
	    }
    } else {
    	for(i = 0;i < total_line_num - line_num; i++) {
	        memset(temp_str, 0, 51);
	        if(str[head_line[i + line_num + 1] - 1] != '\n')
	            strncpy(temp_str, str + head_line[i+line_num], head_line[i+line_num+1] - head_line[line_num+i]);
	        else
	            strncpy(temp_str, str + head_line[i+line_num], head_line[i+line_num+1] - head_line[line_num+i] - 1);
	        // printf(1,"%s\r\n",temp_str);
	        puts_str(context, temp_str, CHAR_COLOR, LEFT_WIDTH, TITLE_HEIGHT + HEADER_HEIGHT+i*CHAR_HEIGHT);
	    }
    }

}

void saveButton_onClick(char* fileName, char* str)
{
    int fd;
    int len;
    int n;

    // if (unlink(fileName) < 0)
    // {
    //     printf(1, "fileEditor: cannot remove old file \"%s\" while saving\r\n", fileName);
    //     return -1;
    // }
    // if((fd = open(fileName, 0x200)) < 0){
    //     printf(1, "fileEditor: cannot create new file \"%s\" while saving\r\n", fileName);
    //     return -1;
    // }
    // close(fd);
    // if((fd = open(fileName, 1)) < 0){
    //     printf(1, "fileEditor: cannot open new file \"%s\" while saving\r\n", fileName);
    //     return -1;
    // }

    // getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_TXTLEN, &len);
    // getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_STR, str);
    printf(1,"0\n");
    // if(unlink(fnm)<0)
    //     printf(1,"shanchushibai\n");
    // else
    //     printf(1,"shanchuchenggong\n");
    // printf(1,"1\n");
    // fd = open(fnm, O_CREATE);
    // printf(1,"2\n");
    len = strlen(str);
    // printf(1,"3\n")s;
    fd = open(fnm,0);
   	n=write(fd, str, len);
    printf(1,"%d\n",n);
    if (n < 0)
    {
        printf(1, "fileEditor: save error\r\n");
    }
    close(fd);
}



void upButton_onClick()
{
    // int y;
    // int top = 0;

    // getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    // if (y == top)
    //     return;
    // y += 72;
    // if (y > top)
    //     y = top;
    // setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    if (line_num == 0)
        return;
    line_num -= (page_height / 2);
    cursor = 0;
    if (line_num < 0) {
        line_num = 0;
        reloadPage();
    } else {
        reloadPage();
    }

}

void downButton_onClick()
{
    // int y;
    // int h;
    // int bottom = 720;

    // getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    // getattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_HEIGHT, &h);
    // if (y + h <= bottom)
    //     return;
    // y -= 72;
    // if (y + h < bottom)
    //     y = bottom - h;
    // setattr(GUIENT_TXT, contentTxt, GUIATTR_TXT_Y, &y);
    if (line_num +(page_height / 2) >= total_line_num){
        return;
    } else {
        line_num += (page_height / 2);
        cursor = 0;
        reloadPage();
    }
}

void createAllPages(){
    int length_str = strlen(str);
    int i = 0;
    int j = 0;
    int line = 0;
    while (i < length_str) {
        if (str[i] == '\n'){
            j = 0;
            line++;
            i++;
            head_line[line] = i;
            continue;
        }
        j++;
        if (j == line_width){
            line++;
            i++;
            head_line[line] = i;
            j = 0;
            continue;
        }
        i++;
    }
    total_line_num = line;
    reloadPage();
}

void deleteChar(int i){
    while(str[i] != '\0'){
        str[i] = str[i + 1];
        i++;
    }
}

void insertChar(int i, char c){
    int j = strlen(str);
    while(j > i){
        str[j] = str[j - 1];
        j--;
    }
    str[i] = c;
}

void printCursor(int x, int y){
    fill_rect(context, LEFT_WIDTH+x*8, TITLE_HEIGHT+HEADER_HEIGHT+CHAR_HEIGHT*y, 8, CHAR_HEIGHT, 0xFF0F);
    // puts_str(context, temp_str, CHAR_COLOR, LEFT_WIDTH, HEADER_HEIGHT+i*CHAR_HEIGHT);
}

void handle_keydown(struct Context context, char ch) {
    // printf(1,"cursor%d\r\n", cursor);
    // printf(1,"%d\r\n",ch);
    character_in_this_page = head_line[line_num + page_height] - head_line[line_num];
    //退格
    if (ch == 8) {
        if (cursor != 0) {
            deleteChar(head_line[line_num]+cursor - 1);
            cursor--;
            createAllPages();
            reloadPage();
        }
        return;
    }

    // //左方向键
    // if (ch == 37) {
    //     if (cursor != 0) {
    //         cursor--;
    //     }
    // }

    // //右方向键
    // if (ch == 39) {
    //     character_in_this_page = head_line[line_num + page_height] - head_line[line_num];
    //     if (cursor != character_in_this_page){
    //         cursor++;
    //     }
    // }


    //普通符号
    if (ch >= 32 && ch <= 126) {
        if (cursor != character_in_this_page){
            // printf(1,"ready to change\r\n");
            insertChar(head_line[line_num]+cursor, ch);
            cursor++;
            // printf(1,"insertend\r\n");
            createAllPages();
            reloadPage();
        }
        return;
    }

    //huiche
    if (ch == '\n') {
        insertChar(head_line[line_num]+cursor, ch);
        cursor++;
        createAllPages();
        reloadPage();
        return;
    }
}
//--3

void moveCursor(int x, int y){
    if (LEFT_WIDTH < x && x < LEFT_WIDTH + 8*line_width && y >TITLE_HEIGHT+HEADER_HEIGHT && y < TITLE_HEIGHT+HEADER_HEIGHT+page_height*CHAR_HEIGHT) {
        int temp_x = (x - LEFT_WIDTH)/8;
        int temp_y = (y - TITLE_HEIGHT - HEADER_HEIGHT)/CHAR_HEIGHT;
        if(line_num + temp_y >= total_line_num){
            return;
        }
        if(0 <= temp_y && temp_y < page_height){
            if(temp_x < head_line[line_num + 1 + temp_y] - head_line[line_num + temp_y]){
                cursor = head_line[line_num + temp_y] + temp_x - head_line[line_num];
                reloadPage();
                // printCursor(temp_x,temp_y);
            } else {
                if(temp_y < page_height - 1){
                    cursor = head_line[line_num + 1 + temp_y] -head_line[line_num];
                    reloadPage();
                    // temp_y++;
                    // temp_x = 0;
                    // printCursor(temp_x,temp_y);
                }

            }
        }
    }
}



int main(int argc, char *argv[]) {
    int winid;
    struct Msg msg;

    Point p;

    winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    cm = initClickManager(context);
    deleteClickable(&cm.left_click, initRect(0,0,800,600));

    //--4
    int fd;

    fnm = argv[1];
    if((fd = open(fnm, 0)) < 0){
        printf(1, "fileEditor: cannot open %s\r\n", fnm);
        exit();
    }
    str = readFileTxt(fd);
    close(fd);
    printf(1,"fileEditor: reading complete!\r\n");
    // printf(1, "%s\r\n", str);
    //--4
    char write_cmd_ch;
    while (isRun) {
		getMsg(&msg);
		switch (msg.msg_type) {
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
				updateWindow(winid, context.addr, msg.msg_detail);
			}
			break;
		case MSG_UPDATE:
			//printf(0, "update event!\n");
            drawEditorWnd(context, argv[1]);
            printf(1,"fileEditor: window displayed!\r\n");
            createAllPages();
            printf(1,"fileEditor: text displayed!\r\n");
			updateWindow(winid, context.addr, msg.msg_detail);
			break;
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
		case MSG_KEYDOWN:
			write_cmd_ch = msg.concrete_msg.msg_key.key;
			handle_keydown(context, write_cmd_ch);
			updateWindow(winid, context.addr, msg.msg_detail);
			break;
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);

			if (executeHandler(cm.left_click, p)) {
                updateWindow(winid, context.addr, msg.msg_detail);

			}
            moveCursor(msg.concrete_msg.msg_mouse.x,
                    msg.concrete_msg.msg_mouse.y);

			break;
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
				updateWindow(winid, context.addr, msg.msg_detail);
			}
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
	exit();
}
