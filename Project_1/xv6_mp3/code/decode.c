#include "types.h"
#include "user.h"
int main(int argc,char *argv[])
{
	if(argv[1][0]=='w')
	{
		while (1)
			wavdecode();
		//wavdecode_wav();
		exit();	
	}
	while (1)
		wavdecode();
	exit();
}
