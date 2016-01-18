#include "picviewer.h"

struct Icon wndRes[] = {
    { "close.bmp", 3, 3 }
};

Handler wndEvents[] = {
    h_closeWnd
};

PICNODE pic;
int isRun = 1;

// 压缩图片
void compressPic(int width, int height) {
    int w0, h0, w1, h1;
    float fw, fh;
    int x0, y0, x1, x2, y1, y2;
    float fx1, fx2, fy1, fy2;
    int x, y, index;
    RGBQUAD* data;

    w0 = pic.width;
    h0 = pic.height;
    w1 = width;
    h1 = height;

    fw = w0 * 1.0 / w1;
    fh = h0 * 1.0 / h1;

    index = 0;
    data = (RGBQUAD*)malloc(w1*h1*sizeof(RGBQUAD));
    memset(data, 0, (uint)w1*h1*sizeof(RGBQUAD));
    for (y = 0; y < h1; ++y) {
        y0 = y*fh;
        y1 = (int)y0;
        y2 = (y1 == h0-1) ? y1 : y1 + 1;

        fy1 = y1-y0;
        fy2 = 1.0f-fy1;

        for (x = 0; x < w1; ++x) {
            x0 = x*fw;
            x1 = (int)x0;
            x2 = (x1 == w0-1) ? x1 : x1 + 1;

            fx1 = y1-y0;
            fx2 = 1.0f-fx1;

            float s1 = fx1*fy1;
            float s2 = fx2*fy1;
            float s3 = fx2*fy2;
            float s4 = fx1*fy2;

            RGBQUAD p1, p2, p3, p4;
            p1 = pic.data[x1+y1*w0];
            p2 = pic.data[x2+y1*w0];
            p3 = pic.data[x1+y2*w0];
            p4 = pic.data[x2+y2*w0];

            data[index].rgbRed = (BYTE)(p1.rgbRed*s3 + p2.rgbRed*s4 + p3.rgbRed*s2 + p4.rgbRed*s1);
            data[index].rgbGreen = (BYTE)(p1.rgbGreen*s3 + p2.rgbGreen*s4 + p3.rgbGreen*s2 + p4.rgbGreen*s1);
            data[index].rgbBlue = (BYTE)(p1.rgbBlue*s3 + p2.rgbBlue*s4 + p3.rgbBlue*s2 + p4.rgbBlue*s1);

            data[index].rgbRed = p1.rgbRed;
            data[index].rgbGreen = p1.rgbGreen;
            data[index].rgbBlue = p1.rgbBlue;

            ++index;
        }
    }

    freepic(&pic);
    pic.data = data;
    pic.width = width;
    pic.height = height;
}

void modifyPic(Context context) {
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
    c_height = context.height;
    pic_width = pic.width;
    pic_height = pic.height;

    if (pic_width < c_width && pic_height < c_height) {
        return;
    }

    float scale_p, scale_c;
    scale_p = pic_width * 1.0 / pic_height;
    scale_c = c_width * 1.0 / c_height;

    if (scale_p <= scale_c) {
        pic_width = scale_p * (c_height-10);
        pic_height = c_height-10;
    } else {
        pic_height = (c_width-5) / scale_p;
        pic_width = c_width-5;
    }
    printf(0, "modifyPic: pic_width: %d, pic_height: %d\n", pic_width, pic_height);

    compressPic(pic_width, pic_height);
}

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

void drawPicViewerContent(Context context, char* fileName) {
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
    c_height = context.height;
    pic_width = pic.width;
    pic_height = pic.height;

    printf(0, "drawPicViewerContent: pic_width: %d, pic_height: %d\n", pic_width, pic_height);
    draw_picture(context, pic, (c_width-pic_width) >> 1, TOPBAR_HEIGHT + ((c_height-pic_height) >> 1));
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

    loadBitmap(&pic, argv[1]);
    load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));

    modifyPic(context);
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
			drawPicViewerContent(context, argv[1]);
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
