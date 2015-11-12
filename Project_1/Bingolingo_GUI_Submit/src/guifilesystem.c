#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "colordef.h"
#include "guientity_attrvalue.h"
#include "message.h"
#include "mouse.h"

#define MAX_DIRECTORY_LEN 512
#define FOLDERTYPE 1
#define NOTYPE 0
#define FILETYPE 2
#define FILENUMINAROW 7
#define SCROLL_DISTANCE 250
#define RIGHT_CLICK_MENU_Y_POS 610

#define N_FILETYPE  1
#define N_TEXTTYPE  2
#define N_IMGTYPE   3

typedef struct lsresult
{
    char* filenames;
    char** parseresult;
    int* fileinfo;
}LSResult;

typedef struct guifilenodes
{
    uint* nodes;
    uint* icons;
    uint* titles;
    int num;
}FileNodes;

uint windowparent = 0xffffffff;
uint window;
uint path_textview;
uint loading_icon;
FileNodes filenodes;
int last_right_clicked_fileno = -1;
char* current_path;
char* last_copied_path;
char* last_moved_path;
LSResult listresult;
int file_type_to_be_operate = NOTYPE;
contentStruct folder_type_content;
contentStruct bitmap_type_content;
contentStruct file_type_content;
contentStruct text_type_content;
contentStruct close_icon_content;
contentStruct loading_icon_content;

uint j;
#define parh(x) (j=x,&j)
int xywh[4];
uint* xywhU = (uint*)xywh;
#define pari(x,y,w,h) (xywh[0]=x,xywh[1]=y,xywhU[2]=(uint)(w),xywhU[3]=(uint)(h),xywh)

void createWarningWindow(char* warning, uint parent);

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
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}

char** parseAfterls(char* result)
{
    char* tmp = (char*)malloc(15 * sizeof(char));
    memset(tmp, '\0', 15);
    int i, n = strlen(result) / 14, j, k;
    char** r = (char**)malloc(n * sizeof(char*) - 2);
    int ii = 0;
    for (i = 0; i < n; i++)
    {
        j = i * 14;
        for (k = 0; k < 14; k++)
        {
            if (result[j+k] == ' ' || result[j+k] == '\n' || result[j+k] == '\r')
            {
                break;
            }
            else
            {
                tmp[k] = result[j+k];
            }
        }
        if (strlen(tmp) != 0 && tmp[0] != '.')  //has got a file name or a folder name
        {
            r[ii] = tmp;
            ii++;
        }
        tmp = (char*)malloc(15 * sizeof(char));
        memset(tmp, '\0', 15);
    }
    return r;
}


LSResult ls(char *path)
{
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  LSResult r;

  if((fd = open(path, 0)) < 0){
    //printf(2, "ls: cannot open %s\r\n", path);
    r.filenames = (char*)malloc(2 * sizeof(char));
    memset(r.filenames, '\0', 3);
    r.fileinfo = (int*)malloc(2 * sizeof(int));
    r.parseresult = (char**)0;
    return r;
  }
  
  if(fstat(fd, &st) < 0){
    //printf(2, "ls: cannot stat %s\r\n", path);
    r.filenames = (char*)malloc(2 * sizeof(char));
    memset(r.filenames, '\0', 3);
    r.fileinfo = (int*)malloc(2 * sizeof(int));
    r.parseresult = (char**)0;
    close(fd);
    return r;
  }

  char *result = (char*)malloc(1400 * sizeof(char));
  memset(result, '\0', 1400);
  int* info = (int*)malloc(100 * sizeof(int));
  memset(info, 0, 100 * sizeof(int));
  int n = 0;
  
  switch(st.type){
  case T_FILE:
    //printf(1, "%s %d %d %d\r\n", fmtname(path), st.type, st.ino, st.size);
    strcpy(result + strlen(result), fmtname(path));
    info[n++] = st.type;
    break;
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      //printf(1, "ls: path too long\r\n");
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
        //printf(1, "ls: cannot stat %s\r\n", buf);
        continue;
      }
      //printf(1, "%s %d %d %d\r\n", fmtname(buf), st.type, st.ino, st.size);
      strcpy(result + strlen(result), fmtname(buf));
      info[n++] = st.type;
    }
    break;
  }
  close(fd);
  r.filenames = result;
  r.fileinfo = info;
  r.parseresult = parseAfterls(r.filenames);
  return r;
}


int copyfile(char* srcpath, char* destpath)
{
    int file_src, file_dest;
    if ((file_src = open(srcpath, O_RDONLY)) < 0)
    {
        //printf(2, "The file you are going to copy does not exists!!\r\n");
        createWarningWindow("file does not exists!!", window);
        return -1;
    }
    if ((file_dest = open(destpath, O_RDONLY)) >= 0)
    {
        //printf(2, "The destination you are going to copy the file has already had a file with the same name!!\r\n");
        close(file_dest);
        createWarningWindow("destination had a file with the same name!", window);
        return -1;
    }
    if ((file_dest = open(destpath, O_CREATE)) < 0)
    {
        //printf(2, "Cannot create a new file!!!\r\n");
        createWarningWindow("Cannot create a new file!", window);
        return -1;
    }
    close(file_dest);
    if ((file_dest = open(destpath, O_WRONLY)) < 0)
    {
        //printf(2, "Cannot write to the new file!!!\r\n");
        createWarningWindow("Cannot write to the new file!", window);
        return -1;
    }
    char* buff = (char*)malloc(4096 * sizeof(char));
    memset(buff, 0, 4096);
    int size;
    while((size = read(file_src, buff, 4096)) > 0)
        write(file_dest, buff, size);
    if(size < 0)
    {
        //printf(2, "copy file error!!!\r\n");
        createWarningWindow("copy file error!!", window);
        return -1;
    }
    close(file_src);
    close(file_dest);
    free(buff);
    return 0;
}

int createnewfile(char* path)
{
    int ff;
    if (((ff = open(path, O_RDONLY)) >= 0))
    {
        //printf(2, "cannot create new file, the file has existed!!!\r\n");
        close(ff);
        createWarningWindow("file has existed!", window);
        return -1;
    }
    if ((ff = open(path, O_CREATE)) < 0)
    {
        //printf(2, "cannot create new file\r\n");
        createWarningWindow("cannot create new file", window);
        return -1;
    }
    else
    {
        //printf(2, "create file success!!!\r\n");
        close(ff);
        return 0;
    }
}

