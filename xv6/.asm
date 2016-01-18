
_picviewer:     file format elf32-i386


Disassembly of section .text:

00000000 <compressPic>:

PICNODE pic;
int isRun = 1;

// 压缩图片
void compressPic(int width, int height) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	81 ec 98 00 00 00    	sub    $0x98,%esp
    int x0, y0, x1, x2, y1, y2;
    float fx1, fx2, fy1, fy2;
    int x, y, index;
    RGBQUAD* data;

    w0 = pic.width;
       9:	a1 74 ff 00 00       	mov    0xff74,%eax
       e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    h0 = pic.height;
      11:	a1 78 ff 00 00       	mov    0xff78,%eax
      16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    w1 = width;
      19:	8b 45 08             	mov    0x8(%ebp),%eax
      1c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    h1 = height;
      1f:	8b 45 0c             	mov    0xc(%ebp),%eax
      22:	89 45 dc             	mov    %eax,-0x24(%ebp)

    fw = w0 * 1.0 / w1;
      25:	db 45 e8             	fildl  -0x18(%ebp)
      28:	db 45 e0             	fildl  -0x20(%ebp)
      2b:	de f9                	fdivrp %st,%st(1)
      2d:	d9 5d d8             	fstps  -0x28(%ebp)
    fh = h0 * 1.0 / h1;
      30:	db 45 e4             	fildl  -0x1c(%ebp)
      33:	db 45 dc             	fildl  -0x24(%ebp)
      36:	de f9                	fdivrp %st,%st(1)
      38:	d9 5d d4             	fstps  -0x2c(%ebp)

    index = 0;
      3b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    data = (RGBQUAD*)malloc(w1*h1*sizeof(RGBQUAD));
      42:	8b 45 e0             	mov    -0x20(%ebp),%eax
      45:	0f af 45 dc          	imul   -0x24(%ebp),%eax
      49:	c1 e0 02             	shl    $0x2,%eax
      4c:	89 04 24             	mov    %eax,(%esp)
      4f:	e8 3a 2e 00 00       	call   2e8e <malloc>
      54:	89 45 d0             	mov    %eax,-0x30(%ebp)
    memset(data, 0, (uint)w1*h1*sizeof(RGBQUAD));
      57:	8b 55 e0             	mov    -0x20(%ebp),%edx
      5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
      5d:	0f af c2             	imul   %edx,%eax
      60:	c1 e0 02             	shl    $0x2,%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      6e:	00 
      6f:	8b 45 d0             	mov    -0x30(%ebp),%eax
      72:	89 04 24             	mov    %eax,(%esp)
      75:	e8 93 27 00 00       	call   280d <memset>
    for (y = 0; y < h1; ++y) {
      7a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
      81:	e9 07 03 00 00       	jmp    38d <compressPic+0x38d>
        y0 = y*fh;
      86:	db 45 f0             	fildl  -0x10(%ebp)
      89:	d8 4d d4             	fmuls  -0x2c(%ebp)
      8c:	d9 bd 7e ff ff ff    	fnstcw -0x82(%ebp)
      92:	0f b7 85 7e ff ff ff 	movzwl -0x82(%ebp),%eax
      99:	b4 0c                	mov    $0xc,%ah
      9b:	66 89 85 7c ff ff ff 	mov    %ax,-0x84(%ebp)
      a2:	d9 ad 7c ff ff ff    	fldcw  -0x84(%ebp)
      a8:	db 5d cc             	fistpl -0x34(%ebp)
      ab:	d9 ad 7e ff ff ff    	fldcw  -0x82(%ebp)
        y1 = (int)y0;
      b1:	8b 45 cc             	mov    -0x34(%ebp),%eax
      b4:	89 45 c8             	mov    %eax,-0x38(%ebp)
        y2 = (y1 == h0-1) ? y1 : y1 + 1;
      b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      ba:	83 e8 01             	sub    $0x1,%eax
      bd:	3b 45 c8             	cmp    -0x38(%ebp),%eax
      c0:	74 08                	je     ca <compressPic+0xca>
      c2:	8b 45 c8             	mov    -0x38(%ebp),%eax
      c5:	83 c0 01             	add    $0x1,%eax
      c8:	eb 03                	jmp    cd <compressPic+0xcd>
      ca:	8b 45 c8             	mov    -0x38(%ebp),%eax
      cd:	89 45 c4             	mov    %eax,-0x3c(%ebp)

        fy1 = y1-y0;
      d0:	8b 45 cc             	mov    -0x34(%ebp),%eax
      d3:	8b 55 c8             	mov    -0x38(%ebp),%edx
      d6:	29 c2                	sub    %eax,%edx
      d8:	89 d0                	mov    %edx,%eax
      da:	89 45 80             	mov    %eax,-0x80(%ebp)
      dd:	db 45 80             	fildl  -0x80(%ebp)
      e0:	d9 5d c0             	fstps  -0x40(%ebp)
        fy2 = 1.0f-fy1;
      e3:	d9 e8                	fld1   
      e5:	d8 65 c0             	fsubs  -0x40(%ebp)
      e8:	d9 5d bc             	fstps  -0x44(%ebp)

        for (x = 0; x < w1; ++x) {
      eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      f2:	e9 86 02 00 00       	jmp    37d <compressPic+0x37d>
            x0 = x*fw;
      f7:	db 45 f4             	fildl  -0xc(%ebp)
      fa:	d8 4d d8             	fmuls  -0x28(%ebp)
      fd:	d9 ad 7c ff ff ff    	fldcw  -0x84(%ebp)
     103:	db 5d b8             	fistpl -0x48(%ebp)
     106:	d9 ad 7e ff ff ff    	fldcw  -0x82(%ebp)
            x1 = (int)x0;
     10c:	8b 45 b8             	mov    -0x48(%ebp),%eax
     10f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
            x2 = (x1 == w0-1) ? x1 : x1 + 1;
     112:	8b 45 e8             	mov    -0x18(%ebp),%eax
     115:	83 e8 01             	sub    $0x1,%eax
     118:	3b 45 b4             	cmp    -0x4c(%ebp),%eax
     11b:	74 08                	je     125 <compressPic+0x125>
     11d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     120:	83 c0 01             	add    $0x1,%eax
     123:	eb 03                	jmp    128 <compressPic+0x128>
     125:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     128:	89 45 b0             	mov    %eax,-0x50(%ebp)

            fx1 = y1-y0;
     12b:	8b 45 cc             	mov    -0x34(%ebp),%eax
     12e:	8b 55 c8             	mov    -0x38(%ebp),%edx
     131:	29 c2                	sub    %eax,%edx
     133:	89 d0                	mov    %edx,%eax
     135:	89 45 80             	mov    %eax,-0x80(%ebp)
     138:	db 45 80             	fildl  -0x80(%ebp)
     13b:	d9 5d ac             	fstps  -0x54(%ebp)
            fx2 = 1.0f-fx1;
     13e:	d9 e8                	fld1   
     140:	d8 65 ac             	fsubs  -0x54(%ebp)
     143:	d9 5d a8             	fstps  -0x58(%ebp)

            float s1 = fx1*fy1;
     146:	d9 45 ac             	flds   -0x54(%ebp)
     149:	d8 4d c0             	fmuls  -0x40(%ebp)
     14c:	d9 5d a4             	fstps  -0x5c(%ebp)
            float s2 = fx2*fy1;
     14f:	d9 45 a8             	flds   -0x58(%ebp)
     152:	d8 4d c0             	fmuls  -0x40(%ebp)
     155:	d9 5d a0             	fstps  -0x60(%ebp)
            float s3 = fx2*fy2;
     158:	d9 45 a8             	flds   -0x58(%ebp)
     15b:	d8 4d bc             	fmuls  -0x44(%ebp)
     15e:	d9 5d 9c             	fstps  -0x64(%ebp)
            float s4 = fx1*fy2;
     161:	d9 45 ac             	flds   -0x54(%ebp)
     164:	d8 4d bc             	fmuls  -0x44(%ebp)
     167:	d9 5d 98             	fstps  -0x68(%ebp)

            RGBQUAD p1, p2, p3, p4;
            p1 = pic.data[x1+y1*w0];
     16a:	8b 15 70 ff 00 00    	mov    0xff70,%edx
     170:	8b 45 c8             	mov    -0x38(%ebp),%eax
     173:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     177:	89 c1                	mov    %eax,%ecx
     179:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     17c:	01 c8                	add    %ecx,%eax
     17e:	c1 e0 02             	shl    $0x2,%eax
     181:	01 d0                	add    %edx,%eax
     183:	8b 00                	mov    (%eax),%eax
     185:	89 45 94             	mov    %eax,-0x6c(%ebp)
            p2 = pic.data[x2+y1*w0];
     188:	8b 15 70 ff 00 00    	mov    0xff70,%edx
     18e:	8b 45 c8             	mov    -0x38(%ebp),%eax
     191:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     195:	89 c1                	mov    %eax,%ecx
     197:	8b 45 b0             	mov    -0x50(%ebp),%eax
     19a:	01 c8                	add    %ecx,%eax
     19c:	c1 e0 02             	shl    $0x2,%eax
     19f:	01 d0                	add    %edx,%eax
     1a1:	8b 00                	mov    (%eax),%eax
     1a3:	89 45 90             	mov    %eax,-0x70(%ebp)
            p3 = pic.data[x1+y2*w0];
     1a6:	8b 15 70 ff 00 00    	mov    0xff70,%edx
     1ac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     1af:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     1b3:	89 c1                	mov    %eax,%ecx
     1b5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     1b8:	01 c8                	add    %ecx,%eax
     1ba:	c1 e0 02             	shl    $0x2,%eax
     1bd:	01 d0                	add    %edx,%eax
     1bf:	8b 00                	mov    (%eax),%eax
     1c1:	89 45 8c             	mov    %eax,-0x74(%ebp)
            p4 = pic.data[x2+y2*w0];
     1c4:	8b 15 70 ff 00 00    	mov    0xff70,%edx
     1ca:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     1cd:	0f af 45 e8          	imul   -0x18(%ebp),%eax
     1d1:	89 c1                	mov    %eax,%ecx
     1d3:	8b 45 b0             	mov    -0x50(%ebp),%eax
     1d6:	01 c8                	add    %ecx,%eax
     1d8:	c1 e0 02             	shl    $0x2,%eax
     1db:	01 d0                	add    %edx,%eax
     1dd:	8b 00                	mov    (%eax),%eax
     1df:	89 45 88             	mov    %eax,-0x78(%ebp)

            data[index].rgbRed = (BYTE)(p1.rgbRed*s3 + p2.rgbRed*s4 + p3.rgbRed*s2 + p4.rgbRed*s1);
     1e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     1e5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     1ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
     1ef:	01 c2                	add    %eax,%edx
     1f1:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     1f5:	0f b6 c0             	movzbl %al,%eax
     1f8:	89 45 80             	mov    %eax,-0x80(%ebp)
     1fb:	db 45 80             	fildl  -0x80(%ebp)
     1fe:	d8 4d 9c             	fmuls  -0x64(%ebp)
     201:	0f b6 45 92          	movzbl -0x6e(%ebp),%eax
     205:	0f b6 c0             	movzbl %al,%eax
     208:	89 45 80             	mov    %eax,-0x80(%ebp)
     20b:	db 45 80             	fildl  -0x80(%ebp)
     20e:	d8 4d 98             	fmuls  -0x68(%ebp)
     211:	de c1                	faddp  %st,%st(1)
     213:	0f b6 45 8e          	movzbl -0x72(%ebp),%eax
     217:	0f b6 c0             	movzbl %al,%eax
     21a:	89 45 80             	mov    %eax,-0x80(%ebp)
     21d:	db 45 80             	fildl  -0x80(%ebp)
     220:	d8 4d a0             	fmuls  -0x60(%ebp)
     223:	de c1                	faddp  %st,%st(1)
     225:	0f b6 45 8a          	movzbl -0x76(%ebp),%eax
     229:	0f b6 c0             	movzbl %al,%eax
     22c:	89 45 80             	mov    %eax,-0x80(%ebp)
     22f:	db 45 80             	fildl  -0x80(%ebp)
     232:	d8 4d a4             	fmuls  -0x5c(%ebp)
     235:	de c1                	faddp  %st,%st(1)
     237:	d9 ad 7c ff ff ff    	fldcw  -0x84(%ebp)
     23d:	df 9d 7a ff ff ff    	fistp  -0x86(%ebp)
     243:	d9 ad 7e ff ff ff    	fldcw  -0x82(%ebp)
     249:	0f b7 85 7a ff ff ff 	movzwl -0x86(%ebp),%eax
     250:	88 42 02             	mov    %al,0x2(%edx)
            data[index].rgbGreen = (BYTE)(p1.rgbGreen*s3 + p2.rgbGreen*s4 + p3.rgbGreen*s2 + p4.rgbGreen*s1);
     253:	8b 45 ec             	mov    -0x14(%ebp),%eax
     256:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     25d:	8b 45 d0             	mov    -0x30(%ebp),%eax
     260:	01 c2                	add    %eax,%edx
     262:	0f b6 45 95          	movzbl -0x6b(%ebp),%eax
     266:	0f b6 c0             	movzbl %al,%eax
     269:	89 45 80             	mov    %eax,-0x80(%ebp)
     26c:	db 45 80             	fildl  -0x80(%ebp)
     26f:	d8 4d 9c             	fmuls  -0x64(%ebp)
     272:	0f b6 45 91          	movzbl -0x6f(%ebp),%eax
     276:	0f b6 c0             	movzbl %al,%eax
     279:	89 45 80             	mov    %eax,-0x80(%ebp)
     27c:	db 45 80             	fildl  -0x80(%ebp)
     27f:	d8 4d 98             	fmuls  -0x68(%ebp)
     282:	de c1                	faddp  %st,%st(1)
     284:	0f b6 45 8d          	movzbl -0x73(%ebp),%eax
     288:	0f b6 c0             	movzbl %al,%eax
     28b:	89 45 80             	mov    %eax,-0x80(%ebp)
     28e:	db 45 80             	fildl  -0x80(%ebp)
     291:	d8 4d a0             	fmuls  -0x60(%ebp)
     294:	de c1                	faddp  %st,%st(1)
     296:	0f b6 45 89          	movzbl -0x77(%ebp),%eax
     29a:	0f b6 c0             	movzbl %al,%eax
     29d:	89 45 80             	mov    %eax,-0x80(%ebp)
     2a0:	db 45 80             	fildl  -0x80(%ebp)
     2a3:	d8 4d a4             	fmuls  -0x5c(%ebp)
     2a6:	de c1                	faddp  %st,%st(1)
     2a8:	d9 ad 7c ff ff ff    	fldcw  -0x84(%ebp)
     2ae:	df 9d 7a ff ff ff    	fistp  -0x86(%ebp)
     2b4:	d9 ad 7e ff ff ff    	fldcw  -0x82(%ebp)
     2ba:	0f b7 85 7a ff ff ff 	movzwl -0x86(%ebp),%eax
     2c1:	88 42 01             	mov    %al,0x1(%edx)
            data[index].rgbBlue = (BYTE)(p1.rgbBlue*s3 + p2.rgbBlue*s4 + p3.rgbBlue*s2 + p4.rgbBlue*s1);
     2c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     2c7:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     2ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
     2d1:	01 c2                	add    %eax,%edx
     2d3:	0f b6 45 94          	movzbl -0x6c(%ebp),%eax
     2d7:	0f b6 c0             	movzbl %al,%eax
     2da:	89 45 80             	mov    %eax,-0x80(%ebp)
     2dd:	db 45 80             	fildl  -0x80(%ebp)
     2e0:	d8 4d 9c             	fmuls  -0x64(%ebp)
     2e3:	0f b6 45 90          	movzbl -0x70(%ebp),%eax
     2e7:	0f b6 c0             	movzbl %al,%eax
     2ea:	89 45 80             	mov    %eax,-0x80(%ebp)
     2ed:	db 45 80             	fildl  -0x80(%ebp)
     2f0:	d8 4d 98             	fmuls  -0x68(%ebp)
     2f3:	de c1                	faddp  %st,%st(1)
     2f5:	0f b6 45 8c          	movzbl -0x74(%ebp),%eax
     2f9:	0f b6 c0             	movzbl %al,%eax
     2fc:	89 45 80             	mov    %eax,-0x80(%ebp)
     2ff:	db 45 80             	fildl  -0x80(%ebp)
     302:	d8 4d a0             	fmuls  -0x60(%ebp)
     305:	de c1                	faddp  %st,%st(1)
     307:	0f b6 45 88          	movzbl -0x78(%ebp),%eax
     30b:	0f b6 c0             	movzbl %al,%eax
     30e:	89 45 80             	mov    %eax,-0x80(%ebp)
     311:	db 45 80             	fildl  -0x80(%ebp)
     314:	d8 4d a4             	fmuls  -0x5c(%ebp)
     317:	de c1                	faddp  %st,%st(1)
     319:	d9 ad 7c ff ff ff    	fldcw  -0x84(%ebp)
     31f:	df 9d 7a ff ff ff    	fistp  -0x86(%ebp)
     325:	d9 ad 7e ff ff ff    	fldcw  -0x82(%ebp)
     32b:	0f b7 85 7a ff ff ff 	movzwl -0x86(%ebp),%eax
     332:	88 02                	mov    %al,(%edx)

            data[index].rgbRed = p1.rgbRed;
     334:	8b 45 ec             	mov    -0x14(%ebp),%eax
     337:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     33e:	8b 45 d0             	mov    -0x30(%ebp),%eax
     341:	01 c2                	add    %eax,%edx
     343:	0f b6 45 96          	movzbl -0x6a(%ebp),%eax
     347:	88 42 02             	mov    %al,0x2(%edx)
            data[index].rgbGreen = p1.rgbGreen;
     34a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     34d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     354:	8b 45 d0             	mov    -0x30(%ebp),%eax
     357:	01 c2                	add    %eax,%edx
     359:	0f b6 45 95          	movzbl -0x6b(%ebp),%eax
     35d:	88 42 01             	mov    %al,0x1(%edx)
            data[index].rgbBlue = p1.rgbBlue;
     360:	8b 45 ec             	mov    -0x14(%ebp),%eax
     363:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
     36a:	8b 45 d0             	mov    -0x30(%ebp),%eax
     36d:	01 c2                	add    %eax,%edx
     36f:	0f b6 45 94          	movzbl -0x6c(%ebp),%eax
     373:	88 02                	mov    %al,(%edx)

            ++index;
     375:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        y2 = (y1 == h0-1) ? y1 : y1 + 1;

        fy1 = y1-y0;
        fy2 = 1.0f-fy1;

        for (x = 0; x < w1; ++x) {
     379:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     37d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     380:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     383:	0f 8c 6e fd ff ff    	jl     f7 <compressPic+0xf7>
    fh = h0 * 1.0 / h1;

    index = 0;
    data = (RGBQUAD*)malloc(w1*h1*sizeof(RGBQUAD));
    memset(data, 0, (uint)w1*h1*sizeof(RGBQUAD));
    for (y = 0; y < h1; ++y) {
     389:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     38d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     390:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     393:	0f 8c ed fc ff ff    	jl     86 <compressPic+0x86>

            ++index;
        }
    }

    freepic(&pic);
     399:	c7 04 24 70 ff 00 00 	movl   $0xff70,(%esp)
     3a0:	e8 28 1a 00 00       	call   1dcd <freepic>
    pic.data = data;
     3a5:	8b 45 d0             	mov    -0x30(%ebp),%eax
     3a8:	a3 70 ff 00 00       	mov    %eax,0xff70
    pic.width = width;
     3ad:	8b 45 08             	mov    0x8(%ebp),%eax
     3b0:	a3 74 ff 00 00       	mov    %eax,0xff74
    pic.height = height;
     3b5:	8b 45 0c             	mov    0xc(%ebp),%eax
     3b8:	a3 78 ff 00 00       	mov    %eax,0xff78
}
     3bd:	c9                   	leave  
     3be:	c3                   	ret    

000003bf <modifyPic>:

void modifyPic(Context context) {
     3bf:	55                   	push   %ebp
     3c0:	89 e5                	mov    %esp,%ebp
     3c2:	83 ec 48             	sub    $0x48,%esp
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
     3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
     3c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
    c_height = context.height;
     3cb:	8b 45 10             	mov    0x10(%ebp),%eax
     3ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
    pic_width = pic.width;
     3d1:	a1 74 ff 00 00       	mov    0xff74,%eax
     3d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    pic_height = pic.height;
     3d9:	a1 78 ff 00 00       	mov    0xff78,%eax
     3de:	89 45 f0             	mov    %eax,-0x10(%ebp)

    if (pic_width < c_width && pic_height < c_height) {
     3e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3e4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     3e7:	7d 0d                	jge    3f6 <modifyPic+0x37>
     3e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     3ec:	3b 45 e8             	cmp    -0x18(%ebp),%eax
     3ef:	7d 05                	jge    3f6 <modifyPic+0x37>
        return;
     3f1:	e9 b6 00 00 00       	jmp    4ac <modifyPic+0xed>
    }

    float scale_p, scale_c;
    scale_p = pic_width * 1.0 / pic_height;
     3f6:	db 45 f4             	fildl  -0xc(%ebp)
     3f9:	db 45 f0             	fildl  -0x10(%ebp)
     3fc:	de f9                	fdivrp %st,%st(1)
     3fe:	d9 5d e4             	fstps  -0x1c(%ebp)
    scale_c = c_width * 1.0 / c_height;
     401:	db 45 ec             	fildl  -0x14(%ebp)
     404:	db 45 e8             	fildl  -0x18(%ebp)
     407:	de f9                	fdivrp %st,%st(1)
     409:	d9 5d e0             	fstps  -0x20(%ebp)

    if (scale_p <= scale_c) {
     40c:	d9 45 e0             	flds   -0x20(%ebp)
     40f:	d9 45 e4             	flds   -0x1c(%ebp)
     412:	d9 c9                	fxch   %st(1)
     414:	df e9                	fucomip %st(1),%st
     416:	dd d8                	fstp   %st(0)
     418:	72 30                	jb     44a <modifyPic+0x8b>
        pic_width = scale_p * (c_height-10);
     41a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     41d:	83 e8 0a             	sub    $0xa,%eax
     420:	89 45 d0             	mov    %eax,-0x30(%ebp)
     423:	db 45 d0             	fildl  -0x30(%ebp)
     426:	d8 4d e4             	fmuls  -0x1c(%ebp)
     429:	d9 7d ce             	fnstcw -0x32(%ebp)
     42c:	0f b7 45 ce          	movzwl -0x32(%ebp),%eax
     430:	b4 0c                	mov    $0xc,%ah
     432:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
     436:	d9 6d cc             	fldcw  -0x34(%ebp)
     439:	db 5d f4             	fistpl -0xc(%ebp)
     43c:	d9 6d ce             	fldcw  -0x32(%ebp)
        pic_height = c_height-10;
     43f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     442:	83 e8 0a             	sub    $0xa,%eax
     445:	89 45 f0             	mov    %eax,-0x10(%ebp)
     448:	eb 2e                	jmp    478 <modifyPic+0xb9>
    } else {
        pic_height = (c_width-5) / scale_p;
     44a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     44d:	83 e8 05             	sub    $0x5,%eax
     450:	89 45 d0             	mov    %eax,-0x30(%ebp)
     453:	db 45 d0             	fildl  -0x30(%ebp)
     456:	d8 75 e4             	fdivs  -0x1c(%ebp)
     459:	d9 7d ce             	fnstcw -0x32(%ebp)
     45c:	0f b7 45 ce          	movzwl -0x32(%ebp),%eax
     460:	b4 0c                	mov    $0xc,%ah
     462:	66 89 45 cc          	mov    %ax,-0x34(%ebp)
     466:	d9 6d cc             	fldcw  -0x34(%ebp)
     469:	db 5d f0             	fistpl -0x10(%ebp)
     46c:	d9 6d ce             	fldcw  -0x32(%ebp)
        pic_width = c_width-5;
     46f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     472:	83 e8 05             	sub    $0x5,%eax
     475:	89 45 f4             	mov    %eax,-0xc(%ebp)
    }
    printf(0, "modifyPic: pic_width: %d, pic_height: %d\n", pic_width, pic_height);
     478:	8b 45 f0             	mov    -0x10(%ebp),%eax
     47b:	89 44 24 0c          	mov    %eax,0xc(%esp)
     47f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     482:	89 44 24 08          	mov    %eax,0x8(%esp)
     486:	c7 44 24 04 20 92 00 	movl   $0x9220,0x4(%esp)
     48d:	00 
     48e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     495:	e8 08 27 00 00       	call   2ba2 <printf>

    compressPic(pic_width, pic_height);
     49a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     49d:	89 44 24 04          	mov    %eax,0x4(%esp)
     4a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4a4:	89 04 24             	mov    %eax,(%esp)
     4a7:	e8 54 fb ff ff       	call   0 <compressPic>
}
     4ac:	c9                   	leave  
     4ad:	c3                   	ret    

000004ae <drawPicViewerWnd>:

// 绘制窗口
void drawPicViewerWnd(Context context) {
     4ae:	55                   	push   %ebp
     4af:	89 e5                	mov    %esp,%ebp
     4b1:	83 ec 38             	sub    $0x38,%esp
    int width, height;

    width = context.width;
     4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
     4b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    height = context.height;
     4ba:	8b 45 10             	mov    0x10(%ebp),%eax
     4bd:	89 45 f0             	mov    %eax,-0x10(%ebp)

    fill_rect(context, 0, 0, width, height, 0xFFFF);
     4c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
     4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c6:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     4cd:	00 
     4ce:	89 54 24 18          	mov    %edx,0x18(%esp)
     4d2:	89 44 24 14          	mov    %eax,0x14(%esp)
     4d6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     4dd:	00 
     4de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     4e5:	00 
     4e6:	8b 45 08             	mov    0x8(%ebp),%eax
     4e9:	89 04 24             	mov    %eax,(%esp)
     4ec:	8b 45 0c             	mov    0xc(%ebp),%eax
     4ef:	89 44 24 04          	mov    %eax,0x4(%esp)
     4f3:	8b 45 10             	mov    0x10(%ebp),%eax
     4f6:	89 44 24 08          	mov    %eax,0x8(%esp)
     4fa:	e8 53 07 00 00       	call   c52 <fill_rect>

    draw_line(context, 0, 0, width-1, 0, BORDERLINE_COLOR);
     4ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
     502:	83 e8 01             	sub    $0x1,%eax
     505:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     50c:	00 
     50d:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     514:	00 
     515:	89 44 24 14          	mov    %eax,0x14(%esp)
     519:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     520:	00 
     521:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     528:	00 
     529:	8b 45 08             	mov    0x8(%ebp),%eax
     52c:	89 04 24             	mov    %eax,(%esp)
     52f:	8b 45 0c             	mov    0xc(%ebp),%eax
     532:	89 44 24 04          	mov    %eax,0x4(%esp)
     536:	8b 45 10             	mov    0x10(%ebp),%eax
     539:	89 44 24 08          	mov    %eax,0x8(%esp)
     53d:	e8 85 0e 00 00       	call   13c7 <draw_line>
    draw_line(context, width-1, 0, width-1, height-1, BORDERLINE_COLOR);
     542:	8b 45 f0             	mov    -0x10(%ebp),%eax
     545:	8d 48 ff             	lea    -0x1(%eax),%ecx
     548:	8b 45 f4             	mov    -0xc(%ebp),%eax
     54b:	8d 50 ff             	lea    -0x1(%eax),%edx
     54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     551:	83 e8 01             	sub    $0x1,%eax
     554:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     55b:	00 
     55c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     560:	89 54 24 14          	mov    %edx,0x14(%esp)
     564:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     56b:	00 
     56c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     570:	8b 45 08             	mov    0x8(%ebp),%eax
     573:	89 04 24             	mov    %eax,(%esp)
     576:	8b 45 0c             	mov    0xc(%ebp),%eax
     579:	89 44 24 04          	mov    %eax,0x4(%esp)
     57d:	8b 45 10             	mov    0x10(%ebp),%eax
     580:	89 44 24 08          	mov    %eax,0x8(%esp)
     584:	e8 3e 0e 00 00       	call   13c7 <draw_line>
    draw_line(context, 0, height-1, width-1, height-1, BORDERLINE_COLOR);
     589:	8b 45 f0             	mov    -0x10(%ebp),%eax
     58c:	8d 48 ff             	lea    -0x1(%eax),%ecx
     58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     592:	8d 50 ff             	lea    -0x1(%eax),%edx
     595:	8b 45 f0             	mov    -0x10(%ebp),%eax
     598:	83 e8 01             	sub    $0x1,%eax
     59b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     5a2:	00 
     5a3:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     5a7:	89 54 24 14          	mov    %edx,0x14(%esp)
     5ab:	89 44 24 10          	mov    %eax,0x10(%esp)
     5af:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     5b6:	00 
     5b7:	8b 45 08             	mov    0x8(%ebp),%eax
     5ba:	89 04 24             	mov    %eax,(%esp)
     5bd:	8b 45 0c             	mov    0xc(%ebp),%eax
     5c0:	89 44 24 04          	mov    %eax,0x4(%esp)
     5c4:	8b 45 10             	mov    0x10(%ebp),%eax
     5c7:	89 44 24 08          	mov    %eax,0x8(%esp)
     5cb:	e8 f7 0d 00 00       	call   13c7 <draw_line>
    draw_line(context, 0, height-1, 0, 0, BORDERLINE_COLOR);
     5d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5d3:	83 e8 01             	sub    $0x1,%eax
     5d6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     5dd:	00 
     5de:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     5e5:	00 
     5e6:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     5ed:	00 
     5ee:	89 44 24 10          	mov    %eax,0x10(%esp)
     5f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     5f9:	00 
     5fa:	8b 45 08             	mov    0x8(%ebp),%eax
     5fd:	89 04 24             	mov    %eax,(%esp)
     600:	8b 45 0c             	mov    0xc(%ebp),%eax
     603:	89 44 24 04          	mov    %eax,0x4(%esp)
     607:	8b 45 10             	mov    0x10(%ebp),%eax
     60a:	89 44 24 08          	mov    %eax,0x8(%esp)
     60e:	e8 b4 0d 00 00       	call   13c7 <draw_line>

    fill_rect(context, 1, 1, width-2, TOPBAR_HEIGHT, TOPBAR_COLOR);
     613:	8b 45 f4             	mov    -0xc(%ebp),%eax
     616:	83 e8 02             	sub    $0x2,%eax
     619:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
     620:	00 
     621:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
     628:	00 
     629:	89 44 24 14          	mov    %eax,0x14(%esp)
     62d:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     634:	00 
     635:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     63c:	00 
     63d:	8b 45 08             	mov    0x8(%ebp),%eax
     640:	89 04 24             	mov    %eax,(%esp)
     643:	8b 45 0c             	mov    0xc(%ebp),%eax
     646:	89 44 24 04          	mov    %eax,0x4(%esp)
     64a:	8b 45 10             	mov    0x10(%ebp),%eax
     64d:	89 44 24 08          	mov    %eax,0x8(%esp)
     651:	e8 fc 05 00 00       	call   c52 <fill_rect>
    puts_str(context, "PictureViewer", 0, WINDOW_WIDTH/2 - 53, 3);
     656:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     65d:	00 
     65e:	c7 44 24 14 c5 00 00 	movl   $0xc5,0x14(%esp)
     665:	00 
     666:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     66d:	00 
     66e:	c7 44 24 0c 4a 92 00 	movl   $0x924a,0xc(%esp)
     675:	00 
     676:	8b 45 08             	mov    0x8(%ebp),%eax
     679:	89 04 24             	mov    %eax,(%esp)
     67c:	8b 45 0c             	mov    0xc(%ebp),%eax
     67f:	89 44 24 04          	mov    %eax,0x4(%esp)
     683:	8b 45 10             	mov    0x10(%ebp),%eax
     686:	89 44 24 08          	mov    %eax,0x8(%esp)
     68a:	e8 a2 0b 00 00       	call   1231 <puts_str>

    draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     68f:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     696:	00 
     697:	c7 44 24 0c 40 cc 00 	movl   $0xcc40,0xc(%esp)
     69e:	00 
     69f:	8b 45 08             	mov    0x8(%ebp),%eax
     6a2:	89 04 24             	mov    %eax,(%esp)
     6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
     6ac:	8b 45 10             	mov    0x10(%ebp),%eax
     6af:	89 44 24 08          	mov    %eax,0x8(%esp)
     6b3:	e8 ea 10 00 00       	call   17a2 <draw_iconlist>
}
     6b8:	c9                   	leave  
     6b9:	c3                   	ret    

000006ba <drawPicViewerContent>:

void drawPicViewerContent(Context context, char* fileName) {
     6ba:	55                   	push   %ebp
     6bb:	89 e5                	mov    %esp,%ebp
     6bd:	83 ec 38             	sub    $0x38,%esp
    int c_width, c_height;
    int pic_width, pic_height;

    c_width = context.width;
     6c0:	8b 45 0c             	mov    0xc(%ebp),%eax
     6c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    c_height = context.height;
     6c6:	8b 45 10             	mov    0x10(%ebp),%eax
     6c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    pic_width = pic.width;
     6cc:	a1 74 ff 00 00       	mov    0xff74,%eax
     6d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    pic_height = pic.height;
     6d4:	a1 78 ff 00 00       	mov    0xff78,%eax
     6d9:	89 45 e8             	mov    %eax,-0x18(%ebp)

    printf(0, "drawPicViewerContent: pic_width: %d, pic_height: %d\n", pic_width, pic_height);
     6dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
     6df:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6e6:	89 44 24 08          	mov    %eax,0x8(%esp)
     6ea:	c7 44 24 04 58 92 00 	movl   $0x9258,0x4(%esp)
     6f1:	00 
     6f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     6f9:	e8 a4 24 00 00       	call   2ba2 <printf>
    draw_picture(context, pic, (c_width-pic_width) >> 1, TOPBAR_HEIGHT + ((c_height-pic_height) >> 1));
     6fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
     701:	8b 55 f0             	mov    -0x10(%ebp),%edx
     704:	29 c2                	sub    %eax,%edx
     706:	89 d0                	mov    %edx,%eax
     708:	d1 f8                	sar    %eax
     70a:	8d 50 14             	lea    0x14(%eax),%edx
     70d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     710:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     713:	29 c1                	sub    %eax,%ecx
     715:	89 c8                	mov    %ecx,%eax
     717:	d1 f8                	sar    %eax
     719:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     71d:	89 44 24 18          	mov    %eax,0x18(%esp)
     721:	a1 70 ff 00 00       	mov    0xff70,%eax
     726:	89 44 24 0c          	mov    %eax,0xc(%esp)
     72a:	a1 74 ff 00 00       	mov    0xff74,%eax
     72f:	89 44 24 10          	mov    %eax,0x10(%esp)
     733:	a1 78 ff 00 00       	mov    0xff78,%eax
     738:	89 44 24 14          	mov    %eax,0x14(%esp)
     73c:	8b 45 08             	mov    0x8(%ebp),%eax
     73f:	89 04 24             	mov    %eax,(%esp)
     742:	8b 45 0c             	mov    0xc(%ebp),%eax
     745:	89 44 24 04          	mov    %eax,0x4(%esp)
     749:	8b 45 10             	mov    0x10(%ebp),%eax
     74c:	89 44 24 08          	mov    %eax,0x8(%esp)
     750:	e8 9c 0b 00 00       	call   12f1 <draw_picture>
}
     755:	c9                   	leave  
     756:	c3                   	ret    

00000757 <h_closeWnd>:

void h_closeWnd(Point p) {
     757:	55                   	push   %ebp
     758:	89 e5                	mov    %esp,%ebp
    isRun = 0;
     75a:	c7 05 78 cc 00 00 00 	movl   $0x0,0xcc78
     761:	00 00 00 
}
     764:	5d                   	pop    %ebp
     765:	c3                   	ret    

00000766 <addWndEvent>:

void addWndEvent(ClickableManager *cm) {
     766:	55                   	push   %ebp
     767:	89 e5                	mov    %esp,%ebp
     769:	57                   	push   %edi
     76a:	56                   	push   %esi
     76b:	53                   	push   %ebx
     76c:	83 ec 4c             	sub    $0x4c,%esp
    int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     76f:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)

	for (i = 0; i < n; i++) {
     776:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     77d:	e9 96 00 00 00       	jmp    818 <addWndEvent+0xb2>
		createClickable(cm,
     782:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     785:	8b 1c 85 74 cc 00 00 	mov    0xcc74(,%eax,4),%ebx
     78c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     78f:	6b c0 34             	imul   $0x34,%eax,%eax
     792:	05 60 cc 00 00       	add    $0xcc60,%eax
     797:	8b 78 10             	mov    0x10(%eax),%edi
     79a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     79d:	6b c0 34             	imul   $0x34,%eax,%eax
     7a0:	05 60 cc 00 00       	add    $0xcc60,%eax
     7a5:	8b 70 0c             	mov    0xc(%eax),%esi
     7a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7ab:	6b c0 34             	imul   $0x34,%eax,%eax
     7ae:	05 60 cc 00 00       	add    $0xcc60,%eax
     7b3:	8b 48 04             	mov    0x4(%eax),%ecx
     7b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7b9:	6b c0 34             	imul   $0x34,%eax,%eax
     7bc:	05 60 cc 00 00       	add    $0xcc60,%eax
     7c1:	8b 10                	mov    (%eax),%edx
     7c3:	8d 45 d0             	lea    -0x30(%ebp),%eax
     7c6:	89 7c 24 10          	mov    %edi,0x10(%esp)
     7ca:	89 74 24 0c          	mov    %esi,0xc(%esp)
     7ce:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     7d2:	89 54 24 04          	mov    %edx,0x4(%esp)
     7d6:	89 04 24             	mov    %eax,(%esp)
     7d9:	e8 be 18 00 00       	call   209c <initRect>
     7de:	83 ec 04             	sub    $0x4,%esp
     7e1:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     7e5:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     7ec:	00 
     7ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7f0:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     7f7:	89 44 24 08          	mov    %eax,0x8(%esp)
     7fb:	8b 45 d8             	mov    -0x28(%ebp),%eax
     7fe:	89 44 24 0c          	mov    %eax,0xc(%esp)
     802:	8b 45 dc             	mov    -0x24(%ebp),%eax
     805:	89 44 24 10          	mov    %eax,0x10(%esp)
     809:	8b 45 08             	mov    0x8(%ebp),%eax
     80c:	89 04 24             	mov    %eax,(%esp)
     80f:	e8 74 19 00 00       	call   2188 <createClickable>

void addWndEvent(ClickableManager *cm) {
    int i;
	int n = sizeof(wndEvents) / sizeof(Handler);

	for (i = 0; i < n; i++) {
     814:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     818:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     81b:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     81e:	0f 8c 5e ff ff ff    	jl     782 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     824:	8d 65 f4             	lea    -0xc(%ebp),%esp
     827:	5b                   	pop    %ebx
     828:	5e                   	pop    %esi
     829:	5f                   	pop    %edi
     82a:	5d                   	pop    %ebp
     82b:	c3                   	ret    

0000082c <main>:

int main(int argc, char *argv[]) {
     82c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     830:	83 e4 f0             	and    $0xfffffff0,%esp
     833:	ff 71 fc             	pushl  -0x4(%ecx)
     836:	55                   	push   %ebp
     837:	89 e5                	mov    %esp,%ebp
     839:	57                   	push   %edi
     83a:	56                   	push   %esi
     83b:	53                   	push   %ebx
     83c:	51                   	push   %ecx
     83d:	81 ec a8 00 00 00    	sub    $0xa8,%esp
     843:	89 cb                	mov    %ecx,%ebx
    ClickableManager cm;
    int winid;
    struct Msg msg;
    Point p;

    winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
     845:	c7 44 24 08 36 01 00 	movl   $0x136,0x8(%esp)
     84c:	00 
     84d:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
     854:	00 
     855:	8d 45 c8             	lea    -0x38(%ebp),%eax
     858:	89 04 24             	mov    %eax,(%esp)
     85b:	e8 06 03 00 00       	call   b66 <init_context>
     860:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    cm = initClickManager(context);
     863:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
     869:	8b 55 c8             	mov    -0x38(%ebp),%edx
     86c:	89 54 24 04          	mov    %edx,0x4(%esp)
     870:	8b 55 cc             	mov    -0x34(%ebp),%edx
     873:	89 54 24 08          	mov    %edx,0x8(%esp)
     877:	8b 55 d0             	mov    -0x30(%ebp),%edx
     87a:	89 54 24 0c          	mov    %edx,0xc(%esp)
     87e:	89 04 24             	mov    %eax,(%esp)
     881:	e8 b4 18 00 00       	call   213a <initClickManager>
     886:	83 ec 04             	sub    $0x4,%esp
     889:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
     88f:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     892:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
     898:	89 45 b8             	mov    %eax,-0x48(%ebp)
     89b:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
     8a1:	89 45 bc             	mov    %eax,-0x44(%ebp)
     8a4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
     8aa:	89 45 c0             	mov    %eax,-0x40(%ebp)
     8ad:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
     8b3:	89 45 c4             	mov    %eax,-0x3c(%ebp)

    loadBitmap(&pic, argv[1]);
     8b6:	8b 43 04             	mov    0x4(%ebx),%eax
     8b9:	83 c0 04             	add    $0x4,%eax
     8bc:	8b 00                	mov    (%eax),%eax
     8be:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c2:	c7 04 24 70 ff 00 00 	movl   $0xff70,(%esp)
     8c9:	e8 53 0f 00 00       	call   1821 <loadBitmap>
    load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
     8ce:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     8d5:	00 
     8d6:	c7 04 24 40 cc 00 00 	movl   $0xcc40,(%esp)
     8dd:	e8 7e 0e 00 00       	call   1760 <load_iconlist>

    modifyPic(context);
     8e2:	8b 45 c8             	mov    -0x38(%ebp),%eax
     8e5:	89 04 24             	mov    %eax,(%esp)
     8e8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     8eb:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
     8f2:	89 44 24 08          	mov    %eax,0x8(%esp)
     8f6:	e8 c4 fa ff ff       	call   3bf <modifyPic>
    deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
     8fb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
     8fe:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
     905:	00 
     906:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
     90d:	00 
     90e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     915:	00 
     916:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     91d:	00 
     91e:	89 04 24             	mov    %eax,(%esp)
     921:	e8 76 17 00 00       	call   209c <initRect>
     926:	83 ec 04             	sub    $0x4,%esp
     929:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     92c:	89 44 24 04          	mov    %eax,0x4(%esp)
     930:	8b 45 d8             	mov    -0x28(%ebp),%eax
     933:	89 44 24 08          	mov    %eax,0x8(%esp)
     937:	8b 45 dc             	mov    -0x24(%ebp),%eax
     93a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     93e:	8b 45 e0             	mov    -0x20(%ebp),%eax
     941:	89 44 24 10          	mov    %eax,0x10(%esp)
     945:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     948:	89 04 24             	mov    %eax,(%esp)
     94b:	e8 4f 19 00 00       	call   229f <deleteClickable>
    addWndEvent(&cm);
     950:	8d 45 b4             	lea    -0x4c(%ebp),%eax
     953:	89 04 24             	mov    %eax,(%esp)
     956:	e8 0b fe ff ff       	call   766 <addWndEvent>

    while (isRun) {
     95b:	e9 e2 01 00 00       	jmp    b42 <main+0x316>
        getMsg(&msg);
     960:	8d 45 98             	lea    -0x68(%ebp),%eax
     963:	89 04 24             	mov    %eax,(%esp)
     966:	e8 ef 20 00 00       	call   2a5a <getMsg>
        switch (msg.msg_type) {
     96b:	8b 45 98             	mov    -0x68(%ebp),%eax
     96e:	83 f8 08             	cmp    $0x8,%eax
     971:	0f 87 ca 01 00 00    	ja     b41 <main+0x315>
     977:	8b 04 85 90 92 00 00 	mov    0x9290(,%eax,4),%eax
     97e:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     980:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     983:	8b 55 a0             	mov    -0x60(%ebp),%edx
     986:	8d 45 90             	lea    -0x70(%ebp),%eax
     989:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     98d:	89 54 24 04          	mov    %edx,0x4(%esp)
     991:	89 04 24             	mov    %eax,(%esp)
     994:	e8 dc 16 00 00       	call   2075 <initPoint>
     999:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
     99c:	8b 4d b8             	mov    -0x48(%ebp),%ecx
     99f:	8b 45 90             	mov    -0x70(%ebp),%eax
     9a2:	8b 55 94             	mov    -0x6c(%ebp),%edx
     9a5:	89 44 24 04          	mov    %eax,0x4(%esp)
     9a9:	89 54 24 08          	mov    %edx,0x8(%esp)
     9ad:	89 0c 24             	mov    %ecx,(%esp)
     9b0:	e8 ca 19 00 00       	call   237f <executeHandler>
     9b5:	85 c0                	test   %eax,%eax
     9b7:	74 1e                	je     9d7 <main+0x1ab>
				updateWindow(winid, context.addr, msg.msg_detail);
     9b9:	8b 55 9c             	mov    -0x64(%ebp),%edx
     9bc:	8b 45 c8             	mov    -0x38(%ebp),%eax
     9bf:	89 54 24 08          	mov    %edx,0x8(%esp)
     9c3:	89 44 24 04          	mov    %eax,0x4(%esp)
     9c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9ca:	89 04 24             	mov    %eax,(%esp)
     9cd:	e8 a0 20 00 00       	call   2a72 <updateWindow>
			}
			break;
     9d2:	e9 6b 01 00 00       	jmp    b42 <main+0x316>
     9d7:	e9 66 01 00 00       	jmp    b42 <main+0x316>
		case MSG_UPDATE:
			drawPicViewerWnd(context);
     9dc:	8b 45 c8             	mov    -0x38(%ebp),%eax
     9df:	89 04 24             	mov    %eax,(%esp)
     9e2:	8b 45 cc             	mov    -0x34(%ebp),%eax
     9e5:	89 44 24 04          	mov    %eax,0x4(%esp)
     9e9:	8b 45 d0             	mov    -0x30(%ebp),%eax
     9ec:	89 44 24 08          	mov    %eax,0x8(%esp)
     9f0:	e8 b9 fa ff ff       	call   4ae <drawPicViewerWnd>
			drawPicViewerContent(context, argv[1]);
     9f5:	8b 43 04             	mov    0x4(%ebx),%eax
     9f8:	83 c0 04             	add    $0x4,%eax
     9fb:	8b 00                	mov    (%eax),%eax
     9fd:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a01:	8b 45 c8             	mov    -0x38(%ebp),%eax
     a04:	89 04 24             	mov    %eax,(%esp)
     a07:	8b 45 cc             	mov    -0x34(%ebp),%eax
     a0a:	89 44 24 04          	mov    %eax,0x4(%esp)
     a0e:	8b 45 d0             	mov    -0x30(%ebp),%eax
     a11:	89 44 24 08          	mov    %eax,0x8(%esp)
     a15:	e8 a0 fc ff ff       	call   6ba <drawPicViewerContent>
			updateWindow(winid, context.addr, msg.msg_detail);
     a1a:	8b 55 9c             	mov    -0x64(%ebp),%edx
     a1d:	8b 45 c8             	mov    -0x38(%ebp),%eax
     a20:	89 54 24 08          	mov    %edx,0x8(%esp)
     a24:	89 44 24 04          	mov    %eax,0x4(%esp)
     a28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a2b:	89 04 24             	mov    %eax,(%esp)
     a2e:	e8 3f 20 00 00       	call   2a72 <updateWindow>
			break;
     a33:	e9 0a 01 00 00       	jmp    b42 <main+0x316>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
     a38:	8b 7d ac             	mov    -0x54(%ebp),%edi
     a3b:	8b 75 a8             	mov    -0x58(%ebp),%esi
     a3e:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     a41:	8b 55 a0             	mov    -0x60(%ebp),%edx
     a44:	8b 45 c8             	mov    -0x38(%ebp),%eax
     a47:	89 7c 24 14          	mov    %edi,0x14(%esp)
     a4b:	89 74 24 10          	mov    %esi,0x10(%esp)
     a4f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     a53:	89 54 24 08          	mov    %edx,0x8(%esp)
     a57:	89 44 24 04          	mov    %eax,0x4(%esp)
     a5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a5e:	89 04 24             	mov    %eax,(%esp)
     a61:	e8 14 20 00 00       	call   2a7a <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
     a66:	e9 d7 00 00 00       	jmp    b42 <main+0x316>
		case MSG_LPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     a6b:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     a6e:	8b 55 a0             	mov    -0x60(%ebp),%edx
     a71:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
     a77:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     a7b:	89 54 24 04          	mov    %edx,0x4(%esp)
     a7f:	89 04 24             	mov    %eax,(%esp)
     a82:	e8 ee 15 00 00       	call   2075 <initPoint>
     a87:	83 ec 04             	sub    $0x4,%esp
     a8a:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
     a90:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
     a96:	89 45 90             	mov    %eax,-0x70(%ebp)
     a99:	89 55 94             	mov    %edx,-0x6c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
     a9c:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
     a9f:	8b 45 90             	mov    -0x70(%ebp),%eax
     aa2:	8b 55 94             	mov    -0x6c(%ebp),%edx
     aa5:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa9:	89 54 24 08          	mov    %edx,0x8(%esp)
     aad:	89 0c 24             	mov    %ecx,(%esp)
     ab0:	e8 ca 18 00 00       	call   237f <executeHandler>
     ab5:	85 c0                	test   %eax,%eax
     ab7:	74 1b                	je     ad4 <main+0x2a8>

				updateWindow(winid, context.addr, msg.msg_detail);
     ab9:	8b 55 9c             	mov    -0x64(%ebp),%edx
     abc:	8b 45 c8             	mov    -0x38(%ebp),%eax
     abf:	89 54 24 08          	mov    %edx,0x8(%esp)
     ac3:	89 44 24 04          	mov    %eax,0x4(%esp)
     ac7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     aca:	89 04 24             	mov    %eax,(%esp)
     acd:	e8 a0 1f 00 00       	call   2a72 <updateWindow>
			}
			break;
     ad2:	eb 6e                	jmp    b42 <main+0x316>
     ad4:	eb 6c                	jmp    b42 <main+0x316>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
     ad6:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
     ad9:	8b 55 a0             	mov    -0x60(%ebp),%edx
     adc:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
     ae2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     ae6:	89 54 24 04          	mov    %edx,0x4(%esp)
     aea:	89 04 24             	mov    %eax,(%esp)
     aed:	e8 83 15 00 00       	call   2075 <initPoint>
     af2:	83 ec 04             	sub    $0x4,%esp
     af5:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
     afb:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
     b01:	89 45 90             	mov    %eax,-0x70(%ebp)
     b04:	89 55 94             	mov    %edx,-0x6c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
     b07:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     b0a:	8b 45 90             	mov    -0x70(%ebp),%eax
     b0d:	8b 55 94             	mov    -0x6c(%ebp),%edx
     b10:	89 44 24 04          	mov    %eax,0x4(%esp)
     b14:	89 54 24 08          	mov    %edx,0x8(%esp)
     b18:	89 0c 24             	mov    %ecx,(%esp)
     b1b:	e8 5f 18 00 00       	call   237f <executeHandler>
     b20:	85 c0                	test   %eax,%eax
     b22:	74 1b                	je     b3f <main+0x313>
				updateWindow(winid, context.addr, msg.msg_detail);
     b24:	8b 55 9c             	mov    -0x64(%ebp),%edx
     b27:	8b 45 c8             	mov    -0x38(%ebp),%eax
     b2a:	89 54 24 08          	mov    %edx,0x8(%esp)
     b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
     b32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b35:	89 04 24             	mov    %eax,(%esp)
     b38:	e8 35 1f 00 00       	call   2a72 <updateWindow>
			}
			break;
     b3d:	eb 03                	jmp    b42 <main+0x316>
     b3f:	eb 01                	jmp    b42 <main+0x316>
		default:
			break;
     b41:	90                   	nop

    modifyPic(context);
    deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    addWndEvent(&cm);

    while (isRun) {
     b42:	a1 78 cc 00 00       	mov    0xcc78,%eax
     b47:	85 c0                	test   %eax,%eax
     b49:	0f 85 11 fe ff ff    	jne    960 <main+0x134>
			break;
		default:
			break;
		}
    }
    free_context(&context, winid);
     b4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     b52:	89 44 24 04          	mov    %eax,0x4(%esp)
     b56:	8d 45 c8             	lea    -0x38(%ebp),%eax
     b59:	89 04 24             	mov    %eax,(%esp)
     b5c:	e8 88 00 00 00       	call   be9 <free_context>
    exit();
     b61:	e8 54 1e 00 00       	call   29ba <exit>

00000b66 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
     b66:	55                   	push   %ebp
     b67:	89 e5                	mov    %esp,%ebp
     b69:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
     b6c:	8b 45 08             	mov    0x8(%ebp),%eax
     b6f:	8b 55 0c             	mov    0xc(%ebp),%edx
     b72:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
     b75:	8b 45 08             	mov    0x8(%ebp),%eax
     b78:	8b 55 10             	mov    0x10(%ebp),%edx
     b7b:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
     b7e:	8b 55 0c             	mov    0xc(%ebp),%edx
     b81:	8b 45 10             	mov    0x10(%ebp),%eax
     b84:	0f af c2             	imul   %edx,%eax
     b87:	01 c0                	add    %eax,%eax
     b89:	89 04 24             	mov    %eax,(%esp)
     b8c:	e8 fd 22 00 00       	call   2e8e <malloc>
     b91:	8b 55 08             	mov    0x8(%ebp),%edx
     b94:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
     b96:	8b 55 0c             	mov    0xc(%ebp),%edx
     b99:	8b 45 10             	mov    0x10(%ebp),%eax
     b9c:	0f af c2             	imul   %edx,%eax
     b9f:	8d 14 00             	lea    (%eax,%eax,1),%edx
     ba2:	8b 45 08             	mov    0x8(%ebp),%eax
     ba5:	8b 00                	mov    (%eax),%eax
     ba7:	89 54 24 08          	mov    %edx,0x8(%esp)
     bab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bb2:	00 
     bb3:	89 04 24             	mov    %eax,(%esp)
     bb6:	e8 52 1c 00 00       	call   280d <memset>
    initializeASCII();
     bbb:	e8 93 01 00 00       	call   d53 <initializeASCII>
    initializeGBK();
     bc0:	e8 17 03 00 00       	call   edc <initializeGBK>
    return createWindow(0, 0, width, height);
     bc5:	8b 45 10             	mov    0x10(%ebp),%eax
     bc8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     bcc:	8b 45 0c             	mov    0xc(%ebp),%eax
     bcf:	89 44 24 08          	mov    %eax,0x8(%esp)
     bd3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bda:	00 
     bdb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     be2:	e8 7b 1e 00 00       	call   2a62 <createWindow>
}
     be7:	c9                   	leave  
     be8:	c3                   	ret    

00000be9 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
     be9:	55                   	push   %ebp
     bea:	89 e5                	mov    %esp,%ebp
     bec:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
     bef:	8b 45 08             	mov    0x8(%ebp),%eax
     bf2:	8b 00                	mov    (%eax),%eax
     bf4:	89 04 24             	mov    %eax,(%esp)
     bf7:	e8 59 21 00 00       	call   2d55 <free>
    freeASCII();
     bfc:	e8 c6 02 00 00       	call   ec7 <freeASCII>
    freeGBK();
     c01:	e8 7e 03 00 00       	call   f84 <freeGBK>
    destroyWindow(winid);
     c06:	8b 45 0c             	mov    0xc(%ebp),%eax
     c09:	89 04 24             	mov    %eax,(%esp)
     c0c:	e8 59 1e 00 00       	call   2a6a <destroyWindow>
}
     c11:	c9                   	leave  
     c12:	c3                   	ret    

00000c13 <draw_point>:
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
     c13:	55                   	push   %ebp
     c14:	89 e5                	mov    %esp,%ebp
     c16:	83 ec 04             	sub    $0x4,%esp
     c19:	8b 45 1c             	mov    0x1c(%ebp),%eax
     c1c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width)
     c20:	8b 45 0c             	mov    0xc(%ebp),%eax
     c23:	3b 45 14             	cmp    0x14(%ebp),%eax
     c26:	77 02                	ja     c2a <draw_point+0x17>
    return;
     c28:	eb 26                	jmp    c50 <draw_point+0x3d>
  if(y >= c.height)
     c2a:	8b 45 10             	mov    0x10(%ebp),%eax
     c2d:	3b 45 18             	cmp    0x18(%ebp),%eax
     c30:	77 02                	ja     c34 <draw_point+0x21>
    return;
     c32:	eb 1c                	jmp    c50 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
     c34:	8b 55 08             	mov    0x8(%ebp),%edx
     c37:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3a:	0f af 45 18          	imul   0x18(%ebp),%eax
     c3e:	89 c1                	mov    %eax,%ecx
     c40:	8b 45 14             	mov    0x14(%ebp),%eax
     c43:	01 c8                	add    %ecx,%eax
     c45:	01 c0                	add    %eax,%eax
     c47:	01 c2                	add    %eax,%edx
     c49:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
     c4d:	66 89 02             	mov    %ax,(%edx)
}
     c50:	c9                   	leave  
     c51:	c3                   	ret    

00000c52 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
     c52:	55                   	push   %ebp
     c53:	89 e5                	mov    %esp,%ebp
     c55:	83 ec 2c             	sub    $0x2c,%esp
     c58:	8b 45 24             	mov    0x24(%ebp),%eax
     c5b:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
     c5f:	8b 45 1c             	mov    0x1c(%ebp),%eax
     c62:	8b 55 14             	mov    0x14(%ebp),%edx
     c65:	01 c2                	add    %eax,%edx
     c67:	8b 45 0c             	mov    0xc(%ebp),%eax
     c6a:	39 c2                	cmp    %eax,%edx
     c6c:	0f 46 c2             	cmovbe %edx,%eax
     c6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height;
     c72:	8b 45 20             	mov    0x20(%ebp),%eax
     c75:	8b 55 18             	mov    0x18(%ebp),%edx
     c78:	01 c2                	add    %eax,%edx
     c7a:	8b 45 10             	mov    0x10(%ebp),%eax
     c7d:	39 c2                	cmp    %eax,%edx
     c7f:	0f 46 c2             	cmovbe %edx,%eax
     c82:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
     c85:	8b 45 18             	mov    0x18(%ebp),%eax
     c88:	89 45 f8             	mov    %eax,-0x8(%ebp)
     c8b:	eb 47                	jmp    cd4 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
     c8d:	8b 45 14             	mov    0x14(%ebp),%eax
     c90:	89 45 fc             	mov    %eax,-0x4(%ebp)
     c93:	eb 33                	jmp    cc8 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
     c95:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
     c99:	8b 55 f8             	mov    -0x8(%ebp),%edx
     c9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c9f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     ca3:	89 54 24 10          	mov    %edx,0x10(%esp)
     ca7:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cab:	8b 45 08             	mov    0x8(%ebp),%eax
     cae:	89 04 24             	mov    %eax,(%esp)
     cb1:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb4:	89 44 24 04          	mov    %eax,0x4(%esp)
     cb8:	8b 45 10             	mov    0x10(%ebp),%eax
     cbb:	89 44 24 08          	mov    %eax,0x8(%esp)
     cbf:	e8 4f ff ff ff       	call   c13 <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
     cc4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     cc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ccb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     cce:	7c c5                	jl     c95 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
     cd0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
     cd4:	8b 45 f8             	mov    -0x8(%ebp),%eax
     cd7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     cda:	7c b1                	jl     c8d <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
     cdc:	c9                   	leave  
     cdd:	c3                   	ret    

00000cde <printBinary>:

void printBinary(char c)
{
     cde:	55                   	push   %ebp
     cdf:	89 e5                	mov    %esp,%ebp
     ce1:	83 ec 28             	sub    $0x28,%esp
     ce4:	8b 45 08             	mov    0x8(%ebp),%eax
     ce7:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
     cea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     cf1:	eb 44                	jmp    d37 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
     cf3:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
     cf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cfa:	89 c1                	mov    %eax,%ecx
     cfc:	d3 e2                	shl    %cl,%edx
     cfe:	89 d0                	mov    %edx,%eax
     d00:	25 80 00 00 00       	and    $0x80,%eax
     d05:	85 c0                	test   %eax,%eax
     d07:	74 16                	je     d1f <printBinary+0x41>
		{
			printf(0, "1");
     d09:	c7 44 24 04 b4 92 00 	movl   $0x92b4,0x4(%esp)
     d10:	00 
     d11:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d18:	e8 85 1e 00 00       	call   2ba2 <printf>
     d1d:	eb 14                	jmp    d33 <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
     d1f:	c7 44 24 04 b6 92 00 	movl   $0x92b6,0x4(%esp)
     d26:	00 
     d27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d2e:	e8 6f 1e 00 00       	call   2ba2 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
     d33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     d37:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
     d3b:	7e b6                	jle    cf3 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
     d3d:	c7 44 24 04 b8 92 00 	movl   $0x92b8,0x4(%esp)
     d44:	00 
     d45:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d4c:	e8 51 1e 00 00       	call   2ba2 <printf>
}
     d51:	c9                   	leave  
     d52:	c3                   	ret    

00000d53 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
     d53:	55                   	push   %ebp
     d54:	89 e5                	mov    %esp,%ebp
     d56:	56                   	push   %esi
     d57:	53                   	push   %ebx
     d58:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
     d5b:	c7 44 24 04 ba 92 00 	movl   $0x92ba,0x4(%esp)
     d62:	00 
     d63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d6a:	e8 33 1e 00 00       	call   2ba2 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
     d6f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d76:	00 
     d77:	c7 04 24 cd 92 00 00 	movl   $0x92cd,(%esp)
     d7e:	e8 77 1c 00 00       	call   29fa <open>
     d83:	89 45 e8             	mov    %eax,-0x18(%ebp)
     d86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d8a:	79 21                	jns    dad <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
     d8c:	c7 44 24 08 cd 92 00 	movl   $0x92cd,0x8(%esp)
     d93:	00 
     d94:	c7 44 24 04 d9 92 00 	movl   $0x92d9,0x4(%esp)
     d9b:	00 
     d9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     da3:	e8 fa 1d 00 00       	call   2ba2 <printf>
	  return;
     da8:	e9 13 01 00 00       	jmp    ec0 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
     dad:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
     db4:	e8 d5 20 00 00       	call   2e8e <malloc>
     db9:	a3 80 ff 00 00       	mov    %eax,0xff80
	for (i = 0; i < ASCII_NUM; i++)
     dbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     dc5:	eb 12                	jmp    dd9 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
     dc7:	8b 15 80 ff 00 00    	mov    0xff80,%edx
     dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dd0:	01 d0                	add    %edx,%eax
     dd2:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
     dd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     dd9:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
     de0:	7e e5                	jle    dc7 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
     de2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
     de9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
     df0:	e9 84 00 00 00       	jmp    e79 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
     df5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     dfc:	eb 73                	jmp    e71 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
     dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e01:	05 a0 ff 00 00       	add    $0xffa0,%eax
     e06:	0f b6 00             	movzbl (%eax),%eax
     e09:	3c 2a                	cmp    $0x2a,%al
     e0b:	74 0f                	je     e1c <initializeASCII+0xc9>
     e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e10:	05 a0 ff 00 00       	add    $0xffa0,%eax
     e15:	0f b6 00             	movzbl (%eax),%eax
     e18:	3c 2e                	cmp    $0x2e,%al
     e1a:	75 51                	jne    e6d <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
     e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e1f:	05 a0 ff 00 00       	add    $0xffa0,%eax
     e24:	0f b6 00             	movzbl (%eax),%eax
     e27:	3c 2a                	cmp    $0x2a,%al
     e29:	75 2d                	jne    e58 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
     e2b:	8b 15 80 ff 00 00    	mov    0xff80,%edx
     e31:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e34:	01 c2                	add    %eax,%edx
     e36:	8b 0d 80 ff 00 00    	mov    0xff80,%ecx
     e3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e3f:	01 c8                	add    %ecx,%eax
     e41:	0f b6 00             	movzbl (%eax),%eax
     e44:	89 c3                	mov    %eax,%ebx
     e46:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e49:	be 80 00 00 00       	mov    $0x80,%esi
     e4e:	89 c1                	mov    %eax,%ecx
     e50:	d3 fe                	sar    %cl,%esi
     e52:	89 f0                	mov    %esi,%eax
     e54:	09 d8                	or     %ebx,%eax
     e56:	88 02                	mov    %al,(%edx)
				}
				x ++;
     e58:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
     e5c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
     e60:	7e 0b                	jle    e6d <initializeASCII+0x11a>
				{
					x = 0;
     e62:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
     e69:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
     e6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     e71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e74:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
     e77:	7c 85                	jl     dfe <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
     e79:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     e80:	00 
     e81:	c7 44 24 04 a0 ff 00 	movl   $0xffa0,0x4(%esp)
     e88:	00 
     e89:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e8c:	89 04 24             	mov    %eax,(%esp)
     e8f:	e8 3e 1b 00 00       	call   29d2 <read>
     e94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     e97:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     e9b:	0f 8f 54 ff ff ff    	jg     df5 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
     ea1:	c7 44 24 04 e9 92 00 	movl   $0x92e9,0x4(%esp)
     ea8:	00 
     ea9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     eb0:	e8 ed 1c 00 00       	call   2ba2 <printf>
	close(fd);
     eb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     eb8:	89 04 24             	mov    %eax,(%esp)
     ebb:	e8 22 1b 00 00       	call   29e2 <close>
}
     ec0:	83 c4 30             	add    $0x30,%esp
     ec3:	5b                   	pop    %ebx
     ec4:	5e                   	pop    %esi
     ec5:	5d                   	pop    %ebp
     ec6:	c3                   	ret    

00000ec7 <freeASCII>:

void freeASCII(){
     ec7:	55                   	push   %ebp
     ec8:	89 e5                	mov    %esp,%ebp
     eca:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
     ecd:	a1 80 ff 00 00       	mov    0xff80,%eax
     ed2:	89 04 24             	mov    %eax,(%esp)
     ed5:	e8 7b 1e 00 00       	call   2d55 <free>
}
     eda:	c9                   	leave  
     edb:	c3                   	ret    

00000edc <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
     edc:	55                   	push   %ebp
     edd:	89 e5                	mov    %esp,%ebp
     edf:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
     ee2:	c7 44 24 04 06 93 00 	movl   $0x9306,0x4(%esp)
     ee9:	00 
     eea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ef1:	e8 ac 1c 00 00       	call   2ba2 <printf>
	if((fd = open(HZK16, 0)) < 0){
     ef6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     efd:	00 
     efe:	c7 04 24 17 93 00 00 	movl   $0x9317,(%esp)
     f05:	e8 f0 1a 00 00       	call   29fa <open>
     f0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
     f0d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     f11:	79 1e                	jns    f31 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
     f13:	c7 44 24 08 17 93 00 	movl   $0x9317,0x8(%esp)
     f1a:	00 
     f1b:	c7 44 24 04 d9 92 00 	movl   $0x92d9,0x4(%esp)
     f22:	00 
     f23:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f2a:	e8 73 1c 00 00       	call   2ba2 <printf>
		return;
     f2f:	eb 51                	jmp    f82 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
     f31:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
     f38:	e8 51 1f 00 00       	call   2e8e <malloc>
     f3d:	a3 84 ff 00 00       	mov    %eax,0xff84
	fontFile.size = read(fd, fontFile.buf, 27000);
     f42:	a1 84 ff 00 00       	mov    0xff84,%eax
     f47:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
     f4e:	00 
     f4f:	89 44 24 04          	mov    %eax,0x4(%esp)
     f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f56:	89 04 24             	mov    %eax,(%esp)
     f59:	e8 74 1a 00 00       	call   29d2 <read>
     f5e:	a3 88 ff 00 00       	mov    %eax,0xff88
	printf(0,"initialzing gbk complete!\n");
     f63:	c7 44 24 04 21 93 00 	movl   $0x9321,0x4(%esp)
     f6a:	00 
     f6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f72:	e8 2b 1c 00 00       	call   2ba2 <printf>
	close(fd);
     f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f7a:	89 04 24             	mov    %eax,(%esp)
     f7d:	e8 60 1a 00 00       	call   29e2 <close>
}
     f82:	c9                   	leave  
     f83:	c3                   	ret    

00000f84 <freeGBK>:

void freeGBK(){
     f84:	55                   	push   %ebp
     f85:	89 e5                	mov    %esp,%ebp
     f87:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
     f8a:	a1 84 ff 00 00       	mov    0xff84,%eax
     f8f:	89 04 24             	mov    %eax,(%esp)
     f92:	e8 be 1d 00 00       	call   2d55 <free>
}
     f97:	c9                   	leave  
     f98:	c3                   	ret    

00000f99 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
     f99:	55                   	push   %ebp
     f9a:	89 e5                	mov    %esp,%ebp
     f9c:	53                   	push   %ebx
     f9d:	83 ec 30             	sub    $0x30,%esp
     fa0:	8b 55 14             	mov    0x14(%ebp),%edx
     fa3:	8b 45 18             	mov    0x18(%ebp),%eax
     fa6:	88 55 e8             	mov    %dl,-0x18(%ebp)
     fa9:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
     fad:	8b 45 20             	mov    0x20(%ebp),%eax
     fb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
     fb3:	eb 7f                	jmp    1034 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
     fb5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
     fbc:	eb 6c                	jmp    102a <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
     fbe:	a1 80 ff 00 00       	mov    0xff80,%eax
     fc3:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
     fc7:	c1 e2 04             	shl    $0x4,%edx
     fca:	89 d1                	mov    %edx,%ecx
     fcc:	8b 55 20             	mov    0x20(%ebp),%edx
     fcf:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     fd2:	29 d3                	sub    %edx,%ebx
     fd4:	89 da                	mov    %ebx,%edx
     fd6:	01 ca                	add    %ecx,%edx
     fd8:	01 d0                	add    %edx,%eax
     fda:	0f b6 00             	movzbl (%eax),%eax
     fdd:	0f b6 d0             	movzbl %al,%edx
     fe0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     fe3:	89 c1                	mov    %eax,%ecx
     fe5:	d3 e2                	shl    %cl,%edx
     fe7:	89 d0                	mov    %edx,%eax
     fe9:	25 80 00 00 00       	and    $0x80,%eax
     fee:	85 c0                	test   %eax,%eax
     ff0:	74 34                	je     1026 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
     ff2:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
     ff6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ff9:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ffc:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
     fff:	01 d8                	add    %ebx,%eax
    1001:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1005:	89 54 24 10          	mov    %edx,0x10(%esp)
    1009:	89 44 24 0c          	mov    %eax,0xc(%esp)
    100d:	8b 45 08             	mov    0x8(%ebp),%eax
    1010:	89 04 24             	mov    %eax,(%esp)
    1013:	8b 45 0c             	mov    0xc(%ebp),%eax
    1016:	89 44 24 04          	mov    %eax,0x4(%esp)
    101a:	8b 45 10             	mov    0x10(%ebp),%eax
    101d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1021:	e8 ed fb ff ff       	call   c13 <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    1026:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    102a:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    102e:	7e 8e                	jle    fbe <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    1030:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1034:	8b 45 20             	mov    0x20(%ebp),%eax
    1037:	83 c0 10             	add    $0x10,%eax
    103a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    103d:	0f 8f 72 ff ff ff    	jg     fb5 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    1043:	83 c4 30             	add    $0x30,%esp
    1046:	5b                   	pop    %ebx
    1047:	5d                   	pop    %ebp
    1048:	c3                   	ret    

00001049 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    1049:	55                   	push   %ebp
    104a:	89 e5                	mov    %esp,%ebp
    104c:	53                   	push   %ebx
    104d:	83 ec 34             	sub    $0x34,%esp
    1050:	8b 55 14             	mov    0x14(%ebp),%edx
    1053:	8b 45 18             	mov    0x18(%ebp),%eax
    1056:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    105a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    105e:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    1062:	0f b6 c0             	movzbl %al,%eax
    1065:	3d a0 00 00 00       	cmp    $0xa0,%eax
    106a:	0f 8e 40 01 00 00    	jle    11b0 <put_gbk+0x167>
    1070:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    1074:	66 c1 f8 08          	sar    $0x8,%ax
    1078:	98                   	cwtl   
    1079:	0f b6 c0             	movzbl %al,%eax
    107c:	3d a0 00 00 00       	cmp    $0xa0,%eax
    1081:	0f 8e 29 01 00 00    	jle    11b0 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    1087:	a1 84 ff 00 00       	mov    0xff84,%eax
    108c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    108f:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    1093:	0f b6 c0             	movzbl %al,%eax
    1096:	2d a1 00 00 00       	sub    $0xa1,%eax
    109b:	6b c0 5e             	imul   $0x5e,%eax,%eax
    109e:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    10a2:	66 c1 fa 08          	sar    $0x8,%dx
    10a6:	0f bf d2             	movswl %dx,%edx
    10a9:	0f b6 d2             	movzbl %dl,%edx
    10ac:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    10b2:	01 d0                	add    %edx,%eax
    10b4:	c1 e0 05             	shl    $0x5,%eax
    10b7:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    10ba:	8b 45 20             	mov    0x20(%ebp),%eax
    10bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10c0:	e9 da 00 00 00       	jmp    119f <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    10c5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    10cc:	eb 58                	jmp    1126 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    10ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10d1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    10d4:	01 d0                	add    %edx,%eax
    10d6:	0f b6 00             	movzbl (%eax),%eax
    10d9:	0f b6 d0             	movzbl %al,%edx
    10dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10df:	89 c1                	mov    %eax,%ecx
    10e1:	d3 e2                	shl    %cl,%edx
    10e3:	89 d0                	mov    %edx,%eax
    10e5:	25 80 00 00 00       	and    $0x80,%eax
    10ea:	85 c0                	test   %eax,%eax
    10ec:	74 34                	je     1122 <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    10ee:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    10f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    10f8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    10fb:	01 d8                	add    %ebx,%eax
    10fd:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1101:	89 54 24 10          	mov    %edx,0x10(%esp)
    1105:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1109:	8b 45 08             	mov    0x8(%ebp),%eax
    110c:	89 04 24             	mov    %eax,(%esp)
    110f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1112:	89 44 24 04          	mov    %eax,0x4(%esp)
    1116:	8b 45 10             	mov    0x10(%ebp),%eax
    1119:	89 44 24 08          	mov    %eax,0x8(%esp)
    111d:	e8 f1 fa ff ff       	call   c13 <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1122:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1126:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    112a:	7e a2                	jle    10ce <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    112c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1130:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1137:	eb 58                	jmp    1191 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    1139:	8b 45 f0             	mov    -0x10(%ebp),%eax
    113c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    113f:	01 d0                	add    %edx,%eax
    1141:	0f b6 00             	movzbl (%eax),%eax
    1144:	0f b6 d0             	movzbl %al,%edx
    1147:	8b 45 f8             	mov    -0x8(%ebp),%eax
    114a:	89 c1                	mov    %eax,%ecx
    114c:	d3 e2                	shl    %cl,%edx
    114e:	89 d0                	mov    %edx,%eax
    1150:	25 80 00 00 00       	and    $0x80,%eax
    1155:	85 c0                	test   %eax,%eax
    1157:	74 34                	je     118d <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    1159:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    115d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1160:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1163:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    1166:	01 d8                	add    %ebx,%eax
    1168:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    116c:	89 54 24 10          	mov    %edx,0x10(%esp)
    1170:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1174:	8b 45 08             	mov    0x8(%ebp),%eax
    1177:	89 04 24             	mov    %eax,(%esp)
    117a:	8b 45 0c             	mov    0xc(%ebp),%eax
    117d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1181:	8b 45 10             	mov    0x10(%ebp),%eax
    1184:	89 44 24 08          	mov    %eax,0x8(%esp)
    1188:	e8 86 fa ff ff       	call   c13 <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    118d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1191:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    1195:	7e a2                	jle    1139 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    1197:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    119b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    119f:	8b 45 20             	mov    0x20(%ebp),%eax
    11a2:	83 c0 10             	add    $0x10,%eax
    11a5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    11a8:	0f 8f 17 ff ff ff    	jg     10c5 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    11ae:	eb 7b                	jmp    122b <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    11b0:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    11b4:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    11b8:	0f b6 c0             	movzbl %al,%eax
    11bb:	8b 4d 20             	mov    0x20(%ebp),%ecx
    11be:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    11c2:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    11c5:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    11c9:	89 54 24 10          	mov    %edx,0x10(%esp)
    11cd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    11d1:	8b 45 08             	mov    0x8(%ebp),%eax
    11d4:	89 04 24             	mov    %eax,(%esp)
    11d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    11da:	89 44 24 04          	mov    %eax,0x4(%esp)
    11de:	8b 45 10             	mov    0x10(%ebp),%eax
    11e1:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e5:	e8 af fd ff ff       	call   f99 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    11ea:	8b 45 1c             	mov    0x1c(%ebp),%eax
    11ed:	8d 58 08             	lea    0x8(%eax),%ebx
    11f0:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    11f4:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    11f8:	66 c1 f8 08          	sar    $0x8,%ax
    11fc:	0f b6 c0             	movzbl %al,%eax
    11ff:	8b 4d 20             	mov    0x20(%ebp),%ecx
    1202:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1206:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    120a:	89 54 24 10          	mov    %edx,0x10(%esp)
    120e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1212:	8b 45 08             	mov    0x8(%ebp),%eax
    1215:	89 04 24             	mov    %eax,(%esp)
    1218:	8b 45 0c             	mov    0xc(%ebp),%eax
    121b:	89 44 24 04          	mov    %eax,0x4(%esp)
    121f:	8b 45 10             	mov    0x10(%ebp),%eax
    1222:	89 44 24 08          	mov    %eax,0x8(%esp)
    1226:	e8 6e fd ff ff       	call   f99 <put_ascii>
	}
}
    122b:	83 c4 34             	add    $0x34,%esp
    122e:	5b                   	pop    %ebx
    122f:	5d                   	pop    %ebp
    1230:	c3                   	ret    

00001231 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    1231:	55                   	push   %ebp
    1232:	89 e5                	mov    %esp,%ebp
    1234:	83 ec 38             	sub    $0x38,%esp
    1237:	8b 45 18             	mov    0x18(%ebp),%eax
    123a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    123e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    1245:	8b 45 14             	mov    0x14(%ebp),%eax
    1248:	89 04 24             	mov    %eax,(%esp)
    124b:	e8 96 15 00 00       	call   27e6 <strlen>
    1250:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    1253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    125a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    125d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1260:	eb 49                	jmp    12ab <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    1262:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    1266:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1269:	8b 45 14             	mov    0x14(%ebp),%eax
    126c:	01 c8                	add    %ecx,%eax
    126e:	0f b6 00             	movzbl (%eax),%eax
    1271:	0f b6 c0             	movzbl %al,%eax
    1274:	8b 4d 20             	mov    0x20(%ebp),%ecx
    1277:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    127b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    127e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1282:	89 54 24 10          	mov    %edx,0x10(%esp)
    1286:	89 44 24 0c          	mov    %eax,0xc(%esp)
    128a:	8b 45 08             	mov    0x8(%ebp),%eax
    128d:	89 04 24             	mov    %eax,(%esp)
    1290:	8b 45 0c             	mov    0xc(%ebp),%eax
    1293:	89 44 24 04          	mov    %eax,0x4(%esp)
    1297:	8b 45 10             	mov    0x10(%ebp),%eax
    129a:	89 44 24 08          	mov    %eax,0x8(%esp)
    129e:	e8 f6 fc ff ff       	call   f99 <put_ascii>
			xTmp += 8;
    12a3:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    12a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    12ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12ae:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    12b1:	72 af                	jb     1262 <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    12b3:	c9                   	leave  
    12b4:	c3                   	ret    

000012b5 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    12b5:	55                   	push   %ebp
    12b6:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    12b8:	8b 45 10             	mov    0x10(%ebp),%eax
    12bb:	8d 50 07             	lea    0x7(%eax),%edx
    12be:	85 c0                	test   %eax,%eax
    12c0:	0f 48 c2             	cmovs  %edx,%eax
    12c3:	c1 f8 03             	sar    $0x3,%eax
    12c6:	89 c2                	mov    %eax,%edx
    12c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    12cb:	8d 48 03             	lea    0x3(%eax),%ecx
    12ce:	85 c0                	test   %eax,%eax
    12d0:	0f 48 c1             	cmovs  %ecx,%eax
    12d3:	c1 f8 02             	sar    $0x2,%eax
    12d6:	c1 e0 05             	shl    $0x5,%eax
    12d9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    12dc:	8b 45 08             	mov    0x8(%ebp),%eax
    12df:	8d 50 07             	lea    0x7(%eax),%edx
    12e2:	85 c0                	test   %eax,%eax
    12e4:	0f 48 c2             	cmovs  %edx,%eax
    12e7:	c1 f8 03             	sar    $0x3,%eax
    12ea:	c1 e0 0b             	shl    $0xb,%eax
    12ed:	01 c8                	add    %ecx,%eax
}
    12ef:	5d                   	pop    %ebp
    12f0:	c3                   	ret    

000012f1 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    12f1:	55                   	push   %ebp
    12f2:	89 e5                	mov    %esp,%ebp
    12f4:	53                   	push   %ebx
    12f5:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    12f8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    12ff:	e9 b1 00 00 00       	jmp    13b5 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    1304:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    130b:	e9 95 00 00 00       	jmp    13a5 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    1310:	8b 55 14             	mov    0x14(%ebp),%edx
    1313:	8b 45 18             	mov    0x18(%ebp),%eax
    1316:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    131a:	89 c1                	mov    %eax,%ecx
    131c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    131f:	01 c8                	add    %ecx,%eax
    1321:	c1 e0 02             	shl    $0x2,%eax
    1324:	01 d0                	add    %edx,%eax
    1326:	8b 00                	mov    (%eax),%eax
    1328:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    132b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    132f:	3c 01                	cmp    $0x1,%al
    1331:	75 02                	jne    1335 <draw_picture+0x44>
    1333:	eb 6c                	jmp    13a1 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    1335:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1339:	0f b6 c8             	movzbl %al,%ecx
    133c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1340:	0f b6 d0             	movzbl %al,%edx
    1343:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    1347:	0f b6 c0             	movzbl %al,%eax
    134a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    134e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1352:	89 04 24             	mov    %eax,(%esp)
    1355:	e8 5b ff ff ff       	call   12b5 <_RGB16BIT565>
    135a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    135e:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    1362:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1365:	83 e8 01             	sub    $0x1,%eax
    1368:	2b 45 f8             	sub    -0x8(%ebp),%eax
    136b:	89 c2                	mov    %eax,%edx
    136d:	8b 45 24             	mov    0x24(%ebp),%eax
    1370:	01 d0                	add    %edx,%eax
    1372:	89 c2                	mov    %eax,%edx
    1374:	8b 45 20             	mov    0x20(%ebp),%eax
    1377:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    137a:	01 d8                	add    %ebx,%eax
    137c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1380:	89 54 24 10          	mov    %edx,0x10(%esp)
    1384:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1388:	8b 45 08             	mov    0x8(%ebp),%eax
    138b:	89 04 24             	mov    %eax,(%esp)
    138e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1391:	89 44 24 04          	mov    %eax,0x4(%esp)
    1395:	8b 45 10             	mov    0x10(%ebp),%eax
    1398:	89 44 24 08          	mov    %eax,0x8(%esp)
    139c:	e8 72 f8 ff ff       	call   c13 <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    13a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    13a5:	8b 45 18             	mov    0x18(%ebp),%eax
    13a8:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    13ab:	0f 8f 5f ff ff ff    	jg     1310 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    13b1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    13b5:	8b 45 1c             	mov    0x1c(%ebp),%eax
    13b8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    13bb:	0f 8f 43 ff ff ff    	jg     1304 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    13c1:	83 c4 28             	add    $0x28,%esp
    13c4:	5b                   	pop    %ebx
    13c5:	5d                   	pop    %ebp
    13c6:	c3                   	ret    

000013c7 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    13c7:	55                   	push   %ebp
    13c8:	89 e5                	mov    %esp,%ebp
    13ca:	83 ec 3c             	sub    $0x3c,%esp
    13cd:	8b 45 24             	mov    0x24(%ebp),%eax
    13d0:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    13d4:	8b 45 14             	mov    0x14(%ebp),%eax
    13d7:	8b 55 1c             	mov    0x1c(%ebp),%edx
    13da:	29 c2                	sub    %eax,%edx
    13dc:	89 d0                	mov    %edx,%eax
    13de:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    13e1:	8b 45 18             	mov    0x18(%ebp),%eax
    13e4:	8b 55 20             	mov    0x20(%ebp),%edx
    13e7:	29 c2                	sub    %eax,%edx
    13e9:	89 d0                	mov    %edx,%eax
    13eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    13ee:	8b 45 14             	mov    0x14(%ebp),%eax
    13f1:	c1 e0 0a             	shl    $0xa,%eax
    13f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    13f7:	8b 45 18             	mov    0x18(%ebp),%eax
    13fa:	c1 e0 0a             	shl    $0xa,%eax
    13fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    1400:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1403:	c1 f8 1f             	sar    $0x1f,%eax
    1406:	31 45 fc             	xor    %eax,-0x4(%ebp)
    1409:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    140c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    140f:	c1 f8 1f             	sar    $0x1f,%eax
    1412:	31 45 f8             	xor    %eax,-0x8(%ebp)
    1415:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    1418:	8b 45 fc             	mov    -0x4(%ebp),%eax
    141b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    141e:	7c 57                	jl     1477 <draw_line+0xb0>
		len = dx + 1;
    1420:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1423:	83 c0 01             	add    $0x1,%eax
    1426:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    1429:	8b 45 1c             	mov    0x1c(%ebp),%eax
    142c:	3b 45 14             	cmp    0x14(%ebp),%eax
    142f:	7e 07                	jle    1438 <draw_line+0x71>
    1431:	b8 00 04 00 00       	mov    $0x400,%eax
    1436:	eb 05                	jmp    143d <draw_line+0x76>
    1438:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    143d:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    1440:	8b 45 20             	mov    0x20(%ebp),%eax
    1443:	3b 45 18             	cmp    0x18(%ebp),%eax
    1446:	7c 16                	jl     145e <draw_line+0x97>
    1448:	8b 45 18             	mov    0x18(%ebp),%eax
    144b:	8b 55 20             	mov    0x20(%ebp),%edx
    144e:	29 c2                	sub    %eax,%edx
    1450:	89 d0                	mov    %edx,%eax
    1452:	83 c0 01             	add    $0x1,%eax
    1455:	c1 e0 0a             	shl    $0xa,%eax
    1458:	99                   	cltd   
    1459:	f7 7d ec             	idivl  -0x14(%ebp)
    145c:	eb 14                	jmp    1472 <draw_line+0xab>
    145e:	8b 45 18             	mov    0x18(%ebp),%eax
    1461:	8b 55 20             	mov    0x20(%ebp),%edx
    1464:	29 c2                	sub    %eax,%edx
    1466:	89 d0                	mov    %edx,%eax
    1468:	83 e8 01             	sub    $0x1,%eax
    146b:	c1 e0 0a             	shl    $0xa,%eax
    146e:	99                   	cltd   
    146f:	f7 7d ec             	idivl  -0x14(%ebp)
    1472:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1475:	eb 55                	jmp    14cc <draw_line+0x105>
	}
	else {
		len = dy + 1;
    1477:	8b 45 f8             	mov    -0x8(%ebp),%eax
    147a:	83 c0 01             	add    $0x1,%eax
    147d:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    1480:	8b 45 20             	mov    0x20(%ebp),%eax
    1483:	3b 45 18             	cmp    0x18(%ebp),%eax
    1486:	7e 07                	jle    148f <draw_line+0xc8>
    1488:	b8 00 04 00 00       	mov    $0x400,%eax
    148d:	eb 05                	jmp    1494 <draw_line+0xcd>
    148f:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    1494:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    1497:	8b 45 1c             	mov    0x1c(%ebp),%eax
    149a:	3b 45 14             	cmp    0x14(%ebp),%eax
    149d:	7c 16                	jl     14b5 <draw_line+0xee>
    149f:	8b 45 14             	mov    0x14(%ebp),%eax
    14a2:	8b 55 1c             	mov    0x1c(%ebp),%edx
    14a5:	29 c2                	sub    %eax,%edx
    14a7:	89 d0                	mov    %edx,%eax
    14a9:	83 c0 01             	add    $0x1,%eax
    14ac:	c1 e0 0a             	shl    $0xa,%eax
    14af:	99                   	cltd   
    14b0:	f7 7d ec             	idivl  -0x14(%ebp)
    14b3:	eb 14                	jmp    14c9 <draw_line+0x102>
    14b5:	8b 45 14             	mov    0x14(%ebp),%eax
    14b8:	8b 55 1c             	mov    0x1c(%ebp),%edx
    14bb:	29 c2                	sub    %eax,%edx
    14bd:	89 d0                	mov    %edx,%eax
    14bf:	83 e8 01             	sub    $0x1,%eax
    14c2:	c1 e0 0a             	shl    $0xa,%eax
    14c5:	99                   	cltd   
    14c6:	f7 7d ec             	idivl  -0x14(%ebp)
    14c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    14cc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    14d3:	eb 47                	jmp    151c <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    14d5:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    14d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14dc:	c1 f8 0a             	sar    $0xa,%eax
    14df:	89 c2                	mov    %eax,%edx
    14e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e4:	c1 f8 0a             	sar    $0xa,%eax
    14e7:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    14eb:	89 54 24 10          	mov    %edx,0x10(%esp)
    14ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
    14f3:	8b 45 08             	mov    0x8(%ebp),%eax
    14f6:	89 04 24             	mov    %eax,(%esp)
    14f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    14fc:	89 44 24 04          	mov    %eax,0x4(%esp)
    1500:	8b 45 10             	mov    0x10(%ebp),%eax
    1503:	89 44 24 08          	mov    %eax,0x8(%esp)
    1507:	e8 07 f7 ff ff       	call   c13 <draw_point>
		y += dy;
    150c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    150f:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    1512:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1515:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    1518:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    151c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    151f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1522:	7c b1                	jl     14d5 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    1524:	c9                   	leave  
    1525:	c3                   	ret    

00001526 <draw_window>:

void
draw_window(Context c, char *title)
{
    1526:	55                   	push   %ebp
    1527:	89 e5                	mov    %esp,%ebp
    1529:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    152c:	8b 45 0c             	mov    0xc(%ebp),%eax
    152f:	83 e8 01             	sub    $0x1,%eax
    1532:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1539:	00 
    153a:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1541:	00 
    1542:	89 44 24 14          	mov    %eax,0x14(%esp)
    1546:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    154d:	00 
    154e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1555:	00 
    1556:	8b 45 08             	mov    0x8(%ebp),%eax
    1559:	89 04 24             	mov    %eax,(%esp)
    155c:	8b 45 0c             	mov    0xc(%ebp),%eax
    155f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1563:	8b 45 10             	mov    0x10(%ebp),%eax
    1566:	89 44 24 08          	mov    %eax,0x8(%esp)
    156a:	e8 58 fe ff ff       	call   13c7 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    156f:	8b 45 10             	mov    0x10(%ebp),%eax
    1572:	8d 48 ff             	lea    -0x1(%eax),%ecx
    1575:	8b 45 0c             	mov    0xc(%ebp),%eax
    1578:	8d 50 ff             	lea    -0x1(%eax),%edx
    157b:	8b 45 0c             	mov    0xc(%ebp),%eax
    157e:	83 e8 01             	sub    $0x1,%eax
    1581:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1588:	00 
    1589:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    158d:	89 54 24 14          	mov    %edx,0x14(%esp)
    1591:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1598:	00 
    1599:	89 44 24 0c          	mov    %eax,0xc(%esp)
    159d:	8b 45 08             	mov    0x8(%ebp),%eax
    15a0:	89 04 24             	mov    %eax,(%esp)
    15a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    15a6:	89 44 24 04          	mov    %eax,0x4(%esp)
    15aa:	8b 45 10             	mov    0x10(%ebp),%eax
    15ad:	89 44 24 08          	mov    %eax,0x8(%esp)
    15b1:	e8 11 fe ff ff       	call   13c7 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    15b6:	8b 45 10             	mov    0x10(%ebp),%eax
    15b9:	8d 48 ff             	lea    -0x1(%eax),%ecx
    15bc:	8b 45 10             	mov    0x10(%ebp),%eax
    15bf:	8d 50 ff             	lea    -0x1(%eax),%edx
    15c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    15c5:	83 e8 01             	sub    $0x1,%eax
    15c8:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    15cf:	00 
    15d0:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    15d4:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    15db:	00 
    15dc:	89 54 24 10          	mov    %edx,0x10(%esp)
    15e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    15e4:	8b 45 08             	mov    0x8(%ebp),%eax
    15e7:	89 04 24             	mov    %eax,(%esp)
    15ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    15ed:	89 44 24 04          	mov    %eax,0x4(%esp)
    15f1:	8b 45 10             	mov    0x10(%ebp),%eax
    15f4:	89 44 24 08          	mov    %eax,0x8(%esp)
    15f8:	e8 ca fd ff ff       	call   13c7 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    15fd:	8b 45 10             	mov    0x10(%ebp),%eax
    1600:	83 e8 01             	sub    $0x1,%eax
    1603:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    160a:	00 
    160b:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    1612:	00 
    1613:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    161a:	00 
    161b:	89 44 24 10          	mov    %eax,0x10(%esp)
    161f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    1626:	00 
    1627:	8b 45 08             	mov    0x8(%ebp),%eax
    162a:	89 04 24             	mov    %eax,(%esp)
    162d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1630:	89 44 24 04          	mov    %eax,0x4(%esp)
    1634:	8b 45 10             	mov    0x10(%ebp),%eax
    1637:	89 44 24 08          	mov    %eax,0x8(%esp)
    163b:	e8 87 fd ff ff       	call   13c7 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    1640:	8b 45 0c             	mov    0xc(%ebp),%eax
    1643:	83 e8 02             	sub    $0x2,%eax
    1646:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    164d:	00 
    164e:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    1655:	00 
    1656:	89 44 24 14          	mov    %eax,0x14(%esp)
    165a:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    1661:	00 
    1662:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1669:	00 
    166a:	8b 45 08             	mov    0x8(%ebp),%eax
    166d:	89 04 24             	mov    %eax,(%esp)
    1670:	8b 45 0c             	mov    0xc(%ebp),%eax
    1673:	89 44 24 04          	mov    %eax,0x4(%esp)
    1677:	8b 45 10             	mov    0x10(%ebp),%eax
    167a:	89 44 24 08          	mov    %eax,0x8(%esp)
    167e:	e8 cf f5 ff ff       	call   c52 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    1683:	8b 45 0c             	mov    0xc(%ebp),%eax
    1686:	83 e8 02             	sub    $0x2,%eax
    1689:	89 c2                	mov    %eax,%edx
    168b:	8b 45 10             	mov    0x10(%ebp),%eax
    168e:	83 e8 15             	sub    $0x15,%eax
    1691:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    1698:	00 
    1699:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    16a0:	00 
    16a1:	89 54 24 14          	mov    %edx,0x14(%esp)
    16a5:	89 44 24 10          	mov    %eax,0x10(%esp)
    16a9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    16b0:	00 
    16b1:	8b 45 08             	mov    0x8(%ebp),%eax
    16b4:	89 04 24             	mov    %eax,(%esp)
    16b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    16ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    16be:	8b 45 10             	mov    0x10(%ebp),%eax
    16c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    16c5:	e8 88 f5 ff ff       	call   c52 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    16ca:	c7 44 24 04 3c 93 00 	movl   $0x933c,0x4(%esp)
    16d1:	00 
    16d2:	8d 45 ec             	lea    -0x14(%ebp),%eax
    16d5:	89 04 24             	mov    %eax,(%esp)
    16d8:	e8 44 01 00 00       	call   1821 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    16dd:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    16e4:	00 
    16e5:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    16ec:	00 
    16ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16f0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16f7:	89 44 24 10          	mov    %eax,0x10(%esp)
    16fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16fe:	89 44 24 14          	mov    %eax,0x14(%esp)
    1702:	8b 45 08             	mov    0x8(%ebp),%eax
    1705:	89 04 24             	mov    %eax,(%esp)
    1708:	8b 45 0c             	mov    0xc(%ebp),%eax
    170b:	89 44 24 04          	mov    %eax,0x4(%esp)
    170f:	8b 45 10             	mov    0x10(%ebp),%eax
    1712:	89 44 24 08          	mov    %eax,0x8(%esp)
    1716:	e8 d6 fb ff ff       	call   12f1 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    171b:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    1722:	00 
    1723:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    172a:	00 
    172b:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    1732:	00 
    1733:	8b 45 14             	mov    0x14(%ebp),%eax
    1736:	89 44 24 0c          	mov    %eax,0xc(%esp)
    173a:	8b 45 08             	mov    0x8(%ebp),%eax
    173d:	89 04 24             	mov    %eax,(%esp)
    1740:	8b 45 0c             	mov    0xc(%ebp),%eax
    1743:	89 44 24 04          	mov    %eax,0x4(%esp)
    1747:	8b 45 10             	mov    0x10(%ebp),%eax
    174a:	89 44 24 08          	mov    %eax,0x8(%esp)
    174e:	e8 de fa ff ff       	call   1231 <puts_str>
  freepic(&pic);
    1753:	8d 45 ec             	lea    -0x14(%ebp),%eax
    1756:	89 04 24             	mov    %eax,(%esp)
    1759:	e8 6f 06 00 00       	call   1dcd <freepic>
}
    175e:	c9                   	leave  
    175f:	c3                   	ret    

00001760 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    1760:	55                   	push   %ebp
    1761:	89 e5                	mov    %esp,%ebp
    1763:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    1766:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    176d:	eb 29                	jmp    1798 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    176f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1772:	6b d0 34             	imul   $0x34,%eax,%edx
    1775:	8b 45 08             	mov    0x8(%ebp),%eax
    1778:	01 d0                	add    %edx,%eax
    177a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    177d:	6b ca 34             	imul   $0x34,%edx,%ecx
    1780:	8b 55 08             	mov    0x8(%ebp),%edx
    1783:	01 ca                	add    %ecx,%edx
    1785:	83 c2 28             	add    $0x28,%edx
    1788:	89 44 24 04          	mov    %eax,0x4(%esp)
    178c:	89 14 24             	mov    %edx,(%esp)
    178f:	e8 8d 00 00 00       	call   1821 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    1794:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1798:	8b 45 f4             	mov    -0xc(%ebp),%eax
    179b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    179e:	7c cf                	jl     176f <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    17a0:	c9                   	leave  
    17a1:	c3                   	ret    

000017a2 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    17a2:	55                   	push   %ebp
    17a3:	89 e5                	mov    %esp,%ebp
    17a5:	53                   	push   %ebx
    17a6:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    17a9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    17b0:	eb 61                	jmp    1813 <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    17b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17b5:	6b d0 34             	imul   $0x34,%eax,%edx
    17b8:	8b 45 14             	mov    0x14(%ebp),%eax
    17bb:	01 d0                	add    %edx,%eax
    17bd:	8b 48 24             	mov    0x24(%eax),%ecx
    17c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17c3:	6b d0 34             	imul   $0x34,%eax,%edx
    17c6:	8b 45 14             	mov    0x14(%ebp),%eax
    17c9:	01 d0                	add    %edx,%eax
    17cb:	8b 50 20             	mov    0x20(%eax),%edx
    17ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
    17d1:	6b d8 34             	imul   $0x34,%eax,%ebx
    17d4:	8b 45 14             	mov    0x14(%ebp),%eax
    17d7:	01 d8                	add    %ebx,%eax
    17d9:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    17dd:	89 54 24 18          	mov    %edx,0x18(%esp)
    17e1:	8b 50 28             	mov    0x28(%eax),%edx
    17e4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    17e8:	8b 50 2c             	mov    0x2c(%eax),%edx
    17eb:	89 54 24 10          	mov    %edx,0x10(%esp)
    17ef:	8b 40 30             	mov    0x30(%eax),%eax
    17f2:	89 44 24 14          	mov    %eax,0x14(%esp)
    17f6:	8b 45 08             	mov    0x8(%ebp),%eax
    17f9:	89 04 24             	mov    %eax,(%esp)
    17fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    17ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1803:	8b 45 10             	mov    0x10(%ebp),%eax
    1806:	89 44 24 08          	mov    %eax,0x8(%esp)
    180a:	e8 e2 fa ff ff       	call   12f1 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    180f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1813:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1816:	3b 45 18             	cmp    0x18(%ebp),%eax
    1819:	7c 97                	jl     17b2 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    181b:	83 c4 30             	add    $0x30,%esp
    181e:	5b                   	pop    %ebx
    181f:	5d                   	pop    %ebp
    1820:	c3                   	ret    

00001821 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    1821:	55                   	push   %ebp
    1822:	89 e5                	mov    %esp,%ebp
    1824:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    182a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    1831:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1838:	00 
    1839:	8b 45 0c             	mov    0xc(%ebp),%eax
    183c:	89 04 24             	mov    %eax,(%esp)
    183f:	e8 b6 11 00 00       	call   29fa <open>
    1844:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1847:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    184b:	79 20                	jns    186d <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    184d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1850:	89 44 24 08          	mov    %eax,0x8(%esp)
    1854:	c7 44 24 04 48 93 00 	movl   $0x9348,0x4(%esp)
    185b:	00 
    185c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1863:	e8 3a 13 00 00       	call   2ba2 <printf>
		return;
    1868:	e9 ef 02 00 00       	jmp    1b5c <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    186d:	8b 45 0c             	mov    0xc(%ebp),%eax
    1870:	89 44 24 08          	mov    %eax,0x8(%esp)
    1874:	c7 44 24 04 58 93 00 	movl   $0x9358,0x4(%esp)
    187b:	00 
    187c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1883:	e8 1a 13 00 00       	call   2ba2 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    1888:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    188f:	e8 fa 15 00 00       	call   2e8e <malloc>
    1894:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    1897:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    189e:	00 
    189f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18a2:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18a9:	89 04 24             	mov    %eax,(%esp)
    18ac:	e8 21 11 00 00       	call   29d2 <read>
    18b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    18b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    18ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    18bd:	0f b7 00             	movzwl (%eax),%eax
    18c0:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    18c4:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    18c8:	66 3d 42 4d          	cmp    $0x4d42,%ax
    18cc:	74 19                	je     18e7 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    18ce:	c7 44 24 04 6c 93 00 	movl   $0x936c,0x4(%esp)
    18d5:	00 
    18d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18dd:	e8 c0 12 00 00       	call   2ba2 <printf>
		return;
    18e2:	e9 75 02 00 00       	jmp    1b5c <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    18e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18ea:	83 c0 02             	add    $0x2,%eax
    18ed:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    18f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    18f3:	8b 00                	mov    (%eax),%eax
    18f5:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    18f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    18fb:	83 c0 06             	add    $0x6,%eax
    18fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    1901:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1904:	0f b7 00             	movzwl (%eax),%eax
    1907:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    190b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    190e:	83 c0 08             	add    $0x8,%eax
    1911:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    1914:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1917:	0f b7 00             	movzwl (%eax),%eax
    191a:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    191e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1921:	83 c0 0a             	add    $0xa,%eax
    1924:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    1927:	8b 45 d8             	mov    -0x28(%ebp),%eax
    192a:	8b 00                	mov    (%eax),%eax
    192c:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    192f:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    1936:	00 
    1937:	8d 45 84             	lea    -0x7c(%ebp),%eax
    193a:	89 44 24 04          	mov    %eax,0x4(%esp)
    193e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1941:	89 04 24             	mov    %eax,(%esp)
    1944:	e8 89 10 00 00       	call   29d2 <read>
	width = bitInfoHead.biWidth;
    1949:	8b 45 88             	mov    -0x78(%ebp),%eax
    194c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    194f:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1952:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    1955:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1958:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    195c:	c1 e0 02             	shl    $0x2,%eax
    195f:	89 44 24 10          	mov    %eax,0x10(%esp)
    1963:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1966:	89 44 24 0c          	mov    %eax,0xc(%esp)
    196a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    196d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1971:	c7 44 24 04 84 93 00 	movl   $0x9384,0x4(%esp)
    1978:	00 
    1979:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1980:	e8 1d 12 00 00       	call   2ba2 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    1985:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    1989:	75 14                	jne    199f <loadBitmap+0x17e>
		printf(0, "0");
    198b:	c7 44 24 04 a9 93 00 	movl   $0x93a9,0x4(%esp)
    1992:	00 
    1993:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    199a:	e8 03 12 00 00       	call   2ba2 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    199f:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    19a3:	0f b7 c0             	movzwl %ax,%eax
    19a6:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    19aa:	83 c0 1f             	add    $0x1f,%eax
    19ad:	8d 50 1f             	lea    0x1f(%eax),%edx
    19b0:	85 c0                	test   %eax,%eax
    19b2:	0f 48 c2             	cmovs  %edx,%eax
    19b5:	c1 f8 05             	sar    $0x5,%eax
    19b8:	c1 e0 02             	shl    $0x2,%eax
    19bb:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    19be:	8b 45 d0             	mov    -0x30(%ebp),%eax
    19c1:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    19c5:	89 04 24             	mov    %eax,(%esp)
    19c8:	e8 c1 14 00 00       	call   2e8e <malloc>
    19cd:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    19d0:	8b 55 d0             	mov    -0x30(%ebp),%edx
    19d3:	8b 45 cc             	mov    -0x34(%ebp),%eax
    19d6:	0f af c2             	imul   %edx,%eax
    19d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    19dd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19e4:	00 
    19e5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    19e8:	89 04 24             	mov    %eax,(%esp)
    19eb:	e8 1d 0e 00 00       	call   280d <memset>
	long nData = height * l_width;
    19f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    19f3:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    19f7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    19fa:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    19fd:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a01:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1a04:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a08:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a0b:	89 04 24             	mov    %eax,(%esp)
    1a0e:	e8 bf 0f 00 00       	call   29d2 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    1a13:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a16:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    1a1a:	c1 e0 02             	shl    $0x2,%eax
    1a1d:	89 04 24             	mov    %eax,(%esp)
    1a20:	e8 69 14 00 00       	call   2e8e <malloc>
    1a25:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    1a28:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1a2b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1a2e:	0f af c2             	imul   %edx,%eax
    1a31:	c1 e0 02             	shl    $0x2,%eax
    1a34:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a3f:	00 
    1a40:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1a43:	89 04 24             	mov    %eax,(%esp)
    1a46:	e8 c2 0d 00 00       	call   280d <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    1a4b:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    1a4f:	66 83 f8 17          	cmp    $0x17,%ax
    1a53:	77 19                	ja     1a6e <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    1a55:	c7 44 24 04 ac 93 00 	movl   $0x93ac,0x4(%esp)
    1a5c:	00 
    1a5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a64:	e8 39 11 00 00       	call   2ba2 <printf>
		return;
    1a69:	e9 ee 00 00 00       	jmp    1b5c <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    1a6e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    1a75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1a7c:	e9 94 00 00 00       	jmp    1b15 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    1a81:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1a88:	eb 7b                	jmp    1b05 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    1a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a8d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    1a91:	89 c1                	mov    %eax,%ecx
    1a93:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1a96:	89 d0                	mov    %edx,%eax
    1a98:	01 c0                	add    %eax,%eax
    1a9a:	01 d0                	add    %edx,%eax
    1a9c:	01 c8                	add    %ecx,%eax
    1a9e:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    1aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1aa4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1aab:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1aae:	01 c2                	add    %eax,%edx
    1ab0:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1ab3:	8d 48 02             	lea    0x2(%eax),%ecx
    1ab6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1ab9:	01 c8                	add    %ecx,%eax
    1abb:	0f b6 00             	movzbl (%eax),%eax
    1abe:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    1ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ac4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1acb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1ace:	01 c2                	add    %eax,%edx
    1ad0:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1ad3:	8d 48 01             	lea    0x1(%eax),%ecx
    1ad6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1ad9:	01 c8                	add    %ecx,%eax
    1adb:	0f b6 00             	movzbl (%eax),%eax
    1ade:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    1ae1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1ae4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1aeb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1aee:	01 c2                	add    %eax,%edx
    1af0:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    1af3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1af6:	01 c8                	add    %ecx,%eax
    1af8:	0f b6 00             	movzbl (%eax),%eax
    1afb:	88 02                	mov    %al,(%edx)
				index++;
    1afd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    1b01:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1b05:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b08:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    1b0b:	0f 8c 79 ff ff ff    	jl     1a8a <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    1b11:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b18:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    1b1b:	0f 8c 60 ff ff ff    	jl     1a81 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    1b21:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1b24:	89 04 24             	mov    %eax,(%esp)
    1b27:	e8 b6 0e 00 00       	call   29e2 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    1b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1b2f:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1b32:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    1b34:	8b 45 08             	mov    0x8(%ebp),%eax
    1b37:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1b3a:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    1b3d:	8b 45 08             	mov    0x8(%ebp),%eax
    1b40:	8b 55 d0             	mov    -0x30(%ebp),%edx
    1b43:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    1b46:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1b49:	89 04 24             	mov    %eax,(%esp)
    1b4c:	e8 04 12 00 00       	call   2d55 <free>
	free(BmpFileHeader);
    1b51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b54:	89 04 24             	mov    %eax,(%esp)
    1b57:	e8 f9 11 00 00       	call   2d55 <free>
	//printf("\n");
}
    1b5c:	c9                   	leave  
    1b5d:	c3                   	ret    

00001b5e <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    1b5e:	55                   	push   %ebp
    1b5f:	89 e5                	mov    %esp,%ebp
    1b61:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    1b64:	c7 44 24 04 cc 93 00 	movl   $0x93cc,0x4(%esp)
    1b6b:	00 
    1b6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b73:	e8 2a 10 00 00       	call   2ba2 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    1b78:	8b 45 08             	mov    0x8(%ebp),%eax
    1b7b:	0f b7 00             	movzwl (%eax),%eax
    1b7e:	0f b7 c0             	movzwl %ax,%eax
    1b81:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b85:	c7 44 24 04 de 93 00 	movl   $0x93de,0x4(%esp)
    1b8c:	00 
    1b8d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b94:	e8 09 10 00 00       	call   2ba2 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    1b99:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9c:	8b 40 04             	mov    0x4(%eax),%eax
    1b9f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ba3:	c7 44 24 04 fc 93 00 	movl   $0x93fc,0x4(%esp)
    1baa:	00 
    1bab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bb2:	e8 eb 0f 00 00       	call   2ba2 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    1bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    1bba:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    1bbe:	0f b7 c0             	movzwl %ax,%eax
    1bc1:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bc5:	c7 44 24 04 0d 94 00 	movl   $0x940d,0x4(%esp)
    1bcc:	00 
    1bcd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bd4:	e8 c9 0f 00 00       	call   2ba2 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    1bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    1bdc:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    1be0:	0f b7 c0             	movzwl %ax,%eax
    1be3:	89 44 24 08          	mov    %eax,0x8(%esp)
    1be7:	c7 44 24 04 0d 94 00 	movl   $0x940d,0x4(%esp)
    1bee:	00 
    1bef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1bf6:	e8 a7 0f 00 00       	call   2ba2 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    1bfb:	8b 45 08             	mov    0x8(%ebp),%eax
    1bfe:	8b 40 0c             	mov    0xc(%eax),%eax
    1c01:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c05:	c7 44 24 04 1c 94 00 	movl   $0x941c,0x4(%esp)
    1c0c:	00 
    1c0d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c14:	e8 89 0f 00 00       	call   2ba2 <printf>
}
    1c19:	c9                   	leave  
    1c1a:	c3                   	ret    

00001c1b <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    1c1b:	55                   	push   %ebp
    1c1c:	89 e5                	mov    %esp,%ebp
    1c1e:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    1c21:	c7 44 24 04 45 94 00 	movl   $0x9445,0x4(%esp)
    1c28:	00 
    1c29:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c30:	e8 6d 0f 00 00       	call   2ba2 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    1c35:	8b 45 08             	mov    0x8(%ebp),%eax
    1c38:	8b 00                	mov    (%eax),%eax
    1c3a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c3e:	c7 44 24 04 57 94 00 	movl   $0x9457,0x4(%esp)
    1c45:	00 
    1c46:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c4d:	e8 50 0f 00 00       	call   2ba2 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    1c52:	8b 45 08             	mov    0x8(%ebp),%eax
    1c55:	8b 40 04             	mov    0x4(%eax),%eax
    1c58:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c5c:	c7 44 24 04 6e 94 00 	movl   $0x946e,0x4(%esp)
    1c63:	00 
    1c64:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c6b:	e8 32 0f 00 00       	call   2ba2 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    1c70:	8b 45 08             	mov    0x8(%ebp),%eax
    1c73:	8b 40 08             	mov    0x8(%eax),%eax
    1c76:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c7a:	c7 44 24 04 7c 94 00 	movl   $0x947c,0x4(%esp)
    1c81:	00 
    1c82:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c89:	e8 14 0f 00 00       	call   2ba2 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    1c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1c91:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    1c95:	0f b7 c0             	movzwl %ax,%eax
    1c98:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c9c:	c7 44 24 04 8a 94 00 	movl   $0x948a,0x4(%esp)
    1ca3:	00 
    1ca4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cab:	e8 f2 0e 00 00       	call   2ba2 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    1cb0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cb3:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    1cb7:	0f b7 c0             	movzwl %ax,%eax
    1cba:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cbe:	c7 44 24 04 a0 94 00 	movl   $0x94a0,0x4(%esp)
    1cc5:	00 
    1cc6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ccd:	e8 d0 0e 00 00       	call   2ba2 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    1cd2:	8b 45 08             	mov    0x8(%ebp),%eax
    1cd5:	8b 40 10             	mov    0x10(%eax),%eax
    1cd8:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cdc:	c7 44 24 04 c1 94 00 	movl   $0x94c1,0x4(%esp)
    1ce3:	00 
    1ce4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ceb:	e8 b2 0e 00 00       	call   2ba2 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    1cf0:	8b 45 08             	mov    0x8(%ebp),%eax
    1cf3:	8b 40 14             	mov    0x14(%eax),%eax
    1cf6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1cfa:	c7 44 24 04 d4 94 00 	movl   $0x94d4,0x4(%esp)
    1d01:	00 
    1d02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d09:	e8 94 0e 00 00       	call   2ba2 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    1d0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d11:	8b 40 18             	mov    0x18(%eax),%eax
    1d14:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d18:	c7 44 24 04 08 95 00 	movl   $0x9508,0x4(%esp)
    1d1f:	00 
    1d20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d27:	e8 76 0e 00 00       	call   2ba2 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    1d2c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d2f:	8b 40 1c             	mov    0x1c(%eax),%eax
    1d32:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d36:	c7 44 24 04 1d 95 00 	movl   $0x951d,0x4(%esp)
    1d3d:	00 
    1d3e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d45:	e8 58 0e 00 00       	call   2ba2 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    1d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d4d:	8b 40 20             	mov    0x20(%eax),%eax
    1d50:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d54:	c7 44 24 04 32 95 00 	movl   $0x9532,0x4(%esp)
    1d5b:	00 
    1d5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d63:	e8 3a 0e 00 00       	call   2ba2 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    1d68:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6b:	8b 40 24             	mov    0x24(%eax),%eax
    1d6e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d72:	c7 44 24 04 49 95 00 	movl   $0x9549,0x4(%esp)
    1d79:	00 
    1d7a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d81:	e8 1c 0e 00 00       	call   2ba2 <printf>
}
    1d86:	c9                   	leave  
    1d87:	c3                   	ret    

00001d88 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    1d88:	55                   	push   %ebp
    1d89:	89 e5                	mov    %esp,%ebp
    1d8b:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    1d8e:	8b 45 08             	mov    0x8(%ebp),%eax
    1d91:	0f b6 00             	movzbl (%eax),%eax
    1d94:	0f b6 c8             	movzbl %al,%ecx
    1d97:	8b 45 08             	mov    0x8(%ebp),%eax
    1d9a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    1d9e:	0f b6 d0             	movzbl %al,%edx
    1da1:	8b 45 08             	mov    0x8(%ebp),%eax
    1da4:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    1da8:	0f b6 c0             	movzbl %al,%eax
    1dab:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1daf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1db3:	89 44 24 08          	mov    %eax,0x8(%esp)
    1db7:	c7 44 24 04 5d 95 00 	movl   $0x955d,0x4(%esp)
    1dbe:	00 
    1dbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1dc6:	e8 d7 0d 00 00       	call   2ba2 <printf>
}
    1dcb:	c9                   	leave  
    1dcc:	c3                   	ret    

00001dcd <freepic>:

void freepic(PICNODE *pic) {
    1dcd:	55                   	push   %ebp
    1dce:	89 e5                	mov    %esp,%ebp
    1dd0:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    1dd3:	8b 45 08             	mov    0x8(%ebp),%eax
    1dd6:	8b 00                	mov    (%eax),%eax
    1dd8:	89 04 24             	mov    %eax,(%esp)
    1ddb:	e8 75 0f 00 00       	call   2d55 <free>
}
    1de0:	c9                   	leave  
    1de1:	c3                   	ret    

00001de2 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    1de2:	55                   	push   %ebp
    1de3:	89 e5                	mov    %esp,%ebp
    1de5:	53                   	push   %ebx
    1de6:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    1dec:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    1df3:	8d 45 dc             	lea    -0x24(%ebp),%eax
    1df6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1df9:	89 54 24 10          	mov    %edx,0x10(%esp)
    1dfd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1e00:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1e04:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1e0b:	00 
    1e0c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e13:	00 
    1e14:	89 04 24             	mov    %eax,(%esp)
    1e17:	e8 80 02 00 00       	call   209c <initRect>
    1e1c:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    1e1f:	8b 45 08             	mov    0x8(%ebp),%eax
    1e22:	8b 40 04             	mov    0x4(%eax),%eax
    1e25:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1e28:	89 c2                	mov    %eax,%edx
    1e2a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1e2d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1e30:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1e34:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1e37:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1e3b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1e42:	00 
    1e43:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e47:	89 04 24             	mov    %eax,(%esp)
    1e4a:	e8 4d 02 00 00       	call   209c <initRect>
    1e4f:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    1e52:	8b 45 08             	mov    0x8(%ebp),%eax
    1e55:	8b 40 08             	mov    0x8(%eax),%eax
    1e58:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1e5b:	89 c1                	mov    %eax,%ecx
    1e5d:	8b 45 08             	mov    0x8(%ebp),%eax
    1e60:	8b 40 04             	mov    0x4(%eax),%eax
    1e63:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1e66:	89 c2                	mov    %eax,%edx
    1e68:	8d 45 bc             	lea    -0x44(%ebp),%eax
    1e6b:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    1e6e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    1e72:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    1e75:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    1e79:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1e7d:	89 54 24 04          	mov    %edx,0x4(%esp)
    1e81:	89 04 24             	mov    %eax,(%esp)
    1e84:	e8 13 02 00 00       	call   209c <initRect>
    1e89:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    1e8c:	8b 45 08             	mov    0x8(%ebp),%eax
    1e8f:	8b 40 08             	mov    0x8(%eax),%eax
    1e92:	2b 45 ec             	sub    -0x14(%ebp),%eax
    1e95:	89 c2                	mov    %eax,%edx
    1e97:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1e9a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1e9d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1ea1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1ea4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1ea8:	89 54 24 08          	mov    %edx,0x8(%esp)
    1eac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1eb3:	00 
    1eb4:	89 04 24             	mov    %eax,(%esp)
    1eb7:	e8 e0 01 00 00       	call   209c <initRect>
    1ebc:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    1ebf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1ec6:	e9 96 01 00 00       	jmp    2061 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    1ecb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1ed2:	e9 77 01 00 00       	jmp    204e <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    1ed7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    1eda:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1edd:	89 54 24 08          	mov    %edx,0x8(%esp)
    1ee1:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ee4:	89 54 24 04          	mov    %edx,0x4(%esp)
    1ee8:	89 04 24             	mov    %eax,(%esp)
    1eeb:	e8 85 01 00 00       	call   2075 <initPoint>
    1ef0:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    1ef3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1ef6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1efa:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1efd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1f04:	89 44 24 10          	mov    %eax,0x10(%esp)
    1f08:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f0b:	89 44 24 14          	mov    %eax,0x14(%esp)
    1f0f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    1f12:	8b 55 a8             	mov    -0x58(%ebp),%edx
    1f15:	89 04 24             	mov    %eax,(%esp)
    1f18:	89 54 24 04          	mov    %edx,0x4(%esp)
    1f1c:	e8 d6 01 00 00       	call   20f7 <isIn>
    1f21:	85 c0                	test   %eax,%eax
    1f23:	0f 85 9a 00 00 00    	jne    1fc3 <set_icon_alpha+0x1e1>
    1f29:	8b 45 cc             	mov    -0x34(%ebp),%eax
    1f2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f30:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1f33:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f37:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1f3a:	89 44 24 10          	mov    %eax,0x10(%esp)
    1f3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1f41:	89 44 24 14          	mov    %eax,0x14(%esp)
    1f45:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    1f48:	8b 55 a8             	mov    -0x58(%ebp),%edx
    1f4b:	89 04 24             	mov    %eax,(%esp)
    1f4e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1f52:	e8 a0 01 00 00       	call   20f7 <isIn>
    1f57:	85 c0                	test   %eax,%eax
    1f59:	75 68                	jne    1fc3 <set_icon_alpha+0x1e1>
    1f5b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1f5e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f62:	8b 45 c0             	mov    -0x40(%ebp),%eax
    1f65:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f69:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    1f6c:	89 44 24 10          	mov    %eax,0x10(%esp)
    1f70:	8b 45 c8             	mov    -0x38(%ebp),%eax
    1f73:	89 44 24 14          	mov    %eax,0x14(%esp)
    1f77:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    1f7a:	8b 55 a8             	mov    -0x58(%ebp),%edx
    1f7d:	89 04 24             	mov    %eax,(%esp)
    1f80:	89 54 24 04          	mov    %edx,0x4(%esp)
    1f84:	e8 6e 01 00 00       	call   20f7 <isIn>
    1f89:	85 c0                	test   %eax,%eax
    1f8b:	75 36                	jne    1fc3 <set_icon_alpha+0x1e1>
    1f8d:	8b 45 ac             	mov    -0x54(%ebp),%eax
    1f90:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f94:	8b 45 b0             	mov    -0x50(%ebp),%eax
    1f97:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f9b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1f9e:	89 44 24 10          	mov    %eax,0x10(%esp)
    1fa2:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1fa5:	89 44 24 14          	mov    %eax,0x14(%esp)
    1fa9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    1fac:	8b 55 a8             	mov    -0x58(%ebp),%edx
    1faf:	89 04 24             	mov    %eax,(%esp)
    1fb2:	89 54 24 04          	mov    %edx,0x4(%esp)
    1fb6:	e8 3c 01 00 00       	call   20f7 <isIn>
    1fbb:	85 c0                	test   %eax,%eax
    1fbd:	0f 84 87 00 00 00    	je     204a <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    1fc3:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc6:	8b 10                	mov    (%eax),%edx
    1fc8:	8b 45 08             	mov    0x8(%ebp),%eax
    1fcb:	8b 40 04             	mov    0x4(%eax),%eax
    1fce:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1fd2:	89 c1                	mov    %eax,%ecx
    1fd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fd7:	01 c8                	add    %ecx,%eax
    1fd9:	c1 e0 02             	shl    $0x2,%eax
    1fdc:	01 d0                	add    %edx,%eax
    1fde:	0f b6 00             	movzbl (%eax),%eax
    1fe1:	3c ff                	cmp    $0xff,%al
    1fe3:	75 65                	jne    204a <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    1fe5:	8b 45 08             	mov    0x8(%ebp),%eax
    1fe8:	8b 10                	mov    (%eax),%edx
    1fea:	8b 45 08             	mov    0x8(%ebp),%eax
    1fed:	8b 40 04             	mov    0x4(%eax),%eax
    1ff0:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    1ff4:	89 c1                	mov    %eax,%ecx
    1ff6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ff9:	01 c8                	add    %ecx,%eax
    1ffb:	c1 e0 02             	shl    $0x2,%eax
    1ffe:	01 d0                	add    %edx,%eax
    2000:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2004:	3c ff                	cmp    $0xff,%al
    2006:	75 42                	jne    204a <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    2008:	8b 45 08             	mov    0x8(%ebp),%eax
    200b:	8b 10                	mov    (%eax),%edx
    200d:	8b 45 08             	mov    0x8(%ebp),%eax
    2010:	8b 40 04             	mov    0x4(%eax),%eax
    2013:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    2017:	89 c1                	mov    %eax,%ecx
    2019:	8b 45 f4             	mov    -0xc(%ebp),%eax
    201c:	01 c8                	add    %ecx,%eax
    201e:	c1 e0 02             	shl    $0x2,%eax
    2021:	01 d0                	add    %edx,%eax
    2023:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2027:	3c ff                	cmp    $0xff,%al
    2029:	75 1f                	jne    204a <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    202b:	8b 45 08             	mov    0x8(%ebp),%eax
    202e:	8b 10                	mov    (%eax),%edx
    2030:	8b 45 08             	mov    0x8(%ebp),%eax
    2033:	8b 40 04             	mov    0x4(%eax),%eax
    2036:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    203a:	89 c1                	mov    %eax,%ecx
    203c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    203f:	01 c8                	add    %ecx,%eax
    2041:	c1 e0 02             	shl    $0x2,%eax
    2044:	01 d0                	add    %edx,%eax
    2046:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    204a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    204e:	8b 45 08             	mov    0x8(%ebp),%eax
    2051:	8b 40 08             	mov    0x8(%eax),%eax
    2054:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2057:	0f 8f 7a fe ff ff    	jg     1ed7 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    205d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2061:	8b 45 08             	mov    0x8(%ebp),%eax
    2064:	8b 40 04             	mov    0x4(%eax),%eax
    2067:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    206a:	0f 8f 5b fe ff ff    	jg     1ecb <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    2070:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2073:	c9                   	leave  
    2074:	c3                   	ret    

00002075 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    2075:	55                   	push   %ebp
    2076:	89 e5                	mov    %esp,%ebp
    2078:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    207b:	8b 45 0c             	mov    0xc(%ebp),%eax
    207e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    2081:	8b 45 10             	mov    0x10(%ebp),%eax
    2084:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    2087:	8b 4d 08             	mov    0x8(%ebp),%ecx
    208a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    208d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    2090:	89 01                	mov    %eax,(%ecx)
    2092:	89 51 04             	mov    %edx,0x4(%ecx)
}
    2095:	8b 45 08             	mov    0x8(%ebp),%eax
    2098:	c9                   	leave  
    2099:	c2 04 00             	ret    $0x4

0000209c <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    209c:	55                   	push   %ebp
    209d:	89 e5                	mov    %esp,%ebp
    209f:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    20a2:	8d 45 e8             	lea    -0x18(%ebp),%eax
    20a5:	8b 55 10             	mov    0x10(%ebp),%edx
    20a8:	89 54 24 08          	mov    %edx,0x8(%esp)
    20ac:	8b 55 0c             	mov    0xc(%ebp),%edx
    20af:	89 54 24 04          	mov    %edx,0x4(%esp)
    20b3:	89 04 24             	mov    %eax,(%esp)
    20b6:	e8 ba ff ff ff       	call   2075 <initPoint>
    20bb:	83 ec 04             	sub    $0x4,%esp
    20be:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20c1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    20c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    20c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    20ca:	8b 45 14             	mov    0x14(%ebp),%eax
    20cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    20d0:	8b 45 18             	mov    0x18(%ebp),%eax
    20d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    20d6:	8b 45 08             	mov    0x8(%ebp),%eax
    20d9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    20dc:	89 10                	mov    %edx,(%eax)
    20de:	8b 55 f4             	mov    -0xc(%ebp),%edx
    20e1:	89 50 04             	mov    %edx,0x4(%eax)
    20e4:	8b 55 f8             	mov    -0x8(%ebp),%edx
    20e7:	89 50 08             	mov    %edx,0x8(%eax)
    20ea:	8b 55 fc             	mov    -0x4(%ebp),%edx
    20ed:	89 50 0c             	mov    %edx,0xc(%eax)
}
    20f0:	8b 45 08             	mov    0x8(%ebp),%eax
    20f3:	c9                   	leave  
    20f4:	c2 04 00             	ret    $0x4

000020f7 <isIn>:

int isIn(Point p, Rect r)
{
    20f7:	55                   	push   %ebp
    20f8:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    20fa:	8b 55 08             	mov    0x8(%ebp),%edx
    20fd:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    2100:	39 c2                	cmp    %eax,%edx
    2102:	7c 2f                	jl     2133 <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    2104:	8b 45 08             	mov    0x8(%ebp),%eax
    2107:	8b 4d 10             	mov    0x10(%ebp),%ecx
    210a:	8b 55 18             	mov    0x18(%ebp),%edx
    210d:	01 ca                	add    %ecx,%edx
    210f:	39 d0                	cmp    %edx,%eax
    2111:	7d 20                	jge    2133 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    2113:	8b 55 0c             	mov    0xc(%ebp),%edx
    2116:	8b 45 14             	mov    0x14(%ebp),%eax
    2119:	39 c2                	cmp    %eax,%edx
    211b:	7c 16                	jl     2133 <isIn+0x3c>
    211d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2120:	8b 4d 14             	mov    0x14(%ebp),%ecx
    2123:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2126:	01 ca                	add    %ecx,%edx
    2128:	39 d0                	cmp    %edx,%eax
    212a:	7d 07                	jge    2133 <isIn+0x3c>
    212c:	b8 01 00 00 00       	mov    $0x1,%eax
    2131:	eb 05                	jmp    2138 <isIn+0x41>
    2133:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2138:	5d                   	pop    %ebp
    2139:	c3                   	ret    

0000213a <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    213a:	55                   	push   %ebp
    213b:	89 e5                	mov    %esp,%ebp
    213d:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    2140:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    2147:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    214e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    2155:	8b 45 10             	mov    0x10(%ebp),%eax
    2158:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    215b:	8b 45 14             	mov    0x14(%ebp),%eax
    215e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    2161:	8b 45 08             	mov    0x8(%ebp),%eax
    2164:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2167:	89 10                	mov    %edx,(%eax)
    2169:	8b 55 f0             	mov    -0x10(%ebp),%edx
    216c:	89 50 04             	mov    %edx,0x4(%eax)
    216f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2172:	89 50 08             	mov    %edx,0x8(%eax)
    2175:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2178:	89 50 0c             	mov    %edx,0xc(%eax)
    217b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    217e:	89 50 10             	mov    %edx,0x10(%eax)
}
    2181:	8b 45 08             	mov    0x8(%ebp),%eax
    2184:	c9                   	leave  
    2185:	c2 04 00             	ret    $0x4

00002188 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    2188:	55                   	push   %ebp
    2189:	89 e5                	mov    %esp,%ebp
    218b:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    218e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2191:	83 f8 03             	cmp    $0x3,%eax
    2194:	74 72                	je     2208 <createClickable+0x80>
    2196:	83 f8 04             	cmp    $0x4,%eax
    2199:	74 0a                	je     21a5 <createClickable+0x1d>
    219b:	83 f8 02             	cmp    $0x2,%eax
    219e:	74 38                	je     21d8 <createClickable+0x50>
    21a0:	e9 96 00 00 00       	jmp    223b <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    21a5:	8b 45 08             	mov    0x8(%ebp),%eax
    21a8:	8d 50 04             	lea    0x4(%eax),%edx
    21ab:	8b 45 20             	mov    0x20(%ebp),%eax
    21ae:	89 44 24 14          	mov    %eax,0x14(%esp)
    21b2:	8b 45 0c             	mov    0xc(%ebp),%eax
    21b5:	89 44 24 04          	mov    %eax,0x4(%esp)
    21b9:	8b 45 10             	mov    0x10(%ebp),%eax
    21bc:	89 44 24 08          	mov    %eax,0x8(%esp)
    21c0:	8b 45 14             	mov    0x14(%ebp),%eax
    21c3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    21c7:	8b 45 18             	mov    0x18(%ebp),%eax
    21ca:	89 44 24 10          	mov    %eax,0x10(%esp)
    21ce:	89 14 24             	mov    %edx,(%esp)
    21d1:	e8 7c 00 00 00       	call   2252 <addClickable>
	        break;
    21d6:	eb 78                	jmp    2250 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    21d8:	8b 45 08             	mov    0x8(%ebp),%eax
    21db:	8b 55 20             	mov    0x20(%ebp),%edx
    21de:	89 54 24 14          	mov    %edx,0x14(%esp)
    21e2:	8b 55 0c             	mov    0xc(%ebp),%edx
    21e5:	89 54 24 04          	mov    %edx,0x4(%esp)
    21e9:	8b 55 10             	mov    0x10(%ebp),%edx
    21ec:	89 54 24 08          	mov    %edx,0x8(%esp)
    21f0:	8b 55 14             	mov    0x14(%ebp),%edx
    21f3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    21f7:	8b 55 18             	mov    0x18(%ebp),%edx
    21fa:	89 54 24 10          	mov    %edx,0x10(%esp)
    21fe:	89 04 24             	mov    %eax,(%esp)
    2201:	e8 4c 00 00 00       	call   2252 <addClickable>
	    	break;
    2206:	eb 48                	jmp    2250 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    2208:	8b 45 08             	mov    0x8(%ebp),%eax
    220b:	8d 50 08             	lea    0x8(%eax),%edx
    220e:	8b 45 20             	mov    0x20(%ebp),%eax
    2211:	89 44 24 14          	mov    %eax,0x14(%esp)
    2215:	8b 45 0c             	mov    0xc(%ebp),%eax
    2218:	89 44 24 04          	mov    %eax,0x4(%esp)
    221c:	8b 45 10             	mov    0x10(%ebp),%eax
    221f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2223:	8b 45 14             	mov    0x14(%ebp),%eax
    2226:	89 44 24 0c          	mov    %eax,0xc(%esp)
    222a:	8b 45 18             	mov    0x18(%ebp),%eax
    222d:	89 44 24 10          	mov    %eax,0x10(%esp)
    2231:	89 14 24             	mov    %edx,(%esp)
    2234:	e8 19 00 00 00       	call   2252 <addClickable>
	    	break;
    2239:	eb 15                	jmp    2250 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    223b:	c7 44 24 04 6c 95 00 	movl   $0x956c,0x4(%esp)
    2242:	00 
    2243:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    224a:	e8 53 09 00 00       	call   2ba2 <printf>
	    	break;
    224f:	90                   	nop
	}
}
    2250:	c9                   	leave  
    2251:	c3                   	ret    

00002252 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    2252:	55                   	push   %ebp
    2253:	89 e5                	mov    %esp,%ebp
    2255:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    2258:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    225f:	e8 2a 0c 00 00       	call   2e8e <malloc>
    2264:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    2267:	8b 45 f4             	mov    -0xc(%ebp),%eax
    226a:	8b 55 0c             	mov    0xc(%ebp),%edx
    226d:	89 10                	mov    %edx,(%eax)
    226f:	8b 55 10             	mov    0x10(%ebp),%edx
    2272:	89 50 04             	mov    %edx,0x4(%eax)
    2275:	8b 55 14             	mov    0x14(%ebp),%edx
    2278:	89 50 08             	mov    %edx,0x8(%eax)
    227b:	8b 55 18             	mov    0x18(%ebp),%edx
    227e:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    2281:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2284:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2287:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    228a:	8b 45 08             	mov    0x8(%ebp),%eax
    228d:	8b 10                	mov    (%eax),%edx
    228f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2292:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    2295:	8b 45 08             	mov    0x8(%ebp),%eax
    2298:	8b 55 f4             	mov    -0xc(%ebp),%edx
    229b:	89 10                	mov    %edx,(%eax)
}
    229d:	c9                   	leave  
    229e:	c3                   	ret    

0000229f <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    229f:	55                   	push   %ebp
    22a0:	89 e5                	mov    %esp,%ebp
    22a2:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    22a5:	8b 45 08             	mov    0x8(%ebp),%eax
    22a8:	8b 00                	mov    (%eax),%eax
    22aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    22ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    22b3:	e9 bb 00 00 00       	jmp    2373 <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    22b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    22bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    22bf:	8b 45 10             	mov    0x10(%ebp),%eax
    22c2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22c6:	8b 45 14             	mov    0x14(%ebp),%eax
    22c9:	89 44 24 10          	mov    %eax,0x10(%esp)
    22cd:	8b 45 18             	mov    0x18(%ebp),%eax
    22d0:	89 44 24 14          	mov    %eax,0x14(%esp)
    22d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22d7:	8b 50 04             	mov    0x4(%eax),%edx
    22da:	8b 00                	mov    (%eax),%eax
    22dc:	89 04 24             	mov    %eax,(%esp)
    22df:	89 54 24 04          	mov    %edx,0x4(%esp)
    22e3:	e8 0f fe ff ff       	call   20f7 <isIn>
    22e8:	85 c0                	test   %eax,%eax
    22ea:	74 60                	je     234c <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    22ec:	8b 45 08             	mov    0x8(%ebp),%eax
    22ef:	8b 00                	mov    (%eax),%eax
    22f1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    22f4:	75 2e                	jne    2324 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    22f6:	8b 45 08             	mov    0x8(%ebp),%eax
    22f9:	8b 00                	mov    (%eax),%eax
    22fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    22fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2301:	8b 50 14             	mov    0x14(%eax),%edx
    2304:	8b 45 08             	mov    0x8(%ebp),%eax
    2307:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    2309:	8b 45 08             	mov    0x8(%ebp),%eax
    230c:	8b 00                	mov    (%eax),%eax
    230e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2311:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2314:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    2317:	8b 45 ec             	mov    -0x14(%ebp),%eax
    231a:	89 04 24             	mov    %eax,(%esp)
    231d:	e8 33 0a 00 00       	call   2d55 <free>
    2322:	eb 4f                	jmp    2373 <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    2324:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2327:	8b 50 14             	mov    0x14(%eax),%edx
    232a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    232d:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    2330:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2333:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    2336:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2339:	8b 40 14             	mov    0x14(%eax),%eax
    233c:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    233f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2342:	89 04 24             	mov    %eax,(%esp)
    2345:	e8 0b 0a 00 00       	call   2d55 <free>
    234a:	eb 27                	jmp    2373 <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    234c:	8b 45 08             	mov    0x8(%ebp),%eax
    234f:	8b 00                	mov    (%eax),%eax
    2351:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2354:	75 0b                	jne    2361 <deleteClickable+0xc2>
			{
				cur = cur->next;
    2356:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2359:	8b 40 14             	mov    0x14(%eax),%eax
    235c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    235f:	eb 12                	jmp    2373 <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    2361:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2364:	8b 40 14             	mov    0x14(%eax),%eax
    2367:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    236a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    236d:	8b 40 14             	mov    0x14(%eax),%eax
    2370:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    2373:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2377:	0f 85 3b ff ff ff    	jne    22b8 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    237d:	c9                   	leave  
    237e:	c3                   	ret    

0000237f <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    237f:	55                   	push   %ebp
    2380:	89 e5                	mov    %esp,%ebp
    2382:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    2385:	8b 45 08             	mov    0x8(%ebp),%eax
    2388:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    238b:	eb 59                	jmp    23e6 <executeHandler+0x67>
	{
		if (isIn(click, cur->area))
    238d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2390:	8b 10                	mov    (%eax),%edx
    2392:	89 54 24 08          	mov    %edx,0x8(%esp)
    2396:	8b 50 04             	mov    0x4(%eax),%edx
    2399:	89 54 24 0c          	mov    %edx,0xc(%esp)
    239d:	8b 50 08             	mov    0x8(%eax),%edx
    23a0:	89 54 24 10          	mov    %edx,0x10(%esp)
    23a4:	8b 40 0c             	mov    0xc(%eax),%eax
    23a7:	89 44 24 14          	mov    %eax,0x14(%esp)
    23ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    23ae:	8b 55 10             	mov    0x10(%ebp),%edx
    23b1:	89 04 24             	mov    %eax,(%esp)
    23b4:	89 54 24 04          	mov    %edx,0x4(%esp)
    23b8:	e8 3a fd ff ff       	call   20f7 <isIn>
    23bd:	85 c0                	test   %eax,%eax
    23bf:	74 1c                	je     23dd <executeHandler+0x5e>
		{
			cur->handler(click);
    23c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23c4:	8b 48 10             	mov    0x10(%eax),%ecx
    23c7:	8b 45 0c             	mov    0xc(%ebp),%eax
    23ca:	8b 55 10             	mov    0x10(%ebp),%edx
    23cd:	89 04 24             	mov    %eax,(%esp)
    23d0:	89 54 24 04          	mov    %edx,0x4(%esp)
    23d4:	ff d1                	call   *%ecx
			return 1;
    23d6:	b8 01 00 00 00       	mov    $0x1,%eax
    23db:	eb 28                	jmp    2405 <executeHandler+0x86>
		}
		cur = cur->next;
    23dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23e0:	8b 40 14             	mov    0x14(%eax),%eax
    23e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    23e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    23ea:	75 a1                	jne    238d <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    23ec:	c7 44 24 04 9a 95 00 	movl   $0x959a,0x4(%esp)
    23f3:	00 
    23f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23fb:	e8 a2 07 00 00       	call   2ba2 <printf>
	return 0;
    2400:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2405:	c9                   	leave  
    2406:	c3                   	ret    

00002407 <printClickable>:

void printClickable(Clickable *c)
{
    2407:	55                   	push   %ebp
    2408:	89 e5                	mov    %esp,%ebp
    240a:	53                   	push   %ebx
    240b:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    240e:	8b 45 08             	mov    0x8(%ebp),%eax
    2411:	8b 58 0c             	mov    0xc(%eax),%ebx
    2414:	8b 45 08             	mov    0x8(%ebp),%eax
    2417:	8b 48 08             	mov    0x8(%eax),%ecx
    241a:	8b 45 08             	mov    0x8(%ebp),%eax
    241d:	8b 50 04             	mov    0x4(%eax),%edx
    2420:	8b 45 08             	mov    0x8(%ebp),%eax
    2423:	8b 00                	mov    (%eax),%eax
    2425:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    2429:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    242d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2431:	89 44 24 08          	mov    %eax,0x8(%esp)
    2435:	c7 44 24 04 aa 95 00 	movl   $0x95aa,0x4(%esp)
    243c:	00 
    243d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2444:	e8 59 07 00 00       	call   2ba2 <printf>
}
    2449:	83 c4 24             	add    $0x24,%esp
    244c:	5b                   	pop    %ebx
    244d:	5d                   	pop    %ebp
    244e:	c3                   	ret    

0000244f <printClickableList>:

void printClickableList(Clickable *head)
{
    244f:	55                   	push   %ebp
    2450:	89 e5                	mov    %esp,%ebp
    2452:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    2455:	8b 45 08             	mov    0x8(%ebp),%eax
    2458:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    245b:	c7 44 24 04 bc 95 00 	movl   $0x95bc,0x4(%esp)
    2462:	00 
    2463:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    246a:	e8 33 07 00 00       	call   2ba2 <printf>
	while(cur != 0)
    246f:	eb 14                	jmp    2485 <printClickableList+0x36>
	{
		printClickable(cur);
    2471:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2474:	89 04 24             	mov    %eax,(%esp)
    2477:	e8 8b ff ff ff       	call   2407 <printClickable>
		cur = cur->next;
    247c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    247f:	8b 40 14             	mov    0x14(%eax),%eax
    2482:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    2485:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2489:	75 e6                	jne    2471 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    248b:	c7 44 24 04 cd 95 00 	movl   $0x95cd,0x4(%esp)
    2492:	00 
    2493:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    249a:	e8 03 07 00 00       	call   2ba2 <printf>
}
    249f:	c9                   	leave  
    24a0:	c3                   	ret    

000024a1 <testHanler>:

void testHanler(struct Point p)
{
    24a1:	55                   	push   %ebp
    24a2:	89 e5                	mov    %esp,%ebp
    24a4:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    24a7:	8b 55 0c             	mov    0xc(%ebp),%edx
    24aa:	8b 45 08             	mov    0x8(%ebp),%eax
    24ad:	89 54 24 0c          	mov    %edx,0xc(%esp)
    24b1:	89 44 24 08          	mov    %eax,0x8(%esp)
    24b5:	c7 44 24 04 cf 95 00 	movl   $0x95cf,0x4(%esp)
    24bc:	00 
    24bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24c4:	e8 d9 06 00 00       	call   2ba2 <printf>
}
    24c9:	c9                   	leave  
    24ca:	c3                   	ret    

000024cb <testClickable>:
void testClickable(struct Context c)
{
    24cb:	55                   	push   %ebp
    24cc:	89 e5                	mov    %esp,%ebp
    24ce:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    24d4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    24d7:	8b 55 08             	mov    0x8(%ebp),%edx
    24da:	89 54 24 04          	mov    %edx,0x4(%esp)
    24de:	8b 55 0c             	mov    0xc(%ebp),%edx
    24e1:	89 54 24 08          	mov    %edx,0x8(%esp)
    24e5:	8b 55 10             	mov    0x10(%ebp),%edx
    24e8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    24ec:	89 04 24             	mov    %eax,(%esp)
    24ef:	e8 46 fc ff ff       	call   213a <initClickManager>
    24f4:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    24f7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    24fa:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    2501:	00 
    2502:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    2509:	00 
    250a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    2511:	00 
    2512:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    2519:	00 
    251a:	89 04 24             	mov    %eax,(%esp)
    251d:	e8 7a fb ff ff       	call   209c <initRect>
    2522:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    2525:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    2528:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    252f:	00 
    2530:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    2537:	00 
    2538:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    253f:	00 
    2540:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    2547:	00 
    2548:	89 04 24             	mov    %eax,(%esp)
    254b:	e8 4c fb ff ff       	call   209c <initRect>
    2550:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    2553:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    2556:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    255d:	00 
    255e:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    2565:	00 
    2566:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    256d:	00 
    256e:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    2575:	00 
    2576:	89 04 24             	mov    %eax,(%esp)
    2579:	e8 1e fb ff ff       	call   209c <initRect>
    257e:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    2581:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    2584:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    258b:	00 
    258c:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    2593:	00 
    2594:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    259b:	00 
    259c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    25a3:	00 
    25a4:	89 04 24             	mov    %eax,(%esp)
    25a7:	e8 f0 fa ff ff       	call   209c <initRect>
    25ac:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    25af:	8d 45 9c             	lea    -0x64(%ebp),%eax
    25b2:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    25b9:	00 
    25ba:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    25c1:	00 
    25c2:	89 04 24             	mov    %eax,(%esp)
    25c5:	e8 ab fa ff ff       	call   2075 <initPoint>
    25ca:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    25cd:	8d 45 94             	lea    -0x6c(%ebp),%eax
    25d0:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    25d7:	00 
    25d8:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    25df:	00 
    25e0:	89 04 24             	mov    %eax,(%esp)
    25e3:	e8 8d fa ff ff       	call   2075 <initPoint>
    25e8:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    25eb:	c7 44 24 18 a1 24 00 	movl   $0x24a1,0x18(%esp)
    25f2:	00 
    25f3:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    25fa:	00 
    25fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    25fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    2602:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2605:	89 44 24 08          	mov    %eax,0x8(%esp)
    2609:	8b 45 dc             	mov    -0x24(%ebp),%eax
    260c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2610:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2613:	89 44 24 10          	mov    %eax,0x10(%esp)
    2617:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    261a:	89 04 24             	mov    %eax,(%esp)
    261d:	e8 66 fb ff ff       	call   2188 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    2622:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2625:	89 44 24 08          	mov    %eax,0x8(%esp)
    2629:	c7 44 24 04 e3 95 00 	movl   $0x95e3,0x4(%esp)
    2630:	00 
    2631:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2638:	e8 65 05 00 00       	call   2ba2 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    263d:	c7 44 24 18 a1 24 00 	movl   $0x24a1,0x18(%esp)
    2644:	00 
    2645:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    264c:	00 
    264d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2650:	89 44 24 04          	mov    %eax,0x4(%esp)
    2654:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2657:	89 44 24 08          	mov    %eax,0x8(%esp)
    265b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    265e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2662:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2665:	89 44 24 10          	mov    %eax,0x10(%esp)
    2669:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    266c:	89 04 24             	mov    %eax,(%esp)
    266f:	e8 14 fb ff ff       	call   2188 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    2674:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2677:	89 44 24 08          	mov    %eax,0x8(%esp)
    267b:	c7 44 24 04 e3 95 00 	movl   $0x95e3,0x4(%esp)
    2682:	00 
    2683:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    268a:	e8 13 05 00 00       	call   2ba2 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    268f:	c7 44 24 18 a1 24 00 	movl   $0x24a1,0x18(%esp)
    2696:	00 
    2697:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    269e:	00 
    269f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    26a2:	89 44 24 04          	mov    %eax,0x4(%esp)
    26a6:	8b 45 b8             	mov    -0x48(%ebp),%eax
    26a9:	89 44 24 08          	mov    %eax,0x8(%esp)
    26ad:	8b 45 bc             	mov    -0x44(%ebp),%eax
    26b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    26b4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    26b7:	89 44 24 10          	mov    %eax,0x10(%esp)
    26bb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    26be:	89 04 24             	mov    %eax,(%esp)
    26c1:	e8 c2 fa ff ff       	call   2188 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    26c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26c9:	89 44 24 08          	mov    %eax,0x8(%esp)
    26cd:	c7 44 24 04 e3 95 00 	movl   $0x95e3,0x4(%esp)
    26d4:	00 
    26d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26dc:	e8 c1 04 00 00       	call   2ba2 <printf>
	printClickableList(cm.left_click);
    26e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26e4:	89 04 24             	mov    %eax,(%esp)
    26e7:	e8 63 fd ff ff       	call   244f <printClickableList>
	executeHandler(cm.left_click, p1);
    26ec:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    26ef:	8b 45 9c             	mov    -0x64(%ebp),%eax
    26f2:	8b 55 a0             	mov    -0x60(%ebp),%edx
    26f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    26f9:	89 54 24 08          	mov    %edx,0x8(%esp)
    26fd:	89 0c 24             	mov    %ecx,(%esp)
    2700:	e8 7a fc ff ff       	call   237f <executeHandler>
	executeHandler(cm.left_click, p2);
    2705:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    2708:	8b 45 94             	mov    -0x6c(%ebp),%eax
    270b:	8b 55 98             	mov    -0x68(%ebp),%edx
    270e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2712:	89 54 24 08          	mov    %edx,0x8(%esp)
    2716:	89 0c 24             	mov    %ecx,(%esp)
    2719:	e8 61 fc ff ff       	call   237f <executeHandler>
	deleteClickable(&cm.left_click, r4);
    271e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2721:	89 44 24 04          	mov    %eax,0x4(%esp)
    2725:	8b 45 a8             	mov    -0x58(%ebp),%eax
    2728:	89 44 24 08          	mov    %eax,0x8(%esp)
    272c:	8b 45 ac             	mov    -0x54(%ebp),%eax
    272f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2733:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2736:	89 44 24 10          	mov    %eax,0x10(%esp)
    273a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    273d:	89 04 24             	mov    %eax,(%esp)
    2740:	e8 5a fb ff ff       	call   229f <deleteClickable>
	printClickableList(cm.left_click);
    2745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2748:	89 04 24             	mov    %eax,(%esp)
    274b:	e8 ff fc ff ff       	call   244f <printClickableList>
}
    2750:	c9                   	leave  
    2751:	c3                   	ret    

00002752 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    2752:	55                   	push   %ebp
    2753:	89 e5                	mov    %esp,%ebp
    2755:	57                   	push   %edi
    2756:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    2757:	8b 4d 08             	mov    0x8(%ebp),%ecx
    275a:	8b 55 10             	mov    0x10(%ebp),%edx
    275d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2760:	89 cb                	mov    %ecx,%ebx
    2762:	89 df                	mov    %ebx,%edi
    2764:	89 d1                	mov    %edx,%ecx
    2766:	fc                   	cld    
    2767:	f3 aa                	rep stos %al,%es:(%edi)
    2769:	89 ca                	mov    %ecx,%edx
    276b:	89 fb                	mov    %edi,%ebx
    276d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    2770:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    2773:	5b                   	pop    %ebx
    2774:	5f                   	pop    %edi
    2775:	5d                   	pop    %ebp
    2776:	c3                   	ret    

00002777 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    2777:	55                   	push   %ebp
    2778:	89 e5                	mov    %esp,%ebp
    277a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    277d:	8b 45 08             	mov    0x8(%ebp),%eax
    2780:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    2783:	90                   	nop
    2784:	8b 45 08             	mov    0x8(%ebp),%eax
    2787:	8d 50 01             	lea    0x1(%eax),%edx
    278a:	89 55 08             	mov    %edx,0x8(%ebp)
    278d:	8b 55 0c             	mov    0xc(%ebp),%edx
    2790:	8d 4a 01             	lea    0x1(%edx),%ecx
    2793:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    2796:	0f b6 12             	movzbl (%edx),%edx
    2799:	88 10                	mov    %dl,(%eax)
    279b:	0f b6 00             	movzbl (%eax),%eax
    279e:	84 c0                	test   %al,%al
    27a0:	75 e2                	jne    2784 <strcpy+0xd>
    ;
  return os;
    27a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    27a5:	c9                   	leave  
    27a6:	c3                   	ret    

000027a7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    27a7:	55                   	push   %ebp
    27a8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    27aa:	eb 08                	jmp    27b4 <strcmp+0xd>
    p++, q++;
    27ac:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    27b0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    27b4:	8b 45 08             	mov    0x8(%ebp),%eax
    27b7:	0f b6 00             	movzbl (%eax),%eax
    27ba:	84 c0                	test   %al,%al
    27bc:	74 10                	je     27ce <strcmp+0x27>
    27be:	8b 45 08             	mov    0x8(%ebp),%eax
    27c1:	0f b6 10             	movzbl (%eax),%edx
    27c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    27c7:	0f b6 00             	movzbl (%eax),%eax
    27ca:	38 c2                	cmp    %al,%dl
    27cc:	74 de                	je     27ac <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    27ce:	8b 45 08             	mov    0x8(%ebp),%eax
    27d1:	0f b6 00             	movzbl (%eax),%eax
    27d4:	0f b6 d0             	movzbl %al,%edx
    27d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    27da:	0f b6 00             	movzbl (%eax),%eax
    27dd:	0f b6 c0             	movzbl %al,%eax
    27e0:	29 c2                	sub    %eax,%edx
    27e2:	89 d0                	mov    %edx,%eax
}
    27e4:	5d                   	pop    %ebp
    27e5:	c3                   	ret    

000027e6 <strlen>:

uint
strlen(char *s)
{
    27e6:	55                   	push   %ebp
    27e7:	89 e5                	mov    %esp,%ebp
    27e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    27ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    27f3:	eb 04                	jmp    27f9 <strlen+0x13>
    27f5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    27f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    27fc:	8b 45 08             	mov    0x8(%ebp),%eax
    27ff:	01 d0                	add    %edx,%eax
    2801:	0f b6 00             	movzbl (%eax),%eax
    2804:	84 c0                	test   %al,%al
    2806:	75 ed                	jne    27f5 <strlen+0xf>
    ;
  return n;
    2808:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    280b:	c9                   	leave  
    280c:	c3                   	ret    

0000280d <memset>:

void*
memset(void *dst, int c, uint n)
{
    280d:	55                   	push   %ebp
    280e:	89 e5                	mov    %esp,%ebp
    2810:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    2813:	8b 45 10             	mov    0x10(%ebp),%eax
    2816:	89 44 24 08          	mov    %eax,0x8(%esp)
    281a:	8b 45 0c             	mov    0xc(%ebp),%eax
    281d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2821:	8b 45 08             	mov    0x8(%ebp),%eax
    2824:	89 04 24             	mov    %eax,(%esp)
    2827:	e8 26 ff ff ff       	call   2752 <stosb>
  return dst;
    282c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    282f:	c9                   	leave  
    2830:	c3                   	ret    

00002831 <strchr>:

char*
strchr(const char *s, char c)
{
    2831:	55                   	push   %ebp
    2832:	89 e5                	mov    %esp,%ebp
    2834:	83 ec 04             	sub    $0x4,%esp
    2837:	8b 45 0c             	mov    0xc(%ebp),%eax
    283a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    283d:	eb 14                	jmp    2853 <strchr+0x22>
    if(*s == c)
    283f:	8b 45 08             	mov    0x8(%ebp),%eax
    2842:	0f b6 00             	movzbl (%eax),%eax
    2845:	3a 45 fc             	cmp    -0x4(%ebp),%al
    2848:	75 05                	jne    284f <strchr+0x1e>
      return (char*)s;
    284a:	8b 45 08             	mov    0x8(%ebp),%eax
    284d:	eb 13                	jmp    2862 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    284f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    2853:	8b 45 08             	mov    0x8(%ebp),%eax
    2856:	0f b6 00             	movzbl (%eax),%eax
    2859:	84 c0                	test   %al,%al
    285b:	75 e2                	jne    283f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    285d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2862:	c9                   	leave  
    2863:	c3                   	ret    

00002864 <gets>:

char*
gets(char *buf, int max)
{
    2864:	55                   	push   %ebp
    2865:	89 e5                	mov    %esp,%ebp
    2867:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    286a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2871:	eb 4c                	jmp    28bf <gets+0x5b>
    cc = read(0, &c, 1);
    2873:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    287a:	00 
    287b:	8d 45 ef             	lea    -0x11(%ebp),%eax
    287e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2882:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2889:	e8 44 01 00 00       	call   29d2 <read>
    288e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    2891:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2895:	7f 02                	jg     2899 <gets+0x35>
      break;
    2897:	eb 31                	jmp    28ca <gets+0x66>
    buf[i++] = c;
    2899:	8b 45 f4             	mov    -0xc(%ebp),%eax
    289c:	8d 50 01             	lea    0x1(%eax),%edx
    289f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    28a2:	89 c2                	mov    %eax,%edx
    28a4:	8b 45 08             	mov    0x8(%ebp),%eax
    28a7:	01 c2                	add    %eax,%edx
    28a9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    28ad:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    28af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    28b3:	3c 0a                	cmp    $0xa,%al
    28b5:	74 13                	je     28ca <gets+0x66>
    28b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    28bb:	3c 0d                	cmp    $0xd,%al
    28bd:	74 0b                	je     28ca <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    28bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28c2:	83 c0 01             	add    $0x1,%eax
    28c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
    28c8:	7c a9                	jl     2873 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    28ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
    28cd:	8b 45 08             	mov    0x8(%ebp),%eax
    28d0:	01 d0                	add    %edx,%eax
    28d2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    28d5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    28d8:	c9                   	leave  
    28d9:	c3                   	ret    

000028da <stat>:

int
stat(char *n, struct stat *st)
{
    28da:	55                   	push   %ebp
    28db:	89 e5                	mov    %esp,%ebp
    28dd:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    28e0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    28e7:	00 
    28e8:	8b 45 08             	mov    0x8(%ebp),%eax
    28eb:	89 04 24             	mov    %eax,(%esp)
    28ee:	e8 07 01 00 00       	call   29fa <open>
    28f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    28f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    28fa:	79 07                	jns    2903 <stat+0x29>
    return -1;
    28fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2901:	eb 23                	jmp    2926 <stat+0x4c>
  r = fstat(fd, st);
    2903:	8b 45 0c             	mov    0xc(%ebp),%eax
    2906:	89 44 24 04          	mov    %eax,0x4(%esp)
    290a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    290d:	89 04 24             	mov    %eax,(%esp)
    2910:	e8 fd 00 00 00       	call   2a12 <fstat>
    2915:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    2918:	8b 45 f4             	mov    -0xc(%ebp),%eax
    291b:	89 04 24             	mov    %eax,(%esp)
    291e:	e8 bf 00 00 00       	call   29e2 <close>
  return r;
    2923:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    2926:	c9                   	leave  
    2927:	c3                   	ret    

00002928 <atoi>:

int
atoi(const char *s)
{
    2928:	55                   	push   %ebp
    2929:	89 e5                	mov    %esp,%ebp
    292b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    292e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    2935:	eb 25                	jmp    295c <atoi+0x34>
    n = n*10 + *s++ - '0';
    2937:	8b 55 fc             	mov    -0x4(%ebp),%edx
    293a:	89 d0                	mov    %edx,%eax
    293c:	c1 e0 02             	shl    $0x2,%eax
    293f:	01 d0                	add    %edx,%eax
    2941:	01 c0                	add    %eax,%eax
    2943:	89 c1                	mov    %eax,%ecx
    2945:	8b 45 08             	mov    0x8(%ebp),%eax
    2948:	8d 50 01             	lea    0x1(%eax),%edx
    294b:	89 55 08             	mov    %edx,0x8(%ebp)
    294e:	0f b6 00             	movzbl (%eax),%eax
    2951:	0f be c0             	movsbl %al,%eax
    2954:	01 c8                	add    %ecx,%eax
    2956:	83 e8 30             	sub    $0x30,%eax
    2959:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    295c:	8b 45 08             	mov    0x8(%ebp),%eax
    295f:	0f b6 00             	movzbl (%eax),%eax
    2962:	3c 2f                	cmp    $0x2f,%al
    2964:	7e 0a                	jle    2970 <atoi+0x48>
    2966:	8b 45 08             	mov    0x8(%ebp),%eax
    2969:	0f b6 00             	movzbl (%eax),%eax
    296c:	3c 39                	cmp    $0x39,%al
    296e:	7e c7                	jle    2937 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    2970:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    2973:	c9                   	leave  
    2974:	c3                   	ret    

00002975 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    2975:	55                   	push   %ebp
    2976:	89 e5                	mov    %esp,%ebp
    2978:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    297b:	8b 45 08             	mov    0x8(%ebp),%eax
    297e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    2981:	8b 45 0c             	mov    0xc(%ebp),%eax
    2984:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    2987:	eb 17                	jmp    29a0 <memmove+0x2b>
    *dst++ = *src++;
    2989:	8b 45 fc             	mov    -0x4(%ebp),%eax
    298c:	8d 50 01             	lea    0x1(%eax),%edx
    298f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    2992:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2995:	8d 4a 01             	lea    0x1(%edx),%ecx
    2998:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    299b:	0f b6 12             	movzbl (%edx),%edx
    299e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    29a0:	8b 45 10             	mov    0x10(%ebp),%eax
    29a3:	8d 50 ff             	lea    -0x1(%eax),%edx
    29a6:	89 55 10             	mov    %edx,0x10(%ebp)
    29a9:	85 c0                	test   %eax,%eax
    29ab:	7f dc                	jg     2989 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    29ad:	8b 45 08             	mov    0x8(%ebp),%eax
}
    29b0:	c9                   	leave  
    29b1:	c3                   	ret    

000029b2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    29b2:	b8 01 00 00 00       	mov    $0x1,%eax
    29b7:	cd 40                	int    $0x40
    29b9:	c3                   	ret    

000029ba <exit>:
SYSCALL(exit)
    29ba:	b8 02 00 00 00       	mov    $0x2,%eax
    29bf:	cd 40                	int    $0x40
    29c1:	c3                   	ret    

000029c2 <wait>:
SYSCALL(wait)
    29c2:	b8 03 00 00 00       	mov    $0x3,%eax
    29c7:	cd 40                	int    $0x40
    29c9:	c3                   	ret    

000029ca <pipe>:
SYSCALL(pipe)
    29ca:	b8 04 00 00 00       	mov    $0x4,%eax
    29cf:	cd 40                	int    $0x40
    29d1:	c3                   	ret    

000029d2 <read>:
SYSCALL(read)
    29d2:	b8 05 00 00 00       	mov    $0x5,%eax
    29d7:	cd 40                	int    $0x40
    29d9:	c3                   	ret    

000029da <write>:
SYSCALL(write)
    29da:	b8 10 00 00 00       	mov    $0x10,%eax
    29df:	cd 40                	int    $0x40
    29e1:	c3                   	ret    

000029e2 <close>:
SYSCALL(close)
    29e2:	b8 15 00 00 00       	mov    $0x15,%eax
    29e7:	cd 40                	int    $0x40
    29e9:	c3                   	ret    

000029ea <kill>:
SYSCALL(kill)
    29ea:	b8 06 00 00 00       	mov    $0x6,%eax
    29ef:	cd 40                	int    $0x40
    29f1:	c3                   	ret    

000029f2 <exec>:
SYSCALL(exec)
    29f2:	b8 07 00 00 00       	mov    $0x7,%eax
    29f7:	cd 40                	int    $0x40
    29f9:	c3                   	ret    

000029fa <open>:
SYSCALL(open)
    29fa:	b8 0f 00 00 00       	mov    $0xf,%eax
    29ff:	cd 40                	int    $0x40
    2a01:	c3                   	ret    

00002a02 <mknod>:
SYSCALL(mknod)
    2a02:	b8 11 00 00 00       	mov    $0x11,%eax
    2a07:	cd 40                	int    $0x40
    2a09:	c3                   	ret    

00002a0a <unlink>:
SYSCALL(unlink)
    2a0a:	b8 12 00 00 00       	mov    $0x12,%eax
    2a0f:	cd 40                	int    $0x40
    2a11:	c3                   	ret    

00002a12 <fstat>:
SYSCALL(fstat)
    2a12:	b8 08 00 00 00       	mov    $0x8,%eax
    2a17:	cd 40                	int    $0x40
    2a19:	c3                   	ret    

00002a1a <link>:
SYSCALL(link)
    2a1a:	b8 13 00 00 00       	mov    $0x13,%eax
    2a1f:	cd 40                	int    $0x40
    2a21:	c3                   	ret    

00002a22 <mkdir>:
SYSCALL(mkdir)
    2a22:	b8 14 00 00 00       	mov    $0x14,%eax
    2a27:	cd 40                	int    $0x40
    2a29:	c3                   	ret    

00002a2a <chdir>:
SYSCALL(chdir)
    2a2a:	b8 09 00 00 00       	mov    $0x9,%eax
    2a2f:	cd 40                	int    $0x40
    2a31:	c3                   	ret    

00002a32 <dup>:
SYSCALL(dup)
    2a32:	b8 0a 00 00 00       	mov    $0xa,%eax
    2a37:	cd 40                	int    $0x40
    2a39:	c3                   	ret    

00002a3a <getpid>:
SYSCALL(getpid)
    2a3a:	b8 0b 00 00 00       	mov    $0xb,%eax
    2a3f:	cd 40                	int    $0x40
    2a41:	c3                   	ret    

00002a42 <sbrk>:
SYSCALL(sbrk)
    2a42:	b8 0c 00 00 00       	mov    $0xc,%eax
    2a47:	cd 40                	int    $0x40
    2a49:	c3                   	ret    

00002a4a <sleep>:
SYSCALL(sleep)
    2a4a:	b8 0d 00 00 00       	mov    $0xd,%eax
    2a4f:	cd 40                	int    $0x40
    2a51:	c3                   	ret    

00002a52 <uptime>:
SYSCALL(uptime)
    2a52:	b8 0e 00 00 00       	mov    $0xe,%eax
    2a57:	cd 40                	int    $0x40
    2a59:	c3                   	ret    

00002a5a <getMsg>:
SYSCALL(getMsg)
    2a5a:	b8 16 00 00 00       	mov    $0x16,%eax
    2a5f:	cd 40                	int    $0x40
    2a61:	c3                   	ret    

00002a62 <createWindow>:
SYSCALL(createWindow)
    2a62:	b8 17 00 00 00       	mov    $0x17,%eax
    2a67:	cd 40                	int    $0x40
    2a69:	c3                   	ret    

00002a6a <destroyWindow>:
SYSCALL(destroyWindow)
    2a6a:	b8 18 00 00 00       	mov    $0x18,%eax
    2a6f:	cd 40                	int    $0x40
    2a71:	c3                   	ret    

00002a72 <updateWindow>:
SYSCALL(updateWindow)
    2a72:	b8 19 00 00 00       	mov    $0x19,%eax
    2a77:	cd 40                	int    $0x40
    2a79:	c3                   	ret    

00002a7a <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    2a7a:	b8 1a 00 00 00       	mov    $0x1a,%eax
    2a7f:	cd 40                	int    $0x40
    2a81:	c3                   	ret    

00002a82 <kwrite>:
SYSCALL(kwrite)
    2a82:	b8 1c 00 00 00       	mov    $0x1c,%eax
    2a87:	cd 40                	int    $0x40
    2a89:	c3                   	ret    

00002a8a <setSampleRate>:
SYSCALL(setSampleRate)
    2a8a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    2a8f:	cd 40                	int    $0x40
    2a91:	c3                   	ret    

00002a92 <pause>:
SYSCALL(pause)
    2a92:	b8 1d 00 00 00       	mov    $0x1d,%eax
    2a97:	cd 40                	int    $0x40
    2a99:	c3                   	ret    

00002a9a <wavdecode>:
SYSCALL(wavdecode)
    2a9a:	b8 1e 00 00 00       	mov    $0x1e,%eax
    2a9f:	cd 40                	int    $0x40
    2aa1:	c3                   	ret    

00002aa2 <beginDecode>:
SYSCALL(beginDecode)
    2aa2:	b8 1f 00 00 00       	mov    $0x1f,%eax
    2aa7:	cd 40                	int    $0x40
    2aa9:	c3                   	ret    

00002aaa <waitForDecode>:
SYSCALL(waitForDecode)
    2aaa:	b8 20 00 00 00       	mov    $0x20,%eax
    2aaf:	cd 40                	int    $0x40
    2ab1:	c3                   	ret    

00002ab2 <endDecode>:
SYSCALL(endDecode)
    2ab2:	b8 21 00 00 00       	mov    $0x21,%eax
    2ab7:	cd 40                	int    $0x40
    2ab9:	c3                   	ret    

00002aba <getCoreBuf>:
    2aba:	b8 22 00 00 00       	mov    $0x22,%eax
    2abf:	cd 40                	int    $0x40
    2ac1:	c3                   	ret    

00002ac2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    2ac2:	55                   	push   %ebp
    2ac3:	89 e5                	mov    %esp,%ebp
    2ac5:	83 ec 18             	sub    $0x18,%esp
    2ac8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2acb:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    2ace:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2ad5:	00 
    2ad6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    2ad9:	89 44 24 04          	mov    %eax,0x4(%esp)
    2add:	8b 45 08             	mov    0x8(%ebp),%eax
    2ae0:	89 04 24             	mov    %eax,(%esp)
    2ae3:	e8 f2 fe ff ff       	call   29da <write>
}
    2ae8:	c9                   	leave  
    2ae9:	c3                   	ret    

00002aea <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    2aea:	55                   	push   %ebp
    2aeb:	89 e5                	mov    %esp,%ebp
    2aed:	56                   	push   %esi
    2aee:	53                   	push   %ebx
    2aef:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    2af2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    2af9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    2afd:	74 17                	je     2b16 <printint+0x2c>
    2aff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    2b03:	79 11                	jns    2b16 <printint+0x2c>
    neg = 1;
    2b05:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    2b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b0f:	f7 d8                	neg    %eax
    2b11:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b14:	eb 06                	jmp    2b1c <printint+0x32>
  } else {
    x = xx;
    2b16:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b19:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    2b1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    2b23:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2b26:	8d 41 01             	lea    0x1(%ecx),%eax
    2b29:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2b2c:	8b 5d 10             	mov    0x10(%ebp),%ebx
    2b2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b32:	ba 00 00 00 00       	mov    $0x0,%edx
    2b37:	f7 f3                	div    %ebx
    2b39:	89 d0                	mov    %edx,%eax
    2b3b:	0f b6 80 7c cc 00 00 	movzbl 0xcc7c(%eax),%eax
    2b42:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    2b46:	8b 75 10             	mov    0x10(%ebp),%esi
    2b49:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b4c:	ba 00 00 00 00       	mov    $0x0,%edx
    2b51:	f7 f6                	div    %esi
    2b53:	89 45 ec             	mov    %eax,-0x14(%ebp)
    2b56:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2b5a:	75 c7                	jne    2b23 <printint+0x39>
  if(neg)
    2b5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2b60:	74 10                	je     2b72 <printint+0x88>
    buf[i++] = '-';
    2b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b65:	8d 50 01             	lea    0x1(%eax),%edx
    2b68:	89 55 f4             	mov    %edx,-0xc(%ebp)
    2b6b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    2b70:	eb 1f                	jmp    2b91 <printint+0xa7>
    2b72:	eb 1d                	jmp    2b91 <printint+0xa7>
    putc(fd, buf[i]);
    2b74:	8d 55 dc             	lea    -0x24(%ebp),%edx
    2b77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b7a:	01 d0                	add    %edx,%eax
    2b7c:	0f b6 00             	movzbl (%eax),%eax
    2b7f:	0f be c0             	movsbl %al,%eax
    2b82:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b86:	8b 45 08             	mov    0x8(%ebp),%eax
    2b89:	89 04 24             	mov    %eax,(%esp)
    2b8c:	e8 31 ff ff ff       	call   2ac2 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    2b91:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2b95:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b99:	79 d9                	jns    2b74 <printint+0x8a>
    putc(fd, buf[i]);
}
    2b9b:	83 c4 30             	add    $0x30,%esp
    2b9e:	5b                   	pop    %ebx
    2b9f:	5e                   	pop    %esi
    2ba0:	5d                   	pop    %ebp
    2ba1:	c3                   	ret    

00002ba2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    2ba2:	55                   	push   %ebp
    2ba3:	89 e5                	mov    %esp,%ebp
    2ba5:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    2ba8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    2baf:	8d 45 0c             	lea    0xc(%ebp),%eax
    2bb2:	83 c0 04             	add    $0x4,%eax
    2bb5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    2bb8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2bbf:	e9 7c 01 00 00       	jmp    2d40 <printf+0x19e>
    c = fmt[i] & 0xff;
    2bc4:	8b 55 0c             	mov    0xc(%ebp),%edx
    2bc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2bca:	01 d0                	add    %edx,%eax
    2bcc:	0f b6 00             	movzbl (%eax),%eax
    2bcf:	0f be c0             	movsbl %al,%eax
    2bd2:	25 ff 00 00 00       	and    $0xff,%eax
    2bd7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    2bda:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2bde:	75 2c                	jne    2c0c <printf+0x6a>
      if(c == '%'){
    2be0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2be4:	75 0c                	jne    2bf2 <printf+0x50>
        state = '%';
    2be6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    2bed:	e9 4a 01 00 00       	jmp    2d3c <printf+0x19a>
      } else {
        putc(fd, c);
    2bf2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bf5:	0f be c0             	movsbl %al,%eax
    2bf8:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bfc:	8b 45 08             	mov    0x8(%ebp),%eax
    2bff:	89 04 24             	mov    %eax,(%esp)
    2c02:	e8 bb fe ff ff       	call   2ac2 <putc>
    2c07:	e9 30 01 00 00       	jmp    2d3c <printf+0x19a>
      }
    } else if(state == '%'){
    2c0c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    2c10:	0f 85 26 01 00 00    	jne    2d3c <printf+0x19a>
      if(c == 'd'){
    2c16:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    2c1a:	75 2d                	jne    2c49 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    2c1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c1f:	8b 00                	mov    (%eax),%eax
    2c21:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2c28:	00 
    2c29:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    2c30:	00 
    2c31:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c35:	8b 45 08             	mov    0x8(%ebp),%eax
    2c38:	89 04 24             	mov    %eax,(%esp)
    2c3b:	e8 aa fe ff ff       	call   2aea <printint>
        ap++;
    2c40:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2c44:	e9 ec 00 00 00       	jmp    2d35 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    2c49:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    2c4d:	74 06                	je     2c55 <printf+0xb3>
    2c4f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    2c53:	75 2d                	jne    2c82 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    2c55:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c58:	8b 00                	mov    (%eax),%eax
    2c5a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2c61:	00 
    2c62:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    2c69:	00 
    2c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c6e:	8b 45 08             	mov    0x8(%ebp),%eax
    2c71:	89 04 24             	mov    %eax,(%esp)
    2c74:	e8 71 fe ff ff       	call   2aea <printint>
        ap++;
    2c79:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2c7d:	e9 b3 00 00 00       	jmp    2d35 <printf+0x193>
      } else if(c == 's'){
    2c82:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    2c86:	75 45                	jne    2ccd <printf+0x12b>
        s = (char*)*ap;
    2c88:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c8b:	8b 00                	mov    (%eax),%eax
    2c8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    2c90:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    2c94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2c98:	75 09                	jne    2ca3 <printf+0x101>
          s = "(null)";
    2c9a:	c7 45 f4 f3 95 00 00 	movl   $0x95f3,-0xc(%ebp)
        while(*s != 0){
    2ca1:	eb 1e                	jmp    2cc1 <printf+0x11f>
    2ca3:	eb 1c                	jmp    2cc1 <printf+0x11f>
          putc(fd, *s);
    2ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ca8:	0f b6 00             	movzbl (%eax),%eax
    2cab:	0f be c0             	movsbl %al,%eax
    2cae:	89 44 24 04          	mov    %eax,0x4(%esp)
    2cb2:	8b 45 08             	mov    0x8(%ebp),%eax
    2cb5:	89 04 24             	mov    %eax,(%esp)
    2cb8:	e8 05 fe ff ff       	call   2ac2 <putc>
          s++;
    2cbd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    2cc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2cc4:	0f b6 00             	movzbl (%eax),%eax
    2cc7:	84 c0                	test   %al,%al
    2cc9:	75 da                	jne    2ca5 <printf+0x103>
    2ccb:	eb 68                	jmp    2d35 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    2ccd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    2cd1:	75 1d                	jne    2cf0 <printf+0x14e>
        putc(fd, *ap);
    2cd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cd6:	8b 00                	mov    (%eax),%eax
    2cd8:	0f be c0             	movsbl %al,%eax
    2cdb:	89 44 24 04          	mov    %eax,0x4(%esp)
    2cdf:	8b 45 08             	mov    0x8(%ebp),%eax
    2ce2:	89 04 24             	mov    %eax,(%esp)
    2ce5:	e8 d8 fd ff ff       	call   2ac2 <putc>
        ap++;
    2cea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    2cee:	eb 45                	jmp    2d35 <printf+0x193>
      } else if(c == '%'){
    2cf0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    2cf4:	75 17                	jne    2d0d <printf+0x16b>
        putc(fd, c);
    2cf6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2cf9:	0f be c0             	movsbl %al,%eax
    2cfc:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d00:	8b 45 08             	mov    0x8(%ebp),%eax
    2d03:	89 04 24             	mov    %eax,(%esp)
    2d06:	e8 b7 fd ff ff       	call   2ac2 <putc>
    2d0b:	eb 28                	jmp    2d35 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    2d0d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    2d14:	00 
    2d15:	8b 45 08             	mov    0x8(%ebp),%eax
    2d18:	89 04 24             	mov    %eax,(%esp)
    2d1b:	e8 a2 fd ff ff       	call   2ac2 <putc>
        putc(fd, c);
    2d20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2d23:	0f be c0             	movsbl %al,%eax
    2d26:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d2a:	8b 45 08             	mov    0x8(%ebp),%eax
    2d2d:	89 04 24             	mov    %eax,(%esp)
    2d30:	e8 8d fd ff ff       	call   2ac2 <putc>
      }
      state = 0;
    2d35:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    2d3c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2d40:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d46:	01 d0                	add    %edx,%eax
    2d48:	0f b6 00             	movzbl (%eax),%eax
    2d4b:	84 c0                	test   %al,%al
    2d4d:	0f 85 71 fe ff ff    	jne    2bc4 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    2d53:	c9                   	leave  
    2d54:	c3                   	ret    

00002d55 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    2d55:	55                   	push   %ebp
    2d56:	89 e5                	mov    %esp,%ebp
    2d58:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    2d5b:	8b 45 08             	mov    0x8(%ebp),%eax
    2d5e:	83 e8 08             	sub    $0x8,%eax
    2d61:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2d64:	a1 88 d1 00 00       	mov    0xd188,%eax
    2d69:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2d6c:	eb 24                	jmp    2d92 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    2d6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d71:	8b 00                	mov    (%eax),%eax
    2d73:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    2d76:	77 12                	ja     2d8a <free+0x35>
    2d78:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d7b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    2d7e:	77 24                	ja     2da4 <free+0x4f>
    2d80:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d83:	8b 00                	mov    (%eax),%eax
    2d85:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2d88:	77 1a                	ja     2da4 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    2d8a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d8d:	8b 00                	mov    (%eax),%eax
    2d8f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    2d92:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2d95:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    2d98:	76 d4                	jbe    2d6e <free+0x19>
    2d9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2d9d:	8b 00                	mov    (%eax),%eax
    2d9f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2da2:	76 ca                	jbe    2d6e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    2da4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2da7:	8b 40 04             	mov    0x4(%eax),%eax
    2daa:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    2db1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2db4:	01 c2                	add    %eax,%edx
    2db6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2db9:	8b 00                	mov    (%eax),%eax
    2dbb:	39 c2                	cmp    %eax,%edx
    2dbd:	75 24                	jne    2de3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    2dbf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2dc2:	8b 50 04             	mov    0x4(%eax),%edx
    2dc5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2dc8:	8b 00                	mov    (%eax),%eax
    2dca:	8b 40 04             	mov    0x4(%eax),%eax
    2dcd:	01 c2                	add    %eax,%edx
    2dcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2dd2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    2dd5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2dd8:	8b 00                	mov    (%eax),%eax
    2dda:	8b 10                	mov    (%eax),%edx
    2ddc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ddf:	89 10                	mov    %edx,(%eax)
    2de1:	eb 0a                	jmp    2ded <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    2de3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2de6:	8b 10                	mov    (%eax),%edx
    2de8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2deb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    2ded:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2df0:	8b 40 04             	mov    0x4(%eax),%eax
    2df3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    2dfa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2dfd:	01 d0                	add    %edx,%eax
    2dff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2e02:	75 20                	jne    2e24 <free+0xcf>
    p->s.size += bp->s.size;
    2e04:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e07:	8b 50 04             	mov    0x4(%eax),%edx
    2e0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2e0d:	8b 40 04             	mov    0x4(%eax),%eax
    2e10:	01 c2                	add    %eax,%edx
    2e12:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e15:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    2e18:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2e1b:	8b 10                	mov    (%eax),%edx
    2e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e20:	89 10                	mov    %edx,(%eax)
    2e22:	eb 08                	jmp    2e2c <free+0xd7>
  } else
    p->s.ptr = bp;
    2e24:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e27:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2e2a:	89 10                	mov    %edx,(%eax)
  freep = p;
    2e2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2e2f:	a3 88 d1 00 00       	mov    %eax,0xd188
}
    2e34:	c9                   	leave  
    2e35:	c3                   	ret    

00002e36 <morecore>:

static Header*
morecore(uint nu)
{
    2e36:	55                   	push   %ebp
    2e37:	89 e5                	mov    %esp,%ebp
    2e39:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    2e3c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    2e43:	77 07                	ja     2e4c <morecore+0x16>
    nu = 4096;
    2e45:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    2e4c:	8b 45 08             	mov    0x8(%ebp),%eax
    2e4f:	c1 e0 03             	shl    $0x3,%eax
    2e52:	89 04 24             	mov    %eax,(%esp)
    2e55:	e8 e8 fb ff ff       	call   2a42 <sbrk>
    2e5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    2e5d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    2e61:	75 07                	jne    2e6a <morecore+0x34>
    return 0;
    2e63:	b8 00 00 00 00       	mov    $0x0,%eax
    2e68:	eb 22                	jmp    2e8c <morecore+0x56>
  hp = (Header*)p;
    2e6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    2e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e73:	8b 55 08             	mov    0x8(%ebp),%edx
    2e76:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    2e79:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e7c:	83 c0 08             	add    $0x8,%eax
    2e7f:	89 04 24             	mov    %eax,(%esp)
    2e82:	e8 ce fe ff ff       	call   2d55 <free>
  return freep;
    2e87:	a1 88 d1 00 00       	mov    0xd188,%eax
}
    2e8c:	c9                   	leave  
    2e8d:	c3                   	ret    

00002e8e <malloc>:

void*
malloc(uint nbytes)
{
    2e8e:	55                   	push   %ebp
    2e8f:	89 e5                	mov    %esp,%ebp
    2e91:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    2e94:	8b 45 08             	mov    0x8(%ebp),%eax
    2e97:	83 c0 07             	add    $0x7,%eax
    2e9a:	c1 e8 03             	shr    $0x3,%eax
    2e9d:	83 c0 01             	add    $0x1,%eax
    2ea0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    2ea3:	a1 88 d1 00 00       	mov    0xd188,%eax
    2ea8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2eab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2eaf:	75 23                	jne    2ed4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    2eb1:	c7 45 f0 80 d1 00 00 	movl   $0xd180,-0x10(%ebp)
    2eb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ebb:	a3 88 d1 00 00       	mov    %eax,0xd188
    2ec0:	a1 88 d1 00 00       	mov    0xd188,%eax
    2ec5:	a3 80 d1 00 00       	mov    %eax,0xd180
    base.s.size = 0;
    2eca:	c7 05 84 d1 00 00 00 	movl   $0x0,0xd184
    2ed1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2ed4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ed7:	8b 00                	mov    (%eax),%eax
    2ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    2edc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2edf:	8b 40 04             	mov    0x4(%eax),%eax
    2ee2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2ee5:	72 4d                	jb     2f34 <malloc+0xa6>
      if(p->s.size == nunits)
    2ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eea:	8b 40 04             	mov    0x4(%eax),%eax
    2eed:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2ef0:	75 0c                	jne    2efe <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    2ef2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef5:	8b 10                	mov    (%eax),%edx
    2ef7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2efa:	89 10                	mov    %edx,(%eax)
    2efc:	eb 26                	jmp    2f24 <malloc+0x96>
      else {
        p->s.size -= nunits;
    2efe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f01:	8b 40 04             	mov    0x4(%eax),%eax
    2f04:	2b 45 ec             	sub    -0x14(%ebp),%eax
    2f07:	89 c2                	mov    %eax,%edx
    2f09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f0c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    2f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f12:	8b 40 04             	mov    0x4(%eax),%eax
    2f15:	c1 e0 03             	shl    $0x3,%eax
    2f18:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    2f1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f1e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2f21:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    2f24:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f27:	a3 88 d1 00 00       	mov    %eax,0xd188
      return (void*)(p + 1);
    2f2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f2f:	83 c0 08             	add    $0x8,%eax
    2f32:	eb 38                	jmp    2f6c <malloc+0xde>
    }
    if(p == freep)
    2f34:	a1 88 d1 00 00       	mov    0xd188,%eax
    2f39:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2f3c:	75 1b                	jne    2f59 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    2f3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f41:	89 04 24             	mov    %eax,(%esp)
    2f44:	e8 ed fe ff ff       	call   2e36 <morecore>
    2f49:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2f4c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f50:	75 07                	jne    2f59 <malloc+0xcb>
        return 0;
    2f52:	b8 00 00 00 00       	mov    $0x0,%eax
    2f57:	eb 13                	jmp    2f6c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    2f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f62:	8b 00                	mov    (%eax),%eax
    2f64:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    2f67:	e9 70 ff ff ff       	jmp    2edc <malloc+0x4e>
}
    2f6c:	c9                   	leave  
    2f6d:	c3                   	ret    

00002f6e <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    2f6e:	55                   	push   %ebp
    2f6f:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    2f71:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    2f75:	79 07                	jns    2f7e <abs+0x10>
		return x * -1;
    2f77:	8b 45 08             	mov    0x8(%ebp),%eax
    2f7a:	f7 d8                	neg    %eax
    2f7c:	eb 03                	jmp    2f81 <abs+0x13>
	else
		return x;
    2f7e:	8b 45 08             	mov    0x8(%ebp),%eax
}
    2f81:	5d                   	pop    %ebp
    2f82:	c3                   	ret    

00002f83 <sin>:
double sin(double x)  
{  
    2f83:	55                   	push   %ebp
    2f84:	89 e5                	mov    %esp,%ebp
    2f86:	83 ec 3c             	sub    $0x3c,%esp
    2f89:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    2f8f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f92:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    2f95:	dd 45 c8             	fldl   -0x38(%ebp)
    2f98:	dd 5d f8             	fstpl  -0x8(%ebp)
    2f9b:	d9 e8                	fld1   
    2f9d:	dd 5d f0             	fstpl  -0x10(%ebp)
    2fa0:	dd 45 c8             	fldl   -0x38(%ebp)
    2fa3:	dd 5d e8             	fstpl  -0x18(%ebp)
    2fa6:	dd 45 c8             	fldl   -0x38(%ebp)
    2fa9:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    2fac:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    2fb3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    2fba:	eb 50                	jmp    300c <sin+0x89>
	{  
		n = n+1;  
    2fbc:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    2fc0:	db 45 dc             	fildl  -0x24(%ebp)
    2fc3:	dc 4d f0             	fmull  -0x10(%ebp)
    2fc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2fc9:	83 c0 01             	add    $0x1,%eax
    2fcc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    2fcf:	db 45 c4             	fildl  -0x3c(%ebp)
    2fd2:	de c9                	fmulp  %st,%st(1)
    2fd4:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    2fd7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    2fdb:	dd 45 c8             	fldl   -0x38(%ebp)
    2fde:	dc 4d c8             	fmull  -0x38(%ebp)
    2fe1:	dd 45 e8             	fldl   -0x18(%ebp)
    2fe4:	de c9                	fmulp  %st,%st(1)
    2fe6:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    2fe9:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    2fec:	dd 45 e8             	fldl   -0x18(%ebp)
    2fef:	dc 75 f0             	fdivl  -0x10(%ebp)
    2ff2:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    2ff5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    2ff9:	7e 08                	jle    3003 <sin+0x80>
    2ffb:	dd 45 f8             	fldl   -0x8(%ebp)
    2ffe:	dc 45 e0             	faddl  -0x20(%ebp)
    3001:	eb 06                	jmp    3009 <sin+0x86>
    3003:	dd 45 f8             	fldl   -0x8(%ebp)
    3006:	dc 65 e0             	fsubl  -0x20(%ebp)
    3009:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    300c:	dd 45 e0             	fldl   -0x20(%ebp)
    300f:	dd 05 00 96 00 00    	fldl   0x9600
    3015:	d9 c9                	fxch   %st(1)
    3017:	df e9                	fucomip %st(1),%st
    3019:	dd d8                	fstp   %st(0)
    301b:	77 9f                	ja     2fbc <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    301d:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    3020:	c9                   	leave  
    3021:	c3                   	ret    

00003022 <cos>:
double cos(double x)  
{  
    3022:	55                   	push   %ebp
    3023:	89 e5                	mov    %esp,%ebp
    3025:	83 ec 10             	sub    $0x10,%esp
    3028:	8b 45 08             	mov    0x8(%ebp),%eax
    302b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    302e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3031:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    3034:	dd 05 08 96 00 00    	fldl   0x9608
    303a:	dc 65 f8             	fsubl  -0x8(%ebp)
    303d:	dd 1c 24             	fstpl  (%esp)
    3040:	e8 3e ff ff ff       	call   2f83 <sin>
}  
    3045:	c9                   	leave  
    3046:	c3                   	ret    

00003047 <tan>:
double tan(double x)  
{  
    3047:	55                   	push   %ebp
    3048:	89 e5                	mov    %esp,%ebp
    304a:	83 ec 18             	sub    $0x18,%esp
    304d:	8b 45 08             	mov    0x8(%ebp),%eax
    3050:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3053:	8b 45 0c             	mov    0xc(%ebp),%eax
    3056:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    3059:	dd 45 f8             	fldl   -0x8(%ebp)
    305c:	dd 1c 24             	fstpl  (%esp)
    305f:	e8 1f ff ff ff       	call   2f83 <sin>
    3064:	dd 5d f0             	fstpl  -0x10(%ebp)
    3067:	dd 45 f8             	fldl   -0x8(%ebp)
    306a:	dd 1c 24             	fstpl  (%esp)
    306d:	e8 b0 ff ff ff       	call   3022 <cos>
    3072:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    3075:	c9                   	leave  
    3076:	c3                   	ret    

00003077 <pow>:

double pow(double x, double y)
{
    3077:	55                   	push   %ebp
    3078:	89 e5                	mov    %esp,%ebp
    307a:	83 ec 48             	sub    $0x48,%esp
    307d:	8b 45 08             	mov    0x8(%ebp),%eax
    3080:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3083:	8b 45 0c             	mov    0xc(%ebp),%eax
    3086:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3089:	8b 45 10             	mov    0x10(%ebp),%eax
    308c:	89 45 d8             	mov    %eax,-0x28(%ebp)
    308f:	8b 45 14             	mov    0x14(%ebp),%eax
    3092:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    3095:	dd 45 e0             	fldl   -0x20(%ebp)
    3098:	d9 ee                	fldz   
    309a:	df e9                	fucomip %st(1),%st
    309c:	dd d8                	fstp   %st(0)
    309e:	7a 28                	jp     30c8 <pow+0x51>
    30a0:	dd 45 e0             	fldl   -0x20(%ebp)
    30a3:	d9 ee                	fldz   
    30a5:	df e9                	fucomip %st(1),%st
    30a7:	dd d8                	fstp   %st(0)
    30a9:	75 1d                	jne    30c8 <pow+0x51>
    30ab:	dd 45 d8             	fldl   -0x28(%ebp)
    30ae:	d9 ee                	fldz   
    30b0:	df e9                	fucomip %st(1),%st
    30b2:	dd d8                	fstp   %st(0)
    30b4:	7a 0b                	jp     30c1 <pow+0x4a>
    30b6:	dd 45 d8             	fldl   -0x28(%ebp)
    30b9:	d9 ee                	fldz   
    30bb:	df e9                	fucomip %st(1),%st
    30bd:	dd d8                	fstp   %st(0)
    30bf:	74 07                	je     30c8 <pow+0x51>
    30c1:	d9 ee                	fldz   
    30c3:	e9 30 01 00 00       	jmp    31f8 <pow+0x181>
	else if(x==0 && y==0) return 1;
    30c8:	dd 45 e0             	fldl   -0x20(%ebp)
    30cb:	d9 ee                	fldz   
    30cd:	df e9                	fucomip %st(1),%st
    30cf:	dd d8                	fstp   %st(0)
    30d1:	7a 28                	jp     30fb <pow+0x84>
    30d3:	dd 45 e0             	fldl   -0x20(%ebp)
    30d6:	d9 ee                	fldz   
    30d8:	df e9                	fucomip %st(1),%st
    30da:	dd d8                	fstp   %st(0)
    30dc:	75 1d                	jne    30fb <pow+0x84>
    30de:	dd 45 d8             	fldl   -0x28(%ebp)
    30e1:	d9 ee                	fldz   
    30e3:	df e9                	fucomip %st(1),%st
    30e5:	dd d8                	fstp   %st(0)
    30e7:	7a 12                	jp     30fb <pow+0x84>
    30e9:	dd 45 d8             	fldl   -0x28(%ebp)
    30ec:	d9 ee                	fldz   
    30ee:	df e9                	fucomip %st(1),%st
    30f0:	dd d8                	fstp   %st(0)
    30f2:	75 07                	jne    30fb <pow+0x84>
    30f4:	d9 e8                	fld1   
    30f6:	e9 fd 00 00 00       	jmp    31f8 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    30fb:	d9 ee                	fldz   
    30fd:	dd 45 d8             	fldl   -0x28(%ebp)
    3100:	d9 c9                	fxch   %st(1)
    3102:	df e9                	fucomip %st(1),%st
    3104:	dd d8                	fstp   %st(0)
    3106:	76 1d                	jbe    3125 <pow+0xae>
    3108:	dd 45 d8             	fldl   -0x28(%ebp)
    310b:	d9 e0                	fchs   
    310d:	dd 5c 24 08          	fstpl  0x8(%esp)
    3111:	dd 45 e0             	fldl   -0x20(%ebp)
    3114:	dd 1c 24             	fstpl  (%esp)
    3117:	e8 5b ff ff ff       	call   3077 <pow>
    311c:	d9 e8                	fld1   
    311e:	de f1                	fdivp  %st,%st(1)
    3120:	e9 d3 00 00 00       	jmp    31f8 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    3125:	d9 ee                	fldz   
    3127:	dd 45 e0             	fldl   -0x20(%ebp)
    312a:	d9 c9                	fxch   %st(1)
    312c:	df e9                	fucomip %st(1),%st
    312e:	dd d8                	fstp   %st(0)
    3130:	76 40                	jbe    3172 <pow+0xfb>
    3132:	dd 45 d8             	fldl   -0x28(%ebp)
    3135:	d9 7d d6             	fnstcw -0x2a(%ebp)
    3138:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    313c:	b4 0c                	mov    $0xc,%ah
    313e:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    3142:	d9 6d d4             	fldcw  -0x2c(%ebp)
    3145:	db 5d d0             	fistpl -0x30(%ebp)
    3148:	d9 6d d6             	fldcw  -0x2a(%ebp)
    314b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    314e:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3151:	db 45 d0             	fildl  -0x30(%ebp)
    3154:	dd 45 d8             	fldl   -0x28(%ebp)
    3157:	de e1                	fsubp  %st,%st(1)
    3159:	d9 ee                	fldz   
    315b:	df e9                	fucomip %st(1),%st
    315d:	7a 0a                	jp     3169 <pow+0xf2>
    315f:	d9 ee                	fldz   
    3161:	df e9                	fucomip %st(1),%st
    3163:	dd d8                	fstp   %st(0)
    3165:	74 0b                	je     3172 <pow+0xfb>
    3167:	eb 02                	jmp    316b <pow+0xf4>
    3169:	dd d8                	fstp   %st(0)
    316b:	d9 ee                	fldz   
    316d:	e9 86 00 00 00       	jmp    31f8 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    3172:	d9 ee                	fldz   
    3174:	dd 45 e0             	fldl   -0x20(%ebp)
    3177:	d9 c9                	fxch   %st(1)
    3179:	df e9                	fucomip %st(1),%st
    317b:	dd d8                	fstp   %st(0)
    317d:	76 63                	jbe    31e2 <pow+0x16b>
    317f:	dd 45 d8             	fldl   -0x28(%ebp)
    3182:	d9 7d d6             	fnstcw -0x2a(%ebp)
    3185:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    3189:	b4 0c                	mov    $0xc,%ah
    318b:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    318f:	d9 6d d4             	fldcw  -0x2c(%ebp)
    3192:	db 5d d0             	fistpl -0x30(%ebp)
    3195:	d9 6d d6             	fldcw  -0x2a(%ebp)
    3198:	8b 45 d0             	mov    -0x30(%ebp),%eax
    319b:	89 45 d0             	mov    %eax,-0x30(%ebp)
    319e:	db 45 d0             	fildl  -0x30(%ebp)
    31a1:	dd 45 d8             	fldl   -0x28(%ebp)
    31a4:	de e1                	fsubp  %st,%st(1)
    31a6:	d9 ee                	fldz   
    31a8:	df e9                	fucomip %st(1),%st
    31aa:	7a 34                	jp     31e0 <pow+0x169>
    31ac:	d9 ee                	fldz   
    31ae:	df e9                	fucomip %st(1),%st
    31b0:	dd d8                	fstp   %st(0)
    31b2:	75 2e                	jne    31e2 <pow+0x16b>
	{
		double powint=1;
    31b4:	d9 e8                	fld1   
    31b6:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    31b9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    31c0:	eb 0d                	jmp    31cf <pow+0x158>
    31c2:	dd 45 f0             	fldl   -0x10(%ebp)
    31c5:	dc 4d e0             	fmull  -0x20(%ebp)
    31c8:	dd 5d f0             	fstpl  -0x10(%ebp)
    31cb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    31cf:	db 45 ec             	fildl  -0x14(%ebp)
    31d2:	dd 45 d8             	fldl   -0x28(%ebp)
    31d5:	df e9                	fucomip %st(1),%st
    31d7:	dd d8                	fstp   %st(0)
    31d9:	73 e7                	jae    31c2 <pow+0x14b>
		return powint;
    31db:	dd 45 f0             	fldl   -0x10(%ebp)
    31de:	eb 18                	jmp    31f8 <pow+0x181>
    31e0:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    31e2:	dd 45 e0             	fldl   -0x20(%ebp)
    31e5:	dd 1c 24             	fstpl  (%esp)
    31e8:	e8 36 00 00 00       	call   3223 <ln>
    31ed:	dc 4d d8             	fmull  -0x28(%ebp)
    31f0:	dd 1c 24             	fstpl  (%esp)
    31f3:	e8 0e 02 00 00       	call   3406 <exp>
}
    31f8:	c9                   	leave  
    31f9:	c3                   	ret    

000031fa <sqrt>:
// 求根
double sqrt(double x)
{
    31fa:	55                   	push   %ebp
    31fb:	89 e5                	mov    %esp,%ebp
    31fd:	83 ec 28             	sub    $0x28,%esp
    3200:	8b 45 08             	mov    0x8(%ebp),%eax
    3203:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3206:	8b 45 0c             	mov    0xc(%ebp),%eax
    3209:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    320c:	dd 05 10 96 00 00    	fldl   0x9610
    3212:	dd 5c 24 08          	fstpl  0x8(%esp)
    3216:	dd 45 f0             	fldl   -0x10(%ebp)
    3219:	dd 1c 24             	fstpl  (%esp)
    321c:	e8 56 fe ff ff       	call   3077 <pow>
}
    3221:	c9                   	leave  
    3222:	c3                   	ret    

00003223 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    3223:	55                   	push   %ebp
    3224:	89 e5                	mov    %esp,%ebp
    3226:	81 ec 88 00 00 00    	sub    $0x88,%esp
    322c:	8b 45 08             	mov    0x8(%ebp),%eax
    322f:	89 45 90             	mov    %eax,-0x70(%ebp)
    3232:	8b 45 0c             	mov    0xc(%ebp),%eax
    3235:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    3238:	dd 45 90             	fldl   -0x70(%ebp)
    323b:	d9 e8                	fld1   
    323d:	de e9                	fsubrp %st,%st(1)
    323f:	dd 5d c0             	fstpl  -0x40(%ebp)
    3242:	d9 ee                	fldz   
    3244:	dd 5d f0             	fstpl  -0x10(%ebp)
    3247:	d9 ee                	fldz   
    3249:	dd 5d b8             	fstpl  -0x48(%ebp)
    324c:	d9 ee                	fldz   
    324e:	dd 5d b0             	fstpl  -0x50(%ebp)
    3251:	d9 ee                	fldz   
    3253:	dd 5d e8             	fstpl  -0x18(%ebp)
    3256:	d9 e8                	fld1   
    3258:	dd 5d e0             	fstpl  -0x20(%ebp)
    325b:	d9 e8                	fld1   
    325d:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    3260:	dd 45 90             	fldl   -0x70(%ebp)
    3263:	d9 e8                	fld1   
    3265:	df e9                	fucomip %st(1),%st
    3267:	dd d8                	fstp   %st(0)
    3269:	7a 12                	jp     327d <ln+0x5a>
    326b:	dd 45 90             	fldl   -0x70(%ebp)
    326e:	d9 e8                	fld1   
    3270:	df e9                	fucomip %st(1),%st
    3272:	dd d8                	fstp   %st(0)
    3274:	75 07                	jne    327d <ln+0x5a>
    3276:	d9 ee                	fldz   
    3278:	e9 87 01 00 00       	jmp    3404 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    327d:	dd 45 90             	fldl   -0x70(%ebp)
    3280:	dd 05 18 96 00 00    	fldl   0x9618
    3286:	d9 c9                	fxch   %st(1)
    3288:	df e9                	fucomip %st(1),%st
    328a:	dd d8                	fstp   %st(0)
    328c:	76 14                	jbe    32a2 <ln+0x7f>
    328e:	d9 e8                	fld1   
    3290:	dc 75 90             	fdivl  -0x70(%ebp)
    3293:	dd 1c 24             	fstpl  (%esp)
    3296:	e8 88 ff ff ff       	call   3223 <ln>
    329b:	d9 e0                	fchs   
    329d:	e9 62 01 00 00       	jmp    3404 <ln+0x1e1>
	else if(x<.1)
    32a2:	dd 05 20 96 00 00    	fldl   0x9620
    32a8:	dd 45 90             	fldl   -0x70(%ebp)
    32ab:	d9 c9                	fxch   %st(1)
    32ad:	df e9                	fucomip %st(1),%st
    32af:	dd d8                	fstp   %st(0)
    32b1:	76 59                	jbe    330c <ln+0xe9>
	{
		double n=-1;
    32b3:	d9 e8                	fld1   
    32b5:	d9 e0                	fchs   
    32b7:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    32ba:	dd 45 c8             	fldl   -0x38(%ebp)
    32bd:	dd 05 28 96 00 00    	fldl   0x9628
    32c3:	de e9                	fsubrp %st,%st(1)
    32c5:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    32c8:	dd 45 c8             	fldl   -0x38(%ebp)
    32cb:	dd 1c 24             	fstpl  (%esp)
    32ce:	e8 33 01 00 00       	call   3406 <exp>
    32d3:	dd 45 90             	fldl   -0x70(%ebp)
    32d6:	de f1                	fdivp  %st,%st(1)
    32d8:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    32db:	dd 45 a0             	fldl   -0x60(%ebp)
    32de:	dd 05 18 96 00 00    	fldl   0x9618
    32e4:	d9 c9                	fxch   %st(1)
    32e6:	df e9                	fucomip %st(1),%st
    32e8:	dd d8                	fstp   %st(0)
    32ea:	77 ce                	ja     32ba <ln+0x97>
    32ec:	d9 e8                	fld1   
    32ee:	dd 45 a0             	fldl   -0x60(%ebp)
    32f1:	d9 c9                	fxch   %st(1)
    32f3:	df e9                	fucomip %st(1),%st
    32f5:	dd d8                	fstp   %st(0)
    32f7:	77 c1                	ja     32ba <ln+0x97>
		return ln(a)+n;
    32f9:	dd 45 a0             	fldl   -0x60(%ebp)
    32fc:	dd 1c 24             	fstpl  (%esp)
    32ff:	e8 1f ff ff ff       	call   3223 <ln>
    3304:	dc 45 c8             	faddl  -0x38(%ebp)
    3307:	e9 f8 00 00 00       	jmp    3404 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    330c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    3313:	d9 e8                	fld1   
    3315:	dd 5d d8             	fstpl  -0x28(%ebp)
    3318:	e9 b6 00 00 00       	jmp    33d3 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    331d:	dd 45 e8             	fldl   -0x18(%ebp)
    3320:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    3323:	dd 45 d8             	fldl   -0x28(%ebp)
    3326:	dc 4d c0             	fmull  -0x40(%ebp)
    3329:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    332c:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    3330:	75 0d                	jne    333f <ln+0x11c>
    3332:	db 45 d4             	fildl  -0x2c(%ebp)
    3335:	dd 45 d8             	fldl   -0x28(%ebp)
    3338:	de f1                	fdivp  %st,%st(1)
    333a:	dd 5d d8             	fstpl  -0x28(%ebp)
    333d:	eb 13                	jmp    3352 <ln+0x12f>
		else tmp=tmp/-l;
    333f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3342:	f7 d8                	neg    %eax
    3344:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3347:	db 45 8c             	fildl  -0x74(%ebp)
    334a:	dd 45 d8             	fldl   -0x28(%ebp)
    334d:	de f1                	fdivp  %st,%st(1)
    334f:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    3352:	dd 45 f0             	fldl   -0x10(%ebp)
    3355:	dc 45 d8             	faddl  -0x28(%ebp)
    3358:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    335b:	dd 45 d8             	fldl   -0x28(%ebp)
    335e:	d9 e0                	fchs   
    3360:	dc 4d c0             	fmull  -0x40(%ebp)
    3363:	db 45 d4             	fildl  -0x2c(%ebp)
    3366:	de c9                	fmulp  %st,%st(1)
    3368:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    336b:	83 c0 01             	add    $0x1,%eax
    336e:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3371:	db 45 8c             	fildl  -0x74(%ebp)
    3374:	de f9                	fdivrp %st,%st(1)
    3376:	dc 45 f0             	faddl  -0x10(%ebp)
    3379:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    337c:	dd 45 d8             	fldl   -0x28(%ebp)
    337f:	dc 4d c0             	fmull  -0x40(%ebp)
    3382:	dc 4d c0             	fmull  -0x40(%ebp)
    3385:	db 45 d4             	fildl  -0x2c(%ebp)
    3388:	de c9                	fmulp  %st,%st(1)
    338a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    338d:	83 c0 02             	add    $0x2,%eax
    3390:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3393:	db 45 8c             	fildl  -0x74(%ebp)
    3396:	de f9                	fdivrp %st,%st(1)
    3398:	dc 45 b8             	faddl  -0x48(%ebp)
    339b:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    339e:	dd 45 b0             	fldl   -0x50(%ebp)
    33a1:	dc 65 b8             	fsubl  -0x48(%ebp)
    33a4:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    33a7:	dd 45 a8             	fldl   -0x58(%ebp)
    33aa:	dc 4d a8             	fmull  -0x58(%ebp)
    33ad:	dd 45 b8             	fldl   -0x48(%ebp)
    33b0:	d8 c0                	fadd   %st(0),%st
    33b2:	dd 45 b0             	fldl   -0x50(%ebp)
    33b5:	de e1                	fsubp  %st,%st(1)
    33b7:	dc 45 f0             	faddl  -0x10(%ebp)
    33ba:	de f9                	fdivrp %st,%st(1)
    33bc:	dd 45 b0             	fldl   -0x50(%ebp)
    33bf:	de e1                	fsubp  %st,%st(1)
    33c1:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    33c4:	db 45 d4             	fildl  -0x2c(%ebp)
    33c7:	dd 45 d8             	fldl   -0x28(%ebp)
    33ca:	de c9                	fmulp  %st,%st(1)
    33cc:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    33cf:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    33d3:	dd 45 e8             	fldl   -0x18(%ebp)
    33d6:	dc 65 e0             	fsubl  -0x20(%ebp)
    33d9:	dd 05 30 96 00 00    	fldl   0x9630
    33df:	d9 c9                	fxch   %st(1)
    33e1:	df e9                	fucomip %st(1),%st
    33e3:	dd d8                	fstp   %st(0)
    33e5:	0f 87 32 ff ff ff    	ja     331d <ln+0xfa>
    33eb:	dd 45 e8             	fldl   -0x18(%ebp)
    33ee:	dc 65 e0             	fsubl  -0x20(%ebp)
    33f1:	dd 05 38 96 00 00    	fldl   0x9638
    33f7:	df e9                	fucomip %st(1),%st
    33f9:	dd d8                	fstp   %st(0)
    33fb:	0f 87 1c ff ff ff    	ja     331d <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    3401:	dd 45 e8             	fldl   -0x18(%ebp)
}
    3404:	c9                   	leave  
    3405:	c3                   	ret    

00003406 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    3406:	55                   	push   %ebp
    3407:	89 e5                	mov    %esp,%ebp
    3409:	83 ec 78             	sub    $0x78,%esp
    340c:	8b 45 08             	mov    0x8(%ebp),%eax
    340f:	89 45 a0             	mov    %eax,-0x60(%ebp)
    3412:	8b 45 0c             	mov    0xc(%ebp),%eax
    3415:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    3418:	dd 45 a0             	fldl   -0x60(%ebp)
    341b:	dd 5d c0             	fstpl  -0x40(%ebp)
    341e:	d9 ee                	fldz   
    3420:	dd 5d f0             	fstpl  -0x10(%ebp)
    3423:	d9 ee                	fldz   
    3425:	dd 5d b8             	fstpl  -0x48(%ebp)
    3428:	d9 ee                	fldz   
    342a:	dd 5d b0             	fstpl  -0x50(%ebp)
    342d:	d9 ee                	fldz   
    342f:	dd 5d e8             	fstpl  -0x18(%ebp)
    3432:	d9 e8                	fld1   
    3434:	dd 5d e0             	fstpl  -0x20(%ebp)
    3437:	d9 e8                	fld1   
    3439:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    343c:	dd 45 a0             	fldl   -0x60(%ebp)
    343f:	d9 ee                	fldz   
    3441:	df e9                	fucomip %st(1),%st
    3443:	dd d8                	fstp   %st(0)
    3445:	7a 12                	jp     3459 <exp+0x53>
    3447:	dd 45 a0             	fldl   -0x60(%ebp)
    344a:	d9 ee                	fldz   
    344c:	df e9                	fucomip %st(1),%st
    344e:	dd d8                	fstp   %st(0)
    3450:	75 07                	jne    3459 <exp+0x53>
    3452:	d9 e8                	fld1   
    3454:	e9 08 01 00 00       	jmp    3561 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    3459:	d9 ee                	fldz   
    345b:	dd 45 a0             	fldl   -0x60(%ebp)
    345e:	d9 c9                	fxch   %st(1)
    3460:	df e9                	fucomip %st(1),%st
    3462:	dd d8                	fstp   %st(0)
    3464:	76 16                	jbe    347c <exp+0x76>
    3466:	dd 45 a0             	fldl   -0x60(%ebp)
    3469:	d9 e0                	fchs   
    346b:	dd 1c 24             	fstpl  (%esp)
    346e:	e8 93 ff ff ff       	call   3406 <exp>
    3473:	d9 e8                	fld1   
    3475:	de f1                	fdivp  %st,%st(1)
    3477:	e9 e5 00 00 00       	jmp    3561 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    347c:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    3483:	d9 e8                	fld1   
    3485:	dd 5d d0             	fstpl  -0x30(%ebp)
    3488:	e9 92 00 00 00       	jmp    351f <exp+0x119>
	{
		ex_tmp=ex_px;
    348d:	dd 45 e8             	fldl   -0x18(%ebp)
    3490:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    3493:	dd 45 d0             	fldl   -0x30(%ebp)
    3496:	dc 4d c0             	fmull  -0x40(%ebp)
    3499:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    349c:	db 45 cc             	fildl  -0x34(%ebp)
    349f:	dd 45 d0             	fldl   -0x30(%ebp)
    34a2:	de f1                	fdivp  %st,%st(1)
    34a4:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    34a7:	dd 45 f0             	fldl   -0x10(%ebp)
    34aa:	dc 45 d0             	faddl  -0x30(%ebp)
    34ad:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    34b0:	dd 45 d0             	fldl   -0x30(%ebp)
    34b3:	dc 4d c0             	fmull  -0x40(%ebp)
    34b6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34b9:	83 c0 01             	add    $0x1,%eax
    34bc:	89 45 9c             	mov    %eax,-0x64(%ebp)
    34bf:	db 45 9c             	fildl  -0x64(%ebp)
    34c2:	de f9                	fdivrp %st,%st(1)
    34c4:	dc 45 f0             	faddl  -0x10(%ebp)
    34c7:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    34ca:	dd 45 d0             	fldl   -0x30(%ebp)
    34cd:	dc 4d c0             	fmull  -0x40(%ebp)
    34d0:	dc 4d c0             	fmull  -0x40(%ebp)
    34d3:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34d6:	83 c0 01             	add    $0x1,%eax
    34d9:	89 45 9c             	mov    %eax,-0x64(%ebp)
    34dc:	db 45 9c             	fildl  -0x64(%ebp)
    34df:	de f9                	fdivrp %st,%st(1)
    34e1:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34e4:	83 c0 02             	add    $0x2,%eax
    34e7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    34ea:	db 45 9c             	fildl  -0x64(%ebp)
    34ed:	de f9                	fdivrp %st,%st(1)
    34ef:	dc 45 b8             	faddl  -0x48(%ebp)
    34f2:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    34f5:	dd 45 b0             	fldl   -0x50(%ebp)
    34f8:	dc 65 b8             	fsubl  -0x48(%ebp)
    34fb:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    34fe:	dd 45 d8             	fldl   -0x28(%ebp)
    3501:	dc 4d d8             	fmull  -0x28(%ebp)
    3504:	dd 45 b8             	fldl   -0x48(%ebp)
    3507:	d8 c0                	fadd   %st(0),%st
    3509:	dd 45 b0             	fldl   -0x50(%ebp)
    350c:	de e1                	fsubp  %st,%st(1)
    350e:	dc 45 f0             	faddl  -0x10(%ebp)
    3511:	de f9                	fdivrp %st,%st(1)
    3513:	dd 45 b0             	fldl   -0x50(%ebp)
    3516:	de e1                	fsubp  %st,%st(1)
    3518:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    351b:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    351f:	dd 45 e8             	fldl   -0x18(%ebp)
    3522:	dc 65 e0             	fsubl  -0x20(%ebp)
    3525:	dd 05 40 96 00 00    	fldl   0x9640
    352b:	d9 c9                	fxch   %st(1)
    352d:	df e9                	fucomip %st(1),%st
    352f:	dd d8                	fstp   %st(0)
    3531:	77 12                	ja     3545 <exp+0x13f>
    3533:	dd 45 e8             	fldl   -0x18(%ebp)
    3536:	dc 65 e0             	fsubl  -0x20(%ebp)
    3539:	dd 05 48 96 00 00    	fldl   0x9648
    353f:	df e9                	fucomip %st(1),%st
    3541:	dd d8                	fstp   %st(0)
    3543:	76 15                	jbe    355a <exp+0x154>
    3545:	dd 45 d8             	fldl   -0x28(%ebp)
    3548:	dd 05 40 96 00 00    	fldl   0x9640
    354e:	d9 c9                	fxch   %st(1)
    3550:	df e9                	fucomip %st(1),%st
    3552:	dd d8                	fstp   %st(0)
    3554:	0f 87 33 ff ff ff    	ja     348d <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    355a:	dd 45 e8             	fldl   -0x18(%ebp)
    355d:	d9 e8                	fld1   
    355f:	de c1                	faddp  %st,%st(1)
    3561:	c9                   	leave  
    3562:	c3                   	ret    

00003563 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    3563:	55                   	push   %ebp
    3564:	89 e5                	mov    %esp,%ebp
    3566:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    3569:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    356d:	8b 45 08             	mov    0x8(%ebp),%eax
    3570:	89 44 24 04          	mov    %eax,0x4(%esp)
    3574:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3577:	89 04 24             	mov    %eax,(%esp)
    357a:	e8 f8 f1 ff ff       	call   2777 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    357f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    3586:	00 
    3587:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    358a:	89 04 24             	mov    %eax,(%esp)
    358d:	e8 68 f4 ff ff       	call   29fa <open>
    3592:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3595:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    3599:	75 1b                	jne    35b6 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    359b:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    359e:	89 44 24 08          	mov    %eax,0x8(%esp)
    35a2:	c7 44 24 04 7c 96 00 	movl   $0x967c,0x4(%esp)
    35a9:	00 
    35aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35b1:	e8 ec f5 ff ff       	call   2ba2 <printf>
    }
    return f;
    35b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    35b9:	c9                   	leave  
    35ba:	c3                   	ret    

000035bb <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    35bb:	55                   	push   %ebp
    35bc:	89 e5                	mov    %esp,%ebp
    35be:	57                   	push   %edi
    35bf:	56                   	push   %esi
    35c0:	53                   	push   %ebx
    35c1:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    35c4:	8b 45 08             	mov    0x8(%ebp),%eax
    35c7:	8b 00                	mov    (%eax),%eax
    35c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    35cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35cf:	8b 78 14             	mov    0x14(%eax),%edi
    35d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35d5:	8b 70 10             	mov    0x10(%eax),%esi
    35d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35db:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    35de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35e1:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    35e4:	85 c0                	test   %eax,%eax
    35e6:	0f 94 c0             	sete   %al
    35e9:	0f b6 c8             	movzbl %al,%ecx
    35ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35ef:	8b 50 04             	mov    0x4(%eax),%edx
    35f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    35f5:	8b 00                	mov    (%eax),%eax
    35f7:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    35fb:	89 74 24 18          	mov    %esi,0x18(%esp)
    35ff:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3603:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3607:	89 54 24 0c          	mov    %edx,0xc(%esp)
    360b:	89 44 24 08          	mov    %eax,0x8(%esp)
    360f:	c7 44 24 04 9c 96 00 	movl   $0x969c,0x4(%esp)
    3616:	00 
    3617:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    361e:	e8 7f f5 ff ff       	call   2ba2 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    3623:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3626:	8b 78 2c             	mov    0x2c(%eax),%edi
    3629:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    362c:	8b 70 28             	mov    0x28(%eax),%esi
    362f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3632:	8b 58 24             	mov    0x24(%eax),%ebx
    3635:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3638:	8b 48 20             	mov    0x20(%eax),%ecx
    363b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    363e:	8b 50 1c             	mov    0x1c(%eax),%edx
    3641:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3644:	8b 40 18             	mov    0x18(%eax),%eax
    3647:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    364b:	89 74 24 18          	mov    %esi,0x18(%esp)
    364f:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3653:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3657:	89 54 24 0c          	mov    %edx,0xc(%esp)
    365b:	89 44 24 08          	mov    %eax,0x8(%esp)
    365f:	c7 44 24 04 dc 96 00 	movl   $0x96dc,0x4(%esp)
    3666:	00 
    3667:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    366e:	e8 2f f5 ff ff       	call   2ba2 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    3673:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3676:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    3679:	8b 0c 85 a0 cd 00 00 	mov    0xcda0(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    3680:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3683:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    3686:	dd 04 c5 80 cd 00 00 	fldl   0xcd80(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    368d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3690:	8b 40 04             	mov    0x4(%eax),%eax
    3693:	8d 50 ff             	lea    -0x1(%eax),%edx
    3696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3699:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    369c:	89 d0                	mov    %edx,%eax
    369e:	c1 e0 04             	shl    $0x4,%eax
    36a1:	29 d0                	sub    %edx,%eax
    36a3:	01 d8                	add    %ebx,%eax
    36a5:	8b 14 85 c0 cc 00 00 	mov    0xccc0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    36ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    36af:	8b 40 04             	mov    0x4(%eax),%eax
    36b2:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    36b5:	8b 04 85 a0 cc 00 00 	mov    0xcca0(,%eax,4),%eax
    36bc:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    36c0:	dd 5c 24 10          	fstpl  0x10(%esp)
    36c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    36c8:	89 44 24 08          	mov    %eax,0x8(%esp)
    36cc:	c7 44 24 04 04 97 00 	movl   $0x9704,0x4(%esp)
    36d3:	00 
    36d4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36db:	e8 c2 f4 ff ff       	call   2ba2 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    36e0:	8b 45 08             	mov    0x8(%ebp),%eax
    36e3:	8b 48 08             	mov    0x8(%eax),%ecx
    36e6:	8b 45 08             	mov    0x8(%ebp),%eax
    36e9:	8b 50 0c             	mov    0xc(%eax),%edx
    36ec:	8b 45 08             	mov    0x8(%ebp),%eax
    36ef:	8b 40 10             	mov    0x10(%eax),%eax
    36f2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    36f6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    36fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    36fe:	c7 44 24 04 33 97 00 	movl   $0x9733,0x4(%esp)
    3705:	00 
    3706:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    370d:	e8 90 f4 ff ff       	call   2ba2 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    3712:	83 c4 3c             	add    $0x3c,%esp
    3715:	5b                   	pop    %ebx
    3716:	5e                   	pop    %esi
    3717:	5f                   	pop    %edi
    3718:	5d                   	pop    %ebp
    3719:	c3                   	ret    

0000371a <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    371a:	55                   	push   %ebp
    371b:	89 e5                	mov    %esp,%ebp
    371d:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    3720:	8b 45 08             	mov    0x8(%ebp),%eax
    3723:	89 04 24             	mov    %eax,(%esp)
    3726:	e8 63 f7 ff ff       	call   2e8e <malloc>
    372b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    372e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3732:	74 1c                	je     3750 <mem_alloc+0x36>
		memset(ptr, 0, block);
    3734:	8b 45 08             	mov    0x8(%ebp),%eax
    3737:	89 44 24 08          	mov    %eax,0x8(%esp)
    373b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3742:	00 
    3743:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3746:	89 04 24             	mov    %eax,(%esp)
    3749:	e8 bf f0 ff ff       	call   280d <memset>
    374e:	eb 20                	jmp    3770 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    3750:	8b 45 0c             	mov    0xc(%ebp),%eax
    3753:	89 44 24 08          	mov    %eax,0x8(%esp)
    3757:	c7 44 24 04 4d 97 00 	movl   $0x974d,0x4(%esp)
    375e:	00 
    375f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3766:	e8 37 f4 ff ff       	call   2ba2 <printf>
		exit();
    376b:	e8 4a f2 ff ff       	call   29ba <exit>
	}
	return ptr;
    3770:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3773:	c9                   	leave  
    3774:	c3                   	ret    

00003775 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    3775:	55                   	push   %ebp
    3776:	89 e5                	mov    %esp,%ebp
    3778:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    377b:	8b 45 0c             	mov    0xc(%ebp),%eax
    377e:	c7 44 24 04 64 97 00 	movl   $0x9764,0x4(%esp)
    3785:	00 
    3786:	89 04 24             	mov    %eax,(%esp)
    3789:	e8 8c ff ff ff       	call   371a <mem_alloc>
    378e:	8b 55 08             	mov    0x8(%ebp),%edx
    3791:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    3794:	8b 45 08             	mov    0x8(%ebp),%eax
    3797:	8b 55 0c             	mov    0xc(%ebp),%edx
    379a:	89 50 08             	mov    %edx,0x8(%eax)
}
    379d:	c9                   	leave  
    379e:	c3                   	ret    

0000379f <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    379f:	55                   	push   %ebp
    37a0:	89 e5                	mov    %esp,%ebp
    37a2:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    37a5:	8b 45 08             	mov    0x8(%ebp),%eax
    37a8:	8b 40 04             	mov    0x4(%eax),%eax
    37ab:	89 04 24             	mov    %eax,(%esp)
    37ae:	e8 a2 f5 ff ff       	call   2d55 <free>
}
    37b3:	c9                   	leave  
    37b4:	c3                   	ret    

000037b5 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    37b5:	55                   	push   %ebp
    37b6:	89 e5                	mov    %esp,%ebp
    37b8:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    37bb:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    37c2:	00 
    37c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    37c6:	89 04 24             	mov    %eax,(%esp)
    37c9:	e8 2c f2 ff ff       	call   29fa <open>
    37ce:	8b 55 08             	mov    0x8(%ebp),%edx
    37d1:	89 02                	mov    %eax,(%edx)
    37d3:	8b 45 08             	mov    0x8(%ebp),%eax
    37d6:	8b 00                	mov    (%eax),%eax
    37d8:	83 f8 ff             	cmp    $0xffffffff,%eax
    37db:	75 20                	jne    37fd <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    37dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    37e0:	89 44 24 08          	mov    %eax,0x8(%esp)
    37e4:	c7 44 24 04 6b 97 00 	movl   $0x976b,0x4(%esp)
    37eb:	00 
    37ec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37f3:	e8 aa f3 ff ff       	call   2ba2 <printf>
		exit();
    37f8:	e8 bd f1 ff ff       	call   29ba <exit>
	}

	bs->format = BINARY;
    37fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3800:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    3804:	8b 45 10             	mov    0x10(%ebp),%eax
    3807:	89 44 24 04          	mov    %eax,0x4(%esp)
    380b:	8b 45 08             	mov    0x8(%ebp),%eax
    380e:	89 04 24             	mov    %eax,(%esp)
    3811:	e8 5f ff ff ff       	call   3775 <alloc_buffer>
	bs->buf_byte_idx=0;
    3816:	8b 45 08             	mov    0x8(%ebp),%eax
    3819:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    3820:	8b 45 08             	mov    0x8(%ebp),%eax
    3823:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    382a:	8b 45 08             	mov    0x8(%ebp),%eax
    382d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    3834:	8b 45 08             	mov    0x8(%ebp),%eax
    3837:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    383e:	8b 45 08             	mov    0x8(%ebp),%eax
    3841:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    3848:	8b 45 08             	mov    0x8(%ebp),%eax
    384b:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    3852:	c9                   	leave  
    3853:	c3                   	ret    

00003854 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    3854:	55                   	push   %ebp
    3855:	89 e5                	mov    %esp,%ebp
    3857:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    385a:	8b 45 08             	mov    0x8(%ebp),%eax
    385d:	8b 00                	mov    (%eax),%eax
    385f:	89 04 24             	mov    %eax,(%esp)
    3862:	e8 7b f1 ff ff       	call   29e2 <close>
	desalloc_buffer(bs);
    3867:	8b 45 08             	mov    0x8(%ebp),%eax
    386a:	89 04 24             	mov    %eax,(%esp)
    386d:	e8 2d ff ff ff       	call   379f <desalloc_buffer>
}
    3872:	c9                   	leave  
    3873:	c3                   	ret    

00003874 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    3874:	55                   	push   %ebp
    3875:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    3877:	8b 45 08             	mov    0x8(%ebp),%eax
    387a:	8b 40 20             	mov    0x20(%eax),%eax
}
    387d:	5d                   	pop    %ebp
    387e:	c3                   	ret    

0000387f <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    387f:	55                   	push   %ebp
    3880:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    3882:	8b 45 08             	mov    0x8(%ebp),%eax
    3885:	8b 40 0c             	mov    0xc(%eax),%eax
}
    3888:	5d                   	pop    %ebp
    3889:	c3                   	ret    

0000388a <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    388a:	55                   	push   %ebp
    388b:	89 e5                	mov    %esp,%ebp
    388d:	56                   	push   %esi
    388e:	53                   	push   %ebx
    388f:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    3892:	8b 45 08             	mov    0x8(%ebp),%eax
    3895:	8b 40 08             	mov    0x8(%eax),%eax
    3898:	8d 50 fe             	lea    -0x2(%eax),%edx
    389b:	8b 45 08             	mov    0x8(%ebp),%eax
    389e:	8b 40 10             	mov    0x10(%eax),%eax
    38a1:	89 d3                	mov    %edx,%ebx
    38a3:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    38a5:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    38aa:	eb 35                	jmp    38e1 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    38ac:	8b 45 08             	mov    0x8(%ebp),%eax
    38af:	8b 50 04             	mov    0x4(%eax),%edx
    38b2:	89 d8                	mov    %ebx,%eax
    38b4:	8d 58 ff             	lea    -0x1(%eax),%ebx
    38b7:	01 c2                	add    %eax,%edx
    38b9:	8b 45 08             	mov    0x8(%ebp),%eax
    38bc:	8b 00                	mov    (%eax),%eax
    38be:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    38c5:	00 
    38c6:	89 54 24 04          	mov    %edx,0x4(%esp)
    38ca:	89 04 24             	mov    %eax,(%esp)
    38cd:	e8 00 f1 ff ff       	call   29d2 <read>
    38d2:	89 c6                	mov    %eax,%esi
		if (!n)
    38d4:	85 f6                	test   %esi,%esi
    38d6:	75 09                	jne    38e1 <refill_buffer+0x57>
		bs->eob= i+1;
    38d8:	8d 53 01             	lea    0x1(%ebx),%edx
    38db:	8b 45 08             	mov    0x8(%ebp),%eax
    38de:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    38e1:	85 db                	test   %ebx,%ebx
    38e3:	78 0a                	js     38ef <refill_buffer+0x65>
    38e5:	8b 45 08             	mov    0x8(%ebp),%eax
    38e8:	8b 40 1c             	mov    0x1c(%eax),%eax
    38eb:	85 c0                	test   %eax,%eax
    38ed:	74 bd                	je     38ac <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    38ef:	83 c4 10             	add    $0x10,%esp
    38f2:	5b                   	pop    %ebx
    38f3:	5e                   	pop    %esi
    38f4:	5d                   	pop    %ebp
    38f5:	c3                   	ret    

000038f6 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    38f6:	55                   	push   %ebp
    38f7:	89 e5                	mov    %esp,%ebp
    38f9:	53                   	push   %ebx
    38fa:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    38fd:	8b 45 08             	mov    0x8(%ebp),%eax
    3900:	8b 40 0c             	mov    0xc(%eax),%eax
    3903:	8d 50 01             	lea    0x1(%eax),%edx
    3906:	8b 45 08             	mov    0x8(%ebp),%eax
    3909:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    390c:	8b 45 08             	mov    0x8(%ebp),%eax
    390f:	8b 40 14             	mov    0x14(%eax),%eax
    3912:	85 c0                	test   %eax,%eax
    3914:	0f 85 9f 00 00 00    	jne    39b9 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    391a:	8b 45 08             	mov    0x8(%ebp),%eax
    391d:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    3924:	8b 45 08             	mov    0x8(%ebp),%eax
    3927:	8b 40 10             	mov    0x10(%eax),%eax
    392a:	8d 50 ff             	lea    -0x1(%eax),%edx
    392d:	8b 45 08             	mov    0x8(%ebp),%eax
    3930:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    3933:	8b 45 08             	mov    0x8(%ebp),%eax
    3936:	8b 40 10             	mov    0x10(%eax),%eax
    3939:	83 f8 03             	cmp    $0x3,%eax
    393c:	7e 10                	jle    394e <get1bit+0x58>
    393e:	8b 45 08             	mov    0x8(%ebp),%eax
    3941:	8b 50 10             	mov    0x10(%eax),%edx
    3944:	8b 45 08             	mov    0x8(%ebp),%eax
    3947:	8b 40 1c             	mov    0x1c(%eax),%eax
    394a:	39 c2                	cmp    %eax,%edx
    394c:	7d 6b                	jge    39b9 <get1bit+0xc3>
             if (bs->eob)
    394e:	8b 45 08             	mov    0x8(%ebp),%eax
    3951:	8b 40 1c             	mov    0x1c(%eax),%eax
    3954:	85 c0                	test   %eax,%eax
    3956:	74 0c                	je     3964 <get1bit+0x6e>
                bs->eobs = TRUE;
    3958:	8b 45 08             	mov    0x8(%ebp),%eax
    395b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    3962:	eb 55                	jmp    39b9 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    3964:	8b 45 08             	mov    0x8(%ebp),%eax
    3967:	8b 58 10             	mov    0x10(%eax),%ebx
    396a:	eb 2f                	jmp    399b <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    396c:	8b 45 08             	mov    0x8(%ebp),%eax
    396f:	8b 50 04             	mov    0x4(%eax),%edx
    3972:	8b 45 08             	mov    0x8(%ebp),%eax
    3975:	8b 40 08             	mov    0x8(%eax),%eax
    3978:	8d 48 ff             	lea    -0x1(%eax),%ecx
    397b:	8b 45 08             	mov    0x8(%ebp),%eax
    397e:	8b 40 10             	mov    0x10(%eax),%eax
    3981:	29 c1                	sub    %eax,%ecx
    3983:	89 c8                	mov    %ecx,%eax
    3985:	01 d8                	add    %ebx,%eax
    3987:	01 c2                	add    %eax,%edx
    3989:	8b 45 08             	mov    0x8(%ebp),%eax
    398c:	8b 48 04             	mov    0x4(%eax),%ecx
    398f:	89 d8                	mov    %ebx,%eax
    3991:	01 c8                	add    %ecx,%eax
    3993:	0f b6 00             	movzbl (%eax),%eax
    3996:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    3998:	83 eb 01             	sub    $0x1,%ebx
    399b:	85 db                	test   %ebx,%ebx
    399d:	79 cd                	jns    396c <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    399f:	8b 45 08             	mov    0x8(%ebp),%eax
    39a2:	89 04 24             	mov    %eax,(%esp)
    39a5:	e8 e0 fe ff ff       	call   388a <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    39aa:	8b 45 08             	mov    0x8(%ebp),%eax
    39ad:	8b 40 08             	mov    0x8(%eax),%eax
    39b0:	8d 50 ff             	lea    -0x1(%eax),%edx
    39b3:	8b 45 08             	mov    0x8(%ebp),%eax
    39b6:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    39b9:	8b 45 08             	mov    0x8(%ebp),%eax
    39bc:	8b 50 04             	mov    0x4(%eax),%edx
    39bf:	8b 45 08             	mov    0x8(%ebp),%eax
    39c2:	8b 40 10             	mov    0x10(%eax),%eax
    39c5:	01 d0                	add    %edx,%eax
    39c7:	0f b6 00             	movzbl (%eax),%eax
    39ca:	0f b6 d0             	movzbl %al,%edx
    39cd:	8b 45 08             	mov    0x8(%ebp),%eax
    39d0:	8b 40 14             	mov    0x14(%eax),%eax
    39d3:	83 e8 01             	sub    $0x1,%eax
    39d6:	8b 04 85 c0 cd 00 00 	mov    0xcdc0(,%eax,4),%eax
    39dd:	21 d0                	and    %edx,%eax
    39df:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    39e2:	8b 45 08             	mov    0x8(%ebp),%eax
    39e5:	8b 40 14             	mov    0x14(%eax),%eax
    39e8:	83 e8 01             	sub    $0x1,%eax
    39eb:	89 c1                	mov    %eax,%ecx
    39ed:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    39f0:	8b 45 08             	mov    0x8(%ebp),%eax
    39f3:	8b 40 14             	mov    0x14(%eax),%eax
    39f6:	8d 50 ff             	lea    -0x1(%eax),%edx
    39f9:	8b 45 08             	mov    0x8(%ebp),%eax
    39fc:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    39ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    3a02:	83 c4 24             	add    $0x24,%esp
    3a05:	5b                   	pop    %ebx
    3a06:	5d                   	pop    %ebp
    3a07:	c3                   	ret    

00003a08 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    3a08:	55                   	push   %ebp
    3a09:	89 e5                	mov    %esp,%ebp
    3a0b:	57                   	push   %edi
    3a0c:	56                   	push   %esi
    3a0d:	53                   	push   %ebx
    3a0e:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    3a11:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    3a18:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    3a1b:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    3a1f:	7e 1c                	jle    3a3d <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    3a21:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    3a28:	00 
    3a29:	c7 44 24 04 84 97 00 	movl   $0x9784,0x4(%esp)
    3a30:	00 
    3a31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a38:	e8 65 f1 ff ff       	call   2ba2 <printf>

	bs->totbit += N;
    3a3d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a40:	8b 50 0c             	mov    0xc(%eax),%edx
    3a43:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a46:	01 c2                	add    %eax,%edx
    3a48:	8b 45 08             	mov    0x8(%ebp),%eax
    3a4b:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    3a4e:	e9 0a 01 00 00       	jmp    3b5d <getbits+0x155>
		if (!bs->buf_bit_idx) {
    3a53:	8b 45 08             	mov    0x8(%ebp),%eax
    3a56:	8b 40 14             	mov    0x14(%eax),%eax
    3a59:	85 c0                	test   %eax,%eax
    3a5b:	0f 85 9f 00 00 00    	jne    3b00 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    3a61:	8b 45 08             	mov    0x8(%ebp),%eax
    3a64:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    3a6b:	8b 45 08             	mov    0x8(%ebp),%eax
    3a6e:	8b 40 10             	mov    0x10(%eax),%eax
    3a71:	8d 50 ff             	lea    -0x1(%eax),%edx
    3a74:	8b 45 08             	mov    0x8(%ebp),%eax
    3a77:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    3a7a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a7d:	8b 40 10             	mov    0x10(%eax),%eax
    3a80:	83 f8 03             	cmp    $0x3,%eax
    3a83:	7e 10                	jle    3a95 <getbits+0x8d>
    3a85:	8b 45 08             	mov    0x8(%ebp),%eax
    3a88:	8b 50 10             	mov    0x10(%eax),%edx
    3a8b:	8b 45 08             	mov    0x8(%ebp),%eax
    3a8e:	8b 40 1c             	mov    0x1c(%eax),%eax
    3a91:	39 c2                	cmp    %eax,%edx
    3a93:	7d 6b                	jge    3b00 <getbits+0xf8>
				if (bs->eob)
    3a95:	8b 45 08             	mov    0x8(%ebp),%eax
    3a98:	8b 40 1c             	mov    0x1c(%eax),%eax
    3a9b:	85 c0                	test   %eax,%eax
    3a9d:	74 0c                	je     3aab <getbits+0xa3>
					bs->eobs = TRUE;
    3a9f:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa2:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    3aa9:	eb 55                	jmp    3b00 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    3aab:	8b 45 08             	mov    0x8(%ebp),%eax
    3aae:	8b 70 10             	mov    0x10(%eax),%esi
    3ab1:	eb 2f                	jmp    3ae2 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    3ab3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab6:	8b 50 04             	mov    0x4(%eax),%edx
    3ab9:	8b 45 08             	mov    0x8(%ebp),%eax
    3abc:	8b 40 08             	mov    0x8(%eax),%eax
    3abf:	8d 48 ff             	lea    -0x1(%eax),%ecx
    3ac2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ac5:	8b 40 10             	mov    0x10(%eax),%eax
    3ac8:	29 c1                	sub    %eax,%ecx
    3aca:	89 c8                	mov    %ecx,%eax
    3acc:	01 f0                	add    %esi,%eax
    3ace:	01 c2                	add    %eax,%edx
    3ad0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ad3:	8b 48 04             	mov    0x4(%eax),%ecx
    3ad6:	89 f0                	mov    %esi,%eax
    3ad8:	01 c8                	add    %ecx,%eax
    3ada:	0f b6 00             	movzbl (%eax),%eax
    3add:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    3adf:	83 ee 01             	sub    $0x1,%esi
    3ae2:	85 f6                	test   %esi,%esi
    3ae4:	79 cd                	jns    3ab3 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    3ae6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ae9:	89 04 24             	mov    %eax,(%esp)
    3aec:	e8 99 fd ff ff       	call   388a <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    3af1:	8b 45 08             	mov    0x8(%ebp),%eax
    3af4:	8b 40 08             	mov    0x8(%eax),%eax
    3af7:	8d 50 ff             	lea    -0x1(%eax),%edx
    3afa:	8b 45 08             	mov    0x8(%ebp),%eax
    3afd:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    3b00:	8b 45 08             	mov    0x8(%ebp),%eax
    3b03:	8b 40 14             	mov    0x14(%eax),%eax
    3b06:	39 d8                	cmp    %ebx,%eax
    3b08:	0f 4f c3             	cmovg  %ebx,%eax
    3b0b:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    3b0d:	8b 45 08             	mov    0x8(%ebp),%eax
    3b10:	8b 50 04             	mov    0x4(%eax),%edx
    3b13:	8b 45 08             	mov    0x8(%ebp),%eax
    3b16:	8b 40 10             	mov    0x10(%eax),%eax
    3b19:	01 d0                	add    %edx,%eax
    3b1b:	0f b6 00             	movzbl (%eax),%eax
    3b1e:	0f b6 d0             	movzbl %al,%edx
    3b21:	8b 45 08             	mov    0x8(%ebp),%eax
    3b24:	8b 40 14             	mov    0x14(%eax),%eax
    3b27:	8b 04 85 e0 cd 00 00 	mov    0xcde0(,%eax,4),%eax
    3b2e:	89 d7                	mov    %edx,%edi
    3b30:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    3b32:	8b 45 08             	mov    0x8(%ebp),%eax
    3b35:	8b 40 14             	mov    0x14(%eax),%eax
    3b38:	29 f0                	sub    %esi,%eax
    3b3a:	89 c1                	mov    %eax,%ecx
    3b3c:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    3b3e:	89 d8                	mov    %ebx,%eax
    3b40:	29 f0                	sub    %esi,%eax
    3b42:	89 c1                	mov    %eax,%ecx
    3b44:	d3 e7                	shl    %cl,%edi
    3b46:	89 f8                	mov    %edi,%eax
    3b48:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    3b4b:	8b 45 08             	mov    0x8(%ebp),%eax
    3b4e:	8b 40 14             	mov    0x14(%eax),%eax
    3b51:	29 f0                	sub    %esi,%eax
    3b53:	89 c2                	mov    %eax,%edx
    3b55:	8b 45 08             	mov    0x8(%ebp),%eax
    3b58:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    3b5b:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    3b5d:	85 db                	test   %ebx,%ebx
    3b5f:	0f 8f ee fe ff ff    	jg     3a53 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    3b65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    3b68:	83 c4 2c             	add    $0x2c,%esp
    3b6b:	5b                   	pop    %ebx
    3b6c:	5e                   	pop    %esi
    3b6d:	5f                   	pop    %edi
    3b6e:	5d                   	pop    %ebp
    3b6f:	c3                   	ret    

00003b70 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    3b70:	55                   	push   %ebp
    3b71:	89 e5                	mov    %esp,%ebp
    3b73:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    3b76:	db 45 10             	fildl  0x10(%ebp)
    3b79:	dd 5c 24 08          	fstpl  0x8(%esp)
    3b7d:	dd 05 f0 97 00 00    	fldl   0x97f0
    3b83:	dd 1c 24             	fstpl  (%esp)
    3b86:	e8 ec f4 ff ff       	call   3077 <pow>
    3b8b:	d9 7d e6             	fnstcw -0x1a(%ebp)
    3b8e:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    3b92:	b4 0c                	mov    $0xc,%ah
    3b94:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    3b98:	d9 6d e4             	fldcw  -0x1c(%ebp)
    3b9b:	db 5d e0             	fistpl -0x20(%ebp)
    3b9e:	d9 6d e6             	fldcw  -0x1a(%ebp)
    3ba1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3ba4:	83 e8 01             	sub    $0x1,%eax
    3ba7:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    3baa:	8b 45 08             	mov    0x8(%ebp),%eax
    3bad:	89 04 24             	mov    %eax,(%esp)
    3bb0:	e8 ca fc ff ff       	call   387f <sstell>
    3bb5:	83 e0 07             	and    $0x7,%eax
    3bb8:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    3bbb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3bbf:	74 17                	je     3bd8 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    3bc1:	b8 08 00 00 00       	mov    $0x8,%eax
    3bc6:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
    3bcd:	8b 45 08             	mov    0x8(%ebp),%eax
    3bd0:	89 04 24             	mov    %eax,(%esp)
    3bd3:	e8 30 fe ff ff       	call   3a08 <getbits>

	val = getbits(bs, N);
    3bd8:	8b 45 10             	mov    0x10(%ebp),%eax
    3bdb:	89 44 24 04          	mov    %eax,0x4(%esp)
    3bdf:	8b 45 08             	mov    0x8(%ebp),%eax
    3be2:	89 04 24             	mov    %eax,(%esp)
    3be5:	e8 1e fe ff ff       	call   3a08 <getbits>
    3bea:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    3bed:	eb 1a                	jmp    3c09 <seek_sync+0x99>
		val <<= ALIGNING;
    3bef:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    3bf3:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    3bfa:	00 
    3bfb:	8b 45 08             	mov    0x8(%ebp),%eax
    3bfe:	89 04 24             	mov    %eax,(%esp)
    3c01:	e8 02 fe ff ff       	call   3a08 <getbits>
    3c06:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    3c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c0c:	23 45 f4             	and    -0xc(%ebp),%eax
    3c0f:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3c12:	74 0f                	je     3c23 <seek_sync+0xb3>
    3c14:	8b 45 08             	mov    0x8(%ebp),%eax
    3c17:	89 04 24             	mov    %eax,(%esp)
    3c1a:	e8 55 fc ff ff       	call   3874 <end_bs>
    3c1f:	85 c0                	test   %eax,%eax
    3c21:	74 cc                	je     3bef <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    3c23:	8b 45 08             	mov    0x8(%ebp),%eax
    3c26:	89 04 24             	mov    %eax,(%esp)
    3c29:	e8 46 fc ff ff       	call   3874 <end_bs>
    3c2e:	85 c0                	test   %eax,%eax
    3c30:	74 07                	je     3c39 <seek_sync+0xc9>
		return(0);
    3c32:	b8 00 00 00 00       	mov    $0x0,%eax
    3c37:	eb 05                	jmp    3c3e <seek_sync+0xce>
	else
		return(1);
    3c39:	b8 01 00 00 00       	mov    $0x1,%eax
}
    3c3e:	c9                   	leave  
    3c3f:	c3                   	ret    

00003c40 <js_bound>:

int js_bound(int lay, int m_ext)
{
    3c40:	55                   	push   %ebp
    3c41:	89 e5                	mov    %esp,%ebp
    3c43:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    3c46:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3c4a:	7e 12                	jle    3c5e <js_bound+0x1e>
    3c4c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    3c50:	7f 0c                	jg     3c5e <js_bound+0x1e>
    3c52:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3c56:	78 06                	js     3c5e <js_bound+0x1e>
    3c58:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    3c5c:	7e 27                	jle    3c85 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    3c5e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c61:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3c65:	8b 45 08             	mov    0x8(%ebp),%eax
    3c68:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c6c:	c7 44 24 04 b8 97 00 	movl   $0x97b8,0x4(%esp)
    3c73:	00 
    3c74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3c7b:	e8 22 ef ff ff       	call   2ba2 <printf>
        exit();
    3c80:	e8 35 ed ff ff       	call   29ba <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    3c85:	8b 45 08             	mov    0x8(%ebp),%eax
    3c88:	83 e8 01             	sub    $0x1,%eax
    3c8b:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    3c92:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c95:	01 d0                	add    %edx,%eax
    3c97:	8b 04 85 20 ce 00 00 	mov    0xce20(,%eax,4),%eax
}
    3c9e:	c9                   	leave  
    3c9f:	c3                   	ret    

00003ca0 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    3ca0:	55                   	push   %ebp
    3ca1:	89 e5                	mov    %esp,%ebp
    3ca3:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    3ca6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ca9:	8b 00                	mov    (%eax),%eax
    3cab:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    3cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cb1:	8b 50 1c             	mov    0x1c(%eax),%edx
    3cb4:	8b 45 08             	mov    0x8(%ebp),%eax
    3cb7:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    3cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cbd:	8b 40 1c             	mov    0x1c(%eax),%eax
    3cc0:	83 f8 03             	cmp    $0x3,%eax
    3cc3:	75 07                	jne    3ccc <hdr_to_frps+0x2c>
    3cc5:	b8 01 00 00 00       	mov    $0x1,%eax
    3cca:	eb 05                	jmp    3cd1 <hdr_to_frps+0x31>
    3ccc:	b8 02 00 00 00       	mov    $0x2,%eax
    3cd1:	8b 55 08             	mov    0x8(%ebp),%edx
    3cd4:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    3cd7:	8b 45 08             	mov    0x8(%ebp),%eax
    3cda:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    3ce1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ce4:	8b 40 1c             	mov    0x1c(%eax),%eax
    3ce7:	83 f8 01             	cmp    $0x1,%eax
    3cea:	75 20                	jne    3d0c <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    3cec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cef:	8b 50 20             	mov    0x20(%eax),%edx
    3cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3cf5:	8b 40 04             	mov    0x4(%eax),%eax
    3cf8:	89 54 24 04          	mov    %edx,0x4(%esp)
    3cfc:	89 04 24             	mov    %eax,(%esp)
    3cff:	e8 3c ff ff ff       	call   3c40 <js_bound>
    3d04:	8b 55 08             	mov    0x8(%ebp),%edx
    3d07:	89 42 0c             	mov    %eax,0xc(%edx)
    3d0a:	eb 0c                	jmp    3d18 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    3d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    3d0f:	8b 50 10             	mov    0x10(%eax),%edx
    3d12:	8b 45 08             	mov    0x8(%ebp),%eax
    3d15:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3d18:	c9                   	leave  
    3d19:	c3                   	ret    

00003d1a <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    3d1a:	55                   	push   %ebp
    3d1b:	89 e5                	mov    %esp,%ebp
    3d1d:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    3d20:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    3d24:	74 19                	je     3d3f <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    3d26:	c7 44 24 04 db 97 00 	movl   $0x97db,0x4(%esp)
    3d2d:	00 
    3d2e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d35:	e8 68 ee ff ff       	call   2ba2 <printf>
		exit();
    3d3a:	e8 7b ec ff ff       	call   29ba <exit>
	}
	getCoreBuf(1, val);
    3d3f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d42:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d46:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d4d:	e8 68 ed ff ff       	call   2aba <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    3d52:	c9                   	leave  
    3d53:	c3                   	ret    

00003d54 <hsstell>:

unsigned long hsstell()
{
    3d54:	55                   	push   %ebp
    3d55:	89 e5                	mov    %esp,%ebp
    3d57:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    3d5a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3d61:	00 
    3d62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    3d69:	e8 4c ed ff ff       	call   2aba <getCoreBuf>
//	return(totbit);
}
    3d6e:	c9                   	leave  
    3d6f:	c3                   	ret    

00003d70 <hgetbits>:

unsigned long hgetbits(int N)
{
    3d70:	55                   	push   %ebp
    3d71:	89 e5                	mov    %esp,%ebp
    3d73:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    3d76:	8b 45 08             	mov    0x8(%ebp),%eax
    3d79:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d7d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    3d84:	e8 31 ed ff ff       	call   2aba <getCoreBuf>
}
    3d89:	c9                   	leave  
    3d8a:	c3                   	ret    

00003d8b <hget1bit>:


unsigned int hget1bit()
{
    3d8b:	55                   	push   %ebp
    3d8c:	89 e5                	mov    %esp,%ebp
    3d8e:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    3d91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3d98:	e8 d3 ff ff ff       	call   3d70 <hgetbits>
}
    3d9d:	c9                   	leave  
    3d9e:	c3                   	ret    

00003d9f <rewindNbits>:


void rewindNbits(int N)
{
    3d9f:	55                   	push   %ebp
    3da0:	89 e5                	mov    %esp,%ebp
    3da2:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    3da5:	8b 45 08             	mov    0x8(%ebp),%eax
    3da8:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dac:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    3db3:	e8 02 ed ff ff       	call   2aba <getCoreBuf>
}
    3db8:	c9                   	leave  
    3db9:	c3                   	ret    

00003dba <rewindNbytes>:


void rewindNbytes(int N)
{
    3dba:	55                   	push   %ebp
    3dbb:	89 e5                	mov    %esp,%ebp
    3dbd:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    3dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    3dc3:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dc7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    3dce:	e8 e7 ec ff ff       	call   2aba <getCoreBuf>
}
    3dd3:	c9                   	leave  
    3dd4:	c3                   	ret    

00003dd5 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    3dd5:	55                   	push   %ebp
    3dd6:	89 e5                	mov    %esp,%ebp
    3dd8:	57                   	push   %edi
    3dd9:	56                   	push   %esi
    3dda:	53                   	push   %ebx
    3ddb:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    3de1:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    3de5:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    3de9:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    3ded:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    3df1:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    3df5:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    3df9:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    3dfd:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    3e01:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    3e05:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    3e09:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    3e0d:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    3e11:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    3e15:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    3e19:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    3e1d:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    3e21:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    3e25:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    3e29:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    3e2d:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    3e31:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    3e35:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    3e39:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    3e3d:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    3e41:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    3e45:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    3e49:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    3e4d:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    3e51:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    3e55:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    3e59:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    3e5d:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    3e61:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    3e65:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    3e69:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    3e6d:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    3e71:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    3e75:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    3e79:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    3e7d:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    3e81:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    3e85:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    3e89:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    3e8d:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    3e91:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    3e95:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    3e99:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    3e9d:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    3ea1:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    3ea5:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    3ea9:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    3ead:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    3eb1:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    3eb5:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    3eb9:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    3ebd:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    3ec1:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    3ec5:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    3ec9:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    3ecd:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    3ed1:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    3ed5:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    3ed9:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    3edd:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    3ee1:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    3ee5:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    3ee9:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    3eed:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    3ef1:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    3ef5:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    3ef9:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    3efd:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    3f01:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    3f05:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    3f09:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    3f0d:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    3f11:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    3f15:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    3f19:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    3f1d:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    3f21:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    3f25:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    3f29:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    3f30:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    3f37:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    3f3e:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    3f45:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    3f4c:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    3f53:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    3f5a:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    3f61:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    3f68:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    3f6f:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    3f76:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    3f7d:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    3f84:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    3f8b:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    3f92:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    3f99:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    3fa0:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    3fa7:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    3fae:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    3fb5:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    3fbc:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    3fc3:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    3fca:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    3fd1:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    3fd8:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    3fdf:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    3fe6:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    3fed:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    3ff1:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    3ff5:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    3ff9:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    3ffd:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    4001:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    4005:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    4009:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    400d:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    4011:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    4015:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    4019:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    401d:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    4021:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    4025:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    4029:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    402d:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    4031:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    4035:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    4039:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    403d:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    4041:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    4045:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    4049:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    404d:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    4051:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    4055:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    4059:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    405d:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    4061:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    4065:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    4069:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    406d:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    4071:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    4075:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    407c:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    4083:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    408a:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    4091:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    4098:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    409f:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    40a6:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    40ad:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    40b4:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    40bb:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    40c2:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    40c9:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    40d0:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    40d7:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    40de:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    40e5:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    40ec:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    40f3:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    40fa:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    4101:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    4108:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    410f:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    4116:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    411d:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    4124:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    412b:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    4132:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    4139:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    4140:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    4147:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    414e:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    4155:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    415c:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    4163:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    416a:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    4171:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    4178:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    417f:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    4186:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    418d:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    4194:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    419b:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    41a2:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    41a9:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    41b0:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    41b7:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    41be:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    41c5:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    41cc:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    41d3:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    41da:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    41e1:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    41e8:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    41ef:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    41f6:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    41fd:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    4204:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    420b:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    4212:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    4219:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    4220:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    4227:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    422d:	b8 00 98 00 00       	mov    $0x9800,%eax
    4232:	b9 23 00 00 00       	mov    $0x23,%ecx
    4237:	89 d7                	mov    %edx,%edi
    4239:	89 c6                	mov    %eax,%esi
    423b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    423d:	89 f0                	mov    %esi,%eax
    423f:	89 fa                	mov    %edi,%edx
    4241:	0f b7 08             	movzwl (%eax),%ecx
    4244:	66 89 0a             	mov    %cx,(%edx)
    4247:	83 c2 02             	add    $0x2,%edx
    424a:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    424d:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    4253:	ba a0 98 00 00       	mov    $0x98a0,%edx
    4258:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    425d:	89 c1                	mov    %eax,%ecx
    425f:	83 e1 02             	and    $0x2,%ecx
    4262:	85 c9                	test   %ecx,%ecx
    4264:	74 0f                	je     4275 <read_decoder_table+0x4a0>
    4266:	0f b7 0a             	movzwl (%edx),%ecx
    4269:	66 89 08             	mov    %cx,(%eax)
    426c:	83 c0 02             	add    $0x2,%eax
    426f:	83 c2 02             	add    $0x2,%edx
    4272:	83 eb 02             	sub    $0x2,%ebx
    4275:	89 d9                	mov    %ebx,%ecx
    4277:	c1 e9 02             	shr    $0x2,%ecx
    427a:	89 c7                	mov    %eax,%edi
    427c:	89 d6                	mov    %edx,%esi
    427e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4280:	89 f2                	mov    %esi,%edx
    4282:	89 f8                	mov    %edi,%eax
    4284:	b9 00 00 00 00       	mov    $0x0,%ecx
    4289:	89 de                	mov    %ebx,%esi
    428b:	83 e6 02             	and    $0x2,%esi
    428e:	85 f6                	test   %esi,%esi
    4290:	74 0b                	je     429d <read_decoder_table+0x4c8>
    4292:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4296:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    429a:	83 c1 02             	add    $0x2,%ecx
    429d:	83 e3 01             	and    $0x1,%ebx
    42a0:	85 db                	test   %ebx,%ebx
    42a2:	74 07                	je     42ab <read_decoder_table+0x4d6>
    42a4:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    42a8:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    42ab:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    42b1:	b8 40 99 00 00       	mov    $0x9940,%eax
    42b6:	b9 23 00 00 00       	mov    $0x23,%ecx
    42bb:	89 d7                	mov    %edx,%edi
    42bd:	89 c6                	mov    %eax,%esi
    42bf:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    42c1:	89 f0                	mov    %esi,%eax
    42c3:	89 fa                	mov    %edi,%edx
    42c5:	0f b7 08             	movzwl (%eax),%ecx
    42c8:	66 89 0a             	mov    %cx,(%edx)
    42cb:	83 c2 02             	add    $0x2,%edx
    42ce:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    42d1:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    42d7:	ba e0 99 00 00       	mov    $0x99e0,%edx
    42dc:	bb fe 00 00 00       	mov    $0xfe,%ebx
    42e1:	89 c1                	mov    %eax,%ecx
    42e3:	83 e1 02             	and    $0x2,%ecx
    42e6:	85 c9                	test   %ecx,%ecx
    42e8:	74 0f                	je     42f9 <read_decoder_table+0x524>
    42ea:	0f b7 0a             	movzwl (%edx),%ecx
    42ed:	66 89 08             	mov    %cx,(%eax)
    42f0:	83 c0 02             	add    $0x2,%eax
    42f3:	83 c2 02             	add    $0x2,%edx
    42f6:	83 eb 02             	sub    $0x2,%ebx
    42f9:	89 d9                	mov    %ebx,%ecx
    42fb:	c1 e9 02             	shr    $0x2,%ecx
    42fe:	89 c7                	mov    %eax,%edi
    4300:	89 d6                	mov    %edx,%esi
    4302:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4304:	89 f2                	mov    %esi,%edx
    4306:	89 f8                	mov    %edi,%eax
    4308:	b9 00 00 00 00       	mov    $0x0,%ecx
    430d:	89 de                	mov    %ebx,%esi
    430f:	83 e6 02             	and    $0x2,%esi
    4312:	85 f6                	test   %esi,%esi
    4314:	74 0b                	je     4321 <read_decoder_table+0x54c>
    4316:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    431a:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    431e:	83 c1 02             	add    $0x2,%ecx
    4321:	83 e3 01             	and    $0x1,%ebx
    4324:	85 db                	test   %ebx,%ebx
    4326:	74 07                	je     432f <read_decoder_table+0x55a>
    4328:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    432c:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    432f:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    4335:	b8 e0 9a 00 00       	mov    $0x9ae0,%eax
    433a:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    433f:	89 d7                	mov    %edx,%edi
    4341:	89 c6                	mov    %eax,%esi
    4343:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4345:	89 f0                	mov    %esi,%eax
    4347:	89 fa                	mov    %edi,%edx
    4349:	0f b7 08             	movzwl (%eax),%ecx
    434c:	66 89 0a             	mov    %cx,(%edx)
    434f:	83 c2 02             	add    $0x2,%edx
    4352:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    4355:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    435b:	ba e0 9b 00 00       	mov    $0x9be0,%edx
    4360:	bb fe 00 00 00       	mov    $0xfe,%ebx
    4365:	89 c1                	mov    %eax,%ecx
    4367:	83 e1 02             	and    $0x2,%ecx
    436a:	85 c9                	test   %ecx,%ecx
    436c:	74 0f                	je     437d <read_decoder_table+0x5a8>
    436e:	0f b7 0a             	movzwl (%edx),%ecx
    4371:	66 89 08             	mov    %cx,(%eax)
    4374:	83 c0 02             	add    $0x2,%eax
    4377:	83 c2 02             	add    $0x2,%edx
    437a:	83 eb 02             	sub    $0x2,%ebx
    437d:	89 d9                	mov    %ebx,%ecx
    437f:	c1 e9 02             	shr    $0x2,%ecx
    4382:	89 c7                	mov    %eax,%edi
    4384:	89 d6                	mov    %edx,%esi
    4386:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4388:	89 f2                	mov    %esi,%edx
    438a:	89 f8                	mov    %edi,%eax
    438c:	b9 00 00 00 00       	mov    $0x0,%ecx
    4391:	89 de                	mov    %ebx,%esi
    4393:	83 e6 02             	and    $0x2,%esi
    4396:	85 f6                	test   %esi,%esi
    4398:	74 0b                	je     43a5 <read_decoder_table+0x5d0>
    439a:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    439e:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    43a2:	83 c1 02             	add    $0x2,%ecx
    43a5:	83 e3 01             	and    $0x1,%ebx
    43a8:	85 db                	test   %ebx,%ebx
    43aa:	74 07                	je     43b3 <read_decoder_table+0x5de>
    43ac:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    43b0:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    43b3:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    43b9:	b8 e0 9c 00 00       	mov    $0x9ce0,%eax
    43be:	b9 ff 00 00 00       	mov    $0xff,%ecx
    43c3:	89 d7                	mov    %edx,%edi
    43c5:	89 c6                	mov    %eax,%esi
    43c7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    43c9:	89 f0                	mov    %esi,%eax
    43cb:	89 fa                	mov    %edi,%edx
    43cd:	0f b7 08             	movzwl (%eax),%ecx
    43d0:	66 89 0a             	mov    %cx,(%edx)
    43d3:	83 c2 02             	add    $0x2,%edx
    43d6:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    43d9:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    43df:	ba e0 a0 00 00       	mov    $0xa0e0,%edx
    43e4:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    43e9:	89 c1                	mov    %eax,%ecx
    43eb:	83 e1 02             	and    $0x2,%ecx
    43ee:	85 c9                	test   %ecx,%ecx
    43f0:	74 0f                	je     4401 <read_decoder_table+0x62c>
    43f2:	0f b7 0a             	movzwl (%edx),%ecx
    43f5:	66 89 08             	mov    %cx,(%eax)
    43f8:	83 c0 02             	add    $0x2,%eax
    43fb:	83 c2 02             	add    $0x2,%edx
    43fe:	83 eb 02             	sub    $0x2,%ebx
    4401:	89 d9                	mov    %ebx,%ecx
    4403:	c1 e9 02             	shr    $0x2,%ecx
    4406:	89 c7                	mov    %eax,%edi
    4408:	89 d6                	mov    %edx,%esi
    440a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    440c:	89 f2                	mov    %esi,%edx
    440e:	89 f8                	mov    %edi,%eax
    4410:	b9 00 00 00 00       	mov    $0x0,%ecx
    4415:	89 de                	mov    %ebx,%esi
    4417:	83 e6 02             	and    $0x2,%esi
    441a:	85 f6                	test   %esi,%esi
    441c:	74 0b                	je     4429 <read_decoder_table+0x654>
    441e:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4422:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    4426:	83 c1 02             	add    $0x2,%ecx
    4429:	83 e3 01             	and    $0x1,%ebx
    442c:	85 db                	test   %ebx,%ebx
    442e:	74 07                	je     4437 <read_decoder_table+0x662>
    4430:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    4434:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    4437:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    443d:	b8 e0 a4 00 00       	mov    $0xa4e0,%eax
    4442:	b9 ff 00 00 00       	mov    $0xff,%ecx
    4447:	89 d7                	mov    %edx,%edi
    4449:	89 c6                	mov    %eax,%esi
    444b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    444d:	89 f0                	mov    %esi,%eax
    444f:	89 fa                	mov    %edi,%edx
    4451:	0f b7 08             	movzwl (%eax),%ecx
    4454:	66 89 0a             	mov    %cx,(%edx)
    4457:	83 c2 02             	add    $0x2,%edx
    445a:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    445d:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    4463:	bb e0 a8 00 00       	mov    $0xa8e0,%ebx
    4468:	b8 00 01 00 00       	mov    $0x100,%eax
    446d:	89 d7                	mov    %edx,%edi
    446f:	89 de                	mov    %ebx,%esi
    4471:	89 c1                	mov    %eax,%ecx
    4473:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    4475:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    447c:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    4483:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    448a:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    4491:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    4498:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    449f:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    44a6:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    44ad:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    44b4:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    44bb:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    44c2:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    44c9:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    44d0:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    44d7:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    44de:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    44e5:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    44ec:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    44f3:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    44fa:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    4501:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    4508:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    450f:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    4516:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    451d:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    4524:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    452b:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    4532:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    4539:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    4540:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    4547:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    454e:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    4555:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    455c:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    4563:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    456a:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    4571:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    4578:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    457f:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    4586:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    458d:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    4594:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    459b:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    45a2:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    45a9:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    45b0:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    45b7:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    45be:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    45c5:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    45cc:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    45d3:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    45da:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    45e1:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    45e8:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    45ef:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    45f6:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    45fd:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    4604:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    460b:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    4612:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    4619:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    4620:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    4627:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    462e:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    4635:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    463c:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    4643:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    464a:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    4651:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    4658:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    465f:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    4666:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    466d:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    4674:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    467b:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    4682:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    4689:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    4690:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    4697:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    469e:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    46a5:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    46ac:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    46b3:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    46ba:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    46c1:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    46c8:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    46cf:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    46d6:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    46dd:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    46e4:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    46eb:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    46f2:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    46f9:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    4700:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    4707:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    470e:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    4715:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    471c:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    4723:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    472a:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    4731:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    4738:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    473f:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    4746:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    474d:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    4754:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    475b:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    4762:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    4769:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    4770:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    4777:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    477e:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    4785:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    478c:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    4793:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    479a:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    47a1:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    47a8:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    47af:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    47b6:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    47bd:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    47c4:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    47cb:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    47d2:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    47d9:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    47e0:	30 00 
    47e2:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    47e9:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    47f0:	00 00 00 
    47f3:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    47fa:	00 00 00 
    47fd:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    4804:	00 00 00 
    4807:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    480e:	00 00 00 
    4811:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    4818:	ff ff ff 
    481b:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    4822:	00 00 00 
    4825:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    482c:	00 00 00 
    482f:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    4836:	00 00 00 
    4839:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    4840:	00 00 00 
    4843:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    484a:	31 00 
    484c:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    4853:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    485a:	00 00 00 
    485d:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    4864:	00 00 00 
    4867:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    486e:	00 00 00 
    4871:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    4878:	00 00 00 
    487b:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    4882:	ff ff ff 
    4885:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    488c:	00 00 00 
    488f:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    4896:	00 00 00 
    4899:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    489c:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    48a2:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    48a9:	00 00 00 
    48ac:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    48b3:	32 00 
    48b5:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    48bc:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    48c3:	00 00 00 
    48c6:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    48cd:	00 00 00 
    48d0:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    48d7:	00 00 00 
    48da:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    48e1:	00 00 00 
    48e4:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    48eb:	ff ff ff 
    48ee:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    48f5:	00 00 00 
    48f8:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    48ff:	00 00 00 
    4902:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    4905:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    490b:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    4912:	00 00 00 
    4915:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    491c:	33 00 
    491e:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    4925:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    492c:	00 00 00 
    492f:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    4936:	00 00 00 
    4939:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    4940:	00 00 00 
    4943:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    494a:	00 00 00 
    494d:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    4954:	ff ff ff 
    4957:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    495e:	00 00 00 
    4961:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    4968:	00 00 00 
    496b:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    496e:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    4974:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    497b:	00 00 00 
    497e:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    4985:	34 00 
    4987:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    498e:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    4995:	00 00 00 
    4998:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    499f:	00 00 00 
    49a2:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    49a9:	00 00 00 
    49ac:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    49b3:	00 00 00 
    49b6:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    49bd:	ff ff ff 
    49c0:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    49c7:	00 00 00 
    49ca:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    49d1:	00 00 00 
    49d4:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    49db:	00 00 00 
    49de:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    49e5:	00 00 00 
    49e8:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    49ef:	35 00 
    49f1:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    49f8:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    49ff:	00 00 00 
    4a02:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    4a09:	00 00 00 
    4a0c:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    4a13:	00 00 00 
    4a16:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    4a1d:	00 00 00 
    4a20:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    4a27:	ff ff ff 
    4a2a:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    4a31:	00 00 00 
    4a34:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    4a3b:	00 00 00 
    4a3e:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    4a44:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    4a4a:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    4a51:	00 00 00 
    4a54:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    4a5b:	36 00 
    4a5d:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    4a64:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    4a6b:	00 00 00 
    4a6e:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    4a75:	00 00 00 
    4a78:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    4a7f:	00 00 00 
    4a82:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    4a89:	00 00 00 
    4a8c:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    4a93:	ff ff ff 
    4a96:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    4a9d:	00 00 00 
    4aa0:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    4aa7:	00 00 00 
    4aaa:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    4ab0:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    4ab6:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    4abd:	00 00 00 
    4ac0:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    4ac7:	37 00 
    4ac9:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    4ad0:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    4ad7:	00 00 00 
    4ada:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    4ae1:	00 00 00 
    4ae4:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    4aeb:	00 00 00 
    4aee:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    4af5:	00 00 00 
    4af8:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    4aff:	ff ff ff 
    4b02:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    4b09:	00 00 00 
    4b0c:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    4b13:	00 00 00 
    4b16:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    4b1c:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    4b22:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    4b29:	00 00 00 
    4b2c:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    4b33:	38 00 
    4b35:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    4b3c:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    4b43:	00 00 00 
    4b46:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    4b4d:	00 00 00 
    4b50:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    4b57:	00 00 00 
    4b5a:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    4b61:	00 00 00 
    4b64:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    4b6b:	ff ff ff 
    4b6e:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    4b75:	00 00 00 
    4b78:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    4b7f:	00 00 00 
    4b82:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    4b88:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    4b8e:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    4b95:	00 00 00 
    4b98:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    4b9f:	39 00 
    4ba1:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    4ba8:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    4baf:	00 00 00 
    4bb2:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    4bb9:	00 00 00 
    4bbc:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    4bc3:	00 00 00 
    4bc6:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    4bcd:	00 00 00 
    4bd0:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    4bd7:	ff ff ff 
    4bda:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    4be1:	00 00 00 
    4be4:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    4beb:	00 00 00 
    4bee:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    4bf4:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    4bfa:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    4c01:	00 00 00 
    4c04:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    4c0b:	31 30 
    4c0d:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    4c14:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    4c1b:	00 00 00 
    4c1e:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    4c25:	00 00 00 
    4c28:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    4c2f:	00 00 00 
    4c32:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    4c39:	00 00 00 
    4c3c:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    4c43:	ff ff ff 
    4c46:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    4c4d:	00 00 00 
    4c50:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    4c57:	00 00 00 
    4c5a:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    4c60:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    4c66:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    4c6d:	00 00 00 
    4c70:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    4c77:	31 31 
    4c79:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    4c80:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    4c87:	00 00 00 
    4c8a:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    4c91:	00 00 00 
    4c94:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    4c9b:	00 00 00 
    4c9e:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    4ca5:	00 00 00 
    4ca8:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    4caf:	ff ff ff 
    4cb2:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    4cb9:	00 00 00 
    4cbc:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    4cc3:	00 00 00 
    4cc6:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    4ccc:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    4cd2:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    4cd9:	00 00 00 
    4cdc:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    4ce3:	31 32 
    4ce5:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    4cec:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    4cf3:	00 00 00 
    4cf6:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    4cfd:	00 00 00 
    4d00:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    4d07:	00 00 00 
    4d0a:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    4d11:	00 00 00 
    4d14:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    4d1b:	ff ff ff 
    4d1e:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    4d25:	00 00 00 
    4d28:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    4d2f:	00 00 00 
    4d32:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    4d38:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    4d3e:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    4d45:	00 00 00 
    4d48:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    4d4f:	31 33 
    4d51:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    4d58:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    4d5f:	00 00 00 
    4d62:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    4d69:	00 00 00 
    4d6c:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    4d73:	00 00 00 
    4d76:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    4d7d:	00 00 00 
    4d80:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    4d87:	ff ff ff 
    4d8a:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    4d91:	00 00 00 
    4d94:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    4d9b:	00 00 00 
    4d9e:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    4da4:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    4daa:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    4db1:	01 00 00 
    4db4:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    4dbb:	31 34 
    4dbd:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    4dc4:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    4dcb:	00 00 00 
    4dce:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    4dd5:	00 00 00 
    4dd8:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    4ddf:	00 00 00 
    4de2:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    4de9:	00 00 00 
    4dec:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    4df3:	ff ff ff 
    4df6:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    4dfd:	00 00 00 
    4e00:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    4e07:	00 00 00 
    4e0a:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    4e11:	00 00 00 
    4e14:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    4e1b:	00 00 00 
    4e1e:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    4e25:	31 35 
    4e27:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    4e2e:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    4e35:	00 00 00 
    4e38:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    4e3f:	00 00 00 
    4e42:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    4e49:	00 00 00 
    4e4c:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    4e53:	00 00 00 
    4e56:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    4e5d:	ff ff ff 
    4e60:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    4e67:	00 00 00 
    4e6a:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    4e71:	00 00 00 
    4e74:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    4e7a:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    4e80:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    4e87:	01 00 00 
    4e8a:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    4e91:	31 36 
    4e93:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    4e9a:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    4ea1:	00 00 00 
    4ea4:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    4eab:	00 00 00 
    4eae:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    4eb5:	00 00 00 
    4eb8:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    4ebf:	00 00 00 
    4ec2:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    4ec9:	ff ff ff 
    4ecc:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    4ed3:	00 00 00 
    4ed6:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    4edd:	00 00 00 
    4ee0:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    4ee6:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    4eec:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    4ef3:	01 00 00 
    4ef6:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    4efd:	31 37 
    4eff:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    4f06:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    4f0d:	00 00 00 
    4f10:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    4f17:	00 00 00 
    4f1a:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    4f21:	00 00 00 
    4f24:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    4f2b:	00 00 00 
    4f2e:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    4f35:	00 00 00 
    4f38:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    4f3f:	00 00 00 
    4f42:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    4f49:	00 00 00 
    4f4c:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    4f52:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    4f58:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    4f5f:	01 00 00 
    4f62:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    4f69:	31 38 
    4f6b:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    4f72:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    4f79:	00 00 00 
    4f7c:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    4f83:	00 00 00 
    4f86:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    4f8d:	00 00 00 
    4f90:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    4f97:	00 00 00 
    4f9a:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    4fa1:	00 00 00 
    4fa4:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    4fab:	00 00 00 
    4fae:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    4fb5:	00 00 00 
    4fb8:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    4fbe:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    4fc4:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    4fcb:	01 00 00 
    4fce:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    4fd5:	31 39 
    4fd7:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    4fde:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    4fe5:	00 00 00 
    4fe8:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    4fef:	00 00 00 
    4ff2:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    4ff9:	00 00 00 
    4ffc:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    5003:	00 00 00 
    5006:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    500d:	00 00 00 
    5010:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    5017:	00 00 00 
    501a:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    5021:	00 00 00 
    5024:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    502a:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    5030:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    5037:	01 00 00 
    503a:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    5041:	32 30 
    5043:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    504a:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    5051:	00 00 00 
    5054:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    505b:	00 00 00 
    505e:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    5065:	00 00 00 
    5068:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    506f:	00 00 00 
    5072:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    5079:	00 00 00 
    507c:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    5083:	00 00 00 
    5086:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    508d:	00 00 00 
    5090:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5096:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    509c:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    50a3:	01 00 00 
    50a6:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    50ad:	32 31 
    50af:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    50b6:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    50bd:	00 00 00 
    50c0:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    50c7:	00 00 00 
    50ca:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    50d1:	00 00 00 
    50d4:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    50db:	00 00 00 
    50de:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    50e5:	00 00 00 
    50e8:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    50ef:	00 00 00 
    50f2:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    50f9:	00 00 00 
    50fc:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5102:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    5108:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    510f:	01 00 00 
    5112:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    5119:	32 32 
    511b:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    5122:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    5129:	00 00 00 
    512c:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    5133:	00 00 00 
    5136:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    513d:	00 00 00 
    5140:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    5147:	03 00 00 
    514a:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    5151:	00 00 00 
    5154:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    515b:	00 00 00 
    515e:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    5165:	00 00 00 
    5168:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    516e:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    5174:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    517b:	01 00 00 
    517e:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    5185:	32 33 
    5187:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    518e:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    5195:	00 00 00 
    5198:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    519f:	00 00 00 
    51a2:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    51a9:	00 00 00 
    51ac:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    51b3:	1f 00 00 
    51b6:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    51bd:	00 00 00 
    51c0:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    51c7:	00 00 00 
    51ca:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    51d1:	00 00 00 
    51d4:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    51da:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    51e0:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    51e7:	01 00 00 
    51ea:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    51f1:	32 34 
    51f3:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    51fa:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    5201:	00 00 00 
    5204:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    520b:	00 00 00 
    520e:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    5215:	00 00 00 
    5218:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    521f:	00 00 00 
    5222:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    5229:	ff ff ff 
    522c:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    5233:	00 00 00 
    5236:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    523d:	00 00 00 
    5240:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5246:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    524c:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    5253:	02 00 00 
    5256:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    525d:	32 35 
    525f:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    5266:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    526d:	00 00 00 
    5270:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    5277:	00 00 00 
    527a:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    5281:	00 00 00 
    5284:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    528b:	00 00 00 
    528e:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    5295:	00 00 00 
    5298:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    529f:	00 00 00 
    52a2:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    52a9:	00 00 00 
    52ac:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    52b2:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    52b8:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    52bf:	02 00 00 
    52c2:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    52c9:	32 36 
    52cb:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    52d2:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    52d9:	00 00 00 
    52dc:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    52e3:	00 00 00 
    52e6:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    52ed:	00 00 00 
    52f0:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    52f7:	00 00 00 
    52fa:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    5301:	00 00 00 
    5304:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    530b:	00 00 00 
    530e:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    5315:	00 00 00 
    5318:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    531e:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    5324:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    532b:	02 00 00 
    532e:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    5335:	32 37 
    5337:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    533e:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    5345:	00 00 00 
    5348:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    534f:	00 00 00 
    5352:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    5359:	00 00 00 
    535c:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    5363:	00 00 00 
    5366:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    536d:	00 00 00 
    5370:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    5377:	00 00 00 
    537a:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    5381:	00 00 00 
    5384:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    538a:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    5390:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    5397:	02 00 00 
    539a:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    53a1:	32 38 
    53a3:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    53aa:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    53b1:	00 00 00 
    53b4:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    53bb:	00 00 00 
    53be:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    53c5:	00 00 00 
    53c8:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    53cf:	00 00 00 
    53d2:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    53d9:	00 00 00 
    53dc:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    53e3:	00 00 00 
    53e6:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    53ed:	00 00 00 
    53f0:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    53f6:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    53fc:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    5403:	02 00 00 
    5406:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    540d:	32 39 
    540f:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    5416:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    541d:	00 00 00 
    5420:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    5427:	00 00 00 
    542a:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    5431:	00 00 00 
    5434:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    543b:	01 00 00 
    543e:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    5445:	00 00 00 
    5448:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    544f:	00 00 00 
    5452:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    5459:	00 00 00 
    545c:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5462:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    5468:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    546f:	02 00 00 
    5472:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    5479:	33 30 
    547b:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    5482:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    5489:	00 00 00 
    548c:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    5493:	00 00 00 
    5496:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    549d:	00 00 00 
    54a0:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    54a7:	07 00 00 
    54aa:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    54b1:	00 00 00 
    54b4:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    54bb:	00 00 00 
    54be:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    54c5:	00 00 00 
    54c8:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    54ce:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    54d4:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    54db:	02 00 00 
    54de:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    54e5:	33 31 
    54e7:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    54ee:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    54f5:	00 00 00 
    54f8:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    54ff:	00 00 00 
    5502:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    5509:	00 00 00 
    550c:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    5513:	1f 00 00 
    5516:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    551d:	00 00 00 
    5520:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    5527:	00 00 00 
    552a:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    5531:	00 00 00 
    5534:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    553a:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    5540:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    5547:	02 00 00 
    554a:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    5551:	33 32 
    5553:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    555a:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    5561:	00 00 00 
    5564:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    556b:	00 00 00 
    556e:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    5575:	00 00 00 
    5578:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    557f:	00 00 00 
    5582:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    5589:	ff ff ff 
    558c:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    5593:	00 00 00 
    5596:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    559d:	00 00 00 
    55a0:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    55a6:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    55ac:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    55b3:	00 00 00 
    55b6:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    55bd:	33 33 
    55bf:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    55c6:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    55cd:	00 00 00 
    55d0:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    55d7:	00 00 00 
    55da:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    55e1:	00 00 00 
    55e4:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    55eb:	00 00 00 
    55ee:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    55f5:	ff ff ff 
    55f8:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    55ff:	00 00 00 
    5602:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    5609:	00 00 00 
    560c:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    5612:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    5618:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    561f:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    5622:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    5628:	5b                   	pop    %ebx
    5629:	5e                   	pop    %esi
    562a:	5f                   	pop    %edi
    562b:	5d                   	pop    %ebp
    562c:	c3                   	ret    

0000562d <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    562d:	55                   	push   %ebp
    562e:	89 e5                	mov    %esp,%ebp
    5630:	53                   	push   %ebx
    5631:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    5634:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    563b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    5642:	a1 50 ce 00 00       	mov    0xce50,%eax
    5647:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    564a:	8b 45 08             	mov    0x8(%ebp),%eax
    564d:	8b 40 20             	mov    0x20(%eax),%eax
    5650:	85 c0                	test   %eax,%eax
    5652:	75 0a                	jne    565e <huffman_decoder+0x31>
    5654:	b8 02 00 00 00       	mov    $0x2,%eax
    5659:	e9 0d 03 00 00       	jmp    596b <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    565e:	8b 45 08             	mov    0x8(%ebp),%eax
    5661:	8b 40 24             	mov    0x24(%eax),%eax
    5664:	85 c0                	test   %eax,%eax
    5666:	75 1d                	jne    5685 <huffman_decoder+0x58>
  {  *x = *y = 0;
    5668:	8b 45 10             	mov    0x10(%ebp),%eax
    566b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    5671:	8b 45 10             	mov    0x10(%ebp),%eax
    5674:	8b 10                	mov    (%eax),%edx
    5676:	8b 45 0c             	mov    0xc(%ebp),%eax
    5679:	89 10                	mov    %edx,(%eax)
     return 0;
    567b:	b8 00 00 00 00       	mov    $0x0,%eax
    5680:	e9 e6 02 00 00       	jmp    596b <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    5685:	8b 45 08             	mov    0x8(%ebp),%eax
    5688:	8b 40 20             	mov    0x20(%eax),%eax
    568b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    568e:	01 d2                	add    %edx,%edx
    5690:	01 d0                	add    %edx,%eax
    5692:	0f b6 00             	movzbl (%eax),%eax
    5695:	84 c0                	test   %al,%al
    5697:	75 46                	jne    56df <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    5699:	8b 45 08             	mov    0x8(%ebp),%eax
    569c:	8b 40 20             	mov    0x20(%eax),%eax
    569f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    56a2:	01 d2                	add    %edx,%edx
    56a4:	01 d0                	add    %edx,%eax
    56a6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    56aa:	c0 e8 04             	shr    $0x4,%al
    56ad:	0f b6 d0             	movzbl %al,%edx
    56b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    56b3:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    56b5:	8b 45 08             	mov    0x8(%ebp),%eax
    56b8:	8b 40 20             	mov    0x20(%eax),%eax
    56bb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    56be:	01 d2                	add    %edx,%edx
    56c0:	01 d0                	add    %edx,%eax
    56c2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    56c6:	0f b6 c0             	movzbl %al,%eax
    56c9:	83 e0 0f             	and    $0xf,%eax
    56cc:	89 c2                	mov    %eax,%edx
    56ce:	8b 45 10             	mov    0x10(%ebp),%eax
    56d1:	89 10                	mov    %edx,(%eax)

      error = 0;
    56d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    56da:	e9 af 00 00 00       	jmp    578e <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    56df:	e8 a7 e6 ff ff       	call   3d8b <hget1bit>
    56e4:	85 c0                	test   %eax,%eax
    56e6:	74 47                	je     572f <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    56e8:	eb 17                	jmp    5701 <huffman_decoder+0xd4>
    56ea:	8b 45 08             	mov    0x8(%ebp),%eax
    56ed:	8b 40 20             	mov    0x20(%eax),%eax
    56f0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    56f3:	01 d2                	add    %edx,%edx
    56f5:	01 d0                	add    %edx,%eax
    56f7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    56fb:	0f b6 c0             	movzbl %al,%eax
    56fe:	01 45 f0             	add    %eax,-0x10(%ebp)
    5701:	8b 45 08             	mov    0x8(%ebp),%eax
    5704:	8b 40 20             	mov    0x20(%eax),%eax
    5707:	8b 55 f0             	mov    -0x10(%ebp),%edx
    570a:	01 d2                	add    %edx,%edx
    570c:	01 d0                	add    %edx,%eax
    570e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    5712:	3c f9                	cmp    $0xf9,%al
    5714:	77 d4                	ja     56ea <huffman_decoder+0xbd>
      point += h->val[point][1];
    5716:	8b 45 08             	mov    0x8(%ebp),%eax
    5719:	8b 40 20             	mov    0x20(%eax),%eax
    571c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    571f:	01 d2                	add    %edx,%edx
    5721:	01 d0                	add    %edx,%eax
    5723:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    5727:	0f b6 c0             	movzbl %al,%eax
    572a:	01 45 f0             	add    %eax,-0x10(%ebp)
    572d:	eb 42                	jmp    5771 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    572f:	eb 16                	jmp    5747 <huffman_decoder+0x11a>
    5731:	8b 45 08             	mov    0x8(%ebp),%eax
    5734:	8b 40 20             	mov    0x20(%eax),%eax
    5737:	8b 55 f0             	mov    -0x10(%ebp),%edx
    573a:	01 d2                	add    %edx,%edx
    573c:	01 d0                	add    %edx,%eax
    573e:	0f b6 00             	movzbl (%eax),%eax
    5741:	0f b6 c0             	movzbl %al,%eax
    5744:	01 45 f0             	add    %eax,-0x10(%ebp)
    5747:	8b 45 08             	mov    0x8(%ebp),%eax
    574a:	8b 40 20             	mov    0x20(%eax),%eax
    574d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5750:	01 d2                	add    %edx,%edx
    5752:	01 d0                	add    %edx,%eax
    5754:	0f b6 00             	movzbl (%eax),%eax
    5757:	3c f9                	cmp    $0xf9,%al
    5759:	77 d6                	ja     5731 <huffman_decoder+0x104>
      point += h->val[point][0];
    575b:	8b 45 08             	mov    0x8(%ebp),%eax
    575e:	8b 40 20             	mov    0x20(%eax),%eax
    5761:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5764:	01 d2                	add    %edx,%edx
    5766:	01 d0                	add    %edx,%eax
    5768:	0f b6 00             	movzbl (%eax),%eax
    576b:	0f b6 c0             	movzbl %al,%eax
    576e:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    5771:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    5774:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5778:	0f 85 07 ff ff ff    	jne    5685 <huffman_decoder+0x58>
    577e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5781:	a1 c4 01 01 00       	mov    0x101c4,%eax
    5786:	39 c2                	cmp    %eax,%edx
    5788:	0f 82 f7 fe ff ff    	jb     5685 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    578e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5792:	74 24                	je     57b8 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    5794:	8b 45 08             	mov    0x8(%ebp),%eax
    5797:	8b 40 04             	mov    0x4(%eax),%eax
    579a:	83 e8 01             	sub    $0x1,%eax
    579d:	01 c0                	add    %eax,%eax
    579f:	89 c2                	mov    %eax,%edx
    57a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    57a4:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    57a6:	8b 45 08             	mov    0x8(%ebp),%eax
    57a9:	8b 40 08             	mov    0x8(%eax),%eax
    57ac:	83 e8 01             	sub    $0x1,%eax
    57af:	01 c0                	add    %eax,%eax
    57b1:	89 c2                	mov    %eax,%edx
    57b3:	8b 45 10             	mov    0x10(%ebp),%eax
    57b6:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    57b8:	8b 45 08             	mov    0x8(%ebp),%eax
    57bb:	0f b6 00             	movzbl (%eax),%eax
    57be:	3c 33                	cmp    $0x33,%al
    57c0:	0f 85 ec 00 00 00    	jne    58b2 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    57c6:	8b 45 08             	mov    0x8(%ebp),%eax
    57c9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    57cd:	3c 32                	cmp    $0x32,%al
    57cf:	74 0f                	je     57e0 <huffman_decoder+0x1b3>
    57d1:	8b 45 08             	mov    0x8(%ebp),%eax
    57d4:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    57d8:	3c 33                	cmp    $0x33,%al
    57da:	0f 85 d2 00 00 00    	jne    58b2 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    57e0:	8b 45 10             	mov    0x10(%ebp),%eax
    57e3:	8b 00                	mov    (%eax),%eax
    57e5:	c1 f8 03             	sar    $0x3,%eax
    57e8:	83 e0 01             	and    $0x1,%eax
    57eb:	89 c2                	mov    %eax,%edx
    57ed:	8b 45 14             	mov    0x14(%ebp),%eax
    57f0:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    57f2:	8b 45 10             	mov    0x10(%ebp),%eax
    57f5:	8b 00                	mov    (%eax),%eax
    57f7:	c1 f8 02             	sar    $0x2,%eax
    57fa:	83 e0 01             	and    $0x1,%eax
    57fd:	89 c2                	mov    %eax,%edx
    57ff:	8b 45 18             	mov    0x18(%ebp),%eax
    5802:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    5804:	8b 45 10             	mov    0x10(%ebp),%eax
    5807:	8b 00                	mov    (%eax),%eax
    5809:	d1 f8                	sar    %eax
    580b:	83 e0 01             	and    $0x1,%eax
    580e:	89 c2                	mov    %eax,%edx
    5810:	8b 45 0c             	mov    0xc(%ebp),%eax
    5813:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    5815:	8b 45 10             	mov    0x10(%ebp),%eax
    5818:	8b 00                	mov    (%eax),%eax
    581a:	83 e0 01             	and    $0x1,%eax
    581d:	89 c2                	mov    %eax,%edx
    581f:	8b 45 10             	mov    0x10(%ebp),%eax
    5822:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    5824:	8b 45 14             	mov    0x14(%ebp),%eax
    5827:	8b 00                	mov    (%eax),%eax
    5829:	85 c0                	test   %eax,%eax
    582b:	74 18                	je     5845 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    582d:	e8 59 e5 ff ff       	call   3d8b <hget1bit>
    5832:	83 f8 01             	cmp    $0x1,%eax
    5835:	75 0e                	jne    5845 <huffman_decoder+0x218>
    5837:	8b 45 14             	mov    0x14(%ebp),%eax
    583a:	8b 00                	mov    (%eax),%eax
    583c:	f7 d8                	neg    %eax
    583e:	89 c2                	mov    %eax,%edx
    5840:	8b 45 14             	mov    0x14(%ebp),%eax
    5843:	89 10                	mov    %edx,(%eax)
     if (*w)
    5845:	8b 45 18             	mov    0x18(%ebp),%eax
    5848:	8b 00                	mov    (%eax),%eax
    584a:	85 c0                	test   %eax,%eax
    584c:	74 18                	je     5866 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    584e:	e8 38 e5 ff ff       	call   3d8b <hget1bit>
    5853:	83 f8 01             	cmp    $0x1,%eax
    5856:	75 0e                	jne    5866 <huffman_decoder+0x239>
    5858:	8b 45 18             	mov    0x18(%ebp),%eax
    585b:	8b 00                	mov    (%eax),%eax
    585d:	f7 d8                	neg    %eax
    585f:	89 c2                	mov    %eax,%edx
    5861:	8b 45 18             	mov    0x18(%ebp),%eax
    5864:	89 10                	mov    %edx,(%eax)
     if (*x)
    5866:	8b 45 0c             	mov    0xc(%ebp),%eax
    5869:	8b 00                	mov    (%eax),%eax
    586b:	85 c0                	test   %eax,%eax
    586d:	74 18                	je     5887 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    586f:	e8 17 e5 ff ff       	call   3d8b <hget1bit>
    5874:	83 f8 01             	cmp    $0x1,%eax
    5877:	75 0e                	jne    5887 <huffman_decoder+0x25a>
    5879:	8b 45 0c             	mov    0xc(%ebp),%eax
    587c:	8b 00                	mov    (%eax),%eax
    587e:	f7 d8                	neg    %eax
    5880:	89 c2                	mov    %eax,%edx
    5882:	8b 45 0c             	mov    0xc(%ebp),%eax
    5885:	89 10                	mov    %edx,(%eax)
     if (*y)
    5887:	8b 45 10             	mov    0x10(%ebp),%eax
    588a:	8b 00                	mov    (%eax),%eax
    588c:	85 c0                	test   %eax,%eax
    588e:	74 1d                	je     58ad <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    5890:	e8 f6 e4 ff ff       	call   3d8b <hget1bit>
    5895:	83 f8 01             	cmp    $0x1,%eax
    5898:	75 13                	jne    58ad <huffman_decoder+0x280>
    589a:	8b 45 10             	mov    0x10(%ebp),%eax
    589d:	8b 00                	mov    (%eax),%eax
    589f:	f7 d8                	neg    %eax
    58a1:	89 c2                	mov    %eax,%edx
    58a3:	8b 45 10             	mov    0x10(%ebp),%eax
    58a6:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    58a8:	e9 bb 00 00 00       	jmp    5968 <huffman_decoder+0x33b>
    58ad:	e9 b6 00 00 00       	jmp    5968 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    58b2:	8b 45 08             	mov    0x8(%ebp),%eax
    58b5:	8b 40 0c             	mov    0xc(%eax),%eax
    58b8:	85 c0                	test   %eax,%eax
    58ba:	74 30                	je     58ec <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    58bc:	8b 45 08             	mov    0x8(%ebp),%eax
    58bf:	8b 40 04             	mov    0x4(%eax),%eax
    58c2:	8d 50 ff             	lea    -0x1(%eax),%edx
    58c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    58c8:	8b 00                	mov    (%eax),%eax
    58ca:	39 c2                	cmp    %eax,%edx
    58cc:	75 1e                	jne    58ec <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    58ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    58d1:	8b 00                	mov    (%eax),%eax
    58d3:	89 c3                	mov    %eax,%ebx
    58d5:	8b 45 08             	mov    0x8(%ebp),%eax
    58d8:	8b 40 0c             	mov    0xc(%eax),%eax
    58db:	89 04 24             	mov    %eax,(%esp)
    58de:	e8 8d e4 ff ff       	call   3d70 <hgetbits>
    58e3:	01 d8                	add    %ebx,%eax
    58e5:	89 c2                	mov    %eax,%edx
    58e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    58ea:	89 10                	mov    %edx,(%eax)
     if (*x)
    58ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    58ef:	8b 00                	mov    (%eax),%eax
    58f1:	85 c0                	test   %eax,%eax
    58f3:	74 18                	je     590d <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    58f5:	e8 91 e4 ff ff       	call   3d8b <hget1bit>
    58fa:	83 f8 01             	cmp    $0x1,%eax
    58fd:	75 0e                	jne    590d <huffman_decoder+0x2e0>
    58ff:	8b 45 0c             	mov    0xc(%ebp),%eax
    5902:	8b 00                	mov    (%eax),%eax
    5904:	f7 d8                	neg    %eax
    5906:	89 c2                	mov    %eax,%edx
    5908:	8b 45 0c             	mov    0xc(%ebp),%eax
    590b:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    590d:	8b 45 08             	mov    0x8(%ebp),%eax
    5910:	8b 40 0c             	mov    0xc(%eax),%eax
    5913:	85 c0                	test   %eax,%eax
    5915:	74 30                	je     5947 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    5917:	8b 45 08             	mov    0x8(%ebp),%eax
    591a:	8b 40 08             	mov    0x8(%eax),%eax
    591d:	8d 50 ff             	lea    -0x1(%eax),%edx
    5920:	8b 45 10             	mov    0x10(%ebp),%eax
    5923:	8b 00                	mov    (%eax),%eax
    5925:	39 c2                	cmp    %eax,%edx
    5927:	75 1e                	jne    5947 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    5929:	8b 45 10             	mov    0x10(%ebp),%eax
    592c:	8b 00                	mov    (%eax),%eax
    592e:	89 c3                	mov    %eax,%ebx
    5930:	8b 45 08             	mov    0x8(%ebp),%eax
    5933:	8b 40 0c             	mov    0xc(%eax),%eax
    5936:	89 04 24             	mov    %eax,(%esp)
    5939:	e8 32 e4 ff ff       	call   3d70 <hgetbits>
    593e:	01 d8                	add    %ebx,%eax
    5940:	89 c2                	mov    %eax,%edx
    5942:	8b 45 10             	mov    0x10(%ebp),%eax
    5945:	89 10                	mov    %edx,(%eax)
     if (*y)
    5947:	8b 45 10             	mov    0x10(%ebp),%eax
    594a:	8b 00                	mov    (%eax),%eax
    594c:	85 c0                	test   %eax,%eax
    594e:	74 18                	je     5968 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    5950:	e8 36 e4 ff ff       	call   3d8b <hget1bit>
    5955:	83 f8 01             	cmp    $0x1,%eax
    5958:	75 0e                	jne    5968 <huffman_decoder+0x33b>
    595a:	8b 45 10             	mov    0x10(%ebp),%eax
    595d:	8b 00                	mov    (%eax),%eax
    595f:	f7 d8                	neg    %eax
    5961:	89 c2                	mov    %eax,%edx
    5963:	8b 45 10             	mov    0x10(%ebp),%eax
    5966:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    5968:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    596b:	83 c4 24             	add    $0x24,%esp
    596e:	5b                   	pop    %ebx
    596f:	5d                   	pop    %ebp
    5970:	c3                   	ret    

00005971 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    5971:	55                   	push   %ebp
    5972:	89 e5                	mov    %esp,%ebp
    5974:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    5977:	8b 45 0c             	mov    0xc(%ebp),%eax
    597a:	8b 00                	mov    (%eax),%eax
    597c:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    597f:	8b 45 08             	mov    0x8(%ebp),%eax
    5982:	89 04 24             	mov    %eax,(%esp)
    5985:	e8 6c df ff ff       	call   38f6 <get1bit>
    598a:	89 c2                	mov    %eax,%edx
    598c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    598f:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    5991:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5998:	00 
    5999:	8b 45 08             	mov    0x8(%ebp),%eax
    599c:	89 04 24             	mov    %eax,(%esp)
    599f:	e8 64 e0 ff ff       	call   3a08 <getbits>
    59a4:	ba 04 00 00 00       	mov    $0x4,%edx
    59a9:	29 c2                	sub    %eax,%edx
    59ab:	89 d0                	mov    %edx,%eax
    59ad:	89 c2                	mov    %eax,%edx
    59af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    59b2:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    59b5:	8b 45 08             	mov    0x8(%ebp),%eax
    59b8:	89 04 24             	mov    %eax,(%esp)
    59bb:	e8 36 df ff ff       	call   38f6 <get1bit>
    59c0:	85 c0                	test   %eax,%eax
    59c2:	0f 94 c0             	sete   %al
    59c5:	0f b6 d0             	movzbl %al,%edx
    59c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    59cb:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    59ce:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    59d5:	00 
    59d6:	8b 45 08             	mov    0x8(%ebp),%eax
    59d9:	89 04 24             	mov    %eax,(%esp)
    59dc:	e8 27 e0 ff ff       	call   3a08 <getbits>
    59e1:	89 c2                	mov    %eax,%edx
    59e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    59e6:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    59e9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    59f0:	00 
    59f1:	8b 45 08             	mov    0x8(%ebp),%eax
    59f4:	89 04 24             	mov    %eax,(%esp)
    59f7:	e8 0c e0 ff ff       	call   3a08 <getbits>
    59fc:	89 c2                	mov    %eax,%edx
    59fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a01:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    5a04:	8b 45 08             	mov    0x8(%ebp),%eax
    5a07:	89 04 24             	mov    %eax,(%esp)
    5a0a:	e8 e7 de ff ff       	call   38f6 <get1bit>
    5a0f:	89 c2                	mov    %eax,%edx
    5a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a14:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    5a17:	8b 45 08             	mov    0x8(%ebp),%eax
    5a1a:	89 04 24             	mov    %eax,(%esp)
    5a1d:	e8 d4 de ff ff       	call   38f6 <get1bit>
    5a22:	89 c2                	mov    %eax,%edx
    5a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a27:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    5a2a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5a31:	00 
    5a32:	8b 45 08             	mov    0x8(%ebp),%eax
    5a35:	89 04 24             	mov    %eax,(%esp)
    5a38:	e8 cb df ff ff       	call   3a08 <getbits>
    5a3d:	89 c2                	mov    %eax,%edx
    5a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a42:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    5a45:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5a4c:	00 
    5a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    5a50:	89 04 24             	mov    %eax,(%esp)
    5a53:	e8 b0 df ff ff       	call   3a08 <getbits>
    5a58:	89 c2                	mov    %eax,%edx
    5a5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a5d:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    5a60:	8b 45 08             	mov    0x8(%ebp),%eax
    5a63:	89 04 24             	mov    %eax,(%esp)
    5a66:	e8 8b de ff ff       	call   38f6 <get1bit>
    5a6b:	89 c2                	mov    %eax,%edx
    5a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a70:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    5a73:	8b 45 08             	mov    0x8(%ebp),%eax
    5a76:	89 04 24             	mov    %eax,(%esp)
    5a79:	e8 78 de ff ff       	call   38f6 <get1bit>
    5a7e:	89 c2                	mov    %eax,%edx
    5a80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a83:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    5a86:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5a8d:	00 
    5a8e:	8b 45 08             	mov    0x8(%ebp),%eax
    5a91:	89 04 24             	mov    %eax,(%esp)
    5a94:	e8 6f df ff ff       	call   3a08 <getbits>
    5a99:	89 c2                	mov    %eax,%edx
    5a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a9e:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    5aa1:	c9                   	leave  
    5aa2:	c3                   	ret    

00005aa3 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    5aa3:	55                   	push   %ebp
    5aa4:	89 e5                	mov    %esp,%ebp
    5aa6:	56                   	push   %esi
    5aa7:	53                   	push   %ebx
    5aa8:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    5aab:	8b 45 10             	mov    0x10(%ebp),%eax
    5aae:	8b 40 08             	mov    0x8(%eax),%eax
    5ab1:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    5ab4:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    5abb:	00 
    5abc:	8b 45 08             	mov    0x8(%ebp),%eax
    5abf:	89 04 24             	mov    %eax,(%esp)
    5ac2:	e8 41 df ff ff       	call   3a08 <getbits>
    5ac7:	8b 55 0c             	mov    0xc(%ebp),%edx
    5aca:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    5acc:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    5ad0:	75 1b                	jne    5aed <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    5ad2:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5ad9:	00 
    5ada:	8b 45 08             	mov    0x8(%ebp),%eax
    5add:	89 04 24             	mov    %eax,(%esp)
    5ae0:	e8 23 df ff ff       	call   3a08 <getbits>
    5ae5:	8b 55 0c             	mov    0xc(%ebp),%edx
    5ae8:	89 42 04             	mov    %eax,0x4(%edx)
    5aeb:	eb 19                	jmp    5b06 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    5aed:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5af4:	00 
    5af5:	8b 45 08             	mov    0x8(%ebp),%eax
    5af8:	89 04 24             	mov    %eax,(%esp)
    5afb:	e8 08 df ff ff       	call   3a08 <getbits>
    5b00:	8b 55 0c             	mov    0xc(%ebp),%edx
    5b03:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    5b06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5b0d:	eb 3d                	jmp    5b4c <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    5b0f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5b16:	eb 2a                	jmp    5b42 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    5b18:	8b 45 08             	mov    0x8(%ebp),%eax
    5b1b:	89 04 24             	mov    %eax,(%esp)
    5b1e:	e8 d3 dd ff ff       	call   38f6 <get1bit>
    5b23:	89 c1                	mov    %eax,%ecx
    5b25:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5b28:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5b2b:	89 d0                	mov    %edx,%eax
    5b2d:	c1 e0 02             	shl    $0x2,%eax
    5b30:	01 d0                	add    %edx,%eax
    5b32:	c1 e0 03             	shl    $0x3,%eax
    5b35:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5b38:	01 d0                	add    %edx,%eax
    5b3a:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    5b3e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5b42:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    5b46:	7e d0                	jle    5b18 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    5b48:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b4f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    5b52:	7c bb                	jl     5b0f <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    5b54:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5b5b:	e9 c5 05 00 00       	jmp    6125 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    5b60:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5b67:	e9 a9 05 00 00       	jmp    6115 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    5b6c:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    5b73:	00 
    5b74:	8b 45 08             	mov    0x8(%ebp),%eax
    5b77:	89 04 24             	mov    %eax,(%esp)
    5b7a:	e8 89 de ff ff       	call   3a08 <getbits>
    5b7f:	89 c3                	mov    %eax,%ebx
    5b81:	8b 75 0c             	mov    0xc(%ebp),%esi
    5b84:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b87:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5b8a:	89 c2                	mov    %eax,%edx
    5b8c:	c1 e2 03             	shl    $0x3,%edx
    5b8f:	01 c2                	add    %eax,%edx
    5b91:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5b98:	89 c2                	mov    %eax,%edx
    5b9a:	89 c8                	mov    %ecx,%eax
    5b9c:	c1 e0 02             	shl    $0x2,%eax
    5b9f:	01 c8                	add    %ecx,%eax
    5ba1:	c1 e0 05             	shl    $0x5,%eax
    5ba4:	01 d0                	add    %edx,%eax
    5ba6:	01 f0                	add    %esi,%eax
    5ba8:	83 c0 18             	add    $0x18,%eax
    5bab:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    5bad:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    5bb4:	00 
    5bb5:	8b 45 08             	mov    0x8(%ebp),%eax
    5bb8:	89 04 24             	mov    %eax,(%esp)
    5bbb:	e8 48 de ff ff       	call   3a08 <getbits>
    5bc0:	89 c3                	mov    %eax,%ebx
    5bc2:	8b 75 0c             	mov    0xc(%ebp),%esi
    5bc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5bc8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5bcb:	89 c2                	mov    %eax,%edx
    5bcd:	c1 e2 03             	shl    $0x3,%edx
    5bd0:	01 c2                	add    %eax,%edx
    5bd2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5bd9:	89 c2                	mov    %eax,%edx
    5bdb:	89 c8                	mov    %ecx,%eax
    5bdd:	c1 e0 02             	shl    $0x2,%eax
    5be0:	01 c8                	add    %ecx,%eax
    5be2:	c1 e0 05             	shl    $0x5,%eax
    5be5:	01 d0                	add    %edx,%eax
    5be7:	01 f0                	add    %esi,%eax
    5be9:	83 c0 1c             	add    $0x1c,%eax
    5bec:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    5bee:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    5bf5:	00 
    5bf6:	8b 45 08             	mov    0x8(%ebp),%eax
    5bf9:	89 04 24             	mov    %eax,(%esp)
    5bfc:	e8 07 de ff ff       	call   3a08 <getbits>
    5c01:	89 c3                	mov    %eax,%ebx
    5c03:	8b 75 0c             	mov    0xc(%ebp),%esi
    5c06:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c09:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5c0c:	89 c2                	mov    %eax,%edx
    5c0e:	c1 e2 03             	shl    $0x3,%edx
    5c11:	01 c2                	add    %eax,%edx
    5c13:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c1a:	89 c2                	mov    %eax,%edx
    5c1c:	89 c8                	mov    %ecx,%eax
    5c1e:	c1 e0 02             	shl    $0x2,%eax
    5c21:	01 c8                	add    %ecx,%eax
    5c23:	c1 e0 05             	shl    $0x5,%eax
    5c26:	01 d0                	add    %edx,%eax
    5c28:	01 f0                	add    %esi,%eax
    5c2a:	83 c0 20             	add    $0x20,%eax
    5c2d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    5c2f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5c36:	00 
    5c37:	8b 45 08             	mov    0x8(%ebp),%eax
    5c3a:	89 04 24             	mov    %eax,(%esp)
    5c3d:	e8 c6 dd ff ff       	call   3a08 <getbits>
    5c42:	89 c3                	mov    %eax,%ebx
    5c44:	8b 75 0c             	mov    0xc(%ebp),%esi
    5c47:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c4a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5c4d:	89 c2                	mov    %eax,%edx
    5c4f:	c1 e2 03             	shl    $0x3,%edx
    5c52:	01 c2                	add    %eax,%edx
    5c54:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c5b:	89 c2                	mov    %eax,%edx
    5c5d:	89 c8                	mov    %ecx,%eax
    5c5f:	c1 e0 02             	shl    $0x2,%eax
    5c62:	01 c8                	add    %ecx,%eax
    5c64:	c1 e0 05             	shl    $0x5,%eax
    5c67:	01 d0                	add    %edx,%eax
    5c69:	01 f0                	add    %esi,%eax
    5c6b:	83 c0 24             	add    $0x24,%eax
    5c6e:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    5c70:	8b 45 08             	mov    0x8(%ebp),%eax
    5c73:	89 04 24             	mov    %eax,(%esp)
    5c76:	e8 7b dc ff ff       	call   38f6 <get1bit>
    5c7b:	89 c3                	mov    %eax,%ebx
    5c7d:	8b 75 0c             	mov    0xc(%ebp),%esi
    5c80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c83:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5c86:	89 c2                	mov    %eax,%edx
    5c88:	c1 e2 03             	shl    $0x3,%edx
    5c8b:	01 c2                	add    %eax,%edx
    5c8d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c94:	89 c2                	mov    %eax,%edx
    5c96:	89 c8                	mov    %ecx,%eax
    5c98:	c1 e0 02             	shl    $0x2,%eax
    5c9b:	01 c8                	add    %ecx,%eax
    5c9d:	c1 e0 05             	shl    $0x5,%eax
    5ca0:	01 d0                	add    %edx,%eax
    5ca2:	01 f0                	add    %esi,%eax
    5ca4:	83 c0 28             	add    $0x28,%eax
    5ca7:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    5ca9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5cac:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5caf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5cb2:	89 c2                	mov    %eax,%edx
    5cb4:	c1 e2 03             	shl    $0x3,%edx
    5cb7:	01 c2                	add    %eax,%edx
    5cb9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5cc0:	89 c2                	mov    %eax,%edx
    5cc2:	89 c8                	mov    %ecx,%eax
    5cc4:	c1 e0 02             	shl    $0x2,%eax
    5cc7:	01 c8                	add    %ecx,%eax
    5cc9:	c1 e0 05             	shl    $0x5,%eax
    5ccc:	01 d0                	add    %edx,%eax
    5cce:	01 d8                	add    %ebx,%eax
    5cd0:	83 c0 28             	add    $0x28,%eax
    5cd3:	8b 00                	mov    (%eax),%eax
    5cd5:	85 c0                	test   %eax,%eax
    5cd7:	0f 84 82 02 00 00    	je     5f5f <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    5cdd:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5ce4:	00 
    5ce5:	8b 45 08             	mov    0x8(%ebp),%eax
    5ce8:	89 04 24             	mov    %eax,(%esp)
    5ceb:	e8 18 dd ff ff       	call   3a08 <getbits>
    5cf0:	89 c3                	mov    %eax,%ebx
    5cf2:	8b 75 0c             	mov    0xc(%ebp),%esi
    5cf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5cf8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5cfb:	89 c2                	mov    %eax,%edx
    5cfd:	c1 e2 03             	shl    $0x3,%edx
    5d00:	01 c2                	add    %eax,%edx
    5d02:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d09:	89 c2                	mov    %eax,%edx
    5d0b:	89 c8                	mov    %ecx,%eax
    5d0d:	c1 e0 02             	shl    $0x2,%eax
    5d10:	01 c8                	add    %ecx,%eax
    5d12:	c1 e0 05             	shl    $0x5,%eax
    5d15:	01 d0                	add    %edx,%eax
    5d17:	01 f0                	add    %esi,%eax
    5d19:	83 c0 2c             	add    $0x2c,%eax
    5d1c:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    5d1e:	8b 45 08             	mov    0x8(%ebp),%eax
    5d21:	89 04 24             	mov    %eax,(%esp)
    5d24:	e8 cd db ff ff       	call   38f6 <get1bit>
    5d29:	89 c3                	mov    %eax,%ebx
    5d2b:	8b 75 0c             	mov    0xc(%ebp),%esi
    5d2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5d31:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5d34:	89 c2                	mov    %eax,%edx
    5d36:	c1 e2 03             	shl    $0x3,%edx
    5d39:	01 c2                	add    %eax,%edx
    5d3b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d42:	89 c2                	mov    %eax,%edx
    5d44:	89 c8                	mov    %ecx,%eax
    5d46:	c1 e0 02             	shl    $0x2,%eax
    5d49:	01 c8                	add    %ecx,%eax
    5d4b:	c1 e0 05             	shl    $0x5,%eax
    5d4e:	01 d0                	add    %edx,%eax
    5d50:	01 f0                	add    %esi,%eax
    5d52:	83 c0 30             	add    $0x30,%eax
    5d55:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    5d57:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5d5e:	eb 46                	jmp    5da6 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    5d60:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5d67:	00 
    5d68:	8b 45 08             	mov    0x8(%ebp),%eax
    5d6b:	89 04 24             	mov    %eax,(%esp)
    5d6e:	e8 95 dc ff ff       	call   3a08 <getbits>
    5d73:	89 c3                	mov    %eax,%ebx
    5d75:	8b 75 0c             	mov    0xc(%ebp),%esi
    5d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5d7b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5d7e:	89 c2                	mov    %eax,%edx
    5d80:	c1 e2 03             	shl    $0x3,%edx
    5d83:	01 c2                	add    %eax,%edx
    5d85:	8d 04 12             	lea    (%edx,%edx,1),%eax
    5d88:	89 c2                	mov    %eax,%edx
    5d8a:	89 c8                	mov    %ecx,%eax
    5d8c:	c1 e0 02             	shl    $0x2,%eax
    5d8f:	01 c8                	add    %ecx,%eax
    5d91:	c1 e0 03             	shl    $0x3,%eax
    5d94:	01 c2                	add    %eax,%edx
    5d96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5d99:	01 d0                	add    %edx,%eax
    5d9b:	83 c0 08             	add    $0x8,%eax
    5d9e:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    5da2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5da6:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    5daa:	7e b4                	jle    5d60 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    5dac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5db3:	eb 46                	jmp    5dfb <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    5db5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5dbc:	00 
    5dbd:	8b 45 08             	mov    0x8(%ebp),%eax
    5dc0:	89 04 24             	mov    %eax,(%esp)
    5dc3:	e8 40 dc ff ff       	call   3a08 <getbits>
    5dc8:	89 c3                	mov    %eax,%ebx
    5dca:	8b 75 0c             	mov    0xc(%ebp),%esi
    5dcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5dd0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5dd3:	89 c2                	mov    %eax,%edx
    5dd5:	c1 e2 03             	shl    $0x3,%edx
    5dd8:	01 c2                	add    %eax,%edx
    5dda:	8d 04 12             	lea    (%edx,%edx,1),%eax
    5ddd:	89 c2                	mov    %eax,%edx
    5ddf:	89 c8                	mov    %ecx,%eax
    5de1:	c1 e0 02             	shl    $0x2,%eax
    5de4:	01 c8                	add    %ecx,%eax
    5de6:	c1 e0 03             	shl    $0x3,%eax
    5de9:	01 c2                	add    %eax,%edx
    5deb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5dee:	01 d0                	add    %edx,%eax
    5df0:	83 c0 0c             	add    $0xc,%eax
    5df3:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    5df7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5dfb:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5dff:	7e b4                	jle    5db5 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    5e01:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e07:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5e0a:	89 c2                	mov    %eax,%edx
    5e0c:	c1 e2 03             	shl    $0x3,%edx
    5e0f:	01 c2                	add    %eax,%edx
    5e11:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e18:	89 c2                	mov    %eax,%edx
    5e1a:	89 c8                	mov    %ecx,%eax
    5e1c:	c1 e0 02             	shl    $0x2,%eax
    5e1f:	01 c8                	add    %ecx,%eax
    5e21:	c1 e0 05             	shl    $0x5,%eax
    5e24:	01 d0                	add    %edx,%eax
    5e26:	01 d8                	add    %ebx,%eax
    5e28:	83 c0 2c             	add    $0x2c,%eax
    5e2b:	8b 00                	mov    (%eax),%eax
    5e2d:	85 c0                	test   %eax,%eax
    5e2f:	75 05                	jne    5e36 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    5e31:	e8 84 cb ff ff       	call   29ba <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    5e36:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e3c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5e3f:	89 c2                	mov    %eax,%edx
    5e41:	c1 e2 03             	shl    $0x3,%edx
    5e44:	01 c2                	add    %eax,%edx
    5e46:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e4d:	89 c2                	mov    %eax,%edx
    5e4f:	89 c8                	mov    %ecx,%eax
    5e51:	c1 e0 02             	shl    $0x2,%eax
    5e54:	01 c8                	add    %ecx,%eax
    5e56:	c1 e0 05             	shl    $0x5,%eax
    5e59:	01 d0                	add    %edx,%eax
    5e5b:	01 d8                	add    %ebx,%eax
    5e5d:	83 c0 2c             	add    $0x2c,%eax
    5e60:	8b 00                	mov    (%eax),%eax
    5e62:	83 f8 02             	cmp    $0x2,%eax
    5e65:	75 62                	jne    5ec9 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    5e67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e6d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5e70:	89 c2                	mov    %eax,%edx
    5e72:	c1 e2 03             	shl    $0x3,%edx
    5e75:	01 c2                	add    %eax,%edx
    5e77:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e7e:	89 c2                	mov    %eax,%edx
    5e80:	89 c8                	mov    %ecx,%eax
    5e82:	c1 e0 02             	shl    $0x2,%eax
    5e85:	01 c8                	add    %ecx,%eax
    5e87:	c1 e0 05             	shl    $0x5,%eax
    5e8a:	01 d0                	add    %edx,%eax
    5e8c:	01 d8                	add    %ebx,%eax
    5e8e:	83 c0 30             	add    $0x30,%eax
    5e91:	8b 00                	mov    (%eax),%eax
    5e93:	85 c0                	test   %eax,%eax
    5e95:	75 32                	jne    5ec9 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    5e97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5e9d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5ea0:	89 c2                	mov    %eax,%edx
    5ea2:	c1 e2 03             	shl    $0x3,%edx
    5ea5:	01 c2                	add    %eax,%edx
    5ea7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5eae:	89 c2                	mov    %eax,%edx
    5eb0:	89 c8                	mov    %ecx,%eax
    5eb2:	c1 e0 02             	shl    $0x2,%eax
    5eb5:	01 c8                	add    %ecx,%eax
    5eb7:	c1 e0 05             	shl    $0x5,%eax
    5eba:	01 d0                	add    %edx,%eax
    5ebc:	01 d8                	add    %ebx,%eax
    5ebe:	83 c0 4c             	add    $0x4c,%eax
    5ec1:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    5ec7:	eb 30                	jmp    5ef9 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    5ec9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5ecc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ecf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5ed2:	89 c2                	mov    %eax,%edx
    5ed4:	c1 e2 03             	shl    $0x3,%edx
    5ed7:	01 c2                	add    %eax,%edx
    5ed9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5ee0:	89 c2                	mov    %eax,%edx
    5ee2:	89 c8                	mov    %ecx,%eax
    5ee4:	c1 e0 02             	shl    $0x2,%eax
    5ee7:	01 c8                	add    %ecx,%eax
    5ee9:	c1 e0 05             	shl    $0x5,%eax
    5eec:	01 d0                	add    %edx,%eax
    5eee:	01 d8                	add    %ebx,%eax
    5ef0:	83 c0 4c             	add    $0x4c,%eax
    5ef3:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    5ef9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5efc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5eff:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5f02:	89 c2                	mov    %eax,%edx
    5f04:	c1 e2 03             	shl    $0x3,%edx
    5f07:	01 c2                	add    %eax,%edx
    5f09:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5f10:	89 c2                	mov    %eax,%edx
    5f12:	89 c8                	mov    %ecx,%eax
    5f14:	c1 e0 02             	shl    $0x2,%eax
    5f17:	01 c8                	add    %ecx,%eax
    5f19:	c1 e0 05             	shl    $0x5,%eax
    5f1c:	01 d0                	add    %edx,%eax
    5f1e:	01 d8                	add    %ebx,%eax
    5f20:	83 c0 4c             	add    $0x4c,%eax
    5f23:	8b 00                	mov    (%eax),%eax
    5f25:	ba 14 00 00 00       	mov    $0x14,%edx
    5f2a:	89 d3                	mov    %edx,%ebx
    5f2c:	29 c3                	sub    %eax,%ebx
    5f2e:	8b 75 0c             	mov    0xc(%ebp),%esi
    5f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f34:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5f37:	89 c2                	mov    %eax,%edx
    5f39:	c1 e2 03             	shl    $0x3,%edx
    5f3c:	01 c2                	add    %eax,%edx
    5f3e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5f45:	89 c2                	mov    %eax,%edx
    5f47:	89 c8                	mov    %ecx,%eax
    5f49:	c1 e0 02             	shl    $0x2,%eax
    5f4c:	01 c8                	add    %ecx,%eax
    5f4e:	c1 e0 05             	shl    $0x5,%eax
    5f51:	01 d0                	add    %edx,%eax
    5f53:	01 f0                	add    %esi,%eax
    5f55:	83 c0 50             	add    $0x50,%eax
    5f58:	89 18                	mov    %ebx,(%eax)
    5f5a:	e9 07 01 00 00       	jmp    6066 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    5f5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5f66:	eb 46                	jmp    5fae <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    5f68:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5f6f:	00 
    5f70:	8b 45 08             	mov    0x8(%ebp),%eax
    5f73:	89 04 24             	mov    %eax,(%esp)
    5f76:	e8 8d da ff ff       	call   3a08 <getbits>
    5f7b:	89 c3                	mov    %eax,%ebx
    5f7d:	8b 75 0c             	mov    0xc(%ebp),%esi
    5f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5f83:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5f86:	89 c2                	mov    %eax,%edx
    5f88:	c1 e2 03             	shl    $0x3,%edx
    5f8b:	01 c2                	add    %eax,%edx
    5f8d:	8d 04 12             	lea    (%edx,%edx,1),%eax
    5f90:	89 c2                	mov    %eax,%edx
    5f92:	89 c8                	mov    %ecx,%eax
    5f94:	c1 e0 02             	shl    $0x2,%eax
    5f97:	01 c8                	add    %ecx,%eax
    5f99:	c1 e0 03             	shl    $0x3,%eax
    5f9c:	01 c2                	add    %eax,%edx
    5f9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5fa1:	01 d0                	add    %edx,%eax
    5fa3:	83 c0 08             	add    $0x8,%eax
    5fa6:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    5faa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5fae:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5fb2:	7e b4                	jle    5f68 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    5fb4:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5fbb:	00 
    5fbc:	8b 45 08             	mov    0x8(%ebp),%eax
    5fbf:	89 04 24             	mov    %eax,(%esp)
    5fc2:	e8 41 da ff ff       	call   3a08 <getbits>
    5fc7:	89 c3                	mov    %eax,%ebx
    5fc9:	8b 75 0c             	mov    0xc(%ebp),%esi
    5fcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5fcf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5fd2:	89 c2                	mov    %eax,%edx
    5fd4:	c1 e2 03             	shl    $0x3,%edx
    5fd7:	01 c2                	add    %eax,%edx
    5fd9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5fe0:	89 c2                	mov    %eax,%edx
    5fe2:	89 c8                	mov    %ecx,%eax
    5fe4:	c1 e0 02             	shl    $0x2,%eax
    5fe7:	01 c8                	add    %ecx,%eax
    5fe9:	c1 e0 05             	shl    $0x5,%eax
    5fec:	01 d0                	add    %edx,%eax
    5fee:	01 f0                	add    %esi,%eax
    5ff0:	83 c0 4c             	add    $0x4c,%eax
    5ff3:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    5ff5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5ffc:	00 
    5ffd:	8b 45 08             	mov    0x8(%ebp),%eax
    6000:	89 04 24             	mov    %eax,(%esp)
    6003:	e8 00 da ff ff       	call   3a08 <getbits>
    6008:	89 c3                	mov    %eax,%ebx
    600a:	8b 75 0c             	mov    0xc(%ebp),%esi
    600d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6010:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6013:	89 c2                	mov    %eax,%edx
    6015:	c1 e2 03             	shl    $0x3,%edx
    6018:	01 c2                	add    %eax,%edx
    601a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6021:	89 c2                	mov    %eax,%edx
    6023:	89 c8                	mov    %ecx,%eax
    6025:	c1 e0 02             	shl    $0x2,%eax
    6028:	01 c8                	add    %ecx,%eax
    602a:	c1 e0 05             	shl    $0x5,%eax
    602d:	01 d0                	add    %edx,%eax
    602f:	01 f0                	add    %esi,%eax
    6031:	83 c0 50             	add    $0x50,%eax
    6034:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    6036:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6039:	8b 45 f0             	mov    -0x10(%ebp),%eax
    603c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    603f:	89 c2                	mov    %eax,%edx
    6041:	c1 e2 03             	shl    $0x3,%edx
    6044:	01 c2                	add    %eax,%edx
    6046:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    604d:	89 c2                	mov    %eax,%edx
    604f:	89 c8                	mov    %ecx,%eax
    6051:	c1 e0 02             	shl    $0x2,%eax
    6054:	01 c8                	add    %ecx,%eax
    6056:	c1 e0 05             	shl    $0x5,%eax
    6059:	01 d0                	add    %edx,%eax
    605b:	01 d8                	add    %ebx,%eax
    605d:	83 c0 2c             	add    $0x2c,%eax
    6060:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    6066:	8b 45 08             	mov    0x8(%ebp),%eax
    6069:	89 04 24             	mov    %eax,(%esp)
    606c:	e8 85 d8 ff ff       	call   38f6 <get1bit>
    6071:	89 c3                	mov    %eax,%ebx
    6073:	8b 75 0c             	mov    0xc(%ebp),%esi
    6076:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6079:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    607c:	89 c2                	mov    %eax,%edx
    607e:	c1 e2 03             	shl    $0x3,%edx
    6081:	01 c2                	add    %eax,%edx
    6083:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    608a:	89 c2                	mov    %eax,%edx
    608c:	89 c8                	mov    %ecx,%eax
    608e:	c1 e0 02             	shl    $0x2,%eax
    6091:	01 c8                	add    %ecx,%eax
    6093:	c1 e0 05             	shl    $0x5,%eax
    6096:	01 d0                	add    %edx,%eax
    6098:	01 f0                	add    %esi,%eax
    609a:	83 c0 54             	add    $0x54,%eax
    609d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    609f:	8b 45 08             	mov    0x8(%ebp),%eax
    60a2:	89 04 24             	mov    %eax,(%esp)
    60a5:	e8 4c d8 ff ff       	call   38f6 <get1bit>
    60aa:	89 c3                	mov    %eax,%ebx
    60ac:	8b 75 0c             	mov    0xc(%ebp),%esi
    60af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    60b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    60b5:	89 c2                	mov    %eax,%edx
    60b7:	c1 e2 03             	shl    $0x3,%edx
    60ba:	01 c2                	add    %eax,%edx
    60bc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    60c3:	89 c2                	mov    %eax,%edx
    60c5:	89 c8                	mov    %ecx,%eax
    60c7:	c1 e0 02             	shl    $0x2,%eax
    60ca:	01 c8                	add    %ecx,%eax
    60cc:	c1 e0 05             	shl    $0x5,%eax
    60cf:	01 d0                	add    %edx,%eax
    60d1:	01 f0                	add    %esi,%eax
    60d3:	83 c0 58             	add    $0x58,%eax
    60d6:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    60d8:	8b 45 08             	mov    0x8(%ebp),%eax
    60db:	89 04 24             	mov    %eax,(%esp)
    60de:	e8 13 d8 ff ff       	call   38f6 <get1bit>
    60e3:	89 c3                	mov    %eax,%ebx
    60e5:	8b 75 0c             	mov    0xc(%ebp),%esi
    60e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    60eb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    60ee:	89 c2                	mov    %eax,%edx
    60f0:	c1 e2 03             	shl    $0x3,%edx
    60f3:	01 c2                	add    %eax,%edx
    60f5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    60fc:	89 c2                	mov    %eax,%edx
    60fe:	89 c8                	mov    %ecx,%eax
    6100:	c1 e0 02             	shl    $0x2,%eax
    6103:	01 c8                	add    %ecx,%eax
    6105:	c1 e0 05             	shl    $0x5,%eax
    6108:	01 d0                	add    %edx,%eax
    610a:	01 f0                	add    %esi,%eax
    610c:	83 c0 5c             	add    $0x5c,%eax
    610f:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    6111:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6115:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6118:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    611b:	0f 8c 4b fa ff ff    	jl     5b6c <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6121:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6125:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6129:	0f 8e 31 fa ff ff    	jle    5b60 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    612f:	83 c4 20             	add    $0x20,%esp
    6132:	5b                   	pop    %ebx
    6133:	5e                   	pop    %esi
    6134:	5d                   	pop    %ebp
    6135:	c3                   	ret    

00006136 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    6136:	55                   	push   %ebp
    6137:	89 e5                	mov    %esp,%ebp
    6139:	56                   	push   %esi
    613a:	53                   	push   %ebx
    613b:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    613e:	8b 45 10             	mov    0x10(%ebp),%eax
    6141:	89 c2                	mov    %eax,%edx
    6143:	c1 e2 03             	shl    $0x3,%edx
    6146:	01 c2                	add    %eax,%edx
    6148:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    614f:	89 c2                	mov    %eax,%edx
    6151:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6154:	89 c8                	mov    %ecx,%eax
    6156:	c1 e0 02             	shl    $0x2,%eax
    6159:	01 c8                	add    %ecx,%eax
    615b:	c1 e0 05             	shl    $0x5,%eax
    615e:	01 d0                	add    %edx,%eax
    6160:	8d 50 10             	lea    0x10(%eax),%edx
    6163:	8b 45 0c             	mov    0xc(%ebp),%eax
    6166:	01 d0                	add    %edx,%eax
    6168:	83 c0 08             	add    $0x8,%eax
    616b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    616e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6171:	8b 40 10             	mov    0x10(%eax),%eax
    6174:	85 c0                	test   %eax,%eax
    6176:	0f 84 7e 02 00 00    	je     63fa <III_get_scale_factors+0x2c4>
    617c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    617f:	8b 40 14             	mov    0x14(%eax),%eax
    6182:	83 f8 02             	cmp    $0x2,%eax
    6185:	0f 85 6f 02 00 00    	jne    63fa <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    618b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    618e:	8b 40 18             	mov    0x18(%eax),%eax
    6191:	85 c0                	test   %eax,%eax
    6193:	0f 84 6b 01 00 00    	je     6304 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    6199:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    61a0:	eb 32                	jmp    61d4 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    61a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    61a5:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    61a8:	8b 04 85 80 ce 00 00 	mov    0xce80(,%eax,4),%eax
    61af:	89 04 24             	mov    %eax,(%esp)
    61b2:	e8 b9 db ff ff       	call   3d70 <hgetbits>
    61b7:	89 c3                	mov    %eax,%ebx
    61b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    61bc:	8b 45 14             	mov    0x14(%ebp),%eax
    61bf:	01 c0                	add    %eax,%eax
    61c1:	89 c2                	mov    %eax,%edx
    61c3:	c1 e2 05             	shl    $0x5,%edx
    61c6:	29 c2                	sub    %eax,%edx
    61c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    61cb:	01 d0                	add    %edx,%eax
    61cd:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    61d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    61d4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    61d8:	7e c8                	jle    61a2 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    61da:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    61e1:	eb 5c                	jmp    623f <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    61e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    61ea:	eb 49                	jmp    6235 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    61ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
    61ef:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    61f2:	8b 04 85 80 ce 00 00 	mov    0xce80(,%eax,4),%eax
    61f9:	89 04 24             	mov    %eax,(%esp)
    61fc:	e8 6f db ff ff       	call   3d70 <hgetbits>
    6201:	89 c6                	mov    %eax,%esi
    6203:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6206:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6209:	8b 4d 14             	mov    0x14(%ebp),%ecx
    620c:	89 d0                	mov    %edx,%eax
    620e:	01 c0                	add    %eax,%eax
    6210:	01 d0                	add    %edx,%eax
    6212:	c1 e0 02             	shl    $0x2,%eax
    6215:	01 d0                	add    %edx,%eax
    6217:	89 ca                	mov    %ecx,%edx
    6219:	01 d2                	add    %edx,%edx
    621b:	89 d1                	mov    %edx,%ecx
    621d:	c1 e1 05             	shl    $0x5,%ecx
    6220:	29 d1                	sub    %edx,%ecx
    6222:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6225:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6228:	01 d0                	add    %edx,%eax
    622a:	83 c0 14             	add    $0x14,%eax
    622d:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    6231:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6235:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6239:	7e b1                	jle    61ec <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    623b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    623f:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    6243:	7e 9e                	jle    61e3 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    6245:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    624c:	eb 5f                	jmp    62ad <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    624e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6255:	eb 4c                	jmp    62a3 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    6257:	8b 45 e8             	mov    -0x18(%ebp),%eax
    625a:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    625d:	83 c0 10             	add    $0x10,%eax
    6260:	8b 04 85 80 ce 00 00 	mov    0xce80(,%eax,4),%eax
    6267:	89 04 24             	mov    %eax,(%esp)
    626a:	e8 01 db ff ff       	call   3d70 <hgetbits>
    626f:	89 c6                	mov    %eax,%esi
    6271:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6274:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6277:	8b 4d 14             	mov    0x14(%ebp),%ecx
    627a:	89 d0                	mov    %edx,%eax
    627c:	01 c0                	add    %eax,%eax
    627e:	01 d0                	add    %edx,%eax
    6280:	c1 e0 02             	shl    $0x2,%eax
    6283:	01 d0                	add    %edx,%eax
    6285:	89 ca                	mov    %ecx,%edx
    6287:	01 d2                	add    %edx,%edx
    6289:	89 d1                	mov    %edx,%ecx
    628b:	c1 e1 05             	shl    $0x5,%ecx
    628e:	29 d1                	sub    %edx,%ecx
    6290:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6293:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6296:	01 d0                	add    %edx,%eax
    6298:	83 c0 14             	add    $0x14,%eax
    629b:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    629f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    62a3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    62a7:	7e ae                	jle    6257 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    62a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    62ad:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    62b1:	7e 9b                	jle    624e <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    62b3:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    62ba:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    62c1:	eb 36                	jmp    62f9 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    62c3:	8b 5d 08             	mov    0x8(%ebp),%ebx
    62c6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    62c9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    62cc:	89 d0                	mov    %edx,%eax
    62ce:	01 c0                	add    %eax,%eax
    62d0:	01 d0                	add    %edx,%eax
    62d2:	c1 e0 02             	shl    $0x2,%eax
    62d5:	01 d0                	add    %edx,%eax
    62d7:	89 ca                	mov    %ecx,%edx
    62d9:	01 d2                	add    %edx,%edx
    62db:	89 d1                	mov    %edx,%ecx
    62dd:	c1 e1 05             	shl    $0x5,%ecx
    62e0:	29 d1                	sub    %edx,%ecx
    62e2:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    62e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    62e8:	01 d0                	add    %edx,%eax
    62ea:	83 c0 14             	add    $0x14,%eax
    62ed:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    62f4:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    62f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    62f9:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    62fd:	7e c4                	jle    62c3 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    62ff:	e9 b1 01 00 00       	jmp    64b5 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    6304:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    630b:	e9 8f 00 00 00       	jmp    639f <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    6310:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6313:	83 c0 04             	add    $0x4,%eax
    6316:	8b 04 85 64 ce 00 00 	mov    0xce64(,%eax,4),%eax
    631d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6320:	eb 64                	jmp    6386 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    6322:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6329:	eb 51                	jmp    637c <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    632b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    632e:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    6331:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6334:	c1 e2 04             	shl    $0x4,%edx
    6337:	01 d0                	add    %edx,%eax
    6339:	8b 04 85 80 ce 00 00 	mov    0xce80(,%eax,4),%eax
    6340:	89 04 24             	mov    %eax,(%esp)
    6343:	e8 28 da ff ff       	call   3d70 <hgetbits>
    6348:	89 c6                	mov    %eax,%esi
    634a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    634d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6350:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6353:	89 d0                	mov    %edx,%eax
    6355:	01 c0                	add    %eax,%eax
    6357:	01 d0                	add    %edx,%eax
    6359:	c1 e0 02             	shl    $0x2,%eax
    635c:	01 d0                	add    %edx,%eax
    635e:	89 ca                	mov    %ecx,%edx
    6360:	01 d2                	add    %edx,%edx
    6362:	89 d1                	mov    %edx,%ecx
    6364:	c1 e1 05             	shl    $0x5,%ecx
    6367:	29 d1                	sub    %edx,%ecx
    6369:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    636c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    636f:	01 d0                	add    %edx,%eax
    6371:	83 c0 14             	add    $0x14,%eax
    6374:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    6378:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    637c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6380:	7e a9                	jle    632b <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    6382:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6386:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6389:	83 c0 01             	add    $0x1,%eax
    638c:	83 c0 04             	add    $0x4,%eax
    638f:	8b 04 85 64 ce 00 00 	mov    0xce64(,%eax,4),%eax
    6396:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    6399:	7f 87                	jg     6322 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    639b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    639f:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    63a3:	0f 8e 67 ff ff ff    	jle    6310 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    63a9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    63b0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    63b7:	eb 36                	jmp    63ef <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    63b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
    63bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
    63bf:	8b 4d 14             	mov    0x14(%ebp),%ecx
    63c2:	89 d0                	mov    %edx,%eax
    63c4:	01 c0                	add    %eax,%eax
    63c6:	01 d0                	add    %edx,%eax
    63c8:	c1 e0 02             	shl    $0x2,%eax
    63cb:	01 d0                	add    %edx,%eax
    63cd:	89 ca                	mov    %ecx,%edx
    63cf:	01 d2                	add    %edx,%edx
    63d1:	89 d1                	mov    %edx,%ecx
    63d3:	c1 e1 05             	shl    $0x5,%ecx
    63d6:	29 d1                	sub    %edx,%ecx
    63d8:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    63db:	8b 45 f4             	mov    -0xc(%ebp),%eax
    63de:	01 d0                	add    %edx,%eax
    63e0:	83 c0 14             	add    $0x14,%eax
    63e3:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    63ea:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    63eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    63ef:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    63f3:	7e c4                	jle    63b9 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    63f5:	e9 bb 00 00 00       	jmp    64b5 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    63fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6401:	e9 89 00 00 00       	jmp    648f <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    6406:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6409:	8b 55 14             	mov    0x14(%ebp),%edx
    640c:	89 d0                	mov    %edx,%eax
    640e:	c1 e0 02             	shl    $0x2,%eax
    6411:	01 d0                	add    %edx,%eax
    6413:	c1 e0 03             	shl    $0x3,%eax
    6416:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6419:	01 d0                	add    %edx,%eax
    641b:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    641f:	85 c0                	test   %eax,%eax
    6421:	74 06                	je     6429 <III_get_scale_factors+0x2f3>
    6423:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    6427:	75 62                	jne    648b <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    6429:	8b 45 f0             	mov    -0x10(%ebp),%eax
    642c:	8b 04 85 60 ce 00 00 	mov    0xce60(,%eax,4),%eax
    6433:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6436:	eb 41                	jmp    6479 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    6438:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    643c:	0f 9f c0             	setg   %al
    643f:	0f b6 d0             	movzbl %al,%edx
    6442:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6445:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    6448:	c1 e2 04             	shl    $0x4,%edx
    644b:	01 d0                	add    %edx,%eax
    644d:	8b 04 85 80 ce 00 00 	mov    0xce80(,%eax,4),%eax
    6454:	89 04 24             	mov    %eax,(%esp)
    6457:	e8 14 d9 ff ff       	call   3d70 <hgetbits>
    645c:	89 c3                	mov    %eax,%ebx
    645e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    6461:	8b 45 14             	mov    0x14(%ebp),%eax
    6464:	01 c0                	add    %eax,%eax
    6466:	89 c2                	mov    %eax,%edx
    6468:	c1 e2 05             	shl    $0x5,%edx
    646b:	29 c2                	sub    %eax,%edx
    646d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6470:	01 d0                	add    %edx,%eax
    6472:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    6475:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6479:	8b 45 f0             	mov    -0x10(%ebp),%eax
    647c:	83 c0 01             	add    $0x1,%eax
    647f:	8b 04 85 60 ce 00 00 	mov    0xce60(,%eax,4),%eax
    6486:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    6489:	7f ad                	jg     6438 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    648b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    648f:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    6493:	0f 8e 6d ff ff ff    	jle    6406 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    6499:	8b 4d 08             	mov    0x8(%ebp),%ecx
    649c:	8b 45 14             	mov    0x14(%ebp),%eax
    649f:	c1 e0 03             	shl    $0x3,%eax
    64a2:	89 c2                	mov    %eax,%edx
    64a4:	c1 e2 05             	shl    $0x5,%edx
    64a7:	29 c2                	sub    %eax,%edx
    64a9:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    64ac:	83 c0 58             	add    $0x58,%eax
    64af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    64b5:	83 c4 20             	add    $0x20,%esp
    64b8:	5b                   	pop    %ebx
    64b9:	5e                   	pop    %esi
    64ba:	5d                   	pop    %ebp
    64bb:	c3                   	ret    

000064bc <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    64bc:	55                   	push   %ebp
    64bd:	89 e5                	mov    %esp,%ebp
    64bf:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    64c2:	a1 a0 d1 00 00       	mov    0xd1a0,%eax
    64c7:	85 c0                	test   %eax,%eax
    64c9:	74 02                	je     64cd <initialize_huffman+0x11>
    64cb:	eb 0f                	jmp    64dc <initialize_huffman+0x20>
	read_decoder_table();
    64cd:	e8 03 d9 ff ff       	call   3dd5 <read_decoder_table>
	huffman_initialized = TRUE;
    64d2:	c7 05 a0 d1 00 00 01 	movl   $0x1,0xd1a0
    64d9:	00 00 00 
}
    64dc:	c9                   	leave  
    64dd:	c3                   	ret    

000064de <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    64de:	55                   	push   %ebp
    64df:	89 e5                	mov    %esp,%ebp
    64e1:	57                   	push   %edi
    64e2:	56                   	push   %esi
    64e3:	53                   	push   %ebx
    64e4:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    64e7:	e8 d0 ff ff ff       	call   64bc <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    64ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    64ef:	8b 45 14             	mov    0x14(%ebp),%eax
    64f2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    64f5:	89 c2                	mov    %eax,%edx
    64f7:	c1 e2 03             	shl    $0x3,%edx
    64fa:	01 c2                	add    %eax,%edx
    64fc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6503:	89 c2                	mov    %eax,%edx
    6505:	89 c8                	mov    %ecx,%eax
    6507:	c1 e0 02             	shl    $0x2,%eax
    650a:	01 c8                	add    %ecx,%eax
    650c:	c1 e0 05             	shl    $0x5,%eax
    650f:	01 d0                	add    %edx,%eax
    6511:	01 d8                	add    %ebx,%eax
    6513:	83 c0 28             	add    $0x28,%eax
    6516:	8b 00                	mov    (%eax),%eax
    6518:	85 c0                	test   %eax,%eax
    651a:	74 44                	je     6560 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    651c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    651f:	8b 45 14             	mov    0x14(%ebp),%eax
    6522:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6525:	89 c2                	mov    %eax,%edx
    6527:	c1 e2 03             	shl    $0x3,%edx
    652a:	01 c2                	add    %eax,%edx
    652c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6533:	89 c2                	mov    %eax,%edx
    6535:	89 c8                	mov    %ecx,%eax
    6537:	c1 e0 02             	shl    $0x2,%eax
    653a:	01 c8                	add    %ecx,%eax
    653c:	c1 e0 05             	shl    $0x5,%eax
    653f:	01 d0                	add    %edx,%eax
    6541:	01 d8                	add    %ebx,%eax
    6543:	83 c0 2c             	add    $0x2c,%eax
    6546:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    6548:	83 f8 02             	cmp    $0x2,%eax
    654b:	75 13                	jne    6560 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    654d:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    6554:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    655b:	e9 cc 00 00 00       	jmp    662c <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    6560:	8b 45 1c             	mov    0x1c(%ebp),%eax
    6563:	8b 00                	mov    (%eax),%eax
    6565:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    6568:	8b 75 0c             	mov    0xc(%ebp),%esi
    656b:	8b 45 14             	mov    0x14(%ebp),%eax
    656e:	8b 5d 10             	mov    0x10(%ebp),%ebx
    6571:	89 c2                	mov    %eax,%edx
    6573:	c1 e2 03             	shl    $0x3,%edx
    6576:	01 c2                	add    %eax,%edx
    6578:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    657f:	89 c2                	mov    %eax,%edx
    6581:	89 d8                	mov    %ebx,%eax
    6583:	c1 e0 02             	shl    $0x2,%eax
    6586:	01 d8                	add    %ebx,%eax
    6588:	c1 e0 05             	shl    $0x5,%eax
    658b:	01 d0                	add    %edx,%eax
    658d:	01 f0                	add    %esi,%eax
    658f:	83 c0 4c             	add    $0x4c,%eax
    6592:	8b 00                	mov    (%eax),%eax
    6594:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    6597:	89 c8                	mov    %ecx,%eax
    6599:	c1 e0 03             	shl    $0x3,%eax
    659c:	01 c8                	add    %ecx,%eax
    659e:	c1 e0 02             	shl    $0x2,%eax
    65a1:	01 c8                	add    %ecx,%eax
    65a3:	01 d0                	add    %edx,%eax
    65a5:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    65ac:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    65af:	8b 45 1c             	mov    0x1c(%ebp),%eax
    65b2:	8b 00                	mov    (%eax),%eax
    65b4:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    65b7:	8b 75 0c             	mov    0xc(%ebp),%esi
    65ba:	8b 45 14             	mov    0x14(%ebp),%eax
    65bd:	8b 5d 10             	mov    0x10(%ebp),%ebx
    65c0:	89 c2                	mov    %eax,%edx
    65c2:	c1 e2 03             	shl    $0x3,%edx
    65c5:	01 c2                	add    %eax,%edx
    65c7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    65ce:	89 c2                	mov    %eax,%edx
    65d0:	89 d8                	mov    %ebx,%eax
    65d2:	c1 e0 02             	shl    $0x2,%eax
    65d5:	01 d8                	add    %ebx,%eax
    65d7:	c1 e0 05             	shl    $0x5,%eax
    65da:	01 d0                	add    %edx,%eax
    65dc:	01 f0                	add    %esi,%eax
    65de:	83 c0 4c             	add    $0x4c,%eax
    65e1:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    65e3:	8b 7d 0c             	mov    0xc(%ebp),%edi
    65e6:	8b 45 14             	mov    0x14(%ebp),%eax
    65e9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    65ec:	89 c2                	mov    %eax,%edx
    65ee:	c1 e2 03             	shl    $0x3,%edx
    65f1:	01 c2                	add    %eax,%edx
    65f3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    65fa:	89 c2                	mov    %eax,%edx
    65fc:	89 d8                	mov    %ebx,%eax
    65fe:	c1 e0 02             	shl    $0x2,%eax
    6601:	01 d8                	add    %ebx,%eax
    6603:	c1 e0 05             	shl    $0x5,%eax
    6606:	01 d0                	add    %edx,%eax
    6608:	01 f8                	add    %edi,%eax
    660a:	83 c0 50             	add    $0x50,%eax
    660d:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    660f:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    6611:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    6614:	89 c8                	mov    %ecx,%eax
    6616:	c1 e0 03             	shl    $0x3,%eax
    6619:	01 c8                	add    %ecx,%eax
    661b:	c1 e0 02             	shl    $0x2,%eax
    661e:	01 c8                	add    %ecx,%eax
    6620:	01 d0                	add    %edx,%eax
    6622:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    6629:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    662c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    6633:	e9 ac 01 00 00       	jmp    67e4 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    6638:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    663b:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    663e:	7d 43                	jge    6683 <III_hufman_decode+0x1a5>
    6640:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6643:	8b 45 14             	mov    0x14(%ebp),%eax
    6646:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6649:	89 c2                	mov    %eax,%edx
    664b:	c1 e2 03             	shl    $0x3,%edx
    664e:	01 c2                	add    %eax,%edx
    6650:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6657:	89 c2                	mov    %eax,%edx
    6659:	89 c8                	mov    %ecx,%eax
    665b:	c1 e0 02             	shl    $0x2,%eax
    665e:	01 c8                	add    %ecx,%eax
    6660:	c1 e0 05             	shl    $0x5,%eax
    6663:	01 d0                	add    %edx,%eax
    6665:	01 d8                	add    %ebx,%eax
    6667:	83 c0 34             	add    $0x34,%eax
    666a:	8b 10                	mov    (%eax),%edx
    666c:	89 d0                	mov    %edx,%eax
    666e:	c1 e0 02             	shl    $0x2,%eax
    6671:	01 d0                	add    %edx,%eax
    6673:	c1 e0 03             	shl    $0x3,%eax
    6676:	05 a0 01 01 00       	add    $0x101a0,%eax
    667b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    667e:	e9 86 00 00 00       	jmp    6709 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    6683:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6686:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    6689:	7d 40                	jge    66cb <III_hufman_decode+0x1ed>
    668b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    668e:	8b 45 14             	mov    0x14(%ebp),%eax
    6691:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6694:	89 c2                	mov    %eax,%edx
    6696:	c1 e2 03             	shl    $0x3,%edx
    6699:	01 c2                	add    %eax,%edx
    669b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    66a2:	89 c2                	mov    %eax,%edx
    66a4:	89 c8                	mov    %ecx,%eax
    66a6:	c1 e0 02             	shl    $0x2,%eax
    66a9:	01 c8                	add    %ecx,%eax
    66ab:	c1 e0 05             	shl    $0x5,%eax
    66ae:	01 d0                	add    %edx,%eax
    66b0:	01 d8                	add    %ebx,%eax
    66b2:	83 c0 38             	add    $0x38,%eax
    66b5:	8b 10                	mov    (%eax),%edx
    66b7:	89 d0                	mov    %edx,%eax
    66b9:	c1 e0 02             	shl    $0x2,%eax
    66bc:	01 d0                	add    %edx,%eax
    66be:	c1 e0 03             	shl    $0x3,%eax
    66c1:	05 a0 01 01 00       	add    $0x101a0,%eax
    66c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    66c9:	eb 3e                	jmp    6709 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    66cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    66ce:	8b 45 14             	mov    0x14(%ebp),%eax
    66d1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    66d4:	89 c2                	mov    %eax,%edx
    66d6:	c1 e2 03             	shl    $0x3,%edx
    66d9:	01 c2                	add    %eax,%edx
    66db:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    66e2:	89 c2                	mov    %eax,%edx
    66e4:	89 c8                	mov    %ecx,%eax
    66e6:	c1 e0 02             	shl    $0x2,%eax
    66e9:	01 c8                	add    %ecx,%eax
    66eb:	c1 e0 05             	shl    $0x5,%eax
    66ee:	01 d0                	add    %edx,%eax
    66f0:	01 d8                	add    %ebx,%eax
    66f2:	83 c0 3c             	add    $0x3c,%eax
    66f5:	8b 10                	mov    (%eax),%edx
    66f7:	89 d0                	mov    %edx,%eax
    66f9:	c1 e0 02             	shl    $0x2,%eax
    66fc:	01 d0                	add    %edx,%eax
    66fe:	c1 e0 03             	shl    $0x3,%eax
    6701:	05 a0 01 01 00       	add    $0x101a0,%eax
    6706:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    6709:	8d 45 c8             	lea    -0x38(%ebp),%eax
    670c:	89 44 24 10          	mov    %eax,0x10(%esp)
    6710:	8d 45 cc             	lea    -0x34(%ebp),%eax
    6713:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6717:	8d 45 d0             	lea    -0x30(%ebp),%eax
    671a:	89 44 24 08          	mov    %eax,0x8(%esp)
    671e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    6721:	89 44 24 04          	mov    %eax,0x4(%esp)
    6725:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6728:	89 04 24             	mov    %eax,(%esp)
    672b:	e8 fd ee ff ff       	call   562d <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    6730:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    6733:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6738:	89 c8                	mov    %ecx,%eax
    673a:	f7 ea                	imul   %edx
    673c:	c1 fa 02             	sar    $0x2,%edx
    673f:	89 c8                	mov    %ecx,%eax
    6741:	c1 f8 1f             	sar    $0x1f,%eax
    6744:	29 c2                	sub    %eax,%edx
    6746:	89 d0                	mov    %edx,%eax
    6748:	89 c2                	mov    %eax,%edx
    674a:	89 d0                	mov    %edx,%eax
    674c:	c1 e0 03             	shl    $0x3,%eax
    674f:	01 d0                	add    %edx,%eax
    6751:	c1 e0 03             	shl    $0x3,%eax
    6754:	89 c2                	mov    %eax,%edx
    6756:	8b 45 08             	mov    0x8(%ebp),%eax
    6759:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    675c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    675f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6764:	89 c8                	mov    %ecx,%eax
    6766:	f7 ea                	imul   %edx
    6768:	c1 fa 02             	sar    $0x2,%edx
    676b:	89 c8                	mov    %ecx,%eax
    676d:	c1 f8 1f             	sar    $0x1f,%eax
    6770:	29 c2                	sub    %eax,%edx
    6772:	89 d0                	mov    %edx,%eax
    6774:	c1 e0 03             	shl    $0x3,%eax
    6777:	01 d0                	add    %edx,%eax
    6779:	01 c0                	add    %eax,%eax
    677b:	29 c1                	sub    %eax,%ecx
    677d:	89 ca                	mov    %ecx,%edx
    677f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6782:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    6785:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6788:	8d 48 01             	lea    0x1(%eax),%ecx
    678b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6790:	89 c8                	mov    %ecx,%eax
    6792:	f7 ea                	imul   %edx
    6794:	c1 fa 02             	sar    $0x2,%edx
    6797:	89 c8                	mov    %ecx,%eax
    6799:	c1 f8 1f             	sar    $0x1f,%eax
    679c:	29 c2                	sub    %eax,%edx
    679e:	89 d0                	mov    %edx,%eax
    67a0:	89 c2                	mov    %eax,%edx
    67a2:	89 d0                	mov    %edx,%eax
    67a4:	c1 e0 03             	shl    $0x3,%eax
    67a7:	01 d0                	add    %edx,%eax
    67a9:	c1 e0 03             	shl    $0x3,%eax
    67ac:	89 c2                	mov    %eax,%edx
    67ae:	8b 45 08             	mov    0x8(%ebp),%eax
    67b1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    67b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    67b7:	8d 48 01             	lea    0x1(%eax),%ecx
    67ba:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    67bf:	89 c8                	mov    %ecx,%eax
    67c1:	f7 ea                	imul   %edx
    67c3:	c1 fa 02             	sar    $0x2,%edx
    67c6:	89 c8                	mov    %ecx,%eax
    67c8:	c1 f8 1f             	sar    $0x1f,%eax
    67cb:	29 c2                	sub    %eax,%edx
    67cd:	89 d0                	mov    %edx,%eax
    67cf:	c1 e0 03             	shl    $0x3,%eax
    67d2:	01 d0                	add    %edx,%eax
    67d4:	01 c0                	add    %eax,%eax
    67d6:	29 c1                	sub    %eax,%ecx
    67d8:	89 ca                	mov    %ecx,%edx
    67da:	8b 45 d0             	mov    -0x30(%ebp),%eax
    67dd:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    67e0:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    67e4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    67e7:	8b 75 0c             	mov    0xc(%ebp),%esi
    67ea:	8b 45 14             	mov    0x14(%ebp),%eax
    67ed:	8b 4d 10             	mov    0x10(%ebp),%ecx
    67f0:	89 c2                	mov    %eax,%edx
    67f2:	c1 e2 03             	shl    $0x3,%edx
    67f5:	01 c2                	add    %eax,%edx
    67f7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    67fe:	89 c2                	mov    %eax,%edx
    6800:	89 c8                	mov    %ecx,%eax
    6802:	c1 e0 02             	shl    $0x2,%eax
    6805:	01 c8                	add    %ecx,%eax
    6807:	c1 e0 05             	shl    $0x5,%eax
    680a:	01 d0                	add    %edx,%eax
    680c:	01 f0                	add    %esi,%eax
    680e:	83 c0 1c             	add    $0x1c,%eax
    6811:	8b 00                	mov    (%eax),%eax
    6813:	01 c0                	add    %eax,%eax
    6815:	39 c3                	cmp    %eax,%ebx
    6817:	0f 82 1b fe ff ff    	jb     6638 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    681d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6820:	8b 45 14             	mov    0x14(%ebp),%eax
    6823:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6826:	89 c2                	mov    %eax,%edx
    6828:	c1 e2 03             	shl    $0x3,%edx
    682b:	01 c2                	add    %eax,%edx
    682d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6834:	89 c2                	mov    %eax,%edx
    6836:	89 c8                	mov    %ecx,%eax
    6838:	c1 e0 02             	shl    $0x2,%eax
    683b:	01 c8                	add    %ecx,%eax
    683d:	c1 e0 05             	shl    $0x5,%eax
    6840:	01 d0                	add    %edx,%eax
    6842:	01 d8                	add    %ebx,%eax
    6844:	83 c0 5c             	add    $0x5c,%eax
    6847:	8b 00                	mov    (%eax),%eax
    6849:	8d 50 20             	lea    0x20(%eax),%edx
    684c:	89 d0                	mov    %edx,%eax
    684e:	c1 e0 02             	shl    $0x2,%eax
    6851:	01 d0                	add    %edx,%eax
    6853:	c1 e0 03             	shl    $0x3,%eax
    6856:	05 a0 01 01 00       	add    $0x101a0,%eax
    685b:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    685e:	e9 91 01 00 00       	jmp    69f4 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    6863:	8d 45 c8             	lea    -0x38(%ebp),%eax
    6866:	89 44 24 10          	mov    %eax,0x10(%esp)
    686a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    686d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6871:	8d 45 d0             	lea    -0x30(%ebp),%eax
    6874:	89 44 24 08          	mov    %eax,0x8(%esp)
    6878:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    687b:	89 44 24 04          	mov    %eax,0x4(%esp)
    687f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6882:	89 04 24             	mov    %eax,(%esp)
    6885:	e8 a3 ed ff ff       	call   562d <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    688a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    688d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6892:	89 c8                	mov    %ecx,%eax
    6894:	f7 ea                	imul   %edx
    6896:	c1 fa 02             	sar    $0x2,%edx
    6899:	89 c8                	mov    %ecx,%eax
    689b:	c1 f8 1f             	sar    $0x1f,%eax
    689e:	29 c2                	sub    %eax,%edx
    68a0:	89 d0                	mov    %edx,%eax
    68a2:	89 c2                	mov    %eax,%edx
    68a4:	89 d0                	mov    %edx,%eax
    68a6:	c1 e0 03             	shl    $0x3,%eax
    68a9:	01 d0                	add    %edx,%eax
    68ab:	c1 e0 03             	shl    $0x3,%eax
    68ae:	89 c2                	mov    %eax,%edx
    68b0:	8b 45 08             	mov    0x8(%ebp),%eax
    68b3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    68b6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    68b9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    68be:	89 c8                	mov    %ecx,%eax
    68c0:	f7 ea                	imul   %edx
    68c2:	c1 fa 02             	sar    $0x2,%edx
    68c5:	89 c8                	mov    %ecx,%eax
    68c7:	c1 f8 1f             	sar    $0x1f,%eax
    68ca:	29 c2                	sub    %eax,%edx
    68cc:	89 d0                	mov    %edx,%eax
    68ce:	c1 e0 03             	shl    $0x3,%eax
    68d1:	01 d0                	add    %edx,%eax
    68d3:	01 c0                	add    %eax,%eax
    68d5:	29 c1                	sub    %eax,%ecx
    68d7:	89 ca                	mov    %ecx,%edx
    68d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
    68dc:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    68df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    68e2:	8d 48 01             	lea    0x1(%eax),%ecx
    68e5:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    68ea:	89 c8                	mov    %ecx,%eax
    68ec:	f7 ea                	imul   %edx
    68ee:	c1 fa 02             	sar    $0x2,%edx
    68f1:	89 c8                	mov    %ecx,%eax
    68f3:	c1 f8 1f             	sar    $0x1f,%eax
    68f6:	29 c2                	sub    %eax,%edx
    68f8:	89 d0                	mov    %edx,%eax
    68fa:	89 c2                	mov    %eax,%edx
    68fc:	89 d0                	mov    %edx,%eax
    68fe:	c1 e0 03             	shl    $0x3,%eax
    6901:	01 d0                	add    %edx,%eax
    6903:	c1 e0 03             	shl    $0x3,%eax
    6906:	89 c2                	mov    %eax,%edx
    6908:	8b 45 08             	mov    0x8(%ebp),%eax
    690b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    690e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6911:	8d 48 01             	lea    0x1(%eax),%ecx
    6914:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6919:	89 c8                	mov    %ecx,%eax
    691b:	f7 ea                	imul   %edx
    691d:	c1 fa 02             	sar    $0x2,%edx
    6920:	89 c8                	mov    %ecx,%eax
    6922:	c1 f8 1f             	sar    $0x1f,%eax
    6925:	29 c2                	sub    %eax,%edx
    6927:	89 d0                	mov    %edx,%eax
    6929:	c1 e0 03             	shl    $0x3,%eax
    692c:	01 d0                	add    %edx,%eax
    692e:	01 c0                	add    %eax,%eax
    6930:	29 c1                	sub    %eax,%ecx
    6932:	89 ca                	mov    %ecx,%edx
    6934:	8b 45 c8             	mov    -0x38(%ebp),%eax
    6937:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    693a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    693d:	8d 48 02             	lea    0x2(%eax),%ecx
    6940:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6945:	89 c8                	mov    %ecx,%eax
    6947:	f7 ea                	imul   %edx
    6949:	c1 fa 02             	sar    $0x2,%edx
    694c:	89 c8                	mov    %ecx,%eax
    694e:	c1 f8 1f             	sar    $0x1f,%eax
    6951:	29 c2                	sub    %eax,%edx
    6953:	89 d0                	mov    %edx,%eax
    6955:	89 c2                	mov    %eax,%edx
    6957:	89 d0                	mov    %edx,%eax
    6959:	c1 e0 03             	shl    $0x3,%eax
    695c:	01 d0                	add    %edx,%eax
    695e:	c1 e0 03             	shl    $0x3,%eax
    6961:	89 c2                	mov    %eax,%edx
    6963:	8b 45 08             	mov    0x8(%ebp),%eax
    6966:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6969:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    696c:	8d 48 02             	lea    0x2(%eax),%ecx
    696f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6974:	89 c8                	mov    %ecx,%eax
    6976:	f7 ea                	imul   %edx
    6978:	c1 fa 02             	sar    $0x2,%edx
    697b:	89 c8                	mov    %ecx,%eax
    697d:	c1 f8 1f             	sar    $0x1f,%eax
    6980:	29 c2                	sub    %eax,%edx
    6982:	89 d0                	mov    %edx,%eax
    6984:	c1 e0 03             	shl    $0x3,%eax
    6987:	01 d0                	add    %edx,%eax
    6989:	01 c0                	add    %eax,%eax
    698b:	29 c1                	sub    %eax,%ecx
    698d:	89 ca                	mov    %ecx,%edx
    698f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6992:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    6995:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6998:	8d 48 03             	lea    0x3(%eax),%ecx
    699b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    69a0:	89 c8                	mov    %ecx,%eax
    69a2:	f7 ea                	imul   %edx
    69a4:	c1 fa 02             	sar    $0x2,%edx
    69a7:	89 c8                	mov    %ecx,%eax
    69a9:	c1 f8 1f             	sar    $0x1f,%eax
    69ac:	29 c2                	sub    %eax,%edx
    69ae:	89 d0                	mov    %edx,%eax
    69b0:	89 c2                	mov    %eax,%edx
    69b2:	89 d0                	mov    %edx,%eax
    69b4:	c1 e0 03             	shl    $0x3,%eax
    69b7:	01 d0                	add    %edx,%eax
    69b9:	c1 e0 03             	shl    $0x3,%eax
    69bc:	89 c2                	mov    %eax,%edx
    69be:	8b 45 08             	mov    0x8(%ebp),%eax
    69c1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    69c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    69c7:	8d 48 03             	lea    0x3(%eax),%ecx
    69ca:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    69cf:	89 c8                	mov    %ecx,%eax
    69d1:	f7 ea                	imul   %edx
    69d3:	c1 fa 02             	sar    $0x2,%edx
    69d6:	89 c8                	mov    %ecx,%eax
    69d8:	c1 f8 1f             	sar    $0x1f,%eax
    69db:	29 c2                	sub    %eax,%edx
    69dd:	89 d0                	mov    %edx,%eax
    69df:	c1 e0 03             	shl    $0x3,%eax
    69e2:	01 d0                	add    %edx,%eax
    69e4:	01 c0                	add    %eax,%eax
    69e6:	29 c1                	sub    %eax,%ecx
    69e8:	89 ca                	mov    %ecx,%edx
    69ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
    69ed:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    69f0:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    69f4:	e8 5b d3 ff ff       	call   3d54 <hsstell>
    69f9:	89 c3                	mov    %eax,%ebx
    69fb:	8b 75 0c             	mov    0xc(%ebp),%esi
    69fe:	8b 45 14             	mov    0x14(%ebp),%eax
    6a01:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6a04:	89 c2                	mov    %eax,%edx
    6a06:	c1 e2 03             	shl    $0x3,%edx
    6a09:	01 c2                	add    %eax,%edx
    6a0b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a12:	89 c2                	mov    %eax,%edx
    6a14:	89 c8                	mov    %ecx,%eax
    6a16:	c1 e0 02             	shl    $0x2,%eax
    6a19:	01 c8                	add    %ecx,%eax
    6a1b:	c1 e0 05             	shl    $0x5,%eax
    6a1e:	01 d0                	add    %edx,%eax
    6a20:	01 f0                	add    %esi,%eax
    6a22:	83 c0 18             	add    $0x18,%eax
    6a25:	8b 10                	mov    (%eax),%edx
    6a27:	8b 45 18             	mov    0x18(%ebp),%eax
    6a2a:	01 d0                	add    %edx,%eax
    6a2c:	39 c3                	cmp    %eax,%ebx
    6a2e:	73 0d                	jae    6a3d <III_hufman_decode+0x55f>
    6a30:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    6a37:	0f 8e 26 fe ff ff    	jle    6863 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    6a3d:	e8 12 d3 ff ff       	call   3d54 <hsstell>
    6a42:	89 c3                	mov    %eax,%ebx
    6a44:	8b 75 0c             	mov    0xc(%ebp),%esi
    6a47:	8b 45 14             	mov    0x14(%ebp),%eax
    6a4a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6a4d:	89 c2                	mov    %eax,%edx
    6a4f:	c1 e2 03             	shl    $0x3,%edx
    6a52:	01 c2                	add    %eax,%edx
    6a54:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a5b:	89 c2                	mov    %eax,%edx
    6a5d:	89 c8                	mov    %ecx,%eax
    6a5f:	c1 e0 02             	shl    $0x2,%eax
    6a62:	01 c8                	add    %ecx,%eax
    6a64:	c1 e0 05             	shl    $0x5,%eax
    6a67:	01 d0                	add    %edx,%eax
    6a69:	01 f0                	add    %esi,%eax
    6a6b:	83 c0 18             	add    $0x18,%eax
    6a6e:	8b 10                	mov    (%eax),%edx
    6a70:	8b 45 18             	mov    0x18(%ebp),%eax
    6a73:	01 d0                	add    %edx,%eax
    6a75:	39 c3                	cmp    %eax,%ebx
    6a77:	76 48                	jbe    6ac1 <III_hufman_decode+0x5e3>
   {  i -=4;
    6a79:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    6a7d:	e8 d2 d2 ff ff       	call   3d54 <hsstell>
    6a82:	8b 55 18             	mov    0x18(%ebp),%edx
    6a85:	29 d0                	sub    %edx,%eax
    6a87:	89 c6                	mov    %eax,%esi
    6a89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6a8c:	8b 45 14             	mov    0x14(%ebp),%eax
    6a8f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6a92:	89 c2                	mov    %eax,%edx
    6a94:	c1 e2 03             	shl    $0x3,%edx
    6a97:	01 c2                	add    %eax,%edx
    6a99:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6aa0:	89 c2                	mov    %eax,%edx
    6aa2:	89 c8                	mov    %ecx,%eax
    6aa4:	c1 e0 02             	shl    $0x2,%eax
    6aa7:	01 c8                	add    %ecx,%eax
    6aa9:	c1 e0 05             	shl    $0x5,%eax
    6aac:	01 d0                	add    %edx,%eax
    6aae:	01 d8                	add    %ebx,%eax
    6ab0:	83 c0 18             	add    $0x18,%eax
    6ab3:	8b 00                	mov    (%eax),%eax
    6ab5:	29 c6                	sub    %eax,%esi
    6ab7:	89 f0                	mov    %esi,%eax
    6ab9:	89 04 24             	mov    %eax,(%esp)
    6abc:	e8 de d2 ff ff       	call   3d9f <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    6ac1:	e8 8e d2 ff ff       	call   3d54 <hsstell>
    6ac6:	89 c3                	mov    %eax,%ebx
    6ac8:	8b 75 0c             	mov    0xc(%ebp),%esi
    6acb:	8b 45 14             	mov    0x14(%ebp),%eax
    6ace:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6ad1:	89 c2                	mov    %eax,%edx
    6ad3:	c1 e2 03             	shl    $0x3,%edx
    6ad6:	01 c2                	add    %eax,%edx
    6ad8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6adf:	89 c2                	mov    %eax,%edx
    6ae1:	89 c8                	mov    %ecx,%eax
    6ae3:	c1 e0 02             	shl    $0x2,%eax
    6ae6:	01 c8                	add    %ecx,%eax
    6ae8:	c1 e0 05             	shl    $0x5,%eax
    6aeb:	01 d0                	add    %edx,%eax
    6aed:	01 f0                	add    %esi,%eax
    6aef:	83 c0 18             	add    $0x18,%eax
    6af2:	8b 10                	mov    (%eax),%edx
    6af4:	8b 45 18             	mov    0x18(%ebp),%eax
    6af7:	01 d0                	add    %edx,%eax
    6af9:	39 c3                	cmp    %eax,%ebx
    6afb:	73 45                	jae    6b42 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    6afd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6b00:	8b 45 14             	mov    0x14(%ebp),%eax
    6b03:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6b06:	89 c2                	mov    %eax,%edx
    6b08:	c1 e2 03             	shl    $0x3,%edx
    6b0b:	01 c2                	add    %eax,%edx
    6b0d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6b14:	89 c2                	mov    %eax,%edx
    6b16:	89 c8                	mov    %ecx,%eax
    6b18:	c1 e0 02             	shl    $0x2,%eax
    6b1b:	01 c8                	add    %ecx,%eax
    6b1d:	c1 e0 05             	shl    $0x5,%eax
    6b20:	01 d0                	add    %edx,%eax
    6b22:	01 d8                	add    %ebx,%eax
    6b24:	83 c0 18             	add    $0x18,%eax
    6b27:	8b 10                	mov    (%eax),%edx
    6b29:	8b 45 18             	mov    0x18(%ebp),%eax
    6b2c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6b2f:	e8 20 d2 ff ff       	call   3d54 <hsstell>
    6b34:	29 c3                	sub    %eax,%ebx
    6b36:	89 d8                	mov    %ebx,%eax
    6b38:	89 04 24             	mov    %eax,(%esp)
    6b3b:	e8 30 d2 ff ff       	call   3d70 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    6b40:	eb 5c                	jmp    6b9e <III_hufman_decode+0x6c0>
    6b42:	eb 5a                	jmp    6b9e <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    6b44:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    6b47:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b4c:	89 c8                	mov    %ecx,%eax
    6b4e:	f7 ea                	imul   %edx
    6b50:	c1 fa 02             	sar    $0x2,%edx
    6b53:	89 c8                	mov    %ecx,%eax
    6b55:	c1 f8 1f             	sar    $0x1f,%eax
    6b58:	29 c2                	sub    %eax,%edx
    6b5a:	89 d0                	mov    %edx,%eax
    6b5c:	89 c2                	mov    %eax,%edx
    6b5e:	89 d0                	mov    %edx,%eax
    6b60:	c1 e0 03             	shl    $0x3,%eax
    6b63:	01 d0                	add    %edx,%eax
    6b65:	c1 e0 03             	shl    $0x3,%eax
    6b68:	89 c2                	mov    %eax,%edx
    6b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    6b6d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6b70:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    6b73:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b78:	89 c8                	mov    %ecx,%eax
    6b7a:	f7 ea                	imul   %edx
    6b7c:	c1 fa 02             	sar    $0x2,%edx
    6b7f:	89 c8                	mov    %ecx,%eax
    6b81:	c1 f8 1f             	sar    $0x1f,%eax
    6b84:	29 c2                	sub    %eax,%edx
    6b86:	89 d0                	mov    %edx,%eax
    6b88:	c1 e0 03             	shl    $0x3,%eax
    6b8b:	01 d0                	add    %edx,%eax
    6b8d:	01 c0                	add    %eax,%eax
    6b8f:	29 c1                	sub    %eax,%ecx
    6b91:	89 ca                	mov    %ecx,%edx
    6b93:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    6b9a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    6b9e:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    6ba5:	7e 9d                	jle    6b44 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    6ba7:	83 c4 4c             	add    $0x4c,%esp
    6baa:	5b                   	pop    %ebx
    6bab:	5e                   	pop    %esi
    6bac:	5f                   	pop    %edi
    6bad:	5d                   	pop    %ebp
    6bae:	c3                   	ret    

00006baf <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    6baf:	55                   	push   %ebp
    6bb0:	89 e5                	mov    %esp,%ebp
    6bb2:	56                   	push   %esi
    6bb3:	53                   	push   %ebx
    6bb4:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    6bb7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6bbe:	8b 45 1c             	mov    0x1c(%ebp),%eax
    6bc1:	8b 00                	mov    (%eax),%eax
    6bc3:	8b 40 10             	mov    0x10(%eax),%eax
    6bc6:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    6bc9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    6bd0:	8b 45 14             	mov    0x14(%ebp),%eax
    6bd3:	8b 40 10             	mov    0x10(%eax),%eax
    6bd6:	85 c0                	test   %eax,%eax
    6bd8:	74 61                	je     6c3b <III_dequantize_sample+0x8c>
    6bda:	8b 45 14             	mov    0x14(%ebp),%eax
    6bdd:	8b 40 14             	mov    0x14(%eax),%eax
    6be0:	83 f8 02             	cmp    $0x2,%eax
    6be3:	75 56                	jne    6c3b <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    6be5:	8b 45 14             	mov    0x14(%ebp),%eax
    6be8:	8b 40 18             	mov    0x18(%eax),%eax
    6beb:	85 c0                	test   %eax,%eax
    6bed:	74 15                	je     6c04 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    6bef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6bf2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6bf8:	05 04 cf 00 00       	add    $0xcf04,%eax
    6bfd:	8b 00                	mov    (%eax),%eax
    6bff:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    6c02:	eb 4a                	jmp    6c4e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    6c04:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6c07:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6c0d:	05 54 cf 00 00       	add    $0xcf54,%eax
    6c12:	8b 50 0c             	mov    0xc(%eax),%edx
    6c15:	89 d0                	mov    %edx,%eax
    6c17:	01 c0                	add    %eax,%eax
    6c19:	01 d0                	add    %edx,%eax
    6c1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    6c1e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6c21:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6c27:	05 54 cf 00 00       	add    $0xcf54,%eax
    6c2c:	8b 40 0c             	mov    0xc(%eax),%eax
    6c2f:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    6c32:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    6c39:	eb 13                	jmp    6c4e <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    6c3b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6c3e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6c44:	05 04 cf 00 00       	add    $0xcf04,%eax
    6c49:	8b 00                	mov    (%eax),%eax
    6c4b:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    6c4e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6c55:	e9 3d 06 00 00       	jmp    7297 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    6c5a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6c61:	e9 23 06 00 00       	jmp    7289 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    6c66:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6c69:	89 d0                	mov    %edx,%eax
    6c6b:	c1 e0 03             	shl    $0x3,%eax
    6c6e:	01 d0                	add    %edx,%eax
    6c70:	01 c0                	add    %eax,%eax
    6c72:	89 c2                	mov    %eax,%edx
    6c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c77:	01 d0                	add    %edx,%eax
    6c79:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6c7c:	0f 85 9e 02 00 00    	jne    6f20 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    6c82:	8b 45 14             	mov    0x14(%ebp),%eax
    6c85:	8b 40 10             	mov    0x10(%eax),%eax
    6c88:	85 c0                	test   %eax,%eax
    6c8a:	0f 84 6b 02 00 00    	je     6efb <III_dequantize_sample+0x34c>
    6c90:	8b 45 14             	mov    0x14(%ebp),%eax
    6c93:	8b 40 14             	mov    0x14(%eax),%eax
    6c96:	83 f8 02             	cmp    $0x2,%eax
    6c99:	0f 85 5c 02 00 00    	jne    6efb <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    6c9f:	8b 45 14             	mov    0x14(%ebp),%eax
    6ca2:	8b 40 18             	mov    0x18(%eax),%eax
    6ca5:	85 c0                	test   %eax,%eax
    6ca7:	0f 84 af 01 00 00    	je     6e5c <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    6cad:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6cb0:	89 d0                	mov    %edx,%eax
    6cb2:	c1 e0 03             	shl    $0x3,%eax
    6cb5:	01 d0                	add    %edx,%eax
    6cb7:	01 c0                	add    %eax,%eax
    6cb9:	89 c2                	mov    %eax,%edx
    6cbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6cbe:	01 c2                	add    %eax,%edx
    6cc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6cc3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6cc9:	05 20 cf 00 00       	add    $0xcf20,%eax
    6cce:	8b 00                	mov    (%eax),%eax
    6cd0:	39 c2                	cmp    %eax,%edx
    6cd2:	0f 85 93 00 00 00    	jne    6d6b <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    6cd8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6cdb:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6ce1:	05 60 cf 00 00       	add    $0xcf60,%eax
    6ce6:	8b 50 0c             	mov    0xc(%eax),%edx
    6ce9:	89 d0                	mov    %edx,%eax
    6ceb:	01 c0                	add    %eax,%eax
    6ced:	01 d0                	add    %edx,%eax
    6cef:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    6cf2:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6cf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6cfc:	8d 48 01             	lea    0x1(%eax),%ecx
    6cff:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6d02:	89 d0                	mov    %edx,%eax
    6d04:	c1 e0 03             	shl    $0x3,%eax
    6d07:	01 d0                	add    %edx,%eax
    6d09:	c1 e0 02             	shl    $0x2,%eax
    6d0c:	01 d0                	add    %edx,%eax
    6d0e:	01 c8                	add    %ecx,%eax
    6d10:	83 c0 14             	add    $0x14,%eax
    6d13:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6d1a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6d1d:	89 d0                	mov    %edx,%eax
    6d1f:	c1 e0 03             	shl    $0x3,%eax
    6d22:	01 d0                	add    %edx,%eax
    6d24:	c1 e0 02             	shl    $0x2,%eax
    6d27:	01 d0                	add    %edx,%eax
    6d29:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6d2c:	01 d0                	add    %edx,%eax
    6d2e:	83 c0 14             	add    $0x14,%eax
    6d31:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6d38:	29 c1                	sub    %eax,%ecx
    6d3a:	89 c8                	mov    %ecx,%eax
    6d3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6d3f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6d42:	89 d0                	mov    %edx,%eax
    6d44:	c1 e0 03             	shl    $0x3,%eax
    6d47:	01 d0                	add    %edx,%eax
    6d49:	c1 e0 02             	shl    $0x2,%eax
    6d4c:	01 d0                	add    %edx,%eax
    6d4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6d51:	01 d0                	add    %edx,%eax
    6d53:	83 c0 14             	add    $0x14,%eax
    6d56:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    6d5d:	89 d0                	mov    %edx,%eax
    6d5f:	01 c0                	add    %eax,%eax
    6d61:	01 d0                	add    %edx,%eax
    6d63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6d66:	e9 8e 01 00 00       	jmp    6ef9 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    6d6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6d6e:	89 d0                	mov    %edx,%eax
    6d70:	c1 e0 03             	shl    $0x3,%eax
    6d73:	01 d0                	add    %edx,%eax
    6d75:	01 c0                	add    %eax,%eax
    6d77:	89 c2                	mov    %eax,%edx
    6d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d7c:	01 c2                	add    %eax,%edx
    6d7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6d81:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6d87:	05 20 cf 00 00       	add    $0xcf20,%eax
    6d8c:	8b 00                	mov    (%eax),%eax
    6d8e:	39 c2                	cmp    %eax,%edx
    6d90:	7d 2a                	jge    6dbc <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6d92:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6d96:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6d99:	8d 48 01             	lea    0x1(%eax),%ecx
    6d9c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6d9f:	89 d0                	mov    %edx,%eax
    6da1:	c1 e0 03             	shl    $0x3,%eax
    6da4:	01 d0                	add    %edx,%eax
    6da6:	c1 e0 02             	shl    $0x2,%eax
    6da9:	01 d0                	add    %edx,%eax
    6dab:	01 c8                	add    %ecx,%eax
    6dad:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    6db4:	89 45 e8             	mov    %eax,-0x18(%ebp)
    6db7:	e9 3d 01 00 00       	jmp    6ef9 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    6dbc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6dc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6dc3:	8d 48 01             	lea    0x1(%eax),%ecx
    6dc6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6dc9:	89 d0                	mov    %edx,%eax
    6dcb:	c1 e0 03             	shl    $0x3,%eax
    6dce:	01 d0                	add    %edx,%eax
    6dd0:	c1 e0 02             	shl    $0x2,%eax
    6dd3:	01 d0                	add    %edx,%eax
    6dd5:	01 c8                	add    %ecx,%eax
    6dd7:	83 c0 14             	add    $0x14,%eax
    6dda:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    6de1:	89 d0                	mov    %edx,%eax
    6de3:	01 c0                	add    %eax,%eax
    6de5:	01 d0                	add    %edx,%eax
    6de7:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6dea:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6ded:	8d 48 01             	lea    0x1(%eax),%ecx
    6df0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6df3:	89 d0                	mov    %edx,%eax
    6df5:	c1 e0 03             	shl    $0x3,%eax
    6df8:	01 d0                	add    %edx,%eax
    6dfa:	c1 e0 02             	shl    $0x2,%eax
    6dfd:	01 d0                	add    %edx,%eax
    6dff:	01 c8                	add    %ecx,%eax
    6e01:	83 c0 14             	add    $0x14,%eax
    6e04:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6e0b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6e0e:	89 d0                	mov    %edx,%eax
    6e10:	c1 e0 03             	shl    $0x3,%eax
    6e13:	01 d0                	add    %edx,%eax
    6e15:	c1 e0 02             	shl    $0x2,%eax
    6e18:	01 d0                	add    %edx,%eax
    6e1a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6e1d:	01 d0                	add    %edx,%eax
    6e1f:	83 c0 14             	add    $0x14,%eax
    6e22:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6e29:	29 c1                	sub    %eax,%ecx
    6e2b:	89 c8                	mov    %ecx,%eax
    6e2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6e30:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6e33:	89 d0                	mov    %edx,%eax
    6e35:	c1 e0 03             	shl    $0x3,%eax
    6e38:	01 d0                	add    %edx,%eax
    6e3a:	c1 e0 02             	shl    $0x2,%eax
    6e3d:	01 d0                	add    %edx,%eax
    6e3f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6e42:	01 d0                	add    %edx,%eax
    6e44:	83 c0 14             	add    $0x14,%eax
    6e47:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    6e4e:	89 d0                	mov    %edx,%eax
    6e50:	01 c0                	add    %eax,%eax
    6e52:	01 d0                	add    %edx,%eax
    6e54:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    6e57:	e9 c4 00 00 00       	jmp    6f20 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    6e5c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6e60:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6e63:	8d 48 01             	lea    0x1(%eax),%ecx
    6e66:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6e69:	89 d0                	mov    %edx,%eax
    6e6b:	c1 e0 03             	shl    $0x3,%eax
    6e6e:	01 d0                	add    %edx,%eax
    6e70:	c1 e0 02             	shl    $0x2,%eax
    6e73:	01 d0                	add    %edx,%eax
    6e75:	01 c8                	add    %ecx,%eax
    6e77:	83 c0 14             	add    $0x14,%eax
    6e7a:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    6e81:	89 d0                	mov    %edx,%eax
    6e83:	01 c0                	add    %eax,%eax
    6e85:	01 d0                	add    %edx,%eax
    6e87:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    6e8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6e8d:	8d 48 01             	lea    0x1(%eax),%ecx
    6e90:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6e93:	89 d0                	mov    %edx,%eax
    6e95:	c1 e0 03             	shl    $0x3,%eax
    6e98:	01 d0                	add    %edx,%eax
    6e9a:	c1 e0 02             	shl    $0x2,%eax
    6e9d:	01 d0                	add    %edx,%eax
    6e9f:	01 c8                	add    %ecx,%eax
    6ea1:	83 c0 14             	add    $0x14,%eax
    6ea4:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    6eab:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6eae:	89 d0                	mov    %edx,%eax
    6eb0:	c1 e0 03             	shl    $0x3,%eax
    6eb3:	01 d0                	add    %edx,%eax
    6eb5:	c1 e0 02             	shl    $0x2,%eax
    6eb8:	01 d0                	add    %edx,%eax
    6eba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6ebd:	01 d0                	add    %edx,%eax
    6ebf:	83 c0 14             	add    $0x14,%eax
    6ec2:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    6ec9:	29 c1                	sub    %eax,%ecx
    6ecb:	89 c8                	mov    %ecx,%eax
    6ecd:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6ed0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6ed3:	89 d0                	mov    %edx,%eax
    6ed5:	c1 e0 03             	shl    $0x3,%eax
    6ed8:	01 d0                	add    %edx,%eax
    6eda:	c1 e0 02             	shl    $0x2,%eax
    6edd:	01 d0                	add    %edx,%eax
    6edf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6ee2:	01 d0                	add    %edx,%eax
    6ee4:	83 c0 14             	add    $0x14,%eax
    6ee7:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    6eee:	89 d0                	mov    %edx,%eax
    6ef0:	01 c0                	add    %eax,%eax
    6ef2:	01 d0                	add    %edx,%eax
    6ef4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    6ef7:	eb 27                	jmp    6f20 <III_dequantize_sample+0x371>
    6ef9:	eb 25                	jmp    6f20 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6efb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6eff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6f02:	8d 48 01             	lea    0x1(%eax),%ecx
    6f05:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6f08:	89 d0                	mov    %edx,%eax
    6f0a:	c1 e0 03             	shl    $0x3,%eax
    6f0d:	01 d0                	add    %edx,%eax
    6f0f:	c1 e0 02             	shl    $0x2,%eax
    6f12:	01 d0                	add    %edx,%eax
    6f14:	01 c8                	add    %ecx,%eax
    6f16:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    6f1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    6f20:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6f23:	89 d0                	mov    %edx,%eax
    6f25:	c1 e0 03             	shl    $0x3,%eax
    6f28:	01 d0                	add    %edx,%eax
    6f2a:	c1 e0 04             	shl    $0x4,%eax
    6f2d:	89 c2                	mov    %eax,%edx
    6f2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f32:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6f35:	8b 45 14             	mov    0x14(%ebp),%eax
    6f38:	8b 40 08             	mov    0x8(%eax),%eax
    6f3b:	ba 00 00 00 00       	mov    $0x0,%edx
    6f40:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6f43:	89 55 cc             	mov    %edx,-0x34(%ebp)
    6f46:	df 6d c8             	fildll -0x38(%ebp)
    6f49:	dd 05 10 bd 00 00    	fldl   0xbd10
    6f4f:	de e9                	fsubrp %st,%st(1)
    6f51:	dd 05 18 bd 00 00    	fldl   0xbd18
    6f57:	de c9                	fmulp  %st,%st(1)
    6f59:	dd 5c 24 08          	fstpl  0x8(%esp)
    6f5d:	dd 05 20 bd 00 00    	fldl   0xbd20
    6f63:	dd 1c 24             	fstpl  (%esp)
    6f66:	e8 0c c1 ff ff       	call   3077 <pow>
    6f6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f6e:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    6f71:	8b 45 14             	mov    0x14(%ebp),%eax
    6f74:	8b 40 10             	mov    0x10(%eax),%eax
    6f77:	85 c0                	test   %eax,%eax
    6f79:	0f 84 86 01 00 00    	je     7105 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    6f7f:	8b 45 14             	mov    0x14(%ebp),%eax
    6f82:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    6f85:	83 f8 02             	cmp    $0x2,%eax
    6f88:	75 0a                	jne    6f94 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    6f8a:	8b 45 14             	mov    0x14(%ebp),%eax
    6f8d:	8b 40 18             	mov    0x18(%eax),%eax
    6f90:	85 c0                	test   %eax,%eax
    6f92:	74 27                	je     6fbb <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6f94:	8b 45 14             	mov    0x14(%ebp),%eax
    6f97:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    6f9a:	83 f8 02             	cmp    $0x2,%eax
    6f9d:	0f 85 62 01 00 00    	jne    7105 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6fa3:	8b 45 14             	mov    0x14(%ebp),%eax
    6fa6:	8b 40 18             	mov    0x18(%eax),%eax
    6fa9:	85 c0                	test   %eax,%eax
    6fab:	0f 84 54 01 00 00    	je     7105 <III_dequantize_sample+0x556>
    6fb1:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6fb5:	0f 8e 4a 01 00 00    	jle    7105 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    6fbb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6fbe:	89 d0                	mov    %edx,%eax
    6fc0:	c1 e0 03             	shl    $0x3,%eax
    6fc3:	01 d0                	add    %edx,%eax
    6fc5:	c1 e0 04             	shl    $0x4,%eax
    6fc8:	89 c2                	mov    %eax,%edx
    6fca:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fcd:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6fd0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6fd3:	89 d0                	mov    %edx,%eax
    6fd5:	c1 e0 03             	shl    $0x3,%eax
    6fd8:	01 d0                	add    %edx,%eax
    6fda:	c1 e0 04             	shl    $0x4,%eax
    6fdd:	89 c2                	mov    %eax,%edx
    6fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
    6fe2:	01 c2                	add    %eax,%edx
    6fe4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fe7:	dd 04 c2             	fldl   (%edx,%eax,8)
    6fea:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    6fed:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ff0:	89 d0                	mov    %edx,%eax
    6ff2:	c1 e0 03             	shl    $0x3,%eax
    6ff5:	01 d0                	add    %edx,%eax
    6ff7:	01 c0                	add    %eax,%eax
    6ff9:	89 c2                	mov    %eax,%edx
    6ffb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ffe:	01 d0                	add    %edx,%eax
    7000:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    7003:	99                   	cltd   
    7004:	f7 7d e0             	idivl  -0x20(%ebp)
    7007:	89 c2                	mov    %eax,%edx
    7009:	8b 45 14             	mov    0x14(%ebp),%eax
    700c:	83 c2 08             	add    $0x8,%edx
    700f:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    7013:	ba 00 00 00 00       	mov    $0x0,%edx
    7018:	89 45 c8             	mov    %eax,-0x38(%ebp)
    701b:	89 55 cc             	mov    %edx,-0x34(%ebp)
    701e:	df 6d c8             	fildll -0x38(%ebp)
    7021:	dd 05 28 bd 00 00    	fldl   0xbd28
    7027:	de c9                	fmulp  %st,%st(1)
    7029:	dd 5c 24 08          	fstpl  0x8(%esp)
    702d:	dd 05 20 bd 00 00    	fldl   0xbd20
    7033:	dd 1c 24             	fstpl  (%esp)
    7036:	e8 3c c0 ff ff       	call   3077 <pow>
    703b:	dc 4d c0             	fmull  -0x40(%ebp)
    703e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7041:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    7044:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7047:	89 d0                	mov    %edx,%eax
    7049:	c1 e0 03             	shl    $0x3,%eax
    704c:	01 d0                	add    %edx,%eax
    704e:	c1 e0 04             	shl    $0x4,%eax
    7051:	89 c2                	mov    %eax,%edx
    7053:	8b 45 0c             	mov    0xc(%ebp),%eax
    7056:	8d 34 02             	lea    (%edx,%eax,1),%esi
    7059:	8b 55 f0             	mov    -0x10(%ebp),%edx
    705c:	89 d0                	mov    %edx,%eax
    705e:	c1 e0 03             	shl    $0x3,%eax
    7061:	01 d0                	add    %edx,%eax
    7063:	c1 e0 04             	shl    $0x4,%eax
    7066:	89 c2                	mov    %eax,%edx
    7068:	8b 45 0c             	mov    0xc(%ebp),%eax
    706b:	01 c2                	add    %eax,%edx
    706d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7070:	dd 04 c2             	fldl   (%edx,%eax,8)
    7073:	dd 5d c0             	fstpl  -0x40(%ebp)
    7076:	8b 45 14             	mov    0x14(%ebp),%eax
    7079:	8b 40 40             	mov    0x40(%eax),%eax
    707c:	ba 00 00 00 00       	mov    $0x0,%edx
    7081:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7084:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7087:	df 6d c8             	fildll -0x38(%ebp)
    708a:	d9 e8                	fld1   
    708c:	de c1                	faddp  %st,%st(1)
    708e:	dd 05 30 bd 00 00    	fldl   0xbd30
    7094:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    7096:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7099:	89 d0                	mov    %edx,%eax
    709b:	c1 e0 03             	shl    $0x3,%eax
    709e:	01 d0                	add    %edx,%eax
    70a0:	01 c0                	add    %eax,%eax
    70a2:	89 c2                	mov    %eax,%edx
    70a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    70a7:	01 d0                	add    %edx,%eax
    70a9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    70ac:	99                   	cltd   
    70ad:	f7 7d e0             	idivl  -0x20(%ebp)
    70b0:	89 c2                	mov    %eax,%edx
    70b2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    70b5:	8b 4d 18             	mov    0x18(%ebp),%ecx
    70b8:	89 d0                	mov    %edx,%eax
    70ba:	01 c0                	add    %eax,%eax
    70bc:	01 d0                	add    %edx,%eax
    70be:	c1 e0 02             	shl    $0x2,%eax
    70c1:	01 d0                	add    %edx,%eax
    70c3:	89 ca                	mov    %ecx,%edx
    70c5:	01 d2                	add    %edx,%edx
    70c7:	89 d1                	mov    %edx,%ecx
    70c9:	c1 e1 05             	shl    $0x5,%ecx
    70cc:	29 d1                	sub    %edx,%ecx
    70ce:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    70d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    70d4:	01 d0                	add    %edx,%eax
    70d6:	83 c0 14             	add    $0x14,%eax
    70d9:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    70dd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    70e0:	db 45 d4             	fildl  -0x2c(%ebp)
    70e3:	de c9                	fmulp  %st,%st(1)
    70e5:	dd 5c 24 08          	fstpl  0x8(%esp)
    70e9:	dd 05 20 bd 00 00    	fldl   0xbd20
    70ef:	dd 1c 24             	fstpl  (%esp)
    70f2:	e8 80 bf ff ff       	call   3077 <pow>
    70f7:	dc 4d c0             	fmull  -0x40(%ebp)
    70fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    70fd:	dd 1c c6             	fstpl  (%esi,%eax,8)
    7100:	e9 ab 00 00 00       	jmp    71b0 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    7105:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7108:	89 d0                	mov    %edx,%eax
    710a:	c1 e0 03             	shl    $0x3,%eax
    710d:	01 d0                	add    %edx,%eax
    710f:	c1 e0 04             	shl    $0x4,%eax
    7112:	89 c2                	mov    %eax,%edx
    7114:	8b 45 0c             	mov    0xc(%ebp),%eax
    7117:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    711a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    711d:	89 d0                	mov    %edx,%eax
    711f:	c1 e0 03             	shl    $0x3,%eax
    7122:	01 d0                	add    %edx,%eax
    7124:	c1 e0 04             	shl    $0x4,%eax
    7127:	89 c2                	mov    %eax,%edx
    7129:	8b 45 0c             	mov    0xc(%ebp),%eax
    712c:	01 c2                	add    %eax,%edx
    712e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7131:	dd 04 c2             	fldl   (%edx,%eax,8)
    7134:	dd 5d c0             	fstpl  -0x40(%ebp)
    7137:	8b 45 14             	mov    0x14(%ebp),%eax
    713a:	8b 40 40             	mov    0x40(%eax),%eax
    713d:	ba 00 00 00 00       	mov    $0x0,%edx
    7142:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7145:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7148:	df 6d c8             	fildll -0x38(%ebp)
    714b:	d9 e8                	fld1   
    714d:	de c1                	faddp  %st,%st(1)
    714f:	dd 05 30 bd 00 00    	fldl   0xbd30
    7155:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    7157:	8b 4d 10             	mov    0x10(%ebp),%ecx
    715a:	8b 45 18             	mov    0x18(%ebp),%eax
    715d:	01 c0                	add    %eax,%eax
    715f:	89 c2                	mov    %eax,%edx
    7161:	c1 e2 05             	shl    $0x5,%edx
    7164:	29 c2                	sub    %eax,%edx
    7166:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7169:	01 d0                	add    %edx,%eax
    716b:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    716e:	89 c2                	mov    %eax,%edx
    7170:	8b 45 14             	mov    0x14(%ebp),%eax
    7173:	8b 48 3c             	mov    0x3c(%eax),%ecx
    7176:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7179:	8b 04 85 c0 d0 00 00 	mov    0xd0c0(,%eax,4),%eax
    7180:	0f af c1             	imul   %ecx,%eax
    7183:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    7185:	ba 00 00 00 00       	mov    $0x0,%edx
    718a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    718d:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7190:	df 6d c8             	fildll -0x38(%ebp)
    7193:	de c9                	fmulp  %st,%st(1)
    7195:	dd 5c 24 08          	fstpl  0x8(%esp)
    7199:	dd 05 20 bd 00 00    	fldl   0xbd20
    719f:	dd 1c 24             	fstpl  (%esp)
    71a2:	e8 d0 be ff ff       	call   3077 <pow>
    71a7:	dc 4d c0             	fmull  -0x40(%ebp)
    71aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71ad:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    71b0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    71b3:	89 d0                	mov    %edx,%eax
    71b5:	c1 e0 03             	shl    $0x3,%eax
    71b8:	01 d0                	add    %edx,%eax
    71ba:	c1 e0 03             	shl    $0x3,%eax
    71bd:	89 c2                	mov    %eax,%edx
    71bf:	8b 45 08             	mov    0x8(%ebp),%eax
    71c2:	01 c2                	add    %eax,%edx
    71c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71c7:	8b 04 82             	mov    (%edx,%eax,4),%eax
    71ca:	c1 e8 1f             	shr    $0x1f,%eax
    71cd:	0f b6 c0             	movzbl %al,%eax
    71d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    71d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    71d6:	89 d0                	mov    %edx,%eax
    71d8:	c1 e0 03             	shl    $0x3,%eax
    71db:	01 d0                	add    %edx,%eax
    71dd:	c1 e0 04             	shl    $0x4,%eax
    71e0:	89 c2                	mov    %eax,%edx
    71e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    71e5:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    71e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    71eb:	89 d0                	mov    %edx,%eax
    71ed:	c1 e0 03             	shl    $0x3,%eax
    71f0:	01 d0                	add    %edx,%eax
    71f2:	c1 e0 04             	shl    $0x4,%eax
    71f5:	89 c2                	mov    %eax,%edx
    71f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    71fa:	01 c2                	add    %eax,%edx
    71fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    71ff:	dd 04 c2             	fldl   (%edx,%eax,8)
    7202:	dd 5d c0             	fstpl  -0x40(%ebp)
    7205:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7208:	89 d0                	mov    %edx,%eax
    720a:	c1 e0 03             	shl    $0x3,%eax
    720d:	01 d0                	add    %edx,%eax
    720f:	c1 e0 03             	shl    $0x3,%eax
    7212:	89 c2                	mov    %eax,%edx
    7214:	8b 45 08             	mov    0x8(%ebp),%eax
    7217:	01 c2                	add    %eax,%edx
    7219:	8b 45 f4             	mov    -0xc(%ebp),%eax
    721c:	8b 04 82             	mov    (%edx,%eax,4),%eax
    721f:	89 04 24             	mov    %eax,(%esp)
    7222:	e8 47 bd ff ff       	call   2f6e <abs>
    7227:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    722a:	db 45 d4             	fildl  -0x2c(%ebp)
    722d:	dd 05 38 bd 00 00    	fldl   0xbd38
    7233:	dd 5c 24 08          	fstpl  0x8(%esp)
    7237:	dd 1c 24             	fstpl  (%esp)
    723a:	e8 38 be ff ff       	call   3077 <pow>
    723f:	dc 4d c0             	fmull  -0x40(%ebp)
    7242:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7245:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    7248:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    724c:	74 37                	je     7285 <III_dequantize_sample+0x6d6>
    724e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7251:	89 d0                	mov    %edx,%eax
    7253:	c1 e0 03             	shl    $0x3,%eax
    7256:	01 d0                	add    %edx,%eax
    7258:	c1 e0 04             	shl    $0x4,%eax
    725b:	89 c2                	mov    %eax,%edx
    725d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7260:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7263:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7266:	89 d0                	mov    %edx,%eax
    7268:	c1 e0 03             	shl    $0x3,%eax
    726b:	01 d0                	add    %edx,%eax
    726d:	c1 e0 04             	shl    $0x4,%eax
    7270:	89 c2                	mov    %eax,%edx
    7272:	8b 45 0c             	mov    0xc(%ebp),%eax
    7275:	01 c2                	add    %eax,%edx
    7277:	8b 45 f4             	mov    -0xc(%ebp),%eax
    727a:	dd 04 c2             	fldl   (%edx,%eax,8)
    727d:	d9 e0                	fchs   
    727f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7282:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    7285:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7289:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    728d:	0f 8e d3 f9 ff ff    	jle    6c66 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    7293:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7297:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    729b:	0f 8e b9 f9 ff ff    	jle    6c5a <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    72a1:	83 c4 50             	add    $0x50,%esp
    72a4:	5b                   	pop    %ebx
    72a5:	5e                   	pop    %esi
    72a6:	5d                   	pop    %ebp
    72a7:	c3                   	ret    

000072a8 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    72a8:	55                   	push   %ebp
    72a9:	89 e5                	mov    %esp,%ebp
    72ab:	57                   	push   %edi
    72ac:	56                   	push   %esi
    72ad:	53                   	push   %ebx
    72ae:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    72b1:	8b 45 14             	mov    0x14(%ebp),%eax
    72b4:	8b 00                	mov    (%eax),%eax
    72b6:	8b 40 10             	mov    0x10(%eax),%eax
    72b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    72bc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    72c3:	eb 33                	jmp    72f8 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    72c5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    72cc:	eb 20                	jmp    72ee <III_reorder+0x46>
         ro[sb][ss] = 0;
    72ce:	8b 55 e0             	mov    -0x20(%ebp),%edx
    72d1:	89 d0                	mov    %edx,%eax
    72d3:	c1 e0 03             	shl    $0x3,%eax
    72d6:	01 d0                	add    %edx,%eax
    72d8:	c1 e0 04             	shl    $0x4,%eax
    72db:	89 c2                	mov    %eax,%edx
    72dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    72e0:	01 c2                	add    %eax,%edx
    72e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    72e5:	d9 ee                	fldz   
    72e7:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    72ea:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    72ee:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    72f2:	7e da                	jle    72ce <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    72f4:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    72f8:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    72fc:	7e c7                	jle    72c5 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    72fe:	8b 45 10             	mov    0x10(%ebp),%eax
    7301:	8b 40 10             	mov    0x10(%eax),%eax
    7304:	85 c0                	test   %eax,%eax
    7306:	0f 84 af 03 00 00    	je     76bb <III_reorder+0x413>
    730c:	8b 45 10             	mov    0x10(%ebp),%eax
    730f:	8b 40 14             	mov    0x14(%eax),%eax
    7312:	83 f8 02             	cmp    $0x2,%eax
    7315:	0f 85 a0 03 00 00    	jne    76bb <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    731b:	8b 45 10             	mov    0x10(%ebp),%eax
    731e:	8b 40 18             	mov    0x18(%eax),%eax
    7321:	85 c0                	test   %eax,%eax
    7323:	0f 84 00 02 00 00    	je     7529 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    7329:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    7330:	eb 4c                	jmp    737e <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    7332:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    7339:	eb 39                	jmp    7374 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    733b:	8b 55 e0             	mov    -0x20(%ebp),%edx
    733e:	89 d0                	mov    %edx,%eax
    7340:	c1 e0 03             	shl    $0x3,%eax
    7343:	01 d0                	add    %edx,%eax
    7345:	c1 e0 04             	shl    $0x4,%eax
    7348:	89 c2                	mov    %eax,%edx
    734a:	8b 45 0c             	mov    0xc(%ebp),%eax
    734d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7350:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7353:	89 d0                	mov    %edx,%eax
    7355:	c1 e0 03             	shl    $0x3,%eax
    7358:	01 d0                	add    %edx,%eax
    735a:	c1 e0 04             	shl    $0x4,%eax
    735d:	89 c2                	mov    %eax,%edx
    735f:	8b 45 08             	mov    0x8(%ebp),%eax
    7362:	01 c2                	add    %eax,%edx
    7364:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7367:	dd 04 c2             	fldl   (%edx,%eax,8)
    736a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    736d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    7370:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    7374:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    7378:	7e c1                	jle    733b <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    737a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    737e:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    7382:	7e ae                	jle    7332 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    7384:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    738b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    738e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7394:	05 5c cf 00 00       	add    $0xcf5c,%eax
    7399:	8b 40 0c             	mov    0xc(%eax),%eax
    739c:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    739f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    73a2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    73a8:	05 60 cf 00 00       	add    $0xcf60,%eax
    73ad:	8b 40 0c             	mov    0xc(%eax),%eax
    73b0:	2b 45 e8             	sub    -0x18(%ebp),%eax
    73b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    73b6:	e9 5f 01 00 00       	jmp    751a <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    73bb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    73c2:	e9 fd 00 00 00       	jmp    74c4 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    73c7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    73ce:	e9 e1 00 00 00       	jmp    74b4 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    73d3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    73d6:	89 d0                	mov    %edx,%eax
    73d8:	01 c0                	add    %eax,%eax
    73da:	01 c2                	add    %eax,%edx
    73dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    73df:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    73e3:	01 c2                	add    %eax,%edx
    73e5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    73e8:	01 d0                	add    %edx,%eax
    73ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    73ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    73f0:	89 d0                	mov    %edx,%eax
    73f2:	01 c0                	add    %eax,%eax
    73f4:	01 c2                	add    %eax,%edx
    73f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    73f9:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    73fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    73ff:	89 d0                	mov    %edx,%eax
    7401:	01 c0                	add    %eax,%eax
    7403:	01 d0                	add    %edx,%eax
    7405:	01 c8                	add    %ecx,%eax
    7407:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    740a:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    740d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7412:	89 c8                	mov    %ecx,%eax
    7414:	f7 ea                	imul   %edx
    7416:	c1 fa 02             	sar    $0x2,%edx
    7419:	89 c8                	mov    %ecx,%eax
    741b:	c1 f8 1f             	sar    $0x1f,%eax
    741e:	29 c2                	sub    %eax,%edx
    7420:	89 d0                	mov    %edx,%eax
    7422:	89 c2                	mov    %eax,%edx
    7424:	89 d0                	mov    %edx,%eax
    7426:	c1 e0 03             	shl    $0x3,%eax
    7429:	01 d0                	add    %edx,%eax
    742b:	c1 e0 04             	shl    $0x4,%eax
    742e:	89 c2                	mov    %eax,%edx
    7430:	8b 45 0c             	mov    0xc(%ebp),%eax
    7433:	8d 34 02             	lea    (%edx,%eax,1),%esi
    7436:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    7439:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    743e:	89 d8                	mov    %ebx,%eax
    7440:	f7 ea                	imul   %edx
    7442:	c1 fa 02             	sar    $0x2,%edx
    7445:	89 d8                	mov    %ebx,%eax
    7447:	c1 f8 1f             	sar    $0x1f,%eax
    744a:	89 d1                	mov    %edx,%ecx
    744c:	29 c1                	sub    %eax,%ecx
    744e:	89 c8                	mov    %ecx,%eax
    7450:	c1 e0 03             	shl    $0x3,%eax
    7453:	01 c8                	add    %ecx,%eax
    7455:	01 c0                	add    %eax,%eax
    7457:	29 c3                	sub    %eax,%ebx
    7459:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    745b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    745e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7463:	89 d8                	mov    %ebx,%eax
    7465:	f7 ea                	imul   %edx
    7467:	c1 fa 02             	sar    $0x2,%edx
    746a:	89 d8                	mov    %ebx,%eax
    746c:	c1 f8 1f             	sar    $0x1f,%eax
    746f:	29 c2                	sub    %eax,%edx
    7471:	89 d0                	mov    %edx,%eax
    7473:	89 c2                	mov    %eax,%edx
    7475:	89 d0                	mov    %edx,%eax
    7477:	c1 e0 03             	shl    $0x3,%eax
    747a:	01 d0                	add    %edx,%eax
    747c:	c1 e0 04             	shl    $0x4,%eax
    747f:	89 c2                	mov    %eax,%edx
    7481:	8b 45 08             	mov    0x8(%ebp),%eax
    7484:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    7487:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    748a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    748f:	89 d8                	mov    %ebx,%eax
    7491:	f7 ea                	imul   %edx
    7493:	c1 fa 02             	sar    $0x2,%edx
    7496:	89 d8                	mov    %ebx,%eax
    7498:	c1 f8 1f             	sar    $0x1f,%eax
    749b:	29 c2                	sub    %eax,%edx
    749d:	89 d0                	mov    %edx,%eax
    749f:	c1 e0 03             	shl    $0x3,%eax
    74a2:	01 d0                	add    %edx,%eax
    74a4:	01 c0                	add    %eax,%eax
    74a6:	29 c3                	sub    %eax,%ebx
    74a8:	89 da                	mov    %ebx,%edx
    74aa:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    74ad:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    74b0:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    74b4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    74b7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    74ba:	0f 8c 13 ff ff ff    	jl     73d3 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    74c0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    74c4:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    74c8:	0f 8e f9 fe ff ff    	jle    73c7 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    74ce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    74d2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    74d5:	89 d0                	mov    %edx,%eax
    74d7:	c1 e0 03             	shl    $0x3,%eax
    74da:	01 d0                	add    %edx,%eax
    74dc:	c1 e0 02             	shl    $0x2,%eax
    74df:	01 d0                	add    %edx,%eax
    74e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    74e4:	01 d0                	add    %edx,%eax
    74e6:	83 c0 14             	add    $0x14,%eax
    74e9:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    74f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    74f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    74f6:	8d 48 01             	lea    0x1(%eax),%ecx
    74f9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    74fc:	89 d0                	mov    %edx,%eax
    74fe:	c1 e0 03             	shl    $0x3,%eax
    7501:	01 d0                	add    %edx,%eax
    7503:	c1 e0 02             	shl    $0x2,%eax
    7506:	01 d0                	add    %edx,%eax
    7508:	01 c8                	add    %ecx,%eax
    750a:	83 c0 14             	add    $0x14,%eax
    750d:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    7514:	2b 45 e8             	sub    -0x18(%ebp),%eax
    7517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    751a:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    751e:	0f 8e 97 fe ff ff    	jle    73bb <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    7524:	e9 ed 01 00 00       	jmp    7716 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    7529:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7530:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7537:	8b 45 d0             	mov    -0x30(%ebp),%eax
    753a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7540:	05 54 cf 00 00       	add    $0xcf54,%eax
    7545:	8b 40 0c             	mov    0xc(%eax),%eax
    7548:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    754b:	e9 5f 01 00 00       	jmp    76af <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    7550:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    7557:	e9 fd 00 00 00       	jmp    7659 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    755c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    7563:	e9 e1 00 00 00       	jmp    7649 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    7568:	8b 55 e8             	mov    -0x18(%ebp),%edx
    756b:	89 d0                	mov    %edx,%eax
    756d:	01 c0                	add    %eax,%eax
    756f:	01 c2                	add    %eax,%edx
    7571:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7574:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    7578:	01 c2                	add    %eax,%edx
    757a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    757d:	01 d0                	add    %edx,%eax
    757f:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    7582:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7585:	89 d0                	mov    %edx,%eax
    7587:	01 c0                	add    %eax,%eax
    7589:	01 c2                	add    %eax,%edx
    758b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    758e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7591:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7594:	89 d0                	mov    %edx,%eax
    7596:	01 c0                	add    %eax,%eax
    7598:	01 d0                	add    %edx,%eax
    759a:	01 c8                	add    %ecx,%eax
    759c:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    759f:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    75a2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    75a7:	89 c8                	mov    %ecx,%eax
    75a9:	f7 ea                	imul   %edx
    75ab:	c1 fa 02             	sar    $0x2,%edx
    75ae:	89 c8                	mov    %ecx,%eax
    75b0:	c1 f8 1f             	sar    $0x1f,%eax
    75b3:	29 c2                	sub    %eax,%edx
    75b5:	89 d0                	mov    %edx,%eax
    75b7:	89 c2                	mov    %eax,%edx
    75b9:	89 d0                	mov    %edx,%eax
    75bb:	c1 e0 03             	shl    $0x3,%eax
    75be:	01 d0                	add    %edx,%eax
    75c0:	c1 e0 04             	shl    $0x4,%eax
    75c3:	89 c2                	mov    %eax,%edx
    75c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    75c8:	8d 34 02             	lea    (%edx,%eax,1),%esi
    75cb:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    75ce:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    75d3:	89 d8                	mov    %ebx,%eax
    75d5:	f7 ea                	imul   %edx
    75d7:	c1 fa 02             	sar    $0x2,%edx
    75da:	89 d8                	mov    %ebx,%eax
    75dc:	c1 f8 1f             	sar    $0x1f,%eax
    75df:	89 d1                	mov    %edx,%ecx
    75e1:	29 c1                	sub    %eax,%ecx
    75e3:	89 c8                	mov    %ecx,%eax
    75e5:	c1 e0 03             	shl    $0x3,%eax
    75e8:	01 c8                	add    %ecx,%eax
    75ea:	01 c0                	add    %eax,%eax
    75ec:	29 c3                	sub    %eax,%ebx
    75ee:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    75f0:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    75f3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    75f8:	89 d8                	mov    %ebx,%eax
    75fa:	f7 ea                	imul   %edx
    75fc:	c1 fa 02             	sar    $0x2,%edx
    75ff:	89 d8                	mov    %ebx,%eax
    7601:	c1 f8 1f             	sar    $0x1f,%eax
    7604:	29 c2                	sub    %eax,%edx
    7606:	89 d0                	mov    %edx,%eax
    7608:	89 c2                	mov    %eax,%edx
    760a:	89 d0                	mov    %edx,%eax
    760c:	c1 e0 03             	shl    $0x3,%eax
    760f:	01 d0                	add    %edx,%eax
    7611:	c1 e0 04             	shl    $0x4,%eax
    7614:	89 c2                	mov    %eax,%edx
    7616:	8b 45 08             	mov    0x8(%ebp),%eax
    7619:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    761c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    761f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7624:	89 d8                	mov    %ebx,%eax
    7626:	f7 ea                	imul   %edx
    7628:	c1 fa 02             	sar    $0x2,%edx
    762b:	89 d8                	mov    %ebx,%eax
    762d:	c1 f8 1f             	sar    $0x1f,%eax
    7630:	29 c2                	sub    %eax,%edx
    7632:	89 d0                	mov    %edx,%eax
    7634:	c1 e0 03             	shl    $0x3,%eax
    7637:	01 d0                	add    %edx,%eax
    7639:	01 c0                	add    %eax,%eax
    763b:	29 c3                	sub    %eax,%ebx
    763d:	89 da                	mov    %ebx,%edx
    763f:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    7642:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    7645:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    7649:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    764c:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    764f:	0f 8c 13 ff ff ff    	jl     7568 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    7655:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    7659:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    765d:	0f 8e f9 fe ff ff    	jle    755c <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    7663:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7667:	8b 55 d0             	mov    -0x30(%ebp),%edx
    766a:	89 d0                	mov    %edx,%eax
    766c:	c1 e0 03             	shl    $0x3,%eax
    766f:	01 d0                	add    %edx,%eax
    7671:	c1 e0 02             	shl    $0x2,%eax
    7674:	01 d0                	add    %edx,%eax
    7676:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7679:	01 d0                	add    %edx,%eax
    767b:	83 c0 14             	add    $0x14,%eax
    767e:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    7685:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    7688:	8b 45 ec             	mov    -0x14(%ebp),%eax
    768b:	8d 48 01             	lea    0x1(%eax),%ecx
    768e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    7691:	89 d0                	mov    %edx,%eax
    7693:	c1 e0 03             	shl    $0x3,%eax
    7696:	01 d0                	add    %edx,%eax
    7698:	c1 e0 02             	shl    $0x2,%eax
    769b:	01 d0                	add    %edx,%eax
    769d:	01 c8                	add    %ecx,%eax
    769f:	83 c0 14             	add    $0x14,%eax
    76a2:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    76a9:	2b 45 e8             	sub    -0x18(%ebp),%eax
    76ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    76af:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    76b3:	0f 8e 97 fe ff ff    	jle    7550 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    76b9:	eb 5b                	jmp    7716 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    76bb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    76c2:	eb 4c                	jmp    7710 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    76c4:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    76cb:	eb 39                	jmp    7706 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    76cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    76d0:	89 d0                	mov    %edx,%eax
    76d2:	c1 e0 03             	shl    $0x3,%eax
    76d5:	01 d0                	add    %edx,%eax
    76d7:	c1 e0 04             	shl    $0x4,%eax
    76da:	89 c2                	mov    %eax,%edx
    76dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    76df:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    76e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    76e5:	89 d0                	mov    %edx,%eax
    76e7:	c1 e0 03             	shl    $0x3,%eax
    76ea:	01 d0                	add    %edx,%eax
    76ec:	c1 e0 04             	shl    $0x4,%eax
    76ef:	89 c2                	mov    %eax,%edx
    76f1:	8b 45 08             	mov    0x8(%ebp),%eax
    76f4:	01 c2                	add    %eax,%edx
    76f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    76f9:	dd 04 c2             	fldl   (%edx,%eax,8)
    76fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    76ff:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    7702:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    7706:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    770a:	7e c1                	jle    76cd <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    770c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    7710:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    7714:	7e ae                	jle    76c4 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    7716:	83 c4 34             	add    $0x34,%esp
    7719:	5b                   	pop    %ebx
    771a:	5e                   	pop    %esi
    771b:	5f                   	pop    %edi
    771c:	5d                   	pop    %ebp
    771d:	c3                   	ret    

0000771e <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    771e:	55                   	push   %ebp
    771f:	89 e5                	mov    %esp,%ebp
    7721:	56                   	push   %esi
    7722:	53                   	push   %ebx
    7723:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    7729:	8b 45 18             	mov    0x18(%ebp),%eax
    772c:	8b 00                	mov    (%eax),%eax
    772e:	8b 40 10             	mov    0x10(%eax),%eax
    7731:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    7734:	8b 45 18             	mov    0x18(%ebp),%eax
    7737:	8b 40 08             	mov    0x8(%eax),%eax
    773a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    773d:	8b 45 18             	mov    0x18(%ebp),%eax
    7740:	8b 00                	mov    (%eax),%eax
    7742:	8b 40 1c             	mov    0x1c(%eax),%eax
    7745:	83 f8 01             	cmp    $0x1,%eax
    7748:	75 16                	jne    7760 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    774a:	8b 45 18             	mov    0x18(%ebp),%eax
    774d:	8b 00                	mov    (%eax),%eax
    774f:	8b 40 20             	mov    0x20(%eax),%eax
    7752:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    7755:	85 c0                	test   %eax,%eax
    7757:	74 07                	je     7760 <III_stereo+0x42>
    7759:	b8 01 00 00 00       	mov    $0x1,%eax
    775e:	eb 05                	jmp    7765 <III_stereo+0x47>
    7760:	b8 00 00 00 00       	mov    $0x0,%eax
    7765:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    7768:	8b 45 18             	mov    0x18(%ebp),%eax
    776b:	8b 00                	mov    (%eax),%eax
    776d:	8b 40 1c             	mov    0x1c(%eax),%eax
    7770:	83 f8 01             	cmp    $0x1,%eax
    7773:	75 16                	jne    778b <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    7775:	8b 45 18             	mov    0x18(%ebp),%eax
    7778:	8b 00                	mov    (%eax),%eax
    777a:	8b 40 20             	mov    0x20(%eax),%eax
    777d:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    7780:	85 c0                	test   %eax,%eax
    7782:	74 07                	je     778b <III_stereo+0x6d>
    7784:	b8 01 00 00 00       	mov    $0x1,%eax
    7789:	eb 05                	jmp    7790 <III_stereo+0x72>
    778b:	b8 00 00 00 00       	mov    $0x0,%eax
    7790:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    7793:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    779a:	eb 12                	jmp    77ae <III_stereo+0x90>
      is_pos[i] = 7;
    779c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    779f:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    77a6:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    77aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    77ae:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    77b5:	7e e5                	jle    779c <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    77b7:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    77bb:	0f 85 18 0a 00 00    	jne    81d9 <III_stereo+0xabb>
    77c1:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    77c5:	0f 84 0e 0a 00 00    	je     81d9 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    77cb:	8b 45 14             	mov    0x14(%ebp),%eax
    77ce:	8b 40 10             	mov    0x10(%eax),%eax
    77d1:	85 c0                	test   %eax,%eax
    77d3:	0f 84 10 08 00 00    	je     7fe9 <III_stereo+0x8cb>
    77d9:	8b 45 14             	mov    0x14(%ebp),%eax
    77dc:	8b 40 14             	mov    0x14(%eax),%eax
    77df:	83 f8 02             	cmp    $0x2,%eax
    77e2:	0f 85 01 08 00 00    	jne    7fe9 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    77e8:	8b 45 14             	mov    0x14(%ebp),%eax
    77eb:	8b 40 18             	mov    0x18(%eax),%eax
    77ee:	85 c0                	test   %eax,%eax
    77f0:	0f 84 d0 04 00 00    	je     7cc6 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    77f6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    77fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7804:	e9 1b 03 00 00       	jmp    7b24 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    7809:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    7810:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7817:	e9 0f 01 00 00       	jmp    792b <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    781c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    781f:	8d 48 01             	lea    0x1(%eax),%ecx
    7822:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7825:	89 d0                	mov    %edx,%eax
    7827:	c1 e0 03             	shl    $0x3,%eax
    782a:	01 d0                	add    %edx,%eax
    782c:	c1 e0 02             	shl    $0x2,%eax
    782f:	01 d0                	add    %edx,%eax
    7831:	01 c8                	add    %ecx,%eax
    7833:	83 c0 14             	add    $0x14,%eax
    7836:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
    783d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7840:	89 d0                	mov    %edx,%eax
    7842:	c1 e0 03             	shl    $0x3,%eax
    7845:	01 d0                	add    %edx,%eax
    7847:	c1 e0 02             	shl    $0x2,%eax
    784a:	01 d0                	add    %edx,%eax
    784c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    784f:	01 d0                	add    %edx,%eax
    7851:	83 c0 14             	add    $0x14,%eax
    7854:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    785b:	29 c1                	sub    %eax,%ecx
    785d:	89 c8                	mov    %ecx,%eax
    785f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    7862:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7865:	89 d0                	mov    %edx,%eax
    7867:	c1 e0 03             	shl    $0x3,%eax
    786a:	01 d0                	add    %edx,%eax
    786c:	c1 e0 02             	shl    $0x2,%eax
    786f:	01 d0                	add    %edx,%eax
    7871:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7874:	01 d0                	add    %edx,%eax
    7876:	83 c0 14             	add    $0x14,%eax
    7879:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    7880:	89 d0                	mov    %edx,%eax
    7882:	01 c0                	add    %eax,%eax
    7884:	01 c2                	add    %eax,%edx
    7886:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7889:	83 c0 01             	add    $0x1,%eax
    788c:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    7890:	01 d0                	add    %edx,%eax
    7892:	83 e8 01             	sub    $0x1,%eax
    7895:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    7898:	e9 80 00 00 00       	jmp    791d <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    789d:	8b 45 08             	mov    0x8(%ebp),%eax
    78a0:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    78a6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    78a9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78ae:	89 c8                	mov    %ecx,%eax
    78b0:	f7 ea                	imul   %edx
    78b2:	c1 fa 02             	sar    $0x2,%edx
    78b5:	89 c8                	mov    %ecx,%eax
    78b7:	c1 f8 1f             	sar    $0x1f,%eax
    78ba:	89 d3                	mov    %edx,%ebx
    78bc:	29 c3                	sub    %eax,%ebx
    78be:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    78c1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    78c6:	89 c8                	mov    %ecx,%eax
    78c8:	f7 ea                	imul   %edx
    78ca:	c1 fa 02             	sar    $0x2,%edx
    78cd:	89 c8                	mov    %ecx,%eax
    78cf:	c1 f8 1f             	sar    $0x1f,%eax
    78d2:	29 c2                	sub    %eax,%edx
    78d4:	89 d0                	mov    %edx,%eax
    78d6:	c1 e0 03             	shl    $0x3,%eax
    78d9:	01 d0                	add    %edx,%eax
    78db:	01 c0                	add    %eax,%eax
    78dd:	29 c1                	sub    %eax,%ecx
    78df:	89 ca                	mov    %ecx,%edx
    78e1:	89 d8                	mov    %ebx,%eax
    78e3:	c1 e0 03             	shl    $0x3,%eax
    78e6:	01 d8                	add    %ebx,%eax
    78e8:	01 c0                	add    %eax,%eax
    78ea:	01 d0                	add    %edx,%eax
    78ec:	dd 04 c6             	fldl   (%esi,%eax,8)
    78ef:	d9 ee                	fldz   
    78f1:	df e9                	fucomip %st(1),%st
    78f3:	7a 0a                	jp     78ff <III_stereo+0x1e1>
    78f5:	d9 ee                	fldz   
    78f7:	df e9                	fucomip %st(1),%st
    78f9:	dd d8                	fstp   %st(0)
    78fb:	74 18                	je     7915 <III_stereo+0x1f7>
    78fd:	eb 02                	jmp    7901 <III_stereo+0x1e3>
    78ff:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    7901:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7904:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    7907:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    790e:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    7915:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    7919:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    791d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    7921:	0f 8f 76 ff ff ff    	jg     789d <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    7927:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    792b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    792f:	0f 8f e7 fe ff ff    	jg     781c <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    7935:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7938:	83 c0 01             	add    $0x1,%eax
    793b:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    793e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7941:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7944:	7e 0b                	jle    7951 <III_stereo+0x233>
                  max_sfb = sfb;
    7946:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7949:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    794c:	e9 f5 00 00 00       	jmp    7a46 <III_stereo+0x328>
    7951:	e9 f0 00 00 00       	jmp    7a46 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7956:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7959:	8d 48 01             	lea    0x1(%eax),%ecx
    795c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    795f:	89 d0                	mov    %edx,%eax
    7961:	c1 e0 03             	shl    $0x3,%eax
    7964:	01 d0                	add    %edx,%eax
    7966:	c1 e0 02             	shl    $0x2,%eax
    7969:	01 d0                	add    %edx,%eax
    796b:	01 c8                	add    %ecx,%eax
    796d:	83 c0 14             	add    $0x14,%eax
    7970:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
    7977:	8b 55 c8             	mov    -0x38(%ebp),%edx
    797a:	89 d0                	mov    %edx,%eax
    797c:	c1 e0 03             	shl    $0x3,%eax
    797f:	01 d0                	add    %edx,%eax
    7981:	c1 e0 02             	shl    $0x2,%eax
    7984:	01 d0                	add    %edx,%eax
    7986:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7989:	01 d0                	add    %edx,%eax
    798b:	83 c0 14             	add    $0x14,%eax
    798e:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    7995:	29 c1                	sub    %eax,%ecx
    7997:	89 c8                	mov    %ecx,%eax
    7999:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    799c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    799f:	89 d0                	mov    %edx,%eax
    79a1:	c1 e0 03             	shl    $0x3,%eax
    79a4:	01 d0                	add    %edx,%eax
    79a6:	c1 e0 02             	shl    $0x2,%eax
    79a9:	01 d0                	add    %edx,%eax
    79ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
    79ae:	01 d0                	add    %edx,%eax
    79b0:	83 c0 14             	add    $0x14,%eax
    79b3:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    79ba:	89 d0                	mov    %edx,%eax
    79bc:	01 c0                	add    %eax,%eax
    79be:	01 c2                	add    %eax,%edx
    79c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    79c3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    79c7:	01 d0                	add    %edx,%eax
    79c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    79cc:	eb 6e                	jmp    7a3c <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    79ce:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79d1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79d4:	89 d0                	mov    %edx,%eax
    79d6:	01 c0                	add    %eax,%eax
    79d8:	01 d0                	add    %edx,%eax
    79da:	c1 e0 02             	shl    $0x2,%eax
    79dd:	01 d0                	add    %edx,%eax
    79df:	8b 55 f4             	mov    -0xc(%ebp),%edx
    79e2:	01 d0                	add    %edx,%eax
    79e4:	83 c0 52             	add    $0x52,%eax
    79e7:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    79eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79ee:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    79f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    79f8:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    79ff:	83 f8 07             	cmp    $0x7,%eax
    7a02:	74 30                	je     7a34 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a07:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    7a0e:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    7a14:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    7a1a:	dd 05 40 bd 00 00    	fldl   0xbd40
    7a20:	de c9                	fmulp  %st,%st(1)
    7a22:	dd 1c 24             	fstpl  (%esp)
    7a25:	e8 1d b6 ff ff       	call   3047 <tan>
    7a2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7a2d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    7a34:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    7a38:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7a3c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7a40:	7f 8c                	jg     79ce <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    7a42:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    7a46:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7a4a:	0f 8e 06 ff ff ff    	jle    7956 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    7a50:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7a53:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7a59:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7a5e:	8b 50 0c             	mov    0xc(%eax),%edx
    7a61:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7a64:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7a6a:	05 78 cf 00 00       	add    $0xcf78,%eax
    7a6f:	8b 40 0c             	mov    0xc(%eax),%eax
    7a72:	29 c2                	sub    %eax,%edx
    7a74:	89 d0                	mov    %edx,%eax
    7a76:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    7a79:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7a7c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7a82:	05 78 cf 00 00       	add    $0xcf78,%eax
    7a87:	8b 50 0c             	mov    0xc(%eax),%edx
    7a8a:	89 d0                	mov    %edx,%eax
    7a8c:	01 c0                	add    %eax,%eax
    7a8e:	01 c2                	add    %eax,%edx
    7a90:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7a93:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7a97:	01 d0                	add    %edx,%eax
    7a99:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    7a9c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7a9f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7aa5:	05 80 cf 00 00       	add    $0xcf80,%eax
    7aaa:	8b 50 0c             	mov    0xc(%eax),%edx
    7aad:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7ab0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7ab6:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7abb:	8b 40 0c             	mov    0xc(%eax),%eax
    7abe:	29 c2                	sub    %eax,%edx
    7ac0:	89 d0                	mov    %edx,%eax
    7ac2:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    7ac5:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7ac8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7ace:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7ad3:	8b 50 0c             	mov    0xc(%eax),%edx
    7ad6:	89 d0                	mov    %edx,%eax
    7ad8:	01 c0                	add    %eax,%eax
    7ada:	01 c2                	add    %eax,%edx
    7adc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7adf:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7ae3:	01 d0                	add    %edx,%eax
    7ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    7ae8:	eb 30                	jmp    7b1a <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    7aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7aed:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    7af4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7af7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    7afe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b01:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    7b08:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b0b:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    7b12:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    7b16:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7b1a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7b1e:	7f ca                	jg     7aea <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    7b20:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7b24:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7b28:	0f 8e db fc ff ff    	jle    7809 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    7b2e:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    7b32:	0f 8f 89 01 00 00    	jg     7cc1 <III_stereo+0x5a3>
             {  i = 2;
    7b38:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    7b3f:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    7b46:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    7b4d:	eb 63                	jmp    7bb2 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    7b4f:	8b 45 08             	mov    0x8(%ebp),%eax
    7b52:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7b58:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b5b:	89 d0                	mov    %edx,%eax
    7b5d:	c1 e0 03             	shl    $0x3,%eax
    7b60:	01 d0                	add    %edx,%eax
    7b62:	01 c0                	add    %eax,%eax
    7b64:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7b67:	01 d0                	add    %edx,%eax
    7b69:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7b6c:	d9 ee                	fldz   
    7b6e:	df e9                	fucomip %st(1),%st
    7b70:	7a 0a                	jp     7b7c <III_stereo+0x45e>
    7b72:	d9 ee                	fldz   
    7b74:	df e9                	fucomip %st(1),%st
    7b76:	dd d8                	fstp   %st(0)
    7b78:	74 23                	je     7b9d <III_stereo+0x47f>
    7b7a:	eb 02                	jmp    7b7e <III_stereo+0x460>
    7b7c:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    7b7e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b81:	89 d0                	mov    %edx,%eax
    7b83:	c1 e0 03             	shl    $0x3,%eax
    7b86:	01 d0                	add    %edx,%eax
    7b88:	01 c0                	add    %eax,%eax
    7b8a:	89 c2                	mov    %eax,%edx
    7b8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7b8f:	01 d0                	add    %edx,%eax
    7b91:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    7b94:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    7b9b:	eb 15                	jmp    7bb2 <III_stereo+0x494>
                   } else
                   {  ss--;
    7b9d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    7ba1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    7ba5:	79 0b                	jns    7bb2 <III_stereo+0x494>
                      {  i--;
    7ba7:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    7bab:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    7bb2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7bb6:	79 97                	jns    7b4f <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    7bb8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    7bbf:	eb 04                	jmp    7bc5 <III_stereo+0x4a7>
                   i++;
    7bc1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    7bc5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7bc8:	89 d0                	mov    %edx,%eax
    7bca:	c1 e0 03             	shl    $0x3,%eax
    7bcd:	01 d0                	add    %edx,%eax
    7bcf:	c1 e0 02             	shl    $0x2,%eax
    7bd2:	01 d0                	add    %edx,%eax
    7bd4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bd7:	01 d0                	add    %edx,%eax
    7bd9:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    7be0:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7be3:	7e dc                	jle    7bc1 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    7be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7be8:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    7beb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7bee:	89 d0                	mov    %edx,%eax
    7bf0:	c1 e0 03             	shl    $0x3,%eax
    7bf3:	01 d0                	add    %edx,%eax
    7bf5:	c1 e0 02             	shl    $0x2,%eax
    7bf8:	01 d0                	add    %edx,%eax
    7bfa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bfd:	01 d0                	add    %edx,%eax
    7bff:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    7c06:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    7c09:	e9 a9 00 00 00       	jmp    7cb7 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    7c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c11:	8d 48 01             	lea    0x1(%eax),%ecx
    7c14:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7c17:	89 d0                	mov    %edx,%eax
    7c19:	c1 e0 03             	shl    $0x3,%eax
    7c1c:	01 d0                	add    %edx,%eax
    7c1e:	c1 e0 02             	shl    $0x2,%eax
    7c21:	01 d0                	add    %edx,%eax
    7c23:	01 c8                	add    %ecx,%eax
    7c25:	8b 0c 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%ecx
    7c2c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7c2f:	89 d0                	mov    %edx,%eax
    7c31:	c1 e0 03             	shl    $0x3,%eax
    7c34:	01 d0                	add    %edx,%eax
    7c36:	c1 e0 02             	shl    $0x2,%eax
    7c39:	01 d0                	add    %edx,%eax
    7c3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7c3e:	01 d0                	add    %edx,%eax
    7c40:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    7c47:	29 c1                	sub    %eax,%ecx
    7c49:	89 c8                	mov    %ecx,%eax
    7c4b:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    7c4e:	eb 5d                	jmp    7cad <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    7c50:	8b 45 10             	mov    0x10(%ebp),%eax
    7c53:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7c56:	83 c2 3e             	add    $0x3e,%edx
    7c59:	8b 14 90             	mov    (%eax,%edx,4),%edx
    7c5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c5f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    7c66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c69:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    7c70:	83 f8 07             	cmp    $0x7,%eax
    7c73:	74 30                	je     7ca5 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7c75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c78:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    7c7f:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    7c85:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    7c8b:	dd 05 40 bd 00 00    	fldl   0xbd40
    7c91:	de c9                	fmulp  %st,%st(1)
    7c93:	dd 1c 24             	fstpl  (%esp)
    7c96:	e8 ac b3 ff ff       	call   3047 <tan>
    7c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7c9e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    7ca5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    7ca9:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7cad:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7cb1:	7f 9d                	jg     7c50 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    7cb3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7cb7:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7cbb:	0f 8e 4d ff ff ff    	jle    7c0e <III_stereo+0x4f0>
    7cc1:	e9 1e 03 00 00       	jmp    7fe4 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    7cc6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7ccd:	e9 08 03 00 00       	jmp    7fda <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    7cd2:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    7cd9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7ce0:	e9 0f 01 00 00       	jmp    7df4 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7ce5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ce8:	8d 48 01             	lea    0x1(%eax),%ecx
    7ceb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7cee:	89 d0                	mov    %edx,%eax
    7cf0:	c1 e0 03             	shl    $0x3,%eax
    7cf3:	01 d0                	add    %edx,%eax
    7cf5:	c1 e0 02             	shl    $0x2,%eax
    7cf8:	01 d0                	add    %edx,%eax
    7cfa:	01 c8                	add    %ecx,%eax
    7cfc:	83 c0 14             	add    $0x14,%eax
    7cff:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
    7d06:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7d09:	89 d0                	mov    %edx,%eax
    7d0b:	c1 e0 03             	shl    $0x3,%eax
    7d0e:	01 d0                	add    %edx,%eax
    7d10:	c1 e0 02             	shl    $0x2,%eax
    7d13:	01 d0                	add    %edx,%eax
    7d15:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d18:	01 d0                	add    %edx,%eax
    7d1a:	83 c0 14             	add    $0x14,%eax
    7d1d:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    7d24:	29 c1                	sub    %eax,%ecx
    7d26:	89 c8                	mov    %ecx,%eax
    7d28:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    7d2b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7d2e:	89 d0                	mov    %edx,%eax
    7d30:	c1 e0 03             	shl    $0x3,%eax
    7d33:	01 d0                	add    %edx,%eax
    7d35:	c1 e0 02             	shl    $0x2,%eax
    7d38:	01 d0                	add    %edx,%eax
    7d3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d3d:	01 d0                	add    %edx,%eax
    7d3f:	83 c0 14             	add    $0x14,%eax
    7d42:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    7d49:	89 d0                	mov    %edx,%eax
    7d4b:	01 c0                	add    %eax,%eax
    7d4d:	01 c2                	add    %eax,%edx
    7d4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d52:	83 c0 01             	add    $0x1,%eax
    7d55:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    7d59:	01 d0                	add    %edx,%eax
    7d5b:	83 e8 01             	sub    $0x1,%eax
    7d5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    7d61:	e9 80 00 00 00       	jmp    7de6 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    7d66:	8b 45 08             	mov    0x8(%ebp),%eax
    7d69:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    7d6f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    7d72:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7d77:	89 c8                	mov    %ecx,%eax
    7d79:	f7 ea                	imul   %edx
    7d7b:	c1 fa 02             	sar    $0x2,%edx
    7d7e:	89 c8                	mov    %ecx,%eax
    7d80:	c1 f8 1f             	sar    $0x1f,%eax
    7d83:	89 d3                	mov    %edx,%ebx
    7d85:	29 c3                	sub    %eax,%ebx
    7d87:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    7d8a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7d8f:	89 c8                	mov    %ecx,%eax
    7d91:	f7 ea                	imul   %edx
    7d93:	c1 fa 02             	sar    $0x2,%edx
    7d96:	89 c8                	mov    %ecx,%eax
    7d98:	c1 f8 1f             	sar    $0x1f,%eax
    7d9b:	29 c2                	sub    %eax,%edx
    7d9d:	89 d0                	mov    %edx,%eax
    7d9f:	c1 e0 03             	shl    $0x3,%eax
    7da2:	01 d0                	add    %edx,%eax
    7da4:	01 c0                	add    %eax,%eax
    7da6:	29 c1                	sub    %eax,%ecx
    7da8:	89 ca                	mov    %ecx,%edx
    7daa:	89 d8                	mov    %ebx,%eax
    7dac:	c1 e0 03             	shl    $0x3,%eax
    7daf:	01 d8                	add    %ebx,%eax
    7db1:	01 c0                	add    %eax,%eax
    7db3:	01 d0                	add    %edx,%eax
    7db5:	dd 04 c6             	fldl   (%esi,%eax,8)
    7db8:	d9 ee                	fldz   
    7dba:	df e9                	fucomip %st(1),%st
    7dbc:	7a 0a                	jp     7dc8 <III_stereo+0x6aa>
    7dbe:	d9 ee                	fldz   
    7dc0:	df e9                	fucomip %st(1),%st
    7dc2:	dd d8                	fstp   %st(0)
    7dc4:	74 18                	je     7dde <III_stereo+0x6c0>
    7dc6:	eb 02                	jmp    7dca <III_stereo+0x6ac>
    7dc8:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    7dca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7dcd:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    7dd0:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    7dd7:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    7dde:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    7de2:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    7de6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    7dea:	0f 8f 76 ff ff ff    	jg     7d66 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    7df0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    7df4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7df8:	0f 89 e7 fe ff ff    	jns    7ce5 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    7dfe:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7e01:	83 c0 01             	add    $0x1,%eax
    7e04:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    7e07:	e9 f0 00 00 00       	jmp    7efc <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7e0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e0f:	8d 48 01             	lea    0x1(%eax),%ecx
    7e12:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7e15:	89 d0                	mov    %edx,%eax
    7e17:	c1 e0 03             	shl    $0x3,%eax
    7e1a:	01 d0                	add    %edx,%eax
    7e1c:	c1 e0 02             	shl    $0x2,%eax
    7e1f:	01 d0                	add    %edx,%eax
    7e21:	01 c8                	add    %ecx,%eax
    7e23:	83 c0 14             	add    $0x14,%eax
    7e26:	8b 0c 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%ecx
    7e2d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7e30:	89 d0                	mov    %edx,%eax
    7e32:	c1 e0 03             	shl    $0x3,%eax
    7e35:	01 d0                	add    %edx,%eax
    7e37:	c1 e0 02             	shl    $0x2,%eax
    7e3a:	01 d0                	add    %edx,%eax
    7e3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7e3f:	01 d0                	add    %edx,%eax
    7e41:	83 c0 14             	add    $0x14,%eax
    7e44:	8b 04 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%eax
    7e4b:	29 c1                	sub    %eax,%ecx
    7e4d:	89 c8                	mov    %ecx,%eax
    7e4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    7e52:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7e55:	89 d0                	mov    %edx,%eax
    7e57:	c1 e0 03             	shl    $0x3,%eax
    7e5a:	01 d0                	add    %edx,%eax
    7e5c:	c1 e0 02             	shl    $0x2,%eax
    7e5f:	01 d0                	add    %edx,%eax
    7e61:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7e64:	01 d0                	add    %edx,%eax
    7e66:	83 c0 14             	add    $0x14,%eax
    7e69:	8b 14 85 0c cf 00 00 	mov    0xcf0c(,%eax,4),%edx
    7e70:	89 d0                	mov    %edx,%eax
    7e72:	01 c0                	add    %eax,%eax
    7e74:	01 c2                	add    %eax,%edx
    7e76:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7e79:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7e7d:	01 d0                	add    %edx,%eax
    7e7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    7e82:	eb 6e                	jmp    7ef2 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    7e84:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7e87:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7e8a:	89 d0                	mov    %edx,%eax
    7e8c:	01 c0                	add    %eax,%eax
    7e8e:	01 d0                	add    %edx,%eax
    7e90:	c1 e0 02             	shl    $0x2,%eax
    7e93:	01 d0                	add    %edx,%eax
    7e95:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7e98:	01 d0                	add    %edx,%eax
    7e9a:	83 c0 52             	add    $0x52,%eax
    7e9d:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    7ea1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ea4:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    7eab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7eae:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    7eb5:	83 f8 07             	cmp    $0x7,%eax
    7eb8:	74 30                	je     7eea <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ebd:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    7ec4:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    7eca:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    7ed0:	dd 05 40 bd 00 00    	fldl   0xbd40
    7ed6:	de c9                	fmulp  %st,%st(1)
    7ed8:	dd 1c 24             	fstpl  (%esp)
    7edb:	e8 67 b1 ff ff       	call   3047 <tan>
    7ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ee3:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    7eea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    7eee:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7ef2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7ef6:	7f 8c                	jg     7e84 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    7ef8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    7efc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7f00:	0f 8e 06 ff ff ff    	jle    7e0c <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    7f06:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f09:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f0f:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7f14:	8b 50 0c             	mov    0xc(%eax),%edx
    7f17:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f1a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f20:	05 78 cf 00 00       	add    $0xcf78,%eax
    7f25:	8b 40 0c             	mov    0xc(%eax),%eax
    7f28:	29 c2                	sub    %eax,%edx
    7f2a:	89 d0                	mov    %edx,%eax
    7f2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    7f2f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f32:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f38:	05 78 cf 00 00       	add    $0xcf78,%eax
    7f3d:	8b 50 0c             	mov    0xc(%eax),%edx
    7f40:	89 d0                	mov    %edx,%eax
    7f42:	01 c0                	add    %eax,%eax
    7f44:	01 c2                	add    %eax,%edx
    7f46:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f49:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7f4d:	01 d0                	add    %edx,%eax
    7f4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    7f52:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f55:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f5b:	05 80 cf 00 00       	add    $0xcf80,%eax
    7f60:	8b 50 0c             	mov    0xc(%eax),%edx
    7f63:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f66:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f6c:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7f71:	8b 40 0c             	mov    0xc(%eax),%eax
    7f74:	29 c2                	sub    %eax,%edx
    7f76:	89 d0                	mov    %edx,%eax
    7f78:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    7f7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7f7e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f84:	05 7c cf 00 00       	add    $0xcf7c,%eax
    7f89:	8b 50 0c             	mov    0xc(%eax),%edx
    7f8c:	89 d0                	mov    %edx,%eax
    7f8e:	01 c0                	add    %eax,%eax
    7f90:	01 c2                	add    %eax,%edx
    7f92:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7f95:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7f99:	01 d0                	add    %edx,%eax
    7f9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    7f9e:	eb 30                	jmp    7fd0 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    7fa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fa3:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    7faa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fad:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    7fb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fb7:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    7fbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7fc1:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    7fc8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    7fcc:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7fd0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7fd4:	7f ca                	jg     7fa0 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    7fd6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7fda:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7fde:	0f 8e ee fc ff ff    	jle    7cd2 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    7fe4:	e9 f0 01 00 00       	jmp    81d9 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    7fe9:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    7ff0:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    7ff7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    7ffe:	eb 63                	jmp    8063 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    8000:	8b 45 08             	mov    0x8(%ebp),%eax
    8003:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8009:	8b 55 f0             	mov    -0x10(%ebp),%edx
    800c:	89 d0                	mov    %edx,%eax
    800e:	c1 e0 03             	shl    $0x3,%eax
    8011:	01 d0                	add    %edx,%eax
    8013:	01 c0                	add    %eax,%eax
    8015:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8018:	01 d0                	add    %edx,%eax
    801a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    801d:	d9 ee                	fldz   
    801f:	df e9                	fucomip %st(1),%st
    8021:	7a 0a                	jp     802d <III_stereo+0x90f>
    8023:	d9 ee                	fldz   
    8025:	df e9                	fucomip %st(1),%st
    8027:	dd d8                	fstp   %st(0)
    8029:	74 23                	je     804e <III_stereo+0x930>
    802b:	eb 02                	jmp    802f <III_stereo+0x911>
    802d:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    802f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8032:	89 d0                	mov    %edx,%eax
    8034:	c1 e0 03             	shl    $0x3,%eax
    8037:	01 d0                	add    %edx,%eax
    8039:	01 c0                	add    %eax,%eax
    803b:	89 c2                	mov    %eax,%edx
    803d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8040:	01 d0                	add    %edx,%eax
    8042:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    8045:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    804c:	eb 15                	jmp    8063 <III_stereo+0x945>
            } else
            {  ss--;
    804e:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    8052:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8056:	79 0b                	jns    8063 <III_stereo+0x945>
               {  i--;
    8058:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    805c:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    8063:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8067:	79 97                	jns    8000 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    8069:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    8070:	eb 04                	jmp    8076 <III_stereo+0x958>
            i++;
    8072:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    8076:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8079:	89 d0                	mov    %edx,%eax
    807b:	c1 e0 03             	shl    $0x3,%eax
    807e:	01 d0                	add    %edx,%eax
    8080:	c1 e0 02             	shl    $0x2,%eax
    8083:	01 d0                	add    %edx,%eax
    8085:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8088:	01 d0                	add    %edx,%eax
    808a:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    8091:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8094:	7e dc                	jle    8072 <III_stereo+0x954>
            i++;
         sfb = i;
    8096:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8099:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    809c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    809f:	89 d0                	mov    %edx,%eax
    80a1:	c1 e0 03             	shl    $0x3,%eax
    80a4:	01 d0                	add    %edx,%eax
    80a6:	c1 e0 02             	shl    $0x2,%eax
    80a9:	01 d0                	add    %edx,%eax
    80ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    80ae:	01 d0                	add    %edx,%eax
    80b0:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    80b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    80ba:	e9 a9 00 00 00       	jmp    8168 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    80bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80c2:	8d 48 01             	lea    0x1(%eax),%ecx
    80c5:	8b 55 c8             	mov    -0x38(%ebp),%edx
    80c8:	89 d0                	mov    %edx,%eax
    80ca:	c1 e0 03             	shl    $0x3,%eax
    80cd:	01 d0                	add    %edx,%eax
    80cf:	c1 e0 02             	shl    $0x2,%eax
    80d2:	01 d0                	add    %edx,%eax
    80d4:	01 c8                	add    %ecx,%eax
    80d6:	8b 0c 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%ecx
    80dd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    80e0:	89 d0                	mov    %edx,%eax
    80e2:	c1 e0 03             	shl    $0x3,%eax
    80e5:	01 d0                	add    %edx,%eax
    80e7:	c1 e0 02             	shl    $0x2,%eax
    80ea:	01 d0                	add    %edx,%eax
    80ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    80ef:	01 d0                	add    %edx,%eax
    80f1:	8b 04 85 00 cf 00 00 	mov    0xcf00(,%eax,4),%eax
    80f8:	29 c1                	sub    %eax,%ecx
    80fa:	89 c8                	mov    %ecx,%eax
    80fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    80ff:	eb 5d                	jmp    815e <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    8101:	8b 45 10             	mov    0x10(%ebp),%eax
    8104:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8107:	83 c2 3e             	add    $0x3e,%edx
    810a:	8b 14 90             	mov    (%eax,%edx,4),%edx
    810d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8110:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    8117:	8b 45 f0             	mov    -0x10(%ebp),%eax
    811a:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8121:	83 f8 07             	cmp    $0x7,%eax
    8124:	74 30                	je     8156 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8126:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8129:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8130:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8136:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    813c:	dd 05 40 bd 00 00    	fldl   0xbd40
    8142:	de c9                	fmulp  %st,%st(1)
    8144:	dd 1c 24             	fstpl  (%esp)
    8147:	e8 fb ae ff ff       	call   3047 <tan>
    814c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    814f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    8156:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    815a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    815e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8162:	7f 9d                	jg     8101 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    8164:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8168:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    816c:	0f 8e 4d ff ff ff    	jle    80bf <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    8172:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8175:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    817b:	05 50 cf 00 00       	add    $0xcf50,%eax
    8180:	8b 00                	mov    (%eax),%eax
    8182:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    8185:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8188:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    818e:	05 54 cf 00 00       	add    $0xcf54,%eax
    8193:	8b 00                	mov    (%eax),%eax
    8195:	ba 40 02 00 00       	mov    $0x240,%edx
    819a:	29 c2                	sub    %eax,%edx
    819c:	89 d0                	mov    %edx,%eax
    819e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    81a1:	eb 30                	jmp    81d3 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    81a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81a6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    81ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81b0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    81b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    81ba:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    81c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81c4:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    81cb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    81cf:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    81d3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    81d7:	7f ca                	jg     81a3 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    81d9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    81e0:	eb 55                	jmp    8237 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    81e2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    81e9:	eb 42                	jmp    822d <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    81eb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    81f2:	eb 2f                	jmp    8223 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    81f4:	8b 55 e0             	mov    -0x20(%ebp),%edx
    81f7:	89 d0                	mov    %edx,%eax
    81f9:	c1 e0 03             	shl    $0x3,%eax
    81fc:	01 d0                	add    %edx,%eax
    81fe:	c1 e0 09             	shl    $0x9,%eax
    8201:	89 c2                	mov    %eax,%edx
    8203:	8b 45 0c             	mov    0xc(%ebp),%eax
    8206:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8209:	8b 55 e8             	mov    -0x18(%ebp),%edx
    820c:	89 d0                	mov    %edx,%eax
    820e:	c1 e0 03             	shl    $0x3,%eax
    8211:	01 d0                	add    %edx,%eax
    8213:	01 c0                	add    %eax,%eax
    8215:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8218:	01 d0                	add    %edx,%eax
    821a:	d9 ee                	fldz   
    821c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    821f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8223:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    8227:	7e cb                	jle    81f4 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    8229:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    822d:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    8231:	7e b8                	jle    81eb <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    8233:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8237:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    823b:	7e a5                	jle    81e2 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    823d:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8241:	0f 85 3d 02 00 00    	jne    8484 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    8247:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    824e:	e9 25 02 00 00       	jmp    8478 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    8253:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    825a:	e9 0b 02 00 00       	jmp    846a <III_stereo+0xd4c>
            i = (sb*18)+ss;
    825f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8262:	89 d0                	mov    %edx,%eax
    8264:	c1 e0 03             	shl    $0x3,%eax
    8267:	01 d0                	add    %edx,%eax
    8269:	01 c0                	add    %eax,%eax
    826b:	89 c2                	mov    %eax,%edx
    826d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8270:	01 d0                	add    %edx,%eax
    8272:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    8275:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8278:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    827f:	83 f8 07             	cmp    $0x7,%eax
    8282:	0f 85 2c 01 00 00    	jne    83b4 <III_stereo+0xc96>
               if ( ms_stereo ) {
    8288:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    828c:	0f 84 b5 00 00 00    	je     8347 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    8292:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8295:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8298:	89 d0                	mov    %edx,%eax
    829a:	c1 e0 03             	shl    $0x3,%eax
    829d:	01 d0                	add    %edx,%eax
    829f:	01 c0                	add    %eax,%eax
    82a1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    82a4:	01 d0                	add    %edx,%eax
    82a6:	dd 04 c1             	fldl   (%ecx,%eax,8)
    82a9:	8b 45 08             	mov    0x8(%ebp),%eax
    82ac:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    82b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    82b5:	89 d0                	mov    %edx,%eax
    82b7:	c1 e0 03             	shl    $0x3,%eax
    82ba:	01 d0                	add    %edx,%eax
    82bc:	01 c0                	add    %eax,%eax
    82be:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    82c1:	01 d0                	add    %edx,%eax
    82c3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    82c6:	de c1                	faddp  %st,%st(1)
    82c8:	dd 05 48 bd 00 00    	fldl   0xbd48
    82ce:	de f9                	fdivrp %st,%st(1)
    82d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    82d3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    82d6:	89 d0                	mov    %edx,%eax
    82d8:	c1 e0 03             	shl    $0x3,%eax
    82db:	01 d0                	add    %edx,%eax
    82dd:	01 c0                	add    %eax,%eax
    82df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    82e2:	01 d0                	add    %edx,%eax
    82e4:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    82e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    82ea:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    82f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
    82f3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    82f6:	89 d0                	mov    %edx,%eax
    82f8:	c1 e0 03             	shl    $0x3,%eax
    82fb:	01 d0                	add    %edx,%eax
    82fd:	01 c0                	add    %eax,%eax
    82ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8302:	01 d0                	add    %edx,%eax
    8304:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8307:	8b 45 08             	mov    0x8(%ebp),%eax
    830a:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8310:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8313:	89 d0                	mov    %edx,%eax
    8315:	c1 e0 03             	shl    $0x3,%eax
    8318:	01 d0                	add    %edx,%eax
    831a:	01 c0                	add    %eax,%eax
    831c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    831f:	01 d0                	add    %edx,%eax
    8321:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8324:	de e9                	fsubrp %st,%st(1)
    8326:	dd 05 48 bd 00 00    	fldl   0xbd48
    832c:	de f9                	fdivrp %st,%st(1)
    832e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8331:	89 d0                	mov    %edx,%eax
    8333:	c1 e0 03             	shl    $0x3,%eax
    8336:	01 d0                	add    %edx,%eax
    8338:	01 c0                	add    %eax,%eax
    833a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    833d:	01 d0                	add    %edx,%eax
    833f:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    8342:	e9 1f 01 00 00       	jmp    8466 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    8347:	8b 4d 08             	mov    0x8(%ebp),%ecx
    834a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    834d:	89 d0                	mov    %edx,%eax
    834f:	c1 e0 03             	shl    $0x3,%eax
    8352:	01 d0                	add    %edx,%eax
    8354:	01 c0                	add    %eax,%eax
    8356:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8359:	01 d0                	add    %edx,%eax
    835b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    835e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8361:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8364:	89 d0                	mov    %edx,%eax
    8366:	c1 e0 03             	shl    $0x3,%eax
    8369:	01 d0                	add    %edx,%eax
    836b:	01 c0                	add    %eax,%eax
    836d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8370:	01 d0                	add    %edx,%eax
    8372:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    8375:	8b 45 0c             	mov    0xc(%ebp),%eax
    8378:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    837e:	8b 45 08             	mov    0x8(%ebp),%eax
    8381:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    8387:	8b 55 e8             	mov    -0x18(%ebp),%edx
    838a:	89 d0                	mov    %edx,%eax
    838c:	c1 e0 03             	shl    $0x3,%eax
    838f:	01 d0                	add    %edx,%eax
    8391:	01 c0                	add    %eax,%eax
    8393:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8396:	01 d0                	add    %edx,%eax
    8398:	dd 04 c3             	fldl   (%ebx,%eax,8)
    839b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    839e:	89 d0                	mov    %edx,%eax
    83a0:	c1 e0 03             	shl    $0x3,%eax
    83a3:	01 d0                	add    %edx,%eax
    83a5:	01 c0                	add    %eax,%eax
    83a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    83aa:	01 d0                	add    %edx,%eax
    83ac:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    83af:	e9 b2 00 00 00       	jmp    8466 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    83b4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    83b8:	0f 84 94 00 00 00    	je     8452 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    83be:	8b 4d 08             	mov    0x8(%ebp),%ecx
    83c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
    83c4:	89 d0                	mov    %edx,%eax
    83c6:	c1 e0 03             	shl    $0x3,%eax
    83c9:	01 d0                	add    %edx,%eax
    83cb:	01 c0                	add    %eax,%eax
    83cd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    83d0:	01 d0                	add    %edx,%eax
    83d2:	dd 04 c1             	fldl   (%ecx,%eax,8)
    83d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83d8:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    83df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    83e2:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    83e9:	d9 e8                	fld1   
    83eb:	de c1                	faddp  %st,%st(1)
    83ed:	de f9                	fdivrp %st,%st(1)
    83ef:	de c9                	fmulp  %st,%st(1)
    83f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    83f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    83f7:	89 d0                	mov    %edx,%eax
    83f9:	c1 e0 03             	shl    $0x3,%eax
    83fc:	01 d0                	add    %edx,%eax
    83fe:	01 c0                	add    %eax,%eax
    8400:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8403:	01 d0                	add    %edx,%eax
    8405:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    8408:	8b 45 0c             	mov    0xc(%ebp),%eax
    840b:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    8411:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8414:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8417:	89 d0                	mov    %edx,%eax
    8419:	c1 e0 03             	shl    $0x3,%eax
    841c:	01 d0                	add    %edx,%eax
    841e:	01 c0                	add    %eax,%eax
    8420:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8423:	01 d0                	add    %edx,%eax
    8425:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8428:	8b 45 f0             	mov    -0x10(%ebp),%eax
    842b:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8432:	d9 e8                	fld1   
    8434:	de c1                	faddp  %st,%st(1)
    8436:	d9 e8                	fld1   
    8438:	de f1                	fdivp  %st,%st(1)
    843a:	de c9                	fmulp  %st,%st(1)
    843c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    843f:	89 d0                	mov    %edx,%eax
    8441:	c1 e0 03             	shl    $0x3,%eax
    8444:	01 d0                	add    %edx,%eax
    8446:	01 c0                	add    %eax,%eax
    8448:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    844b:	01 d0                	add    %edx,%eax
    844d:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    8450:	eb 14                	jmp    8466 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    8452:	c7 44 24 04 e0 ac 00 	movl   $0xace0,0x4(%esp)
    8459:	00 
    845a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    8461:	e8 3c a7 ff ff       	call   2ba2 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    8466:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    846a:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    846e:	0f 8e eb fd ff ff    	jle    825f <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    8474:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8478:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    847c:	0f 8e d1 fd ff ff    	jle    8253 <III_stereo+0xb35>
    8482:	eb 54                	jmp    84d8 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    8484:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    848b:	eb 45                	jmp    84d2 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    848d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8494:	eb 32                	jmp    84c8 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    8496:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8499:	8b 55 e8             	mov    -0x18(%ebp),%edx
    849c:	89 d0                	mov    %edx,%eax
    849e:	c1 e0 03             	shl    $0x3,%eax
    84a1:	01 d0                	add    %edx,%eax
    84a3:	01 c0                	add    %eax,%eax
    84a5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    84a8:	01 d0                	add    %edx,%eax
    84aa:	dd 04 c1             	fldl   (%ecx,%eax,8)
    84ad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    84b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    84b3:	89 d0                	mov    %edx,%eax
    84b5:	c1 e0 03             	shl    $0x3,%eax
    84b8:	01 d0                	add    %edx,%eax
    84ba:	01 c0                	add    %eax,%eax
    84bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    84bf:	01 d0                	add    %edx,%eax
    84c1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    84c4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    84c8:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    84cc:	7e c8                	jle    8496 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    84ce:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    84d2:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    84d6:	7e b5                	jle    848d <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    84d8:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    84de:	5b                   	pop    %ebx
    84df:	5e                   	pop    %esi
    84e0:	5d                   	pop    %ebp
    84e1:	c3                   	ret    

000084e2 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    84e2:	55                   	push   %ebp
    84e3:	89 e5                	mov    %esp,%ebp
    84e5:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    84e8:	a1 60 d1 00 00       	mov    0xd160,%eax
    84ed:	85 c0                	test   %eax,%eax
    84ef:	74 68                	je     8559 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    84f1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    84f8:	eb 4f                	jmp    8549 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    84fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    84fd:	dd 04 c5 20 d1 00 00 	fldl   0xd120(,%eax,8)
    8504:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8507:	dd 04 c5 20 d1 00 00 	fldl   0xd120(,%eax,8)
    850e:	de c9                	fmulp  %st,%st(1)
    8510:	d9 e8                	fld1   
    8512:	de c1                	faddp  %st,%st(1)
    8514:	dd 1c 24             	fstpl  (%esp)
    8517:	e8 de ac ff ff       	call   31fa <sqrt>
    851c:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    851f:	d9 e8                	fld1   
    8521:	dc 75 e0             	fdivl  -0x20(%ebp)
    8524:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8527:	dd 1c c5 c0 d1 00 00 	fstpl  0xd1c0(,%eax,8)
         ca[i] = Ci[i]/sq;
    852e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8531:	dd 04 c5 20 d1 00 00 	fldl   0xd120(,%eax,8)
    8538:	dc 75 e0             	fdivl  -0x20(%ebp)
    853b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    853e:	dd 1c c5 00 d2 00 00 	fstpl  0xd200(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    8545:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8549:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    854d:	7e ab                	jle    84fa <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    854f:	c7 05 60 d1 00 00 00 	movl   $0x0,0xd160
    8556:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    8559:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8560:	eb 4c                	jmp    85ae <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    8562:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8569:	eb 39                	jmp    85a4 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    856b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    856e:	89 d0                	mov    %edx,%eax
    8570:	c1 e0 03             	shl    $0x3,%eax
    8573:	01 d0                	add    %edx,%eax
    8575:	c1 e0 04             	shl    $0x4,%eax
    8578:	89 c2                	mov    %eax,%edx
    857a:	8b 45 0c             	mov    0xc(%ebp),%eax
    857d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8580:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8583:	89 d0                	mov    %edx,%eax
    8585:	c1 e0 03             	shl    $0x3,%eax
    8588:	01 d0                	add    %edx,%eax
    858a:	c1 e0 04             	shl    $0x4,%eax
    858d:	89 c2                	mov    %eax,%edx
    858f:	8b 45 08             	mov    0x8(%ebp),%eax
    8592:	01 c2                	add    %eax,%edx
    8594:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8597:	dd 04 c2             	fldl   (%edx,%eax,8)
    859a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    859d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    85a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    85a4:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    85a8:	7e c1                	jle    856b <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    85aa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    85ae:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    85b2:	7e ae                	jle    8562 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    85b4:	8b 45 10             	mov    0x10(%ebp),%eax
    85b7:	8b 40 10             	mov    0x10(%eax),%eax
    85ba:	85 c0                	test   %eax,%eax
    85bc:	74 1a                	je     85d8 <III_antialias+0xf6>
    85be:	8b 45 10             	mov    0x10(%ebp),%eax
    85c1:	8b 40 14             	mov    0x14(%eax),%eax
    85c4:	83 f8 02             	cmp    $0x2,%eax
    85c7:	75 0f                	jne    85d8 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    85c9:	8b 45 10             	mov    0x10(%ebp),%eax
    85cc:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    85cf:	85 c0                	test   %eax,%eax
    85d1:	75 05                	jne    85d8 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    85d3:	e9 1c 01 00 00       	jmp    86f4 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    85d8:	8b 45 10             	mov    0x10(%ebp),%eax
    85db:	8b 40 10             	mov    0x10(%eax),%eax
    85de:	85 c0                	test   %eax,%eax
    85e0:	74 1e                	je     8600 <III_antialias+0x11e>
    85e2:	8b 45 10             	mov    0x10(%ebp),%eax
    85e5:	8b 40 18             	mov    0x18(%eax),%eax
    85e8:	85 c0                	test   %eax,%eax
    85ea:	74 14                	je     8600 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    85ec:	8b 45 10             	mov    0x10(%ebp),%eax
    85ef:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    85f2:	83 f8 02             	cmp    $0x2,%eax
    85f5:	75 09                	jne    8600 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    85f7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    85fe:	eb 07                	jmp    8607 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    8600:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    8607:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    860e:	e9 d5 00 00 00       	jmp    86e8 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    8613:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    861a:	e9 bb 00 00 00       	jmp    86da <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    861f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8622:	89 d0                	mov    %edx,%eax
    8624:	c1 e0 03             	shl    $0x3,%eax
    8627:	01 d0                	add    %edx,%eax
    8629:	c1 e0 04             	shl    $0x4,%eax
    862c:	89 c2                	mov    %eax,%edx
    862e:	8b 45 08             	mov    0x8(%ebp),%eax
    8631:	01 c2                	add    %eax,%edx
    8633:	b8 11 00 00 00       	mov    $0x11,%eax
    8638:	2b 45 f4             	sub    -0xc(%ebp),%eax
    863b:	dd 04 c2             	fldl   (%edx,%eax,8)
    863e:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    8641:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8644:	8d 50 01             	lea    0x1(%eax),%edx
    8647:	89 d0                	mov    %edx,%eax
    8649:	c1 e0 03             	shl    $0x3,%eax
    864c:	01 d0                	add    %edx,%eax
    864e:	c1 e0 04             	shl    $0x4,%eax
    8651:	89 c2                	mov    %eax,%edx
    8653:	8b 45 08             	mov    0x8(%ebp),%eax
    8656:	01 c2                	add    %eax,%edx
    8658:	8b 45 f4             	mov    -0xc(%ebp),%eax
    865b:	dd 04 c2             	fldl   (%edx,%eax,8)
    865e:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    8661:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8664:	89 d0                	mov    %edx,%eax
    8666:	c1 e0 03             	shl    $0x3,%eax
    8669:	01 d0                	add    %edx,%eax
    866b:	c1 e0 04             	shl    $0x4,%eax
    866e:	89 c2                	mov    %eax,%edx
    8670:	8b 45 0c             	mov    0xc(%ebp),%eax
    8673:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8676:	b8 11 00 00 00       	mov    $0x11,%eax
    867b:	2b 45 f4             	sub    -0xc(%ebp),%eax
    867e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8681:	dd 04 d5 c0 d1 00 00 	fldl   0xd1c0(,%edx,8)
    8688:	dc 4d d8             	fmull  -0x28(%ebp)
    868b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    868e:	dd 04 d5 00 d2 00 00 	fldl   0xd200(,%edx,8)
    8695:	dc 4d d0             	fmull  -0x30(%ebp)
    8698:	de e9                	fsubrp %st,%st(1)
    869a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    869d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86a0:	8d 50 01             	lea    0x1(%eax),%edx
    86a3:	89 d0                	mov    %edx,%eax
    86a5:	c1 e0 03             	shl    $0x3,%eax
    86a8:	01 d0                	add    %edx,%eax
    86aa:	c1 e0 04             	shl    $0x4,%eax
    86ad:	89 c2                	mov    %eax,%edx
    86af:	8b 45 0c             	mov    0xc(%ebp),%eax
    86b2:	01 c2                	add    %eax,%edx
    86b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86b7:	dd 04 c5 c0 d1 00 00 	fldl   0xd1c0(,%eax,8)
    86be:	dc 4d d0             	fmull  -0x30(%ebp)
    86c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86c4:	dd 04 c5 00 d2 00 00 	fldl   0xd200(,%eax,8)
    86cb:	dc 4d d8             	fmull  -0x28(%ebp)
    86ce:	de c1                	faddp  %st,%st(1)
    86d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86d3:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    86d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    86da:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    86de:	0f 8e 3b ff ff ff    	jle    861f <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    86e4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    86e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    86eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    86ee:	0f 8c 1f ff ff ff    	jl     8613 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    86f4:	c9                   	leave  
    86f5:	c3                   	ret    

000086f6 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    86f6:	55                   	push   %ebp
    86f7:	89 e5                	mov    %esp,%ebp
    86f9:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    86ff:	a1 40 d2 00 00       	mov    0xd240,%eax
    8704:	85 c0                	test   %eax,%eax
    8706:	0f 85 59 02 00 00    	jne    8965 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    870c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8713:	eb 29                	jmp    873e <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    8715:	db 45 f4             	fildl  -0xc(%ebp)
    8718:	dd 05 50 bd 00 00    	fldl   0xbd50
    871e:	de c1                	faddp  %st,%st(1)
    8720:	dd 05 58 bd 00 00    	fldl   0xbd58
    8726:	de c9                	fmulp  %st,%st(1)
    8728:	dd 1c 24             	fstpl  (%esp)
    872b:	e8 53 a8 ff ff       	call   2f83 <sin>
    8730:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8733:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    873a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    873e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    8742:	7e d1                	jle    8715 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    8744:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    874b:	eb 2c                	jmp    8779 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    874d:	db 45 f4             	fildl  -0xc(%ebp)
    8750:	dd 05 50 bd 00 00    	fldl   0xbd50
    8756:	de c1                	faddp  %st,%st(1)
    8758:	dd 05 58 bd 00 00    	fldl   0xbd58
    875e:	de c9                	fmulp  %st,%st(1)
    8760:	dd 1c 24             	fstpl  (%esp)
    8763:	e8 1b a8 ff ff       	call   2f83 <sin>
    8768:	8b 45 f4             	mov    -0xc(%ebp),%eax
    876b:	83 c0 24             	add    $0x24,%eax
    876e:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    8775:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8779:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    877d:	7e ce                	jle    874d <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    877f:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    8786:	eb 13                	jmp    879b <inv_mdct+0xa5>
         win[1][i] = 1.0;
    8788:	8b 45 f4             	mov    -0xc(%ebp),%eax
    878b:	83 c0 24             	add    $0x24,%eax
    878e:	d9 e8                	fld1   
    8790:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    8797:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    879b:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    879f:	7e e7                	jle    8788 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    87a1:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    87a8:	eb 34                	jmp    87de <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    87aa:	db 45 f4             	fildl  -0xc(%ebp)
    87ad:	dd 05 50 bd 00 00    	fldl   0xbd50
    87b3:	de c1                	faddp  %st,%st(1)
    87b5:	dd 05 60 bd 00 00    	fldl   0xbd60
    87bb:	de e9                	fsubrp %st,%st(1)
    87bd:	dd 05 40 bd 00 00    	fldl   0xbd40
    87c3:	de c9                	fmulp  %st,%st(1)
    87c5:	dd 1c 24             	fstpl  (%esp)
    87c8:	e8 b6 a7 ff ff       	call   2f83 <sin>
    87cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87d0:	83 c0 24             	add    $0x24,%eax
    87d3:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    87da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    87de:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    87e2:	7e c6                	jle    87aa <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    87e4:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    87eb:	eb 13                	jmp    8800 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    87ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    87f0:	83 c0 24             	add    $0x24,%eax
    87f3:	d9 ee                	fldz   
    87f5:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    87fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8800:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    8804:	7e e7                	jle    87ed <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    8806:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    880d:	eb 13                	jmp    8822 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    880f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8812:	83 c0 6c             	add    $0x6c,%eax
    8815:	d9 ee                	fldz   
    8817:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    881e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8822:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    8826:	7e e7                	jle    880f <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    8828:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    882f:	eb 34                	jmp    8865 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    8831:	db 45 f4             	fildl  -0xc(%ebp)
    8834:	dd 05 50 bd 00 00    	fldl   0xbd50
    883a:	de c1                	faddp  %st,%st(1)
    883c:	dd 05 68 bd 00 00    	fldl   0xbd68
    8842:	de e9                	fsubrp %st,%st(1)
    8844:	dd 05 40 bd 00 00    	fldl   0xbd40
    884a:	de c9                	fmulp  %st,%st(1)
    884c:	dd 1c 24             	fstpl  (%esp)
    884f:	e8 2f a7 ff ff       	call   2f83 <sin>
    8854:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8857:	83 c0 6c             	add    $0x6c,%eax
    885a:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    8861:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8865:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8869:	7e c6                	jle    8831 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    886b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8872:	eb 13                	jmp    8887 <inv_mdct+0x191>
         win[3][i] =1.0;
    8874:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8877:	83 c0 6c             	add    $0x6c,%eax
    887a:	d9 e8                	fld1   
    887c:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    8883:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8887:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    888b:	7e e7                	jle    8874 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    888d:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    8894:	eb 2c                	jmp    88c2 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    8896:	db 45 f4             	fildl  -0xc(%ebp)
    8899:	dd 05 50 bd 00 00    	fldl   0xbd50
    889f:	de c1                	faddp  %st,%st(1)
    88a1:	dd 05 58 bd 00 00    	fldl   0xbd58
    88a7:	de c9                	fmulp  %st,%st(1)
    88a9:	dd 1c 24             	fstpl  (%esp)
    88ac:	e8 d2 a6 ff ff       	call   2f83 <sin>
    88b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88b4:	83 c0 6c             	add    $0x6c,%eax
    88b7:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    88be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    88c2:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    88c6:	7e ce                	jle    8896 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    88c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    88cf:	eb 2c                	jmp    88fd <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    88d1:	db 45 f4             	fildl  -0xc(%ebp)
    88d4:	dd 05 50 bd 00 00    	fldl   0xbd50
    88da:	de c1                	faddp  %st,%st(1)
    88dc:	dd 05 40 bd 00 00    	fldl   0xbd40
    88e2:	de c9                	fmulp  %st,%st(1)
    88e4:	dd 1c 24             	fstpl  (%esp)
    88e7:	e8 97 a6 ff ff       	call   2f83 <sin>
    88ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    88ef:	83 c0 48             	add    $0x48,%eax
    88f2:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    88f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    88fd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8901:	7e ce                	jle    88d1 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    8903:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    890a:	eb 13                	jmp    891f <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    890c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    890f:	83 c0 48             	add    $0x48,%eax
    8912:	d9 ee                	fldz   
    8914:	dd 1c c5 60 d2 00 00 	fstpl  0xd260(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    891b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    891f:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    8923:	7e e7                	jle    890c <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    8925:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    892c:	eb 21                	jmp    894f <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    892e:	db 45 f4             	fildl  -0xc(%ebp)
    8931:	dd 05 70 bd 00 00    	fldl   0xbd70
    8937:	de c9                	fmulp  %st,%st(1)
    8939:	dd 1c 24             	fstpl  (%esp)
    893c:	e8 e1 a6 ff ff       	call   3022 <cos>
    8941:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8944:	dd 1c c5 e0 d6 00 00 	fstpl  0xd6e0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    894b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    894f:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    8956:	7e d6                	jle    892e <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    8958:	a1 40 d2 00 00       	mov    0xd240,%eax
    895d:	83 c0 01             	add    $0x1,%eax
    8960:	a3 40 d2 00 00       	mov    %eax,0xd240
    }

    for(i=0;i<36;i++)
    8965:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    896c:	eb 17                	jmp    8985 <inv_mdct+0x28f>
       out[i]=0;
    896e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8971:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8978:	8b 45 0c             	mov    0xc(%ebp),%eax
    897b:	01 d0                	add    %edx,%eax
    897d:	d9 ee                	fldz   
    897f:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    8981:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8985:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    8989:	7e e3                	jle    896e <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    898b:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    898f:	0f 85 85 01 00 00    	jne    8b1a <inv_mdct+0x424>
       N=12;
    8995:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    899c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    89a3:	e9 63 01 00 00       	jmp    8b0b <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    89a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    89af:	e9 df 00 00 00       	jmp    8a93 <inv_mdct+0x39d>
             sum = 0.0;
    89b4:	d9 ee                	fldz   
    89b6:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    89b9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    89c0:	e9 8f 00 00 00       	jmp    8a54 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    89c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89c8:	89 d0                	mov    %edx,%eax
    89ca:	01 c0                	add    %eax,%eax
    89cc:	01 c2                	add    %eax,%edx
    89ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    89d1:	01 d0                	add    %edx,%eax
    89d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    89da:	8b 45 08             	mov    0x8(%ebp),%eax
    89dd:	01 d0                	add    %edx,%eax
    89df:	dd 00                	fldl   (%eax)
    89e1:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    89e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    89ea:	01 c0                	add    %eax,%eax
    89ec:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    89f2:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    89f8:	dd 05 78 bd 00 00    	fldl   0xbd78
    89fe:	de f1                	fdivp  %st,%st(1)
    8a00:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a03:	01 c0                	add    %eax,%eax
    8a05:	8d 50 01             	lea    0x1(%eax),%edx
    8a08:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8a0b:	89 c1                	mov    %eax,%ecx
    8a0d:	c1 e9 1f             	shr    $0x1f,%ecx
    8a10:	01 c8                	add    %ecx,%eax
    8a12:	d1 f8                	sar    %eax
    8a14:	01 d0                	add    %edx,%eax
    8a16:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    8a1c:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    8a22:	de c9                	fmulp  %st,%st(1)
    8a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a27:	01 c0                	add    %eax,%eax
    8a29:	83 c0 01             	add    $0x1,%eax
    8a2c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    8a32:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    8a38:	de c9                	fmulp  %st,%st(1)
    8a3a:	dd 1c 24             	fstpl  (%esp)
    8a3d:	e8 e0 a5 ff ff       	call   3022 <cos>
    8a42:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    8a48:	dd 45 e0             	fldl   -0x20(%ebp)
    8a4b:	de c1                	faddp  %st,%st(1)
    8a4d:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    8a50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a54:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8a57:	89 c2                	mov    %eax,%edx
    8a59:	c1 ea 1f             	shr    $0x1f,%edx
    8a5c:	01 d0                	add    %edx,%eax
    8a5e:	d1 f8                	sar    %eax
    8a60:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    8a63:	0f 8f 5c ff ff ff    	jg     89c5 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    8a69:	8b 55 10             	mov    0x10(%ebp),%edx
    8a6c:	89 d0                	mov    %edx,%eax
    8a6e:	c1 e0 03             	shl    $0x3,%eax
    8a71:	01 d0                	add    %edx,%eax
    8a73:	c1 e0 02             	shl    $0x2,%eax
    8a76:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a79:	01 d0                	add    %edx,%eax
    8a7b:	dd 04 c5 60 d2 00 00 	fldl   0xd260(,%eax,8)
    8a82:	dc 4d e0             	fmull  -0x20(%ebp)
    8a85:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a88:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    8a8f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8a93:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a96:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8a99:	0f 8c 15 ff ff ff    	jl     89b4 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    8a9f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8aa6:	eb 57                	jmp    8aff <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    8aa8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8aab:	89 d0                	mov    %edx,%eax
    8aad:	01 c0                	add    %eax,%eax
    8aaf:	01 d0                	add    %edx,%eax
    8ab1:	01 c0                	add    %eax,%eax
    8ab3:	89 c2                	mov    %eax,%edx
    8ab5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ab8:	01 d0                	add    %edx,%eax
    8aba:	83 c0 06             	add    $0x6,%eax
    8abd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8ac4:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ac7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8aca:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8acd:	89 d0                	mov    %edx,%eax
    8acf:	01 c0                	add    %eax,%eax
    8ad1:	01 d0                	add    %edx,%eax
    8ad3:	01 c0                	add    %eax,%eax
    8ad5:	89 c2                	mov    %eax,%edx
    8ad7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ada:	01 d0                	add    %edx,%eax
    8adc:	83 c0 06             	add    $0x6,%eax
    8adf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8ae6:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ae9:	01 d0                	add    %edx,%eax
    8aeb:	dd 00                	fldl   (%eax)
    8aed:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8af0:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    8af7:	de c1                	faddp  %st,%st(1)
    8af9:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    8afb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b02:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8b05:	7c a1                	jl     8aa8 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    8b07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8b0b:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8b0f:	0f 8e 93 fe ff ff    	jle    89a8 <inv_mdct+0x2b2>
    8b15:	e9 da 00 00 00       	jmp    8bf4 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    8b1a:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    8b21:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8b28:	e9 bb 00 00 00       	jmp    8be8 <inv_mdct+0x4f2>
         sum = 0.0;
    8b2d:	d9 ee                	fldz   
    8b2f:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    8b32:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8b39:	eb 6a                	jmp    8ba5 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    8b3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b3e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8b45:	8b 45 08             	mov    0x8(%ebp),%eax
    8b48:	01 d0                	add    %edx,%eax
    8b4a:	dd 00                	fldl   (%eax)
    8b4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b4f:	01 c0                	add    %eax,%eax
    8b51:	8d 50 01             	lea    0x1(%eax),%edx
    8b54:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8b57:	89 c1                	mov    %eax,%ecx
    8b59:	c1 e9 1f             	shr    $0x1f,%ecx
    8b5c:	01 c8                	add    %ecx,%eax
    8b5e:	d1 f8                	sar    %eax
    8b60:	01 c2                	add    %eax,%edx
    8b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b65:	01 c0                	add    %eax,%eax
    8b67:	83 c0 01             	add    $0x1,%eax
    8b6a:	89 d1                	mov    %edx,%ecx
    8b6c:	0f af c8             	imul   %eax,%ecx
    8b6f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b74:	89 c8                	mov    %ecx,%eax
    8b76:	f7 ea                	imul   %edx
    8b78:	c1 fa 05             	sar    $0x5,%edx
    8b7b:	89 c8                	mov    %ecx,%eax
    8b7d:	c1 f8 1f             	sar    $0x1f,%eax
    8b80:	29 c2                	sub    %eax,%edx
    8b82:	89 d0                	mov    %edx,%eax
    8b84:	c1 e0 03             	shl    $0x3,%eax
    8b87:	01 d0                	add    %edx,%eax
    8b89:	c1 e0 04             	shl    $0x4,%eax
    8b8c:	29 c1                	sub    %eax,%ecx
    8b8e:	89 ca                	mov    %ecx,%edx
    8b90:	dd 04 d5 e0 d6 00 00 	fldl   0xd6e0(,%edx,8)
    8b97:	de c9                	fmulp  %st,%st(1)
    8b99:	dd 45 e0             	fldl   -0x20(%ebp)
    8b9c:	de c1                	faddp  %st,%st(1)
    8b9e:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    8ba1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8ba5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8ba8:	89 c2                	mov    %eax,%edx
    8baa:	c1 ea 1f             	shr    $0x1f,%edx
    8bad:	01 d0                	add    %edx,%eax
    8baf:	d1 f8                	sar    %eax
    8bb1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    8bb4:	7f 85                	jg     8b3b <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    8bb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8bb9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8bc0:	8b 45 0c             	mov    0xc(%ebp),%eax
    8bc3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8bc6:	8b 55 10             	mov    0x10(%ebp),%edx
    8bc9:	89 d0                	mov    %edx,%eax
    8bcb:	c1 e0 03             	shl    $0x3,%eax
    8bce:	01 d0                	add    %edx,%eax
    8bd0:	c1 e0 02             	shl    $0x2,%eax
    8bd3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8bd6:	01 d0                	add    %edx,%eax
    8bd8:	dd 04 c5 60 d2 00 00 	fldl   0xd260(,%eax,8)
    8bdf:	dc 4d e0             	fmull  -0x20(%ebp)
    8be2:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    8be4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8be8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8beb:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8bee:	0f 8c 39 ff ff ff    	jl     8b2d <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    8bf4:	c9                   	leave  
    8bf5:	c3                   	ret    

00008bf6 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    8bf6:	55                   	push   %ebp
    8bf7:	89 e5                	mov    %esp,%ebp
    8bf9:	53                   	push   %ebx
    8bfa:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    8c00:	a1 64 d1 00 00       	mov    0xd164,%eax
    8c05:	85 c0                	test   %eax,%eax
    8c07:	74 6f                	je     8c78 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    8c09:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8c10:	eb 56                	jmp    8c68 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    8c12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8c19:	eb 43                	jmp    8c5e <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    8c1b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8c22:	eb 30                	jmp    8c54 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    8c24:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c27:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8c2a:	89 c2                	mov    %eax,%edx
    8c2c:	c1 e2 03             	shl    $0x3,%edx
    8c2f:	01 c2                	add    %eax,%edx
    8c31:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8c34:	89 c2                	mov    %eax,%edx
    8c36:	89 c8                	mov    %ecx,%eax
    8c38:	c1 e0 03             	shl    $0x3,%eax
    8c3b:	01 c8                	add    %ecx,%eax
    8c3d:	c1 e0 06             	shl    $0x6,%eax
    8c40:	01 c2                	add    %eax,%edx
    8c42:	8b 45 e8             	mov    -0x18(%ebp),%eax
    8c45:	01 d0                	add    %edx,%eax
    8c47:	d9 ee                	fldz   
    8c49:	dd 1c c5 60 db 00 00 	fstpl  0xdb60(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    8c50:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8c54:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    8c58:	7e ca                	jle    8c24 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    8c5a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8c5e:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    8c62:	7e b7                	jle    8c1b <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    8c64:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8c68:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8c6c:	7e a4                	jle    8c12 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    8c6e:	c7 05 64 d1 00 00 00 	movl   $0x0,0xd164
    8c75:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    8c78:	8b 45 18             	mov    0x18(%ebp),%eax
    8c7b:	8b 40 10             	mov    0x10(%eax),%eax
    8c7e:	85 c0                	test   %eax,%eax
    8c80:	74 10                	je     8c92 <III_hybrid+0x9c>
    8c82:	8b 45 18             	mov    0x18(%ebp),%eax
    8c85:	8b 40 18             	mov    0x18(%eax),%eax
    8c88:	85 c0                	test   %eax,%eax
    8c8a:	74 06                	je     8c92 <III_hybrid+0x9c>
    8c8c:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    8c90:	7e 08                	jle    8c9a <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    8c92:	8b 45 18             	mov    0x18(%ebp),%eax
    8c95:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    8c98:	eb 05                	jmp    8c9f <III_hybrid+0xa9>
    8c9a:	b8 00 00 00 00       	mov    $0x0,%eax
    8c9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    8ca2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8ca5:	89 44 24 08          	mov    %eax,0x8(%esp)
    8ca9:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    8caf:	89 44 24 04          	mov    %eax,0x4(%esp)
    8cb3:	8b 45 08             	mov    0x8(%ebp),%eax
    8cb6:	89 04 24             	mov    %eax,(%esp)
    8cb9:	e8 38 fa ff ff       	call   86f6 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    8cbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8cc5:	e9 83 00 00 00       	jmp    8d4d <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    8cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ccd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
    8cd7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    8cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cdd:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    8ce4:	8b 45 10             	mov    0x10(%ebp),%eax
    8ce7:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8cea:	89 c2                	mov    %eax,%edx
    8cec:	c1 e2 03             	shl    $0x3,%edx
    8cef:	01 c2                	add    %eax,%edx
    8cf1:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8cf4:	89 c2                	mov    %eax,%edx
    8cf6:	89 c8                	mov    %ecx,%eax
    8cf8:	c1 e0 03             	shl    $0x3,%eax
    8cfb:	01 c8                	add    %ecx,%eax
    8cfd:	c1 e0 06             	shl    $0x6,%eax
    8d00:	01 c2                	add    %eax,%edx
    8d02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d05:	01 d0                	add    %edx,%eax
    8d07:	dd 04 c5 60 db 00 00 	fldl   0xdb60(,%eax,8)
    8d0e:	de c1                	faddp  %st,%st(1)
    8d10:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    8d12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d15:	83 c0 12             	add    $0x12,%eax
    8d18:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    8d1f:	8b 45 10             	mov    0x10(%ebp),%eax
    8d22:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8d25:	89 c2                	mov    %eax,%edx
    8d27:	c1 e2 03             	shl    $0x3,%edx
    8d2a:	01 c2                	add    %eax,%edx
    8d2c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8d2f:	89 c2                	mov    %eax,%edx
    8d31:	89 c8                	mov    %ecx,%eax
    8d33:	c1 e0 03             	shl    $0x3,%eax
    8d36:	01 c8                	add    %ecx,%eax
    8d38:	c1 e0 06             	shl    $0x6,%eax
    8d3b:	01 c2                	add    %eax,%edx
    8d3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d40:	01 d0                	add    %edx,%eax
    8d42:	dd 1c c5 60 db 00 00 	fstpl  0xdb60(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    8d49:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8d4d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8d51:	0f 8e 73 ff ff ff    	jle    8cca <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    8d57:	81 c4 54 01 00 00    	add    $0x154,%esp
    8d5d:	5b                   	pop    %ebx
    8d5e:	5d                   	pop    %ebp
    8d5f:	c3                   	ret    

00008d60 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    8d60:	55                   	push   %ebp
    8d61:	89 e5                	mov    %esp,%ebp
    8d63:	57                   	push   %edi
    8d64:	56                   	push   %esi
    8d65:	53                   	push   %ebx
    8d66:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    8d69:	be 00 00 00 00       	mov    $0x0,%esi
    8d6e:	e9 1c 01 00 00       	jmp    8e8f <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    8d73:	bb 00 00 00 00       	mov    $0x0,%ebx
    8d78:	e9 06 01 00 00       	jmp    8e83 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    8d7d:	89 f0                	mov    %esi,%eax
    8d7f:	c1 e0 08             	shl    $0x8,%eax
    8d82:	89 c2                	mov    %eax,%edx
    8d84:	8b 45 08             	mov    0x8(%ebp),%eax
    8d87:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8d8a:	89 75 e0             	mov    %esi,-0x20(%ebp)
    8d8d:	db 45 e0             	fildl  -0x20(%ebp)
    8d90:	dd 05 80 bd 00 00    	fldl   0xbd80
    8d96:	de c9                	fmulp  %st,%st(1)
    8d98:	dd 05 88 bd 00 00    	fldl   0xbd88
    8d9e:	de c1                	faddp  %st,%st(1)
    8da0:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    8da3:	83 c0 01             	add    $0x1,%eax
    8da6:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8da9:	db 45 e0             	fildl  -0x20(%ebp)
    8dac:	de c9                	fmulp  %st,%st(1)
    8dae:	dd 1c 24             	fstpl  (%esp)
    8db1:	e8 6c a2 ff ff       	call   3022 <cos>
    8db6:	dd 05 90 bd 00 00    	fldl   0xbd90
    8dbc:	de c9                	fmulp  %st,%st(1)
    8dbe:	dd 1c df             	fstpl  (%edi,%ebx,8)
    8dc1:	dd 04 df             	fldl   (%edi,%ebx,8)
    8dc4:	d9 ee                	fldz   
    8dc6:	d9 c9                	fxch   %st(1)
    8dc8:	df e9                	fucomip %st(1),%st
    8dca:	dd d8                	fstp   %st(0)
    8dcc:	72 47                	jb     8e15 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    8dce:	89 f0                	mov    %esi,%eax
    8dd0:	c1 e0 08             	shl    $0x8,%eax
    8dd3:	89 c2                	mov    %eax,%edx
    8dd5:	8b 45 08             	mov    0x8(%ebp),%eax
    8dd8:	01 c2                	add    %eax,%edx
    8dda:	89 f0                	mov    %esi,%eax
    8ddc:	c1 e0 08             	shl    $0x8,%eax
    8ddf:	89 c1                	mov    %eax,%ecx
    8de1:	8b 45 08             	mov    0x8(%ebp),%eax
    8de4:	01 c8                	add    %ecx,%eax
    8de6:	dd 04 d8             	fldl   (%eax,%ebx,8)
    8de9:	dd 05 50 bd 00 00    	fldl   0xbd50
    8def:	de c1                	faddp  %st,%st(1)
    8df1:	d9 7d e6             	fnstcw -0x1a(%ebp)
    8df4:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    8df8:	b4 0c                	mov    $0xc,%ah
    8dfa:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    8dfe:	d9 6d e4             	fldcw  -0x1c(%ebp)
    8e01:	db 5d e0             	fistpl -0x20(%ebp)
    8e04:	d9 6d e6             	fldcw  -0x1a(%ebp)
    8e07:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8e0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8e0d:	db 45 e0             	fildl  -0x20(%ebp)
    8e10:	dd 1c da             	fstpl  (%edx,%ebx,8)
    8e13:	eb 45                	jmp    8e5a <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    8e15:	89 f0                	mov    %esi,%eax
    8e17:	c1 e0 08             	shl    $0x8,%eax
    8e1a:	89 c2                	mov    %eax,%edx
    8e1c:	8b 45 08             	mov    0x8(%ebp),%eax
    8e1f:	01 c2                	add    %eax,%edx
    8e21:	89 f0                	mov    %esi,%eax
    8e23:	c1 e0 08             	shl    $0x8,%eax
    8e26:	89 c1                	mov    %eax,%ecx
    8e28:	8b 45 08             	mov    0x8(%ebp),%eax
    8e2b:	01 c8                	add    %ecx,%eax
    8e2d:	dd 04 d8             	fldl   (%eax,%ebx,8)
    8e30:	dd 05 50 bd 00 00    	fldl   0xbd50
    8e36:	de e9                	fsubrp %st,%st(1)
    8e38:	d9 7d e6             	fnstcw -0x1a(%ebp)
    8e3b:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    8e3f:	b4 0c                	mov    $0xc,%ah
    8e41:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    8e45:	d9 6d e4             	fldcw  -0x1c(%ebp)
    8e48:	db 5d e0             	fistpl -0x20(%ebp)
    8e4b:	d9 6d e6             	fldcw  -0x1a(%ebp)
    8e4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8e51:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8e54:	db 45 e0             	fildl  -0x20(%ebp)
    8e57:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    8e5a:	89 f0                	mov    %esi,%eax
    8e5c:	c1 e0 08             	shl    $0x8,%eax
    8e5f:	89 c2                	mov    %eax,%edx
    8e61:	8b 45 08             	mov    0x8(%ebp),%eax
    8e64:	01 d0                	add    %edx,%eax
    8e66:	89 f2                	mov    %esi,%edx
    8e68:	89 d1                	mov    %edx,%ecx
    8e6a:	c1 e1 08             	shl    $0x8,%ecx
    8e6d:	8b 55 08             	mov    0x8(%ebp),%edx
    8e70:	01 ca                	add    %ecx,%edx
    8e72:	dd 04 da             	fldl   (%edx,%ebx,8)
    8e75:	dd 05 98 bd 00 00    	fldl   0xbd98
    8e7b:	de c9                	fmulp  %st,%st(1)
    8e7d:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    8e80:	83 c3 01             	add    $0x1,%ebx
    8e83:	83 fb 1f             	cmp    $0x1f,%ebx
    8e86:	0f 8e f1 fe ff ff    	jle    8d7d <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    8e8c:	83 c6 01             	add    $0x1,%esi
    8e8f:	83 fe 3f             	cmp    $0x3f,%esi
    8e92:	0f 8e db fe ff ff    	jle    8d73 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    8e98:	83 c4 1c             	add    $0x1c,%esp
    8e9b:	5b                   	pop    %ebx
    8e9c:	5e                   	pop    %esi
    8e9d:	5f                   	pop    %edi
    8e9e:	5d                   	pop    %ebp
    8e9f:	c3                   	ret    

00008ea0 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    8ea0:	55                   	push   %ebp
    8ea1:	89 e5                	mov    %esp,%ebp
    8ea3:	57                   	push   %edi
    8ea4:	56                   	push   %esi
    8ea5:	53                   	push   %ebx
    8ea6:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    8eac:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    8eb2:	bb 00 ad 00 00       	mov    $0xad00,%ebx
    8eb7:	b8 00 04 00 00       	mov    $0x400,%eax
    8ebc:	89 d7                	mov    %edx,%edi
    8ebe:	89 de                	mov    %ebx,%esi
    8ec0:	89 c1                	mov    %eax,%ecx
    8ec2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    8ec4:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    8eca:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    8ecd:	81 c4 14 10 00 00    	add    $0x1014,%esp
    8ed3:	5b                   	pop    %ebx
    8ed4:	5e                   	pop    %esi
    8ed5:	5f                   	pop    %edi
    8ed6:	5d                   	pop    %ebp
    8ed7:	c3                   	ret    

00008ed8 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    8ed8:	55                   	push   %ebp
    8ed9:	89 e5                	mov    %esp,%ebp
    8edb:	57                   	push   %edi
    8edc:	56                   	push   %esi
    8edd:	53                   	push   %ebx
    8ede:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    8ee1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    8ee8:	a1 68 d1 00 00       	mov    0xd168,%eax
    8eed:	85 c0                	test   %eax,%eax
    8eef:	74 6f                	je     8f60 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    8ef1:	c7 44 24 04 00 bd 00 	movl   $0xbd00,0x4(%esp)
    8ef8:	00 
    8ef9:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    8f00:	e8 15 a8 ff ff       	call   371a <mem_alloc>
    8f05:	a3 60 ff 00 00       	mov    %eax,0xff60
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    8f0a:	c7 44 24 04 03 bd 00 	movl   $0xbd03,0x4(%esp)
    8f11:	00 
    8f12:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    8f19:	e8 fc a7 ff ff       	call   371a <mem_alloc>
    8f1e:	a3 64 ff 00 00       	mov    %eax,0xff64
		create_syn_filter(*filter);
    8f23:	a1 64 ff 00 00       	mov    0xff64,%eax
    8f28:	89 04 24             	mov    %eax,(%esp)
    8f2b:	e8 30 fe ff ff       	call   8d60 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    8f30:	c7 44 24 04 06 bd 00 	movl   $0xbd06,0x4(%esp)
    8f37:	00 
    8f38:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    8f3f:	e8 d6 a7 ff ff       	call   371a <mem_alloc>
    8f44:	a3 68 ff 00 00       	mov    %eax,0xff68
		read_syn_window(window);
    8f49:	a1 68 ff 00 00       	mov    0xff68,%eax
    8f4e:	89 04 24             	mov    %eax,(%esp)
    8f51:	e8 4a ff ff ff       	call   8ea0 <read_syn_window>
		init = 0;
    8f56:	c7 05 68 d1 00 00 00 	movl   $0x0,0xd168
    8f5d:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    8f60:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f63:	8b 04 85 6c d1 00 00 	mov    0xd16c(,%eax,4),%eax
    8f6a:	83 e8 40             	sub    $0x40,%eax
    8f6d:	25 ff 03 00 00       	and    $0x3ff,%eax
    8f72:	89 c2                	mov    %eax,%edx
    8f74:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f77:	89 14 85 6c d1 00 00 	mov    %edx,0xd16c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    8f7e:	8b 15 60 ff 00 00    	mov    0xff60,%edx
    8f84:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f87:	8b 04 85 6c d1 00 00 	mov    0xd16c(,%eax,4),%eax
    8f8e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8f91:	c1 e1 0a             	shl    $0xa,%ecx
    8f94:	01 c8                	add    %ecx,%eax
    8f96:	c1 e0 03             	shl    $0x3,%eax
    8f99:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    8f9c:	bb 00 00 00 00       	mov    $0x0,%ebx
    8fa1:	eb 40                	jmp    8fe3 <SubBandSynthesis+0x10b>
		sum = 0;
    8fa3:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    8fa5:	be 00 00 00 00       	mov    $0x0,%esi
    8faa:	eb 26                	jmp    8fd2 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    8fac:	89 f0                	mov    %esi,%eax
    8fae:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8fb5:	8b 45 08             	mov    0x8(%ebp),%eax
    8fb8:	01 d0                	add    %edx,%eax
    8fba:	dd 00                	fldl   (%eax)
    8fbc:	a1 64 ff 00 00       	mov    0xff64,%eax
    8fc1:	89 da                	mov    %ebx,%edx
    8fc3:	c1 e2 05             	shl    $0x5,%edx
    8fc6:	01 f2                	add    %esi,%edx
    8fc8:	dd 04 d0             	fldl   (%eax,%edx,8)
    8fcb:	de c9                	fmulp  %st,%st(1)
    8fcd:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    8fcf:	83 c6 01             	add    $0x1,%esi
    8fd2:	83 fe 1f             	cmp    $0x1f,%esi
    8fd5:	7e d5                	jle    8fac <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    8fd7:	89 d8                	mov    %ebx,%eax
    8fd9:	c1 e0 03             	shl    $0x3,%eax
    8fdc:	01 f8                	add    %edi,%eax
    8fde:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    8fe0:	83 c3 01             	add    $0x1,%ebx
    8fe3:	83 fb 3f             	cmp    $0x3f,%ebx
    8fe6:	7e bb                	jle    8fa3 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    8fe8:	bf 00 00 00 00       	mov    $0x0,%edi
    8fed:	e9 c7 00 00 00       	jmp    90b9 <SubBandSynthesis+0x1e1>
		sum = 0;
    8ff2:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    8ff4:	bb 00 00 00 00       	mov    $0x0,%ebx
    8ff9:	eb 4c                	jmp    9047 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    8ffb:	89 d8                	mov    %ebx,%eax
    8ffd:	c1 e0 05             	shl    $0x5,%eax
    9000:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    9003:	a1 68 ff 00 00       	mov    0xff68,%eax
    9008:	89 f2                	mov    %esi,%edx
    900a:	c1 e2 03             	shl    $0x3,%edx
    900d:	01 d0                	add    %edx,%eax
    900f:	dd 00                	fldl   (%eax)
    9011:	a1 60 ff 00 00       	mov    0xff60,%eax
    9016:	8d 53 01             	lea    0x1(%ebx),%edx
    9019:	d1 fa                	sar    %edx
    901b:	c1 e2 06             	shl    $0x6,%edx
    901e:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    9021:	8b 55 0c             	mov    0xc(%ebp),%edx
    9024:	8b 14 95 6c d1 00 00 	mov    0xd16c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    902b:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    902d:	89 d1                	mov    %edx,%ecx
    902f:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    9035:	8b 55 0c             	mov    0xc(%ebp),%edx
    9038:	c1 e2 0a             	shl    $0xa,%edx
    903b:	01 ca                	add    %ecx,%edx
    903d:	dd 04 d0             	fldl   (%eax,%edx,8)
    9040:	de c9                	fmulp  %st,%st(1)
    9042:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    9044:	83 c3 01             	add    $0x1,%ebx
    9047:	83 fb 0f             	cmp    $0xf,%ebx
    904a:	7e af                	jle    8ffb <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    904c:	dd 05 a0 bd 00 00    	fldl   0xbda0
    9052:	de c9                	fmulp  %st,%st(1)
    9054:	d9 7d d6             	fnstcw -0x2a(%ebp)
    9057:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    905b:	b4 0c                	mov    $0xc,%ah
    905d:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    9061:	d9 6d d4             	fldcw  -0x2c(%ebp)
    9064:	db 5d e0             	fistpl -0x20(%ebp)
    9067:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    906a:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    9071:	7e 15                	jle    9088 <SubBandSynthesis+0x1b0>
    9073:	89 f8                	mov    %edi,%eax
    9075:	8d 14 00             	lea    (%eax,%eax,1),%edx
    9078:	8b 45 10             	mov    0x10(%ebp),%eax
    907b:	01 d0                	add    %edx,%eax
    907d:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    9082:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9086:	eb 2e                	jmp    90b6 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    9088:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    908f:	7d 15                	jge    90a6 <SubBandSynthesis+0x1ce>
    9091:	89 f8                	mov    %edi,%eax
    9093:	8d 14 00             	lea    (%eax,%eax,1),%edx
    9096:	8b 45 10             	mov    0x10(%ebp),%eax
    9099:	01 d0                	add    %edx,%eax
    909b:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    90a0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    90a4:	eb 10                	jmp    90b6 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    90a6:	89 f8                	mov    %edi,%eax
    90a8:	8d 14 00             	lea    (%eax,%eax,1),%edx
    90ab:	8b 45 10             	mov    0x10(%ebp),%eax
    90ae:	01 c2                	add    %eax,%edx
    90b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    90b3:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    90b6:	83 c7 01             	add    $0x1,%edi
    90b9:	83 ff 1f             	cmp    $0x1f,%edi
    90bc:	0f 8e 30 ff ff ff    	jle    8ff2 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    90c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    90c5:	83 c4 2c             	add    $0x2c,%esp
    90c8:	5b                   	pop    %ebx
    90c9:	5e                   	pop    %esi
    90ca:	5f                   	pop    %edi
    90cb:	5d                   	pop    %ebp
    90cc:	c3                   	ret    

000090cd <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    90cd:	55                   	push   %ebp
    90ce:	89 e5                	mov    %esp,%ebp
    90d0:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    90d3:	8b 45 10             	mov    0x10(%ebp),%eax
    90d6:	8b 40 08             	mov    0x8(%eax),%eax
    90d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    90dc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    90e3:	eb 75                	jmp    915a <out_fifo+0x8d>
    90e5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    90ec:	eb 62                	jmp    9150 <out_fifo+0x83>
            (*psampFrames)++;
    90ee:	8b 45 14             	mov    0x14(%ebp),%eax
    90f1:	8b 00                	mov    (%eax),%eax
    90f3:	8d 50 01             	lea    0x1(%eax),%edx
    90f6:	8b 45 14             	mov    0x14(%ebp),%eax
    90f9:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    90fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9102:	eb 40                	jmp    9144 <out_fifo+0x77>
                if (!(k%1600) && k) {
    9104:	8b 0d 6c ff 00 00    	mov    0xff6c,%ecx
    910a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    910f:	89 c8                	mov    %ecx,%eax
    9111:	f7 ea                	imul   %edx
    9113:	c1 fa 09             	sar    $0x9,%edx
    9116:	89 c8                	mov    %ecx,%eax
    9118:	c1 f8 1f             	sar    $0x1f,%eax
    911b:	29 c2                	sub    %eax,%edx
    911d:	89 d0                	mov    %edx,%eax
    911f:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    9125:	29 c1                	sub    %eax,%ecx
    9127:	89 c8                	mov    %ecx,%eax
    9129:	85 c0                	test   %eax,%eax
    912b:	75 13                	jne    9140 <out_fifo+0x73>
    912d:	a1 6c ff 00 00       	mov    0xff6c,%eax
    9132:	85 c0                	test   %eax,%eax
    9134:	74 0a                	je     9140 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    9136:	c7 05 6c ff 00 00 00 	movl   $0x0,0xff6c
    913d:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    9140:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9144:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9147:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    914a:	7c b8                	jl     9104 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    914c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9150:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    9154:	7e 98                	jle    90ee <out_fifo+0x21>
    9156:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    915a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    915d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    9160:	7c 83                	jl     90e5 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    9162:	c9                   	leave  
    9163:	c3                   	ret    

00009164 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    9164:	55                   	push   %ebp
    9165:	89 e5                	mov    %esp,%ebp
    9167:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    916a:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    9171:	00 
    9172:	8b 45 08             	mov    0x8(%ebp),%eax
    9175:	89 04 24             	mov    %eax,(%esp)
    9178:	e8 8b a8 ff ff       	call   3a08 <getbits>
    917d:	8b 55 0c             	mov    0xc(%ebp),%edx
    9180:	89 02                	mov    %eax,(%edx)
}
    9182:	c9                   	leave  
    9183:	c3                   	ret    

00009184 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    9184:	55                   	push   %ebp
    9185:	89 e5                	mov    %esp,%ebp
    9187:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    918a:	8b 45 08             	mov    0x8(%ebp),%eax
    918d:	8b 40 0c             	mov    0xc(%eax),%eax
    9190:	83 c0 1e             	add    $0x1e,%eax
    9193:	8b 14 85 c0 cc 00 00 	mov    0xccc0(,%eax,4),%edx
    919a:	89 d0                	mov    %edx,%eax
    919c:	c1 e0 03             	shl    $0x3,%eax
    919f:	01 d0                	add    %edx,%eax
    91a1:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    91a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    91a7:	db 45 ec             	fildl  -0x14(%ebp)
    91aa:	8b 45 08             	mov    0x8(%ebp),%eax
    91ad:	8b 40 10             	mov    0x10(%eax),%eax
    91b0:	dd 04 c5 80 cd 00 00 	fldl   0xcd80(,%eax,8)
    91b7:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    91b9:	d9 7d ea             	fnstcw -0x16(%ebp)
    91bc:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    91c0:	b4 0c                	mov    $0xc,%ah
    91c2:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    91c6:	d9 6d e8             	fldcw  -0x18(%ebp)
    91c9:	db 5d fc             	fistpl -0x4(%ebp)
    91cc:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    91cf:	8b 45 08             	mov    0x8(%ebp),%eax
    91d2:	8b 40 14             	mov    0x14(%eax),%eax
    91d5:	85 c0                	test   %eax,%eax
    91d7:	74 04                	je     91dd <main_data_slots+0x59>
    91d9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    91dd:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    91e1:	8b 45 08             	mov    0x8(%ebp),%eax
    91e4:	8b 40 08             	mov    0x8(%eax),%eax
    91e7:	85 c0                	test   %eax,%eax
    91e9:	74 04                	je     91ef <main_data_slots+0x6b>
		nSlots -= 2;
    91eb:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    91ef:	8b 45 10             	mov    0x10(%ebp),%eax
    91f2:	83 f8 01             	cmp    $0x1,%eax
    91f5:	75 06                	jne    91fd <main_data_slots+0x79>
		nSlots -= 17;
    91f7:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    91fb:	eb 04                	jmp    9201 <main_data_slots+0x7d>
	else
		nSlots -=32;
    91fd:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    9201:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    9204:	c9                   	leave  
    9205:	c3                   	ret    
