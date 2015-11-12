/*
**  Premise headers:
**      types.h
**      guilayout.h
**      graphbase.h
*/

typedef struct ori_div
{
    dom ds;
    color32 bgColor;
} div;

uint/*div**/ div_createDom(int x, int y, int w, int h, uint/*dom**/ parent, int pid);
uint/*div**/ div_changeBgcolor(uint/*div**/ elem, color32 color);
void div_release(uint/*div**/ elem);

uint div_setAttr(uint elem_, int attr, void *val);
uint div_getAttr(uint elem_, int attr, void *des);
void div_setXY(uint elem_, int x, int y);
