#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main()
{
	int result = uptime() * 1.5;
	int hour = result / 360000;
	int minute = (result % 360000) / 6000;
	int second = (result % 6000) / 100;
	int point1 = (result % 100) / 10;
	int point2 = result % 10;
	printf(1, "the system has run %d hours %d minutes %d.%d%d seconds\n", hour, minute, second, point1, point2);
	exit();
}