/*int createnewfolder(char *foldername)
{
    if(mkdir(foldername) < 0)
    {
        //printf(2, "cannot make directory\r\n");
        createWarningWindow("cannot make directory", window);
        return -1;
    }
    else
    {
        //printf(2, "make directory success\r\n");
        return 0;
    }
}*/

//the path passed in must ensure that it is the pure name of a child of the current directory
int changedirectory(char* path) 
{
    if(chdir(path) < 0)
    {
        //printf(2, "cannot cd\r\n");
        return -1;
    }
    else
    {
        //printf(2, "cd success\r\n");
        int n = strlen(path);
        int i;
        if (n == 2 && path[0] == '.' && path[1] == '.')
        {
            if (!(strlen(current_path) == 1 && current_path[0] == '/'))
            {
                int tmpn = strlen(current_path);
                current_path[tmpn - 1] = '\0';
                for (i = tmpn - 2; i > 0; i--)
                {
                    if (current_path[i] != '/')
                        current_path[i] = '\0';
                    else
                        break;
                }
            }
        }
        else
        {
            int tmpn = strlen(current_path);
            strcpy(current_path + tmpn, path);
            tmpn = strlen(current_path);
            current_path[tmpn] = '/';
            current_path[tmpn + 1] = '\0';
        }
        return 0;
    }
}

int removefile(char* path)
{
    if (unlink(path) < 0)
    {
        //printf(2, "cannot remove, the thing you want to remove is being used!!\r\n");
        createWarningWindow("cannot remove, the file is being used!", window);
        return -1;
    }
    else
    {
        //printf(2, "remove file success!!!\r\n");
        return 0;
    }
}

int removefolder(char* path)
{
    LSResult lsr = ls(path);
    int n = strlen(lsr.filenames) / 14 - 2;
    int r;
    int pathlen = strlen(path);
    char* savedpath = (char*)malloc((pathlen + 2) * sizeof(char));
    memset(savedpath, '\0', pathlen + 2);
    strcpy(savedpath, path);
    savedpath[pathlen] = '/';
    savedpath[pathlen + 1] = '\0';
    char* tmppath = (char*)malloc(MAX_DIRECTORY_LEN);
    if (n > 0)  //there are files or folders in this folder
    {
        int i;
        for (i = 0; i < n; i++)
        {
            memset(tmppath, '\0', MAX_DIRECTORY_LEN);
            strcpy(tmppath, savedpath);
            strcpy(tmppath + strlen(tmppath), lsr.parseresult[i]);
            if (lsr.fileinfo[i+2] == FOLDERTYPE)
            {
                r = removefolder(tmppath);
                if (r == -1)
                {
                    //printf(2, "There are something wrong when recursively remove folder!!\r\n");
                    createWarningWindow("recursively remove folder wrong", window);
                    free(tmppath);
                    free(savedpath);
                    return -1;
                }
            }
            else
            {
                r = removefile(tmppath);
                if (r == -1)
                {
                    //printf(2, "There are something wrong when recursively remove file!!\r\n");
                    createWarningWindow("recursively remove file wrong", window);
                    free(tmppath);
                    free(savedpath);
                    return -1;
                }
            }
        }
    }
    if (unlink(path) < 0)
    {
        //printf(2, "There are something wrong when delete the empty folder!!!\r\n");
        createWarningWindow("delete the empty folder wrong", window);
        free(tmppath);
        free(savedpath);
        return -1;
    }
    else
    {
        //printf(2, "remove folder success!!!\r\n");
        free(tmppath);
        free(savedpath);
        return 0;
    }
}

int movefile(char* srcpath, char* destpath)
{
    if (copyfile(srcpath, destpath) == -1)
        return -1;
    if (removefile(srcpath) == -1)
        return -1;
    return 0;
}

//copyfolder("/A/B", "/C/D")   -> /C/D(B->D)
int copyfolder(char* srcpath, char* destpath)
{
    int fds;
    if((fds = open(srcpath, O_RDONLY)) < 0)
    {
        //printf(2, "The folder you want to copy does not exist!!!!\r\n");
        createWarningWindow("folder does not exist", window);
        return -1;
    }
    close(fds);
    int fdd;
    if ((fdd = open(destpath, O_RDONLY)) >= 0)
    {
        //printf(2, "The destination has already had a folder with the same name!!!\r\n");
        close(fdd);
        createWarningWindow("destination has a folder with the same name", window);
        return -1;
    }
    if (mkdir(destpath) < 0)
    {
        //printf(2, "copyfolder: cannot create the new folder!!!!\r\n");
        createWarningWindow("cannot create the new folder", window);
        return -1;
    }
    LSResult srccontent = ls(srcpath);
    int n = strlen(srccontent.filenames) / 14 - 2;
    int i;
    char* tmpsrc, *tmpdest;
    tmpsrc = (char*)malloc(MAX_DIRECTORY_LEN);
    tmpdest = (char*)malloc(MAX_DIRECTORY_LEN);
    int srclen = strlen(srcpath);
    char* savedsrc = (char*)malloc((srclen + 2) * sizeof(char));
    memset(savedsrc, '\0', srclen + 2);
    strcpy(savedsrc, srcpath);
    savedsrc[srclen] = '/';
    savedsrc[srclen+1] = '\0';
    int destlen = strlen(destpath);
    char* saveddest = (char*)malloc((destlen + 2) * sizeof(char));
    memset(saveddest, '\0', destlen + 2);
    strcpy(saveddest, destpath);
    saveddest[destlen] = '/';
    saveddest[destlen+1] = '\0';
    for (i = 0; i < n; i++)
    {
        memset(tmpsrc, '\0', MAX_DIRECTORY_LEN);
        memset(tmpdest, '\0', MAX_DIRECTORY_LEN);
        strcpy(tmpsrc, savedsrc);
        strcpy(tmpdest, saveddest);
        strcpy(tmpsrc + strlen(tmpsrc), srccontent.parseresult[i]);
        strcpy(tmpdest + strlen(tmpdest), srccontent.parseresult[i]);
        if (srccontent.fileinfo[i+2] == FOLDERTYPE)
        {
            if (copyfolder(tmpsrc, tmpdest) < 0)
            {
                //printf(2, "copyfolder: We meet some problem when recursively copy folder!!!\r\n");
                free(tmpsrc);
                free(tmpdest);
                free(savedsrc);
                free(saveddest);
                createWarningWindow("recursively copy folder wrong", window);
                return -1;
            }
        }
        else
        {
            if (copyfile(tmpsrc, tmpdest) < 0)
            {
                //printf(2, "copyfolder: We meet some problem when recursively copy file!!!\r\n");
                free(tmpsrc);
                free(tmpdest);
                free(savedsrc);
                free(saveddest);
                createWarningWindow("recursively copy file wrong", window);
                return -1;
            }
        }
    }
    free(tmpsrc);
    free(tmpdest);
    free(savedsrc);
    free(saveddest);
    //printf(2, "copyfolder: copy folder success!!!\r\n");
    return 0;
}

