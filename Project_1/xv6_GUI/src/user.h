struct stat;
struct rtcdate;
struct ImageView;
struct Window;
struct RGB;

// system calls
int fork(void);
int exit(void) __attribute__((noreturn));
int wait(void);
int pipe(int*);
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
int getpid(void);
char* sbrk(int);
int sleep(int);
int uptime(void);
int createWindow(struct Window *window);
int deleteWindow(int hWind);
int updateWindow(int hWind);
int fileSystemChanged();

// ulib.c
int stat(char*, struct stat*);
char* strcpy(char*, char*);
char* strcat(char*, char*);
void *memmove(void*, void*, int);
char* strchr(const char*, char c);
int strcmp(const char*, const char*);
void printf(int, char*, ...);
char* gets(char*, int max);
uint strlen(char*);
void* memset(void*, int, uint);
void* malloc(uint);
void free(void*);
int atoi(const char*);

// uwindow.c
void handleEvent(struct Window *window);
void addCloseButton(struct Window *window, struct ImageView *closeButtonImageView, struct RGB *closeButtonImageViewTemp);

// bitmap.c
int readBitmapFile(char *fileName, struct RGB *result, int *height, int *width);

