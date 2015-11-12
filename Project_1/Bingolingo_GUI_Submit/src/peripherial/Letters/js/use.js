var ctx;
var gu,gd,gl,gr;
var cont="1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM~!@#$%^&*()_-=+[];',./\\{}|:\"<>?"

$(document).ready(function()
{
    $("canvas").attr("width","500px")
               .attr("height","500px")
               .css("width","500px")
               .css("height","500px");
    ctx=$("canvas")[0].getContext("2d");
    $("#result")[0].innerText="";
    gd=gr=0;
    gu=gl=500;

    for (var i=0;i<cont.length;i++)
        getCharElem(cont[i],true);

    $("#result2")[0].innerText+="{";
    for (var i=0;i<cont.length;i++)
    {    
        getCharElem(cont[i],false);
        $("#result2")[0].innerText+=(i==cont.length-1?"}":",");
    }
});

function getCharElem(elem,boo)
{
    ctx.fillStyle = "rgb(255,255,255)";
    ctx.fillRect(0,0,500,500);
    ctx.font = "24px Consolas";
    ctx.fillStyle = "black";
    ctx.fillText(elem, 50, 50);

    if (boo)
        getBound(elem);
    else
        outputMatrix();
}

function getBound(char)
{
    var imageData=ctx.getImageData(0,0,500,500);
    var data=imageData.data;
    var k=0;
    var l=499,r=0,u=499,d=0;

    for (var i=0;i<500;i++)
        for (var j=0;j<500;j++)
        {
            if (!(data[k]==255 && data[k+1]==255 && data[k+2]==255))
            {
                l=j<l?j:l;
                r=j>r?j:r;
                u=i<u?i:u;
                d=i>d?i:d;
            }
            k+=4;
        }

    ctx.fillStyle = "rgba(255,128,20,0.5)";
    ctx.fillRect(l,0,1,500);
    ctx.fillRect(r,0,1,500);
    ctx.fillRect(0,u,500,1);
    ctx.fillRect(0,d,500,1);

    gl=l<gl?l:gl;
    gr=r>gr?r:gr;
    gu=u<gu?u:gu;
    gd=d>gd?d:gd;

    $("#result")[0].innerText+="{content:'"+char+"',upper:"+u+",lower:"+d+",left:"+l+",right:"+r+"},\n";
}

function outputMatrix()
{
    var imageData=ctx.getImageData(0,0,500,500);
    var data=imageData.data;
    var k=0;

    var tc="{";

    for (var i=gu;i<=gd;i++)
    {    
        tc+="{";
        for (var j=gl;j<=gr;j++)
        {
            tc+=data[(i*500+j)*4]+(j==gr?"}":",");
        }
        tc+=(i==gd?"}":",");
    }
    $("#result2")[0].innerText+=tc;
}

//function get