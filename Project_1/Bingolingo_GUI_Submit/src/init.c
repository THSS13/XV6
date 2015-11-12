// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "guientity_attrvalue.h"

char *argv[] = { "sh", 0 };

uchar *readImg(char *fileName, uchar picMode)   //0:3channel,1:4channel
{
    int fd1 = open(fileName, 0);
    if (fd1 < 0)
    {
        printf(1, "open file error\n");
        return 0;
    }
    uchar w,h;
    read(fd1, &w, 1);
    read(fd1, &h, 1);
    int size=(uint)w*(uint)h,i;
    uchar *p=malloc(size*4+12);
    uchar *q,*tp,*tq;
    p[0]=w;
    p[1]=h;
    if (picMode==1)
    {
        read(fd1, p+2, size*4);
    }
    else if (picMode==0)
    {
        q=malloc(size*3+4);
        read(fd1, q, size*3);
        tp=p+2;
        tq=q;
        for (i=0;i<size;i++)
        {
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=0;
        }
        free(tq);
    }
    close(fd1);

    return p;
}
void initMouse()
{
    contentStruct pic;
    uchar *p=readImg("cursor.mx",1);
    pic.pics=p;
    pic.isRepeat=0;
    setattr(GUIENT_IMG,0xfffffffe,GUIATTR_IMG_CONTENT,&pic);
    free(p);
}
void initLetters()
{
    char* cont="1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM~!@#$%^&*()_-=+[];',./\\{}|:\"<>?";
    int fd1 = open("letters.mx", 0);
    uchar w,h;
    uchar *p;
    int size,num,i,j;

    if (fd1 < 0)
    {
        printf(1, "open file error\n");
        return;
    }
    read(fd1, &w, 1);
    read(fd1, &h, 1);
    num=strlen(cont);
    size=(1+(uint)w*(uint)h)*num;
    p=malloc(size+10);
    size=(uint)w*(uint)h;

    p[0]=0;
    p[1]=w;
    p[2]=h;
    p[3]=(uchar)strlen(cont);
    j=4;
    for (i=0;i<num;i++)
    {
        p[j]=(uchar)cont[i];
        read(fd1, p+j+1, size);
        j=j+1+size;
    }
    close(fd1);
    //SYSCALL HERE!
    uint x=0;
    setattr(GUIENT_TXT,x,GUIATTR_TXT_FONT,p);
    free(p);
}

int
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr
  initMouse();
  initLetters();

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
#ifdef I_WANNA_GUI
      exec("indexpage", argv);
#else
      exec("sh", argv);
#endif
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
}