int movefolder(char* srcpath, char* destpath)
{
    if (copyfolder(srcpath, destpath) == -1)
    {
        //printf(2, "movefolder: There are something wrong when we copyfolder folder!!!\r\n");
        createWarningWindow("copy folder wrong", window);
        return -1;
    }
    if (removefolder(srcpath) == -1)
    {
        //printf(2, "movefolder: There are something wrong when we delete the folder!!!\r\n");
        createWarningWindow("delete folder wrong", window);
        return -1;
    }
    //printf(2, "movefolder success!!!\r\n");
    return 0;
}

//in this case, the parameter passed to here is pure filename, it don't need the concrete path
int renamefile(char* originname, char* nowname)
{
    int r = movefile(originname, nowname);
    if (r < 0)
        //printf(2, "rename fail!!!\r\n");
        createWarningWindow("rename fail", window);
    /*else
        printf(2, "rename success!!!\r\n");*/
    return r;
}

int judgeTypeByName(char* name)
{
    int t;
    if (strcmp("README", name) == 0)
        return N_TEXTTYPE;
    for (t = strlen(name) - 1; t >= 0; t--)
    {
        if (name[t] == '.')
            break;
    }
    if (t < 0)
    {
        return N_FILETYPE;
    }
    else
    {
        if (strcmp(name + t + 1, "txt") == 0)
        {
            return N_TEXTTYPE;
        }
        else if (strcmp(name + t + 1, "mx") == 0)
        {
            return N_IMGTYPE;
        }
        else
        {
            return N_FILETYPE;
        }
    }
}

void render(char** names, int num, uint parent, int* fileinfo)
{
    int i;
    filenodes.nodes = (uint*)malloc(num * sizeof(uint));
    filenodes.icons = (uint*)malloc(num * sizeof(uint));
    filenodes.titles = (uint*)malloc(num * sizeof(uint));
    filenodes.num = num;
    color32 name_color = rgba(0, 0, 0, 0);
    memset(filenodes.nodes, 0, num * sizeof(uint));
    for (i = 0; i < num; i++)
    {
        //printf(1, "%s\r\n", names[i]);
        int row = i / FILENUMINAROW;
        int col = i % FILENUMINAROW;

        createdom(GUIENT_DIV, parent, &filenodes.nodes[i]);
        setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_XYWH, pari((28 + 140 * col),(10 + 190 * row),130,180));
        // setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_X, parh(28 + 140 * col));
        // setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_Y, parh(10 + 190 * row));
        // setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_WIDTH, parh(130));
        // setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_HEIGHT, parh(180));
        setattr(GUIENT_DIV, filenodes.nodes[i], GUIATTR_DIV_INTEG, parh(1));

            createdom(GUIENT_IMG, filenodes.nodes[i], &filenodes.icons[i]);
            setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_XYWH, pari(1,2,128,128));
            // setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_X, parh(1));
            // setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_Y, parh(2));
            // setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_WIDTH, parh(128));
            // setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_HEIGHT, parh(128));
            if (fileinfo[i] == FOLDERTYPE)
            {
                setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &folder_type_content);
            }
            else if (strcmp("README", names[i]) == 0)
            {
                setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &text_type_content);
            }
            else
            {
                int typ = judgeTypeByName(names[i]);
                if (typ ==N_FILETYPE)
                {
                    setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &file_type_content);
                }
                else if (typ == N_TEXTTYPE)
                {
                    //printf(1, "txt!!!!!!!\r\n");
                    setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &text_type_content);
                }
                else if (typ == N_IMGTYPE)
                {
                    //printf(1, "bitmap!!\r\n");
                    setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &bitmap_type_content);
                }
                else
                {
                    //printf(1, "file!!!!\r\n");
                    setattr(GUIENT_IMG, filenodes.icons[i], GUIATTR_IMG_CONTENT, &file_type_content);
                }
            }

            createdom(GUIENT_TXT, filenodes.nodes[i], &filenodes.titles[i]);
            setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_XYWH, pari(5,132,120,48));
            // setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_X, parh(5));
            // setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_Y, parh(132));
            // setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_WIDTH, parh(120));
            // setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_HEIGHT, parh(48));
            setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_STR, names[i]);
            setattr(GUIENT_TXT, filenodes.titles[i], GUIATTR_TXT_COLOR, &name_color);
    }
}

int FindRightClickOnFile(uint domid, int num)
{
    int i;
    for (i = 0; i < num; i++)
    {
        if (filenodes.nodes[i] == domid)
            return i;
    }
    return -1;
}

void deletebutton_onclick()
{
    //we can add something like a dialog to remind user that their operation did not succeed later
    //printf(1, "%d\r\n", last_right_clicked_fileno);
    if (file_type_to_be_operate == FILETYPE)
    {
        removefile(listresult.parseresult[last_right_clicked_fileno]);
    }
    else
    {
        removefolder(listresult.parseresult[last_right_clicked_fileno]);
    }
    last_right_clicked_fileno = -1;
    file_type_to_be_operate = NOTYPE;
}

void copybutton_onclick()
{
    memset(last_copied_path, '\0', MAX_DIRECTORY_LEN);
    memset(last_moved_path, '\0', MAX_DIRECTORY_LEN);
    strcpy(last_copied_path, current_path);
    strcpy(last_copied_path + strlen(last_copied_path), listresult.parseresult[last_right_clicked_fileno]);
    last_right_clicked_fileno = -1;
}

void movebutton_onclick()
{
    memset(last_copied_path, '\0', MAX_DIRECTORY_LEN);
    memset(last_moved_path, '\0', MAX_DIRECTORY_LEN);
    strcpy(last_moved_path, current_path);
    strcpy(last_moved_path + strlen(last_moved_path), listresult.parseresult[last_right_clicked_fileno]);
    last_right_clicked_fileno = -1;
}

