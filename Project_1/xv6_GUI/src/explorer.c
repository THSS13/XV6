#include "types.h"
#include "stat.h"
#include "user.h"
#include "uwindow.h"
#include "fs.h"
#include "bitmap.h"

Window window;
Button newFolderButton;
Button backupButton;
RGB closeButtonImageViewTemp[1000];
ImageView closeButtonImageView;
IconView icon[50];
struct RGB folder[50][10000];
struct RGB buttons[10][1000];
char wd[256];
int hWind;

Window dialog;
TextBox filenameBox;
Button okButton;
RGB dialogCloseButtonImageViewTemp[1000];
ImageView dialogCloseButtonImageView;
int hDlog = -1;

void closeWindow(Widget *widget, Window *window);
void closeDialog(Widget *widget, Window *window);
void showDialog(Widget *widget, Window *window);
void newFolder(Widget *widget, Window *window);
void backup(Widget *widget, Window *window);
void refresh(Widget *widget, Window *window);

//Result: T_DIR || T_FILE || T_DEV, define in stat.h
//-1: error occured.
int
getiNodeType(char *path)
{
  struct stat st;
  
  if (stat(path, &st) < 0)
  {
    return -1;
  }
  
  return st.type;
}

char*
fmtname(char *path)
{
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  return p;
}

void suffix(char *t, char *s)
{
  int point = 0;

  while (*s != 0)
  {
    if (*s == '.')
      point = 1;
    s++;
  }
  if (point == 0)
  {
    strcpy(t, "");
    return;
  }
  while (*s != '.')
    s--;
  s++;
  strcpy(t, s);
}

void iconOnLeftDoubleClick(Widget *widget, Window *window)
{
  char s[256];
  strcpy(s, wd);
  strcat(s, "/");
  strcat(s, widget->context.iconView->text);

  char *argv1[] = { s, 0 };
  char *argv2[] = { "", s, 0};
  char t[256];

  if (getiNodeType(s) == T_DIR)
  {
    strcat(wd, "/");
    strcat(wd, widget->context.iconView->text);
    strcat(window->caption, widget->context.iconView->text);
    strcat(window->caption, "/");
    refresh(window->widgets, window);
    return;
  }
  suffix(t, s);
  if (strcmp(t, "") == 0)
  {
    if (fork() == 0)
    {
      exec(argv1[0], argv1);
      exit();
    }
  }
  else
    if (strcmp(t, "bmp") == 0)
    {
      if (fork() == 0)
      {
        strcpy(argv2[0], "imageviewer");
        exec(argv2[0], argv2);
        exit();
      }
    }
    else
    if (strcmp(t, "txt") == 0)
    {
      if (fork() == 0)
      {
        strcpy(argv2[0], "editor");
        exec(argv2[0], argv2);
        exit();
      }
    }
}

