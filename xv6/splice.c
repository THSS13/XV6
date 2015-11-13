#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


char buf[512];
void write_bet_fds(int src_fd, int dst_fd);
/*
* This function is made to do files catch
* The result text will be stored in the dst_file
*/
void
splice(int num, char *src_files[], char* dst_file){//源文件数、源文件名[]、目标文件名
	int src_fd, dst_fd;
	int i;
	for (i=0;i<num;i++)
	{
		printf(2, "%d:%s\n", i, src_files[i]);
	}
	if ((dst_fd = open(dst_file, O_WRONLY | O_CREATE)) < 0){
		printf(1, "splice: cannot open %s\n", dst_file);
		chdir("/");
		exit();
	}
	for (i = 0; i < num; i++){
		if ((src_fd = open(src_files[i], O_RDONLY)) < 0){
			printf(1, "splice: cannot open %s\n", src_files[i]);
			close(src_fd);
			close(dst_fd);
			chdir("/");
			exit();
		}
		write_bet_fds(src_fd, dst_fd);//粘文件内容
		close(src_fd);
	}
	close(dst_fd);
}

void
write_bet_fds(int src_fd, int dst_fd){//把src_fd粘到dst_fd后，pattern表示是否加行号
	int n;
//	int line_len = 0;
//	int unfinish_flag = 0;
//	char sp = ' ';
//	char pi[100];
//	char* head_buf;
//	char* pc = &sp;

	memset(buf, 0, strlen(buf));  // clear the buffer

	while ((n = read(src_fd, buf, sizeof(buf))) > 0){
		write(dst_fd, buf, strlen(buf));
		memset(buf, 0, strlen(buf));  // clear the buffer
	}

	if (n < 0){
		printf(1, "splice: read error\n");
		chdir("/");
		exit();
	}
}

int
main(int argc, char *argv[])
{
	//char *dir;
	if (argc <= 1){//只输入一个splice而不输入参数时
		printf(2, "Usage: splice many files to one file...\n");
		chdir("/");//切换默认目录
		exit();//终止进程
	}
	//dir = argv[argc];//dir变成最后一个传入参数，也就是目标文件名
	//chdir(dir);
	
	// format: cat filename
	// read the content of filename
	if (argc <= 3){//后面只带一两个参数
		printf(2, "Use a format:\'splice src_file1 src_file2 dst_file\'\n");
		chdir("/");
		exit();
	}
	else{//cat的参数>=3个
		//参数大于两个的时候，拼接文件
		splice(argc - 2, argv + 1, argv[argc - 1]);
	}
	chdir("/");
	exit();
}

