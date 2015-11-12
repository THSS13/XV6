#include "types.h"
#include "fcntl.h"
#include "uwindow.h"
#include "stat.h"
#include "user.h"

static TextBox text_box;

Window mainwindow;
static int hWind,fd;
RGB closeButtonImageViewTemp[1000];
RGB saveButtonImageViewTemp[1000];
ImageView closeButtonImageView;
ImageView saveButtonImageView;
Button saveFileButton;
RGB buttons[1000];

Window dialog;
TextBox filenameBox;
Button okButton;
RGB dialogCloseButtonImageViewTemp[1000];
ImageView dialogCloseButtonImageView;
int hDlog = -1;

void closeWindow(Widget *widget, Window *window);
void closeDialog(Widget *widget, Window *window);
void showDialog(Widget *widget, Window *window);
void saveFile(Widget *widget, Window *window);

void cat(int fdi)
{
  int n;

  n = read(fdi, text_box.text, sizeof(text_box.text));
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
  text_box.cursor = n;
  text_box.textLength = n;
}

int main(int argc,char *argv[])
{
  memset(&mainwindow, 0, sizeof(Window));
  mainwindow.leftTopX = 300;
  mainwindow.leftTopY = 200;
  mainwindow.width = 800;
  mainwindow.height = 600;
  mainwindow.show = 1;
  mainwindow.hasCaption = 1;
  mainwindow.hasMenu = 1;
  mainwindow.hasFooter = 1;
  addCloseButton(&mainwindow, &closeButtonImageView, closeButtonImageViewTemp);
  closeButtonImageView.onLeftClickHandler.handlerFunction = closeWindow;
  memset(&text_box, 0, sizeof(TextBox));
  text_box.cursor = 0;
  if (argv[1] != 0)
  {
    strcpy(mainwindow.caption, argv[1]);
    if((fd = open(argv[1], O_RDONLY)) < 0){
      printf(1, "cat: cannot open %s\n", argv[1]);
      exit();
    }
    cat(fd);
    close(fd);
  }
  else
  {
    strcpy(mainwindow.caption, "NewFile.txt");
    text_box.text[0] = '\0';
    text_box.cursor = 0;
    text_box.textLength = 0;
  }
  text_box.leftTopX = 10;
  text_box.leftTopY = 105;
  text_box.width = 780;
  text_box.height = 465;
  mainwindow.widgets[mainwindow.widgetsNum].type = textBox;
  mainwindow.widgets[mainwindow.widgetsNum].context.textBox = &text_box;
  mainwindow.widgetsNum++;
  memset(&saveFileButton, 0, sizeof(Button));
  saveFileButton.width = 100;
  saveFileButton.height = 50;
  saveFileButton.leftTopX = 30;
  saveFileButton.leftTopY = 50;
  saveFileButton.image = buttons;
  readBitmapFile("logo.bmp", saveFileButton.image, &saveFileButton.height, &saveFileButton.width);
  strcpy(saveFileButton.text, "Save");
  saveFileButton.onLeftClickHandler.handlerFunction = showDialog;
  mainwindow.widgets[mainwindow.widgetsNum].type = button;
  mainwindow.widgets[mainwindow.widgetsNum].context.button = &saveFileButton;
  mainwindow.widgetsNum++;
 
  hWind = createWindow(&mainwindow);
  while(1)
  {
    handleEvent(&mainwindow);
  }
  exit();
}

void closeWindow(Widget *widget, Window *window)
{
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
  dialog.leftTopY = 375;
  dialog.width = 350;
  dialog.height = 150;
  dialog.show = 1;
  dialog.hasCaption = 1;
  strcpy(dialog.caption, "Save File");
  addCloseButton(&dialog, &dialogCloseButtonImageView, dialogCloseButtonImageViewTemp);
  dialogCloseButtonImageView.onLeftClickHandler.handlerFunction = closeDialog;
  filenameBox.width = 150;
  filenameBox.height = 25;
  filenameBox.leftTopX = 20;
  filenameBox.leftTopY = dialog.height - BORDER_WIDTH - filenameBox.height - 40;
  strcpy(filenameBox.text, window->caption);
  filenameBox.cursor = filenameBox.textLength = strlen(filenameBox.text);
  dialog.widgets[dialog.widgetsNum].type = textBox;
  dialog.widgets[dialog.widgetsNum].context.textBox = &filenameBox;
  dialog.widgetsNum++;
  okButton.width = 100;
  okButton.height = 50;
  okButton.leftTopX = filenameBox.leftTopX + filenameBox.width + 50;
  okButton.leftTopY = filenameBox.leftTopY - 20;
  strcpy(okButton.text, "OK");
  okButton.onLeftClickHandler.handlerFunction = saveFile;
  dialog.widgets[dialog.widgetsNum].type = button;
  dialog.widgets[dialog.widgetsNum].context.button = &okButton;
  dialog.widgetsNum++; 
  hDlog = createWindow(&dialog);
  while (hDlog != -1) handleEvent(&dialog);
}

void saveFile(Widget *widget, Window *window)
{
  closeDialog(widget, window);
  int fd = open(filenameBox.text, O_WRONLY);
  char isNewFile = 0;

  if (fd < 0)
  {
    fd = open(filenameBox.text, O_CREATE);
    if (fd < 0)
    {
      return;
    }
    close(fd);
    fd = open(filenameBox.text, O_WRONLY);
    if (fd < 0)
    {
      return;
    }
    isNewFile = 1;
  }
  write(fd, text_box.text, strlen(text_box.text) + 1);
  close(fd);
  if (isNewFile)
  {
    strcpy(mainwindow.caption, filenameBox.text);
    updateWindow(hWind);
    fileSystemChanged();
  }
}

