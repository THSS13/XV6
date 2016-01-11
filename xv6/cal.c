#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


#define MAXCOUNT 100
#define MAXNUM 10


int chars_to_int(char* src)
{
  char* r = (char*)malloc(10 * sizeof(char));
  int ret = 0;
  int j;
  if (src[0] == '-')
  {
    for (j = 0; j < 9; j++)
    {
      r[j] = src[j + 1];
    }
    return -chars_to_int(r);
  }
  for (j = 0; j < strlen(src); j++)
  {
    ret *= 10;
    ret += src[j] - '0';
  }
  return ret;
}

char* int_to_chars(char* ret, const int n){
  int i = 0, temp = n, j = 0;
  while(temp){
    temp /= 10;
    i++;
  }
  temp = n;
  for(j = i - 1; j >= 0; j--){
    ret[j] = temp % 10 + '0';
    temp /= 10;
  }
  ret[i] = 0;
  return ret;
}

char** split(char* src)
{
  char** ret = (char**)malloc(MAXCOUNT*sizeof(char*));
  int i, j, k;
  char* c;
  for (i = 0; i < MAXCOUNT; i++)
  {
    ret[i] = (char*)malloc(MAXNUM*sizeof(char));
    for (j = 0; j < MAXNUM; j++)
      ret[i][j] = 0;
  }
  i = 0;
  j = 0;
  k = 0;
  while (i < strlen(src))
  {
    if (src[i] >= '0'&&src[i] <= '9')
    {
      ret[j][k] = src[i];
      k++;
      i++;
    }
    else
    {
      if (k) j++;
      ret[j][0] = src[i];
      j++;
      i++;
      k = 0;
    }
  }
  if (ret[0][0] == '-')
  {
    c = ret[99];
    for (i = 98; i >= 0; i--)
    {
      ret[i + 1] = ret[i];
    }
    ret[0] = c;
    ret[0][0] = '0';
  }
  return ret;
}

char precede(char x, char y){
  int i=0, j=0;
  
  switch (x){
  case '+':i = 3; break;
  case '-':i = 3; break;
  case '*':i = 5; break;
  case '/':i = 5; break;
  case '(':i = 1; break;
  case ')':i = 8; break;
  case '\0':i = 0; break;
  }
  switch (y){
  case '+':j = 3; break;
  case '-':j = 3; break;
  case '*':j = 5; break;
  case '/':j = 6; break;
  case '(':j = 1; break;
  case ')':j = 8; break;
  case '\0':j = 0; break;
  }
  if (i>j)
    return '>';
  else
    if (i<j)
      return '<';
    else
      return '=';
}

char** toRPN(char** src)
{
  char** ret = (char**)malloc(MAXCOUNT * sizeof(char*));
  char** stack = (char**)malloc(MAXCOUNT * sizeof(char*));
  int i, j, t1 = 0, t2 = 0;
  char c;
  for (i = 0; i < MAXCOUNT; i++)
  {
    ret[i] = (char*)malloc(MAXNUM*sizeof(char));
    for (j = 0; j < MAXNUM; j++)
      ret[i][j] = 0;
  }
  stack[0] = src[MAXCOUNT - 1];
  t1++;

  i = 0;
  while (src[i][0])
  {
    if (src[i][0] >= '0' && src[i][0] <= '9')
    {
      ret[t2] = src[i];
      t2++;
    }
    else if (src[i][0] == '(')
    {
      stack[t1] = src[i];
      t1++;
    }
    else if (src[i][0] == ')')
    {
      while (stack[t1-1][0] != '(')
      {
        ret[t2] = stack[t1-1];
        t2++;
        t1--;
      }
      t1--;
    }
    else
    {
      c = precede(src[i][0], stack[t1 - 1][0]);
      while (c == '<' || c == '=')
      {
        ret[t2] = stack[t1 - 1];
        t1--;
        t2++;
        c = precede(src[i][0], stack[t1 - 1][0]);
      }
      stack[t1] = src[i];
      t1++;
    }
    i++;
  }
  while (t1 > 1)
  {
    ret[t2] = stack[t1 - 1];
    t1--;
    t2++;
  }
  return ret;
}

char* cal3(char* a1, char* a2, char* s)
{
  char* ret = (char*)malloc(MAXNUM * sizeof(char));
  char* r = (char*)malloc(MAXNUM * sizeof(char));
  int res = 0;
  int i;
  int r1 = chars_to_int(a1);
  int r2 = chars_to_int(a2);
  switch (s[0])
  {
  case '+': res = r1 + r2; break;
  case '-': res = r1 - r2; break;
  case '*': res = r1 * r2; break;
  case '/': res = r1 / r2; break;
  }
  if (res >= 0) 
    ret = int_to_chars(ret, res);
  else
  {
    r = int_to_chars(r, -res);
    ret[0] = '-';
    ret[1] = 0;
    for (i = 0; i < 9; i++)
    {
      ret[i+1] = r[i];
    }
  }
  
  return ret;
}

char* caln(char** src)
{
  int i;
  int m = -1;
  int a1 = -1;
  int a2 = -1;
  for (i = 0; i < MAXCOUNT; i++)
  {
    if ((src[i][0] >= '0' && src[i][0] <= '9' )|| (src[i][0] == '-'&&src[i][1]))
    {
      a1 = a2;
      a2 = i;
    }
    if (src[i][0] == '+' || (src[i][0] == '-'&&src[i][1]==0) || src[i][0] == '*' || src[i][0] == '/')
    {
      m = i;
      break;
    }
  }
  if (m == -1)
  {
    return src[a2];
  }
  src[a1] = cal3(src[a1], src[a2], src[m]);
  src[a2][0] = src[m][0] = 0;
  return caln(src);
}


int cal(char* src)
{
  char* res = caln(toRPN(split(src)));
  printf(2, "The answer is: %s\n", res);
  return chars_to_int(res);
}

int
main(int argc, char *argv[])
{
  if(argc != 2){
    printf(2, "Usage: calculate a expression...\n");
    chdir("/");
    exit();
  }

  if(argc == 2){
    cal(argv[1]);
  }
  chdir("/");
  exit();
}
