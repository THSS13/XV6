#include "types.h"
#include "stat.h"
#include "user.h"
#include "uwindow.h"
#include "bitmap.h"

Window window;
ImageView image;
RGB temp[1310720];
RGB closeButtonImageViewTemp[1000];
ImageView closeButtonImageView;
int hWind;

void closeWindow(Widget *widget, Window *window);

int main(int argc, char *argv[])
{
  memset(&window, 0, sizeof(Window));
  window.leftTopX = 300;
  window.leftTopY = 200;
  window.width = 600;
  window.height = 500;
  window.show = 1;
  window.hasCaption = 1;
  window.hasMenu = 0;
  window.hasFooter = 1;
  strcpy(window.caption, "ImageViewer");
  addCloseButton(&window, &closeButtonImageView, closeButtonImageViewTemp);
  closeButtonImageView.onLeftClickHandler.handlerFunction = closeWindow;
  if (argv[1] != 0)
  {
    memset(&image, 0, sizeof(ImageView));
    image.image = temp;
    readBitmapFile(argv[1], image.image, &image.height, &image.width);
    if ((image.width > window.width) || (image.height > window.height))
      exit();
    image.leftTopX = (window.width >> 1) - (image.width >> 1);
    image.leftTopY = (window.height >> 1) - (image.height >> 1);
    window.widgets[window.widgetsNum].type = imageView;
    window.widgets[window.widgetsNum].context.imageView = &image;
    window.widgetsNum++;
  }
  hWind = createWindow(&window);
  while (1) handleEvent(&window);
}

void closeWindow(Widget *widget, Window *window)
{
  deleteWindow(hWind);
  exit();
}

