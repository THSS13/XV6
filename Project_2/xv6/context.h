#ifndef CONTEXT_H
#define CONTEXT_H

struct Clickable;
typedef struct Context
{
	unsigned short *addr;
	int width;
	int height;
} Context;

//context 函数接口
int init_context(struct Context* context_ptr, int width, int height);
void free_context(struct Context* context_ptr, int winid);

#endif
