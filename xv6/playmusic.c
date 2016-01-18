#include "types.h"
#include "stat.h"
#include "user.h"
#include "sound.h"
#include "fcntl.h"
#include "fs.h"
#include "context.h"
#include "drawingAPI.h"
#include "message.h"
#include "bitmap.h"
#include "windowStyle.h"
#include "clickable.h"

#define SINGLE_BUF_SIZE 4096
#define BUF_SIZE  (SINGLE_BUF_SIZE * 8)

//处理画图
#define WINDOW_WIDTH 600
#define WINDOW_HEIGHT 450

#define BUTTON_WIDTH 32
#define BUTTON_HEIGHT 32

#define TOOLSBAR_COLOR 0xc618
#define TOOLSBAR_HEIGHT 50

#define ICON_STYLE 1
#define LIST_STYLE 2

#define ICON_ITEM_WIDTH 100
#define ICON_ITEM_HEIGHT 95
#define ICON_ITEM_GAP_X 30
#define ICON_ITEM_GAP_Y 20
#define ICON_ITEM_OFFSET_X 25
#define ICON_ITEM_OFFSET_Y 10

#define LIST_ITEM_HEIGHT 30
#define LIST_ITEM_GAP 1
#define LIST_ITEM_OFFSET_X 8
#define LIST_ITEM_OFFSET_Y 3
#define LIST_ITEM_FILENAME 40
#define LIST_ITEM_SIZE 200

#define TAGBAR_HEIGHT 28
#define TAGBAR_COLOR 0xa514

#define ICON_WIDTH_BIG 50
#define ICON_HEIGHT_BIG 50

#define ICON_WIDTH_SMALL 20
#define ICON_HEIGHT_SMALL 20


int winid;
struct Context context;
ClickableManager cm;
int isRun = 1;
char** songs;
int songs_len = 0;
int isPaused = 0;
int playid = -1;

// 文件项
struct fileItem {
	struct stat st;
	char *name;
	Rect pos;
	int chosen;
	struct fileItem *next;
};
// 文件项列表，用于保存当前目录下所有文件
struct fileItem *fileItemList = 0;
void addFileItem(struct stat type, char *name, Rect pos);
void freeFileItemList();

// 根据文件目录获取当前目录下所有文件项信息的函数
char* fmtname(char *path);
void list(char *path);

//画musicwindow
void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen);
void drawMusicWnd(Context context);
void drawMusicContent(Context context);
Rect getPos(Context context, int n); //根据文件序号，计算文件所在位置。
int style = LIST_STYLE; //绘制风格
int itemCounter = 0; // 第几个文件

// 事件处理函数
void addItemEvent(ClickableManager *cm, struct fileItem item);
void addListEvent(ClickableManager *cm);
struct fileItem * getFileItem(Point p); //跟据点击位置，获取文件信息

void h_closeWnd(Point p);
void h_playMusic(Point p);
void h_pauseMusic(Point p);
void h_chooseFile(Point p);

char * sizeFormat(uint size);

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
	temp->name = (char *) malloc(32 * sizeof(char));
	strcpy(temp->name, name);
	temp->st = st;
	temp->pos = pos;
	temp->next = fileItemList;
	temp->chosen = 0;
	fileItemList = temp;
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
}

// 文件信息相关操作
char* fmtname(char *path) {
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
		;
	p++;

	return p;
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
}

// 绘图函数相关操作
struct Icon contentRes[] = { {"file_icon_small.bmp", 0, 0 }, {"folder_icon_small.bmp", 0, 0 }, };

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0)
		nameColor = 0x0;
	else
	{
		nameColor = 0xFFFF;
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}

char *sizeFormat(uint size){
	char* result = (char *) malloc(12 * sizeof(char));
	int n = 0;
	if (size > 0x400)
	{
		size = size / (0x400);
		do{
			result[n++] = (size % 10) + '0';
			size /= 10;
		}while (size!=0);
		result[n++] = 'K';
		result[n++] = 'b';
		result[n] = 0;
	}
	else
	{
		do{
			result[n++] = (size % 10) + '0';
			size /= 10;
		}while (size!=0);
		result[n++] = 'b';
		result[n++] = 'y';
		result[n++] = 't';
		result[n++] = 'e';
		result[n] = 0;
	}
	return result;
}
//draw main window
struct Icon wndRes[] = { { "close.bmp", 3, 3 }, { "pause.bmp", WINDOW_WIDTH / 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }};

