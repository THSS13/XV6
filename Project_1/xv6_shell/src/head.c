#include "types.h"
#include "stat.h"
#include "user.h"

void head(int fp,int num){
	int i,pos,length;
	const int bufSize = 128;
	char buf[bufSize];
	char tmp[bufSize];
	int couter = 0;
	while((length = read(fp,buf,bufSize)) > 0){
		for(i = 0;i < length;++i){
			if(buf[i] == '\n'){
				tmp[pos] = '\0';
				couter++;
				printf(2,"%d : %s\n",couter,tmp);
				pos = 0;
				if(couter == num){
					return;
				}
			}
			else{
				tmp[pos++] = buf[i];
			}
		}
		
	}
}

int main(int argc,char* argv[]){
	int i;
	int fp;
	if(argc < 2){
		printf(2, "Usage: head files...\n");
		exit();
	}
	for(i = 1;i < argc;i++){
		if((fp = open(argv[i],0)) < 0){
			printf(2,"head : cannot open %s\n",argv[i]);
			exit();
		}
		head(fp,10);
		close(fp);
	}
	exit();
}