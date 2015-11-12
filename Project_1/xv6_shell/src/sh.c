// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "history.h"
#include "stat.h"
#include "fs.h"
// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5

#define MAXARGS 10

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

struct history hs;

void initHistory(struct history* hs);
void addHistory(struct history* hs,char* cmd);
void getHistory(struct history* hs);
void setHistory(char* cmd);

#define FILENUMBER 100
#define FILELENGTH 128

struct fileList
{
  int len;
  char list[FILENUMBER][FILELENGTH];
};
struct fileList filelist;
struct fileList templist;
void printFilelsit(struct fileList* fl);
void getFilelist(char *path,struct fileList *fl);
void addFilelist(struct fileList *fl,char* filename);
void initFilelist();
char* fmtname(char *path);
int matchesPattern( char* input, char* pattern);
int checkWildcards(char *str);
void getMatchList(char* filename,struct fileList *allfile,struct fileList *matchfile);

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  initFilelist(&filelist);
  initFilelist(&templist);

  if(cmd == 0)
    exit();
  
  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();

    //add wildcard judgement
    getFilelist(".",&filelist);
    int i;
    for(i = 1;ecmd->argv[i] != 0;i++){
      if(checkWildcards(ecmd->argv[i])){
        getMatchList(ecmd->argv[i],&filelist,&templist);
      }
    }
    for(i = 0;i < templist.len;i++){
      if(ecmd->argv[i+1] == 0){
        ecmd->argv[i+1] = malloc((MAXARGS)*sizeof(char));
        ecmd->argv[i+1][0] = '\0';
      }
      int l = strlen(templist.list[i]);
      strcpy(ecmd->argv[i+1],templist.list[i]);
      ecmd->argv[i+1][l] = '\0';
    }


    exec(ecmd->argv[0], ecmd->argv);
    printf(2,"exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
    }
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
      runcmd(lcmd->left);
    wait();
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
    close(p[1]);
    wait();
    wait();
    break;
    
  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
}

void
printcwd(char *currentpath)
{
  int len;
  if (currentpath[1] != 0){
    currentpath[(len = strlen(currentpath)) - 1] = 0;
    printf(2, "%s$ ", currentpath);
    currentpath[len - 1] = '/';
  }else{
    printf(2, "%s$ ", currentpath);
  }
}

void
renewline(char* buf, int nbuf)
{
  int j;
  for(j = 0; buf[j]; j++){
    clearc();
  }
  for(j = 0; buf[j]; j++){
    insertc(buf[j]);
  }
  memset(buf, 0, nbuf);
}

int
getcmd(char *buf, int nbuf, char *currentpath)
{
  int i, flag = 0, j;
  //char buf0[nbuf];
  printcwd(currentpath);
  
  memset(buf, 0, nbuf);
  char c;
  for(i=0; i+1 < nbuf; ){ 
    c = getc();
    if (c != ' ' && i != 0){
      if (buf[i -1] == ' '){
        flag = i;
      }
    }
   
    if(c+256 == 0xE2){//key_up
      clearc();
      if (hs.length != H_NUMBER && hs.curcmd == 0){
        renewline(buf, nbuf);
        i = 0;
        flag = 0;
        continue;
      }      
      if (hs.curcmd == (hs.lastcmd + 1) % H_NUMBER){
        renewline(buf, nbuf);
        i = 0;
        flag = 0;
        continue;
      }
      for(j = 0; buf[j]; j++){
        clearc();
      } 
      hs.curcmd = (hs.curcmd + H_NUMBER - 1) % H_NUMBER;
      for(j = 0; hs.record[hs.curcmd][j]; j++ )
        insertc(hs.record[hs.curcmd][j]);
      i = 0;
      flag = 0;
      strcpy(buf, hs.record[hs.curcmd]);
      continue;
    }
    if (c+256 == 0xE3){//key_down
      clearc();
      if (hs.curcmd != hs.lastcmd){
        hs.curcmd = (hs.curcmd + 1) % H_NUMBER;
      }
      for(j = 0; buf[j]; j++){
        clearc();
      }
      for(j = 0; hs.record[hs.curcmd][j]; j++ )
        insertc(hs.record[hs.curcmd][j]);
      i = 0;
      flag = 0;
      strcpy(buf, hs.record[hs.curcmd]);
      continue;
    }
    if (c == 9){//tab
      clearc();
      initFilelist(&filelist);
      initFilelist(&templist);

      getFilelist("/",&filelist);
      
      buf[i] = '*';
      if(checkWildcards(buf + flag)){
        getMatchList(buf + flag, &filelist, &templist);
      }
      if (templist.len == 1){
        for (; templist.list[0][i - flag]; i++){
          buf[i] = templist.list[0][i - flag];
          printf(1, "%c", buf[i]);        
        }
        renewline(buf, nbuf);
        i = 0;
        flag = 0;
        continue;
      }
      if (templist.len > 1){
        buf[i] = '\0';
        printf(1, "\n");
        for (j = 0; j < templist.len; j++){
          printf(1, "%s    ", templist.list[j]);
        }
        printf(2, "\n");
        printcwd(currentpath);
        j = 0;
        while(buf[j]){
          insertc(buf[j++]);
        }
        memset(buf, 0, nbuf);
        i = 0;
        flag = 0;
        continue;
      }
      buf[i] = '\0';
      renewline(buf, nbuf);
      i = 0;
      flag = 0;
      continue;
    }/*
    if (c == 9 && flag != 1){
      clearc();
      buf[i] = '\0';
      renewline(buf, nbuf);
      i = 0;
      flag = 0;
      continue;
    }*/
    if(c == '\n' || c == '\r')
      break;
    buf[i++] = c;
  }
  buf[i] = '\0';
  //gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return 0;
  return 0;
}

