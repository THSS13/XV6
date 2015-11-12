#include "math.h"
#define pi 3.1415926535898 

int abs(int x)
{
	if (x < 0)
		return x * -1;
	else
		return x;
}

double _fact(double x)
{
    double ret = 1;
    int i;
    for (i=1; i<=x; i++) 
        ret *= i;
    return ret;
}

double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
	{  
		n = n+1;  
		Fac=Fac*n*(n + 1);
		n = n + 1;  
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
}

double _pow(double a, double b) {
    double c = 1;
    int i;
    for (i=0; i<b; i++)
        c *= a;
    return c;
}

double cos(double x)
{
	double y = 1;
    double s = -1;
    int i;
    for (i=2; i<=120; i+=2) {
        y+=s*(_pow(x,i)/_fact(i));
        s *= -1;
    }  
    return y;
}

double tan(double x)  
{  
	return sin(x)/cos(x);  
}  

double pow(double x, double y)
{
	if(x==0 && y!=0) return 0;
	else if(x==0 && y==0) return 1;
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
	{
		double powint=1;
		int i;
		for(i=1;i<=y;i++) powint*=x;
		return powint;
	}
	return exp(y*ln(x));
}
// 求根
double sqrt(double x)
{
	return pow(x,0.5);
}

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
	int l;
	if(x==1) return 0;
	else if(x>2) return -ln(1/x);
	else if(x<.1)
	{
		double n=-1;
		double a;
		do
		{
			n=n-.6;
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
	{
		ln_tmp=ln_px;
		tmp*=y;
		if(l==1) tmp=tmp/l;
		else tmp=tmp/-l;
		ln_p1+=tmp;
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
}

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
	{
		ex_tmp=ex_px;
		tmp*=y;
		tmp=tmp/l;
		ex_p1+=tmp;
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
}