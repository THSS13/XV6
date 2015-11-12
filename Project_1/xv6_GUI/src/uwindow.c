#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "uwindow.h"

void handleEvent(Window *window)
{
  int i;

  if ((window->onFileSystemChangedHandler.triggered == 1) && (window->onFileSystemChangedHandler.handlerFunction != 0))
  {
    window->onFileSystemChangedHandler.handlerFunction(window->widgets, window);
    window->onFileSystemChangedHandler.triggered = 0;
  }

  for (i = 0; i < window->widgetsNum; i++)
    switch (window->widgets[i].type)
    {
    case button:
      if ((window->widgets[i].context.button->onLeftClickHandler.triggered == 1) && (window->widgets[i].context.button->onLeftClickHandler.handlerFunction != 0))
      {
        window->widgets[i].context.button->onLeftClickHandler.handlerFunction(window->widgets + i, window);
        window->widgets[i].context.button->onLeftClickHandler.triggered = 0;
      }
      break;
    case imageView:
      if ((window->widgets[i].context.imageView->onLeftClickHandler.triggered == 1) && (window->widgets[i].context.imageView->onLeftClickHandler.handlerFunction != 0))
      {
        window->widgets[i].context.imageView->onLeftClickHandler.handlerFunction(window->widgets + i, window);
        window->widgets[i].context.imageView->onLeftClickHandler.triggered = 0;
      }
      break;
    case iconView:
      if ((window->widgets[i].context.iconView->onLeftDoubleClickHandler.triggered == 1) && (window->widgets[i].context.iconView->onLeftDoubleClickHandler.handlerFunction != 0))
      {
        window->widgets[i].context.iconView->onLeftDoubleClickHandler.handlerFunction(window->widgets + i, window);
        window->widgets[i].context.iconView->onLeftDoubleClickHandler.triggered = 0;
      }
      break;
    default:
      break;
    }
}

void addCloseButton(Window *window, ImageView *closeButtonImageView, RGB *closeButtonImageViewTemp)
{
  // int i, j;
  // RGB *t;

  memset(closeButtonImageView, 0, sizeof(ImageView));
  closeButtonImageView->leftTopX = window->width - 25;
  closeButtonImageView->leftTopY = 5;
  closeButtonImageView->image = closeButtonImageViewTemp;
  closeButtonImageView->alphaBG = 1;
  readBitmapFile("cross.bmp", closeButtonImageView->image, &(closeButtonImageView->height), &(closeButtonImageView->width));
  // t = closeButtonImageViewTemp;
  // for (j = 0; j < closeButtonImageView->height; j++)
  //   for (i = 0; i < closeButtonImageView->width; i++)
  //   {
  //     if (i + j == 10 || i +j == 11 || i + j == 9|| i == j || i == j-1 || i-1 == j)
  //     {
  //       t->R = 0x00;
  //     t->G = 0x00;
  //     t->B = 0x00;
  //     }
  //     else
  //     {
  //       t->R = 0xff;
  //       t->G = 0xff;
  //       t->B = 0xff;
  //     }
  //     t++;
  //   }
  window->widgets[window->widgetsNum].type = imageView;
  window->widgets[window->widgetsNum].context.imageView = closeButtonImageView;
  window->widgetsNum++;
}

