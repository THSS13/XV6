#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[]){
	//check argument format
	if(argc<3)	{
		printf(1,"Usage : rename source_file dest_file\n");
		exit();
	}
	//link succeeds
	int r = link(argv[1],argv[2]);
	if(r == 0)
		unlink(argv[1]);
	else
		printf(1,"Rename failed, check whether the file is a directory.\n");
	exit();

}