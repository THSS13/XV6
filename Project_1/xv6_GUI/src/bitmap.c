#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "uwindow.h" 
#include "bitmap.h"

void readBitmapHeader(int bmpFile, BITMAP_FILE_HEADER *bmpFileHeader, BITMAP_INFO_HEADER *bmpInfoHeader)
{
  // Read Bitmap file header
  read(bmpFile, bmpFileHeader, sizeof(BITMAP_FILE_HEADER));

  // Read Bitmap info header
  read(bmpFile, bmpInfoHeader, sizeof(BITMAP_INFO_HEADER));
}

int readBitmapFile(char *fileName, RGB *result, int *height, int *width)
{
  int i;

  int bmpFile = open(fileName, 0);
  if (bmpFile < 0)
  {
    return -1;
  }

  BITMAP_FILE_HEADER bmpFileHeader;
  BITMAP_INFO_HEADER bmpInfoHeader;
  
  readBitmapHeader(bmpFile, &bmpFileHeader, &bmpInfoHeader);
  *width = bmpInfoHeader.biWidth;
  *height = bmpInfoHeader.biHeight;
  int column = bmpInfoHeader.biWidth;
  int row = bmpInfoHeader.biHeight;
  char tmpBytes[3];
  int rowBytes = column * sizeof(RGB);

  char *buf = (char *) result;
  for (i = 0; i < row; i++)
  {
    read(bmpFile, buf + i * rowBytes, rowBytes);

    // Add padding bytes
    if (rowBytes % 4 > 0)
    {
      read(bmpFile, tmpBytes, 4 - (rowBytes % 4));
    }
  }

  close(bmpFile);
  return 0;
}

