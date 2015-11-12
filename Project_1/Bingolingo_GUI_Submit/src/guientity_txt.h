/*
**  Premise headers:
**      types.h
**      guilayout.h
**      graphbase.h
**      guientity_cha.h
*/

typedef struct ori_txtContent
{
	cha data;
	struct ori_txtContent* prev;
	struct ori_txtContent* next;
} txtContent;

typedef struct ori_txt
{
    dom ds;
    void* blockHead;
    void* blockTail;
    txtContent* head;
    txtContent* tail;
    txtContent* cursor;
    div* cursorDiv;
    color24 txtColor;
    uint chWidth;
    uint chHeight;
    uchar** chImgArray;
} txt;

void txt_initLock();
uint/*txt**/ txt_createDom(int x, int y, uint w, uint h, uint/*dom**/ parent, int pid);
void txt_release(uint/*txt**/ elem_);
uint txt_setStr(uint/*txt**/ elem_, char* str_);

uint txt_setAttr(uint elem_, int attr, void *val);
uint txt_getAttr(uint elem_, int attr, void *des);