int handlepaste()
{
    int lcp = strlen(last_copied_path);
    int lmp = strlen(last_moved_path);
    if (lcp == 0 && lmp == 0)
    {
        file_type_to_be_operate = NOTYPE;
        return -1;
    }
    else if (lcp != 0)
    {
        char* tmp = (char*)malloc(MAX_DIRECTORY_LEN);
        memset(tmp, '\0', MAX_DIRECTORY_LEN);
        int i, k, ii;
        for (i = lcp - 1, k = 0; i > 0; i--)
        {
            if (last_copied_path[i] != '/')
                tmp[k++] = last_copied_path[i];
            else
                break;
        }
        char* tmp2 = (char*)malloc(k+1);
        memset(tmp2, '\0', k+1);
        for (i = 0, ii = k - 1; i < k; i++, ii--)
        {
            tmp2[i] = tmp[ii];
        }
        memset(tmp, '\0', MAX_DIRECTORY_LEN);
        strcpy(tmp, current_path);
        strcpy(tmp + strlen(tmp), tmp2);
        int pasteresult = -1;
        if (file_type_to_be_operate == FOLDERTYPE) 
            pasteresult = copyfolder(last_copied_path, tmp); 
        else if (file_type_to_be_operate == FILETYPE)
            pasteresult = copyfile(last_copied_path, tmp);
        free(tmp);
        free(tmp2);
        file_type_to_be_operate = NOTYPE;
        return pasteresult;
    }
    else if (lmp != 0)
    {
        char* tmp = (char*)malloc(MAX_DIRECTORY_LEN);
        memset(tmp, '\0', MAX_DIRECTORY_LEN);
        int i, k, ii;
        for (i = lmp - 1, k = 0; i > 0; i--)
        {
            if (last_moved_path[i] != '/')
                tmp[k++] = last_moved_path[i];
            else
                break;
        }
        char* tmp2 = (char*)malloc(k+1);
        memset(tmp2, '\0', k+1);
        for (i = 0, ii = k - 1; i < k; i++, ii--)
        {
            tmp2[i] = tmp[ii];
        }
        memset(tmp, '\0', MAX_DIRECTORY_LEN);
        strcpy(tmp, current_path);
        strcpy(tmp + strlen(tmp), tmp2);
        int pasteresult = -1;
        if (file_type_to_be_operate == FOLDERTYPE) 
            pasteresult = movefolder(last_moved_path, tmp); 
        else if (file_type_to_be_operate == FILETYPE)
            pasteresult = movefile(last_moved_path, tmp);
        free(tmp);
        free(tmp2);
        file_type_to_be_operate = NOTYPE;
        return pasteresult;
    }
    return -1;
}

void pastebutton_onclick()
{
    if (handlepaste() >= 0)
    {
        memset(last_moved_path, '\0', MAX_DIRECTORY_LEN);
        memset(last_copied_path, '\0', MAX_DIRECTORY_LEN);
    }
    else
    {
        createWarningWindow("operation fail", window);
    }
}

void releasefilenodes()
{
    int i;
    for (i = 0; i < filenodes.num; i++)
    {
        releasedom(GUIENT_TXT, filenodes.titles[i]);
        releasedom(GUIENT_IMG, filenodes.icons[i]);
        releasedom(GUIENT_DIV, filenodes.nodes[i]);
    }
    free(filenodes.nodes);
    filenodes.num = 0;
}

void invalidate(uint parent)
{
    int i;
    free(listresult.filenames);
    for (i = 0; i < filenodes.num; i++)
        free(listresult.parseresult[i]);
    free(listresult.parseresult);
    free(listresult.fileinfo);

    releasefilenodes();

    setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_STR, current_path);

    listresult = ls(current_path);
    int n = strlen(listresult.filenames) / 14 - 2;
    render(listresult.parseresult, n, parent, listresult.fileinfo + 2); //the first two are . and ..
}

uchar *readImg(char *fileName, uchar picMode)   //0:3channel,1:4channel
{
    int fd1 = open(fileName, 0);
    if (fd1 < 0)
    {
        //printf(1, "open file error\n");
        return 0;
    }
    uchar w,h;
    read(fd1, &w, 1);
    read(fd1, &h, 1);
    int size=(uint)w*(uint)h,i;
    uchar *p=malloc(size*4+10);
    uchar *q,*tp,*tq;
    p[0]=w;
    p[1]=h;
    if (picMode==1)
    {
        read(fd1, p+2, size*4);
    }
    else if (picMode==0)
    {
        q=malloc(size*3+4);
        read(fd1, q, size*3);
        tp=p+2;
        tq=q;
        for (i=0;i<size;i++)
        {
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=*(q++);
            *(tp++)=0;
        }
        free(tq);
    }
    close(fd1);

    return p;
}

