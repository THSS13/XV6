#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"


int main(int argc,char* argv[]){
	const int bufSize = 128;
	char buf[bufSize];
	int length = 0;
	if(argc == 1 || argc == 2){
		printf(2, "Usage: mv src_file dst_file\n");
		exit();
	}
	int fp_src = open(argv[1],O_RDONLY);
	if(fp_src == -1){
		printf(2,"mv cannot open source file %s\n", argv[1]);
		close(fp_src);
		exit();
	}

	struct stat st;
	fstat(fp_src,&st);
	if(st.type == T_DIR){
		printf(2,"mv cannot move directory %s, it can move files\n",argv[1]);
		close(fp_src);
		exit();
	}

	//if dst_file is a directory which ends up with '/', add file name from src_file to directory
	char filename[bufSize];
	strcpy(filename,argv[2]);

	int src_len = strlen(argv[1]);
	int dst_len = strlen(argv[2]);
	if(argv[2][dst_len-1] == '/'){
		int index;
		for(index = src_len-1;index >= 0;index--){
			if(argv[1][index] == '/'){
				break;
			}
		}
		index++;
		strcpy(&filename[dst_len],&argv[1][index]);
	}

	int fp_dst = open(filename,O_WRONLY | O_CREATE);
	if(fp_dst == -1){
		printf(2,"mv cannot open destination file %s\n", filename);
		close(fp_dst);
		close(fp_src);
		exit();
	}
	while((length = read(fp_src,buf,bufSize)) > 0){
		write(fp_dst,buf,bufSize);
	}

	close(fp_dst);
	close(fp_src);

	//delete file_src
	if(unlink(argv[1]) < 0){
		printf(2,"mv failed to delete file : %s\n", argv[1]);
	}


	exit();
}