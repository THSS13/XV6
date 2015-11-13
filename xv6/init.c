// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


//char *argv[] = { "sh", 0 };
char *desktop_argv[] = { "desktop", 0 };

int
main(void)
{
  int /*pid, wpid,*/ desktop_pid, desktop_wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    // 桌面进程
    printf(1, "init desktop: starting desktop\n");
    desktop_pid = fork();
    if (desktop_pid < 0) {
      printf(1, "init desktop: init desktop failed\n");
      exit();
    }
    if (desktop_pid == 0) {
      exec("desktop", desktop_argv);
      printf(1, "init desktop: exec desktop failed\n");
      exit();
    }

    /*
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    */

    while((desktop_wpid=wait()) >= 0 && desktop_wpid != desktop_pid)
        printf(1, "desktop finished!\n");

    //while((wpid=wait()) >= 0 && wpid != pid)
    //  printf(1, "zombie!\n");
  }
}
