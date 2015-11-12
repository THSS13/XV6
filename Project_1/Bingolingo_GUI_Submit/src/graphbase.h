
ushort WIDTH_RES;
ushort HEIGHT_RES;

typedef struct ori_color24
{
    uchar b;
    uchar g;
    uchar r;
} color24;

typedef struct ori_color32
{
    color24 c;
    uchar a;    //0: totally intransparent
} color32;

color24 rgb(uchar r,uchar g,uchar b);
color32 rgba(uchar r, uchar g, uchar b, uchar a);

color24 mingle(color24 c1, color32 c2);

void initGraphMode();   //Invoke it before anyother graphbase function.
void setPixelColor(uint x, uint y,color24 color);
color24 getPixelColor(uint x, uint y);
void setRangeColor(color24 *src, uint len, uint x, uint y);
void sync();
