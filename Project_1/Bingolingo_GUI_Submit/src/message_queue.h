/*
** It defines the form of the 
** message, the first member means
** the type of the message, the second
** member is the actual message struct.
** It also defines the message queue.
** The first two elements of the queue
** is the head and the tail of the queue.
*/

/*
**  Premise headers:
**      types.h
*/

#define MAX_PROCESS_NUM	1024

#define QUEUE_SIZE (4 * 1024 - 2 * sizeof(int)) / (sizeof(void*))

typedef struct message_queue
{
	int head;
	int tail;
	void** queue[QUEUE_SIZE];
} MsgQueue;

MsgQueue** process_message_map;

int initProcessMsgMap();
int initProcessQueue(int pid);
int releaseProcessQueue(int pid);
void enqueue(int pid, void* message);
void dequeue(int pid, void* result);
void informHomeToOpenFile(char* process_name, char* file_name);