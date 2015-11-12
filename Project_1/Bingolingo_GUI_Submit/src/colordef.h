
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
