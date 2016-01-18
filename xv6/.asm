
_playmusic:     file format elf32-i386


Disassembly of section .text:

00000000 <addFileItem>:
void h_chooseFile(Point p);

char * sizeFormat(uint size);

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
       6:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
       d:	e8 07 3a 00 00       	call   3a19 <malloc>
      12:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      15:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1c:	e8 f8 39 00 00       	call   3a19 <malloc>
      21:	8b 55 f4             	mov    -0xc(%ebp),%edx
      24:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      27:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2a:	8b 40 14             	mov    0x14(%eax),%eax
      2d:	8b 55 1c             	mov    0x1c(%ebp),%edx
      30:	89 54 24 04          	mov    %edx,0x4(%esp)
      34:	89 04 24             	mov    %eax,(%esp)
      37:	e8 c6 32 00 00       	call   3302 <strcpy>
	temp->st = st;
      3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
      3f:	8b 55 08             	mov    0x8(%ebp),%edx
      42:	89 10                	mov    %edx,(%eax)
      44:	8b 55 0c             	mov    0xc(%ebp),%edx
      47:	89 50 04             	mov    %edx,0x4(%eax)
      4a:	8b 55 10             	mov    0x10(%ebp),%edx
      4d:	89 50 08             	mov    %edx,0x8(%eax)
      50:	8b 55 14             	mov    0x14(%ebp),%edx
      53:	89 50 0c             	mov    %edx,0xc(%eax)
      56:	8b 55 18             	mov    0x18(%ebp),%edx
      59:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = pos;
      5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5f:	8b 55 20             	mov    0x20(%ebp),%edx
      62:	89 50 18             	mov    %edx,0x18(%eax)
      65:	8b 55 24             	mov    0x24(%ebp),%edx
      68:	89 50 1c             	mov    %edx,0x1c(%eax)
      6b:	8b 55 28             	mov    0x28(%ebp),%edx
      6e:	89 50 20             	mov    %edx,0x20(%eax)
      71:	8b 55 2c             	mov    0x2c(%ebp),%edx
      74:	89 50 24             	mov    %edx,0x24(%eax)
	temp->next = fileItemList;
      77:	8b 15 08 e0 00 00    	mov    0xe008,%edx
      7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      80:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      83:	8b 45 f4             	mov    -0xc(%ebp),%eax
      86:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      90:	a3 08 e0 00 00       	mov    %eax,0xe008
}
      95:	c9                   	leave  
      96:	c3                   	ret    

00000097 <freeFileItemList>:

void freeFileItemList() {
      97:	55                   	push   %ebp
      98:	89 e5                	mov    %esp,%ebp
      9a:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
      9d:	a1 08 e0 00 00       	mov    0xe008,%eax
      a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
      a5:	eb 28                	jmp    cf <freeFileItemList+0x38>
		temp = p;
      a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
      aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
      ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b0:	8b 40 2c             	mov    0x2c(%eax),%eax
      b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
      b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b9:	8b 40 14             	mov    0x14(%eax),%eax
      bc:	89 04 24             	mov    %eax,(%esp)
      bf:	e8 1c 38 00 00       	call   38e0 <free>
		free(temp);
      c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
      c7:	89 04 24             	mov    %eax,(%esp)
      ca:	e8 11 38 00 00       	call   38e0 <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
      cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      d3:	75 d2                	jne    a7 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
      d5:	c7 05 08 e0 00 00 00 	movl   $0x0,0xe008
      dc:	00 00 00 
}
      df:	c9                   	leave  
      e0:	c3                   	ret    

000000e1 <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
      e1:	55                   	push   %ebp
      e2:	89 e5                	mov    %esp,%ebp
      e4:	83 ec 28             	sub    $0x28,%esp
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
      e7:	8b 45 08             	mov    0x8(%ebp),%eax
      ea:	89 04 24             	mov    %eax,(%esp)
      ed:	e8 7f 32 00 00       	call   3371 <strlen>
      f2:	8b 55 08             	mov    0x8(%ebp),%edx
      f5:	01 d0                	add    %edx,%eax
      f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      fa:	eb 04                	jmp    100 <fmtname+0x1f>
      fc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     100:	8b 45 f4             	mov    -0xc(%ebp),%eax
     103:	3b 45 08             	cmp    0x8(%ebp),%eax
     106:	72 0a                	jb     112 <fmtname+0x31>
     108:	8b 45 f4             	mov    -0xc(%ebp),%eax
     10b:	0f b6 00             	movzbl (%eax),%eax
     10e:	3c 2f                	cmp    $0x2f,%al
     110:	75 ea                	jne    fc <fmtname+0x1b>
		;
	p++;
     112:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     116:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     119:	c9                   	leave  
     11a:	c3                   	ret    

0000011b <getFileItem>:

struct fileItem * getFileItem(Point point) {
     11b:	55                   	push   %ebp
     11c:	89 e5                	mov    %esp,%ebp
     11e:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
     121:	a1 08 e0 00 00       	mov    0xe008,%eax
     126:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     129:	eb 43                	jmp    16e <getFileItem+0x53>
		if (isIn(point, p->pos)) {
     12b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     12e:	8b 50 18             	mov    0x18(%eax),%edx
     131:	89 54 24 08          	mov    %edx,0x8(%esp)
     135:	8b 50 1c             	mov    0x1c(%eax),%edx
     138:	89 54 24 0c          	mov    %edx,0xc(%esp)
     13c:	8b 50 20             	mov    0x20(%eax),%edx
     13f:	89 54 24 10          	mov    %edx,0x10(%esp)
     143:	8b 40 24             	mov    0x24(%eax),%eax
     146:	89 44 24 14          	mov    %eax,0x14(%esp)
     14a:	8b 45 08             	mov    0x8(%ebp),%eax
     14d:	8b 55 0c             	mov    0xc(%ebp),%edx
     150:	89 04 24             	mov    %eax,(%esp)
     153:	89 54 24 04          	mov    %edx,0x4(%esp)
     157:	e8 26 2b 00 00       	call   2c82 <isIn>
     15c:	85 c0                	test   %eax,%eax
     15e:	74 05                	je     165 <getFileItem+0x4a>
			return p;
     160:	8b 45 f4             	mov    -0xc(%ebp),%eax
     163:	eb 14                	jmp    179 <getFileItem+0x5e>
		}
		p = p->next;
     165:	8b 45 f4             	mov    -0xc(%ebp),%eax
     168:	8b 40 2c             	mov    0x2c(%eax),%eax
     16b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return p;
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
     16e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     172:	75 b7                	jne    12b <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
     174:	b8 00 00 00 00       	mov    $0x0,%eax
}
     179:	c9                   	leave  
     17a:	c3                   	ret    

0000017b <drawItem>:

// 绘图函数相关操作
struct Icon contentRes[] = { {"file_icon_small.bmp", 0, 0 }, {"folder_icon_small.bmp", 0, 0 }, };

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     17b:	55                   	push   %ebp
     17c:	89 e5                	mov    %esp,%ebp
     17e:	53                   	push   %ebx
     17f:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0)
     182:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     186:	75 08                	jne    190 <drawItem+0x15>
		nameColor = 0x0;
     188:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     18e:	eb 49                	jmp    1d9 <drawItem+0x5e>
	else
	{
		nameColor = 0xFFFF;
     190:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     196:	8b 45 38             	mov    0x38(%ebp),%eax
     199:	89 c3                	mov    %eax,%ebx
     19b:	8b 45 34             	mov    0x34(%ebp),%eax
     19e:	89 c1                	mov    %eax,%ecx
     1a0:	8b 45 30             	mov    0x30(%ebp),%eax
     1a3:	89 c2                	mov    %eax,%edx
     1a5:	8b 45 2c             	mov    0x2c(%ebp),%eax
     1a8:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     1af:	00 
     1b0:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     1b4:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     1b8:	89 54 24 10          	mov    %edx,0x10(%esp)
     1bc:	89 44 24 0c          	mov    %eax,0xc(%esp)
     1c0:	8b 45 08             	mov    0x8(%ebp),%eax
     1c3:	89 04 24             	mov    %eax,(%esp)
     1c6:	8b 45 0c             	mov    0xc(%ebp),%eax
     1c9:	89 44 24 04          	mov    %eax,0x4(%esp)
     1cd:	8b 45 10             	mov    0x10(%ebp),%eax
     1d0:	89 44 24 08          	mov    %eax,0x8(%esp)
     1d4:	e8 04 16 00 00       	call   17dd <fill_rect>
	}
	if (style == ICON_STYLE) {
     1d9:	a1 e8 d9 00 00       	mov    0xd9e8,%eax
     1de:	83 f8 01             	cmp    $0x1,%eax
     1e1:	0f 85 13 01 00 00    	jne    2fa <drawItem+0x17f>
		switch (st.type) {
     1e7:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     1eb:	98                   	cwtl   
     1ec:	83 f8 01             	cmp    $0x1,%eax
     1ef:	74 53                	je     244 <drawItem+0xc9>
     1f1:	83 f8 02             	cmp    $0x2,%eax
     1f4:	0f 85 93 00 00 00    	jne    28d <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     1fa:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
     1fd:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     200:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
     203:	83 c0 19             	add    $0x19,%eax
     206:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     20a:	89 44 24 18          	mov    %eax,0x18(%esp)
     20e:	a1 28 da 00 00       	mov    0xda28,%eax
     213:	89 44 24 0c          	mov    %eax,0xc(%esp)
     217:	a1 2c da 00 00       	mov    0xda2c,%eax
     21c:	89 44 24 10          	mov    %eax,0x10(%esp)
     220:	a1 30 da 00 00       	mov    0xda30,%eax
     225:	89 44 24 14          	mov    %eax,0x14(%esp)
     229:	8b 45 08             	mov    0x8(%ebp),%eax
     22c:	89 04 24             	mov    %eax,(%esp)
     22f:	8b 45 0c             	mov    0xc(%ebp),%eax
     232:	89 44 24 04          	mov    %eax,0x4(%esp)
     236:	8b 45 10             	mov    0x10(%ebp),%eax
     239:	89 44 24 08          	mov    %eax,0x8(%esp)
     23d:	e8 3a 1c 00 00       	call   1e7c <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     242:	eb 49                	jmp    28d <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     244:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[0].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
     247:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     24a:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[0].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
     24d:	83 c0 19             	add    $0x19,%eax
     250:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     254:	89 44 24 18          	mov    %eax,0x18(%esp)
     258:	a1 5c da 00 00       	mov    0xda5c,%eax
     25d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     261:	a1 60 da 00 00       	mov    0xda60,%eax
     266:	89 44 24 10          	mov    %eax,0x10(%esp)
     26a:	a1 64 da 00 00       	mov    0xda64,%eax
     26f:	89 44 24 14          	mov    %eax,0x14(%esp)
     273:	8b 45 08             	mov    0x8(%ebp),%eax
     276:	89 04 24             	mov    %eax,(%esp)
     279:	8b 45 0c             	mov    0xc(%ebp),%eax
     27c:	89 44 24 04          	mov    %eax,0x4(%esp)
     280:	8b 45 10             	mov    0x10(%ebp),%eax
     283:	89 44 24 08          	mov    %eax,0x8(%esp)
     287:	e8 f0 1b 00 00       	call   1e7c <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     28c:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     28d:	8b 45 14             	mov    0x14(%ebp),%eax
     290:	89 04 24             	mov    %eax,(%esp)
     293:	e8 d9 30 00 00       	call   3371 <strlen>
     298:	89 c2                	mov    %eax,%edx
     29a:	b8 00 00 00 00       	mov    $0x0,%eax
     29f:	29 d0                	sub    %edx,%eax
     2a1:	c1 e0 02             	shl    $0x2,%eax
     2a4:	83 c0 30             	add    $0x30,%eax
     2a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     2aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     2ae:	79 07                	jns    2b7 <drawItem+0x13c>
			indent = 0;
     2b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     2b7:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     2ba:	8d 48 46             	lea    0x46(%eax),%ecx
     2bd:	8b 55 2c             	mov    0x2c(%ebp),%edx
     2c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     2c3:	01 c2                	add    %eax,%edx
     2c5:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     2c9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     2cd:	89 54 24 14          	mov    %edx,0x14(%esp)
     2d1:	89 44 24 10          	mov    %eax,0x10(%esp)
     2d5:	8b 45 14             	mov    0x14(%ebp),%eax
     2d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     2dc:	8b 45 08             	mov    0x8(%ebp),%eax
     2df:	89 04 24             	mov    %eax,(%esp)
     2e2:	8b 45 0c             	mov    0xc(%ebp),%eax
     2e5:	89 44 24 04          	mov    %eax,0x4(%esp)
     2e9:	8b 45 10             	mov    0x10(%ebp),%eax
     2ec:	89 44 24 08          	mov    %eax,0x8(%esp)
     2f0:	e8 c7 1a 00 00       	call   1dbc <puts_str>
     2f5:	e9 33 01 00 00       	jmp    42d <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     2fa:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     2fe:	98                   	cwtl   
     2ff:	83 f8 01             	cmp    $0x1,%eax
     302:	0f 84 a0 00 00 00    	je     3a8 <drawItem+0x22d>
     308:	83 f8 02             	cmp    $0x2,%eax
     30b:	0f 85 e0 00 00 00    	jne    3f1 <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     311:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
     314:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     317:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
     31a:	83 c0 08             	add    $0x8,%eax
     31d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     321:	89 44 24 18          	mov    %eax,0x18(%esp)
     325:	a1 28 da 00 00       	mov    0xda28,%eax
     32a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     32e:	a1 2c da 00 00       	mov    0xda2c,%eax
     333:	89 44 24 10          	mov    %eax,0x10(%esp)
     337:	a1 30 da 00 00       	mov    0xda30,%eax
     33c:	89 44 24 14          	mov    %eax,0x14(%esp)
     340:	8b 45 08             	mov    0x8(%ebp),%eax
     343:	89 04 24             	mov    %eax,(%esp)
     346:	8b 45 0c             	mov    0xc(%ebp),%eax
     349:	89 44 24 04          	mov    %eax,0x4(%esp)
     34d:	8b 45 10             	mov    0x10(%ebp),%eax
     350:	89 44 24 08          	mov    %eax,0x8(%esp)
     354:	e8 23 1b 00 00       	call   1e7c <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     359:	8b 45 28             	mov    0x28(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 cf 00 00 00       	call   433 <sizeFormat>
     364:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     367:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[0].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     36a:	8d 48 03             	lea    0x3(%eax),%ecx
     36d:	8b 45 2c             	mov    0x2c(%ebp),%eax
     370:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     376:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     37a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     37e:	89 54 24 14          	mov    %edx,0x14(%esp)
     382:	89 44 24 10          	mov    %eax,0x10(%esp)
     386:	8b 45 ec             	mov    -0x14(%ebp),%eax
     389:	89 44 24 0c          	mov    %eax,0xc(%esp)
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
     390:	89 04 24             	mov    %eax,(%esp)
     393:	8b 45 0c             	mov    0xc(%ebp),%eax
     396:	89 44 24 04          	mov    %eax,0x4(%esp)
     39a:	8b 45 10             	mov    0x10(%ebp),%eax
     39d:	89 44 24 08          	mov    %eax,0x8(%esp)
     3a1:	e8 16 1a 00 00       	call   1dbc <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     3a6:	eb 49                	jmp    3f1 <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     3a8:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
     3ab:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     3ae:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
     3b1:	83 c0 08             	add    $0x8,%eax
     3b4:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     3b8:	89 44 24 18          	mov    %eax,0x18(%esp)
     3bc:	a1 5c da 00 00       	mov    0xda5c,%eax
     3c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
     3c5:	a1 60 da 00 00       	mov    0xda60,%eax
     3ca:	89 44 24 10          	mov    %eax,0x10(%esp)
     3ce:	a1 64 da 00 00       	mov    0xda64,%eax
     3d3:	89 44 24 14          	mov    %eax,0x14(%esp)
     3d7:	8b 45 08             	mov    0x8(%ebp),%eax
     3da:	89 04 24             	mov    %eax,(%esp)
     3dd:	8b 45 0c             	mov    0xc(%ebp),%eax
     3e0:	89 44 24 04          	mov    %eax,0x4(%esp)
     3e4:	8b 45 10             	mov    0x10(%ebp),%eax
     3e7:	89 44 24 08          	mov    %eax,0x8(%esp)
     3eb:	e8 8c 1a 00 00       	call   1e7c <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     3f0:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     3f1:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[1].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     3f4:	8d 48 03             	lea    0x3(%eax),%ecx
     3f7:	8b 45 2c             	mov    0x2c(%ebp),%eax
     3fa:	8d 50 28             	lea    0x28(%eax),%edx
     3fd:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     401:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     405:	89 54 24 14          	mov    %edx,0x14(%esp)
     409:	89 44 24 10          	mov    %eax,0x10(%esp)
     40d:	8b 45 14             	mov    0x14(%ebp),%eax
     410:	89 44 24 0c          	mov    %eax,0xc(%esp)
     414:	8b 45 08             	mov    0x8(%ebp),%eax
     417:	89 04 24             	mov    %eax,(%esp)
     41a:	8b 45 0c             	mov    0xc(%ebp),%eax
     41d:	89 44 24 04          	mov    %eax,0x4(%esp)
     421:	8b 45 10             	mov    0x10(%ebp),%eax
     424:	89 44 24 08          	mov    %eax,0x8(%esp)
     428:	e8 8f 19 00 00       	call   1dbc <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     42d:	83 c4 34             	add    $0x34,%esp
     430:	5b                   	pop    %ebx
     431:	5d                   	pop    %ebp
     432:	c3                   	ret    

00000433 <sizeFormat>:

char *sizeFormat(uint size){
     433:	55                   	push   %ebp
     434:	89 e5                	mov    %esp,%ebp
     436:	53                   	push   %ebx
     437:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     43a:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     441:	e8 d3 35 00 00       	call   3a19 <malloc>
     446:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     449:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400)
     450:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     457:	0f 86 8b 00 00 00    	jbe    4e8 <sizeFormat+0xb5>
	{
		size = size / (0x400);
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
     460:	c1 e8 0a             	shr    $0xa,%eax
     463:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     466:	8b 45 f4             	mov    -0xc(%ebp),%eax
     469:	8d 50 01             	lea    0x1(%eax),%edx
     46c:	89 55 f4             	mov    %edx,-0xc(%ebp)
     46f:	89 c2                	mov    %eax,%edx
     471:	8b 45 f0             	mov    -0x10(%ebp),%eax
     474:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     477:	8b 4d 08             	mov    0x8(%ebp),%ecx
     47a:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     47f:	89 c8                	mov    %ecx,%eax
     481:	f7 e2                	mul    %edx
     483:	c1 ea 03             	shr    $0x3,%edx
     486:	89 d0                	mov    %edx,%eax
     488:	c1 e0 02             	shl    $0x2,%eax
     48b:	01 d0                	add    %edx,%eax
     48d:	01 c0                	add    %eax,%eax
     48f:	29 c1                	sub    %eax,%ecx
     491:	89 ca                	mov    %ecx,%edx
     493:	89 d0                	mov    %edx,%eax
     495:	83 c0 30             	add    $0x30,%eax
     498:	88 03                	mov    %al,(%ebx)
			size /= 10;
     49a:	8b 45 08             	mov    0x8(%ebp),%eax
     49d:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     4a2:	f7 e2                	mul    %edx
     4a4:	89 d0                	mov    %edx,%eax
     4a6:	c1 e8 03             	shr    $0x3,%eax
     4a9:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     4ac:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     4b0:	75 b4                	jne    466 <sizeFormat+0x33>
		result[n++] = 'K';
     4b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4b5:	8d 50 01             	lea    0x1(%eax),%edx
     4b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4bb:	89 c2                	mov    %eax,%edx
     4bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4c0:	01 d0                	add    %edx,%eax
     4c2:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     4c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c8:	8d 50 01             	lea    0x1(%eax),%edx
     4cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4ce:	89 c2                	mov    %eax,%edx
     4d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4d3:	01 d0                	add    %edx,%eax
     4d5:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     4db:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4de:	01 d0                	add    %edx,%eax
     4e0:	c6 00 00             	movb   $0x0,(%eax)
     4e3:	e9 a3 00 00 00       	jmp    58b <sizeFormat+0x158>
	}
	else
	{
		do{
			result[n++] = (size % 10) + '0';
     4e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4eb:	8d 50 01             	lea    0x1(%eax),%edx
     4ee:	89 55 f4             	mov    %edx,-0xc(%ebp)
     4f1:	89 c2                	mov    %eax,%edx
     4f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4f6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     4f9:	8b 4d 08             	mov    0x8(%ebp),%ecx
     4fc:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     501:	89 c8                	mov    %ecx,%eax
     503:	f7 e2                	mul    %edx
     505:	c1 ea 03             	shr    $0x3,%edx
     508:	89 d0                	mov    %edx,%eax
     50a:	c1 e0 02             	shl    $0x2,%eax
     50d:	01 d0                	add    %edx,%eax
     50f:	01 c0                	add    %eax,%eax
     511:	29 c1                	sub    %eax,%ecx
     513:	89 ca                	mov    %ecx,%edx
     515:	89 d0                	mov    %edx,%eax
     517:	83 c0 30             	add    $0x30,%eax
     51a:	88 03                	mov    %al,(%ebx)
			size /= 10;
     51c:	8b 45 08             	mov    0x8(%ebp),%eax
     51f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     524:	f7 e2                	mul    %edx
     526:	89 d0                	mov    %edx,%eax
     528:	c1 e8 03             	shr    $0x3,%eax
     52b:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     52e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     532:	75 b4                	jne    4e8 <sizeFormat+0xb5>
		result[n++] = 'b';
     534:	8b 45 f4             	mov    -0xc(%ebp),%eax
     537:	8d 50 01             	lea    0x1(%eax),%edx
     53a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     53d:	89 c2                	mov    %eax,%edx
     53f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     542:	01 d0                	add    %edx,%eax
     544:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     547:	8b 45 f4             	mov    -0xc(%ebp),%eax
     54a:	8d 50 01             	lea    0x1(%eax),%edx
     54d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     550:	89 c2                	mov    %eax,%edx
     552:	8b 45 f0             	mov    -0x10(%ebp),%eax
     555:	01 d0                	add    %edx,%eax
     557:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     55a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     55d:	8d 50 01             	lea    0x1(%eax),%edx
     560:	89 55 f4             	mov    %edx,-0xc(%ebp)
     563:	89 c2                	mov    %eax,%edx
     565:	8b 45 f0             	mov    -0x10(%ebp),%eax
     568:	01 d0                	add    %edx,%eax
     56a:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     56d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     570:	8d 50 01             	lea    0x1(%eax),%edx
     573:	89 55 f4             	mov    %edx,-0xc(%ebp)
     576:	89 c2                	mov    %eax,%edx
     578:	8b 45 f0             	mov    -0x10(%ebp),%eax
     57b:	01 d0                	add    %edx,%eax
     57d:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     580:	8b 55 f4             	mov    -0xc(%ebp),%edx
     583:	8b 45 f0             	mov    -0x10(%ebp),%eax
     586:	01 d0                	add    %edx,%eax
     588:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     58b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     58e:	83 c4 24             	add    $0x24,%esp
     591:	5b                   	pop    %ebx
     592:	5d                   	pop    %ebp
     593:	c3                   	ret    

00000594 <drawMusicWnd>:
//draw main window
struct Icon wndRes[] = { { "close.bmp", 3, 3 }, { "pause.bmp", WINDOW_WIDTH / 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }};

void drawMusicWnd(Context context) {
     594:	55                   	push   %ebp
     595:	89 e5                	mov    %esp,%ebp
     597:	83 ec 28             	sub    $0x28,%esp
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
     59a:	8b 45 10             	mov    0x10(%ebp),%eax
     59d:	89 c2                	mov    %eax,%edx
     59f:	8b 45 0c             	mov    0xc(%ebp),%eax
     5a2:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     5a9:	00 
     5aa:	89 54 24 18          	mov    %edx,0x18(%esp)
     5ae:	89 44 24 14          	mov    %eax,0x14(%esp)
     5b2:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     5b9:	00 
     5ba:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     5c1:	00 
     5c2:	8b 45 08             	mov    0x8(%ebp),%eax
     5c5:	89 04 24             	mov    %eax,(%esp)
     5c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5cb:	89 44 24 04          	mov    %eax,0x4(%esp)
     5cf:	8b 45 10             	mov    0x10(%ebp),%eax
     5d2:	89 44 24 08          	mov    %eax,0x8(%esp)
     5d6:	e8 02 12 00 00       	call   17dd <fill_rect>

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     5db:	8b 45 0c             	mov    0xc(%ebp),%eax
     5de:	83 e8 01             	sub    $0x1,%eax
     5e1:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     5e8:	00 
     5e9:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     5f0:	00 
     5f1:	89 44 24 14          	mov    %eax,0x14(%esp)
     5f5:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     5fc:	00 
     5fd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     604:	00 
     605:	8b 45 08             	mov    0x8(%ebp),%eax
     608:	89 04 24             	mov    %eax,(%esp)
     60b:	8b 45 0c             	mov    0xc(%ebp),%eax
     60e:	89 44 24 04          	mov    %eax,0x4(%esp)
     612:	8b 45 10             	mov    0x10(%ebp),%eax
     615:	89 44 24 08          	mov    %eax,0x8(%esp)
     619:	e8 34 19 00 00       	call   1f52 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     61e:	8b 45 10             	mov    0x10(%ebp),%eax

void drawMusicWnd(Context context) {
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     621:	8d 48 ff             	lea    -0x1(%eax),%ecx
     624:	8b 45 0c             	mov    0xc(%ebp),%eax
     627:	8d 50 ff             	lea    -0x1(%eax),%edx
     62a:	8b 45 0c             	mov    0xc(%ebp),%eax
     62d:	83 e8 01             	sub    $0x1,%eax
     630:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     637:	00 
     638:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     63c:	89 54 24 14          	mov    %edx,0x14(%esp)
     640:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     647:	00 
     648:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64c:	8b 45 08             	mov    0x8(%ebp),%eax
     64f:	89 04 24             	mov    %eax,(%esp)
     652:	8b 45 0c             	mov    0xc(%ebp),%eax
     655:	89 44 24 04          	mov    %eax,0x4(%esp)
     659:	8b 45 10             	mov    0x10(%ebp),%eax
     65c:	89 44 24 08          	mov    %eax,0x8(%esp)
     660:	e8 ed 18 00 00       	call   1f52 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     665:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     668:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     66b:	8b 45 0c             	mov    0xc(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     66e:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     671:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     674:	83 e8 01             	sub    $0x1,%eax
     677:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     67e:	00 
     67f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     683:	89 54 24 14          	mov    %edx,0x14(%esp)
     687:	89 44 24 10          	mov    %eax,0x10(%esp)
     68b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     692:	00 
     693:	8b 45 08             	mov    0x8(%ebp),%eax
     696:	89 04 24             	mov    %eax,(%esp)
     699:	8b 45 0c             	mov    0xc(%ebp),%eax
     69c:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a0:	8b 45 10             	mov    0x10(%ebp),%eax
     6a3:	89 44 24 08          	mov    %eax,0x8(%esp)
     6a7:	e8 a6 18 00 00       	call   1f52 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     6ac:	8b 45 10             	mov    0x10(%ebp),%eax
     6af:	83 e8 01             	sub    $0x1,%eax
     6b2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     6b9:	00 
     6ba:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     6c1:	00 
     6c2:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     6c9:	00 
     6ca:	89 44 24 10          	mov    %eax,0x10(%esp)
     6ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6d5:	00 
     6d6:	8b 45 08             	mov    0x8(%ebp),%eax
     6d9:	89 04 24             	mov    %eax,(%esp)
     6dc:	8b 45 0c             	mov    0xc(%ebp),%eax
     6df:	89 44 24 04          	mov    %eax,0x4(%esp)
     6e3:	8b 45 10             	mov    0x10(%ebp),%eax
     6e6:	89 44 24 08          	mov    %eax,0x8(%esp)
     6ea:	e8 63 18 00 00       	call   1f52 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     6ef:	8b 45 0c             	mov    0xc(%ebp),%eax
     6f2:	83 e8 02             	sub    $0x2,%eax
     6f5:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     6fc:	00 
     6fd:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     704:	00 
     705:	89 44 24 14          	mov    %eax,0x14(%esp)
     709:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     710:	00 
     711:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     718:	00 
     719:	8b 45 08             	mov    0x8(%ebp),%eax
     71c:	89 04 24             	mov    %eax,(%esp)
     71f:	8b 45 0c             	mov    0xc(%ebp),%eax
     722:	89 44 24 04          	mov    %eax,0x4(%esp)
     726:	8b 45 10             	mov    0x10(%ebp),%eax
     729:	89 44 24 08          	mov    %eax,0x8(%esp)
     72d:	e8 ab 10 00 00       	call   17dd <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Media Player", 0, WINDOW_WIDTH / 2, 3);
     732:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     739:	00 
     73a:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     741:	00 
     742:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     749:	00 
     74a:	c7 44 24 0c a0 9d 00 	movl   $0x9da0,0xc(%esp)
     751:	00 
     752:	8b 45 08             	mov    0x8(%ebp),%eax
     755:	89 04 24             	mov    %eax,(%esp)
     758:	8b 45 0c             	mov    0xc(%ebp),%eax
     75b:	89 44 24 04          	mov    %eax,0x4(%esp)
     75f:	8b 45 10             	mov    0x10(%ebp),%eax
     762:	89 44 24 08          	mov    %eax,0x8(%esp)
     766:	e8 51 16 00 00       	call   1dbc <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     76b:	c7 44 24 10 02 00 00 	movl   $0x2,0x10(%esp)
     772:	00 
     773:	c7 44 24 0c 80 da 00 	movl   $0xda80,0xc(%esp)
     77a:	00 
     77b:	8b 45 08             	mov    0x8(%ebp),%eax
     77e:	89 04 24             	mov    %eax,(%esp)
     781:	8b 45 0c             	mov    0xc(%ebp),%eax
     784:	89 44 24 04          	mov    %eax,0x4(%esp)
     788:	8b 45 10             	mov    0x10(%ebp),%eax
     78b:	89 44 24 08          	mov    %eax,0x8(%esp)
     78f:	e8 99 1b 00 00       	call   232d <draw_iconlist>
}
     794:	c9                   	leave  
     795:	c3                   	ret    

00000796 <drawMusicContent>:

void drawMusicContent(Context context) {
     796:	55                   	push   %ebp
     797:	89 e5                	mov    %esp,%ebp
     799:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     79c:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     7a3:	a1 e8 d9 00 00       	mov    0xd9e8,%eax
     7a8:	83 f8 02             	cmp    $0x2,%eax
     7ab:	75 04                	jne    7b1 <drawMusicContent+0x1b>
     7ad:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     7b1:	8b 45 10             	mov    0x10(%ebp),%eax
     7b4:	83 e8 48             	sub    $0x48,%eax
void drawMusicContent(Context context) {
	struct fileItem *p;

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     7b7:	89 c1                	mov    %eax,%ecx
     7b9:	8b 45 0c             	mov    0xc(%ebp),%eax
     7bc:	83 e8 02             	sub    $0x2,%eax
     7bf:	89 c2                	mov    %eax,%edx
     7c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7c4:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     7cb:	00 
     7cc:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     7d0:	89 54 24 14          	mov    %edx,0x14(%esp)
     7d4:	89 44 24 10          	mov    %eax,0x10(%esp)
     7d8:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     7df:	00 
     7e0:	8b 45 08             	mov    0x8(%ebp),%eax
     7e3:	89 04 24             	mov    %eax,(%esp)
     7e6:	8b 45 0c             	mov    0xc(%ebp),%eax
     7e9:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ed:	8b 45 10             	mov    0x10(%ebp),%eax
     7f0:	89 44 24 08          	mov    %eax,0x8(%esp)
     7f4:	e8 e4 0f 00 00       	call   17dd <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     7f9:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     7fc:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     7ff:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     802:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     805:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     808:	83 e8 01             	sub    $0x1,%eax
     80b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     812:	00 
     813:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     817:	89 54 24 14          	mov    %edx,0x14(%esp)
     81b:	89 44 24 10          	mov    %eax,0x10(%esp)
     81f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     826:	00 
     827:	8b 45 08             	mov    0x8(%ebp),%eax
     82a:	89 04 24             	mov    %eax,(%esp)
     82d:	8b 45 0c             	mov    0xc(%ebp),%eax
     830:	89 44 24 04          	mov    %eax,0x4(%esp)
     834:	8b 45 10             	mov    0x10(%ebp),%eax
     837:	89 44 24 08          	mov    %eax,0x8(%esp)
     83b:	e8 12 17 00 00       	call   1f52 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printItemList();
	p = fileItemList;
     840:	a1 08 e0 00 00       	mov    0xe008,%eax
     845:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     848:	c7 05 0c e0 00 00 00 	movl   $0x0,0xe00c
     84f:	00 00 00 
	while (p != 0) {
     852:	eb 7a                	jmp    8ce <drawMusicContent+0x138>
		drawItem(context, p->name, p->st, p->pos, p->chosen);
     854:	8b 45 f4             	mov    -0xc(%ebp),%eax
     857:	8b 40 28             	mov    0x28(%eax),%eax
     85a:	8b 55 f4             	mov    -0xc(%ebp),%edx
     85d:	8b 52 14             	mov    0x14(%edx),%edx
     860:	89 44 24 34          	mov    %eax,0x34(%esp)
     864:	8b 45 f4             	mov    -0xc(%ebp),%eax
     867:	8b 48 18             	mov    0x18(%eax),%ecx
     86a:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     86e:	8b 48 1c             	mov    0x1c(%eax),%ecx
     871:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     875:	8b 48 20             	mov    0x20(%eax),%ecx
     878:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     87c:	8b 40 24             	mov    0x24(%eax),%eax
     87f:	89 44 24 30          	mov    %eax,0x30(%esp)
     883:	8b 45 f4             	mov    -0xc(%ebp),%eax
     886:	8b 08                	mov    (%eax),%ecx
     888:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     88c:	8b 48 04             	mov    0x4(%eax),%ecx
     88f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     893:	8b 48 08             	mov    0x8(%eax),%ecx
     896:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     89a:	8b 48 0c             	mov    0xc(%eax),%ecx
     89d:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     8a1:	8b 40 10             	mov    0x10(%eax),%eax
     8a4:	89 44 24 20          	mov    %eax,0x20(%esp)
     8a8:	89 54 24 0c          	mov    %edx,0xc(%esp)
     8ac:	8b 45 08             	mov    0x8(%ebp),%eax
     8af:	89 04 24             	mov    %eax,(%esp)
     8b2:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b9:	8b 45 10             	mov    0x10(%ebp),%eax
     8bc:	89 44 24 08          	mov    %eax,0x8(%esp)
     8c0:	e8 b6 f8 ff ff       	call   17b <drawItem>
		p = p->next;
     8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c8:	8b 40 2c             	mov    0x2c(%eax),%eax
     8cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
     8ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8d2:	75 80                	jne    854 <drawMusicContent+0xbe>
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
     8d4:	a1 e8 d9 00 00       	mov    0xd9e8,%eax
     8d9:	83 f8 02             	cmp    $0x2,%eax
     8dc:	0f 85 39 01 00 00    	jne    a1b <drawMusicContent+0x285>
	{
		fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     8e2:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     8e9:	00 
     8ea:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     8f1:	00 
     8f2:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     8f9:	00 
     8fa:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     901:	00 
     902:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     909:	00 
     90a:	8b 45 08             	mov    0x8(%ebp),%eax
     90d:	89 04 24             	mov    %eax,(%esp)
     910:	8b 45 0c             	mov    0xc(%ebp),%eax
     913:	89 44 24 04          	mov    %eax,0x4(%esp)
     917:	8b 45 10             	mov    0x10(%ebp),%eax
     91a:	89 44 24 08          	mov    %eax,0x8(%esp)
     91e:	e8 ba 0e 00 00       	call   17dd <fill_rect>
		fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     923:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     92a:	00 
     92b:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     932:	00 
     933:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     93a:	00 
     93b:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     942:	00 
     943:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     94a:	00 
     94b:	8b 45 08             	mov    0x8(%ebp),%eax
     94e:	89 04 24             	mov    %eax,(%esp)
     951:	8b 45 0c             	mov    0xc(%ebp),%eax
     954:	89 44 24 04          	mov    %eax,0x4(%esp)
     958:	8b 45 10             	mov    0x10(%ebp),%eax
     95b:	89 44 24 08          	mov    %eax,0x8(%esp)
     95f:	e8 79 0e 00 00       	call   17dd <fill_rect>
		fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     964:	8b 45 0c             	mov    0xc(%ebp),%eax
     967:	2d c9 00 00 00       	sub    $0xc9,%eax
     96c:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     973:	00 
     974:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     97b:	00 
     97c:	89 44 24 14          	mov    %eax,0x14(%esp)
     980:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     987:	00 
     988:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     98f:	00 
     990:	8b 45 08             	mov    0x8(%ebp),%eax
     993:	89 04 24             	mov    %eax,(%esp)
     996:	8b 45 0c             	mov    0xc(%ebp),%eax
     999:	89 44 24 04          	mov    %eax,0x4(%esp)
     99d:	8b 45 10             	mov    0x10(%ebp),%eax
     9a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     9a4:	e8 34 0e 00 00       	call   17dd <fill_rect>
		puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     9a9:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     9b0:	00 
     9b1:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     9b8:	00 
     9b9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     9c0:	00 
     9c1:	c7 44 24 0c ad 9d 00 	movl   $0x9dad,0xc(%esp)
     9c8:	00 
     9c9:	8b 45 08             	mov    0x8(%ebp),%eax
     9cc:	89 04 24             	mov    %eax,(%esp)
     9cf:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d2:	89 44 24 04          	mov    %eax,0x4(%esp)
     9d6:	8b 45 10             	mov    0x10(%ebp),%eax
     9d9:	89 44 24 08          	mov    %eax,0x8(%esp)
     9dd:	e8 da 13 00 00       	call   1dbc <puts_str>
		puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     9e2:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     9e9:	00 
     9ea:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     9f1:	00 
     9f2:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     9f9:	00 
     9fa:	c7 44 24 0c b2 9d 00 	movl   $0x9db2,0xc(%esp)
     a01:	00 
     a02:	8b 45 08             	mov    0x8(%ebp),%eax
     a05:	89 04 24             	mov    %eax,(%esp)
     a08:	8b 45 0c             	mov    0xc(%ebp),%eax
     a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
     a0f:	8b 45 10             	mov    0x10(%ebp),%eax
     a12:	89 44 24 08          	mov    %eax,0x8(%esp)
     a16:	e8 a1 13 00 00       	call   1dbc <puts_str>
	}
}
     a1b:	c9                   	leave  
     a1c:	c3                   	ret    

00000a1d <int2str>:

char * int2str(int i)
{
     a1d:	55                   	push   %ebp
     a1e:	89 e5                	mov    %esp,%ebp
     a20:	53                   	push   %ebx
     a21:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     a24:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     a2b:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     a32:	e8 e2 2f 00 00       	call   3a19 <malloc>
     a37:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     a3a:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     a41:	e8 d3 2f 00 00       	call   3a19 <malloc>
     a46:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a4c:	8d 50 01             	lea    0x1(%eax),%edx
     a4f:	89 55 f0             	mov    %edx,-0x10(%ebp)
     a52:	89 c2                	mov    %eax,%edx
     a54:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a57:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     a5a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a5d:	ba 67 66 66 66       	mov    $0x66666667,%edx
     a62:	89 c8                	mov    %ecx,%eax
     a64:	f7 ea                	imul   %edx
     a66:	c1 fa 02             	sar    $0x2,%edx
     a69:	89 c8                	mov    %ecx,%eax
     a6b:	c1 f8 1f             	sar    $0x1f,%eax
     a6e:	29 c2                	sub    %eax,%edx
     a70:	89 d0                	mov    %edx,%eax
     a72:	c1 e0 02             	shl    $0x2,%eax
     a75:	01 d0                	add    %edx,%eax
     a77:	01 c0                	add    %eax,%eax
     a79:	29 c1                	sub    %eax,%ecx
     a7b:	89 ca                	mov    %ecx,%edx
     a7d:	89 d0                	mov    %edx,%eax
     a7f:	83 c0 30             	add    $0x30,%eax
     a82:	88 03                	mov    %al,(%ebx)
		i /= 10;
     a84:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a87:	ba 67 66 66 66       	mov    $0x66666667,%edx
     a8c:	89 c8                	mov    %ecx,%eax
     a8e:	f7 ea                	imul   %edx
     a90:	c1 fa 02             	sar    $0x2,%edx
     a93:	89 c8                	mov    %ecx,%eax
     a95:	c1 f8 1f             	sar    $0x1f,%eax
     a98:	29 c2                	sub    %eax,%edx
     a9a:	89 d0                	mov    %edx,%eax
     a9c:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     a9f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     aa3:	75 a4                	jne    a49 <int2str+0x2c>
	result[n] = 0;
     aa5:	8b 55 f0             	mov    -0x10(%ebp),%edx
     aa8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     aab:	01 d0                	add    %edx,%eax
     aad:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     ab0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ab7:	eb 21                	jmp    ada <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
     ab9:	8b 55 f4             	mov    -0xc(%ebp),%edx
     abc:	8b 45 e8             	mov    -0x18(%ebp),%eax
     abf:	01 c2                	add    %eax,%edx
     ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ac4:	83 e8 01             	sub    $0x1,%eax
     ac7:	2b 45 f4             	sub    -0xc(%ebp),%eax
     aca:	89 c1                	mov    %eax,%ecx
     acc:	8b 45 ec             	mov    -0x14(%ebp),%eax
     acf:	01 c8                	add    %ecx,%eax
     ad1:	0f b6 00             	movzbl (%eax),%eax
     ad4:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     ad6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
     add:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     ae0:	7c d7                	jl     ab9 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     ae2:	8b 55 f0             	mov    -0x10(%ebp),%edx
     ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ae8:	01 d0                	add    %edx,%eax
     aea:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     aed:	8b 45 ec             	mov    -0x14(%ebp),%eax
     af0:	89 04 24             	mov    %eax,(%esp)
     af3:	e8 e8 2d 00 00       	call   38e0 <free>
	return temp;
     af8:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     afb:	83 c4 24             	add    $0x24,%esp
     afe:	5b                   	pop    %ebx
     aff:	5d                   	pop    %ebp
     b00:	c3                   	ret    

00000b01 <getPos>:

Rect getPos(Context context, int n) {
     b01:	55                   	push   %ebp
     b02:	89 e5                	mov    %esp,%ebp
     b04:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
     b07:	a1 e8 d9 00 00       	mov    0xd9e8,%eax
     b0c:	83 f8 01             	cmp    $0x1,%eax
     b0f:	75 78                	jne    b89 <getPos+0x88>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     b11:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b14:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     b19:	89 c8                	mov    %ecx,%eax
     b1b:	f7 ea                	imul   %edx
     b1d:	c1 fa 06             	sar    $0x6,%edx
     b20:	89 c8                	mov    %ecx,%eax
     b22:	c1 f8 1f             	sar    $0x1f,%eax
     b25:	29 c2                	sub    %eax,%edx
     b27:	89 d0                	mov    %edx,%eax
     b29:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     b2c:	8b 45 18             	mov    0x18(%ebp),%eax
     b2f:	99                   	cltd   
     b30:	f7 7d f4             	idivl  -0xc(%ebp)
     b33:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     b36:	8b 45 18             	mov    0x18(%ebp),%eax
     b39:	99                   	cltd   
     b3a:	f7 7d f4             	idivl  -0xc(%ebp)
     b3d:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     b40:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b43:	6b c0 73             	imul   $0x73,%eax,%eax
     b46:	83 c0 5a             	add    $0x5a,%eax
     b49:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     b4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b4f:	01 c0                	add    %eax,%eax
     b51:	89 c2                	mov    %eax,%edx
     b53:	c1 e2 06             	shl    $0x6,%edx
     b56:	01 d0                	add    %edx,%eax
     b58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top, ICON_ITEM_WIDTH,
     b5b:	8b 45 08             	mov    0x8(%ebp),%eax
     b5e:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
     b65:	00 
     b66:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
     b6d:	00 
     b6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
     b71:	89 54 24 08          	mov    %edx,0x8(%esp)
     b75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     b78:	89 54 24 04          	mov    %edx,0x4(%esp)
     b7c:	89 04 24             	mov    %eax,(%esp)
     b7f:	e8 a3 20 00 00       	call   2c27 <initRect>
     b84:	83 ec 04             	sub    $0x4,%esp
     b87:	eb 59                	jmp    be2 <getPos+0xe1>
				ICON_ITEM_HEIGHT);
	} else {
		printf(1, "width: %d height: %d\n", context.width, LIST_ITEM_HEIGHT);
     b89:	8b 45 10             	mov    0x10(%ebp),%eax
     b8c:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
     b93:	00 
     b94:	89 44 24 08          	mov    %eax,0x8(%esp)
     b98:	c7 44 24 04 b7 9d 00 	movl   $0x9db7,0x4(%esp)
     b9f:	00 
     ba0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ba7:	e8 81 2b 00 00       	call   372d <printf>
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP), context.width,
     bac:	8b 4d 10             	mov    0x10(%ebp),%ecx
     baf:	8b 55 18             	mov    0x18(%ebp),%edx
     bb2:	89 d0                	mov    %edx,%eax
     bb4:	c1 e0 05             	shl    $0x5,%eax
     bb7:	29 d0                	sub    %edx,%eax
     bb9:	8d 50 62             	lea    0x62(%eax),%edx
     bbc:	8b 45 08             	mov    0x8(%ebp),%eax
     bbf:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
     bc6:	00 
     bc7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     bcb:	89 54 24 08          	mov    %edx,0x8(%esp)
     bcf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     bd6:	00 
     bd7:	89 04 24             	mov    %eax,(%esp)
     bda:	e8 48 20 00 00       	call   2c27 <initRect>
     bdf:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
     be2:	8b 45 08             	mov    0x8(%ebp),%eax
     be5:	c9                   	leave  
     be6:	c2 04 00             	ret    $0x4

00000be9 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     be9:	55                   	push   %ebp
     bea:	89 e5                	mov    %esp,%ebp
     bec:	83 ec 28             	sub    $0x28,%esp
	switch (item.st.type) {
     bef:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     bf3:	98                   	cwtl   
     bf4:	83 f8 01             	cmp    $0x1,%eax
     bf7:	74 7c                	je     c75 <addItemEvent+0x8c>
     bf9:	83 f8 02             	cmp    $0x2,%eax
     bfc:	0f 85 e3 00 00 00    	jne    ce5 <addItemEvent+0xfc>
	case T_FILE:
	  createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c02:	c7 44 24 18 58 0e 00 	movl   $0xe58,0x18(%esp)
     c09:	00 
     c0a:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     c11:	00 
     c12:	8b 45 24             	mov    0x24(%ebp),%eax
     c15:	89 44 24 04          	mov    %eax,0x4(%esp)
     c19:	8b 45 28             	mov    0x28(%ebp),%eax
     c1c:	89 44 24 08          	mov    %eax,0x8(%esp)
     c20:	8b 45 2c             	mov    0x2c(%ebp),%eax
     c23:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c27:	8b 45 30             	mov    0x30(%ebp),%eax
     c2a:	89 44 24 10          	mov    %eax,0x10(%esp)
     c2e:	8b 45 08             	mov    0x8(%ebp),%eax
     c31:	89 04 24             	mov    %eax,(%esp)
     c34:	e8 da 20 00 00       	call   2d13 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_playMusic);
     c39:	c7 44 24 18 09 0f 00 	movl   $0xf09,0x18(%esp)
     c40:	00 
     c41:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
     c48:	00 
     c49:	8b 45 24             	mov    0x24(%ebp),%eax
     c4c:	89 44 24 04          	mov    %eax,0x4(%esp)
     c50:	8b 45 28             	mov    0x28(%ebp),%eax
     c53:	89 44 24 08          	mov    %eax,0x8(%esp)
     c57:	8b 45 2c             	mov    0x2c(%ebp),%eax
     c5a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c5e:	8b 45 30             	mov    0x30(%ebp),%eax
     c61:	89 44 24 10          	mov    %eax,0x10(%esp)
     c65:	8b 45 08             	mov    0x8(%ebp),%eax
     c68:	89 04 24             	mov    %eax,(%esp)
     c6b:	e8 a3 20 00 00       	call   2d13 <createClickable>
		break;
     c70:	e9 84 00 00 00       	jmp    cf9 <addItemEvent+0x110>
	case T_DIR:
	  createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     c75:	c7 44 24 18 58 0e 00 	movl   $0xe58,0x18(%esp)
     c7c:	00 
     c7d:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     c84:	00 
     c85:	8b 45 24             	mov    0x24(%ebp),%eax
     c88:	89 44 24 04          	mov    %eax,0x4(%esp)
     c8c:	8b 45 28             	mov    0x28(%ebp),%eax
     c8f:	89 44 24 08          	mov    %eax,0x8(%esp)
     c93:	8b 45 2c             	mov    0x2c(%ebp),%eax
     c96:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c9a:	8b 45 30             	mov    0x30(%ebp),%eax
     c9d:	89 44 24 10          	mov    %eax,0x10(%esp)
     ca1:	8b 45 08             	mov    0x8(%ebp),%eax
     ca4:	89 04 24             	mov    %eax,(%esp)
     ca7:	e8 67 20 00 00       	call   2d13 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_playMusic);
     cac:	c7 44 24 18 09 0f 00 	movl   $0xf09,0x18(%esp)
     cb3:	00 
     cb4:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
     cbb:	00 
     cbc:	8b 45 24             	mov    0x24(%ebp),%eax
     cbf:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc3:	8b 45 28             	mov    0x28(%ebp),%eax
     cc6:	89 44 24 08          	mov    %eax,0x8(%esp)
     cca:	8b 45 2c             	mov    0x2c(%ebp),%eax
     ccd:	89 44 24 0c          	mov    %eax,0xc(%esp)
     cd1:	8b 45 30             	mov    0x30(%ebp),%eax
     cd4:	89 44 24 10          	mov    %eax,0x10(%esp)
     cd8:	8b 45 08             	mov    0x8(%ebp),%eax
     cdb:	89 04 24             	mov    %eax,(%esp)
     cde:	e8 30 20 00 00       	call   2d13 <createClickable>
		break;
     ce3:	eb 14                	jmp    cf9 <addItemEvent+0x110>
	default:
		printf(0, "unknown file type!");
     ce5:	c7 44 24 04 cd 9d 00 	movl   $0x9dcd,0x4(%esp)
     cec:	00 
     ced:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     cf4:	e8 34 2a 00 00       	call   372d <printf>
	}
}
     cf9:	c9                   	leave  
     cfa:	c3                   	ret    

00000cfb <addListEvent>:

void addListEvent(ClickableManager *cm) {
     cfb:	55                   	push   %ebp
     cfc:	89 e5                	mov    %esp,%ebp
     cfe:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     d01:	a1 08 e0 00 00       	mov    0xe008,%eax
     d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     d09:	eb 70                	jmp    d7b <addListEvent+0x80>
		temp = p;
     d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     d11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d14:	8b 40 2c             	mov    0x2c(%eax),%eax
     d17:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
     d1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d1d:	8b 10                	mov    (%eax),%edx
     d1f:	89 54 24 04          	mov    %edx,0x4(%esp)
     d23:	8b 50 04             	mov    0x4(%eax),%edx
     d26:	89 54 24 08          	mov    %edx,0x8(%esp)
     d2a:	8b 50 08             	mov    0x8(%eax),%edx
     d2d:	89 54 24 0c          	mov    %edx,0xc(%esp)
     d31:	8b 50 0c             	mov    0xc(%eax),%edx
     d34:	89 54 24 10          	mov    %edx,0x10(%esp)
     d38:	8b 50 10             	mov    0x10(%eax),%edx
     d3b:	89 54 24 14          	mov    %edx,0x14(%esp)
     d3f:	8b 50 14             	mov    0x14(%eax),%edx
     d42:	89 54 24 18          	mov    %edx,0x18(%esp)
     d46:	8b 50 18             	mov    0x18(%eax),%edx
     d49:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     d4d:	8b 50 1c             	mov    0x1c(%eax),%edx
     d50:	89 54 24 20          	mov    %edx,0x20(%esp)
     d54:	8b 50 20             	mov    0x20(%eax),%edx
     d57:	89 54 24 24          	mov    %edx,0x24(%esp)
     d5b:	8b 50 24             	mov    0x24(%eax),%edx
     d5e:	89 54 24 28          	mov    %edx,0x28(%esp)
     d62:	8b 50 28             	mov    0x28(%eax),%edx
     d65:	89 54 24 2c          	mov    %edx,0x2c(%esp)
     d69:	8b 40 2c             	mov    0x2c(%eax),%eax
     d6c:	89 44 24 30          	mov    %eax,0x30(%esp)
     d70:	8b 45 08             	mov    0x8(%ebp),%eax
     d73:	89 04 24             	mov    %eax,(%esp)
     d76:	e8 6e fe ff ff       	call   be9 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     d7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     d7f:	75 8a                	jne    d0b <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
     d81:	c9                   	leave  
     d82:	c3                   	ret    

00000d83 <addWndEvent>:

//Handler
Handler wndEvents[] = { h_closeWnd, h_pauseMusic };

void addWndEvent(ClickableManager *cm) {
     d83:	55                   	push   %ebp
     d84:	89 e5                	mov    %esp,%ebp
     d86:	57                   	push   %edi
     d87:	56                   	push   %esi
     d88:	53                   	push   %ebx
     d89:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
     d8c:	c7 45 e0 02 00 00 00 	movl   $0x2,-0x20(%ebp)
	for (i = 0; i < n; i++) {
     d93:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     d9a:	e9 96 00 00 00       	jmp    e35 <addWndEvent+0xb2>
		createClickable(cm,
     d9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     da2:	8b 1c 85 e8 da 00 00 	mov    0xdae8(,%eax,4),%ebx
     da9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dac:	6b c0 34             	imul   $0x34,%eax,%eax
     daf:	05 a0 da 00 00       	add    $0xdaa0,%eax
     db4:	8b 78 10             	mov    0x10(%eax),%edi
     db7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dba:	6b c0 34             	imul   $0x34,%eax,%eax
     dbd:	05 a0 da 00 00       	add    $0xdaa0,%eax
     dc2:	8b 70 0c             	mov    0xc(%eax),%esi
     dc5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dc8:	6b c0 34             	imul   $0x34,%eax,%eax
     dcb:	05 a0 da 00 00       	add    $0xdaa0,%eax
     dd0:	8b 48 04             	mov    0x4(%eax),%ecx
     dd3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dd6:	6b c0 34             	imul   $0x34,%eax,%eax
     dd9:	05 a0 da 00 00       	add    $0xdaa0,%eax
     dde:	8b 10                	mov    (%eax),%edx
     de0:	8d 45 d0             	lea    -0x30(%ebp),%eax
     de3:	89 7c 24 10          	mov    %edi,0x10(%esp)
     de7:	89 74 24 0c          	mov    %esi,0xc(%esp)
     deb:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     def:	89 54 24 04          	mov    %edx,0x4(%esp)
     df3:	89 04 24             	mov    %eax,(%esp)
     df6:	e8 2c 1e 00 00       	call   2c27 <initRect>
     dfb:	83 ec 04             	sub    $0x4,%esp
     dfe:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     e02:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     e09:	00 
     e0a:	8b 45 d0             	mov    -0x30(%ebp),%eax
     e0d:	89 44 24 04          	mov    %eax,0x4(%esp)
     e11:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     e14:	89 44 24 08          	mov    %eax,0x8(%esp)
     e18:	8b 45 d8             	mov    -0x28(%ebp),%eax
     e1b:	89 44 24 0c          	mov    %eax,0xc(%esp)
     e1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
     e22:	89 44 24 10          	mov    %eax,0x10(%esp)
     e26:	8b 45 08             	mov    0x8(%ebp),%eax
     e29:	89 04 24             	mov    %eax,(%esp)
     e2c:	e8 e2 1e 00 00       	call   2d13 <createClickable>
Handler wndEvents[] = { h_closeWnd, h_pauseMusic };

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
     e31:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     e35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     e38:	3b 45 e0             	cmp    -0x20(%ebp),%eax
     e3b:	0f 8c 5e ff ff ff    	jl     d9f <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
     e41:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e44:	5b                   	pop    %ebx
     e45:	5e                   	pop    %esi
     e46:	5f                   	pop    %edi
     e47:	5d                   	pop    %ebp
     e48:	c3                   	ret    

00000e49 <h_closeWnd>:

void h_closeWnd(Point p) {
     e49:	55                   	push   %ebp
     e4a:	89 e5                	mov    %esp,%ebp
	isRun = 0;
     e4c:	c7 05 e0 d9 00 00 00 	movl   $0x0,0xd9e0
     e53:	00 00 00 
}
     e56:	5d                   	pop    %ebp
     e57:	c3                   	ret    

00000e58 <h_chooseFile>:

void h_chooseFile(Point p) {
     e58:	55                   	push   %ebp
     e59:	89 e5                	mov    %esp,%ebp
     e5b:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *allfile = fileItemList;
     e5e:	a1 08 e0 00 00       	mov    0xe008,%eax
     e63:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (allfile != 0) {
     e66:	eb 1d                	jmp    e85 <h_chooseFile+0x2d>
	  if (allfile->chosen != 0) allfile->chosen = 0;
     e68:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6b:	8b 40 28             	mov    0x28(%eax),%eax
     e6e:	85 c0                	test   %eax,%eax
     e70:	74 0a                	je     e7c <h_chooseFile+0x24>
     e72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e75:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
		allfile = allfile->next;
     e7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e7f:	8b 40 2c             	mov    0x2c(%eax),%eax
     e82:	89 45 f4             	mov    %eax,-0xc(%ebp)
	isRun = 0;
}

void h_chooseFile(Point p) {
	struct fileItem *allfile = fileItemList;
	while (allfile != 0) {
     e85:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e89:	75 dd                	jne    e68 <h_chooseFile+0x10>
	  if (allfile->chosen != 0) allfile->chosen = 0;
		allfile = allfile->next;
	}

	struct fileItem *temp = getFileItem(p);
     e8b:	8b 45 08             	mov    0x8(%ebp),%eax
     e8e:	8b 55 0c             	mov    0xc(%ebp),%edx
     e91:	89 04 24             	mov    %eax,(%esp)
     e94:	89 54 24 04          	mov    %edx,0x4(%esp)
     e98:	e8 7e f2 ff ff       	call   11b <getFileItem>
     e9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (temp->chosen != 0)
     ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ea3:	8b 40 28             	mov    0x28(%eax),%eax
     ea6:	85 c0                	test   %eax,%eax
     ea8:	74 20                	je     eca <h_chooseFile+0x72>
	{
		printf(0, "chooseFile!\n");
     eaa:	c7 44 24 04 e0 9d 00 	movl   $0x9de0,0x4(%esp)
     eb1:	00 
     eb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     eb9:	e8 6f 28 00 00       	call   372d <printf>
		temp->chosen = 0;
     ebe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ec1:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
     ec8:	eb 1e                	jmp    ee8 <h_chooseFile+0x90>
	}
	else
	{
		printf(0, "unchooseFile!\n");
     eca:	c7 44 24 04 ed 9d 00 	movl   $0x9ded,0x4(%esp)
     ed1:	00 
     ed2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ed9:	e8 4f 28 00 00       	call   372d <printf>
		temp->chosen = 1;
     ede:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ee1:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawMusicContent(context);
     ee8:	a1 f4 0d 01 00       	mov    0x10df4,%eax
     eed:	89 04 24             	mov    %eax,(%esp)
     ef0:	a1 f8 0d 01 00       	mov    0x10df8,%eax
     ef5:	89 44 24 04          	mov    %eax,0x4(%esp)
     ef9:	a1 fc 0d 01 00       	mov    0x10dfc,%eax
     efe:	89 44 24 08          	mov    %eax,0x8(%esp)
     f02:	e8 8f f8 ff ff       	call   796 <drawMusicContent>
}
     f07:	c9                   	leave  
     f08:	c3                   	ret    

00000f09 <h_playMusic>:

void h_playMusic(Point p) {
     f09:	55                   	push   %ebp
     f0a:	89 e5                	mov    %esp,%ebp
     f0c:	53                   	push   %ebx
     f0d:	83 ec 34             	sub    $0x34,%esp
	int pid;
	struct fileItem *fi = getFileItem(p);
     f10:	8b 45 08             	mov    0x8(%ebp),%eax
     f13:	8b 55 0c             	mov    0xc(%ebp),%edx
     f16:	89 04 24             	mov    %eax,(%esp)
     f19:	89 54 24 04          	mov    %edx,0x4(%esp)
     f1d:	e8 f9 f1 ff ff       	call   11b <getFileItem>
     f22:	89 45 f4             	mov    %eax,-0xc(%ebp)
	char* argv1[] = { "play", fi->name };
     f25:	c7 45 e8 fc 9d 00 00 	movl   $0x9dfc,-0x18(%ebp)
     f2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f2f:	8b 40 14             	mov    0x14(%eax),%eax
     f32:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char* argv2[] = { "playmp3", fi->name};
     f35:	c7 45 e0 01 9e 00 00 	movl   $0x9e01,-0x20(%ebp)
     f3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f3f:	8b 40 14             	mov    0x14(%eax),%eax
     f42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    printf(0, "start playing music \n");
     f45:	c7 44 24 04 09 9e 00 	movl   $0x9e09,0x4(%esp)
     f4c:	00 
     f4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f54:	e8 d4 27 00 00       	call   372d <printf>
    pid = fork();
     f59:	e8 df 25 00 00       	call   353d <fork>
     f5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid > 0) playid = pid;
     f61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f65:	7e 08                	jle    f6f <h_playMusic+0x66>
     f67:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f6a:	a3 e4 d9 00 00       	mov    %eax,0xd9e4
    if (pid < 0)
     f6f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f73:	79 19                	jns    f8e <h_playMusic+0x85>
    {
        printf(1, "init playmusic: fork failed\n");
     f75:	c7 44 24 04 1f 9e 00 	movl   $0x9e1f,0x4(%esp)
     f7c:	00 
     f7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f84:	e8 a4 27 00 00       	call   372d <printf>
        exit();
     f89:	e8 b7 25 00 00       	call   3545 <exit>
    }
    if (pid == 0)
     f8e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f92:	0f 85 a1 00 00 00    	jne    1039 <h_playMusic+0x130>
    {
		if (fi->name[strlen(fi->name) - 1] == '3') {
     f98:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f9b:	8b 58 14             	mov    0x14(%eax),%ebx
     f9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fa1:	8b 40 14             	mov    0x14(%eax),%eax
     fa4:	89 04 24             	mov    %eax,(%esp)
     fa7:	e8 c5 23 00 00       	call   3371 <strlen>
     fac:	83 e8 01             	sub    $0x1,%eax
     faf:	01 d8                	add    %ebx,%eax
     fb1:	0f b6 00             	movzbl (%eax),%eax
     fb4:	3c 33                	cmp    $0x33,%al
     fb6:	75 35                	jne    fed <h_playMusic+0xe4>
			if (playid) {
     fb8:	a1 e4 d9 00 00       	mov    0xd9e4,%eax
     fbd:	85 c0                	test   %eax,%eax
     fbf:	74 17                	je     fd8 <h_playMusic+0xcf>
				kill(playid);
     fc1:	a1 e4 d9 00 00       	mov    0xd9e4,%eax
     fc6:	89 04 24             	mov    %eax,(%esp)
     fc9:	e8 a7 25 00 00       	call   3575 <kill>
				playid = -1;
     fce:	c7 05 e4 d9 00 00 ff 	movl   $0xffffffff,0xd9e4
     fd5:	ff ff ff 
			}
			exec("playmp3", argv2);
     fd8:	8d 45 e0             	lea    -0x20(%ebp),%eax
     fdb:	89 44 24 04          	mov    %eax,0x4(%esp)
     fdf:	c7 04 24 01 9e 00 00 	movl   $0x9e01,(%esp)
     fe6:	e8 92 25 00 00       	call   357d <exec>
     feb:	eb 33                	jmp    1020 <h_playMusic+0x117>
		} else {
			if (playid) {
     fed:	a1 e4 d9 00 00       	mov    0xd9e4,%eax
     ff2:	85 c0                	test   %eax,%eax
     ff4:	74 17                	je     100d <h_playMusic+0x104>
				kill(playid);
     ff6:	a1 e4 d9 00 00       	mov    0xd9e4,%eax
     ffb:	89 04 24             	mov    %eax,(%esp)
     ffe:	e8 72 25 00 00       	call   3575 <kill>
				playid = -1;
    1003:	c7 05 e4 d9 00 00 ff 	movl   $0xffffffff,0xd9e4
    100a:	ff ff ff 
			}
        	exec("play", argv1);
    100d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1010:	89 44 24 04          	mov    %eax,0x4(%esp)
    1014:	c7 04 24 fc 9d 00 00 	movl   $0x9dfc,(%esp)
    101b:	e8 5d 25 00 00       	call   357d <exec>
		}
		printf(1, "init playmusic: exec play failed\n");
    1020:	c7 44 24 04 3c 9e 00 	movl   $0x9e3c,0x4(%esp)
    1027:	00 
    1028:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    102f:	e8 f9 26 00 00       	call   372d <printf>
        exit();
    1034:	e8 0c 25 00 00       	call   3545 <exit>
    }
}
    1039:	83 c4 34             	add    $0x34,%esp
    103c:	5b                   	pop    %ebx
    103d:	5d                   	pop    %ebp
    103e:	c3                   	ret    

0000103f <h_pauseMusic>:

void h_pauseMusic(Point p) {
    103f:	55                   	push   %ebp
    1040:	89 e5                	mov    %esp,%ebp
    1042:	83 ec 18             	sub    $0x18,%esp
	if (isPaused) {
    1045:	a1 04 e0 00 00       	mov    0xe004,%eax
    104a:	85 c0                	test   %eax,%eax
    104c:	74 20                	je     106e <h_pauseMusic+0x2f>
		strcpy(wndRes[1].name, "pause.bmp");
    104e:	c7 44 24 04 5e 9e 00 	movl   $0x9e5e,0x4(%esp)
    1055:	00 
    1056:	c7 04 24 b4 da 00 00 	movl   $0xdab4,(%esp)
    105d:	e8 a0 22 00 00       	call   3302 <strcpy>
		isPaused = 0;
    1062:	c7 05 04 e0 00 00 00 	movl   $0x0,0xe004
    1069:	00 00 00 
    106c:	eb 3a                	jmp    10a8 <h_pauseMusic+0x69>
  } else {
		strcpy(wndRes[1].name, "play.bmp");
    106e:	c7 44 24 04 68 9e 00 	movl   $0x9e68,0x4(%esp)
    1075:	00 
    1076:	c7 04 24 b4 da 00 00 	movl   $0xdab4,(%esp)
    107d:	e8 80 22 00 00       	call   3302 <strcpy>
		printf(1, "%s\n", wndRes[1].name);
    1082:	c7 44 24 08 b4 da 00 	movl   $0xdab4,0x8(%esp)
    1089:	00 
    108a:	c7 44 24 04 71 9e 00 	movl   $0x9e71,0x4(%esp)
    1091:	00 
    1092:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1099:	e8 8f 26 00 00       	call   372d <printf>
		isPaused = 1;
    109e:	c7 05 04 e0 00 00 01 	movl   $0x1,0xe004
    10a5:	00 00 00 
	}
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    10a8:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    10af:	00 
    10b0:	c7 04 24 80 da 00 00 	movl   $0xda80,(%esp)
    10b7:	e8 2f 12 00 00       	call   22eb <load_iconlist>
	drawMusicWnd(context);
    10bc:	a1 f4 0d 01 00       	mov    0x10df4,%eax
    10c1:	89 04 24             	mov    %eax,(%esp)
    10c4:	a1 f8 0d 01 00       	mov    0x10df8,%eax
    10c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    10cd:	a1 fc 0d 01 00       	mov    0x10dfc,%eax
    10d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    10d6:	e8 b9 f4 ff ff       	call   594 <drawMusicWnd>
	drawMusicContent(context);
    10db:	a1 f4 0d 01 00       	mov    0x10df4,%eax
    10e0:	89 04 24             	mov    %eax,(%esp)
    10e3:	a1 f8 0d 01 00       	mov    0x10df8,%eax
    10e8:	89 44 24 04          	mov    %eax,0x4(%esp)
    10ec:	a1 fc 0d 01 00       	mov    0x10dfc,%eax
    10f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    10f5:	e8 9c f6 ff ff       	call   796 <drawMusicContent>
	updateWindow(winid, context.addr, 4);
    10fa:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    1100:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    1105:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    110c:	00 
    110d:	89 54 24 04          	mov    %edx,0x4(%esp)
    1111:	89 04 24             	mov    %eax,(%esp)
    1114:	e8 e4 24 00 00       	call   35fd <updateWindow>
	pause();
    1119:	e8 ff 24 00 00       	call   361d <pause>
}
    111e:	c9                   	leave  
    111f:	c3                   	ret    

00001120 <main>:

int
main(int argc, char *argv[])
{
    1120:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1124:	83 e4 f0             	and    $0xfffffff0,%esp
    1127:	ff 71 fc             	pushl  -0x4(%ecx)
    112a:	55                   	push   %ebp
    112b:	89 e5                	mov    %esp,%ebp
    112d:	57                   	push   %edi
    112e:	56                   	push   %esi
    112f:	53                   	push   %ebx
    1130:	51                   	push   %ecx
    1131:	81 ec b8 00 00 00    	sub    $0xb8,%esp
    1137:	89 cb                	mov    %ecx,%ebx
	struct Msg msg;

	Point p;
	int i;
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    1139:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    1140:	00 
    1141:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    1148:	00 
    1149:	c7 04 24 f4 0d 01 00 	movl   $0x10df4,(%esp)
    1150:	e8 9c 05 00 00       	call   16f1 <init_context>
    1155:	a3 f0 0d 01 00       	mov    %eax,0x10df0
	cm = initClickManager(context);
    115a:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
    1160:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    1166:	89 54 24 04          	mov    %edx,0x4(%esp)
    116a:	8b 15 f8 0d 01 00    	mov    0x10df8,%edx
    1170:	89 54 24 08          	mov    %edx,0x8(%esp)
    1174:	8b 15 fc 0d 01 00    	mov    0x10dfc,%edx
    117a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    117e:	89 04 24             	mov    %eax,(%esp)
    1181:	e8 3f 1b 00 00       	call   2cc5 <initClickManager>
    1186:	83 ec 04             	sub    $0x4,%esp
    1189:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
    118f:	a3 00 0e 01 00       	mov    %eax,0x10e00
    1194:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
    119a:	a3 04 0e 01 00       	mov    %eax,0x10e04
    119f:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    11a5:	a3 08 0e 01 00       	mov    %eax,0x10e08
    11aa:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
    11b0:	a3 0c 0e 01 00       	mov    %eax,0x10e0c
    11b5:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    11bb:	a3 10 0e 01 00       	mov    %eax,0x10e10
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    11c0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    11c7:	00 
    11c8:	c7 04 24 80 da 00 00 	movl   $0xda80,(%esp)
    11cf:	e8 17 11 00 00       	call   22eb <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    11d4:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    11db:	00 
    11dc:	c7 04 24 00 da 00 00 	movl   $0xda00,(%esp)
    11e3:	e8 03 11 00 00       	call   22eb <load_iconlist>
	freeFileItemList();
    11e8:	e8 aa ee ff ff       	call   97 <freeFileItemList>
	songs_len = argc;
    11ed:	8b 03                	mov    (%ebx),%eax
    11ef:	a3 00 e0 00 00       	mov    %eax,0xe000
  	songs = (char**)malloc(sizeof(char*) * argc);
    11f4:	8b 03                	mov    (%ebx),%eax
    11f6:	c1 e0 02             	shl    $0x2,%eax
    11f9:	89 04 24             	mov    %eax,(%esp)
    11fc:	e8 18 28 00 00       	call   3a19 <malloc>
    1201:	a3 14 0e 01 00       	mov    %eax,0x10e14
	for (i = 0; i < argc; i++)
    1206:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    120d:	eb 61                	jmp    1270 <main+0x150>
	{
		songs[i] = (char *)malloc(sizeof(char) * strlen(argv[i]));
    120f:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1214:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1217:	c1 e2 02             	shl    $0x2,%edx
    121a:	8d 34 10             	lea    (%eax,%edx,1),%esi
    121d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1220:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1227:	8b 43 04             	mov    0x4(%ebx),%eax
    122a:	01 d0                	add    %edx,%eax
    122c:	8b 00                	mov    (%eax),%eax
    122e:	89 04 24             	mov    %eax,(%esp)
    1231:	e8 3b 21 00 00       	call   3371 <strlen>
    1236:	89 04 24             	mov    %eax,(%esp)
    1239:	e8 db 27 00 00       	call   3a19 <malloc>
    123e:	89 06                	mov    %eax,(%esi)
		strcpy(songs[i], argv[i]);
    1240:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1243:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    124a:	8b 43 04             	mov    0x4(%ebx),%eax
    124d:	01 d0                	add    %edx,%eax
    124f:	8b 10                	mov    (%eax),%edx
    1251:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1256:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    1259:	c1 e1 02             	shl    $0x2,%ecx
    125c:	01 c8                	add    %ecx,%eax
    125e:	8b 00                	mov    (%eax),%eax
    1260:	89 54 24 04          	mov    %edx,0x4(%esp)
    1264:	89 04 24             	mov    %eax,(%esp)
    1267:	e8 96 20 00 00       	call   3302 <strcpy>
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
	freeFileItemList();
	songs_len = argc;
  	songs = (char**)malloc(sizeof(char*) * argc);
	for (i = 0; i < argc; i++)
    126c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1270:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1273:	3b 03                	cmp    (%ebx),%eax
    1275:	7c 98                	jl     120f <main+0xef>
	{
		songs[i] = (char *)malloc(sizeof(char) * strlen(argv[i]));
		strcpy(songs[i], argv[i]);
	}
	itemCounter = 0;
    1277:	c7 05 0c e0 00 00 00 	movl   $0x0,0xe00c
    127e:	00 00 00 
	for (i = 1; i < argc; i++)
    1281:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    1288:	e9 bb 01 00 00       	jmp    1448 <main+0x328>
	{
		struct stat st;
		int fd = open(songs[i], 0);
    128d:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1292:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1295:	c1 e2 02             	shl    $0x2,%edx
    1298:	01 d0                	add    %edx,%eax
    129a:	8b 00                	mov    (%eax),%eax
    129c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12a3:	00 
    12a4:	89 04 24             	mov    %eax,(%esp)
    12a7:	e8 d9 22 00 00       	call   3585 <open>
    12ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
		if (fd < 0) {
    12af:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    12b3:	79 2c                	jns    12e1 <main+0x1c1>
			printf(2, "ls: cannot open %s\n", songs[i]);
    12b5:	a1 14 0e 01 00       	mov    0x10e14,%eax
    12ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    12bd:	c1 e2 02             	shl    $0x2,%edx
    12c0:	01 d0                	add    %edx,%eax
    12c2:	8b 00                	mov    (%eax),%eax
    12c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    12c8:	c7 44 24 04 75 9e 00 	movl   $0x9e75,0x4(%esp)
    12cf:	00 
    12d0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    12d7:	e8 51 24 00 00       	call   372d <printf>
			continue;
    12dc:	e9 63 01 00 00       	jmp    1444 <main+0x324>
		}
		if (fstat(fd, &st) < 0) {
    12e1:	8d 45 88             	lea    -0x78(%ebp),%eax
    12e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
    12eb:	89 04 24             	mov    %eax,(%esp)
    12ee:	e8 aa 22 00 00       	call   359d <fstat>
    12f3:	85 c0                	test   %eax,%eax
    12f5:	79 37                	jns    132e <main+0x20e>
			printf(2, "ls: cannot stat %s\n", songs[i]);
    12f7:	a1 14 0e 01 00       	mov    0x10e14,%eax
    12fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    12ff:	c1 e2 02             	shl    $0x2,%edx
    1302:	01 d0                	add    %edx,%eax
    1304:	8b 00                	mov    (%eax),%eax
    1306:	89 44 24 08          	mov    %eax,0x8(%esp)
    130a:	c7 44 24 04 89 9e 00 	movl   $0x9e89,0x4(%esp)
    1311:	00 
    1312:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1319:	e8 0f 24 00 00       	call   372d <printf>
			close(fd);
    131e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1321:	89 04 24             	mov    %eax,(%esp)
    1324:	e8 44 22 00 00       	call   356d <close>
			continue;
    1329:	e9 16 01 00 00       	jmp    1444 <main+0x324>
		}
		if (stat(songs[i], &st) < 0) {
    132e:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1333:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1336:	c1 e2 02             	shl    $0x2,%edx
    1339:	01 d0                	add    %edx,%eax
    133b:	8b 00                	mov    (%eax),%eax
    133d:	8d 55 88             	lea    -0x78(%ebp),%edx
    1340:	89 54 24 04          	mov    %edx,0x4(%esp)
    1344:	89 04 24             	mov    %eax,(%esp)
    1347:	e8 19 21 00 00       	call   3465 <stat>
    134c:	85 c0                	test   %eax,%eax
    134e:	79 2c                	jns    137c <main+0x25c>
			printf(1, "ls: cannot stat %s\n", songs[i]);
    1350:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1355:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1358:	c1 e2 02             	shl    $0x2,%edx
    135b:	01 d0                	add    %edx,%eax
    135d:	8b 00                	mov    (%eax),%eax
    135f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1363:	c7 44 24 04 89 9e 00 	movl   $0x9e89,0x4(%esp)
    136a:	00 
    136b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1372:	e8 b6 23 00 00       	call   372d <printf>
			continue;
    1377:	e9 c8 00 00 00       	jmp    1444 <main+0x324>
		}
		addFileItem(st, fmtname(songs[i]), getPos(context, itemCounter));
    137c:	8b 15 0c e0 00 00    	mov    0xe00c,%edx
    1382:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1385:	89 54 24 10          	mov    %edx,0x10(%esp)
    1389:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    138f:	89 54 24 04          	mov    %edx,0x4(%esp)
    1393:	8b 15 f8 0d 01 00    	mov    0x10df8,%edx
    1399:	89 54 24 08          	mov    %edx,0x8(%esp)
    139d:	8b 15 fc 0d 01 00    	mov    0x10dfc,%edx
    13a3:	89 54 24 0c          	mov    %edx,0xc(%esp)
    13a7:	89 04 24             	mov    %eax,(%esp)
    13aa:	e8 52 f7 ff ff       	call   b01 <getPos>
    13af:	83 ec 04             	sub    $0x4,%esp
    13b2:	a1 14 0e 01 00       	mov    0x10e14,%eax
    13b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    13ba:	c1 e2 02             	shl    $0x2,%edx
    13bd:	01 d0                	add    %edx,%eax
    13bf:	8b 00                	mov    (%eax),%eax
    13c1:	89 04 24             	mov    %eax,(%esp)
    13c4:	e8 18 ed ff ff       	call   e1 <fmtname>
    13c9:	8b 55 c0             	mov    -0x40(%ebp),%edx
    13cc:	89 54 24 18          	mov    %edx,0x18(%esp)
    13d0:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    13d3:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    13d7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    13da:	89 54 24 20          	mov    %edx,0x20(%esp)
    13de:	8b 55 cc             	mov    -0x34(%ebp),%edx
    13e1:	89 54 24 24          	mov    %edx,0x24(%esp)
    13e5:	89 44 24 14          	mov    %eax,0x14(%esp)
    13e9:	8b 45 88             	mov    -0x78(%ebp),%eax
    13ec:	89 04 24             	mov    %eax,(%esp)
    13ef:	8b 45 8c             	mov    -0x74(%ebp),%eax
    13f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    13f6:	8b 45 90             	mov    -0x70(%ebp),%eax
    13f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    13fd:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1400:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1404:	8b 45 98             	mov    -0x68(%ebp),%eax
    1407:	89 44 24 10          	mov    %eax,0x10(%esp)
    140b:	e8 f0 eb ff ff       	call   0 <addFileItem>
		itemCounter++;
    1410:	a1 0c e0 00 00       	mov    0xe00c,%eax
    1415:	83 c0 01             	add    $0x1,%eax
    1418:	a3 0c e0 00 00       	mov    %eax,0xe00c
		printf(1, "%s\n", songs[i]);
    141d:	a1 14 0e 01 00       	mov    0x10e14,%eax
    1422:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1425:	c1 e2 02             	shl    $0x2,%edx
    1428:	01 d0                	add    %edx,%eax
    142a:	8b 00                	mov    (%eax),%eax
    142c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1430:	c7 44 24 04 71 9e 00 	movl   $0x9e71,0x4(%esp)
    1437:	00 
    1438:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    143f:	e8 e9 22 00 00       	call   372d <printf>
	{
		songs[i] = (char *)malloc(sizeof(char) * strlen(argv[i]));
		strcpy(songs[i], argv[i]);
	}
	itemCounter = 0;
	for (i = 1; i < argc; i++)
    1444:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1448:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    144b:	3b 03                	cmp    (%ebx),%eax
    144d:	0f 8c 3a fe ff ff    	jl     128d <main+0x16d>
		}
		addFileItem(st, fmtname(songs[i]), getPos(context, itemCounter));
		itemCounter++;
		printf(1, "%s\n", songs[i]);
	}
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1453:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1456:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    145d:	00 
    145e:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1465:	00 
    1466:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    146d:	00 
    146e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1475:	00 
    1476:	89 04 24             	mov    %eax,(%esp)
    1479:	e8 a9 17 00 00       	call   2c27 <initRect>
    147e:	83 ec 04             	sub    $0x4,%esp
    1481:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1484:	89 44 24 04          	mov    %eax,0x4(%esp)
    1488:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    148b:	89 44 24 08          	mov    %eax,0x8(%esp)
    148f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1492:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1496:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1499:	89 44 24 10          	mov    %eax,0x10(%esp)
    149d:	c7 04 24 00 0e 01 00 	movl   $0x10e00,(%esp)
    14a4:	e8 81 19 00 00       	call   2e2a <deleteClickable>
	addWndEvent(&cm);
    14a9:	c7 04 24 00 0e 01 00 	movl   $0x10e00,(%esp)
    14b0:	e8 ce f8 ff ff       	call   d83 <addWndEvent>
	addListEvent(&cm);
    14b5:	c7 04 24 00 0e 01 00 	movl   $0x10e00,(%esp)
    14bc:	e8 3a f8 ff ff       	call   cfb <addListEvent>
	while (isRun) {
    14c1:	e9 04 02 00 00       	jmp    16ca <main+0x5aa>
		getMsg(&msg);
    14c6:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    14c9:	89 04 24             	mov    %eax,(%esp)
    14cc:	e8 14 21 00 00       	call   35e5 <getMsg>
		switch (msg.msg_type) {
    14d1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    14d4:	83 f8 08             	cmp    $0x8,%eax
    14d7:	0f 87 ec 01 00 00    	ja     16c9 <main+0x5a9>
    14dd:	8b 04 85 a0 9e 00 00 	mov    0x9ea0(,%eax,4),%eax
    14e4:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    14e6:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    14e9:	8b 55 ac             	mov    -0x54(%ebp),%edx
    14ec:	8d 45 9c             	lea    -0x64(%ebp),%eax
    14ef:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    14f3:	89 54 24 04          	mov    %edx,0x4(%esp)
    14f7:	89 04 24             	mov    %eax,(%esp)
    14fa:	e8 01 17 00 00       	call   2c00 <initPoint>
    14ff:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1502:	8b 0d 04 0e 01 00    	mov    0x10e04,%ecx
    1508:	8b 45 9c             	mov    -0x64(%ebp),%eax
    150b:	8b 55 a0             	mov    -0x60(%ebp),%edx
    150e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1512:	89 54 24 08          	mov    %edx,0x8(%esp)
    1516:	89 0c 24             	mov    %ecx,(%esp)
    1519:	e8 ec 19 00 00       	call   2f0a <executeHandler>
    151e:	85 c0                	test   %eax,%eax
    1520:	74 23                	je     1545 <main+0x425>
				updateWindow(winid, context.addr, msg.msg_detail);
    1522:	8b 4d a8             	mov    -0x58(%ebp),%ecx
    1525:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    152b:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    1530:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1534:	89 54 24 04          	mov    %edx,0x4(%esp)
    1538:	89 04 24             	mov    %eax,(%esp)
    153b:	e8 bd 20 00 00       	call   35fd <updateWindow>
			}
			break;
    1540:	e9 85 01 00 00       	jmp    16ca <main+0x5aa>
    1545:	e9 80 01 00 00       	jmp    16ca <main+0x5aa>
		case MSG_UPDATE:
			drawMusicWnd(context);
    154a:	a1 f4 0d 01 00       	mov    0x10df4,%eax
    154f:	89 04 24             	mov    %eax,(%esp)
    1552:	a1 f8 0d 01 00       	mov    0x10df8,%eax
    1557:	89 44 24 04          	mov    %eax,0x4(%esp)
    155b:	a1 fc 0d 01 00       	mov    0x10dfc,%eax
    1560:	89 44 24 08          	mov    %eax,0x8(%esp)
    1564:	e8 2b f0 ff ff       	call   594 <drawMusicWnd>
			drawMusicContent(context);
    1569:	a1 f4 0d 01 00       	mov    0x10df4,%eax
    156e:	89 04 24             	mov    %eax,(%esp)
    1571:	a1 f8 0d 01 00       	mov    0x10df8,%eax
    1576:	89 44 24 04          	mov    %eax,0x4(%esp)
    157a:	a1 fc 0d 01 00       	mov    0x10dfc,%eax
    157f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1583:	e8 0e f2 ff ff       	call   796 <drawMusicContent>
			updateWindow(winid, context.addr, msg.msg_detail);
    1588:	8b 4d a8             	mov    -0x58(%ebp),%ecx
    158b:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    1591:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    1596:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    159a:	89 54 24 04          	mov    %edx,0x4(%esp)
    159e:	89 04 24             	mov    %eax,(%esp)
    15a1:	e8 57 20 00 00       	call   35fd <updateWindow>
			break;
    15a6:	e9 1f 01 00 00       	jmp    16ca <main+0x5aa>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    15ab:	8b 7d b8             	mov    -0x48(%ebp),%edi
    15ae:	8b 75 b4             	mov    -0x4c(%ebp),%esi
    15b1:	8b 5d b0             	mov    -0x50(%ebp),%ebx
    15b4:	8b 4d ac             	mov    -0x54(%ebp),%ecx
    15b7:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    15bd:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    15c2:	89 7c 24 14          	mov    %edi,0x14(%esp)
    15c6:	89 74 24 10          	mov    %esi,0x10(%esp)
    15ca:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    15ce:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    15d2:	89 54 24 04          	mov    %edx,0x4(%esp)
    15d6:	89 04 24             	mov    %eax,(%esp)
    15d9:	e8 27 20 00 00       	call   3605 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    15de:	e9 e7 00 00 00       	jmp    16ca <main+0x5aa>
		case MSG_LPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    15e3:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    15e6:	8b 55 ac             	mov    -0x54(%ebp),%edx
    15e9:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
    15ef:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    15f3:	89 54 24 04          	mov    %edx,0x4(%esp)
    15f7:	89 04 24             	mov    %eax,(%esp)
    15fa:	e8 01 16 00 00       	call   2c00 <initPoint>
    15ff:	83 ec 04             	sub    $0x4,%esp
    1602:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
    1608:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
    160e:	89 45 9c             	mov    %eax,-0x64(%ebp)
    1611:	89 55 a0             	mov    %edx,-0x60(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    1614:	8b 0d 00 0e 01 00    	mov    0x10e00,%ecx
    161a:	8b 45 9c             	mov    -0x64(%ebp),%eax
    161d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    1620:	89 44 24 04          	mov    %eax,0x4(%esp)
    1624:	89 54 24 08          	mov    %edx,0x8(%esp)
    1628:	89 0c 24             	mov    %ecx,(%esp)
    162b:	e8 da 18 00 00       	call   2f0a <executeHandler>
    1630:	85 c0                	test   %eax,%eax
    1632:	74 20                	je     1654 <main+0x534>
				updateWindow(winid, context.addr, msg.msg_detail);
    1634:	8b 4d a8             	mov    -0x58(%ebp),%ecx
    1637:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    163d:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    1642:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1646:	89 54 24 04          	mov    %edx,0x4(%esp)
    164a:	89 04 24             	mov    %eax,(%esp)
    164d:	e8 ab 1f 00 00       	call   35fd <updateWindow>
			}
			break;
    1652:	eb 76                	jmp    16ca <main+0x5aa>
    1654:	eb 74                	jmp    16ca <main+0x5aa>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1656:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    1659:	8b 55 ac             	mov    -0x54(%ebp),%edx
    165c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
    1662:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1666:	89 54 24 04          	mov    %edx,0x4(%esp)
    166a:	89 04 24             	mov    %eax,(%esp)
    166d:	e8 8e 15 00 00       	call   2c00 <initPoint>
    1672:	83 ec 04             	sub    $0x4,%esp
    1675:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
    167b:	8b 95 64 ff ff ff    	mov    -0x9c(%ebp),%edx
    1681:	89 45 9c             	mov    %eax,-0x64(%ebp)
    1684:	89 55 a0             	mov    %edx,-0x60(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    1687:	8b 0d 08 0e 01 00    	mov    0x10e08,%ecx
    168d:	8b 45 9c             	mov    -0x64(%ebp),%eax
    1690:	8b 55 a0             	mov    -0x60(%ebp),%edx
    1693:	89 44 24 04          	mov    %eax,0x4(%esp)
    1697:	89 54 24 08          	mov    %edx,0x8(%esp)
    169b:	89 0c 24             	mov    %ecx,(%esp)
    169e:	e8 67 18 00 00       	call   2f0a <executeHandler>
    16a3:	85 c0                	test   %eax,%eax
    16a5:	74 20                	je     16c7 <main+0x5a7>
				updateWindow(winid, context.addr, msg.msg_detail);
    16a7:	8b 4d a8             	mov    -0x58(%ebp),%ecx
    16aa:	8b 15 f4 0d 01 00    	mov    0x10df4,%edx
    16b0:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    16b5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    16b9:	89 54 24 04          	mov    %edx,0x4(%esp)
    16bd:	89 04 24             	mov    %eax,(%esp)
    16c0:	e8 38 1f 00 00       	call   35fd <updateWindow>
			}
			break;
    16c5:	eb 03                	jmp    16ca <main+0x5aa>
    16c7:	eb 01                	jmp    16ca <main+0x5aa>
		default:
			break;
    16c9:	90                   	nop
		printf(1, "%s\n", songs[i]);
	}
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    16ca:	a1 e0 d9 00 00       	mov    0xd9e0,%eax
    16cf:	85 c0                	test   %eax,%eax
    16d1:	0f 85 ef fd ff ff    	jne    14c6 <main+0x3a6>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    16d7:	a1 f0 0d 01 00       	mov    0x10df0,%eax
    16dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    16e0:	c7 04 24 f4 0d 01 00 	movl   $0x10df4,(%esp)
    16e7:	e8 88 00 00 00       	call   1774 <free_context>
	exit();
    16ec:	e8 54 1e 00 00       	call   3545 <exit>

000016f1 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    16f1:	55                   	push   %ebp
    16f2:	89 e5                	mov    %esp,%ebp
    16f4:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    16f7:	8b 45 08             	mov    0x8(%ebp),%eax
    16fa:	8b 55 0c             	mov    0xc(%ebp),%edx
    16fd:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    1700:	8b 45 08             	mov    0x8(%ebp),%eax
    1703:	8b 55 10             	mov    0x10(%ebp),%edx
    1706:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    1709:	8b 55 0c             	mov    0xc(%ebp),%edx
    170c:	8b 45 10             	mov    0x10(%ebp),%eax
    170f:	0f af c2             	imul   %edx,%eax
    1712:	01 c0                	add    %eax,%eax
    1714:	89 04 24             	mov    %eax,(%esp)
    1717:	e8 fd 22 00 00       	call   3a19 <malloc>
    171c:	8b 55 08             	mov    0x8(%ebp),%edx
    171f:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    1721:	8b 55 0c             	mov    0xc(%ebp),%edx
    1724:	8b 45 10             	mov    0x10(%ebp),%eax
    1727:	0f af c2             	imul   %edx,%eax
    172a:	8d 14 00             	lea    (%eax,%eax,1),%edx
    172d:	8b 45 08             	mov    0x8(%ebp),%eax
    1730:	8b 00                	mov    (%eax),%eax
    1732:	89 54 24 08          	mov    %edx,0x8(%esp)
    1736:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    173d:	00 
    173e:	89 04 24             	mov    %eax,(%esp)
    1741:	e8 52 1c 00 00       	call   3398 <memset>
    initializeASCII();
    1746:	e8 93 01 00 00       	call   18de <initializeASCII>
    initializeGBK();
    174b:	e8 17 03 00 00       	call   1a67 <initializeGBK>
    return createWindow(0, 0, width, height);
    1750:	8b 45 10             	mov    0x10(%ebp),%eax
    1753:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1757:	8b 45 0c             	mov    0xc(%ebp),%eax
    175a:	89 44 24 08          	mov    %eax,0x8(%esp)
    175e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1765:	00 
    1766:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    176d:	e8 7b 1e 00 00       	call   35ed <createWindow>
}
    1772:	c9                   	leave  
    1773:	c3                   	ret    

00001774 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    1774:	55                   	push   %ebp
    1775:	89 e5                	mov    %esp,%ebp
    1777:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    177a:	8b 45 08             	mov    0x8(%ebp),%eax
    177d:	8b 00                	mov    (%eax),%eax
    177f:	89 04 24             	mov    %eax,(%esp)
    1782:	e8 59 21 00 00       	call   38e0 <free>
    freeASCII();
    1787:	e8 c6 02 00 00       	call   1a52 <freeASCII>
    freeGBK();
    178c:	e8 7e 03 00 00       	call   1b0f <freeGBK>
    destroyWindow(winid);
    1791:	8b 45 0c             	mov    0xc(%ebp),%eax
    1794:	89 04 24             	mov    %eax,(%esp)
    1797:	e8 59 1e 00 00       	call   35f5 <destroyWindow>
}
    179c:	c9                   	leave  
    179d:	c3                   	ret    

0000179e <draw_point>:
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    179e:	55                   	push   %ebp
    179f:	89 e5                	mov    %esp,%ebp
    17a1:	83 ec 04             	sub    $0x4,%esp
    17a4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    17a7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width)
    17ab:	8b 45 0c             	mov    0xc(%ebp),%eax
    17ae:	3b 45 14             	cmp    0x14(%ebp),%eax
    17b1:	77 02                	ja     17b5 <draw_point+0x17>
    return;
    17b3:	eb 26                	jmp    17db <draw_point+0x3d>
  if(y >= c.height)
    17b5:	8b 45 10             	mov    0x10(%ebp),%eax
    17b8:	3b 45 18             	cmp    0x18(%ebp),%eax
    17bb:	77 02                	ja     17bf <draw_point+0x21>
    return;
    17bd:	eb 1c                	jmp    17db <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    17bf:	8b 55 08             	mov    0x8(%ebp),%edx
    17c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    17c5:	0f af 45 18          	imul   0x18(%ebp),%eax
    17c9:	89 c1                	mov    %eax,%ecx
    17cb:	8b 45 14             	mov    0x14(%ebp),%eax
    17ce:	01 c8                	add    %ecx,%eax
    17d0:	01 c0                	add    %eax,%eax
    17d2:	01 c2                	add    %eax,%edx
    17d4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    17d8:	66 89 02             	mov    %ax,(%edx)
}
    17db:	c9                   	leave  
    17dc:	c3                   	ret    

000017dd <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    17dd:	55                   	push   %ebp
    17de:	89 e5                	mov    %esp,%ebp
    17e0:	83 ec 2c             	sub    $0x2c,%esp
    17e3:	8b 45 24             	mov    0x24(%ebp),%eax
    17e6:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    17ea:	8b 45 1c             	mov    0x1c(%ebp),%eax
    17ed:	8b 55 14             	mov    0x14(%ebp),%edx
    17f0:	01 c2                	add    %eax,%edx
    17f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    17f5:	39 c2                	cmp    %eax,%edx
    17f7:	0f 46 c2             	cmovbe %edx,%eax
    17fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height;
    17fd:	8b 45 20             	mov    0x20(%ebp),%eax
    1800:	8b 55 18             	mov    0x18(%ebp),%edx
    1803:	01 c2                	add    %eax,%edx
    1805:	8b 45 10             	mov    0x10(%ebp),%eax
    1808:	39 c2                	cmp    %eax,%edx
    180a:	0f 46 c2             	cmovbe %edx,%eax
    180d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    1810:	8b 45 18             	mov    0x18(%ebp),%eax
    1813:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1816:	eb 47                	jmp    185f <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    1818:	8b 45 14             	mov    0x14(%ebp),%eax
    181b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    181e:	eb 33                	jmp    1853 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    1820:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    1824:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1827:	8b 45 fc             	mov    -0x4(%ebp),%eax
    182a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    182e:	89 54 24 10          	mov    %edx,0x10(%esp)
    1832:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1836:	8b 45 08             	mov    0x8(%ebp),%eax
    1839:	89 04 24             	mov    %eax,(%esp)
    183c:	8b 45 0c             	mov    0xc(%ebp),%eax
    183f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1843:	8b 45 10             	mov    0x10(%ebp),%eax
    1846:	89 44 24 08          	mov    %eax,0x8(%esp)
    184a:	e8 4f ff ff ff       	call   179e <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    184f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1853:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1856:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1859:	7c c5                	jl     1820 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
    185b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    185f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1862:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1865:	7c b1                	jl     1818 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    1867:	c9                   	leave  
    1868:	c3                   	ret    

00001869 <printBinary>:

void printBinary(char c)
{
    1869:	55                   	push   %ebp
    186a:	89 e5                	mov    %esp,%ebp
    186c:	83 ec 28             	sub    $0x28,%esp
    186f:	8b 45 08             	mov    0x8(%ebp),%eax
    1872:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    1875:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    187c:	eb 44                	jmp    18c2 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    187e:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    1882:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1885:	89 c1                	mov    %eax,%ecx
    1887:	d3 e2                	shl    %cl,%edx
    1889:	89 d0                	mov    %edx,%eax
    188b:	25 80 00 00 00       	and    $0x80,%eax
    1890:	85 c0                	test   %eax,%eax
    1892:	74 16                	je     18aa <printBinary+0x41>
		{
			printf(0, "1");
    1894:	c7 44 24 04 c4 9e 00 	movl   $0x9ec4,0x4(%esp)
    189b:	00 
    189c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18a3:	e8 85 1e 00 00       	call   372d <printf>
    18a8:	eb 14                	jmp    18be <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    18aa:	c7 44 24 04 c6 9e 00 	movl   $0x9ec6,0x4(%esp)
    18b1:	00 
    18b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18b9:	e8 6f 1e 00 00       	call   372d <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    18be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    18c2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    18c6:	7e b6                	jle    187e <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    18c8:	c7 44 24 04 c8 9e 00 	movl   $0x9ec8,0x4(%esp)
    18cf:	00 
    18d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18d7:	e8 51 1e 00 00       	call   372d <printf>
}
    18dc:	c9                   	leave  
    18dd:	c3                   	ret    

000018de <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    18de:	55                   	push   %ebp
    18df:	89 e5                	mov    %esp,%ebp
    18e1:	56                   	push   %esi
    18e2:	53                   	push   %ebx
    18e3:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    18e6:	c7 44 24 04 ca 9e 00 	movl   $0x9eca,0x4(%esp)
    18ed:	00 
    18ee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    18f5:	e8 33 1e 00 00       	call   372d <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    18fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1901:	00 
    1902:	c7 04 24 dd 9e 00 00 	movl   $0x9edd,(%esp)
    1909:	e8 77 1c 00 00       	call   3585 <open>
    190e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1911:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1915:	79 21                	jns    1938 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    1917:	c7 44 24 08 dd 9e 00 	movl   $0x9edd,0x8(%esp)
    191e:	00 
    191f:	c7 44 24 04 e9 9e 00 	movl   $0x9ee9,0x4(%esp)
    1926:	00 
    1927:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    192e:	e8 fa 1d 00 00       	call   372d <printf>
	  return;
    1933:	e9 13 01 00 00       	jmp    1a4b <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    1938:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    193f:	e8 d5 20 00 00       	call   3a19 <malloc>
    1944:	a3 20 0e 01 00       	mov    %eax,0x10e20
	for (i = 0; i < ASCII_NUM; i++)
    1949:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1950:	eb 12                	jmp    1964 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    1952:	8b 15 20 0e 01 00    	mov    0x10e20,%edx
    1958:	8b 45 f4             	mov    -0xc(%ebp),%eax
    195b:	01 d0                	add    %edx,%eax
    195d:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    1960:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1964:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    196b:	7e e5                	jle    1952 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    196d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    1974:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    197b:	e9 84 00 00 00       	jmp    1a04 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    1980:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1987:	eb 73                	jmp    19fc <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    1989:	8b 45 f4             	mov    -0xc(%ebp),%eax
    198c:	05 40 0e 01 00       	add    $0x10e40,%eax
    1991:	0f b6 00             	movzbl (%eax),%eax
    1994:	3c 2a                	cmp    $0x2a,%al
    1996:	74 0f                	je     19a7 <initializeASCII+0xc9>
    1998:	8b 45 f4             	mov    -0xc(%ebp),%eax
    199b:	05 40 0e 01 00       	add    $0x10e40,%eax
    19a0:	0f b6 00             	movzbl (%eax),%eax
    19a3:	3c 2e                	cmp    $0x2e,%al
    19a5:	75 51                	jne    19f8 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    19a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19aa:	05 40 0e 01 00       	add    $0x10e40,%eax
    19af:	0f b6 00             	movzbl (%eax),%eax
    19b2:	3c 2a                	cmp    $0x2a,%al
    19b4:	75 2d                	jne    19e3 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    19b6:	8b 15 20 0e 01 00    	mov    0x10e20,%edx
    19bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19bf:	01 c2                	add    %eax,%edx
    19c1:	8b 0d 20 0e 01 00    	mov    0x10e20,%ecx
    19c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    19ca:	01 c8                	add    %ecx,%eax
    19cc:	0f b6 00             	movzbl (%eax),%eax
    19cf:	89 c3                	mov    %eax,%ebx
    19d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    19d4:	be 80 00 00 00       	mov    $0x80,%esi
    19d9:	89 c1                	mov    %eax,%ecx
    19db:	d3 fe                	sar    %cl,%esi
    19dd:	89 f0                	mov    %esi,%eax
    19df:	09 d8                	or     %ebx,%eax
    19e1:	88 02                	mov    %al,(%edx)
				}
				x ++;
    19e3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    19e7:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    19eb:	7e 0b                	jle    19f8 <initializeASCII+0x11a>
				{
					x = 0;
    19ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    19f4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    19f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    19fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19ff:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    1a02:	7c 85                	jl     1989 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    1a04:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1a0b:	00 
    1a0c:	c7 44 24 04 40 0e 01 	movl   $0x10e40,0x4(%esp)
    1a13:	00 
    1a14:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a17:	89 04 24             	mov    %eax,(%esp)
    1a1a:	e8 3e 1b 00 00       	call   355d <read>
    1a1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    1a22:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1a26:	0f 8f 54 ff ff ff    	jg     1980 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    1a2c:	c7 44 24 04 f9 9e 00 	movl   $0x9ef9,0x4(%esp)
    1a33:	00 
    1a34:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a3b:	e8 ed 1c 00 00       	call   372d <printf>
	close(fd);
    1a40:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a43:	89 04 24             	mov    %eax,(%esp)
    1a46:	e8 22 1b 00 00       	call   356d <close>
}
    1a4b:	83 c4 30             	add    $0x30,%esp
    1a4e:	5b                   	pop    %ebx
    1a4f:	5e                   	pop    %esi
    1a50:	5d                   	pop    %ebp
    1a51:	c3                   	ret    

00001a52 <freeASCII>:

void freeASCII(){
    1a52:	55                   	push   %ebp
    1a53:	89 e5                	mov    %esp,%ebp
    1a55:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    1a58:	a1 20 0e 01 00       	mov    0x10e20,%eax
    1a5d:	89 04 24             	mov    %eax,(%esp)
    1a60:	e8 7b 1e 00 00       	call   38e0 <free>
}
    1a65:	c9                   	leave  
    1a66:	c3                   	ret    

00001a67 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    1a67:	55                   	push   %ebp
    1a68:	89 e5                	mov    %esp,%ebp
    1a6a:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    1a6d:	c7 44 24 04 16 9f 00 	movl   $0x9f16,0x4(%esp)
    1a74:	00 
    1a75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1a7c:	e8 ac 1c 00 00       	call   372d <printf>
	if((fd = open(HZK16, 0)) < 0){
    1a81:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a88:	00 
    1a89:	c7 04 24 27 9f 00 00 	movl   $0x9f27,(%esp)
    1a90:	e8 f0 1a 00 00       	call   3585 <open>
    1a95:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1a98:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1a9c:	79 1e                	jns    1abc <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    1a9e:	c7 44 24 08 27 9f 00 	movl   $0x9f27,0x8(%esp)
    1aa5:	00 
    1aa6:	c7 44 24 04 e9 9e 00 	movl   $0x9ee9,0x4(%esp)
    1aad:	00 
    1aae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ab5:	e8 73 1c 00 00       	call   372d <printf>
		return;
    1aba:	eb 51                	jmp    1b0d <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    1abc:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    1ac3:	e8 51 1f 00 00       	call   3a19 <malloc>
    1ac8:	a3 24 0e 01 00       	mov    %eax,0x10e24
	fontFile.size = read(fd, fontFile.buf, 27000);
    1acd:	a1 24 0e 01 00       	mov    0x10e24,%eax
    1ad2:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    1ad9:	00 
    1ada:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ae1:	89 04 24             	mov    %eax,(%esp)
    1ae4:	e8 74 1a 00 00       	call   355d <read>
    1ae9:	a3 28 0e 01 00       	mov    %eax,0x10e28
	printf(0,"initialzing gbk complete!\n");
    1aee:	c7 44 24 04 31 9f 00 	movl   $0x9f31,0x4(%esp)
    1af5:	00 
    1af6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1afd:	e8 2b 1c 00 00       	call   372d <printf>
	close(fd);
    1b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b05:	89 04 24             	mov    %eax,(%esp)
    1b08:	e8 60 1a 00 00       	call   356d <close>
}
    1b0d:	c9                   	leave  
    1b0e:	c3                   	ret    

00001b0f <freeGBK>:

void freeGBK(){
    1b0f:	55                   	push   %ebp
    1b10:	89 e5                	mov    %esp,%ebp
    1b12:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    1b15:	a1 24 0e 01 00       	mov    0x10e24,%eax
    1b1a:	89 04 24             	mov    %eax,(%esp)
    1b1d:	e8 be 1d 00 00       	call   38e0 <free>
}
    1b22:	c9                   	leave  
    1b23:	c3                   	ret    

00001b24 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    1b24:	55                   	push   %ebp
    1b25:	89 e5                	mov    %esp,%ebp
    1b27:	53                   	push   %ebx
    1b28:	83 ec 30             	sub    $0x30,%esp
    1b2b:	8b 55 14             	mov    0x14(%ebp),%edx
    1b2e:	8b 45 18             	mov    0x18(%ebp),%eax
    1b31:	88 55 e8             	mov    %dl,-0x18(%ebp)
    1b34:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    1b38:	8b 45 20             	mov    0x20(%ebp),%eax
    1b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1b3e:	eb 7f                	jmp    1bbf <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    1b40:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1b47:	eb 6c                	jmp    1bb5 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    1b49:	a1 20 0e 01 00       	mov    0x10e20,%eax
    1b4e:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    1b52:	c1 e2 04             	shl    $0x4,%edx
    1b55:	89 d1                	mov    %edx,%ecx
    1b57:	8b 55 20             	mov    0x20(%ebp),%edx
    1b5a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    1b5d:	29 d3                	sub    %edx,%ebx
    1b5f:	89 da                	mov    %ebx,%edx
    1b61:	01 ca                	add    %ecx,%edx
    1b63:	01 d0                	add    %edx,%eax
    1b65:	0f b6 00             	movzbl (%eax),%eax
    1b68:	0f b6 d0             	movzbl %al,%edx
    1b6b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1b6e:	89 c1                	mov    %eax,%ecx
    1b70:	d3 e2                	shl    %cl,%edx
    1b72:	89 d0                	mov    %edx,%eax
    1b74:	25 80 00 00 00       	and    $0x80,%eax
    1b79:	85 c0                	test   %eax,%eax
    1b7b:	74 34                	je     1bb1 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    1b7d:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    1b81:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1b84:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1b87:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    1b8a:	01 d8                	add    %ebx,%eax
    1b8c:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1b90:	89 54 24 10          	mov    %edx,0x10(%esp)
    1b94:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1b98:	8b 45 08             	mov    0x8(%ebp),%eax
    1b9b:	89 04 24             	mov    %eax,(%esp)
    1b9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ba1:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ba5:	8b 45 10             	mov    0x10(%ebp),%eax
    1ba8:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bac:	e8 ed fb ff ff       	call   179e <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    1bb1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1bb5:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    1bb9:	7e 8e                	jle    1b49 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    1bbb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1bbf:	8b 45 20             	mov    0x20(%ebp),%eax
    1bc2:	83 c0 10             	add    $0x10,%eax
    1bc5:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1bc8:	0f 8f 72 ff ff ff    	jg     1b40 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    1bce:	83 c4 30             	add    $0x30,%esp
    1bd1:	5b                   	pop    %ebx
    1bd2:	5d                   	pop    %ebp
    1bd3:	c3                   	ret    

00001bd4 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    1bd4:	55                   	push   %ebp
    1bd5:	89 e5                	mov    %esp,%ebp
    1bd7:	53                   	push   %ebx
    1bd8:	83 ec 34             	sub    $0x34,%esp
    1bdb:	8b 55 14             	mov    0x14(%ebp),%edx
    1bde:	8b 45 18             	mov    0x18(%ebp),%eax
    1be1:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    1be5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    1be9:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    1bed:	0f b6 c0             	movzbl %al,%eax
    1bf0:	3d a0 00 00 00       	cmp    $0xa0,%eax
    1bf5:	0f 8e 40 01 00 00    	jle    1d3b <put_gbk+0x167>
    1bfb:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    1bff:	66 c1 f8 08          	sar    $0x8,%ax
    1c03:	98                   	cwtl   
    1c04:	0f b6 c0             	movzbl %al,%eax
    1c07:	3d a0 00 00 00       	cmp    $0xa0,%eax
    1c0c:	0f 8e 29 01 00 00    	jle    1d3b <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    1c12:	a1 24 0e 01 00       	mov    0x10e24,%eax
    1c17:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    1c1a:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    1c1e:	0f b6 c0             	movzbl %al,%eax
    1c21:	2d a1 00 00 00       	sub    $0xa1,%eax
    1c26:	6b c0 5e             	imul   $0x5e,%eax,%eax
    1c29:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    1c2d:	66 c1 fa 08          	sar    $0x8,%dx
    1c31:	0f bf d2             	movswl %dx,%edx
    1c34:	0f b6 d2             	movzbl %dl,%edx
    1c37:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    1c3d:	01 d0                	add    %edx,%eax
    1c3f:	c1 e0 05             	shl    $0x5,%eax
    1c42:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    1c45:	8b 45 20             	mov    0x20(%ebp),%eax
    1c48:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1c4b:	e9 da 00 00 00       	jmp    1d2a <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1c50:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1c57:	eb 58                	jmp    1cb1 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    1c59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c5c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1c5f:	01 d0                	add    %edx,%eax
    1c61:	0f b6 00             	movzbl (%eax),%eax
    1c64:	0f b6 d0             	movzbl %al,%edx
    1c67:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1c6a:	89 c1                	mov    %eax,%ecx
    1c6c:	d3 e2                	shl    %cl,%edx
    1c6e:	89 d0                	mov    %edx,%eax
    1c70:	25 80 00 00 00       	and    $0x80,%eax
    1c75:	85 c0                	test   %eax,%eax
    1c77:	74 34                	je     1cad <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    1c79:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    1c7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1c80:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1c83:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    1c86:	01 d8                	add    %ebx,%eax
    1c88:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1c8c:	89 54 24 10          	mov    %edx,0x10(%esp)
    1c90:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c94:	8b 45 08             	mov    0x8(%ebp),%eax
    1c97:	89 04 24             	mov    %eax,(%esp)
    1c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1c9d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ca1:	8b 45 10             	mov    0x10(%ebp),%eax
    1ca4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ca8:	e8 f1 fa ff ff       	call   179e <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1cad:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1cb1:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    1cb5:	7e a2                	jle    1c59 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    1cb7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1cbb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1cc2:	eb 58                	jmp    1d1c <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    1cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1cc7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1cca:	01 d0                	add    %edx,%eax
    1ccc:	0f b6 00             	movzbl (%eax),%eax
    1ccf:	0f b6 d0             	movzbl %al,%edx
    1cd2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1cd5:	89 c1                	mov    %eax,%ecx
    1cd7:	d3 e2                	shl    %cl,%edx
    1cd9:	89 d0                	mov    %edx,%eax
    1cdb:	25 80 00 00 00       	and    $0x80,%eax
    1ce0:	85 c0                	test   %eax,%eax
    1ce2:	74 34                	je     1d18 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    1ce4:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    1ce8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1ceb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1cee:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    1cf1:	01 d8                	add    %ebx,%eax
    1cf3:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1cf7:	89 54 24 10          	mov    %edx,0x10(%esp)
    1cfb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1cff:	8b 45 08             	mov    0x8(%ebp),%eax
    1d02:	89 04 24             	mov    %eax,(%esp)
    1d05:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d08:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d0c:	8b 45 10             	mov    0x10(%ebp),%eax
    1d0f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d13:	e8 86 fa ff ff       	call   179e <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    1d18:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1d1c:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    1d20:	7e a2                	jle    1cc4 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    1d22:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    1d26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1d2a:	8b 45 20             	mov    0x20(%ebp),%eax
    1d2d:	83 c0 10             	add    $0x10,%eax
    1d30:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1d33:	0f 8f 17 ff ff ff    	jg     1c50 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    1d39:	eb 7b                	jmp    1db6 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    1d3b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    1d3f:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    1d43:	0f b6 c0             	movzbl %al,%eax
    1d46:	8b 4d 20             	mov    0x20(%ebp),%ecx
    1d49:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1d4d:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    1d50:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1d54:	89 54 24 10          	mov    %edx,0x10(%esp)
    1d58:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d5c:	8b 45 08             	mov    0x8(%ebp),%eax
    1d5f:	89 04 24             	mov    %eax,(%esp)
    1d62:	8b 45 0c             	mov    0xc(%ebp),%eax
    1d65:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d69:	8b 45 10             	mov    0x10(%ebp),%eax
    1d6c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d70:	e8 af fd ff ff       	call   1b24 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    1d75:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1d78:	8d 58 08             	lea    0x8(%eax),%ebx
    1d7b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    1d7f:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    1d83:	66 c1 f8 08          	sar    $0x8,%ax
    1d87:	0f b6 c0             	movzbl %al,%eax
    1d8a:	8b 4d 20             	mov    0x20(%ebp),%ecx
    1d8d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1d91:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    1d95:	89 54 24 10          	mov    %edx,0x10(%esp)
    1d99:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1d9d:	8b 45 08             	mov    0x8(%ebp),%eax
    1da0:	89 04 24             	mov    %eax,(%esp)
    1da3:	8b 45 0c             	mov    0xc(%ebp),%eax
    1da6:	89 44 24 04          	mov    %eax,0x4(%esp)
    1daa:	8b 45 10             	mov    0x10(%ebp),%eax
    1dad:	89 44 24 08          	mov    %eax,0x8(%esp)
    1db1:	e8 6e fd ff ff       	call   1b24 <put_ascii>
	}
}
    1db6:	83 c4 34             	add    $0x34,%esp
    1db9:	5b                   	pop    %ebx
    1dba:	5d                   	pop    %ebp
    1dbb:	c3                   	ret    

00001dbc <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    1dbc:	55                   	push   %ebp
    1dbd:	89 e5                	mov    %esp,%ebp
    1dbf:	83 ec 38             	sub    $0x38,%esp
    1dc2:	8b 45 18             	mov    0x18(%ebp),%eax
    1dc5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    1dc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    1dd0:	8b 45 14             	mov    0x14(%ebp),%eax
    1dd3:	89 04 24             	mov    %eax,(%esp)
    1dd6:	e8 96 15 00 00       	call   3371 <strlen>
    1ddb:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    1dde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1de5:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1de8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1deb:	eb 49                	jmp    1e36 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    1ded:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    1df1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1df4:	8b 45 14             	mov    0x14(%ebp),%eax
    1df7:	01 c8                	add    %ecx,%eax
    1df9:	0f b6 00             	movzbl (%eax),%eax
    1dfc:	0f b6 c0             	movzbl %al,%eax
    1dff:	8b 4d 20             	mov    0x20(%ebp),%ecx
    1e02:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1e06:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1e09:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1e0d:	89 54 24 10          	mov    %edx,0x10(%esp)
    1e11:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1e15:	8b 45 08             	mov    0x8(%ebp),%eax
    1e18:	89 04 24             	mov    %eax,(%esp)
    1e1b:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e1e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e22:	8b 45 10             	mov    0x10(%ebp),%eax
    1e25:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e29:	e8 f6 fc ff ff       	call   1b24 <put_ascii>
			xTmp += 8;
    1e2e:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    1e32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    1e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e39:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1e3c:	72 af                	jb     1ded <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    1e3e:	c9                   	leave  
    1e3f:	c3                   	ret    

00001e40 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    1e40:	55                   	push   %ebp
    1e41:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    1e43:	8b 45 10             	mov    0x10(%ebp),%eax
    1e46:	8d 50 07             	lea    0x7(%eax),%edx
    1e49:	85 c0                	test   %eax,%eax
    1e4b:	0f 48 c2             	cmovs  %edx,%eax
    1e4e:	c1 f8 03             	sar    $0x3,%eax
    1e51:	89 c2                	mov    %eax,%edx
    1e53:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e56:	8d 48 03             	lea    0x3(%eax),%ecx
    1e59:	85 c0                	test   %eax,%eax
    1e5b:	0f 48 c1             	cmovs  %ecx,%eax
    1e5e:	c1 f8 02             	sar    $0x2,%eax
    1e61:	c1 e0 05             	shl    $0x5,%eax
    1e64:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    1e67:	8b 45 08             	mov    0x8(%ebp),%eax
    1e6a:	8d 50 07             	lea    0x7(%eax),%edx
    1e6d:	85 c0                	test   %eax,%eax
    1e6f:	0f 48 c2             	cmovs  %edx,%eax
    1e72:	c1 f8 03             	sar    $0x3,%eax
    1e75:	c1 e0 0b             	shl    $0xb,%eax
    1e78:	01 c8                	add    %ecx,%eax
}
    1e7a:	5d                   	pop    %ebp
    1e7b:	c3                   	ret    

00001e7c <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    1e7c:	55                   	push   %ebp
    1e7d:	89 e5                	mov    %esp,%ebp
    1e7f:	53                   	push   %ebx
    1e80:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    1e83:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    1e8a:	e9 b1 00 00 00       	jmp    1f40 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    1e8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e96:	e9 95 00 00 00       	jmp    1f30 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    1e9b:	8b 55 14             	mov    0x14(%ebp),%edx
    1e9e:	8b 45 18             	mov    0x18(%ebp),%eax
    1ea1:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    1ea5:	89 c1                	mov    %eax,%ecx
    1ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eaa:	01 c8                	add    %ecx,%eax
    1eac:	c1 e0 02             	shl    $0x2,%eax
    1eaf:	01 d0                	add    %edx,%eax
    1eb1:	8b 00                	mov    (%eax),%eax
    1eb3:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    1eb6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    1eba:	3c 01                	cmp    $0x1,%al
    1ebc:	75 02                	jne    1ec0 <draw_picture+0x44>
    1ebe:	eb 6c                	jmp    1f2c <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    1ec0:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    1ec4:	0f b6 c8             	movzbl %al,%ecx
    1ec7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    1ecb:	0f b6 d0             	movzbl %al,%edx
    1ece:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    1ed2:	0f b6 c0             	movzbl %al,%eax
    1ed5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1ed9:	89 54 24 04          	mov    %edx,0x4(%esp)
    1edd:	89 04 24             	mov    %eax,(%esp)
    1ee0:	e8 5b ff ff ff       	call   1e40 <_RGB16BIT565>
    1ee5:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    1ee9:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    1eed:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1ef0:	83 e8 01             	sub    $0x1,%eax
    1ef3:	2b 45 f8             	sub    -0x8(%ebp),%eax
    1ef6:	89 c2                	mov    %eax,%edx
    1ef8:	8b 45 24             	mov    0x24(%ebp),%eax
    1efb:	01 d0                	add    %edx,%eax
    1efd:	89 c2                	mov    %eax,%edx
    1eff:	8b 45 20             	mov    0x20(%ebp),%eax
    1f02:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    1f05:	01 d8                	add    %ebx,%eax
    1f07:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1f0b:	89 54 24 10          	mov    %edx,0x10(%esp)
    1f0f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f13:	8b 45 08             	mov    0x8(%ebp),%eax
    1f16:	89 04 24             	mov    %eax,(%esp)
    1f19:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f20:	8b 45 10             	mov    0x10(%ebp),%eax
    1f23:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f27:	e8 72 f8 ff ff       	call   179e <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    1f2c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f30:	8b 45 18             	mov    0x18(%ebp),%eax
    1f33:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1f36:	0f 8f 5f ff ff ff    	jg     1e9b <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    1f3c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1f40:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1f43:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1f46:	0f 8f 43 ff ff ff    	jg     1e8f <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    1f4c:	83 c4 28             	add    $0x28,%esp
    1f4f:	5b                   	pop    %ebx
    1f50:	5d                   	pop    %ebp
    1f51:	c3                   	ret    

00001f52 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    1f52:	55                   	push   %ebp
    1f53:	89 e5                	mov    %esp,%ebp
    1f55:	83 ec 3c             	sub    $0x3c,%esp
    1f58:	8b 45 24             	mov    0x24(%ebp),%eax
    1f5b:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    1f5f:	8b 45 14             	mov    0x14(%ebp),%eax
    1f62:	8b 55 1c             	mov    0x1c(%ebp),%edx
    1f65:	29 c2                	sub    %eax,%edx
    1f67:	89 d0                	mov    %edx,%eax
    1f69:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    1f6c:	8b 45 18             	mov    0x18(%ebp),%eax
    1f6f:	8b 55 20             	mov    0x20(%ebp),%edx
    1f72:	29 c2                	sub    %eax,%edx
    1f74:	89 d0                	mov    %edx,%eax
    1f76:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    1f79:	8b 45 14             	mov    0x14(%ebp),%eax
    1f7c:	c1 e0 0a             	shl    $0xa,%eax
    1f7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    1f82:	8b 45 18             	mov    0x18(%ebp),%eax
    1f85:	c1 e0 0a             	shl    $0xa,%eax
    1f88:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    1f8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f8e:	c1 f8 1f             	sar    $0x1f,%eax
    1f91:	31 45 fc             	xor    %eax,-0x4(%ebp)
    1f94:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    1f97:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1f9a:	c1 f8 1f             	sar    $0x1f,%eax
    1f9d:	31 45 f8             	xor    %eax,-0x8(%ebp)
    1fa0:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    1fa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1fa6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1fa9:	7c 57                	jl     2002 <draw_line+0xb0>
		len = dx + 1;
    1fab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1fae:	83 c0 01             	add    $0x1,%eax
    1fb1:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    1fb4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1fb7:	3b 45 14             	cmp    0x14(%ebp),%eax
    1fba:	7e 07                	jle    1fc3 <draw_line+0x71>
    1fbc:	b8 00 04 00 00       	mov    $0x400,%eax
    1fc1:	eb 05                	jmp    1fc8 <draw_line+0x76>
    1fc3:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    1fc8:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    1fcb:	8b 45 20             	mov    0x20(%ebp),%eax
    1fce:	3b 45 18             	cmp    0x18(%ebp),%eax
    1fd1:	7c 16                	jl     1fe9 <draw_line+0x97>
    1fd3:	8b 45 18             	mov    0x18(%ebp),%eax
    1fd6:	8b 55 20             	mov    0x20(%ebp),%edx
    1fd9:	29 c2                	sub    %eax,%edx
    1fdb:	89 d0                	mov    %edx,%eax
    1fdd:	83 c0 01             	add    $0x1,%eax
    1fe0:	c1 e0 0a             	shl    $0xa,%eax
    1fe3:	99                   	cltd   
    1fe4:	f7 7d ec             	idivl  -0x14(%ebp)
    1fe7:	eb 14                	jmp    1ffd <draw_line+0xab>
    1fe9:	8b 45 18             	mov    0x18(%ebp),%eax
    1fec:	8b 55 20             	mov    0x20(%ebp),%edx
    1fef:	29 c2                	sub    %eax,%edx
    1ff1:	89 d0                	mov    %edx,%eax
    1ff3:	83 e8 01             	sub    $0x1,%eax
    1ff6:	c1 e0 0a             	shl    $0xa,%eax
    1ff9:	99                   	cltd   
    1ffa:	f7 7d ec             	idivl  -0x14(%ebp)
    1ffd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2000:	eb 55                	jmp    2057 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    2002:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2005:	83 c0 01             	add    $0x1,%eax
    2008:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    200b:	8b 45 20             	mov    0x20(%ebp),%eax
    200e:	3b 45 18             	cmp    0x18(%ebp),%eax
    2011:	7e 07                	jle    201a <draw_line+0xc8>
    2013:	b8 00 04 00 00       	mov    $0x400,%eax
    2018:	eb 05                	jmp    201f <draw_line+0xcd>
    201a:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    201f:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2022:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2025:	3b 45 14             	cmp    0x14(%ebp),%eax
    2028:	7c 16                	jl     2040 <draw_line+0xee>
    202a:	8b 45 14             	mov    0x14(%ebp),%eax
    202d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2030:	29 c2                	sub    %eax,%edx
    2032:	89 d0                	mov    %edx,%eax
    2034:	83 c0 01             	add    $0x1,%eax
    2037:	c1 e0 0a             	shl    $0xa,%eax
    203a:	99                   	cltd   
    203b:	f7 7d ec             	idivl  -0x14(%ebp)
    203e:	eb 14                	jmp    2054 <draw_line+0x102>
    2040:	8b 45 14             	mov    0x14(%ebp),%eax
    2043:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2046:	29 c2                	sub    %eax,%edx
    2048:	89 d0                	mov    %edx,%eax
    204a:	83 e8 01             	sub    $0x1,%eax
    204d:	c1 e0 0a             	shl    $0xa,%eax
    2050:	99                   	cltd   
    2051:	f7 7d ec             	idivl  -0x14(%ebp)
    2054:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    2057:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    205e:	eb 47                	jmp    20a7 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2060:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    2064:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2067:	c1 f8 0a             	sar    $0xa,%eax
    206a:	89 c2                	mov    %eax,%edx
    206c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    206f:	c1 f8 0a             	sar    $0xa,%eax
    2072:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2076:	89 54 24 10          	mov    %edx,0x10(%esp)
    207a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    207e:	8b 45 08             	mov    0x8(%ebp),%eax
    2081:	89 04 24             	mov    %eax,(%esp)
    2084:	8b 45 0c             	mov    0xc(%ebp),%eax
    2087:	89 44 24 04          	mov    %eax,0x4(%esp)
    208b:	8b 45 10             	mov    0x10(%ebp),%eax
    208e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2092:	e8 07 f7 ff ff       	call   179e <draw_point>
		y += dy;
    2097:	8b 45 f8             	mov    -0x8(%ebp),%eax
    209a:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    209d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    20a0:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    20a3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    20a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    20aa:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    20ad:	7c b1                	jl     2060 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    20af:	c9                   	leave  
    20b0:	c3                   	ret    

000020b1 <draw_window>:

void
draw_window(Context c, char *title)
{
    20b1:	55                   	push   %ebp
    20b2:	89 e5                	mov    %esp,%ebp
    20b4:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    20b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    20ba:	83 e8 01             	sub    $0x1,%eax
    20bd:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    20c4:	00 
    20c5:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    20cc:	00 
    20cd:	89 44 24 14          	mov    %eax,0x14(%esp)
    20d1:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    20d8:	00 
    20d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    20e0:	00 
    20e1:	8b 45 08             	mov    0x8(%ebp),%eax
    20e4:	89 04 24             	mov    %eax,(%esp)
    20e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    20ea:	89 44 24 04          	mov    %eax,0x4(%esp)
    20ee:	8b 45 10             	mov    0x10(%ebp),%eax
    20f1:	89 44 24 08          	mov    %eax,0x8(%esp)
    20f5:	e8 58 fe ff ff       	call   1f52 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    20fa:	8b 45 10             	mov    0x10(%ebp),%eax
    20fd:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2100:	8b 45 0c             	mov    0xc(%ebp),%eax
    2103:	8d 50 ff             	lea    -0x1(%eax),%edx
    2106:	8b 45 0c             	mov    0xc(%ebp),%eax
    2109:	83 e8 01             	sub    $0x1,%eax
    210c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2113:	00 
    2114:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2118:	89 54 24 14          	mov    %edx,0x14(%esp)
    211c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2123:	00 
    2124:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2128:	8b 45 08             	mov    0x8(%ebp),%eax
    212b:	89 04 24             	mov    %eax,(%esp)
    212e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2131:	89 44 24 04          	mov    %eax,0x4(%esp)
    2135:	8b 45 10             	mov    0x10(%ebp),%eax
    2138:	89 44 24 08          	mov    %eax,0x8(%esp)
    213c:	e8 11 fe ff ff       	call   1f52 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2141:	8b 45 10             	mov    0x10(%ebp),%eax
    2144:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2147:	8b 45 10             	mov    0x10(%ebp),%eax
    214a:	8d 50 ff             	lea    -0x1(%eax),%edx
    214d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2150:	83 e8 01             	sub    $0x1,%eax
    2153:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    215a:	00 
    215b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    215f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2166:	00 
    2167:	89 54 24 10          	mov    %edx,0x10(%esp)
    216b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    216f:	8b 45 08             	mov    0x8(%ebp),%eax
    2172:	89 04 24             	mov    %eax,(%esp)
    2175:	8b 45 0c             	mov    0xc(%ebp),%eax
    2178:	89 44 24 04          	mov    %eax,0x4(%esp)
    217c:	8b 45 10             	mov    0x10(%ebp),%eax
    217f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2183:	e8 ca fd ff ff       	call   1f52 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    2188:	8b 45 10             	mov    0x10(%ebp),%eax
    218b:	83 e8 01             	sub    $0x1,%eax
    218e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2195:	00 
    2196:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    219d:	00 
    219e:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    21a5:	00 
    21a6:	89 44 24 10          	mov    %eax,0x10(%esp)
    21aa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    21b1:	00 
    21b2:	8b 45 08             	mov    0x8(%ebp),%eax
    21b5:	89 04 24             	mov    %eax,(%esp)
    21b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    21bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    21bf:	8b 45 10             	mov    0x10(%ebp),%eax
    21c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    21c6:	e8 87 fd ff ff       	call   1f52 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    21cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    21ce:	83 e8 02             	sub    $0x2,%eax
    21d1:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    21d8:	00 
    21d9:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    21e0:	00 
    21e1:	89 44 24 14          	mov    %eax,0x14(%esp)
    21e5:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    21ec:	00 
    21ed:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    21f4:	00 
    21f5:	8b 45 08             	mov    0x8(%ebp),%eax
    21f8:	89 04 24             	mov    %eax,(%esp)
    21fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    21fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    2202:	8b 45 10             	mov    0x10(%ebp),%eax
    2205:	89 44 24 08          	mov    %eax,0x8(%esp)
    2209:	e8 cf f5 ff ff       	call   17dd <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    220e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2211:	83 e8 02             	sub    $0x2,%eax
    2214:	89 c2                	mov    %eax,%edx
    2216:	8b 45 10             	mov    0x10(%ebp),%eax
    2219:	83 e8 15             	sub    $0x15,%eax
    221c:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2223:	00 
    2224:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    222b:	00 
    222c:	89 54 24 14          	mov    %edx,0x14(%esp)
    2230:	89 44 24 10          	mov    %eax,0x10(%esp)
    2234:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    223b:	00 
    223c:	8b 45 08             	mov    0x8(%ebp),%eax
    223f:	89 04 24             	mov    %eax,(%esp)
    2242:	8b 45 0c             	mov    0xc(%ebp),%eax
    2245:	89 44 24 04          	mov    %eax,0x4(%esp)
    2249:	8b 45 10             	mov    0x10(%ebp),%eax
    224c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2250:	e8 88 f5 ff ff       	call   17dd <fill_rect>

  loadBitmap(&pic, "close.bmp");
    2255:	c7 44 24 04 4c 9f 00 	movl   $0x9f4c,0x4(%esp)
    225c:	00 
    225d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2260:	89 04 24             	mov    %eax,(%esp)
    2263:	e8 44 01 00 00       	call   23ac <loadBitmap>
  draw_picture(c, pic, 3, 3);
    2268:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    226f:	00 
    2270:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    2277:	00 
    2278:	8b 45 ec             	mov    -0x14(%ebp),%eax
    227b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    227f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2282:	89 44 24 10          	mov    %eax,0x10(%esp)
    2286:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2289:	89 44 24 14          	mov    %eax,0x14(%esp)
    228d:	8b 45 08             	mov    0x8(%ebp),%eax
    2290:	89 04 24             	mov    %eax,(%esp)
    2293:	8b 45 0c             	mov    0xc(%ebp),%eax
    2296:	89 44 24 04          	mov    %eax,0x4(%esp)
    229a:	8b 45 10             	mov    0x10(%ebp),%eax
    229d:	89 44 24 08          	mov    %eax,0x8(%esp)
    22a1:	e8 d6 fb ff ff       	call   1e7c <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    22a6:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    22ad:	00 
    22ae:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    22b5:	00 
    22b6:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    22bd:	00 
    22be:	8b 45 14             	mov    0x14(%ebp),%eax
    22c1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22c5:	8b 45 08             	mov    0x8(%ebp),%eax
    22c8:	89 04 24             	mov    %eax,(%esp)
    22cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    22ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    22d2:	8b 45 10             	mov    0x10(%ebp),%eax
    22d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    22d9:	e8 de fa ff ff       	call   1dbc <puts_str>
  freepic(&pic);
    22de:	8d 45 ec             	lea    -0x14(%ebp),%eax
    22e1:	89 04 24             	mov    %eax,(%esp)
    22e4:	e8 6f 06 00 00       	call   2958 <freepic>
}
    22e9:	c9                   	leave  
    22ea:	c3                   	ret    

000022eb <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    22eb:	55                   	push   %ebp
    22ec:	89 e5                	mov    %esp,%ebp
    22ee:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    22f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    22f8:	eb 29                	jmp    2323 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    22fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22fd:	6b d0 34             	imul   $0x34,%eax,%edx
    2300:	8b 45 08             	mov    0x8(%ebp),%eax
    2303:	01 d0                	add    %edx,%eax
    2305:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2308:	6b ca 34             	imul   $0x34,%edx,%ecx
    230b:	8b 55 08             	mov    0x8(%ebp),%edx
    230e:	01 ca                	add    %ecx,%edx
    2310:	83 c2 28             	add    $0x28,%edx
    2313:	89 44 24 04          	mov    %eax,0x4(%esp)
    2317:	89 14 24             	mov    %edx,(%esp)
    231a:	e8 8d 00 00 00       	call   23ac <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    231f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2323:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2326:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2329:	7c cf                	jl     22fa <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    232b:	c9                   	leave  
    232c:	c3                   	ret    

0000232d <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    232d:	55                   	push   %ebp
    232e:	89 e5                	mov    %esp,%ebp
    2330:	53                   	push   %ebx
    2331:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    2334:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    233b:	eb 61                	jmp    239e <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    233d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2340:	6b d0 34             	imul   $0x34,%eax,%edx
    2343:	8b 45 14             	mov    0x14(%ebp),%eax
    2346:	01 d0                	add    %edx,%eax
    2348:	8b 48 24             	mov    0x24(%eax),%ecx
    234b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    234e:	6b d0 34             	imul   $0x34,%eax,%edx
    2351:	8b 45 14             	mov    0x14(%ebp),%eax
    2354:	01 d0                	add    %edx,%eax
    2356:	8b 50 20             	mov    0x20(%eax),%edx
    2359:	8b 45 f8             	mov    -0x8(%ebp),%eax
    235c:	6b d8 34             	imul   $0x34,%eax,%ebx
    235f:	8b 45 14             	mov    0x14(%ebp),%eax
    2362:	01 d8                	add    %ebx,%eax
    2364:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2368:	89 54 24 18          	mov    %edx,0x18(%esp)
    236c:	8b 50 28             	mov    0x28(%eax),%edx
    236f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2373:	8b 50 2c             	mov    0x2c(%eax),%edx
    2376:	89 54 24 10          	mov    %edx,0x10(%esp)
    237a:	8b 40 30             	mov    0x30(%eax),%eax
    237d:	89 44 24 14          	mov    %eax,0x14(%esp)
    2381:	8b 45 08             	mov    0x8(%ebp),%eax
    2384:	89 04 24             	mov    %eax,(%esp)
    2387:	8b 45 0c             	mov    0xc(%ebp),%eax
    238a:	89 44 24 04          	mov    %eax,0x4(%esp)
    238e:	8b 45 10             	mov    0x10(%ebp),%eax
    2391:	89 44 24 08          	mov    %eax,0x8(%esp)
    2395:	e8 e2 fa ff ff       	call   1e7c <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    239a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    239e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23a1:	3b 45 18             	cmp    0x18(%ebp),%eax
    23a4:	7c 97                	jl     233d <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    23a6:	83 c4 30             	add    $0x30,%esp
    23a9:	5b                   	pop    %ebx
    23aa:	5d                   	pop    %ebp
    23ab:	c3                   	ret    

000023ac <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    23ac:	55                   	push   %ebp
    23ad:	89 e5                	mov    %esp,%ebp
    23af:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    23b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    23bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    23c3:	00 
    23c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    23c7:	89 04 24             	mov    %eax,(%esp)
    23ca:	e8 b6 11 00 00       	call   3585 <open>
    23cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
    23d2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    23d6:	79 20                	jns    23f8 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    23d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    23db:	89 44 24 08          	mov    %eax,0x8(%esp)
    23df:	c7 44 24 04 58 9f 00 	movl   $0x9f58,0x4(%esp)
    23e6:	00 
    23e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23ee:	e8 3a 13 00 00       	call   372d <printf>
		return;
    23f3:	e9 ef 02 00 00       	jmp    26e7 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    23f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    23fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    23ff:	c7 44 24 04 68 9f 00 	movl   $0x9f68,0x4(%esp)
    2406:	00 
    2407:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    240e:	e8 1a 13 00 00       	call   372d <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2413:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    241a:	e8 fa 15 00 00       	call   3a19 <malloc>
    241f:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2422:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    2429:	00 
    242a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    242d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2431:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2434:	89 04 24             	mov    %eax,(%esp)
    2437:	e8 21 11 00 00       	call   355d <read>
    243c:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    243f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2442:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2445:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2448:	0f b7 00             	movzwl (%eax),%eax
    244b:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    244f:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2453:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2457:	74 19                	je     2472 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    2459:	c7 44 24 04 7c 9f 00 	movl   $0x9f7c,0x4(%esp)
    2460:	00 
    2461:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2468:	e8 c0 12 00 00       	call   372d <printf>
		return;
    246d:	e9 75 02 00 00       	jmp    26e7 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2472:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2475:	83 c0 02             	add    $0x2,%eax
    2478:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    247b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    247e:	8b 00                	mov    (%eax),%eax
    2480:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2483:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2486:	83 c0 06             	add    $0x6,%eax
    2489:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    248c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    248f:	0f b7 00             	movzwl (%eax),%eax
    2492:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2496:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2499:	83 c0 08             	add    $0x8,%eax
    249c:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    249f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    24a2:	0f b7 00             	movzwl (%eax),%eax
    24a5:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    24a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    24ac:	83 c0 0a             	add    $0xa,%eax
    24af:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    24b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    24b5:	8b 00                	mov    (%eax),%eax
    24b7:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    24ba:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    24c1:	00 
    24c2:	8d 45 84             	lea    -0x7c(%ebp),%eax
    24c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    24c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24cc:	89 04 24             	mov    %eax,(%esp)
    24cf:	e8 89 10 00 00       	call   355d <read>
	width = bitInfoHead.biWidth;
    24d4:	8b 45 88             	mov    -0x78(%ebp),%eax
    24d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    24da:	8b 45 8c             	mov    -0x74(%ebp),%eax
    24dd:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    24e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    24e3:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    24e7:	c1 e0 02             	shl    $0x2,%eax
    24ea:	89 44 24 10          	mov    %eax,0x10(%esp)
    24ee:	8b 45 d0             	mov    -0x30(%ebp),%eax
    24f1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    24f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    24fc:	c7 44 24 04 94 9f 00 	movl   $0x9f94,0x4(%esp)
    2503:	00 
    2504:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    250b:	e8 1d 12 00 00       	call   372d <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2510:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2514:	75 14                	jne    252a <loadBitmap+0x17e>
		printf(0, "0");
    2516:	c7 44 24 04 b9 9f 00 	movl   $0x9fb9,0x4(%esp)
    251d:	00 
    251e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2525:	e8 03 12 00 00       	call   372d <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    252a:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    252e:	0f b7 c0             	movzwl %ax,%eax
    2531:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2535:	83 c0 1f             	add    $0x1f,%eax
    2538:	8d 50 1f             	lea    0x1f(%eax),%edx
    253b:	85 c0                	test   %eax,%eax
    253d:	0f 48 c2             	cmovs  %edx,%eax
    2540:	c1 f8 05             	sar    $0x5,%eax
    2543:	c1 e0 02             	shl    $0x2,%eax
    2546:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2549:	8b 45 d0             	mov    -0x30(%ebp),%eax
    254c:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2550:	89 04 24             	mov    %eax,(%esp)
    2553:	e8 c1 14 00 00       	call   3a19 <malloc>
    2558:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    255b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    255e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2561:	0f af c2             	imul   %edx,%eax
    2564:	89 44 24 08          	mov    %eax,0x8(%esp)
    2568:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    256f:	00 
    2570:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2573:	89 04 24             	mov    %eax,(%esp)
    2576:	e8 1d 0e 00 00       	call   3398 <memset>
	long nData = height * l_width;
    257b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    257e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2582:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2585:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2588:	89 44 24 08          	mov    %eax,0x8(%esp)
    258c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    258f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2593:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2596:	89 04 24             	mov    %eax,(%esp)
    2599:	e8 bf 0f 00 00       	call   355d <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    259e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    25a1:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    25a5:	c1 e0 02             	shl    $0x2,%eax
    25a8:	89 04 24             	mov    %eax,(%esp)
    25ab:	e8 69 14 00 00       	call   3a19 <malloc>
    25b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    25b3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    25b6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    25b9:	0f af c2             	imul   %edx,%eax
    25bc:	c1 e0 02             	shl    $0x2,%eax
    25bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    25c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    25ca:	00 
    25cb:	8b 45 c0             	mov    -0x40(%ebp),%eax
    25ce:	89 04 24             	mov    %eax,(%esp)
    25d1:	e8 c2 0d 00 00       	call   3398 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    25d6:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    25da:	66 83 f8 17          	cmp    $0x17,%ax
    25de:	77 19                	ja     25f9 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    25e0:	c7 44 24 04 bc 9f 00 	movl   $0x9fbc,0x4(%esp)
    25e7:	00 
    25e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25ef:	e8 39 11 00 00       	call   372d <printf>
		return;
    25f4:	e9 ee 00 00 00       	jmp    26e7 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    25f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2600:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2607:	e9 94 00 00 00       	jmp    26a0 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    260c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2613:	eb 7b                	jmp    2690 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    2615:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2618:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    261c:	89 c1                	mov    %eax,%ecx
    261e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2621:	89 d0                	mov    %edx,%eax
    2623:	01 c0                	add    %eax,%eax
    2625:	01 d0                	add    %edx,%eax
    2627:	01 c8                	add    %ecx,%eax
    2629:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    262c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    262f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2636:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2639:	01 c2                	add    %eax,%edx
    263b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    263e:	8d 48 02             	lea    0x2(%eax),%ecx
    2641:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2644:	01 c8                	add    %ecx,%eax
    2646:	0f b6 00             	movzbl (%eax),%eax
    2649:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    264c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    264f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2656:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2659:	01 c2                	add    %eax,%edx
    265b:	8b 45 bc             	mov    -0x44(%ebp),%eax
    265e:	8d 48 01             	lea    0x1(%eax),%ecx
    2661:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2664:	01 c8                	add    %ecx,%eax
    2666:	0f b6 00             	movzbl (%eax),%eax
    2669:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    266c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    266f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2676:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2679:	01 c2                	add    %eax,%edx
    267b:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    267e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2681:	01 c8                	add    %ecx,%eax
    2683:	0f b6 00             	movzbl (%eax),%eax
    2686:	88 02                	mov    %al,(%edx)
				index++;
    2688:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    268c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2690:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2693:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2696:	0f 8c 79 ff ff ff    	jl     2615 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    269c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    26a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26a3:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    26a6:	0f 8c 60 ff ff ff    	jl     260c <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    26ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    26af:	89 04 24             	mov    %eax,(%esp)
    26b2:	e8 b6 0e 00 00       	call   356d <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    26b7:	8b 45 08             	mov    0x8(%ebp),%eax
    26ba:	8b 55 c0             	mov    -0x40(%ebp),%edx
    26bd:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    26bf:	8b 45 08             	mov    0x8(%ebp),%eax
    26c2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    26c5:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    26c8:	8b 45 08             	mov    0x8(%ebp),%eax
    26cb:	8b 55 d0             	mov    -0x30(%ebp),%edx
    26ce:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    26d1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    26d4:	89 04 24             	mov    %eax,(%esp)
    26d7:	e8 04 12 00 00       	call   38e0 <free>
	free(BmpFileHeader);
    26dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    26df:	89 04 24             	mov    %eax,(%esp)
    26e2:	e8 f9 11 00 00       	call   38e0 <free>
	//printf("\n");
}
    26e7:	c9                   	leave  
    26e8:	c3                   	ret    

000026e9 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    26e9:	55                   	push   %ebp
    26ea:	89 e5                	mov    %esp,%ebp
    26ec:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    26ef:	c7 44 24 04 dc 9f 00 	movl   $0x9fdc,0x4(%esp)
    26f6:	00 
    26f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26fe:	e8 2a 10 00 00       	call   372d <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2703:	8b 45 08             	mov    0x8(%ebp),%eax
    2706:	0f b7 00             	movzwl (%eax),%eax
    2709:	0f b7 c0             	movzwl %ax,%eax
    270c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2710:	c7 44 24 04 ee 9f 00 	movl   $0x9fee,0x4(%esp)
    2717:	00 
    2718:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    271f:	e8 09 10 00 00       	call   372d <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    2724:	8b 45 08             	mov    0x8(%ebp),%eax
    2727:	8b 40 04             	mov    0x4(%eax),%eax
    272a:	89 44 24 08          	mov    %eax,0x8(%esp)
    272e:	c7 44 24 04 0c a0 00 	movl   $0xa00c,0x4(%esp)
    2735:	00 
    2736:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    273d:	e8 eb 0f 00 00       	call   372d <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    2742:	8b 45 08             	mov    0x8(%ebp),%eax
    2745:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    2749:	0f b7 c0             	movzwl %ax,%eax
    274c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2750:	c7 44 24 04 1d a0 00 	movl   $0xa01d,0x4(%esp)
    2757:	00 
    2758:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    275f:	e8 c9 0f 00 00       	call   372d <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    2764:	8b 45 08             	mov    0x8(%ebp),%eax
    2767:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    276b:	0f b7 c0             	movzwl %ax,%eax
    276e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2772:	c7 44 24 04 1d a0 00 	movl   $0xa01d,0x4(%esp)
    2779:	00 
    277a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2781:	e8 a7 0f 00 00       	call   372d <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    2786:	8b 45 08             	mov    0x8(%ebp),%eax
    2789:	8b 40 0c             	mov    0xc(%eax),%eax
    278c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2790:	c7 44 24 04 2c a0 00 	movl   $0xa02c,0x4(%esp)
    2797:	00 
    2798:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    279f:	e8 89 0f 00 00       	call   372d <printf>
}
    27a4:	c9                   	leave  
    27a5:	c3                   	ret    

000027a6 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    27a6:	55                   	push   %ebp
    27a7:	89 e5                	mov    %esp,%ebp
    27a9:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    27ac:	c7 44 24 04 55 a0 00 	movl   $0xa055,0x4(%esp)
    27b3:	00 
    27b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27bb:	e8 6d 0f 00 00       	call   372d <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    27c0:	8b 45 08             	mov    0x8(%ebp),%eax
    27c3:	8b 00                	mov    (%eax),%eax
    27c5:	89 44 24 08          	mov    %eax,0x8(%esp)
    27c9:	c7 44 24 04 67 a0 00 	movl   $0xa067,0x4(%esp)
    27d0:	00 
    27d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27d8:	e8 50 0f 00 00       	call   372d <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    27dd:	8b 45 08             	mov    0x8(%ebp),%eax
    27e0:	8b 40 04             	mov    0x4(%eax),%eax
    27e3:	89 44 24 08          	mov    %eax,0x8(%esp)
    27e7:	c7 44 24 04 7e a0 00 	movl   $0xa07e,0x4(%esp)
    27ee:	00 
    27ef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27f6:	e8 32 0f 00 00       	call   372d <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    27fb:	8b 45 08             	mov    0x8(%ebp),%eax
    27fe:	8b 40 08             	mov    0x8(%eax),%eax
    2801:	89 44 24 08          	mov    %eax,0x8(%esp)
    2805:	c7 44 24 04 8c a0 00 	movl   $0xa08c,0x4(%esp)
    280c:	00 
    280d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2814:	e8 14 0f 00 00       	call   372d <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    2819:	8b 45 08             	mov    0x8(%ebp),%eax
    281c:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    2820:	0f b7 c0             	movzwl %ax,%eax
    2823:	89 44 24 08          	mov    %eax,0x8(%esp)
    2827:	c7 44 24 04 9a a0 00 	movl   $0xa09a,0x4(%esp)
    282e:	00 
    282f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2836:	e8 f2 0e 00 00       	call   372d <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    283b:	8b 45 08             	mov    0x8(%ebp),%eax
    283e:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    2842:	0f b7 c0             	movzwl %ax,%eax
    2845:	89 44 24 08          	mov    %eax,0x8(%esp)
    2849:	c7 44 24 04 b0 a0 00 	movl   $0xa0b0,0x4(%esp)
    2850:	00 
    2851:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2858:	e8 d0 0e 00 00       	call   372d <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    285d:	8b 45 08             	mov    0x8(%ebp),%eax
    2860:	8b 40 10             	mov    0x10(%eax),%eax
    2863:	89 44 24 08          	mov    %eax,0x8(%esp)
    2867:	c7 44 24 04 d1 a0 00 	movl   $0xa0d1,0x4(%esp)
    286e:	00 
    286f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2876:	e8 b2 0e 00 00       	call   372d <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    287b:	8b 45 08             	mov    0x8(%ebp),%eax
    287e:	8b 40 14             	mov    0x14(%eax),%eax
    2881:	89 44 24 08          	mov    %eax,0x8(%esp)
    2885:	c7 44 24 04 e4 a0 00 	movl   $0xa0e4,0x4(%esp)
    288c:	00 
    288d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2894:	e8 94 0e 00 00       	call   372d <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    2899:	8b 45 08             	mov    0x8(%ebp),%eax
    289c:	8b 40 18             	mov    0x18(%eax),%eax
    289f:	89 44 24 08          	mov    %eax,0x8(%esp)
    28a3:	c7 44 24 04 18 a1 00 	movl   $0xa118,0x4(%esp)
    28aa:	00 
    28ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28b2:	e8 76 0e 00 00       	call   372d <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    28b7:	8b 45 08             	mov    0x8(%ebp),%eax
    28ba:	8b 40 1c             	mov    0x1c(%eax),%eax
    28bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    28c1:	c7 44 24 04 2d a1 00 	movl   $0xa12d,0x4(%esp)
    28c8:	00 
    28c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28d0:	e8 58 0e 00 00       	call   372d <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    28d5:	8b 45 08             	mov    0x8(%ebp),%eax
    28d8:	8b 40 20             	mov    0x20(%eax),%eax
    28db:	89 44 24 08          	mov    %eax,0x8(%esp)
    28df:	c7 44 24 04 42 a1 00 	movl   $0xa142,0x4(%esp)
    28e6:	00 
    28e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28ee:	e8 3a 0e 00 00       	call   372d <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    28f3:	8b 45 08             	mov    0x8(%ebp),%eax
    28f6:	8b 40 24             	mov    0x24(%eax),%eax
    28f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    28fd:	c7 44 24 04 59 a1 00 	movl   $0xa159,0x4(%esp)
    2904:	00 
    2905:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    290c:	e8 1c 0e 00 00       	call   372d <printf>
}
    2911:	c9                   	leave  
    2912:	c3                   	ret    

00002913 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    2913:	55                   	push   %ebp
    2914:	89 e5                	mov    %esp,%ebp
    2916:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    2919:	8b 45 08             	mov    0x8(%ebp),%eax
    291c:	0f b6 00             	movzbl (%eax),%eax
    291f:	0f b6 c8             	movzbl %al,%ecx
    2922:	8b 45 08             	mov    0x8(%ebp),%eax
    2925:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2929:	0f b6 d0             	movzbl %al,%edx
    292c:	8b 45 08             	mov    0x8(%ebp),%eax
    292f:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2933:	0f b6 c0             	movzbl %al,%eax
    2936:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    293a:	89 54 24 0c          	mov    %edx,0xc(%esp)
    293e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2942:	c7 44 24 04 6d a1 00 	movl   $0xa16d,0x4(%esp)
    2949:	00 
    294a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2951:	e8 d7 0d 00 00       	call   372d <printf>
}
    2956:	c9                   	leave  
    2957:	c3                   	ret    

00002958 <freepic>:

void freepic(PICNODE *pic) {
    2958:	55                   	push   %ebp
    2959:	89 e5                	mov    %esp,%ebp
    295b:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    295e:	8b 45 08             	mov    0x8(%ebp),%eax
    2961:	8b 00                	mov    (%eax),%eax
    2963:	89 04 24             	mov    %eax,(%esp)
    2966:	e8 75 0f 00 00       	call   38e0 <free>
}
    296b:	c9                   	leave  
    296c:	c3                   	ret    

0000296d <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    296d:	55                   	push   %ebp
    296e:	89 e5                	mov    %esp,%ebp
    2970:	53                   	push   %ebx
    2971:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    2977:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    297e:	8d 45 dc             	lea    -0x24(%ebp),%eax
    2981:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2984:	89 54 24 10          	mov    %edx,0x10(%esp)
    2988:	8b 55 ec             	mov    -0x14(%ebp),%edx
    298b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    298f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2996:	00 
    2997:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    299e:	00 
    299f:	89 04 24             	mov    %eax,(%esp)
    29a2:	e8 80 02 00 00       	call   2c27 <initRect>
    29a7:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    29aa:	8b 45 08             	mov    0x8(%ebp),%eax
    29ad:	8b 40 04             	mov    0x4(%eax),%eax
    29b0:	2b 45 ec             	sub    -0x14(%ebp),%eax
    29b3:	89 c2                	mov    %eax,%edx
    29b5:	8d 45 cc             	lea    -0x34(%ebp),%eax
    29b8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    29bb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    29bf:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    29c2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    29c6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    29cd:	00 
    29ce:	89 54 24 04          	mov    %edx,0x4(%esp)
    29d2:	89 04 24             	mov    %eax,(%esp)
    29d5:	e8 4d 02 00 00       	call   2c27 <initRect>
    29da:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    29dd:	8b 45 08             	mov    0x8(%ebp),%eax
    29e0:	8b 40 08             	mov    0x8(%eax),%eax
    29e3:	2b 45 ec             	sub    -0x14(%ebp),%eax
    29e6:	89 c1                	mov    %eax,%ecx
    29e8:	8b 45 08             	mov    0x8(%ebp),%eax
    29eb:	8b 40 04             	mov    0x4(%eax),%eax
    29ee:	2b 45 ec             	sub    -0x14(%ebp),%eax
    29f1:	89 c2                	mov    %eax,%edx
    29f3:	8d 45 bc             	lea    -0x44(%ebp),%eax
    29f6:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    29f9:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    29fd:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    2a00:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    2a04:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2a08:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a0c:	89 04 24             	mov    %eax,(%esp)
    2a0f:	e8 13 02 00 00       	call   2c27 <initRect>
    2a14:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    2a17:	8b 45 08             	mov    0x8(%ebp),%eax
    2a1a:	8b 40 08             	mov    0x8(%eax),%eax
    2a1d:	2b 45 ec             	sub    -0x14(%ebp),%eax
    2a20:	89 c2                	mov    %eax,%edx
    2a22:	8d 45 ac             	lea    -0x54(%ebp),%eax
    2a25:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    2a28:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    2a2c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    2a2f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    2a33:	89 54 24 08          	mov    %edx,0x8(%esp)
    2a37:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a3e:	00 
    2a3f:	89 04 24             	mov    %eax,(%esp)
    2a42:	e8 e0 01 00 00       	call   2c27 <initRect>
    2a47:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    2a4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a51:	e9 96 01 00 00       	jmp    2bec <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    2a56:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2a5d:	e9 77 01 00 00       	jmp    2bd9 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    2a62:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    2a65:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2a68:	89 54 24 08          	mov    %edx,0x8(%esp)
    2a6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a6f:	89 54 24 04          	mov    %edx,0x4(%esp)
    2a73:	89 04 24             	mov    %eax,(%esp)
    2a76:	e8 85 01 00 00       	call   2c00 <initPoint>
    2a7b:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    2a7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2a81:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a85:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2a88:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2a8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2a8f:	89 44 24 10          	mov    %eax,0x10(%esp)
    2a93:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a96:	89 44 24 14          	mov    %eax,0x14(%esp)
    2a9a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2a9d:	8b 55 a8             	mov    -0x58(%ebp),%edx
    2aa0:	89 04 24             	mov    %eax,(%esp)
    2aa3:	89 54 24 04          	mov    %edx,0x4(%esp)
    2aa7:	e8 d6 01 00 00       	call   2c82 <isIn>
    2aac:	85 c0                	test   %eax,%eax
    2aae:	0f 85 9a 00 00 00    	jne    2b4e <set_icon_alpha+0x1e1>
    2ab4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2ab7:	89 44 24 08          	mov    %eax,0x8(%esp)
    2abb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2abe:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2ac2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2ac5:	89 44 24 10          	mov    %eax,0x10(%esp)
    2ac9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2acc:	89 44 24 14          	mov    %eax,0x14(%esp)
    2ad0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2ad3:	8b 55 a8             	mov    -0x58(%ebp),%edx
    2ad6:	89 04 24             	mov    %eax,(%esp)
    2ad9:	89 54 24 04          	mov    %edx,0x4(%esp)
    2add:	e8 a0 01 00 00       	call   2c82 <isIn>
    2ae2:	85 c0                	test   %eax,%eax
    2ae4:	75 68                	jne    2b4e <set_icon_alpha+0x1e1>
    2ae6:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2ae9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2aed:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2af0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2af4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2af7:	89 44 24 10          	mov    %eax,0x10(%esp)
    2afb:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2afe:	89 44 24 14          	mov    %eax,0x14(%esp)
    2b02:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2b05:	8b 55 a8             	mov    -0x58(%ebp),%edx
    2b08:	89 04 24             	mov    %eax,(%esp)
    2b0b:	89 54 24 04          	mov    %edx,0x4(%esp)
    2b0f:	e8 6e 01 00 00       	call   2c82 <isIn>
    2b14:	85 c0                	test   %eax,%eax
    2b16:	75 36                	jne    2b4e <set_icon_alpha+0x1e1>
    2b18:	8b 45 ac             	mov    -0x54(%ebp),%eax
    2b1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b1f:	8b 45 b0             	mov    -0x50(%ebp),%eax
    2b22:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2b26:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    2b29:	89 44 24 10          	mov    %eax,0x10(%esp)
    2b2d:	8b 45 b8             	mov    -0x48(%ebp),%eax
    2b30:	89 44 24 14          	mov    %eax,0x14(%esp)
    2b34:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2b37:	8b 55 a8             	mov    -0x58(%ebp),%edx
    2b3a:	89 04 24             	mov    %eax,(%esp)
    2b3d:	89 54 24 04          	mov    %edx,0x4(%esp)
    2b41:	e8 3c 01 00 00       	call   2c82 <isIn>
    2b46:	85 c0                	test   %eax,%eax
    2b48:	0f 84 87 00 00 00    	je     2bd5 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    2b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    2b51:	8b 10                	mov    (%eax),%edx
    2b53:	8b 45 08             	mov    0x8(%ebp),%eax
    2b56:	8b 40 04             	mov    0x4(%eax),%eax
    2b59:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    2b5d:	89 c1                	mov    %eax,%ecx
    2b5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b62:	01 c8                	add    %ecx,%eax
    2b64:	c1 e0 02             	shl    $0x2,%eax
    2b67:	01 d0                	add    %edx,%eax
    2b69:	0f b6 00             	movzbl (%eax),%eax
    2b6c:	3c ff                	cmp    $0xff,%al
    2b6e:	75 65                	jne    2bd5 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    2b70:	8b 45 08             	mov    0x8(%ebp),%eax
    2b73:	8b 10                	mov    (%eax),%edx
    2b75:	8b 45 08             	mov    0x8(%ebp),%eax
    2b78:	8b 40 04             	mov    0x4(%eax),%eax
    2b7b:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    2b7f:	89 c1                	mov    %eax,%ecx
    2b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b84:	01 c8                	add    %ecx,%eax
    2b86:	c1 e0 02             	shl    $0x2,%eax
    2b89:	01 d0                	add    %edx,%eax
    2b8b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    2b8f:	3c ff                	cmp    $0xff,%al
    2b91:	75 42                	jne    2bd5 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    2b93:	8b 45 08             	mov    0x8(%ebp),%eax
    2b96:	8b 10                	mov    (%eax),%edx
    2b98:	8b 45 08             	mov    0x8(%ebp),%eax
    2b9b:	8b 40 04             	mov    0x4(%eax),%eax
    2b9e:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    2ba2:	89 c1                	mov    %eax,%ecx
    2ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ba7:	01 c8                	add    %ecx,%eax
    2ba9:	c1 e0 02             	shl    $0x2,%eax
    2bac:	01 d0                	add    %edx,%eax
    2bae:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    2bb2:	3c ff                	cmp    $0xff,%al
    2bb4:	75 1f                	jne    2bd5 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    2bb6:	8b 45 08             	mov    0x8(%ebp),%eax
    2bb9:	8b 10                	mov    (%eax),%edx
    2bbb:	8b 45 08             	mov    0x8(%ebp),%eax
    2bbe:	8b 40 04             	mov    0x4(%eax),%eax
    2bc1:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    2bc5:	89 c1                	mov    %eax,%ecx
    2bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bca:	01 c8                	add    %ecx,%eax
    2bcc:	c1 e0 02             	shl    $0x2,%eax
    2bcf:	01 d0                	add    %edx,%eax
    2bd1:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    2bd5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    2bdc:	8b 40 08             	mov    0x8(%eax),%eax
    2bdf:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2be2:	0f 8f 7a fe ff ff    	jg     2a62 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    2be8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2bec:	8b 45 08             	mov    0x8(%ebp),%eax
    2bef:	8b 40 04             	mov    0x4(%eax),%eax
    2bf2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2bf5:	0f 8f 5b fe ff ff    	jg     2a56 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    2bfb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2bfe:	c9                   	leave  
    2bff:	c3                   	ret    

00002c00 <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    2c00:	55                   	push   %ebp
    2c01:	89 e5                	mov    %esp,%ebp
    2c03:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    2c06:	8b 45 0c             	mov    0xc(%ebp),%eax
    2c09:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    2c0c:	8b 45 10             	mov    0x10(%ebp),%eax
    2c0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    2c12:	8b 4d 08             	mov    0x8(%ebp),%ecx
    2c15:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2c18:	8b 55 fc             	mov    -0x4(%ebp),%edx
    2c1b:	89 01                	mov    %eax,(%ecx)
    2c1d:	89 51 04             	mov    %edx,0x4(%ecx)
}
    2c20:	8b 45 08             	mov    0x8(%ebp),%eax
    2c23:	c9                   	leave  
    2c24:	c2 04 00             	ret    $0x4

00002c27 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    2c27:	55                   	push   %ebp
    2c28:	89 e5                	mov    %esp,%ebp
    2c2a:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    2c2d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2c30:	8b 55 10             	mov    0x10(%ebp),%edx
    2c33:	89 54 24 08          	mov    %edx,0x8(%esp)
    2c37:	8b 55 0c             	mov    0xc(%ebp),%edx
    2c3a:	89 54 24 04          	mov    %edx,0x4(%esp)
    2c3e:	89 04 24             	mov    %eax,(%esp)
    2c41:	e8 ba ff ff ff       	call   2c00 <initPoint>
    2c46:	83 ec 04             	sub    $0x4,%esp
    2c49:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c4c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2c4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2c52:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    2c55:	8b 45 14             	mov    0x14(%ebp),%eax
    2c58:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    2c5b:	8b 45 18             	mov    0x18(%ebp),%eax
    2c5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    2c61:	8b 45 08             	mov    0x8(%ebp),%eax
    2c64:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2c67:	89 10                	mov    %edx,(%eax)
    2c69:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2c6c:	89 50 04             	mov    %edx,0x4(%eax)
    2c6f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2c72:	89 50 08             	mov    %edx,0x8(%eax)
    2c75:	8b 55 fc             	mov    -0x4(%ebp),%edx
    2c78:	89 50 0c             	mov    %edx,0xc(%eax)
}
    2c7b:	8b 45 08             	mov    0x8(%ebp),%eax
    2c7e:	c9                   	leave  
    2c7f:	c2 04 00             	ret    $0x4

00002c82 <isIn>:

int isIn(Point p, Rect r)
{
    2c82:	55                   	push   %ebp
    2c83:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    2c85:	8b 55 08             	mov    0x8(%ebp),%edx
    2c88:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    2c8b:	39 c2                	cmp    %eax,%edx
    2c8d:	7c 2f                	jl     2cbe <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    2c8f:	8b 45 08             	mov    0x8(%ebp),%eax
    2c92:	8b 4d 10             	mov    0x10(%ebp),%ecx
    2c95:	8b 55 18             	mov    0x18(%ebp),%edx
    2c98:	01 ca                	add    %ecx,%edx
    2c9a:	39 d0                	cmp    %edx,%eax
    2c9c:	7d 20                	jge    2cbe <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    2c9e:	8b 55 0c             	mov    0xc(%ebp),%edx
    2ca1:	8b 45 14             	mov    0x14(%ebp),%eax
    2ca4:	39 c2                	cmp    %eax,%edx
    2ca6:	7c 16                	jl     2cbe <isIn+0x3c>
    2ca8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2cab:	8b 4d 14             	mov    0x14(%ebp),%ecx
    2cae:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2cb1:	01 ca                	add    %ecx,%edx
    2cb3:	39 d0                	cmp    %edx,%eax
    2cb5:	7d 07                	jge    2cbe <isIn+0x3c>
    2cb7:	b8 01 00 00 00       	mov    $0x1,%eax
    2cbc:	eb 05                	jmp    2cc3 <isIn+0x41>
    2cbe:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2cc3:	5d                   	pop    %ebp
    2cc4:	c3                   	ret    

00002cc5 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    2cc5:	55                   	push   %ebp
    2cc6:	89 e5                	mov    %esp,%ebp
    2cc8:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    2ccb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    2cd2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    2cd9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    2ce0:	8b 45 10             	mov    0x10(%ebp),%eax
    2ce3:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    2ce6:	8b 45 14             	mov    0x14(%ebp),%eax
    2ce9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    2cec:	8b 45 08             	mov    0x8(%ebp),%eax
    2cef:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2cf2:	89 10                	mov    %edx,(%eax)
    2cf4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2cf7:	89 50 04             	mov    %edx,0x4(%eax)
    2cfa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2cfd:	89 50 08             	mov    %edx,0x8(%eax)
    2d00:	8b 55 f8             	mov    -0x8(%ebp),%edx
    2d03:	89 50 0c             	mov    %edx,0xc(%eax)
    2d06:	8b 55 fc             	mov    -0x4(%ebp),%edx
    2d09:	89 50 10             	mov    %edx,0x10(%eax)
}
    2d0c:	8b 45 08             	mov    0x8(%ebp),%eax
    2d0f:	c9                   	leave  
    2d10:	c2 04 00             	ret    $0x4

00002d13 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    2d13:	55                   	push   %ebp
    2d14:	89 e5                	mov    %esp,%ebp
    2d16:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    2d19:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2d1c:	83 f8 03             	cmp    $0x3,%eax
    2d1f:	74 72                	je     2d93 <createClickable+0x80>
    2d21:	83 f8 04             	cmp    $0x4,%eax
    2d24:	74 0a                	je     2d30 <createClickable+0x1d>
    2d26:	83 f8 02             	cmp    $0x2,%eax
    2d29:	74 38                	je     2d63 <createClickable+0x50>
    2d2b:	e9 96 00 00 00       	jmp    2dc6 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    2d30:	8b 45 08             	mov    0x8(%ebp),%eax
    2d33:	8d 50 04             	lea    0x4(%eax),%edx
    2d36:	8b 45 20             	mov    0x20(%ebp),%eax
    2d39:	89 44 24 14          	mov    %eax,0x14(%esp)
    2d3d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d40:	89 44 24 04          	mov    %eax,0x4(%esp)
    2d44:	8b 45 10             	mov    0x10(%ebp),%eax
    2d47:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d4b:	8b 45 14             	mov    0x14(%ebp),%eax
    2d4e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2d52:	8b 45 18             	mov    0x18(%ebp),%eax
    2d55:	89 44 24 10          	mov    %eax,0x10(%esp)
    2d59:	89 14 24             	mov    %edx,(%esp)
    2d5c:	e8 7c 00 00 00       	call   2ddd <addClickable>
	        break;
    2d61:	eb 78                	jmp    2ddb <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    2d63:	8b 45 08             	mov    0x8(%ebp),%eax
    2d66:	8b 55 20             	mov    0x20(%ebp),%edx
    2d69:	89 54 24 14          	mov    %edx,0x14(%esp)
    2d6d:	8b 55 0c             	mov    0xc(%ebp),%edx
    2d70:	89 54 24 04          	mov    %edx,0x4(%esp)
    2d74:	8b 55 10             	mov    0x10(%ebp),%edx
    2d77:	89 54 24 08          	mov    %edx,0x8(%esp)
    2d7b:	8b 55 14             	mov    0x14(%ebp),%edx
    2d7e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2d82:	8b 55 18             	mov    0x18(%ebp),%edx
    2d85:	89 54 24 10          	mov    %edx,0x10(%esp)
    2d89:	89 04 24             	mov    %eax,(%esp)
    2d8c:	e8 4c 00 00 00       	call   2ddd <addClickable>
	    	break;
    2d91:	eb 48                	jmp    2ddb <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    2d93:	8b 45 08             	mov    0x8(%ebp),%eax
    2d96:	8d 50 08             	lea    0x8(%eax),%edx
    2d99:	8b 45 20             	mov    0x20(%ebp),%eax
    2d9c:	89 44 24 14          	mov    %eax,0x14(%esp)
    2da0:	8b 45 0c             	mov    0xc(%ebp),%eax
    2da3:	89 44 24 04          	mov    %eax,0x4(%esp)
    2da7:	8b 45 10             	mov    0x10(%ebp),%eax
    2daa:	89 44 24 08          	mov    %eax,0x8(%esp)
    2dae:	8b 45 14             	mov    0x14(%ebp),%eax
    2db1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2db5:	8b 45 18             	mov    0x18(%ebp),%eax
    2db8:	89 44 24 10          	mov    %eax,0x10(%esp)
    2dbc:	89 14 24             	mov    %edx,(%esp)
    2dbf:	e8 19 00 00 00       	call   2ddd <addClickable>
	    	break;
    2dc4:	eb 15                	jmp    2ddb <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    2dc6:	c7 44 24 04 7c a1 00 	movl   $0xa17c,0x4(%esp)
    2dcd:	00 
    2dce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2dd5:	e8 53 09 00 00       	call   372d <printf>
	    	break;
    2dda:	90                   	nop
	}
}
    2ddb:	c9                   	leave  
    2ddc:	c3                   	ret    

00002ddd <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    2ddd:	55                   	push   %ebp
    2dde:	89 e5                	mov    %esp,%ebp
    2de0:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    2de3:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    2dea:	e8 2a 0c 00 00       	call   3a19 <malloc>
    2def:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    2df2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2df5:	8b 55 0c             	mov    0xc(%ebp),%edx
    2df8:	89 10                	mov    %edx,(%eax)
    2dfa:	8b 55 10             	mov    0x10(%ebp),%edx
    2dfd:	89 50 04             	mov    %edx,0x4(%eax)
    2e00:	8b 55 14             	mov    0x14(%ebp),%edx
    2e03:	89 50 08             	mov    %edx,0x8(%eax)
    2e06:	8b 55 18             	mov    0x18(%ebp),%edx
    2e09:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    2e0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e0f:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2e12:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    2e15:	8b 45 08             	mov    0x8(%ebp),%eax
    2e18:	8b 10                	mov    (%eax),%edx
    2e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e1d:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    2e20:	8b 45 08             	mov    0x8(%ebp),%eax
    2e23:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2e26:	89 10                	mov    %edx,(%eax)
}
    2e28:	c9                   	leave  
    2e29:	c3                   	ret    

00002e2a <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    2e2a:	55                   	push   %ebp
    2e2b:	89 e5                	mov    %esp,%ebp
    2e2d:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    2e30:	8b 45 08             	mov    0x8(%ebp),%eax
    2e33:	8b 00                	mov    (%eax),%eax
    2e35:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2e38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    2e3e:	e9 bb 00 00 00       	jmp    2efe <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    2e43:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e46:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e4a:	8b 45 10             	mov    0x10(%ebp),%eax
    2e4d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2e51:	8b 45 14             	mov    0x14(%ebp),%eax
    2e54:	89 44 24 10          	mov    %eax,0x10(%esp)
    2e58:	8b 45 18             	mov    0x18(%ebp),%eax
    2e5b:	89 44 24 14          	mov    %eax,0x14(%esp)
    2e5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e62:	8b 50 04             	mov    0x4(%eax),%edx
    2e65:	8b 00                	mov    (%eax),%eax
    2e67:	89 04 24             	mov    %eax,(%esp)
    2e6a:	89 54 24 04          	mov    %edx,0x4(%esp)
    2e6e:	e8 0f fe ff ff       	call   2c82 <isIn>
    2e73:	85 c0                	test   %eax,%eax
    2e75:	74 60                	je     2ed7 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    2e77:	8b 45 08             	mov    0x8(%ebp),%eax
    2e7a:	8b 00                	mov    (%eax),%eax
    2e7c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2e7f:	75 2e                	jne    2eaf <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    2e81:	8b 45 08             	mov    0x8(%ebp),%eax
    2e84:	8b 00                	mov    (%eax),%eax
    2e86:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    2e89:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e8c:	8b 50 14             	mov    0x14(%eax),%edx
    2e8f:	8b 45 08             	mov    0x8(%ebp),%eax
    2e92:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    2e94:	8b 45 08             	mov    0x8(%ebp),%eax
    2e97:	8b 00                	mov    (%eax),%eax
    2e99:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2e9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    2ea2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ea5:	89 04 24             	mov    %eax,(%esp)
    2ea8:	e8 33 0a 00 00       	call   38e0 <free>
    2ead:	eb 4f                	jmp    2efe <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    2eaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eb2:	8b 50 14             	mov    0x14(%eax),%edx
    2eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eb8:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    2ebb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ebe:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    2ec1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ec4:	8b 40 14             	mov    0x14(%eax),%eax
    2ec7:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    2eca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2ecd:	89 04 24             	mov    %eax,(%esp)
    2ed0:	e8 0b 0a 00 00       	call   38e0 <free>
    2ed5:	eb 27                	jmp    2efe <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    2ed7:	8b 45 08             	mov    0x8(%ebp),%eax
    2eda:	8b 00                	mov    (%eax),%eax
    2edc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    2edf:	75 0b                	jne    2eec <deleteClickable+0xc2>
			{
				cur = cur->next;
    2ee1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2ee4:	8b 40 14             	mov    0x14(%eax),%eax
    2ee7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2eea:	eb 12                	jmp    2efe <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    2eec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eef:	8b 40 14             	mov    0x14(%eax),%eax
    2ef2:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    2ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef8:	8b 40 14             	mov    0x14(%eax),%eax
    2efb:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    2efe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2f02:	0f 85 3b ff ff ff    	jne    2e43 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    2f08:	c9                   	leave  
    2f09:	c3                   	ret    

00002f0a <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    2f0a:	55                   	push   %ebp
    2f0b:	89 e5                	mov    %esp,%ebp
    2f0d:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    2f10:	8b 45 08             	mov    0x8(%ebp),%eax
    2f13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    2f16:	eb 59                	jmp    2f71 <executeHandler+0x67>
	{
		if (isIn(click, cur->area))
    2f18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f1b:	8b 10                	mov    (%eax),%edx
    2f1d:	89 54 24 08          	mov    %edx,0x8(%esp)
    2f21:	8b 50 04             	mov    0x4(%eax),%edx
    2f24:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2f28:	8b 50 08             	mov    0x8(%eax),%edx
    2f2b:	89 54 24 10          	mov    %edx,0x10(%esp)
    2f2f:	8b 40 0c             	mov    0xc(%eax),%eax
    2f32:	89 44 24 14          	mov    %eax,0x14(%esp)
    2f36:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f39:	8b 55 10             	mov    0x10(%ebp),%edx
    2f3c:	89 04 24             	mov    %eax,(%esp)
    2f3f:	89 54 24 04          	mov    %edx,0x4(%esp)
    2f43:	e8 3a fd ff ff       	call   2c82 <isIn>
    2f48:	85 c0                	test   %eax,%eax
    2f4a:	74 1c                	je     2f68 <executeHandler+0x5e>
		{
			cur->handler(click);
    2f4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f4f:	8b 48 10             	mov    0x10(%eax),%ecx
    2f52:	8b 45 0c             	mov    0xc(%ebp),%eax
    2f55:	8b 55 10             	mov    0x10(%ebp),%edx
    2f58:	89 04 24             	mov    %eax,(%esp)
    2f5b:	89 54 24 04          	mov    %edx,0x4(%esp)
    2f5f:	ff d1                	call   *%ecx
			return 1;
    2f61:	b8 01 00 00 00       	mov    $0x1,%eax
    2f66:	eb 28                	jmp    2f90 <executeHandler+0x86>
		}
		cur = cur->next;
    2f68:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f6b:	8b 40 14             	mov    0x14(%eax),%eax
    2f6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    2f71:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2f75:	75 a1                	jne    2f18 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    2f77:	c7 44 24 04 aa a1 00 	movl   $0xa1aa,0x4(%esp)
    2f7e:	00 
    2f7f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f86:	e8 a2 07 00 00       	call   372d <printf>
	return 0;
    2f8b:	b8 00 00 00 00       	mov    $0x0,%eax
}
    2f90:	c9                   	leave  
    2f91:	c3                   	ret    

00002f92 <printClickable>:

void printClickable(Clickable *c)
{
    2f92:	55                   	push   %ebp
    2f93:	89 e5                	mov    %esp,%ebp
    2f95:	53                   	push   %ebx
    2f96:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    2f99:	8b 45 08             	mov    0x8(%ebp),%eax
    2f9c:	8b 58 0c             	mov    0xc(%eax),%ebx
    2f9f:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa2:	8b 48 08             	mov    0x8(%eax),%ecx
    2fa5:	8b 45 08             	mov    0x8(%ebp),%eax
    2fa8:	8b 50 04             	mov    0x4(%eax),%edx
    2fab:	8b 45 08             	mov    0x8(%ebp),%eax
    2fae:	8b 00                	mov    (%eax),%eax
    2fb0:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    2fb4:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    2fb8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2fbc:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fc0:	c7 44 24 04 ba a1 00 	movl   $0xa1ba,0x4(%esp)
    2fc7:	00 
    2fc8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fcf:	e8 59 07 00 00       	call   372d <printf>
}
    2fd4:	83 c4 24             	add    $0x24,%esp
    2fd7:	5b                   	pop    %ebx
    2fd8:	5d                   	pop    %ebp
    2fd9:	c3                   	ret    

00002fda <printClickableList>:

void printClickableList(Clickable *head)
{
    2fda:	55                   	push   %ebp
    2fdb:	89 e5                	mov    %esp,%ebp
    2fdd:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    2fe0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    2fe6:	c7 44 24 04 cc a1 00 	movl   $0xa1cc,0x4(%esp)
    2fed:	00 
    2fee:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ff5:	e8 33 07 00 00       	call   372d <printf>
	while(cur != 0)
    2ffa:	eb 14                	jmp    3010 <printClickableList+0x36>
	{
		printClickable(cur);
    2ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2fff:	89 04 24             	mov    %eax,(%esp)
    3002:	e8 8b ff ff ff       	call   2f92 <printClickable>
		cur = cur->next;
    3007:	8b 45 f4             	mov    -0xc(%ebp),%eax
    300a:	8b 40 14             	mov    0x14(%eax),%eax
    300d:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3010:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3014:	75 e6                	jne    2ffc <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3016:	c7 44 24 04 dd a1 00 	movl   $0xa1dd,0x4(%esp)
    301d:	00 
    301e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3025:	e8 03 07 00 00       	call   372d <printf>
}
    302a:	c9                   	leave  
    302b:	c3                   	ret    

0000302c <testHanler>:

void testHanler(struct Point p)
{
    302c:	55                   	push   %ebp
    302d:	89 e5                	mov    %esp,%ebp
    302f:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3032:	8b 55 0c             	mov    0xc(%ebp),%edx
    3035:	8b 45 08             	mov    0x8(%ebp),%eax
    3038:	89 54 24 0c          	mov    %edx,0xc(%esp)
    303c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3040:	c7 44 24 04 df a1 00 	movl   $0xa1df,0x4(%esp)
    3047:	00 
    3048:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    304f:	e8 d9 06 00 00       	call   372d <printf>
}
    3054:	c9                   	leave  
    3055:	c3                   	ret    

00003056 <testClickable>:
void testClickable(struct Context c)
{
    3056:	55                   	push   %ebp
    3057:	89 e5                	mov    %esp,%ebp
    3059:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    305f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3062:	8b 55 08             	mov    0x8(%ebp),%edx
    3065:	89 54 24 04          	mov    %edx,0x4(%esp)
    3069:	8b 55 0c             	mov    0xc(%ebp),%edx
    306c:	89 54 24 08          	mov    %edx,0x8(%esp)
    3070:	8b 55 10             	mov    0x10(%ebp),%edx
    3073:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3077:	89 04 24             	mov    %eax,(%esp)
    307a:	e8 46 fc ff ff       	call   2cc5 <initClickManager>
    307f:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    3082:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3085:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    308c:	00 
    308d:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    3094:	00 
    3095:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    309c:	00 
    309d:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    30a4:	00 
    30a5:	89 04 24             	mov    %eax,(%esp)
    30a8:	e8 7a fb ff ff       	call   2c27 <initRect>
    30ad:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    30b0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    30b3:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    30ba:	00 
    30bb:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    30c2:	00 
    30c3:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    30ca:	00 
    30cb:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    30d2:	00 
    30d3:	89 04 24             	mov    %eax,(%esp)
    30d6:	e8 4c fb ff ff       	call   2c27 <initRect>
    30db:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    30de:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    30e1:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    30e8:	00 
    30e9:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    30f0:	00 
    30f1:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    30f8:	00 
    30f9:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    3100:	00 
    3101:	89 04 24             	mov    %eax,(%esp)
    3104:	e8 1e fb ff ff       	call   2c27 <initRect>
    3109:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    310c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    310f:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    3116:	00 
    3117:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    311e:	00 
    311f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3126:	00 
    3127:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    312e:	00 
    312f:	89 04 24             	mov    %eax,(%esp)
    3132:	e8 f0 fa ff ff       	call   2c27 <initRect>
    3137:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    313a:	8d 45 9c             	lea    -0x64(%ebp),%eax
    313d:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    3144:	00 
    3145:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    314c:	00 
    314d:	89 04 24             	mov    %eax,(%esp)
    3150:	e8 ab fa ff ff       	call   2c00 <initPoint>
    3155:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    3158:	8d 45 94             	lea    -0x6c(%ebp),%eax
    315b:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    3162:	00 
    3163:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    316a:	00 
    316b:	89 04 24             	mov    %eax,(%esp)
    316e:	e8 8d fa ff ff       	call   2c00 <initPoint>
    3173:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3176:	c7 44 24 18 2c 30 00 	movl   $0x302c,0x18(%esp)
    317d:	00 
    317e:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3185:	00 
    3186:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3189:	89 44 24 04          	mov    %eax,0x4(%esp)
    318d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3190:	89 44 24 08          	mov    %eax,0x8(%esp)
    3194:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3197:	89 44 24 0c          	mov    %eax,0xc(%esp)
    319b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    319e:	89 44 24 10          	mov    %eax,0x10(%esp)
    31a2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    31a5:	89 04 24             	mov    %eax,(%esp)
    31a8:	e8 66 fb ff ff       	call   2d13 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    31ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31b0:	89 44 24 08          	mov    %eax,0x8(%esp)
    31b4:	c7 44 24 04 f3 a1 00 	movl   $0xa1f3,0x4(%esp)
    31bb:	00 
    31bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31c3:	e8 65 05 00 00       	call   372d <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    31c8:	c7 44 24 18 2c 30 00 	movl   $0x302c,0x18(%esp)
    31cf:	00 
    31d0:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    31d7:	00 
    31d8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    31db:	89 44 24 04          	mov    %eax,0x4(%esp)
    31df:	8b 45 c8             	mov    -0x38(%ebp),%eax
    31e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    31e6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    31e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31f0:	89 44 24 10          	mov    %eax,0x10(%esp)
    31f4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    31f7:	89 04 24             	mov    %eax,(%esp)
    31fa:	e8 14 fb ff ff       	call   2d13 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    31ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3202:	89 44 24 08          	mov    %eax,0x8(%esp)
    3206:	c7 44 24 04 f3 a1 00 	movl   $0xa1f3,0x4(%esp)
    320d:	00 
    320e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3215:	e8 13 05 00 00       	call   372d <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    321a:	c7 44 24 18 2c 30 00 	movl   $0x302c,0x18(%esp)
    3221:	00 
    3222:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3229:	00 
    322a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    322d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3231:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3234:	89 44 24 08          	mov    %eax,0x8(%esp)
    3238:	8b 45 bc             	mov    -0x44(%ebp),%eax
    323b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    323f:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3242:	89 44 24 10          	mov    %eax,0x10(%esp)
    3246:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3249:	89 04 24             	mov    %eax,(%esp)
    324c:	e8 c2 fa ff ff       	call   2d13 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3251:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3254:	89 44 24 08          	mov    %eax,0x8(%esp)
    3258:	c7 44 24 04 f3 a1 00 	movl   $0xa1f3,0x4(%esp)
    325f:	00 
    3260:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3267:	e8 c1 04 00 00       	call   372d <printf>
	printClickableList(cm.left_click);
    326c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    326f:	89 04 24             	mov    %eax,(%esp)
    3272:	e8 63 fd ff ff       	call   2fda <printClickableList>
	executeHandler(cm.left_click, p1);
    3277:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    327a:	8b 45 9c             	mov    -0x64(%ebp),%eax
    327d:	8b 55 a0             	mov    -0x60(%ebp),%edx
    3280:	89 44 24 04          	mov    %eax,0x4(%esp)
    3284:	89 54 24 08          	mov    %edx,0x8(%esp)
    3288:	89 0c 24             	mov    %ecx,(%esp)
    328b:	e8 7a fc ff ff       	call   2f0a <executeHandler>
	executeHandler(cm.left_click, p2);
    3290:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3293:	8b 45 94             	mov    -0x6c(%ebp),%eax
    3296:	8b 55 98             	mov    -0x68(%ebp),%edx
    3299:	89 44 24 04          	mov    %eax,0x4(%esp)
    329d:	89 54 24 08          	mov    %edx,0x8(%esp)
    32a1:	89 0c 24             	mov    %ecx,(%esp)
    32a4:	e8 61 fc ff ff       	call   2f0a <executeHandler>
	deleteClickable(&cm.left_click, r4);
    32a9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    32ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    32b0:	8b 45 a8             	mov    -0x58(%ebp),%eax
    32b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    32b7:	8b 45 ac             	mov    -0x54(%ebp),%eax
    32ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
    32be:	8b 45 b0             	mov    -0x50(%ebp),%eax
    32c1:	89 44 24 10          	mov    %eax,0x10(%esp)
    32c5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    32c8:	89 04 24             	mov    %eax,(%esp)
    32cb:	e8 5a fb ff ff       	call   2e2a <deleteClickable>
	printClickableList(cm.left_click);
    32d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    32d3:	89 04 24             	mov    %eax,(%esp)
    32d6:	e8 ff fc ff ff       	call   2fda <printClickableList>
}
    32db:	c9                   	leave  
    32dc:	c3                   	ret    

000032dd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    32dd:	55                   	push   %ebp
    32de:	89 e5                	mov    %esp,%ebp
    32e0:	57                   	push   %edi
    32e1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    32e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    32e5:	8b 55 10             	mov    0x10(%ebp),%edx
    32e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    32eb:	89 cb                	mov    %ecx,%ebx
    32ed:	89 df                	mov    %ebx,%edi
    32ef:	89 d1                	mov    %edx,%ecx
    32f1:	fc                   	cld    
    32f2:	f3 aa                	rep stos %al,%es:(%edi)
    32f4:	89 ca                	mov    %ecx,%edx
    32f6:	89 fb                	mov    %edi,%ebx
    32f8:	89 5d 08             	mov    %ebx,0x8(%ebp)
    32fb:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    32fe:	5b                   	pop    %ebx
    32ff:	5f                   	pop    %edi
    3300:	5d                   	pop    %ebp
    3301:	c3                   	ret    

00003302 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3302:	55                   	push   %ebp
    3303:	89 e5                	mov    %esp,%ebp
    3305:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3308:	8b 45 08             	mov    0x8(%ebp),%eax
    330b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    330e:	90                   	nop
    330f:	8b 45 08             	mov    0x8(%ebp),%eax
    3312:	8d 50 01             	lea    0x1(%eax),%edx
    3315:	89 55 08             	mov    %edx,0x8(%ebp)
    3318:	8b 55 0c             	mov    0xc(%ebp),%edx
    331b:	8d 4a 01             	lea    0x1(%edx),%ecx
    331e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3321:	0f b6 12             	movzbl (%edx),%edx
    3324:	88 10                	mov    %dl,(%eax)
    3326:	0f b6 00             	movzbl (%eax),%eax
    3329:	84 c0                	test   %al,%al
    332b:	75 e2                	jne    330f <strcpy+0xd>
    ;
  return os;
    332d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3330:	c9                   	leave  
    3331:	c3                   	ret    

00003332 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3332:	55                   	push   %ebp
    3333:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3335:	eb 08                	jmp    333f <strcmp+0xd>
    p++, q++;
    3337:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    333b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    333f:	8b 45 08             	mov    0x8(%ebp),%eax
    3342:	0f b6 00             	movzbl (%eax),%eax
    3345:	84 c0                	test   %al,%al
    3347:	74 10                	je     3359 <strcmp+0x27>
    3349:	8b 45 08             	mov    0x8(%ebp),%eax
    334c:	0f b6 10             	movzbl (%eax),%edx
    334f:	8b 45 0c             	mov    0xc(%ebp),%eax
    3352:	0f b6 00             	movzbl (%eax),%eax
    3355:	38 c2                	cmp    %al,%dl
    3357:	74 de                	je     3337 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3359:	8b 45 08             	mov    0x8(%ebp),%eax
    335c:	0f b6 00             	movzbl (%eax),%eax
    335f:	0f b6 d0             	movzbl %al,%edx
    3362:	8b 45 0c             	mov    0xc(%ebp),%eax
    3365:	0f b6 00             	movzbl (%eax),%eax
    3368:	0f b6 c0             	movzbl %al,%eax
    336b:	29 c2                	sub    %eax,%edx
    336d:	89 d0                	mov    %edx,%eax
}
    336f:	5d                   	pop    %ebp
    3370:	c3                   	ret    

00003371 <strlen>:

uint
strlen(char *s)
{
    3371:	55                   	push   %ebp
    3372:	89 e5                	mov    %esp,%ebp
    3374:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3377:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    337e:	eb 04                	jmp    3384 <strlen+0x13>
    3380:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3384:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3387:	8b 45 08             	mov    0x8(%ebp),%eax
    338a:	01 d0                	add    %edx,%eax
    338c:	0f b6 00             	movzbl (%eax),%eax
    338f:	84 c0                	test   %al,%al
    3391:	75 ed                	jne    3380 <strlen+0xf>
    ;
  return n;
    3393:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3396:	c9                   	leave  
    3397:	c3                   	ret    

00003398 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3398:	55                   	push   %ebp
    3399:	89 e5                	mov    %esp,%ebp
    339b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    339e:	8b 45 10             	mov    0x10(%ebp),%eax
    33a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    33a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    33a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    33ac:	8b 45 08             	mov    0x8(%ebp),%eax
    33af:	89 04 24             	mov    %eax,(%esp)
    33b2:	e8 26 ff ff ff       	call   32dd <stosb>
  return dst;
    33b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
    33ba:	c9                   	leave  
    33bb:	c3                   	ret    

000033bc <strchr>:

char*
strchr(const char *s, char c)
{
    33bc:	55                   	push   %ebp
    33bd:	89 e5                	mov    %esp,%ebp
    33bf:	83 ec 04             	sub    $0x4,%esp
    33c2:	8b 45 0c             	mov    0xc(%ebp),%eax
    33c5:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    33c8:	eb 14                	jmp    33de <strchr+0x22>
    if(*s == c)
    33ca:	8b 45 08             	mov    0x8(%ebp),%eax
    33cd:	0f b6 00             	movzbl (%eax),%eax
    33d0:	3a 45 fc             	cmp    -0x4(%ebp),%al
    33d3:	75 05                	jne    33da <strchr+0x1e>
      return (char*)s;
    33d5:	8b 45 08             	mov    0x8(%ebp),%eax
    33d8:	eb 13                	jmp    33ed <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    33da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    33de:	8b 45 08             	mov    0x8(%ebp),%eax
    33e1:	0f b6 00             	movzbl (%eax),%eax
    33e4:	84 c0                	test   %al,%al
    33e6:	75 e2                	jne    33ca <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    33e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
    33ed:	c9                   	leave  
    33ee:	c3                   	ret    

000033ef <gets>:

char*
gets(char *buf, int max)
{
    33ef:	55                   	push   %ebp
    33f0:	89 e5                	mov    %esp,%ebp
    33f2:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    33f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    33fc:	eb 4c                	jmp    344a <gets+0x5b>
    cc = read(0, &c, 1);
    33fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3405:	00 
    3406:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3409:	89 44 24 04          	mov    %eax,0x4(%esp)
    340d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3414:	e8 44 01 00 00       	call   355d <read>
    3419:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    341c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3420:	7f 02                	jg     3424 <gets+0x35>
      break;
    3422:	eb 31                	jmp    3455 <gets+0x66>
    buf[i++] = c;
    3424:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3427:	8d 50 01             	lea    0x1(%eax),%edx
    342a:	89 55 f4             	mov    %edx,-0xc(%ebp)
    342d:	89 c2                	mov    %eax,%edx
    342f:	8b 45 08             	mov    0x8(%ebp),%eax
    3432:	01 c2                	add    %eax,%edx
    3434:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3438:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    343a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    343e:	3c 0a                	cmp    $0xa,%al
    3440:	74 13                	je     3455 <gets+0x66>
    3442:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3446:	3c 0d                	cmp    $0xd,%al
    3448:	74 0b                	je     3455 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    344a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    344d:	83 c0 01             	add    $0x1,%eax
    3450:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3453:	7c a9                	jl     33fe <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3455:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3458:	8b 45 08             	mov    0x8(%ebp),%eax
    345b:	01 d0                	add    %edx,%eax
    345d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3460:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3463:	c9                   	leave  
    3464:	c3                   	ret    

00003465 <stat>:

int
stat(char *n, struct stat *st)
{
    3465:	55                   	push   %ebp
    3466:	89 e5                	mov    %esp,%ebp
    3468:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    346b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3472:	00 
    3473:	8b 45 08             	mov    0x8(%ebp),%eax
    3476:	89 04 24             	mov    %eax,(%esp)
    3479:	e8 07 01 00 00       	call   3585 <open>
    347e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3481:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3485:	79 07                	jns    348e <stat+0x29>
    return -1;
    3487:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    348c:	eb 23                	jmp    34b1 <stat+0x4c>
  r = fstat(fd, st);
    348e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3491:	89 44 24 04          	mov    %eax,0x4(%esp)
    3495:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3498:	89 04 24             	mov    %eax,(%esp)
    349b:	e8 fd 00 00 00       	call   359d <fstat>
    34a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    34a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34a6:	89 04 24             	mov    %eax,(%esp)
    34a9:	e8 bf 00 00 00       	call   356d <close>
  return r;
    34ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    34b1:	c9                   	leave  
    34b2:	c3                   	ret    

000034b3 <atoi>:

int
atoi(const char *s)
{
    34b3:	55                   	push   %ebp
    34b4:	89 e5                	mov    %esp,%ebp
    34b6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    34b9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    34c0:	eb 25                	jmp    34e7 <atoi+0x34>
    n = n*10 + *s++ - '0';
    34c2:	8b 55 fc             	mov    -0x4(%ebp),%edx
    34c5:	89 d0                	mov    %edx,%eax
    34c7:	c1 e0 02             	shl    $0x2,%eax
    34ca:	01 d0                	add    %edx,%eax
    34cc:	01 c0                	add    %eax,%eax
    34ce:	89 c1                	mov    %eax,%ecx
    34d0:	8b 45 08             	mov    0x8(%ebp),%eax
    34d3:	8d 50 01             	lea    0x1(%eax),%edx
    34d6:	89 55 08             	mov    %edx,0x8(%ebp)
    34d9:	0f b6 00             	movzbl (%eax),%eax
    34dc:	0f be c0             	movsbl %al,%eax
    34df:	01 c8                	add    %ecx,%eax
    34e1:	83 e8 30             	sub    $0x30,%eax
    34e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    34e7:	8b 45 08             	mov    0x8(%ebp),%eax
    34ea:	0f b6 00             	movzbl (%eax),%eax
    34ed:	3c 2f                	cmp    $0x2f,%al
    34ef:	7e 0a                	jle    34fb <atoi+0x48>
    34f1:	8b 45 08             	mov    0x8(%ebp),%eax
    34f4:	0f b6 00             	movzbl (%eax),%eax
    34f7:	3c 39                	cmp    $0x39,%al
    34f9:	7e c7                	jle    34c2 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    34fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    34fe:	c9                   	leave  
    34ff:	c3                   	ret    

00003500 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3500:	55                   	push   %ebp
    3501:	89 e5                	mov    %esp,%ebp
    3503:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3506:	8b 45 08             	mov    0x8(%ebp),%eax
    3509:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    350c:	8b 45 0c             	mov    0xc(%ebp),%eax
    350f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3512:	eb 17                	jmp    352b <memmove+0x2b>
    *dst++ = *src++;
    3514:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3517:	8d 50 01             	lea    0x1(%eax),%edx
    351a:	89 55 fc             	mov    %edx,-0x4(%ebp)
    351d:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3520:	8d 4a 01             	lea    0x1(%edx),%ecx
    3523:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3526:	0f b6 12             	movzbl (%edx),%edx
    3529:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    352b:	8b 45 10             	mov    0x10(%ebp),%eax
    352e:	8d 50 ff             	lea    -0x1(%eax),%edx
    3531:	89 55 10             	mov    %edx,0x10(%ebp)
    3534:	85 c0                	test   %eax,%eax
    3536:	7f dc                	jg     3514 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3538:	8b 45 08             	mov    0x8(%ebp),%eax
}
    353b:	c9                   	leave  
    353c:	c3                   	ret    

0000353d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    353d:	b8 01 00 00 00       	mov    $0x1,%eax
    3542:	cd 40                	int    $0x40
    3544:	c3                   	ret    

00003545 <exit>:
SYSCALL(exit)
    3545:	b8 02 00 00 00       	mov    $0x2,%eax
    354a:	cd 40                	int    $0x40
    354c:	c3                   	ret    

0000354d <wait>:
SYSCALL(wait)
    354d:	b8 03 00 00 00       	mov    $0x3,%eax
    3552:	cd 40                	int    $0x40
    3554:	c3                   	ret    

00003555 <pipe>:
SYSCALL(pipe)
    3555:	b8 04 00 00 00       	mov    $0x4,%eax
    355a:	cd 40                	int    $0x40
    355c:	c3                   	ret    

0000355d <read>:
SYSCALL(read)
    355d:	b8 05 00 00 00       	mov    $0x5,%eax
    3562:	cd 40                	int    $0x40
    3564:	c3                   	ret    

00003565 <write>:
SYSCALL(write)
    3565:	b8 10 00 00 00       	mov    $0x10,%eax
    356a:	cd 40                	int    $0x40
    356c:	c3                   	ret    

0000356d <close>:
SYSCALL(close)
    356d:	b8 15 00 00 00       	mov    $0x15,%eax
    3572:	cd 40                	int    $0x40
    3574:	c3                   	ret    

00003575 <kill>:
SYSCALL(kill)
    3575:	b8 06 00 00 00       	mov    $0x6,%eax
    357a:	cd 40                	int    $0x40
    357c:	c3                   	ret    

0000357d <exec>:
SYSCALL(exec)
    357d:	b8 07 00 00 00       	mov    $0x7,%eax
    3582:	cd 40                	int    $0x40
    3584:	c3                   	ret    

00003585 <open>:
SYSCALL(open)
    3585:	b8 0f 00 00 00       	mov    $0xf,%eax
    358a:	cd 40                	int    $0x40
    358c:	c3                   	ret    

0000358d <mknod>:
SYSCALL(mknod)
    358d:	b8 11 00 00 00       	mov    $0x11,%eax
    3592:	cd 40                	int    $0x40
    3594:	c3                   	ret    

00003595 <unlink>:
SYSCALL(unlink)
    3595:	b8 12 00 00 00       	mov    $0x12,%eax
    359a:	cd 40                	int    $0x40
    359c:	c3                   	ret    

0000359d <fstat>:
SYSCALL(fstat)
    359d:	b8 08 00 00 00       	mov    $0x8,%eax
    35a2:	cd 40                	int    $0x40
    35a4:	c3                   	ret    

000035a5 <link>:
SYSCALL(link)
    35a5:	b8 13 00 00 00       	mov    $0x13,%eax
    35aa:	cd 40                	int    $0x40
    35ac:	c3                   	ret    

000035ad <mkdir>:
SYSCALL(mkdir)
    35ad:	b8 14 00 00 00       	mov    $0x14,%eax
    35b2:	cd 40                	int    $0x40
    35b4:	c3                   	ret    

000035b5 <chdir>:
SYSCALL(chdir)
    35b5:	b8 09 00 00 00       	mov    $0x9,%eax
    35ba:	cd 40                	int    $0x40
    35bc:	c3                   	ret    

000035bd <dup>:
SYSCALL(dup)
    35bd:	b8 0a 00 00 00       	mov    $0xa,%eax
    35c2:	cd 40                	int    $0x40
    35c4:	c3                   	ret    

000035c5 <getpid>:
SYSCALL(getpid)
    35c5:	b8 0b 00 00 00       	mov    $0xb,%eax
    35ca:	cd 40                	int    $0x40
    35cc:	c3                   	ret    

000035cd <sbrk>:
SYSCALL(sbrk)
    35cd:	b8 0c 00 00 00       	mov    $0xc,%eax
    35d2:	cd 40                	int    $0x40
    35d4:	c3                   	ret    

000035d5 <sleep>:
SYSCALL(sleep)
    35d5:	b8 0d 00 00 00       	mov    $0xd,%eax
    35da:	cd 40                	int    $0x40
    35dc:	c3                   	ret    

000035dd <uptime>:
SYSCALL(uptime)
    35dd:	b8 0e 00 00 00       	mov    $0xe,%eax
    35e2:	cd 40                	int    $0x40
    35e4:	c3                   	ret    

000035e5 <getMsg>:
SYSCALL(getMsg)
    35e5:	b8 16 00 00 00       	mov    $0x16,%eax
    35ea:	cd 40                	int    $0x40
    35ec:	c3                   	ret    

000035ed <createWindow>:
SYSCALL(createWindow)
    35ed:	b8 17 00 00 00       	mov    $0x17,%eax
    35f2:	cd 40                	int    $0x40
    35f4:	c3                   	ret    

000035f5 <destroyWindow>:
SYSCALL(destroyWindow)
    35f5:	b8 18 00 00 00       	mov    $0x18,%eax
    35fa:	cd 40                	int    $0x40
    35fc:	c3                   	ret    

000035fd <updateWindow>:
SYSCALL(updateWindow)
    35fd:	b8 19 00 00 00       	mov    $0x19,%eax
    3602:	cd 40                	int    $0x40
    3604:	c3                   	ret    

00003605 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3605:	b8 1a 00 00 00       	mov    $0x1a,%eax
    360a:	cd 40                	int    $0x40
    360c:	c3                   	ret    

0000360d <kwrite>:
SYSCALL(kwrite)
    360d:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3612:	cd 40                	int    $0x40
    3614:	c3                   	ret    

00003615 <setSampleRate>:
SYSCALL(setSampleRate)
    3615:	b8 1b 00 00 00       	mov    $0x1b,%eax
    361a:	cd 40                	int    $0x40
    361c:	c3                   	ret    

0000361d <pause>:
SYSCALL(pause)
    361d:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3622:	cd 40                	int    $0x40
    3624:	c3                   	ret    

00003625 <wavdecode>:
SYSCALL(wavdecode)
    3625:	b8 1e 00 00 00       	mov    $0x1e,%eax
    362a:	cd 40                	int    $0x40
    362c:	c3                   	ret    

0000362d <beginDecode>:
SYSCALL(beginDecode)
    362d:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3632:	cd 40                	int    $0x40
    3634:	c3                   	ret    

00003635 <waitForDecode>:
SYSCALL(waitForDecode)
    3635:	b8 20 00 00 00       	mov    $0x20,%eax
    363a:	cd 40                	int    $0x40
    363c:	c3                   	ret    

0000363d <endDecode>:
SYSCALL(endDecode)
    363d:	b8 21 00 00 00       	mov    $0x21,%eax
    3642:	cd 40                	int    $0x40
    3644:	c3                   	ret    

00003645 <getCoreBuf>:
    3645:	b8 22 00 00 00       	mov    $0x22,%eax
    364a:	cd 40                	int    $0x40
    364c:	c3                   	ret    

0000364d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    364d:	55                   	push   %ebp
    364e:	89 e5                	mov    %esp,%ebp
    3650:	83 ec 18             	sub    $0x18,%esp
    3653:	8b 45 0c             	mov    0xc(%ebp),%eax
    3656:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3659:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3660:	00 
    3661:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3664:	89 44 24 04          	mov    %eax,0x4(%esp)
    3668:	8b 45 08             	mov    0x8(%ebp),%eax
    366b:	89 04 24             	mov    %eax,(%esp)
    366e:	e8 f2 fe ff ff       	call   3565 <write>
}
    3673:	c9                   	leave  
    3674:	c3                   	ret    

00003675 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3675:	55                   	push   %ebp
    3676:	89 e5                	mov    %esp,%ebp
    3678:	56                   	push   %esi
    3679:	53                   	push   %ebx
    367a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    367d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3684:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3688:	74 17                	je     36a1 <printint+0x2c>
    368a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    368e:	79 11                	jns    36a1 <printint+0x2c>
    neg = 1;
    3690:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3697:	8b 45 0c             	mov    0xc(%ebp),%eax
    369a:	f7 d8                	neg    %eax
    369c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    369f:	eb 06                	jmp    36a7 <printint+0x32>
  } else {
    x = xx;
    36a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    36a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    36a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    36ae:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    36b1:	8d 41 01             	lea    0x1(%ecx),%eax
    36b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    36b7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    36ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36bd:	ba 00 00 00 00       	mov    $0x0,%edx
    36c2:	f7 f3                	div    %ebx
    36c4:	89 d0                	mov    %edx,%eax
    36c6:	0f b6 80 f0 da 00 00 	movzbl 0xdaf0(%eax),%eax
    36cd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    36d1:	8b 75 10             	mov    0x10(%ebp),%esi
    36d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    36d7:	ba 00 00 00 00       	mov    $0x0,%edx
    36dc:	f7 f6                	div    %esi
    36de:	89 45 ec             	mov    %eax,-0x14(%ebp)
    36e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    36e5:	75 c7                	jne    36ae <printint+0x39>
  if(neg)
    36e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    36eb:	74 10                	je     36fd <printint+0x88>
    buf[i++] = '-';
    36ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36f0:	8d 50 01             	lea    0x1(%eax),%edx
    36f3:	89 55 f4             	mov    %edx,-0xc(%ebp)
    36f6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    36fb:	eb 1f                	jmp    371c <printint+0xa7>
    36fd:	eb 1d                	jmp    371c <printint+0xa7>
    putc(fd, buf[i]);
    36ff:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3702:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3705:	01 d0                	add    %edx,%eax
    3707:	0f b6 00             	movzbl (%eax),%eax
    370a:	0f be c0             	movsbl %al,%eax
    370d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3711:	8b 45 08             	mov    0x8(%ebp),%eax
    3714:	89 04 24             	mov    %eax,(%esp)
    3717:	e8 31 ff ff ff       	call   364d <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    371c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3720:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3724:	79 d9                	jns    36ff <printint+0x8a>
    putc(fd, buf[i]);
}
    3726:	83 c4 30             	add    $0x30,%esp
    3729:	5b                   	pop    %ebx
    372a:	5e                   	pop    %esi
    372b:	5d                   	pop    %ebp
    372c:	c3                   	ret    

0000372d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    372d:	55                   	push   %ebp
    372e:	89 e5                	mov    %esp,%ebp
    3730:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3733:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    373a:	8d 45 0c             	lea    0xc(%ebp),%eax
    373d:	83 c0 04             	add    $0x4,%eax
    3740:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3743:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    374a:	e9 7c 01 00 00       	jmp    38cb <printf+0x19e>
    c = fmt[i] & 0xff;
    374f:	8b 55 0c             	mov    0xc(%ebp),%edx
    3752:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3755:	01 d0                	add    %edx,%eax
    3757:	0f b6 00             	movzbl (%eax),%eax
    375a:	0f be c0             	movsbl %al,%eax
    375d:	25 ff 00 00 00       	and    $0xff,%eax
    3762:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3765:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3769:	75 2c                	jne    3797 <printf+0x6a>
      if(c == '%'){
    376b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    376f:	75 0c                	jne    377d <printf+0x50>
        state = '%';
    3771:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3778:	e9 4a 01 00 00       	jmp    38c7 <printf+0x19a>
      } else {
        putc(fd, c);
    377d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3780:	0f be c0             	movsbl %al,%eax
    3783:	89 44 24 04          	mov    %eax,0x4(%esp)
    3787:	8b 45 08             	mov    0x8(%ebp),%eax
    378a:	89 04 24             	mov    %eax,(%esp)
    378d:	e8 bb fe ff ff       	call   364d <putc>
    3792:	e9 30 01 00 00       	jmp    38c7 <printf+0x19a>
      }
    } else if(state == '%'){
    3797:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    379b:	0f 85 26 01 00 00    	jne    38c7 <printf+0x19a>
      if(c == 'd'){
    37a1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    37a5:	75 2d                	jne    37d4 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    37a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    37aa:	8b 00                	mov    (%eax),%eax
    37ac:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    37b3:	00 
    37b4:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    37bb:	00 
    37bc:	89 44 24 04          	mov    %eax,0x4(%esp)
    37c0:	8b 45 08             	mov    0x8(%ebp),%eax
    37c3:	89 04 24             	mov    %eax,(%esp)
    37c6:	e8 aa fe ff ff       	call   3675 <printint>
        ap++;
    37cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    37cf:	e9 ec 00 00 00       	jmp    38c0 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    37d4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    37d8:	74 06                	je     37e0 <printf+0xb3>
    37da:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    37de:	75 2d                	jne    380d <printf+0xe0>
        printint(fd, *ap, 16, 0);
    37e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    37e3:	8b 00                	mov    (%eax),%eax
    37e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    37ec:	00 
    37ed:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    37f4:	00 
    37f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    37f9:	8b 45 08             	mov    0x8(%ebp),%eax
    37fc:	89 04 24             	mov    %eax,(%esp)
    37ff:	e8 71 fe ff ff       	call   3675 <printint>
        ap++;
    3804:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3808:	e9 b3 00 00 00       	jmp    38c0 <printf+0x193>
      } else if(c == 's'){
    380d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3811:	75 45                	jne    3858 <printf+0x12b>
        s = (char*)*ap;
    3813:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3816:	8b 00                	mov    (%eax),%eax
    3818:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    381b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    381f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3823:	75 09                	jne    382e <printf+0x101>
          s = "(null)";
    3825:	c7 45 f4 03 a2 00 00 	movl   $0xa203,-0xc(%ebp)
        while(*s != 0){
    382c:	eb 1e                	jmp    384c <printf+0x11f>
    382e:	eb 1c                	jmp    384c <printf+0x11f>
          putc(fd, *s);
    3830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3833:	0f b6 00             	movzbl (%eax),%eax
    3836:	0f be c0             	movsbl %al,%eax
    3839:	89 44 24 04          	mov    %eax,0x4(%esp)
    383d:	8b 45 08             	mov    0x8(%ebp),%eax
    3840:	89 04 24             	mov    %eax,(%esp)
    3843:	e8 05 fe ff ff       	call   364d <putc>
          s++;
    3848:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    384c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    384f:	0f b6 00             	movzbl (%eax),%eax
    3852:	84 c0                	test   %al,%al
    3854:	75 da                	jne    3830 <printf+0x103>
    3856:	eb 68                	jmp    38c0 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3858:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    385c:	75 1d                	jne    387b <printf+0x14e>
        putc(fd, *ap);
    385e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3861:	8b 00                	mov    (%eax),%eax
    3863:	0f be c0             	movsbl %al,%eax
    3866:	89 44 24 04          	mov    %eax,0x4(%esp)
    386a:	8b 45 08             	mov    0x8(%ebp),%eax
    386d:	89 04 24             	mov    %eax,(%esp)
    3870:	e8 d8 fd ff ff       	call   364d <putc>
        ap++;
    3875:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3879:	eb 45                	jmp    38c0 <printf+0x193>
      } else if(c == '%'){
    387b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    387f:	75 17                	jne    3898 <printf+0x16b>
        putc(fd, c);
    3881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3884:	0f be c0             	movsbl %al,%eax
    3887:	89 44 24 04          	mov    %eax,0x4(%esp)
    388b:	8b 45 08             	mov    0x8(%ebp),%eax
    388e:	89 04 24             	mov    %eax,(%esp)
    3891:	e8 b7 fd ff ff       	call   364d <putc>
    3896:	eb 28                	jmp    38c0 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3898:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    389f:	00 
    38a0:	8b 45 08             	mov    0x8(%ebp),%eax
    38a3:	89 04 24             	mov    %eax,(%esp)
    38a6:	e8 a2 fd ff ff       	call   364d <putc>
        putc(fd, c);
    38ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38ae:	0f be c0             	movsbl %al,%eax
    38b1:	89 44 24 04          	mov    %eax,0x4(%esp)
    38b5:	8b 45 08             	mov    0x8(%ebp),%eax
    38b8:	89 04 24             	mov    %eax,(%esp)
    38bb:	e8 8d fd ff ff       	call   364d <putc>
      }
      state = 0;
    38c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    38c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    38cb:	8b 55 0c             	mov    0xc(%ebp),%edx
    38ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    38d1:	01 d0                	add    %edx,%eax
    38d3:	0f b6 00             	movzbl (%eax),%eax
    38d6:	84 c0                	test   %al,%al
    38d8:	0f 85 71 fe ff ff    	jne    374f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    38de:	c9                   	leave  
    38df:	c3                   	ret    

000038e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    38e0:	55                   	push   %ebp
    38e1:	89 e5                	mov    %esp,%ebp
    38e3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    38e6:	8b 45 08             	mov    0x8(%ebp),%eax
    38e9:	83 e8 08             	sub    $0x8,%eax
    38ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    38ef:	a1 18 e0 00 00       	mov    0xe018,%eax
    38f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    38f7:	eb 24                	jmp    391d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    38f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    38fc:	8b 00                	mov    (%eax),%eax
    38fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3901:	77 12                	ja     3915 <free+0x35>
    3903:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3906:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3909:	77 24                	ja     392f <free+0x4f>
    390b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    390e:	8b 00                	mov    (%eax),%eax
    3910:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3913:	77 1a                	ja     392f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3915:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3918:	8b 00                	mov    (%eax),%eax
    391a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    391d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3920:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3923:	76 d4                	jbe    38f9 <free+0x19>
    3925:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3928:	8b 00                	mov    (%eax),%eax
    392a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    392d:	76 ca                	jbe    38f9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    392f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3932:	8b 40 04             	mov    0x4(%eax),%eax
    3935:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    393c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    393f:	01 c2                	add    %eax,%edx
    3941:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3944:	8b 00                	mov    (%eax),%eax
    3946:	39 c2                	cmp    %eax,%edx
    3948:	75 24                	jne    396e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    394a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    394d:	8b 50 04             	mov    0x4(%eax),%edx
    3950:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3953:	8b 00                	mov    (%eax),%eax
    3955:	8b 40 04             	mov    0x4(%eax),%eax
    3958:	01 c2                	add    %eax,%edx
    395a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    395d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3960:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3963:	8b 00                	mov    (%eax),%eax
    3965:	8b 10                	mov    (%eax),%edx
    3967:	8b 45 f8             	mov    -0x8(%ebp),%eax
    396a:	89 10                	mov    %edx,(%eax)
    396c:	eb 0a                	jmp    3978 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    396e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3971:	8b 10                	mov    (%eax),%edx
    3973:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3976:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    3978:	8b 45 fc             	mov    -0x4(%ebp),%eax
    397b:	8b 40 04             	mov    0x4(%eax),%eax
    397e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3985:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3988:	01 d0                	add    %edx,%eax
    398a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    398d:	75 20                	jne    39af <free+0xcf>
    p->s.size += bp->s.size;
    398f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3992:	8b 50 04             	mov    0x4(%eax),%edx
    3995:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3998:	8b 40 04             	mov    0x4(%eax),%eax
    399b:	01 c2                	add    %eax,%edx
    399d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39a0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    39a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    39a6:	8b 10                	mov    (%eax),%edx
    39a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39ab:	89 10                	mov    %edx,(%eax)
    39ad:	eb 08                	jmp    39b7 <free+0xd7>
  } else
    p->s.ptr = bp;
    39af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
    39b5:	89 10                	mov    %edx,(%eax)
  freep = p;
    39b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    39ba:	a3 18 e0 00 00       	mov    %eax,0xe018
}
    39bf:	c9                   	leave  
    39c0:	c3                   	ret    

000039c1 <morecore>:

static Header*
morecore(uint nu)
{
    39c1:	55                   	push   %ebp
    39c2:	89 e5                	mov    %esp,%ebp
    39c4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    39c7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    39ce:	77 07                	ja     39d7 <morecore+0x16>
    nu = 4096;
    39d0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    39d7:	8b 45 08             	mov    0x8(%ebp),%eax
    39da:	c1 e0 03             	shl    $0x3,%eax
    39dd:	89 04 24             	mov    %eax,(%esp)
    39e0:	e8 e8 fb ff ff       	call   35cd <sbrk>
    39e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    39e8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    39ec:	75 07                	jne    39f5 <morecore+0x34>
    return 0;
    39ee:	b8 00 00 00 00       	mov    $0x0,%eax
    39f3:	eb 22                	jmp    3a17 <morecore+0x56>
  hp = (Header*)p;
    39f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    39fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    39fe:	8b 55 08             	mov    0x8(%ebp),%edx
    3a01:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    3a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a07:	83 c0 08             	add    $0x8,%eax
    3a0a:	89 04 24             	mov    %eax,(%esp)
    3a0d:	e8 ce fe ff ff       	call   38e0 <free>
  return freep;
    3a12:	a1 18 e0 00 00       	mov    0xe018,%eax
}
    3a17:	c9                   	leave  
    3a18:	c3                   	ret    

00003a19 <malloc>:

void*
malloc(uint nbytes)
{
    3a19:	55                   	push   %ebp
    3a1a:	89 e5                	mov    %esp,%ebp
    3a1c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3a1f:	8b 45 08             	mov    0x8(%ebp),%eax
    3a22:	83 c0 07             	add    $0x7,%eax
    3a25:	c1 e8 03             	shr    $0x3,%eax
    3a28:	83 c0 01             	add    $0x1,%eax
    3a2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    3a2e:	a1 18 e0 00 00       	mov    0xe018,%eax
    3a33:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3a36:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3a3a:	75 23                	jne    3a5f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    3a3c:	c7 45 f0 10 e0 00 00 	movl   $0xe010,-0x10(%ebp)
    3a43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a46:	a3 18 e0 00 00       	mov    %eax,0xe018
    3a4b:	a1 18 e0 00 00       	mov    0xe018,%eax
    3a50:	a3 10 e0 00 00       	mov    %eax,0xe010
    base.s.size = 0;
    3a55:	c7 05 14 e0 00 00 00 	movl   $0x0,0xe014
    3a5c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3a5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a62:	8b 00                	mov    (%eax),%eax
    3a64:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    3a67:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a6a:	8b 40 04             	mov    0x4(%eax),%eax
    3a6d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3a70:	72 4d                	jb     3abf <malloc+0xa6>
      if(p->s.size == nunits)
    3a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a75:	8b 40 04             	mov    0x4(%eax),%eax
    3a78:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    3a7b:	75 0c                	jne    3a89 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    3a7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a80:	8b 10                	mov    (%eax),%edx
    3a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a85:	89 10                	mov    %edx,(%eax)
    3a87:	eb 26                	jmp    3aaf <malloc+0x96>
      else {
        p->s.size -= nunits;
    3a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a8c:	8b 40 04             	mov    0x4(%eax),%eax
    3a8f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3a92:	89 c2                	mov    %eax,%edx
    3a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a97:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    3a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3a9d:	8b 40 04             	mov    0x4(%eax),%eax
    3aa0:	c1 e0 03             	shl    $0x3,%eax
    3aa3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    3aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aa9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3aac:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    3aaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ab2:	a3 18 e0 00 00       	mov    %eax,0xe018
      return (void*)(p + 1);
    3ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aba:	83 c0 08             	add    $0x8,%eax
    3abd:	eb 38                	jmp    3af7 <malloc+0xde>
    }
    if(p == freep)
    3abf:	a1 18 e0 00 00       	mov    0xe018,%eax
    3ac4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    3ac7:	75 1b                	jne    3ae4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    3ac9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3acc:	89 04 24             	mov    %eax,(%esp)
    3acf:	e8 ed fe ff ff       	call   39c1 <morecore>
    3ad4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3ad7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3adb:	75 07                	jne    3ae4 <malloc+0xcb>
        return 0;
    3add:	b8 00 00 00 00       	mov    $0x0,%eax
    3ae2:	eb 13                	jmp    3af7 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3aed:	8b 00                	mov    (%eax),%eax
    3aef:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    3af2:	e9 70 ff ff ff       	jmp    3a67 <malloc+0x4e>
}
    3af7:	c9                   	leave  
    3af8:	c3                   	ret    

00003af9 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    3af9:	55                   	push   %ebp
    3afa:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    3afc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3b00:	79 07                	jns    3b09 <abs+0x10>
		return x * -1;
    3b02:	8b 45 08             	mov    0x8(%ebp),%eax
    3b05:	f7 d8                	neg    %eax
    3b07:	eb 03                	jmp    3b0c <abs+0x13>
	else
		return x;
    3b09:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b0c:	5d                   	pop    %ebp
    3b0d:	c3                   	ret    

00003b0e <sin>:
double sin(double x)  
{  
    3b0e:	55                   	push   %ebp
    3b0f:	89 e5                	mov    %esp,%ebp
    3b11:	83 ec 3c             	sub    $0x3c,%esp
    3b14:	8b 45 08             	mov    0x8(%ebp),%eax
    3b17:	89 45 c8             	mov    %eax,-0x38(%ebp)
    3b1a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b1d:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    3b20:	dd 45 c8             	fldl   -0x38(%ebp)
    3b23:	dd 5d f8             	fstpl  -0x8(%ebp)
    3b26:	d9 e8                	fld1   
    3b28:	dd 5d f0             	fstpl  -0x10(%ebp)
    3b2b:	dd 45 c8             	fldl   -0x38(%ebp)
    3b2e:	dd 5d e8             	fstpl  -0x18(%ebp)
    3b31:	dd 45 c8             	fldl   -0x38(%ebp)
    3b34:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    3b37:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    3b3e:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    3b45:	eb 50                	jmp    3b97 <sin+0x89>
	{  
		n = n+1;  
    3b47:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    3b4b:	db 45 dc             	fildl  -0x24(%ebp)
    3b4e:	dc 4d f0             	fmull  -0x10(%ebp)
    3b51:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3b54:	83 c0 01             	add    $0x1,%eax
    3b57:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3b5a:	db 45 c4             	fildl  -0x3c(%ebp)
    3b5d:	de c9                	fmulp  %st,%st(1)
    3b5f:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    3b62:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    3b66:	dd 45 c8             	fldl   -0x38(%ebp)
    3b69:	dc 4d c8             	fmull  -0x38(%ebp)
    3b6c:	dd 45 e8             	fldl   -0x18(%ebp)
    3b6f:	de c9                	fmulp  %st,%st(1)
    3b71:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    3b74:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    3b77:	dd 45 e8             	fldl   -0x18(%ebp)
    3b7a:	dc 75 f0             	fdivl  -0x10(%ebp)
    3b7d:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    3b80:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    3b84:	7e 08                	jle    3b8e <sin+0x80>
    3b86:	dd 45 f8             	fldl   -0x8(%ebp)
    3b89:	dc 45 e0             	faddl  -0x20(%ebp)
    3b8c:	eb 06                	jmp    3b94 <sin+0x86>
    3b8e:	dd 45 f8             	fldl   -0x8(%ebp)
    3b91:	dc 65 e0             	fsubl  -0x20(%ebp)
    3b94:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    3b97:	dd 45 e0             	fldl   -0x20(%ebp)
    3b9a:	dd 05 10 a2 00 00    	fldl   0xa210
    3ba0:	d9 c9                	fxch   %st(1)
    3ba2:	df e9                	fucomip %st(1),%st
    3ba4:	dd d8                	fstp   %st(0)
    3ba6:	77 9f                	ja     3b47 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    3ba8:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    3bab:	c9                   	leave  
    3bac:	c3                   	ret    

00003bad <cos>:
double cos(double x)  
{  
    3bad:	55                   	push   %ebp
    3bae:	89 e5                	mov    %esp,%ebp
    3bb0:	83 ec 10             	sub    $0x10,%esp
    3bb3:	8b 45 08             	mov    0x8(%ebp),%eax
    3bb6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3bb9:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bbc:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    3bbf:	dd 05 18 a2 00 00    	fldl   0xa218
    3bc5:	dc 65 f8             	fsubl  -0x8(%ebp)
    3bc8:	dd 1c 24             	fstpl  (%esp)
    3bcb:	e8 3e ff ff ff       	call   3b0e <sin>
}  
    3bd0:	c9                   	leave  
    3bd1:	c3                   	ret    

00003bd2 <tan>:
double tan(double x)  
{  
    3bd2:	55                   	push   %ebp
    3bd3:	89 e5                	mov    %esp,%ebp
    3bd5:	83 ec 18             	sub    $0x18,%esp
    3bd8:	8b 45 08             	mov    0x8(%ebp),%eax
    3bdb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3bde:	8b 45 0c             	mov    0xc(%ebp),%eax
    3be1:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    3be4:	dd 45 f8             	fldl   -0x8(%ebp)
    3be7:	dd 1c 24             	fstpl  (%esp)
    3bea:	e8 1f ff ff ff       	call   3b0e <sin>
    3bef:	dd 5d f0             	fstpl  -0x10(%ebp)
    3bf2:	dd 45 f8             	fldl   -0x8(%ebp)
    3bf5:	dd 1c 24             	fstpl  (%esp)
    3bf8:	e8 b0 ff ff ff       	call   3bad <cos>
    3bfd:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    3c00:	c9                   	leave  
    3c01:	c3                   	ret    

00003c02 <pow>:

double pow(double x, double y)
{
    3c02:	55                   	push   %ebp
    3c03:	89 e5                	mov    %esp,%ebp
    3c05:	83 ec 48             	sub    $0x48,%esp
    3c08:	8b 45 08             	mov    0x8(%ebp),%eax
    3c0b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    3c0e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3c14:	8b 45 10             	mov    0x10(%ebp),%eax
    3c17:	89 45 d8             	mov    %eax,-0x28(%ebp)
    3c1a:	8b 45 14             	mov    0x14(%ebp),%eax
    3c1d:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    3c20:	dd 45 e0             	fldl   -0x20(%ebp)
    3c23:	d9 ee                	fldz   
    3c25:	df e9                	fucomip %st(1),%st
    3c27:	dd d8                	fstp   %st(0)
    3c29:	7a 28                	jp     3c53 <pow+0x51>
    3c2b:	dd 45 e0             	fldl   -0x20(%ebp)
    3c2e:	d9 ee                	fldz   
    3c30:	df e9                	fucomip %st(1),%st
    3c32:	dd d8                	fstp   %st(0)
    3c34:	75 1d                	jne    3c53 <pow+0x51>
    3c36:	dd 45 d8             	fldl   -0x28(%ebp)
    3c39:	d9 ee                	fldz   
    3c3b:	df e9                	fucomip %st(1),%st
    3c3d:	dd d8                	fstp   %st(0)
    3c3f:	7a 0b                	jp     3c4c <pow+0x4a>
    3c41:	dd 45 d8             	fldl   -0x28(%ebp)
    3c44:	d9 ee                	fldz   
    3c46:	df e9                	fucomip %st(1),%st
    3c48:	dd d8                	fstp   %st(0)
    3c4a:	74 07                	je     3c53 <pow+0x51>
    3c4c:	d9 ee                	fldz   
    3c4e:	e9 30 01 00 00       	jmp    3d83 <pow+0x181>
	else if(x==0 && y==0) return 1;
    3c53:	dd 45 e0             	fldl   -0x20(%ebp)
    3c56:	d9 ee                	fldz   
    3c58:	df e9                	fucomip %st(1),%st
    3c5a:	dd d8                	fstp   %st(0)
    3c5c:	7a 28                	jp     3c86 <pow+0x84>
    3c5e:	dd 45 e0             	fldl   -0x20(%ebp)
    3c61:	d9 ee                	fldz   
    3c63:	df e9                	fucomip %st(1),%st
    3c65:	dd d8                	fstp   %st(0)
    3c67:	75 1d                	jne    3c86 <pow+0x84>
    3c69:	dd 45 d8             	fldl   -0x28(%ebp)
    3c6c:	d9 ee                	fldz   
    3c6e:	df e9                	fucomip %st(1),%st
    3c70:	dd d8                	fstp   %st(0)
    3c72:	7a 12                	jp     3c86 <pow+0x84>
    3c74:	dd 45 d8             	fldl   -0x28(%ebp)
    3c77:	d9 ee                	fldz   
    3c79:	df e9                	fucomip %st(1),%st
    3c7b:	dd d8                	fstp   %st(0)
    3c7d:	75 07                	jne    3c86 <pow+0x84>
    3c7f:	d9 e8                	fld1   
    3c81:	e9 fd 00 00 00       	jmp    3d83 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    3c86:	d9 ee                	fldz   
    3c88:	dd 45 d8             	fldl   -0x28(%ebp)
    3c8b:	d9 c9                	fxch   %st(1)
    3c8d:	df e9                	fucomip %st(1),%st
    3c8f:	dd d8                	fstp   %st(0)
    3c91:	76 1d                	jbe    3cb0 <pow+0xae>
    3c93:	dd 45 d8             	fldl   -0x28(%ebp)
    3c96:	d9 e0                	fchs   
    3c98:	dd 5c 24 08          	fstpl  0x8(%esp)
    3c9c:	dd 45 e0             	fldl   -0x20(%ebp)
    3c9f:	dd 1c 24             	fstpl  (%esp)
    3ca2:	e8 5b ff ff ff       	call   3c02 <pow>
    3ca7:	d9 e8                	fld1   
    3ca9:	de f1                	fdivp  %st,%st(1)
    3cab:	e9 d3 00 00 00       	jmp    3d83 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    3cb0:	d9 ee                	fldz   
    3cb2:	dd 45 e0             	fldl   -0x20(%ebp)
    3cb5:	d9 c9                	fxch   %st(1)
    3cb7:	df e9                	fucomip %st(1),%st
    3cb9:	dd d8                	fstp   %st(0)
    3cbb:	76 40                	jbe    3cfd <pow+0xfb>
    3cbd:	dd 45 d8             	fldl   -0x28(%ebp)
    3cc0:	d9 7d d6             	fnstcw -0x2a(%ebp)
    3cc3:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    3cc7:	b4 0c                	mov    $0xc,%ah
    3cc9:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    3ccd:	d9 6d d4             	fldcw  -0x2c(%ebp)
    3cd0:	db 5d d0             	fistpl -0x30(%ebp)
    3cd3:	d9 6d d6             	fldcw  -0x2a(%ebp)
    3cd6:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3cd9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3cdc:	db 45 d0             	fildl  -0x30(%ebp)
    3cdf:	dd 45 d8             	fldl   -0x28(%ebp)
    3ce2:	de e1                	fsubp  %st,%st(1)
    3ce4:	d9 ee                	fldz   
    3ce6:	df e9                	fucomip %st(1),%st
    3ce8:	7a 0a                	jp     3cf4 <pow+0xf2>
    3cea:	d9 ee                	fldz   
    3cec:	df e9                	fucomip %st(1),%st
    3cee:	dd d8                	fstp   %st(0)
    3cf0:	74 0b                	je     3cfd <pow+0xfb>
    3cf2:	eb 02                	jmp    3cf6 <pow+0xf4>
    3cf4:	dd d8                	fstp   %st(0)
    3cf6:	d9 ee                	fldz   
    3cf8:	e9 86 00 00 00       	jmp    3d83 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    3cfd:	d9 ee                	fldz   
    3cff:	dd 45 e0             	fldl   -0x20(%ebp)
    3d02:	d9 c9                	fxch   %st(1)
    3d04:	df e9                	fucomip %st(1),%st
    3d06:	dd d8                	fstp   %st(0)
    3d08:	76 63                	jbe    3d6d <pow+0x16b>
    3d0a:	dd 45 d8             	fldl   -0x28(%ebp)
    3d0d:	d9 7d d6             	fnstcw -0x2a(%ebp)
    3d10:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    3d14:	b4 0c                	mov    $0xc,%ah
    3d16:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    3d1a:	d9 6d d4             	fldcw  -0x2c(%ebp)
    3d1d:	db 5d d0             	fistpl -0x30(%ebp)
    3d20:	d9 6d d6             	fldcw  -0x2a(%ebp)
    3d23:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3d26:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3d29:	db 45 d0             	fildl  -0x30(%ebp)
    3d2c:	dd 45 d8             	fldl   -0x28(%ebp)
    3d2f:	de e1                	fsubp  %st,%st(1)
    3d31:	d9 ee                	fldz   
    3d33:	df e9                	fucomip %st(1),%st
    3d35:	7a 34                	jp     3d6b <pow+0x169>
    3d37:	d9 ee                	fldz   
    3d39:	df e9                	fucomip %st(1),%st
    3d3b:	dd d8                	fstp   %st(0)
    3d3d:	75 2e                	jne    3d6d <pow+0x16b>
	{
		double powint=1;
    3d3f:	d9 e8                	fld1   
    3d41:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    3d44:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    3d4b:	eb 0d                	jmp    3d5a <pow+0x158>
    3d4d:	dd 45 f0             	fldl   -0x10(%ebp)
    3d50:	dc 4d e0             	fmull  -0x20(%ebp)
    3d53:	dd 5d f0             	fstpl  -0x10(%ebp)
    3d56:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    3d5a:	db 45 ec             	fildl  -0x14(%ebp)
    3d5d:	dd 45 d8             	fldl   -0x28(%ebp)
    3d60:	df e9                	fucomip %st(1),%st
    3d62:	dd d8                	fstp   %st(0)
    3d64:	73 e7                	jae    3d4d <pow+0x14b>
		return powint;
    3d66:	dd 45 f0             	fldl   -0x10(%ebp)
    3d69:	eb 18                	jmp    3d83 <pow+0x181>
    3d6b:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    3d6d:	dd 45 e0             	fldl   -0x20(%ebp)
    3d70:	dd 1c 24             	fstpl  (%esp)
    3d73:	e8 36 00 00 00       	call   3dae <ln>
    3d78:	dc 4d d8             	fmull  -0x28(%ebp)
    3d7b:	dd 1c 24             	fstpl  (%esp)
    3d7e:	e8 0e 02 00 00       	call   3f91 <exp>
}
    3d83:	c9                   	leave  
    3d84:	c3                   	ret    

00003d85 <sqrt>:
// 求根
double sqrt(double x)
{
    3d85:	55                   	push   %ebp
    3d86:	89 e5                	mov    %esp,%ebp
    3d88:	83 ec 28             	sub    $0x28,%esp
    3d8b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3d91:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d94:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    3d97:	dd 05 20 a2 00 00    	fldl   0xa220
    3d9d:	dd 5c 24 08          	fstpl  0x8(%esp)
    3da1:	dd 45 f0             	fldl   -0x10(%ebp)
    3da4:	dd 1c 24             	fstpl  (%esp)
    3da7:	e8 56 fe ff ff       	call   3c02 <pow>
}
    3dac:	c9                   	leave  
    3dad:	c3                   	ret    

00003dae <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    3dae:	55                   	push   %ebp
    3daf:	89 e5                	mov    %esp,%ebp
    3db1:	81 ec 88 00 00 00    	sub    $0x88,%esp
    3db7:	8b 45 08             	mov    0x8(%ebp),%eax
    3dba:	89 45 90             	mov    %eax,-0x70(%ebp)
    3dbd:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dc0:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    3dc3:	dd 45 90             	fldl   -0x70(%ebp)
    3dc6:	d9 e8                	fld1   
    3dc8:	de e9                	fsubrp %st,%st(1)
    3dca:	dd 5d c0             	fstpl  -0x40(%ebp)
    3dcd:	d9 ee                	fldz   
    3dcf:	dd 5d f0             	fstpl  -0x10(%ebp)
    3dd2:	d9 ee                	fldz   
    3dd4:	dd 5d b8             	fstpl  -0x48(%ebp)
    3dd7:	d9 ee                	fldz   
    3dd9:	dd 5d b0             	fstpl  -0x50(%ebp)
    3ddc:	d9 ee                	fldz   
    3dde:	dd 5d e8             	fstpl  -0x18(%ebp)
    3de1:	d9 e8                	fld1   
    3de3:	dd 5d e0             	fstpl  -0x20(%ebp)
    3de6:	d9 e8                	fld1   
    3de8:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    3deb:	dd 45 90             	fldl   -0x70(%ebp)
    3dee:	d9 e8                	fld1   
    3df0:	df e9                	fucomip %st(1),%st
    3df2:	dd d8                	fstp   %st(0)
    3df4:	7a 12                	jp     3e08 <ln+0x5a>
    3df6:	dd 45 90             	fldl   -0x70(%ebp)
    3df9:	d9 e8                	fld1   
    3dfb:	df e9                	fucomip %st(1),%st
    3dfd:	dd d8                	fstp   %st(0)
    3dff:	75 07                	jne    3e08 <ln+0x5a>
    3e01:	d9 ee                	fldz   
    3e03:	e9 87 01 00 00       	jmp    3f8f <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    3e08:	dd 45 90             	fldl   -0x70(%ebp)
    3e0b:	dd 05 28 a2 00 00    	fldl   0xa228
    3e11:	d9 c9                	fxch   %st(1)
    3e13:	df e9                	fucomip %st(1),%st
    3e15:	dd d8                	fstp   %st(0)
    3e17:	76 14                	jbe    3e2d <ln+0x7f>
    3e19:	d9 e8                	fld1   
    3e1b:	dc 75 90             	fdivl  -0x70(%ebp)
    3e1e:	dd 1c 24             	fstpl  (%esp)
    3e21:	e8 88 ff ff ff       	call   3dae <ln>
    3e26:	d9 e0                	fchs   
    3e28:	e9 62 01 00 00       	jmp    3f8f <ln+0x1e1>
	else if(x<.1)
    3e2d:	dd 05 30 a2 00 00    	fldl   0xa230
    3e33:	dd 45 90             	fldl   -0x70(%ebp)
    3e36:	d9 c9                	fxch   %st(1)
    3e38:	df e9                	fucomip %st(1),%st
    3e3a:	dd d8                	fstp   %st(0)
    3e3c:	76 59                	jbe    3e97 <ln+0xe9>
	{
		double n=-1;
    3e3e:	d9 e8                	fld1   
    3e40:	d9 e0                	fchs   
    3e42:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    3e45:	dd 45 c8             	fldl   -0x38(%ebp)
    3e48:	dd 05 38 a2 00 00    	fldl   0xa238
    3e4e:	de e9                	fsubrp %st,%st(1)
    3e50:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    3e53:	dd 45 c8             	fldl   -0x38(%ebp)
    3e56:	dd 1c 24             	fstpl  (%esp)
    3e59:	e8 33 01 00 00       	call   3f91 <exp>
    3e5e:	dd 45 90             	fldl   -0x70(%ebp)
    3e61:	de f1                	fdivp  %st,%st(1)
    3e63:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    3e66:	dd 45 a0             	fldl   -0x60(%ebp)
    3e69:	dd 05 28 a2 00 00    	fldl   0xa228
    3e6f:	d9 c9                	fxch   %st(1)
    3e71:	df e9                	fucomip %st(1),%st
    3e73:	dd d8                	fstp   %st(0)
    3e75:	77 ce                	ja     3e45 <ln+0x97>
    3e77:	d9 e8                	fld1   
    3e79:	dd 45 a0             	fldl   -0x60(%ebp)
    3e7c:	d9 c9                	fxch   %st(1)
    3e7e:	df e9                	fucomip %st(1),%st
    3e80:	dd d8                	fstp   %st(0)
    3e82:	77 c1                	ja     3e45 <ln+0x97>
		return ln(a)+n;
    3e84:	dd 45 a0             	fldl   -0x60(%ebp)
    3e87:	dd 1c 24             	fstpl  (%esp)
    3e8a:	e8 1f ff ff ff       	call   3dae <ln>
    3e8f:	dc 45 c8             	faddl  -0x38(%ebp)
    3e92:	e9 f8 00 00 00       	jmp    3f8f <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    3e97:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    3e9e:	d9 e8                	fld1   
    3ea0:	dd 5d d8             	fstpl  -0x28(%ebp)
    3ea3:	e9 b6 00 00 00       	jmp    3f5e <ln+0x1b0>
	{
		ln_tmp=ln_px;
    3ea8:	dd 45 e8             	fldl   -0x18(%ebp)
    3eab:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    3eae:	dd 45 d8             	fldl   -0x28(%ebp)
    3eb1:	dc 4d c0             	fmull  -0x40(%ebp)
    3eb4:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    3eb7:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    3ebb:	75 0d                	jne    3eca <ln+0x11c>
    3ebd:	db 45 d4             	fildl  -0x2c(%ebp)
    3ec0:	dd 45 d8             	fldl   -0x28(%ebp)
    3ec3:	de f1                	fdivp  %st,%st(1)
    3ec5:	dd 5d d8             	fstpl  -0x28(%ebp)
    3ec8:	eb 13                	jmp    3edd <ln+0x12f>
		else tmp=tmp/-l;
    3eca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3ecd:	f7 d8                	neg    %eax
    3ecf:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3ed2:	db 45 8c             	fildl  -0x74(%ebp)
    3ed5:	dd 45 d8             	fldl   -0x28(%ebp)
    3ed8:	de f1                	fdivp  %st,%st(1)
    3eda:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    3edd:	dd 45 f0             	fldl   -0x10(%ebp)
    3ee0:	dc 45 d8             	faddl  -0x28(%ebp)
    3ee3:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    3ee6:	dd 45 d8             	fldl   -0x28(%ebp)
    3ee9:	d9 e0                	fchs   
    3eeb:	dc 4d c0             	fmull  -0x40(%ebp)
    3eee:	db 45 d4             	fildl  -0x2c(%ebp)
    3ef1:	de c9                	fmulp  %st,%st(1)
    3ef3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3ef6:	83 c0 01             	add    $0x1,%eax
    3ef9:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3efc:	db 45 8c             	fildl  -0x74(%ebp)
    3eff:	de f9                	fdivrp %st,%st(1)
    3f01:	dc 45 f0             	faddl  -0x10(%ebp)
    3f04:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    3f07:	dd 45 d8             	fldl   -0x28(%ebp)
    3f0a:	dc 4d c0             	fmull  -0x40(%ebp)
    3f0d:	dc 4d c0             	fmull  -0x40(%ebp)
    3f10:	db 45 d4             	fildl  -0x2c(%ebp)
    3f13:	de c9                	fmulp  %st,%st(1)
    3f15:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3f18:	83 c0 02             	add    $0x2,%eax
    3f1b:	89 45 8c             	mov    %eax,-0x74(%ebp)
    3f1e:	db 45 8c             	fildl  -0x74(%ebp)
    3f21:	de f9                	fdivrp %st,%st(1)
    3f23:	dc 45 b8             	faddl  -0x48(%ebp)
    3f26:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    3f29:	dd 45 b0             	fldl   -0x50(%ebp)
    3f2c:	dc 65 b8             	fsubl  -0x48(%ebp)
    3f2f:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    3f32:	dd 45 a8             	fldl   -0x58(%ebp)
    3f35:	dc 4d a8             	fmull  -0x58(%ebp)
    3f38:	dd 45 b8             	fldl   -0x48(%ebp)
    3f3b:	d8 c0                	fadd   %st(0),%st
    3f3d:	dd 45 b0             	fldl   -0x50(%ebp)
    3f40:	de e1                	fsubp  %st,%st(1)
    3f42:	dc 45 f0             	faddl  -0x10(%ebp)
    3f45:	de f9                	fdivrp %st,%st(1)
    3f47:	dd 45 b0             	fldl   -0x50(%ebp)
    3f4a:	de e1                	fsubp  %st,%st(1)
    3f4c:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    3f4f:	db 45 d4             	fildl  -0x2c(%ebp)
    3f52:	dd 45 d8             	fldl   -0x28(%ebp)
    3f55:	de c9                	fmulp  %st,%st(1)
    3f57:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    3f5a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    3f5e:	dd 45 e8             	fldl   -0x18(%ebp)
    3f61:	dc 65 e0             	fsubl  -0x20(%ebp)
    3f64:	dd 05 40 a2 00 00    	fldl   0xa240
    3f6a:	d9 c9                	fxch   %st(1)
    3f6c:	df e9                	fucomip %st(1),%st
    3f6e:	dd d8                	fstp   %st(0)
    3f70:	0f 87 32 ff ff ff    	ja     3ea8 <ln+0xfa>
    3f76:	dd 45 e8             	fldl   -0x18(%ebp)
    3f79:	dc 65 e0             	fsubl  -0x20(%ebp)
    3f7c:	dd 05 48 a2 00 00    	fldl   0xa248
    3f82:	df e9                	fucomip %st(1),%st
    3f84:	dd d8                	fstp   %st(0)
    3f86:	0f 87 1c ff ff ff    	ja     3ea8 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    3f8c:	dd 45 e8             	fldl   -0x18(%ebp)
}
    3f8f:	c9                   	leave  
    3f90:	c3                   	ret    

00003f91 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    3f91:	55                   	push   %ebp
    3f92:	89 e5                	mov    %esp,%ebp
    3f94:	83 ec 78             	sub    $0x78,%esp
    3f97:	8b 45 08             	mov    0x8(%ebp),%eax
    3f9a:	89 45 a0             	mov    %eax,-0x60(%ebp)
    3f9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fa0:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    3fa3:	dd 45 a0             	fldl   -0x60(%ebp)
    3fa6:	dd 5d c0             	fstpl  -0x40(%ebp)
    3fa9:	d9 ee                	fldz   
    3fab:	dd 5d f0             	fstpl  -0x10(%ebp)
    3fae:	d9 ee                	fldz   
    3fb0:	dd 5d b8             	fstpl  -0x48(%ebp)
    3fb3:	d9 ee                	fldz   
    3fb5:	dd 5d b0             	fstpl  -0x50(%ebp)
    3fb8:	d9 ee                	fldz   
    3fba:	dd 5d e8             	fstpl  -0x18(%ebp)
    3fbd:	d9 e8                	fld1   
    3fbf:	dd 5d e0             	fstpl  -0x20(%ebp)
    3fc2:	d9 e8                	fld1   
    3fc4:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    3fc7:	dd 45 a0             	fldl   -0x60(%ebp)
    3fca:	d9 ee                	fldz   
    3fcc:	df e9                	fucomip %st(1),%st
    3fce:	dd d8                	fstp   %st(0)
    3fd0:	7a 12                	jp     3fe4 <exp+0x53>
    3fd2:	dd 45 a0             	fldl   -0x60(%ebp)
    3fd5:	d9 ee                	fldz   
    3fd7:	df e9                	fucomip %st(1),%st
    3fd9:	dd d8                	fstp   %st(0)
    3fdb:	75 07                	jne    3fe4 <exp+0x53>
    3fdd:	d9 e8                	fld1   
    3fdf:	e9 08 01 00 00       	jmp    40ec <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    3fe4:	d9 ee                	fldz   
    3fe6:	dd 45 a0             	fldl   -0x60(%ebp)
    3fe9:	d9 c9                	fxch   %st(1)
    3feb:	df e9                	fucomip %st(1),%st
    3fed:	dd d8                	fstp   %st(0)
    3fef:	76 16                	jbe    4007 <exp+0x76>
    3ff1:	dd 45 a0             	fldl   -0x60(%ebp)
    3ff4:	d9 e0                	fchs   
    3ff6:	dd 1c 24             	fstpl  (%esp)
    3ff9:	e8 93 ff ff ff       	call   3f91 <exp>
    3ffe:	d9 e8                	fld1   
    4000:	de f1                	fdivp  %st,%st(1)
    4002:	e9 e5 00 00 00       	jmp    40ec <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4007:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    400e:	d9 e8                	fld1   
    4010:	dd 5d d0             	fstpl  -0x30(%ebp)
    4013:	e9 92 00 00 00       	jmp    40aa <exp+0x119>
	{
		ex_tmp=ex_px;
    4018:	dd 45 e8             	fldl   -0x18(%ebp)
    401b:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    401e:	dd 45 d0             	fldl   -0x30(%ebp)
    4021:	dc 4d c0             	fmull  -0x40(%ebp)
    4024:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4027:	db 45 cc             	fildl  -0x34(%ebp)
    402a:	dd 45 d0             	fldl   -0x30(%ebp)
    402d:	de f1                	fdivp  %st,%st(1)
    402f:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4032:	dd 45 f0             	fldl   -0x10(%ebp)
    4035:	dc 45 d0             	faddl  -0x30(%ebp)
    4038:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    403b:	dd 45 d0             	fldl   -0x30(%ebp)
    403e:	dc 4d c0             	fmull  -0x40(%ebp)
    4041:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4044:	83 c0 01             	add    $0x1,%eax
    4047:	89 45 9c             	mov    %eax,-0x64(%ebp)
    404a:	db 45 9c             	fildl  -0x64(%ebp)
    404d:	de f9                	fdivrp %st,%st(1)
    404f:	dc 45 f0             	faddl  -0x10(%ebp)
    4052:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    4055:	dd 45 d0             	fldl   -0x30(%ebp)
    4058:	dc 4d c0             	fmull  -0x40(%ebp)
    405b:	dc 4d c0             	fmull  -0x40(%ebp)
    405e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4061:	83 c0 01             	add    $0x1,%eax
    4064:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4067:	db 45 9c             	fildl  -0x64(%ebp)
    406a:	de f9                	fdivrp %st,%st(1)
    406c:	8b 45 cc             	mov    -0x34(%ebp),%eax
    406f:	83 c0 02             	add    $0x2,%eax
    4072:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4075:	db 45 9c             	fildl  -0x64(%ebp)
    4078:	de f9                	fdivrp %st,%st(1)
    407a:	dc 45 b8             	faddl  -0x48(%ebp)
    407d:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    4080:	dd 45 b0             	fldl   -0x50(%ebp)
    4083:	dc 65 b8             	fsubl  -0x48(%ebp)
    4086:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    4089:	dd 45 d8             	fldl   -0x28(%ebp)
    408c:	dc 4d d8             	fmull  -0x28(%ebp)
    408f:	dd 45 b8             	fldl   -0x48(%ebp)
    4092:	d8 c0                	fadd   %st(0),%st
    4094:	dd 45 b0             	fldl   -0x50(%ebp)
    4097:	de e1                	fsubp  %st,%st(1)
    4099:	dc 45 f0             	faddl  -0x10(%ebp)
    409c:	de f9                	fdivrp %st,%st(1)
    409e:	dd 45 b0             	fldl   -0x50(%ebp)
    40a1:	de e1                	fsubp  %st,%st(1)
    40a3:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    40a6:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    40aa:	dd 45 e8             	fldl   -0x18(%ebp)
    40ad:	dc 65 e0             	fsubl  -0x20(%ebp)
    40b0:	dd 05 50 a2 00 00    	fldl   0xa250
    40b6:	d9 c9                	fxch   %st(1)
    40b8:	df e9                	fucomip %st(1),%st
    40ba:	dd d8                	fstp   %st(0)
    40bc:	77 12                	ja     40d0 <exp+0x13f>
    40be:	dd 45 e8             	fldl   -0x18(%ebp)
    40c1:	dc 65 e0             	fsubl  -0x20(%ebp)
    40c4:	dd 05 58 a2 00 00    	fldl   0xa258
    40ca:	df e9                	fucomip %st(1),%st
    40cc:	dd d8                	fstp   %st(0)
    40ce:	76 15                	jbe    40e5 <exp+0x154>
    40d0:	dd 45 d8             	fldl   -0x28(%ebp)
    40d3:	dd 05 50 a2 00 00    	fldl   0xa250
    40d9:	d9 c9                	fxch   %st(1)
    40db:	df e9                	fucomip %st(1),%st
    40dd:	dd d8                	fstp   %st(0)
    40df:	0f 87 33 ff ff ff    	ja     4018 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    40e5:	dd 45 e8             	fldl   -0x18(%ebp)
    40e8:	d9 e8                	fld1   
    40ea:	de c1                	faddp  %st,%st(1)
    40ec:	c9                   	leave  
    40ed:	c3                   	ret    

000040ee <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    40ee:	55                   	push   %ebp
    40ef:	89 e5                	mov    %esp,%ebp
    40f1:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    40f4:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    40f8:	8b 45 08             	mov    0x8(%ebp),%eax
    40fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    40ff:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4102:	89 04 24             	mov    %eax,(%esp)
    4105:	e8 f8 f1 ff ff       	call   3302 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    410a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    4111:	00 
    4112:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4115:	89 04 24             	mov    %eax,(%esp)
    4118:	e8 68 f4 ff ff       	call   3585 <open>
    411d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4120:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4124:	75 1b                	jne    4141 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4126:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4129:	89 44 24 08          	mov    %eax,0x8(%esp)
    412d:	c7 44 24 04 8c a2 00 	movl   $0xa28c,0x4(%esp)
    4134:	00 
    4135:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    413c:	e8 ec f5 ff ff       	call   372d <printf>
    }
    return f;
    4141:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4144:	c9                   	leave  
    4145:	c3                   	ret    

00004146 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4146:	55                   	push   %ebp
    4147:	89 e5                	mov    %esp,%ebp
    4149:	57                   	push   %edi
    414a:	56                   	push   %esi
    414b:	53                   	push   %ebx
    414c:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    414f:	8b 45 08             	mov    0x8(%ebp),%eax
    4152:	8b 00                	mov    (%eax),%eax
    4154:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4157:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    415a:	8b 78 14             	mov    0x14(%eax),%edi
    415d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4160:	8b 70 10             	mov    0x10(%eax),%esi
    4163:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4166:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    4169:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    416c:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    416f:	85 c0                	test   %eax,%eax
    4171:	0f 94 c0             	sete   %al
    4174:	0f b6 c8             	movzbl %al,%ecx
    4177:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    417a:	8b 50 04             	mov    0x4(%eax),%edx
    417d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4180:	8b 00                	mov    (%eax),%eax
    4182:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4186:	89 74 24 18          	mov    %esi,0x18(%esp)
    418a:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    418e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4192:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4196:	89 44 24 08          	mov    %eax,0x8(%esp)
    419a:	c7 44 24 04 ac a2 00 	movl   $0xa2ac,0x4(%esp)
    41a1:	00 
    41a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41a9:	e8 7f f5 ff ff       	call   372d <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    41ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41b1:	8b 78 2c             	mov    0x2c(%eax),%edi
    41b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41b7:	8b 70 28             	mov    0x28(%eax),%esi
    41ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41bd:	8b 58 24             	mov    0x24(%eax),%ebx
    41c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41c3:	8b 48 20             	mov    0x20(%eax),%ecx
    41c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41c9:	8b 50 1c             	mov    0x1c(%eax),%edx
    41cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41cf:	8b 40 18             	mov    0x18(%eax),%eax
    41d2:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    41d6:	89 74 24 18          	mov    %esi,0x18(%esp)
    41da:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    41de:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    41e2:	89 54 24 0c          	mov    %edx,0xc(%esp)
    41e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    41ea:	c7 44 24 04 ec a2 00 	movl   $0xa2ec,0x4(%esp)
    41f1:	00 
    41f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41f9:	e8 2f f5 ff ff       	call   372d <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    41fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4201:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4204:	8b 0c 85 20 dc 00 00 	mov    0xdc20(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    420b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    420e:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4211:	dd 04 c5 00 dc 00 00 	fldl   0xdc00(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4218:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    421b:	8b 40 04             	mov    0x4(%eax),%eax
    421e:	8d 50 ff             	lea    -0x1(%eax),%edx
    4221:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4224:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4227:	89 d0                	mov    %edx,%eax
    4229:	c1 e0 04             	shl    $0x4,%eax
    422c:	29 d0                	sub    %edx,%eax
    422e:	01 d8                	add    %ebx,%eax
    4230:	8b 14 85 40 db 00 00 	mov    0xdb40(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4237:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    423a:	8b 40 04             	mov    0x4(%eax),%eax
    423d:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4240:	8b 04 85 20 db 00 00 	mov    0xdb20(,%eax,4),%eax
    4247:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    424b:	dd 5c 24 10          	fstpl  0x10(%esp)
    424f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4253:	89 44 24 08          	mov    %eax,0x8(%esp)
    4257:	c7 44 24 04 14 a3 00 	movl   $0xa314,0x4(%esp)
    425e:	00 
    425f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4266:	e8 c2 f4 ff ff       	call   372d <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    426b:	8b 45 08             	mov    0x8(%ebp),%eax
    426e:	8b 48 08             	mov    0x8(%eax),%ecx
    4271:	8b 45 08             	mov    0x8(%ebp),%eax
    4274:	8b 50 0c             	mov    0xc(%eax),%edx
    4277:	8b 45 08             	mov    0x8(%ebp),%eax
    427a:	8b 40 10             	mov    0x10(%eax),%eax
    427d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4281:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4285:	89 44 24 08          	mov    %eax,0x8(%esp)
    4289:	c7 44 24 04 43 a3 00 	movl   $0xa343,0x4(%esp)
    4290:	00 
    4291:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4298:	e8 90 f4 ff ff       	call   372d <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    429d:	83 c4 3c             	add    $0x3c,%esp
    42a0:	5b                   	pop    %ebx
    42a1:	5e                   	pop    %esi
    42a2:	5f                   	pop    %edi
    42a3:	5d                   	pop    %ebp
    42a4:	c3                   	ret    

000042a5 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    42a5:	55                   	push   %ebp
    42a6:	89 e5                	mov    %esp,%ebp
    42a8:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    42ab:	8b 45 08             	mov    0x8(%ebp),%eax
    42ae:	89 04 24             	mov    %eax,(%esp)
    42b1:	e8 63 f7 ff ff       	call   3a19 <malloc>
    42b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    42b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    42bd:	74 1c                	je     42db <mem_alloc+0x36>
		memset(ptr, 0, block);
    42bf:	8b 45 08             	mov    0x8(%ebp),%eax
    42c2:	89 44 24 08          	mov    %eax,0x8(%esp)
    42c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    42cd:	00 
    42ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42d1:	89 04 24             	mov    %eax,(%esp)
    42d4:	e8 bf f0 ff ff       	call   3398 <memset>
    42d9:	eb 20                	jmp    42fb <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    42db:	8b 45 0c             	mov    0xc(%ebp),%eax
    42de:	89 44 24 08          	mov    %eax,0x8(%esp)
    42e2:	c7 44 24 04 5d a3 00 	movl   $0xa35d,0x4(%esp)
    42e9:	00 
    42ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    42f1:	e8 37 f4 ff ff       	call   372d <printf>
		exit();
    42f6:	e8 4a f2 ff ff       	call   3545 <exit>
	}
	return ptr;
    42fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    42fe:	c9                   	leave  
    42ff:	c3                   	ret    

00004300 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4300:	55                   	push   %ebp
    4301:	89 e5                	mov    %esp,%ebp
    4303:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4306:	8b 45 0c             	mov    0xc(%ebp),%eax
    4309:	c7 44 24 04 74 a3 00 	movl   $0xa374,0x4(%esp)
    4310:	00 
    4311:	89 04 24             	mov    %eax,(%esp)
    4314:	e8 8c ff ff ff       	call   42a5 <mem_alloc>
    4319:	8b 55 08             	mov    0x8(%ebp),%edx
    431c:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    431f:	8b 45 08             	mov    0x8(%ebp),%eax
    4322:	8b 55 0c             	mov    0xc(%ebp),%edx
    4325:	89 50 08             	mov    %edx,0x8(%eax)
}
    4328:	c9                   	leave  
    4329:	c3                   	ret    

0000432a <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    432a:	55                   	push   %ebp
    432b:	89 e5                	mov    %esp,%ebp
    432d:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    4330:	8b 45 08             	mov    0x8(%ebp),%eax
    4333:	8b 40 04             	mov    0x4(%eax),%eax
    4336:	89 04 24             	mov    %eax,(%esp)
    4339:	e8 a2 f5 ff ff       	call   38e0 <free>
}
    433e:	c9                   	leave  
    433f:	c3                   	ret    

00004340 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4340:	55                   	push   %ebp
    4341:	89 e5                	mov    %esp,%ebp
    4343:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4346:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    434d:	00 
    434e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4351:	89 04 24             	mov    %eax,(%esp)
    4354:	e8 2c f2 ff ff       	call   3585 <open>
    4359:	8b 55 08             	mov    0x8(%ebp),%edx
    435c:	89 02                	mov    %eax,(%edx)
    435e:	8b 45 08             	mov    0x8(%ebp),%eax
    4361:	8b 00                	mov    (%eax),%eax
    4363:	83 f8 ff             	cmp    $0xffffffff,%eax
    4366:	75 20                	jne    4388 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4368:	8b 45 0c             	mov    0xc(%ebp),%eax
    436b:	89 44 24 08          	mov    %eax,0x8(%esp)
    436f:	c7 44 24 04 7b a3 00 	movl   $0xa37b,0x4(%esp)
    4376:	00 
    4377:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    437e:	e8 aa f3 ff ff       	call   372d <printf>
		exit();
    4383:	e8 bd f1 ff ff       	call   3545 <exit>
	}

	bs->format = BINARY;
    4388:	8b 45 08             	mov    0x8(%ebp),%eax
    438b:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    438f:	8b 45 10             	mov    0x10(%ebp),%eax
    4392:	89 44 24 04          	mov    %eax,0x4(%esp)
    4396:	8b 45 08             	mov    0x8(%ebp),%eax
    4399:	89 04 24             	mov    %eax,(%esp)
    439c:	e8 5f ff ff ff       	call   4300 <alloc_buffer>
	bs->buf_byte_idx=0;
    43a1:	8b 45 08             	mov    0x8(%ebp),%eax
    43a4:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    43ab:	8b 45 08             	mov    0x8(%ebp),%eax
    43ae:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    43b5:	8b 45 08             	mov    0x8(%ebp),%eax
    43b8:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    43bf:	8b 45 08             	mov    0x8(%ebp),%eax
    43c2:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    43c9:	8b 45 08             	mov    0x8(%ebp),%eax
    43cc:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    43d3:	8b 45 08             	mov    0x8(%ebp),%eax
    43d6:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    43dd:	c9                   	leave  
    43de:	c3                   	ret    

000043df <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    43df:	55                   	push   %ebp
    43e0:	89 e5                	mov    %esp,%ebp
    43e2:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    43e5:	8b 45 08             	mov    0x8(%ebp),%eax
    43e8:	8b 00                	mov    (%eax),%eax
    43ea:	89 04 24             	mov    %eax,(%esp)
    43ed:	e8 7b f1 ff ff       	call   356d <close>
	desalloc_buffer(bs);
    43f2:	8b 45 08             	mov    0x8(%ebp),%eax
    43f5:	89 04 24             	mov    %eax,(%esp)
    43f8:	e8 2d ff ff ff       	call   432a <desalloc_buffer>
}
    43fd:	c9                   	leave  
    43fe:	c3                   	ret    

000043ff <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    43ff:	55                   	push   %ebp
    4400:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    4402:	8b 45 08             	mov    0x8(%ebp),%eax
    4405:	8b 40 20             	mov    0x20(%eax),%eax
}
    4408:	5d                   	pop    %ebp
    4409:	c3                   	ret    

0000440a <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    440a:	55                   	push   %ebp
    440b:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    440d:	8b 45 08             	mov    0x8(%ebp),%eax
    4410:	8b 40 0c             	mov    0xc(%eax),%eax
}
    4413:	5d                   	pop    %ebp
    4414:	c3                   	ret    

00004415 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    4415:	55                   	push   %ebp
    4416:	89 e5                	mov    %esp,%ebp
    4418:	56                   	push   %esi
    4419:	53                   	push   %ebx
    441a:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    441d:	8b 45 08             	mov    0x8(%ebp),%eax
    4420:	8b 40 08             	mov    0x8(%eax),%eax
    4423:	8d 50 fe             	lea    -0x2(%eax),%edx
    4426:	8b 45 08             	mov    0x8(%ebp),%eax
    4429:	8b 40 10             	mov    0x10(%eax),%eax
    442c:	89 d3                	mov    %edx,%ebx
    442e:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    4430:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    4435:	eb 35                	jmp    446c <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4437:	8b 45 08             	mov    0x8(%ebp),%eax
    443a:	8b 50 04             	mov    0x4(%eax),%edx
    443d:	89 d8                	mov    %ebx,%eax
    443f:	8d 58 ff             	lea    -0x1(%eax),%ebx
    4442:	01 c2                	add    %eax,%edx
    4444:	8b 45 08             	mov    0x8(%ebp),%eax
    4447:	8b 00                	mov    (%eax),%eax
    4449:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4450:	00 
    4451:	89 54 24 04          	mov    %edx,0x4(%esp)
    4455:	89 04 24             	mov    %eax,(%esp)
    4458:	e8 00 f1 ff ff       	call   355d <read>
    445d:	89 c6                	mov    %eax,%esi
		if (!n)
    445f:	85 f6                	test   %esi,%esi
    4461:	75 09                	jne    446c <refill_buffer+0x57>
		bs->eob= i+1;
    4463:	8d 53 01             	lea    0x1(%ebx),%edx
    4466:	8b 45 08             	mov    0x8(%ebp),%eax
    4469:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    446c:	85 db                	test   %ebx,%ebx
    446e:	78 0a                	js     447a <refill_buffer+0x65>
    4470:	8b 45 08             	mov    0x8(%ebp),%eax
    4473:	8b 40 1c             	mov    0x1c(%eax),%eax
    4476:	85 c0                	test   %eax,%eax
    4478:	74 bd                	je     4437 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    447a:	83 c4 10             	add    $0x10,%esp
    447d:	5b                   	pop    %ebx
    447e:	5e                   	pop    %esi
    447f:	5d                   	pop    %ebp
    4480:	c3                   	ret    

00004481 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    4481:	55                   	push   %ebp
    4482:	89 e5                	mov    %esp,%ebp
    4484:	53                   	push   %ebx
    4485:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    4488:	8b 45 08             	mov    0x8(%ebp),%eax
    448b:	8b 40 0c             	mov    0xc(%eax),%eax
    448e:	8d 50 01             	lea    0x1(%eax),%edx
    4491:	8b 45 08             	mov    0x8(%ebp),%eax
    4494:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    4497:	8b 45 08             	mov    0x8(%ebp),%eax
    449a:	8b 40 14             	mov    0x14(%eax),%eax
    449d:	85 c0                	test   %eax,%eax
    449f:	0f 85 9f 00 00 00    	jne    4544 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    44a5:	8b 45 08             	mov    0x8(%ebp),%eax
    44a8:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    44af:	8b 45 08             	mov    0x8(%ebp),%eax
    44b2:	8b 40 10             	mov    0x10(%eax),%eax
    44b5:	8d 50 ff             	lea    -0x1(%eax),%edx
    44b8:	8b 45 08             	mov    0x8(%ebp),%eax
    44bb:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    44be:	8b 45 08             	mov    0x8(%ebp),%eax
    44c1:	8b 40 10             	mov    0x10(%eax),%eax
    44c4:	83 f8 03             	cmp    $0x3,%eax
    44c7:	7e 10                	jle    44d9 <get1bit+0x58>
    44c9:	8b 45 08             	mov    0x8(%ebp),%eax
    44cc:	8b 50 10             	mov    0x10(%eax),%edx
    44cf:	8b 45 08             	mov    0x8(%ebp),%eax
    44d2:	8b 40 1c             	mov    0x1c(%eax),%eax
    44d5:	39 c2                	cmp    %eax,%edx
    44d7:	7d 6b                	jge    4544 <get1bit+0xc3>
             if (bs->eob)
    44d9:	8b 45 08             	mov    0x8(%ebp),%eax
    44dc:	8b 40 1c             	mov    0x1c(%eax),%eax
    44df:	85 c0                	test   %eax,%eax
    44e1:	74 0c                	je     44ef <get1bit+0x6e>
                bs->eobs = TRUE;
    44e3:	8b 45 08             	mov    0x8(%ebp),%eax
    44e6:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    44ed:	eb 55                	jmp    4544 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    44ef:	8b 45 08             	mov    0x8(%ebp),%eax
    44f2:	8b 58 10             	mov    0x10(%eax),%ebx
    44f5:	eb 2f                	jmp    4526 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    44f7:	8b 45 08             	mov    0x8(%ebp),%eax
    44fa:	8b 50 04             	mov    0x4(%eax),%edx
    44fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4500:	8b 40 08             	mov    0x8(%eax),%eax
    4503:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4506:	8b 45 08             	mov    0x8(%ebp),%eax
    4509:	8b 40 10             	mov    0x10(%eax),%eax
    450c:	29 c1                	sub    %eax,%ecx
    450e:	89 c8                	mov    %ecx,%eax
    4510:	01 d8                	add    %ebx,%eax
    4512:	01 c2                	add    %eax,%edx
    4514:	8b 45 08             	mov    0x8(%ebp),%eax
    4517:	8b 48 04             	mov    0x4(%eax),%ecx
    451a:	89 d8                	mov    %ebx,%eax
    451c:	01 c8                	add    %ecx,%eax
    451e:	0f b6 00             	movzbl (%eax),%eax
    4521:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4523:	83 eb 01             	sub    $0x1,%ebx
    4526:	85 db                	test   %ebx,%ebx
    4528:	79 cd                	jns    44f7 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    452a:	8b 45 08             	mov    0x8(%ebp),%eax
    452d:	89 04 24             	mov    %eax,(%esp)
    4530:	e8 e0 fe ff ff       	call   4415 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    4535:	8b 45 08             	mov    0x8(%ebp),%eax
    4538:	8b 40 08             	mov    0x8(%eax),%eax
    453b:	8d 50 ff             	lea    -0x1(%eax),%edx
    453e:	8b 45 08             	mov    0x8(%ebp),%eax
    4541:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    4544:	8b 45 08             	mov    0x8(%ebp),%eax
    4547:	8b 50 04             	mov    0x4(%eax),%edx
    454a:	8b 45 08             	mov    0x8(%ebp),%eax
    454d:	8b 40 10             	mov    0x10(%eax),%eax
    4550:	01 d0                	add    %edx,%eax
    4552:	0f b6 00             	movzbl (%eax),%eax
    4555:	0f b6 d0             	movzbl %al,%edx
    4558:	8b 45 08             	mov    0x8(%ebp),%eax
    455b:	8b 40 14             	mov    0x14(%eax),%eax
    455e:	83 e8 01             	sub    $0x1,%eax
    4561:	8b 04 85 40 dc 00 00 	mov    0xdc40(,%eax,4),%eax
    4568:	21 d0                	and    %edx,%eax
    456a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    456d:	8b 45 08             	mov    0x8(%ebp),%eax
    4570:	8b 40 14             	mov    0x14(%eax),%eax
    4573:	83 e8 01             	sub    $0x1,%eax
    4576:	89 c1                	mov    %eax,%ecx
    4578:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    457b:	8b 45 08             	mov    0x8(%ebp),%eax
    457e:	8b 40 14             	mov    0x14(%eax),%eax
    4581:	8d 50 ff             	lea    -0x1(%eax),%edx
    4584:	8b 45 08             	mov    0x8(%ebp),%eax
    4587:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    458a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    458d:	83 c4 24             	add    $0x24,%esp
    4590:	5b                   	pop    %ebx
    4591:	5d                   	pop    %ebp
    4592:	c3                   	ret    

00004593 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    4593:	55                   	push   %ebp
    4594:	89 e5                	mov    %esp,%ebp
    4596:	57                   	push   %edi
    4597:	56                   	push   %esi
    4598:	53                   	push   %ebx
    4599:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    459c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    45a3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    45a6:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    45aa:	7e 1c                	jle    45c8 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    45ac:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    45b3:	00 
    45b4:	c7 44 24 04 94 a3 00 	movl   $0xa394,0x4(%esp)
    45bb:	00 
    45bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    45c3:	e8 65 f1 ff ff       	call   372d <printf>

	bs->totbit += N;
    45c8:	8b 45 08             	mov    0x8(%ebp),%eax
    45cb:	8b 50 0c             	mov    0xc(%eax),%edx
    45ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    45d1:	01 c2                	add    %eax,%edx
    45d3:	8b 45 08             	mov    0x8(%ebp),%eax
    45d6:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    45d9:	e9 0a 01 00 00       	jmp    46e8 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    45de:	8b 45 08             	mov    0x8(%ebp),%eax
    45e1:	8b 40 14             	mov    0x14(%eax),%eax
    45e4:	85 c0                	test   %eax,%eax
    45e6:	0f 85 9f 00 00 00    	jne    468b <getbits+0xf8>
			bs->buf_bit_idx = 8;
    45ec:	8b 45 08             	mov    0x8(%ebp),%eax
    45ef:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    45f6:	8b 45 08             	mov    0x8(%ebp),%eax
    45f9:	8b 40 10             	mov    0x10(%eax),%eax
    45fc:	8d 50 ff             	lea    -0x1(%eax),%edx
    45ff:	8b 45 08             	mov    0x8(%ebp),%eax
    4602:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4605:	8b 45 08             	mov    0x8(%ebp),%eax
    4608:	8b 40 10             	mov    0x10(%eax),%eax
    460b:	83 f8 03             	cmp    $0x3,%eax
    460e:	7e 10                	jle    4620 <getbits+0x8d>
    4610:	8b 45 08             	mov    0x8(%ebp),%eax
    4613:	8b 50 10             	mov    0x10(%eax),%edx
    4616:	8b 45 08             	mov    0x8(%ebp),%eax
    4619:	8b 40 1c             	mov    0x1c(%eax),%eax
    461c:	39 c2                	cmp    %eax,%edx
    461e:	7d 6b                	jge    468b <getbits+0xf8>
				if (bs->eob)
    4620:	8b 45 08             	mov    0x8(%ebp),%eax
    4623:	8b 40 1c             	mov    0x1c(%eax),%eax
    4626:	85 c0                	test   %eax,%eax
    4628:	74 0c                	je     4636 <getbits+0xa3>
					bs->eobs = TRUE;
    462a:	8b 45 08             	mov    0x8(%ebp),%eax
    462d:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4634:	eb 55                	jmp    468b <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4636:	8b 45 08             	mov    0x8(%ebp),%eax
    4639:	8b 70 10             	mov    0x10(%eax),%esi
    463c:	eb 2f                	jmp    466d <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    463e:	8b 45 08             	mov    0x8(%ebp),%eax
    4641:	8b 50 04             	mov    0x4(%eax),%edx
    4644:	8b 45 08             	mov    0x8(%ebp),%eax
    4647:	8b 40 08             	mov    0x8(%eax),%eax
    464a:	8d 48 ff             	lea    -0x1(%eax),%ecx
    464d:	8b 45 08             	mov    0x8(%ebp),%eax
    4650:	8b 40 10             	mov    0x10(%eax),%eax
    4653:	29 c1                	sub    %eax,%ecx
    4655:	89 c8                	mov    %ecx,%eax
    4657:	01 f0                	add    %esi,%eax
    4659:	01 c2                	add    %eax,%edx
    465b:	8b 45 08             	mov    0x8(%ebp),%eax
    465e:	8b 48 04             	mov    0x4(%eax),%ecx
    4661:	89 f0                	mov    %esi,%eax
    4663:	01 c8                	add    %ecx,%eax
    4665:	0f b6 00             	movzbl (%eax),%eax
    4668:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    466a:	83 ee 01             	sub    $0x1,%esi
    466d:	85 f6                	test   %esi,%esi
    466f:	79 cd                	jns    463e <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    4671:	8b 45 08             	mov    0x8(%ebp),%eax
    4674:	89 04 24             	mov    %eax,(%esp)
    4677:	e8 99 fd ff ff       	call   4415 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    467c:	8b 45 08             	mov    0x8(%ebp),%eax
    467f:	8b 40 08             	mov    0x8(%eax),%eax
    4682:	8d 50 ff             	lea    -0x1(%eax),%edx
    4685:	8b 45 08             	mov    0x8(%ebp),%eax
    4688:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    468b:	8b 45 08             	mov    0x8(%ebp),%eax
    468e:	8b 40 14             	mov    0x14(%eax),%eax
    4691:	39 d8                	cmp    %ebx,%eax
    4693:	0f 4f c3             	cmovg  %ebx,%eax
    4696:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    4698:	8b 45 08             	mov    0x8(%ebp),%eax
    469b:	8b 50 04             	mov    0x4(%eax),%edx
    469e:	8b 45 08             	mov    0x8(%ebp),%eax
    46a1:	8b 40 10             	mov    0x10(%eax),%eax
    46a4:	01 d0                	add    %edx,%eax
    46a6:	0f b6 00             	movzbl (%eax),%eax
    46a9:	0f b6 d0             	movzbl %al,%edx
    46ac:	8b 45 08             	mov    0x8(%ebp),%eax
    46af:	8b 40 14             	mov    0x14(%eax),%eax
    46b2:	8b 04 85 60 dc 00 00 	mov    0xdc60(,%eax,4),%eax
    46b9:	89 d7                	mov    %edx,%edi
    46bb:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    46bd:	8b 45 08             	mov    0x8(%ebp),%eax
    46c0:	8b 40 14             	mov    0x14(%eax),%eax
    46c3:	29 f0                	sub    %esi,%eax
    46c5:	89 c1                	mov    %eax,%ecx
    46c7:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    46c9:	89 d8                	mov    %ebx,%eax
    46cb:	29 f0                	sub    %esi,%eax
    46cd:	89 c1                	mov    %eax,%ecx
    46cf:	d3 e7                	shl    %cl,%edi
    46d1:	89 f8                	mov    %edi,%eax
    46d3:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    46d6:	8b 45 08             	mov    0x8(%ebp),%eax
    46d9:	8b 40 14             	mov    0x14(%eax),%eax
    46dc:	29 f0                	sub    %esi,%eax
    46de:	89 c2                	mov    %eax,%edx
    46e0:	8b 45 08             	mov    0x8(%ebp),%eax
    46e3:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    46e6:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    46e8:	85 db                	test   %ebx,%ebx
    46ea:	0f 8f ee fe ff ff    	jg     45de <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    46f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    46f3:	83 c4 2c             	add    $0x2c,%esp
    46f6:	5b                   	pop    %ebx
    46f7:	5e                   	pop    %esi
    46f8:	5f                   	pop    %edi
    46f9:	5d                   	pop    %ebp
    46fa:	c3                   	ret    

000046fb <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    46fb:	55                   	push   %ebp
    46fc:	89 e5                	mov    %esp,%ebp
    46fe:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4701:	db 45 10             	fildl  0x10(%ebp)
    4704:	dd 5c 24 08          	fstpl  0x8(%esp)
    4708:	dd 05 00 a4 00 00    	fldl   0xa400
    470e:	dd 1c 24             	fstpl  (%esp)
    4711:	e8 ec f4 ff ff       	call   3c02 <pow>
    4716:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4719:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    471d:	b4 0c                	mov    $0xc,%ah
    471f:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4723:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4726:	db 5d e0             	fistpl -0x20(%ebp)
    4729:	d9 6d e6             	fldcw  -0x1a(%ebp)
    472c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    472f:	83 e8 01             	sub    $0x1,%eax
    4732:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4735:	8b 45 08             	mov    0x8(%ebp),%eax
    4738:	89 04 24             	mov    %eax,(%esp)
    473b:	e8 ca fc ff ff       	call   440a <sstell>
    4740:	83 e0 07             	and    $0x7,%eax
    4743:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4746:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    474a:	74 17                	je     4763 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    474c:	b8 08 00 00 00       	mov    $0x8,%eax
    4751:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4754:	89 44 24 04          	mov    %eax,0x4(%esp)
    4758:	8b 45 08             	mov    0x8(%ebp),%eax
    475b:	89 04 24             	mov    %eax,(%esp)
    475e:	e8 30 fe ff ff       	call   4593 <getbits>

	val = getbits(bs, N);
    4763:	8b 45 10             	mov    0x10(%ebp),%eax
    4766:	89 44 24 04          	mov    %eax,0x4(%esp)
    476a:	8b 45 08             	mov    0x8(%ebp),%eax
    476d:	89 04 24             	mov    %eax,(%esp)
    4770:	e8 1e fe ff ff       	call   4593 <getbits>
    4775:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4778:	eb 1a                	jmp    4794 <seek_sync+0x99>
		val <<= ALIGNING;
    477a:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    477e:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    4785:	00 
    4786:	8b 45 08             	mov    0x8(%ebp),%eax
    4789:	89 04 24             	mov    %eax,(%esp)
    478c:	e8 02 fe ff ff       	call   4593 <getbits>
    4791:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4794:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4797:	23 45 f4             	and    -0xc(%ebp),%eax
    479a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    479d:	74 0f                	je     47ae <seek_sync+0xb3>
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
    47a2:	89 04 24             	mov    %eax,(%esp)
    47a5:	e8 55 fc ff ff       	call   43ff <end_bs>
    47aa:	85 c0                	test   %eax,%eax
    47ac:	74 cc                	je     477a <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    47ae:	8b 45 08             	mov    0x8(%ebp),%eax
    47b1:	89 04 24             	mov    %eax,(%esp)
    47b4:	e8 46 fc ff ff       	call   43ff <end_bs>
    47b9:	85 c0                	test   %eax,%eax
    47bb:	74 07                	je     47c4 <seek_sync+0xc9>
		return(0);
    47bd:	b8 00 00 00 00       	mov    $0x0,%eax
    47c2:	eb 05                	jmp    47c9 <seek_sync+0xce>
	else
		return(1);
    47c4:	b8 01 00 00 00       	mov    $0x1,%eax
}
    47c9:	c9                   	leave  
    47ca:	c3                   	ret    

000047cb <js_bound>:

int js_bound(int lay, int m_ext)
{
    47cb:	55                   	push   %ebp
    47cc:	89 e5                	mov    %esp,%ebp
    47ce:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    47d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    47d5:	7e 12                	jle    47e9 <js_bound+0x1e>
    47d7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    47db:	7f 0c                	jg     47e9 <js_bound+0x1e>
    47dd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    47e1:	78 06                	js     47e9 <js_bound+0x1e>
    47e3:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    47e7:	7e 27                	jle    4810 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    47e9:	8b 45 0c             	mov    0xc(%ebp),%eax
    47ec:	89 44 24 0c          	mov    %eax,0xc(%esp)
    47f0:	8b 45 08             	mov    0x8(%ebp),%eax
    47f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    47f7:	c7 44 24 04 c8 a3 00 	movl   $0xa3c8,0x4(%esp)
    47fe:	00 
    47ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4806:	e8 22 ef ff ff       	call   372d <printf>
        exit();
    480b:	e8 35 ed ff ff       	call   3545 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4810:	8b 45 08             	mov    0x8(%ebp),%eax
    4813:	83 e8 01             	sub    $0x1,%eax
    4816:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    481d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4820:	01 d0                	add    %edx,%eax
    4822:	8b 04 85 a0 dc 00 00 	mov    0xdca0(,%eax,4),%eax
}
    4829:	c9                   	leave  
    482a:	c3                   	ret    

0000482b <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    482b:	55                   	push   %ebp
    482c:	89 e5                	mov    %esp,%ebp
    482e:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4831:	8b 45 08             	mov    0x8(%ebp),%eax
    4834:	8b 00                	mov    (%eax),%eax
    4836:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4839:	8b 45 f4             	mov    -0xc(%ebp),%eax
    483c:	8b 50 1c             	mov    0x1c(%eax),%edx
    483f:	8b 45 08             	mov    0x8(%ebp),%eax
    4842:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4845:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4848:	8b 40 1c             	mov    0x1c(%eax),%eax
    484b:	83 f8 03             	cmp    $0x3,%eax
    484e:	75 07                	jne    4857 <hdr_to_frps+0x2c>
    4850:	b8 01 00 00 00       	mov    $0x1,%eax
    4855:	eb 05                	jmp    485c <hdr_to_frps+0x31>
    4857:	b8 02 00 00 00       	mov    $0x2,%eax
    485c:	8b 55 08             	mov    0x8(%ebp),%edx
    485f:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    4862:	8b 45 08             	mov    0x8(%ebp),%eax
    4865:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    486c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    486f:	8b 40 1c             	mov    0x1c(%eax),%eax
    4872:	83 f8 01             	cmp    $0x1,%eax
    4875:	75 20                	jne    4897 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4877:	8b 45 f4             	mov    -0xc(%ebp),%eax
    487a:	8b 50 20             	mov    0x20(%eax),%edx
    487d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4880:	8b 40 04             	mov    0x4(%eax),%eax
    4883:	89 54 24 04          	mov    %edx,0x4(%esp)
    4887:	89 04 24             	mov    %eax,(%esp)
    488a:	e8 3c ff ff ff       	call   47cb <js_bound>
    488f:	8b 55 08             	mov    0x8(%ebp),%edx
    4892:	89 42 0c             	mov    %eax,0xc(%edx)
    4895:	eb 0c                	jmp    48a3 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4897:	8b 45 08             	mov    0x8(%ebp),%eax
    489a:	8b 50 10             	mov    0x10(%eax),%edx
    489d:	8b 45 08             	mov    0x8(%ebp),%eax
    48a0:	89 50 0c             	mov    %edx,0xc(%eax)
}
    48a3:	c9                   	leave  
    48a4:	c3                   	ret    

000048a5 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    48a5:	55                   	push   %ebp
    48a6:	89 e5                	mov    %esp,%ebp
    48a8:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    48ab:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    48af:	74 19                	je     48ca <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    48b1:	c7 44 24 04 eb a3 00 	movl   $0xa3eb,0x4(%esp)
    48b8:	00 
    48b9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48c0:	e8 68 ee ff ff       	call   372d <printf>
		exit();
    48c5:	e8 7b ec ff ff       	call   3545 <exit>
	}
	getCoreBuf(1, val);
    48ca:	8b 45 08             	mov    0x8(%ebp),%eax
    48cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    48d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    48d8:	e8 68 ed ff ff       	call   3645 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    48dd:	c9                   	leave  
    48de:	c3                   	ret    

000048df <hsstell>:

unsigned long hsstell()
{
    48df:	55                   	push   %ebp
    48e0:	89 e5                	mov    %esp,%ebp
    48e2:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    48e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    48ec:	00 
    48ed:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    48f4:	e8 4c ed ff ff       	call   3645 <getCoreBuf>
//	return(totbit);
}
    48f9:	c9                   	leave  
    48fa:	c3                   	ret    

000048fb <hgetbits>:

unsigned long hgetbits(int N)
{
    48fb:	55                   	push   %ebp
    48fc:	89 e5                	mov    %esp,%ebp
    48fe:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    4901:	8b 45 08             	mov    0x8(%ebp),%eax
    4904:	89 44 24 04          	mov    %eax,0x4(%esp)
    4908:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    490f:	e8 31 ed ff ff       	call   3645 <getCoreBuf>
}
    4914:	c9                   	leave  
    4915:	c3                   	ret    

00004916 <hget1bit>:


unsigned int hget1bit()
{
    4916:	55                   	push   %ebp
    4917:	89 e5                	mov    %esp,%ebp
    4919:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    491c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4923:	e8 d3 ff ff ff       	call   48fb <hgetbits>
}
    4928:	c9                   	leave  
    4929:	c3                   	ret    

0000492a <rewindNbits>:


void rewindNbits(int N)
{
    492a:	55                   	push   %ebp
    492b:	89 e5                	mov    %esp,%ebp
    492d:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    4930:	8b 45 08             	mov    0x8(%ebp),%eax
    4933:	89 44 24 04          	mov    %eax,0x4(%esp)
    4937:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    493e:	e8 02 ed ff ff       	call   3645 <getCoreBuf>
}
    4943:	c9                   	leave  
    4944:	c3                   	ret    

00004945 <rewindNbytes>:


void rewindNbytes(int N)
{
    4945:	55                   	push   %ebp
    4946:	89 e5                	mov    %esp,%ebp
    4948:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    494b:	8b 45 08             	mov    0x8(%ebp),%eax
    494e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4952:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    4959:	e8 e7 ec ff ff       	call   3645 <getCoreBuf>
}
    495e:	c9                   	leave  
    495f:	c3                   	ret    

00004960 <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    4960:	55                   	push   %ebp
    4961:	89 e5                	mov    %esp,%ebp
    4963:	57                   	push   %edi
    4964:	56                   	push   %esi
    4965:	53                   	push   %ebx
    4966:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    496c:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    4970:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    4974:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    4978:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    497c:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    4980:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    4984:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    4988:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    498c:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    4990:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    4994:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    4998:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    499c:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    49a0:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    49a4:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    49a8:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    49ac:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    49b0:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    49b4:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    49b8:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    49bc:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    49c0:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    49c4:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    49c8:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    49cc:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    49d0:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    49d4:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    49d8:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    49dc:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    49e0:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    49e4:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    49e8:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    49ec:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    49f0:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    49f4:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    49f8:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    49fc:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    4a00:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    4a04:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    4a08:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    4a0c:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    4a10:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    4a14:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    4a18:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    4a1c:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    4a20:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    4a24:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    4a28:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    4a2c:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    4a30:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    4a34:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    4a38:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    4a3c:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    4a40:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    4a44:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    4a48:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    4a4c:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    4a50:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    4a54:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    4a58:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    4a5c:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    4a60:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    4a64:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    4a68:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    4a6c:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    4a70:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    4a74:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    4a78:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    4a7c:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    4a80:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    4a84:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    4a88:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    4a8c:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    4a90:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    4a94:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    4a98:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    4a9c:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    4aa0:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    4aa4:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    4aa8:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    4aac:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    4ab0:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    4ab4:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    4abb:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    4ac2:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    4ac9:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    4ad0:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    4ad7:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    4ade:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    4ae5:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    4aec:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    4af3:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    4afa:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    4b01:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    4b08:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    4b0f:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    4b16:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    4b1d:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    4b24:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    4b2b:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    4b32:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    4b39:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    4b40:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    4b47:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    4b4e:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    4b55:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    4b5c:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    4b63:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    4b6a:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    4b71:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    4b78:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    4b7c:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    4b80:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    4b84:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    4b88:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    4b8c:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    4b90:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    4b94:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    4b98:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    4b9c:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    4ba0:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    4ba4:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    4ba8:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    4bac:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    4bb0:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    4bb4:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    4bb8:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    4bbc:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    4bc0:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    4bc4:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    4bc8:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    4bcc:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    4bd0:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    4bd4:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    4bd8:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    4bdc:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    4be0:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    4be4:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    4be8:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    4bec:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    4bf0:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    4bf4:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    4bf8:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    4bfc:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    4c00:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    4c07:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    4c0e:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    4c15:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    4c1c:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    4c23:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    4c2a:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    4c31:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    4c38:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    4c3f:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    4c46:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    4c4d:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    4c54:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    4c5b:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    4c62:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    4c69:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    4c70:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    4c77:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    4c7e:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    4c85:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    4c8c:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    4c93:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    4c9a:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    4ca1:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    4ca8:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    4caf:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    4cb6:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    4cbd:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    4cc4:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    4ccb:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    4cd2:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    4cd9:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    4ce0:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    4ce7:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    4cee:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    4cf5:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    4cfc:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    4d03:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    4d0a:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    4d11:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    4d18:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    4d1f:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    4d26:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    4d2d:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    4d34:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    4d3b:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    4d42:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    4d49:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    4d50:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    4d57:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    4d5e:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    4d65:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    4d6c:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    4d73:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    4d7a:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    4d81:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    4d88:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    4d8f:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    4d96:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    4d9d:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    4da4:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    4dab:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    4db2:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    4db8:	b8 20 a4 00 00       	mov    $0xa420,%eax
    4dbd:	b9 23 00 00 00       	mov    $0x23,%ecx
    4dc2:	89 d7                	mov    %edx,%edi
    4dc4:	89 c6                	mov    %eax,%esi
    4dc6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4dc8:	89 f0                	mov    %esi,%eax
    4dca:	89 fa                	mov    %edi,%edx
    4dcc:	0f b7 08             	movzwl (%eax),%ecx
    4dcf:	66 89 0a             	mov    %cx,(%edx)
    4dd2:	83 c2 02             	add    $0x2,%edx
    4dd5:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    4dd8:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    4dde:	ba c0 a4 00 00       	mov    $0xa4c0,%edx
    4de3:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    4de8:	89 c1                	mov    %eax,%ecx
    4dea:	83 e1 02             	and    $0x2,%ecx
    4ded:	85 c9                	test   %ecx,%ecx
    4def:	74 0f                	je     4e00 <read_decoder_table+0x4a0>
    4df1:	0f b7 0a             	movzwl (%edx),%ecx
    4df4:	66 89 08             	mov    %cx,(%eax)
    4df7:	83 c0 02             	add    $0x2,%eax
    4dfa:	83 c2 02             	add    $0x2,%edx
    4dfd:	83 eb 02             	sub    $0x2,%ebx
    4e00:	89 d9                	mov    %ebx,%ecx
    4e02:	c1 e9 02             	shr    $0x2,%ecx
    4e05:	89 c7                	mov    %eax,%edi
    4e07:	89 d6                	mov    %edx,%esi
    4e09:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4e0b:	89 f2                	mov    %esi,%edx
    4e0d:	89 f8                	mov    %edi,%eax
    4e0f:	b9 00 00 00 00       	mov    $0x0,%ecx
    4e14:	89 de                	mov    %ebx,%esi
    4e16:	83 e6 02             	and    $0x2,%esi
    4e19:	85 f6                	test   %esi,%esi
    4e1b:	74 0b                	je     4e28 <read_decoder_table+0x4c8>
    4e1d:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4e21:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    4e25:	83 c1 02             	add    $0x2,%ecx
    4e28:	83 e3 01             	and    $0x1,%ebx
    4e2b:	85 db                	test   %ebx,%ebx
    4e2d:	74 07                	je     4e36 <read_decoder_table+0x4d6>
    4e2f:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    4e33:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    4e36:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    4e3c:	b8 60 a5 00 00       	mov    $0xa560,%eax
    4e41:	b9 23 00 00 00       	mov    $0x23,%ecx
    4e46:	89 d7                	mov    %edx,%edi
    4e48:	89 c6                	mov    %eax,%esi
    4e4a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4e4c:	89 f0                	mov    %esi,%eax
    4e4e:	89 fa                	mov    %edi,%edx
    4e50:	0f b7 08             	movzwl (%eax),%ecx
    4e53:	66 89 0a             	mov    %cx,(%edx)
    4e56:	83 c2 02             	add    $0x2,%edx
    4e59:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    4e5c:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    4e62:	ba 00 a6 00 00       	mov    $0xa600,%edx
    4e67:	bb fe 00 00 00       	mov    $0xfe,%ebx
    4e6c:	89 c1                	mov    %eax,%ecx
    4e6e:	83 e1 02             	and    $0x2,%ecx
    4e71:	85 c9                	test   %ecx,%ecx
    4e73:	74 0f                	je     4e84 <read_decoder_table+0x524>
    4e75:	0f b7 0a             	movzwl (%edx),%ecx
    4e78:	66 89 08             	mov    %cx,(%eax)
    4e7b:	83 c0 02             	add    $0x2,%eax
    4e7e:	83 c2 02             	add    $0x2,%edx
    4e81:	83 eb 02             	sub    $0x2,%ebx
    4e84:	89 d9                	mov    %ebx,%ecx
    4e86:	c1 e9 02             	shr    $0x2,%ecx
    4e89:	89 c7                	mov    %eax,%edi
    4e8b:	89 d6                	mov    %edx,%esi
    4e8d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4e8f:	89 f2                	mov    %esi,%edx
    4e91:	89 f8                	mov    %edi,%eax
    4e93:	b9 00 00 00 00       	mov    $0x0,%ecx
    4e98:	89 de                	mov    %ebx,%esi
    4e9a:	83 e6 02             	and    $0x2,%esi
    4e9d:	85 f6                	test   %esi,%esi
    4e9f:	74 0b                	je     4eac <read_decoder_table+0x54c>
    4ea1:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4ea5:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    4ea9:	83 c1 02             	add    $0x2,%ecx
    4eac:	83 e3 01             	and    $0x1,%ebx
    4eaf:	85 db                	test   %ebx,%ebx
    4eb1:	74 07                	je     4eba <read_decoder_table+0x55a>
    4eb3:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    4eb7:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    4eba:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    4ec0:	b8 00 a7 00 00       	mov    $0xa700,%eax
    4ec5:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    4eca:	89 d7                	mov    %edx,%edi
    4ecc:	89 c6                	mov    %eax,%esi
    4ece:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4ed0:	89 f0                	mov    %esi,%eax
    4ed2:	89 fa                	mov    %edi,%edx
    4ed4:	0f b7 08             	movzwl (%eax),%ecx
    4ed7:	66 89 0a             	mov    %cx,(%edx)
    4eda:	83 c2 02             	add    $0x2,%edx
    4edd:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    4ee0:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    4ee6:	ba 00 a8 00 00       	mov    $0xa800,%edx
    4eeb:	bb fe 00 00 00       	mov    $0xfe,%ebx
    4ef0:	89 c1                	mov    %eax,%ecx
    4ef2:	83 e1 02             	and    $0x2,%ecx
    4ef5:	85 c9                	test   %ecx,%ecx
    4ef7:	74 0f                	je     4f08 <read_decoder_table+0x5a8>
    4ef9:	0f b7 0a             	movzwl (%edx),%ecx
    4efc:	66 89 08             	mov    %cx,(%eax)
    4eff:	83 c0 02             	add    $0x2,%eax
    4f02:	83 c2 02             	add    $0x2,%edx
    4f05:	83 eb 02             	sub    $0x2,%ebx
    4f08:	89 d9                	mov    %ebx,%ecx
    4f0a:	c1 e9 02             	shr    $0x2,%ecx
    4f0d:	89 c7                	mov    %eax,%edi
    4f0f:	89 d6                	mov    %edx,%esi
    4f11:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4f13:	89 f2                	mov    %esi,%edx
    4f15:	89 f8                	mov    %edi,%eax
    4f17:	b9 00 00 00 00       	mov    $0x0,%ecx
    4f1c:	89 de                	mov    %ebx,%esi
    4f1e:	83 e6 02             	and    $0x2,%esi
    4f21:	85 f6                	test   %esi,%esi
    4f23:	74 0b                	je     4f30 <read_decoder_table+0x5d0>
    4f25:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4f29:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    4f2d:	83 c1 02             	add    $0x2,%ecx
    4f30:	83 e3 01             	and    $0x1,%ebx
    4f33:	85 db                	test   %ebx,%ebx
    4f35:	74 07                	je     4f3e <read_decoder_table+0x5de>
    4f37:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    4f3b:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    4f3e:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    4f44:	b8 00 a9 00 00       	mov    $0xa900,%eax
    4f49:	b9 ff 00 00 00       	mov    $0xff,%ecx
    4f4e:	89 d7                	mov    %edx,%edi
    4f50:	89 c6                	mov    %eax,%esi
    4f52:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4f54:	89 f0                	mov    %esi,%eax
    4f56:	89 fa                	mov    %edi,%edx
    4f58:	0f b7 08             	movzwl (%eax),%ecx
    4f5b:	66 89 0a             	mov    %cx,(%edx)
    4f5e:	83 c2 02             	add    $0x2,%edx
    4f61:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    4f64:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    4f6a:	ba 00 ad 00 00       	mov    $0xad00,%edx
    4f6f:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    4f74:	89 c1                	mov    %eax,%ecx
    4f76:	83 e1 02             	and    $0x2,%ecx
    4f79:	85 c9                	test   %ecx,%ecx
    4f7b:	74 0f                	je     4f8c <read_decoder_table+0x62c>
    4f7d:	0f b7 0a             	movzwl (%edx),%ecx
    4f80:	66 89 08             	mov    %cx,(%eax)
    4f83:	83 c0 02             	add    $0x2,%eax
    4f86:	83 c2 02             	add    $0x2,%edx
    4f89:	83 eb 02             	sub    $0x2,%ebx
    4f8c:	89 d9                	mov    %ebx,%ecx
    4f8e:	c1 e9 02             	shr    $0x2,%ecx
    4f91:	89 c7                	mov    %eax,%edi
    4f93:	89 d6                	mov    %edx,%esi
    4f95:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4f97:	89 f2                	mov    %esi,%edx
    4f99:	89 f8                	mov    %edi,%eax
    4f9b:	b9 00 00 00 00       	mov    $0x0,%ecx
    4fa0:	89 de                	mov    %ebx,%esi
    4fa2:	83 e6 02             	and    $0x2,%esi
    4fa5:	85 f6                	test   %esi,%esi
    4fa7:	74 0b                	je     4fb4 <read_decoder_table+0x654>
    4fa9:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    4fad:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    4fb1:	83 c1 02             	add    $0x2,%ecx
    4fb4:	83 e3 01             	and    $0x1,%ebx
    4fb7:	85 db                	test   %ebx,%ebx
    4fb9:	74 07                	je     4fc2 <read_decoder_table+0x662>
    4fbb:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    4fbf:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    4fc2:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    4fc8:	b8 00 b1 00 00       	mov    $0xb100,%eax
    4fcd:	b9 ff 00 00 00       	mov    $0xff,%ecx
    4fd2:	89 d7                	mov    %edx,%edi
    4fd4:	89 c6                	mov    %eax,%esi
    4fd6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    4fd8:	89 f0                	mov    %esi,%eax
    4fda:	89 fa                	mov    %edi,%edx
    4fdc:	0f b7 08             	movzwl (%eax),%ecx
    4fdf:	66 89 0a             	mov    %cx,(%edx)
    4fe2:	83 c2 02             	add    $0x2,%edx
    4fe5:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    4fe8:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    4fee:	bb 00 b5 00 00       	mov    $0xb500,%ebx
    4ff3:	b8 00 01 00 00       	mov    $0x100,%eax
    4ff8:	89 d7                	mov    %edx,%edi
    4ffa:	89 de                	mov    %ebx,%esi
    4ffc:	89 c1                	mov    %eax,%ecx
    4ffe:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    5000:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    5007:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    500e:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5015:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    501c:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5023:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    502a:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    5031:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    5038:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    503f:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    5046:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    504d:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    5054:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    505b:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    5062:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    5069:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    5070:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    5077:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    507e:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    5085:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    508c:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    5093:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    509a:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    50a1:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    50a8:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    50af:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    50b6:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    50bd:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    50c4:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    50cb:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    50d2:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    50d9:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    50e0:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    50e7:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    50ee:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    50f5:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    50fc:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5103:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    510a:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    5111:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5118:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    511f:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5126:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    512d:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5134:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    513b:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5142:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5149:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    5150:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    5157:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    515e:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    5165:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    516c:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    5173:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    517a:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    5181:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    5188:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    518f:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    5196:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    519d:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    51a4:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    51ab:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    51b2:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    51b9:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    51c0:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    51c7:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    51ce:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    51d5:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    51dc:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    51e3:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    51ea:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    51f1:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    51f8:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    51ff:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5206:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    520d:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5214:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    521b:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5222:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5229:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    5230:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5237:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    523e:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5245:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    524c:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    5253:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    525a:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    5261:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    5268:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    526f:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    5276:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    527d:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    5284:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    528b:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    5292:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    5299:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    52a0:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    52a7:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    52ae:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    52b5:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    52bc:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    52c3:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    52ca:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    52d1:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    52d8:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    52df:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    52e6:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    52ed:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    52f4:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    52fb:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5302:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5309:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5310:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5317:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    531e:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5325:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    532c:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5333:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    533a:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5341:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5348:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    534f:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5356:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    535d:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5364:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    536b:	30 00 
    536d:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5374:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    537b:	00 00 00 
    537e:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5385:	00 00 00 
    5388:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    538f:	00 00 00 
    5392:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5399:	00 00 00 
    539c:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    53a3:	ff ff ff 
    53a6:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    53ad:	00 00 00 
    53b0:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    53b7:	00 00 00 
    53ba:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    53c1:	00 00 00 
    53c4:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    53cb:	00 00 00 
    53ce:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    53d5:	31 00 
    53d7:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    53de:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    53e5:	00 00 00 
    53e8:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    53ef:	00 00 00 
    53f2:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    53f9:	00 00 00 
    53fc:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5403:	00 00 00 
    5406:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    540d:	ff ff ff 
    5410:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    5417:	00 00 00 
    541a:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5421:	00 00 00 
    5424:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    5427:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    542d:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    5434:	00 00 00 
    5437:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    543e:	32 00 
    5440:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    5447:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    544e:	00 00 00 
    5451:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    5458:	00 00 00 
    545b:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    5462:	00 00 00 
    5465:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    546c:	00 00 00 
    546f:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    5476:	ff ff ff 
    5479:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    5480:	00 00 00 
    5483:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    548a:	00 00 00 
    548d:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5490:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    5496:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    549d:	00 00 00 
    54a0:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    54a7:	33 00 
    54a9:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    54b0:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    54b7:	00 00 00 
    54ba:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    54c1:	00 00 00 
    54c4:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    54cb:	00 00 00 
    54ce:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    54d5:	00 00 00 
    54d8:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    54df:	ff ff ff 
    54e2:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    54e9:	00 00 00 
    54ec:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    54f3:	00 00 00 
    54f6:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    54f9:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    54ff:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    5506:	00 00 00 
    5509:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    5510:	34 00 
    5512:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    5519:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    5520:	00 00 00 
    5523:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    552a:	00 00 00 
    552d:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    5534:	00 00 00 
    5537:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    553e:	00 00 00 
    5541:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    5548:	ff ff ff 
    554b:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    5552:	00 00 00 
    5555:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    555c:	00 00 00 
    555f:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    5566:	00 00 00 
    5569:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    5570:	00 00 00 
    5573:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    557a:	35 00 
    557c:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    5583:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    558a:	00 00 00 
    558d:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    5594:	00 00 00 
    5597:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    559e:	00 00 00 
    55a1:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    55a8:	00 00 00 
    55ab:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    55b2:	ff ff ff 
    55b5:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    55bc:	00 00 00 
    55bf:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    55c6:	00 00 00 
    55c9:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    55cf:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    55d5:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    55dc:	00 00 00 
    55df:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    55e6:	36 00 
    55e8:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    55ef:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    55f6:	00 00 00 
    55f9:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    5600:	00 00 00 
    5603:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    560a:	00 00 00 
    560d:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    5614:	00 00 00 
    5617:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    561e:	ff ff ff 
    5621:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    5628:	00 00 00 
    562b:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    5632:	00 00 00 
    5635:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    563b:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    5641:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    5648:	00 00 00 
    564b:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    5652:	37 00 
    5654:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    565b:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    5662:	00 00 00 
    5665:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    566c:	00 00 00 
    566f:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    5676:	00 00 00 
    5679:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    5680:	00 00 00 
    5683:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    568a:	ff ff ff 
    568d:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    5694:	00 00 00 
    5697:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    569e:	00 00 00 
    56a1:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    56a7:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    56ad:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    56b4:	00 00 00 
    56b7:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    56be:	38 00 
    56c0:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    56c7:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    56ce:	00 00 00 
    56d1:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    56d8:	00 00 00 
    56db:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    56e2:	00 00 00 
    56e5:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    56ec:	00 00 00 
    56ef:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    56f6:	ff ff ff 
    56f9:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    5700:	00 00 00 
    5703:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    570a:	00 00 00 
    570d:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5713:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    5719:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    5720:	00 00 00 
    5723:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    572a:	39 00 
    572c:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    5733:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    573a:	00 00 00 
    573d:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    5744:	00 00 00 
    5747:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    574e:	00 00 00 
    5751:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    5758:	00 00 00 
    575b:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    5762:	ff ff ff 
    5765:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    576c:	00 00 00 
    576f:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    5776:	00 00 00 
    5779:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    577f:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    5785:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    578c:	00 00 00 
    578f:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    5796:	31 30 
    5798:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    579f:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    57a6:	00 00 00 
    57a9:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    57b0:	00 00 00 
    57b3:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    57ba:	00 00 00 
    57bd:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    57c4:	00 00 00 
    57c7:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    57ce:	ff ff ff 
    57d1:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    57d8:	00 00 00 
    57db:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    57e2:	00 00 00 
    57e5:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    57eb:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    57f1:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    57f8:	00 00 00 
    57fb:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    5802:	31 31 
    5804:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    580b:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    5812:	00 00 00 
    5815:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    581c:	00 00 00 
    581f:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    5826:	00 00 00 
    5829:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    5830:	00 00 00 
    5833:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    583a:	ff ff ff 
    583d:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    5844:	00 00 00 
    5847:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    584e:	00 00 00 
    5851:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5857:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    585d:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    5864:	00 00 00 
    5867:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    586e:	31 32 
    5870:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    5877:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    587e:	00 00 00 
    5881:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    5888:	00 00 00 
    588b:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    5892:	00 00 00 
    5895:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    589c:	00 00 00 
    589f:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    58a6:	ff ff ff 
    58a9:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    58b0:	00 00 00 
    58b3:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    58ba:	00 00 00 
    58bd:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    58c3:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    58c9:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    58d0:	00 00 00 
    58d3:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    58da:	31 33 
    58dc:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    58e3:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    58ea:	00 00 00 
    58ed:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    58f4:	00 00 00 
    58f7:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    58fe:	00 00 00 
    5901:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    5908:	00 00 00 
    590b:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    5912:	ff ff ff 
    5915:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    591c:	00 00 00 
    591f:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    5926:	00 00 00 
    5929:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    592f:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    5935:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    593c:	01 00 00 
    593f:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    5946:	31 34 
    5948:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    594f:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    5956:	00 00 00 
    5959:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    5960:	00 00 00 
    5963:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    596a:	00 00 00 
    596d:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    5974:	00 00 00 
    5977:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    597e:	ff ff ff 
    5981:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    5988:	00 00 00 
    598b:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    5992:	00 00 00 
    5995:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    599c:	00 00 00 
    599f:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    59a6:	00 00 00 
    59a9:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    59b0:	31 35 
    59b2:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    59b9:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    59c0:	00 00 00 
    59c3:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    59ca:	00 00 00 
    59cd:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    59d4:	00 00 00 
    59d7:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    59de:	00 00 00 
    59e1:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    59e8:	ff ff ff 
    59eb:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    59f2:	00 00 00 
    59f5:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    59fc:	00 00 00 
    59ff:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    5a05:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    5a0b:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    5a12:	01 00 00 
    5a15:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    5a1c:	31 36 
    5a1e:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    5a25:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    5a2c:	00 00 00 
    5a2f:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    5a36:	00 00 00 
    5a39:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    5a40:	00 00 00 
    5a43:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    5a4a:	00 00 00 
    5a4d:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    5a54:	ff ff ff 
    5a57:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    5a5e:	00 00 00 
    5a61:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    5a68:	00 00 00 
    5a6b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5a71:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    5a77:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    5a7e:	01 00 00 
    5a81:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    5a88:	31 37 
    5a8a:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    5a91:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    5a98:	00 00 00 
    5a9b:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    5aa2:	00 00 00 
    5aa5:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    5aac:	00 00 00 
    5aaf:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    5ab6:	00 00 00 
    5ab9:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    5ac0:	00 00 00 
    5ac3:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    5aca:	00 00 00 
    5acd:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    5ad4:	00 00 00 
    5ad7:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5add:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    5ae3:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    5aea:	01 00 00 
    5aed:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    5af4:	31 38 
    5af6:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    5afd:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    5b04:	00 00 00 
    5b07:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    5b0e:	00 00 00 
    5b11:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    5b18:	00 00 00 
    5b1b:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    5b22:	00 00 00 
    5b25:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    5b2c:	00 00 00 
    5b2f:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    5b36:	00 00 00 
    5b39:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    5b40:	00 00 00 
    5b43:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5b49:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    5b4f:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    5b56:	01 00 00 
    5b59:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    5b60:	31 39 
    5b62:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    5b69:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    5b70:	00 00 00 
    5b73:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    5b7a:	00 00 00 
    5b7d:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    5b84:	00 00 00 
    5b87:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    5b8e:	00 00 00 
    5b91:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    5b98:	00 00 00 
    5b9b:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    5ba2:	00 00 00 
    5ba5:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    5bac:	00 00 00 
    5baf:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5bb5:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    5bbb:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    5bc2:	01 00 00 
    5bc5:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    5bcc:	32 30 
    5bce:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    5bd5:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    5bdc:	00 00 00 
    5bdf:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    5be6:	00 00 00 
    5be9:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    5bf0:	00 00 00 
    5bf3:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    5bfa:	00 00 00 
    5bfd:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    5c04:	00 00 00 
    5c07:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    5c0e:	00 00 00 
    5c11:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    5c18:	00 00 00 
    5c1b:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5c21:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    5c27:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    5c2e:	01 00 00 
    5c31:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    5c38:	32 31 
    5c3a:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    5c41:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    5c48:	00 00 00 
    5c4b:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    5c52:	00 00 00 
    5c55:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    5c5c:	00 00 00 
    5c5f:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    5c66:	00 00 00 
    5c69:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    5c70:	00 00 00 
    5c73:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    5c7a:	00 00 00 
    5c7d:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    5c84:	00 00 00 
    5c87:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5c8d:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    5c93:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    5c9a:	01 00 00 
    5c9d:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    5ca4:	32 32 
    5ca6:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    5cad:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    5cb4:	00 00 00 
    5cb7:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    5cbe:	00 00 00 
    5cc1:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    5cc8:	00 00 00 
    5ccb:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    5cd2:	03 00 00 
    5cd5:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    5cdc:	00 00 00 
    5cdf:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    5ce6:	00 00 00 
    5ce9:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    5cf0:	00 00 00 
    5cf3:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5cf9:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    5cff:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    5d06:	01 00 00 
    5d09:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    5d10:	32 33 
    5d12:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    5d19:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    5d20:	00 00 00 
    5d23:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    5d2a:	00 00 00 
    5d2d:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    5d34:	00 00 00 
    5d37:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    5d3e:	1f 00 00 
    5d41:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    5d48:	00 00 00 
    5d4b:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    5d52:	00 00 00 
    5d55:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    5d5c:	00 00 00 
    5d5f:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    5d65:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    5d6b:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    5d72:	01 00 00 
    5d75:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    5d7c:	32 34 
    5d7e:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    5d85:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    5d8c:	00 00 00 
    5d8f:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    5d96:	00 00 00 
    5d99:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    5da0:	00 00 00 
    5da3:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    5daa:	00 00 00 
    5dad:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    5db4:	ff ff ff 
    5db7:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    5dbe:	00 00 00 
    5dc1:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    5dc8:	00 00 00 
    5dcb:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5dd1:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    5dd7:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    5dde:	02 00 00 
    5de1:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    5de8:	32 35 
    5dea:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    5df1:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    5df8:	00 00 00 
    5dfb:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    5e02:	00 00 00 
    5e05:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    5e0c:	00 00 00 
    5e0f:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    5e16:	00 00 00 
    5e19:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    5e20:	00 00 00 
    5e23:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    5e2a:	00 00 00 
    5e2d:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    5e34:	00 00 00 
    5e37:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5e3d:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    5e43:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    5e4a:	02 00 00 
    5e4d:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    5e54:	32 36 
    5e56:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    5e5d:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    5e64:	00 00 00 
    5e67:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    5e6e:	00 00 00 
    5e71:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    5e78:	00 00 00 
    5e7b:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    5e82:	00 00 00 
    5e85:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    5e8c:	00 00 00 
    5e8f:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    5e96:	00 00 00 
    5e99:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    5ea0:	00 00 00 
    5ea3:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5ea9:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    5eaf:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    5eb6:	02 00 00 
    5eb9:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    5ec0:	32 37 
    5ec2:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    5ec9:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    5ed0:	00 00 00 
    5ed3:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    5eda:	00 00 00 
    5edd:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    5ee4:	00 00 00 
    5ee7:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    5eee:	00 00 00 
    5ef1:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    5ef8:	00 00 00 
    5efb:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    5f02:	00 00 00 
    5f05:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    5f0c:	00 00 00 
    5f0f:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5f15:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    5f1b:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    5f22:	02 00 00 
    5f25:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    5f2c:	32 38 
    5f2e:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    5f35:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    5f3c:	00 00 00 
    5f3f:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    5f46:	00 00 00 
    5f49:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    5f50:	00 00 00 
    5f53:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    5f5a:	00 00 00 
    5f5d:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    5f64:	00 00 00 
    5f67:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    5f6e:	00 00 00 
    5f71:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    5f78:	00 00 00 
    5f7b:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5f81:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    5f87:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    5f8e:	02 00 00 
    5f91:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    5f98:	32 39 
    5f9a:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    5fa1:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    5fa8:	00 00 00 
    5fab:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    5fb2:	00 00 00 
    5fb5:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    5fbc:	00 00 00 
    5fbf:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    5fc6:	01 00 00 
    5fc9:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    5fd0:	00 00 00 
    5fd3:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    5fda:	00 00 00 
    5fdd:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    5fe4:	00 00 00 
    5fe7:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    5fed:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    5ff3:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    5ffa:	02 00 00 
    5ffd:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6004:	33 30 
    6006:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    600d:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6014:	00 00 00 
    6017:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    601e:	00 00 00 
    6021:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    6028:	00 00 00 
    602b:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6032:	07 00 00 
    6035:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    603c:	00 00 00 
    603f:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    6046:	00 00 00 
    6049:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    6050:	00 00 00 
    6053:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6059:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    605f:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    6066:	02 00 00 
    6069:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    6070:	33 31 
    6072:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    6079:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    6080:	00 00 00 
    6083:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    608a:	00 00 00 
    608d:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    6094:	00 00 00 
    6097:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    609e:	1f 00 00 
    60a1:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    60a8:	00 00 00 
    60ab:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    60b2:	00 00 00 
    60b5:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    60bc:	00 00 00 
    60bf:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    60c5:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    60cb:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    60d2:	02 00 00 
    60d5:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    60dc:	33 32 
    60de:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    60e5:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    60ec:	00 00 00 
    60ef:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    60f6:	00 00 00 
    60f9:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    6100:	00 00 00 
    6103:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    610a:	00 00 00 
    610d:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6114:	ff ff ff 
    6117:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    611e:	00 00 00 
    6121:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6128:	00 00 00 
    612b:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    6131:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6137:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    613e:	00 00 00 
    6141:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6148:	33 33 
    614a:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    6151:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    6158:	00 00 00 
    615b:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    6162:	00 00 00 
    6165:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    616c:	00 00 00 
    616f:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    6176:	00 00 00 
    6179:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    6180:	ff ff ff 
    6183:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    618a:	00 00 00 
    618d:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    6194:	00 00 00 
    6197:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    619d:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    61a3:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    61aa:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    61ad:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    61b3:	5b                   	pop    %ebx
    61b4:	5e                   	pop    %esi
    61b5:	5f                   	pop    %edi
    61b6:	5d                   	pop    %ebp
    61b7:	c3                   	ret    

000061b8 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    61b8:	55                   	push   %ebp
    61b9:	89 e5                	mov    %esp,%ebp
    61bb:	53                   	push   %ebx
    61bc:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    61bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    61c6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    61cd:	a1 d0 dc 00 00       	mov    0xdcd0,%eax
    61d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    61d5:	8b 45 08             	mov    0x8(%ebp),%eax
    61d8:	8b 40 20             	mov    0x20(%eax),%eax
    61db:	85 c0                	test   %eax,%eax
    61dd:	75 0a                	jne    61e9 <huffman_decoder+0x31>
    61df:	b8 02 00 00 00       	mov    $0x2,%eax
    61e4:	e9 0d 03 00 00       	jmp    64f6 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    61e9:	8b 45 08             	mov    0x8(%ebp),%eax
    61ec:	8b 40 24             	mov    0x24(%eax),%eax
    61ef:	85 c0                	test   %eax,%eax
    61f1:	75 1d                	jne    6210 <huffman_decoder+0x58>
  {  *x = *y = 0;
    61f3:	8b 45 10             	mov    0x10(%ebp),%eax
    61f6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    61fc:	8b 45 10             	mov    0x10(%ebp),%eax
    61ff:	8b 10                	mov    (%eax),%edx
    6201:	8b 45 0c             	mov    0xc(%ebp),%eax
    6204:	89 10                	mov    %edx,(%eax)
     return 0;
    6206:	b8 00 00 00 00       	mov    $0x0,%eax
    620b:	e9 e6 02 00 00       	jmp    64f6 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    6210:	8b 45 08             	mov    0x8(%ebp),%eax
    6213:	8b 40 20             	mov    0x20(%eax),%eax
    6216:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6219:	01 d2                	add    %edx,%edx
    621b:	01 d0                	add    %edx,%eax
    621d:	0f b6 00             	movzbl (%eax),%eax
    6220:	84 c0                	test   %al,%al
    6222:	75 46                	jne    626a <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    6224:	8b 45 08             	mov    0x8(%ebp),%eax
    6227:	8b 40 20             	mov    0x20(%eax),%eax
    622a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    622d:	01 d2                	add    %edx,%edx
    622f:	01 d0                	add    %edx,%eax
    6231:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6235:	c0 e8 04             	shr    $0x4,%al
    6238:	0f b6 d0             	movzbl %al,%edx
    623b:	8b 45 0c             	mov    0xc(%ebp),%eax
    623e:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    6240:	8b 45 08             	mov    0x8(%ebp),%eax
    6243:	8b 40 20             	mov    0x20(%eax),%eax
    6246:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6249:	01 d2                	add    %edx,%edx
    624b:	01 d0                	add    %edx,%eax
    624d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6251:	0f b6 c0             	movzbl %al,%eax
    6254:	83 e0 0f             	and    $0xf,%eax
    6257:	89 c2                	mov    %eax,%edx
    6259:	8b 45 10             	mov    0x10(%ebp),%eax
    625c:	89 10                	mov    %edx,(%eax)

      error = 0;
    625e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    6265:	e9 af 00 00 00       	jmp    6319 <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    626a:	e8 a7 e6 ff ff       	call   4916 <hget1bit>
    626f:	85 c0                	test   %eax,%eax
    6271:	74 47                	je     62ba <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    6273:	eb 17                	jmp    628c <huffman_decoder+0xd4>
    6275:	8b 45 08             	mov    0x8(%ebp),%eax
    6278:	8b 40 20             	mov    0x20(%eax),%eax
    627b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    627e:	01 d2                	add    %edx,%edx
    6280:	01 d0                	add    %edx,%eax
    6282:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6286:	0f b6 c0             	movzbl %al,%eax
    6289:	01 45 f0             	add    %eax,-0x10(%ebp)
    628c:	8b 45 08             	mov    0x8(%ebp),%eax
    628f:	8b 40 20             	mov    0x20(%eax),%eax
    6292:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6295:	01 d2                	add    %edx,%edx
    6297:	01 d0                	add    %edx,%eax
    6299:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    629d:	3c f9                	cmp    $0xf9,%al
    629f:	77 d4                	ja     6275 <huffman_decoder+0xbd>
      point += h->val[point][1];
    62a1:	8b 45 08             	mov    0x8(%ebp),%eax
    62a4:	8b 40 20             	mov    0x20(%eax),%eax
    62a7:	8b 55 f0             	mov    -0x10(%ebp),%edx
    62aa:	01 d2                	add    %edx,%edx
    62ac:	01 d0                	add    %edx,%eax
    62ae:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    62b2:	0f b6 c0             	movzbl %al,%eax
    62b5:	01 45 f0             	add    %eax,-0x10(%ebp)
    62b8:	eb 42                	jmp    62fc <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    62ba:	eb 16                	jmp    62d2 <huffman_decoder+0x11a>
    62bc:	8b 45 08             	mov    0x8(%ebp),%eax
    62bf:	8b 40 20             	mov    0x20(%eax),%eax
    62c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    62c5:	01 d2                	add    %edx,%edx
    62c7:	01 d0                	add    %edx,%eax
    62c9:	0f b6 00             	movzbl (%eax),%eax
    62cc:	0f b6 c0             	movzbl %al,%eax
    62cf:	01 45 f0             	add    %eax,-0x10(%ebp)
    62d2:	8b 45 08             	mov    0x8(%ebp),%eax
    62d5:	8b 40 20             	mov    0x20(%eax),%eax
    62d8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    62db:	01 d2                	add    %edx,%edx
    62dd:	01 d0                	add    %edx,%eax
    62df:	0f b6 00             	movzbl (%eax),%eax
    62e2:	3c f9                	cmp    $0xf9,%al
    62e4:	77 d6                	ja     62bc <huffman_decoder+0x104>
      point += h->val[point][0];
    62e6:	8b 45 08             	mov    0x8(%ebp),%eax
    62e9:	8b 40 20             	mov    0x20(%eax),%eax
    62ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    62ef:	01 d2                	add    %edx,%edx
    62f1:	01 d0                	add    %edx,%eax
    62f3:	0f b6 00             	movzbl (%eax),%eax
    62f6:	0f b6 c0             	movzbl %al,%eax
    62f9:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    62fc:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    62ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6303:	0f 85 07 ff ff ff    	jne    6210 <huffman_decoder+0x58>
    6309:	8b 55 f0             	mov    -0x10(%ebp),%edx
    630c:	a1 64 10 01 00       	mov    0x11064,%eax
    6311:	39 c2                	cmp    %eax,%edx
    6313:	0f 82 f7 fe ff ff    	jb     6210 <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6319:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    631d:	74 24                	je     6343 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    631f:	8b 45 08             	mov    0x8(%ebp),%eax
    6322:	8b 40 04             	mov    0x4(%eax),%eax
    6325:	83 e8 01             	sub    $0x1,%eax
    6328:	01 c0                	add    %eax,%eax
    632a:	89 c2                	mov    %eax,%edx
    632c:	8b 45 0c             	mov    0xc(%ebp),%eax
    632f:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6331:	8b 45 08             	mov    0x8(%ebp),%eax
    6334:	8b 40 08             	mov    0x8(%eax),%eax
    6337:	83 e8 01             	sub    $0x1,%eax
    633a:	01 c0                	add    %eax,%eax
    633c:	89 c2                	mov    %eax,%edx
    633e:	8b 45 10             	mov    0x10(%ebp),%eax
    6341:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6343:	8b 45 08             	mov    0x8(%ebp),%eax
    6346:	0f b6 00             	movzbl (%eax),%eax
    6349:	3c 33                	cmp    $0x33,%al
    634b:	0f 85 ec 00 00 00    	jne    643d <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6351:	8b 45 08             	mov    0x8(%ebp),%eax
    6354:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6358:	3c 32                	cmp    $0x32,%al
    635a:	74 0f                	je     636b <huffman_decoder+0x1b3>
    635c:	8b 45 08             	mov    0x8(%ebp),%eax
    635f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6363:	3c 33                	cmp    $0x33,%al
    6365:	0f 85 d2 00 00 00    	jne    643d <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    636b:	8b 45 10             	mov    0x10(%ebp),%eax
    636e:	8b 00                	mov    (%eax),%eax
    6370:	c1 f8 03             	sar    $0x3,%eax
    6373:	83 e0 01             	and    $0x1,%eax
    6376:	89 c2                	mov    %eax,%edx
    6378:	8b 45 14             	mov    0x14(%ebp),%eax
    637b:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    637d:	8b 45 10             	mov    0x10(%ebp),%eax
    6380:	8b 00                	mov    (%eax),%eax
    6382:	c1 f8 02             	sar    $0x2,%eax
    6385:	83 e0 01             	and    $0x1,%eax
    6388:	89 c2                	mov    %eax,%edx
    638a:	8b 45 18             	mov    0x18(%ebp),%eax
    638d:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    638f:	8b 45 10             	mov    0x10(%ebp),%eax
    6392:	8b 00                	mov    (%eax),%eax
    6394:	d1 f8                	sar    %eax
    6396:	83 e0 01             	and    $0x1,%eax
    6399:	89 c2                	mov    %eax,%edx
    639b:	8b 45 0c             	mov    0xc(%ebp),%eax
    639e:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    63a0:	8b 45 10             	mov    0x10(%ebp),%eax
    63a3:	8b 00                	mov    (%eax),%eax
    63a5:	83 e0 01             	and    $0x1,%eax
    63a8:	89 c2                	mov    %eax,%edx
    63aa:	8b 45 10             	mov    0x10(%ebp),%eax
    63ad:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    63af:	8b 45 14             	mov    0x14(%ebp),%eax
    63b2:	8b 00                	mov    (%eax),%eax
    63b4:	85 c0                	test   %eax,%eax
    63b6:	74 18                	je     63d0 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    63b8:	e8 59 e5 ff ff       	call   4916 <hget1bit>
    63bd:	83 f8 01             	cmp    $0x1,%eax
    63c0:	75 0e                	jne    63d0 <huffman_decoder+0x218>
    63c2:	8b 45 14             	mov    0x14(%ebp),%eax
    63c5:	8b 00                	mov    (%eax),%eax
    63c7:	f7 d8                	neg    %eax
    63c9:	89 c2                	mov    %eax,%edx
    63cb:	8b 45 14             	mov    0x14(%ebp),%eax
    63ce:	89 10                	mov    %edx,(%eax)
     if (*w)
    63d0:	8b 45 18             	mov    0x18(%ebp),%eax
    63d3:	8b 00                	mov    (%eax),%eax
    63d5:	85 c0                	test   %eax,%eax
    63d7:	74 18                	je     63f1 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    63d9:	e8 38 e5 ff ff       	call   4916 <hget1bit>
    63de:	83 f8 01             	cmp    $0x1,%eax
    63e1:	75 0e                	jne    63f1 <huffman_decoder+0x239>
    63e3:	8b 45 18             	mov    0x18(%ebp),%eax
    63e6:	8b 00                	mov    (%eax),%eax
    63e8:	f7 d8                	neg    %eax
    63ea:	89 c2                	mov    %eax,%edx
    63ec:	8b 45 18             	mov    0x18(%ebp),%eax
    63ef:	89 10                	mov    %edx,(%eax)
     if (*x)
    63f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    63f4:	8b 00                	mov    (%eax),%eax
    63f6:	85 c0                	test   %eax,%eax
    63f8:	74 18                	je     6412 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    63fa:	e8 17 e5 ff ff       	call   4916 <hget1bit>
    63ff:	83 f8 01             	cmp    $0x1,%eax
    6402:	75 0e                	jne    6412 <huffman_decoder+0x25a>
    6404:	8b 45 0c             	mov    0xc(%ebp),%eax
    6407:	8b 00                	mov    (%eax),%eax
    6409:	f7 d8                	neg    %eax
    640b:	89 c2                	mov    %eax,%edx
    640d:	8b 45 0c             	mov    0xc(%ebp),%eax
    6410:	89 10                	mov    %edx,(%eax)
     if (*y)
    6412:	8b 45 10             	mov    0x10(%ebp),%eax
    6415:	8b 00                	mov    (%eax),%eax
    6417:	85 c0                	test   %eax,%eax
    6419:	74 1d                	je     6438 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    641b:	e8 f6 e4 ff ff       	call   4916 <hget1bit>
    6420:	83 f8 01             	cmp    $0x1,%eax
    6423:	75 13                	jne    6438 <huffman_decoder+0x280>
    6425:	8b 45 10             	mov    0x10(%ebp),%eax
    6428:	8b 00                	mov    (%eax),%eax
    642a:	f7 d8                	neg    %eax
    642c:	89 c2                	mov    %eax,%edx
    642e:	8b 45 10             	mov    0x10(%ebp),%eax
    6431:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    6433:	e9 bb 00 00 00       	jmp    64f3 <huffman_decoder+0x33b>
    6438:	e9 b6 00 00 00       	jmp    64f3 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    643d:	8b 45 08             	mov    0x8(%ebp),%eax
    6440:	8b 40 0c             	mov    0xc(%eax),%eax
    6443:	85 c0                	test   %eax,%eax
    6445:	74 30                	je     6477 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    6447:	8b 45 08             	mov    0x8(%ebp),%eax
    644a:	8b 40 04             	mov    0x4(%eax),%eax
    644d:	8d 50 ff             	lea    -0x1(%eax),%edx
    6450:	8b 45 0c             	mov    0xc(%ebp),%eax
    6453:	8b 00                	mov    (%eax),%eax
    6455:	39 c2                	cmp    %eax,%edx
    6457:	75 1e                	jne    6477 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    6459:	8b 45 0c             	mov    0xc(%ebp),%eax
    645c:	8b 00                	mov    (%eax),%eax
    645e:	89 c3                	mov    %eax,%ebx
    6460:	8b 45 08             	mov    0x8(%ebp),%eax
    6463:	8b 40 0c             	mov    0xc(%eax),%eax
    6466:	89 04 24             	mov    %eax,(%esp)
    6469:	e8 8d e4 ff ff       	call   48fb <hgetbits>
    646e:	01 d8                	add    %ebx,%eax
    6470:	89 c2                	mov    %eax,%edx
    6472:	8b 45 0c             	mov    0xc(%ebp),%eax
    6475:	89 10                	mov    %edx,(%eax)
     if (*x)
    6477:	8b 45 0c             	mov    0xc(%ebp),%eax
    647a:	8b 00                	mov    (%eax),%eax
    647c:	85 c0                	test   %eax,%eax
    647e:	74 18                	je     6498 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    6480:	e8 91 e4 ff ff       	call   4916 <hget1bit>
    6485:	83 f8 01             	cmp    $0x1,%eax
    6488:	75 0e                	jne    6498 <huffman_decoder+0x2e0>
    648a:	8b 45 0c             	mov    0xc(%ebp),%eax
    648d:	8b 00                	mov    (%eax),%eax
    648f:	f7 d8                	neg    %eax
    6491:	89 c2                	mov    %eax,%edx
    6493:	8b 45 0c             	mov    0xc(%ebp),%eax
    6496:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    6498:	8b 45 08             	mov    0x8(%ebp),%eax
    649b:	8b 40 0c             	mov    0xc(%eax),%eax
    649e:	85 c0                	test   %eax,%eax
    64a0:	74 30                	je     64d2 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    64a2:	8b 45 08             	mov    0x8(%ebp),%eax
    64a5:	8b 40 08             	mov    0x8(%eax),%eax
    64a8:	8d 50 ff             	lea    -0x1(%eax),%edx
    64ab:	8b 45 10             	mov    0x10(%ebp),%eax
    64ae:	8b 00                	mov    (%eax),%eax
    64b0:	39 c2                	cmp    %eax,%edx
    64b2:	75 1e                	jne    64d2 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    64b4:	8b 45 10             	mov    0x10(%ebp),%eax
    64b7:	8b 00                	mov    (%eax),%eax
    64b9:	89 c3                	mov    %eax,%ebx
    64bb:	8b 45 08             	mov    0x8(%ebp),%eax
    64be:	8b 40 0c             	mov    0xc(%eax),%eax
    64c1:	89 04 24             	mov    %eax,(%esp)
    64c4:	e8 32 e4 ff ff       	call   48fb <hgetbits>
    64c9:	01 d8                	add    %ebx,%eax
    64cb:	89 c2                	mov    %eax,%edx
    64cd:	8b 45 10             	mov    0x10(%ebp),%eax
    64d0:	89 10                	mov    %edx,(%eax)
     if (*y)
    64d2:	8b 45 10             	mov    0x10(%ebp),%eax
    64d5:	8b 00                	mov    (%eax),%eax
    64d7:	85 c0                	test   %eax,%eax
    64d9:	74 18                	je     64f3 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    64db:	e8 36 e4 ff ff       	call   4916 <hget1bit>
    64e0:	83 f8 01             	cmp    $0x1,%eax
    64e3:	75 0e                	jne    64f3 <huffman_decoder+0x33b>
    64e5:	8b 45 10             	mov    0x10(%ebp),%eax
    64e8:	8b 00                	mov    (%eax),%eax
    64ea:	f7 d8                	neg    %eax
    64ec:	89 c2                	mov    %eax,%edx
    64ee:	8b 45 10             	mov    0x10(%ebp),%eax
    64f1:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    64f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    64f6:	83 c4 24             	add    $0x24,%esp
    64f9:	5b                   	pop    %ebx
    64fa:	5d                   	pop    %ebp
    64fb:	c3                   	ret    

000064fc <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    64fc:	55                   	push   %ebp
    64fd:	89 e5                	mov    %esp,%ebp
    64ff:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    6502:	8b 45 0c             	mov    0xc(%ebp),%eax
    6505:	8b 00                	mov    (%eax),%eax
    6507:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    650a:	8b 45 08             	mov    0x8(%ebp),%eax
    650d:	89 04 24             	mov    %eax,(%esp)
    6510:	e8 6c df ff ff       	call   4481 <get1bit>
    6515:	89 c2                	mov    %eax,%edx
    6517:	8b 45 f4             	mov    -0xc(%ebp),%eax
    651a:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    651c:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6523:	00 
    6524:	8b 45 08             	mov    0x8(%ebp),%eax
    6527:	89 04 24             	mov    %eax,(%esp)
    652a:	e8 64 e0 ff ff       	call   4593 <getbits>
    652f:	ba 04 00 00 00       	mov    $0x4,%edx
    6534:	29 c2                	sub    %eax,%edx
    6536:	89 d0                	mov    %edx,%eax
    6538:	89 c2                	mov    %eax,%edx
    653a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    653d:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    6540:	8b 45 08             	mov    0x8(%ebp),%eax
    6543:	89 04 24             	mov    %eax,(%esp)
    6546:	e8 36 df ff ff       	call   4481 <get1bit>
    654b:	85 c0                	test   %eax,%eax
    654d:	0f 94 c0             	sete   %al
    6550:	0f b6 d0             	movzbl %al,%edx
    6553:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6556:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    6559:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    6560:	00 
    6561:	8b 45 08             	mov    0x8(%ebp),%eax
    6564:	89 04 24             	mov    %eax,(%esp)
    6567:	e8 27 e0 ff ff       	call   4593 <getbits>
    656c:	89 c2                	mov    %eax,%edx
    656e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6571:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    6574:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    657b:	00 
    657c:	8b 45 08             	mov    0x8(%ebp),%eax
    657f:	89 04 24             	mov    %eax,(%esp)
    6582:	e8 0c e0 ff ff       	call   4593 <getbits>
    6587:	89 c2                	mov    %eax,%edx
    6589:	8b 45 f4             	mov    -0xc(%ebp),%eax
    658c:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    658f:	8b 45 08             	mov    0x8(%ebp),%eax
    6592:	89 04 24             	mov    %eax,(%esp)
    6595:	e8 e7 de ff ff       	call   4481 <get1bit>
    659a:	89 c2                	mov    %eax,%edx
    659c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    659f:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    65a2:	8b 45 08             	mov    0x8(%ebp),%eax
    65a5:	89 04 24             	mov    %eax,(%esp)
    65a8:	e8 d4 de ff ff       	call   4481 <get1bit>
    65ad:	89 c2                	mov    %eax,%edx
    65af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    65b2:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    65b5:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    65bc:	00 
    65bd:	8b 45 08             	mov    0x8(%ebp),%eax
    65c0:	89 04 24             	mov    %eax,(%esp)
    65c3:	e8 cb df ff ff       	call   4593 <getbits>
    65c8:	89 c2                	mov    %eax,%edx
    65ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    65cd:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    65d0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    65d7:	00 
    65d8:	8b 45 08             	mov    0x8(%ebp),%eax
    65db:	89 04 24             	mov    %eax,(%esp)
    65de:	e8 b0 df ff ff       	call   4593 <getbits>
    65e3:	89 c2                	mov    %eax,%edx
    65e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    65e8:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    65eb:	8b 45 08             	mov    0x8(%ebp),%eax
    65ee:	89 04 24             	mov    %eax,(%esp)
    65f1:	e8 8b de ff ff       	call   4481 <get1bit>
    65f6:	89 c2                	mov    %eax,%edx
    65f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    65fb:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    65fe:	8b 45 08             	mov    0x8(%ebp),%eax
    6601:	89 04 24             	mov    %eax,(%esp)
    6604:	e8 78 de ff ff       	call   4481 <get1bit>
    6609:	89 c2                	mov    %eax,%edx
    660b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    660e:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    6611:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6618:	00 
    6619:	8b 45 08             	mov    0x8(%ebp),%eax
    661c:	89 04 24             	mov    %eax,(%esp)
    661f:	e8 6f df ff ff       	call   4593 <getbits>
    6624:	89 c2                	mov    %eax,%edx
    6626:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6629:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    662c:	c9                   	leave  
    662d:	c3                   	ret    

0000662e <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    662e:	55                   	push   %ebp
    662f:	89 e5                	mov    %esp,%ebp
    6631:	56                   	push   %esi
    6632:	53                   	push   %ebx
    6633:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    6636:	8b 45 10             	mov    0x10(%ebp),%eax
    6639:	8b 40 08             	mov    0x8(%eax),%eax
    663c:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    663f:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    6646:	00 
    6647:	8b 45 08             	mov    0x8(%ebp),%eax
    664a:	89 04 24             	mov    %eax,(%esp)
    664d:	e8 41 df ff ff       	call   4593 <getbits>
    6652:	8b 55 0c             	mov    0xc(%ebp),%edx
    6655:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    6657:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    665b:	75 1b                	jne    6678 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    665d:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    6664:	00 
    6665:	8b 45 08             	mov    0x8(%ebp),%eax
    6668:	89 04 24             	mov    %eax,(%esp)
    666b:	e8 23 df ff ff       	call   4593 <getbits>
    6670:	8b 55 0c             	mov    0xc(%ebp),%edx
    6673:	89 42 04             	mov    %eax,0x4(%edx)
    6676:	eb 19                	jmp    6691 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    6678:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    667f:	00 
    6680:	8b 45 08             	mov    0x8(%ebp),%eax
    6683:	89 04 24             	mov    %eax,(%esp)
    6686:	e8 08 df ff ff       	call   4593 <getbits>
    668b:	8b 55 0c             	mov    0xc(%ebp),%edx
    668e:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    6691:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6698:	eb 3d                	jmp    66d7 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    669a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    66a1:	eb 2a                	jmp    66cd <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    66a3:	8b 45 08             	mov    0x8(%ebp),%eax
    66a6:	89 04 24             	mov    %eax,(%esp)
    66a9:	e8 d3 dd ff ff       	call   4481 <get1bit>
    66ae:	89 c1                	mov    %eax,%ecx
    66b0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    66b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    66b6:	89 d0                	mov    %edx,%eax
    66b8:	c1 e0 02             	shl    $0x2,%eax
    66bb:	01 d0                	add    %edx,%eax
    66bd:	c1 e0 03             	shl    $0x3,%eax
    66c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    66c3:	01 d0                	add    %edx,%eax
    66c5:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    66c9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    66cd:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    66d1:	7e d0                	jle    66a3 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    66d3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    66d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    66da:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    66dd:	7c bb                	jl     669a <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    66df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    66e6:	e9 c5 05 00 00       	jmp    6cb0 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    66eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    66f2:	e9 a9 05 00 00       	jmp    6ca0 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    66f7:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    66fe:	00 
    66ff:	8b 45 08             	mov    0x8(%ebp),%eax
    6702:	89 04 24             	mov    %eax,(%esp)
    6705:	e8 89 de ff ff       	call   4593 <getbits>
    670a:	89 c3                	mov    %eax,%ebx
    670c:	8b 75 0c             	mov    0xc(%ebp),%esi
    670f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6712:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6715:	89 c2                	mov    %eax,%edx
    6717:	c1 e2 03             	shl    $0x3,%edx
    671a:	01 c2                	add    %eax,%edx
    671c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6723:	89 c2                	mov    %eax,%edx
    6725:	89 c8                	mov    %ecx,%eax
    6727:	c1 e0 02             	shl    $0x2,%eax
    672a:	01 c8                	add    %ecx,%eax
    672c:	c1 e0 05             	shl    $0x5,%eax
    672f:	01 d0                	add    %edx,%eax
    6731:	01 f0                	add    %esi,%eax
    6733:	83 c0 18             	add    $0x18,%eax
    6736:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    6738:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    673f:	00 
    6740:	8b 45 08             	mov    0x8(%ebp),%eax
    6743:	89 04 24             	mov    %eax,(%esp)
    6746:	e8 48 de ff ff       	call   4593 <getbits>
    674b:	89 c3                	mov    %eax,%ebx
    674d:	8b 75 0c             	mov    0xc(%ebp),%esi
    6750:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6753:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6756:	89 c2                	mov    %eax,%edx
    6758:	c1 e2 03             	shl    $0x3,%edx
    675b:	01 c2                	add    %eax,%edx
    675d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6764:	89 c2                	mov    %eax,%edx
    6766:	89 c8                	mov    %ecx,%eax
    6768:	c1 e0 02             	shl    $0x2,%eax
    676b:	01 c8                	add    %ecx,%eax
    676d:	c1 e0 05             	shl    $0x5,%eax
    6770:	01 d0                	add    %edx,%eax
    6772:	01 f0                	add    %esi,%eax
    6774:	83 c0 1c             	add    $0x1c,%eax
    6777:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    6779:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    6780:	00 
    6781:	8b 45 08             	mov    0x8(%ebp),%eax
    6784:	89 04 24             	mov    %eax,(%esp)
    6787:	e8 07 de ff ff       	call   4593 <getbits>
    678c:	89 c3                	mov    %eax,%ebx
    678e:	8b 75 0c             	mov    0xc(%ebp),%esi
    6791:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6794:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6797:	89 c2                	mov    %eax,%edx
    6799:	c1 e2 03             	shl    $0x3,%edx
    679c:	01 c2                	add    %eax,%edx
    679e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    67a5:	89 c2                	mov    %eax,%edx
    67a7:	89 c8                	mov    %ecx,%eax
    67a9:	c1 e0 02             	shl    $0x2,%eax
    67ac:	01 c8                	add    %ecx,%eax
    67ae:	c1 e0 05             	shl    $0x5,%eax
    67b1:	01 d0                	add    %edx,%eax
    67b3:	01 f0                	add    %esi,%eax
    67b5:	83 c0 20             	add    $0x20,%eax
    67b8:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    67ba:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    67c1:	00 
    67c2:	8b 45 08             	mov    0x8(%ebp),%eax
    67c5:	89 04 24             	mov    %eax,(%esp)
    67c8:	e8 c6 dd ff ff       	call   4593 <getbits>
    67cd:	89 c3                	mov    %eax,%ebx
    67cf:	8b 75 0c             	mov    0xc(%ebp),%esi
    67d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    67d5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    67d8:	89 c2                	mov    %eax,%edx
    67da:	c1 e2 03             	shl    $0x3,%edx
    67dd:	01 c2                	add    %eax,%edx
    67df:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    67e6:	89 c2                	mov    %eax,%edx
    67e8:	89 c8                	mov    %ecx,%eax
    67ea:	c1 e0 02             	shl    $0x2,%eax
    67ed:	01 c8                	add    %ecx,%eax
    67ef:	c1 e0 05             	shl    $0x5,%eax
    67f2:	01 d0                	add    %edx,%eax
    67f4:	01 f0                	add    %esi,%eax
    67f6:	83 c0 24             	add    $0x24,%eax
    67f9:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    67fb:	8b 45 08             	mov    0x8(%ebp),%eax
    67fe:	89 04 24             	mov    %eax,(%esp)
    6801:	e8 7b dc ff ff       	call   4481 <get1bit>
    6806:	89 c3                	mov    %eax,%ebx
    6808:	8b 75 0c             	mov    0xc(%ebp),%esi
    680b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    680e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6811:	89 c2                	mov    %eax,%edx
    6813:	c1 e2 03             	shl    $0x3,%edx
    6816:	01 c2                	add    %eax,%edx
    6818:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    681f:	89 c2                	mov    %eax,%edx
    6821:	89 c8                	mov    %ecx,%eax
    6823:	c1 e0 02             	shl    $0x2,%eax
    6826:	01 c8                	add    %ecx,%eax
    6828:	c1 e0 05             	shl    $0x5,%eax
    682b:	01 d0                	add    %edx,%eax
    682d:	01 f0                	add    %esi,%eax
    682f:	83 c0 28             	add    $0x28,%eax
    6832:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    6834:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6837:	8b 45 f0             	mov    -0x10(%ebp),%eax
    683a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    683d:	89 c2                	mov    %eax,%edx
    683f:	c1 e2 03             	shl    $0x3,%edx
    6842:	01 c2                	add    %eax,%edx
    6844:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    684b:	89 c2                	mov    %eax,%edx
    684d:	89 c8                	mov    %ecx,%eax
    684f:	c1 e0 02             	shl    $0x2,%eax
    6852:	01 c8                	add    %ecx,%eax
    6854:	c1 e0 05             	shl    $0x5,%eax
    6857:	01 d0                	add    %edx,%eax
    6859:	01 d8                	add    %ebx,%eax
    685b:	83 c0 28             	add    $0x28,%eax
    685e:	8b 00                	mov    (%eax),%eax
    6860:	85 c0                	test   %eax,%eax
    6862:	0f 84 82 02 00 00    	je     6aea <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    6868:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    686f:	00 
    6870:	8b 45 08             	mov    0x8(%ebp),%eax
    6873:	89 04 24             	mov    %eax,(%esp)
    6876:	e8 18 dd ff ff       	call   4593 <getbits>
    687b:	89 c3                	mov    %eax,%ebx
    687d:	8b 75 0c             	mov    0xc(%ebp),%esi
    6880:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6883:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6886:	89 c2                	mov    %eax,%edx
    6888:	c1 e2 03             	shl    $0x3,%edx
    688b:	01 c2                	add    %eax,%edx
    688d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6894:	89 c2                	mov    %eax,%edx
    6896:	89 c8                	mov    %ecx,%eax
    6898:	c1 e0 02             	shl    $0x2,%eax
    689b:	01 c8                	add    %ecx,%eax
    689d:	c1 e0 05             	shl    $0x5,%eax
    68a0:	01 d0                	add    %edx,%eax
    68a2:	01 f0                	add    %esi,%eax
    68a4:	83 c0 2c             	add    $0x2c,%eax
    68a7:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    68a9:	8b 45 08             	mov    0x8(%ebp),%eax
    68ac:	89 04 24             	mov    %eax,(%esp)
    68af:	e8 cd db ff ff       	call   4481 <get1bit>
    68b4:	89 c3                	mov    %eax,%ebx
    68b6:	8b 75 0c             	mov    0xc(%ebp),%esi
    68b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    68bc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    68bf:	89 c2                	mov    %eax,%edx
    68c1:	c1 e2 03             	shl    $0x3,%edx
    68c4:	01 c2                	add    %eax,%edx
    68c6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    68cd:	89 c2                	mov    %eax,%edx
    68cf:	89 c8                	mov    %ecx,%eax
    68d1:	c1 e0 02             	shl    $0x2,%eax
    68d4:	01 c8                	add    %ecx,%eax
    68d6:	c1 e0 05             	shl    $0x5,%eax
    68d9:	01 d0                	add    %edx,%eax
    68db:	01 f0                	add    %esi,%eax
    68dd:	83 c0 30             	add    $0x30,%eax
    68e0:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    68e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    68e9:	eb 46                	jmp    6931 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    68eb:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    68f2:	00 
    68f3:	8b 45 08             	mov    0x8(%ebp),%eax
    68f6:	89 04 24             	mov    %eax,(%esp)
    68f9:	e8 95 dc ff ff       	call   4593 <getbits>
    68fe:	89 c3                	mov    %eax,%ebx
    6900:	8b 75 0c             	mov    0xc(%ebp),%esi
    6903:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6906:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6909:	89 c2                	mov    %eax,%edx
    690b:	c1 e2 03             	shl    $0x3,%edx
    690e:	01 c2                	add    %eax,%edx
    6910:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6913:	89 c2                	mov    %eax,%edx
    6915:	89 c8                	mov    %ecx,%eax
    6917:	c1 e0 02             	shl    $0x2,%eax
    691a:	01 c8                	add    %ecx,%eax
    691c:	c1 e0 03             	shl    $0x3,%eax
    691f:	01 c2                	add    %eax,%edx
    6921:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6924:	01 d0                	add    %edx,%eax
    6926:	83 c0 08             	add    $0x8,%eax
    6929:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    692d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6931:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    6935:	7e b4                	jle    68eb <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6937:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    693e:	eb 46                	jmp    6986 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    6940:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    6947:	00 
    6948:	8b 45 08             	mov    0x8(%ebp),%eax
    694b:	89 04 24             	mov    %eax,(%esp)
    694e:	e8 40 dc ff ff       	call   4593 <getbits>
    6953:	89 c3                	mov    %eax,%ebx
    6955:	8b 75 0c             	mov    0xc(%ebp),%esi
    6958:	8b 45 f0             	mov    -0x10(%ebp),%eax
    695b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    695e:	89 c2                	mov    %eax,%edx
    6960:	c1 e2 03             	shl    $0x3,%edx
    6963:	01 c2                	add    %eax,%edx
    6965:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6968:	89 c2                	mov    %eax,%edx
    696a:	89 c8                	mov    %ecx,%eax
    696c:	c1 e0 02             	shl    $0x2,%eax
    696f:	01 c8                	add    %ecx,%eax
    6971:	c1 e0 03             	shl    $0x3,%eax
    6974:	01 c2                	add    %eax,%edx
    6976:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6979:	01 d0                	add    %edx,%eax
    697b:	83 c0 0c             	add    $0xc,%eax
    697e:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    6982:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6986:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    698a:	7e b4                	jle    6940 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    698c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    698f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6992:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6995:	89 c2                	mov    %eax,%edx
    6997:	c1 e2 03             	shl    $0x3,%edx
    699a:	01 c2                	add    %eax,%edx
    699c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    69a3:	89 c2                	mov    %eax,%edx
    69a5:	89 c8                	mov    %ecx,%eax
    69a7:	c1 e0 02             	shl    $0x2,%eax
    69aa:	01 c8                	add    %ecx,%eax
    69ac:	c1 e0 05             	shl    $0x5,%eax
    69af:	01 d0                	add    %edx,%eax
    69b1:	01 d8                	add    %ebx,%eax
    69b3:	83 c0 2c             	add    $0x2c,%eax
    69b6:	8b 00                	mov    (%eax),%eax
    69b8:	85 c0                	test   %eax,%eax
    69ba:	75 05                	jne    69c1 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    69bc:	e8 84 cb ff ff       	call   3545 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    69c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    69c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    69c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    69ca:	89 c2                	mov    %eax,%edx
    69cc:	c1 e2 03             	shl    $0x3,%edx
    69cf:	01 c2                	add    %eax,%edx
    69d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    69d8:	89 c2                	mov    %eax,%edx
    69da:	89 c8                	mov    %ecx,%eax
    69dc:	c1 e0 02             	shl    $0x2,%eax
    69df:	01 c8                	add    %ecx,%eax
    69e1:	c1 e0 05             	shl    $0x5,%eax
    69e4:	01 d0                	add    %edx,%eax
    69e6:	01 d8                	add    %ebx,%eax
    69e8:	83 c0 2c             	add    $0x2c,%eax
    69eb:	8b 00                	mov    (%eax),%eax
    69ed:	83 f8 02             	cmp    $0x2,%eax
    69f0:	75 62                	jne    6a54 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    69f2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    69f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    69f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    69fb:	89 c2                	mov    %eax,%edx
    69fd:	c1 e2 03             	shl    $0x3,%edx
    6a00:	01 c2                	add    %eax,%edx
    6a02:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a09:	89 c2                	mov    %eax,%edx
    6a0b:	89 c8                	mov    %ecx,%eax
    6a0d:	c1 e0 02             	shl    $0x2,%eax
    6a10:	01 c8                	add    %ecx,%eax
    6a12:	c1 e0 05             	shl    $0x5,%eax
    6a15:	01 d0                	add    %edx,%eax
    6a17:	01 d8                	add    %ebx,%eax
    6a19:	83 c0 30             	add    $0x30,%eax
    6a1c:	8b 00                	mov    (%eax),%eax
    6a1e:	85 c0                	test   %eax,%eax
    6a20:	75 32                	jne    6a54 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    6a22:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6a25:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a28:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6a2b:	89 c2                	mov    %eax,%edx
    6a2d:	c1 e2 03             	shl    $0x3,%edx
    6a30:	01 c2                	add    %eax,%edx
    6a32:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a39:	89 c2                	mov    %eax,%edx
    6a3b:	89 c8                	mov    %ecx,%eax
    6a3d:	c1 e0 02             	shl    $0x2,%eax
    6a40:	01 c8                	add    %ecx,%eax
    6a42:	c1 e0 05             	shl    $0x5,%eax
    6a45:	01 d0                	add    %edx,%eax
    6a47:	01 d8                	add    %ebx,%eax
    6a49:	83 c0 4c             	add    $0x4c,%eax
    6a4c:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    6a52:	eb 30                	jmp    6a84 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    6a54:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6a57:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a5a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6a5d:	89 c2                	mov    %eax,%edx
    6a5f:	c1 e2 03             	shl    $0x3,%edx
    6a62:	01 c2                	add    %eax,%edx
    6a64:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a6b:	89 c2                	mov    %eax,%edx
    6a6d:	89 c8                	mov    %ecx,%eax
    6a6f:	c1 e0 02             	shl    $0x2,%eax
    6a72:	01 c8                	add    %ecx,%eax
    6a74:	c1 e0 05             	shl    $0x5,%eax
    6a77:	01 d0                	add    %edx,%eax
    6a79:	01 d8                	add    %ebx,%eax
    6a7b:	83 c0 4c             	add    $0x4c,%eax
    6a7e:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    6a84:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6a87:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6a8a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6a8d:	89 c2                	mov    %eax,%edx
    6a8f:	c1 e2 03             	shl    $0x3,%edx
    6a92:	01 c2                	add    %eax,%edx
    6a94:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6a9b:	89 c2                	mov    %eax,%edx
    6a9d:	89 c8                	mov    %ecx,%eax
    6a9f:	c1 e0 02             	shl    $0x2,%eax
    6aa2:	01 c8                	add    %ecx,%eax
    6aa4:	c1 e0 05             	shl    $0x5,%eax
    6aa7:	01 d0                	add    %edx,%eax
    6aa9:	01 d8                	add    %ebx,%eax
    6aab:	83 c0 4c             	add    $0x4c,%eax
    6aae:	8b 00                	mov    (%eax),%eax
    6ab0:	ba 14 00 00 00       	mov    $0x14,%edx
    6ab5:	89 d3                	mov    %edx,%ebx
    6ab7:	29 c3                	sub    %eax,%ebx
    6ab9:	8b 75 0c             	mov    0xc(%ebp),%esi
    6abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6abf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ac2:	89 c2                	mov    %eax,%edx
    6ac4:	c1 e2 03             	shl    $0x3,%edx
    6ac7:	01 c2                	add    %eax,%edx
    6ac9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6ad0:	89 c2                	mov    %eax,%edx
    6ad2:	89 c8                	mov    %ecx,%eax
    6ad4:	c1 e0 02             	shl    $0x2,%eax
    6ad7:	01 c8                	add    %ecx,%eax
    6ad9:	c1 e0 05             	shl    $0x5,%eax
    6adc:	01 d0                	add    %edx,%eax
    6ade:	01 f0                	add    %esi,%eax
    6ae0:	83 c0 50             	add    $0x50,%eax
    6ae3:	89 18                	mov    %ebx,(%eax)
    6ae5:	e9 07 01 00 00       	jmp    6bf1 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    6aea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6af1:	eb 46                	jmp    6b39 <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    6af3:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    6afa:	00 
    6afb:	8b 45 08             	mov    0x8(%ebp),%eax
    6afe:	89 04 24             	mov    %eax,(%esp)
    6b01:	e8 8d da ff ff       	call   4593 <getbits>
    6b06:	89 c3                	mov    %eax,%ebx
    6b08:	8b 75 0c             	mov    0xc(%ebp),%esi
    6b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b0e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b11:	89 c2                	mov    %eax,%edx
    6b13:	c1 e2 03             	shl    $0x3,%edx
    6b16:	01 c2                	add    %eax,%edx
    6b18:	8d 04 12             	lea    (%edx,%edx,1),%eax
    6b1b:	89 c2                	mov    %eax,%edx
    6b1d:	89 c8                	mov    %ecx,%eax
    6b1f:	c1 e0 02             	shl    $0x2,%eax
    6b22:	01 c8                	add    %ecx,%eax
    6b24:	c1 e0 03             	shl    $0x3,%eax
    6b27:	01 c2                	add    %eax,%edx
    6b29:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6b2c:	01 d0                	add    %edx,%eax
    6b2e:	83 c0 08             	add    $0x8,%eax
    6b31:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    6b35:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6b39:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6b3d:	7e b4                	jle    6af3 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    6b3f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    6b46:	00 
    6b47:	8b 45 08             	mov    0x8(%ebp),%eax
    6b4a:	89 04 24             	mov    %eax,(%esp)
    6b4d:	e8 41 da ff ff       	call   4593 <getbits>
    6b52:	89 c3                	mov    %eax,%ebx
    6b54:	8b 75 0c             	mov    0xc(%ebp),%esi
    6b57:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b5a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b5d:	89 c2                	mov    %eax,%edx
    6b5f:	c1 e2 03             	shl    $0x3,%edx
    6b62:	01 c2                	add    %eax,%edx
    6b64:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6b6b:	89 c2                	mov    %eax,%edx
    6b6d:	89 c8                	mov    %ecx,%eax
    6b6f:	c1 e0 02             	shl    $0x2,%eax
    6b72:	01 c8                	add    %ecx,%eax
    6b74:	c1 e0 05             	shl    $0x5,%eax
    6b77:	01 d0                	add    %edx,%eax
    6b79:	01 f0                	add    %esi,%eax
    6b7b:	83 c0 4c             	add    $0x4c,%eax
    6b7e:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    6b80:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    6b87:	00 
    6b88:	8b 45 08             	mov    0x8(%ebp),%eax
    6b8b:	89 04 24             	mov    %eax,(%esp)
    6b8e:	e8 00 da ff ff       	call   4593 <getbits>
    6b93:	89 c3                	mov    %eax,%ebx
    6b95:	8b 75 0c             	mov    0xc(%ebp),%esi
    6b98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6b9b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6b9e:	89 c2                	mov    %eax,%edx
    6ba0:	c1 e2 03             	shl    $0x3,%edx
    6ba3:	01 c2                	add    %eax,%edx
    6ba5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6bac:	89 c2                	mov    %eax,%edx
    6bae:	89 c8                	mov    %ecx,%eax
    6bb0:	c1 e0 02             	shl    $0x2,%eax
    6bb3:	01 c8                	add    %ecx,%eax
    6bb5:	c1 e0 05             	shl    $0x5,%eax
    6bb8:	01 d0                	add    %edx,%eax
    6bba:	01 f0                	add    %esi,%eax
    6bbc:	83 c0 50             	add    $0x50,%eax
    6bbf:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    6bc1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6bc7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6bca:	89 c2                	mov    %eax,%edx
    6bcc:	c1 e2 03             	shl    $0x3,%edx
    6bcf:	01 c2                	add    %eax,%edx
    6bd1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6bd8:	89 c2                	mov    %eax,%edx
    6bda:	89 c8                	mov    %ecx,%eax
    6bdc:	c1 e0 02             	shl    $0x2,%eax
    6bdf:	01 c8                	add    %ecx,%eax
    6be1:	c1 e0 05             	shl    $0x5,%eax
    6be4:	01 d0                	add    %edx,%eax
    6be6:	01 d8                	add    %ebx,%eax
    6be8:	83 c0 2c             	add    $0x2c,%eax
    6beb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    6bf1:	8b 45 08             	mov    0x8(%ebp),%eax
    6bf4:	89 04 24             	mov    %eax,(%esp)
    6bf7:	e8 85 d8 ff ff       	call   4481 <get1bit>
    6bfc:	89 c3                	mov    %eax,%ebx
    6bfe:	8b 75 0c             	mov    0xc(%ebp),%esi
    6c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c04:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6c07:	89 c2                	mov    %eax,%edx
    6c09:	c1 e2 03             	shl    $0x3,%edx
    6c0c:	01 c2                	add    %eax,%edx
    6c0e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6c15:	89 c2                	mov    %eax,%edx
    6c17:	89 c8                	mov    %ecx,%eax
    6c19:	c1 e0 02             	shl    $0x2,%eax
    6c1c:	01 c8                	add    %ecx,%eax
    6c1e:	c1 e0 05             	shl    $0x5,%eax
    6c21:	01 d0                	add    %edx,%eax
    6c23:	01 f0                	add    %esi,%eax
    6c25:	83 c0 54             	add    $0x54,%eax
    6c28:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    6c2a:	8b 45 08             	mov    0x8(%ebp),%eax
    6c2d:	89 04 24             	mov    %eax,(%esp)
    6c30:	e8 4c d8 ff ff       	call   4481 <get1bit>
    6c35:	89 c3                	mov    %eax,%ebx
    6c37:	8b 75 0c             	mov    0xc(%ebp),%esi
    6c3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c3d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6c40:	89 c2                	mov    %eax,%edx
    6c42:	c1 e2 03             	shl    $0x3,%edx
    6c45:	01 c2                	add    %eax,%edx
    6c47:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6c4e:	89 c2                	mov    %eax,%edx
    6c50:	89 c8                	mov    %ecx,%eax
    6c52:	c1 e0 02             	shl    $0x2,%eax
    6c55:	01 c8                	add    %ecx,%eax
    6c57:	c1 e0 05             	shl    $0x5,%eax
    6c5a:	01 d0                	add    %edx,%eax
    6c5c:	01 f0                	add    %esi,%eax
    6c5e:	83 c0 58             	add    $0x58,%eax
    6c61:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    6c63:	8b 45 08             	mov    0x8(%ebp),%eax
    6c66:	89 04 24             	mov    %eax,(%esp)
    6c69:	e8 13 d8 ff ff       	call   4481 <get1bit>
    6c6e:	89 c3                	mov    %eax,%ebx
    6c70:	8b 75 0c             	mov    0xc(%ebp),%esi
    6c73:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6c76:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6c79:	89 c2                	mov    %eax,%edx
    6c7b:	c1 e2 03             	shl    $0x3,%edx
    6c7e:	01 c2                	add    %eax,%edx
    6c80:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6c87:	89 c2                	mov    %eax,%edx
    6c89:	89 c8                	mov    %ecx,%eax
    6c8b:	c1 e0 02             	shl    $0x2,%eax
    6c8e:	01 c8                	add    %ecx,%eax
    6c90:	c1 e0 05             	shl    $0x5,%eax
    6c93:	01 d0                	add    %edx,%eax
    6c95:	01 f0                	add    %esi,%eax
    6c97:	83 c0 5c             	add    $0x5c,%eax
    6c9a:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    6c9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6ca0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ca3:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6ca6:	0f 8c 4b fa ff ff    	jl     66f7 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6cac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6cb0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6cb4:	0f 8e 31 fa ff ff    	jle    66eb <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    6cba:	83 c4 20             	add    $0x20,%esp
    6cbd:	5b                   	pop    %ebx
    6cbe:	5e                   	pop    %esi
    6cbf:	5d                   	pop    %ebp
    6cc0:	c3                   	ret    

00006cc1 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    6cc1:	55                   	push   %ebp
    6cc2:	89 e5                	mov    %esp,%ebp
    6cc4:	56                   	push   %esi
    6cc5:	53                   	push   %ebx
    6cc6:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    6cc9:	8b 45 10             	mov    0x10(%ebp),%eax
    6ccc:	89 c2                	mov    %eax,%edx
    6cce:	c1 e2 03             	shl    $0x3,%edx
    6cd1:	01 c2                	add    %eax,%edx
    6cd3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6cda:	89 c2                	mov    %eax,%edx
    6cdc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6cdf:	89 c8                	mov    %ecx,%eax
    6ce1:	c1 e0 02             	shl    $0x2,%eax
    6ce4:	01 c8                	add    %ecx,%eax
    6ce6:	c1 e0 05             	shl    $0x5,%eax
    6ce9:	01 d0                	add    %edx,%eax
    6ceb:	8d 50 10             	lea    0x10(%eax),%edx
    6cee:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cf1:	01 d0                	add    %edx,%eax
    6cf3:	83 c0 08             	add    $0x8,%eax
    6cf6:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    6cf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6cfc:	8b 40 10             	mov    0x10(%eax),%eax
    6cff:	85 c0                	test   %eax,%eax
    6d01:	0f 84 7e 02 00 00    	je     6f85 <III_get_scale_factors+0x2c4>
    6d07:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6d0a:	8b 40 14             	mov    0x14(%eax),%eax
    6d0d:	83 f8 02             	cmp    $0x2,%eax
    6d10:	0f 85 6f 02 00 00    	jne    6f85 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    6d16:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6d19:	8b 40 18             	mov    0x18(%eax),%eax
    6d1c:	85 c0                	test   %eax,%eax
    6d1e:	0f 84 6b 01 00 00    	je     6e8f <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    6d24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6d2b:	eb 32                	jmp    6d5f <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    6d2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6d30:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    6d33:	8b 04 85 00 dd 00 00 	mov    0xdd00(,%eax,4),%eax
    6d3a:	89 04 24             	mov    %eax,(%esp)
    6d3d:	e8 b9 db ff ff       	call   48fb <hgetbits>
    6d42:	89 c3                	mov    %eax,%ebx
    6d44:	8b 4d 08             	mov    0x8(%ebp),%ecx
    6d47:	8b 45 14             	mov    0x14(%ebp),%eax
    6d4a:	01 c0                	add    %eax,%eax
    6d4c:	89 c2                	mov    %eax,%edx
    6d4e:	c1 e2 05             	shl    $0x5,%edx
    6d51:	29 c2                	sub    %eax,%edx
    6d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d56:	01 d0                	add    %edx,%eax
    6d58:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    6d5b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6d5f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    6d63:	7e c8                	jle    6d2d <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    6d65:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    6d6c:	eb 5c                	jmp    6dca <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    6d6e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6d75:	eb 49                	jmp    6dc0 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    6d77:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6d7a:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    6d7d:	8b 04 85 00 dd 00 00 	mov    0xdd00(,%eax,4),%eax
    6d84:	89 04 24             	mov    %eax,(%esp)
    6d87:	e8 6f db ff ff       	call   48fb <hgetbits>
    6d8c:	89 c6                	mov    %eax,%esi
    6d8e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6d91:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6d94:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6d97:	89 d0                	mov    %edx,%eax
    6d99:	01 c0                	add    %eax,%eax
    6d9b:	01 d0                	add    %edx,%eax
    6d9d:	c1 e0 02             	shl    $0x2,%eax
    6da0:	01 d0                	add    %edx,%eax
    6da2:	89 ca                	mov    %ecx,%edx
    6da4:	01 d2                	add    %edx,%edx
    6da6:	89 d1                	mov    %edx,%ecx
    6da8:	c1 e1 05             	shl    $0x5,%ecx
    6dab:	29 d1                	sub    %edx,%ecx
    6dad:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6db3:	01 d0                	add    %edx,%eax
    6db5:	83 c0 14             	add    $0x14,%eax
    6db8:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    6dbc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6dc0:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6dc4:	7e b1                	jle    6d77 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    6dc6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6dca:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    6dce:	7e 9e                	jle    6d6e <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    6dd0:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    6dd7:	eb 5f                	jmp    6e38 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    6dd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6de0:	eb 4c                	jmp    6e2e <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    6de2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6de5:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    6de8:	83 c0 10             	add    $0x10,%eax
    6deb:	8b 04 85 00 dd 00 00 	mov    0xdd00(,%eax,4),%eax
    6df2:	89 04 24             	mov    %eax,(%esp)
    6df5:	e8 01 db ff ff       	call   48fb <hgetbits>
    6dfa:	89 c6                	mov    %eax,%esi
    6dfc:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6dff:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6e02:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6e05:	89 d0                	mov    %edx,%eax
    6e07:	01 c0                	add    %eax,%eax
    6e09:	01 d0                	add    %edx,%eax
    6e0b:	c1 e0 02             	shl    $0x2,%eax
    6e0e:	01 d0                	add    %edx,%eax
    6e10:	89 ca                	mov    %ecx,%edx
    6e12:	01 d2                	add    %edx,%edx
    6e14:	89 d1                	mov    %edx,%ecx
    6e16:	c1 e1 05             	shl    $0x5,%ecx
    6e19:	29 d1                	sub    %edx,%ecx
    6e1b:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6e1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e21:	01 d0                	add    %edx,%eax
    6e23:	83 c0 14             	add    $0x14,%eax
    6e26:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    6e2a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6e2e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6e32:	7e ae                	jle    6de2 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    6e34:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6e38:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    6e3c:	7e 9b                	jle    6dd9 <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    6e3e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    6e45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6e4c:	eb 36                	jmp    6e84 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    6e4e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6e51:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6e54:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6e57:	89 d0                	mov    %edx,%eax
    6e59:	01 c0                	add    %eax,%eax
    6e5b:	01 d0                	add    %edx,%eax
    6e5d:	c1 e0 02             	shl    $0x2,%eax
    6e60:	01 d0                	add    %edx,%eax
    6e62:	89 ca                	mov    %ecx,%edx
    6e64:	01 d2                	add    %edx,%edx
    6e66:	89 d1                	mov    %edx,%ecx
    6e68:	c1 e1 05             	shl    $0x5,%ecx
    6e6b:	29 d1                	sub    %edx,%ecx
    6e6d:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e73:	01 d0                	add    %edx,%eax
    6e75:	83 c0 14             	add    $0x14,%eax
    6e78:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    6e7f:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    6e80:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6e84:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6e88:	7e c4                	jle    6e4e <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    6e8a:	e9 b1 01 00 00       	jmp    7040 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    6e8f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6e96:	e9 8f 00 00 00       	jmp    6f2a <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    6e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e9e:	83 c0 04             	add    $0x4,%eax
    6ea1:	8b 04 85 e4 dc 00 00 	mov    0xdce4(,%eax,4),%eax
    6ea8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6eab:	eb 64                	jmp    6f11 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    6ead:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6eb4:	eb 51                	jmp    6f07 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    6eb6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6eb9:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    6ebc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6ebf:	c1 e2 04             	shl    $0x4,%edx
    6ec2:	01 d0                	add    %edx,%eax
    6ec4:	8b 04 85 00 dd 00 00 	mov    0xdd00(,%eax,4),%eax
    6ecb:	89 04 24             	mov    %eax,(%esp)
    6ece:	e8 28 da ff ff       	call   48fb <hgetbits>
    6ed3:	89 c6                	mov    %eax,%esi
    6ed5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6ed8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6edb:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6ede:	89 d0                	mov    %edx,%eax
    6ee0:	01 c0                	add    %eax,%eax
    6ee2:	01 d0                	add    %edx,%eax
    6ee4:	c1 e0 02             	shl    $0x2,%eax
    6ee7:	01 d0                	add    %edx,%eax
    6ee9:	89 ca                	mov    %ecx,%edx
    6eeb:	01 d2                	add    %edx,%edx
    6eed:	89 d1                	mov    %edx,%ecx
    6eef:	c1 e1 05             	shl    $0x5,%ecx
    6ef2:	29 d1                	sub    %edx,%ecx
    6ef4:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6ef7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6efa:	01 d0                	add    %edx,%eax
    6efc:	83 c0 14             	add    $0x14,%eax
    6eff:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    6f03:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6f07:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6f0b:	7e a9                	jle    6eb6 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    6f0d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6f11:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f14:	83 c0 01             	add    $0x1,%eax
    6f17:	83 c0 04             	add    $0x4,%eax
    6f1a:	8b 04 85 e4 dc 00 00 	mov    0xdce4(,%eax,4),%eax
    6f21:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    6f24:	7f 87                	jg     6ead <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    6f26:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6f2a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6f2e:	0f 8e 67 ff ff ff    	jle    6e9b <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    6f34:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    6f3b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6f42:	eb 36                	jmp    6f7a <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    6f44:	8b 5d 08             	mov    0x8(%ebp),%ebx
    6f47:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6f4a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    6f4d:	89 d0                	mov    %edx,%eax
    6f4f:	01 c0                	add    %eax,%eax
    6f51:	01 d0                	add    %edx,%eax
    6f53:	c1 e0 02             	shl    $0x2,%eax
    6f56:	01 d0                	add    %edx,%eax
    6f58:	89 ca                	mov    %ecx,%edx
    6f5a:	01 d2                	add    %edx,%edx
    6f5c:	89 d1                	mov    %edx,%ecx
    6f5e:	c1 e1 05             	shl    $0x5,%ecx
    6f61:	29 d1                	sub    %edx,%ecx
    6f63:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6f66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f69:	01 d0                	add    %edx,%eax
    6f6b:	83 c0 14             	add    $0x14,%eax
    6f6e:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    6f75:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    6f76:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6f7a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    6f7e:	7e c4                	jle    6f44 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    6f80:	e9 bb 00 00 00       	jmp    7040 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    6f85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6f8c:	e9 89 00 00 00       	jmp    701a <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    6f91:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    6f94:	8b 55 14             	mov    0x14(%ebp),%edx
    6f97:	89 d0                	mov    %edx,%eax
    6f99:	c1 e0 02             	shl    $0x2,%eax
    6f9c:	01 d0                	add    %edx,%eax
    6f9e:	c1 e0 03             	shl    $0x3,%eax
    6fa1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6fa4:	01 d0                	add    %edx,%eax
    6fa6:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    6faa:	85 c0                	test   %eax,%eax
    6fac:	74 06                	je     6fb4 <III_get_scale_factors+0x2f3>
    6fae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    6fb2:	75 62                	jne    7016 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    6fb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6fb7:	8b 04 85 e0 dc 00 00 	mov    0xdce0(,%eax,4),%eax
    6fbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6fc1:	eb 41                	jmp    7004 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    6fc3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6fc7:	0f 9f c0             	setg   %al
    6fca:	0f b6 d0             	movzbl %al,%edx
    6fcd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    6fd0:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    6fd3:	c1 e2 04             	shl    $0x4,%edx
    6fd6:	01 d0                	add    %edx,%eax
    6fd8:	8b 04 85 00 dd 00 00 	mov    0xdd00(,%eax,4),%eax
    6fdf:	89 04 24             	mov    %eax,(%esp)
    6fe2:	e8 14 d9 ff ff       	call   48fb <hgetbits>
    6fe7:	89 c3                	mov    %eax,%ebx
    6fe9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    6fec:	8b 45 14             	mov    0x14(%ebp),%eax
    6fef:	01 c0                	add    %eax,%eax
    6ff1:	89 c2                	mov    %eax,%edx
    6ff3:	c1 e2 05             	shl    $0x5,%edx
    6ff6:	29 c2                	sub    %eax,%edx
    6ff8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ffb:	01 d0                	add    %edx,%eax
    6ffd:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7000:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7004:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7007:	83 c0 01             	add    $0x1,%eax
    700a:	8b 04 85 e0 dc 00 00 	mov    0xdce0(,%eax,4),%eax
    7011:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7014:	7f ad                	jg     6fc3 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7016:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    701a:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    701e:	0f 8e 6d ff ff ff    	jle    6f91 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    7024:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7027:	8b 45 14             	mov    0x14(%ebp),%eax
    702a:	c1 e0 03             	shl    $0x3,%eax
    702d:	89 c2                	mov    %eax,%edx
    702f:	c1 e2 05             	shl    $0x5,%edx
    7032:	29 c2                	sub    %eax,%edx
    7034:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    7037:	83 c0 58             	add    $0x58,%eax
    703a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    7040:	83 c4 20             	add    $0x20,%esp
    7043:	5b                   	pop    %ebx
    7044:	5e                   	pop    %esi
    7045:	5d                   	pop    %ebp
    7046:	c3                   	ret    

00007047 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7047:	55                   	push   %ebp
    7048:	89 e5                	mov    %esp,%ebp
    704a:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    704d:	a1 20 e0 00 00       	mov    0xe020,%eax
    7052:	85 c0                	test   %eax,%eax
    7054:	74 02                	je     7058 <initialize_huffman+0x11>
    7056:	eb 0f                	jmp    7067 <initialize_huffman+0x20>
	read_decoder_table();
    7058:	e8 03 d9 ff ff       	call   4960 <read_decoder_table>
	huffman_initialized = TRUE;
    705d:	c7 05 20 e0 00 00 01 	movl   $0x1,0xe020
    7064:	00 00 00 
}
    7067:	c9                   	leave  
    7068:	c3                   	ret    

00007069 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    7069:	55                   	push   %ebp
    706a:	89 e5                	mov    %esp,%ebp
    706c:	57                   	push   %edi
    706d:	56                   	push   %esi
    706e:	53                   	push   %ebx
    706f:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    7072:	e8 d0 ff ff ff       	call   7047 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7077:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    707a:	8b 45 14             	mov    0x14(%ebp),%eax
    707d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7080:	89 c2                	mov    %eax,%edx
    7082:	c1 e2 03             	shl    $0x3,%edx
    7085:	01 c2                	add    %eax,%edx
    7087:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    708e:	89 c2                	mov    %eax,%edx
    7090:	89 c8                	mov    %ecx,%eax
    7092:	c1 e0 02             	shl    $0x2,%eax
    7095:	01 c8                	add    %ecx,%eax
    7097:	c1 e0 05             	shl    $0x5,%eax
    709a:	01 d0                	add    %edx,%eax
    709c:	01 d8                	add    %ebx,%eax
    709e:	83 c0 28             	add    $0x28,%eax
    70a1:	8b 00                	mov    (%eax),%eax
    70a3:	85 c0                	test   %eax,%eax
    70a5:	74 44                	je     70eb <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    70a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    70aa:	8b 45 14             	mov    0x14(%ebp),%eax
    70ad:	8b 4d 10             	mov    0x10(%ebp),%ecx
    70b0:	89 c2                	mov    %eax,%edx
    70b2:	c1 e2 03             	shl    $0x3,%edx
    70b5:	01 c2                	add    %eax,%edx
    70b7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    70be:	89 c2                	mov    %eax,%edx
    70c0:	89 c8                	mov    %ecx,%eax
    70c2:	c1 e0 02             	shl    $0x2,%eax
    70c5:	01 c8                	add    %ecx,%eax
    70c7:	c1 e0 05             	shl    $0x5,%eax
    70ca:	01 d0                	add    %edx,%eax
    70cc:	01 d8                	add    %ebx,%eax
    70ce:	83 c0 2c             	add    $0x2c,%eax
    70d1:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    70d3:	83 f8 02             	cmp    $0x2,%eax
    70d6:	75 13                	jne    70eb <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    70d8:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    70df:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    70e6:	e9 cc 00 00 00       	jmp    71b7 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    70eb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    70ee:	8b 00                	mov    (%eax),%eax
    70f0:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    70f3:	8b 75 0c             	mov    0xc(%ebp),%esi
    70f6:	8b 45 14             	mov    0x14(%ebp),%eax
    70f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
    70fc:	89 c2                	mov    %eax,%edx
    70fe:	c1 e2 03             	shl    $0x3,%edx
    7101:	01 c2                	add    %eax,%edx
    7103:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    710a:	89 c2                	mov    %eax,%edx
    710c:	89 d8                	mov    %ebx,%eax
    710e:	c1 e0 02             	shl    $0x2,%eax
    7111:	01 d8                	add    %ebx,%eax
    7113:	c1 e0 05             	shl    $0x5,%eax
    7116:	01 d0                	add    %edx,%eax
    7118:	01 f0                	add    %esi,%eax
    711a:	83 c0 4c             	add    $0x4c,%eax
    711d:	8b 00                	mov    (%eax),%eax
    711f:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7122:	89 c8                	mov    %ecx,%eax
    7124:	c1 e0 03             	shl    $0x3,%eax
    7127:	01 c8                	add    %ecx,%eax
    7129:	c1 e0 02             	shl    $0x2,%eax
    712c:	01 c8                	add    %ecx,%eax
    712e:	01 d0                	add    %edx,%eax
    7130:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    7137:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    713a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    713d:	8b 00                	mov    (%eax),%eax
    713f:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7142:	8b 75 0c             	mov    0xc(%ebp),%esi
    7145:	8b 45 14             	mov    0x14(%ebp),%eax
    7148:	8b 5d 10             	mov    0x10(%ebp),%ebx
    714b:	89 c2                	mov    %eax,%edx
    714d:	c1 e2 03             	shl    $0x3,%edx
    7150:	01 c2                	add    %eax,%edx
    7152:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7159:	89 c2                	mov    %eax,%edx
    715b:	89 d8                	mov    %ebx,%eax
    715d:	c1 e0 02             	shl    $0x2,%eax
    7160:	01 d8                	add    %ebx,%eax
    7162:	c1 e0 05             	shl    $0x5,%eax
    7165:	01 d0                	add    %edx,%eax
    7167:	01 f0                	add    %esi,%eax
    7169:	83 c0 4c             	add    $0x4c,%eax
    716c:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    716e:	8b 7d 0c             	mov    0xc(%ebp),%edi
    7171:	8b 45 14             	mov    0x14(%ebp),%eax
    7174:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7177:	89 c2                	mov    %eax,%edx
    7179:	c1 e2 03             	shl    $0x3,%edx
    717c:	01 c2                	add    %eax,%edx
    717e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7185:	89 c2                	mov    %eax,%edx
    7187:	89 d8                	mov    %ebx,%eax
    7189:	c1 e0 02             	shl    $0x2,%eax
    718c:	01 d8                	add    %ebx,%eax
    718e:	c1 e0 05             	shl    $0x5,%eax
    7191:	01 d0                	add    %edx,%eax
    7193:	01 f8                	add    %edi,%eax
    7195:	83 c0 50             	add    $0x50,%eax
    7198:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    719a:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    719c:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    719f:	89 c8                	mov    %ecx,%eax
    71a1:	c1 e0 03             	shl    $0x3,%eax
    71a4:	01 c8                	add    %ecx,%eax
    71a6:	c1 e0 02             	shl    $0x2,%eax
    71a9:	01 c8                	add    %ecx,%eax
    71ab:	01 d0                	add    %edx,%eax
    71ad:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    71b4:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    71b7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    71be:	e9 ac 01 00 00       	jmp    736f <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    71c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    71c6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    71c9:	7d 43                	jge    720e <III_hufman_decode+0x1a5>
    71cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71ce:	8b 45 14             	mov    0x14(%ebp),%eax
    71d1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    71d4:	89 c2                	mov    %eax,%edx
    71d6:	c1 e2 03             	shl    $0x3,%edx
    71d9:	01 c2                	add    %eax,%edx
    71db:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71e2:	89 c2                	mov    %eax,%edx
    71e4:	89 c8                	mov    %ecx,%eax
    71e6:	c1 e0 02             	shl    $0x2,%eax
    71e9:	01 c8                	add    %ecx,%eax
    71eb:	c1 e0 05             	shl    $0x5,%eax
    71ee:	01 d0                	add    %edx,%eax
    71f0:	01 d8                	add    %ebx,%eax
    71f2:	83 c0 34             	add    $0x34,%eax
    71f5:	8b 10                	mov    (%eax),%edx
    71f7:	89 d0                	mov    %edx,%eax
    71f9:	c1 e0 02             	shl    $0x2,%eax
    71fc:	01 d0                	add    %edx,%eax
    71fe:	c1 e0 03             	shl    $0x3,%eax
    7201:	05 40 10 01 00       	add    $0x11040,%eax
    7206:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7209:	e9 86 00 00 00       	jmp    7294 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    720e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7211:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7214:	7d 40                	jge    7256 <III_hufman_decode+0x1ed>
    7216:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7219:	8b 45 14             	mov    0x14(%ebp),%eax
    721c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    721f:	89 c2                	mov    %eax,%edx
    7221:	c1 e2 03             	shl    $0x3,%edx
    7224:	01 c2                	add    %eax,%edx
    7226:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    722d:	89 c2                	mov    %eax,%edx
    722f:	89 c8                	mov    %ecx,%eax
    7231:	c1 e0 02             	shl    $0x2,%eax
    7234:	01 c8                	add    %ecx,%eax
    7236:	c1 e0 05             	shl    $0x5,%eax
    7239:	01 d0                	add    %edx,%eax
    723b:	01 d8                	add    %ebx,%eax
    723d:	83 c0 38             	add    $0x38,%eax
    7240:	8b 10                	mov    (%eax),%edx
    7242:	89 d0                	mov    %edx,%eax
    7244:	c1 e0 02             	shl    $0x2,%eax
    7247:	01 d0                	add    %edx,%eax
    7249:	c1 e0 03             	shl    $0x3,%eax
    724c:	05 40 10 01 00       	add    $0x11040,%eax
    7251:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7254:	eb 3e                	jmp    7294 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    7256:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7259:	8b 45 14             	mov    0x14(%ebp),%eax
    725c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    725f:	89 c2                	mov    %eax,%edx
    7261:	c1 e2 03             	shl    $0x3,%edx
    7264:	01 c2                	add    %eax,%edx
    7266:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    726d:	89 c2                	mov    %eax,%edx
    726f:	89 c8                	mov    %ecx,%eax
    7271:	c1 e0 02             	shl    $0x2,%eax
    7274:	01 c8                	add    %ecx,%eax
    7276:	c1 e0 05             	shl    $0x5,%eax
    7279:	01 d0                	add    %edx,%eax
    727b:	01 d8                	add    %ebx,%eax
    727d:	83 c0 3c             	add    $0x3c,%eax
    7280:	8b 10                	mov    (%eax),%edx
    7282:	89 d0                	mov    %edx,%eax
    7284:	c1 e0 02             	shl    $0x2,%eax
    7287:	01 d0                	add    %edx,%eax
    7289:	c1 e0 03             	shl    $0x3,%eax
    728c:	05 40 10 01 00       	add    $0x11040,%eax
    7291:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    7294:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7297:	89 44 24 10          	mov    %eax,0x10(%esp)
    729b:	8d 45 cc             	lea    -0x34(%ebp),%eax
    729e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    72a2:	8d 45 d0             	lea    -0x30(%ebp),%eax
    72a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    72a9:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    72ac:	89 44 24 04          	mov    %eax,0x4(%esp)
    72b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    72b3:	89 04 24             	mov    %eax,(%esp)
    72b6:	e8 fd ee ff ff       	call   61b8 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    72bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    72be:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    72c3:	89 c8                	mov    %ecx,%eax
    72c5:	f7 ea                	imul   %edx
    72c7:	c1 fa 02             	sar    $0x2,%edx
    72ca:	89 c8                	mov    %ecx,%eax
    72cc:	c1 f8 1f             	sar    $0x1f,%eax
    72cf:	29 c2                	sub    %eax,%edx
    72d1:	89 d0                	mov    %edx,%eax
    72d3:	89 c2                	mov    %eax,%edx
    72d5:	89 d0                	mov    %edx,%eax
    72d7:	c1 e0 03             	shl    $0x3,%eax
    72da:	01 d0                	add    %edx,%eax
    72dc:	c1 e0 03             	shl    $0x3,%eax
    72df:	89 c2                	mov    %eax,%edx
    72e1:	8b 45 08             	mov    0x8(%ebp),%eax
    72e4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    72e7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    72ea:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    72ef:	89 c8                	mov    %ecx,%eax
    72f1:	f7 ea                	imul   %edx
    72f3:	c1 fa 02             	sar    $0x2,%edx
    72f6:	89 c8                	mov    %ecx,%eax
    72f8:	c1 f8 1f             	sar    $0x1f,%eax
    72fb:	29 c2                	sub    %eax,%edx
    72fd:	89 d0                	mov    %edx,%eax
    72ff:	c1 e0 03             	shl    $0x3,%eax
    7302:	01 d0                	add    %edx,%eax
    7304:	01 c0                	add    %eax,%eax
    7306:	29 c1                	sub    %eax,%ecx
    7308:	89 ca                	mov    %ecx,%edx
    730a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    730d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7310:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7313:	8d 48 01             	lea    0x1(%eax),%ecx
    7316:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    731b:	89 c8                	mov    %ecx,%eax
    731d:	f7 ea                	imul   %edx
    731f:	c1 fa 02             	sar    $0x2,%edx
    7322:	89 c8                	mov    %ecx,%eax
    7324:	c1 f8 1f             	sar    $0x1f,%eax
    7327:	29 c2                	sub    %eax,%edx
    7329:	89 d0                	mov    %edx,%eax
    732b:	89 c2                	mov    %eax,%edx
    732d:	89 d0                	mov    %edx,%eax
    732f:	c1 e0 03             	shl    $0x3,%eax
    7332:	01 d0                	add    %edx,%eax
    7334:	c1 e0 03             	shl    $0x3,%eax
    7337:	89 c2                	mov    %eax,%edx
    7339:	8b 45 08             	mov    0x8(%ebp),%eax
    733c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    733f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7342:	8d 48 01             	lea    0x1(%eax),%ecx
    7345:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    734a:	89 c8                	mov    %ecx,%eax
    734c:	f7 ea                	imul   %edx
    734e:	c1 fa 02             	sar    $0x2,%edx
    7351:	89 c8                	mov    %ecx,%eax
    7353:	c1 f8 1f             	sar    $0x1f,%eax
    7356:	29 c2                	sub    %eax,%edx
    7358:	89 d0                	mov    %edx,%eax
    735a:	c1 e0 03             	shl    $0x3,%eax
    735d:	01 d0                	add    %edx,%eax
    735f:	01 c0                	add    %eax,%eax
    7361:	29 c1                	sub    %eax,%ecx
    7363:	89 ca                	mov    %ecx,%edx
    7365:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7368:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    736b:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    736f:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7372:	8b 75 0c             	mov    0xc(%ebp),%esi
    7375:	8b 45 14             	mov    0x14(%ebp),%eax
    7378:	8b 4d 10             	mov    0x10(%ebp),%ecx
    737b:	89 c2                	mov    %eax,%edx
    737d:	c1 e2 03             	shl    $0x3,%edx
    7380:	01 c2                	add    %eax,%edx
    7382:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7389:	89 c2                	mov    %eax,%edx
    738b:	89 c8                	mov    %ecx,%eax
    738d:	c1 e0 02             	shl    $0x2,%eax
    7390:	01 c8                	add    %ecx,%eax
    7392:	c1 e0 05             	shl    $0x5,%eax
    7395:	01 d0                	add    %edx,%eax
    7397:	01 f0                	add    %esi,%eax
    7399:	83 c0 1c             	add    $0x1c,%eax
    739c:	8b 00                	mov    (%eax),%eax
    739e:	01 c0                	add    %eax,%eax
    73a0:	39 c3                	cmp    %eax,%ebx
    73a2:	0f 82 1b fe ff ff    	jb     71c3 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    73a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    73ab:	8b 45 14             	mov    0x14(%ebp),%eax
    73ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
    73b1:	89 c2                	mov    %eax,%edx
    73b3:	c1 e2 03             	shl    $0x3,%edx
    73b6:	01 c2                	add    %eax,%edx
    73b8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73bf:	89 c2                	mov    %eax,%edx
    73c1:	89 c8                	mov    %ecx,%eax
    73c3:	c1 e0 02             	shl    $0x2,%eax
    73c6:	01 c8                	add    %ecx,%eax
    73c8:	c1 e0 05             	shl    $0x5,%eax
    73cb:	01 d0                	add    %edx,%eax
    73cd:	01 d8                	add    %ebx,%eax
    73cf:	83 c0 5c             	add    $0x5c,%eax
    73d2:	8b 00                	mov    (%eax),%eax
    73d4:	8d 50 20             	lea    0x20(%eax),%edx
    73d7:	89 d0                	mov    %edx,%eax
    73d9:	c1 e0 02             	shl    $0x2,%eax
    73dc:	01 d0                	add    %edx,%eax
    73de:	c1 e0 03             	shl    $0x3,%eax
    73e1:	05 40 10 01 00       	add    $0x11040,%eax
    73e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    73e9:	e9 91 01 00 00       	jmp    757f <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    73ee:	8d 45 c8             	lea    -0x38(%ebp),%eax
    73f1:	89 44 24 10          	mov    %eax,0x10(%esp)
    73f5:	8d 45 cc             	lea    -0x34(%ebp),%eax
    73f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    73fc:	8d 45 d0             	lea    -0x30(%ebp),%eax
    73ff:	89 44 24 08          	mov    %eax,0x8(%esp)
    7403:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7406:	89 44 24 04          	mov    %eax,0x4(%esp)
    740a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    740d:	89 04 24             	mov    %eax,(%esp)
    7410:	e8 a3 ed ff ff       	call   61b8 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    7415:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7418:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    741d:	89 c8                	mov    %ecx,%eax
    741f:	f7 ea                	imul   %edx
    7421:	c1 fa 02             	sar    $0x2,%edx
    7424:	89 c8                	mov    %ecx,%eax
    7426:	c1 f8 1f             	sar    $0x1f,%eax
    7429:	29 c2                	sub    %eax,%edx
    742b:	89 d0                	mov    %edx,%eax
    742d:	89 c2                	mov    %eax,%edx
    742f:	89 d0                	mov    %edx,%eax
    7431:	c1 e0 03             	shl    $0x3,%eax
    7434:	01 d0                	add    %edx,%eax
    7436:	c1 e0 03             	shl    $0x3,%eax
    7439:	89 c2                	mov    %eax,%edx
    743b:	8b 45 08             	mov    0x8(%ebp),%eax
    743e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7441:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7444:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7449:	89 c8                	mov    %ecx,%eax
    744b:	f7 ea                	imul   %edx
    744d:	c1 fa 02             	sar    $0x2,%edx
    7450:	89 c8                	mov    %ecx,%eax
    7452:	c1 f8 1f             	sar    $0x1f,%eax
    7455:	29 c2                	sub    %eax,%edx
    7457:	89 d0                	mov    %edx,%eax
    7459:	c1 e0 03             	shl    $0x3,%eax
    745c:	01 d0                	add    %edx,%eax
    745e:	01 c0                	add    %eax,%eax
    7460:	29 c1                	sub    %eax,%ecx
    7462:	89 ca                	mov    %ecx,%edx
    7464:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7467:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    746a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    746d:	8d 48 01             	lea    0x1(%eax),%ecx
    7470:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7475:	89 c8                	mov    %ecx,%eax
    7477:	f7 ea                	imul   %edx
    7479:	c1 fa 02             	sar    $0x2,%edx
    747c:	89 c8                	mov    %ecx,%eax
    747e:	c1 f8 1f             	sar    $0x1f,%eax
    7481:	29 c2                	sub    %eax,%edx
    7483:	89 d0                	mov    %edx,%eax
    7485:	89 c2                	mov    %eax,%edx
    7487:	89 d0                	mov    %edx,%eax
    7489:	c1 e0 03             	shl    $0x3,%eax
    748c:	01 d0                	add    %edx,%eax
    748e:	c1 e0 03             	shl    $0x3,%eax
    7491:	89 c2                	mov    %eax,%edx
    7493:	8b 45 08             	mov    0x8(%ebp),%eax
    7496:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7499:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    749c:	8d 48 01             	lea    0x1(%eax),%ecx
    749f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    74a4:	89 c8                	mov    %ecx,%eax
    74a6:	f7 ea                	imul   %edx
    74a8:	c1 fa 02             	sar    $0x2,%edx
    74ab:	89 c8                	mov    %ecx,%eax
    74ad:	c1 f8 1f             	sar    $0x1f,%eax
    74b0:	29 c2                	sub    %eax,%edx
    74b2:	89 d0                	mov    %edx,%eax
    74b4:	c1 e0 03             	shl    $0x3,%eax
    74b7:	01 d0                	add    %edx,%eax
    74b9:	01 c0                	add    %eax,%eax
    74bb:	29 c1                	sub    %eax,%ecx
    74bd:	89 ca                	mov    %ecx,%edx
    74bf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    74c2:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    74c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    74c8:	8d 48 02             	lea    0x2(%eax),%ecx
    74cb:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    74d0:	89 c8                	mov    %ecx,%eax
    74d2:	f7 ea                	imul   %edx
    74d4:	c1 fa 02             	sar    $0x2,%edx
    74d7:	89 c8                	mov    %ecx,%eax
    74d9:	c1 f8 1f             	sar    $0x1f,%eax
    74dc:	29 c2                	sub    %eax,%edx
    74de:	89 d0                	mov    %edx,%eax
    74e0:	89 c2                	mov    %eax,%edx
    74e2:	89 d0                	mov    %edx,%eax
    74e4:	c1 e0 03             	shl    $0x3,%eax
    74e7:	01 d0                	add    %edx,%eax
    74e9:	c1 e0 03             	shl    $0x3,%eax
    74ec:	89 c2                	mov    %eax,%edx
    74ee:	8b 45 08             	mov    0x8(%ebp),%eax
    74f1:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    74f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    74f7:	8d 48 02             	lea    0x2(%eax),%ecx
    74fa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    74ff:	89 c8                	mov    %ecx,%eax
    7501:	f7 ea                	imul   %edx
    7503:	c1 fa 02             	sar    $0x2,%edx
    7506:	89 c8                	mov    %ecx,%eax
    7508:	c1 f8 1f             	sar    $0x1f,%eax
    750b:	29 c2                	sub    %eax,%edx
    750d:	89 d0                	mov    %edx,%eax
    750f:	c1 e0 03             	shl    $0x3,%eax
    7512:	01 d0                	add    %edx,%eax
    7514:	01 c0                	add    %eax,%eax
    7516:	29 c1                	sub    %eax,%ecx
    7518:	89 ca                	mov    %ecx,%edx
    751a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    751d:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    7520:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7523:	8d 48 03             	lea    0x3(%eax),%ecx
    7526:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    752b:	89 c8                	mov    %ecx,%eax
    752d:	f7 ea                	imul   %edx
    752f:	c1 fa 02             	sar    $0x2,%edx
    7532:	89 c8                	mov    %ecx,%eax
    7534:	c1 f8 1f             	sar    $0x1f,%eax
    7537:	29 c2                	sub    %eax,%edx
    7539:	89 d0                	mov    %edx,%eax
    753b:	89 c2                	mov    %eax,%edx
    753d:	89 d0                	mov    %edx,%eax
    753f:	c1 e0 03             	shl    $0x3,%eax
    7542:	01 d0                	add    %edx,%eax
    7544:	c1 e0 03             	shl    $0x3,%eax
    7547:	89 c2                	mov    %eax,%edx
    7549:	8b 45 08             	mov    0x8(%ebp),%eax
    754c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    754f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7552:	8d 48 03             	lea    0x3(%eax),%ecx
    7555:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    755a:	89 c8                	mov    %ecx,%eax
    755c:	f7 ea                	imul   %edx
    755e:	c1 fa 02             	sar    $0x2,%edx
    7561:	89 c8                	mov    %ecx,%eax
    7563:	c1 f8 1f             	sar    $0x1f,%eax
    7566:	29 c2                	sub    %eax,%edx
    7568:	89 d0                	mov    %edx,%eax
    756a:	c1 e0 03             	shl    $0x3,%eax
    756d:	01 d0                	add    %edx,%eax
    756f:	01 c0                	add    %eax,%eax
    7571:	29 c1                	sub    %eax,%ecx
    7573:	89 ca                	mov    %ecx,%edx
    7575:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7578:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    757b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    757f:	e8 5b d3 ff ff       	call   48df <hsstell>
    7584:	89 c3                	mov    %eax,%ebx
    7586:	8b 75 0c             	mov    0xc(%ebp),%esi
    7589:	8b 45 14             	mov    0x14(%ebp),%eax
    758c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    758f:	89 c2                	mov    %eax,%edx
    7591:	c1 e2 03             	shl    $0x3,%edx
    7594:	01 c2                	add    %eax,%edx
    7596:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    759d:	89 c2                	mov    %eax,%edx
    759f:	89 c8                	mov    %ecx,%eax
    75a1:	c1 e0 02             	shl    $0x2,%eax
    75a4:	01 c8                	add    %ecx,%eax
    75a6:	c1 e0 05             	shl    $0x5,%eax
    75a9:	01 d0                	add    %edx,%eax
    75ab:	01 f0                	add    %esi,%eax
    75ad:	83 c0 18             	add    $0x18,%eax
    75b0:	8b 10                	mov    (%eax),%edx
    75b2:	8b 45 18             	mov    0x18(%ebp),%eax
    75b5:	01 d0                	add    %edx,%eax
    75b7:	39 c3                	cmp    %eax,%ebx
    75b9:	73 0d                	jae    75c8 <III_hufman_decode+0x55f>
    75bb:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    75c2:	0f 8e 26 fe ff ff    	jle    73ee <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    75c8:	e8 12 d3 ff ff       	call   48df <hsstell>
    75cd:	89 c3                	mov    %eax,%ebx
    75cf:	8b 75 0c             	mov    0xc(%ebp),%esi
    75d2:	8b 45 14             	mov    0x14(%ebp),%eax
    75d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
    75d8:	89 c2                	mov    %eax,%edx
    75da:	c1 e2 03             	shl    $0x3,%edx
    75dd:	01 c2                	add    %eax,%edx
    75df:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    75e6:	89 c2                	mov    %eax,%edx
    75e8:	89 c8                	mov    %ecx,%eax
    75ea:	c1 e0 02             	shl    $0x2,%eax
    75ed:	01 c8                	add    %ecx,%eax
    75ef:	c1 e0 05             	shl    $0x5,%eax
    75f2:	01 d0                	add    %edx,%eax
    75f4:	01 f0                	add    %esi,%eax
    75f6:	83 c0 18             	add    $0x18,%eax
    75f9:	8b 10                	mov    (%eax),%edx
    75fb:	8b 45 18             	mov    0x18(%ebp),%eax
    75fe:	01 d0                	add    %edx,%eax
    7600:	39 c3                	cmp    %eax,%ebx
    7602:	76 48                	jbe    764c <III_hufman_decode+0x5e3>
   {  i -=4;
    7604:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    7608:	e8 d2 d2 ff ff       	call   48df <hsstell>
    760d:	8b 55 18             	mov    0x18(%ebp),%edx
    7610:	29 d0                	sub    %edx,%eax
    7612:	89 c6                	mov    %eax,%esi
    7614:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7617:	8b 45 14             	mov    0x14(%ebp),%eax
    761a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    761d:	89 c2                	mov    %eax,%edx
    761f:	c1 e2 03             	shl    $0x3,%edx
    7622:	01 c2                	add    %eax,%edx
    7624:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    762b:	89 c2                	mov    %eax,%edx
    762d:	89 c8                	mov    %ecx,%eax
    762f:	c1 e0 02             	shl    $0x2,%eax
    7632:	01 c8                	add    %ecx,%eax
    7634:	c1 e0 05             	shl    $0x5,%eax
    7637:	01 d0                	add    %edx,%eax
    7639:	01 d8                	add    %ebx,%eax
    763b:	83 c0 18             	add    $0x18,%eax
    763e:	8b 00                	mov    (%eax),%eax
    7640:	29 c6                	sub    %eax,%esi
    7642:	89 f0                	mov    %esi,%eax
    7644:	89 04 24             	mov    %eax,(%esp)
    7647:	e8 de d2 ff ff       	call   492a <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    764c:	e8 8e d2 ff ff       	call   48df <hsstell>
    7651:	89 c3                	mov    %eax,%ebx
    7653:	8b 75 0c             	mov    0xc(%ebp),%esi
    7656:	8b 45 14             	mov    0x14(%ebp),%eax
    7659:	8b 4d 10             	mov    0x10(%ebp),%ecx
    765c:	89 c2                	mov    %eax,%edx
    765e:	c1 e2 03             	shl    $0x3,%edx
    7661:	01 c2                	add    %eax,%edx
    7663:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    766a:	89 c2                	mov    %eax,%edx
    766c:	89 c8                	mov    %ecx,%eax
    766e:	c1 e0 02             	shl    $0x2,%eax
    7671:	01 c8                	add    %ecx,%eax
    7673:	c1 e0 05             	shl    $0x5,%eax
    7676:	01 d0                	add    %edx,%eax
    7678:	01 f0                	add    %esi,%eax
    767a:	83 c0 18             	add    $0x18,%eax
    767d:	8b 10                	mov    (%eax),%edx
    767f:	8b 45 18             	mov    0x18(%ebp),%eax
    7682:	01 d0                	add    %edx,%eax
    7684:	39 c3                	cmp    %eax,%ebx
    7686:	73 45                	jae    76cd <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    7688:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    768b:	8b 45 14             	mov    0x14(%ebp),%eax
    768e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7691:	89 c2                	mov    %eax,%edx
    7693:	c1 e2 03             	shl    $0x3,%edx
    7696:	01 c2                	add    %eax,%edx
    7698:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    769f:	89 c2                	mov    %eax,%edx
    76a1:	89 c8                	mov    %ecx,%eax
    76a3:	c1 e0 02             	shl    $0x2,%eax
    76a6:	01 c8                	add    %ecx,%eax
    76a8:	c1 e0 05             	shl    $0x5,%eax
    76ab:	01 d0                	add    %edx,%eax
    76ad:	01 d8                	add    %ebx,%eax
    76af:	83 c0 18             	add    $0x18,%eax
    76b2:	8b 10                	mov    (%eax),%edx
    76b4:	8b 45 18             	mov    0x18(%ebp),%eax
    76b7:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    76ba:	e8 20 d2 ff ff       	call   48df <hsstell>
    76bf:	29 c3                	sub    %eax,%ebx
    76c1:	89 d8                	mov    %ebx,%eax
    76c3:	89 04 24             	mov    %eax,(%esp)
    76c6:	e8 30 d2 ff ff       	call   48fb <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    76cb:	eb 5c                	jmp    7729 <III_hufman_decode+0x6c0>
    76cd:	eb 5a                	jmp    7729 <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    76cf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    76d2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    76d7:	89 c8                	mov    %ecx,%eax
    76d9:	f7 ea                	imul   %edx
    76db:	c1 fa 02             	sar    $0x2,%edx
    76de:	89 c8                	mov    %ecx,%eax
    76e0:	c1 f8 1f             	sar    $0x1f,%eax
    76e3:	29 c2                	sub    %eax,%edx
    76e5:	89 d0                	mov    %edx,%eax
    76e7:	89 c2                	mov    %eax,%edx
    76e9:	89 d0                	mov    %edx,%eax
    76eb:	c1 e0 03             	shl    $0x3,%eax
    76ee:	01 d0                	add    %edx,%eax
    76f0:	c1 e0 03             	shl    $0x3,%eax
    76f3:	89 c2                	mov    %eax,%edx
    76f5:	8b 45 08             	mov    0x8(%ebp),%eax
    76f8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    76fb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    76fe:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7703:	89 c8                	mov    %ecx,%eax
    7705:	f7 ea                	imul   %edx
    7707:	c1 fa 02             	sar    $0x2,%edx
    770a:	89 c8                	mov    %ecx,%eax
    770c:	c1 f8 1f             	sar    $0x1f,%eax
    770f:	29 c2                	sub    %eax,%edx
    7711:	89 d0                	mov    %edx,%eax
    7713:	c1 e0 03             	shl    $0x3,%eax
    7716:	01 d0                	add    %edx,%eax
    7718:	01 c0                	add    %eax,%eax
    771a:	29 c1                	sub    %eax,%ecx
    771c:	89 ca                	mov    %ecx,%edx
    771e:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7725:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7729:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7730:	7e 9d                	jle    76cf <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    7732:	83 c4 4c             	add    $0x4c,%esp
    7735:	5b                   	pop    %ebx
    7736:	5e                   	pop    %esi
    7737:	5f                   	pop    %edi
    7738:	5d                   	pop    %ebp
    7739:	c3                   	ret    

0000773a <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    773a:	55                   	push   %ebp
    773b:	89 e5                	mov    %esp,%ebp
    773d:	56                   	push   %esi
    773e:	53                   	push   %ebx
    773f:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    7742:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7749:	8b 45 1c             	mov    0x1c(%ebp),%eax
    774c:	8b 00                	mov    (%eax),%eax
    774e:	8b 40 10             	mov    0x10(%eax),%eax
    7751:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    7754:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    775b:	8b 45 14             	mov    0x14(%ebp),%eax
    775e:	8b 40 10             	mov    0x10(%eax),%eax
    7761:	85 c0                	test   %eax,%eax
    7763:	74 61                	je     77c6 <III_dequantize_sample+0x8c>
    7765:	8b 45 14             	mov    0x14(%ebp),%eax
    7768:	8b 40 14             	mov    0x14(%eax),%eax
    776b:	83 f8 02             	cmp    $0x2,%eax
    776e:	75 56                	jne    77c6 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    7770:	8b 45 14             	mov    0x14(%ebp),%eax
    7773:	8b 40 18             	mov    0x18(%eax),%eax
    7776:	85 c0                	test   %eax,%eax
    7778:	74 15                	je     778f <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    777a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    777d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7783:	05 84 dd 00 00       	add    $0xdd84,%eax
    7788:	8b 00                	mov    (%eax),%eax
    778a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    778d:	eb 4a                	jmp    77d9 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    778f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7792:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7798:	05 d4 dd 00 00       	add    $0xddd4,%eax
    779d:	8b 50 0c             	mov    0xc(%eax),%edx
    77a0:	89 d0                	mov    %edx,%eax
    77a2:	01 c0                	add    %eax,%eax
    77a4:	01 d0                	add    %edx,%eax
    77a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    77a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    77ac:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    77b2:	05 d4 dd 00 00       	add    $0xddd4,%eax
    77b7:	8b 40 0c             	mov    0xc(%eax),%eax
    77ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    77bd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    77c4:	eb 13                	jmp    77d9 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    77c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    77c9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    77cf:	05 84 dd 00 00       	add    $0xdd84,%eax
    77d4:	8b 00                	mov    (%eax),%eax
    77d6:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    77d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    77e0:	e9 3d 06 00 00       	jmp    7e22 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    77e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    77ec:	e9 23 06 00 00       	jmp    7e14 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    77f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    77f4:	89 d0                	mov    %edx,%eax
    77f6:	c1 e0 03             	shl    $0x3,%eax
    77f9:	01 d0                	add    %edx,%eax
    77fb:	01 c0                	add    %eax,%eax
    77fd:	89 c2                	mov    %eax,%edx
    77ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7802:	01 d0                	add    %edx,%eax
    7804:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7807:	0f 85 9e 02 00 00    	jne    7aab <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    780d:	8b 45 14             	mov    0x14(%ebp),%eax
    7810:	8b 40 10             	mov    0x10(%eax),%eax
    7813:	85 c0                	test   %eax,%eax
    7815:	0f 84 6b 02 00 00    	je     7a86 <III_dequantize_sample+0x34c>
    781b:	8b 45 14             	mov    0x14(%ebp),%eax
    781e:	8b 40 14             	mov    0x14(%eax),%eax
    7821:	83 f8 02             	cmp    $0x2,%eax
    7824:	0f 85 5c 02 00 00    	jne    7a86 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    782a:	8b 45 14             	mov    0x14(%ebp),%eax
    782d:	8b 40 18             	mov    0x18(%eax),%eax
    7830:	85 c0                	test   %eax,%eax
    7832:	0f 84 af 01 00 00    	je     79e7 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    7838:	8b 55 f0             	mov    -0x10(%ebp),%edx
    783b:	89 d0                	mov    %edx,%eax
    783d:	c1 e0 03             	shl    $0x3,%eax
    7840:	01 d0                	add    %edx,%eax
    7842:	01 c0                	add    %eax,%eax
    7844:	89 c2                	mov    %eax,%edx
    7846:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7849:	01 c2                	add    %eax,%edx
    784b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    784e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7854:	05 a0 dd 00 00       	add    $0xdda0,%eax
    7859:	8b 00                	mov    (%eax),%eax
    785b:	39 c2                	cmp    %eax,%edx
    785d:	0f 85 93 00 00 00    	jne    78f6 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    7863:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7866:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    786c:	05 e0 dd 00 00       	add    $0xdde0,%eax
    7871:	8b 50 0c             	mov    0xc(%eax),%edx
    7874:	89 d0                	mov    %edx,%eax
    7876:	01 c0                	add    %eax,%eax
    7878:	01 d0                	add    %edx,%eax
    787a:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    787d:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7884:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7887:	8d 48 01             	lea    0x1(%eax),%ecx
    788a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    788d:	89 d0                	mov    %edx,%eax
    788f:	c1 e0 03             	shl    $0x3,%eax
    7892:	01 d0                	add    %edx,%eax
    7894:	c1 e0 02             	shl    $0x2,%eax
    7897:	01 d0                	add    %edx,%eax
    7899:	01 c8                	add    %ecx,%eax
    789b:	83 c0 14             	add    $0x14,%eax
    789e:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    78a5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    78a8:	89 d0                	mov    %edx,%eax
    78aa:	c1 e0 03             	shl    $0x3,%eax
    78ad:	01 d0                	add    %edx,%eax
    78af:	c1 e0 02             	shl    $0x2,%eax
    78b2:	01 d0                	add    %edx,%eax
    78b4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    78b7:	01 d0                	add    %edx,%eax
    78b9:	83 c0 14             	add    $0x14,%eax
    78bc:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    78c3:	29 c1                	sub    %eax,%ecx
    78c5:	89 c8                	mov    %ecx,%eax
    78c7:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    78ca:	8b 55 dc             	mov    -0x24(%ebp),%edx
    78cd:	89 d0                	mov    %edx,%eax
    78cf:	c1 e0 03             	shl    $0x3,%eax
    78d2:	01 d0                	add    %edx,%eax
    78d4:	c1 e0 02             	shl    $0x2,%eax
    78d7:	01 d0                	add    %edx,%eax
    78d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    78dc:	01 d0                	add    %edx,%eax
    78de:	83 c0 14             	add    $0x14,%eax
    78e1:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    78e8:	89 d0                	mov    %edx,%eax
    78ea:	01 c0                	add    %eax,%eax
    78ec:	01 d0                	add    %edx,%eax
    78ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    78f1:	e9 8e 01 00 00       	jmp    7a84 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    78f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    78f9:	89 d0                	mov    %edx,%eax
    78fb:	c1 e0 03             	shl    $0x3,%eax
    78fe:	01 d0                	add    %edx,%eax
    7900:	01 c0                	add    %eax,%eax
    7902:	89 c2                	mov    %eax,%edx
    7904:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7907:	01 c2                	add    %eax,%edx
    7909:	8b 45 dc             	mov    -0x24(%ebp),%eax
    790c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7912:	05 a0 dd 00 00       	add    $0xdda0,%eax
    7917:	8b 00                	mov    (%eax),%eax
    7919:	39 c2                	cmp    %eax,%edx
    791b:	7d 2a                	jge    7947 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    791d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7921:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7924:	8d 48 01             	lea    0x1(%eax),%ecx
    7927:	8b 55 dc             	mov    -0x24(%ebp),%edx
    792a:	89 d0                	mov    %edx,%eax
    792c:	c1 e0 03             	shl    $0x3,%eax
    792f:	01 d0                	add    %edx,%eax
    7931:	c1 e0 02             	shl    $0x2,%eax
    7934:	01 d0                	add    %edx,%eax
    7936:	01 c8                	add    %ecx,%eax
    7938:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    793f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    7942:	e9 3d 01 00 00       	jmp    7a84 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    7947:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    794b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    794e:	8d 48 01             	lea    0x1(%eax),%ecx
    7951:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7954:	89 d0                	mov    %edx,%eax
    7956:	c1 e0 03             	shl    $0x3,%eax
    7959:	01 d0                	add    %edx,%eax
    795b:	c1 e0 02             	shl    $0x2,%eax
    795e:	01 d0                	add    %edx,%eax
    7960:	01 c8                	add    %ecx,%eax
    7962:	83 c0 14             	add    $0x14,%eax
    7965:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    796c:	89 d0                	mov    %edx,%eax
    796e:	01 c0                	add    %eax,%eax
    7970:	01 d0                	add    %edx,%eax
    7972:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7975:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7978:	8d 48 01             	lea    0x1(%eax),%ecx
    797b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    797e:	89 d0                	mov    %edx,%eax
    7980:	c1 e0 03             	shl    $0x3,%eax
    7983:	01 d0                	add    %edx,%eax
    7985:	c1 e0 02             	shl    $0x2,%eax
    7988:	01 d0                	add    %edx,%eax
    798a:	01 c8                	add    %ecx,%eax
    798c:	83 c0 14             	add    $0x14,%eax
    798f:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7996:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7999:	89 d0                	mov    %edx,%eax
    799b:	c1 e0 03             	shl    $0x3,%eax
    799e:	01 d0                	add    %edx,%eax
    79a0:	c1 e0 02             	shl    $0x2,%eax
    79a3:	01 d0                	add    %edx,%eax
    79a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79a8:	01 d0                	add    %edx,%eax
    79aa:	83 c0 14             	add    $0x14,%eax
    79ad:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    79b4:	29 c1                	sub    %eax,%ecx
    79b6:	89 c8                	mov    %ecx,%eax
    79b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    79bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
    79be:	89 d0                	mov    %edx,%eax
    79c0:	c1 e0 03             	shl    $0x3,%eax
    79c3:	01 d0                	add    %edx,%eax
    79c5:	c1 e0 02             	shl    $0x2,%eax
    79c8:	01 d0                	add    %edx,%eax
    79ca:	8b 55 ec             	mov    -0x14(%ebp),%edx
    79cd:	01 d0                	add    %edx,%eax
    79cf:	83 c0 14             	add    $0x14,%eax
    79d2:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    79d9:	89 d0                	mov    %edx,%eax
    79db:	01 c0                	add    %eax,%eax
    79dd:	01 d0                	add    %edx,%eax
    79df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    79e2:	e9 c4 00 00 00       	jmp    7aab <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    79e7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    79eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    79ee:	8d 48 01             	lea    0x1(%eax),%ecx
    79f1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    79f4:	89 d0                	mov    %edx,%eax
    79f6:	c1 e0 03             	shl    $0x3,%eax
    79f9:	01 d0                	add    %edx,%eax
    79fb:	c1 e0 02             	shl    $0x2,%eax
    79fe:	01 d0                	add    %edx,%eax
    7a00:	01 c8                	add    %ecx,%eax
    7a02:	83 c0 14             	add    $0x14,%eax
    7a05:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    7a0c:	89 d0                	mov    %edx,%eax
    7a0e:	01 c0                	add    %eax,%eax
    7a10:	01 d0                	add    %edx,%eax
    7a12:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    7a15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7a18:	8d 48 01             	lea    0x1(%eax),%ecx
    7a1b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7a1e:	89 d0                	mov    %edx,%eax
    7a20:	c1 e0 03             	shl    $0x3,%eax
    7a23:	01 d0                	add    %edx,%eax
    7a25:	c1 e0 02             	shl    $0x2,%eax
    7a28:	01 d0                	add    %edx,%eax
    7a2a:	01 c8                	add    %ecx,%eax
    7a2c:	83 c0 14             	add    $0x14,%eax
    7a2f:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    7a36:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7a39:	89 d0                	mov    %edx,%eax
    7a3b:	c1 e0 03             	shl    $0x3,%eax
    7a3e:	01 d0                	add    %edx,%eax
    7a40:	c1 e0 02             	shl    $0x2,%eax
    7a43:	01 d0                	add    %edx,%eax
    7a45:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a48:	01 d0                	add    %edx,%eax
    7a4a:	83 c0 14             	add    $0x14,%eax
    7a4d:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    7a54:	29 c1                	sub    %eax,%ecx
    7a56:	89 c8                	mov    %ecx,%eax
    7a58:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    7a5b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7a5e:	89 d0                	mov    %edx,%eax
    7a60:	c1 e0 03             	shl    $0x3,%eax
    7a63:	01 d0                	add    %edx,%eax
    7a65:	c1 e0 02             	shl    $0x2,%eax
    7a68:	01 d0                	add    %edx,%eax
    7a6a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7a6d:	01 d0                	add    %edx,%eax
    7a6f:	83 c0 14             	add    $0x14,%eax
    7a72:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    7a79:	89 d0                	mov    %edx,%eax
    7a7b:	01 c0                	add    %eax,%eax
    7a7d:	01 d0                	add    %edx,%eax
    7a7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    7a82:	eb 27                	jmp    7aab <III_dequantize_sample+0x371>
    7a84:	eb 25                	jmp    7aab <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    7a86:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7a8a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7a8d:	8d 48 01             	lea    0x1(%eax),%ecx
    7a90:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7a93:	89 d0                	mov    %edx,%eax
    7a95:	c1 e0 03             	shl    $0x3,%eax
    7a98:	01 d0                	add    %edx,%eax
    7a9a:	c1 e0 02             	shl    $0x2,%eax
    7a9d:	01 d0                	add    %edx,%eax
    7a9f:	01 c8                	add    %ecx,%eax
    7aa1:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    7aa8:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    7aab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7aae:	89 d0                	mov    %edx,%eax
    7ab0:	c1 e0 03             	shl    $0x3,%eax
    7ab3:	01 d0                	add    %edx,%eax
    7ab5:	c1 e0 04             	shl    $0x4,%eax
    7ab8:	89 c2                	mov    %eax,%edx
    7aba:	8b 45 0c             	mov    0xc(%ebp),%eax
    7abd:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7ac0:	8b 45 14             	mov    0x14(%ebp),%eax
    7ac3:	8b 40 08             	mov    0x8(%eax),%eax
    7ac6:	ba 00 00 00 00       	mov    $0x0,%edx
    7acb:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7ace:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7ad1:	df 6d c8             	fildll -0x38(%ebp)
    7ad4:	dd 05 30 c9 00 00    	fldl   0xc930
    7ada:	de e9                	fsubrp %st,%st(1)
    7adc:	dd 05 38 c9 00 00    	fldl   0xc938
    7ae2:	de c9                	fmulp  %st,%st(1)
    7ae4:	dd 5c 24 08          	fstpl  0x8(%esp)
    7ae8:	dd 05 40 c9 00 00    	fldl   0xc940
    7aee:	dd 1c 24             	fstpl  (%esp)
    7af1:	e8 0c c1 ff ff       	call   3c02 <pow>
    7af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7af9:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    7afc:	8b 45 14             	mov    0x14(%ebp),%eax
    7aff:	8b 40 10             	mov    0x10(%eax),%eax
    7b02:	85 c0                	test   %eax,%eax
    7b04:	0f 84 86 01 00 00    	je     7c90 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7b0a:	8b 45 14             	mov    0x14(%ebp),%eax
    7b0d:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    7b10:	83 f8 02             	cmp    $0x2,%eax
    7b13:	75 0a                	jne    7b1f <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7b15:	8b 45 14             	mov    0x14(%ebp),%eax
    7b18:	8b 40 18             	mov    0x18(%eax),%eax
    7b1b:	85 c0                	test   %eax,%eax
    7b1d:	74 27                	je     7b46 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    7b1f:	8b 45 14             	mov    0x14(%ebp),%eax
    7b22:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    7b25:	83 f8 02             	cmp    $0x2,%eax
    7b28:	0f 85 62 01 00 00    	jne    7c90 <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    7b2e:	8b 45 14             	mov    0x14(%ebp),%eax
    7b31:	8b 40 18             	mov    0x18(%eax),%eax
    7b34:	85 c0                	test   %eax,%eax
    7b36:	0f 84 54 01 00 00    	je     7c90 <III_dequantize_sample+0x556>
    7b3c:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7b40:	0f 8e 4a 01 00 00    	jle    7c90 <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    7b46:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b49:	89 d0                	mov    %edx,%eax
    7b4b:	c1 e0 03             	shl    $0x3,%eax
    7b4e:	01 d0                	add    %edx,%eax
    7b50:	c1 e0 04             	shl    $0x4,%eax
    7b53:	89 c2                	mov    %eax,%edx
    7b55:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b58:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7b5b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b5e:	89 d0                	mov    %edx,%eax
    7b60:	c1 e0 03             	shl    $0x3,%eax
    7b63:	01 d0                	add    %edx,%eax
    7b65:	c1 e0 04             	shl    $0x4,%eax
    7b68:	89 c2                	mov    %eax,%edx
    7b6a:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b6d:	01 c2                	add    %eax,%edx
    7b6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b72:	dd 04 c2             	fldl   (%edx,%eax,8)
    7b75:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    7b78:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7b7b:	89 d0                	mov    %edx,%eax
    7b7d:	c1 e0 03             	shl    $0x3,%eax
    7b80:	01 d0                	add    %edx,%eax
    7b82:	01 c0                	add    %eax,%eax
    7b84:	89 c2                	mov    %eax,%edx
    7b86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7b89:	01 d0                	add    %edx,%eax
    7b8b:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    7b8e:	99                   	cltd   
    7b8f:	f7 7d e0             	idivl  -0x20(%ebp)
    7b92:	89 c2                	mov    %eax,%edx
    7b94:	8b 45 14             	mov    0x14(%ebp),%eax
    7b97:	83 c2 08             	add    $0x8,%edx
    7b9a:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    7b9e:	ba 00 00 00 00       	mov    $0x0,%edx
    7ba3:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7ba6:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7ba9:	df 6d c8             	fildll -0x38(%ebp)
    7bac:	dd 05 48 c9 00 00    	fldl   0xc948
    7bb2:	de c9                	fmulp  %st,%st(1)
    7bb4:	dd 5c 24 08          	fstpl  0x8(%esp)
    7bb8:	dd 05 40 c9 00 00    	fldl   0xc940
    7bbe:	dd 1c 24             	fstpl  (%esp)
    7bc1:	e8 3c c0 ff ff       	call   3c02 <pow>
    7bc6:	dc 4d c0             	fmull  -0x40(%ebp)
    7bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bcc:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    7bcf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7bd2:	89 d0                	mov    %edx,%eax
    7bd4:	c1 e0 03             	shl    $0x3,%eax
    7bd7:	01 d0                	add    %edx,%eax
    7bd9:	c1 e0 04             	shl    $0x4,%eax
    7bdc:	89 c2                	mov    %eax,%edx
    7bde:	8b 45 0c             	mov    0xc(%ebp),%eax
    7be1:	8d 34 02             	lea    (%edx,%eax,1),%esi
    7be4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7be7:	89 d0                	mov    %edx,%eax
    7be9:	c1 e0 03             	shl    $0x3,%eax
    7bec:	01 d0                	add    %edx,%eax
    7bee:	c1 e0 04             	shl    $0x4,%eax
    7bf1:	89 c2                	mov    %eax,%edx
    7bf3:	8b 45 0c             	mov    0xc(%ebp),%eax
    7bf6:	01 c2                	add    %eax,%edx
    7bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7bfb:	dd 04 c2             	fldl   (%edx,%eax,8)
    7bfe:	dd 5d c0             	fstpl  -0x40(%ebp)
    7c01:	8b 45 14             	mov    0x14(%ebp),%eax
    7c04:	8b 40 40             	mov    0x40(%eax),%eax
    7c07:	ba 00 00 00 00       	mov    $0x0,%edx
    7c0c:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7c0f:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7c12:	df 6d c8             	fildll -0x38(%ebp)
    7c15:	d9 e8                	fld1   
    7c17:	de c1                	faddp  %st,%st(1)
    7c19:	dd 05 50 c9 00 00    	fldl   0xc950
    7c1f:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    7c21:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c24:	89 d0                	mov    %edx,%eax
    7c26:	c1 e0 03             	shl    $0x3,%eax
    7c29:	01 d0                	add    %edx,%eax
    7c2b:	01 c0                	add    %eax,%eax
    7c2d:	89 c2                	mov    %eax,%edx
    7c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c32:	01 d0                	add    %edx,%eax
    7c34:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    7c37:	99                   	cltd   
    7c38:	f7 7d e0             	idivl  -0x20(%ebp)
    7c3b:	89 c2                	mov    %eax,%edx
    7c3d:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7c40:	8b 4d 18             	mov    0x18(%ebp),%ecx
    7c43:	89 d0                	mov    %edx,%eax
    7c45:	01 c0                	add    %eax,%eax
    7c47:	01 d0                	add    %edx,%eax
    7c49:	c1 e0 02             	shl    $0x2,%eax
    7c4c:	01 d0                	add    %edx,%eax
    7c4e:	89 ca                	mov    %ecx,%edx
    7c50:	01 d2                	add    %edx,%edx
    7c52:	89 d1                	mov    %edx,%ecx
    7c54:	c1 e1 05             	shl    $0x5,%ecx
    7c57:	29 d1                	sub    %edx,%ecx
    7c59:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7c5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7c5f:	01 d0                	add    %edx,%eax
    7c61:	83 c0 14             	add    $0x14,%eax
    7c64:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    7c68:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    7c6b:	db 45 d4             	fildl  -0x2c(%ebp)
    7c6e:	de c9                	fmulp  %st,%st(1)
    7c70:	dd 5c 24 08          	fstpl  0x8(%esp)
    7c74:	dd 05 40 c9 00 00    	fldl   0xc940
    7c7a:	dd 1c 24             	fstpl  (%esp)
    7c7d:	e8 80 bf ff ff       	call   3c02 <pow>
    7c82:	dc 4d c0             	fmull  -0x40(%ebp)
    7c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c88:	dd 1c c6             	fstpl  (%esi,%eax,8)
    7c8b:	e9 ab 00 00 00       	jmp    7d3b <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    7c90:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c93:	89 d0                	mov    %edx,%eax
    7c95:	c1 e0 03             	shl    $0x3,%eax
    7c98:	01 d0                	add    %edx,%eax
    7c9a:	c1 e0 04             	shl    $0x4,%eax
    7c9d:	89 c2                	mov    %eax,%edx
    7c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ca2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7ca5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ca8:	89 d0                	mov    %edx,%eax
    7caa:	c1 e0 03             	shl    $0x3,%eax
    7cad:	01 d0                	add    %edx,%eax
    7caf:	c1 e0 04             	shl    $0x4,%eax
    7cb2:	89 c2                	mov    %eax,%edx
    7cb4:	8b 45 0c             	mov    0xc(%ebp),%eax
    7cb7:	01 c2                	add    %eax,%edx
    7cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7cbc:	dd 04 c2             	fldl   (%edx,%eax,8)
    7cbf:	dd 5d c0             	fstpl  -0x40(%ebp)
    7cc2:	8b 45 14             	mov    0x14(%ebp),%eax
    7cc5:	8b 40 40             	mov    0x40(%eax),%eax
    7cc8:	ba 00 00 00 00       	mov    $0x0,%edx
    7ccd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7cd0:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7cd3:	df 6d c8             	fildll -0x38(%ebp)
    7cd6:	d9 e8                	fld1   
    7cd8:	de c1                	faddp  %st,%st(1)
    7cda:	dd 05 50 c9 00 00    	fldl   0xc950
    7ce0:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    7ce2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ce5:	8b 45 18             	mov    0x18(%ebp),%eax
    7ce8:	01 c0                	add    %eax,%eax
    7cea:	89 c2                	mov    %eax,%edx
    7cec:	c1 e2 05             	shl    $0x5,%edx
    7cef:	29 c2                	sub    %eax,%edx
    7cf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7cf4:	01 d0                	add    %edx,%eax
    7cf6:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    7cf9:	89 c2                	mov    %eax,%edx
    7cfb:	8b 45 14             	mov    0x14(%ebp),%eax
    7cfe:	8b 48 3c             	mov    0x3c(%eax),%ecx
    7d01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7d04:	8b 04 85 40 df 00 00 	mov    0xdf40(,%eax,4),%eax
    7d0b:	0f af c1             	imul   %ecx,%eax
    7d0e:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    7d10:	ba 00 00 00 00       	mov    $0x0,%edx
    7d15:	89 45 c8             	mov    %eax,-0x38(%ebp)
    7d18:	89 55 cc             	mov    %edx,-0x34(%ebp)
    7d1b:	df 6d c8             	fildll -0x38(%ebp)
    7d1e:	de c9                	fmulp  %st,%st(1)
    7d20:	dd 5c 24 08          	fstpl  0x8(%esp)
    7d24:	dd 05 40 c9 00 00    	fldl   0xc940
    7d2a:	dd 1c 24             	fstpl  (%esp)
    7d2d:	e8 d0 be ff ff       	call   3c02 <pow>
    7d32:	dc 4d c0             	fmull  -0x40(%ebp)
    7d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d38:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    7d3b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d3e:	89 d0                	mov    %edx,%eax
    7d40:	c1 e0 03             	shl    $0x3,%eax
    7d43:	01 d0                	add    %edx,%eax
    7d45:	c1 e0 03             	shl    $0x3,%eax
    7d48:	89 c2                	mov    %eax,%edx
    7d4a:	8b 45 08             	mov    0x8(%ebp),%eax
    7d4d:	01 c2                	add    %eax,%edx
    7d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d52:	8b 04 82             	mov    (%edx,%eax,4),%eax
    7d55:	c1 e8 1f             	shr    $0x1f,%eax
    7d58:	0f b6 c0             	movzbl %al,%eax
    7d5b:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    7d5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d61:	89 d0                	mov    %edx,%eax
    7d63:	c1 e0 03             	shl    $0x3,%eax
    7d66:	01 d0                	add    %edx,%eax
    7d68:	c1 e0 04             	shl    $0x4,%eax
    7d6b:	89 c2                	mov    %eax,%edx
    7d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d70:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7d73:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d76:	89 d0                	mov    %edx,%eax
    7d78:	c1 e0 03             	shl    $0x3,%eax
    7d7b:	01 d0                	add    %edx,%eax
    7d7d:	c1 e0 04             	shl    $0x4,%eax
    7d80:	89 c2                	mov    %eax,%edx
    7d82:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d85:	01 c2                	add    %eax,%edx
    7d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d8a:	dd 04 c2             	fldl   (%edx,%eax,8)
    7d8d:	dd 5d c0             	fstpl  -0x40(%ebp)
    7d90:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d93:	89 d0                	mov    %edx,%eax
    7d95:	c1 e0 03             	shl    $0x3,%eax
    7d98:	01 d0                	add    %edx,%eax
    7d9a:	c1 e0 03             	shl    $0x3,%eax
    7d9d:	89 c2                	mov    %eax,%edx
    7d9f:	8b 45 08             	mov    0x8(%ebp),%eax
    7da2:	01 c2                	add    %eax,%edx
    7da4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7da7:	8b 04 82             	mov    (%edx,%eax,4),%eax
    7daa:	89 04 24             	mov    %eax,(%esp)
    7dad:	e8 47 bd ff ff       	call   3af9 <abs>
    7db2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    7db5:	db 45 d4             	fildl  -0x2c(%ebp)
    7db8:	dd 05 58 c9 00 00    	fldl   0xc958
    7dbe:	dd 5c 24 08          	fstpl  0x8(%esp)
    7dc2:	dd 1c 24             	fstpl  (%esp)
    7dc5:	e8 38 be ff ff       	call   3c02 <pow>
    7dca:	dc 4d c0             	fmull  -0x40(%ebp)
    7dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7dd0:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    7dd3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    7dd7:	74 37                	je     7e10 <III_dequantize_sample+0x6d6>
    7dd9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7ddc:	89 d0                	mov    %edx,%eax
    7dde:	c1 e0 03             	shl    $0x3,%eax
    7de1:	01 d0                	add    %edx,%eax
    7de3:	c1 e0 04             	shl    $0x4,%eax
    7de6:	89 c2                	mov    %eax,%edx
    7de8:	8b 45 0c             	mov    0xc(%ebp),%eax
    7deb:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7dee:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7df1:	89 d0                	mov    %edx,%eax
    7df3:	c1 e0 03             	shl    $0x3,%eax
    7df6:	01 d0                	add    %edx,%eax
    7df8:	c1 e0 04             	shl    $0x4,%eax
    7dfb:	89 c2                	mov    %eax,%edx
    7dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e00:	01 c2                	add    %eax,%edx
    7e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e05:	dd 04 c2             	fldl   (%edx,%eax,8)
    7e08:	d9 e0                	fchs   
    7e0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e0d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    7e10:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e14:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7e18:	0f 8e d3 f9 ff ff    	jle    77f1 <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    7e1e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7e22:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    7e26:	0f 8e b9 f9 ff ff    	jle    77e5 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    7e2c:	83 c4 50             	add    $0x50,%esp
    7e2f:	5b                   	pop    %ebx
    7e30:	5e                   	pop    %esi
    7e31:	5d                   	pop    %ebp
    7e32:	c3                   	ret    

00007e33 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    7e33:	55                   	push   %ebp
    7e34:	89 e5                	mov    %esp,%ebp
    7e36:	57                   	push   %edi
    7e37:	56                   	push   %esi
    7e38:	53                   	push   %ebx
    7e39:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    7e3c:	8b 45 14             	mov    0x14(%ebp),%eax
    7e3f:	8b 00                	mov    (%eax),%eax
    7e41:	8b 40 10             	mov    0x10(%eax),%eax
    7e44:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    7e47:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    7e4e:	eb 33                	jmp    7e83 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    7e50:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    7e57:	eb 20                	jmp    7e79 <III_reorder+0x46>
         ro[sb][ss] = 0;
    7e59:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7e5c:	89 d0                	mov    %edx,%eax
    7e5e:	c1 e0 03             	shl    $0x3,%eax
    7e61:	01 d0                	add    %edx,%eax
    7e63:	c1 e0 04             	shl    $0x4,%eax
    7e66:	89 c2                	mov    %eax,%edx
    7e68:	8b 45 0c             	mov    0xc(%ebp),%eax
    7e6b:	01 c2                	add    %eax,%edx
    7e6d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7e70:	d9 ee                	fldz   
    7e72:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    7e75:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    7e79:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    7e7d:	7e da                	jle    7e59 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    7e7f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    7e83:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    7e87:	7e c7                	jle    7e50 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7e89:	8b 45 10             	mov    0x10(%ebp),%eax
    7e8c:	8b 40 10             	mov    0x10(%eax),%eax
    7e8f:	85 c0                	test   %eax,%eax
    7e91:	0f 84 af 03 00 00    	je     8246 <III_reorder+0x413>
    7e97:	8b 45 10             	mov    0x10(%ebp),%eax
    7e9a:	8b 40 14             	mov    0x14(%eax),%eax
    7e9d:	83 f8 02             	cmp    $0x2,%eax
    7ea0:	0f 85 a0 03 00 00    	jne    8246 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    7ea6:	8b 45 10             	mov    0x10(%ebp),%eax
    7ea9:	8b 40 18             	mov    0x18(%eax),%eax
    7eac:	85 c0                	test   %eax,%eax
    7eae:	0f 84 00 02 00 00    	je     80b4 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    7eb4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    7ebb:	eb 4c                	jmp    7f09 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    7ebd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    7ec4:	eb 39                	jmp    7eff <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    7ec6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7ec9:	89 d0                	mov    %edx,%eax
    7ecb:	c1 e0 03             	shl    $0x3,%eax
    7ece:	01 d0                	add    %edx,%eax
    7ed0:	c1 e0 04             	shl    $0x4,%eax
    7ed3:	89 c2                	mov    %eax,%edx
    7ed5:	8b 45 0c             	mov    0xc(%ebp),%eax
    7ed8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7edb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7ede:	89 d0                	mov    %edx,%eax
    7ee0:	c1 e0 03             	shl    $0x3,%eax
    7ee3:	01 d0                	add    %edx,%eax
    7ee5:	c1 e0 04             	shl    $0x4,%eax
    7ee8:	89 c2                	mov    %eax,%edx
    7eea:	8b 45 08             	mov    0x8(%ebp),%eax
    7eed:	01 c2                	add    %eax,%edx
    7eef:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7ef2:	dd 04 c2             	fldl   (%edx,%eax,8)
    7ef5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7ef8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    7efb:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    7eff:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    7f03:	7e c1                	jle    7ec6 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    7f05:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    7f09:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    7f0d:	7e ae                	jle    7ebd <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    7f0f:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    7f16:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7f19:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f1f:	05 dc dd 00 00       	add    $0xdddc,%eax
    7f24:	8b 40 0c             	mov    0xc(%eax),%eax
    7f27:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    7f2a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7f2d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f33:	05 e0 dd 00 00       	add    $0xdde0,%eax
    7f38:	8b 40 0c             	mov    0xc(%eax),%eax
    7f3b:	2b 45 e8             	sub    -0x18(%ebp),%eax
    7f3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    7f41:	e9 5f 01 00 00       	jmp    80a5 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    7f46:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    7f4d:	e9 fd 00 00 00       	jmp    804f <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    7f52:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    7f59:	e9 e1 00 00 00       	jmp    803f <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    7f5e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7f61:	89 d0                	mov    %edx,%eax
    7f63:	01 c0                	add    %eax,%eax
    7f65:	01 c2                	add    %eax,%edx
    7f67:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7f6a:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    7f6e:	01 c2                	add    %eax,%edx
    7f70:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7f73:	01 d0                	add    %edx,%eax
    7f75:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    7f78:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7f7b:	89 d0                	mov    %edx,%eax
    7f7d:	01 c0                	add    %eax,%eax
    7f7f:	01 c2                	add    %eax,%edx
    7f81:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7f84:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7f87:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    7f8a:	89 d0                	mov    %edx,%eax
    7f8c:	01 c0                	add    %eax,%eax
    7f8e:	01 d0                	add    %edx,%eax
    7f90:	01 c8                	add    %ecx,%eax
    7f92:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    7f95:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    7f98:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7f9d:	89 c8                	mov    %ecx,%eax
    7f9f:	f7 ea                	imul   %edx
    7fa1:	c1 fa 02             	sar    $0x2,%edx
    7fa4:	89 c8                	mov    %ecx,%eax
    7fa6:	c1 f8 1f             	sar    $0x1f,%eax
    7fa9:	29 c2                	sub    %eax,%edx
    7fab:	89 d0                	mov    %edx,%eax
    7fad:	89 c2                	mov    %eax,%edx
    7faf:	89 d0                	mov    %edx,%eax
    7fb1:	c1 e0 03             	shl    $0x3,%eax
    7fb4:	01 d0                	add    %edx,%eax
    7fb6:	c1 e0 04             	shl    $0x4,%eax
    7fb9:	89 c2                	mov    %eax,%edx
    7fbb:	8b 45 0c             	mov    0xc(%ebp),%eax
    7fbe:	8d 34 02             	lea    (%edx,%eax,1),%esi
    7fc1:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    7fc4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7fc9:	89 d8                	mov    %ebx,%eax
    7fcb:	f7 ea                	imul   %edx
    7fcd:	c1 fa 02             	sar    $0x2,%edx
    7fd0:	89 d8                	mov    %ebx,%eax
    7fd2:	c1 f8 1f             	sar    $0x1f,%eax
    7fd5:	89 d1                	mov    %edx,%ecx
    7fd7:	29 c1                	sub    %eax,%ecx
    7fd9:	89 c8                	mov    %ecx,%eax
    7fdb:	c1 e0 03             	shl    $0x3,%eax
    7fde:	01 c8                	add    %ecx,%eax
    7fe0:	01 c0                	add    %eax,%eax
    7fe2:	29 c3                	sub    %eax,%ebx
    7fe4:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    7fe6:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    7fe9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7fee:	89 d8                	mov    %ebx,%eax
    7ff0:	f7 ea                	imul   %edx
    7ff2:	c1 fa 02             	sar    $0x2,%edx
    7ff5:	89 d8                	mov    %ebx,%eax
    7ff7:	c1 f8 1f             	sar    $0x1f,%eax
    7ffa:	29 c2                	sub    %eax,%edx
    7ffc:	89 d0                	mov    %edx,%eax
    7ffe:	89 c2                	mov    %eax,%edx
    8000:	89 d0                	mov    %edx,%eax
    8002:	c1 e0 03             	shl    $0x3,%eax
    8005:	01 d0                	add    %edx,%eax
    8007:	c1 e0 04             	shl    $0x4,%eax
    800a:	89 c2                	mov    %eax,%edx
    800c:	8b 45 08             	mov    0x8(%ebp),%eax
    800f:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8012:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8015:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    801a:	89 d8                	mov    %ebx,%eax
    801c:	f7 ea                	imul   %edx
    801e:	c1 fa 02             	sar    $0x2,%edx
    8021:	89 d8                	mov    %ebx,%eax
    8023:	c1 f8 1f             	sar    $0x1f,%eax
    8026:	29 c2                	sub    %eax,%edx
    8028:	89 d0                	mov    %edx,%eax
    802a:	c1 e0 03             	shl    $0x3,%eax
    802d:	01 d0                	add    %edx,%eax
    802f:	01 c0                	add    %eax,%eax
    8031:	29 c3                	sub    %eax,%ebx
    8033:	89 da                	mov    %ebx,%edx
    8035:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8038:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    803b:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    803f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8042:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8045:	0f 8c 13 ff ff ff    	jl     7f5e <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    804b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    804f:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8053:	0f 8e f9 fe ff ff    	jle    7f52 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    8059:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    805d:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8060:	89 d0                	mov    %edx,%eax
    8062:	c1 e0 03             	shl    $0x3,%eax
    8065:	01 d0                	add    %edx,%eax
    8067:	c1 e0 02             	shl    $0x2,%eax
    806a:	01 d0                	add    %edx,%eax
    806c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    806f:	01 d0                	add    %edx,%eax
    8071:	83 c0 14             	add    $0x14,%eax
    8074:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    807b:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    807e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8081:	8d 48 01             	lea    0x1(%eax),%ecx
    8084:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8087:	89 d0                	mov    %edx,%eax
    8089:	c1 e0 03             	shl    $0x3,%eax
    808c:	01 d0                	add    %edx,%eax
    808e:	c1 e0 02             	shl    $0x2,%eax
    8091:	01 d0                	add    %edx,%eax
    8093:	01 c8                	add    %ecx,%eax
    8095:	83 c0 14             	add    $0x14,%eax
    8098:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    809f:	2b 45 e8             	sub    -0x18(%ebp),%eax
    80a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    80a5:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    80a9:	0f 8e 97 fe ff ff    	jle    7f46 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    80af:	e9 ed 01 00 00       	jmp    82a1 <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    80b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    80bb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    80c2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    80c5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    80cb:	05 d4 dd 00 00       	add    $0xddd4,%eax
    80d0:	8b 40 0c             	mov    0xc(%eax),%eax
    80d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    80d6:	e9 5f 01 00 00       	jmp    823a <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    80db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    80e2:	e9 fd 00 00 00       	jmp    81e4 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    80e7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    80ee:	e9 e1 00 00 00       	jmp    81d4 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    80f3:	8b 55 e8             	mov    -0x18(%ebp),%edx
    80f6:	89 d0                	mov    %edx,%eax
    80f8:	01 c0                	add    %eax,%eax
    80fa:	01 c2                	add    %eax,%edx
    80fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    80ff:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8103:	01 c2                	add    %eax,%edx
    8105:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8108:	01 d0                	add    %edx,%eax
    810a:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    810d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8110:	89 d0                	mov    %edx,%eax
    8112:	01 c0                	add    %eax,%eax
    8114:	01 c2                	add    %eax,%edx
    8116:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8119:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    811c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    811f:	89 d0                	mov    %edx,%eax
    8121:	01 c0                	add    %eax,%eax
    8123:	01 d0                	add    %edx,%eax
    8125:	01 c8                	add    %ecx,%eax
    8127:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    812a:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    812d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8132:	89 c8                	mov    %ecx,%eax
    8134:	f7 ea                	imul   %edx
    8136:	c1 fa 02             	sar    $0x2,%edx
    8139:	89 c8                	mov    %ecx,%eax
    813b:	c1 f8 1f             	sar    $0x1f,%eax
    813e:	29 c2                	sub    %eax,%edx
    8140:	89 d0                	mov    %edx,%eax
    8142:	89 c2                	mov    %eax,%edx
    8144:	89 d0                	mov    %edx,%eax
    8146:	c1 e0 03             	shl    $0x3,%eax
    8149:	01 d0                	add    %edx,%eax
    814b:	c1 e0 04             	shl    $0x4,%eax
    814e:	89 c2                	mov    %eax,%edx
    8150:	8b 45 0c             	mov    0xc(%ebp),%eax
    8153:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8156:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8159:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    815e:	89 d8                	mov    %ebx,%eax
    8160:	f7 ea                	imul   %edx
    8162:	c1 fa 02             	sar    $0x2,%edx
    8165:	89 d8                	mov    %ebx,%eax
    8167:	c1 f8 1f             	sar    $0x1f,%eax
    816a:	89 d1                	mov    %edx,%ecx
    816c:	29 c1                	sub    %eax,%ecx
    816e:	89 c8                	mov    %ecx,%eax
    8170:	c1 e0 03             	shl    $0x3,%eax
    8173:	01 c8                	add    %ecx,%eax
    8175:	01 c0                	add    %eax,%eax
    8177:	29 c3                	sub    %eax,%ebx
    8179:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    817b:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    817e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8183:	89 d8                	mov    %ebx,%eax
    8185:	f7 ea                	imul   %edx
    8187:	c1 fa 02             	sar    $0x2,%edx
    818a:	89 d8                	mov    %ebx,%eax
    818c:	c1 f8 1f             	sar    $0x1f,%eax
    818f:	29 c2                	sub    %eax,%edx
    8191:	89 d0                	mov    %edx,%eax
    8193:	89 c2                	mov    %eax,%edx
    8195:	89 d0                	mov    %edx,%eax
    8197:	c1 e0 03             	shl    $0x3,%eax
    819a:	01 d0                	add    %edx,%eax
    819c:	c1 e0 04             	shl    $0x4,%eax
    819f:	89 c2                	mov    %eax,%edx
    81a1:	8b 45 08             	mov    0x8(%ebp),%eax
    81a4:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    81a7:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    81aa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    81af:	89 d8                	mov    %ebx,%eax
    81b1:	f7 ea                	imul   %edx
    81b3:	c1 fa 02             	sar    $0x2,%edx
    81b6:	89 d8                	mov    %ebx,%eax
    81b8:	c1 f8 1f             	sar    $0x1f,%eax
    81bb:	29 c2                	sub    %eax,%edx
    81bd:	89 d0                	mov    %edx,%eax
    81bf:	c1 e0 03             	shl    $0x3,%eax
    81c2:	01 d0                	add    %edx,%eax
    81c4:	01 c0                	add    %eax,%eax
    81c6:	29 c3                	sub    %eax,%ebx
    81c8:	89 da                	mov    %ebx,%edx
    81ca:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    81cd:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    81d0:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    81d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    81d7:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    81da:	0f 8c 13 ff ff ff    	jl     80f3 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    81e0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    81e4:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    81e8:	0f 8e f9 fe ff ff    	jle    80e7 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    81ee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81f2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    81f5:	89 d0                	mov    %edx,%eax
    81f7:	c1 e0 03             	shl    $0x3,%eax
    81fa:	01 d0                	add    %edx,%eax
    81fc:	c1 e0 02             	shl    $0x2,%eax
    81ff:	01 d0                	add    %edx,%eax
    8201:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8204:	01 d0                	add    %edx,%eax
    8206:	83 c0 14             	add    $0x14,%eax
    8209:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    8210:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8213:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8216:	8d 48 01             	lea    0x1(%eax),%ecx
    8219:	8b 55 d0             	mov    -0x30(%ebp),%edx
    821c:	89 d0                	mov    %edx,%eax
    821e:	c1 e0 03             	shl    $0x3,%eax
    8221:	01 d0                	add    %edx,%eax
    8223:	c1 e0 02             	shl    $0x2,%eax
    8226:	01 d0                	add    %edx,%eax
    8228:	01 c8                	add    %ecx,%eax
    822a:	83 c0 14             	add    $0x14,%eax
    822d:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    8234:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8237:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    823a:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    823e:	0f 8e 97 fe ff ff    	jle    80db <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8244:	eb 5b                	jmp    82a1 <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8246:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    824d:	eb 4c                	jmp    829b <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    824f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8256:	eb 39                	jmp    8291 <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    8258:	8b 55 e0             	mov    -0x20(%ebp),%edx
    825b:	89 d0                	mov    %edx,%eax
    825d:	c1 e0 03             	shl    $0x3,%eax
    8260:	01 d0                	add    %edx,%eax
    8262:	c1 e0 04             	shl    $0x4,%eax
    8265:	89 c2                	mov    %eax,%edx
    8267:	8b 45 0c             	mov    0xc(%ebp),%eax
    826a:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    826d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8270:	89 d0                	mov    %edx,%eax
    8272:	c1 e0 03             	shl    $0x3,%eax
    8275:	01 d0                	add    %edx,%eax
    8277:	c1 e0 04             	shl    $0x4,%eax
    827a:	89 c2                	mov    %eax,%edx
    827c:	8b 45 08             	mov    0x8(%ebp),%eax
    827f:	01 c2                	add    %eax,%edx
    8281:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8284:	dd 04 c2             	fldl   (%edx,%eax,8)
    8287:	8b 45 dc             	mov    -0x24(%ebp),%eax
    828a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    828d:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8291:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8295:	7e c1                	jle    8258 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8297:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    829b:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    829f:	7e ae                	jle    824f <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    82a1:	83 c4 34             	add    $0x34,%esp
    82a4:	5b                   	pop    %ebx
    82a5:	5e                   	pop    %esi
    82a6:	5f                   	pop    %edi
    82a7:	5d                   	pop    %ebp
    82a8:	c3                   	ret    

000082a9 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    82a9:	55                   	push   %ebp
    82aa:	89 e5                	mov    %esp,%ebp
    82ac:	56                   	push   %esi
    82ad:	53                   	push   %ebx
    82ae:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    82b4:	8b 45 18             	mov    0x18(%ebp),%eax
    82b7:	8b 00                	mov    (%eax),%eax
    82b9:	8b 40 10             	mov    0x10(%eax),%eax
    82bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    82bf:	8b 45 18             	mov    0x18(%ebp),%eax
    82c2:	8b 40 08             	mov    0x8(%eax),%eax
    82c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    82c8:	8b 45 18             	mov    0x18(%ebp),%eax
    82cb:	8b 00                	mov    (%eax),%eax
    82cd:	8b 40 1c             	mov    0x1c(%eax),%eax
    82d0:	83 f8 01             	cmp    $0x1,%eax
    82d3:	75 16                	jne    82eb <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    82d5:	8b 45 18             	mov    0x18(%ebp),%eax
    82d8:	8b 00                	mov    (%eax),%eax
    82da:	8b 40 20             	mov    0x20(%eax),%eax
    82dd:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    82e0:	85 c0                	test   %eax,%eax
    82e2:	74 07                	je     82eb <III_stereo+0x42>
    82e4:	b8 01 00 00 00       	mov    $0x1,%eax
    82e9:	eb 05                	jmp    82f0 <III_stereo+0x47>
    82eb:	b8 00 00 00 00       	mov    $0x0,%eax
    82f0:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    82f3:	8b 45 18             	mov    0x18(%ebp),%eax
    82f6:	8b 00                	mov    (%eax),%eax
    82f8:	8b 40 1c             	mov    0x1c(%eax),%eax
    82fb:	83 f8 01             	cmp    $0x1,%eax
    82fe:	75 16                	jne    8316 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8300:	8b 45 18             	mov    0x18(%ebp),%eax
    8303:	8b 00                	mov    (%eax),%eax
    8305:	8b 40 20             	mov    0x20(%eax),%eax
    8308:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    830b:	85 c0                	test   %eax,%eax
    830d:	74 07                	je     8316 <III_stereo+0x6d>
    830f:	b8 01 00 00 00       	mov    $0x1,%eax
    8314:	eb 05                	jmp    831b <III_stereo+0x72>
    8316:	b8 00 00 00 00       	mov    $0x0,%eax
    831b:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    831e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8325:	eb 12                	jmp    8339 <III_stereo+0x90>
      is_pos[i] = 7;
    8327:	8b 45 f0             	mov    -0x10(%ebp),%eax
    832a:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8331:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8335:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8339:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8340:	7e e5                	jle    8327 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8342:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8346:	0f 85 18 0a 00 00    	jne    8d64 <III_stereo+0xabb>
    834c:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8350:	0f 84 0e 0a 00 00    	je     8d64 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8356:	8b 45 14             	mov    0x14(%ebp),%eax
    8359:	8b 40 10             	mov    0x10(%eax),%eax
    835c:	85 c0                	test   %eax,%eax
    835e:	0f 84 10 08 00 00    	je     8b74 <III_stereo+0x8cb>
    8364:	8b 45 14             	mov    0x14(%ebp),%eax
    8367:	8b 40 14             	mov    0x14(%eax),%eax
    836a:	83 f8 02             	cmp    $0x2,%eax
    836d:	0f 85 01 08 00 00    	jne    8b74 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    8373:	8b 45 14             	mov    0x14(%ebp),%eax
    8376:	8b 40 18             	mov    0x18(%eax),%eax
    8379:	85 c0                	test   %eax,%eax
    837b:	0f 84 d0 04 00 00    	je     8851 <III_stereo+0x5a8>
         {  int max_sfb = 0;
    8381:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8388:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    838f:	e9 1b 03 00 00       	jmp    86af <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    8394:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    839b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    83a2:	e9 0f 01 00 00       	jmp    84b6 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    83a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83aa:	8d 48 01             	lea    0x1(%eax),%ecx
    83ad:	8b 55 c8             	mov    -0x38(%ebp),%edx
    83b0:	89 d0                	mov    %edx,%eax
    83b2:	c1 e0 03             	shl    $0x3,%eax
    83b5:	01 d0                	add    %edx,%eax
    83b7:	c1 e0 02             	shl    $0x2,%eax
    83ba:	01 d0                	add    %edx,%eax
    83bc:	01 c8                	add    %ecx,%eax
    83be:	83 c0 14             	add    $0x14,%eax
    83c1:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
    83c8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    83cb:	89 d0                	mov    %edx,%eax
    83cd:	c1 e0 03             	shl    $0x3,%eax
    83d0:	01 d0                	add    %edx,%eax
    83d2:	c1 e0 02             	shl    $0x2,%eax
    83d5:	01 d0                	add    %edx,%eax
    83d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    83da:	01 d0                	add    %edx,%eax
    83dc:	83 c0 14             	add    $0x14,%eax
    83df:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    83e6:	29 c1                	sub    %eax,%ecx
    83e8:	89 c8                	mov    %ecx,%eax
    83ea:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    83ed:	8b 55 c8             	mov    -0x38(%ebp),%edx
    83f0:	89 d0                	mov    %edx,%eax
    83f2:	c1 e0 03             	shl    $0x3,%eax
    83f5:	01 d0                	add    %edx,%eax
    83f7:	c1 e0 02             	shl    $0x2,%eax
    83fa:	01 d0                	add    %edx,%eax
    83fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    83ff:	01 d0                	add    %edx,%eax
    8401:	83 c0 14             	add    $0x14,%eax
    8404:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    840b:	89 d0                	mov    %edx,%eax
    840d:	01 c0                	add    %eax,%eax
    840f:	01 c2                	add    %eax,%edx
    8411:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8414:	83 c0 01             	add    $0x1,%eax
    8417:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    841b:	01 d0                	add    %edx,%eax
    841d:	83 e8 01             	sub    $0x1,%eax
    8420:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8423:	e9 80 00 00 00       	jmp    84a8 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8428:	8b 45 08             	mov    0x8(%ebp),%eax
    842b:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8431:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8434:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8439:	89 c8                	mov    %ecx,%eax
    843b:	f7 ea                	imul   %edx
    843d:	c1 fa 02             	sar    $0x2,%edx
    8440:	89 c8                	mov    %ecx,%eax
    8442:	c1 f8 1f             	sar    $0x1f,%eax
    8445:	89 d3                	mov    %edx,%ebx
    8447:	29 c3                	sub    %eax,%ebx
    8449:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    844c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8451:	89 c8                	mov    %ecx,%eax
    8453:	f7 ea                	imul   %edx
    8455:	c1 fa 02             	sar    $0x2,%edx
    8458:	89 c8                	mov    %ecx,%eax
    845a:	c1 f8 1f             	sar    $0x1f,%eax
    845d:	29 c2                	sub    %eax,%edx
    845f:	89 d0                	mov    %edx,%eax
    8461:	c1 e0 03             	shl    $0x3,%eax
    8464:	01 d0                	add    %edx,%eax
    8466:	01 c0                	add    %eax,%eax
    8468:	29 c1                	sub    %eax,%ecx
    846a:	89 ca                	mov    %ecx,%edx
    846c:	89 d8                	mov    %ebx,%eax
    846e:	c1 e0 03             	shl    $0x3,%eax
    8471:	01 d8                	add    %ebx,%eax
    8473:	01 c0                	add    %eax,%eax
    8475:	01 d0                	add    %edx,%eax
    8477:	dd 04 c6             	fldl   (%esi,%eax,8)
    847a:	d9 ee                	fldz   
    847c:	df e9                	fucomip %st(1),%st
    847e:	7a 0a                	jp     848a <III_stereo+0x1e1>
    8480:	d9 ee                	fldz   
    8482:	df e9                	fucomip %st(1),%st
    8484:	dd d8                	fstp   %st(0)
    8486:	74 18                	je     84a0 <III_stereo+0x1f7>
    8488:	eb 02                	jmp    848c <III_stereo+0x1e3>
    848a:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    848c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    848f:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    8492:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8499:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    84a0:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    84a4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    84a8:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    84ac:	0f 8f 76 ff ff ff    	jg     8428 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    84b2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    84b6:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    84ba:	0f 8f e7 fe ff ff    	jg     83a7 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    84c0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    84c3:	83 c0 01             	add    $0x1,%eax
    84c6:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    84c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84cc:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    84cf:	7e 0b                	jle    84dc <III_stereo+0x233>
                  max_sfb = sfb;
    84d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84d4:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    84d7:	e9 f5 00 00 00       	jmp    85d1 <III_stereo+0x328>
    84dc:	e9 f0 00 00 00       	jmp    85d1 <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    84e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84e4:	8d 48 01             	lea    0x1(%eax),%ecx
    84e7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    84ea:	89 d0                	mov    %edx,%eax
    84ec:	c1 e0 03             	shl    $0x3,%eax
    84ef:	01 d0                	add    %edx,%eax
    84f1:	c1 e0 02             	shl    $0x2,%eax
    84f4:	01 d0                	add    %edx,%eax
    84f6:	01 c8                	add    %ecx,%eax
    84f8:	83 c0 14             	add    $0x14,%eax
    84fb:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
    8502:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8505:	89 d0                	mov    %edx,%eax
    8507:	c1 e0 03             	shl    $0x3,%eax
    850a:	01 d0                	add    %edx,%eax
    850c:	c1 e0 02             	shl    $0x2,%eax
    850f:	01 d0                	add    %edx,%eax
    8511:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8514:	01 d0                	add    %edx,%eax
    8516:	83 c0 14             	add    $0x14,%eax
    8519:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    8520:	29 c1                	sub    %eax,%ecx
    8522:	89 c8                	mov    %ecx,%eax
    8524:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8527:	8b 55 c8             	mov    -0x38(%ebp),%edx
    852a:	89 d0                	mov    %edx,%eax
    852c:	c1 e0 03             	shl    $0x3,%eax
    852f:	01 d0                	add    %edx,%eax
    8531:	c1 e0 02             	shl    $0x2,%eax
    8534:	01 d0                	add    %edx,%eax
    8536:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8539:	01 d0                	add    %edx,%eax
    853b:	83 c0 14             	add    $0x14,%eax
    853e:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    8545:	89 d0                	mov    %edx,%eax
    8547:	01 c0                	add    %eax,%eax
    8549:	01 c2                	add    %eax,%edx
    854b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    854e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8552:	01 d0                	add    %edx,%eax
    8554:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8557:	eb 6e                	jmp    85c7 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8559:	8b 4d 10             	mov    0x10(%ebp),%ecx
    855c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    855f:	89 d0                	mov    %edx,%eax
    8561:	01 c0                	add    %eax,%eax
    8563:	01 d0                	add    %edx,%eax
    8565:	c1 e0 02             	shl    $0x2,%eax
    8568:	01 d0                	add    %edx,%eax
    856a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    856d:	01 d0                	add    %edx,%eax
    856f:	83 c0 52             	add    $0x52,%eax
    8572:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8576:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8579:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8580:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8583:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    858a:	83 f8 07             	cmp    $0x7,%eax
    858d:	74 30                	je     85bf <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    858f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8592:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8599:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    859f:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    85a5:	dd 05 60 c9 00 00    	fldl   0xc960
    85ab:	de c9                	fmulp  %st,%st(1)
    85ad:	dd 1c 24             	fstpl  (%esp)
    85b0:	e8 1d b6 ff ff       	call   3bd2 <tan>
    85b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85b8:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    85bf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    85c3:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    85c7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    85cb:	7f 8c                	jg     8559 <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    85cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    85d1:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    85d5:	0f 8e 06 ff ff ff    	jle    84e1 <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    85db:	8b 45 c8             	mov    -0x38(%ebp),%eax
    85de:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    85e4:	05 fc dd 00 00       	add    $0xddfc,%eax
    85e9:	8b 50 0c             	mov    0xc(%eax),%edx
    85ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
    85ef:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    85f5:	05 f8 dd 00 00       	add    $0xddf8,%eax
    85fa:	8b 40 0c             	mov    0xc(%eax),%eax
    85fd:	29 c2                	sub    %eax,%edx
    85ff:	89 d0                	mov    %edx,%eax
    8601:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8604:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8607:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    860d:	05 f8 dd 00 00       	add    $0xddf8,%eax
    8612:	8b 50 0c             	mov    0xc(%eax),%edx
    8615:	89 d0                	mov    %edx,%eax
    8617:	01 c0                	add    %eax,%eax
    8619:	01 c2                	add    %eax,%edx
    861b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    861e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8622:	01 d0                	add    %edx,%eax
    8624:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8627:	8b 45 c8             	mov    -0x38(%ebp),%eax
    862a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8630:	05 00 de 00 00       	add    $0xde00,%eax
    8635:	8b 50 0c             	mov    0xc(%eax),%edx
    8638:	8b 45 c8             	mov    -0x38(%ebp),%eax
    863b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8641:	05 fc dd 00 00       	add    $0xddfc,%eax
    8646:	8b 40 0c             	mov    0xc(%eax),%eax
    8649:	29 c2                	sub    %eax,%edx
    864b:	89 d0                	mov    %edx,%eax
    864d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8650:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8653:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8659:	05 fc dd 00 00       	add    $0xddfc,%eax
    865e:	8b 50 0c             	mov    0xc(%eax),%edx
    8661:	89 d0                	mov    %edx,%eax
    8663:	01 c0                	add    %eax,%eax
    8665:	01 c2                	add    %eax,%edx
    8667:	8b 45 ec             	mov    -0x14(%ebp),%eax
    866a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    866e:	01 d0                	add    %edx,%eax
    8670:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8673:	eb 30                	jmp    86a5 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    8675:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8678:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    867f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8682:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8689:	8b 45 f4             	mov    -0xc(%ebp),%eax
    868c:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8693:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8696:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    869d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    86a1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    86a5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    86a9:	7f ca                	jg     8675 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    86ab:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    86af:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    86b3:	0f 8e db fc ff ff    	jle    8394 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    86b9:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    86bd:	0f 8f 89 01 00 00    	jg     884c <III_stereo+0x5a3>
             {  i = 2;
    86c3:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    86ca:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    86d1:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    86d8:	eb 63                	jmp    873d <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    86da:	8b 45 08             	mov    0x8(%ebp),%eax
    86dd:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    86e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    86e6:	89 d0                	mov    %edx,%eax
    86e8:	c1 e0 03             	shl    $0x3,%eax
    86eb:	01 d0                	add    %edx,%eax
    86ed:	01 c0                	add    %eax,%eax
    86ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    86f2:	01 d0                	add    %edx,%eax
    86f4:	dd 04 c1             	fldl   (%ecx,%eax,8)
    86f7:	d9 ee                	fldz   
    86f9:	df e9                	fucomip %st(1),%st
    86fb:	7a 0a                	jp     8707 <III_stereo+0x45e>
    86fd:	d9 ee                	fldz   
    86ff:	df e9                	fucomip %st(1),%st
    8701:	dd d8                	fstp   %st(0)
    8703:	74 23                	je     8728 <III_stereo+0x47f>
    8705:	eb 02                	jmp    8709 <III_stereo+0x460>
    8707:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    8709:	8b 55 f0             	mov    -0x10(%ebp),%edx
    870c:	89 d0                	mov    %edx,%eax
    870e:	c1 e0 03             	shl    $0x3,%eax
    8711:	01 d0                	add    %edx,%eax
    8713:	01 c0                	add    %eax,%eax
    8715:	89 c2                	mov    %eax,%edx
    8717:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    871a:	01 d0                	add    %edx,%eax
    871c:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    871f:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    8726:	eb 15                	jmp    873d <III_stereo+0x494>
                   } else
                   {  ss--;
    8728:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    872c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8730:	79 0b                	jns    873d <III_stereo+0x494>
                      {  i--;
    8732:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    8736:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    873d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8741:	79 97                	jns    86da <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    8743:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    874a:	eb 04                	jmp    8750 <III_stereo+0x4a7>
                   i++;
    874c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8750:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8753:	89 d0                	mov    %edx,%eax
    8755:	c1 e0 03             	shl    $0x3,%eax
    8758:	01 d0                	add    %edx,%eax
    875a:	c1 e0 02             	shl    $0x2,%eax
    875d:	01 d0                	add    %edx,%eax
    875f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8762:	01 d0                	add    %edx,%eax
    8764:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    876b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    876e:	7e dc                	jle    874c <III_stereo+0x4a3>
                   i++;
                sfb = i;
    8770:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8773:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    8776:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8779:	89 d0                	mov    %edx,%eax
    877b:	c1 e0 03             	shl    $0x3,%eax
    877e:	01 d0                	add    %edx,%eax
    8780:	c1 e0 02             	shl    $0x2,%eax
    8783:	01 d0                	add    %edx,%eax
    8785:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8788:	01 d0                	add    %edx,%eax
    878a:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    8791:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    8794:	e9 a9 00 00 00       	jmp    8842 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    8799:	8b 45 f4             	mov    -0xc(%ebp),%eax
    879c:	8d 48 01             	lea    0x1(%eax),%ecx
    879f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    87a2:	89 d0                	mov    %edx,%eax
    87a4:	c1 e0 03             	shl    $0x3,%eax
    87a7:	01 d0                	add    %edx,%eax
    87a9:	c1 e0 02             	shl    $0x2,%eax
    87ac:	01 d0                	add    %edx,%eax
    87ae:	01 c8                	add    %ecx,%eax
    87b0:	8b 0c 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%ecx
    87b7:	8b 55 c8             	mov    -0x38(%ebp),%edx
    87ba:	89 d0                	mov    %edx,%eax
    87bc:	c1 e0 03             	shl    $0x3,%eax
    87bf:	01 d0                	add    %edx,%eax
    87c1:	c1 e0 02             	shl    $0x2,%eax
    87c4:	01 d0                	add    %edx,%eax
    87c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
    87c9:	01 d0                	add    %edx,%eax
    87cb:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    87d2:	29 c1                	sub    %eax,%ecx
    87d4:	89 c8                	mov    %ecx,%eax
    87d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    87d9:	eb 5d                	jmp    8838 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    87db:	8b 45 10             	mov    0x10(%ebp),%eax
    87de:	8b 55 f4             	mov    -0xc(%ebp),%edx
    87e1:	83 c2 3e             	add    $0x3e,%edx
    87e4:	8b 14 90             	mov    (%eax,%edx,4),%edx
    87e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87ea:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    87f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87f4:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    87fb:	83 f8 07             	cmp    $0x7,%eax
    87fe:	74 30                	je     8830 <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8800:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8803:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    880a:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8810:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8816:	dd 05 60 c9 00 00    	fldl   0xc960
    881c:	de c9                	fmulp  %st,%st(1)
    881e:	dd 1c 24             	fstpl  (%esp)
    8821:	e8 ac b3 ff ff       	call   3bd2 <tan>
    8826:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8829:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    8830:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    8834:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8838:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    883c:	7f 9d                	jg     87db <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    883e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8842:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8846:	0f 8e 4d ff ff ff    	jle    8799 <III_stereo+0x4f0>
    884c:	e9 1e 03 00 00       	jmp    8b6f <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8851:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8858:	e9 08 03 00 00       	jmp    8b65 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    885d:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    8864:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    886b:	e9 0f 01 00 00       	jmp    897f <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8870:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8873:	8d 48 01             	lea    0x1(%eax),%ecx
    8876:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8879:	89 d0                	mov    %edx,%eax
    887b:	c1 e0 03             	shl    $0x3,%eax
    887e:	01 d0                	add    %edx,%eax
    8880:	c1 e0 02             	shl    $0x2,%eax
    8883:	01 d0                	add    %edx,%eax
    8885:	01 c8                	add    %ecx,%eax
    8887:	83 c0 14             	add    $0x14,%eax
    888a:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
    8891:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8894:	89 d0                	mov    %edx,%eax
    8896:	c1 e0 03             	shl    $0x3,%eax
    8899:	01 d0                	add    %edx,%eax
    889b:	c1 e0 02             	shl    $0x2,%eax
    889e:	01 d0                	add    %edx,%eax
    88a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    88a3:	01 d0                	add    %edx,%eax
    88a5:	83 c0 14             	add    $0x14,%eax
    88a8:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    88af:	29 c1                	sub    %eax,%ecx
    88b1:	89 c8                	mov    %ecx,%eax
    88b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    88b6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    88b9:	89 d0                	mov    %edx,%eax
    88bb:	c1 e0 03             	shl    $0x3,%eax
    88be:	01 d0                	add    %edx,%eax
    88c0:	c1 e0 02             	shl    $0x2,%eax
    88c3:	01 d0                	add    %edx,%eax
    88c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    88c8:	01 d0                	add    %edx,%eax
    88ca:	83 c0 14             	add    $0x14,%eax
    88cd:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    88d4:	89 d0                	mov    %edx,%eax
    88d6:	01 c0                	add    %eax,%eax
    88d8:	01 c2                	add    %eax,%edx
    88da:	8b 45 ec             	mov    -0x14(%ebp),%eax
    88dd:	83 c0 01             	add    $0x1,%eax
    88e0:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    88e4:	01 d0                	add    %edx,%eax
    88e6:	83 e8 01             	sub    $0x1,%eax
    88e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    88ec:	e9 80 00 00 00       	jmp    8971 <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    88f1:	8b 45 08             	mov    0x8(%ebp),%eax
    88f4:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    88fa:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    88fd:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8902:	89 c8                	mov    %ecx,%eax
    8904:	f7 ea                	imul   %edx
    8906:	c1 fa 02             	sar    $0x2,%edx
    8909:	89 c8                	mov    %ecx,%eax
    890b:	c1 f8 1f             	sar    $0x1f,%eax
    890e:	89 d3                	mov    %edx,%ebx
    8910:	29 c3                	sub    %eax,%ebx
    8912:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8915:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    891a:	89 c8                	mov    %ecx,%eax
    891c:	f7 ea                	imul   %edx
    891e:	c1 fa 02             	sar    $0x2,%edx
    8921:	89 c8                	mov    %ecx,%eax
    8923:	c1 f8 1f             	sar    $0x1f,%eax
    8926:	29 c2                	sub    %eax,%edx
    8928:	89 d0                	mov    %edx,%eax
    892a:	c1 e0 03             	shl    $0x3,%eax
    892d:	01 d0                	add    %edx,%eax
    892f:	01 c0                	add    %eax,%eax
    8931:	29 c1                	sub    %eax,%ecx
    8933:	89 ca                	mov    %ecx,%edx
    8935:	89 d8                	mov    %ebx,%eax
    8937:	c1 e0 03             	shl    $0x3,%eax
    893a:	01 d8                	add    %ebx,%eax
    893c:	01 c0                	add    %eax,%eax
    893e:	01 d0                	add    %edx,%eax
    8940:	dd 04 c6             	fldl   (%esi,%eax,8)
    8943:	d9 ee                	fldz   
    8945:	df e9                	fucomip %st(1),%st
    8947:	7a 0a                	jp     8953 <III_stereo+0x6aa>
    8949:	d9 ee                	fldz   
    894b:	df e9                	fucomip %st(1),%st
    894d:	dd d8                	fstp   %st(0)
    894f:	74 18                	je     8969 <III_stereo+0x6c0>
    8951:	eb 02                	jmp    8955 <III_stereo+0x6ac>
    8953:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8955:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8958:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    895b:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8962:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    8969:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    896d:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8971:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    8975:	0f 8f 76 ff ff ff    	jg     88f1 <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    897b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    897f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8983:	0f 89 e7 fe ff ff    	jns    8870 <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8989:	8b 45 d0             	mov    -0x30(%ebp),%eax
    898c:	83 c0 01             	add    $0x1,%eax
    898f:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    8992:	e9 f0 00 00 00       	jmp    8a87 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8997:	8b 45 f4             	mov    -0xc(%ebp),%eax
    899a:	8d 48 01             	lea    0x1(%eax),%ecx
    899d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    89a0:	89 d0                	mov    %edx,%eax
    89a2:	c1 e0 03             	shl    $0x3,%eax
    89a5:	01 d0                	add    %edx,%eax
    89a7:	c1 e0 02             	shl    $0x2,%eax
    89aa:	01 d0                	add    %edx,%eax
    89ac:	01 c8                	add    %ecx,%eax
    89ae:	83 c0 14             	add    $0x14,%eax
    89b1:	8b 0c 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%ecx
    89b8:	8b 55 c8             	mov    -0x38(%ebp),%edx
    89bb:	89 d0                	mov    %edx,%eax
    89bd:	c1 e0 03             	shl    $0x3,%eax
    89c0:	01 d0                	add    %edx,%eax
    89c2:	c1 e0 02             	shl    $0x2,%eax
    89c5:	01 d0                	add    %edx,%eax
    89c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    89ca:	01 d0                	add    %edx,%eax
    89cc:	83 c0 14             	add    $0x14,%eax
    89cf:	8b 04 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%eax
    89d6:	29 c1                	sub    %eax,%ecx
    89d8:	89 c8                	mov    %ecx,%eax
    89da:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    89dd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    89e0:	89 d0                	mov    %edx,%eax
    89e2:	c1 e0 03             	shl    $0x3,%eax
    89e5:	01 d0                	add    %edx,%eax
    89e7:	c1 e0 02             	shl    $0x2,%eax
    89ea:	01 d0                	add    %edx,%eax
    89ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
    89ef:	01 d0                	add    %edx,%eax
    89f1:	83 c0 14             	add    $0x14,%eax
    89f4:	8b 14 85 8c dd 00 00 	mov    0xdd8c(,%eax,4),%edx
    89fb:	89 d0                	mov    %edx,%eax
    89fd:	01 c0                	add    %eax,%eax
    89ff:	01 c2                	add    %eax,%edx
    8a01:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8a04:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8a08:	01 d0                	add    %edx,%eax
    8a0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8a0d:	eb 6e                	jmp    8a7d <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8a0f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8a12:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8a15:	89 d0                	mov    %edx,%eax
    8a17:	01 c0                	add    %eax,%eax
    8a19:	01 d0                	add    %edx,%eax
    8a1b:	c1 e0 02             	shl    $0x2,%eax
    8a1e:	01 d0                	add    %edx,%eax
    8a20:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8a23:	01 d0                	add    %edx,%eax
    8a25:	83 c0 52             	add    $0x52,%eax
    8a28:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a2f:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8a36:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a39:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8a40:	83 f8 07             	cmp    $0x7,%eax
    8a43:	74 30                	je     8a75 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8a45:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a48:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8a4f:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8a55:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8a5b:	dd 05 60 c9 00 00    	fldl   0xc960
    8a61:	de c9                	fmulp  %st,%st(1)
    8a63:	dd 1c 24             	fstpl  (%esp)
    8a66:	e8 67 b1 ff ff       	call   3bd2 <tan>
    8a6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a6e:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    8a75:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    8a79:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8a7d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8a81:	7f 8c                	jg     8a0f <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    8a83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    8a87:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8a8b:	0f 8e 06 ff ff ff    	jle    8997 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    8a91:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8a94:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8a9a:	05 fc dd 00 00       	add    $0xddfc,%eax
    8a9f:	8b 50 0c             	mov    0xc(%eax),%edx
    8aa2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8aa5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8aab:	05 f8 dd 00 00       	add    $0xddf8,%eax
    8ab0:	8b 40 0c             	mov    0xc(%eax),%eax
    8ab3:	29 c2                	sub    %eax,%edx
    8ab5:	89 d0                	mov    %edx,%eax
    8ab7:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8aba:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8abd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ac3:	05 f8 dd 00 00       	add    $0xddf8,%eax
    8ac8:	8b 50 0c             	mov    0xc(%eax),%edx
    8acb:	89 d0                	mov    %edx,%eax
    8acd:	01 c0                	add    %eax,%eax
    8acf:	01 c2                	add    %eax,%edx
    8ad1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8ad4:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8ad8:	01 d0                	add    %edx,%eax
    8ada:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8add:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8ae0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8ae6:	05 00 de 00 00       	add    $0xde00,%eax
    8aeb:	8b 50 0c             	mov    0xc(%eax),%edx
    8aee:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8af1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8af7:	05 fc dd 00 00       	add    $0xddfc,%eax
    8afc:	8b 40 0c             	mov    0xc(%eax),%eax
    8aff:	29 c2                	sub    %eax,%edx
    8b01:	89 d0                	mov    %edx,%eax
    8b03:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8b06:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8b09:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8b0f:	05 fc dd 00 00       	add    $0xddfc,%eax
    8b14:	8b 50 0c             	mov    0xc(%eax),%edx
    8b17:	89 d0                	mov    %edx,%eax
    8b19:	01 c0                	add    %eax,%eax
    8b1b:	01 c2                	add    %eax,%edx
    8b1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b20:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8b24:	01 d0                	add    %edx,%eax
    8b26:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8b29:	eb 30                	jmp    8b5b <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    8b2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b2e:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8b35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b38:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8b3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8b42:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8b49:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8b4c:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    8b53:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    8b57:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8b5b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8b5f:	7f ca                	jg     8b2b <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8b61:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8b65:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8b69:	0f 8e ee fc ff ff    	jle    885d <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    8b6f:	e9 f0 01 00 00       	jmp    8d64 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    8b74:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    8b7b:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    8b82:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    8b89:	eb 63                	jmp    8bee <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    8b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    8b8e:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8b94:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8b97:	89 d0                	mov    %edx,%eax
    8b99:	c1 e0 03             	shl    $0x3,%eax
    8b9c:	01 d0                	add    %edx,%eax
    8b9e:	01 c0                	add    %eax,%eax
    8ba0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8ba3:	01 d0                	add    %edx,%eax
    8ba5:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8ba8:	d9 ee                	fldz   
    8baa:	df e9                	fucomip %st(1),%st
    8bac:	7a 0a                	jp     8bb8 <III_stereo+0x90f>
    8bae:	d9 ee                	fldz   
    8bb0:	df e9                	fucomip %st(1),%st
    8bb2:	dd d8                	fstp   %st(0)
    8bb4:	74 23                	je     8bd9 <III_stereo+0x930>
    8bb6:	eb 02                	jmp    8bba <III_stereo+0x911>
    8bb8:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    8bba:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8bbd:	89 d0                	mov    %edx,%eax
    8bbf:	c1 e0 03             	shl    $0x3,%eax
    8bc2:	01 d0                	add    %edx,%eax
    8bc4:	01 c0                	add    %eax,%eax
    8bc6:	89 c2                	mov    %eax,%edx
    8bc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8bcb:	01 d0                	add    %edx,%eax
    8bcd:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    8bd0:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    8bd7:	eb 15                	jmp    8bee <III_stereo+0x945>
            } else
            {  ss--;
    8bd9:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    8bdd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8be1:	79 0b                	jns    8bee <III_stereo+0x945>
               {  i--;
    8be3:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    8be7:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    8bee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8bf2:	79 97                	jns    8b8b <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    8bf4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    8bfb:	eb 04                	jmp    8c01 <III_stereo+0x958>
            i++;
    8bfd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    8c01:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c04:	89 d0                	mov    %edx,%eax
    8c06:	c1 e0 03             	shl    $0x3,%eax
    8c09:	01 d0                	add    %edx,%eax
    8c0b:	c1 e0 02             	shl    $0x2,%eax
    8c0e:	01 d0                	add    %edx,%eax
    8c10:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c13:	01 d0                	add    %edx,%eax
    8c15:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    8c1c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8c1f:	7e dc                	jle    8bfd <III_stereo+0x954>
            i++;
         sfb = i;
    8c21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c24:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    8c27:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c2a:	89 d0                	mov    %edx,%eax
    8c2c:	c1 e0 03             	shl    $0x3,%eax
    8c2f:	01 d0                	add    %edx,%eax
    8c31:	c1 e0 02             	shl    $0x2,%eax
    8c34:	01 d0                	add    %edx,%eax
    8c36:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c39:	01 d0                	add    %edx,%eax
    8c3b:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    8c42:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    8c45:	e9 a9 00 00 00       	jmp    8cf3 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    8c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c4d:	8d 48 01             	lea    0x1(%eax),%ecx
    8c50:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c53:	89 d0                	mov    %edx,%eax
    8c55:	c1 e0 03             	shl    $0x3,%eax
    8c58:	01 d0                	add    %edx,%eax
    8c5a:	c1 e0 02             	shl    $0x2,%eax
    8c5d:	01 d0                	add    %edx,%eax
    8c5f:	01 c8                	add    %ecx,%eax
    8c61:	8b 0c 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%ecx
    8c68:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c6b:	89 d0                	mov    %edx,%eax
    8c6d:	c1 e0 03             	shl    $0x3,%eax
    8c70:	01 d0                	add    %edx,%eax
    8c72:	c1 e0 02             	shl    $0x2,%eax
    8c75:	01 d0                	add    %edx,%eax
    8c77:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8c7a:	01 d0                	add    %edx,%eax
    8c7c:	8b 04 85 80 dd 00 00 	mov    0xdd80(,%eax,4),%eax
    8c83:	29 c1                	sub    %eax,%ecx
    8c85:	89 c8                	mov    %ecx,%eax
    8c87:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    8c8a:	eb 5d                	jmp    8ce9 <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    8c8c:	8b 45 10             	mov    0x10(%ebp),%eax
    8c8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8c92:	83 c2 3e             	add    $0x3e,%edx
    8c95:	8b 14 90             	mov    (%eax,%edx,4),%edx
    8c98:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c9b:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    8ca2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ca5:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8cac:	83 f8 07             	cmp    $0x7,%eax
    8caf:	74 30                	je     8ce1 <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8cb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cb4:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8cbb:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8cc1:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8cc7:	dd 05 60 c9 00 00    	fldl   0xc960
    8ccd:	de c9                	fmulp  %st,%st(1)
    8ccf:	dd 1c 24             	fstpl  (%esp)
    8cd2:	e8 fb ae ff ff       	call   3bd2 <tan>
    8cd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cda:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    8ce1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    8ce5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8ce9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8ced:	7f 9d                	jg     8c8c <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    8cef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8cf3:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    8cf7:	0f 8e 4d ff ff ff    	jle    8c4a <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    8cfd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d00:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d06:	05 d0 dd 00 00       	add    $0xddd0,%eax
    8d0b:	8b 00                	mov    (%eax),%eax
    8d0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    8d10:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d13:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d19:	05 d4 dd 00 00       	add    $0xddd4,%eax
    8d1e:	8b 00                	mov    (%eax),%eax
    8d20:	ba 40 02 00 00       	mov    $0x240,%edx
    8d25:	29 c2                	sub    %eax,%edx
    8d27:	89 d0                	mov    %edx,%eax
    8d29:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8d2c:	eb 30                	jmp    8d5e <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    8d2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d31:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8d38:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d3b:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    8d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d45:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8d4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d4f:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    8d56:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    8d5a:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8d5e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8d62:	7f ca                	jg     8d2e <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    8d64:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8d6b:	eb 55                	jmp    8dc2 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    8d6d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8d74:	eb 42                	jmp    8db8 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    8d76:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8d7d:	eb 2f                	jmp    8dae <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    8d7f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8d82:	89 d0                	mov    %edx,%eax
    8d84:	c1 e0 03             	shl    $0x3,%eax
    8d87:	01 d0                	add    %edx,%eax
    8d89:	c1 e0 09             	shl    $0x9,%eax
    8d8c:	89 c2                	mov    %eax,%edx
    8d8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8d91:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8d94:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8d97:	89 d0                	mov    %edx,%eax
    8d99:	c1 e0 03             	shl    $0x3,%eax
    8d9c:	01 d0                	add    %edx,%eax
    8d9e:	01 c0                	add    %eax,%eax
    8da0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8da3:	01 d0                	add    %edx,%eax
    8da5:	d9 ee                	fldz   
    8da7:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    8daa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8dae:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    8db2:	7e cb                	jle    8d7f <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    8db4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8db8:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    8dbc:	7e b8                	jle    8d76 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    8dbe:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8dc2:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    8dc6:	7e a5                	jle    8d6d <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    8dc8:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8dcc:	0f 85 3d 02 00 00    	jne    900f <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    8dd2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8dd9:	e9 25 02 00 00       	jmp    9003 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    8dde:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    8de5:	e9 0b 02 00 00       	jmp    8ff5 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    8dea:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8ded:	89 d0                	mov    %edx,%eax
    8def:	c1 e0 03             	shl    $0x3,%eax
    8df2:	01 d0                	add    %edx,%eax
    8df4:	01 c0                	add    %eax,%eax
    8df6:	89 c2                	mov    %eax,%edx
    8df8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8dfb:	01 d0                	add    %edx,%eax
    8dfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    8e00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e03:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8e0a:	83 f8 07             	cmp    $0x7,%eax
    8e0d:	0f 85 2c 01 00 00    	jne    8f3f <III_stereo+0xc96>
               if ( ms_stereo ) {
    8e13:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    8e17:	0f 84 b5 00 00 00    	je     8ed2 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    8e1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8e20:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8e23:	89 d0                	mov    %edx,%eax
    8e25:	c1 e0 03             	shl    $0x3,%eax
    8e28:	01 d0                	add    %edx,%eax
    8e2a:	01 c0                	add    %eax,%eax
    8e2c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8e2f:	01 d0                	add    %edx,%eax
    8e31:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8e34:	8b 45 08             	mov    0x8(%ebp),%eax
    8e37:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8e3d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8e40:	89 d0                	mov    %edx,%eax
    8e42:	c1 e0 03             	shl    $0x3,%eax
    8e45:	01 d0                	add    %edx,%eax
    8e47:	01 c0                	add    %eax,%eax
    8e49:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8e4c:	01 d0                	add    %edx,%eax
    8e4e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8e51:	de c1                	faddp  %st,%st(1)
    8e53:	dd 05 68 c9 00 00    	fldl   0xc968
    8e59:	de f9                	fdivrp %st,%st(1)
    8e5b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8e5e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8e61:	89 d0                	mov    %edx,%eax
    8e63:	c1 e0 03             	shl    $0x3,%eax
    8e66:	01 d0                	add    %edx,%eax
    8e68:	01 c0                	add    %eax,%eax
    8e6a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8e6d:	01 d0                	add    %edx,%eax
    8e6f:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    8e72:	8b 45 0c             	mov    0xc(%ebp),%eax
    8e75:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    8e7b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8e7e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8e81:	89 d0                	mov    %edx,%eax
    8e83:	c1 e0 03             	shl    $0x3,%eax
    8e86:	01 d0                	add    %edx,%eax
    8e88:	01 c0                	add    %eax,%eax
    8e8a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8e8d:	01 d0                	add    %edx,%eax
    8e8f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8e92:	8b 45 08             	mov    0x8(%ebp),%eax
    8e95:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8e9b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8e9e:	89 d0                	mov    %edx,%eax
    8ea0:	c1 e0 03             	shl    $0x3,%eax
    8ea3:	01 d0                	add    %edx,%eax
    8ea5:	01 c0                	add    %eax,%eax
    8ea7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8eaa:	01 d0                	add    %edx,%eax
    8eac:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8eaf:	de e9                	fsubrp %st,%st(1)
    8eb1:	dd 05 68 c9 00 00    	fldl   0xc968
    8eb7:	de f9                	fdivrp %st,%st(1)
    8eb9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8ebc:	89 d0                	mov    %edx,%eax
    8ebe:	c1 e0 03             	shl    $0x3,%eax
    8ec1:	01 d0                	add    %edx,%eax
    8ec3:	01 c0                	add    %eax,%eax
    8ec5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8ec8:	01 d0                	add    %edx,%eax
    8eca:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    8ecd:	e9 1f 01 00 00       	jmp    8ff1 <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    8ed2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8ed5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8ed8:	89 d0                	mov    %edx,%eax
    8eda:	c1 e0 03             	shl    $0x3,%eax
    8edd:	01 d0                	add    %edx,%eax
    8edf:	01 c0                	add    %eax,%eax
    8ee1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8ee4:	01 d0                	add    %edx,%eax
    8ee6:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8ee9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8eec:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8eef:	89 d0                	mov    %edx,%eax
    8ef1:	c1 e0 03             	shl    $0x3,%eax
    8ef4:	01 d0                	add    %edx,%eax
    8ef6:	01 c0                	add    %eax,%eax
    8ef8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8efb:	01 d0                	add    %edx,%eax
    8efd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    8f00:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f03:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8f09:	8b 45 08             	mov    0x8(%ebp),%eax
    8f0c:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    8f12:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8f15:	89 d0                	mov    %edx,%eax
    8f17:	c1 e0 03             	shl    $0x3,%eax
    8f1a:	01 d0                	add    %edx,%eax
    8f1c:	01 c0                	add    %eax,%eax
    8f1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8f21:	01 d0                	add    %edx,%eax
    8f23:	dd 04 c3             	fldl   (%ebx,%eax,8)
    8f26:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8f29:	89 d0                	mov    %edx,%eax
    8f2b:	c1 e0 03             	shl    $0x3,%eax
    8f2e:	01 d0                	add    %edx,%eax
    8f30:	01 c0                	add    %eax,%eax
    8f32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8f35:	01 d0                	add    %edx,%eax
    8f37:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    8f3a:	e9 b2 00 00 00       	jmp    8ff1 <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    8f3f:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8f43:	0f 84 94 00 00 00    	je     8fdd <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    8f49:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8f4c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8f4f:	89 d0                	mov    %edx,%eax
    8f51:	c1 e0 03             	shl    $0x3,%eax
    8f54:	01 d0                	add    %edx,%eax
    8f56:	01 c0                	add    %eax,%eax
    8f58:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8f5b:	01 d0                	add    %edx,%eax
    8f5d:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8f60:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f63:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8f6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f6d:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8f74:	d9 e8                	fld1   
    8f76:	de c1                	faddp  %st,%st(1)
    8f78:	de f9                	fdivrp %st,%st(1)
    8f7a:	de c9                	fmulp  %st,%st(1)
    8f7c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8f7f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8f82:	89 d0                	mov    %edx,%eax
    8f84:	c1 e0 03             	shl    $0x3,%eax
    8f87:	01 d0                	add    %edx,%eax
    8f89:	01 c0                	add    %eax,%eax
    8f8b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8f8e:	01 d0                	add    %edx,%eax
    8f90:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    8f93:	8b 45 0c             	mov    0xc(%ebp),%eax
    8f96:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    8f9c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    8f9f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8fa2:	89 d0                	mov    %edx,%eax
    8fa4:	c1 e0 03             	shl    $0x3,%eax
    8fa7:	01 d0                	add    %edx,%eax
    8fa9:	01 c0                	add    %eax,%eax
    8fab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8fae:	01 d0                	add    %edx,%eax
    8fb0:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8fb6:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8fbd:	d9 e8                	fld1   
    8fbf:	de c1                	faddp  %st,%st(1)
    8fc1:	d9 e8                	fld1   
    8fc3:	de f1                	fdivp  %st,%st(1)
    8fc5:	de c9                	fmulp  %st,%st(1)
    8fc7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8fca:	89 d0                	mov    %edx,%eax
    8fcc:	c1 e0 03             	shl    $0x3,%eax
    8fcf:	01 d0                	add    %edx,%eax
    8fd1:	01 c0                	add    %eax,%eax
    8fd3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8fd6:	01 d0                	add    %edx,%eax
    8fd8:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    8fdb:	eb 14                	jmp    8ff1 <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    8fdd:	c7 44 24 04 00 b9 00 	movl   $0xb900,0x4(%esp)
    8fe4:	00 
    8fe5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    8fec:	e8 3c a7 ff ff       	call   372d <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    8ff1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    8ff5:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    8ff9:	0f 8e eb fd ff ff    	jle    8dea <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    8fff:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9003:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9007:	0f 8e d1 fd ff ff    	jle    8dde <III_stereo+0xb35>
    900d:	eb 54                	jmp    9063 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    900f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9016:	eb 45                	jmp    905d <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    9018:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    901f:	eb 32                	jmp    9053 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    9021:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9024:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9027:	89 d0                	mov    %edx,%eax
    9029:	c1 e0 03             	shl    $0x3,%eax
    902c:	01 d0                	add    %edx,%eax
    902e:	01 c0                	add    %eax,%eax
    9030:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9033:	01 d0                	add    %edx,%eax
    9035:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9038:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    903b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    903e:	89 d0                	mov    %edx,%eax
    9040:	c1 e0 03             	shl    $0x3,%eax
    9043:	01 d0                	add    %edx,%eax
    9045:	01 c0                	add    %eax,%eax
    9047:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    904a:	01 d0                	add    %edx,%eax
    904c:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    904f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9053:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9057:	7e c8                	jle    9021 <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    9059:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    905d:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9061:	7e b5                	jle    9018 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    9063:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    9069:	5b                   	pop    %ebx
    906a:	5e                   	pop    %esi
    906b:	5d                   	pop    %ebp
    906c:	c3                   	ret    

0000906d <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    906d:	55                   	push   %ebp
    906e:	89 e5                	mov    %esp,%ebp
    9070:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    9073:	a1 e0 df 00 00       	mov    0xdfe0,%eax
    9078:	85 c0                	test   %eax,%eax
    907a:	74 68                	je     90e4 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    907c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9083:	eb 4f                	jmp    90d4 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    9085:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9088:	dd 04 c5 a0 df 00 00 	fldl   0xdfa0(,%eax,8)
    908f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9092:	dd 04 c5 a0 df 00 00 	fldl   0xdfa0(,%eax,8)
    9099:	de c9                	fmulp  %st,%st(1)
    909b:	d9 e8                	fld1   
    909d:	de c1                	faddp  %st,%st(1)
    909f:	dd 1c 24             	fstpl  (%esp)
    90a2:	e8 de ac ff ff       	call   3d85 <sqrt>
    90a7:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    90aa:	d9 e8                	fld1   
    90ac:	dc 75 e0             	fdivl  -0x20(%ebp)
    90af:	8b 45 e8             	mov    -0x18(%ebp),%eax
    90b2:	dd 1c c5 40 e0 00 00 	fstpl  0xe040(,%eax,8)
         ca[i] = Ci[i]/sq;
    90b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    90bc:	dd 04 c5 a0 df 00 00 	fldl   0xdfa0(,%eax,8)
    90c3:	dc 75 e0             	fdivl  -0x20(%ebp)
    90c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    90c9:	dd 1c c5 80 e0 00 00 	fstpl  0xe080(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    90d0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    90d4:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    90d8:	7e ab                	jle    9085 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    90da:	c7 05 e0 df 00 00 00 	movl   $0x0,0xdfe0
    90e1:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    90e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    90eb:	eb 4c                	jmp    9139 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    90ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    90f4:	eb 39                	jmp    912f <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    90f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    90f9:	89 d0                	mov    %edx,%eax
    90fb:	c1 e0 03             	shl    $0x3,%eax
    90fe:	01 d0                	add    %edx,%eax
    9100:	c1 e0 04             	shl    $0x4,%eax
    9103:	89 c2                	mov    %eax,%edx
    9105:	8b 45 0c             	mov    0xc(%ebp),%eax
    9108:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    910b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    910e:	89 d0                	mov    %edx,%eax
    9110:	c1 e0 03             	shl    $0x3,%eax
    9113:	01 d0                	add    %edx,%eax
    9115:	c1 e0 04             	shl    $0x4,%eax
    9118:	89 c2                	mov    %eax,%edx
    911a:	8b 45 08             	mov    0x8(%ebp),%eax
    911d:	01 c2                	add    %eax,%edx
    911f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9122:	dd 04 c2             	fldl   (%edx,%eax,8)
    9125:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9128:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    912b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    912f:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9133:	7e c1                	jle    90f6 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9135:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9139:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    913d:	7e ae                	jle    90ed <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    913f:	8b 45 10             	mov    0x10(%ebp),%eax
    9142:	8b 40 10             	mov    0x10(%eax),%eax
    9145:	85 c0                	test   %eax,%eax
    9147:	74 1a                	je     9163 <III_antialias+0xf6>
    9149:	8b 45 10             	mov    0x10(%ebp),%eax
    914c:	8b 40 14             	mov    0x14(%eax),%eax
    914f:	83 f8 02             	cmp    $0x2,%eax
    9152:	75 0f                	jne    9163 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    9154:	8b 45 10             	mov    0x10(%ebp),%eax
    9157:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    915a:	85 c0                	test   %eax,%eax
    915c:	75 05                	jne    9163 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    915e:	e9 1c 01 00 00       	jmp    927f <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9163:	8b 45 10             	mov    0x10(%ebp),%eax
    9166:	8b 40 10             	mov    0x10(%eax),%eax
    9169:	85 c0                	test   %eax,%eax
    916b:	74 1e                	je     918b <III_antialias+0x11e>
    916d:	8b 45 10             	mov    0x10(%ebp),%eax
    9170:	8b 40 18             	mov    0x18(%eax),%eax
    9173:	85 c0                	test   %eax,%eax
    9175:	74 14                	je     918b <III_antialias+0x11e>
     (gr_info->block_type == 2))
    9177:	8b 45 10             	mov    0x10(%ebp),%eax
    917a:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    917d:	83 f8 02             	cmp    $0x2,%eax
    9180:	75 09                	jne    918b <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    9182:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    9189:	eb 07                	jmp    9192 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    918b:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    9192:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9199:	e9 d5 00 00 00       	jmp    9273 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    919e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    91a5:	e9 bb 00 00 00       	jmp    9265 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    91aa:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91ad:	89 d0                	mov    %edx,%eax
    91af:	c1 e0 03             	shl    $0x3,%eax
    91b2:	01 d0                	add    %edx,%eax
    91b4:	c1 e0 04             	shl    $0x4,%eax
    91b7:	89 c2                	mov    %eax,%edx
    91b9:	8b 45 08             	mov    0x8(%ebp),%eax
    91bc:	01 c2                	add    %eax,%edx
    91be:	b8 11 00 00 00       	mov    $0x11,%eax
    91c3:	2b 45 f4             	sub    -0xc(%ebp),%eax
    91c6:	dd 04 c2             	fldl   (%edx,%eax,8)
    91c9:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    91cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91cf:	8d 50 01             	lea    0x1(%eax),%edx
    91d2:	89 d0                	mov    %edx,%eax
    91d4:	c1 e0 03             	shl    $0x3,%eax
    91d7:	01 d0                	add    %edx,%eax
    91d9:	c1 e0 04             	shl    $0x4,%eax
    91dc:	89 c2                	mov    %eax,%edx
    91de:	8b 45 08             	mov    0x8(%ebp),%eax
    91e1:	01 c2                	add    %eax,%edx
    91e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    91e6:	dd 04 c2             	fldl   (%edx,%eax,8)
    91e9:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    91ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    91ef:	89 d0                	mov    %edx,%eax
    91f1:	c1 e0 03             	shl    $0x3,%eax
    91f4:	01 d0                	add    %edx,%eax
    91f6:	c1 e0 04             	shl    $0x4,%eax
    91f9:	89 c2                	mov    %eax,%edx
    91fb:	8b 45 0c             	mov    0xc(%ebp),%eax
    91fe:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9201:	b8 11 00 00 00       	mov    $0x11,%eax
    9206:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9209:	8b 55 f4             	mov    -0xc(%ebp),%edx
    920c:	dd 04 d5 40 e0 00 00 	fldl   0xe040(,%edx,8)
    9213:	dc 4d d8             	fmull  -0x28(%ebp)
    9216:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9219:	dd 04 d5 80 e0 00 00 	fldl   0xe080(,%edx,8)
    9220:	dc 4d d0             	fmull  -0x30(%ebp)
    9223:	de e9                	fsubrp %st,%st(1)
    9225:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9228:	8b 45 f0             	mov    -0x10(%ebp),%eax
    922b:	8d 50 01             	lea    0x1(%eax),%edx
    922e:	89 d0                	mov    %edx,%eax
    9230:	c1 e0 03             	shl    $0x3,%eax
    9233:	01 d0                	add    %edx,%eax
    9235:	c1 e0 04             	shl    $0x4,%eax
    9238:	89 c2                	mov    %eax,%edx
    923a:	8b 45 0c             	mov    0xc(%ebp),%eax
    923d:	01 c2                	add    %eax,%edx
    923f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9242:	dd 04 c5 40 e0 00 00 	fldl   0xe040(,%eax,8)
    9249:	dc 4d d0             	fmull  -0x30(%ebp)
    924c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    924f:	dd 04 c5 80 e0 00 00 	fldl   0xe080(,%eax,8)
    9256:	dc 4d d8             	fmull  -0x28(%ebp)
    9259:	de c1                	faddp  %st,%st(1)
    925b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    925e:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    9261:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9265:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    9269:	0f 8e 3b ff ff ff    	jle    91aa <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    926f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9273:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9276:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    9279:	0f 8c 1f ff ff ff    	jl     919e <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    927f:	c9                   	leave  
    9280:	c3                   	ret    

00009281 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    9281:	55                   	push   %ebp
    9282:	89 e5                	mov    %esp,%ebp
    9284:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    928a:	a1 c0 e0 00 00       	mov    0xe0c0,%eax
    928f:	85 c0                	test   %eax,%eax
    9291:	0f 85 59 02 00 00    	jne    94f0 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    9297:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    929e:	eb 29                	jmp    92c9 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    92a0:	db 45 f4             	fildl  -0xc(%ebp)
    92a3:	dd 05 70 c9 00 00    	fldl   0xc970
    92a9:	de c1                	faddp  %st,%st(1)
    92ab:	dd 05 78 c9 00 00    	fldl   0xc978
    92b1:	de c9                	fmulp  %st,%st(1)
    92b3:	dd 1c 24             	fstpl  (%esp)
    92b6:	e8 53 a8 ff ff       	call   3b0e <sin>
    92bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92be:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    92c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    92c9:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    92cd:	7e d1                	jle    92a0 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    92cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    92d6:	eb 2c                	jmp    9304 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    92d8:	db 45 f4             	fildl  -0xc(%ebp)
    92db:	dd 05 70 c9 00 00    	fldl   0xc970
    92e1:	de c1                	faddp  %st,%st(1)
    92e3:	dd 05 78 c9 00 00    	fldl   0xc978
    92e9:	de c9                	fmulp  %st,%st(1)
    92eb:	dd 1c 24             	fstpl  (%esp)
    92ee:	e8 1b a8 ff ff       	call   3b0e <sin>
    92f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    92f6:	83 c0 24             	add    $0x24,%eax
    92f9:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9300:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9304:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9308:	7e ce                	jle    92d8 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    930a:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9311:	eb 13                	jmp    9326 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    9313:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9316:	83 c0 24             	add    $0x24,%eax
    9319:	d9 e8                	fld1   
    931b:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9322:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9326:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    932a:	7e e7                	jle    9313 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    932c:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9333:	eb 34                	jmp    9369 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9335:	db 45 f4             	fildl  -0xc(%ebp)
    9338:	dd 05 70 c9 00 00    	fldl   0xc970
    933e:	de c1                	faddp  %st,%st(1)
    9340:	dd 05 80 c9 00 00    	fldl   0xc980
    9346:	de e9                	fsubrp %st,%st(1)
    9348:	dd 05 60 c9 00 00    	fldl   0xc960
    934e:	de c9                	fmulp  %st,%st(1)
    9350:	dd 1c 24             	fstpl  (%esp)
    9353:	e8 b6 a7 ff ff       	call   3b0e <sin>
    9358:	8b 45 f4             	mov    -0xc(%ebp),%eax
    935b:	83 c0 24             	add    $0x24,%eax
    935e:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9365:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9369:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    936d:	7e c6                	jle    9335 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    936f:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    9376:	eb 13                	jmp    938b <inv_mdct+0x10a>
         win[1][i] = 0.0;
    9378:	8b 45 f4             	mov    -0xc(%ebp),%eax
    937b:	83 c0 24             	add    $0x24,%eax
    937e:	d9 ee                	fldz   
    9380:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9387:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    938b:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    938f:	7e e7                	jle    9378 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9391:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9398:	eb 13                	jmp    93ad <inv_mdct+0x12c>
         win[3][i] = 0.0;
    939a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    939d:	83 c0 6c             	add    $0x6c,%eax
    93a0:	d9 ee                	fldz   
    93a2:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    93a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93ad:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    93b1:	7e e7                	jle    939a <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    93b3:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    93ba:	eb 34                	jmp    93f0 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    93bc:	db 45 f4             	fildl  -0xc(%ebp)
    93bf:	dd 05 70 c9 00 00    	fldl   0xc970
    93c5:	de c1                	faddp  %st,%st(1)
    93c7:	dd 05 88 c9 00 00    	fldl   0xc988
    93cd:	de e9                	fsubrp %st,%st(1)
    93cf:	dd 05 60 c9 00 00    	fldl   0xc960
    93d5:	de c9                	fmulp  %st,%st(1)
    93d7:	dd 1c 24             	fstpl  (%esp)
    93da:	e8 2f a7 ff ff       	call   3b0e <sin>
    93df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    93e2:	83 c0 6c             	add    $0x6c,%eax
    93e5:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    93ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    93f0:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    93f4:	7e c6                	jle    93bc <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    93f6:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    93fd:	eb 13                	jmp    9412 <inv_mdct+0x191>
         win[3][i] =1.0;
    93ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9402:	83 c0 6c             	add    $0x6c,%eax
    9405:	d9 e8                	fld1   
    9407:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    940e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9412:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9416:	7e e7                	jle    93ff <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9418:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    941f:	eb 2c                	jmp    944d <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    9421:	db 45 f4             	fildl  -0xc(%ebp)
    9424:	dd 05 70 c9 00 00    	fldl   0xc970
    942a:	de c1                	faddp  %st,%st(1)
    942c:	dd 05 78 c9 00 00    	fldl   0xc978
    9432:	de c9                	fmulp  %st,%st(1)
    9434:	dd 1c 24             	fstpl  (%esp)
    9437:	e8 d2 a6 ff ff       	call   3b0e <sin>
    943c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    943f:	83 c0 6c             	add    $0x6c,%eax
    9442:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9449:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    944d:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9451:	7e ce                	jle    9421 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9453:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    945a:	eb 2c                	jmp    9488 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    945c:	db 45 f4             	fildl  -0xc(%ebp)
    945f:	dd 05 70 c9 00 00    	fldl   0xc970
    9465:	de c1                	faddp  %st,%st(1)
    9467:	dd 05 60 c9 00 00    	fldl   0xc960
    946d:	de c9                	fmulp  %st,%st(1)
    946f:	dd 1c 24             	fstpl  (%esp)
    9472:	e8 97 a6 ff ff       	call   3b0e <sin>
    9477:	8b 45 f4             	mov    -0xc(%ebp),%eax
    947a:	83 c0 48             	add    $0x48,%eax
    947d:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9484:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9488:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    948c:	7e ce                	jle    945c <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    948e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9495:	eb 13                	jmp    94aa <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    9497:	8b 45 f4             	mov    -0xc(%ebp),%eax
    949a:	83 c0 48             	add    $0x48,%eax
    949d:	d9 ee                	fldz   
    949f:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    94a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94aa:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    94ae:	7e e7                	jle    9497 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    94b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    94b7:	eb 21                	jmp    94da <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    94b9:	db 45 f4             	fildl  -0xc(%ebp)
    94bc:	dd 05 90 c9 00 00    	fldl   0xc990
    94c2:	de c9                	fmulp  %st,%st(1)
    94c4:	dd 1c 24             	fstpl  (%esp)
    94c7:	e8 e1 a6 ff ff       	call   3bad <cos>
    94cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94cf:	dd 1c c5 60 e5 00 00 	fstpl  0xe560(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    94d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94da:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    94e1:	7e d6                	jle    94b9 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    94e3:	a1 c0 e0 00 00       	mov    0xe0c0,%eax
    94e8:	83 c0 01             	add    $0x1,%eax
    94eb:	a3 c0 e0 00 00       	mov    %eax,0xe0c0
    }

    for(i=0;i<36;i++)
    94f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    94f7:	eb 17                	jmp    9510 <inv_mdct+0x28f>
       out[i]=0;
    94f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9503:	8b 45 0c             	mov    0xc(%ebp),%eax
    9506:	01 d0                	add    %edx,%eax
    9508:	d9 ee                	fldz   
    950a:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    950c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9510:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9514:	7e e3                	jle    94f9 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    9516:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    951a:	0f 85 85 01 00 00    	jne    96a5 <inv_mdct+0x424>
       N=12;
    9520:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    9527:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    952e:	e9 63 01 00 00       	jmp    9696 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    9533:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    953a:	e9 df 00 00 00       	jmp    961e <inv_mdct+0x39d>
             sum = 0.0;
    953f:	d9 ee                	fldz   
    9541:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    9544:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    954b:	e9 8f 00 00 00       	jmp    95df <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    9550:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9553:	89 d0                	mov    %edx,%eax
    9555:	01 c0                	add    %eax,%eax
    9557:	01 c2                	add    %eax,%edx
    9559:	8b 45 f4             	mov    -0xc(%ebp),%eax
    955c:	01 d0                	add    %edx,%eax
    955e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9565:	8b 45 08             	mov    0x8(%ebp),%eax
    9568:	01 d0                	add    %edx,%eax
    956a:	dd 00                	fldl   (%eax)
    956c:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    9572:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9575:	01 c0                	add    %eax,%eax
    9577:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    957d:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    9583:	dd 05 98 c9 00 00    	fldl   0xc998
    9589:	de f1                	fdivp  %st,%st(1)
    958b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    958e:	01 c0                	add    %eax,%eax
    9590:	8d 50 01             	lea    0x1(%eax),%edx
    9593:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9596:	89 c1                	mov    %eax,%ecx
    9598:	c1 e9 1f             	shr    $0x1f,%ecx
    959b:	01 c8                	add    %ecx,%eax
    959d:	d1 f8                	sar    %eax
    959f:	01 d0                	add    %edx,%eax
    95a1:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    95a7:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    95ad:	de c9                	fmulp  %st,%st(1)
    95af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    95b2:	01 c0                	add    %eax,%eax
    95b4:	83 c0 01             	add    $0x1,%eax
    95b7:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    95bd:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    95c3:	de c9                	fmulp  %st,%st(1)
    95c5:	dd 1c 24             	fstpl  (%esp)
    95c8:	e8 e0 a5 ff ff       	call   3bad <cos>
    95cd:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    95d3:	dd 45 e0             	fldl   -0x20(%ebp)
    95d6:	de c1                	faddp  %st,%st(1)
    95d8:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    95db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    95df:	8b 45 dc             	mov    -0x24(%ebp),%eax
    95e2:	89 c2                	mov    %eax,%edx
    95e4:	c1 ea 1f             	shr    $0x1f,%edx
    95e7:	01 d0                	add    %edx,%eax
    95e9:	d1 f8                	sar    %eax
    95eb:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    95ee:	0f 8f 5c ff ff ff    	jg     9550 <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    95f4:	8b 55 10             	mov    0x10(%ebp),%edx
    95f7:	89 d0                	mov    %edx,%eax
    95f9:	c1 e0 03             	shl    $0x3,%eax
    95fc:	01 d0                	add    %edx,%eax
    95fe:	c1 e0 02             	shl    $0x2,%eax
    9601:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9604:	01 d0                	add    %edx,%eax
    9606:	dd 04 c5 e0 e0 00 00 	fldl   0xe0e0(,%eax,8)
    960d:	dc 4d e0             	fmull  -0x20(%ebp)
    9610:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9613:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    961a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    961e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9621:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9624:	0f 8c 15 ff ff ff    	jl     953f <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    962a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9631:	eb 57                	jmp    968a <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    9633:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9636:	89 d0                	mov    %edx,%eax
    9638:	01 c0                	add    %eax,%eax
    963a:	01 d0                	add    %edx,%eax
    963c:	01 c0                	add    %eax,%eax
    963e:	89 c2                	mov    %eax,%edx
    9640:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9643:	01 d0                	add    %edx,%eax
    9645:	83 c0 06             	add    $0x6,%eax
    9648:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    964f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9652:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9655:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9658:	89 d0                	mov    %edx,%eax
    965a:	01 c0                	add    %eax,%eax
    965c:	01 d0                	add    %edx,%eax
    965e:	01 c0                	add    %eax,%eax
    9660:	89 c2                	mov    %eax,%edx
    9662:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9665:	01 d0                	add    %edx,%eax
    9667:	83 c0 06             	add    $0x6,%eax
    966a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9671:	8b 45 0c             	mov    0xc(%ebp),%eax
    9674:	01 d0                	add    %edx,%eax
    9676:	dd 00                	fldl   (%eax)
    9678:	8b 45 ec             	mov    -0x14(%ebp),%eax
    967b:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    9682:	de c1                	faddp  %st,%st(1)
    9684:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9686:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    968a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    968d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9690:	7c a1                	jl     9633 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    9692:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9696:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    969a:	0f 8e 93 fe ff ff    	jle    9533 <inv_mdct+0x2b2>
    96a0:	e9 da 00 00 00       	jmp    977f <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    96a5:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    96ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    96b3:	e9 bb 00 00 00       	jmp    9773 <inv_mdct+0x4f2>
         sum = 0.0;
    96b8:	d9 ee                	fldz   
    96ba:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    96bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    96c4:	eb 6a                	jmp    9730 <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    96c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96c9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    96d0:	8b 45 08             	mov    0x8(%ebp),%eax
    96d3:	01 d0                	add    %edx,%eax
    96d5:	dd 00                	fldl   (%eax)
    96d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    96da:	01 c0                	add    %eax,%eax
    96dc:	8d 50 01             	lea    0x1(%eax),%edx
    96df:	8b 45 dc             	mov    -0x24(%ebp),%eax
    96e2:	89 c1                	mov    %eax,%ecx
    96e4:	c1 e9 1f             	shr    $0x1f,%ecx
    96e7:	01 c8                	add    %ecx,%eax
    96e9:	d1 f8                	sar    %eax
    96eb:	01 c2                	add    %eax,%edx
    96ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96f0:	01 c0                	add    %eax,%eax
    96f2:	83 c0 01             	add    $0x1,%eax
    96f5:	89 d1                	mov    %edx,%ecx
    96f7:	0f af c8             	imul   %eax,%ecx
    96fa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    96ff:	89 c8                	mov    %ecx,%eax
    9701:	f7 ea                	imul   %edx
    9703:	c1 fa 05             	sar    $0x5,%edx
    9706:	89 c8                	mov    %ecx,%eax
    9708:	c1 f8 1f             	sar    $0x1f,%eax
    970b:	29 c2                	sub    %eax,%edx
    970d:	89 d0                	mov    %edx,%eax
    970f:	c1 e0 03             	shl    $0x3,%eax
    9712:	01 d0                	add    %edx,%eax
    9714:	c1 e0 04             	shl    $0x4,%eax
    9717:	29 c1                	sub    %eax,%ecx
    9719:	89 ca                	mov    %ecx,%edx
    971b:	dd 04 d5 60 e5 00 00 	fldl   0xe560(,%edx,8)
    9722:	de c9                	fmulp  %st,%st(1)
    9724:	dd 45 e0             	fldl   -0x20(%ebp)
    9727:	de c1                	faddp  %st,%st(1)
    9729:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    972c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9730:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9733:	89 c2                	mov    %eax,%edx
    9735:	c1 ea 1f             	shr    $0x1f,%edx
    9738:	01 d0                	add    %edx,%eax
    973a:	d1 f8                	sar    %eax
    973c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    973f:	7f 85                	jg     96c6 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    9741:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9744:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    974b:	8b 45 0c             	mov    0xc(%ebp),%eax
    974e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9751:	8b 55 10             	mov    0x10(%ebp),%edx
    9754:	89 d0                	mov    %edx,%eax
    9756:	c1 e0 03             	shl    $0x3,%eax
    9759:	01 d0                	add    %edx,%eax
    975b:	c1 e0 02             	shl    $0x2,%eax
    975e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9761:	01 d0                	add    %edx,%eax
    9763:	dd 04 c5 e0 e0 00 00 	fldl   0xe0e0(,%eax,8)
    976a:	dc 4d e0             	fmull  -0x20(%ebp)
    976d:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    976f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9773:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9776:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9779:	0f 8c 39 ff ff ff    	jl     96b8 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    977f:	c9                   	leave  
    9780:	c3                   	ret    

00009781 <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    9781:	55                   	push   %ebp
    9782:	89 e5                	mov    %esp,%ebp
    9784:	53                   	push   %ebx
    9785:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    978b:	a1 e4 df 00 00       	mov    0xdfe4,%eax
    9790:	85 c0                	test   %eax,%eax
    9792:	74 6f                	je     9803 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    9794:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    979b:	eb 56                	jmp    97f3 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    979d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    97a4:	eb 43                	jmp    97e9 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    97a6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    97ad:	eb 30                	jmp    97df <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    97af:	8b 45 ec             	mov    -0x14(%ebp),%eax
    97b2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    97b5:	89 c2                	mov    %eax,%edx
    97b7:	c1 e2 03             	shl    $0x3,%edx
    97ba:	01 c2                	add    %eax,%edx
    97bc:	8d 04 12             	lea    (%edx,%edx,1),%eax
    97bf:	89 c2                	mov    %eax,%edx
    97c1:	89 c8                	mov    %ecx,%eax
    97c3:	c1 e0 03             	shl    $0x3,%eax
    97c6:	01 c8                	add    %ecx,%eax
    97c8:	c1 e0 06             	shl    $0x6,%eax
    97cb:	01 c2                	add    %eax,%edx
    97cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    97d0:	01 d0                	add    %edx,%eax
    97d2:	d9 ee                	fldz   
    97d4:	dd 1c c5 e0 e9 00 00 	fstpl  0xe9e0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    97db:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    97df:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    97e3:	7e ca                	jle    97af <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    97e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    97e9:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    97ed:	7e b7                	jle    97a6 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    97ef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    97f3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    97f7:	7e a4                	jle    979d <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    97f9:	c7 05 e4 df 00 00 00 	movl   $0x0,0xdfe4
    9800:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9803:	8b 45 18             	mov    0x18(%ebp),%eax
    9806:	8b 40 10             	mov    0x10(%eax),%eax
    9809:	85 c0                	test   %eax,%eax
    980b:	74 10                	je     981d <III_hybrid+0x9c>
    980d:	8b 45 18             	mov    0x18(%ebp),%eax
    9810:	8b 40 18             	mov    0x18(%eax),%eax
    9813:	85 c0                	test   %eax,%eax
    9815:	74 06                	je     981d <III_hybrid+0x9c>
    9817:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    981b:	7e 08                	jle    9825 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    981d:	8b 45 18             	mov    0x18(%ebp),%eax
    9820:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9823:	eb 05                	jmp    982a <III_hybrid+0xa9>
    9825:	b8 00 00 00 00       	mov    $0x0,%eax
    982a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    982d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9830:	89 44 24 08          	mov    %eax,0x8(%esp)
    9834:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    983a:	89 44 24 04          	mov    %eax,0x4(%esp)
    983e:	8b 45 08             	mov    0x8(%ebp),%eax
    9841:	89 04 24             	mov    %eax,(%esp)
    9844:	e8 38 fa ff ff       	call   9281 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9849:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9850:	e9 83 00 00 00       	jmp    98d8 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    9855:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9858:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    985f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9862:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9865:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9868:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    986f:	8b 45 10             	mov    0x10(%ebp),%eax
    9872:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9875:	89 c2                	mov    %eax,%edx
    9877:	c1 e2 03             	shl    $0x3,%edx
    987a:	01 c2                	add    %eax,%edx
    987c:	8d 04 12             	lea    (%edx,%edx,1),%eax
    987f:	89 c2                	mov    %eax,%edx
    9881:	89 c8                	mov    %ecx,%eax
    9883:	c1 e0 03             	shl    $0x3,%eax
    9886:	01 c8                	add    %ecx,%eax
    9888:	c1 e0 06             	shl    $0x6,%eax
    988b:	01 c2                	add    %eax,%edx
    988d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9890:	01 d0                	add    %edx,%eax
    9892:	dd 04 c5 e0 e9 00 00 	fldl   0xe9e0(,%eax,8)
    9899:	de c1                	faddp  %st,%st(1)
    989b:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    989d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98a0:	83 c0 12             	add    $0x12,%eax
    98a3:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    98aa:	8b 45 10             	mov    0x10(%ebp),%eax
    98ad:	8b 4d 14             	mov    0x14(%ebp),%ecx
    98b0:	89 c2                	mov    %eax,%edx
    98b2:	c1 e2 03             	shl    $0x3,%edx
    98b5:	01 c2                	add    %eax,%edx
    98b7:	8d 04 12             	lea    (%edx,%edx,1),%eax
    98ba:	89 c2                	mov    %eax,%edx
    98bc:	89 c8                	mov    %ecx,%eax
    98be:	c1 e0 03             	shl    $0x3,%eax
    98c1:	01 c8                	add    %ecx,%eax
    98c3:	c1 e0 06             	shl    $0x6,%eax
    98c6:	01 c2                	add    %eax,%edx
    98c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    98cb:	01 d0                	add    %edx,%eax
    98cd:	dd 1c c5 e0 e9 00 00 	fstpl  0xe9e0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    98d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    98d8:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    98dc:	0f 8e 73 ff ff ff    	jle    9855 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    98e2:	81 c4 54 01 00 00    	add    $0x154,%esp
    98e8:	5b                   	pop    %ebx
    98e9:	5d                   	pop    %ebp
    98ea:	c3                   	ret    

000098eb <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    98eb:	55                   	push   %ebp
    98ec:	89 e5                	mov    %esp,%ebp
    98ee:	57                   	push   %edi
    98ef:	56                   	push   %esi
    98f0:	53                   	push   %ebx
    98f1:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    98f4:	be 00 00 00 00       	mov    $0x0,%esi
    98f9:	e9 1c 01 00 00       	jmp    9a1a <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    98fe:	bb 00 00 00 00       	mov    $0x0,%ebx
    9903:	e9 06 01 00 00       	jmp    9a0e <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    9908:	89 f0                	mov    %esi,%eax
    990a:	c1 e0 08             	shl    $0x8,%eax
    990d:	89 c2                	mov    %eax,%edx
    990f:	8b 45 08             	mov    0x8(%ebp),%eax
    9912:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    9915:	89 75 e0             	mov    %esi,-0x20(%ebp)
    9918:	db 45 e0             	fildl  -0x20(%ebp)
    991b:	dd 05 a0 c9 00 00    	fldl   0xc9a0
    9921:	de c9                	fmulp  %st,%st(1)
    9923:	dd 05 a8 c9 00 00    	fldl   0xc9a8
    9929:	de c1                	faddp  %st,%st(1)
    992b:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    992e:	83 c0 01             	add    $0x1,%eax
    9931:	89 45 e0             	mov    %eax,-0x20(%ebp)
    9934:	db 45 e0             	fildl  -0x20(%ebp)
    9937:	de c9                	fmulp  %st,%st(1)
    9939:	dd 1c 24             	fstpl  (%esp)
    993c:	e8 6c a2 ff ff       	call   3bad <cos>
    9941:	dd 05 b0 c9 00 00    	fldl   0xc9b0
    9947:	de c9                	fmulp  %st,%st(1)
    9949:	dd 1c df             	fstpl  (%edi,%ebx,8)
    994c:	dd 04 df             	fldl   (%edi,%ebx,8)
    994f:	d9 ee                	fldz   
    9951:	d9 c9                	fxch   %st(1)
    9953:	df e9                	fucomip %st(1),%st
    9955:	dd d8                	fstp   %st(0)
    9957:	72 47                	jb     99a0 <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    9959:	89 f0                	mov    %esi,%eax
    995b:	c1 e0 08             	shl    $0x8,%eax
    995e:	89 c2                	mov    %eax,%edx
    9960:	8b 45 08             	mov    0x8(%ebp),%eax
    9963:	01 c2                	add    %eax,%edx
    9965:	89 f0                	mov    %esi,%eax
    9967:	c1 e0 08             	shl    $0x8,%eax
    996a:	89 c1                	mov    %eax,%ecx
    996c:	8b 45 08             	mov    0x8(%ebp),%eax
    996f:	01 c8                	add    %ecx,%eax
    9971:	dd 04 d8             	fldl   (%eax,%ebx,8)
    9974:	dd 05 70 c9 00 00    	fldl   0xc970
    997a:	de c1                	faddp  %st,%st(1)
    997c:	d9 7d e6             	fnstcw -0x1a(%ebp)
    997f:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    9983:	b4 0c                	mov    $0xc,%ah
    9985:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    9989:	d9 6d e4             	fldcw  -0x1c(%ebp)
    998c:	db 5d e0             	fistpl -0x20(%ebp)
    998f:	d9 6d e6             	fldcw  -0x1a(%ebp)
    9992:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9995:	89 45 e0             	mov    %eax,-0x20(%ebp)
    9998:	db 45 e0             	fildl  -0x20(%ebp)
    999b:	dd 1c da             	fstpl  (%edx,%ebx,8)
    999e:	eb 45                	jmp    99e5 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    99a0:	89 f0                	mov    %esi,%eax
    99a2:	c1 e0 08             	shl    $0x8,%eax
    99a5:	89 c2                	mov    %eax,%edx
    99a7:	8b 45 08             	mov    0x8(%ebp),%eax
    99aa:	01 c2                	add    %eax,%edx
    99ac:	89 f0                	mov    %esi,%eax
    99ae:	c1 e0 08             	shl    $0x8,%eax
    99b1:	89 c1                	mov    %eax,%ecx
    99b3:	8b 45 08             	mov    0x8(%ebp),%eax
    99b6:	01 c8                	add    %ecx,%eax
    99b8:	dd 04 d8             	fldl   (%eax,%ebx,8)
    99bb:	dd 05 70 c9 00 00    	fldl   0xc970
    99c1:	de e9                	fsubrp %st,%st(1)
    99c3:	d9 7d e6             	fnstcw -0x1a(%ebp)
    99c6:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    99ca:	b4 0c                	mov    $0xc,%ah
    99cc:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    99d0:	d9 6d e4             	fldcw  -0x1c(%ebp)
    99d3:	db 5d e0             	fistpl -0x20(%ebp)
    99d6:	d9 6d e6             	fldcw  -0x1a(%ebp)
    99d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    99dc:	89 45 e0             	mov    %eax,-0x20(%ebp)
    99df:	db 45 e0             	fildl  -0x20(%ebp)
    99e2:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    99e5:	89 f0                	mov    %esi,%eax
    99e7:	c1 e0 08             	shl    $0x8,%eax
    99ea:	89 c2                	mov    %eax,%edx
    99ec:	8b 45 08             	mov    0x8(%ebp),%eax
    99ef:	01 d0                	add    %edx,%eax
    99f1:	89 f2                	mov    %esi,%edx
    99f3:	89 d1                	mov    %edx,%ecx
    99f5:	c1 e1 08             	shl    $0x8,%ecx
    99f8:	8b 55 08             	mov    0x8(%ebp),%edx
    99fb:	01 ca                	add    %ecx,%edx
    99fd:	dd 04 da             	fldl   (%edx,%ebx,8)
    9a00:	dd 05 b8 c9 00 00    	fldl   0xc9b8
    9a06:	de c9                	fmulp  %st,%st(1)
    9a08:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    9a0b:	83 c3 01             	add    $0x1,%ebx
    9a0e:	83 fb 1f             	cmp    $0x1f,%ebx
    9a11:	0f 8e f1 fe ff ff    	jle    9908 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    9a17:	83 c6 01             	add    $0x1,%esi
    9a1a:	83 fe 3f             	cmp    $0x3f,%esi
    9a1d:	0f 8e db fe ff ff    	jle    98fe <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    9a23:	83 c4 1c             	add    $0x1c,%esp
    9a26:	5b                   	pop    %ebx
    9a27:	5e                   	pop    %esi
    9a28:	5f                   	pop    %edi
    9a29:	5d                   	pop    %ebp
    9a2a:	c3                   	ret    

00009a2b <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    9a2b:	55                   	push   %ebp
    9a2c:	89 e5                	mov    %esp,%ebp
    9a2e:	57                   	push   %edi
    9a2f:	56                   	push   %esi
    9a30:	53                   	push   %ebx
    9a31:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    9a37:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    9a3d:	bb 20 b9 00 00       	mov    $0xb920,%ebx
    9a42:	b8 00 04 00 00       	mov    $0x400,%eax
    9a47:	89 d7                	mov    %edx,%edi
    9a49:	89 de                	mov    %ebx,%esi
    9a4b:	89 c1                	mov    %eax,%ecx
    9a4d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    9a4f:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    9a55:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    9a58:	81 c4 14 10 00 00    	add    $0x1014,%esp
    9a5e:	5b                   	pop    %ebx
    9a5f:	5e                   	pop    %esi
    9a60:	5f                   	pop    %edi
    9a61:	5d                   	pop    %ebp
    9a62:	c3                   	ret    

00009a63 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    9a63:	55                   	push   %ebp
    9a64:	89 e5                	mov    %esp,%ebp
    9a66:	57                   	push   %edi
    9a67:	56                   	push   %esi
    9a68:	53                   	push   %ebx
    9a69:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    9a6c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    9a73:	a1 e8 df 00 00       	mov    0xdfe8,%eax
    9a78:	85 c0                	test   %eax,%eax
    9a7a:	74 6f                	je     9aeb <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    9a7c:	c7 44 24 04 20 c9 00 	movl   $0xc920,0x4(%esp)
    9a83:	00 
    9a84:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    9a8b:	e8 15 a8 ff ff       	call   42a5 <mem_alloc>
    9a90:	a3 e0 0d 01 00       	mov    %eax,0x10de0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    9a95:	c7 44 24 04 23 c9 00 	movl   $0xc923,0x4(%esp)
    9a9c:	00 
    9a9d:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    9aa4:	e8 fc a7 ff ff       	call   42a5 <mem_alloc>
    9aa9:	a3 e4 0d 01 00       	mov    %eax,0x10de4
		create_syn_filter(*filter);
    9aae:	a1 e4 0d 01 00       	mov    0x10de4,%eax
    9ab3:	89 04 24             	mov    %eax,(%esp)
    9ab6:	e8 30 fe ff ff       	call   98eb <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    9abb:	c7 44 24 04 26 c9 00 	movl   $0xc926,0x4(%esp)
    9ac2:	00 
    9ac3:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    9aca:	e8 d6 a7 ff ff       	call   42a5 <mem_alloc>
    9acf:	a3 e8 0d 01 00       	mov    %eax,0x10de8
		read_syn_window(window);
    9ad4:	a1 e8 0d 01 00       	mov    0x10de8,%eax
    9ad9:	89 04 24             	mov    %eax,(%esp)
    9adc:	e8 4a ff ff ff       	call   9a2b <read_syn_window>
		init = 0;
    9ae1:	c7 05 e8 df 00 00 00 	movl   $0x0,0xdfe8
    9ae8:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    9aeb:	8b 45 0c             	mov    0xc(%ebp),%eax
    9aee:	8b 04 85 ec df 00 00 	mov    0xdfec(,%eax,4),%eax
    9af5:	83 e8 40             	sub    $0x40,%eax
    9af8:	25 ff 03 00 00       	and    $0x3ff,%eax
    9afd:	89 c2                	mov    %eax,%edx
    9aff:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b02:	89 14 85 ec df 00 00 	mov    %edx,0xdfec(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    9b09:	8b 15 e0 0d 01 00    	mov    0x10de0,%edx
    9b0f:	8b 45 0c             	mov    0xc(%ebp),%eax
    9b12:	8b 04 85 ec df 00 00 	mov    0xdfec(,%eax,4),%eax
    9b19:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9b1c:	c1 e1 0a             	shl    $0xa,%ecx
    9b1f:	01 c8                	add    %ecx,%eax
    9b21:	c1 e0 03             	shl    $0x3,%eax
    9b24:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    9b27:	bb 00 00 00 00       	mov    $0x0,%ebx
    9b2c:	eb 40                	jmp    9b6e <SubBandSynthesis+0x10b>
		sum = 0;
    9b2e:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    9b30:	be 00 00 00 00       	mov    $0x0,%esi
    9b35:	eb 26                	jmp    9b5d <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    9b37:	89 f0                	mov    %esi,%eax
    9b39:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9b40:	8b 45 08             	mov    0x8(%ebp),%eax
    9b43:	01 d0                	add    %edx,%eax
    9b45:	dd 00                	fldl   (%eax)
    9b47:	a1 e4 0d 01 00       	mov    0x10de4,%eax
    9b4c:	89 da                	mov    %ebx,%edx
    9b4e:	c1 e2 05             	shl    $0x5,%edx
    9b51:	01 f2                	add    %esi,%edx
    9b53:	dd 04 d0             	fldl   (%eax,%edx,8)
    9b56:	de c9                	fmulp  %st,%st(1)
    9b58:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    9b5a:	83 c6 01             	add    $0x1,%esi
    9b5d:	83 fe 1f             	cmp    $0x1f,%esi
    9b60:	7e d5                	jle    9b37 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    9b62:	89 d8                	mov    %ebx,%eax
    9b64:	c1 e0 03             	shl    $0x3,%eax
    9b67:	01 f8                	add    %edi,%eax
    9b69:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    9b6b:	83 c3 01             	add    $0x1,%ebx
    9b6e:	83 fb 3f             	cmp    $0x3f,%ebx
    9b71:	7e bb                	jle    9b2e <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    9b73:	bf 00 00 00 00       	mov    $0x0,%edi
    9b78:	e9 c7 00 00 00       	jmp    9c44 <SubBandSynthesis+0x1e1>
		sum = 0;
    9b7d:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    9b7f:	bb 00 00 00 00       	mov    $0x0,%ebx
    9b84:	eb 4c                	jmp    9bd2 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    9b86:	89 d8                	mov    %ebx,%eax
    9b88:	c1 e0 05             	shl    $0x5,%eax
    9b8b:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    9b8e:	a1 e8 0d 01 00       	mov    0x10de8,%eax
    9b93:	89 f2                	mov    %esi,%edx
    9b95:	c1 e2 03             	shl    $0x3,%edx
    9b98:	01 d0                	add    %edx,%eax
    9b9a:	dd 00                	fldl   (%eax)
    9b9c:	a1 e0 0d 01 00       	mov    0x10de0,%eax
    9ba1:	8d 53 01             	lea    0x1(%ebx),%edx
    9ba4:	d1 fa                	sar    %edx
    9ba6:	c1 e2 06             	shl    $0x6,%edx
    9ba9:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    9bac:	8b 55 0c             	mov    0xc(%ebp),%edx
    9baf:	8b 14 95 ec df 00 00 	mov    0xdfec(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    9bb6:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    9bb8:	89 d1                	mov    %edx,%ecx
    9bba:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    9bc0:	8b 55 0c             	mov    0xc(%ebp),%edx
    9bc3:	c1 e2 0a             	shl    $0xa,%edx
    9bc6:	01 ca                	add    %ecx,%edx
    9bc8:	dd 04 d0             	fldl   (%eax,%edx,8)
    9bcb:	de c9                	fmulp  %st,%st(1)
    9bcd:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    9bcf:	83 c3 01             	add    $0x1,%ebx
    9bd2:	83 fb 0f             	cmp    $0xf,%ebx
    9bd5:	7e af                	jle    9b86 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    9bd7:	dd 05 c0 c9 00 00    	fldl   0xc9c0
    9bdd:	de c9                	fmulp  %st,%st(1)
    9bdf:	d9 7d d6             	fnstcw -0x2a(%ebp)
    9be2:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    9be6:	b4 0c                	mov    $0xc,%ah
    9be8:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    9bec:	d9 6d d4             	fldcw  -0x2c(%ebp)
    9bef:	db 5d e0             	fistpl -0x20(%ebp)
    9bf2:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    9bf5:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    9bfc:	7e 15                	jle    9c13 <SubBandSynthesis+0x1b0>
    9bfe:	89 f8                	mov    %edi,%eax
    9c00:	8d 14 00             	lea    (%eax,%eax,1),%edx
    9c03:	8b 45 10             	mov    0x10(%ebp),%eax
    9c06:	01 d0                	add    %edx,%eax
    9c08:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    9c0d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c11:	eb 2e                	jmp    9c41 <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    9c13:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    9c1a:	7d 15                	jge    9c31 <SubBandSynthesis+0x1ce>
    9c1c:	89 f8                	mov    %edi,%eax
    9c1e:	8d 14 00             	lea    (%eax,%eax,1),%edx
    9c21:	8b 45 10             	mov    0x10(%ebp),%eax
    9c24:	01 d0                	add    %edx,%eax
    9c26:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    9c2b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9c2f:	eb 10                	jmp    9c41 <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    9c31:	89 f8                	mov    %edi,%eax
    9c33:	8d 14 00             	lea    (%eax,%eax,1),%edx
    9c36:	8b 45 10             	mov    0x10(%ebp),%eax
    9c39:	01 c2                	add    %eax,%edx
    9c3b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9c3e:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    9c41:	83 c7 01             	add    $0x1,%edi
    9c44:	83 ff 1f             	cmp    $0x1f,%edi
    9c47:	0f 8e 30 ff ff ff    	jle    9b7d <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    9c4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    9c50:	83 c4 2c             	add    $0x2c,%esp
    9c53:	5b                   	pop    %ebx
    9c54:	5e                   	pop    %esi
    9c55:	5f                   	pop    %edi
    9c56:	5d                   	pop    %ebp
    9c57:	c3                   	ret    

00009c58 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    9c58:	55                   	push   %ebp
    9c59:	89 e5                	mov    %esp,%ebp
    9c5b:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    9c5e:	8b 45 10             	mov    0x10(%ebp),%eax
    9c61:	8b 40 08             	mov    0x8(%eax),%eax
    9c64:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    9c67:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    9c6e:	eb 75                	jmp    9ce5 <out_fifo+0x8d>
    9c70:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    9c77:	eb 62                	jmp    9cdb <out_fifo+0x83>
            (*psampFrames)++;
    9c79:	8b 45 14             	mov    0x14(%ebp),%eax
    9c7c:	8b 00                	mov    (%eax),%eax
    9c7e:	8d 50 01             	lea    0x1(%eax),%edx
    9c81:	8b 45 14             	mov    0x14(%ebp),%eax
    9c84:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    9c86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c8d:	eb 40                	jmp    9ccf <out_fifo+0x77>
                if (!(k%1600) && k) {
    9c8f:	8b 0d ec 0d 01 00    	mov    0x10dec,%ecx
    9c95:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    9c9a:	89 c8                	mov    %ecx,%eax
    9c9c:	f7 ea                	imul   %edx
    9c9e:	c1 fa 09             	sar    $0x9,%edx
    9ca1:	89 c8                	mov    %ecx,%eax
    9ca3:	c1 f8 1f             	sar    $0x1f,%eax
    9ca6:	29 c2                	sub    %eax,%edx
    9ca8:	89 d0                	mov    %edx,%eax
    9caa:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    9cb0:	29 c1                	sub    %eax,%ecx
    9cb2:	89 c8                	mov    %ecx,%eax
    9cb4:	85 c0                	test   %eax,%eax
    9cb6:	75 13                	jne    9ccb <out_fifo+0x73>
    9cb8:	a1 ec 0d 01 00       	mov    0x10dec,%eax
    9cbd:	85 c0                	test   %eax,%eax
    9cbf:	74 0a                	je     9ccb <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    9cc1:	c7 05 ec 0d 01 00 00 	movl   $0x0,0x10dec
    9cc8:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    9ccb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ccf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9cd2:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9cd5:	7c b8                	jl     9c8f <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    9cd7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    9cdb:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    9cdf:	7e 98                	jle    9c79 <out_fifo+0x21>
    9ce1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    9ce5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    9ce8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    9ceb:	7c 83                	jl     9c70 <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    9ced:	c9                   	leave  
    9cee:	c3                   	ret    

00009cef <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    9cef:	55                   	push   %ebp
    9cf0:	89 e5                	mov    %esp,%ebp
    9cf2:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    9cf5:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    9cfc:	00 
    9cfd:	8b 45 08             	mov    0x8(%ebp),%eax
    9d00:	89 04 24             	mov    %eax,(%esp)
    9d03:	e8 8b a8 ff ff       	call   4593 <getbits>
    9d08:	8b 55 0c             	mov    0xc(%ebp),%edx
    9d0b:	89 02                	mov    %eax,(%edx)
}
    9d0d:	c9                   	leave  
    9d0e:	c3                   	ret    

00009d0f <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    9d0f:	55                   	push   %ebp
    9d10:	89 e5                	mov    %esp,%ebp
    9d12:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    9d15:	8b 45 08             	mov    0x8(%ebp),%eax
    9d18:	8b 40 0c             	mov    0xc(%eax),%eax
    9d1b:	83 c0 1e             	add    $0x1e,%eax
    9d1e:	8b 14 85 40 db 00 00 	mov    0xdb40(,%eax,4),%edx
    9d25:	89 d0                	mov    %edx,%eax
    9d27:	c1 e0 03             	shl    $0x3,%eax
    9d2a:	01 d0                	add    %edx,%eax
    9d2c:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    9d2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    9d32:	db 45 ec             	fildl  -0x14(%ebp)
    9d35:	8b 45 08             	mov    0x8(%ebp),%eax
    9d38:	8b 40 10             	mov    0x10(%eax),%eax
    9d3b:	dd 04 c5 00 dc 00 00 	fldl   0xdc00(,%eax,8)
    9d42:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    9d44:	d9 7d ea             	fnstcw -0x16(%ebp)
    9d47:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    9d4b:	b4 0c                	mov    $0xc,%ah
    9d4d:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    9d51:	d9 6d e8             	fldcw  -0x18(%ebp)
    9d54:	db 5d fc             	fistpl -0x4(%ebp)
    9d57:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    9d5a:	8b 45 08             	mov    0x8(%ebp),%eax
    9d5d:	8b 40 14             	mov    0x14(%eax),%eax
    9d60:	85 c0                	test   %eax,%eax
    9d62:	74 04                	je     9d68 <main_data_slots+0x59>
    9d64:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    9d68:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    9d6c:	8b 45 08             	mov    0x8(%ebp),%eax
    9d6f:	8b 40 08             	mov    0x8(%eax),%eax
    9d72:	85 c0                	test   %eax,%eax
    9d74:	74 04                	je     9d7a <main_data_slots+0x6b>
		nSlots -= 2;
    9d76:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    9d7a:	8b 45 10             	mov    0x10(%ebp),%eax
    9d7d:	83 f8 01             	cmp    $0x1,%eax
    9d80:	75 06                	jne    9d88 <main_data_slots+0x79>
		nSlots -= 17;
    9d82:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    9d86:	eb 04                	jmp    9d8c <main_data_slots+0x7d>
	else
		nSlots -=32;
    9d88:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    9d8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    9d8f:	c9                   	leave  
    9d90:	c3                   	ret    
