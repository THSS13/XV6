#include "context.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    context_ptr->width = width;
    context_ptr->height = height;
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    initializeASCII();
    initializeGBK();
    return createWindow(0, 0, width, height);
}

void free_context(struct Context* context_ptr, int winid)
{
    free(context_ptr->addr);
    freeASCII();
    freeGBK();
    destroyWindow(winid);
}
