/*
 * FileName: shell_gui.c
 * Author: Liu Tongtong
 * Date: 2015.01.23
 * Version: 2.0
 *
 * TODO:
 * 1. Add a cursor to the shell
 * 2. Support the arrow keys
 * 3. Support the text editor
 * 4. Support page scrolling
 *
 */

#include "types.h"
#include "stat.h"
#include "user.h"
#include "bitmap.h"
#include "clickable.h"
#include "context.h"
#include "drawingAPI.h"
#include "message.h"

// Define the height of the header and footer
// Define the width of the left and right border
// The process of drawing is in drawingAPI.c
#define HEADERHEIGHT 22
#define FOOTERHEIGHT 22
#define LEFTWIDTH 8
#define RIGHTWIDTH 8

// Define the width and height of a character
#define CHARWIDTH 8
#define CHARHEIGHT 20

// Define the numbers of line and characters of per line
#define CHARS 80
#define LINES 20

// Define the color of the background and characters
#define BACKGROUNDCOLOR 0x0
#define CHARCOLOR 0xffff

// The buffer and indexes of the printer
char printer_buf[LINES][CHARS];
int line_index = 0;
int char_index = 0;
// If the screen is full
int isFull = 0;
int isRun = 1;

// Define the max length of the command
#define COMMANDMAXLEN 1024
char write_cmd[COMMANDMAXLEN];
int write_index = 0;

// Define the size of the read buffer
#define READBUFFERSIZE 1024
char read_buf[READBUFFERSIZE];

// Initialize the buffer of the printer
void
init_printer()
{
    int i;
    for (i = 0; i < LINES; i++) {
        memset(printer_buf[i], 0, sizeof(char) * CHARS);
    }
}

// Clean the screen
void
clean_printer(struct Context context)
{
    fill_rect(context, 0, HEADERHEIGHT, context.width,
            context.height - HEADERHEIGHT - FOOTERHEIGHT, BACKGROUNDCOLOR);
}

// Load the read_buf(0..len-1) into the buffer
// and print strings in the buffer to the screen
void
string_printer(struct Context context, char* read_buf, int len)
{
    int i, j;

    if (len < 0) {
        // If len < 0, delete characters in the buffer
        for (i = 0; i > len; i--) {
            if (char_index > 0) {
                printer_buf[line_index][--char_index] = 0;
            } else {
                break;
            }
        }
    }
    else {
        // Load the read_buf(0..len-1) into the buffer
        for (i = 0; i < len; i++) {
            if (read_buf[i] == '\n') {
                line_index++;
                if (line_index >= LINES) {
                    isFull = 1;
                    line_index = 0;
                }
                char_index = 0;
                memset(printer_buf[line_index], 0, sizeof(char) * CHARS);
            } else {
                printer_buf[line_index][char_index++] = read_buf[i];
                if (char_index >= CHARS) {
                    line_index++;
                    if (line_index >= LINES) {
                        isFull = 1;
                        line_index = 0;
                    }
                    char_index = 0;
                }
            }
        }
    }

    clean_printer(context);
    if (!isFull) {
        // The buffer isn't full.
        // Just print 0..line_index lines to the screen.
        for (i = 0; i <= line_index; i++) {
            puts_str(context, printer_buf[i], CHARCOLOR,
                    LEFTWIDTH, CHARHEIGHT * i + HEADERHEIGHT);
        }
    }
    else {
        // The buffer is full.
        // Print (line_index+1)..LINES, 0..line_index lines to the screen.
        for (i = (line_index + 1) % LINES, j = 0; j < LINES; i = (i + 1) % LINES, j++) {
            puts_str(context, printer_buf[i], CHARCOLOR,
                    LEFTWIDTH, CHARHEIGHT * j + HEADERHEIGHT);
        }
    }
}

// Store the info of the window
struct windowinfo {
    int id;
    struct Msg msg;
    struct Context context;
};

// Initialize the windowinfo
void
init_window(struct windowinfo* winfo, char* title)
{
    winfo->id = init_context(&(winfo->context),
            CHARS*CHARWIDTH + LEFTWIDTH + RIGHTWIDTH,
            LINES*CHARHEIGHT + HEADERHEIGHT + FOOTERHEIGHT);
    fill_rect(winfo->context, 0, 0,
            (winfo->context).width, (winfo->context).height, BACKGROUNDCOLOR);
    draw_window(winfo->context, title);
}

// Create the sh to run the command and build pipe between the gui and the sh.
void
create_shell(int* p_pid, int* p_rfd, int* p_wfd)
{
    char *sh_argv[] = { "shell_sh", 0, 0 };
    char rfd[2], wfd[2];
    int gui2sh_fd[2], sh2gui_fd[2];

    memset(rfd, 0, sizeof(char) * 2);
    memset(wfd, 0, sizeof(char) * 2);
    sh_argv[1] = rfd;
    sh_argv[2] = wfd;

    printf(1, "init pipe: starting pipe\n");
    if (pipe(gui2sh_fd) != 0) {
        printf(1, "init gui->sh pipe: pipe() failed\n");
        exit();
    }
    if (pipe(sh2gui_fd) != 0) {
        printf(1, "init sh->gui pipe: pipe() failed\n");
        exit();
    }
    printf(1, "init pipe: pipe is ok\n");

    printf(1, "init sh: starting sh\n");
    *p_pid = fork();
    if (*p_pid < 0) {
        printf(1, "init sh: fork failed\n");
        close(gui2sh_fd[0]);
        close(gui2sh_fd[1]);
        close(sh2gui_fd[0]);
        close(sh2gui_fd[1]);
        exit();
    }
    else if (*p_pid == 0) {
        close(gui2sh_fd[1]);
        rfd[0] = (char)gui2sh_fd[0];
        close(sh2gui_fd[0]);
        wfd[0] = (char)sh2gui_fd[1];
        exec("shell_sh", sh_argv);
        printf(1, "init sh: exec sh failed\n");
        exit();
    }
    else {
        close(gui2sh_fd[0]);
        *p_wfd = gui2sh_fd[1];
        close(sh2gui_fd[1]);
        *p_rfd = sh2gui_fd[0];
    }
}

