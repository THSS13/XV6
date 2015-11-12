// init: The initial user-level program

#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

//char *argv_sh[] = { "sh", 0 };
char *argv_desktop[] = { "desktop", 0 };

int
main(void)
{
  int pid_desktop, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
//    printf(1, "init: starting sh\n");
//    pid_sh = fork();
//    if(pid_sh < 0){
//      printf(1, "init: fork failed\n");
//      exit();
//    }
//    if(pid_sh == 0){
//      exec("sh", argv_sh);
//      printf(1, "init: exec sh failed\n");
//      exit();
//    }
    printf(1, "init: starting desktop\n");
    pid_desktop = fork();
    if (pid_desktop < 0){
      printf(1, "init: fork failed\n");
      exit();
    }
    if (pid_desktop == 0){
      exec(argv_desktop[0], argv_desktop);
      printf(1, "init: exec desktop failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid_desktop)
      printf(1, "zombie!\n");
  }
}

