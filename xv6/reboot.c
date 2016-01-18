#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define CONTROL_REG 0x64

int
main(int argc, char *argv[])
{
  reboot();
  exit();
}
