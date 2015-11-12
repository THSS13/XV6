#include <iostream>
#include <string>
#include <fstream>
#include "opencv2/opencv.hpp"

using namespace std;
using namespace cv;

int procPic()
{
	cout<<"Input img name:";
	string iname;
	cin>>iname;

	cout<<"Output file name:";
	string oname;
	cin>>oname;

	cout<<"Process mode(0: 3channel, 1: 4channel, 2: 1channel):";
	int mode;
	cin>>mode;

	if (mode==0)
	{
		Mat_<Vec3b> pic=imread(iname,1);
		if (pic.cols>255 || pic.rows>255)
		{
			cout<<"Picture too big."<<endl;
			return 0;
		}
		char width=(char)pic.cols;
		char height=(char)pic.rows;
		ofstream oFile(oname);
		char *p=new char[width*height*3];
		char *q=p;
		for (int i=0;i<pic.rows;i++)
			for (int j=0;j<pic.cols;j++)
			{
				*(q++)=pic(i,j)(2);
				*(q++)=pic(i,j)(1);
				*(q++)=pic(i,j)(0);
			}
			oFile.write(&width,1);
			oFile.write(&height,1);
			oFile.write(p,width*height*3);
	}
	else
	{
		Mat_<Vec4b> pic=imread(iname,-1);
		if (pic.cols>255 || pic.rows>255)
		{
			cout<<"Picture too big."<<endl;
			return 0;
		}
		char width=(char)pic.cols;
		char height=(char)pic.rows;
		ofstream oFile(oname);
		char *p=new char[width*height*4];
		char *q=p;
		for (int i=0;i<pic.rows;i++)
			for (int j=0;j<pic.cols;j++)
			{
				*(q++)=pic(i,j)(2);
				*(q++)=pic(i,j)(1);
				*(q++)=pic(i,j)(0);
				*(q++)=(uchar)255-pic(i,j)(3);
			}
			oFile.write(&width,1);
			oFile.write(&height,1);
			oFile.write(p,width*height*4);
	}

}
void procWord()
{
	string text = "Funny text inside the box";
	int fontFace = FONT_HERSHEY_DUPLEX;
	double fontScale = 2;
	int thickness = 3;

	Mat img(600, 800, CV_8UC3, Scalar::all(0));

	int baseline=0;
	Size textSize = getTextSize(text, fontFace,
		fontScale, thickness, &baseline);
	baseline += thickness;

	// center the text
	Point textOrg((img.cols - textSize.width)/2,
		(img.rows + textSize.height)/2);

	// draw the box
	rectangle(img, textOrg + Point(0, baseline),
		textOrg + Point(textSize.width, -textSize.height),
		Scalar(0,0,255));
	// ... and the baseline first
	line(img, textOrg + Point(0, thickness),
		textOrg + Point(textSize.width, thickness),
		Scalar(0, 0, 255));

	// then put the text itself
	putText(img, text, textOrg, fontFace, fontScale,
		Scalar::all(255), thickness, 8);

	imshow("",img);

	waitKey(0);
}

void procText2()
{
	Mat img1(600, 800, CV_8UC3, Scalar::all(0));

	CvFont font = fontQt("Times");
	addText( img1, "hello world", Point(50,50), font);
	imshow("",img1);

	waitKey(0);
}
int main()
{
	procPic();

	return 0;
}