#define GUIENT_DIV          0
#define GUIENT_IMG          1
#define GUIENT_TXT          2

#define GUIATTR_DIV_X       0
#define GUIATTR_DIV_Y       1
#define GUIATTR_DIV_WIDTH   2
#define GUIATTR_DIV_HEIGHT  3
#define GUIATTR_DIV_BGCOLOR 4
#define GUIATTR_DIV_REFRESH 5
#define GUIATTR_DIV_INTEG   6
#define GUIATTR_DIV_INTEGRL 7
#define GUIATTR_DIV_TOPPIFY 8
#define GUIATTR_DIV_FOCUS   9 
#define GUIATTR_DIV_XYWH    10

#define GUIATTR_IMG_X       0
#define GUIATTR_IMG_Y       1
#define GUIATTR_IMG_WIDTH   2
#define GUIATTR_IMG_HEIGHT  3
#define GUIATTR_IMG_CONTENT 4
#define GUIATTR_IMG_REFRESH 5
#define GUIATTR_IMG_XYWH    6

#define GUIATTR_CHA_X       0
#define GUIATTR_CHA_Y       1
#define GUIATTR_CHA_WIDTH   2
#define GUIATTR_CHA_HEIGHT  3
#define GUIATTR_CHA_CH      4
#define GUIATTR_CHA_COLOR   5
#define GUIATTR_CHA_REFRESH 6

#define GUIATTR_TXT_X       1
#define GUIATTR_TXT_Y       2
#define GUIATTR_TXT_INCX    3
#define GUIATTR_TXT_INCY    4
#define GUIATTR_TXT_WIDTH   5
#define GUIATTR_TXT_HEIGHT  6
#define GUIATTR_TXT_INCW    7
#define GUIATTR_TXT_INCH    8
#define GUIATTR_TXT_FONT    9
#define GUIATTR_TXT_FONTIDX 10
#define GUIATTR_TXT_STR     11
#define GUIATTR_TXT_COLOR   12
#define GUIATTR_TXT_REFRESH 13
#define GUIATTR_TXT_INCCURS 14
#define GUIATTR_TXT_DECCURS 15
#define GUIATTR_TXT_SETCURS 16
#define GUIATTR_TXT_INSERT  17
#define GUIATTR_TXT_BCKSPC  18
#define GUIATTR_TXT_DELETE  19
#define GUIATTR_TXT_TXTLEN  20
#define GUIATTR_TXT_ISCHILD 21
#define GUIATTR_TXT_INTEGRL 22
#define GUIATTR_TXT_XYWH    23
typedef struct ori_contentStruct
{
    void* pics;
    uchar isRepeat;
} contentStruct;
