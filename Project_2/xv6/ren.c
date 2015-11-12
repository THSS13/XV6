#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{

  if(argc != 3){
    printf(2, "Usage: rename filename newfilename\n");
    exit();
  }
//  char * dir = argv[3];
//  chdir(dir);
  if(link(argv[1], argv[2]) < 0){
    printf(2, "ren: %s failed to rename\n", argv[1]);
    exit();
  }
  if(unlink(argv[1]) < 0){
    printf(2, "ren: %s failed to unlink the old name\n", argv[1]);
    exit();
  }
  chdir("/");
  exit();
}
