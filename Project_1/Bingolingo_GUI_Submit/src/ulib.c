#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "colordef.h"

char*
strcpy(char *s, char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, void *vsrc, int n)
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}

color24 rgb(uchar r,uchar g,uchar b)
{
    color24 t;
    t.r=r;
    t.g=g;
    t.b=b;
    return t;
}
color32 rgba(uchar r, uchar g, uchar b, uchar a)
{
    color32 t;
    t.c=rgb(r,g,b);
    t.a=a;
    return t;
}
color24 mingle(color24 c1, color32 c2)
{
    color24 t;
    uint op=255-(uint)c2.a;
    t.r=(uchar)(((uint)c2.c.r*op+(uint)c1.r*(255-op))/255);
    t.g=(uchar)(((uint)c2.c.g*op+(uint)c1.g*(255-op))/255);
    t.b=(uchar)(((uint)c2.c.b*op+(uint)c1.b*(255-op))/255);

    return t;
}