// Initial the screen
char init_string[] = "$ ";
void
init_screen(struct Context context, int rfd)
{
    int total = 0, single = 0;
    char tmp_buf[2];

    init_printer();
    memset(write_cmd, 0, sizeof(char) * COMMANDMAXLEN);
    memset(read_buf, 0, sizeof(char) * READBUFFERSIZE);

    // Print the initial string "$ "
    while (total < strlen(init_string)) {
        if ((single = read(rfd, tmp_buf, sizeof(tmp_buf))) > 0) {
            total += single;
            string_printer(context, tmp_buf, single);
        }
    }
}

// Deal with the keydown event
void
handle_keydown(struct Context context, char ch, int rfd, int wfd) {
    int n;

    if (ch == 8) {
        // ch == 8 is delete. Delete the newest character.
        if (write_index > 0) {
            write_cmd[--write_index] = 0;
            string_printer(context, 0, -1);
        }
        return;
    }

    // append the ch to the command and display the command
    write_cmd[write_index++] = ch;
    string_printer(context, &ch, 1);

    // If user input a '\n', the command will be sent to the sh
    // and the printer will show the result.
    if (ch == '\n') {
        if (write(wfd, write_cmd, strlen(write_cmd)) != strlen(write_cmd)) {
            printf(1, "gui pipe write: failed");
        }
        else {
            // Read the result until get the initial string "$ "
            while (1) {
                if ((n = read(rfd, read_buf, READBUFFERSIZE)) > 0) {
                    string_printer(context, read_buf, n);
                    // if the read_buf ends with init_string("$ "),
                    // the result is over and stop reading.
                    if (read_buf[n - 2] == init_string[0]
                            && read_buf[n - 1] == init_string[1]) {
                        break;
                    }
                }
            }
        }
        // Clean the write_cmd buffer
        memset(write_cmd, 0, sizeof(char) * COMMANDMAXLEN);
        write_index = 0;
    }

    char toolongcmdhint[] = "\nThe command is too long!\n";
    // The command cannot be longer than write_len.
    // Otherwise show the hint and clean the write_cmd buffer.
    if (strlen(write_cmd) == COMMANDMAXLEN - 1) {
        // Print the hint
        string_printer(context, toolongcmdhint, strlen(toolongcmdhint));
        // Clean the write_cmd buffer
        memset(write_cmd, 0, sizeof(char) * COMMANDMAXLEN);
        write_index = 0;
    }
}

// Use for the close button
ClickableManager cm;
Point p;
void h_closeWnd(Point p) {
    isRun = 0;
}

Handler wndEvents[] = { h_closeWnd};
struct Icon wndRes[] = { { "close.bmp", 3, 3 } };

void addWndEvent(ClickableManager *cm) {
    int i;
    int n = sizeof(wndEvents) / sizeof(Handler);
    for (i = 0; i < n; i++) {
        printf(0, "adding handler\n");
        loadBitmap(&wndRes[i].pic, wndRes[i].name);
        createClickable(cm,
                initRect(wndRes[i].position_x, wndRes[i].position_y,
                        wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
                wndEvents[i]);
    }
}

int
main(int argc, char *argv[])
{
    struct windowinfo winfo;
    int sh_pid, rfd, wfd;

    init_window(&winfo, "I'm a SHELL");
    create_shell(&sh_pid, &rfd, &wfd);
    init_screen(winfo.context, rfd);

    cm = initClickManager(winfo.context);
    deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    addWndEvent(&cm);

    char write_cmd_ch;
    while (isRun) {
        getMsg(&(winfo.msg));
        switch(winfo.msg.msg_type) {
            case MSG_UPDATE:
                printf(1, "msg_detail %d\n", winfo.msg.msg_detail);
                updateWindow(winfo.id, winfo.context.addr, winfo.msg.msg_detail);
                break;
            case MSG_LPRESS:
                p = initPoint(winfo.msg.concrete_msg.msg_mouse.x,
                    winfo.msg.concrete_msg.msg_mouse.y);
                executeHandler(cm.left_click, p);
                break;
            case MSG_KEYDOWN:
                write_cmd_ch = winfo.msg.concrete_msg.msg_key.key;
                handle_keydown(winfo.context, write_cmd_ch, rfd, wfd);
                updateWindow(winfo.id, winfo.context.addr, winfo.msg.msg_detail);
                break;
            case MSG_PARTIAL_UPDATE:
                updatePartialWindow(winfo.id, winfo.context.addr,
                        winfo.msg.concrete_msg.msg_partial_update.x1,
                        winfo.msg.concrete_msg.msg_partial_update.y1,
                        winfo.msg.concrete_msg.msg_partial_update.x2,
                        winfo.msg.concrete_msg.msg_partial_update.y2);
                break;
            default:
                break;
        }
    }

    free_context(&(winfo.context), winfo.id);
    exit();
}
