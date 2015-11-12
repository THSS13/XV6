#include "defs.h"
#define MAX_WINDOW_NUM 32
#define MAX_WIDGET_NUM 32
#define MAX_STRING_NUM 256

typedef enum WidgetType
{
  label,
  textBox,
  button,
  imageView,
  iconView
} WidgetType;

typedef struct Widget Widget;
typedef struct Window Window;

typedef struct Handler
{
  int triggered;
  void (*handlerFunction)(Widget *widget, Window *window);
} Handler;

typedef struct Label
{
  int leftTopX, leftTopY, width, height;
  char text[MAX_STRING_NUM];
} Label;

typedef struct TextBox
{
  int fixed;
  int leftTopX, leftTopY, width, height, cursor;
  int textLength;
  char text[MAX_STRING_NUM];
} TextBox;

typedef struct Button
{
  struct RGB *image;
  int leftTopX, leftTopY, width, height;
  char text[MAX_STRING_NUM];
  Handler onLeftClickHandler;
} Button;

typedef struct ImageView
{
  int leftTopX, leftTopY, width, height;
  int alphaBG;
  struct RGB* image;
  Handler onLeftClickHandler;
} ImageView;

typedef struct IconView
{
  int leftTopX, leftTopY, width, height;
  struct RGB* image;
  char text[MAX_STRING_NUM];
  Handler onLeftDoubleClickHandler;
} IconView;

typedef union WidgetContext
{
  Label* label;
  TextBox* textBox;
  Button* button;
  ImageView* imageView;
  IconView* iconView;
} WidgetContext;

typedef struct Widget
{
  WidgetType type;
  WidgetContext context;
} Widget;

typedef struct Window
{
  int show;
  int hasCaption;
  int hasMenu;
  int hasFooter;
  int last_leftTopX, last_leftTopY;
  int leftTopX, leftTopY, width, height;
  char caption[MAX_STRING_NUM];
  int widgetsNum;
  Widget widgets[MAX_WIDGET_NUM];
  Handler onFileSystemChangedHandler;
} Window;

typedef struct WindowQueue
{
  struct proc* proc;
  Window *window;
  struct WindowQueue *next;
  struct WindowQueue *prev;
} WindowQueue;

