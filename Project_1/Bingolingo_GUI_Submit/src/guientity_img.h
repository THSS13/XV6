/*
**  Premise headers:
**      types.h
**      guilayout.h
**      graphbase.h
*/

typedef struct ori_img
{
    dom ds;
    void* imgContent;
    uchar isBigData;
    uchar isRepeat;
} img;

uint/*img**/ img_createDom(int x, int y, int w, int h, uint/*dom**/ parent, int pid);
void img_release(uint/*img**/ elem);
void img_setContent(uint/*img**/ elem, void* cont, uchar isBig, uchar isRep);

uint img_setAttr(uint elem_, int attr, void *val);
uint img_getAttr(uint elem_, int attr, void *des);
void img_setXY(uint elem_, int x, int y);