void
ls(char *path)
{
  char buf[512], *p, *tmpName;
  int fd;
  struct dirent de;
  struct stat st;
  int i = 0, j;

  if ((fd = open(path, 0)) < 0) 
  {
    return;
  }

  if (fstat(fd, &st) < 0)
  {
    return;
  }
  
  strcpy(buf, path);
  p = buf + strlen(buf);
  *p++ = '/';
  while (read(fd, &de, sizeof(de)) == sizeof(de))
  {
    if (de.inum == 0)
    {
      continue;
    }
    memmove(p, de.name, DIRSIZ);
    p[DIRSIZ] = 0;
    if (stat(buf, &st) < 0)
    {
      continue;
    }
    tmpName = fmtname(buf);
    if (strcmp(tmpName, ".") == 0 || strcmp(tmpName, "..") == 0 || st.type == T_DEV)
    {
      continue;
    }
    memset(icon + i, 0, sizeof(IconView));
    icon[i].leftTopX = 50 + (i % 6) * 140;
    icon[i].leftTopY = 150 + (i / 6) * 140;
    icon[i].image = folder[i];
    icon[i].onLeftDoubleClickHandler.handlerFunction = iconOnLeftDoubleClick;
    for (j = 0; j < strlen(tmpName); j++)
    {
      if (tmpName[j] == '.')
        break;
    }
    switch (st.type)
    {
      case T_DIR:
        readBitmapFile("folder.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        break;
      case T_FILE:
        if (tmpName[j+1] == 'b' && tmpName[j+2] == 'm' && tmpName[j+3] == 'p')
          readBitmapFile("photo.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        else
        if (tmpName[j+1] == 't' && tmpName[j+2] == 'x' && tmpName[j+3] == 't')
          readBitmapFile("text.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        else
          readBitmapFile("exec.bmp", icon[i].image, &icon[i].height, &icon[i].width);
        break;
    }
    strcpy(icon[i].text, tmpName);
    window.widgets[window.widgetsNum].type = iconView;
    window.widgets[window.widgetsNum].context.iconView = &icon[i];
    i++;
    window.widgetsNum++;
    if (i % 2 == 0) updateWindow(hWind);
  }
}

int main(int argc, char *argv[])
{
  memset(&window, 0, sizeof(Window));
  window.leftTopX = 100;
  window.leftTopY = 100;
  window.width = 900;
  window.height = 800;
  window.show = 1;
  window.hasCaption = 1;
  window.hasMenu = 1;
  window.hasFooter = 1;
  strcpy(window.caption, "Explorer:/");
  window.onFileSystemChangedHandler.handlerFunction = refresh;
  addCloseButton(&window, &closeButtonImageView, closeButtonImageViewTemp);
  closeButtonImageView.onLeftClickHandler.handlerFunction = closeWindow;
  strcpy(wd, ".");
  if (argv[1] != 0)
  {
    strcat(wd, "/");
    strcat(wd, argv[1]);
    strcat(window.caption, argv[1]);
    strcat(window.caption, "/");
  }
  newFolderButton.width = 100;
  newFolderButton.height = 50;
  newFolderButton.leftTopX = 200;
  newFolderButton.leftTopY = CAPTION_HEIGHT + BORDER_WIDTH + 10;
  newFolderButton.image = buttons[0];
  readBitmapFile("folder-plus.bmp", newFolderButton.image, &newFolderButton.height, &newFolderButton.width);
  strcpy(newFolderButton.text, "Folder");
  newFolderButton.onLeftClickHandler.handlerFunction = showDialog;
  window.widgets[window.widgetsNum].type = button;
  window.widgets[window.widgetsNum].context.button = &newFolderButton;
  window.widgetsNum++;

  backupButton.width = 100;
  backupButton.height = 50;
  backupButton.leftTopX = 60;
  backupButton.leftTopY = newFolderButton.leftTopY;
  backupButton.image = buttons[1];
  readBitmapFile("undo2.bmp", backupButton.image, &backupButton.height, &backupButton.width);
  strcpy(backupButton.text, "Back");
  backupButton.onLeftClickHandler.handlerFunction = backup;
  window.widgets[window.widgetsNum].type = button;
  window.widgets[window.widgetsNum].context.button = &backupButton;
  window.widgetsNum++;
  hWind = createWindow(&window);
  ls(wd);
  updateWindow(hWind);
  while (1) handleEvent(&window);
}

void closeWindow(Widget *widget, Window *window)
{
  wait();
  deleteWindow(hWind);
  exit();
}

void closeDialog(Widget *widget, Window *window)
{
  deleteWindow(hDlog);
  hDlog = -1;
}

void showDialog(Widget *widget, Window *window)
{
  memset(&dialog, 0, sizeof(Window));
  dialog.leftTopX = 400;
  dialog.leftTopY = 475;
  dialog.width = 350;
  dialog.height = 150;
  dialog.show = 1;
  dialog.hasCaption = 1;
  strcpy(dialog.caption, "New Folder");
  addCloseButton(&dialog, &dialogCloseButtonImageView, dialogCloseButtonImageViewTemp);
  dialogCloseButtonImageView.onLeftClickHandler.handlerFunction = closeDialog;
  filenameBox.width = 150;
  filenameBox.height = 25;
  filenameBox.leftTopX = 20;
  filenameBox.leftTopY = dialog.height - BORDER_WIDTH - filenameBox.height - 40;
  strcpy(filenameBox.text, "NewFolderName");
  filenameBox.cursor = 13;
  filenameBox.textLength = 13;
  dialog.widgets[dialog.widgetsNum].type = textBox;
  dialog.widgets[dialog.widgetsNum].context.textBox = &filenameBox;
  dialog.widgetsNum++;
  okButton.width = 100;
  okButton.height = 50;
  okButton.leftTopX = filenameBox.leftTopX + filenameBox.width + 50;
  okButton.leftTopY = filenameBox.leftTopY - 20;
  strcpy(okButton.text, "OK");
  okButton.onLeftClickHandler.handlerFunction = newFolder;
  dialog.widgets[dialog.widgetsNum].type = button;
  dialog.widgets[dialog.widgetsNum].context.button = &okButton;
  dialog.widgetsNum++; 
  hDlog = createWindow(&dialog);
  while (hDlog != -1) handleEvent(&dialog);
}

void newFolder(Widget *widget, Window *window)
{
  char s[256];
  closeDialog(widget, window);
  strcpy(s, wd);
  strcat(s, "/");
  strcat(s, filenameBox.text);
  mkdir(s);
  fileSystemChanged();
}

void backup(Widget *widget, Window *window)
{
  char *s;

  if (strcmp(wd, ".") == 0)
    return;
  s = wd;
  while (*s != 0)
    s++;
  while (*s != '/')
    s--;
  *s = 0;
  s = window->caption;
  while (*s != 0)
    s++;
  while (*s != '/')
    s--;
  s--;
  while (*s != '/')
    s--;
  s++;
  *s = 0;
  refresh(window->widgets, window);
}

void refresh(Widget *widget, Window *window)
{
  window->widgetsNum = 3;
  updateWindow(hWind);
  ls(wd);
  updateWindow(hWind);
}