static char*
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
  len = path - s;
  memmove(name, s, len);
  name[len] = 0;
  while(*path == '/')
    path++;
  return path;
}

static int
updatecurrentpath(char *path, char *currentpath)
{
  int i, j;
  char name[255];
  if(*path == '/'){
    strcpy(currentpath, "/");
    return 0;
  }

  while((path = skipelem(path, name)) != 0){
    if (strcmp(name, ".") == 0){
      continue;
    }
    if (strcmp(name, "..") == 0){
      for (i = 0; currentpath[i]; i++)
        ;
      i--;
      if (i == 0){
        continue;
      }
      while (1){
        currentpath[i--] = 0;
        if (currentpath[i] == '/'){
          break;
        }
      }
      continue;
    }
    for (i = 0; currentpath[i]; i++)
      ;
    for (j = 0; name[j]; j++){
      currentpath[i++] = name[j];    
    }
    currentpath[i++] = '/';
    currentpath[i] = 0;
      
  }
  
  return 0;
}



int
main(void)
{
  static char buf[100];
  int fd;
  initHistory(&hs);
  getHistory(&hs);
  passHistory(&hs);
  
  char currentpath[255];
  // Assumes three file descriptors open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }
  strcpy(currentpath, "/");
  // Read and run input commands.
  while(getcmd(buf, sizeof(buf), currentpath) >= 0){
    addHistory(&hs, buf);
    passHistory(&hs);
    setHistory(buf);
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Clumsy but will have to do for now.
      // Chdir has no effect on the parent if run in the child.
      //buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0){
        printf(2, "cannot cd %s\n", buf+3);
      }else{
        updatecurrentpath(buf+3, currentpath);    
      }
      continue;
    }
    if(buf[0] == 'p' && buf[1] == 'w' && buf[2] == 'd'){
      printf(2,"%s\n",currentpath);
      continue;
    }
    setconsole(-1, 0, 0, -1, 1);
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
    setconsole(-1, 0, 0, -1, 0);
  }
  
  exit();
}



void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;
  
  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";


int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  case '1':
    if(*(s+1) == '>'){
      if(*(s+2) == '>'){
        ret = '+';
        s += 3;      
      }else{
        ret = '>';
        s += 2;
      }
      break;
    }
  case '2':
    if(*(s+1) == '>'){
      if(*(s+2) == '>'){
        ret = '/';
        s += 3;      
      }else{
        ret = '*';
        s += 2;
      }
      break;
    }
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;
  
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;
  
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "12<>")){
    if (((*ps)[0] == '1' || (*ps)[0] == '2') && (*ps)[1] != '>'){
      break;
    }
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_OVER, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_ADD, 1);
      break;
    case '*':  // 2>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_OVER, 2);
      break;
    case '/':  // 2>>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_ADD, 2);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;
  
  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax!");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
  
  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;
    
  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}

void initHistory(struct history* hs){
  hs->length = 1;
  hs->curcmd = 0;
  hs->lastcmd = 0;
}

void addHistory(struct history* hs, char* cmd){
  if (cmd[0] == '\n')
    return;
  int l = strlen(cmd);
  int last = hs->lastcmd;
  strcpy(hs->record[last], cmd);
  if (hs->record[last][l - 1] == '\n')
    hs->record[last][l - 1] = '\0';
  last = (last + 1) % H_NUMBER;
  hs->record[last][0] = '\0';
  hs->lastcmd = last;
  hs->curcmd = last;
  if (hs->length < H_NUMBER)
    hs->length++;
}

void getHistory(struct history* hs){ 
  const int bufSize = 128;
  int fp = open("/.history", O_RDONLY | O_CREATE);
  int i, length, pos;

  char buf[bufSize];
  char tmp[bufSize];

  pos = 0;
  initHistory(hs);
  while ((length = read(fp, buf, bufSize)) > 0){
    for (i = 0; i < length; ++i){
      if (buf[i] == '\n'){
        tmp[pos] = '\0';
        addHistory(hs, tmp);
        pos = 0;
      }
      else{
        tmp[pos++] = buf[i];
      }
    }
  }

  close(fp);
}

