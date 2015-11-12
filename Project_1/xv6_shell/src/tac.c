#include "types.h"
#include "stat.h"
#include "user.h"

#define BUFSIZE 128

struct node
{
	char content[BUFSIZE];
	struct node *next;
};

struct node* addCotent(struct node *list,char *str){
	if(list->content[0] == '\0'){
		strcpy(list->content,str);
		list->next = 0;
		return list;
	}
	else{
		struct node *_head = (struct node *) malloc(sizeof(struct node));
		strcpy(_head->content,str);
		_head->next = list;
		list = _head;
		return _head;
	}
}

void printNode(struct node* head){
	struct node* tmp = head;
	while(tmp != 0){
		printf(2,"%s\n",tmp->content);
		tmp = tmp->next;
	}

}

void freeNode(struct node* head){
	while(1){
		if(head == 0){
			break;
		}
		struct node *tmp = head;
		head = head->next;
		tmp->next = 0;
		free(tmp);
	}
}

void tac(int fp){
  int i, length, pos;
  const int bufSize = 128;
  char buf[bufSize];
  char tmp[bufSize];

  struct node *head = (struct node *) malloc(sizeof(struct node));
  head->content[0] = '\0';
  head->next = 0;
  pos = 0;
  while ((length = read(fp, buf, bufSize)) > 0){
    for (i = 0; i < length; ++i){
      if (buf[i] == '\n'){
        tmp[pos] = '\0';
        head = addCotent(head, tmp);
        pos = 0;
      }
      else{
        tmp[pos++] = buf[i];
      }
    }
  }  
  printNode(head);
  freeNode(head);
}


int main(int argc,char* argv[]){
	int i;
	int fp;
	if(argc < 2){
		printf(2, "Usage: tac files...\n");
		exit();
	}
	for(i = 1;i < argc;i++){
		if((fp = open(argv[i],0)) < 0){
			printf(2,"head : cannot open %s\n",argv[i]);
			exit();
		}
		tac(fp);
		close(fp);
	}
	exit();
}