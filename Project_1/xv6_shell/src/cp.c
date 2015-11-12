#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#define BUFF_SIZE 256

int main(int argc, char *argv[]){
	//check the arguments
	if(argc<3)	{
		printf(1,"Usage : cp source_file dest_file\n");
		exit();
	}
	//open source file
	int src_file = open(argv[1],O_RDONLY);
	if(src_file == -1)	{
		printf(1,"cp open source file %s failed.\n",argv[1]);
		close(src_file);
		exit();
	}
	//check whether the srouce file is a directory
	struct stat filestat;
	fstat(src_file,&filestat);
	if(filestat.type == T_DIR){
		printf(1,"cp the source file is a directory, the program cannot copy them in one time.\n");
		close(src_file);
		exit();
	}
	//check whether the second argument is ended with "/"
	char destfp[128] = {};
	strcpy(destfp,argv[2]);
	int l1 = strlen(argv[1]);
	int l2 = strlen(argv[2]);
	if(argv[2][l2-1]=='/')	{
		int i = 0;
		for(i = l1-1; i>=0; i--){
			if(argv[1][i] == '/')
				break;
		}
		i++;
		strcpy(&destfp[l2],&argv[1][i]);
	}
	//open the destination file
	int dest_file = open(destfp,O_WRONLY|O_CREATE);
	if (dest_file == -1)	{
		printf(1,"cp create file %s failed\n",destfp);
		close(src_file);
		close(dest_file);
		exit();
	}
	//copy file
	char buff[BUFF_SIZE] = {};
	int len = 0;
	while((len = read(src_file,buff,BUFF_SIZE))>0)
		write(dest_file,buff,len);
	//close files
	close(src_file);
	close(dest_file);
	exit();
}