void setHistory(char* cmd){
    int fp = open("/.history", O_WRONLY | O_CREATE | O_ADD);
    write(fp, cmd, strlen(cmd));
    write(fp, "\n", 1);
    close(fp);
}

/*
void setHistory(struct history* hs){
  if (!hs || hs->length == 0)
    return ;

  int fp = open("/.history",O_WRONLY | O_CREATE | O_ADD);  
  int pos, last;

  last = hs->lastcmd;
  if (hs->length == H_NUMBER){
    pos = last + 1;
  }
  else{
    pos = 0;
  }

  while (pos != last){
    write(fp, hs->record[pos], strlen(hs->record[pos]));
    write(fp, "\n", 1);
    pos = (pos + 1) % H_NUMBER;
  }

  close(fp);
}
*/

//input = filename
//pattern = char[] contains wildcards
//0 = no match
//1 = match
//When pattern is "" will return a match
int
matchesPattern( char* input, char* pattern)
{
  int i, z;
  if(pattern[0] == '\0')
    return 1;    
  for(i = 0; pattern[i] != '\0'; i++){
    if(pattern[i] == '\0'){
      return 0; //Pattern has ended but still some left, meaning no match
    }
        
    else if(pattern[i] == '?'){
      continue; //? replaces a character, no need to check if there is a match
    }
        
    else if(pattern[i] == '*'){
      //Pattern has matched up until now, but now need to check
      //the rest of the pattern
            
      //Checking for the match of pattern starting after the *
      //If the match isn't found, shift input by 1 and check again
      //If no match is found then pattern doesn't exist
      for(z = i; input[z] != '\0'; z++){
        if(matchesPattern(input + z, pattern + i + 1) == 1)
        {
          //Pattern found, return true
          return 1;
        }
      }
      //If this line was hit the pattern after * couldn't be found anywhere
      return 0;
    }
    else if(pattern[i] == '['){
        int j;
        int match = 0;
        int flag = 0;
        //find
        for (j = i+1; ; j++) {
            if(pattern[j] == ']'){
                break;
            }
            if (pattern[j] == '-') {
                flag++;
            }
        }
        if(flag >= 2){
            return 0;//Wrong wildcard format
        }
        if(flag == 0){
            int k;
            for(k = i+1;k<j;k++){
                if(pattern[k] == input[i]){
                    match = 1;
                }
            }
        }
        else{
            int len = pattern[j-1] - pattern[i+1] +1;
            int k;
            char p = pattern[i+1];
            for(k = 0;k < len;k++){
                if(p == input[i]){
                    match = 1;
                }
                p++;
            }
        }
        if(match >= 1){
            if(matchesPattern(input+i+1, pattern+j+1) == 1){
                return 1;
            }
            else{
                return 0;
            }
        }
        else{
            return 0;
        }
        
    }
    else if(pattern[i] != input[i]){
      return 0; //Didn't match input
    }
    //Characters matched, keep continuing
  }
  //To hit here the current pattern must contain no * and must have all characters matching
  return 1;
}

char*
fmtname(char *path)
{
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  buf[strlen(p)]=0;//memmove(buf+strlen(p), 0, DIRSIZ-strlen(p));
  return buf;
}

void initFilelist(struct fileList * fl){
  fl->len = 0;
  int i;
  for(i = 0;i < FILENUMBER;i++){
    fl->list[i][0] = '\0';
  }
}

void addFilelist(struct fileList *fl,char* filename){
  if(fl->len >= FILENUMBER)
    return;
  strcpy(fl->list[fl->len],filename);
  //printf(2,"%d : %s\n",fl->len,fl->list[fl->len]);
  fl->len++;
}

void getFilelist(char *path,struct fileList *fl)
{
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  if((fd = open(path, 0)) < 0){
    //printf(2, "ls: cannot open %s\n", path);
    return;
  }
  
  if(fstat(fd, &st) < 0){
    //printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }
  
  switch(st.type){
  case T_FILE:
    //printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    //printf(2,"%s\n",fmtname(path));
    addFilelist(fl,fmtname(path));
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      //printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
      //printf(2,"%s\n",fmtname(buf));
      addFilelist(fl,fmtname(buf));
    }
    break;
  }
  close(fd);
}

void printFilelsit(struct fileList* fl){
  int i;
  for(i = 0; i < fl->len;i++){
    printf(2,"%d File Name: %s\n",i,fl->list[i] );
  }

}

int checkWildcards(char *str){
  int i;
  for(i = 0;str[i] != '\0';i++){
    if(str[i] == '*' || str[i] == '?'){
      return 1;
    }
    if(str[i] == '['){
      int j;
      for(j = i+1;str[j] != '\0';j++){
        if(str[j] == ']'){
          return 1;
        }
      }
    }
  }
  return 0;
}

void getMatchList(char* filename,struct fileList *allfile,struct fileList *matchfile){
  int i;
  int len = allfile->len;
  for(i = 0;i < len;i++){
    if(matchesPattern(allfile->list[i],filename)){
      addFilelist(matchfile,allfile->list[i]);
    }
  }
}

