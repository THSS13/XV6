#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc,char* argv[]){
	printf(1,"Thanks for using xv6\n");
	printf(1,"These shell commands are defined internally\n");
	printf(1,"Use command \"ls\" to list files in current directory\n");
	printf(1,"USe command \"mkdir files...\" to create directory\n");
	printf(1,"USe command \"rm files...\" to remove file or empty directory\n");
	printf(1,"USe command \"head files...\" to see the fist ten lines of a file\n");
	printf(1,"USe command \"tail files...\" to see the last ten lines of a file\n");
	printf(1,"USe command \"cat files...\" to see the content in normal order\n");
	printf(1,"USe command \"cat > files...\" to create a file and write something\n");
	printf(1,"USe command \"tac files...\" to see the content in reverse order\n");
	printf(1,"USe command \"rename src_file dst_file\" to rename a file\n");
	printf(1,"USe command \"cp src_file dst_file\" to copy a file to new place\n");
	printf(1,"USe command \"mv src_file dst_file\" to move a file to another place and delete the origin file\n");
	printf(1,"USe command \"mkdir files...\" to create directory\n");
	printf(1,"USe command \"cd path\" to change current directory\n");
	printf(1,"USe input \"Ctr+c\" to exit current process\n");	
	printf(1,"Have a nice day!\n");
	exit();
}