void createWarningWindow(char* warning, uint parent)
{
    uint dialog;
        uint dialog_titlebar;
            uint dialog_closebutton;
                uint dialog_closeicon;
        uint warning_textview;
        uint okbutton;
            uint oktext;


    color32 dialog_background = rgba(255, 255, 255, 0);
    color32 dialog_titlebar_color = rgba(210, 174, 142, 0);
    color32 warning_textcolor = rgba(0, 0, 0, 0);
    color32 okbutton_color = rgba(0, 255, 0, 0);
    color32 dialog_closebutton_color = rgba(200, 80, 81, 0);

    char* ok = "OK";


    createdom(GUIENT_DIV, parent, &dialog);
    setattr(GUIENT_DIV, dialog, GUIATTR_DIV_XYWH, pari(300,250,500,155));
    // setattr(GUIENT_DIV, dialog, GUIATTR_DIV_X, parh(300));
    // setattr(GUIENT_DIV, dialog, GUIATTR_DIV_Y, parh(250));
    // setattr(GUIENT_DIV, dialog, GUIATTR_DIV_WIDTH, parh(500));
    // setattr(GUIENT_DIV, dialog, GUIATTR_DIV_HEIGHT, parh(155));
    setattr(GUIENT_DIV, dialog, GUIATTR_DIV_BGCOLOR, &dialog_background);

        createdom(GUIENT_DIV, dialog, &dialog_titlebar);
        setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_XYWH, pari(0,0,500,35));
        // setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_Y, parh(0));
        // setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_WIDTH, parh(500));
        // setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_HEIGHT, parh(35));
        setattr(GUIENT_DIV, dialog_titlebar, GUIATTR_DIV_BGCOLOR, &dialog_titlebar_color);

            createdom(GUIENT_DIV, dialog_titlebar, &dialog_closebutton);
            setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_XYWH, pari(449,0,51,30));
            // setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_X, parh(449));
            // setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_Y, parh(0));
            // setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_WIDTH, parh(51));
            // setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_HEIGHT, parh(30));
            setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_BGCOLOR, &dialog_closebutton_color);
            setattr(GUIENT_DIV, dialog_closebutton, GUIATTR_DIV_INTEG, parh(1));

                createdom(GUIENT_IMG, dialog_closebutton, &dialog_closeicon);
                setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_XYWH, pari(18,7,17,17));
                // setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_X, parh(18));
                // setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_Y, parh(7));
                // setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_WIDTH, parh(17));
                // setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_HEIGHT, parh(17));
                setattr(GUIENT_IMG, dialog_closeicon, GUIATTR_IMG_CONTENT, &close_icon_content);

        createdom(GUIENT_TXT, dialog, &warning_textview);
        setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_XYWH, pari(10,45,480,72));
        // setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_X, parh(10));
        // setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_Y, parh(45));
        // setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_WIDTH, parh(480));
        // setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_HEIGHT, parh(72));
        setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_STR, warning);
        setattr(GUIENT_TXT, warning_textview, GUIATTR_TXT_COLOR, &warning_textcolor);

        createdom(GUIENT_DIV, dialog, &okbutton);
        setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_XYWH, pari(215,125,70,24));
        // setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_X, parh(215));
        // setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_Y, parh(125));
        // setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_WIDTH, parh(70));
        // setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_HEIGHT, parh(24));
        setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_BGCOLOR, &okbutton_color);
        setattr(GUIENT_DIV, okbutton, GUIATTR_DIV_INTEG, parh(1));

            createdom(GUIENT_TXT, okbutton, &oktext);
            setattr(GUIENT_TXT, oktext, GUIATTR_TXT_XYWH, pari(20,0,30,24));
            // setattr(GUIENT_TXT, oktext, GUIATTR_TXT_X, parh(20));
            // setattr(GUIENT_TXT, oktext, GUIATTR_TXT_Y, parh(0));
            // setattr(GUIENT_TXT, oktext, GUIATTR_TXT_WIDTH, parh(30));
            // setattr(GUIENT_TXT, oktext, GUIATTR_TXT_HEIGHT, parh(24));
            setattr(GUIENT_TXT, oktext, GUIATTR_TXT_STR, ok);
            setattr(GUIENT_TXT, oktext, GUIATTR_TXT_COLOR, &warning_textcolor);

    //message handler
    int *dmsg = (int*)malloc(100);
    MouseMsg* dmm;
    while(1)
    {
        getmsgfromqueue(dmsg);
        if (*dmsg == MOUSE_MESSAGE)
        {
            dmm = (MouseMsg*)dmsg;
            if ((dmm->mouse_event_type & LEFT_BTN_UP) != 0)
            {
                if (dmm->dom_id == dialog_closebutton || dmm->dom_id == okbutton)
                    break;
            }
        }
    }

    //============release
    releasedom(GUIENT_IMG, dialog_closeicon);
    releasedom(GUIENT_TXT, warning_textview);
    releasedom(GUIENT_TXT, oktext);
    releasedom(GUIENT_DIV, dialog);

    free(dmsg);
}

uint cvtS2U(char* str)
{
    uint ret=0;
    while (*str!=0)
    {
        ret=ret*10+(*str-'0');
        str++;
    }
    return ret;
}

char* UInt2String(uint num)
{
    uint i;
    int k;
    char* tmp = (char*)malloc(25 * sizeof(char));
    memset(tmp, '\0', 25);
    for (i = num, k = 0; i != 0;)
    {
        tmp[k++] = (i % 10) + '0';
        i = i / 10;
    }
    int n = strlen(tmp);
    char* result = (char*)malloc(25);
    memset(result, '\0', 25);
    for (i = 0, k = n - 1; i < n; i++, k--)
        result[i] = tmp[k];
    free(tmp);
    return result;
}

