#include "common.h"

struct stat;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
int kwrite(void*, int);
int write(int, void*, int);
int read(int, void*, int);
int close(int);
int kill(int);
int exec(char*, char**);
int open(char*, int);
int mknod(char*, short, short);
int unlink(char*);
int fstat(int fd, struct stat*);
int link(char*, char*);
int mkdir(char*);
int chdir(char*);
int dup(int);
int getpid();
char* sbrk(int);
int sleep(int);
int uptime();
int setSampleRate(int);
int pause();
int wavdecode();
int beginDecode();
int waitForDecode();
int endDecode();
int getCoreBuf();

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
void *memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
unsigned int strlen(char*);
void* memset(void*, int, unsigned int);
void* malloc(unsigned int);
void free(void*);
int atoi(const char*);
void sscanf(char *str, char *fmt, ...);

int iBreak(int ptr);