#define WINDOW_WIDTH 500
#define WINDOW_HEIGHT 310

#define BUTTON_WIDTH 32
#define BUTTON_HEIGHT 32

#define TOOLSBAR_COLOR 0xc618
#define TOOLSBAR_HEIGHT 50

#define ICON_STYLE 1
#define LIST_STYLE 2

#include "context.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "drawingAPI.h"
#include "message.h"
#include "bitmap.h"
#include "windowStyle.h"
#include "clickable.h"
#include "fcntl.h"

// 绘图函数
void drawPicViewerWnd(Context context);
void drawPicViewerContent(Context context);
void drawPicViewer(Context context);

void h_closeWnd(Point p);

void addWndEvent(ClickableManager *cm);
