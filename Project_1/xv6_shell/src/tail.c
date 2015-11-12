#include "types.h"
#include "stat.h"
#include "user.h"

void tail(int fp,int num){
	const int bufSize = 128;
	char buf[bufSize];
	char** record = malloc(sizeof(char *) * num);
	int i,length;
	int index = 0;
	int counter = 0;
	int pos = 0;
	for(i = 0;i < num;i++){
		record[i] = malloc(sizeof(char) * bufSize);
		record[i][0] = '\0';
	}
	while((length = read(fp,buf,bufSize)) > 0){
		for(i = 0;i < length;++i){
			if(buf[i] == '\n'){
				record[index][pos] = '\0';
				counter++;
				index = (index + 1) % num;
				pos = 0;
			}
			else{
				record[index][pos++] = buf[i];
			}
		}		
	}
	if(counter <= num){
		for(i = 0;i < counter;i++){
			printf(2,"%d : %s\n",(i+1),record[i]);
		}
	}
	else{
		int _index = index;
		for(i = 1;i <= num;i++){						
			printf(2,"%d : %s\n",(counter-num+i),record[_index]);
			_index = (_index + 1) % num;
		}
	}
	for(i = 0; i < num;i++){
		free(record[i]);
	}
	free(record);
}

int main(int argc,char* argv[]){
	int i;
	int fp;
	if(argc < 2){
		printf(2, "Usage: tail files...\n");
		exit();
	}
	for(i = 1;i < argc;i++){
		if((fp = open(argv[i],0)) < 0){
			printf(2,"tail : cannot open %s\n",argv[i]);
			exit();
		}
		tail(fp,10);
		close(fp);
	}
	exit();
}