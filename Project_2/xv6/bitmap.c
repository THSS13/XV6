#include "types.h"
#include "user.h"
#include "bitmap.h"
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
		printf(0, "cannot open %s\n", pic_name);
		return;
	}
	printf(0, "reading bitmap: %s\n", pic_name);
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
	bitHead.bfType = *temp_WORD;
	if (bitHead.bfType != 0x4d42) {
		printf(0, "file is not .bmp file!");
		return;
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
	bitHead.bfSize = *temp_DWORD;
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
		printf(0, "0");
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
	memset(pColorData, 0, (uint) height * l_width);
	long nData = height * l_width;
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
	//fread(pColorData,1,nData,pfile);

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
			{
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
				k = i * l_width + j * 3;
				dataOfBmp[index].rgbRed = pColorData[k + 2];
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
				dataOfBmp[index].rgbBlue = pColorData[k];
				index++;
			}
	}

	//printf(0, "reading bmp data success!\n");
	//printf("像素数据信息:\n");

//	for (i=0; i<width*height; i++)
//	{
//		if (i%5==0)
//		{
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);

	//free(dataOfBmp);
	pic->data = dataOfBmp;
	pic->width = width;
	pic->height = height;
	free(pColorData);
	free(BmpFileHeader);
	//printf("\n");
}

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
	printf(0, "位图文件头:\n");
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
}

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
	printf(0, "位图信息头:\n");
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
}
void showRgbQuan(RGBQUAD* pRGB) {
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
}

void freepic(PICNODE *pic) {
	free(pic->data);
}

void set_icon_alpha(PICNODE *pic) {
	int W = 15;
	Rect r1 = initRect(0, 0, W, W);
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
			p = initPoint(i, j);
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}