void drawMusicWnd(Context context) {
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
			TOOLSBAR_COLOR);
	puts_str(context, "Media Player", 0, WINDOW_WIDTH / 2, 3);
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
}

void drawMusicContent(Context context) {
	struct fileItem *p;

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
	{
		fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
		fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
		fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
		puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
		puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
	}
}

char * int2str(int i)
{
	int j;
	int n = 0;
	char *result = (char *)malloc(4*sizeof(char));
	char *temp = (char *)malloc(4*sizeof(char));
	do{
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
	free(result);
	return temp;
}

Rect getPos(Context context, int n) {
	if (style == ICON_STYLE) {
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
		int r = n / m;
		int c = n % m;
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
		return initRect(x_left, y_top, ICON_ITEM_WIDTH,
				ICON_ITEM_HEIGHT);
	} else {
		printf(1, "width: %d height: %d\n", context.width, LIST_ITEM_HEIGHT);
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP), context.width,
				LIST_ITEM_HEIGHT);
	}
}

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
	switch (item.st.type) {
	case T_FILE:
	  createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_playMusic);
		break;
	case T_DIR:
	  createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_playMusic);
		break;
	default:
		printf(0, "unknown file type!");
	}
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}

//Handler
Handler wndEvents[] = { h_closeWnd, h_pauseMusic };

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

void h_closeWnd(Point p) {
	isRun = 0;
}

void h_chooseFile(Point p) {
	struct fileItem *allfile = fileItemList;
	while (allfile != 0) {
	  if (allfile->chosen != 0) allfile->chosen = 0;
		allfile = allfile->next;
	}

	struct fileItem *temp = getFileItem(p);
	if (temp->chosen != 0)
	{
		printf(0, "chooseFile!\n");
		temp->chosen = 0;
	}
	else
	{
		printf(0, "unchooseFile!\n");
		temp->chosen = 1;
	}
	drawMusicContent(context);
}

void h_playMusic(Point p) {
	int pid;
	struct fileItem *fi = getFileItem(p);
	char* argv1[] = { "play", fi->name };
	char* argv2[] = { "playmp3", fi->name};
    printf(0, "start playing music \n");
    pid = fork();
	if (pid > 0) playid = pid;
    if (pid < 0)
    {
        printf(1, "init playmusic: fork failed\n");
        exit();
    }
    if (pid == 0)
    {
		if (fi->name[strlen(fi->name) - 1] == '3') {
			if (playid) {
				kill(playid);
				playid = -1;
			}
			exec("playmp3", argv2);
		} else {
			if (playid) {
				kill(playid);
				playid = -1;
			}
        	exec("play", argv1);
		}
		printf(1, "init playmusic: exec play failed\n");
        exit();
    }
}

void h_pauseMusic(Point p) {
	if (isPaused) {
		strcpy(wndRes[1].name, "pause.bmp");
		isPaused = 0;
  	} else {
		strcpy(wndRes[1].name, "play.bmp");
		printf(1, "%s\n", wndRes[1].name);
		isPaused = 1;
	}
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
	drawMusicWnd(context);
	drawMusicContent(context);
	updateWindow(winid, context.addr, 4);
	pause();
}

int
main(int argc, char *argv[])
{
	struct Msg msg;

	Point p;
	int i;
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
	cm = initClickManager(context);
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
	freeFileItemList();
	songs_len = argc;
  	songs = (char**)malloc(sizeof(char*) * argc);
	for (i = 0; i < argc; i++)
	{
		songs[i] = (char *)malloc(sizeof(char) * strlen(argv[i]));
		strcpy(songs[i], argv[i]);
	}
	itemCounter = 0;
	for (i = 1; i < argc; i++)
	{
		struct stat st;
		int fd = open(songs[i], 0);
		if (fd < 0) {
			printf(2, "ls: cannot open %s\n", songs[i]);
			continue;
		}
		if (fstat(fd, &st) < 0) {
			printf(2, "ls: cannot stat %s\n", songs[i]);
			close(fd);
			continue;
		}
		if (stat(songs[i], &st) < 0) {
			printf(1, "ls: cannot stat %s\n", songs[i]);
			continue;
		}
		addFileItem(st, fmtname(songs[i]), getPos(context, itemCounter));
		itemCounter++;
		printf(1, "%s\n", songs[i]);
	}
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
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
			drawMusicWnd(context);
			drawMusicContent(context);
			updateWindow(winid, context.addr, msg.msg_detail);
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
				updateWindow(winid, context.addr, msg.msg_detail);
			}
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
