#include "picviewer.h"

struct Icon wndRes[] = {
    { "close.bmp", 3, 3 }
};

Handler wndEvents[] = {
    h_closeWnd
};

int isRun = 1;

// 绘制窗口
void drawPicViewerWnd(Context context) {
    int width, height;

    width = context.width;
    height = context.height;

    fill_rect(context, 0, 0, width, height, 0xFFFF);

    draw_line(context, 0, 0, width-1, 0, BORDERLINE_COLOR);
    draw_line(context, width-1, 0, width-1, height-1, BORDERLINE_COLOR);
    draw_line(context, 0, height-1, width-1, height-1, BORDERLINE_COLOR);
    draw_line(context, 0, height-1, 0, 0, BORDERLINE_COLOR);

    fill_rect(context, 1, 1, width-2, TOPBAR_HEIGHT, TOPBAR_COLOR);
    puts_str(context, "PictureViewer", 0, WINDOW_WIDTH/2 - 53, 3);

    draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
}

void h_closeWnd(Point p) {
    isRun = 0;
}

void addWndEvent(ClickableManager *cm) {
    int i;
	int n = sizeof(wndEvents) / sizeof(Handler);

	for (i = 0; i < n; i++) {
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}

int main(int argc, char *argv[]) {
    struct Context context;
    ClickableManager cm;
    int winid;
    struct Msg msg;
    Point p;

    winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    cm = initClickManager(context);

    load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));

    deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    addWndEvent(&cm);

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
			drawPicViewerWnd(context);
			//drawPicViewerContent(context);
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