int main(int argc, char *argv[])
{
    initprocessqueue();
    
    //======init path variable
    current_path = (char*)malloc(MAX_DIRECTORY_LEN * sizeof(char));
    memset(current_path, '\0', MAX_DIRECTORY_LEN);
    last_copied_path = (char*)malloc(MAX_DIRECTORY_LEN * sizeof(char));
    memset(last_copied_path, '\0', MAX_DIRECTORY_LEN);
    last_moved_path = (char*)malloc(MAX_DIRECTORY_LEN * sizeof(char));
    memset(last_moved_path, '\0', MAX_DIRECTORY_LEN);
    current_path[0] = '/';

    windowparent = cvtS2U(argv[0]);


    //===========create window
    //uint window;
        uint titlebar;
            uint window_title;
            uint closebutton;
                uint close_icon;

        uint toolbar;
            uint gobackbutton;
            uint path_textview_father;
                //uint path_textview;
            uint upbutton;
            uint downbutton;

        uint separator;

        uint scrollviewfather;
            uint scrollview;
        uint right_click_onfile;
            uint openbutton;
            uint delete_button;
            uint copy_button;
            uint move_button;
            uint rename_button;
        uint right_click_onwindow;
            uint new_folder_button;
            uint new_file_button;
            uint paste_button;


    color32 window_background = rgba(255, 255, 255, 0);
    color32 titlebar_color = rgba(210, 174, 142, 0);
    color32 closebutton_color = rgba(200, 80, 81, 0);
    color32 right_click_onfile_color = rgba(202, 203, 203, 0);
    color32 right_click_onwindow_color = rgba(202, 203, 203, 0);
    color32 separator_color = rgba(169, 160, 137, 0);
    color32 window_title_color = rgba(0, 0, 0, 0);

    char* window_title_text = "File Explorer";

    close_icon_content.pics = readImg("/close.mx", 1);
    close_icon_content.isRepeat = 0;
    contentStruct gobackbutton_content;
    gobackbutton_content.pics = readImg("/goback.mx", 1);
    gobackbutton_content.isRepeat = 0;
    contentStruct upbutton_content;
    upbutton_content.pics = readImg("/up.mx", 1);
    upbutton_content.isRepeat = 0;
    contentStruct downbutton_content;
    downbutton_content.pics = readImg("/down.mx", 1);
    downbutton_content.isRepeat = 0;
    folder_type_content.pics = readImg("/folder.mx", 1);
    folder_type_content.isRepeat = 0;
    bitmap_type_content.pics = readImg("/bitmap.mx", 1);
    bitmap_type_content.isRepeat = 0;
    file_type_content.pics = readImg("/file.mx", 1);
    file_type_content.isRepeat = 0;
    text_type_content.pics = readImg("/text.mx", 1);
    text_type_content.isRepeat = 0;
    contentStruct openbutton_content;
    openbutton_content.pics = readImg("/openfile.mx", 1);
    openbutton_content.isRepeat = 0;
    contentStruct delete_button_content;
    delete_button_content.pics = readImg("/delete.mx", 1);
    delete_button_content.isRepeat = 0;
    contentStruct copy_button_content;
    copy_button_content.pics = readImg("/copy.mx", 1);
    copy_button_content.isRepeat = 0;
    contentStruct move_button_content;
    move_button_content.pics = readImg("/scissors.mx", 1);
    move_button_content.isRepeat = 0;
    contentStruct rename_button_content;
    rename_button_content.pics = readImg("/rename.mx", 1);
    rename_button_content.isRepeat = 0;
    contentStruct new_folder_button_content;
    new_folder_button_content.pics = readImg("/newfolder.mx", 1);
    new_folder_button_content.isRepeat = 0;
    contentStruct new_file_button_content;
    new_file_button_content.pics = readImg("/newfile.mx", 1);
    new_file_button_content.isRepeat = 0;
    contentStruct paste_button_content;
    paste_button_content.pics = readImg("/paste.mx", 1);
    paste_button_content.isRepeat = 0;
    loading_icon_content.pics = readImg("/loading.mx", 1);
    loading_icon_content.isRepeat = 0;
    

    createdom(GUIENT_DIV, windowparent, &window);
    setattr(GUIENT_DIV, window, GUIATTR_DIV_XYWH, pari(0,0,1024,768));
    // setattr(GUIENT_DIV, window, GUIATTR_DIV_X, parh(0));
    // setattr(GUIENT_DIV, window, GUIATTR_DIV_Y, parh(0));
    // setattr(GUIENT_DIV, window, GUIATTR_DIV_WIDTH, parh(1024));
    // setattr(GUIENT_DIV, window, GUIATTR_DIV_HEIGHT, parh(768));
    setattr(GUIENT_DIV, window, GUIATTR_DIV_BGCOLOR, &window_background);

        createdom(GUIENT_DIV, window, &scrollviewfather);
        setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_XYWH, pari(0,95,1024,673));
        // setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_Y, parh(95));
        // setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_HEIGHT, parh(673));
        setattr(GUIENT_DIV, scrollviewfather, GUIATTR_DIV_BGCOLOR, &window_background);

        createdom(GUIENT_DIV, window, &titlebar);
        setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_XYWH, pari(0,0,1024,35));
        // setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_Y, parh(0));
        // setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_HEIGHT, parh(35));
        setattr(GUIENT_DIV, titlebar, GUIATTR_DIV_BGCOLOR, &titlebar_color);

            createdom(GUIENT_TXT, titlebar, &window_title);
            setattr(GUIENT_TXT, window_title, GUIATTR_TXT_XYWH, pari(440,3,200,24));
            // setattr(GUIENT_TXT, window_title, GUIATTR_TXT_X, parh(440));
            // setattr(GUIENT_TXT, window_title, GUIATTR_TXT_Y, parh(3));
            // setattr(GUIENT_TXT, window_title, GUIATTR_TXT_WIDTH, parh(200));
            // setattr(GUIENT_TXT, window_title, GUIATTR_TXT_HEIGHT, parh(24));
            setattr(GUIENT_TXT, window_title, GUIATTR_TXT_STR, window_title_text);
            setattr(GUIENT_TXT, window_title, GUIATTR_TXT_COLOR, &window_title_color);

            createdom(GUIENT_DIV, titlebar, &closebutton);
            setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_XYWH, pari(973,0,51,30));
            // setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_X, parh(973));
            // setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_Y, parh(0));
            // setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_WIDTH, parh(51));
            // setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_HEIGHT, parh(30));
            setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_BGCOLOR, &closebutton_color);
            setattr(GUIENT_DIV, closebutton, GUIATTR_DIV_INTEG, parh(1));

                createdom(GUIENT_IMG, closebutton, &close_icon);
                setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_XYWH, pari(18,7,17,17));
                // setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_X, parh(18));
                // setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_Y, parh(7));
                // setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_WIDTH, parh(17));
                // setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_HEIGHT, parh(17));
                setattr(GUIENT_IMG, close_icon, GUIATTR_IMG_CONTENT, &close_icon_content);

        createdom(GUIENT_DIV, window, &toolbar);
        setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_XYWH, pari(0,35,1024,55));
        // setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_Y, parh(35));
        // setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_HEIGHT, parh(55));
        setattr(GUIENT_DIV, toolbar, GUIATTR_DIV_BGCOLOR, &window_background);

            createdom(GUIENT_IMG, toolbar, &gobackbutton);
            setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_XYWH, pari(17,17,30,30));
            // setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_X, parh(17));
            // setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_Y, parh(17));
            // setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_WIDTH, parh(30));
            // setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_HEIGHT, parh(30));
            setattr(GUIENT_IMG, gobackbutton, GUIATTR_IMG_CONTENT, &gobackbutton_content);

            createdom(GUIENT_DIV, toolbar, &path_textview_father);
            setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_XYWH, pari(55,17,810,24));
            // setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_X, parh(55));
            // setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_Y, parh(17));
            // setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_WIDTH, parh(810));
            // setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_HEIGHT, parh(24));
            setattr(GUIENT_DIV, path_textview_father, GUIATTR_DIV_BGCOLOR, &window_background);

                createdom(GUIENT_TXT, path_textview_father, &path_textview);
                setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_XYWH, pari(0,0,810,24));
                // setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_X, parh(0));
                // setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_Y, parh(0));
                // setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_WIDTH, parh(810));
                // setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_HEIGHT, parh(24));
                setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_STR, current_path);
                setattr(GUIENT_TXT, path_textview, GUIATTR_TXT_COLOR, &window_title_color);
    
            createdom(GUIENT_IMG, toolbar, &upbutton);
            setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_XYWH, pari(872,17,32,32));
            // setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_X, parh(872));
            // setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_Y, parh(17));
            // setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_WIDTH, parh(32));
            // setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_HEIGHT, parh(32));
            setattr(GUIENT_IMG, upbutton, GUIATTR_IMG_CONTENT, &upbutton_content);
    
            createdom(GUIENT_IMG, toolbar, &downbutton);
            setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_XYWH, pari(934,17,32,32));
            // setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_X, parh(934));
            // setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_Y, parh(17));
            // setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_WIDTH, parh(32));
            // setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_HEIGHT, parh(32));
            setattr(GUIENT_IMG, downbutton, GUIATTR_IMG_CONTENT, &downbutton_content);

        createdom(GUIENT_DIV, window, &separator);
        setattr(GUIENT_DIV, separator, GUIATTR_DIV_XYWH, pari(0,90,1024,1));
        // setattr(GUIENT_DIV, separator, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, separator, GUIATTR_DIV_Y, parh(90));
        // setattr(GUIENT_DIV, separator, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, separator, GUIATTR_DIV_HEIGHT, parh(1));
        setattr(GUIENT_DIV, separator, GUIATTR_DIV_BGCOLOR, &separator_color);

        createdom(GUIENT_IMG, window, &loading_icon);
        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_XYWH, pari(450,320,128,128));
        // setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_X, parh(333));
        // setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(333));
        // setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_WIDTH, parh(128));
        // setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_HEIGHT, parh(128));
        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_CONTENT, &loading_icon_content);

        createdom(GUIENT_DIV, window, &right_click_onfile);
        setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_XYWH, pari(0,768,1024,158));
        // setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_Y, parh(768));  //change between 610 and 768
        // setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_HEIGHT, parh(158));
        setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_BGCOLOR, &right_click_onfile_color);

            createdom(GUIENT_IMG, right_click_onfile, &openbutton);
            setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_XYWH, pari(37,39,80,80));
            // setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_X, parh(37));
            // setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, openbutton, GUIATTR_IMG_CONTENT, &openbutton_content);

            createdom(GUIENT_IMG, right_click_onfile, &delete_button);
            setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_XYWH, pari(252,39,80,80));
            // setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_X, parh(252));
            // setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, delete_button, GUIATTR_IMG_CONTENT, &delete_button_content);

            createdom(GUIENT_IMG, right_click_onfile, &copy_button);
            setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_XYWH, pari(472,39,80,80));
            // setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_X, parh(472));
            // setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, copy_button, GUIATTR_IMG_CONTENT, &copy_button_content);

            createdom(GUIENT_IMG, right_click_onfile, &move_button);
            setattr(GUIENT_IMG, move_button, GUIATTR_IMG_XYWH, pari(692,39,80,80));
            // setattr(GUIENT_IMG, move_button, GUIATTR_IMG_X, parh(692));
            // setattr(GUIENT_IMG, move_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, move_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, move_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, move_button, GUIATTR_IMG_CONTENT, &move_button_content);

            createdom(GUIENT_IMG, right_click_onfile, &rename_button);
            setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_XYWH, pari(912,39,80,80));
            // setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_X, parh(912));
            // setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, rename_button, GUIATTR_IMG_CONTENT, &rename_button_content);

        createdom(GUIENT_DIV, window, &right_click_onwindow);
        setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_XYWH, pari(0,768,1024,158));
        // setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_Y, parh(768));  //change between 610 and 768
        // setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_HEIGHT, parh(158));
        setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_BGCOLOR, &right_click_onwindow_color);

            createdom(GUIENT_IMG, right_click_onwindow, &new_folder_button);
            setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_XYWH, pari(252,39,80,80));
            // setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_X, parh(252));
            // setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, new_folder_button, GUIATTR_IMG_CONTENT, &new_folder_button_content);

            createdom(GUIENT_IMG, right_click_onwindow, &new_file_button);
            setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_XYWH, pari(477,39,80,80));
            // setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_X, parh(477));
            // setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, new_file_button, GUIATTR_IMG_CONTENT, &new_file_button_content);

            createdom(GUIENT_IMG, right_click_onwindow, &paste_button);
            setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_XYWH, pari(692,39,80,80));
            // setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_X, parh(692));
            // setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_Y, parh(39));
            // setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_WIDTH, parh(80));
            // setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_HEIGHT, parh(80));
            setattr(GUIENT_IMG, paste_button, GUIATTR_IMG_CONTENT, &paste_button_content);

        //=====ls and render the whole directory
        listresult = ls(".");
        int n = strlen(listresult.filenames) / 14 - 2;
        int rowno = n / FILENUMINAROW + 1;
        createdom(GUIENT_DIV, scrollviewfather, &scrollview);
        setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_XYWH, pari(0,0,1024,(190 * rowno + 10)));
        // setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_X, parh(0));
        // setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, parh(0));
        // setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_WIDTH, parh(1024));
        // setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_HEIGHT, parh(190 * rowno + 10));
        setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_BGCOLOR, &window_background);
        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
        render(listresult.parseresult, n, scrollview, listresult.fileinfo + 2); //the first two are . and ..
        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));

    //==========receive events
    int *msg = (int*)malloc(100);
    MouseMsg* mm;
    while(1)
    {
        getmsgfromqueue(msg);
        if (*msg == MOUSE_MESSAGE)
        {
            mm = (MouseMsg*)msg;
            if ((mm->mouse_event_type & RIGHT_BTN_UP) != 0) //right button up
            {
                if (mm->dom_id == window || mm->dom_id == scrollview)   //right button up on window
                {
                    setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_Y, parh(RIGHT_CLICK_MENU_Y_POS));
                    //printf(1, "I'm in!!!!!!!!\r\n");
                }
                else
                {
                    last_right_clicked_fileno = FindRightClickOnFile(mm->dom_id, filenodes.num);
                    if (last_right_clicked_fileno != -1)
                    {
                        setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_Y, parh(RIGHT_CLICK_MENU_Y_POS));
                        file_type_to_be_operate = (listresult.fileinfo[last_right_clicked_fileno + 2] == FOLDERTYPE)? FOLDERTYPE: FILETYPE;
                    }
                }
            }
            else if (mm->mouse_event_type != 0)
            {
                if ((mm->mouse_event_type & LEFT_BTN_UP) != 0)
                {
                    if (mm->dom_id == closebutton)  //close the application
                    {
                        break;
                    }
                    else if (mm->dom_id == delete_button) //here I used switch but failed
                    {
                        deletebutton_onclick();
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                        invalidate(scrollview);
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                    }
                    else if (mm->dom_id == copy_button)
                    {
                        copybutton_onclick();
                    }
                    else if (mm->dom_id == move_button)
                    {
                        movebutton_onclick();
                    }
                    else if (mm->dom_id == paste_button)
                    {
                        pastebutton_onclick();
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                        invalidate(scrollview);
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                    }
                    else if (mm->dom_id == gobackbutton)
                    {
                        changedirectory("..");
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                        invalidate(scrollview);
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                    }
                    else if (mm->dom_id == upbutton)
                    {
                        int y;
                        getattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, &y);
                        y = y + SCROLL_DISTANCE;
                        setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, &y);
                    }
                    else if (mm->dom_id == downbutton)
                    {
                        int y;
                        getattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, &y);
                        y = y - SCROLL_DISTANCE;
                        setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, &y);
                    }
                    else if (mm->dom_id == new_file_button)
                    {
                        if (fork() == 0)
                        {//mode: 1->new file   2->new folder  3->rename
                            char* a[5];
                            a[4] = (char*)0;
                            a[0] = "newfile";
                            a[1] = current_path;
                            a[2] = "1";
                            a[3] = UInt2String(windowparent);
                            exec("/fshandlekbd", a);
                        }
                        wait();
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                        invalidate(scrollview);
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                    }
                    else if (mm->dom_id == new_folder_button)
                    {
                        if (fork() == 0)
                        {//mode: 1->new file   2->new folder  3->rename
                            char* a[5];
                            a[4] = (char*)0;
                            a[0] = "newfolder";
                            a[1] = current_path;
                            a[2] = "2";
                            a[3] = UInt2String(windowparent);
                            exec("/fshandlekbd", a);
                        }
                        wait();
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                        invalidate(scrollview);
                        setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                    }
                    else if (mm->dom_id == rename_button)
                    {
                        if (listresult.fileinfo[last_right_clicked_fileno + 2] == FOLDERTYPE)
                        {
                            createWarningWindow("We can't rename folder!", window);
                        }
                        else
                        {
                            if (fork() == 0)
                            {//mode: 1->new file   2->new folder  3->rename
                                char* a[5];
                                a[4] = (char*)0;
                                a[0] = listresult.parseresult[last_right_clicked_fileno];
                                a[1] = current_path;
                                a[2] = "3";
                                a[3] = UInt2String(windowparent);
                                exec("/fshandlekbd", a);
                            }
                            wait();
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                            invalidate(scrollview);
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                        }
                    }
                    else if (mm->dom_id == openbutton)
                    {
                        if (listresult.fileinfo[last_right_clicked_fileno + 2] == FOLDERTYPE)
                        {
                            changedirectory(listresult.parseresult[last_right_clicked_fileno]);
                            setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, parh(0));
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                            invalidate(scrollview);
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                        }
                        else
                        {
                            int typ = 0;
                            typ = judgeTypeByName(listresult.parseresult[last_right_clicked_fileno]);
                            if (typ == N_TEXTTYPE)
                            {
                                char* s = (char*)malloc(MAX_DIRECTORY_LEN);
                                memset(s, '\0', MAX_DIRECTORY_LEN);
                                strcpy(s, current_path);
                                strcpy(s + strlen(s), listresult.parseresult[last_right_clicked_fileno]);
                                informhometoopenfile("fileEditor", s);
                            }
                            else if (typ == N_IMGTYPE)
                            {
                                char* s = (char*)malloc(MAX_DIRECTORY_LEN);
                                memset(s, '\0', MAX_DIRECTORY_LEN);
                                strcpy(s, current_path);
                                strcpy(s + strlen(s), listresult.parseresult[last_right_clicked_fileno]);
                                informhometoopenfile("picviewer", s);
                            }
                            else if (typ == N_FILETYPE)
                            {
                                createWarningWindow("Unknown type, Can't open!", window);
                            }
                        }
                    }
                    else    //open folder or file
                    {
                        int nodeno = FindRightClickOnFile(mm->dom_id, filenodes.num);
                        if (nodeno != -1 && listresult.fileinfo[nodeno + 2] == FOLDERTYPE)
                        {
                            changedirectory(listresult.parseresult[nodeno]);
                            setattr(GUIENT_DIV, scrollview, GUIATTR_DIV_Y, parh(0));
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(320));
                            invalidate(scrollview);
                            setattr(GUIENT_IMG, loading_icon, GUIATTR_IMG_Y, parh(-222));
                        }
                        else
                        {
                            int typ = 0;
                            typ = judgeTypeByName(listresult.parseresult[nodeno]);
                            if (typ == N_TEXTTYPE)
                            {
                                char* s = (char*)malloc(MAX_DIRECTORY_LEN);
                                memset(s, '\0', MAX_DIRECTORY_LEN);
                                strcpy(s, current_path);
                                strcpy(s + strlen(s), listresult.parseresult[nodeno]);
                                informhometoopenfile("fileEditor", s);
                            }
                            else if (typ == N_IMGTYPE)
                            {
                                char* s = (char*)malloc(MAX_DIRECTORY_LEN);
                                memset(s, '\0', MAX_DIRECTORY_LEN);
                                strcpy(s, current_path);
                                strcpy(s + strlen(s), listresult.parseresult[nodeno]);
                                informhometoopenfile("picviewer", s);
                            }
                        }
                    }
                }
                setattr(GUIENT_DIV, right_click_onwindow, GUIATTR_DIV_Y, parh(768));
                setattr(GUIENT_DIV, right_click_onfile, GUIATTR_DIV_Y, parh(768));
            }
        }
    }


    //=======release window
    free(last_moved_path);
    free(last_copied_path);
    free(current_path);
    free(close_icon_content.pics);
    free(gobackbutton_content.pics);
    free(upbutton_content.pics);
    free(downbutton_content.pics);
    free(text_type_content.pics);
    free(file_type_content.pics);
    free(folder_type_content.pics);
    free(bitmap_type_content.pics);
    free(openbutton_content.pics);
    free(delete_button_content.pics);
    free(copy_button_content.pics);
    free(move_button_content.pics);
    free(rename_button_content.pics);
    free(new_folder_button_content.pics);
    free(new_file_button_content.pics);
    free(paste_button_content.pics);
    free(listresult.filenames);
    int i1;
    for (i1 = 0; i1 < filenodes.num; i1++)
        free(listresult.parseresult[i1]);
    free(listresult.parseresult);
    free(listresult.fileinfo);

    //we must release text and img first and div can cascade release.
    releasedom(GUIENT_TXT, window_title);
    releasedom(GUIENT_TXT, path_textview);
    releasedom(GUIENT_IMG, close_icon);
    releasedom(GUIENT_IMG, gobackbutton);
    releasedom(GUIENT_IMG, upbutton);
    releasedom(GUIENT_IMG, downbutton);
    releasedom(GUIENT_IMG, openbutton);
    releasedom(GUIENT_IMG, delete_button);
    releasedom(GUIENT_IMG, copy_button);
    releasedom(GUIENT_IMG, move_button);
    releasedom(GUIENT_IMG, rename_button);
    releasedom(GUIENT_IMG, new_folder_button);
    releasedom(GUIENT_IMG, new_file_button);
    releasedom(GUIENT_IMG, paste_button);
    releasedom(GUIENT_IMG, loading_icon);
    releasefilenodes();
    releasedom(GUIENT_DIV, window);

    releaseprocessqueue();
    free(msg);

    exit();
}