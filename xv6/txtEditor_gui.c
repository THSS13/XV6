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

struct Context context;
ClickableManager cm;
int isRun = 1;

//　draw the beautiful graphical user interface
void drawEditorWnd(Context context, char *fileName);
void drawTxtContent(Context context);

//Handlers
void hCloseWnd(Point p) {
    isRun = 0;
    printf(1, "close!!!");
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
    createClickable(&cm, initRect(465, 160, 40, 40), MSG_LPRESS, hCloseWnd);
    createClickable(&cm, initRect(465, 250, 40, 40), MSG_LPRESS, hCloseWnd);
    createClickable(&cm, initRect(350, 5, 40, 40), MSG_LPRESS, hCloseWnd);

    puts_str(context, fileName, 0, 20, 3);
}

int main(int argc, char *argv[]) {
    int winid;
    struct Msg msg;

    Point p;

    winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    cm = initClickManager(context);
    deleteClickable(&cm.left_click, initRect(0,0,800,600));

    while (isRun) {
		getMsg(&msg);
		switch (msg.msg_type) {
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
		case MSG_UPDATE:
			//printf(0, "update event!\n");
            drawEditorWnd(context, argv[1]);
			updateWindow(winid, context.addr);
			break;
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {

				updateWindow(winid, context.addr);
			}
			break;
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
	exit();
}
