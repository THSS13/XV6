#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
	return (x>= 0 ? x : -x);
}

double sin(double x)  
{  
   register double ret;
   __asm__ (
      "fsin"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
}  

double cos(double x)  
{  
	register double ret;
   __asm__(
      "fcos"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;  
}  

double tan(double x)  
{  
   register double ret;
   register double value;
   __asm__(
      "fptan"
      : "=t" (value),
      "=u" (ret)
      : "0" (x)
   );
   return ret;
}  

double log2(double x)
{
   register double ret;
   __asm__(
      "fld1\n\t"
      "fxch\n\t"
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
}

double pow(double x, double y)
{
   register double ret, value;
   double r = 1.0;
   long p = (long) y;
   if (x == 0.0 && y > 0.0)
      return 0.0;
   if (y == (double) p)
   {
      if (p == 0)
        return 1.0;
      if (p < 0)
      {
        p = -p;
        x = 1.0 / x;
      }
      while (1)
      {
        if (p & 1)
           r *= x;
        p >>= 1;
        if (p == 0)
           return r;
        x *= x;
      }
   }
   __asm__(
      "fmul  %%st(1);"
      "fst   %%st(1);"
      "frndint;\n\t"
      "fxch;\n\t"
      "fsub %%st(1);\n\t"
      "f2xm1;\n\t"
      : "=t" (ret), "=u" (value)
      :  "0" (log2 (x)), "1" (y)
   );
   ret += 1.0;
   __asm__(
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
}
// 求根
double sqrt(double x)
{
	register double ret;
   __asm__(
      "fsqrt"
      : "=t" (ret)
      : "0" (x)
      );
   return ret;
}

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
	register double ret;
   __asm__(
      "fldln2\n\t"
      "fxch\n\t"
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );

   return ret;
}

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
	register double ret, value;
   __asm__(
      "fldl2e;"   
      "fmul %%st(1);"
      "fst  %%st(1);\n\t"
      "frndint;"        
      "fxch;\n\t"
      "fsub %%st(1);" 
      "f2xm1"
      : "=t" (ret), "=u" (value)
      : "0" (x)
   );
   ret += 1.0;
   __asm__(
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
}