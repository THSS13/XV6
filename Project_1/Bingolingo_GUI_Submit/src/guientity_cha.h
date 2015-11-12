/*
**  Premise headers:
**      types.h
**      guilayout.h
**      graphbase.h
*/

typedef struct ori_cha
{
    dom ds;
    void* chaContent;
    color24 chColor;
    char ch;
} cha;

uint/*cha**/ cha_createDom(cha* chaPtr, int x, int y, int w, int h, uint/*dom**/ parent, int pid);
uint/*cha**/ cha_createDomOrphan(cha* chaPtr, int x, int y, int w, int h, int pid);
uint/*cha**/ cha_setColor(uint/*cha**/ elem, color24 color);
void cha_release(uint/*cha**/ elem);
void cha_setContent(uint/*cha**/ elem, void* cont, char ch);
void cha_setContentNotRedraw(uint/*cha**/ elem, void* cont, char ch);

uint cha_setAttr(uint elem_, int attr, void *val);
uint cha_getAttr(uint elem_, int attr, void *des);
