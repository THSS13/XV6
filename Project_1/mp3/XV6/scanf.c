#include "types.h"
#include "stat.h"
#include "user.h"

int readint(char * str, int * advance)
{
	int i = 0;
	int res = 0;

	int started = 0;
	while(str[i] && !(started && str[i]== ' '))
	{
		if (!started && str[i] == ' ')
		{
			i ++;
			continue;
		} else if (str[i] < '0' || str[i] > '9') {
			break;
		}
		res *= 10;
		res += (str[i] - '0');
		i ++;
		started = 1;
	}
	*advance = i;
	return res;
}

int readhex(char * str, int * advance)
{
	int i = 0;
	int res = 0;
	char c = str[i];
	int started = 0;
	while(c && !(c == ' ' && started))
	{
		if (!started && c == ' ')
		{
			c = str[++ i];
			continue;
		}
		res *= 16;
		if (c >= '0' && c <= '9') {
			res += (c - '0');
		} else if (c >= 'A' && c <= 'Z') {
			res += (c - 'A' + 10);
		} else if (c >= 'a' && c <= 'z') {
			res += (c - 'a' + 10);
		} else {
			break;
		}
		c = str[++ i];
		started = 1;
	}
	*advance = i;
	return res;
}


double readdouble(char * str, int * advance)
{
	int i = 0;
	double res = 0;
	char c = str[i];
	int started = 0;
	int positive = 1;
	int divisor = 0;
	while(c && !(c == ' ' && started))
	{
		if (!started && c == ' ')
		{
			c = str[++ i];
			
		} else if (c == '-') {
			positive = -1;
			started = 1;
			c = str[++ i];
			
		} else if (c == '.') {
		    started = 1;
		    divisor = 1;
		    c = str[++ i];
		    
		} else if (c >= '0' && c <= '9') {
			res *= 10;
			res += (c - '0');
			c = str[++ i];
			divisor *= 10;
			started = 1;
			
		} else {
			break;
		}
	}
	*advance = i;
	return positive * res / (divisor ? divisor : 1);
}

void i_sscanf(char * str, char *fmt, ...)
{
	char *s;
	int c, i, state;
	int offset = 0;
	uint *ap;

	state = 0;
	ap = (uint*)&fmt + 1;
	for(i = 0; fmt[i]; i++)
	{
		c = fmt[i] & 0xff;
		if (state == 0)
		{
			if(c == '%')
			{
				state = '%';
			} else {
				offset ++;
			}
		} else if (state == '%') {
			if(c == 'u' || c == 'd') {
				int advance;
				int * res = (int *)*ap;
				*res = readint(str + offset, &advance);
				offset += (advance - 1);
				ap ++;
			} else if (c == 'x') {
				// read hex int from str
				int advance;
				int * res = (int *)*ap;
				*res = readhex(str + offset, &advance);
				offset += (advance - 1);
				ap ++;
			} else if (c == 's') {
				char * s = (char *)*ap;
				char t = str[offset];
				int o = 0;
				while (t && t != ' ')
				{
					s[o ++] = t;
					t = str[++ offset];
				}
				s[o] = '\0';
				ap ++;
			} else if (c == 'f') {
				int advance;
				double * res = (double *)*ap;
				*res = readdouble(str + offset, &advance);
				offset += advance;
				ap ++;
			}
			state = 0;
		}
	}
}