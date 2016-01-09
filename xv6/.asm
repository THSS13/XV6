
_finder:     file format elf32-i386


Disassembly of section .text:

00000000 <addFileItem>:
//测试相关函数
void printItemList();
void testHandlers();

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	53                   	push   %ebx
       4:	83 ec 44             	sub    $0x44,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
       7:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
       e:	e8 00 41 00 00       	call   4113 <malloc>
      13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      16:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1d:	e8 f1 40 00 00       	call   4113 <malloc>
      22:	8b 55 f4             	mov    -0xc(%ebp),%edx
      25:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      28:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2b:	8b 40 14             	mov    0x14(%eax),%eax
      2e:	8b 55 1c             	mov    0x1c(%ebp),%edx
      31:	89 54 24 04          	mov    %edx,0x4(%esp)
      35:	89 04 24             	mov    %eax,(%esp)
      38:	e8 d4 39 00 00       	call   3a11 <strcpy>
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
      3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      40:	8b 55 08             	mov    0x8(%ebp),%edx
      43:	89 10                	mov    %edx,(%eax)
      45:	8b 55 0c             	mov    0xc(%ebp),%edx
      48:	89 50 04             	mov    %edx,0x4(%eax)
      4b:	8b 55 10             	mov    0x10(%ebp),%edx
      4e:	89 50 08             	mov    %edx,0x8(%eax)
      51:	8b 55 14             	mov    0x14(%ebp),%edx
      54:	89 50 0c             	mov    %edx,0xc(%eax)
      57:	8b 55 18             	mov    0x18(%ebp),%edx
      5a:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
      5d:	8b 15 44 d6 00 00    	mov    0xd644,%edx
      63:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      66:	8d 45 d8             	lea    -0x28(%ebp),%eax
      69:	89 54 24 10          	mov    %edx,0x10(%esp)
      6d:	8b 15 c0 10 01 00    	mov    0x110c0,%edx
      73:	89 54 24 04          	mov    %edx,0x4(%esp)
      77:	8b 15 c4 10 01 00    	mov    0x110c4,%edx
      7d:	89 54 24 08          	mov    %edx,0x8(%esp)
      81:	8b 15 c8 10 01 00    	mov    0x110c8,%edx
      87:	89 54 24 0c          	mov    %edx,0xc(%esp)
      8b:	89 04 24             	mov    %eax,(%esp)
      8e:	e8 92 0d 00 00       	call   e25 <getPos>
      93:	83 ec 04             	sub    $0x4,%esp
      96:	8b 45 d8             	mov    -0x28(%ebp),%eax
      99:	89 43 18             	mov    %eax,0x18(%ebx)
      9c:	8b 45 dc             	mov    -0x24(%ebp),%eax
      9f:	89 43 1c             	mov    %eax,0x1c(%ebx)
      a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
      a5:	89 43 20             	mov    %eax,0x20(%ebx)
      a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      ab:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
      ae:	8b 15 40 d6 00 00    	mov    0xd640,%edx
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b7:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c7:	a3 40 d6 00 00       	mov    %eax,0xd640
}
      cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
      cf:	c9                   	leave  
      d0:	c3                   	ret    

000000d1 <freeFileItemList>:

void freeFileItemList() {
      d1:	55                   	push   %ebp
      d2:	89 e5                	mov    %esp,%ebp
      d4:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
      d7:	a1 40 d6 00 00       	mov    0xd640,%eax
      dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
      df:	eb 28                	jmp    109 <freeFileItemList+0x38>
		temp = p;
      e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
      e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
      e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
      ea:	8b 40 2c             	mov    0x2c(%eax),%eax
      ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
      f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      f3:	8b 40 14             	mov    0x14(%eax),%eax
      f6:	89 04 24             	mov    %eax,(%esp)
      f9:	e8 e6 3e 00 00       	call   3fe4 <free>
		free(temp);
      fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     101:	89 04 24             	mov    %eax,(%esp)
     104:	e8 db 3e 00 00       	call   3fe4 <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     109:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     10d:	75 d2                	jne    e1 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     10f:	c7 05 40 d6 00 00 00 	movl   $0x0,0xd640
     116:	00 00 00 
}
     119:	c9                   	leave  
     11a:	c3                   	ret    

0000011b <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     11b:	55                   	push   %ebp
     11c:	89 e5                	mov    %esp,%ebp
     11e:	83 ec 28             	sub    $0x28,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     121:	8b 45 08             	mov    0x8(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 5a 39 00 00       	call   3a86 <strlen>
     12c:	03 45 08             	add    0x8(%ebp),%eax
     12f:	89 45 f4             	mov    %eax,-0xc(%ebp)
     132:	eb 04                	jmp    138 <fmtname+0x1d>
     134:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     138:	8b 45 f4             	mov    -0xc(%ebp),%eax
     13b:	3b 45 08             	cmp    0x8(%ebp),%eax
     13e:	72 0a                	jb     14a <fmtname+0x2f>
     140:	8b 45 f4             	mov    -0xc(%ebp),%eax
     143:	0f b6 00             	movzbl (%eax),%eax
     146:	3c 2f                	cmp    $0x2f,%al
     148:	75 ea                	jne    134 <fmtname+0x19>
		;
	p++;
     14a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     14e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     151:	c9                   	leave  
     152:	c3                   	ret    

00000153 <isListable>:

int isListable(char *name, short type) {
     153:	55                   	push   %ebp
     154:	89 e5                	mov    %esp,%ebp
     156:	83 ec 14             	sub    $0x14,%esp
     159:	8b 45 0c             	mov    0xc(%ebp),%eax
     15c:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     160:	8b 45 08             	mov    0x8(%ebp),%eax
     163:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     166:	8b 45 fc             	mov    -0x4(%ebp),%eax
     169:	0f b6 00             	movzbl (%eax),%eax
     16c:	3c 2e                	cmp    $0x2e,%al
     16e:	75 07                	jne    177 <isListable+0x24>
     170:	b8 00 00 00 00       	mov    $0x0,%eax
     175:	eb 35                	jmp    1ac <isListable+0x59>
	if (type == T_DIR) return 1;
     177:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     17c:	75 1e                	jne    19c <isListable+0x49>
     17e:	b8 01 00 00 00       	mov    $0x1,%eax
     183:	eb 27                	jmp    1ac <isListable+0x59>
	while (*p != 0) {
		if (*p == '.')
     185:	8b 45 fc             	mov    -0x4(%ebp),%eax
     188:	0f b6 00             	movzbl (%eax),%eax
     18b:	3c 2e                	cmp    $0x2e,%al
     18d:	75 07                	jne    196 <isListable+0x43>
			return 1;
     18f:	b8 01 00 00 00       	mov    $0x1,%eax
     194:	eb 16                	jmp    1ac <isListable+0x59>
		p++;
     196:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     19a:	eb 01                	jmp    19d <isListable+0x4a>

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     19c:	90                   	nop
     19d:	8b 45 fc             	mov    -0x4(%ebp),%eax
     1a0:	0f b6 00             	movzbl (%eax),%eax
     1a3:	84 c0                	test   %al,%al
     1a5:	75 de                	jne    185 <isListable+0x32>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     1a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
     1ac:	c9                   	leave  
     1ad:	c3                   	ret    

000001ae <list>:

void list(char *path) {
     1ae:	55                   	push   %ebp
     1af:	89 e5                	mov    %esp,%ebp
     1b1:	57                   	push   %edi
     1b2:	56                   	push   %esi
     1b3:	53                   	push   %ebx
     1b4:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     1ba:	c7 05 44 d6 00 00 00 	movl   $0x0,0xd644
     1c1:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1cb:	00 
     1cc:	8b 45 08             	mov    0x8(%ebp),%eax
     1cf:	89 04 24             	mov    %eax,(%esp)
     1d2:	e8 b9 3a 00 00       	call   3c90 <open>
     1d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1da:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1de:	79 20                	jns    200 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     1e0:	8b 45 08             	mov    0x8(%ebp),%eax
     1e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     1e7:	c7 44 24 04 28 89 00 	movl   $0x8928,0x4(%esp)
     1ee:	00 
     1ef:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f6:	e8 34 3c 00 00       	call   3e2f <printf>
		return;
     1fb:	e9 8f 02 00 00       	jmp    48f <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     200:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     206:	89 44 24 04          	mov    %eax,0x4(%esp)
     20a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     20d:	89 04 24             	mov    %eax,(%esp)
     210:	e8 93 3a 00 00       	call   3ca8 <fstat>
     215:	85 c0                	test   %eax,%eax
     217:	79 2b                	jns    244 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     219:	8b 45 08             	mov    0x8(%ebp),%eax
     21c:	89 44 24 08          	mov    %eax,0x8(%esp)
     220:	c7 44 24 04 3c 89 00 	movl   $0x893c,0x4(%esp)
     227:	00 
     228:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     22f:	e8 fb 3b 00 00       	call   3e2f <printf>
		close(fd);
     234:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     237:	89 04 24             	mov    %eax,(%esp)
     23a:	e8 39 3a 00 00       	call   3c78 <close>
		return;
     23f:	e9 4b 02 00 00       	jmp    48f <list+0x2e1>
	}

	switch (st.type) {
     244:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     24b:	98                   	cwtl   
     24c:	83 f8 01             	cmp    $0x1,%eax
     24f:	74 53                	je     2a4 <list+0xf6>
     251:	83 f8 02             	cmp    $0x2,%eax
     254:	0f 85 2a 02 00 00    	jne    484 <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     25a:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     260:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     266:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     26d:	0f bf d8             	movswl %ax,%ebx
     270:	8b 45 08             	mov    0x8(%ebp),%eax
     273:	89 04 24             	mov    %eax,(%esp)
     276:	e8 a0 fe ff ff       	call   11b <fmtname>
     27b:	89 7c 24 14          	mov    %edi,0x14(%esp)
     27f:	89 74 24 10          	mov    %esi,0x10(%esp)
     283:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     287:	89 44 24 08          	mov    %eax,0x8(%esp)
     28b:	c7 44 24 04 50 89 00 	movl   $0x8950,0x4(%esp)
     292:	00 
     293:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29a:	e8 90 3b 00 00       	call   3e2f <printf>
		break;
     29f:	e9 e0 01 00 00       	jmp    484 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     2a4:	8b 45 08             	mov    0x8(%ebp),%eax
     2a7:	89 04 24             	mov    %eax,(%esp)
     2aa:	e8 d7 37 00 00       	call   3a86 <strlen>
     2af:	83 c0 10             	add    $0x10,%eax
     2b2:	3d 00 02 00 00       	cmp    $0x200,%eax
     2b7:	76 19                	jbe    2d2 <list+0x124>
			printf(1, "ls: path too long\n");
     2b9:	c7 44 24 04 5d 89 00 	movl   $0x895d,0x4(%esp)
     2c0:	00 
     2c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2c8:	e8 62 3b 00 00       	call   3e2f <printf>
			break;
     2cd:	e9 b2 01 00 00       	jmp    484 <list+0x2d6>
		}
		strcpy(buf, path);
     2d2:	8b 45 08             	mov    0x8(%ebp),%eax
     2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
     2d9:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2df:	89 04 24             	mov    %eax,(%esp)
     2e2:	e8 2a 37 00 00       	call   3a11 <strcpy>
		p = buf + strlen(buf);
     2e7:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ed:	89 04 24             	mov    %eax,(%esp)
     2f0:	e8 91 37 00 00       	call   3a86 <strlen>
     2f5:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     2fb:	01 d0                	add    %edx,%eax
     2fd:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     300:	8b 45 e0             	mov    -0x20(%ebp),%eax
     303:	c6 00 2f             	movb   $0x2f,(%eax)
     306:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     30a:	e9 4e 01 00 00       	jmp    45d <list+0x2af>
			if (de.inum == 0)
     30f:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     316:	66 85 c0             	test   %ax,%ax
     319:	0f 84 3d 01 00 00    	je     45c <list+0x2ae>
				continue;
			memmove(p, de.name, DIRSIZ);
     31f:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     326:	00 
     327:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     32d:	83 c0 02             	add    $0x2,%eax
     330:	89 44 24 04          	mov    %eax,0x4(%esp)
     334:	8b 45 e0             	mov    -0x20(%ebp),%eax
     337:	89 04 24             	mov    %eax,(%esp)
     33a:	e8 cb 38 00 00       	call   3c0a <memmove>
			p[DIRSIZ] = 0;
     33f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     342:	83 c0 0e             	add    $0xe,%eax
     345:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     348:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     34e:	89 44 24 04          	mov    %eax,0x4(%esp)
     352:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     358:	89 04 24             	mov    %eax,(%esp)
     35b:	e8 11 38 00 00       	call   3b71 <stat>
     360:	85 c0                	test   %eax,%eax
     362:	79 23                	jns    387 <list+0x1d9>
				printf(1, "ls: cannot stat %s\n", buf);
     364:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     36a:	89 44 24 08          	mov    %eax,0x8(%esp)
     36e:	c7 44 24 04 3c 89 00 	movl   $0x893c,0x4(%esp)
     375:	00 
     376:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     37d:	e8 ad 3a 00 00       	call   3e2f <printf>
				continue;
     382:	e9 d6 00 00 00       	jmp    45d <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     387:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     38e:	0f bf d8             	movswl %ax,%ebx
     391:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     397:	89 04 24             	mov    %eax,(%esp)
     39a:	e8 7c fd ff ff       	call   11b <fmtname>
     39f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     3a3:	89 04 24             	mov    %eax,(%esp)
     3a6:	e8 a8 fd ff ff       	call   153 <isListable>
     3ab:	85 c0                	test   %eax,%eax
     3ad:	0f 84 aa 00 00 00    	je     45d <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     3b3:	8b 15 44 d6 00 00    	mov    0xd644,%edx
     3b9:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3bc:	89 54 24 10          	mov    %edx,0x10(%esp)
     3c0:	8b 15 c0 10 01 00    	mov    0x110c0,%edx
     3c6:	89 54 24 04          	mov    %edx,0x4(%esp)
     3ca:	8b 15 c4 10 01 00    	mov    0x110c4,%edx
     3d0:	89 54 24 08          	mov    %edx,0x8(%esp)
     3d4:	8b 15 c8 10 01 00    	mov    0x110c8,%edx
     3da:	89 54 24 0c          	mov    %edx,0xc(%esp)
     3de:	89 04 24             	mov    %eax,(%esp)
     3e1:	e8 3f 0a 00 00       	call   e25 <getPos>
     3e6:	83 ec 04             	sub    $0x4,%esp
     3e9:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3ef:	89 04 24             	mov    %eax,(%esp)
     3f2:	e8 24 fd ff ff       	call   11b <fmtname>
     3f7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     3fa:	89 54 24 18          	mov    %edx,0x18(%esp)
     3fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     401:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     405:	8b 55 d8             	mov    -0x28(%ebp),%edx
     408:	89 54 24 20          	mov    %edx,0x20(%esp)
     40c:	8b 55 dc             	mov    -0x24(%ebp),%edx
     40f:	89 54 24 24          	mov    %edx,0x24(%esp)
     413:	89 44 24 14          	mov    %eax,0x14(%esp)
     417:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     41d:	89 04 24             	mov    %eax,(%esp)
     420:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     426:	89 44 24 04          	mov    %eax,0x4(%esp)
     42a:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     430:	89 44 24 08          	mov    %eax,0x8(%esp)
     434:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     43a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     43e:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     444:	89 44 24 10          	mov    %eax,0x10(%esp)
     448:	e8 b3 fb ff ff       	call   0 <addFileItem>
				itemCounter++;
     44d:	a1 44 d6 00 00       	mov    0xd644,%eax
     452:	83 c0 01             	add    $0x1,%eax
     455:	a3 44 d6 00 00       	mov    %eax,0xd644
     45a:	eb 01                	jmp    45d <list+0x2af>
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
			if (de.inum == 0)
				continue;
     45c:	90                   	nop
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     45d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     464:	00 
     465:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     46b:	89 44 24 04          	mov    %eax,0x4(%esp)
     46f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     472:	89 04 24             	mov    %eax,(%esp)
     475:	e8 ee 37 00 00       	call   3c68 <read>
     47a:	83 f8 10             	cmp    $0x10,%eax
     47d:	0f 84 8c fe ff ff    	je     30f <list+0x161>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     483:	90                   	nop
	}
	close(fd);
     484:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     487:	89 04 24             	mov    %eax,(%esp)
     48a:	e8 e9 37 00 00       	call   3c78 <close>
}
     48f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     492:	5b                   	pop    %ebx
     493:	5e                   	pop    %esi
     494:	5f                   	pop    %edi
     495:	5d                   	pop    %ebp
     496:	c3                   	ret    

00000497 <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     497:	55                   	push   %ebp
     498:	89 e5                	mov    %esp,%ebp
     49a:	53                   	push   %ebx
     49b:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0) 
     49e:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     4a2:	75 08                	jne    4ac <drawItem+0x15>
		nameColor = 0x0;
     4a4:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     4aa:	eb 49                	jmp    4f5 <drawItem+0x5e>
	else 
	{
		nameColor = 0xFFFF;
     4ac:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     4b2:	8b 45 38             	mov    0x38(%ebp),%eax
     4b5:	89 c3                	mov    %eax,%ebx
     4b7:	8b 45 34             	mov    0x34(%ebp),%eax
     4ba:	89 c1                	mov    %eax,%ecx
     4bc:	8b 45 30             	mov    0x30(%ebp),%eax
     4bf:	89 c2                	mov    %eax,%edx
     4c1:	8b 45 2c             	mov    0x2c(%ebp),%eax
     4c4:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     4cb:	00 
     4cc:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     4d0:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     4d4:	89 54 24 10          	mov    %edx,0x10(%esp)
     4d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     4dc:	8b 45 08             	mov    0x8(%ebp),%eax
     4df:	89 04 24             	mov    %eax,(%esp)
     4e2:	8b 45 0c             	mov    0xc(%ebp),%eax
     4e5:	89 44 24 04          	mov    %eax,0x4(%esp)
     4e9:	8b 45 10             	mov    0x10(%ebp),%eax
     4ec:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f0:	e8 d4 19 00 00       	call   1ec9 <fill_rect>
	}
	if (style == ICON_STYLE) {
     4f5:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
     4fa:	83 f8 01             	cmp    $0x1,%eax
     4fd:	0f 85 13 01 00 00    	jne    616 <drawItem+0x17f>
		switch (st.type) {
     503:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     507:	98                   	cwtl   
     508:	83 f8 01             	cmp    $0x1,%eax
     50b:	74 53                	je     560 <drawItem+0xc9>
     50d:	83 f8 02             	cmp    $0x2,%eax
     510:	0f 85 93 00 00 00    	jne    5a9 <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     516:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     519:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     51c:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     51f:	83 c0 19             	add    $0x19,%eax
     522:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     526:	89 44 24 18          	mov    %eax,0x18(%esp)
     52a:	a1 e8 a2 00 00       	mov    0xa2e8,%eax
     52f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     533:	a1 ec a2 00 00       	mov    0xa2ec,%eax
     538:	89 44 24 10          	mov    %eax,0x10(%esp)
     53c:	a1 f0 a2 00 00       	mov    0xa2f0,%eax
     541:	89 44 24 14          	mov    %eax,0x14(%esp)
     545:	8b 45 08             	mov    0x8(%ebp),%eax
     548:	89 04 24             	mov    %eax,(%esp)
     54b:	8b 45 0c             	mov    0xc(%ebp),%eax
     54e:	89 44 24 04          	mov    %eax,0x4(%esp)
     552:	8b 45 10             	mov    0x10(%ebp),%eax
     555:	89 44 24 08          	mov    %eax,0x8(%esp)
     559:	e8 29 20 00 00       	call   2587 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     55e:	eb 49                	jmp    5a9 <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     560:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     563:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     566:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     569:	83 c0 19             	add    $0x19,%eax
     56c:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     570:	89 44 24 18          	mov    %eax,0x18(%esp)
     574:	a1 50 a3 00 00       	mov    0xa350,%eax
     579:	89 44 24 0c          	mov    %eax,0xc(%esp)
     57d:	a1 54 a3 00 00       	mov    0xa354,%eax
     582:	89 44 24 10          	mov    %eax,0x10(%esp)
     586:	a1 58 a3 00 00       	mov    0xa358,%eax
     58b:	89 44 24 14          	mov    %eax,0x14(%esp)
     58f:	8b 45 08             	mov    0x8(%ebp),%eax
     592:	89 04 24             	mov    %eax,(%esp)
     595:	8b 45 0c             	mov    0xc(%ebp),%eax
     598:	89 44 24 04          	mov    %eax,0x4(%esp)
     59c:	8b 45 10             	mov    0x10(%ebp),%eax
     59f:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a3:	e8 df 1f 00 00       	call   2587 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5a8:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5a9:	8b 45 14             	mov    0x14(%ebp),%eax
     5ac:	89 04 24             	mov    %eax,(%esp)
     5af:	e8 d2 34 00 00       	call   3a86 <strlen>
     5b4:	89 c2                	mov    %eax,%edx
     5b6:	b8 00 00 00 00       	mov    $0x0,%eax
     5bb:	29 d0                	sub    %edx,%eax
     5bd:	c1 e0 02             	shl    $0x2,%eax
     5c0:	83 c0 30             	add    $0x30,%eax
     5c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     5c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5ca:	79 07                	jns    5d3 <drawItem+0x13c>
			indent = 0;
     5cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     5d3:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     5d6:	8d 48 46             	lea    0x46(%eax),%ecx
     5d9:	8b 45 2c             	mov    0x2c(%ebp),%eax
     5dc:	89 c2                	mov    %eax,%edx
     5de:	03 55 f0             	add    -0x10(%ebp),%edx
     5e1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     5e5:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     5e9:	89 54 24 14          	mov    %edx,0x14(%esp)
     5ed:	89 44 24 10          	mov    %eax,0x10(%esp)
     5f1:	8b 45 14             	mov    0x14(%ebp),%eax
     5f4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5f8:	8b 45 08             	mov    0x8(%ebp),%eax
     5fb:	89 04 24             	mov    %eax,(%esp)
     5fe:	8b 45 0c             	mov    0xc(%ebp),%eax
     601:	89 44 24 04          	mov    %eax,0x4(%esp)
     605:	8b 45 10             	mov    0x10(%ebp),%eax
     608:	89 44 24 08          	mov    %eax,0x8(%esp)
     60c:	e8 b8 1e 00 00       	call   24c9 <puts_str>
     611:	e9 33 01 00 00       	jmp    749 <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     616:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     61a:	98                   	cwtl   
     61b:	83 f8 01             	cmp    $0x1,%eax
     61e:	0f 84 a0 00 00 00    	je     6c4 <drawItem+0x22d>
     624:	83 f8 02             	cmp    $0x2,%eax
     627:	0f 85 e0 00 00 00    	jne    70d <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     62d:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     630:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     633:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
     636:	83 c0 08             	add    $0x8,%eax
     639:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     63d:	89 44 24 18          	mov    %eax,0x18(%esp)
     641:	a1 1c a3 00 00       	mov    0xa31c,%eax
     646:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64a:	a1 20 a3 00 00       	mov    0xa320,%eax
     64f:	89 44 24 10          	mov    %eax,0x10(%esp)
     653:	a1 24 a3 00 00       	mov    0xa324,%eax
     658:	89 44 24 14          	mov    %eax,0x14(%esp)
     65c:	8b 45 08             	mov    0x8(%ebp),%eax
     65f:	89 04 24             	mov    %eax,(%esp)
     662:	8b 45 0c             	mov    0xc(%ebp),%eax
     665:	89 44 24 04          	mov    %eax,0x4(%esp)
     669:	8b 45 10             	mov    0x10(%ebp),%eax
     66c:	89 44 24 08          	mov    %eax,0x8(%esp)
     670:	e8 12 1f 00 00       	call   2587 <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     675:	8b 45 28             	mov    0x28(%ebp),%eax
     678:	89 04 24             	mov    %eax,(%esp)
     67b:	e8 cf 00 00 00       	call   74f <sizeFormat>
     680:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     683:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic, 
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     686:	8d 48 03             	lea    0x3(%eax),%ecx
     689:	8b 45 2c             	mov    0x2c(%ebp),%eax
     68c:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     692:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     696:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     69a:	89 54 24 14          	mov    %edx,0x14(%esp)
     69e:	89 44 24 10          	mov    %eax,0x10(%esp)
     6a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6a5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6a9:	8b 45 08             	mov    0x8(%ebp),%eax
     6ac:	89 04 24             	mov    %eax,(%esp)
     6af:	8b 45 0c             	mov    0xc(%ebp),%eax
     6b2:	89 44 24 04          	mov    %eax,0x4(%esp)
     6b6:	8b 45 10             	mov    0x10(%ebp),%eax
     6b9:	89 44 24 08          	mov    %eax,0x8(%esp)
     6bd:	e8 07 1e 00 00       	call   24c9 <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     6c2:	eb 49                	jmp    70d <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6c4:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6c7:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6ca:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6cd:	83 c0 08             	add    $0x8,%eax
     6d0:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     6d4:	89 44 24 18          	mov    %eax,0x18(%esp)
     6d8:	a1 84 a3 00 00       	mov    0xa384,%eax
     6dd:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e1:	a1 88 a3 00 00       	mov    0xa388,%eax
     6e6:	89 44 24 10          	mov    %eax,0x10(%esp)
     6ea:	a1 8c a3 00 00       	mov    0xa38c,%eax
     6ef:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f3:	8b 45 08             	mov    0x8(%ebp),%eax
     6f6:	89 04 24             	mov    %eax,(%esp)
     6f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     6fc:	89 44 24 04          	mov    %eax,0x4(%esp)
     700:	8b 45 10             	mov    0x10(%ebp),%eax
     703:	89 44 24 08          	mov    %eax,0x8(%esp)
     707:	e8 7b 1e 00 00       	call   2587 <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     70c:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     70d:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     710:	8d 48 03             	lea    0x3(%eax),%ecx
     713:	8b 45 2c             	mov    0x2c(%ebp),%eax
     716:	8d 50 28             	lea    0x28(%eax),%edx
     719:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     71d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     721:	89 54 24 14          	mov    %edx,0x14(%esp)
     725:	89 44 24 10          	mov    %eax,0x10(%esp)
     729:	8b 45 14             	mov    0x14(%ebp),%eax
     72c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     730:	8b 45 08             	mov    0x8(%ebp),%eax
     733:	89 04 24             	mov    %eax,(%esp)
     736:	8b 45 0c             	mov    0xc(%ebp),%eax
     739:	89 44 24 04          	mov    %eax,0x4(%esp)
     73d:	8b 45 10             	mov    0x10(%ebp),%eax
     740:	89 44 24 08          	mov    %eax,0x8(%esp)
     744:	e8 80 1d 00 00       	call   24c9 <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     749:	83 c4 34             	add    $0x34,%esp
     74c:	5b                   	pop    %ebx
     74d:	5d                   	pop    %ebp
     74e:	c3                   	ret    

0000074f <sizeFormat>:

char *sizeFormat(uint size){
     74f:	55                   	push   %ebp
     750:	89 e5                	mov    %esp,%ebp
     752:	53                   	push   %ebx
     753:	83 ec 34             	sub    $0x34,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     756:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     75d:	e8 b1 39 00 00       	call   4113 <malloc>
     762:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     765:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400) 
     76c:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     773:	76 7e                	jbe    7f3 <sizeFormat+0xa4>
	{
		size = size / (0x400);
     775:	8b 45 08             	mov    0x8(%ebp),%eax
     778:	c1 e8 0a             	shr    $0xa,%eax
     77b:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     77e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     781:	89 c3                	mov    %eax,%ebx
     783:	03 5d f0             	add    -0x10(%ebp),%ebx
     786:	8b 4d 08             	mov    0x8(%ebp),%ecx
     789:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     78e:	89 c8                	mov    %ecx,%eax
     790:	f7 e2                	mul    %edx
     792:	c1 ea 03             	shr    $0x3,%edx
     795:	89 d0                	mov    %edx,%eax
     797:	c1 e0 02             	shl    $0x2,%eax
     79a:	01 d0                	add    %edx,%eax
     79c:	01 c0                	add    %eax,%eax
     79e:	89 ca                	mov    %ecx,%edx
     7a0:	29 c2                	sub    %eax,%edx
     7a2:	89 d0                	mov    %edx,%eax
     7a4:	83 c0 30             	add    $0x30,%eax
     7a7:	88 03                	mov    %al,(%ebx)
     7a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
			size /= 10;
     7ad:	8b 45 08             	mov    0x8(%ebp),%eax
     7b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     7b3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7bb:	f7 e2                	mul    %edx
     7bd:	89 d0                	mov    %edx,%eax
     7bf:	c1 e8 03             	shr    $0x3,%eax
     7c2:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     7c5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     7c9:	75 b3                	jne    77e <sizeFormat+0x2f>
		result[n++] = 'K';
     7cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7ce:	03 45 f0             	add    -0x10(%ebp),%eax
     7d1:	c6 00 4b             	movb   $0x4b,(%eax)
     7d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n++] = 'b';
     7d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7db:	03 45 f0             	add    -0x10(%ebp),%eax
     7de:	c6 00 62             	movb   $0x62,(%eax)
     7e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n] = 0;
     7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e8:	03 45 f0             	add    -0x10(%ebp),%eax
     7eb:	c6 00 00             	movb   $0x0,(%eax)
     7ee:	e9 8a 00 00 00       	jmp    87d <sizeFormat+0x12e>
	}
	else 
	{
		do{
			result[n++] = (size % 10) + '0';
     7f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7f6:	89 c3                	mov    %eax,%ebx
     7f8:	03 5d f0             	add    -0x10(%ebp),%ebx
     7fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
     7fe:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     803:	89 c8                	mov    %ecx,%eax
     805:	f7 e2                	mul    %edx
     807:	c1 ea 03             	shr    $0x3,%edx
     80a:	89 d0                	mov    %edx,%eax
     80c:	c1 e0 02             	shl    $0x2,%eax
     80f:	01 d0                	add    %edx,%eax
     811:	01 c0                	add    %eax,%eax
     813:	89 ca                	mov    %ecx,%edx
     815:	29 c2                	sub    %eax,%edx
     817:	89 d0                	mov    %edx,%eax
     819:	83 c0 30             	add    $0x30,%eax
     81c:	88 03                	mov    %al,(%ebx)
     81e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
			size /= 10;
     822:	8b 45 08             	mov    0x8(%ebp),%eax
     825:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     828:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     82d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     830:	f7 e2                	mul    %edx
     832:	89 d0                	mov    %edx,%eax
     834:	c1 e8 03             	shr    $0x3,%eax
     837:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     83a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     83e:	75 b3                	jne    7f3 <sizeFormat+0xa4>
		result[n++] = 'b';
     840:	8b 45 f4             	mov    -0xc(%ebp),%eax
     843:	03 45 f0             	add    -0x10(%ebp),%eax
     846:	c6 00 62             	movb   $0x62,(%eax)
     849:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n++] = 'y';
     84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     850:	03 45 f0             	add    -0x10(%ebp),%eax
     853:	c6 00 79             	movb   $0x79,(%eax)
     856:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n++] = 't';
     85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     85d:	03 45 f0             	add    -0x10(%ebp),%eax
     860:	c6 00 74             	movb   $0x74,(%eax)
     863:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n++] = 'e';
     867:	8b 45 f4             	mov    -0xc(%ebp),%eax
     86a:	03 45 f0             	add    -0x10(%ebp),%eax
     86d:	c6 00 65             	movb   $0x65,(%eax)
     870:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		result[n] = 0;
     874:	8b 45 f4             	mov    -0xc(%ebp),%eax
     877:	03 45 f0             	add    -0x10(%ebp),%eax
     87a:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     87d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     880:	83 c4 34             	add    $0x34,%esp
     883:	5b                   	pop    %ebx
     884:	5d                   	pop    %ebp
     885:	c3                   	ret    

00000886 <drawFinderWnd>:
				- (BUTTON_HEIGHT + 3) }, { "up.bmp", 2 * BUTTON_WIDTH + 100,
		TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, { "trash.bmp",
		3 * BUTTON_WIDTH + 110, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     886:	55                   	push   %ebp
     887:	89 e5                	mov    %esp,%ebp
     889:	83 ec 28             	sub    $0x28,%esp
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
     88c:	8b 45 10             	mov    0x10(%ebp),%eax
     88f:	89 c2                	mov    %eax,%edx
     891:	8b 45 0c             	mov    0xc(%ebp),%eax
     894:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     89b:	00 
     89c:	89 54 24 18          	mov    %edx,0x18(%esp)
     8a0:	89 44 24 14          	mov    %eax,0x14(%esp)
     8a4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     8ab:	00 
     8ac:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8b3:	00 
     8b4:	8b 45 08             	mov    0x8(%ebp),%eax
     8b7:	89 04 24             	mov    %eax,(%esp)
     8ba:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bd:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c1:	8b 45 10             	mov    0x10(%ebp),%eax
     8c4:	89 44 24 08          	mov    %eax,0x8(%esp)
     8c8:	e8 fc 15 00 00       	call   1ec9 <fill_rect>

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     8cd:	8b 45 0c             	mov    0xc(%ebp),%eax
     8d0:	83 e8 01             	sub    $0x1,%eax
     8d3:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     8da:	00 
     8db:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     8e2:	00 
     8e3:	89 44 24 14          	mov    %eax,0x14(%esp)
     8e7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     8ee:	00 
     8ef:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8f6:	00 
     8f7:	8b 45 08             	mov    0x8(%ebp),%eax
     8fa:	89 04 24             	mov    %eax,(%esp)
     8fd:	8b 45 0c             	mov    0xc(%ebp),%eax
     900:	89 44 24 04          	mov    %eax,0x4(%esp)
     904:	8b 45 10             	mov    0x10(%ebp),%eax
     907:	89 44 24 08          	mov    %eax,0x8(%esp)
     90b:	e8 46 1d 00 00       	call   2656 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     910:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     913:	8d 48 ff             	lea    -0x1(%eax),%ecx
     916:	8b 45 0c             	mov    0xc(%ebp),%eax
     919:	8d 50 ff             	lea    -0x1(%eax),%edx
     91c:	8b 45 0c             	mov    0xc(%ebp),%eax
     91f:	83 e8 01             	sub    $0x1,%eax
     922:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     929:	00 
     92a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     92e:	89 54 24 14          	mov    %edx,0x14(%esp)
     932:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     939:	00 
     93a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     93e:	8b 45 08             	mov    0x8(%ebp),%eax
     941:	89 04 24             	mov    %eax,(%esp)
     944:	8b 45 0c             	mov    0xc(%ebp),%eax
     947:	89 44 24 04          	mov    %eax,0x4(%esp)
     94b:	8b 45 10             	mov    0x10(%ebp),%eax
     94e:	89 44 24 08          	mov    %eax,0x8(%esp)
     952:	e8 ff 1c 00 00       	call   2656 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     957:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     95a:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     95d:	8b 45 0c             	mov    0xc(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     960:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     963:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     966:	83 e8 01             	sub    $0x1,%eax
     969:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     970:	00 
     971:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     975:	89 54 24 14          	mov    %edx,0x14(%esp)
     979:	89 44 24 10          	mov    %eax,0x10(%esp)
     97d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     984:	00 
     985:	8b 45 08             	mov    0x8(%ebp),%eax
     988:	89 04 24             	mov    %eax,(%esp)
     98b:	8b 45 0c             	mov    0xc(%ebp),%eax
     98e:	89 44 24 04          	mov    %eax,0x4(%esp)
     992:	8b 45 10             	mov    0x10(%ebp),%eax
     995:	89 44 24 08          	mov    %eax,0x8(%esp)
     999:	e8 b8 1c 00 00       	call   2656 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     99e:	8b 45 10             	mov    0x10(%ebp),%eax
     9a1:	83 e8 01             	sub    $0x1,%eax
     9a4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     9ab:	00 
     9ac:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     9b3:	00 
     9b4:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     9bb:	00 
     9bc:	89 44 24 10          	mov    %eax,0x10(%esp)
     9c0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9c7:	00 
     9c8:	8b 45 08             	mov    0x8(%ebp),%eax
     9cb:	89 04 24             	mov    %eax,(%esp)
     9ce:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d1:	89 44 24 04          	mov    %eax,0x4(%esp)
     9d5:	8b 45 10             	mov    0x10(%ebp),%eax
     9d8:	89 44 24 08          	mov    %eax,0x8(%esp)
     9dc:	e8 75 1c 00 00       	call   2656 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     9e1:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e4:	83 e8 02             	sub    $0x2,%eax
     9e7:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     9ee:	00 
     9ef:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     9f6:	00 
     9f7:	89 44 24 14          	mov    %eax,0x14(%esp)
     9fb:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     a02:	00 
     a03:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     a0a:	00 
     a0b:	8b 45 08             	mov    0x8(%ebp),%eax
     a0e:	89 04 24             	mov    %eax,(%esp)
     a11:	8b 45 0c             	mov    0xc(%ebp),%eax
     a14:	89 44 24 04          	mov    %eax,0x4(%esp)
     a18:	8b 45 10             	mov    0x10(%ebp),%eax
     a1b:	89 44 24 08          	mov    %eax,0x8(%esp)
     a1f:	e8 a5 14 00 00       	call   1ec9 <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     a24:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     a2b:	00 
     a2c:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     a33:	00 
     a34:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a3b:	00 
     a3c:	c7 44 24 0c 70 89 00 	movl   $0x8970,0xc(%esp)
     a43:	00 
     a44:	8b 45 08             	mov    0x8(%ebp),%eax
     a47:	89 04 24             	mov    %eax,(%esp)
     a4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     a4d:	89 44 24 04          	mov    %eax,0x4(%esp)
     a51:	8b 45 10             	mov    0x10(%ebp),%eax
     a54:	89 44 24 08          	mov    %eax,0x8(%esp)
     a58:	e8 6c 1a 00 00       	call   24c9 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     a5d:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
     a64:	00 
     a65:	c7 44 24 0c a0 a3 00 	movl   $0xa3a0,0xc(%esp)
     a6c:	00 
     a6d:	8b 45 08             	mov    0x8(%ebp),%eax
     a70:	89 04 24             	mov    %eax,(%esp)
     a73:	8b 45 0c             	mov    0xc(%ebp),%eax
     a76:	89 44 24 04          	mov    %eax,0x4(%esp)
     a7a:	8b 45 10             	mov    0x10(%ebp),%eax
     a7d:	89 44 24 08          	mov    %eax,0x8(%esp)
     a81:	e8 c3 1f 00 00       	call   2a49 <draw_iconlist>


}
     a86:	c9                   	leave  
     a87:	c3                   	ret    

00000a88 <drawFinderContent>:

void drawFinderContent(Context context) {
     a88:	55                   	push   %ebp
     a89:	89 e5                	mov    %esp,%ebp
     a8b:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     a8e:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     a95:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
     a9a:	83 f8 02             	cmp    $0x2,%eax
     a9d:	75 04                	jne    aa3 <drawFinderContent+0x1b>
     a9f:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     aa3:	8b 45 10             	mov    0x10(%ebp),%eax
     aa6:	83 e8 48             	sub    $0x48,%eax
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     aa9:	89 c1                	mov    %eax,%ecx
     aab:	8b 45 0c             	mov    0xc(%ebp),%eax
     aae:	83 e8 02             	sub    $0x2,%eax
     ab1:	89 c2                	mov    %eax,%edx
     ab3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ab6:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     abd:	00 
     abe:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     ac2:	89 54 24 14          	mov    %edx,0x14(%esp)
     ac6:	89 44 24 10          	mov    %eax,0x10(%esp)
     aca:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     ad1:	00 
     ad2:	8b 45 08             	mov    0x8(%ebp),%eax
     ad5:	89 04 24             	mov    %eax,(%esp)
     ad8:	8b 45 0c             	mov    0xc(%ebp),%eax
     adb:	89 44 24 04          	mov    %eax,0x4(%esp)
     adf:	8b 45 10             	mov    0x10(%ebp),%eax
     ae2:	89 44 24 08          	mov    %eax,0x8(%esp)
     ae6:	e8 de 13 00 00       	call   1ec9 <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     aeb:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     aee:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     af1:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     af4:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     af7:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     afa:	83 e8 01             	sub    $0x1,%eax
     afd:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     b04:	00 
     b05:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b09:	89 54 24 14          	mov    %edx,0x14(%esp)
     b0d:	89 44 24 10          	mov    %eax,0x10(%esp)
     b11:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b18:	00 
     b19:	8b 45 08             	mov    0x8(%ebp),%eax
     b1c:	89 04 24             	mov    %eax,(%esp)
     b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
     b22:	89 44 24 04          	mov    %eax,0x4(%esp)
     b26:	8b 45 10             	mov    0x10(%ebp),%eax
     b29:	89 44 24 08          	mov    %eax,0x8(%esp)
     b2d:	e8 24 1b 00 00       	call   2656 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     b32:	a1 40 d6 00 00       	mov    0xd640,%eax
     b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     b3a:	c7 05 44 d6 00 00 00 	movl   $0x0,0xd644
     b41:	00 00 00 
	while (p != 0) {
     b44:	eb 7a                	jmp    bc0 <drawFinderContent+0x138>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
     b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b49:	8b 40 28             	mov    0x28(%eax),%eax
     b4c:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b4f:	8b 52 14             	mov    0x14(%edx),%edx
     b52:	89 44 24 34          	mov    %eax,0x34(%esp)
     b56:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b59:	8b 48 18             	mov    0x18(%eax),%ecx
     b5c:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     b60:	8b 48 1c             	mov    0x1c(%eax),%ecx
     b63:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     b67:	8b 48 20             	mov    0x20(%eax),%ecx
     b6a:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     b6e:	8b 40 24             	mov    0x24(%eax),%eax
     b71:	89 44 24 30          	mov    %eax,0x30(%esp)
     b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b78:	8b 08                	mov    (%eax),%ecx
     b7a:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     b7e:	8b 48 04             	mov    0x4(%eax),%ecx
     b81:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     b85:	8b 48 08             	mov    0x8(%eax),%ecx
     b88:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b8c:	8b 48 0c             	mov    0xc(%eax),%ecx
     b8f:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     b93:	8b 40 10             	mov    0x10(%eax),%eax
     b96:	89 44 24 20          	mov    %eax,0x20(%esp)
     b9a:	89 54 24 0c          	mov    %edx,0xc(%esp)
     b9e:	8b 45 08             	mov    0x8(%ebp),%eax
     ba1:	89 04 24             	mov    %eax,(%esp)
     ba4:	8b 45 0c             	mov    0xc(%ebp),%eax
     ba7:	89 44 24 04          	mov    %eax,0x4(%esp)
     bab:	8b 45 10             	mov    0x10(%ebp),%eax
     bae:	89 44 24 08          	mov    %eax,0x8(%esp)
     bb2:	e8 e0 f8 ff ff       	call   497 <drawItem>
		p = p->next;
     bb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bba:	8b 40 2c             	mov    0x2c(%eax),%eax
     bbd:	89 45 f4             	mov    %eax,-0xc(%ebp)

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
     bc0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bc4:	75 80                	jne    b46 <drawFinderContent+0xbe>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
     bc6:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
     bcb:	83 f8 02             	cmp    $0x2,%eax
     bce:	0f 85 39 01 00 00    	jne    d0d <drawFinderContent+0x285>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     bd4:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     bdb:	00 
     bdc:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     be3:	00 
     be4:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     beb:	00 
     bec:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     bf3:	00 
     bf4:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     bfb:	00 
     bfc:	8b 45 08             	mov    0x8(%ebp),%eax
     bff:	89 04 24             	mov    %eax,(%esp)
     c02:	8b 45 0c             	mov    0xc(%ebp),%eax
     c05:	89 44 24 04          	mov    %eax,0x4(%esp)
     c09:	8b 45 10             	mov    0x10(%ebp),%eax
     c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
     c10:	e8 b4 12 00 00       	call   1ec9 <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     c15:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c1c:	00 
     c1d:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c24:	00 
     c25:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     c2c:	00 
     c2d:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c34:	00 
     c35:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     c3c:	00 
     c3d:	8b 45 08             	mov    0x8(%ebp),%eax
     c40:	89 04 24             	mov    %eax,(%esp)
     c43:	8b 45 0c             	mov    0xc(%ebp),%eax
     c46:	89 44 24 04          	mov    %eax,0x4(%esp)
     c4a:	8b 45 10             	mov    0x10(%ebp),%eax
     c4d:	89 44 24 08          	mov    %eax,0x8(%esp)
     c51:	e8 73 12 00 00       	call   1ec9 <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     c56:	8b 45 0c             	mov    0xc(%ebp),%eax
     c59:	2d c9 00 00 00       	sub    $0xc9,%eax
     c5e:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c65:	00 
     c66:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c6d:	00 
     c6e:	89 44 24 14          	mov    %eax,0x14(%esp)
     c72:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c79:	00 
     c7a:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     c81:	00 
     c82:	8b 45 08             	mov    0x8(%ebp),%eax
     c85:	89 04 24             	mov    %eax,(%esp)
     c88:	8b 45 0c             	mov    0xc(%ebp),%eax
     c8b:	89 44 24 04          	mov    %eax,0x4(%esp)
     c8f:	8b 45 10             	mov    0x10(%ebp),%eax
     c92:	89 44 24 08          	mov    %eax,0x8(%esp)
     c96:	e8 2e 12 00 00       	call   1ec9 <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     c9b:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     ca2:	00 
     ca3:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     caa:	00 
     cab:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cb2:	00 
     cb3:	c7 44 24 0c 77 89 00 	movl   $0x8977,0xc(%esp)
     cba:	00 
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	89 04 24             	mov    %eax,(%esp)
     cc1:	8b 45 0c             	mov    0xc(%ebp),%eax
     cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc8:	8b 45 10             	mov    0x10(%ebp),%eax
     ccb:	89 44 24 08          	mov    %eax,0x8(%esp)
     ccf:	e8 f5 17 00 00       	call   24c9 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cd4:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     cdb:	00 
     cdc:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     ce3:	00 
     ce4:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     ceb:	00 
     cec:	c7 44 24 0c 7c 89 00 	movl   $0x897c,0xc(%esp)
     cf3:	00 
     cf4:	8b 45 08             	mov    0x8(%ebp),%eax
     cf7:	89 04 24             	mov    %eax,(%esp)
     cfa:	8b 45 0c             	mov    0xc(%ebp),%eax
     cfd:	89 44 24 04          	mov    %eax,0x4(%esp)
     d01:	8b 45 10             	mov    0x10(%ebp),%eax
     d04:	89 44 24 08          	mov    %eax,0x8(%esp)
     d08:	e8 bc 17 00 00       	call   24c9 <puts_str>
		}
}
     d0d:	c9                   	leave  
     d0e:	c3                   	ret    

00000d0f <int2str>:

char * int2str(int i)
{
     d0f:	55                   	push   %ebp
     d10:	89 e5                	mov    %esp,%ebp
     d12:	53                   	push   %ebx
     d13:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     d16:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     d1d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d24:	e8 ea 33 00 00       	call   4113 <malloc>
     d29:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     d2c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d33:	e8 db 33 00 00       	call   4113 <malloc>
     d38:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d3e:	89 c3                	mov    %eax,%ebx
     d40:	03 5d ec             	add    -0x14(%ebp),%ebx
     d43:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d46:	ba 67 66 66 66       	mov    $0x66666667,%edx
     d4b:	89 c8                	mov    %ecx,%eax
     d4d:	f7 ea                	imul   %edx
     d4f:	c1 fa 02             	sar    $0x2,%edx
     d52:	89 c8                	mov    %ecx,%eax
     d54:	c1 f8 1f             	sar    $0x1f,%eax
     d57:	29 c2                	sub    %eax,%edx
     d59:	89 d0                	mov    %edx,%eax
     d5b:	c1 e0 02             	shl    $0x2,%eax
     d5e:	01 d0                	add    %edx,%eax
     d60:	01 c0                	add    %eax,%eax
     d62:	89 ca                	mov    %ecx,%edx
     d64:	29 c2                	sub    %eax,%edx
     d66:	89 d0                	mov    %edx,%eax
     d68:	83 c0 30             	add    $0x30,%eax
     d6b:	88 03                	mov    %al,(%ebx)
     d6d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		i /= 10;
     d71:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d74:	ba 67 66 66 66       	mov    $0x66666667,%edx
     d79:	89 c8                	mov    %ecx,%eax
     d7b:	f7 ea                	imul   %edx
     d7d:	c1 fa 02             	sar    $0x2,%edx
     d80:	89 c8                	mov    %ecx,%eax
     d82:	c1 f8 1f             	sar    $0x1f,%eax
     d85:	89 d1                	mov    %edx,%ecx
     d87:	29 c1                	sub    %eax,%ecx
     d89:	89 c8                	mov    %ecx,%eax
     d8b:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     d8e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     d92:	75 a7                	jne    d3b <int2str+0x2c>
	result[n] = 0;
     d94:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d97:	03 45 ec             	add    -0x14(%ebp),%eax
     d9a:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     d9d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     da4:	eb 1b                	jmp    dc1 <int2str+0xb2>
	{
		temp[j] = result[n-1-j];
     da6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     da9:	03 45 e8             	add    -0x18(%ebp),%eax
     dac:	8b 55 f0             	mov    -0x10(%ebp),%edx
     daf:	83 ea 01             	sub    $0x1,%edx
     db2:	2b 55 f4             	sub    -0xc(%ebp),%edx
     db5:	03 55 ec             	add    -0x14(%ebp),%edx
     db8:	0f b6 12             	movzbl (%edx),%edx
     dbb:	88 10                	mov    %dl,(%eax)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     dbd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     dc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dc4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     dc7:	7c dd                	jl     da6 <int2str+0x97>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     dc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     dcc:	03 45 e8             	add    -0x18(%ebp),%eax
     dcf:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     dd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dd5:	89 04 24             	mov    %eax,(%esp)
     dd8:	e8 07 32 00 00       	call   3fe4 <free>
	return temp;
     ddd:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     de0:	83 c4 24             	add    $0x24,%esp
     de3:	5b                   	pop    %ebx
     de4:	5d                   	pop    %ebp
     de5:	c3                   	ret    

00000de6 <printItemList>:

void printItemList() {
     de6:	55                   	push   %ebp
     de7:	89 e5                	mov    %esp,%ebp
     de9:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
     dec:	a1 40 d6 00 00       	mov    0xd640,%eax
     df1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     df4:	eb 27                	jmp    e1d <printItemList+0x37>
		printf(0, "%s\n", p->name);
     df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df9:	8b 40 14             	mov    0x14(%eax),%eax
     dfc:	89 44 24 08          	mov    %eax,0x8(%esp)
     e00:	c7 44 24 04 81 89 00 	movl   $0x8981,0x4(%esp)
     e07:	00 
     e08:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e0f:	e8 1b 30 00 00       	call   3e2f <printf>
		p = p->next;
     e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e17:	8b 40 2c             	mov    0x2c(%eax),%eax
     e1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     e1d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e21:	75 d3                	jne    df6 <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     e23:	c9                   	leave  
     e24:	c3                   	ret    

00000e25 <getPos>:

Rect getPos(Context context, int n) {
     e25:	55                   	push   %ebp
     e26:	89 e5                	mov    %esp,%ebp
     e28:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
     e2b:	a1 a4 a2 00 00       	mov    0xa2a4,%eax
     e30:	83 f8 01             	cmp    $0x1,%eax
     e33:	0f 85 82 00 00 00    	jne    ebb <getPos+0x96>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     e39:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e3c:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     e41:	89 c8                	mov    %ecx,%eax
     e43:	f7 ea                	imul   %edx
     e45:	c1 fa 06             	sar    $0x6,%edx
     e48:	89 c8                	mov    %ecx,%eax
     e4a:	c1 f8 1f             	sar    $0x1f,%eax
     e4d:	89 d1                	mov    %edx,%ecx
     e4f:	29 c1                	sub    %eax,%ecx
     e51:	89 c8                	mov    %ecx,%eax
     e53:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     e56:	8b 45 18             	mov    0x18(%ebp),%eax
     e59:	89 c2                	mov    %eax,%edx
     e5b:	c1 fa 1f             	sar    $0x1f,%edx
     e5e:	f7 7d f4             	idivl  -0xc(%ebp)
     e61:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     e64:	8b 45 18             	mov    0x18(%ebp),%eax
     e67:	89 c2                	mov    %eax,%edx
     e69:	c1 fa 1f             	sar    $0x1f,%edx
     e6c:	f7 7d f4             	idivl  -0xc(%ebp)
     e6f:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     e72:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e75:	6b c0 73             	imul   $0x73,%eax,%eax
     e78:	83 c0 5a             	add    $0x5a,%eax
     e7b:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     e7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e81:	01 c0                	add    %eax,%eax
     e83:	89 c2                	mov    %eax,%edx
     e85:	c1 e2 06             	shl    $0x6,%edx
     e88:	01 d0                	add    %edx,%eax
     e8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top, ICON_ITEM_WIDTH,
     e8d:	8b 45 08             	mov    0x8(%ebp),%eax
     e90:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
     e97:	00 
     e98:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
     e9f:	00 
     ea0:	8b 55 e8             	mov    -0x18(%ebp),%edx
     ea3:	89 54 24 08          	mov    %edx,0x8(%esp)
     ea7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     eaa:	89 54 24 04          	mov    %edx,0x4(%esp)
     eae:	89 04 24             	mov    %eax,(%esp)
     eb1:	e8 51 24 00 00       	call   3307 <initRect>
     eb6:	83 ec 04             	sub    $0x4,%esp
     eb9:	eb 36                	jmp    ef1 <getPos+0xcc>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP), context.width,
     ebb:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ebe:	8b 55 18             	mov    0x18(%ebp),%edx
     ec1:	89 d0                	mov    %edx,%eax
     ec3:	c1 e0 05             	shl    $0x5,%eax
     ec6:	29 d0                	sub    %edx,%eax
     ec8:	8d 50 62             	lea    0x62(%eax),%edx
     ecb:	8b 45 08             	mov    0x8(%ebp),%eax
     ece:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
     ed5:	00 
     ed6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     eda:	89 54 24 08          	mov    %edx,0x8(%esp)
     ede:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ee5:	00 
     ee6:	89 04 24             	mov    %eax,(%esp)
     ee9:	e8 19 24 00 00       	call   3307 <initRect>
     eee:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
     ef1:	8b 45 08             	mov    0x8(%ebp),%eax
     ef4:	c9                   	leave  
     ef5:	c2 04 00             	ret    $0x4

00000ef8 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     ef8:	55                   	push   %ebp
     ef9:	89 e5                	mov    %esp,%ebp
     efb:	83 ec 28             	sub    $0x28,%esp
	switch (item.st.type) {
     efe:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     f02:	98                   	cwtl   
     f03:	83 f8 01             	cmp    $0x1,%eax
     f06:	74 45                	je     f4d <addItemEvent+0x55>
     f08:	83 f8 02             	cmp    $0x2,%eax
     f0b:	0f 85 ac 00 00 00    	jne    fbd <addItemEvent+0xc5>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f11:	c7 44 24 18 e8 16 00 	movl   $0x16e8,0x18(%esp)
     f18:	00 
     f19:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f20:	00 
     f21:	8b 45 24             	mov    0x24(%ebp),%eax
     f24:	89 44 24 04          	mov    %eax,0x4(%esp)
     f28:	8b 45 28             	mov    0x28(%ebp),%eax
     f2b:	89 44 24 08          	mov    %eax,0x8(%esp)
     f2f:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f32:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f36:	8b 45 30             	mov    0x30(%ebp),%eax
     f39:	89 44 24 10          	mov    %eax,0x10(%esp)
     f3d:	8b 45 08             	mov    0x8(%ebp),%eax
     f40:	89 04 24             	mov    %eax,(%esp)
     f43:	e8 ab 24 00 00       	call   33f3 <createClickable>
		break;
     f48:	e9 84 00 00 00       	jmp    fd1 <addItemEvent+0xd9>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f4d:	c7 44 24 18 e8 16 00 	movl   $0x16e8,0x18(%esp)
     f54:	00 
     f55:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f5c:	00 
     f5d:	8b 45 24             	mov    0x24(%ebp),%eax
     f60:	89 44 24 04          	mov    %eax,0x4(%esp)
     f64:	8b 45 28             	mov    0x28(%ebp),%eax
     f67:	89 44 24 08          	mov    %eax,0x8(%esp)
     f6b:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f6e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f72:	8b 45 30             	mov    0x30(%ebp),%eax
     f75:	89 44 24 10          	mov    %eax,0x10(%esp)
     f79:	8b 45 08             	mov    0x8(%ebp),%eax
     f7c:	89 04 24             	mov    %eax,(%esp)
     f7f:	e8 6f 24 00 00       	call   33f3 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     f84:	c7 44 24 18 ce 11 00 	movl   $0x11ce,0x18(%esp)
     f8b:	00 
     f8c:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
     f93:	00 
     f94:	8b 45 24             	mov    0x24(%ebp),%eax
     f97:	89 44 24 04          	mov    %eax,0x4(%esp)
     f9b:	8b 45 28             	mov    0x28(%ebp),%eax
     f9e:	89 44 24 08          	mov    %eax,0x8(%esp)
     fa2:	8b 45 2c             	mov    0x2c(%ebp),%eax
     fa5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     fa9:	8b 45 30             	mov    0x30(%ebp),%eax
     fac:	89 44 24 10          	mov    %eax,0x10(%esp)
     fb0:	8b 45 08             	mov    0x8(%ebp),%eax
     fb3:	89 04 24             	mov    %eax,(%esp)
     fb6:	e8 38 24 00 00       	call   33f3 <createClickable>
		break;
     fbb:	eb 14                	jmp    fd1 <addItemEvent+0xd9>
	default:
		printf(0, "unknown file type!");
     fbd:	c7 44 24 04 85 89 00 	movl   $0x8985,0x4(%esp)
     fc4:	00 
     fc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fcc:	e8 5e 2e 00 00       	call   3e2f <printf>
	}
}
     fd1:	c9                   	leave  
     fd2:	c3                   	ret    

00000fd3 <addListEvent>:

void addListEvent(ClickableManager *cm) {
     fd3:	55                   	push   %ebp
     fd4:	89 e5                	mov    %esp,%ebp
     fd6:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     fd9:	a1 40 d6 00 00       	mov    0xd640,%eax
     fde:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     fe1:	eb 70                	jmp    1053 <addListEvent+0x80>
		temp = p;
     fe3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fe6:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     fe9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fec:	8b 40 2c             	mov    0x2c(%eax),%eax
     fef:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
     ff2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff5:	8b 10                	mov    (%eax),%edx
     ff7:	89 54 24 04          	mov    %edx,0x4(%esp)
     ffb:	8b 50 04             	mov    0x4(%eax),%edx
     ffe:	89 54 24 08          	mov    %edx,0x8(%esp)
    1002:	8b 50 08             	mov    0x8(%eax),%edx
    1005:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1009:	8b 50 0c             	mov    0xc(%eax),%edx
    100c:	89 54 24 10          	mov    %edx,0x10(%esp)
    1010:	8b 50 10             	mov    0x10(%eax),%edx
    1013:	89 54 24 14          	mov    %edx,0x14(%esp)
    1017:	8b 50 14             	mov    0x14(%eax),%edx
    101a:	89 54 24 18          	mov    %edx,0x18(%esp)
    101e:	8b 50 18             	mov    0x18(%eax),%edx
    1021:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1025:	8b 50 1c             	mov    0x1c(%eax),%edx
    1028:	89 54 24 20          	mov    %edx,0x20(%esp)
    102c:	8b 50 20             	mov    0x20(%eax),%edx
    102f:	89 54 24 24          	mov    %edx,0x24(%esp)
    1033:	8b 50 24             	mov    0x24(%eax),%edx
    1036:	89 54 24 28          	mov    %edx,0x28(%esp)
    103a:	8b 50 28             	mov    0x28(%eax),%edx
    103d:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    1041:	8b 40 2c             	mov    0x2c(%eax),%eax
    1044:	89 44 24 30          	mov    %eax,0x30(%esp)
    1048:	8b 45 08             	mov    0x8(%ebp),%eax
    104b:	89 04 24             	mov    %eax,(%esp)
    104e:	e8 a5 fe ff ff       	call   ef8 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    1053:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1057:	75 8a                	jne    fe3 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1059:	c9                   	leave  
    105a:	c3                   	ret    

0000105b <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile };

void addWndEvent(ClickableManager *cm) {
    105b:	55                   	push   %ebp
    105c:	89 e5                	mov    %esp,%ebp
    105e:	57                   	push   %edi
    105f:	56                   	push   %esi
    1060:	53                   	push   %ebx
    1061:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    1064:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    106b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1072:	e9 96 00 00 00       	jmp    110d <addWndEvent+0xb2>
		createClickable(cm,
    1077:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    107a:	8b 1c 85 40 a5 00 00 	mov    0xa540(,%eax,4),%ebx
    1081:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1084:	6b c0 34             	imul   $0x34,%eax,%eax
    1087:	05 c0 a3 00 00       	add    $0xa3c0,%eax
    108c:	8b 78 10             	mov    0x10(%eax),%edi
    108f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1092:	6b c0 34             	imul   $0x34,%eax,%eax
    1095:	05 c0 a3 00 00       	add    $0xa3c0,%eax
    109a:	8b 70 0c             	mov    0xc(%eax),%esi
    109d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10a0:	6b c0 34             	imul   $0x34,%eax,%eax
    10a3:	05 c0 a3 00 00       	add    $0xa3c0,%eax
    10a8:	8b 48 04             	mov    0x4(%eax),%ecx
    10ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ae:	6b c0 34             	imul   $0x34,%eax,%eax
    10b1:	05 c0 a3 00 00       	add    $0xa3c0,%eax
    10b6:	8b 10                	mov    (%eax),%edx
    10b8:	8d 45 d0             	lea    -0x30(%ebp),%eax
    10bb:	89 7c 24 10          	mov    %edi,0x10(%esp)
    10bf:	89 74 24 0c          	mov    %esi,0xc(%esp)
    10c3:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10c7:	89 54 24 04          	mov    %edx,0x4(%esp)
    10cb:	89 04 24             	mov    %eax,(%esp)
    10ce:	e8 34 22 00 00       	call   3307 <initRect>
    10d3:	83 ec 04             	sub    $0x4,%esp
    10d6:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    10da:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    10e1:	00 
    10e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    10e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    10ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    10f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    10f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
    10f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    10fa:	89 44 24 10          	mov    %eax,0x10(%esp)
    10fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1101:	89 04 24             	mov    %eax,(%esp)
    1104:	e8 ea 22 00 00       	call   33f3 <createClickable>
		h_newFile, h_goUp, h_deleteFile };

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1109:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    110d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1110:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1113:	0f 8c 5e ff ff ff    	jl     1077 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
    1119:	8d 65 f4             	lea    -0xc(%ebp),%esp
    111c:	5b                   	pop    %ebx
    111d:	5e                   	pop    %esi
    111e:	5f                   	pop    %edi
    111f:	5d                   	pop    %ebp
    1120:	c3                   	ret    

00001121 <getFileItem>:

struct fileItem * getFileItem(Point point) {
    1121:	55                   	push   %ebp
    1122:	89 e5                	mov    %esp,%ebp
    1124:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1127:	a1 40 d6 00 00       	mov    0xd640,%eax
    112c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    112f:	eb 43                	jmp    1174 <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    1131:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1134:	8b 50 18             	mov    0x18(%eax),%edx
    1137:	89 54 24 08          	mov    %edx,0x8(%esp)
    113b:	8b 50 1c             	mov    0x1c(%eax),%edx
    113e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1142:	8b 50 20             	mov    0x20(%eax),%edx
    1145:	89 54 24 10          	mov    %edx,0x10(%esp)
    1149:	8b 40 24             	mov    0x24(%eax),%eax
    114c:	89 44 24 14          	mov    %eax,0x14(%esp)
    1150:	8b 45 08             	mov    0x8(%ebp),%eax
    1153:	8b 55 0c             	mov    0xc(%ebp),%edx
    1156:	89 04 24             	mov    %eax,(%esp)
    1159:	89 54 24 04          	mov    %edx,0x4(%esp)
    115d:	e8 00 22 00 00       	call   3362 <isIn>
    1162:	85 c0                	test   %eax,%eax
    1164:	74 05                	je     116b <getFileItem+0x4a>
			return p;
    1166:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1169:	eb 14                	jmp    117f <getFileItem+0x5e>
		}
		p = p->next;
    116b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    116e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1171:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    1174:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1178:	75 b7                	jne    1131 <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    117a:	b8 00 00 00 00       	mov    $0x0,%eax
}
    117f:	c9                   	leave  
    1180:	c3                   	ret    

00001181 <enterDir>:

// Handlers
void enterDir(char *name) {
    1181:	55                   	push   %ebp
    1182:	89 e5                	mov    %esp,%ebp
    1184:	83 ec 18             	sub    $0x18,%esp
	printf(0, "entering : %s\n", name);
    1187:	8b 45 08             	mov    0x8(%ebp),%eax
    118a:	89 44 24 08          	mov    %eax,0x8(%esp)
    118e:	c7 44 24 04 98 89 00 	movl   $0x8998,0x4(%esp)
    1195:	00 
    1196:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    119d:	e8 8d 2c 00 00       	call   3e2f <printf>
	if (chdir(name) < 0)
    11a2:	8b 45 08             	mov    0x8(%ebp),%eax
    11a5:	89 04 24             	mov    %eax,(%esp)
    11a8:	e8 13 2b 00 00       	call   3cc0 <chdir>
    11ad:	85 c0                	test   %eax,%eax
    11af:	79 1b                	jns    11cc <enterDir+0x4b>
		printf(2, "cannot cd %s\n", name);
    11b1:	8b 45 08             	mov    0x8(%ebp),%eax
    11b4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b8:	c7 44 24 04 a7 89 00 	movl   $0x89a7,0x4(%esp)
    11bf:	00 
    11c0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    11c7:	e8 63 2c 00 00       	call   3e2f <printf>
}
    11cc:	c9                   	leave  
    11cd:	c3                   	ret    

000011ce <h_enterDir>:

void h_enterDir(Point p) {
    11ce:	55                   	push   %ebp
    11cf:	89 e5                	mov    %esp,%ebp
    11d1:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    11d4:	8b 45 08             	mov    0x8(%ebp),%eax
    11d7:	8b 55 0c             	mov    0xc(%ebp),%edx
    11da:	89 04 24             	mov    %eax,(%esp)
    11dd:	89 54 24 04          	mov    %edx,0x4(%esp)
    11e1:	e8 3b ff ff ff       	call   1121 <getFileItem>
    11e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    11e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11ec:	8b 40 14             	mov    0x14(%eax),%eax
    11ef:	89 04 24             	mov    %eax,(%esp)
    11f2:	e8 8a ff ff ff       	call   1181 <enterDir>
	freeFileItemList();
    11f7:	e8 d5 ee ff ff       	call   d1 <freeFileItemList>
	list(".");
    11fc:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1203:	e8 a6 ef ff ff       	call   1ae <list>
	drawFinderContent(context);
    1208:	a1 c0 10 01 00       	mov    0x110c0,%eax
    120d:	89 04 24             	mov    %eax,(%esp)
    1210:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1215:	89 44 24 04          	mov    %eax,0x4(%esp)
    1219:	a1 c8 10 01 00       	mov    0x110c8,%eax
    121e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1222:	e8 61 f8 ff ff       	call   a88 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1227:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    122a:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1231:	00 
    1232:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1239:	00 
    123a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1241:	00 
    1242:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1249:	00 
    124a:	89 04 24             	mov    %eax,(%esp)
    124d:	e8 b5 20 00 00       	call   3307 <initRect>
    1252:	83 ec 04             	sub    $0x4,%esp
    1255:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1258:	89 44 24 04          	mov    %eax,0x4(%esp)
    125c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    125f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1263:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1266:	89 44 24 0c          	mov    %eax,0xc(%esp)
    126a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    126d:	89 44 24 10          	mov    %eax,0x10(%esp)
    1271:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1278:	e8 8d 22 00 00       	call   350a <deleteClickable>
	addWndEvent(&cm);
    127d:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1284:	e8 d2 fd ff ff       	call   105b <addWndEvent>
	addListEvent(&cm);
    1289:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1290:	e8 3e fd ff ff       	call   fd3 <addListEvent>
}
    1295:	c9                   	leave  
    1296:	c3                   	ret    

00001297 <newFile>:

void newFile(char *name) {
    1297:	55                   	push   %ebp
    1298:	89 e5                	mov    %esp,%ebp
    129a:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    129d:	8b 45 08             	mov    0x8(%ebp),%eax
    12a0:	89 04 24             	mov    %eax,(%esp)
    12a3:	e8 de 27 00 00       	call   3a86 <strlen>
    12a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    12ab:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    12b2:	eb 5c                	jmp    1310 <newFile+0x79>
	{
		n = strlen(name);
    12b4:	8b 45 08             	mov    0x8(%ebp),%eax
    12b7:	89 04 24             	mov    %eax,(%esp)
    12ba:	e8 c7 27 00 00       	call   3a86 <strlen>
    12bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    12c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12c5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    12c8:	75 09                	jne    12d3 <newFile+0x3c>
		{
			counter = 1;
    12ca:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    12d1:	eb 15                	jmp    12e8 <newFile+0x51>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    12d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12d6:	03 45 08             	add    0x8(%ebp),%eax
    12d9:	89 04 24             	mov    %eax,(%esp)
    12dc:	e8 de 28 00 00       	call   3bbf <atoi>
    12e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    12e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    12e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12eb:	89 04 24             	mov    %eax,(%esp)
    12ee:	e8 1c fa ff ff       	call   d0f <int2str>
    12f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    12f6:	03 55 08             	add    0x8(%ebp),%edx
    12f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    12fd:	89 14 24             	mov    %edx,(%esp)
    1300:	e8 0c 27 00 00       	call   3a11 <strcpy>
		close(fd);
    1305:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1308:	89 04 24             	mov    %eax,(%esp)
    130b:	e8 68 29 00 00       	call   3c78 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    1310:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1317:	00 
    1318:	8b 45 08             	mov    0x8(%ebp),%eax
    131b:	89 04 24             	mov    %eax,(%esp)
    131e:	e8 6d 29 00 00       	call   3c90 <open>
    1323:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1326:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    132a:	7f 88                	jg     12b4 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    132c:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1333:	00 
    1334:	8b 45 08             	mov    0x8(%ebp),%eax
    1337:	89 04 24             	mov    %eax,(%esp)
    133a:	e8 51 29 00 00       	call   3c90 <open>
    133f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1342:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1346:	79 20                	jns    1368 <newFile+0xd1>
		printf(0, "cat: cannot open %s\n", name);
    1348:	8b 45 08             	mov    0x8(%ebp),%eax
    134b:	89 44 24 08          	mov    %eax,0x8(%esp)
    134f:	c7 44 24 04 b7 89 00 	movl   $0x89b7,0x4(%esp)
    1356:	00 
    1357:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    135e:	e8 cc 2a 00 00       	call   3e2f <printf>
		exit();
    1363:	e8 e8 28 00 00       	call   3c50 <exit>
	}
	close(fd);
    1368:	8b 45 e8             	mov    -0x18(%ebp),%eax
    136b:	89 04 24             	mov    %eax,(%esp)
    136e:	e8 05 29 00 00       	call   3c78 <close>
}
    1373:	c9                   	leave  
    1374:	c3                   	ret    

00001375 <h_newFile>:

void h_newFile(Point p) {
    1375:	55                   	push   %ebp
    1376:	89 e5                	mov    %esp,%ebp
    1378:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    137b:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1382:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1389:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1390:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1397:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    139e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    13a5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    13ac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    13b3:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13b6:	89 04 24             	mov    %eax,(%esp)
    13b9:	e8 d9 fe ff ff       	call   1297 <newFile>
	freeFileItemList();
    13be:	e8 0e ed ff ff       	call   d1 <freeFileItemList>
	list(".");
    13c3:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    13ca:	e8 df ed ff ff       	call   1ae <list>
	drawFinderContent(context);
    13cf:	a1 c0 10 01 00       	mov    0x110c0,%eax
    13d4:	89 04 24             	mov    %eax,(%esp)
    13d7:	a1 c4 10 01 00       	mov    0x110c4,%eax
    13dc:	89 44 24 04          	mov    %eax,0x4(%esp)
    13e0:	a1 c8 10 01 00       	mov    0x110c8,%eax
    13e5:	89 44 24 08          	mov    %eax,0x8(%esp)
    13e9:	e8 9a f6 ff ff       	call   a88 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    13ee:	8d 45 e8             	lea    -0x18(%ebp),%eax
    13f1:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    13f8:	00 
    13f9:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1400:	00 
    1401:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1408:	00 
    1409:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1410:	00 
    1411:	89 04 24             	mov    %eax,(%esp)
    1414:	e8 ee 1e 00 00       	call   3307 <initRect>
    1419:	83 ec 04             	sub    $0x4,%esp
    141c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    141f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1423:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1426:	89 44 24 08          	mov    %eax,0x8(%esp)
    142a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    142d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1431:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1434:	89 44 24 10          	mov    %eax,0x10(%esp)
    1438:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    143f:	e8 c6 20 00 00       	call   350a <deleteClickable>
	addWndEvent(&cm);
    1444:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    144b:	e8 0b fc ff ff       	call   105b <addWndEvent>
	addListEvent(&cm);
    1450:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1457:	e8 77 fb ff ff       	call   fd3 <addListEvent>
}
    145c:	c9                   	leave  
    145d:	c3                   	ret    

0000145e <newFolder>:

void newFolder(char *name) {
    145e:	55                   	push   %ebp
    145f:	89 e5                	mov    %esp,%ebp
    1461:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1464:	8b 45 08             	mov    0x8(%ebp),%eax
    1467:	89 04 24             	mov    %eax,(%esp)
    146a:	e8 17 26 00 00       	call   3a86 <strlen>
    146f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    1472:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    1479:	eb 51                	jmp    14cc <newFolder+0x6e>
		n = strlen(name);
    147b:	8b 45 08             	mov    0x8(%ebp),%eax
    147e:	89 04 24             	mov    %eax,(%esp)
    1481:	e8 00 26 00 00       	call   3a86 <strlen>
    1486:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1489:	8b 45 f0             	mov    -0x10(%ebp),%eax
    148c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    148f:	75 09                	jne    149a <newFolder+0x3c>
		{
			counter = 1;
    1491:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1498:	eb 15                	jmp    14af <newFolder+0x51>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    149a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    149d:	03 45 08             	add    0x8(%ebp),%eax
    14a0:	89 04 24             	mov    %eax,(%esp)
    14a3:	e8 17 27 00 00       	call   3bbf <atoi>
    14a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    14ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    14af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14b2:	89 04 24             	mov    %eax,(%esp)
    14b5:	e8 55 f8 ff ff       	call   d0f <int2str>
    14ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    14bd:	03 55 08             	add    0x8(%ebp),%edx
    14c0:	89 44 24 04          	mov    %eax,0x4(%esp)
    14c4:	89 14 24             	mov    %edx,(%esp)
    14c7:	e8 45 25 00 00       	call   3a11 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    14cc:	8b 45 08             	mov    0x8(%ebp),%eax
    14cf:	89 04 24             	mov    %eax,(%esp)
    14d2:	e8 e1 27 00 00       	call   3cb8 <mkdir>
    14d7:	85 c0                	test   %eax,%eax
    14d9:	78 a0                	js     147b <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    14db:	c9                   	leave  
    14dc:	c3                   	ret    

000014dd <h_newFolder>:

void h_newFolder(Point p) {
    14dd:	55                   	push   %ebp
    14de:	89 e5                	mov    %esp,%ebp
    14e0:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    14e3:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    14ea:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    14f1:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    14f8:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    14ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1506:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    150d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1514:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    151b:	8d 45 c8             	lea    -0x38(%ebp),%eax
    151e:	89 04 24             	mov    %eax,(%esp)
    1521:	e8 38 ff ff ff       	call   145e <newFolder>
	freeFileItemList();
    1526:	e8 a6 eb ff ff       	call   d1 <freeFileItemList>
	printf(0, "new folder!\n");
    152b:	c7 44 24 04 cc 89 00 	movl   $0x89cc,0x4(%esp)
    1532:	00 
    1533:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    153a:	e8 f0 28 00 00       	call   3e2f <printf>
	list(".");
    153f:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1546:	e8 63 ec ff ff       	call   1ae <list>
	printItemList();
    154b:	e8 96 f8 ff ff       	call   de6 <printItemList>
	drawFinderContent(context);
    1550:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1555:	89 04 24             	mov    %eax,(%esp)
    1558:	a1 c4 10 01 00       	mov    0x110c4,%eax
    155d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1561:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1566:	89 44 24 08          	mov    %eax,0x8(%esp)
    156a:	e8 19 f5 ff ff       	call   a88 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    156f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1572:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1579:	00 
    157a:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1581:	00 
    1582:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1589:	00 
    158a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1591:	00 
    1592:	89 04 24             	mov    %eax,(%esp)
    1595:	e8 6d 1d 00 00       	call   3307 <initRect>
    159a:	83 ec 04             	sub    $0x4,%esp
    159d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15a0:	89 44 24 04          	mov    %eax,0x4(%esp)
    15a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15a7:	89 44 24 08          	mov    %eax,0x8(%esp)
    15ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15ae:	89 44 24 0c          	mov    %eax,0xc(%esp)
    15b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b5:	89 44 24 10          	mov    %eax,0x10(%esp)
    15b9:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    15c0:	e8 45 1f 00 00       	call   350a <deleteClickable>
	addWndEvent(&cm);
    15c5:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    15cc:	e8 8a fa ff ff       	call   105b <addWndEvent>
	addListEvent(&cm);
    15d1:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    15d8:	e8 f6 f9 ff ff       	call   fd3 <addListEvent>
}
    15dd:	c9                   	leave  
    15de:	c3                   	ret    

000015df <deleteFile>:

void deleteFile(char *name)
{
    15df:	55                   	push   %ebp
    15e0:	89 e5                	mov    %esp,%ebp
    15e2:	83 ec 18             	sub    $0x18,%esp
	if(unlink(name) < 0){
    15e5:	8b 45 08             	mov    0x8(%ebp),%eax
    15e8:	89 04 24             	mov    %eax,(%esp)
    15eb:	e8 b0 26 00 00       	call   3ca0 <unlink>
    15f0:	85 c0                	test   %eax,%eax
    15f2:	79 1b                	jns    160f <deleteFile+0x30>
		 printf(2, "rm: %s failed to delete\n", name);
    15f4:	8b 45 08             	mov    0x8(%ebp),%eax
    15f7:	89 44 24 08          	mov    %eax,0x8(%esp)
    15fb:	c7 44 24 04 d9 89 00 	movl   $0x89d9,0x4(%esp)
    1602:	00 
    1603:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    160a:	e8 20 28 00 00       	call   3e2f <printf>
	}
}
    160f:	c9                   	leave  
    1610:	c3                   	ret    

00001611 <h_deleteFile>:
void h_deleteFile(Point p) {
    1611:	55                   	push   %ebp
    1612:	89 e5                	mov    %esp,%ebp
    1614:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1617:	a1 40 d6 00 00       	mov    0xd640,%eax
    161c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (q != 0)
    161f:	eb 21                	jmp    1642 <h_deleteFile+0x31>
	{
		if (q->chosen)
    1621:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1624:	8b 40 28             	mov    0x28(%eax),%eax
    1627:	85 c0                	test   %eax,%eax
    1629:	74 0e                	je     1639 <h_deleteFile+0x28>
		{
			deleteFile(q->name);
    162b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    162e:	8b 40 14             	mov    0x14(%eax),%eax
    1631:	89 04 24             	mov    %eax,(%esp)
    1634:	e8 a6 ff ff ff       	call   15df <deleteFile>
		}
		q = q->next;
    1639:	8b 45 f4             	mov    -0xc(%ebp),%eax
    163c:	8b 40 2c             	mov    0x2c(%eax),%eax
    163f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		 printf(2, "rm: %s failed to delete\n", name);
	}
}
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	while (q != 0)
    1642:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1646:	75 d9                	jne    1621 <h_deleteFile+0x10>
		{
			deleteFile(q->name);
		}
		q = q->next;
	}
	freeFileItemList();
    1648:	e8 84 ea ff ff       	call   d1 <freeFileItemList>
	list(".");
    164d:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1654:	e8 55 eb ff ff       	call   1ae <list>
	drawFinderContent(context);
    1659:	a1 c0 10 01 00       	mov    0x110c0,%eax
    165e:	89 04 24             	mov    %eax,(%esp)
    1661:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1666:	89 44 24 04          	mov    %eax,0x4(%esp)
    166a:	a1 c8 10 01 00       	mov    0x110c8,%eax
    166f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1673:	e8 10 f4 ff ff       	call   a88 <drawFinderContent>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1678:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    167b:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1682:	00 
    1683:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    168a:	00 
    168b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1692:	00 
    1693:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    169a:	00 
    169b:	89 04 24             	mov    %eax,(%esp)
    169e:	e8 64 1c 00 00       	call   3307 <initRect>
    16a3:	83 ec 04             	sub    $0x4,%esp
    16a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    16ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16b0:	89 44 24 08          	mov    %eax,0x8(%esp)
    16b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16be:	89 44 24 10          	mov    %eax,0x10(%esp)
    16c2:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    16c9:	e8 3c 1e 00 00       	call   350a <deleteClickable>
		addWndEvent(&cm);
    16ce:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    16d5:	e8 81 f9 ff ff       	call   105b <addWndEvent>
		addListEvent(&cm);
    16da:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    16e1:	e8 ed f8 ff ff       	call   fd3 <addListEvent>
}
    16e6:	c9                   	leave  
    16e7:	c3                   	ret    

000016e8 <h_chooseFile>:

void h_chooseFile(Point p) {
    16e8:	55                   	push   %ebp
    16e9:	89 e5                	mov    %esp,%ebp
    16eb:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    16ee:	8b 45 08             	mov    0x8(%ebp),%eax
    16f1:	8b 55 0c             	mov    0xc(%ebp),%edx
    16f4:	89 04 24             	mov    %eax,(%esp)
    16f7:	89 54 24 04          	mov    %edx,0x4(%esp)
    16fb:	e8 21 fa ff ff       	call   1121 <getFileItem>
    1700:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1703:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1706:	8b 40 28             	mov    0x28(%eax),%eax
    1709:	85 c0                	test   %eax,%eax
    170b:	74 20                	je     172d <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    170d:	c7 44 24 04 f2 89 00 	movl   $0x89f2,0x4(%esp)
    1714:	00 
    1715:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    171c:	e8 0e 27 00 00       	call   3e2f <printf>
		temp->chosen = 0;
    1721:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1724:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    172b:	eb 1e                	jmp    174b <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    172d:	c7 44 24 04 ff 89 00 	movl   $0x89ff,0x4(%esp)
    1734:	00 
    1735:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    173c:	e8 ee 26 00 00       	call   3e2f <printf>
		temp->chosen = 1;
    1741:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1744:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    174b:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1750:	89 04 24             	mov    %eax,(%esp)
    1753:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1758:	89 44 24 04          	mov    %eax,0x4(%esp)
    175c:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1761:	89 44 24 08          	mov    %eax,0x8(%esp)
    1765:	e8 1e f3 ff ff       	call   a88 <drawFinderContent>
}
    176a:	c9                   	leave  
    176b:	c3                   	ret    

0000176c <h_closeWnd>:

void h_closeWnd(Point p) {
    176c:	55                   	push   %ebp
    176d:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    176f:	c7 05 a0 a2 00 00 00 	movl   $0x0,0xa2a0
    1776:	00 00 00 
}
    1779:	5d                   	pop    %ebp
    177a:	c3                   	ret    

0000177b <h_chvm1>:

void h_chvm1(Point p) {
    177b:	55                   	push   %ebp
    177c:	89 e5                	mov    %esp,%ebp
    177e:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    1781:	c7 05 a4 a2 00 00 01 	movl   $0x1,0xa2a4
    1788:	00 00 00 
	freeFileItemList();
    178b:	e8 41 e9 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1790:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1797:	e8 12 ea ff ff       	call   1ae <list>
		drawFinderContent(context);
    179c:	a1 c0 10 01 00       	mov    0x110c0,%eax
    17a1:	89 04 24             	mov    %eax,(%esp)
    17a4:	a1 c4 10 01 00       	mov    0x110c4,%eax
    17a9:	89 44 24 04          	mov    %eax,0x4(%esp)
    17ad:	a1 c8 10 01 00       	mov    0x110c8,%eax
    17b2:	89 44 24 08          	mov    %eax,0x8(%esp)
    17b6:	e8 cd f2 ff ff       	call   a88 <drawFinderContent>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    17bb:	8d 45 e8             	lea    -0x18(%ebp),%eax
    17be:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    17c5:	00 
    17c6:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    17cd:	00 
    17ce:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    17d5:	00 
    17d6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17dd:	00 
    17de:	89 04 24             	mov    %eax,(%esp)
    17e1:	e8 21 1b 00 00       	call   3307 <initRect>
    17e6:	83 ec 04             	sub    $0x4,%esp
    17e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    17ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    17f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    17f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    17f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    17fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    17fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1801:	89 44 24 10          	mov    %eax,0x10(%esp)
    1805:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    180c:	e8 f9 1c 00 00       	call   350a <deleteClickable>
			addWndEvent(&cm);
    1811:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1818:	e8 3e f8 ff ff       	call   105b <addWndEvent>
			addListEvent(&cm);
    181d:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1824:	e8 aa f7 ff ff       	call   fd3 <addListEvent>
}
    1829:	c9                   	leave  
    182a:	c3                   	ret    

0000182b <h_chvm2>:

void h_chvm2(Point p) {
    182b:	55                   	push   %ebp
    182c:	89 e5                	mov    %esp,%ebp
    182e:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    1831:	c7 05 a4 a2 00 00 02 	movl   $0x2,0xa2a4
    1838:	00 00 00 
	freeFileItemList();
    183b:	e8 91 e8 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1840:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1847:	e8 62 e9 ff ff       	call   1ae <list>
		drawFinderContent(context);
    184c:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1851:	89 04 24             	mov    %eax,(%esp)
    1854:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1859:	89 44 24 04          	mov    %eax,0x4(%esp)
    185d:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1862:	89 44 24 08          	mov    %eax,0x8(%esp)
    1866:	e8 1d f2 ff ff       	call   a88 <drawFinderContent>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    186b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    186e:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1875:	00 
    1876:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    187d:	00 
    187e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1885:	00 
    1886:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    188d:	00 
    188e:	89 04 24             	mov    %eax,(%esp)
    1891:	e8 71 1a 00 00       	call   3307 <initRect>
    1896:	83 ec 04             	sub    $0x4,%esp
    1899:	8b 45 e8             	mov    -0x18(%ebp),%eax
    189c:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    18a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18aa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    18ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18b1:	89 44 24 10          	mov    %eax,0x10(%esp)
    18b5:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    18bc:	e8 49 1c 00 00       	call   350a <deleteClickable>
			addWndEvent(&cm);
    18c1:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    18c8:	e8 8e f7 ff ff       	call   105b <addWndEvent>
			addListEvent(&cm);
    18cd:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    18d4:	e8 fa f6 ff ff       	call   fd3 <addListEvent>
}
    18d9:	c9                   	leave  
    18da:	c3                   	ret    

000018db <h_goUp>:

void h_goUp(Point p) {
    18db:	55                   	push   %ebp
    18dc:	89 e5                	mov    %esp,%ebp
    18de:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    18e1:	c7 04 24 0e 8a 00 00 	movl   $0x8a0e,(%esp)
    18e8:	e8 94 f8 ff ff       	call   1181 <enterDir>
	freeFileItemList();
    18ed:	e8 df e7 ff ff       	call   d1 <freeFileItemList>
	list(".");
    18f2:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    18f9:	e8 b0 e8 ff ff       	call   1ae <list>
	drawFinderContent(context);
    18fe:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1903:	89 04 24             	mov    %eax,(%esp)
    1906:	a1 c4 10 01 00       	mov    0x110c4,%eax
    190b:	89 44 24 04          	mov    %eax,0x4(%esp)
    190f:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1914:	89 44 24 08          	mov    %eax,0x8(%esp)
    1918:	e8 6b f1 ff ff       	call   a88 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    191d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1920:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1927:	00 
    1928:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    192f:	00 
    1930:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1937:	00 
    1938:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    193f:	00 
    1940:	89 04 24             	mov    %eax,(%esp)
    1943:	e8 bf 19 00 00       	call   3307 <initRect>
    1948:	83 ec 04             	sub    $0x4,%esp
    194b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    194e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1952:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1955:	89 44 24 08          	mov    %eax,0x8(%esp)
    1959:	8b 45 f0             	mov    -0x10(%ebp),%eax
    195c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1960:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1963:	89 44 24 10          	mov    %eax,0x10(%esp)
    1967:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    196e:	e8 97 1b 00 00       	call   350a <deleteClickable>
	addWndEvent(&cm);
    1973:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    197a:	e8 dc f6 ff ff       	call   105b <addWndEvent>
	addListEvent(&cm);
    197f:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1986:	e8 48 f6 ff ff       	call   fd3 <addListEvent>
}
    198b:	c9                   	leave  
    198c:	c3                   	ret    

0000198d <h_empty>:

void h_empty(Point p) {
    198d:	55                   	push   %ebp
    198e:	89 e5                	mov    %esp,%ebp

}
    1990:	5d                   	pop    %ebp
    1991:	c3                   	ret    

00001992 <main>:

int main(int argc, char *argv[]) {
    1992:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1996:	83 e4 f0             	and    $0xfffffff0,%esp
    1999:	ff 71 fc             	pushl  -0x4(%ecx)
    199c:	55                   	push   %ebp
    199d:	89 e5                	mov    %esp,%ebp
    199f:	56                   	push   %esi
    19a0:	53                   	push   %ebx
    19a1:	51                   	push   %ecx
    19a2:	81 ec 9c 00 00 00    	sub    $0x9c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    19a8:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    19af:	00 
    19b0:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    19b7:	00 
    19b8:	c7 04 24 c0 10 01 00 	movl   $0x110c0,(%esp)
    19bf:	e8 18 04 00 00       	call   1ddc <init_context>
    19c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    19c7:	8d 45 88             	lea    -0x78(%ebp),%eax
    19ca:	8b 15 c0 10 01 00    	mov    0x110c0,%edx
    19d0:	89 54 24 04          	mov    %edx,0x4(%esp)
    19d4:	8b 15 c4 10 01 00    	mov    0x110c4,%edx
    19da:	89 54 24 08          	mov    %edx,0x8(%esp)
    19de:	8b 15 c8 10 01 00    	mov    0x110c8,%edx
    19e4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    19e8:	89 04 24             	mov    %eax,(%esp)
    19eb:	e8 b5 19 00 00       	call   33a5 <initClickManager>
    19f0:	83 ec 04             	sub    $0x4,%esp
    19f3:	8b 45 88             	mov    -0x78(%ebp),%eax
    19f6:	a3 cc 10 01 00       	mov    %eax,0x110cc
    19fb:	8b 45 8c             	mov    -0x74(%ebp),%eax
    19fe:	a3 d0 10 01 00       	mov    %eax,0x110d0
    1a03:	8b 45 90             	mov    -0x70(%ebp),%eax
    1a06:	a3 d4 10 01 00       	mov    %eax,0x110d4
    1a0b:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1a0e:	a3 d8 10 01 00       	mov    %eax,0x110d8
    1a13:	8b 45 98             	mov    -0x68(%ebp),%eax
    1a16:	a3 dc 10 01 00       	mov    %eax,0x110dc
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1a1b:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    1a22:	00 
    1a23:	c7 04 24 a0 a3 00 00 	movl   $0xa3a0,(%esp)
    1a2a:	e8 dc 0f 00 00       	call   2a0b <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1a2f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    1a36:	00 
    1a37:	c7 04 24 c0 a2 00 00 	movl   $0xa2c0,(%esp)
    1a3e:	e8 c8 0f 00 00       	call   2a0b <load_iconlist>
	//testHandlers();
	mkdir("userfolder");
    1a43:	c7 04 24 11 8a 00 00 	movl   $0x8a11,(%esp)
    1a4a:	e8 69 22 00 00       	call   3cb8 <mkdir>
	enterDir("userfolder");
    1a4f:	c7 04 24 11 8a 00 00 	movl   $0x8a11,(%esp)
    1a56:	e8 26 f7 ff ff       	call   1181 <enterDir>
	freeFileItemList();
    1a5b:	e8 71 e6 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1a60:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1a67:	e8 42 e7 ff ff       	call   1ae <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1a6c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    1a6f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1a76:	00 
    1a77:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1a7e:	00 
    1a7f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a86:	00 
    1a87:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a8e:	00 
    1a8f:	89 04 24             	mov    %eax,(%esp)
    1a92:	e8 70 18 00 00       	call   3307 <initRect>
    1a97:	83 ec 04             	sub    $0x4,%esp
    1a9a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1a9d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1aa4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1aa8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1aab:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1aaf:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ab2:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ab6:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1abd:	e8 48 1a 00 00       	call   350a <deleteClickable>
	addWndEvent(&cm);
    1ac2:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1ac9:	e8 8d f5 ff ff       	call   105b <addWndEvent>
	addListEvent(&cm);
    1ace:	c7 04 24 cc 10 01 00 	movl   $0x110cc,(%esp)
    1ad5:	e8 f9 f4 ff ff       	call   fd3 <addListEvent>
	while (isRun) {
    1ada:	e9 cb 01 00 00       	jmp    1caa <main+0x318>
		getMsg(&msg);
    1adf:	8d 45 bc             	lea    -0x44(%ebp),%eax
    1ae2:	89 04 24             	mov    %eax,(%esp)
    1ae5:	e8 06 22 00 00       	call   3cf0 <getMsg>
		switch (msg.msg_type) {
    1aea:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1aed:	83 f8 08             	cmp    $0x8,%eax
    1af0:	0f 87 aa 01 00 00    	ja     1ca0 <main+0x30e>
    1af6:	8b 04 85 1c 8a 00 00 	mov    0x8a1c(,%eax,4),%eax
    1afd:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1aff:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1b02:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1b05:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1b08:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1b0c:	89 54 24 04          	mov    %edx,0x4(%esp)
    1b10:	89 04 24             	mov    %eax,(%esp)
    1b13:	e8 c8 17 00 00       	call   32e0 <initPoint>
    1b18:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1b1b:	8b 0d d0 10 01 00    	mov    0x110d0,%ecx
    1b21:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1b24:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1b27:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b2b:	89 54 24 08          	mov    %edx,0x8(%esp)
    1b2f:	89 0c 24             	mov    %ecx,(%esp)
    1b32:	e8 b3 1a 00 00       	call   35ea <executeHandler>
    1b37:	85 c0                	test   %eax,%eax
    1b39:	0f 84 64 01 00 00    	je     1ca3 <main+0x311>
				updateWindow(winid, context.addr);
    1b3f:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1b44:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b4b:	89 04 24             	mov    %eax,(%esp)
    1b4e:	e8 b5 21 00 00       	call   3d08 <updateWindow>
			}
			break;
    1b53:	e9 4b 01 00 00       	jmp    1ca3 <main+0x311>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderWnd(context);
    1b58:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1b5d:	89 04 24             	mov    %eax,(%esp)
    1b60:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1b65:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b69:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1b6e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b72:	e8 0f ed ff ff       	call   886 <drawFinderWnd>
			drawFinderContent(context);
    1b77:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1b7c:	89 04 24             	mov    %eax,(%esp)
    1b7f:	a1 c4 10 01 00       	mov    0x110c4,%eax
    1b84:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b88:	a1 c8 10 01 00       	mov    0x110c8,%eax
    1b8d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b91:	e8 f2 ee ff ff       	call   a88 <drawFinderContent>
			updateWindow(winid, context.addr);
    1b96:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ba2:	89 04 24             	mov    %eax,(%esp)
    1ba5:	e8 5e 21 00 00       	call   3d08 <updateWindow>
			break;
    1baa:	e9 fb 00 00 00       	jmp    1caa <main+0x318>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    1baf:	8b 75 cc             	mov    -0x34(%ebp),%esi
    1bb2:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    1bb5:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1bb8:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1bbb:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1bc0:	89 74 24 14          	mov    %esi,0x14(%esp)
    1bc4:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    1bc8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1bcc:	89 54 24 08          	mov    %edx,0x8(%esp)
    1bd0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bd7:	89 04 24             	mov    %eax,(%esp)
    1bda:	e8 31 21 00 00       	call   3d10 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    1bdf:	e9 c6 00 00 00       	jmp    1caa <main+0x318>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1be4:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1be7:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1bea:	8d 45 80             	lea    -0x80(%ebp),%eax
    1bed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1bf1:	89 54 24 04          	mov    %edx,0x4(%esp)
    1bf5:	89 04 24             	mov    %eax,(%esp)
    1bf8:	e8 e3 16 00 00       	call   32e0 <initPoint>
    1bfd:	83 ec 04             	sub    $0x4,%esp
    1c00:	8b 45 80             	mov    -0x80(%ebp),%eax
    1c03:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1c06:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1c09:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    1c0c:	8b 0d cc 10 01 00    	mov    0x110cc,%ecx
    1c12:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1c15:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1c18:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c1c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c20:	89 0c 24             	mov    %ecx,(%esp)
    1c23:	e8 c2 19 00 00       	call   35ea <executeHandler>
    1c28:	85 c0                	test   %eax,%eax
    1c2a:	74 7a                	je     1ca6 <main+0x314>

				updateWindow(winid, context.addr);
    1c2c:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1c31:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c38:	89 04 24             	mov    %eax,(%esp)
    1c3b:	e8 c8 20 00 00       	call   3d08 <updateWindow>
			}
			break;
    1c40:	eb 64                	jmp    1ca6 <main+0x314>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1c42:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1c45:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1c48:	8d 45 80             	lea    -0x80(%ebp),%eax
    1c4b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1c4f:	89 54 24 04          	mov    %edx,0x4(%esp)
    1c53:	89 04 24             	mov    %eax,(%esp)
    1c56:	e8 85 16 00 00       	call   32e0 <initPoint>
    1c5b:	83 ec 04             	sub    $0x4,%esp
    1c5e:	8b 45 80             	mov    -0x80(%ebp),%eax
    1c61:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1c64:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1c67:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    1c6a:	8b 0d d4 10 01 00    	mov    0x110d4,%ecx
    1c70:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1c73:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1c76:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c7a:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c7e:	89 0c 24             	mov    %ecx,(%esp)
    1c81:	e8 64 19 00 00       	call   35ea <executeHandler>
    1c86:	85 c0                	test   %eax,%eax
    1c88:	74 1f                	je     1ca9 <main+0x317>
				updateWindow(winid, context.addr);
    1c8a:	a1 c0 10 01 00       	mov    0x110c0,%eax
    1c8f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c96:	89 04 24             	mov    %eax,(%esp)
    1c99:	e8 6a 20 00 00       	call   3d08 <updateWindow>
			}
			break;
    1c9e:	eb 09                	jmp    1ca9 <main+0x317>
		default:
			break;
    1ca0:	90                   	nop
    1ca1:	eb 07                	jmp    1caa <main+0x318>
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
    1ca3:	90                   	nop
    1ca4:	eb 04                	jmp    1caa <main+0x318>
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {

				updateWindow(winid, context.addr);
			}
			break;
    1ca6:	90                   	nop
    1ca7:	eb 01                	jmp    1caa <main+0x318>
			p = initPoint(msg.concrete_msg.msg_mouse.x,
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
				updateWindow(winid, context.addr);
			}
			break;
    1ca9:	90                   	nop
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    1caa:	a1 a0 a2 00 00       	mov    0xa2a0,%eax
    1caf:	85 c0                	test   %eax,%eax
    1cb1:	0f 85 28 fe ff ff    	jne    1adf <main+0x14d>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    1cb7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1cba:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cbe:	c7 04 24 c0 10 01 00 	movl   $0x110c0,(%esp)
    1cc5:	e8 95 01 00 00       	call   1e5f <free_context>
	exit();
    1cca:	e8 81 1f 00 00       	call   3c50 <exit>

00001ccf <testHandlers>:
}

void testHandlers() {
    1ccf:	55                   	push   %ebp
    1cd0:	89 e5                	mov    %esp,%ebp
    1cd2:	83 ec 18             	sub    $0x18,%esp

	list(".");
    1cd5:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1cdc:	e8 cd e4 ff ff       	call   1ae <list>
	printf(0, "original list:\n");
    1ce1:	c7 44 24 04 40 8a 00 	movl   $0x8a40,0x4(%esp)
    1ce8:	00 
    1ce9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1cf0:	e8 3a 21 00 00       	call   3e2f <printf>
	printItemList();
    1cf5:	e8 ec f0 ff ff       	call   de6 <printItemList>
	printf(0, "\n");
    1cfa:	c7 44 24 04 50 8a 00 	movl   $0x8a50,0x4(%esp)
    1d01:	00 
    1d02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d09:	e8 21 21 00 00       	call   3e2f <printf>
	printf(0, "new a folder:\n");
    1d0e:	c7 44 24 04 52 8a 00 	movl   $0x8a52,0x4(%esp)
    1d15:	00 
    1d16:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d1d:	e8 0d 21 00 00       	call   3e2f <printf>
	newFolder("newfolder");
    1d22:	c7 04 24 61 8a 00 00 	movl   $0x8a61,(%esp)
    1d29:	e8 30 f7 ff ff       	call   145e <newFolder>
	freeFileItemList();
    1d2e:	e8 9e e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1d33:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1d3a:	e8 6f e4 ff ff       	call   1ae <list>
	printItemList();
    1d3f:	e8 a2 f0 ff ff       	call   de6 <printItemList>
	printf(0, "\n");
    1d44:	c7 44 24 04 50 8a 00 	movl   $0x8a50,0x4(%esp)
    1d4b:	00 
    1d4c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d53:	e8 d7 20 00 00       	call   3e2f <printf>
	printf(0, "enter new folder:\n");
    1d58:	c7 44 24 04 6b 8a 00 	movl   $0x8a6b,0x4(%esp)
    1d5f:	00 
    1d60:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d67:	e8 c3 20 00 00       	call   3e2f <printf>
	enterDir("newfolder");
    1d6c:	c7 04 24 61 8a 00 00 	movl   $0x8a61,(%esp)
    1d73:	e8 09 f4 ff ff       	call   1181 <enterDir>
	freeFileItemList();
    1d78:	e8 54 e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1d7d:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1d84:	e8 25 e4 ff ff       	call   1ae <list>
	printItemList();
    1d89:	e8 58 f0 ff ff       	call   de6 <printItemList>
	printf(0, "\n");
    1d8e:	c7 44 24 04 50 8a 00 	movl   $0x8a50,0x4(%esp)
    1d95:	00 
    1d96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d9d:	e8 8d 20 00 00       	call   3e2f <printf>
	printf(0, "new a file:\n");
    1da2:	c7 44 24 04 7e 8a 00 	movl   $0x8a7e,0x4(%esp)
    1da9:	00 
    1daa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1db1:	e8 79 20 00 00       	call   3e2f <printf>
	newFile("newfile.txt");
    1db6:	c7 04 24 8b 8a 00 00 	movl   $0x8a8b,(%esp)
    1dbd:	e8 d5 f4 ff ff       	call   1297 <newFile>
	freeFileItemList();
    1dc2:	e8 0a e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1dc7:	c7 04 24 b5 89 00 00 	movl   $0x89b5,(%esp)
    1dce:	e8 db e3 ff ff       	call   1ae <list>
	printItemList();
    1dd3:	e8 0e f0 ff ff       	call   de6 <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    1dd8:	c9                   	leave  
    1dd9:	c3                   	ret    
    1dda:	90                   	nop
    1ddb:	90                   	nop

00001ddc <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    1ddc:	55                   	push   %ebp
    1ddd:	89 e5                	mov    %esp,%ebp
    1ddf:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    1de2:	8b 45 08             	mov    0x8(%ebp),%eax
    1de5:	8b 55 0c             	mov    0xc(%ebp),%edx
    1de8:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    1deb:	8b 45 08             	mov    0x8(%ebp),%eax
    1dee:	8b 55 10             	mov    0x10(%ebp),%edx
    1df1:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    1df4:	8b 55 0c             	mov    0xc(%ebp),%edx
    1df7:	8b 45 10             	mov    0x10(%ebp),%eax
    1dfa:	0f af c2             	imul   %edx,%eax
    1dfd:	01 c0                	add    %eax,%eax
    1dff:	89 04 24             	mov    %eax,(%esp)
    1e02:	e8 0c 23 00 00       	call   4113 <malloc>
    1e07:	8b 55 08             	mov    0x8(%ebp),%edx
    1e0a:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    1e0c:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e0f:	8b 45 10             	mov    0x10(%ebp),%eax
    1e12:	0f af c2             	imul   %edx,%eax
    1e15:	8d 14 00             	lea    (%eax,%eax,1),%edx
    1e18:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1b:	8b 00                	mov    (%eax),%eax
    1e1d:	89 54 24 08          	mov    %edx,0x8(%esp)
    1e21:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e28:	00 
    1e29:	89 04 24             	mov    %eax,(%esp)
    1e2c:	e8 7a 1c 00 00       	call   3aab <memset>
    initializeASCII();
    1e31:	e8 9b 01 00 00       	call   1fd1 <initializeASCII>
    initializeGBK();
    1e36:	e8 23 03 00 00       	call   215e <initializeGBK>
    return createWindow(0, 0, width, height);
    1e3b:	8b 45 10             	mov    0x10(%ebp),%eax
    1e3e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1e42:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e45:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e49:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e50:	00 
    1e51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e58:	e8 9b 1e 00 00       	call   3cf8 <createWindow>
}
    1e5d:	c9                   	leave  
    1e5e:	c3                   	ret    

00001e5f <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    1e5f:	55                   	push   %ebp
    1e60:	89 e5                	mov    %esp,%ebp
    1e62:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    1e65:	8b 45 08             	mov    0x8(%ebp),%eax
    1e68:	8b 00                	mov    (%eax),%eax
    1e6a:	89 04 24             	mov    %eax,(%esp)
    1e6d:	e8 72 21 00 00       	call   3fe4 <free>
    freeASCII();
    1e72:	e8 d2 02 00 00       	call   2149 <freeASCII>
    freeGBK();
    1e77:	e8 8a 03 00 00       	call   2206 <freeGBK>
    destroyWindow(winid);
    1e7c:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e7f:	89 04 24             	mov    %eax,(%esp)
    1e82:	e8 79 1e 00 00       	call   3d00 <destroyWindow>
}
    1e87:	c9                   	leave  
    1e88:	c3                   	ret    
    1e89:	90                   	nop
    1e8a:	90                   	nop
    1e8b:	90                   	nop

00001e8c <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    1e8c:	55                   	push   %ebp
    1e8d:	89 e5                	mov    %esp,%ebp
    1e8f:	83 ec 04             	sub    $0x4,%esp
    1e92:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1e95:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    1e99:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e9c:	3b 45 14             	cmp    0x14(%ebp),%eax
    1e9f:	76 22                	jbe    1ec3 <draw_point+0x37>
    return;
  if(y >= c.height)
    1ea1:	8b 45 10             	mov    0x10(%ebp),%eax
    1ea4:	3b 45 18             	cmp    0x18(%ebp),%eax
    1ea7:	76 1d                	jbe    1ec6 <draw_point+0x3a>
    return;
  c.addr[y*c.width+x] = color;
    1ea9:	8b 55 08             	mov    0x8(%ebp),%edx
    1eac:	8b 45 0c             	mov    0xc(%ebp),%eax
    1eaf:	0f af 45 18          	imul   0x18(%ebp),%eax
    1eb3:	03 45 14             	add    0x14(%ebp),%eax
    1eb6:	01 c0                	add    %eax,%eax
    1eb8:	01 c2                	add    %eax,%edx
    1eba:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    1ebe:	66 89 02             	mov    %ax,(%edx)
    1ec1:	eb 04                	jmp    1ec7 <draw_point+0x3b>

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
  if(x >= c.width) 
    return;
    1ec3:	90                   	nop
    1ec4:	eb 01                	jmp    1ec7 <draw_point+0x3b>
  if(y >= c.height)
    return;
    1ec6:	90                   	nop
  c.addr[y*c.width+x] = color;
}
    1ec7:	c9                   	leave  
    1ec8:	c3                   	ret    

00001ec9 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    1ec9:	55                   	push   %ebp
    1eca:	89 e5                	mov    %esp,%ebp
    1ecc:	83 ec 2c             	sub    $0x2c,%esp
    1ecf:	8b 45 24             	mov    0x24(%ebp),%eax
    1ed2:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    1ed6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1ed9:	8b 55 14             	mov    0x14(%ebp),%edx
    1edc:	01 c2                	add    %eax,%edx
    1ede:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ee1:	39 c2                	cmp    %eax,%edx
    1ee3:	0f 46 c2             	cmovbe %edx,%eax
    1ee6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    1ee9:	8b 45 20             	mov    0x20(%ebp),%eax
    1eec:	8b 55 18             	mov    0x18(%ebp),%edx
    1eef:	01 c2                	add    %eax,%edx
    1ef1:	8b 45 10             	mov    0x10(%ebp),%eax
    1ef4:	39 c2                	cmp    %eax,%edx
    1ef6:	0f 46 c2             	cmovbe %edx,%eax
    1ef9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    1efc:	8b 45 18             	mov    0x18(%ebp),%eax
    1eff:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1f02:	eb 47                	jmp    1f4b <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    1f04:	8b 45 14             	mov    0x14(%ebp),%eax
    1f07:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1f0a:	eb 33                	jmp    1f3f <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    1f0c:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    1f10:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1f13:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f16:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1f1a:	89 54 24 10          	mov    %edx,0x10(%esp)
    1f1e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f22:	8b 45 08             	mov    0x8(%ebp),%eax
    1f25:	89 04 24             	mov    %eax,(%esp)
    1f28:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f2b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f2f:	8b 45 10             	mov    0x10(%ebp),%eax
    1f32:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f36:	e8 51 ff ff ff       	call   1e8c <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    1f3b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1f3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f42:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1f45:	7c c5                	jl     1f0c <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    1f47:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1f4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1f4e:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1f51:	7c b1                	jl     1f04 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    1f53:	c9                   	leave  
    1f54:	c3                   	ret    

00001f55 <printBinary>:

void printBinary(char c)
{
    1f55:	55                   	push   %ebp
    1f56:	89 e5                	mov    %esp,%ebp
    1f58:	53                   	push   %ebx
    1f59:	83 ec 34             	sub    $0x34,%esp
    1f5c:	8b 45 08             	mov    0x8(%ebp),%eax
    1f5f:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    1f62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f69:	eb 46                	jmp    1fb1 <printBinary+0x5c>
	{
		if(((c << i) & 0x80) != 0)
    1f6b:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    1f6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f72:	89 d3                	mov    %edx,%ebx
    1f74:	89 c1                	mov    %eax,%ecx
    1f76:	d3 e3                	shl    %cl,%ebx
    1f78:	89 d8                	mov    %ebx,%eax
    1f7a:	25 80 00 00 00       	and    $0x80,%eax
    1f7f:	85 c0                	test   %eax,%eax
    1f81:	74 16                	je     1f99 <printBinary+0x44>
		{
			printf(0, "1");
    1f83:	c7 44 24 04 97 8a 00 	movl   $0x8a97,0x4(%esp)
    1f8a:	00 
    1f8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f92:	e8 98 1e 00 00       	call   3e2f <printf>
    1f97:	eb 14                	jmp    1fad <printBinary+0x58>
		}
		else
		{
			printf(0, "0");
    1f99:	c7 44 24 04 99 8a 00 	movl   $0x8a99,0x4(%esp)
    1fa0:	00 
    1fa1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fa8:	e8 82 1e 00 00       	call   3e2f <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    1fad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1fb1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    1fb5:	7e b4                	jle    1f6b <printBinary+0x16>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    1fb7:	c7 44 24 04 9b 8a 00 	movl   $0x8a9b,0x4(%esp)
    1fbe:	00 
    1fbf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fc6:	e8 64 1e 00 00       	call   3e2f <printf>
}
    1fcb:	83 c4 34             	add    $0x34,%esp
    1fce:	5b                   	pop    %ebx
    1fcf:	5d                   	pop    %ebp
    1fd0:	c3                   	ret    

00001fd1 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    1fd1:	55                   	push   %ebp
    1fd2:	89 e5                	mov    %esp,%ebp
    1fd4:	57                   	push   %edi
    1fd5:	56                   	push   %esi
    1fd6:	53                   	push   %ebx
    1fd7:	83 ec 3c             	sub    $0x3c,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    1fda:	c7 44 24 04 9d 8a 00 	movl   $0x8a9d,0x4(%esp)
    1fe1:	00 
    1fe2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fe9:	e8 41 1e 00 00       	call   3e2f <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    1fee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ff5:	00 
    1ff6:	c7 04 24 b0 8a 00 00 	movl   $0x8ab0,(%esp)
    1ffd:	e8 8e 1c 00 00       	call   3c90 <open>
    2002:	89 45 d8             	mov    %eax,-0x28(%ebp)
    2005:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    2009:	79 21                	jns    202c <initializeASCII+0x5b>
	  printf(0,"cannot open %s\n", HANKAKU);
    200b:	c7 44 24 08 b0 8a 00 	movl   $0x8ab0,0x8(%esp)
    2012:	00 
    2013:	c7 44 24 04 bc 8a 00 	movl   $0x8abc,0x4(%esp)
    201a:	00 
    201b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2022:	e8 08 1e 00 00       	call   3e2f <printf>
	  return;
    2027:	e9 15 01 00 00       	jmp    2141 <initializeASCII+0x170>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    202c:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2033:	e8 db 20 00 00       	call   4113 <malloc>
    2038:	a3 e0 10 01 00       	mov    %eax,0x110e0
	for (i = 0; i < ASCII_NUM; i++)
    203d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    2044:	eb 12                	jmp    2058 <initializeASCII+0x87>
	{
		hankaku[i] = 0;
    2046:	8b 15 e0 10 01 00    	mov    0x110e0,%edx
    204c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    204f:	01 d0                	add    %edx,%eax
    2051:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2054:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    2058:	81 7d e4 ff 00 00 00 	cmpl   $0xff,-0x1c(%ebp)
    205f:	7e e5                	jle    2046 <initializeASCII+0x75>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2061:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
	y = 0;
    2068:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    206f:	e9 86 00 00 00       	jmp    20fa <initializeASCII+0x129>
	{
		for (i = 0; i < n; i++){
    2074:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    207b:	eb 75                	jmp    20f2 <initializeASCII+0x121>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    207d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2080:	05 00 11 01 00       	add    $0x11100,%eax
    2085:	0f b6 00             	movzbl (%eax),%eax
    2088:	3c 2a                	cmp    $0x2a,%al
    208a:	74 0f                	je     209b <initializeASCII+0xca>
    208c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    208f:	05 00 11 01 00       	add    $0x11100,%eax
    2094:	0f b6 00             	movzbl (%eax),%eax
    2097:	3c 2e                	cmp    $0x2e,%al
    2099:	75 53                	jne    20ee <initializeASCII+0x11d>
			{
				if (buf[i] == '*')
    209b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    209e:	05 00 11 01 00       	add    $0x11100,%eax
    20a3:	0f b6 00             	movzbl (%eax),%eax
    20a6:	3c 2a                	cmp    $0x2a,%al
    20a8:	75 2f                	jne    20d9 <initializeASCII+0x108>
				{
					hankaku[y] |= (0x80 >> x);
    20aa:	8b 15 e0 10 01 00    	mov    0x110e0,%edx
    20b0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    20b3:	01 c2                	add    %eax,%edx
    20b5:	8b 0d e0 10 01 00    	mov    0x110e0,%ecx
    20bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    20be:	01 c8                	add    %ecx,%eax
    20c0:	0f b6 00             	movzbl (%eax),%eax
    20c3:	89 c3                	mov    %eax,%ebx
    20c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    20c8:	be 80 00 00 00       	mov    $0x80,%esi
    20cd:	89 f7                	mov    %esi,%edi
    20cf:	89 c1                	mov    %eax,%ecx
    20d1:	d3 ff                	sar    %cl,%edi
    20d3:	89 f8                	mov    %edi,%eax
    20d5:	09 d8                	or     %ebx,%eax
    20d7:	88 02                	mov    %al,(%edx)
				}
				x ++;
    20d9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
				if (x >= ASCII_WIDTH)
    20dd:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
    20e1:	7e 0b                	jle    20ee <initializeASCII+0x11d>
				{
					x = 0;
    20e3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
					y ++;
    20ea:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    20ee:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    20f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    20f5:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    20f8:	7c 83                	jl     207d <initializeASCII+0xac>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    20fa:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    2101:	00 
    2102:	c7 44 24 04 00 11 01 	movl   $0x11100,0x4(%esp)
    2109:	00 
    210a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    210d:	89 04 24             	mov    %eax,(%esp)
    2110:	e8 53 1b 00 00       	call   3c68 <read>
    2115:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    2118:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    211c:	0f 8f 52 ff ff ff    	jg     2074 <initializeASCII+0xa3>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2122:	c7 44 24 04 cc 8a 00 	movl   $0x8acc,0x4(%esp)
    2129:	00 
    212a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2131:	e8 f9 1c 00 00       	call   3e2f <printf>
	close(fd);
    2136:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2139:	89 04 24             	mov    %eax,(%esp)
    213c:	e8 37 1b 00 00       	call   3c78 <close>
}
    2141:	83 c4 3c             	add    $0x3c,%esp
    2144:	5b                   	pop    %ebx
    2145:	5e                   	pop    %esi
    2146:	5f                   	pop    %edi
    2147:	5d                   	pop    %ebp
    2148:	c3                   	ret    

00002149 <freeASCII>:

void freeASCII(){
    2149:	55                   	push   %ebp
    214a:	89 e5                	mov    %esp,%ebp
    214c:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    214f:	a1 e0 10 01 00       	mov    0x110e0,%eax
    2154:	89 04 24             	mov    %eax,(%esp)
    2157:	e8 88 1e 00 00       	call   3fe4 <free>
}
    215c:	c9                   	leave  
    215d:	c3                   	ret    

0000215e <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    215e:	55                   	push   %ebp
    215f:	89 e5                	mov    %esp,%ebp
    2161:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2164:	c7 44 24 04 e9 8a 00 	movl   $0x8ae9,0x4(%esp)
    216b:	00 
    216c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2173:	e8 b7 1c 00 00       	call   3e2f <printf>
	if((fd = open(HZK16, 0)) < 0){
    2178:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    217f:	00 
    2180:	c7 04 24 fa 8a 00 00 	movl   $0x8afa,(%esp)
    2187:	e8 04 1b 00 00       	call   3c90 <open>
    218c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    218f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2193:	79 1e                	jns    21b3 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    2195:	c7 44 24 08 fa 8a 00 	movl   $0x8afa,0x8(%esp)
    219c:	00 
    219d:	c7 44 24 04 bc 8a 00 	movl   $0x8abc,0x4(%esp)
    21a4:	00 
    21a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21ac:	e8 7e 1c 00 00       	call   3e2f <printf>
		return;
    21b1:	eb 51                	jmp    2204 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    21b3:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    21ba:	e8 54 1f 00 00       	call   4113 <malloc>
    21bf:	a3 e4 10 01 00       	mov    %eax,0x110e4
	fontFile.size = read(fd, fontFile.buf, 27000);
    21c4:	a1 e4 10 01 00       	mov    0x110e4,%eax
    21c9:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    21d0:	00 
    21d1:	89 44 24 04          	mov    %eax,0x4(%esp)
    21d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21d8:	89 04 24             	mov    %eax,(%esp)
    21db:	e8 88 1a 00 00       	call   3c68 <read>
    21e0:	a3 e8 10 01 00       	mov    %eax,0x110e8
	printf(0,"initialzing gbk complete!\n");
    21e5:	c7 44 24 04 04 8b 00 	movl   $0x8b04,0x4(%esp)
    21ec:	00 
    21ed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21f4:	e8 36 1c 00 00       	call   3e2f <printf>
	close(fd);
    21f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21fc:	89 04 24             	mov    %eax,(%esp)
    21ff:	e8 74 1a 00 00       	call   3c78 <close>
}
    2204:	c9                   	leave  
    2205:	c3                   	ret    

00002206 <freeGBK>:

void freeGBK(){
    2206:	55                   	push   %ebp
    2207:	89 e5                	mov    %esp,%ebp
    2209:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    220c:	a1 e4 10 01 00       	mov    0x110e4,%eax
    2211:	89 04 24             	mov    %eax,(%esp)
    2214:	e8 cb 1d 00 00       	call   3fe4 <free>
}
    2219:	c9                   	leave  
    221a:	c3                   	ret    

0000221b <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    221b:	55                   	push   %ebp
    221c:	89 e5                	mov    %esp,%ebp
    221e:	56                   	push   %esi
    221f:	53                   	push   %ebx
    2220:	83 ec 30             	sub    $0x30,%esp
    2223:	8b 55 14             	mov    0x14(%ebp),%edx
    2226:	8b 45 18             	mov    0x18(%ebp),%eax
    2229:	88 55 e4             	mov    %dl,-0x1c(%ebp)
    222c:	66 89 45 e0          	mov    %ax,-0x20(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2230:	8b 45 20             	mov    0x20(%ebp),%eax
    2233:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2236:	e9 83 00 00 00       	jmp    22be <put_ascii+0xa3>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    223b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2242:	eb 70                	jmp    22b4 <put_ascii+0x99>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2244:	a1 e0 10 01 00       	mov    0x110e0,%eax
    2249:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
    224d:	c1 e2 04             	shl    $0x4,%edx
    2250:	89 d1                	mov    %edx,%ecx
    2252:	8b 55 20             	mov    0x20(%ebp),%edx
    2255:	8b 5d f0             	mov    -0x10(%ebp),%ebx
    2258:	89 de                	mov    %ebx,%esi
    225a:	29 d6                	sub    %edx,%esi
    225c:	89 f2                	mov    %esi,%edx
    225e:	01 ca                	add    %ecx,%edx
    2260:	01 d0                	add    %edx,%eax
    2262:	0f b6 00             	movzbl (%eax),%eax
    2265:	0f b6 d0             	movzbl %al,%edx
    2268:	8b 45 f4             	mov    -0xc(%ebp),%eax
    226b:	89 d3                	mov    %edx,%ebx
    226d:	89 c1                	mov    %eax,%ecx
    226f:	d3 e3                	shl    %cl,%ebx
    2271:	89 d8                	mov    %ebx,%eax
    2273:	25 80 00 00 00       	and    $0x80,%eax
    2278:	85 c0                	test   %eax,%eax
    227a:	74 34                	je     22b0 <put_ascii+0x95>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    227c:	0f b7 4d e0          	movzwl -0x20(%ebp),%ecx
    2280:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2283:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2286:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2289:	01 d8                	add    %ebx,%eax
    228b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    228f:	89 54 24 10          	mov    %edx,0x10(%esp)
    2293:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2297:	8b 45 08             	mov    0x8(%ebp),%eax
    229a:	89 04 24             	mov    %eax,(%esp)
    229d:	8b 45 0c             	mov    0xc(%ebp),%eax
    22a0:	89 44 24 04          	mov    %eax,0x4(%esp)
    22a4:	8b 45 10             	mov    0x10(%ebp),%eax
    22a7:	89 44 24 08          	mov    %eax,0x8(%esp)
    22ab:	e8 dc fb ff ff       	call   1e8c <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    22b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    22b4:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    22b8:	7e 8a                	jle    2244 <put_ascii+0x29>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    22ba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    22be:	8b 45 20             	mov    0x20(%ebp),%eax
    22c1:	83 c0 10             	add    $0x10,%eax
    22c4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    22c7:	0f 8f 6e ff ff ff    	jg     223b <put_ascii+0x20>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    22cd:	83 c4 30             	add    $0x30,%esp
    22d0:	5b                   	pop    %ebx
    22d1:	5e                   	pop    %esi
    22d2:	5d                   	pop    %ebp
    22d3:	c3                   	ret    

000022d4 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    22d4:	55                   	push   %ebp
    22d5:	89 e5                	mov    %esp,%ebp
    22d7:	53                   	push   %ebx
    22d8:	83 ec 34             	sub    $0x34,%esp
    22db:	8b 55 14             	mov    0x14(%ebp),%edx
    22de:	8b 45 18             	mov    0x18(%ebp),%eax
    22e1:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    22e5:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    22e9:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    22ed:	25 ff 00 00 00       	and    $0xff,%eax
    22f2:	3d a0 00 00 00       	cmp    $0xa0,%eax
    22f7:	0f 8e 4b 01 00 00    	jle    2448 <put_gbk+0x174>
    22fd:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2301:	66 c1 f8 08          	sar    $0x8,%ax
    2305:	98                   	cwtl   
    2306:	25 ff 00 00 00       	and    $0xff,%eax
    230b:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2310:	0f 8e 32 01 00 00    	jle    2448 <put_gbk+0x174>
		hzk16Base = fontFile.buf;
    2316:	a1 e4 10 01 00       	mov    0x110e4,%eax
    231b:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    231e:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2322:	25 ff 00 00 00       	and    $0xff,%eax
    2327:	6b c0 5e             	imul   $0x5e,%eax,%eax
    232a:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    232e:	66 c1 fa 08          	sar    $0x8,%dx
    2332:	0f bf d2             	movswl %dx,%edx
    2335:	81 e2 ff 00 00 00    	and    $0xff,%edx
    233b:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2341:	01 d0                	add    %edx,%eax
    2343:	2d 1e 3b 00 00       	sub    $0x3b1e,%eax
    2348:	c1 e0 05             	shl    $0x5,%eax
    234b:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    234e:	8b 45 20             	mov    0x20(%ebp),%eax
    2351:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2354:	e9 de 00 00 00       	jmp    2437 <put_gbk+0x163>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2359:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2360:	eb 5a                	jmp    23bc <put_gbk+0xe8>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2362:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2365:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2368:	01 d0                	add    %edx,%eax
    236a:	0f b6 00             	movzbl (%eax),%eax
    236d:	0f b6 d0             	movzbl %al,%edx
    2370:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2373:	89 d3                	mov    %edx,%ebx
    2375:	89 c1                	mov    %eax,%ecx
    2377:	d3 e3                	shl    %cl,%ebx
    2379:	89 d8                	mov    %ebx,%eax
    237b:	25 80 00 00 00       	and    $0x80,%eax
    2380:	85 c0                	test   %eax,%eax
    2382:	74 34                	je     23b8 <put_gbk+0xe4>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2384:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2388:	8b 55 f4             	mov    -0xc(%ebp),%edx
    238b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    238e:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2391:	01 d8                	add    %ebx,%eax
    2393:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2397:	89 54 24 10          	mov    %edx,0x10(%esp)
    239b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    239f:	8b 45 08             	mov    0x8(%ebp),%eax
    23a2:	89 04 24             	mov    %eax,(%esp)
    23a5:	8b 45 0c             	mov    0xc(%ebp),%eax
    23a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    23ac:	8b 45 10             	mov    0x10(%ebp),%eax
    23af:	89 44 24 08          	mov    %eax,0x8(%esp)
    23b3:	e8 d4 fa ff ff       	call   1e8c <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    23b8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    23bc:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    23c0:	7e a0                	jle    2362 <put_gbk+0x8e>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    23c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    23c6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    23cd:	eb 5a                	jmp    2429 <put_gbk+0x155>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    23cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23d2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    23d5:	01 d0                	add    %edx,%eax
    23d7:	0f b6 00             	movzbl (%eax),%eax
    23da:	0f b6 d0             	movzbl %al,%edx
    23dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23e0:	89 d3                	mov    %edx,%ebx
    23e2:	89 c1                	mov    %eax,%ecx
    23e4:	d3 e3                	shl    %cl,%ebx
    23e6:	89 d8                	mov    %ebx,%eax
    23e8:	25 80 00 00 00       	and    $0x80,%eax
    23ed:	85 c0                	test   %eax,%eax
    23ef:	74 34                	je     2425 <put_gbk+0x151>
					draw_point(c, x + tmpX, tmpY, colorNum);
    23f1:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    23f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23fb:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    23fe:	01 d8                	add    %ebx,%eax
    2400:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2404:	89 54 24 10          	mov    %edx,0x10(%esp)
    2408:	89 44 24 0c          	mov    %eax,0xc(%esp)
    240c:	8b 45 08             	mov    0x8(%ebp),%eax
    240f:	89 04 24             	mov    %eax,(%esp)
    2412:	8b 45 0c             	mov    0xc(%ebp),%eax
    2415:	89 44 24 04          	mov    %eax,0x4(%esp)
    2419:	8b 45 10             	mov    0x10(%ebp),%eax
    241c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2420:	e8 67 fa ff ff       	call   1e8c <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2425:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2429:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    242d:	7e a0                	jle    23cf <put_gbk+0xfb>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    242f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2433:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2437:	8b 45 20             	mov    0x20(%ebp),%eax
    243a:	83 c0 10             	add    $0x10,%eax
    243d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2440:	0f 8f 13 ff ff ff    	jg     2359 <put_gbk+0x85>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2446:	eb 7b                	jmp    24c3 <put_gbk+0x1ef>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2448:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    244c:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2450:	0f b6 c0             	movzbl %al,%eax
    2453:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2456:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    245a:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    245d:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2461:	89 54 24 10          	mov    %edx,0x10(%esp)
    2465:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2469:	8b 45 08             	mov    0x8(%ebp),%eax
    246c:	89 04 24             	mov    %eax,(%esp)
    246f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2472:	89 44 24 04          	mov    %eax,0x4(%esp)
    2476:	8b 45 10             	mov    0x10(%ebp),%eax
    2479:	89 44 24 08          	mov    %eax,0x8(%esp)
    247d:	e8 99 fd ff ff       	call   221b <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    2482:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2485:	8d 58 08             	lea    0x8(%eax),%ebx
    2488:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    248c:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2490:	66 c1 f8 08          	sar    $0x8,%ax
    2494:	0f b6 c0             	movzbl %al,%eax
    2497:	8b 4d 20             	mov    0x20(%ebp),%ecx
    249a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    249e:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    24a2:	89 54 24 10          	mov    %edx,0x10(%esp)
    24a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24aa:	8b 45 08             	mov    0x8(%ebp),%eax
    24ad:	89 04 24             	mov    %eax,(%esp)
    24b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    24b3:	89 44 24 04          	mov    %eax,0x4(%esp)
    24b7:	8b 45 10             	mov    0x10(%ebp),%eax
    24ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    24be:	e8 58 fd ff ff       	call   221b <put_ascii>
	}
}
    24c3:	83 c4 34             	add    $0x34,%esp
    24c6:	5b                   	pop    %ebx
    24c7:	5d                   	pop    %ebp
    24c8:	c3                   	ret    

000024c9 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    24c9:	55                   	push   %ebp
    24ca:	89 e5                	mov    %esp,%ebp
    24cc:	83 ec 48             	sub    $0x48,%esp
    24cf:	8b 45 18             	mov    0x18(%ebp),%eax
    24d2:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    24d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    24dd:	8b 45 14             	mov    0x14(%ebp),%eax
    24e0:	89 04 24             	mov    %eax,(%esp)
    24e3:	e8 9e 15 00 00       	call   3a86 <strlen>
    24e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    24eb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    24f2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    24f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    24f8:	eb 47                	jmp    2541 <puts_str+0x78>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    24fa:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    24fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2501:	03 45 14             	add    0x14(%ebp),%eax
    2504:	0f b6 00             	movzbl (%eax),%eax
    2507:	0f b6 c0             	movzbl %al,%eax
    250a:	8b 4d 20             	mov    0x20(%ebp),%ecx
    250d:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2511:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    2514:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2518:	89 54 24 10          	mov    %edx,0x10(%esp)
    251c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2520:	8b 45 08             	mov    0x8(%ebp),%eax
    2523:	89 04 24             	mov    %eax,(%esp)
    2526:	8b 45 0c             	mov    0xc(%ebp),%eax
    2529:	89 44 24 04          	mov    %eax,0x4(%esp)
    252d:	8b 45 10             	mov    0x10(%ebp),%eax
    2530:	89 44 24 08          	mov    %eax,0x8(%esp)
    2534:	e8 e2 fc ff ff       	call   221b <put_ascii>
			xTmp += 8;
    2539:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    253d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2541:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2544:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2547:	72 b1                	jb     24fa <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2549:	c9                   	leave  
    254a:	c3                   	ret    

0000254b <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    254b:	55                   	push   %ebp
    254c:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    254e:	8b 45 10             	mov    0x10(%ebp),%eax
    2551:	8d 50 07             	lea    0x7(%eax),%edx
    2554:	85 c0                	test   %eax,%eax
    2556:	0f 48 c2             	cmovs  %edx,%eax
    2559:	c1 f8 03             	sar    $0x3,%eax
    255c:	89 c2                	mov    %eax,%edx
    255e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2561:	8d 48 03             	lea    0x3(%eax),%ecx
    2564:	85 c0                	test   %eax,%eax
    2566:	0f 48 c1             	cmovs  %ecx,%eax
    2569:	c1 f8 02             	sar    $0x2,%eax
    256c:	c1 e0 05             	shl    $0x5,%eax
    256f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    2572:	8b 45 08             	mov    0x8(%ebp),%eax
    2575:	8d 50 07             	lea    0x7(%eax),%edx
    2578:	85 c0                	test   %eax,%eax
    257a:	0f 48 c2             	cmovs  %edx,%eax
    257d:	c1 f8 03             	sar    $0x3,%eax
    2580:	c1 e0 0b             	shl    $0xb,%eax
    2583:	01 c8                	add    %ecx,%eax
}
    2585:	5d                   	pop    %ebp
    2586:	c3                   	ret    

00002587 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2587:	55                   	push   %ebp
    2588:	89 e5                	mov    %esp,%ebp
    258a:	53                   	push   %ebx
    258b:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    258e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2595:	e9 aa 00 00 00       	jmp    2644 <draw_picture+0xbd>
	{
		for (j = 0; j < pic.width; j++)
    259a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    25a1:	e9 8e 00 00 00       	jmp    2634 <draw_picture+0xad>
		{
			rgb = pic.data[i*pic.width+j];
    25a6:	8b 55 14             	mov    0x14(%ebp),%edx
    25a9:	8b 45 18             	mov    0x18(%ebp),%eax
    25ac:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    25b0:	03 45 f4             	add    -0xc(%ebp),%eax
    25b3:	c1 e0 02             	shl    $0x2,%eax
    25b6:	01 d0                	add    %edx,%eax
    25b8:	8b 00                	mov    (%eax),%eax
    25ba:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    25bd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    25c1:	3c 01                	cmp    $0x1,%al
    25c3:	74 6a                	je     262f <draw_picture+0xa8>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    25c5:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    25c9:	0f b6 c8             	movzbl %al,%ecx
    25cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    25d0:	0f b6 d0             	movzbl %al,%edx
    25d3:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    25d7:	0f b6 c0             	movzbl %al,%eax
    25da:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    25de:	89 54 24 04          	mov    %edx,0x4(%esp)
    25e2:	89 04 24             	mov    %eax,(%esp)
    25e5:	e8 61 ff ff ff       	call   254b <_RGB16BIT565>
    25ea:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    25ee:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    25f2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    25f5:	83 e8 01             	sub    $0x1,%eax
    25f8:	2b 45 f8             	sub    -0x8(%ebp),%eax
    25fb:	03 45 24             	add    0x24(%ebp),%eax
    25fe:	89 c2                	mov    %eax,%edx
    2600:	8b 45 20             	mov    0x20(%ebp),%eax
    2603:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2606:	01 d8                	add    %ebx,%eax
    2608:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    260c:	89 54 24 10          	mov    %edx,0x10(%esp)
    2610:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2614:	8b 45 08             	mov    0x8(%ebp),%eax
    2617:	89 04 24             	mov    %eax,(%esp)
    261a:	8b 45 0c             	mov    0xc(%ebp),%eax
    261d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2621:	8b 45 10             	mov    0x10(%ebp),%eax
    2624:	89 44 24 08          	mov    %eax,0x8(%esp)
    2628:	e8 5f f8 ff ff       	call   1e8c <draw_point>
    262d:	eb 01                	jmp    2630 <draw_picture+0xa9>
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
		{
			rgb = pic.data[i*pic.width+j];
			if (rgb.rgbReserved == 1) continue;
    262f:	90                   	nop
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2630:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2634:	8b 45 18             	mov    0x18(%ebp),%eax
    2637:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    263a:	0f 8f 66 ff ff ff    	jg     25a6 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2640:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2644:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2647:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    264a:	0f 8f 4a ff ff ff    	jg     259a <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2650:	83 c4 28             	add    $0x28,%esp
    2653:	5b                   	pop    %ebx
    2654:	5d                   	pop    %ebp
    2655:	c3                   	ret    

00002656 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2656:	55                   	push   %ebp
    2657:	89 e5                	mov    %esp,%ebp
    2659:	83 ec 3c             	sub    $0x3c,%esp
    265c:	8b 45 24             	mov    0x24(%ebp),%eax
    265f:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2663:	8b 45 14             	mov    0x14(%ebp),%eax
    2666:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2669:	89 d1                	mov    %edx,%ecx
    266b:	29 c1                	sub    %eax,%ecx
    266d:	89 c8                	mov    %ecx,%eax
    266f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2672:	8b 45 18             	mov    0x18(%ebp),%eax
    2675:	8b 55 20             	mov    0x20(%ebp),%edx
    2678:	89 d1                	mov    %edx,%ecx
    267a:	29 c1                	sub    %eax,%ecx
    267c:	89 c8                	mov    %ecx,%eax
    267e:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2681:	8b 45 14             	mov    0x14(%ebp),%eax
    2684:	c1 e0 0a             	shl    $0xa,%eax
    2687:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    268a:	8b 45 18             	mov    0x18(%ebp),%eax
    268d:	c1 e0 0a             	shl    $0xa,%eax
    2690:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    2693:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2696:	c1 f8 1f             	sar    $0x1f,%eax
    2699:	31 45 fc             	xor    %eax,-0x4(%ebp)
    269c:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    269f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    26a2:	c1 f8 1f             	sar    $0x1f,%eax
    26a5:	31 45 f8             	xor    %eax,-0x8(%ebp)
    26a8:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    26ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26ae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    26b1:	7c 63                	jl     2716 <draw_line+0xc0>
		len = dx + 1;
    26b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26b6:	83 c0 01             	add    $0x1,%eax
    26b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    26bc:	8b 45 1c             	mov    0x1c(%ebp),%eax
    26bf:	3b 45 14             	cmp    0x14(%ebp),%eax
    26c2:	7e 07                	jle    26cb <draw_line+0x75>
    26c4:	b8 00 04 00 00       	mov    $0x400,%eax
    26c9:	eb 05                	jmp    26d0 <draw_line+0x7a>
    26cb:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    26d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    26d3:	8b 45 20             	mov    0x20(%ebp),%eax
    26d6:	3b 45 18             	cmp    0x18(%ebp),%eax
    26d9:	7c 1c                	jl     26f7 <draw_line+0xa1>
    26db:	8b 45 18             	mov    0x18(%ebp),%eax
    26de:	8b 55 20             	mov    0x20(%ebp),%edx
    26e1:	89 d1                	mov    %edx,%ecx
    26e3:	29 c1                	sub    %eax,%ecx
    26e5:	89 c8                	mov    %ecx,%eax
    26e7:	83 c0 01             	add    $0x1,%eax
    26ea:	c1 e0 0a             	shl    $0xa,%eax
    26ed:	89 c2                	mov    %eax,%edx
    26ef:	c1 fa 1f             	sar    $0x1f,%edx
    26f2:	f7 7d ec             	idivl  -0x14(%ebp)
    26f5:	eb 1a                	jmp    2711 <draw_line+0xbb>
    26f7:	8b 45 18             	mov    0x18(%ebp),%eax
    26fa:	8b 55 20             	mov    0x20(%ebp),%edx
    26fd:	89 d1                	mov    %edx,%ecx
    26ff:	29 c1                	sub    %eax,%ecx
    2701:	89 c8                	mov    %ecx,%eax
    2703:	83 e8 01             	sub    $0x1,%eax
    2706:	c1 e0 0a             	shl    $0xa,%eax
    2709:	89 c2                	mov    %eax,%edx
    270b:	c1 fa 1f             	sar    $0x1f,%edx
    270e:	f7 7d ec             	idivl  -0x14(%ebp)
    2711:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2714:	eb 61                	jmp    2777 <draw_line+0x121>
	}
	else {
		len = dy + 1;
    2716:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2719:	83 c0 01             	add    $0x1,%eax
    271c:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    271f:	8b 45 20             	mov    0x20(%ebp),%eax
    2722:	3b 45 18             	cmp    0x18(%ebp),%eax
    2725:	7e 07                	jle    272e <draw_line+0xd8>
    2727:	b8 00 04 00 00       	mov    $0x400,%eax
    272c:	eb 05                	jmp    2733 <draw_line+0xdd>
    272e:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2733:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2736:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2739:	3b 45 14             	cmp    0x14(%ebp),%eax
    273c:	7c 1c                	jl     275a <draw_line+0x104>
    273e:	8b 45 14             	mov    0x14(%ebp),%eax
    2741:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2744:	89 d1                	mov    %edx,%ecx
    2746:	29 c1                	sub    %eax,%ecx
    2748:	89 c8                	mov    %ecx,%eax
    274a:	83 c0 01             	add    $0x1,%eax
    274d:	c1 e0 0a             	shl    $0xa,%eax
    2750:	89 c2                	mov    %eax,%edx
    2752:	c1 fa 1f             	sar    $0x1f,%edx
    2755:	f7 7d ec             	idivl  -0x14(%ebp)
    2758:	eb 1a                	jmp    2774 <draw_line+0x11e>
    275a:	8b 45 14             	mov    0x14(%ebp),%eax
    275d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2760:	89 d1                	mov    %edx,%ecx
    2762:	29 c1                	sub    %eax,%ecx
    2764:	89 c8                	mov    %ecx,%eax
    2766:	83 e8 01             	sub    $0x1,%eax
    2769:	c1 e0 0a             	shl    $0xa,%eax
    276c:	89 c2                	mov    %eax,%edx
    276e:	c1 fa 1f             	sar    $0x1f,%edx
    2771:	f7 7d ec             	idivl  -0x14(%ebp)
    2774:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    2777:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    277e:	eb 47                	jmp    27c7 <draw_line+0x171>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2780:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    2784:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2787:	c1 f8 0a             	sar    $0xa,%eax
    278a:	89 c2                	mov    %eax,%edx
    278c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    278f:	c1 f8 0a             	sar    $0xa,%eax
    2792:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2796:	89 54 24 10          	mov    %edx,0x10(%esp)
    279a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    279e:	8b 45 08             	mov    0x8(%ebp),%eax
    27a1:	89 04 24             	mov    %eax,(%esp)
    27a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    27a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    27ab:	8b 45 10             	mov    0x10(%ebp),%eax
    27ae:	89 44 24 08          	mov    %eax,0x8(%esp)
    27b2:	e8 d5 f6 ff ff       	call   1e8c <draw_point>
		y += dy;
    27b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27ba:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    27bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27c0:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    27c3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    27c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27ca:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    27cd:	7c b1                	jl     2780 <draw_line+0x12a>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    27cf:	c9                   	leave  
    27d0:	c3                   	ret    

000027d1 <draw_window>:

void
draw_window(Context c, char *title)
{
    27d1:	55                   	push   %ebp
    27d2:	89 e5                	mov    %esp,%ebp
    27d4:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    27d7:	8b 45 0c             	mov    0xc(%ebp),%eax
    27da:	83 e8 01             	sub    $0x1,%eax
    27dd:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    27e4:	00 
    27e5:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    27ec:	00 
    27ed:	89 44 24 14          	mov    %eax,0x14(%esp)
    27f1:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    27f8:	00 
    27f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    2800:	00 
    2801:	8b 45 08             	mov    0x8(%ebp),%eax
    2804:	89 04 24             	mov    %eax,(%esp)
    2807:	8b 45 0c             	mov    0xc(%ebp),%eax
    280a:	89 44 24 04          	mov    %eax,0x4(%esp)
    280e:	8b 45 10             	mov    0x10(%ebp),%eax
    2811:	89 44 24 08          	mov    %eax,0x8(%esp)
    2815:	e8 3c fe ff ff       	call   2656 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    281a:	8b 45 10             	mov    0x10(%ebp),%eax
    281d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2820:	8b 45 0c             	mov    0xc(%ebp),%eax
    2823:	8d 50 ff             	lea    -0x1(%eax),%edx
    2826:	8b 45 0c             	mov    0xc(%ebp),%eax
    2829:	83 e8 01             	sub    $0x1,%eax
    282c:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2833:	00 
    2834:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2838:	89 54 24 14          	mov    %edx,0x14(%esp)
    283c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2843:	00 
    2844:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2848:	8b 45 08             	mov    0x8(%ebp),%eax
    284b:	89 04 24             	mov    %eax,(%esp)
    284e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2851:	89 44 24 04          	mov    %eax,0x4(%esp)
    2855:	8b 45 10             	mov    0x10(%ebp),%eax
    2858:	89 44 24 08          	mov    %eax,0x8(%esp)
    285c:	e8 f5 fd ff ff       	call   2656 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2861:	8b 45 10             	mov    0x10(%ebp),%eax
    2864:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2867:	8b 45 10             	mov    0x10(%ebp),%eax
    286a:	8d 50 ff             	lea    -0x1(%eax),%edx
    286d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2870:	83 e8 01             	sub    $0x1,%eax
    2873:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    287a:	00 
    287b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    287f:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    2886:	00 
    2887:	89 54 24 10          	mov    %edx,0x10(%esp)
    288b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    288f:	8b 45 08             	mov    0x8(%ebp),%eax
    2892:	89 04 24             	mov    %eax,(%esp)
    2895:	8b 45 0c             	mov    0xc(%ebp),%eax
    2898:	89 44 24 04          	mov    %eax,0x4(%esp)
    289c:	8b 45 10             	mov    0x10(%ebp),%eax
    289f:	89 44 24 08          	mov    %eax,0x8(%esp)
    28a3:	e8 ae fd ff ff       	call   2656 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    28a8:	8b 45 10             	mov    0x10(%ebp),%eax
    28ab:	83 e8 01             	sub    $0x1,%eax
    28ae:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    28b5:	00 
    28b6:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    28bd:	00 
    28be:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    28c5:	00 
    28c6:	89 44 24 10          	mov    %eax,0x10(%esp)
    28ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    28d1:	00 
    28d2:	8b 45 08             	mov    0x8(%ebp),%eax
    28d5:	89 04 24             	mov    %eax,(%esp)
    28d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    28db:	89 44 24 04          	mov    %eax,0x4(%esp)
    28df:	8b 45 10             	mov    0x10(%ebp),%eax
    28e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    28e6:	e8 6b fd ff ff       	call   2656 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    28eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    28ee:	83 e8 02             	sub    $0x2,%eax
    28f1:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    28f8:	00 
    28f9:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    2900:	00 
    2901:	89 44 24 14          	mov    %eax,0x14(%esp)
    2905:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    290c:	00 
    290d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2914:	00 
    2915:	8b 45 08             	mov    0x8(%ebp),%eax
    2918:	89 04 24             	mov    %eax,(%esp)
    291b:	8b 45 0c             	mov    0xc(%ebp),%eax
    291e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2922:	8b 45 10             	mov    0x10(%ebp),%eax
    2925:	89 44 24 08          	mov    %eax,0x8(%esp)
    2929:	e8 9b f5 ff ff       	call   1ec9 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    292e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2931:	83 e8 02             	sub    $0x2,%eax
    2934:	89 c2                	mov    %eax,%edx
    2936:	8b 45 10             	mov    0x10(%ebp),%eax
    2939:	83 e8 15             	sub    $0x15,%eax
    293c:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2943:	00 
    2944:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    294b:	00 
    294c:	89 54 24 14          	mov    %edx,0x14(%esp)
    2950:	89 44 24 10          	mov    %eax,0x10(%esp)
    2954:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    295b:	00 
    295c:	8b 45 08             	mov    0x8(%ebp),%eax
    295f:	89 04 24             	mov    %eax,(%esp)
    2962:	8b 45 0c             	mov    0xc(%ebp),%eax
    2965:	89 44 24 04          	mov    %eax,0x4(%esp)
    2969:	8b 45 10             	mov    0x10(%ebp),%eax
    296c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2970:	e8 54 f5 ff ff       	call   1ec9 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    2975:	c7 44 24 04 1f 8b 00 	movl   $0x8b1f,0x4(%esp)
    297c:	00 
    297d:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2980:	89 04 24             	mov    %eax,(%esp)
    2983:	e8 38 01 00 00       	call   2ac0 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    2988:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    298f:	00 
    2990:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    2997:	00 
    2998:	8b 45 ec             	mov    -0x14(%ebp),%eax
    299b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    299f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29a2:	89 44 24 10          	mov    %eax,0x10(%esp)
    29a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29a9:	89 44 24 14          	mov    %eax,0x14(%esp)
    29ad:	8b 45 08             	mov    0x8(%ebp),%eax
    29b0:	89 04 24             	mov    %eax,(%esp)
    29b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    29b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    29ba:	8b 45 10             	mov    0x10(%ebp),%eax
    29bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    29c1:	e8 c1 fb ff ff       	call   2587 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    29c6:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    29cd:	00 
    29ce:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    29d5:	00 
    29d6:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    29dd:	00 
    29de:	8b 45 14             	mov    0x14(%ebp),%eax
    29e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    29e5:	8b 45 08             	mov    0x8(%ebp),%eax
    29e8:	89 04 24             	mov    %eax,(%esp)
    29eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    29ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    29f2:	8b 45 10             	mov    0x10(%ebp),%eax
    29f5:	89 44 24 08          	mov    %eax,0x8(%esp)
    29f9:	e8 cb fa ff ff       	call   24c9 <puts_str>
  freepic(&pic);
    29fe:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2a01:	89 04 24             	mov    %eax,(%esp)
    2a04:	e8 40 06 00 00       	call   3049 <freepic>
}
    2a09:	c9                   	leave  
    2a0a:	c3                   	ret    

00002a0b <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2a0b:	55                   	push   %ebp
    2a0c:	89 e5                	mov    %esp,%ebp
    2a0e:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    2a11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a18:	eb 25                	jmp    2a3f <load_iconlist+0x34>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a1d:	6b c0 34             	imul   $0x34,%eax,%eax
    2a20:	03 45 08             	add    0x8(%ebp),%eax
    2a23:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a26:	6b d2 34             	imul   $0x34,%edx,%edx
    2a29:	03 55 08             	add    0x8(%ebp),%edx
    2a2c:	83 c2 28             	add    $0x28,%edx
    2a2f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a33:	89 14 24             	mov    %edx,(%esp)
    2a36:	e8 85 00 00 00       	call   2ac0 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2a3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a42:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2a45:	7c d3                	jl     2a1a <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2a47:	c9                   	leave  
    2a48:	c3                   	ret    

00002a49 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2a49:	55                   	push   %ebp
    2a4a:	89 e5                	mov    %esp,%ebp
    2a4c:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    2a4f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    2a56:	eb 5b                	jmp    2ab3 <draw_iconlist+0x6a>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2a5b:	6b c0 34             	imul   $0x34,%eax,%eax
    2a5e:	03 45 14             	add    0x14(%ebp),%eax
    2a61:	8b 48 24             	mov    0x24(%eax),%ecx
    2a64:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2a67:	6b c0 34             	imul   $0x34,%eax,%eax
    2a6a:	03 45 14             	add    0x14(%ebp),%eax
    2a6d:	8b 50 20             	mov    0x20(%eax),%edx
    2a70:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2a73:	6b c0 34             	imul   $0x34,%eax,%eax
    2a76:	03 45 14             	add    0x14(%ebp),%eax
    2a79:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2a7d:	89 54 24 18          	mov    %edx,0x18(%esp)
    2a81:	8b 50 28             	mov    0x28(%eax),%edx
    2a84:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2a88:	8b 50 2c             	mov    0x2c(%eax),%edx
    2a8b:	89 54 24 10          	mov    %edx,0x10(%esp)
    2a8f:	8b 40 30             	mov    0x30(%eax),%eax
    2a92:	89 44 24 14          	mov    %eax,0x14(%esp)
    2a96:	8b 45 08             	mov    0x8(%ebp),%eax
    2a99:	89 04 24             	mov    %eax,(%esp)
    2a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a9f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2aa3:	8b 45 10             	mov    0x10(%ebp),%eax
    2aa6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2aaa:	e8 d8 fa ff ff       	call   2587 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2aaf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    2ab3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    2ab6:	3b 45 18             	cmp    0x18(%ebp),%eax
    2ab9:	7c 9d                	jl     2a58 <draw_iconlist+0xf>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2abb:	c9                   	leave  
    2abc:	c3                   	ret    
    2abd:	90                   	nop
    2abe:	90                   	nop
    2abf:	90                   	nop

00002ac0 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2ac0:	55                   	push   %ebp
    2ac1:	89 e5                	mov    %esp,%ebp
    2ac3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2ac9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2ad0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ad7:	00 
    2ad8:	8b 45 0c             	mov    0xc(%ebp),%eax
    2adb:	89 04 24             	mov    %eax,(%esp)
    2ade:	e8 ad 11 00 00       	call   3c90 <open>
    2ae3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2ae6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2aea:	79 20                	jns    2b0c <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    2aec:	8b 45 0c             	mov    0xc(%ebp),%eax
    2aef:	89 44 24 08          	mov    %eax,0x8(%esp)
    2af3:	c7 44 24 04 2c 8b 00 	movl   $0x8b2c,0x4(%esp)
    2afa:	00 
    2afb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b02:	e8 28 13 00 00       	call   3e2f <printf>
		return;
    2b07:	e9 cc 02 00 00       	jmp    2dd8 <loadBitmap+0x318>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    2b0c:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b0f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b13:	c7 44 24 04 3c 8b 00 	movl   $0x8b3c,0x4(%esp)
    2b1a:	00 
    2b1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b22:	e8 08 13 00 00       	call   3e2f <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2b27:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    2b2e:	e8 e0 15 00 00       	call   4113 <malloc>
    2b33:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2b36:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    2b3d:	00 
    2b3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b41:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b45:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b48:	89 04 24             	mov    %eax,(%esp)
    2b4b:	e8 18 11 00 00       	call   3c68 <read>
    2b50:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    2b53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b56:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2b59:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b5c:	0f b7 00             	movzwl (%eax),%eax
    2b5f:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    2b63:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2b67:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2b6b:	74 19                	je     2b86 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    2b6d:	c7 44 24 04 50 8b 00 	movl   $0x8b50,0x4(%esp)
    2b74:	00 
    2b75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b7c:	e8 ae 12 00 00       	call   3e2f <printf>
		return;
    2b81:	e9 52 02 00 00       	jmp    2dd8 <loadBitmap+0x318>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2b86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b89:	83 c0 02             	add    $0x2,%eax
    2b8c:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    2b8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2b92:	8b 00                	mov    (%eax),%eax
    2b94:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2b97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b9a:	83 c0 06             	add    $0x6,%eax
    2b9d:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    2ba0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2ba3:	0f b7 00             	movzwl (%eax),%eax
    2ba6:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2baa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bad:	83 c0 08             	add    $0x8,%eax
    2bb0:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    2bb3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2bb6:	0f b7 00             	movzwl (%eax),%eax
    2bb9:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2bbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bc0:	83 c0 0a             	add    $0xa,%eax
    2bc3:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    2bc6:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2bc9:	8b 00                	mov    (%eax),%eax
    2bcb:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    2bce:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    2bd5:	00 
    2bd6:	8d 45 84             	lea    -0x7c(%ebp),%eax
    2bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2be0:	89 04 24             	mov    %eax,(%esp)
    2be3:	e8 80 10 00 00       	call   3c68 <read>
	width = bitInfoHead.biWidth;
    2be8:	8b 45 88             	mov    -0x78(%ebp),%eax
    2beb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    2bee:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2bf1:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    2bf4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2bf7:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    2bfb:	c1 e0 02             	shl    $0x2,%eax
    2bfe:	89 44 24 10          	mov    %eax,0x10(%esp)
    2c02:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c05:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2c09:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c10:	c7 44 24 04 68 8b 00 	movl   $0x8b68,0x4(%esp)
    2c17:	00 
    2c18:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c1f:	e8 0b 12 00 00       	call   3e2f <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2c24:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2c28:	75 14                	jne    2c3e <loadBitmap+0x17e>
		printf(0, "0");
    2c2a:	c7 44 24 04 8d 8b 00 	movl   $0x8b8d,0x4(%esp)
    2c31:	00 
    2c32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c39:	e8 f1 11 00 00       	call   3e2f <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    2c3e:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2c42:	0f b7 c0             	movzwl %ax,%eax
    2c45:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2c49:	83 c0 1f             	add    $0x1f,%eax
    2c4c:	8d 50 1f             	lea    0x1f(%eax),%edx
    2c4f:	85 c0                	test   %eax,%eax
    2c51:	0f 48 c2             	cmovs  %edx,%eax
    2c54:	c1 f8 05             	sar    $0x5,%eax
    2c57:	c1 e0 02             	shl    $0x2,%eax
    2c5a:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2c5d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c60:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c64:	89 04 24             	mov    %eax,(%esp)
    2c67:	e8 a7 14 00 00       	call   4113 <malloc>
    2c6c:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    2c6f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2c72:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2c75:	0f af c2             	imul   %edx,%eax
    2c78:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c7c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c83:	00 
    2c84:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2c87:	89 04 24             	mov    %eax,(%esp)
    2c8a:	e8 1c 0e 00 00       	call   3aab <memset>
	long nData = height * l_width;
    2c8f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c92:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c96:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2c99:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2c9c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ca0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2ca3:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ca7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2caa:	89 04 24             	mov    %eax,(%esp)
    2cad:	e8 b6 0f 00 00       	call   3c68 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    2cb2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2cb5:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    2cb9:	c1 e0 02             	shl    $0x2,%eax
    2cbc:	89 04 24             	mov    %eax,(%esp)
    2cbf:	e8 4f 14 00 00       	call   4113 <malloc>
    2cc4:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    2cc7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2cca:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2ccd:	0f af c2             	imul   %edx,%eax
    2cd0:	c1 e0 02             	shl    $0x2,%eax
    2cd3:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cd7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2cde:	00 
    2cdf:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2ce2:	89 04 24             	mov    %eax,(%esp)
    2ce5:	e8 c1 0d 00 00       	call   3aab <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    2cea:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2cee:	66 83 f8 17          	cmp    $0x17,%ax
    2cf2:	77 19                	ja     2d0d <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    2cf4:	c7 44 24 04 90 8b 00 	movl   $0x8b90,0x4(%esp)
    2cfb:	00 
    2cfc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d03:	e8 27 11 00 00       	call   3e2f <printf>
		return;
    2d08:	e9 cb 00 00 00       	jmp    2dd8 <loadBitmap+0x318>
	} else	//位图为24位真彩色
	{
		index = 0;
    2d0d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2d14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2d1b:	eb 78                	jmp    2d95 <loadBitmap+0x2d5>
			for (j = 0; j < width; j++) {
    2d1d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d24:	eb 63                	jmp    2d89 <loadBitmap+0x2c9>
				k = i * l_width + j * 3;
    2d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d29:	89 c1                	mov    %eax,%ecx
    2d2b:	0f af 4d cc          	imul   -0x34(%ebp),%ecx
    2d2f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2d32:	89 d0                	mov    %edx,%eax
    2d34:	01 c0                	add    %eax,%eax
    2d36:	01 d0                	add    %edx,%eax
    2d38:	01 c8                	add    %ecx,%eax
    2d3a:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    2d3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d40:	c1 e0 02             	shl    $0x2,%eax
    2d43:	03 45 c0             	add    -0x40(%ebp),%eax
    2d46:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2d49:	83 c2 02             	add    $0x2,%edx
    2d4c:	03 55 c8             	add    -0x38(%ebp),%edx
    2d4f:	0f b6 12             	movzbl (%edx),%edx
    2d52:	88 50 02             	mov    %dl,0x2(%eax)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    2d55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d58:	c1 e0 02             	shl    $0x2,%eax
    2d5b:	03 45 c0             	add    -0x40(%ebp),%eax
    2d5e:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2d61:	83 c2 01             	add    $0x1,%edx
    2d64:	03 55 c8             	add    -0x38(%ebp),%edx
    2d67:	0f b6 12             	movzbl (%edx),%edx
    2d6a:	88 50 01             	mov    %dl,0x1(%eax)
				dataOfBmp[index].rgbBlue = pColorData[k];
    2d6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d70:	c1 e0 02             	shl    $0x2,%eax
    2d73:	03 45 c0             	add    -0x40(%ebp),%eax
    2d76:	8b 55 bc             	mov    -0x44(%ebp),%edx
    2d79:	03 55 c8             	add    -0x38(%ebp),%edx
    2d7c:	0f b6 12             	movzbl (%edx),%edx
    2d7f:	88 10                	mov    %dl,(%eax)
				index++;
    2d81:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    2d85:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2d89:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d8c:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2d8f:	7c 95                	jl     2d26 <loadBitmap+0x266>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    2d91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d98:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    2d9b:	7c 80                	jl     2d1d <loadBitmap+0x25d>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    2d9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2da0:	89 04 24             	mov    %eax,(%esp)
    2da3:	e8 d0 0e 00 00       	call   3c78 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    2da8:	8b 45 08             	mov    0x8(%ebp),%eax
    2dab:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2dae:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    2db0:	8b 45 08             	mov    0x8(%ebp),%eax
    2db3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2db6:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    2db9:	8b 45 08             	mov    0x8(%ebp),%eax
    2dbc:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2dbf:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    2dc2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2dc5:	89 04 24             	mov    %eax,(%esp)
    2dc8:	e8 17 12 00 00       	call   3fe4 <free>
	free(BmpFileHeader);
    2dcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2dd0:	89 04 24             	mov    %eax,(%esp)
    2dd3:	e8 0c 12 00 00       	call   3fe4 <free>
	//printf("\n");
}
    2dd8:	c9                   	leave  
    2dd9:	c3                   	ret    

00002dda <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    2dda:	55                   	push   %ebp
    2ddb:	89 e5                	mov    %esp,%ebp
    2ddd:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    2de0:	c7 44 24 04 b0 8b 00 	movl   $0x8bb0,0x4(%esp)
    2de7:	00 
    2de8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2def:	e8 3b 10 00 00       	call   3e2f <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2df4:	8b 45 08             	mov    0x8(%ebp),%eax
    2df7:	0f b7 00             	movzwl (%eax),%eax
    2dfa:	0f b7 c0             	movzwl %ax,%eax
    2dfd:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e01:	c7 44 24 04 c2 8b 00 	movl   $0x8bc2,0x4(%esp)
    2e08:	00 
    2e09:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e10:	e8 1a 10 00 00       	call   3e2f <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    2e15:	8b 45 08             	mov    0x8(%ebp),%eax
    2e18:	8b 40 04             	mov    0x4(%eax),%eax
    2e1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e1f:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    2e26:	00 
    2e27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e2e:	e8 fc 0f 00 00       	call   3e2f <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    2e33:	8b 45 08             	mov    0x8(%ebp),%eax
    2e36:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    2e3a:	0f b7 c0             	movzwl %ax,%eax
    2e3d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e41:	c7 44 24 04 f1 8b 00 	movl   $0x8bf1,0x4(%esp)
    2e48:	00 
    2e49:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e50:	e8 da 0f 00 00       	call   3e2f <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    2e55:	8b 45 08             	mov    0x8(%ebp),%eax
    2e58:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    2e5c:	0f b7 c0             	movzwl %ax,%eax
    2e5f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e63:	c7 44 24 04 f1 8b 00 	movl   $0x8bf1,0x4(%esp)
    2e6a:	00 
    2e6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e72:	e8 b8 0f 00 00       	call   3e2f <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    2e77:	8b 45 08             	mov    0x8(%ebp),%eax
    2e7a:	8b 40 0c             	mov    0xc(%eax),%eax
    2e7d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e81:	c7 44 24 04 00 8c 00 	movl   $0x8c00,0x4(%esp)
    2e88:	00 
    2e89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e90:	e8 9a 0f 00 00       	call   3e2f <printf>
}
    2e95:	c9                   	leave  
    2e96:	c3                   	ret    

00002e97 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    2e97:	55                   	push   %ebp
    2e98:	89 e5                	mov    %esp,%ebp
    2e9a:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    2e9d:	c7 44 24 04 29 8c 00 	movl   $0x8c29,0x4(%esp)
    2ea4:	00 
    2ea5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eac:	e8 7e 0f 00 00       	call   3e2f <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    2eb1:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb4:	8b 00                	mov    (%eax),%eax
    2eb6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2eba:	c7 44 24 04 3b 8c 00 	movl   $0x8c3b,0x4(%esp)
    2ec1:	00 
    2ec2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ec9:	e8 61 0f 00 00       	call   3e2f <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    2ece:	8b 45 08             	mov    0x8(%ebp),%eax
    2ed1:	8b 40 04             	mov    0x4(%eax),%eax
    2ed4:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ed8:	c7 44 24 04 52 8c 00 	movl   $0x8c52,0x4(%esp)
    2edf:	00 
    2ee0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ee7:	e8 43 0f 00 00       	call   3e2f <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    2eec:	8b 45 08             	mov    0x8(%ebp),%eax
    2eef:	8b 40 08             	mov    0x8(%eax),%eax
    2ef2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ef6:	c7 44 24 04 60 8c 00 	movl   $0x8c60,0x4(%esp)
    2efd:	00 
    2efe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f05:	e8 25 0f 00 00       	call   3e2f <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    2f0a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f0d:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    2f11:	0f b7 c0             	movzwl %ax,%eax
    2f14:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f18:	c7 44 24 04 6e 8c 00 	movl   $0x8c6e,0x4(%esp)
    2f1f:	00 
    2f20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f27:	e8 03 0f 00 00       	call   3e2f <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    2f2c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f2f:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    2f33:	0f b7 c0             	movzwl %ax,%eax
    2f36:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f3a:	c7 44 24 04 84 8c 00 	movl   $0x8c84,0x4(%esp)
    2f41:	00 
    2f42:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f49:	e8 e1 0e 00 00       	call   3e2f <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    2f4e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f51:	8b 40 10             	mov    0x10(%eax),%eax
    2f54:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f58:	c7 44 24 04 a5 8c 00 	movl   $0x8ca5,0x4(%esp)
    2f5f:	00 
    2f60:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f67:	e8 c3 0e 00 00       	call   3e2f <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    2f6c:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6f:	8b 40 14             	mov    0x14(%eax),%eax
    2f72:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f76:	c7 44 24 04 b8 8c 00 	movl   $0x8cb8,0x4(%esp)
    2f7d:	00 
    2f7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f85:	e8 a5 0e 00 00       	call   3e2f <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    2f8a:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8d:	8b 40 18             	mov    0x18(%eax),%eax
    2f90:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f94:	c7 44 24 04 ec 8c 00 	movl   $0x8cec,0x4(%esp)
    2f9b:	00 
    2f9c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fa3:	e8 87 0e 00 00       	call   3e2f <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    2fa8:	8b 45 08             	mov    0x8(%ebp),%eax
    2fab:	8b 40 1c             	mov    0x1c(%eax),%eax
    2fae:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fb2:	c7 44 24 04 01 8d 00 	movl   $0x8d01,0x4(%esp)
    2fb9:	00 
    2fba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fc1:	e8 69 0e 00 00       	call   3e2f <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    2fc6:	8b 45 08             	mov    0x8(%ebp),%eax
    2fc9:	8b 40 20             	mov    0x20(%eax),%eax
    2fcc:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fd0:	c7 44 24 04 16 8d 00 	movl   $0x8d16,0x4(%esp)
    2fd7:	00 
    2fd8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fdf:	e8 4b 0e 00 00       	call   3e2f <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    2fe4:	8b 45 08             	mov    0x8(%ebp),%eax
    2fe7:	8b 40 24             	mov    0x24(%eax),%eax
    2fea:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fee:	c7 44 24 04 2d 8d 00 	movl   $0x8d2d,0x4(%esp)
    2ff5:	00 
    2ff6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ffd:	e8 2d 0e 00 00       	call   3e2f <printf>
}
    3002:	c9                   	leave  
    3003:	c3                   	ret    

00003004 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3004:	55                   	push   %ebp
    3005:	89 e5                	mov    %esp,%ebp
    3007:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    300a:	8b 45 08             	mov    0x8(%ebp),%eax
    300d:	0f b6 00             	movzbl (%eax),%eax
    3010:	0f b6 c8             	movzbl %al,%ecx
    3013:	8b 45 08             	mov    0x8(%ebp),%eax
    3016:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    301a:	0f b6 d0             	movzbl %al,%edx
    301d:	8b 45 08             	mov    0x8(%ebp),%eax
    3020:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3024:	0f b6 c0             	movzbl %al,%eax
    3027:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    302b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    302f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3033:	c7 44 24 04 41 8d 00 	movl   $0x8d41,0x4(%esp)
    303a:	00 
    303b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3042:	e8 e8 0d 00 00       	call   3e2f <printf>
}
    3047:	c9                   	leave  
    3048:	c3                   	ret    

00003049 <freepic>:

void freepic(PICNODE *pic) {
    3049:	55                   	push   %ebp
    304a:	89 e5                	mov    %esp,%ebp
    304c:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    304f:	8b 45 08             	mov    0x8(%ebp),%eax
    3052:	8b 00                	mov    (%eax),%eax
    3054:	89 04 24             	mov    %eax,(%esp)
    3057:	e8 88 0f 00 00       	call   3fe4 <free>
}
    305c:	c9                   	leave  
    305d:	c3                   	ret    

0000305e <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    305e:	55                   	push   %ebp
    305f:	89 e5                	mov    %esp,%ebp
    3061:	53                   	push   %ebx
    3062:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    3068:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    306f:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3072:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3075:	89 54 24 10          	mov    %edx,0x10(%esp)
    3079:	8b 55 ec             	mov    -0x14(%ebp),%edx
    307c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3080:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3087:	00 
    3088:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    308f:	00 
    3090:	89 04 24             	mov    %eax,(%esp)
    3093:	e8 6f 02 00 00       	call   3307 <initRect>
    3098:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    309b:	8b 45 08             	mov    0x8(%ebp),%eax
    309e:	8b 40 04             	mov    0x4(%eax),%eax
    30a1:	89 c2                	mov    %eax,%edx
    30a3:	2b 55 ec             	sub    -0x14(%ebp),%edx
    30a6:	8d 45 cc             	lea    -0x34(%ebp),%eax
    30a9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    30ac:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    30b0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    30b3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    30b7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    30be:	00 
    30bf:	89 54 24 04          	mov    %edx,0x4(%esp)
    30c3:	89 04 24             	mov    %eax,(%esp)
    30c6:	e8 3c 02 00 00       	call   3307 <initRect>
    30cb:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    30ce:	8b 45 08             	mov    0x8(%ebp),%eax
    30d1:	8b 40 08             	mov    0x8(%eax),%eax
    30d4:	89 c1                	mov    %eax,%ecx
    30d6:	2b 4d ec             	sub    -0x14(%ebp),%ecx
    30d9:	8b 45 08             	mov    0x8(%ebp),%eax
    30dc:	8b 40 04             	mov    0x4(%eax),%eax
    30df:	89 c2                	mov    %eax,%edx
    30e1:	2b 55 ec             	sub    -0x14(%ebp),%edx
    30e4:	8d 45 bc             	lea    -0x44(%ebp),%eax
    30e7:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    30ea:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    30ee:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    30f1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    30f5:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    30f9:	89 54 24 04          	mov    %edx,0x4(%esp)
    30fd:	89 04 24             	mov    %eax,(%esp)
    3100:	e8 02 02 00 00       	call   3307 <initRect>
    3105:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3108:	8b 45 08             	mov    0x8(%ebp),%eax
    310b:	8b 40 08             	mov    0x8(%eax),%eax
    310e:	89 c2                	mov    %eax,%edx
    3110:	2b 55 ec             	sub    -0x14(%ebp),%edx
    3113:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3116:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3119:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    311d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3120:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3124:	89 54 24 08          	mov    %edx,0x8(%esp)
    3128:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    312f:	00 
    3130:	89 04 24             	mov    %eax,(%esp)
    3133:	e8 cf 01 00 00       	call   3307 <initRect>
    3138:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    313b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3142:	e9 82 01 00 00       	jmp    32c9 <set_icon_alpha+0x26b>
		for (j = 0; j < pic->height; j++) {
    3147:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    314e:	e9 63 01 00 00       	jmp    32b6 <set_icon_alpha+0x258>
			p = initPoint(i, j);
    3153:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3156:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3159:	89 54 24 08          	mov    %edx,0x8(%esp)
    315d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3160:	89 54 24 04          	mov    %edx,0x4(%esp)
    3164:	89 04 24             	mov    %eax,(%esp)
    3167:	e8 74 01 00 00       	call   32e0 <initPoint>
    316c:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    316f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3172:	89 44 24 08          	mov    %eax,0x8(%esp)
    3176:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3179:	89 44 24 0c          	mov    %eax,0xc(%esp)
    317d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3180:	89 44 24 10          	mov    %eax,0x10(%esp)
    3184:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3187:	89 44 24 14          	mov    %eax,0x14(%esp)
    318b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    318e:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3191:	89 04 24             	mov    %eax,(%esp)
    3194:	89 54 24 04          	mov    %edx,0x4(%esp)
    3198:	e8 c5 01 00 00       	call   3362 <isIn>
    319d:	85 c0                	test   %eax,%eax
    319f:	0f 85 96 00 00 00    	jne    323b <set_icon_alpha+0x1dd>
    31a5:	8b 45 cc             	mov    -0x34(%ebp),%eax
    31a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    31ac:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31af:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    31b6:	89 44 24 10          	mov    %eax,0x10(%esp)
    31ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
    31bd:	89 44 24 14          	mov    %eax,0x14(%esp)
    31c1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    31c4:	8b 55 a8             	mov    -0x58(%ebp),%edx
    31c7:	89 04 24             	mov    %eax,(%esp)
    31ca:	89 54 24 04          	mov    %edx,0x4(%esp)
    31ce:	e8 8f 01 00 00       	call   3362 <isIn>
    31d3:	85 c0                	test   %eax,%eax
    31d5:	75 64                	jne    323b <set_icon_alpha+0x1dd>
    31d7:	8b 45 bc             	mov    -0x44(%ebp),%eax
    31da:	89 44 24 08          	mov    %eax,0x8(%esp)
    31de:	8b 45 c0             	mov    -0x40(%ebp),%eax
    31e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31e5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    31e8:	89 44 24 10          	mov    %eax,0x10(%esp)
    31ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
    31ef:	89 44 24 14          	mov    %eax,0x14(%esp)
    31f3:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    31f6:	8b 55 a8             	mov    -0x58(%ebp),%edx
    31f9:	89 04 24             	mov    %eax,(%esp)
    31fc:	89 54 24 04          	mov    %edx,0x4(%esp)
    3200:	e8 5d 01 00 00       	call   3362 <isIn>
    3205:	85 c0                	test   %eax,%eax
    3207:	75 32                	jne    323b <set_icon_alpha+0x1dd>
    3209:	8b 45 ac             	mov    -0x54(%ebp),%eax
    320c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3210:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3213:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3217:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    321a:	89 44 24 10          	mov    %eax,0x10(%esp)
    321e:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3221:	89 44 24 14          	mov    %eax,0x14(%esp)
    3225:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3228:	8b 55 a8             	mov    -0x58(%ebp),%edx
    322b:	89 04 24             	mov    %eax,(%esp)
    322e:	89 54 24 04          	mov    %edx,0x4(%esp)
    3232:	e8 2b 01 00 00       	call   3362 <isIn>
    3237:	85 c0                	test   %eax,%eax
    3239:	74 77                	je     32b2 <set_icon_alpha+0x254>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    323b:	8b 45 08             	mov    0x8(%ebp),%eax
    323e:	8b 10                	mov    (%eax),%edx
    3240:	8b 45 08             	mov    0x8(%ebp),%eax
    3243:	8b 40 04             	mov    0x4(%eax),%eax
    3246:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    324a:	03 45 f4             	add    -0xc(%ebp),%eax
    324d:	c1 e0 02             	shl    $0x2,%eax
    3250:	01 d0                	add    %edx,%eax
    3252:	0f b6 00             	movzbl (%eax),%eax
    3255:	3c ff                	cmp    $0xff,%al
    3257:	75 59                	jne    32b2 <set_icon_alpha+0x254>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3259:	8b 45 08             	mov    0x8(%ebp),%eax
    325c:	8b 10                	mov    (%eax),%edx
    325e:	8b 45 08             	mov    0x8(%ebp),%eax
    3261:	8b 40 04             	mov    0x4(%eax),%eax
    3264:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3268:	03 45 f4             	add    -0xc(%ebp),%eax
    326b:	c1 e0 02             	shl    $0x2,%eax
    326e:	01 d0                	add    %edx,%eax
    3270:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3274:	3c ff                	cmp    $0xff,%al
    3276:	75 3a                	jne    32b2 <set_icon_alpha+0x254>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    3278:	8b 45 08             	mov    0x8(%ebp),%eax
    327b:	8b 10                	mov    (%eax),%edx
    327d:	8b 45 08             	mov    0x8(%ebp),%eax
    3280:	8b 40 04             	mov    0x4(%eax),%eax
    3283:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3287:	03 45 f4             	add    -0xc(%ebp),%eax
    328a:	c1 e0 02             	shl    $0x2,%eax
    328d:	01 d0                	add    %edx,%eax
    328f:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3293:	3c ff                	cmp    $0xff,%al
    3295:	75 1b                	jne    32b2 <set_icon_alpha+0x254>
					pic->data[j * pic->width + i].rgbReserved = 1;
    3297:	8b 45 08             	mov    0x8(%ebp),%eax
    329a:	8b 10                	mov    (%eax),%edx
    329c:	8b 45 08             	mov    0x8(%ebp),%eax
    329f:	8b 40 04             	mov    0x4(%eax),%eax
    32a2:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32a6:	03 45 f4             	add    -0xc(%ebp),%eax
    32a9:	c1 e0 02             	shl    $0x2,%eax
    32ac:	01 d0                	add    %edx,%eax
    32ae:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    32b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32b6:	8b 45 08             	mov    0x8(%ebp),%eax
    32b9:	8b 40 08             	mov    0x8(%eax),%eax
    32bc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    32bf:	0f 8f 8e fe ff ff    	jg     3153 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    32c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    32c9:	8b 45 08             	mov    0x8(%ebp),%eax
    32cc:	8b 40 04             	mov    0x4(%eax),%eax
    32cf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    32d2:	0f 8f 6f fe ff ff    	jg     3147 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    32d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    32db:	c9                   	leave  
    32dc:	c3                   	ret    
    32dd:	90                   	nop
    32de:	90                   	nop
    32df:	90                   	nop

000032e0 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"

Point initPoint(int x, int y)
{
    32e0:	55                   	push   %ebp
    32e1:	89 e5                	mov    %esp,%ebp
    32e3:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    32e6:	8b 45 0c             	mov    0xc(%ebp),%eax
    32e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    32ec:	8b 45 10             	mov    0x10(%ebp),%eax
    32ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    32f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
    32f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    32f8:	8b 55 fc             	mov    -0x4(%ebp),%edx
    32fb:	89 01                	mov    %eax,(%ecx)
    32fd:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3300:	8b 45 08             	mov    0x8(%ebp),%eax
    3303:	c9                   	leave  
    3304:	c2 04 00             	ret    $0x4

00003307 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3307:	55                   	push   %ebp
    3308:	89 e5                	mov    %esp,%ebp
    330a:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    330d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3310:	8b 55 10             	mov    0x10(%ebp),%edx
    3313:	89 54 24 08          	mov    %edx,0x8(%esp)
    3317:	8b 55 0c             	mov    0xc(%ebp),%edx
    331a:	89 54 24 04          	mov    %edx,0x4(%esp)
    331e:	89 04 24             	mov    %eax,(%esp)
    3321:	e8 ba ff ff ff       	call   32e0 <initPoint>
    3326:	83 ec 04             	sub    $0x4,%esp
    3329:	8b 45 e8             	mov    -0x18(%ebp),%eax
    332c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    332f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3332:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    3335:	8b 45 14             	mov    0x14(%ebp),%eax
    3338:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    333b:	8b 45 18             	mov    0x18(%ebp),%eax
    333e:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3341:	8b 45 08             	mov    0x8(%ebp),%eax
    3344:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3347:	89 10                	mov    %edx,(%eax)
    3349:	8b 55 f4             	mov    -0xc(%ebp),%edx
    334c:	89 50 04             	mov    %edx,0x4(%eax)
    334f:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3352:	89 50 08             	mov    %edx,0x8(%eax)
    3355:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3358:	89 50 0c             	mov    %edx,0xc(%eax)
}
    335b:	8b 45 08             	mov    0x8(%ebp),%eax
    335e:	c9                   	leave  
    335f:	c2 04 00             	ret    $0x4

00003362 <isIn>:

int isIn(Point p, Rect r)
{
    3362:	55                   	push   %ebp
    3363:	89 e5                	mov    %esp,%ebp
	//printf(0, "Click point: %d %d\n", p.x, p.y);
	//printf(0, "Rect area: %d %d %d %d\n",r.start.x, r.start.y, r.start.x+r.width, r.start.y+r.height);
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3365:	8b 55 08             	mov    0x8(%ebp),%edx
    3368:	8b 45 10             	mov    0x10(%ebp),%eax
    336b:	39 c2                	cmp    %eax,%edx
    336d:	7c 2f                	jl     339e <isIn+0x3c>
    336f:	8b 45 08             	mov    0x8(%ebp),%eax
    3372:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3375:	8b 55 18             	mov    0x18(%ebp),%edx
    3378:	01 ca                	add    %ecx,%edx
    337a:	39 d0                	cmp    %edx,%eax
    337c:	7d 20                	jge    339e <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    337e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3381:	8b 45 14             	mov    0x14(%ebp),%eax
    3384:	39 c2                	cmp    %eax,%edx
    3386:	7c 16                	jl     339e <isIn+0x3c>
    3388:	8b 45 0c             	mov    0xc(%ebp),%eax
    338b:	8b 4d 14             	mov    0x14(%ebp),%ecx
    338e:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3391:	01 ca                	add    %ecx,%edx
    3393:	39 d0                	cmp    %edx,%eax
    3395:	7d 07                	jge    339e <isIn+0x3c>

int isIn(Point p, Rect r)
{
	//printf(0, "Click point: %d %d\n", p.x, p.y);
	//printf(0, "Rect area: %d %d %d %d\n",r.start.x, r.start.y, r.start.x+r.width, r.start.y+r.height);
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    3397:	b8 01 00 00 00       	mov    $0x1,%eax
    339c:	eb 05                	jmp    33a3 <isIn+0x41>
    339e:	b8 00 00 00 00       	mov    $0x0,%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
}
    33a3:	5d                   	pop    %ebp
    33a4:	c3                   	ret    

000033a5 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    33a5:	55                   	push   %ebp
    33a6:	89 e5                	mov    %esp,%ebp
    33a8:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    33ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    33b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    33b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    33c0:	8b 45 10             	mov    0x10(%ebp),%eax
    33c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    33c6:	8b 45 14             	mov    0x14(%ebp),%eax
    33c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    33cc:	8b 45 08             	mov    0x8(%ebp),%eax
    33cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    33d2:	89 10                	mov    %edx,(%eax)
    33d4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    33d7:	89 50 04             	mov    %edx,0x4(%eax)
    33da:	8b 55 f4             	mov    -0xc(%ebp),%edx
    33dd:	89 50 08             	mov    %edx,0x8(%eax)
    33e0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    33e3:	89 50 0c             	mov    %edx,0xc(%eax)
    33e6:	8b 55 fc             	mov    -0x4(%ebp),%edx
    33e9:	89 50 10             	mov    %edx,0x10(%eax)
}
    33ec:	8b 45 08             	mov    0x8(%ebp),%eax
    33ef:	c9                   	leave  
    33f0:	c2 04 00             	ret    $0x4

000033f3 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    33f3:	55                   	push   %ebp
    33f4:	89 e5                	mov    %esp,%ebp
    33f6:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    33f9:	8b 45 1c             	mov    0x1c(%ebp),%eax
    33fc:	83 f8 03             	cmp    $0x3,%eax
    33ff:	74 72                	je     3473 <createClickable+0x80>
    3401:	83 f8 04             	cmp    $0x4,%eax
    3404:	74 0a                	je     3410 <createClickable+0x1d>
    3406:	83 f8 02             	cmp    $0x2,%eax
    3409:	74 38                	je     3443 <createClickable+0x50>
    340b:	e9 96 00 00 00       	jmp    34a6 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3410:	8b 45 08             	mov    0x8(%ebp),%eax
    3413:	8d 50 04             	lea    0x4(%eax),%edx
    3416:	8b 45 20             	mov    0x20(%ebp),%eax
    3419:	89 44 24 14          	mov    %eax,0x14(%esp)
    341d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3420:	89 44 24 04          	mov    %eax,0x4(%esp)
    3424:	8b 45 10             	mov    0x10(%ebp),%eax
    3427:	89 44 24 08          	mov    %eax,0x8(%esp)
    342b:	8b 45 14             	mov    0x14(%ebp),%eax
    342e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3432:	8b 45 18             	mov    0x18(%ebp),%eax
    3435:	89 44 24 10          	mov    %eax,0x10(%esp)
    3439:	89 14 24             	mov    %edx,(%esp)
    343c:	e8 7c 00 00 00       	call   34bd <addClickable>
	        break;
    3441:	eb 78                	jmp    34bb <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    3443:	8b 45 08             	mov    0x8(%ebp),%eax
    3446:	8b 55 20             	mov    0x20(%ebp),%edx
    3449:	89 54 24 14          	mov    %edx,0x14(%esp)
    344d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3450:	89 54 24 04          	mov    %edx,0x4(%esp)
    3454:	8b 55 10             	mov    0x10(%ebp),%edx
    3457:	89 54 24 08          	mov    %edx,0x8(%esp)
    345b:	8b 55 14             	mov    0x14(%ebp),%edx
    345e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3462:	8b 55 18             	mov    0x18(%ebp),%edx
    3465:	89 54 24 10          	mov    %edx,0x10(%esp)
    3469:	89 04 24             	mov    %eax,(%esp)
    346c:	e8 4c 00 00 00       	call   34bd <addClickable>
	    	break;
    3471:	eb 48                	jmp    34bb <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    3473:	8b 45 08             	mov    0x8(%ebp),%eax
    3476:	8d 50 08             	lea    0x8(%eax),%edx
    3479:	8b 45 20             	mov    0x20(%ebp),%eax
    347c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3480:	8b 45 0c             	mov    0xc(%ebp),%eax
    3483:	89 44 24 04          	mov    %eax,0x4(%esp)
    3487:	8b 45 10             	mov    0x10(%ebp),%eax
    348a:	89 44 24 08          	mov    %eax,0x8(%esp)
    348e:	8b 45 14             	mov    0x14(%ebp),%eax
    3491:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3495:	8b 45 18             	mov    0x18(%ebp),%eax
    3498:	89 44 24 10          	mov    %eax,0x10(%esp)
    349c:	89 14 24             	mov    %edx,(%esp)
    349f:	e8 19 00 00 00       	call   34bd <addClickable>
	    	break;
    34a4:	eb 15                	jmp    34bb <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    34a6:	c7 44 24 04 50 8d 00 	movl   $0x8d50,0x4(%esp)
    34ad:	00 
    34ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34b5:	e8 75 09 00 00       	call   3e2f <printf>
	    	break;
    34ba:	90                   	nop
	}
}
    34bb:	c9                   	leave  
    34bc:	c3                   	ret    

000034bd <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    34bd:	55                   	push   %ebp
    34be:	89 e5                	mov    %esp,%ebp
    34c0:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    34c3:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    34ca:	e8 44 0c 00 00       	call   4113 <malloc>
    34cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    34d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34d5:	8b 55 0c             	mov    0xc(%ebp),%edx
    34d8:	89 10                	mov    %edx,(%eax)
    34da:	8b 55 10             	mov    0x10(%ebp),%edx
    34dd:	89 50 04             	mov    %edx,0x4(%eax)
    34e0:	8b 55 14             	mov    0x14(%ebp),%edx
    34e3:	89 50 08             	mov    %edx,0x8(%eax)
    34e6:	8b 55 18             	mov    0x18(%ebp),%edx
    34e9:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    34ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34ef:	8b 55 1c             	mov    0x1c(%ebp),%edx
    34f2:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    34f5:	8b 45 08             	mov    0x8(%ebp),%eax
    34f8:	8b 10                	mov    (%eax),%edx
    34fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34fd:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3500:	8b 45 08             	mov    0x8(%ebp),%eax
    3503:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3506:	89 10                	mov    %edx,(%eax)
}
    3508:	c9                   	leave  
    3509:	c3                   	ret    

0000350a <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    350a:	55                   	push   %ebp
    350b:	89 e5                	mov    %esp,%ebp
    350d:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3510:	8b 45 08             	mov    0x8(%ebp),%eax
    3513:	8b 00                	mov    (%eax),%eax
    3515:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3518:	8b 45 f0             	mov    -0x10(%ebp),%eax
    351b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    351e:	e9 bb 00 00 00       	jmp    35de <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    3523:	8b 45 0c             	mov    0xc(%ebp),%eax
    3526:	89 44 24 08          	mov    %eax,0x8(%esp)
    352a:	8b 45 10             	mov    0x10(%ebp),%eax
    352d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3531:	8b 45 14             	mov    0x14(%ebp),%eax
    3534:	89 44 24 10          	mov    %eax,0x10(%esp)
    3538:	8b 45 18             	mov    0x18(%ebp),%eax
    353b:	89 44 24 14          	mov    %eax,0x14(%esp)
    353f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3542:	8b 50 04             	mov    0x4(%eax),%edx
    3545:	8b 00                	mov    (%eax),%eax
    3547:	89 04 24             	mov    %eax,(%esp)
    354a:	89 54 24 04          	mov    %edx,0x4(%esp)
    354e:	e8 0f fe ff ff       	call   3362 <isIn>
    3553:	85 c0                	test   %eax,%eax
    3555:	74 60                	je     35b7 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    3557:	8b 45 08             	mov    0x8(%ebp),%eax
    355a:	8b 00                	mov    (%eax),%eax
    355c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    355f:	75 2e                	jne    358f <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    3561:	8b 45 08             	mov    0x8(%ebp),%eax
    3564:	8b 00                	mov    (%eax),%eax
    3566:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    3569:	8b 45 f0             	mov    -0x10(%ebp),%eax
    356c:	8b 50 14             	mov    0x14(%eax),%edx
    356f:	8b 45 08             	mov    0x8(%ebp),%eax
    3572:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    3574:	8b 45 08             	mov    0x8(%ebp),%eax
    3577:	8b 00                	mov    (%eax),%eax
    3579:	89 45 f4             	mov    %eax,-0xc(%ebp)
    357c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    357f:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3582:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3585:	89 04 24             	mov    %eax,(%esp)
    3588:	e8 57 0a 00 00       	call   3fe4 <free>
    358d:	eb 4f                	jmp    35de <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    358f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3592:	8b 50 14             	mov    0x14(%eax),%edx
    3595:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3598:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    359b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    359e:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    35a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35a4:	8b 40 14             	mov    0x14(%eax),%eax
    35a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    35aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35ad:	89 04 24             	mov    %eax,(%esp)
    35b0:	e8 2f 0a 00 00       	call   3fe4 <free>
    35b5:	eb 27                	jmp    35de <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    35b7:	8b 45 08             	mov    0x8(%ebp),%eax
    35ba:	8b 00                	mov    (%eax),%eax
    35bc:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    35bf:	75 0b                	jne    35cc <deleteClickable+0xc2>
			{
				cur = cur->next;
    35c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35c4:	8b 40 14             	mov    0x14(%eax),%eax
    35c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    35ca:	eb 12                	jmp    35de <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    35cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35cf:	8b 40 14             	mov    0x14(%eax),%eax
    35d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    35d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35d8:	8b 40 14             	mov    0x14(%eax),%eax
    35db:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    35de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    35e2:	0f 85 3b ff ff ff    	jne    3523 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    35e8:	c9                   	leave  
    35e9:	c3                   	ret    

000035ea <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    35ea:	55                   	push   %ebp
    35eb:	89 e5                	mov    %esp,%ebp
    35ed:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    35f0:	8b 45 08             	mov    0x8(%ebp),%eax
    35f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    35f6:	e9 80 00 00 00       	jmp    367b <executeHandler+0x91>
	{
		printf(0, "CurArea:X:%d Y:%d\n", cur->area.start.x, cur->area.start.y);
    35fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35fe:	8b 50 04             	mov    0x4(%eax),%edx
    3601:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3604:	8b 00                	mov    (%eax),%eax
    3606:	89 54 24 0c          	mov    %edx,0xc(%esp)
    360a:	89 44 24 08          	mov    %eax,0x8(%esp)
    360e:	c7 44 24 04 7e 8d 00 	movl   $0x8d7e,0x4(%esp)
    3615:	00 
    3616:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    361d:	e8 0d 08 00 00       	call   3e2f <printf>
		if (isIn(click, cur->area))
    3622:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3625:	8b 10                	mov    (%eax),%edx
    3627:	89 54 24 08          	mov    %edx,0x8(%esp)
    362b:	8b 50 04             	mov    0x4(%eax),%edx
    362e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3632:	8b 50 08             	mov    0x8(%eax),%edx
    3635:	89 54 24 10          	mov    %edx,0x10(%esp)
    3639:	8b 40 0c             	mov    0xc(%eax),%eax
    363c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3640:	8b 45 0c             	mov    0xc(%ebp),%eax
    3643:	8b 55 10             	mov    0x10(%ebp),%edx
    3646:	89 04 24             	mov    %eax,(%esp)
    3649:	89 54 24 04          	mov    %edx,0x4(%esp)
    364d:	e8 10 fd ff ff       	call   3362 <isIn>
    3652:	85 c0                	test   %eax,%eax
    3654:	74 1c                	je     3672 <executeHandler+0x88>
		{
			cur->handler(click);
    3656:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3659:	8b 48 10             	mov    0x10(%eax),%ecx
    365c:	8b 45 0c             	mov    0xc(%ebp),%eax
    365f:	8b 55 10             	mov    0x10(%ebp),%edx
    3662:	89 04 24             	mov    %eax,(%esp)
    3665:	89 54 24 04          	mov    %edx,0x4(%esp)
    3669:	ff d1                	call   *%ecx
			return 1;
    366b:	b8 01 00 00 00       	mov    $0x1,%eax
    3670:	eb 2c                	jmp    369e <executeHandler+0xb4>
		}
		cur = cur->next;
    3672:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3675:	8b 40 14             	mov    0x14(%eax),%eax
    3678:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    367b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    367f:	0f 85 76 ff ff ff    	jne    35fb <executeHandler+0x11>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    3685:	c7 44 24 04 91 8d 00 	movl   $0x8d91,0x4(%esp)
    368c:	00 
    368d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3694:	e8 96 07 00 00       	call   3e2f <printf>
	return 0;
    3699:	b8 00 00 00 00       	mov    $0x0,%eax
}
    369e:	c9                   	leave  
    369f:	c3                   	ret    

000036a0 <printClickable>:

void printClickable(Clickable *c)
{
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	53                   	push   %ebx
    36a4:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    36a7:	8b 45 08             	mov    0x8(%ebp),%eax
    36aa:	8b 58 0c             	mov    0xc(%eax),%ebx
    36ad:	8b 45 08             	mov    0x8(%ebp),%eax
    36b0:	8b 48 08             	mov    0x8(%eax),%ecx
    36b3:	8b 45 08             	mov    0x8(%ebp),%eax
    36b6:	8b 50 04             	mov    0x4(%eax),%edx
    36b9:	8b 45 08             	mov    0x8(%ebp),%eax
    36bc:	8b 00                	mov    (%eax),%eax
    36be:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    36c2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    36c6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    36ca:	89 44 24 08          	mov    %eax,0x8(%esp)
    36ce:	c7 44 24 04 a1 8d 00 	movl   $0x8da1,0x4(%esp)
    36d5:	00 
    36d6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36dd:	e8 4d 07 00 00       	call   3e2f <printf>
}
    36e2:	83 c4 24             	add    $0x24,%esp
    36e5:	5b                   	pop    %ebx
    36e6:	5d                   	pop    %ebp
    36e7:	c3                   	ret    

000036e8 <printClickableList>:

void printClickableList(Clickable *head)
{
    36e8:	55                   	push   %ebp
    36e9:	89 e5                	mov    %esp,%ebp
    36eb:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    36ee:	8b 45 08             	mov    0x8(%ebp),%eax
    36f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    36f4:	c7 44 24 04 b3 8d 00 	movl   $0x8db3,0x4(%esp)
    36fb:	00 
    36fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3703:	e8 27 07 00 00       	call   3e2f <printf>
	while(cur != 0)
    3708:	eb 14                	jmp    371e <printClickableList+0x36>
	{
		printClickable(cur);
    370a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    370d:	89 04 24             	mov    %eax,(%esp)
    3710:	e8 8b ff ff ff       	call   36a0 <printClickable>
		cur = cur->next;
    3715:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3718:	8b 40 14             	mov    0x14(%eax),%eax
    371b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    371e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3722:	75 e6                	jne    370a <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3724:	c7 44 24 04 c4 8d 00 	movl   $0x8dc4,0x4(%esp)
    372b:	00 
    372c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3733:	e8 f7 06 00 00       	call   3e2f <printf>
}
    3738:	c9                   	leave  
    3739:	c3                   	ret    

0000373a <testHanler>:

void testHanler(struct Point p)
{
    373a:	55                   	push   %ebp
    373b:	89 e5                	mov    %esp,%ebp
    373d:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3740:	8b 55 0c             	mov    0xc(%ebp),%edx
    3743:	8b 45 08             	mov    0x8(%ebp),%eax
    3746:	89 54 24 0c          	mov    %edx,0xc(%esp)
    374a:	89 44 24 08          	mov    %eax,0x8(%esp)
    374e:	c7 44 24 04 c6 8d 00 	movl   $0x8dc6,0x4(%esp)
    3755:	00 
    3756:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    375d:	e8 cd 06 00 00       	call   3e2f <printf>
}
    3762:	c9                   	leave  
    3763:	c3                   	ret    

00003764 <testClickable>:
void testClickable(struct Context c)
{
    3764:	55                   	push   %ebp
    3765:	89 e5                	mov    %esp,%ebp
    3767:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    376d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3770:	8b 55 08             	mov    0x8(%ebp),%edx
    3773:	89 54 24 04          	mov    %edx,0x4(%esp)
    3777:	8b 55 0c             	mov    0xc(%ebp),%edx
    377a:	89 54 24 08          	mov    %edx,0x8(%esp)
    377e:	8b 55 10             	mov    0x10(%ebp),%edx
    3781:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3785:	89 04 24             	mov    %eax,(%esp)
    3788:	e8 18 fc ff ff       	call   33a5 <initClickManager>
    378d:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    3790:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    3793:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    379a:	00 
    379b:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    37a2:	00 
    37a3:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    37aa:	00 
    37ab:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    37b2:	00 
    37b3:	89 04 24             	mov    %eax,(%esp)
    37b6:	e8 4c fb ff ff       	call   3307 <initRect>
    37bb:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    37be:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    37c1:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    37c8:	00 
    37c9:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    37d0:	00 
    37d1:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    37d8:	00 
    37d9:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    37e0:	00 
    37e1:	89 04 24             	mov    %eax,(%esp)
    37e4:	e8 1e fb ff ff       	call   3307 <initRect>
    37e9:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    37ec:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    37ef:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    37f6:	00 
    37f7:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    37fe:	00 
    37ff:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    3806:	00 
    3807:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    380e:	00 
    380f:	89 04 24             	mov    %eax,(%esp)
    3812:	e8 f0 fa ff ff       	call   3307 <initRect>
    3817:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    381a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    381d:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    3824:	00 
    3825:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    382c:	00 
    382d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3834:	00 
    3835:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    383c:	00 
    383d:	89 04 24             	mov    %eax,(%esp)
    3840:	e8 c2 fa ff ff       	call   3307 <initRect>
    3845:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    3848:	8d 45 9c             	lea    -0x64(%ebp),%eax
    384b:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    3852:	00 
    3853:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    385a:	00 
    385b:	89 04 24             	mov    %eax,(%esp)
    385e:	e8 7d fa ff ff       	call   32e0 <initPoint>
    3863:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    3866:	8d 45 94             	lea    -0x6c(%ebp),%eax
    3869:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    3870:	00 
    3871:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    3878:	00 
    3879:	89 04 24             	mov    %eax,(%esp)
    387c:	e8 5f fa ff ff       	call   32e0 <initPoint>
    3881:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    3884:	c7 44 24 18 3a 37 00 	movl   $0x373a,0x18(%esp)
    388b:	00 
    388c:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3893:	00 
    3894:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3897:	89 44 24 04          	mov    %eax,0x4(%esp)
    389b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    389e:	89 44 24 08          	mov    %eax,0x8(%esp)
    38a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    38a5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    38ac:	89 44 24 10          	mov    %eax,0x10(%esp)
    38b0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    38b3:	89 04 24             	mov    %eax,(%esp)
    38b6:	e8 38 fb ff ff       	call   33f3 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    38bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38be:	89 44 24 08          	mov    %eax,0x8(%esp)
    38c2:	c7 44 24 04 da 8d 00 	movl   $0x8dda,0x4(%esp)
    38c9:	00 
    38ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38d1:	e8 59 05 00 00       	call   3e2f <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    38d6:	c7 44 24 18 3a 37 00 	movl   $0x373a,0x18(%esp)
    38dd:	00 
    38de:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    38e5:	00 
    38e6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    38e9:	89 44 24 04          	mov    %eax,0x4(%esp)
    38ed:	8b 45 c8             	mov    -0x38(%ebp),%eax
    38f0:	89 44 24 08          	mov    %eax,0x8(%esp)
    38f4:	8b 45 cc             	mov    -0x34(%ebp),%eax
    38f7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
    38fe:	89 44 24 10          	mov    %eax,0x10(%esp)
    3902:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3905:	89 04 24             	mov    %eax,(%esp)
    3908:	e8 e6 fa ff ff       	call   33f3 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    390d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3910:	89 44 24 08          	mov    %eax,0x8(%esp)
    3914:	c7 44 24 04 da 8d 00 	movl   $0x8dda,0x4(%esp)
    391b:	00 
    391c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3923:	e8 07 05 00 00       	call   3e2f <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3928:	c7 44 24 18 3a 37 00 	movl   $0x373a,0x18(%esp)
    392f:	00 
    3930:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3937:	00 
    3938:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    393b:	89 44 24 04          	mov    %eax,0x4(%esp)
    393f:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3942:	89 44 24 08          	mov    %eax,0x8(%esp)
    3946:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3949:	89 44 24 0c          	mov    %eax,0xc(%esp)
    394d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3950:	89 44 24 10          	mov    %eax,0x10(%esp)
    3954:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3957:	89 04 24             	mov    %eax,(%esp)
    395a:	e8 94 fa ff ff       	call   33f3 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    395f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3962:	89 44 24 08          	mov    %eax,0x8(%esp)
    3966:	c7 44 24 04 da 8d 00 	movl   $0x8dda,0x4(%esp)
    396d:	00 
    396e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3975:	e8 b5 04 00 00       	call   3e2f <printf>
	printClickableList(cm.left_click);
    397a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    397d:	89 04 24             	mov    %eax,(%esp)
    3980:	e8 63 fd ff ff       	call   36e8 <printClickableList>
	executeHandler(cm.left_click, p1);
    3985:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3988:	8b 45 9c             	mov    -0x64(%ebp),%eax
    398b:	8b 55 a0             	mov    -0x60(%ebp),%edx
    398e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3992:	89 54 24 08          	mov    %edx,0x8(%esp)
    3996:	89 0c 24             	mov    %ecx,(%esp)
    3999:	e8 4c fc ff ff       	call   35ea <executeHandler>
	executeHandler(cm.left_click, p2);
    399e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    39a1:	8b 45 94             	mov    -0x6c(%ebp),%eax
    39a4:	8b 55 98             	mov    -0x68(%ebp),%edx
    39a7:	89 44 24 04          	mov    %eax,0x4(%esp)
    39ab:	89 54 24 08          	mov    %edx,0x8(%esp)
    39af:	89 0c 24             	mov    %ecx,(%esp)
    39b2:	e8 33 fc ff ff       	call   35ea <executeHandler>
	deleteClickable(&cm.left_click, r4);
    39b7:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    39ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    39be:	8b 45 a8             	mov    -0x58(%ebp),%eax
    39c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    39c5:	8b 45 ac             	mov    -0x54(%ebp),%eax
    39c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    39cc:	8b 45 b0             	mov    -0x50(%ebp),%eax
    39cf:	89 44 24 10          	mov    %eax,0x10(%esp)
    39d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    39d6:	89 04 24             	mov    %eax,(%esp)
    39d9:	e8 2c fb ff ff       	call   350a <deleteClickable>
	printClickableList(cm.left_click);
    39de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39e1:	89 04 24             	mov    %eax,(%esp)
    39e4:	e8 ff fc ff ff       	call   36e8 <printClickableList>
}
    39e9:	c9                   	leave  
    39ea:	c3                   	ret    
    39eb:	90                   	nop

000039ec <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    39ec:	55                   	push   %ebp
    39ed:	89 e5                	mov    %esp,%ebp
    39ef:	57                   	push   %edi
    39f0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    39f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    39f4:	8b 55 10             	mov    0x10(%ebp),%edx
    39f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    39fa:	89 cb                	mov    %ecx,%ebx
    39fc:	89 df                	mov    %ebx,%edi
    39fe:	89 d1                	mov    %edx,%ecx
    3a00:	fc                   	cld    
    3a01:	f3 aa                	rep stos %al,%es:(%edi)
    3a03:	89 ca                	mov    %ecx,%edx
    3a05:	89 fb                	mov    %edi,%ebx
    3a07:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3a0a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3a0d:	5b                   	pop    %ebx
    3a0e:	5f                   	pop    %edi
    3a0f:	5d                   	pop    %ebp
    3a10:	c3                   	ret    

00003a11 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3a11:	55                   	push   %ebp
    3a12:	89 e5                	mov    %esp,%ebp
    3a14:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3a17:	8b 45 08             	mov    0x8(%ebp),%eax
    3a1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3a1d:	90                   	nop
    3a1e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a21:	0f b6 10             	movzbl (%eax),%edx
    3a24:	8b 45 08             	mov    0x8(%ebp),%eax
    3a27:	88 10                	mov    %dl,(%eax)
    3a29:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2c:	0f b6 00             	movzbl (%eax),%eax
    3a2f:	84 c0                	test   %al,%al
    3a31:	0f 95 c0             	setne  %al
    3a34:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a38:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    3a3c:	84 c0                	test   %al,%al
    3a3e:	75 de                	jne    3a1e <strcpy+0xd>
    ;
  return os;
    3a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a43:	c9                   	leave  
    3a44:	c3                   	ret    

00003a45 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a45:	55                   	push   %ebp
    3a46:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a48:	eb 08                	jmp    3a52 <strcmp+0xd>
    p++, q++;
    3a4a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a4e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a52:	8b 45 08             	mov    0x8(%ebp),%eax
    3a55:	0f b6 00             	movzbl (%eax),%eax
    3a58:	84 c0                	test   %al,%al
    3a5a:	74 10                	je     3a6c <strcmp+0x27>
    3a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a5f:	0f b6 10             	movzbl (%eax),%edx
    3a62:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a65:	0f b6 00             	movzbl (%eax),%eax
    3a68:	38 c2                	cmp    %al,%dl
    3a6a:	74 de                	je     3a4a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3a6c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a6f:	0f b6 00             	movzbl (%eax),%eax
    3a72:	0f b6 d0             	movzbl %al,%edx
    3a75:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a78:	0f b6 00             	movzbl (%eax),%eax
    3a7b:	0f b6 c0             	movzbl %al,%eax
    3a7e:	89 d1                	mov    %edx,%ecx
    3a80:	29 c1                	sub    %eax,%ecx
    3a82:	89 c8                	mov    %ecx,%eax
}
    3a84:	5d                   	pop    %ebp
    3a85:	c3                   	ret    

00003a86 <strlen>:

uint
strlen(char *s)
{
    3a86:	55                   	push   %ebp
    3a87:	89 e5                	mov    %esp,%ebp
    3a89:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a8c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a93:	eb 04                	jmp    3a99 <strlen+0x13>
    3a95:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3a99:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3a9c:	03 45 08             	add    0x8(%ebp),%eax
    3a9f:	0f b6 00             	movzbl (%eax),%eax
    3aa2:	84 c0                	test   %al,%al
    3aa4:	75 ef                	jne    3a95 <strlen+0xf>
    ;
  return n;
    3aa6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3aa9:	c9                   	leave  
    3aaa:	c3                   	ret    

00003aab <memset>:

void*
memset(void *dst, int c, uint n)
{
    3aab:	55                   	push   %ebp
    3aac:	89 e5                	mov    %esp,%ebp
    3aae:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3ab1:	8b 45 10             	mov    0x10(%ebp),%eax
    3ab4:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ab8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3abb:	89 44 24 04          	mov    %eax,0x4(%esp)
    3abf:	8b 45 08             	mov    0x8(%ebp),%eax
    3ac2:	89 04 24             	mov    %eax,(%esp)
    3ac5:	e8 22 ff ff ff       	call   39ec <stosb>
  return dst;
    3aca:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3acd:	c9                   	leave  
    3ace:	c3                   	ret    

00003acf <strchr>:

char*
strchr(const char *s, char c)
{
    3acf:	55                   	push   %ebp
    3ad0:	89 e5                	mov    %esp,%ebp
    3ad2:	83 ec 04             	sub    $0x4,%esp
    3ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ad8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3adb:	eb 14                	jmp    3af1 <strchr+0x22>
    if(*s == c)
    3add:	8b 45 08             	mov    0x8(%ebp),%eax
    3ae0:	0f b6 00             	movzbl (%eax),%eax
    3ae3:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3ae6:	75 05                	jne    3aed <strchr+0x1e>
      return (char*)s;
    3ae8:	8b 45 08             	mov    0x8(%ebp),%eax
    3aeb:	eb 13                	jmp    3b00 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3aed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3af1:	8b 45 08             	mov    0x8(%ebp),%eax
    3af4:	0f b6 00             	movzbl (%eax),%eax
    3af7:	84 c0                	test   %al,%al
    3af9:	75 e2                	jne    3add <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3afb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3b00:	c9                   	leave  
    3b01:	c3                   	ret    

00003b02 <gets>:

char*
gets(char *buf, int max)
{
    3b02:	55                   	push   %ebp
    3b03:	89 e5                	mov    %esp,%ebp
    3b05:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3b0f:	eb 44                	jmp    3b55 <gets+0x53>
    cc = read(0, &c, 1);
    3b11:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3b18:	00 
    3b19:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b27:	e8 3c 01 00 00       	call   3c68 <read>
    3b2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3b2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b33:	7e 2d                	jle    3b62 <gets+0x60>
      break;
    buf[i++] = c;
    3b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b38:	03 45 08             	add    0x8(%ebp),%eax
    3b3b:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    3b3f:	88 10                	mov    %dl,(%eax)
    3b41:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(c == '\n' || c == '\r')
    3b45:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b49:	3c 0a                	cmp    $0xa,%al
    3b4b:	74 16                	je     3b63 <gets+0x61>
    3b4d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b51:	3c 0d                	cmp    $0xd,%al
    3b53:	74 0e                	je     3b63 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b58:	83 c0 01             	add    $0x1,%eax
    3b5b:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3b5e:	7c b1                	jl     3b11 <gets+0xf>
    3b60:	eb 01                	jmp    3b63 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    3b62:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b66:	03 45 08             	add    0x8(%ebp),%eax
    3b69:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3b6c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b6f:	c9                   	leave  
    3b70:	c3                   	ret    

00003b71 <stat>:

int
stat(char *n, struct stat *st)
{
    3b71:	55                   	push   %ebp
    3b72:	89 e5                	mov    %esp,%ebp
    3b74:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3b77:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3b7e:	00 
    3b7f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b82:	89 04 24             	mov    %eax,(%esp)
    3b85:	e8 06 01 00 00       	call   3c90 <open>
    3b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b8d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b91:	79 07                	jns    3b9a <stat+0x29>
    return -1;
    3b93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b98:	eb 23                	jmp    3bbd <stat+0x4c>
  r = fstat(fd, st);
    3b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b9d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ba1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ba4:	89 04 24             	mov    %eax,(%esp)
    3ba7:	e8 fc 00 00 00       	call   3ca8 <fstat>
    3bac:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bb2:	89 04 24             	mov    %eax,(%esp)
    3bb5:	e8 be 00 00 00       	call   3c78 <close>
  return r;
    3bba:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3bbd:	c9                   	leave  
    3bbe:	c3                   	ret    

00003bbf <atoi>:

int
atoi(const char *s)
{
    3bbf:	55                   	push   %ebp
    3bc0:	89 e5                	mov    %esp,%ebp
    3bc2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3bc5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3bcc:	eb 23                	jmp    3bf1 <atoi+0x32>
    n = n*10 + *s++ - '0';
    3bce:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3bd1:	89 d0                	mov    %edx,%eax
    3bd3:	c1 e0 02             	shl    $0x2,%eax
    3bd6:	01 d0                	add    %edx,%eax
    3bd8:	01 c0                	add    %eax,%eax
    3bda:	89 c2                	mov    %eax,%edx
    3bdc:	8b 45 08             	mov    0x8(%ebp),%eax
    3bdf:	0f b6 00             	movzbl (%eax),%eax
    3be2:	0f be c0             	movsbl %al,%eax
    3be5:	01 d0                	add    %edx,%eax
    3be7:	83 e8 30             	sub    $0x30,%eax
    3bea:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3bed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3bf1:	8b 45 08             	mov    0x8(%ebp),%eax
    3bf4:	0f b6 00             	movzbl (%eax),%eax
    3bf7:	3c 2f                	cmp    $0x2f,%al
    3bf9:	7e 0a                	jle    3c05 <atoi+0x46>
    3bfb:	8b 45 08             	mov    0x8(%ebp),%eax
    3bfe:	0f b6 00             	movzbl (%eax),%eax
    3c01:	3c 39                	cmp    $0x39,%al
    3c03:	7e c9                	jle    3bce <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3c05:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3c08:	c9                   	leave  
    3c09:	c3                   	ret    

00003c0a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3c0a:	55                   	push   %ebp
    3c0b:	89 e5                	mov    %esp,%ebp
    3c0d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3c10:	8b 45 08             	mov    0x8(%ebp),%eax
    3c13:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3c16:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c19:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3c1c:	eb 13                	jmp    3c31 <memmove+0x27>
    *dst++ = *src++;
    3c1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3c21:	0f b6 10             	movzbl (%eax),%edx
    3c24:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3c27:	88 10                	mov    %dl,(%eax)
    3c29:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3c2d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c31:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    3c35:	0f 9f c0             	setg   %al
    3c38:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    3c3c:	84 c0                	test   %al,%al
    3c3e:	75 de                	jne    3c1e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3c40:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3c43:	c9                   	leave  
    3c44:	c3                   	ret    
    3c45:	90                   	nop
    3c46:	90                   	nop
    3c47:	90                   	nop

00003c48 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c48:	b8 01 00 00 00       	mov    $0x1,%eax
    3c4d:	cd 40                	int    $0x40
    3c4f:	c3                   	ret    

00003c50 <exit>:
SYSCALL(exit)
    3c50:	b8 02 00 00 00       	mov    $0x2,%eax
    3c55:	cd 40                	int    $0x40
    3c57:	c3                   	ret    

00003c58 <wait>:
SYSCALL(wait)
    3c58:	b8 03 00 00 00       	mov    $0x3,%eax
    3c5d:	cd 40                	int    $0x40
    3c5f:	c3                   	ret    

00003c60 <pipe>:
SYSCALL(pipe)
    3c60:	b8 04 00 00 00       	mov    $0x4,%eax
    3c65:	cd 40                	int    $0x40
    3c67:	c3                   	ret    

00003c68 <read>:
SYSCALL(read)
    3c68:	b8 05 00 00 00       	mov    $0x5,%eax
    3c6d:	cd 40                	int    $0x40
    3c6f:	c3                   	ret    

00003c70 <write>:
SYSCALL(write)
    3c70:	b8 10 00 00 00       	mov    $0x10,%eax
    3c75:	cd 40                	int    $0x40
    3c77:	c3                   	ret    

00003c78 <close>:
SYSCALL(close)
    3c78:	b8 15 00 00 00       	mov    $0x15,%eax
    3c7d:	cd 40                	int    $0x40
    3c7f:	c3                   	ret    

00003c80 <kill>:
SYSCALL(kill)
    3c80:	b8 06 00 00 00       	mov    $0x6,%eax
    3c85:	cd 40                	int    $0x40
    3c87:	c3                   	ret    

00003c88 <exec>:
SYSCALL(exec)
    3c88:	b8 07 00 00 00       	mov    $0x7,%eax
    3c8d:	cd 40                	int    $0x40
    3c8f:	c3                   	ret    

00003c90 <open>:
SYSCALL(open)
    3c90:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c95:	cd 40                	int    $0x40
    3c97:	c3                   	ret    

00003c98 <mknod>:
SYSCALL(mknod)
    3c98:	b8 11 00 00 00       	mov    $0x11,%eax
    3c9d:	cd 40                	int    $0x40
    3c9f:	c3                   	ret    

00003ca0 <unlink>:
SYSCALL(unlink)
    3ca0:	b8 12 00 00 00       	mov    $0x12,%eax
    3ca5:	cd 40                	int    $0x40
    3ca7:	c3                   	ret    

00003ca8 <fstat>:
SYSCALL(fstat)
    3ca8:	b8 08 00 00 00       	mov    $0x8,%eax
    3cad:	cd 40                	int    $0x40
    3caf:	c3                   	ret    

00003cb0 <link>:
SYSCALL(link)
    3cb0:	b8 13 00 00 00       	mov    $0x13,%eax
    3cb5:	cd 40                	int    $0x40
    3cb7:	c3                   	ret    

00003cb8 <mkdir>:
SYSCALL(mkdir)
    3cb8:	b8 14 00 00 00       	mov    $0x14,%eax
    3cbd:	cd 40                	int    $0x40
    3cbf:	c3                   	ret    

00003cc0 <chdir>:
SYSCALL(chdir)
    3cc0:	b8 09 00 00 00       	mov    $0x9,%eax
    3cc5:	cd 40                	int    $0x40
    3cc7:	c3                   	ret    

00003cc8 <dup>:
SYSCALL(dup)
    3cc8:	b8 0a 00 00 00       	mov    $0xa,%eax
    3ccd:	cd 40                	int    $0x40
    3ccf:	c3                   	ret    

00003cd0 <getpid>:
SYSCALL(getpid)
    3cd0:	b8 0b 00 00 00       	mov    $0xb,%eax
    3cd5:	cd 40                	int    $0x40
    3cd7:	c3                   	ret    

00003cd8 <sbrk>:
SYSCALL(sbrk)
    3cd8:	b8 0c 00 00 00       	mov    $0xc,%eax
    3cdd:	cd 40                	int    $0x40
    3cdf:	c3                   	ret    

00003ce0 <sleep>:
SYSCALL(sleep)
    3ce0:	b8 0d 00 00 00       	mov    $0xd,%eax
    3ce5:	cd 40                	int    $0x40
    3ce7:	c3                   	ret    

00003ce8 <uptime>:
SYSCALL(uptime)
    3ce8:	b8 0e 00 00 00       	mov    $0xe,%eax
    3ced:	cd 40                	int    $0x40
    3cef:	c3                   	ret    

00003cf0 <getMsg>:
SYSCALL(getMsg)
    3cf0:	b8 16 00 00 00       	mov    $0x16,%eax
    3cf5:	cd 40                	int    $0x40
    3cf7:	c3                   	ret    

00003cf8 <createWindow>:
SYSCALL(createWindow)
    3cf8:	b8 17 00 00 00       	mov    $0x17,%eax
    3cfd:	cd 40                	int    $0x40
    3cff:	c3                   	ret    

00003d00 <destroyWindow>:
SYSCALL(destroyWindow)
    3d00:	b8 18 00 00 00       	mov    $0x18,%eax
    3d05:	cd 40                	int    $0x40
    3d07:	c3                   	ret    

00003d08 <updateWindow>:
SYSCALL(updateWindow)
    3d08:	b8 19 00 00 00       	mov    $0x19,%eax
    3d0d:	cd 40                	int    $0x40
    3d0f:	c3                   	ret    

00003d10 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3d10:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3d15:	cd 40                	int    $0x40
    3d17:	c3                   	ret    

00003d18 <kwrite>:
SYSCALL(kwrite)
    3d18:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3d1d:	cd 40                	int    $0x40
    3d1f:	c3                   	ret    

00003d20 <setSampleRate>:
SYSCALL(setSampleRate)
    3d20:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3d25:	cd 40                	int    $0x40
    3d27:	c3                   	ret    

00003d28 <pause>:
SYSCALL(pause)
    3d28:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3d2d:	cd 40                	int    $0x40
    3d2f:	c3                   	ret    

00003d30 <wavdecode>:
SYSCALL(wavdecode)
    3d30:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3d35:	cd 40                	int    $0x40
    3d37:	c3                   	ret    

00003d38 <beginDecode>:
SYSCALL(beginDecode)
    3d38:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3d3d:	cd 40                	int    $0x40
    3d3f:	c3                   	ret    

00003d40 <waitForDecode>:
SYSCALL(waitForDecode)
    3d40:	b8 20 00 00 00       	mov    $0x20,%eax
    3d45:	cd 40                	int    $0x40
    3d47:	c3                   	ret    

00003d48 <endDecode>:
SYSCALL(endDecode)
    3d48:	b8 21 00 00 00       	mov    $0x21,%eax
    3d4d:	cd 40                	int    $0x40
    3d4f:	c3                   	ret    

00003d50 <getCoreBuf>:
    3d50:	b8 22 00 00 00       	mov    $0x22,%eax
    3d55:	cd 40                	int    $0x40
    3d57:	c3                   	ret    

00003d58 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3d58:	55                   	push   %ebp
    3d59:	89 e5                	mov    %esp,%ebp
    3d5b:	83 ec 28             	sub    $0x28,%esp
    3d5e:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d61:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3d64:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3d6b:	00 
    3d6c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3d6f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d73:	8b 45 08             	mov    0x8(%ebp),%eax
    3d76:	89 04 24             	mov    %eax,(%esp)
    3d79:	e8 f2 fe ff ff       	call   3c70 <write>
}
    3d7e:	c9                   	leave  
    3d7f:	c3                   	ret    

00003d80 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3d80:	55                   	push   %ebp
    3d81:	89 e5                	mov    %esp,%ebp
    3d83:	83 ec 48             	sub    $0x48,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3d86:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3d8d:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3d91:	74 17                	je     3daa <printint+0x2a>
    3d93:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3d97:	79 11                	jns    3daa <printint+0x2a>
    neg = 1;
    3d99:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3da0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3da3:	f7 d8                	neg    %eax
    3da5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3da8:	eb 06                	jmp    3db0 <printint+0x30>
  } else {
    x = xx;
    3daa:	8b 45 0c             	mov    0xc(%ebp),%eax
    3dad:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3db0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3db7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3dba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3dbd:	ba 00 00 00 00       	mov    $0x0,%edx
    3dc2:	f7 f1                	div    %ecx
    3dc4:	89 d0                	mov    %edx,%eax
    3dc6:	0f b6 90 60 a5 00 00 	movzbl 0xa560(%eax),%edx
    3dcd:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3dd0:	03 45 f4             	add    -0xc(%ebp),%eax
    3dd3:	88 10                	mov    %dl,(%eax)
    3dd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }while((x /= base) != 0);
    3dd9:	8b 55 10             	mov    0x10(%ebp),%edx
    3ddc:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    3ddf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3de2:	ba 00 00 00 00       	mov    $0x0,%edx
    3de7:	f7 75 d4             	divl   -0x2c(%ebp)
    3dea:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3ded:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3df1:	75 c4                	jne    3db7 <printint+0x37>
  if(neg)
    3df3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3df7:	74 2a                	je     3e23 <printint+0xa3>
    buf[i++] = '-';
    3df9:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3dfc:	03 45 f4             	add    -0xc(%ebp),%eax
    3dff:	c6 00 2d             	movb   $0x2d,(%eax)
    3e02:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  while(--i >= 0)
    3e06:	eb 1b                	jmp    3e23 <printint+0xa3>
    putc(fd, buf[i]);
    3e08:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3e0b:	03 45 f4             	add    -0xc(%ebp),%eax
    3e0e:	0f b6 00             	movzbl (%eax),%eax
    3e11:	0f be c0             	movsbl %al,%eax
    3e14:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e18:	8b 45 08             	mov    0x8(%ebp),%eax
    3e1b:	89 04 24             	mov    %eax,(%esp)
    3e1e:	e8 35 ff ff ff       	call   3d58 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3e23:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3e27:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e2b:	79 db                	jns    3e08 <printint+0x88>
    putc(fd, buf[i]);
}
    3e2d:	c9                   	leave  
    3e2e:	c3                   	ret    

00003e2f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3e2f:	55                   	push   %ebp
    3e30:	89 e5                	mov    %esp,%ebp
    3e32:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3e35:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3e3c:	8d 45 0c             	lea    0xc(%ebp),%eax
    3e3f:	83 c0 04             	add    $0x4,%eax
    3e42:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3e45:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3e4c:	e9 7d 01 00 00       	jmp    3fce <printf+0x19f>
    c = fmt[i] & 0xff;
    3e51:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e54:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e57:	01 d0                	add    %edx,%eax
    3e59:	0f b6 00             	movzbl (%eax),%eax
    3e5c:	0f be c0             	movsbl %al,%eax
    3e5f:	25 ff 00 00 00       	and    $0xff,%eax
    3e64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3e67:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3e6b:	75 2c                	jne    3e99 <printf+0x6a>
      if(c == '%'){
    3e6d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3e71:	75 0c                	jne    3e7f <printf+0x50>
        state = '%';
    3e73:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3e7a:	e9 4b 01 00 00       	jmp    3fca <printf+0x19b>
      } else {
        putc(fd, c);
    3e7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e82:	0f be c0             	movsbl %al,%eax
    3e85:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e89:	8b 45 08             	mov    0x8(%ebp),%eax
    3e8c:	89 04 24             	mov    %eax,(%esp)
    3e8f:	e8 c4 fe ff ff       	call   3d58 <putc>
    3e94:	e9 31 01 00 00       	jmp    3fca <printf+0x19b>
      }
    } else if(state == '%'){
    3e99:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3e9d:	0f 85 27 01 00 00    	jne    3fca <printf+0x19b>
      if(c == 'd'){
    3ea3:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3ea7:	75 2d                	jne    3ed6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    3ea9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3eac:	8b 00                	mov    (%eax),%eax
    3eae:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3eb5:	00 
    3eb6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3ebd:	00 
    3ebe:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ec2:	8b 45 08             	mov    0x8(%ebp),%eax
    3ec5:	89 04 24             	mov    %eax,(%esp)
    3ec8:	e8 b3 fe ff ff       	call   3d80 <printint>
        ap++;
    3ecd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3ed1:	e9 ed 00 00 00       	jmp    3fc3 <printf+0x194>
      } else if(c == 'x' || c == 'p'){
    3ed6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3eda:	74 06                	je     3ee2 <printf+0xb3>
    3edc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3ee0:	75 2d                	jne    3f0f <printf+0xe0>
        printint(fd, *ap, 16, 0);
    3ee2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ee5:	8b 00                	mov    (%eax),%eax
    3ee7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3eee:	00 
    3eef:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    3ef6:	00 
    3ef7:	89 44 24 04          	mov    %eax,0x4(%esp)
    3efb:	8b 45 08             	mov    0x8(%ebp),%eax
    3efe:	89 04 24             	mov    %eax,(%esp)
    3f01:	e8 7a fe ff ff       	call   3d80 <printint>
        ap++;
    3f06:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f0a:	e9 b4 00 00 00       	jmp    3fc3 <printf+0x194>
      } else if(c == 's'){
    3f0f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3f13:	75 46                	jne    3f5b <printf+0x12c>
        s = (char*)*ap;
    3f15:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f18:	8b 00                	mov    (%eax),%eax
    3f1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3f1d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3f21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f25:	75 27                	jne    3f4e <printf+0x11f>
          s = "(null)";
    3f27:	c7 45 f4 ea 8d 00 00 	movl   $0x8dea,-0xc(%ebp)
        while(*s != 0){
    3f2e:	eb 1e                	jmp    3f4e <printf+0x11f>
          putc(fd, *s);
    3f30:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f33:	0f b6 00             	movzbl (%eax),%eax
    3f36:	0f be c0             	movsbl %al,%eax
    3f39:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f3d:	8b 45 08             	mov    0x8(%ebp),%eax
    3f40:	89 04 24             	mov    %eax,(%esp)
    3f43:	e8 10 fe ff ff       	call   3d58 <putc>
          s++;
    3f48:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3f4c:	eb 01                	jmp    3f4f <printf+0x120>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3f4e:	90                   	nop
    3f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f52:	0f b6 00             	movzbl (%eax),%eax
    3f55:	84 c0                	test   %al,%al
    3f57:	75 d7                	jne    3f30 <printf+0x101>
    3f59:	eb 68                	jmp    3fc3 <printf+0x194>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3f5b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3f5f:	75 1d                	jne    3f7e <printf+0x14f>
        putc(fd, *ap);
    3f61:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f64:	8b 00                	mov    (%eax),%eax
    3f66:	0f be c0             	movsbl %al,%eax
    3f69:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f6d:	8b 45 08             	mov    0x8(%ebp),%eax
    3f70:	89 04 24             	mov    %eax,(%esp)
    3f73:	e8 e0 fd ff ff       	call   3d58 <putc>
        ap++;
    3f78:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f7c:	eb 45                	jmp    3fc3 <printf+0x194>
      } else if(c == '%'){
    3f7e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3f82:	75 17                	jne    3f9b <printf+0x16c>
        putc(fd, c);
    3f84:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f87:	0f be c0             	movsbl %al,%eax
    3f8a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f91:	89 04 24             	mov    %eax,(%esp)
    3f94:	e8 bf fd ff ff       	call   3d58 <putc>
    3f99:	eb 28                	jmp    3fc3 <printf+0x194>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3f9b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    3fa2:	00 
    3fa3:	8b 45 08             	mov    0x8(%ebp),%eax
    3fa6:	89 04 24             	mov    %eax,(%esp)
    3fa9:	e8 aa fd ff ff       	call   3d58 <putc>
        putc(fd, c);
    3fae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3fb1:	0f be c0             	movsbl %al,%eax
    3fb4:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    3fbb:	89 04 24             	mov    %eax,(%esp)
    3fbe:	e8 95 fd ff ff       	call   3d58 <putc>
      }
      state = 0;
    3fc3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3fca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3fce:	8b 55 0c             	mov    0xc(%ebp),%edx
    3fd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3fd4:	01 d0                	add    %edx,%eax
    3fd6:	0f b6 00             	movzbl (%eax),%eax
    3fd9:	84 c0                	test   %al,%al
    3fdb:	0f 85 70 fe ff ff    	jne    3e51 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3fe1:	c9                   	leave  
    3fe2:	c3                   	ret    
    3fe3:	90                   	nop

00003fe4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3fe4:	55                   	push   %ebp
    3fe5:	89 e5                	mov    %esp,%ebp
    3fe7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3fea:	8b 45 08             	mov    0x8(%ebp),%eax
    3fed:	83 e8 08             	sub    $0x8,%eax
    3ff0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3ff3:	a1 50 d6 00 00       	mov    0xd650,%eax
    3ff8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3ffb:	eb 24                	jmp    4021 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3ffd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4000:	8b 00                	mov    (%eax),%eax
    4002:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4005:	77 12                	ja     4019 <free+0x35>
    4007:	8b 45 f8             	mov    -0x8(%ebp),%eax
    400a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    400d:	77 24                	ja     4033 <free+0x4f>
    400f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4012:	8b 00                	mov    (%eax),%eax
    4014:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4017:	77 1a                	ja     4033 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4019:	8b 45 fc             	mov    -0x4(%ebp),%eax
    401c:	8b 00                	mov    (%eax),%eax
    401e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4021:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4024:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4027:	76 d4                	jbe    3ffd <free+0x19>
    4029:	8b 45 fc             	mov    -0x4(%ebp),%eax
    402c:	8b 00                	mov    (%eax),%eax
    402e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4031:	76 ca                	jbe    3ffd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4033:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4036:	8b 40 04             	mov    0x4(%eax),%eax
    4039:	c1 e0 03             	shl    $0x3,%eax
    403c:	89 c2                	mov    %eax,%edx
    403e:	03 55 f8             	add    -0x8(%ebp),%edx
    4041:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4044:	8b 00                	mov    (%eax),%eax
    4046:	39 c2                	cmp    %eax,%edx
    4048:	75 24                	jne    406e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    404a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    404d:	8b 50 04             	mov    0x4(%eax),%edx
    4050:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4053:	8b 00                	mov    (%eax),%eax
    4055:	8b 40 04             	mov    0x4(%eax),%eax
    4058:	01 c2                	add    %eax,%edx
    405a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    405d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4060:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4063:	8b 00                	mov    (%eax),%eax
    4065:	8b 10                	mov    (%eax),%edx
    4067:	8b 45 f8             	mov    -0x8(%ebp),%eax
    406a:	89 10                	mov    %edx,(%eax)
    406c:	eb 0a                	jmp    4078 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    406e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4071:	8b 10                	mov    (%eax),%edx
    4073:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4076:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4078:	8b 45 fc             	mov    -0x4(%ebp),%eax
    407b:	8b 40 04             	mov    0x4(%eax),%eax
    407e:	c1 e0 03             	shl    $0x3,%eax
    4081:	03 45 fc             	add    -0x4(%ebp),%eax
    4084:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4087:	75 20                	jne    40a9 <free+0xc5>
    p->s.size += bp->s.size;
    4089:	8b 45 fc             	mov    -0x4(%ebp),%eax
    408c:	8b 50 04             	mov    0x4(%eax),%edx
    408f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4092:	8b 40 04             	mov    0x4(%eax),%eax
    4095:	01 c2                	add    %eax,%edx
    4097:	8b 45 fc             	mov    -0x4(%ebp),%eax
    409a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    409d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40a0:	8b 10                	mov    (%eax),%edx
    40a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40a5:	89 10                	mov    %edx,(%eax)
    40a7:	eb 08                	jmp    40b1 <free+0xcd>
  } else
    p->s.ptr = bp;
    40a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
    40af:	89 10                	mov    %edx,(%eax)
  freep = p;
    40b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40b4:	a3 50 d6 00 00       	mov    %eax,0xd650
}
    40b9:	c9                   	leave  
    40ba:	c3                   	ret    

000040bb <morecore>:

static Header*
morecore(uint nu)
{
    40bb:	55                   	push   %ebp
    40bc:	89 e5                	mov    %esp,%ebp
    40be:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    40c1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    40c8:	77 07                	ja     40d1 <morecore+0x16>
    nu = 4096;
    40ca:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    40d1:	8b 45 08             	mov    0x8(%ebp),%eax
    40d4:	c1 e0 03             	shl    $0x3,%eax
    40d7:	89 04 24             	mov    %eax,(%esp)
    40da:	e8 f9 fb ff ff       	call   3cd8 <sbrk>
    40df:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    40e2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    40e6:	75 07                	jne    40ef <morecore+0x34>
    return 0;
    40e8:	b8 00 00 00 00       	mov    $0x0,%eax
    40ed:	eb 22                	jmp    4111 <morecore+0x56>
  hp = (Header*)p;
    40ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    40f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40f8:	8b 55 08             	mov    0x8(%ebp),%edx
    40fb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    40fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4101:	83 c0 08             	add    $0x8,%eax
    4104:	89 04 24             	mov    %eax,(%esp)
    4107:	e8 d8 fe ff ff       	call   3fe4 <free>
  return freep;
    410c:	a1 50 d6 00 00       	mov    0xd650,%eax
}
    4111:	c9                   	leave  
    4112:	c3                   	ret    

00004113 <malloc>:

void*
malloc(uint nbytes)
{
    4113:	55                   	push   %ebp
    4114:	89 e5                	mov    %esp,%ebp
    4116:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4119:	8b 45 08             	mov    0x8(%ebp),%eax
    411c:	83 c0 07             	add    $0x7,%eax
    411f:	c1 e8 03             	shr    $0x3,%eax
    4122:	83 c0 01             	add    $0x1,%eax
    4125:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4128:	a1 50 d6 00 00       	mov    0xd650,%eax
    412d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4130:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4134:	75 23                	jne    4159 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4136:	c7 45 f0 48 d6 00 00 	movl   $0xd648,-0x10(%ebp)
    413d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4140:	a3 50 d6 00 00       	mov    %eax,0xd650
    4145:	a1 50 d6 00 00       	mov    0xd650,%eax
    414a:	a3 48 d6 00 00       	mov    %eax,0xd648
    base.s.size = 0;
    414f:	c7 05 4c d6 00 00 00 	movl   $0x0,0xd64c
    4156:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4159:	8b 45 f0             	mov    -0x10(%ebp),%eax
    415c:	8b 00                	mov    (%eax),%eax
    415e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4161:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4164:	8b 40 04             	mov    0x4(%eax),%eax
    4167:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    416a:	72 4d                	jb     41b9 <malloc+0xa6>
      if(p->s.size == nunits)
    416c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    416f:	8b 40 04             	mov    0x4(%eax),%eax
    4172:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4175:	75 0c                	jne    4183 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4177:	8b 45 f4             	mov    -0xc(%ebp),%eax
    417a:	8b 10                	mov    (%eax),%edx
    417c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    417f:	89 10                	mov    %edx,(%eax)
    4181:	eb 26                	jmp    41a9 <malloc+0x96>
      else {
        p->s.size -= nunits;
    4183:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4186:	8b 40 04             	mov    0x4(%eax),%eax
    4189:	89 c2                	mov    %eax,%edx
    418b:	2b 55 ec             	sub    -0x14(%ebp),%edx
    418e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4191:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4194:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4197:	8b 40 04             	mov    0x4(%eax),%eax
    419a:	c1 e0 03             	shl    $0x3,%eax
    419d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    41a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    41a6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    41a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41ac:	a3 50 d6 00 00       	mov    %eax,0xd650
      return (void*)(p + 1);
    41b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41b4:	83 c0 08             	add    $0x8,%eax
    41b7:	eb 38                	jmp    41f1 <malloc+0xde>
    }
    if(p == freep)
    41b9:	a1 50 d6 00 00       	mov    0xd650,%eax
    41be:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    41c1:	75 1b                	jne    41de <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    41c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    41c6:	89 04 24             	mov    %eax,(%esp)
    41c9:	e8 ed fe ff ff       	call   40bb <morecore>
    41ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
    41d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    41d5:	75 07                	jne    41de <malloc+0xcb>
        return 0;
    41d7:	b8 00 00 00 00       	mov    $0x0,%eax
    41dc:	eb 13                	jmp    41f1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    41de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    41e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41e7:	8b 00                	mov    (%eax),%eax
    41e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    41ec:	e9 70 ff ff ff       	jmp    4161 <malloc+0x4e>
}
    41f1:	c9                   	leave  
    41f2:	c3                   	ret    
    41f3:	90                   	nop

000041f4 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    41f4:	55                   	push   %ebp
    41f5:	89 e5                	mov    %esp,%ebp
	return (x>= 0 ? x : -x);
    41f7:	8b 45 08             	mov    0x8(%ebp),%eax
    41fa:	89 c2                	mov    %eax,%edx
    41fc:	c1 fa 1f             	sar    $0x1f,%edx
    41ff:	89 d0                	mov    %edx,%eax
    4201:	33 45 08             	xor    0x8(%ebp),%eax
    4204:	29 d0                	sub    %edx,%eax
}
    4206:	5d                   	pop    %ebp
    4207:	c3                   	ret    

00004208 <sin>:

double sin(double x)  
{  
    4208:	55                   	push   %ebp
    4209:	89 e5                	mov    %esp,%ebp
    420b:	83 ec 18             	sub    $0x18,%esp
    420e:	8b 45 08             	mov    0x8(%ebp),%eax
    4211:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4214:	8b 45 0c             	mov    0xc(%ebp),%eax
    4217:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   __asm__ (
    421a:	dd 45 f8             	fldl   -0x8(%ebp)
    421d:	dd 5d e8             	fstpl  -0x18(%ebp)
    4220:	dd 45 e8             	fldl   -0x18(%ebp)
    4223:	d9 fe                	fsin   
    4225:	dd 5d e8             	fstpl  -0x18(%ebp)
    4228:	dd 45 e8             	fldl   -0x18(%ebp)
    422b:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fsin"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
    422e:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    4231:	c9                   	leave  
    4232:	c3                   	ret    

00004233 <cos>:

double cos(double x)  
{  
    4233:	55                   	push   %ebp
    4234:	89 e5                	mov    %esp,%ebp
    4236:	83 ec 18             	sub    $0x18,%esp
    4239:	8b 45 08             	mov    0x8(%ebp),%eax
    423c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    423f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4242:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    4245:	dd 45 f8             	fldl   -0x8(%ebp)
    4248:	dd 5d e8             	fstpl  -0x18(%ebp)
    424b:	dd 45 e8             	fldl   -0x18(%ebp)
    424e:	d9 ff                	fcos   
    4250:	dd 5d e8             	fstpl  -0x18(%ebp)
    4253:	dd 45 e8             	fldl   -0x18(%ebp)
    4256:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fcos"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;  
    4259:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    425c:	c9                   	leave  
    425d:	c3                   	ret    

0000425e <tan>:

double tan(double x)  
{  
    425e:	55                   	push   %ebp
    425f:	89 e5                	mov    %esp,%ebp
    4261:	83 ec 20             	sub    $0x20,%esp
    4264:	8b 45 08             	mov    0x8(%ebp),%eax
    4267:	89 45 f8             	mov    %eax,-0x8(%ebp)
    426a:	8b 45 0c             	mov    0xc(%ebp),%eax
    426d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   register double value;
   __asm__(
    4270:	dd 45 f8             	fldl   -0x8(%ebp)
    4273:	dd 5d e8             	fstpl  -0x18(%ebp)
    4276:	dd 45 e8             	fldl   -0x18(%ebp)
    4279:	d9 f2                	fptan  
    427b:	dd d8                	fstp   %st(0)
    427d:	dd 5d e0             	fstpl  -0x20(%ebp)
    4280:	dd 45 e0             	fldl   -0x20(%ebp)
    4283:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fptan"
      : "=t" (value),
      "=u" (ret)
      : "0" (x)
   );
   return ret;
    4286:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    4289:	c9                   	leave  
    428a:	c3                   	ret    

0000428b <log2>:

double log2(double x)
{
    428b:	55                   	push   %ebp
    428c:	89 e5                	mov    %esp,%ebp
    428e:	83 ec 18             	sub    $0x18,%esp
    4291:	8b 45 08             	mov    0x8(%ebp),%eax
    4294:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4297:	8b 45 0c             	mov    0xc(%ebp),%eax
    429a:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   __asm__(
    429d:	dd 45 f8             	fldl   -0x8(%ebp)
    42a0:	dd 5d e8             	fstpl  -0x18(%ebp)
    42a3:	dd 45 e8             	fldl   -0x18(%ebp)
    42a6:	d9 e8                	fld1   
    42a8:	d9 c9                	fxch   %st(1)
    42aa:	d9 f1                	fyl2x  
    42ac:	dd 5d e8             	fstpl  -0x18(%ebp)
    42af:	dd 45 e8             	fldl   -0x18(%ebp)
    42b2:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fxch\n\t"
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
    42b5:	dd 45 f0             	fldl   -0x10(%ebp)
}
    42b8:	c9                   	leave  
    42b9:	c3                   	ret    

000042ba <pow>:

double pow(double x, double y)
{
    42ba:	55                   	push   %ebp
    42bb:	89 e5                	mov    %esp,%ebp
    42bd:	83 ec 58             	sub    $0x58,%esp
    42c0:	8b 45 08             	mov    0x8(%ebp),%eax
    42c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    42c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    42c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    42cc:	8b 45 10             	mov    0x10(%ebp),%eax
    42cf:	89 45 e0             	mov    %eax,-0x20(%ebp)
    42d2:	8b 45 14             	mov    0x14(%ebp),%eax
    42d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   register double ret, value;
   double r = 1.0;
    42d8:	d9 e8                	fld1   
    42da:	dd 5d f8             	fstpl  -0x8(%ebp)
   long p = (long) y;
    42dd:	dd 45 e0             	fldl   -0x20(%ebp)
    42e0:	d9 7d de             	fnstcw -0x22(%ebp)
    42e3:	0f b7 45 de          	movzwl -0x22(%ebp),%eax
    42e7:	b4 0c                	mov    $0xc,%ah
    42e9:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
    42ed:	d9 6d dc             	fldcw  -0x24(%ebp)
    42f0:	db 5d f4             	fistpl -0xc(%ebp)
    42f3:	d9 6d de             	fldcw  -0x22(%ebp)
   if (x == 0.0 && y > 0.0)
    42f6:	dd 45 e8             	fldl   -0x18(%ebp)
    42f9:	d9 ee                	fldz   
    42fb:	df e9                	fucomip %st(1),%st
    42fd:	dd d8                	fstp   %st(0)
    42ff:	7a 24                	jp     4325 <pow+0x6b>
    4301:	dd 45 e8             	fldl   -0x18(%ebp)
    4304:	d9 ee                	fldz   
    4306:	df e9                	fucomip %st(1),%st
    4308:	dd d8                	fstp   %st(0)
    430a:	75 19                	jne    4325 <pow+0x6b>
    430c:	dd 45 e0             	fldl   -0x20(%ebp)
    430f:	d9 ee                	fldz   
    4311:	d9 c9                	fxch   %st(1)
    4313:	df e9                	fucomip %st(1),%st
    4315:	dd d8                	fstp   %st(0)
    4317:	0f 97 c0             	seta   %al
    431a:	84 c0                	test   %al,%al
    431c:	74 07                	je     4325 <pow+0x6b>
      return 0.0;
    431e:	d9 ee                	fldz   
    4320:	e9 c5 00 00 00       	jmp    43ea <pow+0x130>
   if (y == (double) p)
    4325:	db 45 f4             	fildl  -0xc(%ebp)
    4328:	dd 45 e0             	fldl   -0x20(%ebp)
    432b:	df e9                	fucomip %st(1),%st
    432d:	7a 53                	jp     4382 <pow+0xc8>
    432f:	dd 45 e0             	fldl   -0x20(%ebp)
    4332:	df e9                	fucomip %st(1),%st
    4334:	dd d8                	fstp   %st(0)
    4336:	75 4c                	jne    4384 <pow+0xca>
   {
      if (p == 0)
    4338:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    433c:	75 07                	jne    4345 <pow+0x8b>
        return 1.0;
    433e:	d9 e8                	fld1   
    4340:	e9 a5 00 00 00       	jmp    43ea <pow+0x130>
      if (p < 0)
    4345:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4349:	79 0b                	jns    4356 <pow+0x9c>
      {
        p = -p;
    434b:	f7 5d f4             	negl   -0xc(%ebp)
        x = 1.0 / x;
    434e:	d9 e8                	fld1   
    4350:	dc 75 e8             	fdivl  -0x18(%ebp)
    4353:	dd 5d e8             	fstpl  -0x18(%ebp)
      }
      while (1)
      {
        if (p & 1)
    4356:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4359:	83 e0 01             	and    $0x1,%eax
    435c:	84 c0                	test   %al,%al
    435e:	74 09                	je     4369 <pow+0xaf>
           r *= x;
    4360:	dd 45 f8             	fldl   -0x8(%ebp)
    4363:	dc 4d e8             	fmull  -0x18(%ebp)
    4366:	dd 5d f8             	fstpl  -0x8(%ebp)
        p >>= 1;
    4369:	d1 7d f4             	sarl   -0xc(%ebp)
        if (p == 0)
    436c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4370:	75 05                	jne    4377 <pow+0xbd>
           return r;
    4372:	dd 45 f8             	fldl   -0x8(%ebp)
    4375:	eb 73                	jmp    43ea <pow+0x130>
        x *= x;
    4377:	dd 45 e8             	fldl   -0x18(%ebp)
    437a:	dc 4d e8             	fmull  -0x18(%ebp)
    437d:	dd 5d e8             	fstpl  -0x18(%ebp)
      }
    4380:	eb d4                	jmp    4356 <pow+0x9c>
    4382:	dd d8                	fstp   %st(0)
      "frndint;\n\t"
      "fxch;\n\t"
      "fsub %%st(1);\n\t"
      "f2xm1;\n\t"
      : "=t" (ret), "=u" (value)
      :  "0" (log2 (x)), "1" (y)
    4384:	dd 45 e8             	fldl   -0x18(%ebp)
    4387:	dd 1c 24             	fstpl  (%esp)
    438a:	e8 fc fe ff ff       	call   428b <log2>
        if (p == 0)
           return r;
        x *= x;
      }
   }
   __asm__(
    438f:	dd 45 e0             	fldl   -0x20(%ebp)
    4392:	d9 c9                	fxch   %st(1)
    4394:	dd 5d c0             	fstpl  -0x40(%ebp)
    4397:	dd 5d b8             	fstpl  -0x48(%ebp)
    439a:	dd 45 c0             	fldl   -0x40(%ebp)
    439d:	dd 45 b8             	fldl   -0x48(%ebp)
    43a0:	d9 c9                	fxch   %st(1)
    43a2:	d8 c9                	fmul   %st(1),%st
    43a4:	dd d1                	fst    %st(1)
    43a6:	d9 fc                	frndint 
    43a8:	d9 c9                	fxch   %st(1)
    43aa:	d8 e1                	fsub   %st(1),%st
    43ac:	d9 f0                	f2xm1  
    43ae:	d9 c9                	fxch   %st(1)
    43b0:	dd 5d b8             	fstpl  -0x48(%ebp)
    43b3:	dd 5d c0             	fstpl  -0x40(%ebp)
    43b6:	dd 45 c0             	fldl   -0x40(%ebp)
    43b9:	dd 5d d0             	fstpl  -0x30(%ebp)
    43bc:	dd 45 b8             	fldl   -0x48(%ebp)
    43bf:	dd 5d c8             	fstpl  -0x38(%ebp)
      "fsub %%st(1);\n\t"
      "f2xm1;\n\t"
      : "=t" (ret), "=u" (value)
      :  "0" (log2 (x)), "1" (y)
   );
   ret += 1.0;
    43c2:	d9 e8                	fld1   
    43c4:	dd 45 d0             	fldl   -0x30(%ebp)
    43c7:	de c1                	faddp  %st,%st(1)
    43c9:	dd 5d d0             	fstpl  -0x30(%ebp)
   __asm__(
    43cc:	dd 45 d0             	fldl   -0x30(%ebp)
    43cf:	dd 5d b0             	fstpl  -0x50(%ebp)
    43d2:	dd 45 b0             	fldl   -0x50(%ebp)
    43d5:	dd 45 c8             	fldl   -0x38(%ebp)
    43d8:	d9 c9                	fxch   %st(1)
    43da:	d9 fd                	fscale 
    43dc:	dd d9                	fstp   %st(1)
    43de:	dd 5d b0             	fstpl  -0x50(%ebp)
    43e1:	dd 45 b0             	fldl   -0x50(%ebp)
    43e4:	dd 5d d0             	fstpl  -0x30(%ebp)
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
    43e7:	dd 45 d0             	fldl   -0x30(%ebp)
}
    43ea:	c9                   	leave  
    43eb:	c3                   	ret    

000043ec <sqrt>:
// 求根
double sqrt(double x)
{
    43ec:	55                   	push   %ebp
    43ed:	89 e5                	mov    %esp,%ebp
    43ef:	83 ec 18             	sub    $0x18,%esp
    43f2:	8b 45 08             	mov    0x8(%ebp),%eax
    43f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    43f8:	8b 45 0c             	mov    0xc(%ebp),%eax
    43fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    43fe:	dd 45 f8             	fldl   -0x8(%ebp)
    4401:	dd 5d e8             	fstpl  -0x18(%ebp)
    4404:	dd 45 e8             	fldl   -0x18(%ebp)
    4407:	d9 fa                	fsqrt  
    4409:	dd 5d e8             	fstpl  -0x18(%ebp)
    440c:	dd 45 e8             	fldl   -0x18(%ebp)
    440f:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fsqrt"
      : "=t" (ret)
      : "0" (x)
      );
   return ret;
    4412:	dd 45 f0             	fldl   -0x10(%ebp)
}
    4415:	c9                   	leave  
    4416:	c3                   	ret    

00004417 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    4417:	55                   	push   %ebp
    4418:	89 e5                	mov    %esp,%ebp
    441a:	83 ec 18             	sub    $0x18,%esp
    441d:	8b 45 08             	mov    0x8(%ebp),%eax
    4420:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4423:	8b 45 0c             	mov    0xc(%ebp),%eax
    4426:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    4429:	dd 45 f8             	fldl   -0x8(%ebp)
    442c:	dd 5d e8             	fstpl  -0x18(%ebp)
    442f:	dd 45 e8             	fldl   -0x18(%ebp)
    4432:	d9 ed                	fldln2 
    4434:	d9 c9                	fxch   %st(1)
    4436:	d9 f1                	fyl2x  
    4438:	dd 5d e8             	fstpl  -0x18(%ebp)
    443b:	dd 45 e8             	fldl   -0x18(%ebp)
    443e:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );

   return ret;
    4441:	dd 45 f0             	fldl   -0x10(%ebp)
}
    4444:	c9                   	leave  
    4445:	c3                   	ret    

00004446 <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    4446:	55                   	push   %ebp
    4447:	89 e5                	mov    %esp,%ebp
    4449:	83 ec 30             	sub    $0x30,%esp
    444c:	8b 45 08             	mov    0x8(%ebp),%eax
    444f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4452:	8b 45 0c             	mov    0xc(%ebp),%eax
    4455:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret, value;
   __asm__(
    4458:	dd 45 f8             	fldl   -0x8(%ebp)
    445b:	dd 5d e0             	fstpl  -0x20(%ebp)
    445e:	dd 45 e0             	fldl   -0x20(%ebp)
    4461:	d9 ea                	fldl2e 
    4463:	d8 c9                	fmul   %st(1),%st
    4465:	dd d1                	fst    %st(1)
    4467:	d9 fc                	frndint 
    4469:	d9 c9                	fxch   %st(1)
    446b:	d8 e1                	fsub   %st(1),%st
    446d:	d9 f0                	f2xm1  
    446f:	d9 c9                	fxch   %st(1)
    4471:	dd 5d d8             	fstpl  -0x28(%ebp)
    4474:	dd 5d e0             	fstpl  -0x20(%ebp)
    4477:	dd 45 e0             	fldl   -0x20(%ebp)
    447a:	dd 5d f0             	fstpl  -0x10(%ebp)
    447d:	dd 45 d8             	fldl   -0x28(%ebp)
    4480:	dd 5d e8             	fstpl  -0x18(%ebp)
      "fsub %%st(1);" 
      "f2xm1"
      : "=t" (ret), "=u" (value)
      : "0" (x)
   );
   ret += 1.0;
    4483:	d9 e8                	fld1   
    4485:	dd 45 f0             	fldl   -0x10(%ebp)
    4488:	de c1                	faddp  %st,%st(1)
    448a:	dd 5d f0             	fstpl  -0x10(%ebp)
   __asm__(
    448d:	dd 45 f0             	fldl   -0x10(%ebp)
    4490:	dd 5d d0             	fstpl  -0x30(%ebp)
    4493:	dd 45 d0             	fldl   -0x30(%ebp)
    4496:	dd 45 e8             	fldl   -0x18(%ebp)
    4499:	d9 c9                	fxch   %st(1)
    449b:	d9 fd                	fscale 
    449d:	dd d9                	fstp   %st(1)
    449f:	dd 5d d0             	fstpl  -0x30(%ebp)
    44a2:	dd 45 d0             	fldl   -0x30(%ebp)
    44a5:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
    44a8:	dd 45 f0             	fldl   -0x10(%ebp)
}
    44ab:	c9                   	leave  
    44ac:	c3                   	ret    
    44ad:	90                   	nop
    44ae:	90                   	nop
    44af:	90                   	nop

000044b0 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    44b0:	55                   	push   %ebp
    44b1:	89 e5                	mov    %esp,%ebp
    44b3:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    44b6:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    44ba:	8b 45 08             	mov    0x8(%ebp),%eax
    44bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    44c1:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    44c4:	89 04 24             	mov    %eax,(%esp)
    44c7:	e8 45 f5 ff ff       	call   3a11 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    44cc:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    44d3:	00 
    44d4:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    44d7:	89 04 24             	mov    %eax,(%esp)
    44da:	e8 b1 f7 ff ff       	call   3c90 <open>
    44df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    44e2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    44e6:	75 1b                	jne    4503 <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    44e8:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    44eb:	89 44 24 08          	mov    %eax,0x8(%esp)
    44ef:	c7 44 24 04 24 8e 00 	movl   $0x8e24,0x4(%esp)
    44f6:	00 
    44f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    44fe:	e8 2c f9 ff ff       	call   3e2f <printf>
    }
    return f;
    4503:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4506:	c9                   	leave  
    4507:	c3                   	ret    

00004508 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4508:	55                   	push   %ebp
    4509:	89 e5                	mov    %esp,%ebp
    450b:	57                   	push   %edi
    450c:	56                   	push   %esi
    450d:	53                   	push   %ebx
    450e:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    4511:	8b 45 08             	mov    0x8(%ebp),%eax
    4514:	8b 00                	mov    (%eax),%eax
    4516:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);
    4519:	8b 45 e4             	mov    -0x1c(%ebp),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    451c:	8b 78 14             	mov    0x14(%eax),%edi
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);
    451f:	8b 45 e4             	mov    -0x1c(%ebp),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4522:	8b 70 10             	mov    0x10(%eax),%esi
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);
    4525:	8b 45 e4             	mov    -0x1c(%ebp),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4528:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    452b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    452e:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4531:	85 c0                	test   %eax,%eax
    4533:	0f 94 c0             	sete   %al
    4536:	0f b6 c8             	movzbl %al,%ecx
		info->version, info->lay, !info->error_protection,
    4539:	8b 45 e4             	mov    -0x1c(%ebp),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    453c:	8b 50 04             	mov    0x4(%eax),%edx
		info->version, info->lay, !info->error_protection,
    453f:	8b 45 e4             	mov    -0x1c(%ebp),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4542:	8b 00                	mov    (%eax),%eax
    4544:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4548:	89 74 24 18          	mov    %esi,0x18(%esp)
    454c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4550:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4554:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4558:	89 44 24 08          	mov    %eax,0x8(%esp)
    455c:	c7 44 24 04 44 8e 00 	movl   $0x8e44,0x4(%esp)
    4563:	00 
    4564:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    456b:	e8 bf f8 ff ff       	call   3e2f <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);
    4570:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4573:	8b 78 2c             	mov    0x2c(%eax),%edi
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);
    4576:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4579:	8b 70 28             	mov    0x28(%eax),%esi
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);
    457c:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    457f:	8b 58 24             	mov    0x24(%eax),%ebx
		info->extension, info->mode, info->mode_ext,
    4582:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4585:	8b 48 20             	mov    0x20(%eax),%ecx
		info->extension, info->mode, info->mode_ext,
    4588:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    458b:	8b 50 1c             	mov    0x1c(%eax),%edx
		info->extension, info->mode, info->mode_ext,
    458e:	8b 45 e4             	mov    -0x1c(%ebp),%eax

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    4591:	8b 40 18             	mov    0x18(%eax),%eax
    4594:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4598:	89 74 24 18          	mov    %esi,0x18(%esp)
    459c:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    45a0:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    45a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
    45a8:	89 44 24 08          	mov    %eax,0x8(%esp)
    45ac:	c7 44 24 04 84 8e 00 	movl   $0x8e84,0x4(%esp)
    45b3:	00 
    45b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    45bb:	e8 6f f8 ff ff       	call   3e2f <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    45c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45c3:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    45c6:	8b 0c 85 80 a6 00 00 	mov    0xa680(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    45cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45d0:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    45d3:	dd 04 c5 60 a6 00 00 	fldl   0xa660(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    45da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45dd:	8b 40 04             	mov    0x4(%eax),%eax
    45e0:	8d 50 ff             	lea    -0x1(%eax),%edx
    45e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45e6:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    45e9:	89 d0                	mov    %edx,%eax
    45eb:	c1 e0 04             	shl    $0x4,%eax
    45ee:	29 d0                	sub    %edx,%eax
    45f0:	01 d8                	add    %ebx,%eax
    45f2:	8b 14 85 a0 a5 00 00 	mov    0xa5a0(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    45f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    45fc:	8b 40 04             	mov    0x4(%eax),%eax
    45ff:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4602:	8b 04 85 80 a5 00 00 	mov    0xa580(,%eax,4),%eax
    4609:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    460d:	dd 5c 24 10          	fstpl  0x10(%esp)
    4611:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4615:	89 44 24 08          	mov    %eax,0x8(%esp)
    4619:	c7 44 24 04 ac 8e 00 	movl   $0x8eac,0x4(%esp)
    4620:	00 
    4621:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4628:	e8 02 f8 ff ff       	call   3e2f <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
    462d:	8b 45 08             	mov    0x8(%ebp),%eax

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4630:	8b 48 08             	mov    0x8(%eax),%ecx
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
    4633:	8b 45 08             	mov    0x8(%ebp),%eax

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    4636:	8b 50 0c             	mov    0xc(%eax),%edx
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
    4639:	8b 45 08             	mov    0x8(%ebp),%eax

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    463c:	8b 40 10             	mov    0x10(%eax),%eax
    463f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4643:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4647:	89 44 24 08          	mov    %eax,0x8(%esp)
    464b:	c7 44 24 04 db 8e 00 	movl   $0x8edb,0x4(%esp)
    4652:	00 
    4653:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    465a:	e8 d0 f7 ff ff       	call   3e2f <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    465f:	83 c4 3c             	add    $0x3c,%esp
    4662:	5b                   	pop    %ebx
    4663:	5e                   	pop    %esi
    4664:	5f                   	pop    %edi
    4665:	5d                   	pop    %ebp
    4666:	c3                   	ret    

00004667 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    4667:	55                   	push   %ebp
    4668:	89 e5                	mov    %esp,%ebp
    466a:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    466d:	8b 45 08             	mov    0x8(%ebp),%eax
    4670:	89 04 24             	mov    %eax,(%esp)
    4673:	e8 9b fa ff ff       	call   4113 <malloc>
    4678:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    467b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    467f:	74 1f                	je     46a0 <mem_alloc+0x39>
		memset(ptr, 0, block);
    4681:	8b 45 08             	mov    0x8(%ebp),%eax
    4684:	89 44 24 08          	mov    %eax,0x8(%esp)
    4688:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    468f:	00 
    4690:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4693:	89 04 24             	mov    %eax,(%esp)
    4696:	e8 10 f4 ff ff       	call   3aab <memset>
	else{
		printf(0, "Unable to allocate %s\n", item);
		exit();
	}
	return ptr;
    469b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    469e:	c9                   	leave  
    469f:	c3                   	ret    
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
	if (ptr != 0)
		memset(ptr, 0, block);
	else{
		printf(0, "Unable to allocate %s\n", item);
    46a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    46a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    46a7:	c7 44 24 04 f5 8e 00 	movl   $0x8ef5,0x4(%esp)
    46ae:	00 
    46af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    46b6:	e8 74 f7 ff ff       	call   3e2f <printf>
		exit();
    46bb:	e8 90 f5 ff ff       	call   3c50 <exit>

000046c0 <alloc_buffer>:
	}
	return ptr;
}

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    46c0:	55                   	push   %ebp
    46c1:	89 e5                	mov    %esp,%ebp
    46c3:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    46c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    46c9:	c7 44 24 04 0c 8f 00 	movl   $0x8f0c,0x4(%esp)
    46d0:	00 
    46d1:	89 04 24             	mov    %eax,(%esp)
    46d4:	e8 8e ff ff ff       	call   4667 <mem_alloc>
    46d9:	8b 55 08             	mov    0x8(%ebp),%edx
    46dc:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    46df:	8b 45 08             	mov    0x8(%ebp),%eax
    46e2:	8b 55 0c             	mov    0xc(%ebp),%edx
    46e5:	89 50 08             	mov    %edx,0x8(%eax)
}
    46e8:	c9                   	leave  
    46e9:	c3                   	ret    

000046ea <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    46ea:	55                   	push   %ebp
    46eb:	89 e5                	mov    %esp,%ebp
    46ed:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    46f0:	8b 45 08             	mov    0x8(%ebp),%eax
    46f3:	8b 40 04             	mov    0x4(%eax),%eax
    46f6:	89 04 24             	mov    %eax,(%esp)
    46f9:	e8 e6 f8 ff ff       	call   3fe4 <free>
}
    46fe:	c9                   	leave  
    46ff:	c3                   	ret    

00004700 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4700:	55                   	push   %ebp
    4701:	89 e5                	mov    %esp,%ebp
    4703:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4706:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    470d:	00 
    470e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4711:	89 04 24             	mov    %eax,(%esp)
    4714:	e8 77 f5 ff ff       	call   3c90 <open>
    4719:	8b 55 08             	mov    0x8(%ebp),%edx
    471c:	89 02                	mov    %eax,(%edx)
    471e:	8b 45 08             	mov    0x8(%ebp),%eax
    4721:	8b 00                	mov    (%eax),%eax
    4723:	83 f8 ff             	cmp    $0xffffffff,%eax
    4726:	75 20                	jne    4748 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4728:	8b 45 0c             	mov    0xc(%ebp),%eax
    472b:	89 44 24 08          	mov    %eax,0x8(%esp)
    472f:	c7 44 24 04 13 8f 00 	movl   $0x8f13,0x4(%esp)
    4736:	00 
    4737:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    473e:	e8 ec f6 ff ff       	call   3e2f <printf>
		exit();
    4743:	e8 08 f5 ff ff       	call   3c50 <exit>
	}

	bs->format = BINARY;
    4748:	8b 45 08             	mov    0x8(%ebp),%eax
    474b:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    474f:	8b 45 10             	mov    0x10(%ebp),%eax
    4752:	89 44 24 04          	mov    %eax,0x4(%esp)
    4756:	8b 45 08             	mov    0x8(%ebp),%eax
    4759:	89 04 24             	mov    %eax,(%esp)
    475c:	e8 5f ff ff ff       	call   46c0 <alloc_buffer>
	bs->buf_byte_idx=0;
    4761:	8b 45 08             	mov    0x8(%ebp),%eax
    4764:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    476b:	8b 45 08             	mov    0x8(%ebp),%eax
    476e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    4775:	8b 45 08             	mov    0x8(%ebp),%eax
    4778:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    477f:	8b 45 08             	mov    0x8(%ebp),%eax
    4782:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4789:	8b 45 08             	mov    0x8(%ebp),%eax
    478c:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    4793:	8b 45 08             	mov    0x8(%ebp),%eax
    4796:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    479d:	c9                   	leave  
    479e:	c3                   	ret    

0000479f <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    479f:	55                   	push   %ebp
    47a0:	89 e5                	mov    %esp,%ebp
    47a2:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    47a5:	8b 45 08             	mov    0x8(%ebp),%eax
    47a8:	8b 00                	mov    (%eax),%eax
    47aa:	89 04 24             	mov    %eax,(%esp)
    47ad:	e8 c6 f4 ff ff       	call   3c78 <close>
	desalloc_buffer(bs);
    47b2:	8b 45 08             	mov    0x8(%ebp),%eax
    47b5:	89 04 24             	mov    %eax,(%esp)
    47b8:	e8 2d ff ff ff       	call   46ea <desalloc_buffer>
}
    47bd:	c9                   	leave  
    47be:	c3                   	ret    

000047bf <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    47bf:	55                   	push   %ebp
    47c0:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    47c2:	8b 45 08             	mov    0x8(%ebp),%eax
    47c5:	8b 40 20             	mov    0x20(%eax),%eax
}
    47c8:	5d                   	pop    %ebp
    47c9:	c3                   	ret    

000047ca <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    47ca:	55                   	push   %ebp
    47cb:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    47cd:	8b 45 08             	mov    0x8(%ebp),%eax
    47d0:	8b 40 0c             	mov    0xc(%eax),%eax
}
    47d3:	5d                   	pop    %ebp
    47d4:	c3                   	ret    

000047d5 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    47d5:	55                   	push   %ebp
    47d6:	89 e5                	mov    %esp,%ebp
    47d8:	56                   	push   %esi
    47d9:	53                   	push   %ebx
    47da:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    47dd:	8b 45 08             	mov    0x8(%ebp),%eax
    47e0:	8b 40 08             	mov    0x8(%eax),%eax
    47e3:	8d 50 fe             	lea    -0x2(%eax),%edx
    47e6:	8b 45 08             	mov    0x8(%ebp),%eax
    47e9:	8b 40 10             	mov    0x10(%eax),%eax
    47ec:	89 d3                	mov    %edx,%ebx
    47ee:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    47f0:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    47f5:	eb 35                	jmp    482c <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    47f7:	8b 45 08             	mov    0x8(%ebp),%eax
    47fa:	8b 50 04             	mov    0x4(%eax),%edx
    47fd:	89 d8                	mov    %ebx,%eax
    47ff:	01 c2                	add    %eax,%edx
    4801:	83 eb 01             	sub    $0x1,%ebx
    4804:	8b 45 08             	mov    0x8(%ebp),%eax
    4807:	8b 00                	mov    (%eax),%eax
    4809:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4810:	00 
    4811:	89 54 24 04          	mov    %edx,0x4(%esp)
    4815:	89 04 24             	mov    %eax,(%esp)
    4818:	e8 4b f4 ff ff       	call   3c68 <read>
    481d:	89 c6                	mov    %eax,%esi
		if (!n)
    481f:	85 f6                	test   %esi,%esi
    4821:	75 09                	jne    482c <refill_buffer+0x57>
		bs->eob= i+1;
    4823:	8d 53 01             	lea    0x1(%ebx),%edx
    4826:	8b 45 08             	mov    0x8(%ebp),%eax
    4829:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    482c:	85 db                	test   %ebx,%ebx
    482e:	78 0a                	js     483a <refill_buffer+0x65>
    4830:	8b 45 08             	mov    0x8(%ebp),%eax
    4833:	8b 40 1c             	mov    0x1c(%eax),%eax
    4836:	85 c0                	test   %eax,%eax
    4838:	74 bd                	je     47f7 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    483a:	83 c4 10             	add    $0x10,%esp
    483d:	5b                   	pop    %ebx
    483e:	5e                   	pop    %esi
    483f:	5d                   	pop    %ebp
    4840:	c3                   	ret    

00004841 <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    4841:	55                   	push   %ebp
    4842:	89 e5                	mov    %esp,%ebp
    4844:	56                   	push   %esi
    4845:	53                   	push   %ebx
    4846:	83 ec 20             	sub    $0x20,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    4849:	8b 45 08             	mov    0x8(%ebp),%eax
    484c:	8b 40 0c             	mov    0xc(%eax),%eax
    484f:	8d 50 01             	lea    0x1(%eax),%edx
    4852:	8b 45 08             	mov    0x8(%ebp),%eax
    4855:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    4858:	8b 45 08             	mov    0x8(%ebp),%eax
    485b:	8b 40 14             	mov    0x14(%eax),%eax
    485e:	85 c0                	test   %eax,%eax
    4860:	0f 85 a1 00 00 00    	jne    4907 <get1bit+0xc6>
        bs->buf_bit_idx = 8;
    4866:	8b 45 08             	mov    0x8(%ebp),%eax
    4869:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    4870:	8b 45 08             	mov    0x8(%ebp),%eax
    4873:	8b 40 10             	mov    0x10(%eax),%eax
    4876:	8d 50 ff             	lea    -0x1(%eax),%edx
    4879:	8b 45 08             	mov    0x8(%ebp),%eax
    487c:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    487f:	8b 45 08             	mov    0x8(%ebp),%eax
    4882:	8b 40 10             	mov    0x10(%eax),%eax
    4885:	83 f8 03             	cmp    $0x3,%eax
    4888:	7e 10                	jle    489a <get1bit+0x59>
    488a:	8b 45 08             	mov    0x8(%ebp),%eax
    488d:	8b 50 10             	mov    0x10(%eax),%edx
    4890:	8b 45 08             	mov    0x8(%ebp),%eax
    4893:	8b 40 1c             	mov    0x1c(%eax),%eax
    4896:	39 c2                	cmp    %eax,%edx
    4898:	7d 6d                	jge    4907 <get1bit+0xc6>
             if (bs->eob)
    489a:	8b 45 08             	mov    0x8(%ebp),%eax
    489d:	8b 40 1c             	mov    0x1c(%eax),%eax
    48a0:	85 c0                	test   %eax,%eax
    48a2:	74 0c                	je     48b0 <get1bit+0x6f>
                bs->eobs = TRUE;
    48a4:	8b 45 08             	mov    0x8(%ebp),%eax
    48a7:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    48ae:	eb 57                	jmp    4907 <get1bit+0xc6>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    48b0:	8b 45 08             	mov    0x8(%ebp),%eax
    48b3:	8b 58 10             	mov    0x10(%eax),%ebx
    48b6:	eb 31                	jmp    48e9 <get1bit+0xa8>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    48b8:	8b 45 08             	mov    0x8(%ebp),%eax
    48bb:	8b 50 04             	mov    0x4(%eax),%edx
    48be:	8b 45 08             	mov    0x8(%ebp),%eax
    48c1:	8b 40 08             	mov    0x8(%eax),%eax
    48c4:	8d 48 ff             	lea    -0x1(%eax),%ecx
    48c7:	8b 45 08             	mov    0x8(%ebp),%eax
    48ca:	8b 40 10             	mov    0x10(%eax),%eax
    48cd:	89 ce                	mov    %ecx,%esi
    48cf:	29 c6                	sub    %eax,%esi
    48d1:	89 f0                	mov    %esi,%eax
    48d3:	01 d8                	add    %ebx,%eax
    48d5:	01 c2                	add    %eax,%edx
    48d7:	8b 45 08             	mov    0x8(%ebp),%eax
    48da:	8b 48 04             	mov    0x4(%eax),%ecx
    48dd:	89 d8                	mov    %ebx,%eax
    48df:	01 c8                	add    %ecx,%eax
    48e1:	0f b6 00             	movzbl (%eax),%eax
    48e4:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    48e6:	83 eb 01             	sub    $0x1,%ebx
    48e9:	85 db                	test   %ebx,%ebx
    48eb:	79 cb                	jns    48b8 <get1bit+0x77>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    48ed:	8b 45 08             	mov    0x8(%ebp),%eax
    48f0:	89 04 24             	mov    %eax,(%esp)
    48f3:	e8 dd fe ff ff       	call   47d5 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    48f8:	8b 45 08             	mov    0x8(%ebp),%eax
    48fb:	8b 40 08             	mov    0x8(%eax),%eax
    48fe:	8d 50 ff             	lea    -0x1(%eax),%edx
    4901:	8b 45 08             	mov    0x8(%ebp),%eax
    4904:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    4907:	8b 45 08             	mov    0x8(%ebp),%eax
    490a:	8b 50 04             	mov    0x4(%eax),%edx
    490d:	8b 45 08             	mov    0x8(%ebp),%eax
    4910:	8b 40 10             	mov    0x10(%eax),%eax
    4913:	01 d0                	add    %edx,%eax
    4915:	0f b6 00             	movzbl (%eax),%eax
    4918:	0f b6 d0             	movzbl %al,%edx
    491b:	8b 45 08             	mov    0x8(%ebp),%eax
    491e:	8b 40 14             	mov    0x14(%eax),%eax
    4921:	83 e8 01             	sub    $0x1,%eax
    4924:	8b 04 85 a0 a6 00 00 	mov    0xa6a0(,%eax,4),%eax
    492b:	21 d0                	and    %edx,%eax
    492d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    4930:	8b 45 08             	mov    0x8(%ebp),%eax
    4933:	8b 40 14             	mov    0x14(%eax),%eax
    4936:	83 e8 01             	sub    $0x1,%eax
    4939:	89 c1                	mov    %eax,%ecx
    493b:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    493e:	8b 45 08             	mov    0x8(%ebp),%eax
    4941:	8b 40 14             	mov    0x14(%eax),%eax
    4944:	8d 50 ff             	lea    -0x1(%eax),%edx
    4947:	8b 45 08             	mov    0x8(%ebp),%eax
    494a:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    494d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4950:	83 c4 20             	add    $0x20,%esp
    4953:	5b                   	pop    %ebx
    4954:	5e                   	pop    %esi
    4955:	5d                   	pop    %ebp
    4956:	c3                   	ret    

00004957 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    4957:	55                   	push   %ebp
    4958:	89 e5                	mov    %esp,%ebp
    495a:	57                   	push   %edi
    495b:	56                   	push   %esi
    495c:	53                   	push   %ebx
    495d:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    4960:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    4967:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    496a:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    496e:	7e 1c                	jle    498c <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    4970:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    4977:	00 
    4978:	c7 44 24 04 2c 8f 00 	movl   $0x8f2c,0x4(%esp)
    497f:	00 
    4980:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4987:	e8 a3 f4 ff ff       	call   3e2f <printf>

	bs->totbit += N;
    498c:	8b 45 08             	mov    0x8(%ebp),%eax
    498f:	8b 40 0c             	mov    0xc(%eax),%eax
    4992:	89 c2                	mov    %eax,%edx
    4994:	03 55 0c             	add    0xc(%ebp),%edx
    4997:	8b 45 08             	mov    0x8(%ebp),%eax
    499a:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    499d:	e9 0e 01 00 00       	jmp    4ab0 <getbits+0x159>
		if (!bs->buf_bit_idx) {
    49a2:	8b 45 08             	mov    0x8(%ebp),%eax
    49a5:	8b 40 14             	mov    0x14(%eax),%eax
    49a8:	85 c0                	test   %eax,%eax
    49aa:	0f 85 a1 00 00 00    	jne    4a51 <getbits+0xfa>
			bs->buf_bit_idx = 8;
    49b0:	8b 45 08             	mov    0x8(%ebp),%eax
    49b3:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    49ba:	8b 45 08             	mov    0x8(%ebp),%eax
    49bd:	8b 40 10             	mov    0x10(%eax),%eax
    49c0:	8d 50 ff             	lea    -0x1(%eax),%edx
    49c3:	8b 45 08             	mov    0x8(%ebp),%eax
    49c6:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    49c9:	8b 45 08             	mov    0x8(%ebp),%eax
    49cc:	8b 40 10             	mov    0x10(%eax),%eax
    49cf:	83 f8 03             	cmp    $0x3,%eax
    49d2:	7e 10                	jle    49e4 <getbits+0x8d>
    49d4:	8b 45 08             	mov    0x8(%ebp),%eax
    49d7:	8b 50 10             	mov    0x10(%eax),%edx
    49da:	8b 45 08             	mov    0x8(%ebp),%eax
    49dd:	8b 40 1c             	mov    0x1c(%eax),%eax
    49e0:	39 c2                	cmp    %eax,%edx
    49e2:	7d 6d                	jge    4a51 <getbits+0xfa>
				if (bs->eob)
    49e4:	8b 45 08             	mov    0x8(%ebp),%eax
    49e7:	8b 40 1c             	mov    0x1c(%eax),%eax
    49ea:	85 c0                	test   %eax,%eax
    49ec:	74 0c                	je     49fa <getbits+0xa3>
					bs->eobs = TRUE;
    49ee:	8b 45 08             	mov    0x8(%ebp),%eax
    49f1:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    49f8:	eb 57                	jmp    4a51 <getbits+0xfa>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    49fa:	8b 45 08             	mov    0x8(%ebp),%eax
    49fd:	8b 70 10             	mov    0x10(%eax),%esi
    4a00:	eb 31                	jmp    4a33 <getbits+0xdc>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4a02:	8b 45 08             	mov    0x8(%ebp),%eax
    4a05:	8b 50 04             	mov    0x4(%eax),%edx
    4a08:	8b 45 08             	mov    0x8(%ebp),%eax
    4a0b:	8b 40 08             	mov    0x8(%eax),%eax
    4a0e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4a11:	8b 45 08             	mov    0x8(%ebp),%eax
    4a14:	8b 40 10             	mov    0x10(%eax),%eax
    4a17:	89 cf                	mov    %ecx,%edi
    4a19:	29 c7                	sub    %eax,%edi
    4a1b:	89 f8                	mov    %edi,%eax
    4a1d:	01 f0                	add    %esi,%eax
    4a1f:	01 c2                	add    %eax,%edx
    4a21:	8b 45 08             	mov    0x8(%ebp),%eax
    4a24:	8b 48 04             	mov    0x4(%eax),%ecx
    4a27:	89 f0                	mov    %esi,%eax
    4a29:	01 c8                	add    %ecx,%eax
    4a2b:	0f b6 00             	movzbl (%eax),%eax
    4a2e:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4a30:	83 ee 01             	sub    $0x1,%esi
    4a33:	85 f6                	test   %esi,%esi
    4a35:	79 cb                	jns    4a02 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    4a37:	8b 45 08             	mov    0x8(%ebp),%eax
    4a3a:	89 04 24             	mov    %eax,(%esp)
    4a3d:	e8 93 fd ff ff       	call   47d5 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    4a42:	8b 45 08             	mov    0x8(%ebp),%eax
    4a45:	8b 40 08             	mov    0x8(%eax),%eax
    4a48:	8d 50 ff             	lea    -0x1(%eax),%edx
    4a4b:	8b 45 08             	mov    0x8(%ebp),%eax
    4a4e:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    4a51:	8b 45 08             	mov    0x8(%ebp),%eax
    4a54:	8b 40 14             	mov    0x14(%eax),%eax
    4a57:	39 d8                	cmp    %ebx,%eax
    4a59:	89 de                	mov    %ebx,%esi
    4a5b:	0f 4e f0             	cmovle %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    4a5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4a61:	8b 50 04             	mov    0x4(%eax),%edx
    4a64:	8b 45 08             	mov    0x8(%ebp),%eax
    4a67:	8b 40 10             	mov    0x10(%eax),%eax
    4a6a:	01 d0                	add    %edx,%eax
    4a6c:	0f b6 00             	movzbl (%eax),%eax
    4a6f:	0f b6 d0             	movzbl %al,%edx
    4a72:	8b 45 08             	mov    0x8(%ebp),%eax
    4a75:	8b 40 14             	mov    0x14(%eax),%eax
    4a78:	8b 04 85 c0 a6 00 00 	mov    0xa6c0(,%eax,4),%eax
    4a7f:	89 d7                	mov    %edx,%edi
    4a81:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    4a83:	8b 45 08             	mov    0x8(%ebp),%eax
    4a86:	8b 40 14             	mov    0x14(%eax),%eax
    4a89:	29 f0                	sub    %esi,%eax
    4a8b:	89 c1                	mov    %eax,%ecx
    4a8d:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    4a8f:	89 d8                	mov    %ebx,%eax
    4a91:	29 f0                	sub    %esi,%eax
    4a93:	89 fa                	mov    %edi,%edx
    4a95:	89 c1                	mov    %eax,%ecx
    4a97:	d3 e2                	shl    %cl,%edx
    4a99:	89 d0                	mov    %edx,%eax
    4a9b:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    4a9e:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa1:	8b 40 14             	mov    0x14(%eax),%eax
    4aa4:	89 c2                	mov    %eax,%edx
    4aa6:	29 f2                	sub    %esi,%edx
    4aa8:	8b 45 08             	mov    0x8(%ebp),%eax
    4aab:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    4aae:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    4ab0:	85 db                	test   %ebx,%ebx
    4ab2:	0f 8f ea fe ff ff    	jg     49a2 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    4ab8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    4abb:	83 c4 2c             	add    $0x2c,%esp
    4abe:	5b                   	pop    %ebx
    4abf:	5e                   	pop    %esi
    4ac0:	5f                   	pop    %edi
    4ac1:	5d                   	pop    %ebp
    4ac2:	c3                   	ret    

00004ac3 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    4ac3:	55                   	push   %ebp
    4ac4:	89 e5                	mov    %esp,%ebp
    4ac6:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4ac9:	db 45 10             	fildl  0x10(%ebp)
    4acc:	dd 5c 24 08          	fstpl  0x8(%esp)
    4ad0:	dd 05 98 8f 00 00    	fldl   0x8f98
    4ad6:	dd 1c 24             	fstpl  (%esp)
    4ad9:	e8 dc f7 ff ff       	call   42ba <pow>
    4ade:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4ae1:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    4ae5:	b4 0c                	mov    $0xc,%ah
    4ae7:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4aeb:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4aee:	db 5d e0             	fistpl -0x20(%ebp)
    4af1:	d9 6d e6             	fldcw  -0x1a(%ebp)
    4af4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4af7:	83 e8 01             	sub    $0x1,%eax
    4afa:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4afd:	8b 45 08             	mov    0x8(%ebp),%eax
    4b00:	89 04 24             	mov    %eax,(%esp)
    4b03:	e8 c2 fc ff ff       	call   47ca <sstell>
    4b08:	83 e0 07             	and    $0x7,%eax
    4b0b:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4b0e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4b12:	74 17                	je     4b2b <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    4b14:	b8 08 00 00 00       	mov    $0x8,%eax
    4b19:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b20:	8b 45 08             	mov    0x8(%ebp),%eax
    4b23:	89 04 24             	mov    %eax,(%esp)
    4b26:	e8 2c fe ff ff       	call   4957 <getbits>

	val = getbits(bs, N);
    4b2b:	8b 45 10             	mov    0x10(%ebp),%eax
    4b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b32:	8b 45 08             	mov    0x8(%ebp),%eax
    4b35:	89 04 24             	mov    %eax,(%esp)
    4b38:	e8 1a fe ff ff       	call   4957 <getbits>
    4b3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4b40:	eb 1a                	jmp    4b5c <seek_sync+0x99>
		val <<= ALIGNING;
    4b42:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    4b46:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    4b4d:	00 
    4b4e:	8b 45 08             	mov    0x8(%ebp),%eax
    4b51:	89 04 24             	mov    %eax,(%esp)
    4b54:	e8 fe fd ff ff       	call   4957 <getbits>
    4b59:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4b5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4b5f:	23 45 f4             	and    -0xc(%ebp),%eax
    4b62:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4b65:	74 0f                	je     4b76 <seek_sync+0xb3>
    4b67:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6a:	89 04 24             	mov    %eax,(%esp)
    4b6d:	e8 4d fc ff ff       	call   47bf <end_bs>
    4b72:	85 c0                	test   %eax,%eax
    4b74:	74 cc                	je     4b42 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    4b76:	8b 45 08             	mov    0x8(%ebp),%eax
    4b79:	89 04 24             	mov    %eax,(%esp)
    4b7c:	e8 3e fc ff ff       	call   47bf <end_bs>
    4b81:	85 c0                	test   %eax,%eax
    4b83:	74 07                	je     4b8c <seek_sync+0xc9>
		return(0);
    4b85:	b8 00 00 00 00       	mov    $0x0,%eax
    4b8a:	eb 05                	jmp    4b91 <seek_sync+0xce>
	else
		return(1);
    4b8c:	b8 01 00 00 00       	mov    $0x1,%eax
}
    4b91:	c9                   	leave  
    4b92:	c3                   	ret    

00004b93 <js_bound>:

int js_bound(int lay, int m_ext)
{
    4b93:	55                   	push   %ebp
    4b94:	89 e5                	mov    %esp,%ebp
    4b96:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    4b99:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4b9d:	7e 12                	jle    4bb1 <js_bound+0x1e>
    4b9f:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    4ba3:	7f 0c                	jg     4bb1 <js_bound+0x1e>
    4ba5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4ba9:	78 06                	js     4bb1 <js_bound+0x1e>
    4bab:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    4baf:	7e 27                	jle    4bd8 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    4bb1:	8b 45 0c             	mov    0xc(%ebp),%eax
    4bb4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4bb8:	8b 45 08             	mov    0x8(%ebp),%eax
    4bbb:	89 44 24 08          	mov    %eax,0x8(%esp)
    4bbf:	c7 44 24 04 60 8f 00 	movl   $0x8f60,0x4(%esp)
    4bc6:	00 
    4bc7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bce:	e8 5c f2 ff ff       	call   3e2f <printf>
        exit();
    4bd3:	e8 78 f0 ff ff       	call   3c50 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4bd8:	8b 45 08             	mov    0x8(%ebp),%eax
    4bdb:	83 e8 01             	sub    $0x1,%eax
    4bde:	c1 e0 02             	shl    $0x2,%eax
    4be1:	03 45 0c             	add    0xc(%ebp),%eax
    4be4:	8b 04 85 00 a7 00 00 	mov    0xa700(,%eax,4),%eax
}
    4beb:	c9                   	leave  
    4bec:	c3                   	ret    

00004bed <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    4bed:	55                   	push   %ebp
    4bee:	89 e5                	mov    %esp,%ebp
    4bf0:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4bf3:	8b 45 08             	mov    0x8(%ebp),%eax
    4bf6:	8b 00                	mov    (%eax),%eax
    4bf8:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4bfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bfe:	8b 50 1c             	mov    0x1c(%eax),%edx
    4c01:	8b 45 08             	mov    0x8(%ebp),%eax
    4c04:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4c07:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c0a:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c0d:	83 f8 03             	cmp    $0x3,%eax
    4c10:	75 07                	jne    4c19 <hdr_to_frps+0x2c>
    4c12:	b8 01 00 00 00       	mov    $0x1,%eax
    4c17:	eb 05                	jmp    4c1e <hdr_to_frps+0x31>
    4c19:	b8 02 00 00 00       	mov    $0x2,%eax
    4c1e:	8b 55 08             	mov    0x8(%ebp),%edx
    4c21:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    4c24:	8b 45 08             	mov    0x8(%ebp),%eax
    4c27:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    4c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c31:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c34:	83 f8 01             	cmp    $0x1,%eax
    4c37:	75 20                	jne    4c59 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c3c:	8b 50 20             	mov    0x20(%eax),%edx
    4c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4c42:	8b 40 04             	mov    0x4(%eax),%eax
    4c45:	89 54 24 04          	mov    %edx,0x4(%esp)
    4c49:	89 04 24             	mov    %eax,(%esp)
    4c4c:	e8 42 ff ff ff       	call   4b93 <js_bound>
    4c51:	8b 55 08             	mov    0x8(%ebp),%edx
    4c54:	89 42 0c             	mov    %eax,0xc(%edx)
    4c57:	eb 0c                	jmp    4c65 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4c59:	8b 45 08             	mov    0x8(%ebp),%eax
    4c5c:	8b 50 10             	mov    0x10(%eax),%edx
    4c5f:	8b 45 08             	mov    0x8(%ebp),%eax
    4c62:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4c65:	c9                   	leave  
    4c66:	c3                   	ret    

00004c67 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    4c67:	55                   	push   %ebp
    4c68:	89 e5                	mov    %esp,%ebp
    4c6a:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    4c6d:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    4c71:	74 19                	je     4c8c <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    4c73:	c7 44 24 04 83 8f 00 	movl   $0x8f83,0x4(%esp)
    4c7a:	00 
    4c7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c82:	e8 a8 f1 ff ff       	call   3e2f <printf>
		exit();
    4c87:	e8 c4 ef ff ff       	call   3c50 <exit>
	}
	getCoreBuf(1, val);
    4c8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4c8f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4c9a:	e8 b1 f0 ff ff       	call   3d50 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    4c9f:	c9                   	leave  
    4ca0:	c3                   	ret    

00004ca1 <hsstell>:

unsigned long hsstell()
{
    4ca1:	55                   	push   %ebp
    4ca2:	89 e5                	mov    %esp,%ebp
    4ca4:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    4ca7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4cae:	00 
    4caf:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    4cb6:	e8 95 f0 ff ff       	call   3d50 <getCoreBuf>
//	return(totbit);
}
    4cbb:	c9                   	leave  
    4cbc:	c3                   	ret    

00004cbd <hgetbits>:

unsigned long hgetbits(int N)
{
    4cbd:	55                   	push   %ebp
    4cbe:	89 e5                	mov    %esp,%ebp
    4cc0:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    4cc3:	8b 45 08             	mov    0x8(%ebp),%eax
    4cc6:	89 44 24 04          	mov    %eax,0x4(%esp)
    4cca:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    4cd1:	e8 7a f0 ff ff       	call   3d50 <getCoreBuf>
}
    4cd6:	c9                   	leave  
    4cd7:	c3                   	ret    

00004cd8 <hget1bit>:


unsigned int hget1bit()
{
    4cd8:	55                   	push   %ebp
    4cd9:	89 e5                	mov    %esp,%ebp
    4cdb:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    4cde:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4ce5:	e8 d3 ff ff ff       	call   4cbd <hgetbits>
}
    4cea:	c9                   	leave  
    4ceb:	c3                   	ret    

00004cec <rewindNbits>:


void rewindNbits(int N)
{
    4cec:	55                   	push   %ebp
    4ced:	89 e5                	mov    %esp,%ebp
    4cef:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    4cf2:	8b 45 08             	mov    0x8(%ebp),%eax
    4cf5:	89 44 24 04          	mov    %eax,0x4(%esp)
    4cf9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    4d00:	e8 4b f0 ff ff       	call   3d50 <getCoreBuf>
}
    4d05:	c9                   	leave  
    4d06:	c3                   	ret    

00004d07 <rewindNbytes>:


void rewindNbytes(int N)
{
    4d07:	55                   	push   %ebp
    4d08:	89 e5                	mov    %esp,%ebp
    4d0a:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    4d0d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d10:	89 44 24 04          	mov    %eax,0x4(%esp)
    4d14:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    4d1b:	e8 30 f0 ff ff       	call   3d50 <getCoreBuf>
}
    4d20:	c9                   	leave  
    4d21:	c3                   	ret    
    4d22:	90                   	nop
    4d23:	90                   	nop

00004d24 <read_decoder_table>:
};


/* 读取 huffman 解码表 */
void read_decoder_table() 
{	
    4d24:	55                   	push   %ebp
    4d25:	89 e5                	mov    %esp,%ebp
	// struct huffcodetab ht[HTN] = 
	// ht[0] = ht[0];
}
    4d27:	5d                   	pop    %ebp
    4d28:	c3                   	ret    

00004d29 <output_buf2>:

void output_buf2()
{
    4d29:	55                   	push   %ebp
    4d2a:	89 e5                	mov    %esp,%ebp
    4d2c:	83 ec 18             	sub    $0x18,%esp
	printf(0, "Core Buffer:\n");
    4d2f:	c7 44 24 04 a0 8f 00 	movl   $0x8fa0,0x4(%esp)
    4d36:	00 
    4d37:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d3e:	e8 ec f0 ff ff       	call   3e2f <printf>
	printf(0, "totbit=%d ", getCoreBuf(2, 0));
    4d43:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d4a:	00 
    4d4b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    4d52:	e8 f9 ef ff ff       	call   3d50 <getCoreBuf>
    4d57:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d5b:	c7 44 24 04 ae 8f 00 	movl   $0x8fae,0x4(%esp)
    4d62:	00 
    4d63:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d6a:	e8 c0 f0 ff ff       	call   3e2f <printf>
	printf(0, "buf_byte_idx=%d ", getCoreBuf(6, 0));
    4d6f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d76:	00 
    4d77:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
    4d7e:	e8 cd ef ff ff       	call   3d50 <getCoreBuf>
    4d83:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d87:	c7 44 24 04 b9 8f 00 	movl   $0x8fb9,0x4(%esp)
    4d8e:	00 
    4d8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d96:	e8 94 f0 ff ff       	call   3e2f <printf>
	printf(0, "buf_bit_idx=%d ", getCoreBuf(7, 0));
    4d9b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4da2:	00 
    4da3:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
    4daa:	e8 a1 ef ff ff       	call   3d50 <getCoreBuf>
    4daf:	89 44 24 08          	mov    %eax,0x8(%esp)
    4db3:	c7 44 24 04 ca 8f 00 	movl   $0x8fca,0x4(%esp)
    4dba:	00 
    4dbb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4dc2:	e8 68 f0 ff ff       	call   3e2f <printf>
	printf(0, "offset=%d\n\n", getCoreBuf(8, 0));
    4dc7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4dce:	00 
    4dcf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    4dd6:	e8 75 ef ff ff       	call   3d50 <getCoreBuf>
    4ddb:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ddf:	c7 44 24 04 da 8f 00 	movl   $0x8fda,0x4(%esp)
    4de6:	00 
    4de7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4dee:	e8 3c f0 ff ff       	call   3e2f <printf>
}
    4df3:	c9                   	leave  
    4df4:	c3                   	ret    

00004df5 <huffman_decoder>:


/* 进行huffman解码	*/
/* 注意! 对counta,countb - 4 bit 值 用 y返回, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    4df5:	55                   	push   %ebp
    4df6:	89 e5                	mov    %esp,%ebp
    4df8:	53                   	push   %ebx
    4df9:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    4dfc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    4e03:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    4e0a:	a1 40 a7 00 00       	mov    0xa740,%eax
    4e0f:	89 45 f4             	mov    %eax,-0xc(%ebp)

  /* table 0 不需要 bits */
  if ( h->treelen == 0)
    4e12:	8b 45 08             	mov    0x8(%ebp),%eax
    4e15:	8b 40 24             	mov    0x24(%eax),%eax
    4e18:	85 c0                	test   %eax,%eax
    4e1a:	75 1d                	jne    4e39 <huffman_decoder+0x44>
  {  *x = *y = 0;
    4e1c:	8b 45 10             	mov    0x10(%ebp),%eax
    4e1f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4e25:	8b 45 10             	mov    0x10(%ebp),%eax
    4e28:	8b 10                	mov    (%eax),%edx
    4e2a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e2d:	89 10                	mov    %edx,(%eax)
     return 0;
    4e2f:	b8 00 00 00 00       	mov    $0x0,%eax
    4e34:	e9 01 03 00 00       	jmp    513a <huffman_decoder+0x345>
  }

  if (h->val == 0) return 2;
    4e39:	8b 45 08             	mov    0x8(%ebp),%eax
    4e3c:	8b 40 20             	mov    0x20(%eax),%eax
    4e3f:	85 c0                	test   %eax,%eax
    4e41:	75 0a                	jne    4e4d <huffman_decoder+0x58>
    4e43:	b8 02 00 00 00       	mov    $0x2,%eax
    4e48:	e9 ed 02 00 00       	jmp    513a <huffman_decoder+0x345>
  /* 查找 Huffman table. */

  // output_buf2();

  do {
    if (h->val[point][0]==0) {   /*树的结尾*/
    4e4d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e50:	8b 40 20             	mov    0x20(%eax),%eax
    4e53:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e56:	01 d2                	add    %edx,%edx
    4e58:	01 d0                	add    %edx,%eax
    4e5a:	0f b6 00             	movzbl (%eax),%eax
    4e5d:	84 c0                	test   %al,%al
    4e5f:	75 46                	jne    4ea7 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    4e61:	8b 45 08             	mov    0x8(%ebp),%eax
    4e64:	8b 40 20             	mov    0x20(%eax),%eax
    4e67:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e6a:	01 d2                	add    %edx,%edx
    4e6c:	01 d0                	add    %edx,%eax
    4e6e:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e72:	c0 e8 04             	shr    $0x4,%al
    4e75:	0f b6 d0             	movzbl %al,%edx
    4e78:	8b 45 0c             	mov    0xc(%ebp),%eax
    4e7b:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    4e7d:	8b 45 08             	mov    0x8(%ebp),%eax
    4e80:	8b 40 20             	mov    0x20(%eax),%eax
    4e83:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e86:	01 d2                	add    %edx,%edx
    4e88:	01 d0                	add    %edx,%eax
    4e8a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e8e:	0f b6 c0             	movzbl %al,%eax
    4e91:	89 c2                	mov    %eax,%edx
    4e93:	83 e2 0f             	and    $0xf,%edx
    4e96:	8b 45 10             	mov    0x10(%ebp),%eax
    4e99:	89 10                	mov    %edx,(%eax)

      error = 0;
    4e9b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    4ea2:	e9 b0 00 00 00       	jmp    4f57 <huffman_decoder+0x162>
    } 
    // unsigned int t = hget1bit();
    // printf(0, "t=%d  ", t);
    if (hget1bit()) {
    4ea7:	e8 2c fe ff ff       	call   4cd8 <hget1bit>
    4eac:	85 c0                	test   %eax,%eax
    4eae:	74 5f                	je     4f0f <huffman_decoder+0x11a>
    	// printf(0, "Enter if branch:  ");
    	while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    4eb0:	eb 17                	jmp    4ec9 <huffman_decoder+0xd4>
    4eb2:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb5:	8b 40 20             	mov    0x20(%eax),%eax
    4eb8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ebb:	01 d2                	add    %edx,%edx
    4ebd:	01 d0                	add    %edx,%eax
    4ebf:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4ec3:	0f b6 c0             	movzbl %al,%eax
    4ec6:	01 45 f0             	add    %eax,-0x10(%ebp)
    4ec9:	8b 45 08             	mov    0x8(%ebp),%eax
    4ecc:	8b 40 20             	mov    0x20(%eax),%eax
    4ecf:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ed2:	01 d2                	add    %edx,%edx
    4ed4:	01 d0                	add    %edx,%eax
    4ed6:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4eda:	3c f9                	cmp    $0xf9,%al
    4edc:	77 d4                	ja     4eb2 <huffman_decoder+0xbd>
    	point += h->val[point][1];
    4ede:	8b 45 08             	mov    0x8(%ebp),%eax
    4ee1:	8b 40 20             	mov    0x20(%eax),%eax
    4ee4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ee7:	01 d2                	add    %edx,%edx
    4ee9:	01 d0                	add    %edx,%eax
    4eeb:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4eef:	0f b6 c0             	movzbl %al,%eax
    4ef2:	01 45 f0             	add    %eax,-0x10(%ebp)
    4ef5:	eb 43                	jmp    4f3a <huffman_decoder+0x145>
    }
    else {
    	// printf(0, "Enter else branch:  ");
    	while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    4ef7:	8b 45 08             	mov    0x8(%ebp),%eax
    4efa:	8b 40 20             	mov    0x20(%eax),%eax
    4efd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4f00:	01 d2                	add    %edx,%edx
    4f02:	01 d0                	add    %edx,%eax
    4f04:	0f b6 00             	movzbl (%eax),%eax
    4f07:	0f b6 c0             	movzbl %al,%eax
    4f0a:	01 45 f0             	add    %eax,-0x10(%ebp)
    4f0d:	eb 01                	jmp    4f10 <huffman_decoder+0x11b>
    4f0f:	90                   	nop
    4f10:	8b 45 08             	mov    0x8(%ebp),%eax
    4f13:	8b 40 20             	mov    0x20(%eax),%eax
    4f16:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4f19:	01 d2                	add    %edx,%edx
    4f1b:	01 d0                	add    %edx,%eax
    4f1d:	0f b6 00             	movzbl (%eax),%eax
    4f20:	3c f9                	cmp    $0xf9,%al
    4f22:	77 d3                	ja     4ef7 <huffman_decoder+0x102>
    	point += h->val[point][0];
    4f24:	8b 45 08             	mov    0x8(%ebp),%eax
    4f27:	8b 40 20             	mov    0x20(%eax),%eax
    4f2a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4f2d:	01 d2                	add    %edx,%edx
    4f2f:	01 d0                	add    %edx,%eax
    4f31:	0f b6 00             	movzbl (%eax),%eax
    4f34:	0f b6 c0             	movzbl %al,%eax
    4f37:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    4f3a:	d1 6d f4             	shrl   -0xc(%ebp)
    // printf(0, "do while: %d %d %d  ", level, point, ht->treelen);
    // output_buf2();
  } while (level  || (point < ht->treelen) );
    4f3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4f41:	0f 85 06 ff ff ff    	jne    4e4d <huffman_decoder+0x58>
    4f47:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4f4a:	a1 e4 bd 00 00       	mov    0xbde4,%eax
    4f4f:	39 c2                	cmp    %eax,%edx
    4f51:	0f 82 f6 fe ff ff    	jb     4e4d <huffman_decoder+0x58>

  // output_buf2();
  
  /* 检查错误 */
  
  if (error) { /* 设置 x 和 y 为一中间值 */
    4f57:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4f5b:	74 24                	je     4f81 <huffman_decoder+0x18c>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    4f5d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f60:	8b 40 04             	mov    0x4(%eax),%eax
    4f63:	83 e8 01             	sub    $0x1,%eax
    4f66:	01 c0                	add    %eax,%eax
    4f68:	89 c2                	mov    %eax,%edx
    4f6a:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f6d:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    4f6f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f72:	8b 40 08             	mov    0x8(%eax),%eax
    4f75:	83 e8 01             	sub    $0x1,%eax
    4f78:	01 c0                	add    %eax,%eax
    4f7a:	89 c2                	mov    %eax,%edx
    4f7c:	8b 45 10             	mov    0x10(%ebp),%eax
    4f7f:	89 10                	mov    %edx,(%eax)
  }

  /* 处理信号编码 */

  if (h->tablename[0] == '3'
    4f81:	8b 45 08             	mov    0x8(%ebp),%eax
    4f84:	0f b6 00             	movzbl (%eax),%eax
    4f87:	3c 33                	cmp    $0x33,%al
    4f89:	0f 85 ef 00 00 00    	jne    507e <huffman_decoder+0x289>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    4f8f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f92:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4f96:	3c 32                	cmp    $0x32,%al
    4f98:	74 0f                	je     4fa9 <huffman_decoder+0x1b4>
    4f9a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f9d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4fa1:	3c 33                	cmp    $0x33,%al
    4fa3:	0f 85 d5 00 00 00    	jne    507e <huffman_decoder+0x289>
     *v = (*y>>3) & 1;
    4fa9:	8b 45 10             	mov    0x10(%ebp),%eax
    4fac:	8b 00                	mov    (%eax),%eax
    4fae:	c1 f8 03             	sar    $0x3,%eax
    4fb1:	89 c2                	mov    %eax,%edx
    4fb3:	83 e2 01             	and    $0x1,%edx
    4fb6:	8b 45 14             	mov    0x14(%ebp),%eax
    4fb9:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    4fbb:	8b 45 10             	mov    0x10(%ebp),%eax
    4fbe:	8b 00                	mov    (%eax),%eax
    4fc0:	c1 f8 02             	sar    $0x2,%eax
    4fc3:	89 c2                	mov    %eax,%edx
    4fc5:	83 e2 01             	and    $0x1,%edx
    4fc8:	8b 45 18             	mov    0x18(%ebp),%eax
    4fcb:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    4fcd:	8b 45 10             	mov    0x10(%ebp),%eax
    4fd0:	8b 00                	mov    (%eax),%eax
    4fd2:	d1 f8                	sar    %eax
    4fd4:	89 c2                	mov    %eax,%edx
    4fd6:	83 e2 01             	and    $0x1,%edx
    4fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fdc:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    4fde:	8b 45 10             	mov    0x10(%ebp),%eax
    4fe1:	8b 00                	mov    (%eax),%eax
    4fe3:	89 c2                	mov    %eax,%edx
    4fe5:	83 e2 01             	and    $0x1,%edx
    4fe8:	8b 45 10             	mov    0x10(%ebp),%eax
    4feb:	89 10                	mov    %edx,(%eax)
     /* v, w, x 和 y 在比特流中是颠倒的，交换他们 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    4fed:	8b 45 14             	mov    0x14(%ebp),%eax
    4ff0:	8b 00                	mov    (%eax),%eax
    4ff2:	85 c0                	test   %eax,%eax
    4ff4:	74 18                	je     500e <huffman_decoder+0x219>
        if (hget1bit() == 1) *v = -*v;
    4ff6:	e8 dd fc ff ff       	call   4cd8 <hget1bit>
    4ffb:	83 f8 01             	cmp    $0x1,%eax
    4ffe:	75 0e                	jne    500e <huffman_decoder+0x219>
    5000:	8b 45 14             	mov    0x14(%ebp),%eax
    5003:	8b 00                	mov    (%eax),%eax
    5005:	89 c2                	mov    %eax,%edx
    5007:	f7 da                	neg    %edx
    5009:	8b 45 14             	mov    0x14(%ebp),%eax
    500c:	89 10                	mov    %edx,(%eax)
     if (*w)
    500e:	8b 45 18             	mov    0x18(%ebp),%eax
    5011:	8b 00                	mov    (%eax),%eax
    5013:	85 c0                	test   %eax,%eax
    5015:	74 18                	je     502f <huffman_decoder+0x23a>
        if (hget1bit() == 1) *w = -*w;
    5017:	e8 bc fc ff ff       	call   4cd8 <hget1bit>
    501c:	83 f8 01             	cmp    $0x1,%eax
    501f:	75 0e                	jne    502f <huffman_decoder+0x23a>
    5021:	8b 45 18             	mov    0x18(%ebp),%eax
    5024:	8b 00                	mov    (%eax),%eax
    5026:	89 c2                	mov    %eax,%edx
    5028:	f7 da                	neg    %edx
    502a:	8b 45 18             	mov    0x18(%ebp),%eax
    502d:	89 10                	mov    %edx,(%eax)
     if (*x)
    502f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5032:	8b 00                	mov    (%eax),%eax
    5034:	85 c0                	test   %eax,%eax
    5036:	74 18                	je     5050 <huffman_decoder+0x25b>
        if (hget1bit() == 1) *x = -*x;
    5038:	e8 9b fc ff ff       	call   4cd8 <hget1bit>
    503d:	83 f8 01             	cmp    $0x1,%eax
    5040:	75 0e                	jne    5050 <huffman_decoder+0x25b>
    5042:	8b 45 0c             	mov    0xc(%ebp),%eax
    5045:	8b 00                	mov    (%eax),%eax
    5047:	89 c2                	mov    %eax,%edx
    5049:	f7 da                	neg    %edx
    504b:	8b 45 0c             	mov    0xc(%ebp),%eax
    504e:	89 10                	mov    %edx,(%eax)
     if (*y)
    5050:	8b 45 10             	mov    0x10(%ebp),%eax
    5053:	8b 00                	mov    (%eax),%eax
    5055:	85 c0                	test   %eax,%eax
    5057:	0f 84 d9 00 00 00    	je     5136 <huffman_decoder+0x341>
        if (hget1bit() == 1) *y = -*y;
    505d:	e8 76 fc ff ff       	call   4cd8 <hget1bit>
    5062:	83 f8 01             	cmp    $0x1,%eax
    5065:	0f 85 cb 00 00 00    	jne    5136 <huffman_decoder+0x341>
    506b:	8b 45 10             	mov    0x10(%ebp),%eax
    506e:	8b 00                	mov    (%eax),%eax
    5070:	89 c2                	mov    %eax,%edx
    5072:	f7 da                	neg    %edx
    5074:	8b 45 10             	mov    0x10(%ebp),%eax
    5077:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    5079:	e9 b8 00 00 00       	jmp    5136 <huffman_decoder+0x341>
  else {
  
      /* 在测试比特流中x 和 y是颠倒的 
         这里颠倒 x 和 y 使测试比特流正常 */
    
     if (h->linbits)
    507e:	8b 45 08             	mov    0x8(%ebp),%eax
    5081:	8b 40 0c             	mov    0xc(%eax),%eax
    5084:	85 c0                	test   %eax,%eax
    5086:	74 30                	je     50b8 <huffman_decoder+0x2c3>
       if ((h->xlen-1) == *x) 
    5088:	8b 45 08             	mov    0x8(%ebp),%eax
    508b:	8b 40 04             	mov    0x4(%eax),%eax
    508e:	8d 50 ff             	lea    -0x1(%eax),%edx
    5091:	8b 45 0c             	mov    0xc(%ebp),%eax
    5094:	8b 00                	mov    (%eax),%eax
    5096:	39 c2                	cmp    %eax,%edx
    5098:	75 1e                	jne    50b8 <huffman_decoder+0x2c3>
         *x += hgetbits(h->linbits);
    509a:	8b 45 0c             	mov    0xc(%ebp),%eax
    509d:	8b 00                	mov    (%eax),%eax
    509f:	89 c3                	mov    %eax,%ebx
    50a1:	8b 45 08             	mov    0x8(%ebp),%eax
    50a4:	8b 40 0c             	mov    0xc(%eax),%eax
    50a7:	89 04 24             	mov    %eax,(%esp)
    50aa:	e8 0e fc ff ff       	call   4cbd <hgetbits>
    50af:	01 d8                	add    %ebx,%eax
    50b1:	89 c2                	mov    %eax,%edx
    50b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    50b6:	89 10                	mov    %edx,(%eax)
     if (*x)
    50b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    50bb:	8b 00                	mov    (%eax),%eax
    50bd:	85 c0                	test   %eax,%eax
    50bf:	74 18                	je     50d9 <huffman_decoder+0x2e4>
        if (hget1bit() == 1) *x = -*x;
    50c1:	e8 12 fc ff ff       	call   4cd8 <hget1bit>
    50c6:	83 f8 01             	cmp    $0x1,%eax
    50c9:	75 0e                	jne    50d9 <huffman_decoder+0x2e4>
    50cb:	8b 45 0c             	mov    0xc(%ebp),%eax
    50ce:	8b 00                	mov    (%eax),%eax
    50d0:	89 c2                	mov    %eax,%edx
    50d2:	f7 da                	neg    %edx
    50d4:	8b 45 0c             	mov    0xc(%ebp),%eax
    50d7:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    50d9:	8b 45 08             	mov    0x8(%ebp),%eax
    50dc:	8b 40 0c             	mov    0xc(%eax),%eax
    50df:	85 c0                	test   %eax,%eax
    50e1:	74 30                	je     5113 <huffman_decoder+0x31e>
       if ((h->ylen-1) == *y)
    50e3:	8b 45 08             	mov    0x8(%ebp),%eax
    50e6:	8b 40 08             	mov    0x8(%eax),%eax
    50e9:	8d 50 ff             	lea    -0x1(%eax),%edx
    50ec:	8b 45 10             	mov    0x10(%ebp),%eax
    50ef:	8b 00                	mov    (%eax),%eax
    50f1:	39 c2                	cmp    %eax,%edx
    50f3:	75 1e                	jne    5113 <huffman_decoder+0x31e>
         *y += hgetbits(h->linbits);
    50f5:	8b 45 10             	mov    0x10(%ebp),%eax
    50f8:	8b 00                	mov    (%eax),%eax
    50fa:	89 c3                	mov    %eax,%ebx
    50fc:	8b 45 08             	mov    0x8(%ebp),%eax
    50ff:	8b 40 0c             	mov    0xc(%eax),%eax
    5102:	89 04 24             	mov    %eax,(%esp)
    5105:	e8 b3 fb ff ff       	call   4cbd <hgetbits>
    510a:	01 d8                	add    %ebx,%eax
    510c:	89 c2                	mov    %eax,%edx
    510e:	8b 45 10             	mov    0x10(%ebp),%eax
    5111:	89 10                	mov    %edx,(%eax)
     if (*y)
    5113:	8b 45 10             	mov    0x10(%ebp),%eax
    5116:	8b 00                	mov    (%eax),%eax
    5118:	85 c0                	test   %eax,%eax
    511a:	74 1b                	je     5137 <huffman_decoder+0x342>
        if (hget1bit() == 1) *y = -*y;
    511c:	e8 b7 fb ff ff       	call   4cd8 <hget1bit>
    5121:	83 f8 01             	cmp    $0x1,%eax
    5124:	75 11                	jne    5137 <huffman_decoder+0x342>
    5126:	8b 45 10             	mov    0x10(%ebp),%eax
    5129:	8b 00                	mov    (%eax),%eax
    512b:	89 c2                	mov    %eax,%edx
    512d:	f7 da                	neg    %edx
    512f:	8b 45 10             	mov    0x10(%ebp),%eax
    5132:	89 10                	mov    %edx,(%eax)
    5134:	eb 01                	jmp    5137 <huffman_decoder+0x342>
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    5136:	90                   	nop
        if (hget1bit() == 1) *y = -*y;
     }

  // output_buf2();
	  
  return error;  
    5137:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    513a:	83 c4 24             	add    $0x24,%esp
    513d:	5b                   	pop    %ebx
    513e:	5d                   	pop    %ebp
    513f:	c3                   	ret    

00005140 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    5140:	55                   	push   %ebp
    5141:	89 e5                	mov    %esp,%ebp
    5143:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    5146:	8b 45 0c             	mov    0xc(%ebp),%eax
    5149:	8b 00                	mov    (%eax),%eax
    514b:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    514e:	8b 45 08             	mov    0x8(%ebp),%eax
    5151:	89 04 24             	mov    %eax,(%esp)
    5154:	e8 e8 f6 ff ff       	call   4841 <get1bit>
    5159:	89 c2                	mov    %eax,%edx
    515b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    515e:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    5160:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5167:	00 
    5168:	8b 45 08             	mov    0x8(%ebp),%eax
    516b:	89 04 24             	mov    %eax,(%esp)
    516e:	e8 e4 f7 ff ff       	call   4957 <getbits>
    5173:	ba 04 00 00 00       	mov    $0x4,%edx
    5178:	89 d1                	mov    %edx,%ecx
    517a:	29 c1                	sub    %eax,%ecx
    517c:	89 c8                	mov    %ecx,%eax
    517e:	89 c2                	mov    %eax,%edx
    5180:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5183:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* 错误保护. TRUE/FALSE */
    5186:	8b 45 08             	mov    0x8(%ebp),%eax
    5189:	89 04 24             	mov    %eax,(%esp)
    518c:	e8 b0 f6 ff ff       	call   4841 <get1bit>
    5191:	85 c0                	test   %eax,%eax
    5193:	0f 94 c0             	sete   %al
    5196:	0f b6 d0             	movzbl %al,%edx
    5199:	8b 45 f4             	mov    -0xc(%ebp),%eax
    519c:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    519f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    51a6:	00 
    51a7:	8b 45 08             	mov    0x8(%ebp),%eax
    51aa:	89 04 24             	mov    %eax,(%esp)
    51ad:	e8 a5 f7 ff ff       	call   4957 <getbits>
    51b2:	89 c2                	mov    %eax,%edx
    51b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51b7:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    51ba:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    51c1:	00 
    51c2:	8b 45 08             	mov    0x8(%ebp),%eax
    51c5:	89 04 24             	mov    %eax,(%esp)
    51c8:	e8 8a f7 ff ff       	call   4957 <getbits>
    51cd:	89 c2                	mov    %eax,%edx
    51cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51d2:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    51d5:	8b 45 08             	mov    0x8(%ebp),%eax
    51d8:	89 04 24             	mov    %eax,(%esp)
    51db:	e8 61 f6 ff ff       	call   4841 <get1bit>
    51e0:	89 c2                	mov    %eax,%edx
    51e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51e5:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    51e8:	8b 45 08             	mov    0x8(%ebp),%eax
    51eb:	89 04 24             	mov    %eax,(%esp)
    51ee:	e8 4e f6 ff ff       	call   4841 <get1bit>
    51f3:	89 c2                	mov    %eax,%edx
    51f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51f8:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    51fb:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5202:	00 
    5203:	8b 45 08             	mov    0x8(%ebp),%eax
    5206:	89 04 24             	mov    %eax,(%esp)
    5209:	e8 49 f7 ff ff       	call   4957 <getbits>
    520e:	89 c2                	mov    %eax,%edx
    5210:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5213:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    5216:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    521d:	00 
    521e:	8b 45 08             	mov    0x8(%ebp),%eax
    5221:	89 04 24             	mov    %eax,(%esp)
    5224:	e8 2e f7 ff ff       	call   4957 <getbits>
    5229:	89 c2                	mov    %eax,%edx
    522b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    522e:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    5231:	8b 45 08             	mov    0x8(%ebp),%eax
    5234:	89 04 24             	mov    %eax,(%esp)
    5237:	e8 05 f6 ff ff       	call   4841 <get1bit>
    523c:	89 c2                	mov    %eax,%edx
    523e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5241:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    5244:	8b 45 08             	mov    0x8(%ebp),%eax
    5247:	89 04 24             	mov    %eax,(%esp)
    524a:	e8 f2 f5 ff ff       	call   4841 <get1bit>
    524f:	89 c2                	mov    %eax,%edx
    5251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5254:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    5257:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    525e:	00 
    525f:	8b 45 08             	mov    0x8(%ebp),%eax
    5262:	89 04 24             	mov    %eax,(%esp)
    5265:	e8 ed f6 ff ff       	call   4957 <getbits>
    526a:	89 c2                	mov    %eax,%edx
    526c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    526f:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    5272:	c9                   	leave  
    5273:	c3                   	ret    

00005274 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    5274:	55                   	push   %ebp
    5275:	89 e5                	mov    %esp,%ebp
    5277:	56                   	push   %esi
    5278:	53                   	push   %ebx
    5279:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    527c:	8b 45 10             	mov    0x10(%ebp),%eax
    527f:	8b 40 08             	mov    0x8(%eax),%eax
    5282:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    5285:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    528c:	00 
    528d:	8b 45 08             	mov    0x8(%ebp),%eax
    5290:	89 04 24             	mov    %eax,(%esp)
    5293:	e8 bf f6 ff ff       	call   4957 <getbits>
    5298:	8b 55 0c             	mov    0xc(%ebp),%edx
    529b:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    529d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    52a1:	75 1b                	jne    52be <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    52a3:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    52aa:	00 
    52ab:	8b 45 08             	mov    0x8(%ebp),%eax
    52ae:	89 04 24             	mov    %eax,(%esp)
    52b1:	e8 a1 f6 ff ff       	call   4957 <getbits>
    52b6:	8b 55 0c             	mov    0xc(%ebp),%edx
    52b9:	89 42 04             	mov    %eax,0x4(%edx)
    52bc:	eb 19                	jmp    52d7 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    52be:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    52c5:	00 
    52c6:	8b 45 08             	mov    0x8(%ebp),%eax
    52c9:	89 04 24             	mov    %eax,(%esp)
    52cc:	e8 86 f6 ff ff       	call   4957 <getbits>
    52d1:	8b 55 0c             	mov    0xc(%ebp),%edx
    52d4:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    52d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    52de:	eb 3b                	jmp    531b <III_get_side_info+0xa7>
		for (i=0; i<4; i++)
    52e0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    52e7:	eb 28                	jmp    5311 <III_get_side_info+0x9d>
			si->ch[ch].scfsi[i] = get1bit(bs);
    52e9:	8b 45 08             	mov    0x8(%ebp),%eax
    52ec:	89 04 24             	mov    %eax,(%esp)
    52ef:	e8 4d f5 ff ff       	call   4841 <get1bit>
    52f4:	89 c1                	mov    %eax,%ecx
    52f6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    52f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    52fc:	89 d0                	mov    %edx,%eax
    52fe:	c1 e0 02             	shl    $0x2,%eax
    5301:	01 d0                	add    %edx,%eax
    5303:	c1 e0 03             	shl    $0x3,%eax
    5306:	03 45 ec             	add    -0x14(%ebp),%eax
    5309:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    530d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5311:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    5315:	7e d2                	jle    52e9 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    5317:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    531b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    531e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    5321:	7c bd                	jl     52e0 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    5323:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    532a:	e9 bf 05 00 00       	jmp    58ee <III_get_side_info+0x67a>
		for (ch=0; ch<stereo; ch++) {
    532f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5336:	e9 a3 05 00 00       	jmp    58de <III_get_side_info+0x66a>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    533b:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    5342:	00 
    5343:	8b 45 08             	mov    0x8(%ebp),%eax
    5346:	89 04 24             	mov    %eax,(%esp)
    5349:	e8 09 f6 ff ff       	call   4957 <getbits>
    534e:	89 c3                	mov    %eax,%ebx
    5350:	8b 75 0c             	mov    0xc(%ebp),%esi
    5353:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5356:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5359:	89 c2                	mov    %eax,%edx
    535b:	c1 e2 03             	shl    $0x3,%edx
    535e:	01 c2                	add    %eax,%edx
    5360:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5367:	89 c2                	mov    %eax,%edx
    5369:	89 c8                	mov    %ecx,%eax
    536b:	c1 e0 02             	shl    $0x2,%eax
    536e:	01 c8                	add    %ecx,%eax
    5370:	c1 e0 05             	shl    $0x5,%eax
    5373:	01 d0                	add    %edx,%eax
    5375:	01 f0                	add    %esi,%eax
    5377:	83 c0 18             	add    $0x18,%eax
    537a:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    537c:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    5383:	00 
    5384:	8b 45 08             	mov    0x8(%ebp),%eax
    5387:	89 04 24             	mov    %eax,(%esp)
    538a:	e8 c8 f5 ff ff       	call   4957 <getbits>
    538f:	89 c3                	mov    %eax,%ebx
    5391:	8b 75 0c             	mov    0xc(%ebp),%esi
    5394:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5397:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    539a:	89 c2                	mov    %eax,%edx
    539c:	c1 e2 03             	shl    $0x3,%edx
    539f:	01 c2                	add    %eax,%edx
    53a1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    53a8:	89 c2                	mov    %eax,%edx
    53aa:	89 c8                	mov    %ecx,%eax
    53ac:	c1 e0 02             	shl    $0x2,%eax
    53af:	01 c8                	add    %ecx,%eax
    53b1:	c1 e0 05             	shl    $0x5,%eax
    53b4:	01 d0                	add    %edx,%eax
    53b6:	01 f0                	add    %esi,%eax
    53b8:	83 c0 1c             	add    $0x1c,%eax
    53bb:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    53bd:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    53c4:	00 
    53c5:	8b 45 08             	mov    0x8(%ebp),%eax
    53c8:	89 04 24             	mov    %eax,(%esp)
    53cb:	e8 87 f5 ff ff       	call   4957 <getbits>
    53d0:	89 c3                	mov    %eax,%ebx
    53d2:	8b 75 0c             	mov    0xc(%ebp),%esi
    53d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53d8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    53db:	89 c2                	mov    %eax,%edx
    53dd:	c1 e2 03             	shl    $0x3,%edx
    53e0:	01 c2                	add    %eax,%edx
    53e2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    53e9:	89 c2                	mov    %eax,%edx
    53eb:	89 c8                	mov    %ecx,%eax
    53ed:	c1 e0 02             	shl    $0x2,%eax
    53f0:	01 c8                	add    %ecx,%eax
    53f2:	c1 e0 05             	shl    $0x5,%eax
    53f5:	01 d0                	add    %edx,%eax
    53f7:	01 f0                	add    %esi,%eax
    53f9:	83 c0 20             	add    $0x20,%eax
    53fc:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    53fe:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5405:	00 
    5406:	8b 45 08             	mov    0x8(%ebp),%eax
    5409:	89 04 24             	mov    %eax,(%esp)
    540c:	e8 46 f5 ff ff       	call   4957 <getbits>
    5411:	89 c3                	mov    %eax,%ebx
    5413:	8b 75 0c             	mov    0xc(%ebp),%esi
    5416:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5419:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    541c:	89 c2                	mov    %eax,%edx
    541e:	c1 e2 03             	shl    $0x3,%edx
    5421:	01 c2                	add    %eax,%edx
    5423:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    542a:	89 c2                	mov    %eax,%edx
    542c:	89 c8                	mov    %ecx,%eax
    542e:	c1 e0 02             	shl    $0x2,%eax
    5431:	01 c8                	add    %ecx,%eax
    5433:	c1 e0 05             	shl    $0x5,%eax
    5436:	01 d0                	add    %edx,%eax
    5438:	01 f0                	add    %esi,%eax
    543a:	83 c0 24             	add    $0x24,%eax
    543d:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    543f:	8b 45 08             	mov    0x8(%ebp),%eax
    5442:	89 04 24             	mov    %eax,(%esp)
    5445:	e8 f7 f3 ff ff       	call   4841 <get1bit>
    544a:	89 c3                	mov    %eax,%ebx
    544c:	8b 75 0c             	mov    0xc(%ebp),%esi
    544f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5452:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5455:	89 c2                	mov    %eax,%edx
    5457:	c1 e2 03             	shl    $0x3,%edx
    545a:	01 c2                	add    %eax,%edx
    545c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5463:	89 c2                	mov    %eax,%edx
    5465:	89 c8                	mov    %ecx,%eax
    5467:	c1 e0 02             	shl    $0x2,%eax
    546a:	01 c8                	add    %ecx,%eax
    546c:	c1 e0 05             	shl    $0x5,%eax
    546f:	01 d0                	add    %edx,%eax
    5471:	01 f0                	add    %esi,%eax
    5473:	83 c0 28             	add    $0x28,%eax
    5476:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    5478:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    547b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    547e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5481:	89 c2                	mov    %eax,%edx
    5483:	c1 e2 03             	shl    $0x3,%edx
    5486:	01 c2                	add    %eax,%edx
    5488:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    548f:	89 c2                	mov    %eax,%edx
    5491:	89 c8                	mov    %ecx,%eax
    5493:	c1 e0 02             	shl    $0x2,%eax
    5496:	01 c8                	add    %ecx,%eax
    5498:	c1 e0 05             	shl    $0x5,%eax
    549b:	01 d0                	add    %edx,%eax
    549d:	01 d8                	add    %ebx,%eax
    549f:	83 c0 28             	add    $0x28,%eax
    54a2:	8b 00                	mov    (%eax),%eax
    54a4:	85 c0                	test   %eax,%eax
    54a6:	0f 84 7e 02 00 00    	je     572a <III_get_side_info+0x4b6>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    54ac:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    54b3:	00 
    54b4:	8b 45 08             	mov    0x8(%ebp),%eax
    54b7:	89 04 24             	mov    %eax,(%esp)
    54ba:	e8 98 f4 ff ff       	call   4957 <getbits>
    54bf:	89 c3                	mov    %eax,%ebx
    54c1:	8b 75 0c             	mov    0xc(%ebp),%esi
    54c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    54ca:	89 c2                	mov    %eax,%edx
    54cc:	c1 e2 03             	shl    $0x3,%edx
    54cf:	01 c2                	add    %eax,%edx
    54d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    54d8:	89 c2                	mov    %eax,%edx
    54da:	89 c8                	mov    %ecx,%eax
    54dc:	c1 e0 02             	shl    $0x2,%eax
    54df:	01 c8                	add    %ecx,%eax
    54e1:	c1 e0 05             	shl    $0x5,%eax
    54e4:	01 d0                	add    %edx,%eax
    54e6:	01 f0                	add    %esi,%eax
    54e8:	83 c0 2c             	add    $0x2c,%eax
    54eb:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    54ed:	8b 45 08             	mov    0x8(%ebp),%eax
    54f0:	89 04 24             	mov    %eax,(%esp)
    54f3:	e8 49 f3 ff ff       	call   4841 <get1bit>
    54f8:	89 c3                	mov    %eax,%ebx
    54fa:	8b 75 0c             	mov    0xc(%ebp),%esi
    54fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5500:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5503:	89 c2                	mov    %eax,%edx
    5505:	c1 e2 03             	shl    $0x3,%edx
    5508:	01 c2                	add    %eax,%edx
    550a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5511:	89 c2                	mov    %eax,%edx
    5513:	89 c8                	mov    %ecx,%eax
    5515:	c1 e0 02             	shl    $0x2,%eax
    5518:	01 c8                	add    %ecx,%eax
    551a:	c1 e0 05             	shl    $0x5,%eax
    551d:	01 d0                	add    %edx,%eax
    551f:	01 f0                	add    %esi,%eax
    5521:	83 c0 30             	add    $0x30,%eax
    5524:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    5526:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    552d:	eb 44                	jmp    5573 <III_get_side_info+0x2ff>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    552f:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5536:	00 
    5537:	8b 45 08             	mov    0x8(%ebp),%eax
    553a:	89 04 24             	mov    %eax,(%esp)
    553d:	e8 15 f4 ff ff       	call   4957 <getbits>
    5542:	89 c3                	mov    %eax,%ebx
    5544:	8b 75 0c             	mov    0xc(%ebp),%esi
    5547:	8b 45 f0             	mov    -0x10(%ebp),%eax
    554a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    554d:	89 c2                	mov    %eax,%edx
    554f:	c1 e2 03             	shl    $0x3,%edx
    5552:	01 c2                	add    %eax,%edx
    5554:	8d 04 12             	lea    (%edx,%edx,1),%eax
    5557:	89 c2                	mov    %eax,%edx
    5559:	89 c8                	mov    %ecx,%eax
    555b:	c1 e0 02             	shl    $0x2,%eax
    555e:	01 c8                	add    %ecx,%eax
    5560:	c1 e0 03             	shl    $0x3,%eax
    5563:	01 d0                	add    %edx,%eax
    5565:	03 45 ec             	add    -0x14(%ebp),%eax
    5568:	83 c0 08             	add    $0x8,%eax
    556b:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    556f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5573:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    5577:	7e b6                	jle    552f <III_get_side_info+0x2bb>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    5579:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5580:	eb 44                	jmp    55c6 <III_get_side_info+0x352>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    5582:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5589:	00 
    558a:	8b 45 08             	mov    0x8(%ebp),%eax
    558d:	89 04 24             	mov    %eax,(%esp)
    5590:	e8 c2 f3 ff ff       	call   4957 <getbits>
    5595:	89 c3                	mov    %eax,%ebx
    5597:	8b 75 0c             	mov    0xc(%ebp),%esi
    559a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    559d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    55a0:	89 c2                	mov    %eax,%edx
    55a2:	c1 e2 03             	shl    $0x3,%edx
    55a5:	01 c2                	add    %eax,%edx
    55a7:	8d 04 12             	lea    (%edx,%edx,1),%eax
    55aa:	89 c2                	mov    %eax,%edx
    55ac:	89 c8                	mov    %ecx,%eax
    55ae:	c1 e0 02             	shl    $0x2,%eax
    55b1:	01 c8                	add    %ecx,%eax
    55b3:	c1 e0 03             	shl    $0x3,%eax
    55b6:	01 d0                	add    %edx,%eax
    55b8:	03 45 ec             	add    -0x14(%ebp),%eax
    55bb:	83 c0 0c             	add    $0xc,%eax
    55be:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    55c2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    55c6:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    55ca:	7e b6                	jle    5582 <III_get_side_info+0x30e>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    55cc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    55cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55d2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    55d5:	89 c2                	mov    %eax,%edx
    55d7:	c1 e2 03             	shl    $0x3,%edx
    55da:	01 c2                	add    %eax,%edx
    55dc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    55e3:	89 c2                	mov    %eax,%edx
    55e5:	89 c8                	mov    %ecx,%eax
    55e7:	c1 e0 02             	shl    $0x2,%eax
    55ea:	01 c8                	add    %ecx,%eax
    55ec:	c1 e0 05             	shl    $0x5,%eax
    55ef:	01 d0                	add    %edx,%eax
    55f1:	01 d8                	add    %ebx,%eax
    55f3:	83 c0 2c             	add    $0x2c,%eax
    55f6:	8b 00                	mov    (%eax),%eax
    55f8:	85 c0                	test   %eax,%eax
    55fa:	75 05                	jne    5601 <III_get_side_info+0x38d>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    55fc:	e8 4f e6 ff ff       	call   3c50 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    5601:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5604:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5607:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    560a:	89 c2                	mov    %eax,%edx
    560c:	c1 e2 03             	shl    $0x3,%edx
    560f:	01 c2                	add    %eax,%edx
    5611:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5618:	89 c2                	mov    %eax,%edx
    561a:	89 c8                	mov    %ecx,%eax
    561c:	c1 e0 02             	shl    $0x2,%eax
    561f:	01 c8                	add    %ecx,%eax
    5621:	c1 e0 05             	shl    $0x5,%eax
    5624:	01 d0                	add    %edx,%eax
    5626:	01 d8                	add    %ebx,%eax
    5628:	83 c0 2c             	add    $0x2c,%eax
    562b:	8b 00                	mov    (%eax),%eax
    562d:	83 f8 02             	cmp    $0x2,%eax
    5630:	75 62                	jne    5694 <III_get_side_info+0x420>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    5632:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5635:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5638:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    563b:	89 c2                	mov    %eax,%edx
    563d:	c1 e2 03             	shl    $0x3,%edx
    5640:	01 c2                	add    %eax,%edx
    5642:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5649:	89 c2                	mov    %eax,%edx
    564b:	89 c8                	mov    %ecx,%eax
    564d:	c1 e0 02             	shl    $0x2,%eax
    5650:	01 c8                	add    %ecx,%eax
    5652:	c1 e0 05             	shl    $0x5,%eax
    5655:	01 d0                	add    %edx,%eax
    5657:	01 d8                	add    %ebx,%eax
    5659:	83 c0 30             	add    $0x30,%eax
    565c:	8b 00                	mov    (%eax),%eax
    565e:	85 c0                	test   %eax,%eax
    5660:	75 32                	jne    5694 <III_get_side_info+0x420>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    5662:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5665:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5668:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    566b:	89 c2                	mov    %eax,%edx
    566d:	c1 e2 03             	shl    $0x3,%edx
    5670:	01 c2                	add    %eax,%edx
    5672:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5679:	89 c2                	mov    %eax,%edx
    567b:	89 c8                	mov    %ecx,%eax
    567d:	c1 e0 02             	shl    $0x2,%eax
    5680:	01 c8                	add    %ecx,%eax
    5682:	c1 e0 05             	shl    $0x5,%eax
    5685:	01 d0                	add    %edx,%eax
    5687:	01 d8                	add    %ebx,%eax
    5689:	83 c0 4c             	add    $0x4c,%eax
    568c:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    5692:	eb 30                	jmp    56c4 <III_get_side_info+0x450>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    5694:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5697:	8b 45 f0             	mov    -0x10(%ebp),%eax
    569a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    569d:	89 c2                	mov    %eax,%edx
    569f:	c1 e2 03             	shl    $0x3,%edx
    56a2:	01 c2                	add    %eax,%edx
    56a4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    56ab:	89 c2                	mov    %eax,%edx
    56ad:	89 c8                	mov    %ecx,%eax
    56af:	c1 e0 02             	shl    $0x2,%eax
    56b2:	01 c8                	add    %ecx,%eax
    56b4:	c1 e0 05             	shl    $0x5,%eax
    56b7:	01 d0                	add    %edx,%eax
    56b9:	01 d8                	add    %ebx,%eax
    56bb:	83 c0 4c             	add    $0x4c,%eax
    56be:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    56c4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    56c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56ca:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    56cd:	89 c2                	mov    %eax,%edx
    56cf:	c1 e2 03             	shl    $0x3,%edx
    56d2:	01 c2                	add    %eax,%edx
    56d4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    56db:	89 c2                	mov    %eax,%edx
    56dd:	89 c8                	mov    %ecx,%eax
    56df:	c1 e0 02             	shl    $0x2,%eax
    56e2:	01 c8                	add    %ecx,%eax
    56e4:	c1 e0 05             	shl    $0x5,%eax
    56e7:	01 d0                	add    %edx,%eax
    56e9:	01 d8                	add    %ebx,%eax
    56eb:	83 c0 4c             	add    $0x4c,%eax
    56ee:	8b 00                	mov    (%eax),%eax
    56f0:	ba 14 00 00 00       	mov    $0x14,%edx
    56f5:	89 d3                	mov    %edx,%ebx
    56f7:	29 c3                	sub    %eax,%ebx
    56f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    56fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56ff:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5702:	89 c2                	mov    %eax,%edx
    5704:	c1 e2 03             	shl    $0x3,%edx
    5707:	01 c2                	add    %eax,%edx
    5709:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5710:	89 c2                	mov    %eax,%edx
    5712:	89 c8                	mov    %ecx,%eax
    5714:	c1 e0 02             	shl    $0x2,%eax
    5717:	01 c8                	add    %ecx,%eax
    5719:	c1 e0 05             	shl    $0x5,%eax
    571c:	01 d0                	add    %edx,%eax
    571e:	01 f0                	add    %esi,%eax
    5720:	83 c0 50             	add    $0x50,%eax
    5723:	89 18                	mov    %ebx,(%eax)
    5725:	e9 05 01 00 00       	jmp    582f <III_get_side_info+0x5bb>
			}
			else {
				for (i=0; i<3; i++)
    572a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5731:	eb 44                	jmp    5777 <III_get_side_info+0x503>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    5733:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    573a:	00 
    573b:	8b 45 08             	mov    0x8(%ebp),%eax
    573e:	89 04 24             	mov    %eax,(%esp)
    5741:	e8 11 f2 ff ff       	call   4957 <getbits>
    5746:	89 c3                	mov    %eax,%ebx
    5748:	8b 75 0c             	mov    0xc(%ebp),%esi
    574b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    574e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5751:	89 c2                	mov    %eax,%edx
    5753:	c1 e2 03             	shl    $0x3,%edx
    5756:	01 c2                	add    %eax,%edx
    5758:	8d 04 12             	lea    (%edx,%edx,1),%eax
    575b:	89 c2                	mov    %eax,%edx
    575d:	89 c8                	mov    %ecx,%eax
    575f:	c1 e0 02             	shl    $0x2,%eax
    5762:	01 c8                	add    %ecx,%eax
    5764:	c1 e0 03             	shl    $0x3,%eax
    5767:	01 d0                	add    %edx,%eax
    5769:	03 45 ec             	add    -0x14(%ebp),%eax
    576c:	83 c0 08             	add    $0x8,%eax
    576f:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    5773:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5777:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    577b:	7e b6                	jle    5733 <III_get_side_info+0x4bf>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    577d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5784:	00 
    5785:	8b 45 08             	mov    0x8(%ebp),%eax
    5788:	89 04 24             	mov    %eax,(%esp)
    578b:	e8 c7 f1 ff ff       	call   4957 <getbits>
    5790:	89 c3                	mov    %eax,%ebx
    5792:	8b 75 0c             	mov    0xc(%ebp),%esi
    5795:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5798:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    579b:	89 c2                	mov    %eax,%edx
    579d:	c1 e2 03             	shl    $0x3,%edx
    57a0:	01 c2                	add    %eax,%edx
    57a2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    57a9:	89 c2                	mov    %eax,%edx
    57ab:	89 c8                	mov    %ecx,%eax
    57ad:	c1 e0 02             	shl    $0x2,%eax
    57b0:	01 c8                	add    %ecx,%eax
    57b2:	c1 e0 05             	shl    $0x5,%eax
    57b5:	01 d0                	add    %edx,%eax
    57b7:	01 f0                	add    %esi,%eax
    57b9:	83 c0 4c             	add    $0x4c,%eax
    57bc:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    57be:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    57c5:	00 
    57c6:	8b 45 08             	mov    0x8(%ebp),%eax
    57c9:	89 04 24             	mov    %eax,(%esp)
    57cc:	e8 86 f1 ff ff       	call   4957 <getbits>
    57d1:	89 c3                	mov    %eax,%ebx
    57d3:	8b 75 0c             	mov    0xc(%ebp),%esi
    57d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    57d9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    57dc:	89 c2                	mov    %eax,%edx
    57de:	c1 e2 03             	shl    $0x3,%edx
    57e1:	01 c2                	add    %eax,%edx
    57e3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    57ea:	89 c2                	mov    %eax,%edx
    57ec:	89 c8                	mov    %ecx,%eax
    57ee:	c1 e0 02             	shl    $0x2,%eax
    57f1:	01 c8                	add    %ecx,%eax
    57f3:	c1 e0 05             	shl    $0x5,%eax
    57f6:	01 d0                	add    %edx,%eax
    57f8:	01 f0                	add    %esi,%eax
    57fa:	83 c0 50             	add    $0x50,%eax
    57fd:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    57ff:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5802:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5805:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5808:	89 c2                	mov    %eax,%edx
    580a:	c1 e2 03             	shl    $0x3,%edx
    580d:	01 c2                	add    %eax,%edx
    580f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5816:	89 c2                	mov    %eax,%edx
    5818:	89 c8                	mov    %ecx,%eax
    581a:	c1 e0 02             	shl    $0x2,%eax
    581d:	01 c8                	add    %ecx,%eax
    581f:	c1 e0 05             	shl    $0x5,%eax
    5822:	01 d0                	add    %edx,%eax
    5824:	01 d8                	add    %ebx,%eax
    5826:	83 c0 2c             	add    $0x2c,%eax
    5829:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    582f:	8b 45 08             	mov    0x8(%ebp),%eax
    5832:	89 04 24             	mov    %eax,(%esp)
    5835:	e8 07 f0 ff ff       	call   4841 <get1bit>
    583a:	89 c3                	mov    %eax,%ebx
    583c:	8b 75 0c             	mov    0xc(%ebp),%esi
    583f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5842:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5845:	89 c2                	mov    %eax,%edx
    5847:	c1 e2 03             	shl    $0x3,%edx
    584a:	01 c2                	add    %eax,%edx
    584c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5853:	89 c2                	mov    %eax,%edx
    5855:	89 c8                	mov    %ecx,%eax
    5857:	c1 e0 02             	shl    $0x2,%eax
    585a:	01 c8                	add    %ecx,%eax
    585c:	c1 e0 05             	shl    $0x5,%eax
    585f:	01 d0                	add    %edx,%eax
    5861:	01 f0                	add    %esi,%eax
    5863:	83 c0 54             	add    $0x54,%eax
    5866:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    5868:	8b 45 08             	mov    0x8(%ebp),%eax
    586b:	89 04 24             	mov    %eax,(%esp)
    586e:	e8 ce ef ff ff       	call   4841 <get1bit>
    5873:	89 c3                	mov    %eax,%ebx
    5875:	8b 75 0c             	mov    0xc(%ebp),%esi
    5878:	8b 45 f0             	mov    -0x10(%ebp),%eax
    587b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    587e:	89 c2                	mov    %eax,%edx
    5880:	c1 e2 03             	shl    $0x3,%edx
    5883:	01 c2                	add    %eax,%edx
    5885:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    588c:	89 c2                	mov    %eax,%edx
    588e:	89 c8                	mov    %ecx,%eax
    5890:	c1 e0 02             	shl    $0x2,%eax
    5893:	01 c8                	add    %ecx,%eax
    5895:	c1 e0 05             	shl    $0x5,%eax
    5898:	01 d0                	add    %edx,%eax
    589a:	01 f0                	add    %esi,%eax
    589c:	83 c0 58             	add    $0x58,%eax
    589f:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    58a1:	8b 45 08             	mov    0x8(%ebp),%eax
    58a4:	89 04 24             	mov    %eax,(%esp)
    58a7:	e8 95 ef ff ff       	call   4841 <get1bit>
    58ac:	89 c3                	mov    %eax,%ebx
    58ae:	8b 75 0c             	mov    0xc(%ebp),%esi
    58b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    58b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    58b7:	89 c2                	mov    %eax,%edx
    58b9:	c1 e2 03             	shl    $0x3,%edx
    58bc:	01 c2                	add    %eax,%edx
    58be:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    58c5:	89 c2                	mov    %eax,%edx
    58c7:	89 c8                	mov    %ecx,%eax
    58c9:	c1 e0 02             	shl    $0x2,%eax
    58cc:	01 c8                	add    %ecx,%eax
    58ce:	c1 e0 05             	shl    $0x5,%eax
    58d1:	01 d0                	add    %edx,%eax
    58d3:	01 f0                	add    %esi,%eax
    58d5:	83 c0 5c             	add    $0x5c,%eax
    58d8:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    58da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    58de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    58e1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    58e4:	0f 8c 51 fa ff ff    	jl     533b <III_get_side_info+0xc7>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    58ea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    58ee:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    58f2:	0f 8e 37 fa ff ff    	jle    532f <III_get_side_info+0xbb>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    58f8:	83 c4 20             	add    $0x20,%esp
    58fb:	5b                   	pop    %ebx
    58fc:	5e                   	pop    %esi
    58fd:	5d                   	pop    %ebp
    58fe:	c3                   	ret    

000058ff <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    58ff:	55                   	push   %ebp
    5900:	89 e5                	mov    %esp,%ebp
    5902:	56                   	push   %esi
    5903:	53                   	push   %ebx
    5904:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    5907:	8b 55 14             	mov    0x14(%ebp),%edx
    590a:	89 d0                	mov    %edx,%eax
    590c:	c1 e0 02             	shl    $0x2,%eax
    590f:	01 d0                	add    %edx,%eax
    5911:	c1 e0 05             	shl    $0x5,%eax
    5914:	83 c0 10             	add    $0x10,%eax
    5917:	03 45 0c             	add    0xc(%ebp),%eax
    591a:	8d 48 08             	lea    0x8(%eax),%ecx
    591d:	8b 55 10             	mov    0x10(%ebp),%edx
    5920:	89 d0                	mov    %edx,%eax
    5922:	c1 e0 03             	shl    $0x3,%eax
    5925:	01 d0                	add    %edx,%eax
    5927:	c1 e0 03             	shl    $0x3,%eax
    592a:	01 c8                	add    %ecx,%eax
    592c:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    592f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5932:	8b 40 10             	mov    0x10(%eax),%eax
    5935:	85 c0                	test   %eax,%eax
    5937:	0f 84 74 02 00 00    	je     5bb1 <III_get_scale_factors+0x2b2>
    593d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5940:	8b 40 14             	mov    0x14(%eax),%eax
    5943:	83 f8 02             	cmp    $0x2,%eax
    5946:	0f 85 65 02 00 00    	jne    5bb1 <III_get_scale_factors+0x2b2>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    594c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    594f:	8b 40 18             	mov    0x18(%eax),%eax
    5952:	85 c0                	test   %eax,%eax
    5954:	0f 84 62 01 00 00    	je     5abc <III_get_scale_factors+0x1bd>
			for (sfb = 0; sfb < 8; sfb++)
    595a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5961:	eb 32                	jmp    5995 <III_get_scale_factors+0x96>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    5963:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5966:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    5969:	8b 04 85 40 c3 00 00 	mov    0xc340(,%eax,4),%eax
    5970:	89 04 24             	mov    %eax,(%esp)
    5973:	e8 45 f3 ff ff       	call   4cbd <hgetbits>
    5978:	89 c3                	mov    %eax,%ebx
    597a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    597d:	8b 45 14             	mov    0x14(%ebp),%eax
    5980:	01 c0                	add    %eax,%eax
    5982:	89 c2                	mov    %eax,%edx
    5984:	c1 e2 05             	shl    $0x5,%edx
    5987:	29 c2                	sub    %eax,%edx
    5989:	89 d0                	mov    %edx,%eax
    598b:	03 45 f4             	add    -0xc(%ebp),%eax
    598e:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    5991:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5995:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    5999:	7e c8                	jle    5963 <III_get_scale_factors+0x64>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    599b:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    59a2:	eb 59                	jmp    59fd <III_get_scale_factors+0xfe>
				for (window=0; window<3; window++)
    59a4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    59ab:	eb 46                	jmp    59f3 <III_get_scale_factors+0xf4>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    59ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
    59b0:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    59b3:	8b 04 85 40 c3 00 00 	mov    0xc340(,%eax,4),%eax
    59ba:	89 04 24             	mov    %eax,(%esp)
    59bd:	e8 fb f2 ff ff       	call   4cbd <hgetbits>
    59c2:	89 c6                	mov    %eax,%esi
    59c4:	8b 5d 08             	mov    0x8(%ebp),%ebx
    59c7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    59ca:	8b 4d 14             	mov    0x14(%ebp),%ecx
    59cd:	89 d0                	mov    %edx,%eax
    59cf:	01 c0                	add    %eax,%eax
    59d1:	01 d0                	add    %edx,%eax
    59d3:	c1 e0 02             	shl    $0x2,%eax
    59d6:	01 d0                	add    %edx,%eax
    59d8:	89 ca                	mov    %ecx,%edx
    59da:	01 d2                	add    %edx,%edx
    59dc:	89 d1                	mov    %edx,%ecx
    59de:	c1 e1 05             	shl    $0x5,%ecx
    59e1:	29 d1                	sub    %edx,%ecx
    59e3:	01 c8                	add    %ecx,%eax
    59e5:	03 45 f4             	add    -0xc(%ebp),%eax
    59e8:	83 c0 14             	add    $0x14,%eax
    59eb:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    59ef:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    59f3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    59f7:	7e b4                	jle    59ad <III_get_scale_factors+0xae>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    59f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    59fd:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    5a01:	7e a1                	jle    59a4 <III_get_scale_factors+0xa5>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    5a03:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    5a0a:	eb 5c                	jmp    5a68 <III_get_scale_factors+0x169>
				for (window=0; window<3; window++)
    5a0c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5a13:	eb 49                	jmp    5a5e <III_get_scale_factors+0x15f>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    5a15:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5a18:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    5a1b:	83 c0 10             	add    $0x10,%eax
    5a1e:	8b 04 85 40 c3 00 00 	mov    0xc340(,%eax,4),%eax
    5a25:	89 04 24             	mov    %eax,(%esp)
    5a28:	e8 90 f2 ff ff       	call   4cbd <hgetbits>
    5a2d:	89 c6                	mov    %eax,%esi
    5a2f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5a32:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a35:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5a38:	89 d0                	mov    %edx,%eax
    5a3a:	01 c0                	add    %eax,%eax
    5a3c:	01 d0                	add    %edx,%eax
    5a3e:	c1 e0 02             	shl    $0x2,%eax
    5a41:	01 d0                	add    %edx,%eax
    5a43:	89 ca                	mov    %ecx,%edx
    5a45:	01 d2                	add    %edx,%edx
    5a47:	89 d1                	mov    %edx,%ecx
    5a49:	c1 e1 05             	shl    $0x5,%ecx
    5a4c:	29 d1                	sub    %edx,%ecx
    5a4e:	01 c8                	add    %ecx,%eax
    5a50:	03 45 f4             	add    -0xc(%ebp),%eax
    5a53:	83 c0 14             	add    $0x14,%eax
    5a56:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    5a5a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5a5e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5a62:	7e b1                	jle    5a15 <III_get_scale_factors+0x116>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    5a64:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5a68:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    5a6c:	7e 9e                	jle    5a0c <III_get_scale_factors+0x10d>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    5a6e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    5a75:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5a7c:	eb 33                	jmp    5ab1 <III_get_scale_factors+0x1b2>
				(*scalefac)[ch].s[window][sfb] = 0;
    5a7e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5a81:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a84:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5a87:	89 d0                	mov    %edx,%eax
    5a89:	01 c0                	add    %eax,%eax
    5a8b:	01 d0                	add    %edx,%eax
    5a8d:	c1 e0 02             	shl    $0x2,%eax
    5a90:	01 d0                	add    %edx,%eax
    5a92:	89 ca                	mov    %ecx,%edx
    5a94:	01 d2                	add    %edx,%edx
    5a96:	89 d1                	mov    %edx,%ecx
    5a98:	c1 e1 05             	shl    $0x5,%ecx
    5a9b:	29 d1                	sub    %edx,%ecx
    5a9d:	01 c8                	add    %ecx,%eax
    5a9f:	03 45 f4             	add    -0xc(%ebp),%eax
    5aa2:	83 c0 14             	add    $0x14,%eax
    5aa5:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    5aac:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    5aad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5ab1:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5ab5:	7e c7                	jle    5a7e <III_get_scale_factors+0x17f>
    5ab7:	e9 f0 00 00 00       	jmp    5bac <III_get_scale_factors+0x2ad>
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    5abc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5ac3:	e9 8c 00 00 00       	jmp    5b54 <III_get_scale_factors+0x255>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    5ac8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5acb:	83 c0 04             	add    $0x4,%eax
    5ace:	8b 04 85 24 c3 00 00 	mov    0xc324(,%eax,4),%eax
    5ad5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5ad8:	eb 61                	jmp    5b3b <III_get_scale_factors+0x23c>
					for (window=0; window<3; window++)
    5ada:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5ae1:	eb 4e                	jmp    5b31 <III_get_scale_factors+0x232>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    5ae3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5ae6:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    5ae9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5aec:	c1 e2 04             	shl    $0x4,%edx
    5aef:	01 d0                	add    %edx,%eax
    5af1:	8b 04 85 40 c3 00 00 	mov    0xc340(,%eax,4),%eax
    5af8:	89 04 24             	mov    %eax,(%esp)
    5afb:	e8 bd f1 ff ff       	call   4cbd <hgetbits>
    5b00:	89 c6                	mov    %eax,%esi
    5b02:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5b05:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5b08:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5b0b:	89 d0                	mov    %edx,%eax
    5b0d:	01 c0                	add    %eax,%eax
    5b0f:	01 d0                	add    %edx,%eax
    5b11:	c1 e0 02             	shl    $0x2,%eax
    5b14:	01 d0                	add    %edx,%eax
    5b16:	89 ca                	mov    %ecx,%edx
    5b18:	01 d2                	add    %edx,%edx
    5b1a:	89 d1                	mov    %edx,%ecx
    5b1c:	c1 e1 05             	shl    $0x5,%ecx
    5b1f:	29 d1                	sub    %edx,%ecx
    5b21:	01 c8                	add    %ecx,%eax
    5b23:	03 45 f4             	add    -0xc(%ebp),%eax
    5b26:	83 c0 14             	add    $0x14,%eax
    5b29:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    5b2d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5b31:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5b35:	7e ac                	jle    5ae3 <III_get_scale_factors+0x1e4>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    5b37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5b3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b3e:	83 c0 01             	add    $0x1,%eax
    5b41:	83 c0 04             	add    $0x4,%eax
    5b44:	8b 04 85 24 c3 00 00 	mov    0xc324(,%eax,4),%eax
    5b4b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5b4e:	7f 8a                	jg     5ada <III_get_scale_factors+0x1db>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    5b50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5b54:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5b58:	0f 8e 6a ff ff ff    	jle    5ac8 <III_get_scale_factors+0x1c9>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    5b5e:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    5b65:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5b6c:	eb 33                	jmp    5ba1 <III_get_scale_factors+0x2a2>
					(*scalefac)[ch].s[window][sfb] = 0;
    5b6e:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5b71:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5b74:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5b77:	89 d0                	mov    %edx,%eax
    5b79:	01 c0                	add    %eax,%eax
    5b7b:	01 d0                	add    %edx,%eax
    5b7d:	c1 e0 02             	shl    $0x2,%eax
    5b80:	01 d0                	add    %edx,%eax
    5b82:	89 ca                	mov    %ecx,%edx
    5b84:	01 d2                	add    %edx,%edx
    5b86:	89 d1                	mov    %edx,%ecx
    5b88:	c1 e1 05             	shl    $0x5,%ecx
    5b8b:	29 d1                	sub    %edx,%ecx
    5b8d:	01 c8                	add    %ecx,%eax
    5b8f:	03 45 f4             	add    -0xc(%ebp),%eax
    5b92:	83 c0 14             	add    $0x14,%eax
    5b95:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    5b9c:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    5b9d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5ba1:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5ba5:	7e c7                	jle    5b6e <III_get_scale_factors+0x26f>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    5ba7:	e9 be 00 00 00       	jmp    5c6a <III_get_scale_factors+0x36b>
    5bac:	e9 b9 00 00 00       	jmp    5c6a <III_get_scale_factors+0x36b>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    5bb1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5bb8:	e9 87 00 00 00       	jmp    5c44 <III_get_scale_factors+0x345>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    5bbd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    5bc0:	8b 55 14             	mov    0x14(%ebp),%edx
    5bc3:	89 d0                	mov    %edx,%eax
    5bc5:	c1 e0 02             	shl    $0x2,%eax
    5bc8:	01 d0                	add    %edx,%eax
    5bca:	c1 e0 03             	shl    $0x3,%eax
    5bcd:	03 45 f0             	add    -0x10(%ebp),%eax
    5bd0:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    5bd4:	85 c0                	test   %eax,%eax
    5bd6:	74 06                	je     5bde <III_get_scale_factors+0x2df>
    5bd8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    5bdc:	75 62                	jne    5c40 <III_get_scale_factors+0x341>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5bde:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5be1:	8b 04 85 20 c3 00 00 	mov    0xc320(,%eax,4),%eax
    5be8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5beb:	eb 41                	jmp    5c2e <III_get_scale_factors+0x32f>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    5bed:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5bf1:	0f 9f c0             	setg   %al
    5bf4:	0f b6 d0             	movzbl %al,%edx
    5bf7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5bfa:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    5bfd:	c1 e2 04             	shl    $0x4,%edx
    5c00:	01 d0                	add    %edx,%eax
    5c02:	8b 04 85 40 c3 00 00 	mov    0xc340(,%eax,4),%eax
    5c09:	89 04 24             	mov    %eax,(%esp)
    5c0c:	e8 ac f0 ff ff       	call   4cbd <hgetbits>
    5c11:	89 c3                	mov    %eax,%ebx
    5c13:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5c16:	8b 45 14             	mov    0x14(%ebp),%eax
    5c19:	01 c0                	add    %eax,%eax
    5c1b:	89 c2                	mov    %eax,%edx
    5c1d:	c1 e2 05             	shl    $0x5,%edx
    5c20:	29 c2                	sub    %eax,%edx
    5c22:	89 d0                	mov    %edx,%eax
    5c24:	03 45 f4             	add    -0xc(%ebp),%eax
    5c27:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5c2a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5c2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5c31:	83 c0 01             	add    $0x1,%eax
    5c34:	8b 04 85 20 c3 00 00 	mov    0xc320(,%eax,4),%eax
    5c3b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5c3e:	7f ad                	jg     5bed <III_get_scale_factors+0x2ee>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    5c40:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5c44:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    5c48:	0f 8e 6f ff ff ff    	jle    5bbd <III_get_scale_factors+0x2be>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    5c4e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5c51:	8b 45 14             	mov    0x14(%ebp),%eax
    5c54:	c1 e0 03             	shl    $0x3,%eax
    5c57:	89 c2                	mov    %eax,%edx
    5c59:	c1 e2 05             	shl    $0x5,%edx
    5c5c:	29 c2                	sub    %eax,%edx
    5c5e:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    5c61:	83 c0 58             	add    $0x58,%eax
    5c64:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    5c6a:	83 c4 20             	add    $0x20,%esp
    5c6d:	5b                   	pop    %ebx
    5c6e:	5e                   	pop    %esi
    5c6f:	5d                   	pop    %ebp
    5c70:	c3                   	ret    

00005c71 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    5c71:	55                   	push   %ebp
    5c72:	89 e5                	mov    %esp,%ebp
    5c74:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    5c77:	a1 60 d6 00 00       	mov    0xd660,%eax
    5c7c:	85 c0                	test   %eax,%eax
    5c7e:	75 11                	jne    5c91 <initialize_huffman+0x20>
	read_decoder_table();
    5c80:	e8 9f f0 ff ff       	call   4d24 <read_decoder_table>
	huffman_initialized = TRUE;
    5c85:	c7 05 60 d6 00 00 01 	movl   $0x1,0xd660
    5c8c:	00 00 00 
    5c8f:	eb 01                	jmp    5c92 <initialize_huffman+0x21>
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
	if (huffman_initialized) return;
    5c91:	90                   	nop
	read_decoder_table();
	huffman_initialized = TRUE;
}
    5c92:	c9                   	leave  
    5c93:	c3                   	ret    

00005c94 <III_hufman_decode>:
//   }
//   printf(0, "\n");
// }

void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    5c94:	55                   	push   %ebp
    5c95:	89 e5                	mov    %esp,%ebp
    5c97:	57                   	push   %edi
    5c98:	56                   	push   %esi
    5c99:	53                   	push   %ebx
    5c9a:	83 ec 4c             	sub    $0x4c,%esp

   // printf(0, "Now in hufman decode %d %d !\n", ch, gr);
   // output_side_info(si);
   // output_frps2(fr_ps);

   initialize_huffman();
    5c9d:	e8 cf ff ff ff       	call   5c71 <initialize_huffman>
   //    printf(0, "u:%d %d %d %d %d\n", u, ht[u].xlen, ht[u].ylen, ht[u].linbits, ht[u].linmax);
   // }

   /* 查找区域边界 */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5ca2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5ca5:	8b 45 14             	mov    0x14(%ebp),%eax
    5ca8:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5cab:	89 c2                	mov    %eax,%edx
    5cad:	c1 e2 03             	shl    $0x3,%edx
    5cb0:	01 c2                	add    %eax,%edx
    5cb2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5cb9:	89 c2                	mov    %eax,%edx
    5cbb:	89 c8                	mov    %ecx,%eax
    5cbd:	c1 e0 02             	shl    $0x2,%eax
    5cc0:	01 c8                	add    %ecx,%eax
    5cc2:	c1 e0 05             	shl    $0x5,%eax
    5cc5:	01 d0                	add    %edx,%eax
    5cc7:	01 d8                	add    %ebx,%eax
    5cc9:	83 c0 28             	add    $0x28,%eax
    5ccc:	8b 00                	mov    (%eax),%eax
    5cce:	85 c0                	test   %eax,%eax
    5cd0:	74 44                	je     5d16 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    5cd2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5cd5:	8b 45 14             	mov    0x14(%ebp),%eax
    5cd8:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5cdb:	89 c2                	mov    %eax,%edx
    5cdd:	c1 e2 03             	shl    $0x3,%edx
    5ce0:	01 c2                	add    %eax,%edx
    5ce2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5ce9:	89 c2                	mov    %eax,%edx
    5ceb:	89 c8                	mov    %ecx,%eax
    5ced:	c1 e0 02             	shl    $0x2,%eax
    5cf0:	01 c8                	add    %ecx,%eax
    5cf2:	c1 e0 05             	shl    $0x5,%eax
    5cf5:	01 d0                	add    %edx,%eax
    5cf7:	01 d8                	add    %ebx,%eax
    5cf9:	83 c0 2c             	add    $0x2c,%eax
    5cfc:	8b 00                	mov    (%eax),%eax
   //    printf(0, "u:%d %d %d %d %d\n", u, ht[u].xlen, ht[u].ylen, ht[u].linbits, ht[u].linmax);
   // }

   /* 查找区域边界 */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5cfe:	83 f8 02             	cmp    $0x2,%eax
    5d01:	75 13                	jne    5d16 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    5d03:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    5d0a:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    5d11:	e9 cc 00 00 00       	jmp    5de2 <III_hufman_decode+0x14e>
   }


   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5d16:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5d19:	8b 00                	mov    (%eax),%eax
    5d1b:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    5d1e:	8b 75 0c             	mov    0xc(%ebp),%esi
    5d21:	8b 45 14             	mov    0x14(%ebp),%eax
    5d24:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5d27:	89 c2                	mov    %eax,%edx
    5d29:	c1 e2 03             	shl    $0x3,%edx
    5d2c:	01 c2                	add    %eax,%edx
    5d2e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d35:	89 c2                	mov    %eax,%edx
    5d37:	89 d8                	mov    %ebx,%eax
    5d39:	c1 e0 02             	shl    $0x2,%eax
    5d3c:	01 d8                	add    %ebx,%eax
    5d3e:	c1 e0 05             	shl    $0x5,%eax
    5d41:	01 d0                	add    %edx,%eax
    5d43:	01 f0                	add    %esi,%eax
    5d45:	83 c0 4c             	add    $0x4c,%eax
    5d48:	8b 00                	mov    (%eax),%eax
    5d4a:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5d4d:	89 c8                	mov    %ecx,%eax
    5d4f:	c1 e0 03             	shl    $0x3,%eax
    5d52:	01 c8                	add    %ecx,%eax
    5d54:	c1 e0 02             	shl    $0x2,%eax
    5d57:	01 c8                	add    %ecx,%eax
    5d59:	01 d0                	add    %edx,%eax
    5d5b:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    5d62:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5d65:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5d68:	8b 00                	mov    (%eax),%eax
    5d6a:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5d6d:	8b 75 0c             	mov    0xc(%ebp),%esi
    5d70:	8b 45 14             	mov    0x14(%ebp),%eax
    5d73:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5d76:	89 c2                	mov    %eax,%edx
    5d78:	c1 e2 03             	shl    $0x3,%edx
    5d7b:	01 c2                	add    %eax,%edx
    5d7d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d84:	89 c2                	mov    %eax,%edx
    5d86:	89 d8                	mov    %ebx,%eax
    5d88:	c1 e0 02             	shl    $0x2,%eax
    5d8b:	01 d8                	add    %ebx,%eax
    5d8d:	c1 e0 05             	shl    $0x5,%eax
    5d90:	01 d0                	add    %edx,%eax
    5d92:	01 f0                	add    %esi,%eax
    5d94:	83 c0 4c             	add    $0x4c,%eax
    5d97:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5d99:	8b 7d 0c             	mov    0xc(%ebp),%edi
    5d9c:	8b 45 14             	mov    0x14(%ebp),%eax
    5d9f:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5da2:	89 c2                	mov    %eax,%edx
    5da4:	c1 e2 03             	shl    $0x3,%edx
    5da7:	01 c2                	add    %eax,%edx
    5da9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5db0:	89 c2                	mov    %eax,%edx
    5db2:	89 d8                	mov    %ebx,%eax
    5db4:	c1 e0 02             	shl    $0x2,%eax
    5db7:	01 d8                	add    %ebx,%eax
    5db9:	c1 e0 05             	shl    $0x5,%eax
    5dbc:	01 d0                	add    %edx,%eax
    5dbe:	01 f8                	add    %edi,%eax
    5dc0:	83 c0 50             	add    $0x50,%eax
    5dc3:	8b 00                	mov    (%eax),%eax
   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5dc5:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5dc7:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5dca:	89 c8                	mov    %ecx,%eax
    5dcc:	c1 e0 03             	shl    $0x3,%eax
    5dcf:	01 c8                	add    %ecx,%eax
    5dd1:	c1 e0 02             	shl    $0x2,%eax
    5dd4:	01 c8                	add    %ecx,%eax
    5dd6:	01 d0                	add    %edx,%eax
    5dd8:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    5ddf:	89 45 d8             	mov    %eax,-0x28(%ebp)
      }


   /* 读取大值区域Read bigvalues area. */
   // printf(0, "big_values=%d\n", (*si).ch[ch].gr[gr].big_values);
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5de2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5de9:	e9 aa 01 00 00       	jmp    5f98 <III_hufman_decode+0x304>
      if (i<region1Start) 
    5dee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5df1:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5df4:	7d 43                	jge    5e39 <III_hufman_decode+0x1a5>
        h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    5df6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5df9:	8b 45 14             	mov    0x14(%ebp),%eax
    5dfc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5dff:	89 c2                	mov    %eax,%edx
    5e01:	c1 e2 03             	shl    $0x3,%edx
    5e04:	01 c2                	add    %eax,%edx
    5e06:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e0d:	89 c2                	mov    %eax,%edx
    5e0f:	89 c8                	mov    %ecx,%eax
    5e11:	c1 e0 02             	shl    $0x2,%eax
    5e14:	01 c8                	add    %ecx,%eax
    5e16:	c1 e0 05             	shl    $0x5,%eax
    5e19:	01 d0                	add    %edx,%eax
    5e1b:	01 d8                	add    %ebx,%eax
    5e1d:	83 c0 34             	add    $0x34,%eax
    5e20:	8b 10                	mov    (%eax),%edx
    5e22:	89 d0                	mov    %edx,%eax
    5e24:	c1 e0 02             	shl    $0x2,%eax
    5e27:	01 d0                	add    %edx,%eax
    5e29:	c1 e0 03             	shl    $0x3,%eax
    5e2c:	05 c0 bd 00 00       	add    $0xbdc0,%eax
    5e31:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5e34:	e9 86 00 00 00       	jmp    5ebf <III_hufman_decode+0x22b>
      else if (i<region2Start) 
    5e39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5e3c:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5e3f:	7d 40                	jge    5e81 <III_hufman_decode+0x1ed>
        h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    5e41:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e44:	8b 45 14             	mov    0x14(%ebp),%eax
    5e47:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5e4a:	89 c2                	mov    %eax,%edx
    5e4c:	c1 e2 03             	shl    $0x3,%edx
    5e4f:	01 c2                	add    %eax,%edx
    5e51:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e58:	89 c2                	mov    %eax,%edx
    5e5a:	89 c8                	mov    %ecx,%eax
    5e5c:	c1 e0 02             	shl    $0x2,%eax
    5e5f:	01 c8                	add    %ecx,%eax
    5e61:	c1 e0 05             	shl    $0x5,%eax
    5e64:	01 d0                	add    %edx,%eax
    5e66:	01 d8                	add    %ebx,%eax
    5e68:	83 c0 38             	add    $0x38,%eax
    5e6b:	8b 10                	mov    (%eax),%edx
    5e6d:	89 d0                	mov    %edx,%eax
    5e6f:	c1 e0 02             	shl    $0x2,%eax
    5e72:	01 d0                	add    %edx,%eax
    5e74:	c1 e0 03             	shl    $0x3,%eax
    5e77:	05 c0 bd 00 00       	add    $0xbdc0,%eax
    5e7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5e7f:	eb 3e                	jmp    5ebf <III_hufman_decode+0x22b>
      else 
        h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    5e81:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e84:	8b 45 14             	mov    0x14(%ebp),%eax
    5e87:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5e8a:	89 c2                	mov    %eax,%edx
    5e8c:	c1 e2 03             	shl    $0x3,%edx
    5e8f:	01 c2                	add    %eax,%edx
    5e91:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e98:	89 c2                	mov    %eax,%edx
    5e9a:	89 c8                	mov    %ecx,%eax
    5e9c:	c1 e0 02             	shl    $0x2,%eax
    5e9f:	01 c8                	add    %ecx,%eax
    5ea1:	c1 e0 05             	shl    $0x5,%eax
    5ea4:	01 d0                	add    %edx,%eax
    5ea6:	01 d8                	add    %ebx,%eax
    5ea8:	83 c0 3c             	add    $0x3c,%eax
    5eab:	8b 10                	mov    (%eax),%edx
    5ead:	89 d0                	mov    %edx,%eax
    5eaf:	c1 e0 02             	shl    $0x2,%eax
    5eb2:	01 d0                	add    %edx,%eax
    5eb4:	c1 e0 03             	shl    $0x3,%eax
    5eb7:	05 c0 bd 00 00       	add    $0xbdc0,%eax
    5ebc:	89 45 e0             	mov    %eax,-0x20(%ebp)
      // if (i == 0) output_h(h);
      // if (i == 0) printf(0, "%d\n", h->treelen);
      huffman_decoder(h, &x, &y, &v, &w);
    5ebf:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5ec2:	89 44 24 10          	mov    %eax,0x10(%esp)
    5ec6:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5ec9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5ecd:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5ed0:	89 44 24 08          	mov    %eax,0x8(%esp)
    5ed4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5ed7:	89 44 24 04          	mov    %eax,0x4(%esp)
    5edb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5ede:	89 04 24             	mov    %eax,(%esp)
    5ee1:	e8 0f ef ff ff       	call   4df5 <huffman_decoder>
      // if (i == 0) printf(0, "%d\n", h->treelen);
      // if (i == 0) printf(0, "%d %d %d %d\n", x, y, v, w);
      is[i/SSLIMIT][i%SSLIMIT] = x;
    5ee6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5ee9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5eee:	89 c8                	mov    %ecx,%eax
    5ef0:	f7 ea                	imul   %edx
    5ef2:	c1 fa 02             	sar    $0x2,%edx
    5ef5:	89 c8                	mov    %ecx,%eax
    5ef7:	c1 f8 1f             	sar    $0x1f,%eax
    5efa:	89 d1                	mov    %edx,%ecx
    5efc:	29 c1                	sub    %eax,%ecx
    5efe:	89 c8                	mov    %ecx,%eax
    5f00:	89 c2                	mov    %eax,%edx
    5f02:	89 d0                	mov    %edx,%eax
    5f04:	c1 e0 03             	shl    $0x3,%eax
    5f07:	01 d0                	add    %edx,%eax
    5f09:	c1 e0 03             	shl    $0x3,%eax
    5f0c:	89 c3                	mov    %eax,%ebx
    5f0e:	03 5d 08             	add    0x8(%ebp),%ebx
    5f11:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5f14:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f19:	89 c8                	mov    %ecx,%eax
    5f1b:	f7 ea                	imul   %edx
    5f1d:	c1 fa 02             	sar    $0x2,%edx
    5f20:	89 c8                	mov    %ecx,%eax
    5f22:	c1 f8 1f             	sar    $0x1f,%eax
    5f25:	29 c2                	sub    %eax,%edx
    5f27:	89 d0                	mov    %edx,%eax
    5f29:	c1 e0 03             	shl    $0x3,%eax
    5f2c:	01 d0                	add    %edx,%eax
    5f2e:	01 c0                	add    %eax,%eax
    5f30:	89 ca                	mov    %ecx,%edx
    5f32:	29 c2                	sub    %eax,%edx
    5f34:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5f37:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    5f3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f3d:	8d 48 01             	lea    0x1(%eax),%ecx
    5f40:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f45:	89 c8                	mov    %ecx,%eax
    5f47:	f7 ea                	imul   %edx
    5f49:	c1 fa 02             	sar    $0x2,%edx
    5f4c:	89 c8                	mov    %ecx,%eax
    5f4e:	c1 f8 1f             	sar    $0x1f,%eax
    5f51:	89 d1                	mov    %edx,%ecx
    5f53:	29 c1                	sub    %eax,%ecx
    5f55:	89 c8                	mov    %ecx,%eax
    5f57:	89 c2                	mov    %eax,%edx
    5f59:	89 d0                	mov    %edx,%eax
    5f5b:	c1 e0 03             	shl    $0x3,%eax
    5f5e:	01 d0                	add    %edx,%eax
    5f60:	c1 e0 03             	shl    $0x3,%eax
    5f63:	89 c3                	mov    %eax,%ebx
    5f65:	03 5d 08             	add    0x8(%ebp),%ebx
    5f68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f6b:	8d 48 01             	lea    0x1(%eax),%ecx
    5f6e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5f73:	89 c8                	mov    %ecx,%eax
    5f75:	f7 ea                	imul   %edx
    5f77:	c1 fa 02             	sar    $0x2,%edx
    5f7a:	89 c8                	mov    %ecx,%eax
    5f7c:	c1 f8 1f             	sar    $0x1f,%eax
    5f7f:	29 c2                	sub    %eax,%edx
    5f81:	89 d0                	mov    %edx,%eax
    5f83:	c1 e0 03             	shl    $0x3,%eax
    5f86:	01 d0                	add    %edx,%eax
    5f88:	01 c0                	add    %eax,%eax
    5f8a:	89 ca                	mov    %ecx,%edx
    5f8c:	29 c2                	sub    %eax,%edx
    5f8e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5f91:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      }


   /* 读取大值区域Read bigvalues area. */
   // printf(0, "big_values=%d\n", (*si).ch[ch].gr[gr].big_values);
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5f94:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    5f98:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    5f9b:	8b 75 0c             	mov    0xc(%ebp),%esi
    5f9e:	8b 45 14             	mov    0x14(%ebp),%eax
    5fa1:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5fa4:	89 c2                	mov    %eax,%edx
    5fa6:	c1 e2 03             	shl    $0x3,%edx
    5fa9:	01 c2                	add    %eax,%edx
    5fab:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5fb2:	89 c2                	mov    %eax,%edx
    5fb4:	89 c8                	mov    %ecx,%eax
    5fb6:	c1 e0 02             	shl    $0x2,%eax
    5fb9:	01 c8                	add    %ecx,%eax
    5fbb:	c1 e0 05             	shl    $0x5,%eax
    5fbe:	01 d0                	add    %edx,%eax
    5fc0:	01 f0                	add    %esi,%eax
    5fc2:	83 c0 1c             	add    $0x1c,%eax
    5fc5:	8b 00                	mov    (%eax),%eax
    5fc7:	01 c0                	add    %eax,%eax
    5fc9:	39 c3                	cmp    %eax,%ebx
    5fcb:	0f 82 1d fe ff ff    	jb     5dee <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    5fd1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5fd4:	8b 45 14             	mov    0x14(%ebp),%eax
    5fd7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5fda:	89 c2                	mov    %eax,%edx
    5fdc:	c1 e2 03             	shl    $0x3,%edx
    5fdf:	01 c2                	add    %eax,%edx
    5fe1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5fe8:	89 c2                	mov    %eax,%edx
    5fea:	89 c8                	mov    %ecx,%eax
    5fec:	c1 e0 02             	shl    $0x2,%eax
    5fef:	01 c8                	add    %ecx,%eax
    5ff1:	c1 e0 05             	shl    $0x5,%eax
    5ff4:	01 d0                	add    %edx,%eax
    5ff6:	01 d8                	add    %ebx,%eax
    5ff8:	83 c0 5c             	add    $0x5c,%eax
    5ffb:	8b 10                	mov    (%eax),%edx
    5ffd:	89 d0                	mov    %edx,%eax
    5fff:	c1 e0 02             	shl    $0x2,%eax
    6002:	01 d0                	add    %edx,%eax
    6004:	c1 e0 03             	shl    $0x3,%eax
    6007:	05 00 05 00 00       	add    $0x500,%eax
    600c:	05 c0 bd 00 00       	add    $0xbdc0,%eax
    6011:	89 45 e0             	mov    %eax,-0x20(%ebp)
   // printf(0, "second change in hufman decode\n");
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    6014:	e9 8d 01 00 00       	jmp    61a6 <III_hufman_decode+0x512>
     ( i < SSLIMIT*SBLIMIT )) {
      // printf(0, "i=%d\n", i);
      // output_h(h);
      huffman_decoder(h, &x, &y, &v, &w);
    6019:	8d 45 c8             	lea    -0x38(%ebp),%eax
    601c:	89 44 24 10          	mov    %eax,0x10(%esp)
    6020:	8d 45 cc             	lea    -0x34(%ebp),%eax
    6023:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6027:	8d 45 d0             	lea    -0x30(%ebp),%eax
    602a:	89 44 24 08          	mov    %eax,0x8(%esp)
    602e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    6031:	89 44 24 04          	mov    %eax,0x4(%esp)
    6035:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6038:	89 04 24             	mov    %eax,(%esp)
    603b:	e8 b5 ed ff ff       	call   4df5 <huffman_decoder>
      // printf(0, "%d %d %d %d\n", x, y, v, w);
      is[i/SSLIMIT][i%SSLIMIT] = v;
    6040:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    6043:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6048:	89 c8                	mov    %ecx,%eax
    604a:	f7 ea                	imul   %edx
    604c:	c1 fa 02             	sar    $0x2,%edx
    604f:	89 c8                	mov    %ecx,%eax
    6051:	c1 f8 1f             	sar    $0x1f,%eax
    6054:	89 d1                	mov    %edx,%ecx
    6056:	29 c1                	sub    %eax,%ecx
    6058:	89 c8                	mov    %ecx,%eax
    605a:	89 c2                	mov    %eax,%edx
    605c:	89 d0                	mov    %edx,%eax
    605e:	c1 e0 03             	shl    $0x3,%eax
    6061:	01 d0                	add    %edx,%eax
    6063:	c1 e0 03             	shl    $0x3,%eax
    6066:	89 c3                	mov    %eax,%ebx
    6068:	03 5d 08             	add    0x8(%ebp),%ebx
    606b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    606e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6073:	89 c8                	mov    %ecx,%eax
    6075:	f7 ea                	imul   %edx
    6077:	c1 fa 02             	sar    $0x2,%edx
    607a:	89 c8                	mov    %ecx,%eax
    607c:	c1 f8 1f             	sar    $0x1f,%eax
    607f:	29 c2                	sub    %eax,%edx
    6081:	89 d0                	mov    %edx,%eax
    6083:	c1 e0 03             	shl    $0x3,%eax
    6086:	01 d0                	add    %edx,%eax
    6088:	01 c0                	add    %eax,%eax
    608a:	89 ca                	mov    %ecx,%edx
    608c:	29 c2                	sub    %eax,%edx
    608e:	8b 45 cc             	mov    -0x34(%ebp),%eax
    6091:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    6094:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6097:	8d 48 01             	lea    0x1(%eax),%ecx
    609a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    609f:	89 c8                	mov    %ecx,%eax
    60a1:	f7 ea                	imul   %edx
    60a3:	c1 fa 02             	sar    $0x2,%edx
    60a6:	89 c8                	mov    %ecx,%eax
    60a8:	c1 f8 1f             	sar    $0x1f,%eax
    60ab:	89 d1                	mov    %edx,%ecx
    60ad:	29 c1                	sub    %eax,%ecx
    60af:	89 c8                	mov    %ecx,%eax
    60b1:	89 c2                	mov    %eax,%edx
    60b3:	89 d0                	mov    %edx,%eax
    60b5:	c1 e0 03             	shl    $0x3,%eax
    60b8:	01 d0                	add    %edx,%eax
    60ba:	c1 e0 03             	shl    $0x3,%eax
    60bd:	89 c3                	mov    %eax,%ebx
    60bf:	03 5d 08             	add    0x8(%ebp),%ebx
    60c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60c5:	8d 48 01             	lea    0x1(%eax),%ecx
    60c8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    60cd:	89 c8                	mov    %ecx,%eax
    60cf:	f7 ea                	imul   %edx
    60d1:	c1 fa 02             	sar    $0x2,%edx
    60d4:	89 c8                	mov    %ecx,%eax
    60d6:	c1 f8 1f             	sar    $0x1f,%eax
    60d9:	29 c2                	sub    %eax,%edx
    60db:	89 d0                	mov    %edx,%eax
    60dd:	c1 e0 03             	shl    $0x3,%eax
    60e0:	01 d0                	add    %edx,%eax
    60e2:	01 c0                	add    %eax,%eax
    60e4:	89 ca                	mov    %ecx,%edx
    60e6:	29 c2                	sub    %eax,%edx
    60e8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    60eb:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    60ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60f1:	8d 48 02             	lea    0x2(%eax),%ecx
    60f4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    60f9:	89 c8                	mov    %ecx,%eax
    60fb:	f7 ea                	imul   %edx
    60fd:	c1 fa 02             	sar    $0x2,%edx
    6100:	89 c8                	mov    %ecx,%eax
    6102:	c1 f8 1f             	sar    $0x1f,%eax
    6105:	89 d1                	mov    %edx,%ecx
    6107:	29 c1                	sub    %eax,%ecx
    6109:	89 c8                	mov    %ecx,%eax
    610b:	89 c2                	mov    %eax,%edx
    610d:	89 d0                	mov    %edx,%eax
    610f:	c1 e0 03             	shl    $0x3,%eax
    6112:	01 d0                	add    %edx,%eax
    6114:	c1 e0 03             	shl    $0x3,%eax
    6117:	89 c3                	mov    %eax,%ebx
    6119:	03 5d 08             	add    0x8(%ebp),%ebx
    611c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    611f:	8d 48 02             	lea    0x2(%eax),%ecx
    6122:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6127:	89 c8                	mov    %ecx,%eax
    6129:	f7 ea                	imul   %edx
    612b:	c1 fa 02             	sar    $0x2,%edx
    612e:	89 c8                	mov    %ecx,%eax
    6130:	c1 f8 1f             	sar    $0x1f,%eax
    6133:	29 c2                	sub    %eax,%edx
    6135:	89 d0                	mov    %edx,%eax
    6137:	c1 e0 03             	shl    $0x3,%eax
    613a:	01 d0                	add    %edx,%eax
    613c:	01 c0                	add    %eax,%eax
    613e:	89 ca                	mov    %ecx,%edx
    6140:	29 c2                	sub    %eax,%edx
    6142:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6145:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    6148:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    614b:	8d 48 03             	lea    0x3(%eax),%ecx
    614e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6153:	89 c8                	mov    %ecx,%eax
    6155:	f7 ea                	imul   %edx
    6157:	c1 fa 02             	sar    $0x2,%edx
    615a:	89 c8                	mov    %ecx,%eax
    615c:	c1 f8 1f             	sar    $0x1f,%eax
    615f:	89 d1                	mov    %edx,%ecx
    6161:	29 c1                	sub    %eax,%ecx
    6163:	89 c8                	mov    %ecx,%eax
    6165:	89 c2                	mov    %eax,%edx
    6167:	89 d0                	mov    %edx,%eax
    6169:	c1 e0 03             	shl    $0x3,%eax
    616c:	01 d0                	add    %edx,%eax
    616e:	c1 e0 03             	shl    $0x3,%eax
    6171:	89 c3                	mov    %eax,%ebx
    6173:	03 5d 08             	add    0x8(%ebp),%ebx
    6176:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6179:	8d 48 03             	lea    0x3(%eax),%ecx
    617c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6181:	89 c8                	mov    %ecx,%eax
    6183:	f7 ea                	imul   %edx
    6185:	c1 fa 02             	sar    $0x2,%edx
    6188:	89 c8                	mov    %ecx,%eax
    618a:	c1 f8 1f             	sar    $0x1f,%eax
    618d:	29 c2                	sub    %eax,%edx
    618f:	89 d0                	mov    %edx,%eax
    6191:	c1 e0 03             	shl    $0x3,%eax
    6194:	01 d0                	add    %edx,%eax
    6196:	01 c0                	add    %eax,%eax
    6198:	89 ca                	mov    %ecx,%edx
    619a:	29 c2                	sub    %eax,%edx
    619c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    619f:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    61a2:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   // printf(0, "second change in hufman decode\n");
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    61a6:	e8 f6 ea ff ff       	call   4ca1 <hsstell>
    61ab:	89 c3                	mov    %eax,%ebx
    61ad:	8b 75 0c             	mov    0xc(%ebp),%esi
    61b0:	8b 45 14             	mov    0x14(%ebp),%eax
    61b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    61b6:	89 c2                	mov    %eax,%edx
    61b8:	c1 e2 03             	shl    $0x3,%edx
    61bb:	01 c2                	add    %eax,%edx
    61bd:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    61c4:	89 c2                	mov    %eax,%edx
    61c6:	89 c8                	mov    %ecx,%eax
    61c8:	c1 e0 02             	shl    $0x2,%eax
    61cb:	01 c8                	add    %ecx,%eax
    61cd:	c1 e0 05             	shl    $0x5,%eax
    61d0:	01 d0                	add    %edx,%eax
    61d2:	01 f0                	add    %esi,%eax
    61d4:	83 c0 18             	add    $0x18,%eax
    61d7:	8b 10                	mov    (%eax),%edx
    61d9:	8b 45 18             	mov    0x18(%ebp),%eax
    61dc:	01 d0                	add    %edx,%eax
    61de:	39 c3                	cmp    %eax,%ebx
    61e0:	73 0d                	jae    61ef <III_hufman_decode+0x55b>
    61e2:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    61e9:	0f 8e 2a fe ff ff    	jle    6019 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    61ef:	e8 ad ea ff ff       	call   4ca1 <hsstell>
    61f4:	89 c3                	mov    %eax,%ebx
    61f6:	8b 75 0c             	mov    0xc(%ebp),%esi
    61f9:	8b 45 14             	mov    0x14(%ebp),%eax
    61fc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    61ff:	89 c2                	mov    %eax,%edx
    6201:	c1 e2 03             	shl    $0x3,%edx
    6204:	01 c2                	add    %eax,%edx
    6206:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    620d:	89 c2                	mov    %eax,%edx
    620f:	89 c8                	mov    %ecx,%eax
    6211:	c1 e0 02             	shl    $0x2,%eax
    6214:	01 c8                	add    %ecx,%eax
    6216:	c1 e0 05             	shl    $0x5,%eax
    6219:	01 d0                	add    %edx,%eax
    621b:	01 f0                	add    %esi,%eax
    621d:	83 c0 18             	add    $0x18,%eax
    6220:	8b 10                	mov    (%eax),%edx
    6222:	8b 45 18             	mov    0x18(%ebp),%eax
    6225:	01 d0                	add    %edx,%eax
    6227:	39 c3                	cmp    %eax,%ebx
    6229:	76 4a                	jbe    6275 <III_hufman_decode+0x5e1>
   {  i -=4;
    622b:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    622f:	e8 6d ea ff ff       	call   4ca1 <hsstell>
    6234:	8b 55 18             	mov    0x18(%ebp),%edx
    6237:	89 c6                	mov    %eax,%esi
    6239:	29 d6                	sub    %edx,%esi
    623b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    623e:	8b 45 14             	mov    0x14(%ebp),%eax
    6241:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6244:	89 c2                	mov    %eax,%edx
    6246:	c1 e2 03             	shl    $0x3,%edx
    6249:	01 c2                	add    %eax,%edx
    624b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6252:	89 c2                	mov    %eax,%edx
    6254:	89 c8                	mov    %ecx,%eax
    6256:	c1 e0 02             	shl    $0x2,%eax
    6259:	01 c8                	add    %ecx,%eax
    625b:	c1 e0 05             	shl    $0x5,%eax
    625e:	01 d0                	add    %edx,%eax
    6260:	01 d8                	add    %ebx,%eax
    6262:	83 c0 18             	add    $0x18,%eax
    6265:	8b 00                	mov    (%eax),%eax
    6267:	89 f2                	mov    %esi,%edx
    6269:	29 c2                	sub    %eax,%edx
    626b:	89 d0                	mov    %edx,%eax
    626d:	89 04 24             	mov    %eax,(%esp)
    6270:	e8 77 ea ff ff       	call   4cec <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    6275:	e8 27 ea ff ff       	call   4ca1 <hsstell>
    627a:	89 c3                	mov    %eax,%ebx
    627c:	8b 75 0c             	mov    0xc(%ebp),%esi
    627f:	8b 45 14             	mov    0x14(%ebp),%eax
    6282:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6285:	89 c2                	mov    %eax,%edx
    6287:	c1 e2 03             	shl    $0x3,%edx
    628a:	01 c2                	add    %eax,%edx
    628c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6293:	89 c2                	mov    %eax,%edx
    6295:	89 c8                	mov    %ecx,%eax
    6297:	c1 e0 02             	shl    $0x2,%eax
    629a:	01 c8                	add    %ecx,%eax
    629c:	c1 e0 05             	shl    $0x5,%eax
    629f:	01 d0                	add    %edx,%eax
    62a1:	01 f0                	add    %esi,%eax
    62a3:	83 c0 18             	add    $0x18,%eax
    62a6:	8b 10                	mov    (%eax),%edx
    62a8:	8b 45 18             	mov    0x18(%ebp),%eax
    62ab:	01 d0                	add    %edx,%eax
    62ad:	39 c3                	cmp    %eax,%ebx
    62af:	0f 83 a0 00 00 00    	jae    6355 <III_hufman_decode+0x6c1>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    62b5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    62b8:	8b 45 14             	mov    0x14(%ebp),%eax
    62bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    62be:	89 c2                	mov    %eax,%edx
    62c0:	c1 e2 03             	shl    $0x3,%edx
    62c3:	01 c2                	add    %eax,%edx
    62c5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    62cc:	89 c2                	mov    %eax,%edx
    62ce:	89 c8                	mov    %ecx,%eax
    62d0:	c1 e0 02             	shl    $0x2,%eax
    62d3:	01 c8                	add    %ecx,%eax
    62d5:	c1 e0 05             	shl    $0x5,%eax
    62d8:	01 d0                	add    %edx,%eax
    62da:	01 d8                	add    %ebx,%eax
    62dc:	83 c0 18             	add    $0x18,%eax
    62df:	8b 10                	mov    (%eax),%edx
    62e1:	8b 45 18             	mov    0x18(%ebp),%eax
    62e4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    62e7:	e8 b5 e9 ff ff       	call   4ca1 <hsstell>
    62ec:	89 d9                	mov    %ebx,%ecx
    62ee:	29 c1                	sub    %eax,%ecx
    62f0:	89 c8                	mov    %ecx,%eax
    62f2:	89 04 24             	mov    %eax,(%esp)
    62f5:	e8 c3 e9 ff ff       	call   4cbd <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    62fa:	eb 59                	jmp    6355 <III_hufman_decode+0x6c1>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    62fc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    62ff:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6304:	89 c8                	mov    %ecx,%eax
    6306:	f7 ea                	imul   %edx
    6308:	c1 fa 02             	sar    $0x2,%edx
    630b:	89 c8                	mov    %ecx,%eax
    630d:	c1 f8 1f             	sar    $0x1f,%eax
    6310:	89 d1                	mov    %edx,%ecx
    6312:	29 c1                	sub    %eax,%ecx
    6314:	89 c8                	mov    %ecx,%eax
    6316:	89 c2                	mov    %eax,%edx
    6318:	89 d0                	mov    %edx,%eax
    631a:	c1 e0 03             	shl    $0x3,%eax
    631d:	01 d0                	add    %edx,%eax
    631f:	c1 e0 03             	shl    $0x3,%eax
    6322:	89 c3                	mov    %eax,%ebx
    6324:	03 5d 08             	add    0x8(%ebp),%ebx
    6327:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    632a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    632f:	89 c8                	mov    %ecx,%eax
    6331:	f7 ea                	imul   %edx
    6333:	c1 fa 02             	sar    $0x2,%edx
    6336:	89 c8                	mov    %ecx,%eax
    6338:	c1 f8 1f             	sar    $0x1f,%eax
    633b:	29 c2                	sub    %eax,%edx
    633d:	89 d0                	mov    %edx,%eax
    633f:	c1 e0 03             	shl    $0x3,%eax
    6342:	01 d0                	add    %edx,%eax
    6344:	01 c0                	add    %eax,%eax
    6346:	89 ca                	mov    %ecx,%edx
    6348:	29 c2                	sub    %eax,%edx
    634a:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    6351:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    6355:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    635c:	7e 9e                	jle    62fc <III_hufman_decode+0x668>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    635e:	83 c4 4c             	add    $0x4c,%esp
    6361:	5b                   	pop    %ebx
    6362:	5e                   	pop    %esi
    6363:	5f                   	pop    %edi
    6364:	5d                   	pop    %ebp
    6365:	c3                   	ret    

00006366 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    6366:	55                   	push   %ebp
    6367:	89 e5                	mov    %esp,%ebp
    6369:	56                   	push   %esi
    636a:	53                   	push   %ebx
    636b:	83 ec 60             	sub    $0x60,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    636e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6375:	8b 45 1c             	mov    0x1c(%ebp),%eax
    6378:	8b 00                	mov    (%eax),%eax
    637a:	8b 40 10             	mov    0x10(%eax),%eax
    637d:	89 45 dc             	mov    %eax,-0x24(%ebp)

  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    6380:	8b 45 14             	mov    0x14(%ebp),%eax
    6383:	8b 40 10             	mov    0x10(%eax),%eax
    6386:	85 c0                	test   %eax,%eax
    6388:	74 61                	je     63eb <III_dequantize_sample+0x85>
    638a:	8b 45 14             	mov    0x14(%ebp),%eax
    638d:	8b 40 14             	mov    0x14(%eax),%eax
    6390:	83 f8 02             	cmp    $0x2,%eax
    6393:	75 56                	jne    63eb <III_dequantize_sample+0x85>
		if (gr_info->mixed_block_flag)
    6395:	8b 45 14             	mov    0x14(%ebp),%eax
    6398:	8b 40 18             	mov    0x18(%eax),%eax
    639b:	85 c0                	test   %eax,%eax
    639d:	74 15                	je     63b4 <III_dequantize_sample+0x4e>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    639f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63a2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63a8:	05 c4 c3 00 00       	add    $0xc3c4,%eax
    63ad:	8b 00                	mov    (%eax),%eax
    63af:	89 45 e8             	mov    %eax,-0x18(%ebp)
  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    63b2:	eb 4a                	jmp    63fe <III_dequantize_sample+0x98>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    63b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63b7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63bd:	05 14 c4 00 00       	add    $0xc414,%eax
    63c2:	8b 50 0c             	mov    0xc(%eax),%edx
    63c5:	89 d0                	mov    %edx,%eax
    63c7:	01 c0                	add    %eax,%eax
    63c9:	01 d0                	add    %edx,%eax
    63cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    63ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63d1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63d7:	05 14 c4 00 00       	add    $0xc414,%eax
    63dc:	8b 40 0c             	mov    0xc(%eax),%eax
    63df:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    63e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    63e9:	eb 13                	jmp    63fe <III_dequantize_sample+0x98>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    63eb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63ee:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63f4:	05 c4 c3 00 00       	add    $0xc3c4,%eax
    63f9:	8b 00                	mov    (%eax),%eax
    63fb:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
    63fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6405:	e9 f9 05 00 00       	jmp    6a03 <III_dequantize_sample+0x69d>
		for (ss=0 ; ss < 18 ; ss++) {
    640a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6411:	e9 df 05 00 00       	jmp    69f5 <III_dequantize_sample+0x68f>
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    6416:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6419:	89 d0                	mov    %edx,%eax
    641b:	c1 e0 03             	shl    $0x3,%eax
    641e:	01 d0                	add    %edx,%eax
    6420:	01 c0                	add    %eax,%eax
    6422:	03 45 f4             	add    -0xc(%ebp),%eax
    6425:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6428:	0f 85 92 02 00 00    	jne    66c0 <III_dequantize_sample+0x35a>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    642e:	8b 45 14             	mov    0x14(%ebp),%eax
    6431:	8b 40 10             	mov    0x10(%eax),%eax
    6434:	85 c0                	test   %eax,%eax
    6436:	0f 84 5f 02 00 00    	je     669b <III_dequantize_sample+0x335>
    643c:	8b 45 14             	mov    0x14(%ebp),%eax
    643f:	8b 40 14             	mov    0x14(%eax),%eax
    6442:	83 f8 02             	cmp    $0x2,%eax
    6445:	0f 85 50 02 00 00    	jne    669b <III_dequantize_sample+0x335>
					if (gr_info->mixed_block_flag) {
    644b:	8b 45 14             	mov    0x14(%ebp),%eax
    644e:	8b 40 18             	mov    0x18(%eax),%eax
    6451:	85 c0                	test   %eax,%eax
    6453:	0f 84 a7 01 00 00    	je     6600 <III_dequantize_sample+0x29a>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    6459:	8b 55 f0             	mov    -0x10(%ebp),%edx
    645c:	89 d0                	mov    %edx,%eax
    645e:	c1 e0 03             	shl    $0x3,%eax
    6461:	01 d0                	add    %edx,%eax
    6463:	01 c0                	add    %eax,%eax
    6465:	89 c2                	mov    %eax,%edx
    6467:	03 55 f4             	add    -0xc(%ebp),%edx
    646a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    646d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6473:	05 e0 c3 00 00       	add    $0xc3e0,%eax
    6478:	8b 00                	mov    (%eax),%eax
    647a:	39 c2                	cmp    %eax,%edx
    647c:	0f 85 91 00 00 00    	jne    6513 <III_dequantize_sample+0x1ad>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    6482:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6485:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    648b:	05 20 c4 00 00       	add    $0xc420,%eax
    6490:	8b 50 0c             	mov    0xc(%eax),%edx
    6493:	89 d0                	mov    %edx,%eax
    6495:	01 c0                	add    %eax,%eax
    6497:	01 d0                	add    %edx,%eax
    6499:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    649c:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    64a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    64a6:	8d 48 01             	lea    0x1(%eax),%ecx
    64a9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64ac:	89 d0                	mov    %edx,%eax
    64ae:	c1 e0 03             	shl    $0x3,%eax
    64b1:	01 d0                	add    %edx,%eax
    64b3:	c1 e0 02             	shl    $0x2,%eax
    64b6:	01 d0                	add    %edx,%eax
    64b8:	01 c8                	add    %ecx,%eax
    64ba:	83 c0 14             	add    $0x14,%eax
    64bd:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    64c4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64c7:	89 d0                	mov    %edx,%eax
    64c9:	c1 e0 03             	shl    $0x3,%eax
    64cc:	01 d0                	add    %edx,%eax
    64ce:	c1 e0 02             	shl    $0x2,%eax
    64d1:	01 d0                	add    %edx,%eax
    64d3:	03 45 ec             	add    -0x14(%ebp),%eax
    64d6:	83 c0 14             	add    $0x14,%eax
    64d9:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    64e0:	89 ca                	mov    %ecx,%edx
    64e2:	29 c2                	sub    %eax,%edx
    64e4:	89 d0                	mov    %edx,%eax
    64e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    64e9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64ec:	89 d0                	mov    %edx,%eax
    64ee:	c1 e0 03             	shl    $0x3,%eax
    64f1:	01 d0                	add    %edx,%eax
    64f3:	c1 e0 02             	shl    $0x2,%eax
    64f6:	01 d0                	add    %edx,%eax
    64f8:	03 45 ec             	add    -0x14(%ebp),%eax
    64fb:	83 c0 14             	add    $0x14,%eax
    64fe:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    6505:	89 d0                	mov    %edx,%eax
    6507:	01 c0                	add    %eax,%eax
    6509:	01 d0                	add    %edx,%eax
    650b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    650e:	e9 ad 01 00 00       	jmp    66c0 <III_dequantize_sample+0x35a>
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    6513:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6516:	89 d0                	mov    %edx,%eax
    6518:	c1 e0 03             	shl    $0x3,%eax
    651b:	01 d0                	add    %edx,%eax
    651d:	01 c0                	add    %eax,%eax
    651f:	89 c2                	mov    %eax,%edx
    6521:	03 55 f4             	add    -0xc(%ebp),%edx
    6524:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6527:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    652d:	05 e0 c3 00 00       	add    $0xc3e0,%eax
    6532:	8b 00                	mov    (%eax),%eax
    6534:	39 c2                	cmp    %eax,%edx
    6536:	7d 2a                	jge    6562 <III_dequantize_sample+0x1fc>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6538:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    653c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    653f:	8d 48 01             	lea    0x1(%eax),%ecx
    6542:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6545:	89 d0                	mov    %edx,%eax
    6547:	c1 e0 03             	shl    $0x3,%eax
    654a:	01 d0                	add    %edx,%eax
    654c:	c1 e0 02             	shl    $0x2,%eax
    654f:	01 d0                	add    %edx,%eax
    6551:	01 c8                	add    %ecx,%eax
    6553:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    655a:	89 45 e8             	mov    %eax,-0x18(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    655d:	e9 5e 01 00 00       	jmp    66c0 <III_dequantize_sample+0x35a>
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    6562:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6566:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6569:	8d 48 01             	lea    0x1(%eax),%ecx
    656c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    656f:	89 d0                	mov    %edx,%eax
    6571:	c1 e0 03             	shl    $0x3,%eax
    6574:	01 d0                	add    %edx,%eax
    6576:	c1 e0 02             	shl    $0x2,%eax
    6579:	01 d0                	add    %edx,%eax
    657b:	01 c8                	add    %ecx,%eax
    657d:	83 c0 14             	add    $0x14,%eax
    6580:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    6587:	89 d0                	mov    %edx,%eax
    6589:	01 c0                	add    %eax,%eax
    658b:	01 d0                	add    %edx,%eax
    658d:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6590:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6593:	8d 48 01             	lea    0x1(%eax),%ecx
    6596:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6599:	89 d0                	mov    %edx,%eax
    659b:	c1 e0 03             	shl    $0x3,%eax
    659e:	01 d0                	add    %edx,%eax
    65a0:	c1 e0 02             	shl    $0x2,%eax
    65a3:	01 d0                	add    %edx,%eax
    65a5:	01 c8                	add    %ecx,%eax
    65a7:	83 c0 14             	add    $0x14,%eax
    65aa:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    65b1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    65b4:	89 d0                	mov    %edx,%eax
    65b6:	c1 e0 03             	shl    $0x3,%eax
    65b9:	01 d0                	add    %edx,%eax
    65bb:	c1 e0 02             	shl    $0x2,%eax
    65be:	01 d0                	add    %edx,%eax
    65c0:	03 45 ec             	add    -0x14(%ebp),%eax
    65c3:	83 c0 14             	add    $0x14,%eax
    65c6:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    65cd:	89 ca                	mov    %ecx,%edx
    65cf:	29 c2                	sub    %eax,%edx
    65d1:	89 d0                	mov    %edx,%eax
    65d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    65d6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    65d9:	89 d0                	mov    %edx,%eax
    65db:	c1 e0 03             	shl    $0x3,%eax
    65de:	01 d0                	add    %edx,%eax
    65e0:	c1 e0 02             	shl    $0x2,%eax
    65e3:	01 d0                	add    %edx,%eax
    65e5:	03 45 ec             	add    -0x14(%ebp),%eax
    65e8:	83 c0 14             	add    $0x14,%eax
    65eb:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    65f2:	89 d0                	mov    %edx,%eax
    65f4:	01 c0                	add    %eax,%eax
    65f6:	01 d0                	add    %edx,%eax
    65f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    65fb:	e9 c0 00 00 00       	jmp    66c0 <III_dequantize_sample+0x35a>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    6600:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6604:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6607:	8d 48 01             	lea    0x1(%eax),%ecx
    660a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    660d:	89 d0                	mov    %edx,%eax
    660f:	c1 e0 03             	shl    $0x3,%eax
    6612:	01 d0                	add    %edx,%eax
    6614:	c1 e0 02             	shl    $0x2,%eax
    6617:	01 d0                	add    %edx,%eax
    6619:	01 c8                	add    %ecx,%eax
    661b:	83 c0 14             	add    $0x14,%eax
    661e:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    6625:	89 d0                	mov    %edx,%eax
    6627:	01 c0                	add    %eax,%eax
    6629:	01 d0                	add    %edx,%eax
    662b:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    662e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6631:	8d 48 01             	lea    0x1(%eax),%ecx
    6634:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6637:	89 d0                	mov    %edx,%eax
    6639:	c1 e0 03             	shl    $0x3,%eax
    663c:	01 d0                	add    %edx,%eax
    663e:	c1 e0 02             	shl    $0x2,%eax
    6641:	01 d0                	add    %edx,%eax
    6643:	01 c8                	add    %ecx,%eax
    6645:	83 c0 14             	add    $0x14,%eax
    6648:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    664f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6652:	89 d0                	mov    %edx,%eax
    6654:	c1 e0 03             	shl    $0x3,%eax
    6657:	01 d0                	add    %edx,%eax
    6659:	c1 e0 02             	shl    $0x2,%eax
    665c:	01 d0                	add    %edx,%eax
    665e:	03 45 ec             	add    -0x14(%ebp),%eax
    6661:	83 c0 14             	add    $0x14,%eax
    6664:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    666b:	89 ca                	mov    %ecx,%edx
    666d:	29 c2                	sub    %eax,%edx
    666f:	89 d0                	mov    %edx,%eax
    6671:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6674:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6677:	89 d0                	mov    %edx,%eax
    6679:	c1 e0 03             	shl    $0x3,%eax
    667c:	01 d0                	add    %edx,%eax
    667e:	c1 e0 02             	shl    $0x2,%eax
    6681:	01 d0                	add    %edx,%eax
    6683:	03 45 ec             	add    -0x14(%ebp),%eax
    6686:	83 c0 14             	add    $0x14,%eax
    6689:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    6690:	89 d0                	mov    %edx,%eax
    6692:	01 c0                	add    %eax,%eax
    6694:	01 d0                	add    %edx,%eax
    6696:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    6699:	eb 25                	jmp    66c0 <III_dequantize_sample+0x35a>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    669b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    669f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    66a2:	8d 48 01             	lea    0x1(%eax),%ecx
    66a5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    66a8:	89 d0                	mov    %edx,%eax
    66aa:	c1 e0 03             	shl    $0x3,%eax
    66ad:	01 d0                	add    %edx,%eax
    66af:	c1 e0 02             	shl    $0x2,%eax
    66b2:	01 d0                	add    %edx,%eax
    66b4:	01 c8                	add    %ecx,%eax
    66b6:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    66bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

      // printf(1, "T2: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d, SBLIMIT=%d, SSLIMIT=%d\n", &sb, &ss, sb, ss, SBLIMIT, SSLIMIT);
			/* Compute overall (global) scaling. */
      // printf(0, "test point 1 in dequantize sample\n");
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    66c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    66c3:	89 d0                	mov    %edx,%eax
    66c5:	c1 e0 03             	shl    $0x3,%eax
    66c8:	01 d0                	add    %edx,%eax
    66ca:	c1 e0 04             	shl    $0x4,%eax
    66cd:	89 c3                	mov    %eax,%ebx
    66cf:	03 5d 0c             	add    0xc(%ebp),%ebx
    66d2:	8b 45 14             	mov    0x14(%ebp),%eax
    66d5:	8b 40 08             	mov    0x8(%eax),%eax
    66d8:	ba 00 00 00 00       	mov    $0x0,%edx
    66dd:	89 45 c8             	mov    %eax,-0x38(%ebp)
    66e0:	89 55 cc             	mov    %edx,-0x34(%ebp)
    66e3:	df 6d c8             	fildll -0x38(%ebp)
    66e6:	dd 05 10 90 00 00    	fldl   0x9010
    66ec:	de e9                	fsubrp %st,%st(1)
    66ee:	dd 05 18 90 00 00    	fldl   0x9018
    66f4:	de c9                	fmulp  %st,%st(1)
    66f6:	dd 5c 24 08          	fstpl  0x8(%esp)
    66fa:	dd 05 20 90 00 00    	fldl   0x9020
    6700:	dd 1c 24             	fstpl  (%esp)
    6703:	e8 b2 db ff ff       	call   42ba <pow>
    6708:	8b 45 f4             	mov    -0xc(%ebp),%eax
    670b:	dd 1c c3             	fstpl  (%ebx,%eax,8)
      // unsigned int *p = (unsigned int*)&xr[sb][ss];
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    670e:	8b 45 14             	mov    0x14(%ebp),%eax
    6711:	8b 40 10             	mov    0x10(%eax),%eax
    6714:	85 c0                	test   %eax,%eax
    6716:	0f 84 75 01 00 00    	je     6891 <III_dequantize_sample+0x52b>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    671c:	8b 45 14             	mov    0x14(%ebp),%eax
    671f:	8b 40 14             	mov    0x14(%eax),%eax
      // unsigned int *p = (unsigned int*)&xr[sb][ss];
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    6722:	83 f8 02             	cmp    $0x2,%eax
    6725:	75 0a                	jne    6731 <III_dequantize_sample+0x3cb>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    6727:	8b 45 14             	mov    0x14(%ebp),%eax
    672a:	8b 40 18             	mov    0x18(%eax),%eax
    672d:	85 c0                	test   %eax,%eax
    672f:	74 27                	je     6758 <III_dequantize_sample+0x3f2>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6731:	8b 45 14             	mov    0x14(%ebp),%eax
    6734:	8b 40 14             	mov    0x14(%eax),%eax
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    6737:	83 f8 02             	cmp    $0x2,%eax
    673a:	0f 85 51 01 00 00    	jne    6891 <III_dequantize_sample+0x52b>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    6740:	8b 45 14             	mov    0x14(%ebp),%eax
    6743:	8b 40 18             	mov    0x18(%eax),%eax
    6746:	85 c0                	test   %eax,%eax
    6748:	0f 84 43 01 00 00    	je     6891 <III_dequantize_sample+0x52b>
    674e:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    6752:	0f 8e 39 01 00 00    	jle    6891 <III_dequantize_sample+0x52b>

        //printf(0, "test point 2 in dequantize sample\n");
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
    6758:	8b 55 f0             	mov    -0x10(%ebp),%edx
    675b:	89 d0                	mov    %edx,%eax
    675d:	c1 e0 03             	shl    $0x3,%eax
    6760:	01 d0                	add    %edx,%eax
    6762:	c1 e0 04             	shl    $0x4,%eax
    6765:	89 c3                	mov    %eax,%ebx
    6767:	03 5d 0c             	add    0xc(%ebp),%ebx
    676a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    676d:	89 d0                	mov    %edx,%eax
    676f:	c1 e0 03             	shl    $0x3,%eax
    6772:	01 d0                	add    %edx,%eax
    6774:	c1 e0 04             	shl    $0x4,%eax
    6777:	03 45 0c             	add    0xc(%ebp),%eax
    677a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    677d:	dd 04 d0             	fldl   (%eax,%edx,8)
    6780:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    6783:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6786:	89 d0                	mov    %edx,%eax
    6788:	c1 e0 03             	shl    $0x3,%eax
    678b:	01 d0                	add    %edx,%eax
    678d:	01 c0                	add    %eax,%eax
    678f:	03 45 f4             	add    -0xc(%ebp),%eax
    6792:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    6795:	89 c2                	mov    %eax,%edx
    6797:	c1 fa 1f             	sar    $0x1f,%edx
    679a:	f7 7d e0             	idivl  -0x20(%ebp)
    679d:	89 c2                	mov    %eax,%edx
    679f:	8b 45 14             	mov    0x14(%ebp),%eax
    67a2:	83 c2 08             	add    $0x8,%edx
    67a5:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

        //printf(0, "test point 2 in dequantize sample\n");
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
    67a9:	ba 00 00 00 00       	mov    $0x0,%edx
    67ae:	89 45 c8             	mov    %eax,-0x38(%ebp)
    67b1:	89 55 cc             	mov    %edx,-0x34(%ebp)
    67b4:	df 6d c8             	fildll -0x38(%ebp)
    67b7:	dd 05 28 90 00 00    	fldl   0x9028
    67bd:	de c9                	fmulp  %st,%st(1)
    67bf:	dd 5c 24 08          	fstpl  0x8(%esp)
    67c3:	dd 05 20 90 00 00    	fldl   0x9020
    67c9:	dd 1c 24             	fstpl  (%esp)
    67cc:	e8 e9 da ff ff       	call   42ba <pow>
    67d1:	dc 4d c0             	fmull  -0x40(%ebp)
    67d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    67d7:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
        //printf(0, "test point 2 in dequantize sample passed\n");
				
        //printf(0, "test point 3 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, 0.25 * (-2.0) * (1.0+gr_info->scalefac_scale)
    67da:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67dd:	89 d0                	mov    %edx,%eax
    67df:	c1 e0 03             	shl    $0x3,%eax
    67e2:	01 d0                	add    %edx,%eax
    67e4:	c1 e0 04             	shl    $0x4,%eax
    67e7:	89 c3                	mov    %eax,%ebx
    67e9:	03 5d 0c             	add    0xc(%ebp),%ebx
    67ec:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67ef:	89 d0                	mov    %edx,%eax
    67f1:	c1 e0 03             	shl    $0x3,%eax
    67f4:	01 d0                	add    %edx,%eax
    67f6:	c1 e0 04             	shl    $0x4,%eax
    67f9:	03 45 0c             	add    0xc(%ebp),%eax
    67fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    67ff:	dd 04 d0             	fldl   (%eax,%edx,8)
    6802:	dd 5d b8             	fstpl  -0x48(%ebp)
    6805:	8b 45 14             	mov    0x14(%ebp),%eax
    6808:	8b 40 40             	mov    0x40(%eax),%eax
    680b:	ba 00 00 00 00       	mov    $0x0,%edx
    6810:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6813:	89 55 cc             	mov    %edx,-0x34(%ebp)
    6816:	df 6d c8             	fildll -0x38(%ebp)
    6819:	d9 e8                	fld1   
    681b:	de c1                	faddp  %st,%st(1)
    681d:	dd 05 30 90 00 00    	fldl   0x9030
    6823:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    6825:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6828:	89 d0                	mov    %edx,%eax
    682a:	c1 e0 03             	shl    $0x3,%eax
    682d:	01 d0                	add    %edx,%eax
    682f:	01 c0                	add    %eax,%eax
    6831:	03 45 f4             	add    -0xc(%ebp),%eax
    6834:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    6837:	89 c2                	mov    %eax,%edx
    6839:	c1 fa 1f             	sar    $0x1f,%edx
    683c:	f7 7d e0             	idivl  -0x20(%ebp)
    683f:	89 c2                	mov    %eax,%edx
    6841:	8b 75 10             	mov    0x10(%ebp),%esi
    6844:	8b 4d 18             	mov    0x18(%ebp),%ecx
    6847:	89 d0                	mov    %edx,%eax
    6849:	01 c0                	add    %eax,%eax
    684b:	01 d0                	add    %edx,%eax
    684d:	c1 e0 02             	shl    $0x2,%eax
    6850:	01 d0                	add    %edx,%eax
    6852:	89 ca                	mov    %ecx,%edx
    6854:	01 d2                	add    %edx,%edx
    6856:	89 d1                	mov    %edx,%ecx
    6858:	c1 e1 05             	shl    $0x5,%ecx
    685b:	29 d1                	sub    %edx,%ecx
    685d:	01 c8                	add    %ecx,%eax
    685f:	03 45 ec             	add    -0x14(%ebp),%eax
    6862:	83 c0 14             	add    $0x14,%eax
    6865:	8b 44 86 0c          	mov    0xc(%esi,%eax,4),%eax
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
        //printf(0, "test point 2 in dequantize sample passed\n");
				
        //printf(0, "test point 3 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, 0.25 * (-2.0) * (1.0+gr_info->scalefac_scale)
    6869:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    686c:	db 45 d4             	fildl  -0x2c(%ebp)
    686f:	de c9                	fmulp  %st,%st(1)
    6871:	dd 5c 24 08          	fstpl  0x8(%esp)
    6875:	dd 05 20 90 00 00    	fldl   0x9020
    687b:	dd 1c 24             	fstpl  (%esp)
    687e:	e8 37 da ff ff       	call   42ba <pow>
    6883:	dc 4d b8             	fmull  -0x48(%ebp)
    6886:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6889:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    688c:	e9 a4 00 00 00       	jmp    6935 <III_dequantize_sample+0x5cf>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
        //printf(0, "test point 3 in dequantize sample passed\n");
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				//printf(0, "test point 4 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, (-0.5) * (1.0+gr_info->scalefac_scale)
    6891:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6894:	89 d0                	mov    %edx,%eax
    6896:	c1 e0 03             	shl    $0x3,%eax
    6899:	01 d0                	add    %edx,%eax
    689b:	c1 e0 04             	shl    $0x4,%eax
    689e:	89 c3                	mov    %eax,%ebx
    68a0:	03 5d 0c             	add    0xc(%ebp),%ebx
    68a3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68a6:	89 d0                	mov    %edx,%eax
    68a8:	c1 e0 03             	shl    $0x3,%eax
    68ab:	01 d0                	add    %edx,%eax
    68ad:	c1 e0 04             	shl    $0x4,%eax
    68b0:	03 45 0c             	add    0xc(%ebp),%eax
    68b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    68b6:	dd 04 d0             	fldl   (%eax,%edx,8)
    68b9:	dd 5d b0             	fstpl  -0x50(%ebp)
    68bc:	8b 45 14             	mov    0x14(%ebp),%eax
    68bf:	8b 40 40             	mov    0x40(%eax),%eax
    68c2:	ba 00 00 00 00       	mov    $0x0,%edx
    68c7:	89 45 c8             	mov    %eax,-0x38(%ebp)
    68ca:	89 55 cc             	mov    %edx,-0x34(%ebp)
    68cd:	df 6d c8             	fildll -0x38(%ebp)
    68d0:	d9 e8                	fld1   
    68d2:	de c1                	faddp  %st,%st(1)
    68d4:	dd 05 30 90 00 00    	fldl   0x9030
    68da:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    68dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    68df:	8b 45 18             	mov    0x18(%ebp),%eax
    68e2:	01 c0                	add    %eax,%eax
    68e4:	89 c2                	mov    %eax,%edx
    68e6:	c1 e2 05             	shl    $0x5,%edx
    68e9:	29 c2                	sub    %eax,%edx
    68eb:	89 d0                	mov    %edx,%eax
    68ed:	03 45 ec             	add    -0x14(%ebp),%eax
    68f0:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    68f3:	89 c2                	mov    %eax,%edx
    68f5:	8b 45 14             	mov    0x14(%ebp),%eax
    68f8:	8b 48 3c             	mov    0x3c(%eax),%ecx
    68fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    68fe:	8b 04 85 80 c5 00 00 	mov    0xc580(,%eax,4),%eax
    6905:	0f af c1             	imul   %ecx,%eax
    6908:	01 d0                	add    %edx,%eax
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
        //printf(0, "test point 3 in dequantize sample passed\n");
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				//printf(0, "test point 4 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, (-0.5) * (1.0+gr_info->scalefac_scale)
    690a:	ba 00 00 00 00       	mov    $0x0,%edx
    690f:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6912:	89 55 cc             	mov    %edx,-0x34(%ebp)
    6915:	df 6d c8             	fildll -0x38(%ebp)
    6918:	de c9                	fmulp  %st,%st(1)
    691a:	dd 5c 24 08          	fstpl  0x8(%esp)
    691e:	dd 05 20 90 00 00    	fldl   0x9020
    6924:	dd 1c 24             	fstpl  (%esp)
    6927:	e8 8e d9 ff ff       	call   42ba <pow>
    692c:	dc 4d b0             	fmull  -0x50(%ebp)
    692f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6932:	dd 1c c3             	fstpl  (%ebx,%eax,8)
        //printf(0, "test point 4 in dequantize sample passed\n");
			}

			/* Scale quantized value. */
      //printf(0, "test point 5 in dequantize sample\n");
			sign = (is[sb][ss]<0) ? 1 : 0;
    6935:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6938:	89 d0                	mov    %edx,%eax
    693a:	c1 e0 03             	shl    $0x3,%eax
    693d:	01 d0                	add    %edx,%eax
    693f:	c1 e0 03             	shl    $0x3,%eax
    6942:	03 45 08             	add    0x8(%ebp),%eax
    6945:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6948:	8b 04 90             	mov    (%eax,%edx,4),%eax
    694b:	c1 e8 1f             	shr    $0x1f,%eax
    694e:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    6951:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6954:	89 d0                	mov    %edx,%eax
    6956:	c1 e0 03             	shl    $0x3,%eax
    6959:	01 d0                	add    %edx,%eax
    695b:	c1 e0 04             	shl    $0x4,%eax
    695e:	89 c3                	mov    %eax,%ebx
    6960:	03 5d 0c             	add    0xc(%ebp),%ebx
    6963:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6966:	89 d0                	mov    %edx,%eax
    6968:	c1 e0 03             	shl    $0x3,%eax
    696b:	01 d0                	add    %edx,%eax
    696d:	c1 e0 04             	shl    $0x4,%eax
    6970:	03 45 0c             	add    0xc(%ebp),%eax
    6973:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6976:	dd 04 d0             	fldl   (%eax,%edx,8)
    6979:	dd 5d a8             	fstpl  -0x58(%ebp)
    697c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    697f:	89 d0                	mov    %edx,%eax
    6981:	c1 e0 03             	shl    $0x3,%eax
    6984:	01 d0                	add    %edx,%eax
    6986:	c1 e0 03             	shl    $0x3,%eax
    6989:	03 45 08             	add    0x8(%ebp),%eax
    698c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    698f:	8b 04 90             	mov    (%eax,%edx,4),%eax
    6992:	89 04 24             	mov    %eax,(%esp)
    6995:	e8 5a d8 ff ff       	call   41f4 <abs>
    699a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    699d:	db 45 d4             	fildl  -0x2c(%ebp)
    69a0:	dd 05 38 90 00 00    	fldl   0x9038
    69a6:	dd 5c 24 08          	fstpl  0x8(%esp)
    69aa:	dd 1c 24             	fstpl  (%esp)
    69ad:	e8 08 d9 ff ff       	call   42ba <pow>
    69b2:	dc 4d a8             	fmull  -0x58(%ebp)
    69b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    69b8:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    69bb:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    69bf:	74 30                	je     69f1 <III_dequantize_sample+0x68b>
    69c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    69c4:	89 d0                	mov    %edx,%eax
    69c6:	c1 e0 03             	shl    $0x3,%eax
    69c9:	01 d0                	add    %edx,%eax
    69cb:	c1 e0 04             	shl    $0x4,%eax
    69ce:	89 c1                	mov    %eax,%ecx
    69d0:	03 4d 0c             	add    0xc(%ebp),%ecx
    69d3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    69d6:	89 d0                	mov    %edx,%eax
    69d8:	c1 e0 03             	shl    $0x3,%eax
    69db:	01 d0                	add    %edx,%eax
    69dd:	c1 e0 04             	shl    $0x4,%eax
    69e0:	03 45 0c             	add    0xc(%ebp),%eax
    69e3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    69e6:	dd 04 d0             	fldl   (%eax,%edx,8)
    69e9:	d9 e0                	fchs   
    69eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    69ee:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
    69f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    69f5:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    69f9:	0f 8e 17 fa ff ff    	jle    6416 <III_dequantize_sample+0xb0>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
    69ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6a03:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    6a07:	0f 8e fd f9 ff ff    	jle    640a <III_dequantize_sample+0xa4>
			if (sign) xr[sb][ss] = -xr[sb][ss];
      // printf(0, "test point 5 in dequantize sample passed\n");
      // printf(0, "\n");
		}
	}
}
    6a0d:	83 c4 60             	add    $0x60,%esp
    6a10:	5b                   	pop    %ebx
    6a11:	5e                   	pop    %esi
    6a12:	5d                   	pop    %ebp
    6a13:	c3                   	ret    

00006a14 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    6a14:	55                   	push   %ebp
    6a15:	89 e5                	mov    %esp,%ebp
    6a17:	57                   	push   %edi
    6a18:	56                   	push   %esi
    6a19:	53                   	push   %ebx
    6a1a:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    6a1d:	8b 45 14             	mov    0x14(%ebp),%eax
    6a20:	8b 00                	mov    (%eax),%eax
    6a22:	8b 40 10             	mov    0x10(%eax),%eax
    6a25:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    6a28:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6a2f:	eb 2f                	jmp    6a60 <III_reorder+0x4c>
      for(ss=0;ss<SSLIMIT;ss++)
    6a31:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6a38:	eb 1c                	jmp    6a56 <III_reorder+0x42>
         ro[sb][ss] = 0;
    6a3a:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6a3d:	89 d0                	mov    %edx,%eax
    6a3f:	c1 e0 03             	shl    $0x3,%eax
    6a42:	01 d0                	add    %edx,%eax
    6a44:	c1 e0 04             	shl    $0x4,%eax
    6a47:	03 45 0c             	add    0xc(%ebp),%eax
    6a4a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6a4d:	d9 ee                	fldz   
    6a4f:	dd 1c d0             	fstpl  (%eax,%edx,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    6a52:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6a56:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6a5a:	7e de                	jle    6a3a <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    6a5c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6a60:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6a64:	7e cb                	jle    6a31 <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    6a66:	8b 45 10             	mov    0x10(%ebp),%eax
    6a69:	8b 40 10             	mov    0x10(%eax),%eax
    6a6c:	85 c0                	test   %eax,%eax
    6a6e:	0f 84 8c 03 00 00    	je     6e00 <III_reorder+0x3ec>
    6a74:	8b 45 10             	mov    0x10(%ebp),%eax
    6a77:	8b 40 14             	mov    0x14(%eax),%eax
    6a7a:	83 f8 02             	cmp    $0x2,%eax
    6a7d:	0f 85 7d 03 00 00    	jne    6e00 <III_reorder+0x3ec>
      if (gr_info->mixed_block_flag) {
    6a83:	8b 45 10             	mov    0x10(%ebp),%eax
    6a86:	8b 40 18             	mov    0x18(%eax),%eax
    6a89:	85 c0                	test   %eax,%eax
    6a8b:	0f 84 ea 01 00 00    	je     6c7b <III_reorder+0x267>
         for (sb=0 ; sb < 2 ; sb++)
    6a91:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6a98:	eb 45                	jmp    6adf <III_reorder+0xcb>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    6a9a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6aa1:	eb 32                	jmp    6ad5 <III_reorder+0xc1>
               ro[sb][ss] = xr[sb][ss];
    6aa3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6aa6:	89 d0                	mov    %edx,%eax
    6aa8:	c1 e0 03             	shl    $0x3,%eax
    6aab:	01 d0                	add    %edx,%eax
    6aad:	c1 e0 04             	shl    $0x4,%eax
    6ab0:	89 c1                	mov    %eax,%ecx
    6ab2:	03 4d 0c             	add    0xc(%ebp),%ecx
    6ab5:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6ab8:	89 d0                	mov    %edx,%eax
    6aba:	c1 e0 03             	shl    $0x3,%eax
    6abd:	01 d0                	add    %edx,%eax
    6abf:	c1 e0 04             	shl    $0x4,%eax
    6ac2:	03 45 08             	add    0x8(%ebp),%eax
    6ac5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6ac8:	dd 04 d0             	fldl   (%eax,%edx,8)
    6acb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6ace:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    6ad1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6ad5:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6ad9:	7e c8                	jle    6aa3 <III_reorder+0x8f>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    6adb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6adf:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    6ae3:	7e b5                	jle    6a9a <III_reorder+0x86>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6ae5:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    6aec:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6aef:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6af5:	05 1c c4 00 00       	add    $0xc41c,%eax
    6afa:	8b 40 0c             	mov    0xc(%eax),%eax
    6afd:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    6b00:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6b03:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6b09:	05 20 c4 00 00       	add    $0xc420,%eax
    6b0e:	8b 40 0c             	mov    0xc(%eax),%eax
    6b11:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6b14:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6b17:	e9 50 01 00 00       	jmp    6c6c <III_reorder+0x258>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6b1c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6b23:	e9 f0 00 00 00       	jmp    6c18 <III_reorder+0x204>
                  for(freq=0;freq<sfb_lines;freq++) {
    6b28:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6b2f:	e9 d4 00 00 00       	jmp    6c08 <III_reorder+0x1f4>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6b34:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6b37:	89 d0                	mov    %edx,%eax
    6b39:	01 c0                	add    %eax,%eax
    6b3b:	01 c2                	add    %eax,%edx
    6b3d:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6b40:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6b44:	01 d0                	add    %edx,%eax
    6b46:	03 45 d4             	add    -0x2c(%ebp),%eax
    6b49:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6b4c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6b4f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6b52:	01 c2                	add    %eax,%edx
    6b54:	89 d0                	mov    %edx,%eax
    6b56:	01 c0                	add    %eax,%eax
    6b58:	01 d0                	add    %edx,%eax
    6b5a:	03 45 d8             	add    -0x28(%ebp),%eax
    6b5d:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6b60:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    6b63:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b68:	89 c8                	mov    %ecx,%eax
    6b6a:	f7 ea                	imul   %edx
    6b6c:	c1 fa 02             	sar    $0x2,%edx
    6b6f:	89 c8                	mov    %ecx,%eax
    6b71:	c1 f8 1f             	sar    $0x1f,%eax
    6b74:	89 d1                	mov    %edx,%ecx
    6b76:	29 c1                	sub    %eax,%ecx
    6b78:	89 c8                	mov    %ecx,%eax
    6b7a:	89 c2                	mov    %eax,%edx
    6b7c:	89 d0                	mov    %edx,%eax
    6b7e:	c1 e0 03             	shl    $0x3,%eax
    6b81:	01 d0                	add    %edx,%eax
    6b83:	c1 e0 04             	shl    $0x4,%eax
    6b86:	89 c6                	mov    %eax,%esi
    6b88:	03 75 0c             	add    0xc(%ebp),%esi
    6b8b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6b8e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b93:	89 d8                	mov    %ebx,%eax
    6b95:	f7 ea                	imul   %edx
    6b97:	c1 fa 02             	sar    $0x2,%edx
    6b9a:	89 d8                	mov    %ebx,%eax
    6b9c:	c1 f8 1f             	sar    $0x1f,%eax
    6b9f:	89 d1                	mov    %edx,%ecx
    6ba1:	29 c1                	sub    %eax,%ecx
    6ba3:	89 c8                	mov    %ecx,%eax
    6ba5:	c1 e0 03             	shl    $0x3,%eax
    6ba8:	01 c8                	add    %ecx,%eax
    6baa:	01 c0                	add    %eax,%eax
    6bac:	89 d9                	mov    %ebx,%ecx
    6bae:	29 c1                	sub    %eax,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6bb0:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6bb3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6bb8:	89 d8                	mov    %ebx,%eax
    6bba:	f7 ea                	imul   %edx
    6bbc:	c1 fa 02             	sar    $0x2,%edx
    6bbf:	89 d8                	mov    %ebx,%eax
    6bc1:	c1 f8 1f             	sar    $0x1f,%eax
    6bc4:	89 d3                	mov    %edx,%ebx
    6bc6:	29 c3                	sub    %eax,%ebx
    6bc8:	89 d8                	mov    %ebx,%eax
    6bca:	89 c2                	mov    %eax,%edx
    6bcc:	89 d0                	mov    %edx,%eax
    6bce:	c1 e0 03             	shl    $0x3,%eax
    6bd1:	01 d0                	add    %edx,%eax
    6bd3:	c1 e0 04             	shl    $0x4,%eax
    6bd6:	89 c7                	mov    %eax,%edi
    6bd8:	03 7d 08             	add    0x8(%ebp),%edi
    6bdb:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6bde:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6be3:	89 d8                	mov    %ebx,%eax
    6be5:	f7 ea                	imul   %edx
    6be7:	c1 fa 02             	sar    $0x2,%edx
    6bea:	89 d8                	mov    %ebx,%eax
    6bec:	c1 f8 1f             	sar    $0x1f,%eax
    6bef:	29 c2                	sub    %eax,%edx
    6bf1:	89 d0                	mov    %edx,%eax
    6bf3:	c1 e0 03             	shl    $0x3,%eax
    6bf6:	01 d0                	add    %edx,%eax
    6bf8:	01 c0                	add    %eax,%eax
    6bfa:	89 da                	mov    %ebx,%edx
    6bfc:	29 c2                	sub    %eax,%edx
    6bfe:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6c01:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    6c04:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6c08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6c0b:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6c0e:	0f 8c 20 ff ff ff    	jl     6b34 <III_reorder+0x120>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6c14:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6c18:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6c1c:	0f 8e 06 ff ff ff    	jle    6b28 <III_reorder+0x114>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6c22:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6c26:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6c29:	89 d0                	mov    %edx,%eax
    6c2b:	c1 e0 03             	shl    $0x3,%eax
    6c2e:	01 d0                	add    %edx,%eax
    6c30:	c1 e0 02             	shl    $0x2,%eax
    6c33:	01 d0                	add    %edx,%eax
    6c35:	03 45 ec             	add    -0x14(%ebp),%eax
    6c38:	83 c0 14             	add    $0x14,%eax
    6c3b:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    6c42:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6c45:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c48:	8d 48 01             	lea    0x1(%eax),%ecx
    6c4b:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6c4e:	89 d0                	mov    %edx,%eax
    6c50:	c1 e0 03             	shl    $0x3,%eax
    6c53:	01 d0                	add    %edx,%eax
    6c55:	c1 e0 02             	shl    $0x2,%eax
    6c58:	01 d0                	add    %edx,%eax
    6c5a:	01 c8                	add    %ecx,%eax
    6c5c:	83 c0 14             	add    $0x14,%eax
    6c5f:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    6c66:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6c69:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6c6c:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6c70:	0f 8e a6 fe ff ff    	jle    6b1c <III_reorder+0x108>
    6c76:	e9 83 01 00 00       	jmp    6dfe <III_reorder+0x3ea>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6c7b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6c82:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    6c89:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6c8c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6c92:	05 14 c4 00 00       	add    $0xc414,%eax
    6c97:	8b 40 0c             	mov    0xc(%eax),%eax
    6c9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6c9d:	e9 50 01 00 00       	jmp    6df2 <III_reorder+0x3de>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6ca2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6ca9:	e9 f0 00 00 00       	jmp    6d9e <III_reorder+0x38a>
                  for(freq=0;freq<sfb_lines;freq++) {
    6cae:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6cb5:	e9 d4 00 00 00       	jmp    6d8e <III_reorder+0x37a>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6cba:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6cbd:	89 d0                	mov    %edx,%eax
    6cbf:	01 c0                	add    %eax,%eax
    6cc1:	01 c2                	add    %eax,%edx
    6cc3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6cc6:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6cca:	01 d0                	add    %edx,%eax
    6ccc:	03 45 d4             	add    -0x2c(%ebp),%eax
    6ccf:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6cd2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6cd5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6cd8:	01 c2                	add    %eax,%edx
    6cda:	89 d0                	mov    %edx,%eax
    6cdc:	01 c0                	add    %eax,%eax
    6cde:	01 d0                	add    %edx,%eax
    6ce0:	03 45 d8             	add    -0x28(%ebp),%eax
    6ce3:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6ce6:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    6ce9:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6cee:	89 c8                	mov    %ecx,%eax
    6cf0:	f7 ea                	imul   %edx
    6cf2:	c1 fa 02             	sar    $0x2,%edx
    6cf5:	89 c8                	mov    %ecx,%eax
    6cf7:	c1 f8 1f             	sar    $0x1f,%eax
    6cfa:	89 d1                	mov    %edx,%ecx
    6cfc:	29 c1                	sub    %eax,%ecx
    6cfe:	89 c8                	mov    %ecx,%eax
    6d00:	89 c2                	mov    %eax,%edx
    6d02:	89 d0                	mov    %edx,%eax
    6d04:	c1 e0 03             	shl    $0x3,%eax
    6d07:	01 d0                	add    %edx,%eax
    6d09:	c1 e0 04             	shl    $0x4,%eax
    6d0c:	89 c6                	mov    %eax,%esi
    6d0e:	03 75 0c             	add    0xc(%ebp),%esi
    6d11:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6d14:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d19:	89 d8                	mov    %ebx,%eax
    6d1b:	f7 ea                	imul   %edx
    6d1d:	c1 fa 02             	sar    $0x2,%edx
    6d20:	89 d8                	mov    %ebx,%eax
    6d22:	c1 f8 1f             	sar    $0x1f,%eax
    6d25:	89 d1                	mov    %edx,%ecx
    6d27:	29 c1                	sub    %eax,%ecx
    6d29:	89 c8                	mov    %ecx,%eax
    6d2b:	c1 e0 03             	shl    $0x3,%eax
    6d2e:	01 c8                	add    %ecx,%eax
    6d30:	01 c0                	add    %eax,%eax
    6d32:	89 d9                	mov    %ebx,%ecx
    6d34:	29 c1                	sub    %eax,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6d36:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6d39:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d3e:	89 d8                	mov    %ebx,%eax
    6d40:	f7 ea                	imul   %edx
    6d42:	c1 fa 02             	sar    $0x2,%edx
    6d45:	89 d8                	mov    %ebx,%eax
    6d47:	c1 f8 1f             	sar    $0x1f,%eax
    6d4a:	89 d3                	mov    %edx,%ebx
    6d4c:	29 c3                	sub    %eax,%ebx
    6d4e:	89 d8                	mov    %ebx,%eax
    6d50:	89 c2                	mov    %eax,%edx
    6d52:	89 d0                	mov    %edx,%eax
    6d54:	c1 e0 03             	shl    $0x3,%eax
    6d57:	01 d0                	add    %edx,%eax
    6d59:	c1 e0 04             	shl    $0x4,%eax
    6d5c:	89 c7                	mov    %eax,%edi
    6d5e:	03 7d 08             	add    0x8(%ebp),%edi
    6d61:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6d64:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d69:	89 d8                	mov    %ebx,%eax
    6d6b:	f7 ea                	imul   %edx
    6d6d:	c1 fa 02             	sar    $0x2,%edx
    6d70:	89 d8                	mov    %ebx,%eax
    6d72:	c1 f8 1f             	sar    $0x1f,%eax
    6d75:	29 c2                	sub    %eax,%edx
    6d77:	89 d0                	mov    %edx,%eax
    6d79:	c1 e0 03             	shl    $0x3,%eax
    6d7c:	01 d0                	add    %edx,%eax
    6d7e:	01 c0                	add    %eax,%eax
    6d80:	89 da                	mov    %ebx,%edx
    6d82:	29 c2                	sub    %eax,%edx
    6d84:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6d87:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    6d8a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6d8e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6d91:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6d94:	0f 8c 20 ff ff ff    	jl     6cba <III_reorder+0x2a6>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6d9a:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6d9e:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6da2:	0f 8e 06 ff ff ff    	jle    6cae <III_reorder+0x29a>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6da8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6dac:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6daf:	89 d0                	mov    %edx,%eax
    6db1:	c1 e0 03             	shl    $0x3,%eax
    6db4:	01 d0                	add    %edx,%eax
    6db6:	c1 e0 02             	shl    $0x2,%eax
    6db9:	01 d0                	add    %edx,%eax
    6dbb:	03 45 ec             	add    -0x14(%ebp),%eax
    6dbe:	83 c0 14             	add    $0x14,%eax
    6dc1:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    6dc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6dcb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6dce:	8d 48 01             	lea    0x1(%eax),%ecx
    6dd1:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6dd4:	89 d0                	mov    %edx,%eax
    6dd6:	c1 e0 03             	shl    $0x3,%eax
    6dd9:	01 d0                	add    %edx,%eax
    6ddb:	c1 e0 02             	shl    $0x2,%eax
    6dde:	01 d0                	add    %edx,%eax
    6de0:	01 c8                	add    %ecx,%eax
    6de2:	83 c0 14             	add    $0x14,%eax
    6de5:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    6dec:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6def:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6df2:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6df6:	0f 8e a6 fe ff ff    	jle    6ca2 <III_reorder+0x28e>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    6dfc:	eb 56                	jmp    6e54 <III_reorder+0x440>
    6dfe:	eb 54                	jmp    6e54 <III_reorder+0x440>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6e00:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6e07:	eb 45                	jmp    6e4e <III_reorder+0x43a>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6e09:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6e10:	eb 32                	jmp    6e44 <III_reorder+0x430>
            ro[sb][ss] = xr[sb][ss];
    6e12:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6e15:	89 d0                	mov    %edx,%eax
    6e17:	c1 e0 03             	shl    $0x3,%eax
    6e1a:	01 d0                	add    %edx,%eax
    6e1c:	c1 e0 04             	shl    $0x4,%eax
    6e1f:	89 c1                	mov    %eax,%ecx
    6e21:	03 4d 0c             	add    0xc(%ebp),%ecx
    6e24:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6e27:	89 d0                	mov    %edx,%eax
    6e29:	c1 e0 03             	shl    $0x3,%eax
    6e2c:	01 d0                	add    %edx,%eax
    6e2e:	c1 e0 04             	shl    $0x4,%eax
    6e31:	03 45 08             	add    0x8(%ebp),%eax
    6e34:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6e37:	dd 04 d0             	fldl   (%eax,%edx,8)
    6e3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6e3d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6e40:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6e44:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6e48:	7e c8                	jle    6e12 <III_reorder+0x3fe>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6e4a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6e4e:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6e52:	7e b5                	jle    6e09 <III_reorder+0x3f5>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    6e54:	83 c4 34             	add    $0x34,%esp
    6e57:	5b                   	pop    %ebx
    6e58:	5e                   	pop    %esi
    6e59:	5f                   	pop    %edi
    6e5a:	5d                   	pop    %ebp
    6e5b:	c3                   	ret    

00006e5c <III_stereo>:

int is_pos[576];
double is_ratio[576];
void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    6e5c:	55                   	push   %ebp
    6e5d:	89 e5                	mov    %esp,%ebp
    6e5f:	56                   	push   %esi
    6e60:	53                   	push   %ebx
    6e61:	83 ec 60             	sub    $0x60,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    6e64:	8b 45 18             	mov    0x18(%ebp),%eax
    6e67:	8b 00                	mov    (%eax),%eax
    6e69:	8b 40 10             	mov    0x10(%eax),%eax
    6e6c:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    6e6f:	8b 45 18             	mov    0x18(%ebp),%eax
    6e72:	8b 40 08             	mov    0x8(%eax),%eax
    6e75:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e78:	8b 45 18             	mov    0x18(%ebp),%eax
    6e7b:	8b 00                	mov    (%eax),%eax
    6e7d:	8b 40 1c             	mov    0x1c(%eax),%eax
    6e80:	83 f8 01             	cmp    $0x1,%eax
    6e83:	75 16                	jne    6e9b <III_stereo+0x3f>
                   (fr_ps->header->mode_ext & 0x2);
    6e85:	8b 45 18             	mov    0x18(%ebp),%eax
    6e88:	8b 00                	mov    (%eax),%eax
    6e8a:	8b 40 20             	mov    0x20(%eax),%eax
    6e8d:	83 e0 02             	and    $0x2,%eax
double is_ratio[576];
void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e90:	85 c0                	test   %eax,%eax
    6e92:	74 07                	je     6e9b <III_stereo+0x3f>
    6e94:	b8 01 00 00 00       	mov    $0x1,%eax
    6e99:	eb 05                	jmp    6ea0 <III_stereo+0x44>
    6e9b:	b8 00 00 00 00       	mov    $0x0,%eax
    6ea0:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6ea3:	8b 45 18             	mov    0x18(%ebp),%eax
    6ea6:	8b 00                	mov    (%eax),%eax
    6ea8:	8b 40 1c             	mov    0x1c(%eax),%eax
    6eab:	83 f8 01             	cmp    $0x1,%eax
    6eae:	75 16                	jne    6ec6 <III_stereo+0x6a>
                  (fr_ps->header->mode_ext & 0x1);
    6eb0:	8b 45 18             	mov    0x18(%ebp),%eax
    6eb3:	8b 00                	mov    (%eax),%eax
    6eb5:	8b 40 20             	mov    0x20(%eax),%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6eb8:	83 e0 01             	and    $0x1,%eax
    6ebb:	84 c0                	test   %al,%al
    6ebd:	74 07                	je     6ec6 <III_stereo+0x6a>
    6ebf:	b8 01 00 00 00       	mov    $0x1,%eax
    6ec4:	eb 05                	jmp    6ecb <III_stereo+0x6f>
    6ec6:	b8 00 00 00 00       	mov    $0x0,%eax
    6ecb:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int i,j,sb,ss,ch;
   // is_pos[576];
   // double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    6ece:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6ed5:	eb 12                	jmp    6ee9 <III_stereo+0x8d>
      is_pos[i] = 7;
    6ed7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6eda:	c7 04 85 20 26 01 00 	movl   $0x7,0x12620(,%eax,4)
    6ee1:	07 00 00 00 
   int i,j,sb,ss,ch;
   // is_pos[576];
   // double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    6ee5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6ee9:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    6ef0:	7e e5                	jle    6ed7 <III_stereo+0x7b>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    6ef2:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    6ef6:	0f 85 f1 09 00 00    	jne    78ed <III_stereo+0xa91>
    6efc:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    6f00:	0f 84 e7 09 00 00    	je     78ed <III_stereo+0xa91>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    6f06:	8b 45 14             	mov    0x14(%ebp),%eax
    6f09:	8b 40 10             	mov    0x10(%eax),%eax
    6f0c:	85 c0                	test   %eax,%eax
    6f0e:	0f 84 f4 07 00 00    	je     7708 <III_stereo+0x8ac>
    6f14:	8b 45 14             	mov    0x14(%ebp),%eax
    6f17:	8b 40 14             	mov    0x14(%eax),%eax
    6f1a:	83 f8 02             	cmp    $0x2,%eax
    6f1d:	0f 85 e5 07 00 00    	jne    7708 <III_stereo+0x8ac>
      {  if( gr_info->mixed_block_flag )
    6f23:	8b 45 14             	mov    0x14(%ebp),%eax
    6f26:	8b 40 18             	mov    0x18(%eax),%eax
    6f29:	85 c0                	test   %eax,%eax
    6f2b:	0f 84 b7 04 00 00    	je     73e8 <III_stereo+0x58c>
         {  int max_sfb = 0;
    6f31:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    6f38:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6f3f:	e9 12 03 00 00       	jmp    7256 <III_stereo+0x3fa>
            {  int sfbcnt;
               sfbcnt = 2;
    6f44:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    6f4b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    6f52:	e9 0d 01 00 00       	jmp    7064 <III_stereo+0x208>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    6f57:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f5a:	8d 48 01             	lea    0x1(%eax),%ecx
    6f5d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6f60:	89 d0                	mov    %edx,%eax
    6f62:	c1 e0 03             	shl    $0x3,%eax
    6f65:	01 d0                	add    %edx,%eax
    6f67:	c1 e0 02             	shl    $0x2,%eax
    6f6a:	01 d0                	add    %edx,%eax
    6f6c:	01 c8                	add    %ecx,%eax
    6f6e:	83 c0 14             	add    $0x14,%eax
    6f71:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
    6f78:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6f7b:	89 d0                	mov    %edx,%eax
    6f7d:	c1 e0 03             	shl    $0x3,%eax
    6f80:	01 d0                	add    %edx,%eax
    6f82:	c1 e0 02             	shl    $0x2,%eax
    6f85:	01 d0                	add    %edx,%eax
    6f87:	03 45 f4             	add    -0xc(%ebp),%eax
    6f8a:	83 c0 14             	add    $0x14,%eax
    6f8d:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    6f94:	89 ca                	mov    %ecx,%edx
    6f96:	29 c2                	sub    %eax,%edx
    6f98:	89 d0                	mov    %edx,%eax
    6f9a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    6f9d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6fa0:	89 d0                	mov    %edx,%eax
    6fa2:	c1 e0 03             	shl    $0x3,%eax
    6fa5:	01 d0                	add    %edx,%eax
    6fa7:	c1 e0 02             	shl    $0x2,%eax
    6faa:	01 d0                	add    %edx,%eax
    6fac:	03 45 f4             	add    -0xc(%ebp),%eax
    6faf:	83 c0 14             	add    $0x14,%eax
    6fb2:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    6fb9:	89 d0                	mov    %edx,%eax
    6fbb:	01 c0                	add    %eax,%eax
    6fbd:	01 c2                	add    %eax,%edx
    6fbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6fc2:	83 c0 01             	add    $0x1,%eax
    6fc5:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    6fc9:	01 d0                	add    %edx,%eax
    6fcb:	83 e8 01             	sub    $0x1,%eax
    6fce:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    6fd1:	e9 80 00 00 00       	jmp    7056 <III_stereo+0x1fa>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    6fd6:	8b 45 08             	mov    0x8(%ebp),%eax
    6fd9:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    6fdf:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    6fe2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6fe7:	89 c8                	mov    %ecx,%eax
    6fe9:	f7 ea                	imul   %edx
    6feb:	c1 fa 02             	sar    $0x2,%edx
    6fee:	89 c8                	mov    %ecx,%eax
    6ff0:	c1 f8 1f             	sar    $0x1f,%eax
    6ff3:	89 d3                	mov    %edx,%ebx
    6ff5:	29 c3                	sub    %eax,%ebx
    6ff7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    6ffa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6fff:	89 c8                	mov    %ecx,%eax
    7001:	f7 ea                	imul   %edx
    7003:	c1 fa 02             	sar    $0x2,%edx
    7006:	89 c8                	mov    %ecx,%eax
    7008:	c1 f8 1f             	sar    $0x1f,%eax
    700b:	29 c2                	sub    %eax,%edx
    700d:	89 d0                	mov    %edx,%eax
    700f:	c1 e0 03             	shl    $0x3,%eax
    7012:	01 d0                	add    %edx,%eax
    7014:	01 c0                	add    %eax,%eax
    7016:	89 ca                	mov    %ecx,%edx
    7018:	29 c2                	sub    %eax,%edx
    701a:	89 d8                	mov    %ebx,%eax
    701c:	c1 e0 03             	shl    $0x3,%eax
    701f:	01 d8                	add    %ebx,%eax
    7021:	01 c0                	add    %eax,%eax
    7023:	01 d0                	add    %edx,%eax
    7025:	dd 04 c6             	fldl   (%esi,%eax,8)
    7028:	d9 ee                	fldz   
    702a:	df e9                	fucomip %st(1),%st
    702c:	7a 0a                	jp     7038 <III_stereo+0x1dc>
    702e:	d9 ee                	fldz   
    7030:	df e9                	fucomip %st(1),%st
    7032:	dd d8                	fstp   %st(0)
    7034:	74 18                	je     704e <III_stereo+0x1f2>
    7036:	eb 02                	jmp    703a <III_stereo+0x1de>
    7038:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    703a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    703d:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    7040:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    7047:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    704e:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    7052:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    7056:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    705a:	0f 8f 76 ff ff ff    	jg     6fd6 <III_stereo+0x17a>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    7060:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    7064:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    7068:	0f 8f e9 fe ff ff    	jg     6f57 <III_stereo+0xfb>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    706e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    7071:	83 c0 01             	add    $0x1,%eax
    7074:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    7077:	8b 45 f4             	mov    -0xc(%ebp),%eax
    707a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    707d:	0f 8e f1 00 00 00    	jle    7174 <III_stereo+0x318>
                  max_sfb = sfb;
    7083:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7086:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    7089:	e9 e6 00 00 00       	jmp    7174 <III_stereo+0x318>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    708e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7091:	8d 48 01             	lea    0x1(%eax),%ecx
    7094:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7097:	89 d0                	mov    %edx,%eax
    7099:	c1 e0 03             	shl    $0x3,%eax
    709c:	01 d0                	add    %edx,%eax
    709e:	c1 e0 02             	shl    $0x2,%eax
    70a1:	01 d0                	add    %edx,%eax
    70a3:	01 c8                	add    %ecx,%eax
    70a5:	83 c0 14             	add    $0x14,%eax
    70a8:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
    70af:	8b 55 c8             	mov    -0x38(%ebp),%edx
    70b2:	89 d0                	mov    %edx,%eax
    70b4:	c1 e0 03             	shl    $0x3,%eax
    70b7:	01 d0                	add    %edx,%eax
    70b9:	c1 e0 02             	shl    $0x2,%eax
    70bc:	01 d0                	add    %edx,%eax
    70be:	03 45 f4             	add    -0xc(%ebp),%eax
    70c1:	83 c0 14             	add    $0x14,%eax
    70c4:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    70cb:	89 ca                	mov    %ecx,%edx
    70cd:	29 c2                	sub    %eax,%edx
    70cf:	89 d0                	mov    %edx,%eax
    70d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    70d4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    70d7:	89 d0                	mov    %edx,%eax
    70d9:	c1 e0 03             	shl    $0x3,%eax
    70dc:	01 d0                	add    %edx,%eax
    70de:	c1 e0 02             	shl    $0x2,%eax
    70e1:	01 d0                	add    %edx,%eax
    70e3:	03 45 f4             	add    -0xc(%ebp),%eax
    70e6:	83 c0 14             	add    $0x14,%eax
    70e9:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    70f0:	89 d0                	mov    %edx,%eax
    70f2:	01 c0                	add    %eax,%eax
    70f4:	01 c2                	add    %eax,%edx
    70f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    70f9:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    70fd:	01 d0                	add    %edx,%eax
    70ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    7102:	eb 66                	jmp    716a <III_stereo+0x30e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    7104:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7107:	8b 55 ec             	mov    -0x14(%ebp),%edx
    710a:	89 d0                	mov    %edx,%eax
    710c:	01 c0                	add    %eax,%eax
    710e:	01 d0                	add    %edx,%eax
    7110:	c1 e0 02             	shl    $0x2,%eax
    7113:	01 d0                	add    %edx,%eax
    7115:	03 45 f4             	add    -0xc(%ebp),%eax
    7118:	83 c0 52             	add    $0x52,%eax
    711b:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    711f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7122:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
                     if ( is_pos[i] != 7 )
    7129:	8b 45 f0             	mov    -0x10(%ebp),%eax
    712c:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    7133:	83 f8 07             	cmp    $0x7,%eax
    7136:	74 2a                	je     7162 <III_stereo+0x306>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7138:	8b 45 f0             	mov    -0x10(%ebp),%eax
    713b:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    7142:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    7145:	db 45 b4             	fildl  -0x4c(%ebp)
    7148:	dd 05 40 90 00 00    	fldl   0x9040
    714e:	de c9                	fmulp  %st,%st(1)
    7150:	dd 1c 24             	fstpl  (%esp)
    7153:	e8 06 d1 ff ff       	call   425e <tan>
    7158:	8b 45 f0             	mov    -0x10(%ebp),%eax
    715b:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
                     i++;
    7162:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    7166:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    716a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    716e:	7f 94                	jg     7104 <III_stereo+0x2a8>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    7170:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    7174:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7178:	0f 8e 10 ff ff ff    	jle    708e <III_stereo+0x232>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    717e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7181:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7187:	05 3c c4 00 00       	add    $0xc43c,%eax
    718c:	8b 50 0c             	mov    0xc(%eax),%edx
    718f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7192:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7198:	05 38 c4 00 00       	add    $0xc438,%eax
    719d:	8b 40 0c             	mov    0xc(%eax),%eax
    71a0:	89 d1                	mov    %edx,%ecx
    71a2:	29 c1                	sub    %eax,%ecx
    71a4:	89 c8                	mov    %ecx,%eax
    71a6:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    71a9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71ac:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71b2:	05 38 c4 00 00       	add    $0xc438,%eax
    71b7:	8b 50 0c             	mov    0xc(%eax),%edx
    71ba:	89 d0                	mov    %edx,%eax
    71bc:	01 c0                	add    %eax,%eax
    71be:	01 c2                	add    %eax,%edx
    71c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    71c3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    71c7:	01 d0                	add    %edx,%eax
    71c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    71cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71cf:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71d5:	05 40 c4 00 00       	add    $0xc440,%eax
    71da:	8b 50 0c             	mov    0xc(%eax),%edx
    71dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71e0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71e6:	05 3c c4 00 00       	add    $0xc43c,%eax
    71eb:	8b 40 0c             	mov    0xc(%eax),%eax
    71ee:	89 d1                	mov    %edx,%ecx
    71f0:	29 c1                	sub    %eax,%ecx
    71f2:	89 c8                	mov    %ecx,%eax
    71f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    71f7:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71fa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7200:	05 3c c4 00 00       	add    $0xc43c,%eax
    7205:	8b 50 0c             	mov    0xc(%eax),%edx
    7208:	89 d0                	mov    %edx,%eax
    720a:	01 c0                	add    %eax,%eax
    720c:	01 c2                	add    %eax,%edx
    720e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7211:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7215:	01 d0                	add    %edx,%eax
    7217:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    721a:	eb 30                	jmp    724c <III_stereo+0x3f0>
               {  is_pos[i] = is_pos[sfb];
    721c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    721f:	8b 14 85 20 26 01 00 	mov    0x12620(,%eax,4),%edx
    7226:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7229:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    7230:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7233:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    723a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    723d:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
                  i++;
    7244:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    7248:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    724c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7250:	7f ca                	jg     721c <III_stereo+0x3c0>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    7252:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7256:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    725a:	0f 8e e4 fc ff ff    	jle    6f44 <III_stereo+0xe8>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    7260:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    7264:	0f 8f 82 06 00 00    	jg     78ec <III_stereo+0xa90>
             {  i = 2;
    726a:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    7271:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    7278:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    727f:	eb 5d                	jmp    72de <III_stereo+0x482>
                {  if ( xr[1][i][ss] != 0.0 )
    7281:	8b 45 08             	mov    0x8(%ebp),%eax
    7284:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    728a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    728d:	89 d0                	mov    %edx,%eax
    728f:	c1 e0 03             	shl    $0x3,%eax
    7292:	01 d0                	add    %edx,%eax
    7294:	01 c0                	add    %eax,%eax
    7296:	03 45 e4             	add    -0x1c(%ebp),%eax
    7299:	dd 04 c1             	fldl   (%ecx,%eax,8)
    729c:	d9 ee                	fldz   
    729e:	df e9                	fucomip %st(1),%st
    72a0:	7a 0a                	jp     72ac <III_stereo+0x450>
    72a2:	d9 ee                	fldz   
    72a4:	df e9                	fucomip %st(1),%st
    72a6:	dd d8                	fstp   %st(0)
    72a8:	74 1f                	je     72c9 <III_stereo+0x46d>
    72aa:	eb 02                	jmp    72ae <III_stereo+0x452>
    72ac:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    72ae:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72b1:	89 d0                	mov    %edx,%eax
    72b3:	c1 e0 03             	shl    $0x3,%eax
    72b6:	01 d0                	add    %edx,%eax
    72b8:	01 c0                	add    %eax,%eax
    72ba:	03 45 e4             	add    -0x1c(%ebp),%eax
    72bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    72c0:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    72c7:	eb 15                	jmp    72de <III_stereo+0x482>
                   } else
                   {  ss--;
    72c9:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    72cd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    72d1:	79 0b                	jns    72de <III_stereo+0x482>
                      {  i--;
    72d3:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    72d7:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    72de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    72e2:	79 9d                	jns    7281 <III_stereo+0x425>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    72e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    72eb:	eb 04                	jmp    72f1 <III_stereo+0x495>
                   i++;
    72ed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    72f1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    72f4:	89 d0                	mov    %edx,%eax
    72f6:	c1 e0 03             	shl    $0x3,%eax
    72f9:	01 d0                	add    %edx,%eax
    72fb:	c1 e0 02             	shl    $0x2,%eax
    72fe:	01 d0                	add    %edx,%eax
    7300:	03 45 f0             	add    -0x10(%ebp),%eax
    7303:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    730a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    730d:	7e de                	jle    72ed <III_stereo+0x491>
                   i++;
                sfb = i;
    730f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7312:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    7315:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7318:	89 d0                	mov    %edx,%eax
    731a:	c1 e0 03             	shl    $0x3,%eax
    731d:	01 d0                	add    %edx,%eax
    731f:	c1 e0 02             	shl    $0x2,%eax
    7322:	01 d0                	add    %edx,%eax
    7324:	03 45 f0             	add    -0x10(%ebp),%eax
    7327:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    732e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    7331:	e9 a3 00 00 00       	jmp    73d9 <III_stereo+0x57d>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    7336:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7339:	8d 48 01             	lea    0x1(%eax),%ecx
    733c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    733f:	89 d0                	mov    %edx,%eax
    7341:	c1 e0 03             	shl    $0x3,%eax
    7344:	01 d0                	add    %edx,%eax
    7346:	c1 e0 02             	shl    $0x2,%eax
    7349:	01 d0                	add    %edx,%eax
    734b:	01 c8                	add    %ecx,%eax
    734d:	8b 0c 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%ecx
    7354:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7357:	89 d0                	mov    %edx,%eax
    7359:	c1 e0 03             	shl    $0x3,%eax
    735c:	01 d0                	add    %edx,%eax
    735e:	c1 e0 02             	shl    $0x2,%eax
    7361:	01 d0                	add    %edx,%eax
    7363:	03 45 f4             	add    -0xc(%ebp),%eax
    7366:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    736d:	89 ca                	mov    %ecx,%edx
    736f:	29 c2                	sub    %eax,%edx
    7371:	89 d0                	mov    %edx,%eax
    7373:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    7376:	eb 57                	jmp    73cf <III_stereo+0x573>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    7378:	8b 45 10             	mov    0x10(%ebp),%eax
    737b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    737e:	83 c2 3e             	add    $0x3e,%edx
    7381:	8b 14 90             	mov    (%eax,%edx,4),%edx
    7384:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7387:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
                      if ( is_pos[i] != 7 )
    738e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7391:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    7398:	83 f8 07             	cmp    $0x7,%eax
    739b:	74 2a                	je     73c7 <III_stereo+0x56b>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    739d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73a0:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    73a7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    73aa:	db 45 b4             	fildl  -0x4c(%ebp)
    73ad:	dd 05 40 90 00 00    	fldl   0x9040
    73b3:	de c9                	fmulp  %st,%st(1)
    73b5:	dd 1c 24             	fstpl  (%esp)
    73b8:	e8 a1 ce ff ff       	call   425e <tan>
    73bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73c0:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
                      i++;
    73c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    73cb:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    73cf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    73d3:	7f a3                	jg     7378 <III_stereo+0x51c>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    73d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    73d9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    73dd:	0f 8e 53 ff ff ff    	jle    7336 <III_stereo+0x4da>
    73e3:	e9 1b 03 00 00       	jmp    7703 <III_stereo+0x8a7>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    73e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    73ef:	e9 00 03 00 00       	jmp    76f4 <III_stereo+0x898>
            {  int sfbcnt;
               sfbcnt = -1;
    73f4:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    73fb:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7402:	e9 0d 01 00 00       	jmp    7514 <III_stereo+0x6b8>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7407:	8b 45 f4             	mov    -0xc(%ebp),%eax
    740a:	8d 48 01             	lea    0x1(%eax),%ecx
    740d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7410:	89 d0                	mov    %edx,%eax
    7412:	c1 e0 03             	shl    $0x3,%eax
    7415:	01 d0                	add    %edx,%eax
    7417:	c1 e0 02             	shl    $0x2,%eax
    741a:	01 d0                	add    %edx,%eax
    741c:	01 c8                	add    %ecx,%eax
    741e:	83 c0 14             	add    $0x14,%eax
    7421:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
    7428:	8b 55 c8             	mov    -0x38(%ebp),%edx
    742b:	89 d0                	mov    %edx,%eax
    742d:	c1 e0 03             	shl    $0x3,%eax
    7430:	01 d0                	add    %edx,%eax
    7432:	c1 e0 02             	shl    $0x2,%eax
    7435:	01 d0                	add    %edx,%eax
    7437:	03 45 f4             	add    -0xc(%ebp),%eax
    743a:	83 c0 14             	add    $0x14,%eax
    743d:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    7444:	89 ca                	mov    %ecx,%edx
    7446:	29 c2                	sub    %eax,%edx
    7448:	89 d0                	mov    %edx,%eax
    744a:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    744d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7450:	89 d0                	mov    %edx,%eax
    7452:	c1 e0 03             	shl    $0x3,%eax
    7455:	01 d0                	add    %edx,%eax
    7457:	c1 e0 02             	shl    $0x2,%eax
    745a:	01 d0                	add    %edx,%eax
    745c:	03 45 f4             	add    -0xc(%ebp),%eax
    745f:	83 c0 14             	add    $0x14,%eax
    7462:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    7469:	89 d0                	mov    %edx,%eax
    746b:	01 c0                	add    %eax,%eax
    746d:	01 c2                	add    %eax,%edx
    746f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7472:	83 c0 01             	add    $0x1,%eax
    7475:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    7479:	01 d0                	add    %edx,%eax
    747b:	83 e8 01             	sub    $0x1,%eax
    747e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    7481:	e9 80 00 00 00       	jmp    7506 <III_stereo+0x6aa>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    7486:	8b 45 08             	mov    0x8(%ebp),%eax
    7489:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    748f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    7492:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7497:	89 c8                	mov    %ecx,%eax
    7499:	f7 ea                	imul   %edx
    749b:	c1 fa 02             	sar    $0x2,%edx
    749e:	89 c8                	mov    %ecx,%eax
    74a0:	c1 f8 1f             	sar    $0x1f,%eax
    74a3:	89 d3                	mov    %edx,%ebx
    74a5:	29 c3                	sub    %eax,%ebx
    74a7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    74aa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    74af:	89 c8                	mov    %ecx,%eax
    74b1:	f7 ea                	imul   %edx
    74b3:	c1 fa 02             	sar    $0x2,%edx
    74b6:	89 c8                	mov    %ecx,%eax
    74b8:	c1 f8 1f             	sar    $0x1f,%eax
    74bb:	29 c2                	sub    %eax,%edx
    74bd:	89 d0                	mov    %edx,%eax
    74bf:	c1 e0 03             	shl    $0x3,%eax
    74c2:	01 d0                	add    %edx,%eax
    74c4:	01 c0                	add    %eax,%eax
    74c6:	89 ca                	mov    %ecx,%edx
    74c8:	29 c2                	sub    %eax,%edx
    74ca:	89 d8                	mov    %ebx,%eax
    74cc:	c1 e0 03             	shl    $0x3,%eax
    74cf:	01 d8                	add    %ebx,%eax
    74d1:	01 c0                	add    %eax,%eax
    74d3:	01 d0                	add    %edx,%eax
    74d5:	dd 04 c6             	fldl   (%esi,%eax,8)
    74d8:	d9 ee                	fldz   
    74da:	df e9                	fucomip %st(1),%st
    74dc:	7a 0a                	jp     74e8 <III_stereo+0x68c>
    74de:	d9 ee                	fldz   
    74e0:	df e9                	fucomip %st(1),%st
    74e2:	dd d8                	fstp   %st(0)
    74e4:	74 18                	je     74fe <III_stereo+0x6a2>
    74e6:	eb 02                	jmp    74ea <III_stereo+0x68e>
    74e8:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    74ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    74ed:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    74f0:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    74f7:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    74fe:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    7502:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    7506:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    750a:	0f 8f 76 ff ff ff    	jg     7486 <III_stereo+0x62a>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    7510:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    7514:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    7518:	0f 89 e9 fe ff ff    	jns    7407 <III_stereo+0x5ab>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    751e:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7521:	83 c0 01             	add    $0x1,%eax
    7524:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    7527:	e9 e6 00 00 00       	jmp    7612 <III_stereo+0x7b6>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    752c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    752f:	8d 48 01             	lea    0x1(%eax),%ecx
    7532:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7535:	89 d0                	mov    %edx,%eax
    7537:	c1 e0 03             	shl    $0x3,%eax
    753a:	01 d0                	add    %edx,%eax
    753c:	c1 e0 02             	shl    $0x2,%eax
    753f:	01 d0                	add    %edx,%eax
    7541:	01 c8                	add    %ecx,%eax
    7543:	83 c0 14             	add    $0x14,%eax
    7546:	8b 0c 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%ecx
    754d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7550:	89 d0                	mov    %edx,%eax
    7552:	c1 e0 03             	shl    $0x3,%eax
    7555:	01 d0                	add    %edx,%eax
    7557:	c1 e0 02             	shl    $0x2,%eax
    755a:	01 d0                	add    %edx,%eax
    755c:	03 45 f4             	add    -0xc(%ebp),%eax
    755f:	83 c0 14             	add    $0x14,%eax
    7562:	8b 04 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%eax
    7569:	89 ca                	mov    %ecx,%edx
    756b:	29 c2                	sub    %eax,%edx
    756d:	89 d0                	mov    %edx,%eax
    756f:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    7572:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7575:	89 d0                	mov    %edx,%eax
    7577:	c1 e0 03             	shl    $0x3,%eax
    757a:	01 d0                	add    %edx,%eax
    757c:	c1 e0 02             	shl    $0x2,%eax
    757f:	01 d0                	add    %edx,%eax
    7581:	03 45 f4             	add    -0xc(%ebp),%eax
    7584:	83 c0 14             	add    $0x14,%eax
    7587:	8b 14 85 cc c3 00 00 	mov    0xc3cc(,%eax,4),%edx
    758e:	89 d0                	mov    %edx,%eax
    7590:	01 c0                	add    %eax,%eax
    7592:	01 c2                	add    %eax,%edx
    7594:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7597:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    759b:	01 d0                	add    %edx,%eax
    759d:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    75a0:	eb 66                	jmp    7608 <III_stereo+0x7ac>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    75a2:	8b 4d 10             	mov    0x10(%ebp),%ecx
    75a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    75a8:	89 d0                	mov    %edx,%eax
    75aa:	01 c0                	add    %eax,%eax
    75ac:	01 d0                	add    %edx,%eax
    75ae:	c1 e0 02             	shl    $0x2,%eax
    75b1:	01 d0                	add    %edx,%eax
    75b3:	03 45 f4             	add    -0xc(%ebp),%eax
    75b6:	83 c0 52             	add    $0x52,%eax
    75b9:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    75bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75c0:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
                     if ( is_pos[i] != 7 )
    75c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75ca:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    75d1:	83 f8 07             	cmp    $0x7,%eax
    75d4:	74 2a                	je     7600 <III_stereo+0x7a4>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    75d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75d9:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    75e0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    75e3:	db 45 b4             	fildl  -0x4c(%ebp)
    75e6:	dd 05 40 90 00 00    	fldl   0x9040
    75ec:	de c9                	fmulp  %st,%st(1)
    75ee:	dd 1c 24             	fstpl  (%esp)
    75f1:	e8 68 cc ff ff       	call   425e <tan>
    75f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75f9:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
                     i++;
    7600:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    7604:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7608:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    760c:	7f 94                	jg     75a2 <III_stereo+0x746>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    760e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    7612:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7616:	0f 8e 10 ff ff ff    	jle    752c <III_stereo+0x6d0>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    761c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    761f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7625:	05 3c c4 00 00       	add    $0xc43c,%eax
    762a:	8b 50 0c             	mov    0xc(%eax),%edx
    762d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7630:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7636:	05 38 c4 00 00       	add    $0xc438,%eax
    763b:	8b 40 0c             	mov    0xc(%eax),%eax
    763e:	89 d1                	mov    %edx,%ecx
    7640:	29 c1                	sub    %eax,%ecx
    7642:	89 c8                	mov    %ecx,%eax
    7644:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    7647:	8b 45 c8             	mov    -0x38(%ebp),%eax
    764a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7650:	05 38 c4 00 00       	add    $0xc438,%eax
    7655:	8b 50 0c             	mov    0xc(%eax),%edx
    7658:	89 d0                	mov    %edx,%eax
    765a:	01 c0                	add    %eax,%eax
    765c:	01 c2                	add    %eax,%edx
    765e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7661:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7665:	01 d0                	add    %edx,%eax
    7667:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    766a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    766d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7673:	05 40 c4 00 00       	add    $0xc440,%eax
    7678:	8b 50 0c             	mov    0xc(%eax),%edx
    767b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    767e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7684:	05 3c c4 00 00       	add    $0xc43c,%eax
    7689:	8b 40 0c             	mov    0xc(%eax),%eax
    768c:	89 d1                	mov    %edx,%ecx
    768e:	29 c1                	sub    %eax,%ecx
    7690:	89 c8                	mov    %ecx,%eax
    7692:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    7695:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7698:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    769e:	05 3c c4 00 00       	add    $0xc43c,%eax
    76a3:	8b 50 0c             	mov    0xc(%eax),%edx
    76a6:	89 d0                	mov    %edx,%eax
    76a8:	01 c0                	add    %eax,%eax
    76aa:	01 c2                	add    %eax,%edx
    76ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    76af:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    76b3:	01 d0                	add    %edx,%eax
    76b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    76b8:	eb 30                	jmp    76ea <III_stereo+0x88e>
               {  is_pos[i] = is_pos[sfb];
    76ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76bd:	8b 14 85 20 26 01 00 	mov    0x12620(,%eax,4),%edx
    76c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76c7:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    76ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76d1:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    76d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76db:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
                  i++;
    76e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    76e6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    76ea:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    76ee:	7f ca                	jg     76ba <III_stereo+0x85e>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    76f0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76f4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    76f8:	0f 8e f6 fc ff ff    	jle    73f4 <III_stereo+0x598>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    76fe:	e9 e9 01 00 00       	jmp    78ec <III_stereo+0xa90>
    7703:	e9 e4 01 00 00       	jmp    78ec <III_stereo+0xa90>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    7708:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    770f:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    7716:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    771d:	eb 5d                	jmp    777c <III_stereo+0x920>
         {  if ( xr[1][i][ss] != 0.0 )
    771f:	8b 45 08             	mov    0x8(%ebp),%eax
    7722:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7728:	8b 55 f0             	mov    -0x10(%ebp),%edx
    772b:	89 d0                	mov    %edx,%eax
    772d:	c1 e0 03             	shl    $0x3,%eax
    7730:	01 d0                	add    %edx,%eax
    7732:	01 c0                	add    %eax,%eax
    7734:	03 45 e4             	add    -0x1c(%ebp),%eax
    7737:	dd 04 c1             	fldl   (%ecx,%eax,8)
    773a:	d9 ee                	fldz   
    773c:	df e9                	fucomip %st(1),%st
    773e:	7a 0a                	jp     774a <III_stereo+0x8ee>
    7740:	d9 ee                	fldz   
    7742:	df e9                	fucomip %st(1),%st
    7744:	dd d8                	fstp   %st(0)
    7746:	74 1f                	je     7767 <III_stereo+0x90b>
    7748:	eb 02                	jmp    774c <III_stereo+0x8f0>
    774a:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    774c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    774f:	89 d0                	mov    %edx,%eax
    7751:	c1 e0 03             	shl    $0x3,%eax
    7754:	01 d0                	add    %edx,%eax
    7756:	01 c0                	add    %eax,%eax
    7758:	03 45 e4             	add    -0x1c(%ebp),%eax
    775b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    775e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    7765:	eb 15                	jmp    777c <III_stereo+0x920>
            } else
            {  ss--;
    7767:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    776b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    776f:	79 0b                	jns    777c <III_stereo+0x920>
               {  i--;
    7771:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    7775:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    777c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7780:	79 9d                	jns    771f <III_stereo+0x8c3>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    7782:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    7789:	eb 04                	jmp    778f <III_stereo+0x933>
            i++;
    778b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    778f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7792:	89 d0                	mov    %edx,%eax
    7794:	c1 e0 03             	shl    $0x3,%eax
    7797:	01 d0                	add    %edx,%eax
    7799:	c1 e0 02             	shl    $0x2,%eax
    779c:	01 d0                	add    %edx,%eax
    779e:	03 45 f0             	add    -0x10(%ebp),%eax
    77a1:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    77a8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    77ab:	7e de                	jle    778b <III_stereo+0x92f>
            i++;
         sfb = i;
    77ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    77b3:	8b 55 c8             	mov    -0x38(%ebp),%edx
    77b6:	89 d0                	mov    %edx,%eax
    77b8:	c1 e0 03             	shl    $0x3,%eax
    77bb:	01 d0                	add    %edx,%eax
    77bd:	c1 e0 02             	shl    $0x2,%eax
    77c0:	01 d0                	add    %edx,%eax
    77c2:	03 45 f0             	add    -0x10(%ebp),%eax
    77c5:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    77cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    77cf:	e9 a3 00 00 00       	jmp    7877 <III_stereo+0xa1b>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    77d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77d7:	8d 48 01             	lea    0x1(%eax),%ecx
    77da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    77dd:	89 d0                	mov    %edx,%eax
    77df:	c1 e0 03             	shl    $0x3,%eax
    77e2:	01 d0                	add    %edx,%eax
    77e4:	c1 e0 02             	shl    $0x2,%eax
    77e7:	01 d0                	add    %edx,%eax
    77e9:	01 c8                	add    %ecx,%eax
    77eb:	8b 0c 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%ecx
    77f2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    77f5:	89 d0                	mov    %edx,%eax
    77f7:	c1 e0 03             	shl    $0x3,%eax
    77fa:	01 d0                	add    %edx,%eax
    77fc:	c1 e0 02             	shl    $0x2,%eax
    77ff:	01 d0                	add    %edx,%eax
    7801:	03 45 f4             	add    -0xc(%ebp),%eax
    7804:	8b 04 85 c0 c3 00 00 	mov    0xc3c0(,%eax,4),%eax
    780b:	89 ca                	mov    %ecx,%edx
    780d:	29 c2                	sub    %eax,%edx
    780f:	89 d0                	mov    %edx,%eax
    7811:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    7814:	eb 57                	jmp    786d <III_stereo+0xa11>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    7816:	8b 45 10             	mov    0x10(%ebp),%eax
    7819:	8b 55 f4             	mov    -0xc(%ebp),%edx
    781c:	83 c2 3e             	add    $0x3e,%edx
    781f:	8b 14 90             	mov    (%eax,%edx,4),%edx
    7822:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7825:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
               if ( is_pos[i] != 7 )
    782c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    782f:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    7836:	83 f8 07             	cmp    $0x7,%eax
    7839:	74 2a                	je     7865 <III_stereo+0xa09>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    783b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    783e:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    7845:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    7848:	db 45 b4             	fildl  -0x4c(%ebp)
    784b:	dd 05 40 90 00 00    	fldl   0x9040
    7851:	de c9                	fmulp  %st,%st(1)
    7853:	dd 1c 24             	fstpl  (%esp)
    7856:	e8 03 ca ff ff       	call   425e <tan>
    785b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    785e:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
               i++;
    7865:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    7869:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    786d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7871:	7f a3                	jg     7816 <III_stereo+0x9ba>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    7873:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7877:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    787b:	0f 8e 53 ff ff ff    	jle    77d4 <III_stereo+0x978>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    7881:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7884:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    788a:	05 10 c4 00 00       	add    $0xc410,%eax
    788f:	8b 00                	mov    (%eax),%eax
    7891:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    7894:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7897:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    789d:	05 14 c4 00 00       	add    $0xc414,%eax
    78a2:	8b 00                	mov    (%eax),%eax
    78a4:	ba 40 02 00 00       	mov    $0x240,%edx
    78a9:	89 d1                	mov    %edx,%ecx
    78ab:	29 c1                	sub    %eax,%ecx
    78ad:	89 c8                	mov    %ecx,%eax
    78af:	89 45 e8             	mov    %eax,-0x18(%ebp)
    78b2:	eb 30                	jmp    78e4 <III_stereo+0xa88>
         {  is_pos[i] = is_pos[sfb];
    78b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78b7:	8b 14 85 20 26 01 00 	mov    0x12620(,%eax,4),%edx
    78be:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78c1:	89 14 85 20 26 01 00 	mov    %edx,0x12620(,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    78c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78cb:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    78d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78d5:	dd 1c c5 20 14 01 00 	fstpl  0x11420(,%eax,8)
            i++;
    78dc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    78e0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    78e4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    78e8:	7f ca                	jg     78b4 <III_stereo+0xa58>
    78ea:	eb 01                	jmp    78ed <III_stereo+0xa91>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    78ec:	90                   	nop
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    78ed:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    78f4:	eb 50                	jmp    7946 <III_stereo+0xaea>
      for(sb=0;sb<SBLIMIT;sb++)
    78f6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    78fd:	eb 3d                	jmp    793c <III_stereo+0xae0>
         for(ss=0;ss<SSLIMIT;ss++)
    78ff:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7906:	eb 2a                	jmp    7932 <III_stereo+0xad6>
            lr[ch][sb][ss] = 0;
    7908:	8b 55 e0             	mov    -0x20(%ebp),%edx
    790b:	89 d0                	mov    %edx,%eax
    790d:	c1 e0 03             	shl    $0x3,%eax
    7910:	01 d0                	add    %edx,%eax
    7912:	c1 e0 09             	shl    $0x9,%eax
    7915:	89 c1                	mov    %eax,%ecx
    7917:	03 4d 0c             	add    0xc(%ebp),%ecx
    791a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    791d:	89 d0                	mov    %edx,%eax
    791f:	c1 e0 03             	shl    $0x3,%eax
    7922:	01 d0                	add    %edx,%eax
    7924:	01 c0                	add    %eax,%eax
    7926:	03 45 e4             	add    -0x1c(%ebp),%eax
    7929:	d9 ee                	fldz   
    792b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    792e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7932:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7936:	7e d0                	jle    7908 <III_stereo+0xaac>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    7938:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    793c:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    7940:	7e bd                	jle    78ff <III_stereo+0xaa3>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    7942:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    7946:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    794a:	7e aa                	jle    78f6 <III_stereo+0xa9a>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    794c:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    7950:	0f 85 1d 02 00 00    	jne    7b73 <III_stereo+0xd17>
      for(sb=0;sb<SBLIMIT;sb++)
    7956:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    795d:	e9 05 02 00 00       	jmp    7b67 <III_stereo+0xd0b>
         for(ss=0;ss<SSLIMIT;ss++) {
    7962:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7969:	e9 eb 01 00 00       	jmp    7b59 <III_stereo+0xcfd>
            i = (sb*18)+ss;
    796e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7971:	89 d0                	mov    %edx,%eax
    7973:	c1 e0 03             	shl    $0x3,%eax
    7976:	01 d0                	add    %edx,%eax
    7978:	01 c0                	add    %eax,%eax
    797a:	03 45 e4             	add    -0x1c(%ebp),%eax
    797d:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    7980:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7983:	8b 04 85 20 26 01 00 	mov    0x12620(,%eax,4),%eax
    798a:	83 f8 07             	cmp    $0x7,%eax
    798d:	0f 85 18 01 00 00    	jne    7aab <III_stereo+0xc4f>
               if ( ms_stereo ) {
    7993:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    7997:	0f 84 a9 00 00 00    	je     7a46 <III_stereo+0xbea>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    799d:	8b 4d 08             	mov    0x8(%ebp),%ecx
    79a0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79a3:	89 d0                	mov    %edx,%eax
    79a5:	c1 e0 03             	shl    $0x3,%eax
    79a8:	01 d0                	add    %edx,%eax
    79aa:	01 c0                	add    %eax,%eax
    79ac:	03 45 e4             	add    -0x1c(%ebp),%eax
    79af:	dd 04 c1             	fldl   (%ecx,%eax,8)
    79b2:	8b 45 08             	mov    0x8(%ebp),%eax
    79b5:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    79bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79be:	89 d0                	mov    %edx,%eax
    79c0:	c1 e0 03             	shl    $0x3,%eax
    79c3:	01 d0                	add    %edx,%eax
    79c5:	01 c0                	add    %eax,%eax
    79c7:	03 45 e4             	add    -0x1c(%ebp),%eax
    79ca:	dd 04 c1             	fldl   (%ecx,%eax,8)
    79cd:	de c1                	faddp  %st,%st(1)
    79cf:	dd 05 48 90 00 00    	fldl   0x9048
    79d5:	de f9                	fdivrp %st,%st(1)
    79d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    79da:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79dd:	89 d0                	mov    %edx,%eax
    79df:	c1 e0 03             	shl    $0x3,%eax
    79e2:	01 d0                	add    %edx,%eax
    79e4:	01 c0                	add    %eax,%eax
    79e6:	03 45 e4             	add    -0x1c(%ebp),%eax
    79e9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    79ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    79ef:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    79f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    79f8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79fb:	89 d0                	mov    %edx,%eax
    79fd:	c1 e0 03             	shl    $0x3,%eax
    7a00:	01 d0                	add    %edx,%eax
    7a02:	01 c0                	add    %eax,%eax
    7a04:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a07:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a0a:	8b 45 08             	mov    0x8(%ebp),%eax
    7a0d:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7a13:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a16:	89 d0                	mov    %edx,%eax
    7a18:	c1 e0 03             	shl    $0x3,%eax
    7a1b:	01 d0                	add    %edx,%eax
    7a1d:	01 c0                	add    %eax,%eax
    7a1f:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a22:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a25:	de e9                	fsubrp %st,%st(1)
    7a27:	dd 05 48 90 00 00    	fldl   0x9048
    7a2d:	de f9                	fdivrp %st,%st(1)
    7a2f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a32:	89 d0                	mov    %edx,%eax
    7a34:	c1 e0 03             	shl    $0x3,%eax
    7a37:	01 d0                	add    %edx,%eax
    7a39:	01 c0                	add    %eax,%eax
    7a3b:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a3e:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    7a41:	e9 0f 01 00 00       	jmp    7b55 <III_stereo+0xcf9>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    7a46:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7a49:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a4c:	89 d0                	mov    %edx,%eax
    7a4e:	c1 e0 03             	shl    $0x3,%eax
    7a51:	01 d0                	add    %edx,%eax
    7a53:	01 c0                	add    %eax,%eax
    7a55:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a58:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a5b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7a5e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a61:	89 d0                	mov    %edx,%eax
    7a63:	c1 e0 03             	shl    $0x3,%eax
    7a66:	01 d0                	add    %edx,%eax
    7a68:	01 c0                	add    %eax,%eax
    7a6a:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a6d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    7a70:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a73:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7a79:	8b 45 08             	mov    0x8(%ebp),%eax
    7a7c:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7a82:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a85:	89 d0                	mov    %edx,%eax
    7a87:	c1 e0 03             	shl    $0x3,%eax
    7a8a:	01 d0                	add    %edx,%eax
    7a8c:	01 c0                	add    %eax,%eax
    7a8e:	03 45 e4             	add    -0x1c(%ebp),%eax
    7a91:	dd 04 c3             	fldl   (%ebx,%eax,8)
    7a94:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a97:	89 d0                	mov    %edx,%eax
    7a99:	c1 e0 03             	shl    $0x3,%eax
    7a9c:	01 d0                	add    %edx,%eax
    7a9e:	01 c0                	add    %eax,%eax
    7aa0:	03 45 e4             	add    -0x1c(%ebp),%eax
    7aa3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    7aa6:	e9 aa 00 00 00       	jmp    7b55 <III_stereo+0xcf9>
               }
            }
            else if (i_stereo ) {
    7aab:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    7aaf:	0f 84 8c 00 00 00    	je     7b41 <III_stereo+0xce5>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    7ab5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7ab8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7abb:	89 d0                	mov    %edx,%eax
    7abd:	c1 e0 03             	shl    $0x3,%eax
    7ac0:	01 d0                	add    %edx,%eax
    7ac2:	01 c0                	add    %eax,%eax
    7ac4:	03 45 e4             	add    -0x1c(%ebp),%eax
    7ac7:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7acd:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    7ad4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7ad7:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    7ade:	d9 e8                	fld1   
    7ae0:	de c1                	faddp  %st,%st(1)
    7ae2:	de f9                	fdivrp %st,%st(1)
    7ae4:	de c9                	fmulp  %st,%st(1)
    7ae6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7ae9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7aec:	89 d0                	mov    %edx,%eax
    7aee:	c1 e0 03             	shl    $0x3,%eax
    7af1:	01 d0                	add    %edx,%eax
    7af3:	01 c0                	add    %eax,%eax
    7af5:	03 45 e4             	add    -0x1c(%ebp),%eax
    7af8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    7afb:	8b 45 0c             	mov    0xc(%ebp),%eax
    7afe:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7b04:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7b07:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b0a:	89 d0                	mov    %edx,%eax
    7b0c:	c1 e0 03             	shl    $0x3,%eax
    7b0f:	01 d0                	add    %edx,%eax
    7b11:	01 c0                	add    %eax,%eax
    7b13:	03 45 e4             	add    -0x1c(%ebp),%eax
    7b16:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7b19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b1c:	dd 04 c5 20 14 01 00 	fldl   0x11420(,%eax,8)
    7b23:	d9 e8                	fld1   
    7b25:	de c1                	faddp  %st,%st(1)
    7b27:	d9 e8                	fld1   
    7b29:	de f1                	fdivp  %st,%st(1)
    7b2b:	de c9                	fmulp  %st,%st(1)
    7b2d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b30:	89 d0                	mov    %edx,%eax
    7b32:	c1 e0 03             	shl    $0x3,%eax
    7b35:	01 d0                	add    %edx,%eax
    7b37:	01 c0                	add    %eax,%eax
    7b39:	03 45 e4             	add    -0x1c(%ebp),%eax
    7b3c:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    7b3f:	eb 14                	jmp    7b55 <III_stereo+0xcf9>
            }
            else {
               printf(0,"Error in streo processing\n");
    7b41:	c7 44 24 04 e8 8f 00 	movl   $0x8fe8,0x4(%esp)
    7b48:	00 
    7b49:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    7b50:	e8 da c2 ff ff       	call   3e2f <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    7b55:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7b59:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7b5d:	0f 8e 0b fe ff ff    	jle    796e <III_stereo+0xb12>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    7b63:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7b67:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    7b6b:	0f 8e f1 fd ff ff    	jle    7962 <III_stereo+0xb06>
    7b71:	eb 50                	jmp    7bc3 <III_stereo+0xd67>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    7b73:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7b7a:	eb 41                	jmp    7bbd <III_stereo+0xd61>
         for(ss=0;ss<SSLIMIT;ss++)
    7b7c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7b83:	eb 2e                	jmp    7bb3 <III_stereo+0xd57>
            lr[0][sb][ss] = xr[0][sb][ss];
    7b85:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7b88:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b8b:	89 d0                	mov    %edx,%eax
    7b8d:	c1 e0 03             	shl    $0x3,%eax
    7b90:	01 d0                	add    %edx,%eax
    7b92:	01 c0                	add    %eax,%eax
    7b94:	03 45 e4             	add    -0x1c(%ebp),%eax
    7b97:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7b9a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7b9d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7ba0:	89 d0                	mov    %edx,%eax
    7ba2:	c1 e0 03             	shl    $0x3,%eax
    7ba5:	01 d0                	add    %edx,%eax
    7ba7:	01 c0                	add    %eax,%eax
    7ba9:	03 45 e4             	add    -0x1c(%ebp),%eax
    7bac:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    7baf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7bb3:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7bb7:	7e cc                	jle    7b85 <III_stereo+0xd29>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    7bb9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7bbd:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    7bc1:	7e b9                	jle    7b7c <III_stereo+0xd20>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    7bc3:	83 c4 60             	add    $0x60,%esp
    7bc6:	5b                   	pop    %ebx
    7bc7:	5e                   	pop    %esi
    7bc8:	5d                   	pop    %ebp
    7bc9:	c3                   	ret    

00007bca <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    7bca:	55                   	push   %ebp
    7bcb:	89 e5                	mov    %esp,%ebp
    7bcd:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    7bd0:	a1 30 d6 00 00       	mov    0xd630,%eax
    7bd5:	85 c0                	test   %eax,%eax
    7bd7:	74 68                	je     7c41 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    7bd9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7be0:	eb 4f                	jmp    7c31 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    7be2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7be5:	dd 04 c5 e0 c5 00 00 	fldl   0xc5e0(,%eax,8)
    7bec:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7bef:	dd 04 c5 e0 c5 00 00 	fldl   0xc5e0(,%eax,8)
    7bf6:	de c9                	fmulp  %st,%st(1)
    7bf8:	d9 e8                	fld1   
    7bfa:	de c1                	faddp  %st,%st(1)
    7bfc:	dd 1c 24             	fstpl  (%esp)
    7bff:	e8 e8 c7 ff ff       	call   43ec <sqrt>
    7c04:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    7c07:	d9 e8                	fld1   
    7c09:	dc 75 e0             	fdivl  -0x20(%ebp)
    7c0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c0f:	dd 1c c5 40 10 01 00 	fstpl  0x11040(,%eax,8)
         ca[i] = Ci[i]/sq;
    7c16:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c19:	dd 04 c5 e0 c5 00 00 	fldl   0xc5e0(,%eax,8)
    7c20:	dc 75 e0             	fdivl  -0x20(%ebp)
    7c23:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c26:	dd 1c c5 80 10 01 00 	fstpl  0x11080(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    7c2d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7c31:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    7c35:	7e ab                	jle    7be2 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    7c37:	c7 05 30 d6 00 00 00 	movl   $0x0,0xd630
    7c3e:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    7c41:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7c48:	eb 45                	jmp    7c8f <III_antialias+0xc5>
       for(ss=0;ss<SSLIMIT;ss++)
    7c4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7c51:	eb 32                	jmp    7c85 <III_antialias+0xbb>
          hybridIn[sb][ss] = xr[sb][ss];
    7c53:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c56:	89 d0                	mov    %edx,%eax
    7c58:	c1 e0 03             	shl    $0x3,%eax
    7c5b:	01 d0                	add    %edx,%eax
    7c5d:	c1 e0 04             	shl    $0x4,%eax
    7c60:	89 c1                	mov    %eax,%ecx
    7c62:	03 4d 0c             	add    0xc(%ebp),%ecx
    7c65:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c68:	89 d0                	mov    %edx,%eax
    7c6a:	c1 e0 03             	shl    $0x3,%eax
    7c6d:	01 d0                	add    %edx,%eax
    7c6f:	c1 e0 04             	shl    $0x4,%eax
    7c72:	03 45 08             	add    0x8(%ebp),%eax
    7c75:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7c78:	dd 04 d0             	fldl   (%eax,%edx,8)
    7c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7c7e:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    7c81:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7c85:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7c89:	7e c8                	jle    7c53 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    7c8b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7c8f:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    7c93:	7e b5                	jle    7c4a <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7c95:	8b 45 10             	mov    0x10(%ebp),%eax
    7c98:	8b 40 10             	mov    0x10(%eax),%eax
    7c9b:	85 c0                	test   %eax,%eax
    7c9d:	74 19                	je     7cb8 <III_antialias+0xee>
    7c9f:	8b 45 10             	mov    0x10(%ebp),%eax
    7ca2:	8b 40 14             	mov    0x14(%eax),%eax
    7ca5:	83 f8 02             	cmp    $0x2,%eax
    7ca8:	75 0e                	jne    7cb8 <III_antialias+0xee>
       !gr_info->mixed_block_flag ) return;
    7caa:	8b 45 10             	mov    0x10(%ebp),%eax
    7cad:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7cb0:	85 c0                	test   %eax,%eax
    7cb2:	0f 84 0d 01 00 00    	je     7dc5 <III_antialias+0x1fb>
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7cb8:	8b 45 10             	mov    0x10(%ebp),%eax
    7cbb:	8b 40 10             	mov    0x10(%eax),%eax
    7cbe:	85 c0                	test   %eax,%eax
    7cc0:	74 1e                	je     7ce0 <III_antialias+0x116>
    7cc2:	8b 45 10             	mov    0x10(%ebp),%eax
    7cc5:	8b 40 18             	mov    0x18(%eax),%eax
    7cc8:	85 c0                	test   %eax,%eax
    7cca:	74 14                	je     7ce0 <III_antialias+0x116>
     (gr_info->block_type == 2))
    7ccc:	8b 45 10             	mov    0x10(%ebp),%eax
    7ccf:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7cd2:	83 f8 02             	cmp    $0x2,%eax
    7cd5:	75 09                	jne    7ce0 <III_antialias+0x116>
     (gr_info->block_type == 2))
      sblim = 1;
    7cd7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    7cde:	eb 07                	jmp    7ce7 <III_antialias+0x11d>
   else
      sblim = SBLIMIT-1;
    7ce0:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    7ce7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7cee:	e9 c4 00 00 00       	jmp    7db7 <III_antialias+0x1ed>
      for(ss=0;ss<8;ss++) {
    7cf3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7cfa:	e9 aa 00 00 00       	jmp    7da9 <III_antialias+0x1df>
         bu = xr[sb][17-ss];
    7cff:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d02:	89 d0                	mov    %edx,%eax
    7d04:	c1 e0 03             	shl    $0x3,%eax
    7d07:	01 d0                	add    %edx,%eax
    7d09:	c1 e0 04             	shl    $0x4,%eax
    7d0c:	03 45 08             	add    0x8(%ebp),%eax
    7d0f:	ba 11 00 00 00       	mov    $0x11,%edx
    7d14:	2b 55 f4             	sub    -0xc(%ebp),%edx
    7d17:	dd 04 d0             	fldl   (%eax,%edx,8)
    7d1a:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    7d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d20:	8d 50 01             	lea    0x1(%eax),%edx
    7d23:	89 d0                	mov    %edx,%eax
    7d25:	c1 e0 03             	shl    $0x3,%eax
    7d28:	01 d0                	add    %edx,%eax
    7d2a:	c1 e0 04             	shl    $0x4,%eax
    7d2d:	03 45 08             	add    0x8(%ebp),%eax
    7d30:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d33:	dd 04 d0             	fldl   (%eax,%edx,8)
    7d36:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    7d39:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d3c:	89 d0                	mov    %edx,%eax
    7d3e:	c1 e0 03             	shl    $0x3,%eax
    7d41:	01 d0                	add    %edx,%eax
    7d43:	c1 e0 04             	shl    $0x4,%eax
    7d46:	03 45 0c             	add    0xc(%ebp),%eax
    7d49:	ba 11 00 00 00       	mov    $0x11,%edx
    7d4e:	2b 55 f4             	sub    -0xc(%ebp),%edx
    7d51:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d54:	dd 04 cd 40 10 01 00 	fldl   0x11040(,%ecx,8)
    7d5b:	dc 4d d8             	fmull  -0x28(%ebp)
    7d5e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7d61:	dd 04 cd 80 10 01 00 	fldl   0x11080(,%ecx,8)
    7d68:	dc 4d d0             	fmull  -0x30(%ebp)
    7d6b:	de e9                	fsubrp %st,%st(1)
    7d6d:	dd 1c d0             	fstpl  (%eax,%edx,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    7d70:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d73:	8d 50 01             	lea    0x1(%eax),%edx
    7d76:	89 d0                	mov    %edx,%eax
    7d78:	c1 e0 03             	shl    $0x3,%eax
    7d7b:	01 d0                	add    %edx,%eax
    7d7d:	c1 e0 04             	shl    $0x4,%eax
    7d80:	03 45 0c             	add    0xc(%ebp),%eax
    7d83:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d86:	dd 04 d5 40 10 01 00 	fldl   0x11040(,%edx,8)
    7d8d:	dc 4d d0             	fmull  -0x30(%ebp)
    7d90:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d93:	dd 04 d5 80 10 01 00 	fldl   0x11080(,%edx,8)
    7d9a:	dc 4d d8             	fmull  -0x28(%ebp)
    7d9d:	de c1                	faddp  %st,%st(1)
    7d9f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7da2:	dd 1c d0             	fstpl  (%eax,%edx,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    7da5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7da9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7dad:	0f 8e 4c ff ff ff    	jle    7cff <III_antialias+0x135>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    7db3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7db7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7dba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    7dbd:	0f 8c 30 ff ff ff    	jl     7cf3 <III_antialias+0x129>
    7dc3:	eb 01                	jmp    7dc6 <III_antialias+0x1fc>
    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;
    7dc5:	90                   	nop
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    7dc6:	c9                   	leave  
    7dc7:	c3                   	ret    

00007dc8 <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    7dc8:	55                   	push   %ebp
    7dc9:	89 e5                	mov    %esp,%ebp
    7dcb:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    7dd1:	a1 20 07 01 00       	mov    0x10720,%eax
    7dd6:	85 c0                	test   %eax,%eax
    7dd8:	0f 85 59 02 00 00    	jne    8037 <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    7dde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7de5:	eb 29                	jmp    7e10 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    7de7:	db 45 f4             	fildl  -0xc(%ebp)
    7dea:	dd 05 50 90 00 00    	fldl   0x9050
    7df0:	de c1                	faddp  %st,%st(1)
    7df2:	dd 05 58 90 00 00    	fldl   0x9058
    7df8:	de c9                	fmulp  %st,%st(1)
    7dfa:	dd 1c 24             	fstpl  (%esp)
    7dfd:	e8 06 c4 ff ff       	call   4208 <sin>
    7e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e05:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    7e0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e10:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7e14:	7e d1                	jle    7de7 <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    7e16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7e1d:	eb 2c                	jmp    7e4b <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    7e1f:	db 45 f4             	fildl  -0xc(%ebp)
    7e22:	dd 05 50 90 00 00    	fldl   0x9050
    7e28:	de c1                	faddp  %st,%st(1)
    7e2a:	dd 05 58 90 00 00    	fldl   0x9058
    7e30:	de c9                	fmulp  %st,%st(1)
    7e32:	dd 1c 24             	fstpl  (%esp)
    7e35:	e8 ce c3 ff ff       	call   4208 <sin>
    7e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e3d:	83 c0 24             	add    $0x24,%eax
    7e40:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    7e47:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e4b:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7e4f:	7e ce                	jle    7e1f <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    7e51:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7e58:	eb 13                	jmp    7e6d <inv_mdct+0xa5>
         win[1][i] = 1.0;
    7e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e5d:	83 c0 24             	add    $0x24,%eax
    7e60:	d9 e8                	fld1   
    7e62:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    7e69:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e6d:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    7e71:	7e e7                	jle    7e5a <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    7e73:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    7e7a:	eb 34                	jmp    7eb0 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    7e7c:	db 45 f4             	fildl  -0xc(%ebp)
    7e7f:	dd 05 50 90 00 00    	fldl   0x9050
    7e85:	de c1                	faddp  %st,%st(1)
    7e87:	dd 05 60 90 00 00    	fldl   0x9060
    7e8d:	de e9                	fsubrp %st,%st(1)
    7e8f:	dd 05 40 90 00 00    	fldl   0x9040
    7e95:	de c9                	fmulp  %st,%st(1)
    7e97:	dd 1c 24             	fstpl  (%esp)
    7e9a:	e8 69 c3 ff ff       	call   4208 <sin>
    7e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ea2:	83 c0 24             	add    $0x24,%eax
    7ea5:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    7eac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7eb0:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    7eb4:	7e c6                	jle    7e7c <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    7eb6:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    7ebd:	eb 13                	jmp    7ed2 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    7ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ec2:	83 c0 24             	add    $0x24,%eax
    7ec5:	d9 ee                	fldz   
    7ec7:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    7ece:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ed2:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7ed6:	7e e7                	jle    7ebf <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    7ed8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7edf:	eb 13                	jmp    7ef4 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    7ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ee4:	83 c0 6c             	add    $0x6c,%eax
    7ee7:	d9 ee                	fldz   
    7ee9:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    7ef0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ef4:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7ef8:	7e e7                	jle    7ee1 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    7efa:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7f01:	eb 34                	jmp    7f37 <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    7f03:	db 45 f4             	fildl  -0xc(%ebp)
    7f06:	dd 05 50 90 00 00    	fldl   0x9050
    7f0c:	de c1                	faddp  %st,%st(1)
    7f0e:	dd 05 68 90 00 00    	fldl   0x9068
    7f14:	de e9                	fsubrp %st,%st(1)
    7f16:	dd 05 40 90 00 00    	fldl   0x9040
    7f1c:	de c9                	fmulp  %st,%st(1)
    7f1e:	dd 1c 24             	fstpl  (%esp)
    7f21:	e8 e2 c2 ff ff       	call   4208 <sin>
    7f26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f29:	83 c0 6c             	add    $0x6c,%eax
    7f2c:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    7f33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f37:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7f3b:	7e c6                	jle    7f03 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    7f3d:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7f44:	eb 13                	jmp    7f59 <inv_mdct+0x191>
         win[3][i] =1.0;
    7f46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f49:	83 c0 6c             	add    $0x6c,%eax
    7f4c:	d9 e8                	fld1   
    7f4e:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    7f55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f59:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7f5d:	7e e7                	jle    7f46 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    7f5f:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7f66:	eb 2c                	jmp    7f94 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    7f68:	db 45 f4             	fildl  -0xc(%ebp)
    7f6b:	dd 05 50 90 00 00    	fldl   0x9050
    7f71:	de c1                	faddp  %st,%st(1)
    7f73:	dd 05 58 90 00 00    	fldl   0x9058
    7f79:	de c9                	fmulp  %st,%st(1)
    7f7b:	dd 1c 24             	fstpl  (%esp)
    7f7e:	e8 85 c2 ff ff       	call   4208 <sin>
    7f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f86:	83 c0 6c             	add    $0x6c,%eax
    7f89:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    7f90:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f94:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7f98:	7e ce                	jle    7f68 <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    7f9a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fa1:	eb 2c                	jmp    7fcf <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    7fa3:	db 45 f4             	fildl  -0xc(%ebp)
    7fa6:	dd 05 50 90 00 00    	fldl   0x9050
    7fac:	de c1                	faddp  %st,%st(1)
    7fae:	dd 05 40 90 00 00    	fldl   0x9040
    7fb4:	de c9                	fmulp  %st,%st(1)
    7fb6:	dd 1c 24             	fstpl  (%esp)
    7fb9:	e8 4a c2 ff ff       	call   4208 <sin>
    7fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fc1:	83 c0 48             	add    $0x48,%eax
    7fc4:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    7fcb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7fcf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7fd3:	7e ce                	jle    7fa3 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    7fd5:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7fdc:	eb 13                	jmp    7ff1 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    7fde:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fe1:	83 c0 48             	add    $0x48,%eax
    7fe4:	d9 ee                	fldz   
    7fe6:	dd 1c c5 40 07 01 00 	fstpl  0x10740(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    7fed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ff1:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7ff5:	7e e7                	jle    7fde <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    7ff7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7ffe:	eb 21                	jmp    8021 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    8000:	db 45 f4             	fildl  -0xc(%ebp)
    8003:	dd 05 70 90 00 00    	fldl   0x9070
    8009:	de c9                	fmulp  %st,%st(1)
    800b:	dd 1c 24             	fstpl  (%esp)
    800e:	e8 20 c2 ff ff       	call   4233 <cos>
    8013:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8016:	dd 1c c5 c0 0b 01 00 	fstpl  0x10bc0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    801d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8021:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    8028:	7e d6                	jle    8000 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    802a:	a1 20 07 01 00       	mov    0x10720,%eax
    802f:	83 c0 01             	add    $0x1,%eax
    8032:	a3 20 07 01 00       	mov    %eax,0x10720
    }

    for(i=0;i<36;i++)
    8037:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    803e:	eb 11                	jmp    8051 <inv_mdct+0x289>
       out[i]=0;
    8040:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8043:	c1 e0 03             	shl    $0x3,%eax
    8046:	03 45 0c             	add    0xc(%ebp),%eax
    8049:	d9 ee                	fldz   
    804b:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    804d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8051:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    8055:	7e e9                	jle    8040 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    8057:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    805b:	0f 85 68 01 00 00    	jne    81c9 <inv_mdct+0x401>
       N=12;
    8061:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    8068:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    806f:	e9 46 01 00 00       	jmp    81ba <inv_mdct+0x3f2>
          for(p= 0;p<N;p++){
    8074:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    807b:	e9 d5 00 00 00       	jmp    8155 <inv_mdct+0x38d>
             sum = 0.0;
    8080:	d9 ee                	fldz   
    8082:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    8085:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    808c:	e9 87 00 00 00       	jmp    8118 <inv_mdct+0x350>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    8091:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8094:	89 d0                	mov    %edx,%eax
    8096:	01 c0                	add    %eax,%eax
    8098:	01 d0                	add    %edx,%eax
    809a:	03 45 f4             	add    -0xc(%ebp),%eax
    809d:	c1 e0 03             	shl    $0x3,%eax
    80a0:	03 45 08             	add    0x8(%ebp),%eax
    80a3:	dd 00                	fldl   (%eax)
    80a5:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    80ab:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80ae:	01 c0                	add    %eax,%eax
    80b0:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    80b6:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    80bc:	dd 05 78 90 00 00    	fldl   0x9078
    80c2:	de f1                	fdivp  %st,%st(1)
    80c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    80c7:	01 c0                	add    %eax,%eax
    80c9:	8d 50 01             	lea    0x1(%eax),%edx
    80cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    80cf:	89 c1                	mov    %eax,%ecx
    80d1:	c1 e9 1f             	shr    $0x1f,%ecx
    80d4:	01 c8                	add    %ecx,%eax
    80d6:	d1 f8                	sar    %eax
    80d8:	01 d0                	add    %edx,%eax
    80da:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    80e0:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    80e6:	de c9                	fmulp  %st,%st(1)
    80e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    80eb:	01 c0                	add    %eax,%eax
    80ed:	83 c0 01             	add    $0x1,%eax
    80f0:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    80f6:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    80fc:	de c9                	fmulp  %st,%st(1)
    80fe:	dd 1c 24             	fstpl  (%esp)
    8101:	e8 2d c1 ff ff       	call   4233 <cos>
    8106:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    810c:	dd 45 e0             	fldl   -0x20(%ebp)
    810f:	de c1                	faddp  %st,%st(1)
    8111:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    8114:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8118:	8b 45 dc             	mov    -0x24(%ebp),%eax
    811b:	89 c2                	mov    %eax,%edx
    811d:	c1 ea 1f             	shr    $0x1f,%edx
    8120:	01 d0                	add    %edx,%eax
    8122:	d1 f8                	sar    %eax
    8124:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    8127:	0f 8f 64 ff ff ff    	jg     8091 <inv_mdct+0x2c9>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    812d:	8b 55 10             	mov    0x10(%ebp),%edx
    8130:	89 d0                	mov    %edx,%eax
    8132:	c1 e0 03             	shl    $0x3,%eax
    8135:	01 d0                	add    %edx,%eax
    8137:	c1 e0 02             	shl    $0x2,%eax
    813a:	03 45 ec             	add    -0x14(%ebp),%eax
    813d:	dd 04 c5 40 07 01 00 	fldl   0x10740(,%eax,8)
    8144:	dc 4d e0             	fmull  -0x20(%ebp)
    8147:	8b 45 ec             	mov    -0x14(%ebp),%eax
    814a:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    8151:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8155:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8158:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    815b:	0f 8c 1f ff ff ff    	jl     8080 <inv_mdct+0x2b8>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    8161:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8168:	eb 44                	jmp    81ae <inv_mdct+0x3e6>
             out[6*i+p+6] += tmp[p];
    816a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    816d:	89 d0                	mov    %edx,%eax
    816f:	01 c0                	add    %eax,%eax
    8171:	01 d0                	add    %edx,%eax
    8173:	01 c0                	add    %eax,%eax
    8175:	03 45 ec             	add    -0x14(%ebp),%eax
    8178:	83 c0 06             	add    $0x6,%eax
    817b:	c1 e0 03             	shl    $0x3,%eax
    817e:	89 c1                	mov    %eax,%ecx
    8180:	03 4d 0c             	add    0xc(%ebp),%ecx
    8183:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8186:	89 d0                	mov    %edx,%eax
    8188:	01 c0                	add    %eax,%eax
    818a:	01 d0                	add    %edx,%eax
    818c:	01 c0                	add    %eax,%eax
    818e:	03 45 ec             	add    -0x14(%ebp),%eax
    8191:	83 c0 06             	add    $0x6,%eax
    8194:	c1 e0 03             	shl    $0x3,%eax
    8197:	03 45 0c             	add    0xc(%ebp),%eax
    819a:	dd 00                	fldl   (%eax)
    819c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    819f:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    81a6:	de c1                	faddp  %st,%st(1)
    81a8:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    81aa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81b1:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    81b4:	7c b4                	jl     816a <inv_mdct+0x3a2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    81b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    81ba:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    81be:	0f 8e b0 fe ff ff    	jle    8074 <inv_mdct+0x2ac>
    81c4:	e9 cd 00 00 00       	jmp    8296 <inv_mdct+0x4ce>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    81c9:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    81d0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    81d7:	e9 ae 00 00 00       	jmp    828a <inv_mdct+0x4c2>
         sum = 0.0;
    81dc:	d9 ee                	fldz   
    81de:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    81e1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    81e8:	eb 64                	jmp    824e <inv_mdct+0x486>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    81ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    81ed:	c1 e0 03             	shl    $0x3,%eax
    81f0:	03 45 08             	add    0x8(%ebp),%eax
    81f3:	dd 00                	fldl   (%eax)
    81f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81f8:	01 c0                	add    %eax,%eax
    81fa:	8d 50 01             	lea    0x1(%eax),%edx
    81fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8200:	89 c1                	mov    %eax,%ecx
    8202:	c1 e9 1f             	shr    $0x1f,%ecx
    8205:	01 c8                	add    %ecx,%eax
    8207:	d1 f8                	sar    %eax
    8209:	01 c2                	add    %eax,%edx
    820b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    820e:	01 c0                	add    %eax,%eax
    8210:	83 c0 01             	add    $0x1,%eax
    8213:	89 d1                	mov    %edx,%ecx
    8215:	0f af c8             	imul   %eax,%ecx
    8218:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    821d:	89 c8                	mov    %ecx,%eax
    821f:	f7 ea                	imul   %edx
    8221:	c1 fa 05             	sar    $0x5,%edx
    8224:	89 c8                	mov    %ecx,%eax
    8226:	c1 f8 1f             	sar    $0x1f,%eax
    8229:	29 c2                	sub    %eax,%edx
    822b:	89 d0                	mov    %edx,%eax
    822d:	c1 e0 03             	shl    $0x3,%eax
    8230:	01 d0                	add    %edx,%eax
    8232:	c1 e0 04             	shl    $0x4,%eax
    8235:	89 ca                	mov    %ecx,%edx
    8237:	29 c2                	sub    %eax,%edx
    8239:	dd 04 d5 c0 0b 01 00 	fldl   0x10bc0(,%edx,8)
    8240:	de c9                	fmulp  %st,%st(1)
    8242:	dd 45 e0             	fldl   -0x20(%ebp)
    8245:	de c1                	faddp  %st,%st(1)
    8247:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    824a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    824e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8251:	89 c2                	mov    %eax,%edx
    8253:	c1 ea 1f             	shr    $0x1f,%edx
    8256:	01 d0                	add    %edx,%eax
    8258:	d1 f8                	sar    %eax
    825a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    825d:	7f 8b                	jg     81ea <inv_mdct+0x422>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    825f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8262:	c1 e0 03             	shl    $0x3,%eax
    8265:	89 c1                	mov    %eax,%ecx
    8267:	03 4d 0c             	add    0xc(%ebp),%ecx
    826a:	8b 55 10             	mov    0x10(%ebp),%edx
    826d:	89 d0                	mov    %edx,%eax
    826f:	c1 e0 03             	shl    $0x3,%eax
    8272:	01 d0                	add    %edx,%eax
    8274:	c1 e0 02             	shl    $0x2,%eax
    8277:	03 45 ec             	add    -0x14(%ebp),%eax
    827a:	dd 04 c5 40 07 01 00 	fldl   0x10740(,%eax,8)
    8281:	dc 4d e0             	fmull  -0x20(%ebp)
    8284:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    8286:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    828a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    828d:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8290:	0f 8c 46 ff ff ff    	jl     81dc <inv_mdct+0x414>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    8296:	c9                   	leave  
    8297:	c3                   	ret    

00008298 <III_hybrid>:

double rawout[36];
void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    8298:	55                   	push   %ebp
    8299:	89 e5                	mov    %esp,%ebp
    829b:	53                   	push   %ebx
    829c:	83 ec 34             	sub    $0x34,%esp
   // double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    829f:	a1 2c d6 00 00       	mov    0xd62c,%eax
    82a4:	85 c0                	test   %eax,%eax
    82a6:	74 6d                	je     8315 <III_hybrid+0x7d>
      int i,j,k;

      for(i=0;i<2;i++)
    82a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    82af:	eb 54                	jmp    8305 <III_hybrid+0x6d>
         for(j=0;j<SBLIMIT;j++)
    82b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    82b8:	eb 41                	jmp    82fb <III_hybrid+0x63>
            for(k=0;k<SSLIMIT;k++)
    82ba:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    82c1:	eb 2e                	jmp    82f1 <III_hybrid+0x59>
               prevblck[i][j][k]=0.0;
    82c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82c6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    82c9:	89 c2                	mov    %eax,%edx
    82cb:	c1 e2 03             	shl    $0x3,%edx
    82ce:	01 c2                	add    %eax,%edx
    82d0:	8d 04 12             	lea    (%edx,%edx,1),%eax
    82d3:	89 c2                	mov    %eax,%edx
    82d5:	89 c8                	mov    %ecx,%eax
    82d7:	c1 e0 03             	shl    $0x3,%eax
    82da:	01 c8                	add    %ecx,%eax
    82dc:	c1 e0 06             	shl    $0x6,%eax
    82df:	01 d0                	add    %edx,%eax
    82e1:	03 45 e8             	add    -0x18(%ebp),%eax
    82e4:	d9 ee                	fldz   
    82e6:	dd 1c c5 20 e3 00 00 	fstpl  0xe320(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    82ed:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    82f1:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    82f5:	7e cc                	jle    82c3 <III_hybrid+0x2b>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    82f7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    82fb:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    82ff:	7e b9                	jle    82ba <III_hybrid+0x22>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    8301:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8305:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8309:	7e a6                	jle    82b1 <III_hybrid+0x19>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    830b:	c7 05 2c d6 00 00 00 	movl   $0x0,0xd62c
    8312:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    8315:	8b 45 18             	mov    0x18(%ebp),%eax
    8318:	8b 40 10             	mov    0x10(%eax),%eax
    831b:	85 c0                	test   %eax,%eax
    831d:	74 10                	je     832f <III_hybrid+0x97>
    831f:	8b 45 18             	mov    0x18(%ebp),%eax
    8322:	8b 40 18             	mov    0x18(%eax),%eax
    8325:	85 c0                	test   %eax,%eax
    8327:	74 06                	je     832f <III_hybrid+0x97>
          (sb < 2)) ? 0 : gr_info->block_type;
    8329:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    832d:	7e 08                	jle    8337 <III_hybrid+0x9f>
    832f:	8b 45 18             	mov    0x18(%ebp),%eax
    8332:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    8335:	eb 05                	jmp    833c <III_hybrid+0xa4>
    8337:	b8 00 00 00 00       	mov    $0x0,%eax
    833c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    833f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8342:	89 44 24 08          	mov    %eax,0x8(%esp)
    8346:	c7 44 24 04 00 13 01 	movl   $0x11300,0x4(%esp)
    834d:	00 
    834e:	8b 45 08             	mov    0x8(%ebp),%eax
    8351:	89 04 24             	mov    %eax,(%esp)
    8354:	e8 6f fa ff ff       	call   7dc8 <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    8359:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8360:	eb 7a                	jmp    83dc <III_hybrid+0x144>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    8362:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8365:	c1 e0 03             	shl    $0x3,%eax
    8368:	89 c3                	mov    %eax,%ebx
    836a:	03 5d 0c             	add    0xc(%ebp),%ebx
    836d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8370:	dd 04 c5 00 13 01 00 	fldl   0x11300(,%eax,8)
    8377:	8b 45 10             	mov    0x10(%ebp),%eax
    837a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    837d:	89 c2                	mov    %eax,%edx
    837f:	c1 e2 03             	shl    $0x3,%edx
    8382:	01 c2                	add    %eax,%edx
    8384:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8387:	89 c2                	mov    %eax,%edx
    8389:	89 c8                	mov    %ecx,%eax
    838b:	c1 e0 03             	shl    $0x3,%eax
    838e:	01 c8                	add    %ecx,%eax
    8390:	c1 e0 06             	shl    $0x6,%eax
    8393:	01 d0                	add    %edx,%eax
    8395:	03 45 f4             	add    -0xc(%ebp),%eax
    8398:	dd 04 c5 20 e3 00 00 	fldl   0xe320(,%eax,8)
    839f:	de c1                	faddp  %st,%st(1)
    83a1:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    83a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83a6:	83 c0 12             	add    $0x12,%eax
    83a9:	dd 04 c5 00 13 01 00 	fldl   0x11300(,%eax,8)
    83b0:	8b 45 10             	mov    0x10(%ebp),%eax
    83b3:	8b 4d 14             	mov    0x14(%ebp),%ecx
    83b6:	89 c2                	mov    %eax,%edx
    83b8:	c1 e2 03             	shl    $0x3,%edx
    83bb:	01 c2                	add    %eax,%edx
    83bd:	8d 04 12             	lea    (%edx,%edx,1),%eax
    83c0:	89 c2                	mov    %eax,%edx
    83c2:	89 c8                	mov    %ecx,%eax
    83c4:	c1 e0 03             	shl    $0x3,%eax
    83c7:	01 c8                	add    %ecx,%eax
    83c9:	c1 e0 06             	shl    $0x6,%eax
    83cc:	01 d0                	add    %edx,%eax
    83ce:	03 45 f4             	add    -0xc(%ebp),%eax
    83d1:	dd 1c c5 20 e3 00 00 	fstpl  0xe320(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    83d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    83dc:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    83e0:	7e 80                	jle    8362 <III_hybrid+0xca>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    83e2:	83 c4 34             	add    $0x34,%esp
    83e5:	5b                   	pop    %ebx
    83e6:	5d                   	pop    %ebp
    83e7:	c3                   	ret    

000083e8 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    83e8:	55                   	push   %ebp
    83e9:	89 e5                	mov    %esp,%ebp
    83eb:	53                   	push   %ebx
    83ec:	83 ec 34             	sub    $0x34,%esp
	int i,k;

	for (i=0; i<64; i++)
    83ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83f6:	e9 2d 01 00 00       	jmp    8528 <create_syn_filter+0x140>
		for (k=0; k<32; k++) {
    83fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8402:	e9 13 01 00 00       	jmp    851a <create_syn_filter+0x132>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    8407:	8b 45 f4             	mov    -0xc(%ebp),%eax
    840a:	c1 e0 08             	shl    $0x8,%eax
    840d:	89 c3                	mov    %eax,%ebx
    840f:	03 5d 08             	add    0x8(%ebp),%ebx
    8412:	db 45 f4             	fildl  -0xc(%ebp)
    8415:	dd 05 80 90 00 00    	fldl   0x9080
    841b:	de c9                	fmulp  %st,%st(1)
    841d:	dd 05 88 90 00 00    	fldl   0x9088
    8423:	de c1                	faddp  %st,%st(1)
    8425:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8428:	01 c0                	add    %eax,%eax
    842a:	83 c0 01             	add    $0x1,%eax
    842d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8430:	db 45 e0             	fildl  -0x20(%ebp)
    8433:	de c9                	fmulp  %st,%st(1)
    8435:	dd 1c 24             	fstpl  (%esp)
    8438:	e8 f6 bd ff ff       	call   4233 <cos>
    843d:	dd 05 90 90 00 00    	fldl   0x9090
    8443:	de c9                	fmulp  %st,%st(1)
    8445:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8448:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    844b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    844e:	dd 04 c3             	fldl   (%ebx,%eax,8)
    8451:	d9 ee                	fldz   
    8453:	d9 c9                	fxch   %st(1)
    8455:	df e9                	fucomip %st(1),%st
    8457:	dd d8                	fstp   %st(0)
    8459:	0f 93 c0             	setae  %al
    845c:	84 c0                	test   %al,%al
    845e:	74 49                	je     84a9 <create_syn_filter+0xc1>
				filter[i][k] = (int)(filter[i][k]+0.5);
    8460:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8463:	c1 e0 08             	shl    $0x8,%eax
    8466:	89 c2                	mov    %eax,%edx
    8468:	03 55 08             	add    0x8(%ebp),%edx
    846b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    846e:	c1 e0 08             	shl    $0x8,%eax
    8471:	03 45 08             	add    0x8(%ebp),%eax
    8474:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8477:	dd 04 c8             	fldl   (%eax,%ecx,8)
    847a:	dd 05 50 90 00 00    	fldl   0x9050
    8480:	de c1                	faddp  %st,%st(1)
    8482:	d9 7d e6             	fnstcw -0x1a(%ebp)
    8485:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    8489:	b4 0c                	mov    $0xc,%ah
    848b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    848f:	d9 6d e4             	fldcw  -0x1c(%ebp)
    8492:	db 5d e0             	fistpl -0x20(%ebp)
    8495:	d9 6d e6             	fldcw  -0x1a(%ebp)
    8498:	8b 45 e0             	mov    -0x20(%ebp),%eax
    849b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    849e:	db 45 e0             	fildl  -0x20(%ebp)
    84a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84a4:	dd 1c c2             	fstpl  (%edx,%eax,8)
    84a7:	eb 47                	jmp    84f0 <create_syn_filter+0x108>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    84a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84ac:	c1 e0 08             	shl    $0x8,%eax
    84af:	89 c2                	mov    %eax,%edx
    84b1:	03 55 08             	add    0x8(%ebp),%edx
    84b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84b7:	c1 e0 08             	shl    $0x8,%eax
    84ba:	03 45 08             	add    0x8(%ebp),%eax
    84bd:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    84c0:	dd 04 c8             	fldl   (%eax,%ecx,8)
    84c3:	dd 05 50 90 00 00    	fldl   0x9050
    84c9:	de e9                	fsubrp %st,%st(1)
    84cb:	d9 7d e6             	fnstcw -0x1a(%ebp)
    84ce:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    84d2:	b4 0c                	mov    $0xc,%ah
    84d4:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    84d8:	d9 6d e4             	fldcw  -0x1c(%ebp)
    84db:	db 5d e0             	fistpl -0x20(%ebp)
    84de:	d9 6d e6             	fldcw  -0x1a(%ebp)
    84e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    84e4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    84e7:	db 45 e0             	fildl  -0x20(%ebp)
    84ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84ed:	dd 1c c2             	fstpl  (%edx,%eax,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    84f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84f3:	c1 e0 08             	shl    $0x8,%eax
    84f6:	03 45 08             	add    0x8(%ebp),%eax
    84f9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    84fc:	c1 e2 08             	shl    $0x8,%edx
    84ff:	03 55 08             	add    0x8(%ebp),%edx
    8502:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8505:	dd 04 ca             	fldl   (%edx,%ecx,8)
    8508:	dd 05 98 90 00 00    	fldl   0x9098
    850e:	de c9                	fmulp  %st,%st(1)
    8510:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8513:	dd 1c d0             	fstpl  (%eax,%edx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    8516:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    851a:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    851e:	0f 8e e3 fe ff ff    	jle    8407 <create_syn_filter+0x1f>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	int i,k;

	for (i=0; i<64; i++)
    8524:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8528:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    852c:	0f 8e c9 fe ff ff    	jle    83fb <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    8532:	83 c4 34             	add    $0x34,%esp
    8535:	5b                   	pop    %ebx
    8536:	5d                   	pop    %ebp
    8537:	c3                   	ret    

00008538 <read_syn_window>:
  0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
};

/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    8538:	55                   	push   %ebp
    8539:	89 e5                	mov    %esp,%ebp
    853b:	83 ec 10             	sub    $0x10,%esp
  int i;
  for (i = 0; i < HAN_SIZE; i++) {
    853e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    8545:	eb 19                	jmp    8560 <read_syn_window+0x28>
    window[i] = gb_window[i];
    8547:	8b 45 fc             	mov    -0x4(%ebp),%eax
    854a:	c1 e0 03             	shl    $0x3,%eax
    854d:	03 45 08             	add    0x8(%ebp),%eax
    8550:	8b 55 fc             	mov    -0x4(%ebp),%edx
    8553:	dd 04 d5 20 c6 00 00 	fldl   0xc620(,%edx,8)
    855a:	dd 18                	fstpl  (%eax)

/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
  int i;
  for (i = 0; i < HAN_SIZE; i++) {
    855c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    8560:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%ebp)
    8567:	7e de                	jle    8547 <read_syn_window+0xf>
    window[i] = gb_window[i];
  }
}
    8569:	c9                   	leave  
    856a:	c3                   	ret    

0000856b <SubBandSynthesis>:

typedef double NN[64][32];
typedef double BB[2][2*HAN_SIZE];
int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    856b:	55                   	push   %ebp
    856c:	89 e5                	mov    %esp,%ebp
    856e:	83 ec 58             	sub    $0x58,%esp
	static int flag = 1;
	static NN *filter;
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    8571:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

	if (flag) {
    8578:	a1 20 d6 00 00       	mov    0xd620,%eax
    857d:	85 c0                	test   %eax,%eax
    857f:	74 6f                	je     85f0 <SubBandSynthesis+0x85>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    8581:	c7 44 24 04 03 90 00 	movl   $0x9003,0x4(%esp)
    8588:	00 
    8589:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    8590:	e8 d2 c0 ff ff       	call   4667 <mem_alloc>
    8595:	a3 00 e3 00 00       	mov    %eax,0xe300
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    859a:	c7 44 24 04 06 90 00 	movl   $0x9006,0x4(%esp)
    85a1:	00 
    85a2:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    85a9:	e8 b9 c0 ff ff       	call   4667 <mem_alloc>
    85ae:	a3 04 e3 00 00       	mov    %eax,0xe304
		create_syn_filter(*filter);
    85b3:	a1 04 e3 00 00       	mov    0xe304,%eax
    85b8:	89 04 24             	mov    %eax,(%esp)
    85bb:	e8 28 fe ff ff       	call   83e8 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    85c0:	c7 44 24 04 09 90 00 	movl   $0x9009,0x4(%esp)
    85c7:	00 
    85c8:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    85cf:	e8 93 c0 ff ff       	call   4667 <mem_alloc>
    85d4:	a3 08 e3 00 00       	mov    %eax,0xe308
		read_syn_window(window);
    85d9:	a1 08 e3 00 00       	mov    0xe308,%eax
    85de:	89 04 24             	mov    %eax,(%esp)
    85e1:	e8 52 ff ff ff       	call   8538 <read_syn_window>
    	//unsigned int *p = (unsigned int*)window;
    // printf(0, "Come here\n");
    // printf(0, "%x %x %x %x %x %x\n", *p, *(p+1), *(p+2), *(p+3), *(p+4), *(p+5));
		flag = 0;
    85e6:	c7 05 20 d6 00 00 00 	movl   $0x0,0xd620
    85ed:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    85f0:	8b 45 0c             	mov    0xc(%ebp),%eax
    85f3:	8b 04 85 24 d6 00 00 	mov    0xd624(,%eax,4),%eax
    85fa:	83 e8 40             	sub    $0x40,%eax
    85fd:	89 c2                	mov    %eax,%edx
    85ff:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    8605:	8b 45 0c             	mov    0xc(%ebp),%eax
    8608:	89 14 85 24 d6 00 00 	mov    %edx,0xd624(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    860f:	8b 15 00 e3 00 00    	mov    0xe300,%edx
    8615:	8b 45 0c             	mov    0xc(%ebp),%eax
    8618:	89 c1                	mov    %eax,%ecx
    861a:	c1 e1 0a             	shl    $0xa,%ecx
    861d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8620:	8b 04 85 24 d6 00 00 	mov    0xd624(,%eax,4),%eax
    8627:	01 c8                	add    %ecx,%eax
    8629:	c1 e0 03             	shl    $0x3,%eax
    862c:	01 d0                	add    %edx,%eax
    862e:	89 45 d8             	mov    %eax,-0x28(%ebp)
	for (i=0; i<64; i++) {
    8631:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8638:	eb 50                	jmp    868a <SubBandSynthesis+0x11f>
		sum = 0;
    863a:	d9 ee                	fldz   
    863c:	dd 5d e0             	fstpl  -0x20(%ebp)
		for (k=0; k<32; k++){
    863f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8646:	eb 2a                	jmp    8672 <SubBandSynthesis+0x107>
			sum += bandPtr[k] * (*filter)[i][k];
    8648:	8b 45 ec             	mov    -0x14(%ebp),%eax
    864b:	c1 e0 03             	shl    $0x3,%eax
    864e:	03 45 08             	add    0x8(%ebp),%eax
    8651:	dd 00                	fldl   (%eax)
    8653:	a1 04 e3 00 00       	mov    0xe304,%eax
    8658:	8b 55 f4             	mov    -0xc(%ebp),%edx
    865b:	c1 e2 05             	shl    $0x5,%edx
    865e:	03 55 ec             	add    -0x14(%ebp),%edx
    8661:	dd 04 d0             	fldl   (%eax,%edx,8)
    8664:	de c9                	fmulp  %st,%st(1)
    8666:	dd 45 e0             	fldl   -0x20(%ebp)
    8669:	de c1                	faddp  %st,%st(1)
    866b:	dd 5d e0             	fstpl  -0x20(%ebp)
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++){
    866e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8672:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    8676:	7e d0                	jle    8648 <SubBandSynthesis+0xdd>
			sum += bandPtr[k] * (*filter)[i][k];
		}
		bufOffsetPtr[i] = sum;
    8678:	8b 45 f4             	mov    -0xc(%ebp),%eax
    867b:	c1 e0 03             	shl    $0x3,%eax
    867e:	03 45 d8             	add    -0x28(%ebp),%eax
    8681:	dd 45 e0             	fldl   -0x20(%ebp)
    8684:	dd 18                	fstpl  (%eax)
		flag = 0;
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
	for (i=0; i<64; i++) {
    8686:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    868a:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    868e:	7e aa                	jle    863a <SubBandSynthesis+0xcf>
		}
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    8690:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8697:	e9 dc 00 00 00       	jmp    8778 <SubBandSynthesis+0x20d>
		sum = 0;
    869c:	d9 ee                	fldz   
    869e:	dd 5d e0             	fstpl  -0x20(%ebp)
		for (i=0; i<16; i++) {
    86a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    86a8:	eb 5d                	jmp    8707 <SubBandSynthesis+0x19c>
			k = j + (i<<5);
    86aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    86ad:	c1 e0 05             	shl    $0x5,%eax
    86b0:	03 45 f0             	add    -0x10(%ebp),%eax
    86b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    86b6:	a1 08 e3 00 00       	mov    0xe308,%eax
    86bb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    86be:	c1 e2 03             	shl    $0x3,%edx
    86c1:	01 d0                	add    %edx,%eax
    86c3:	dd 00                	fldl   (%eax)
    86c5:	a1 00 e3 00 00       	mov    0xe300,%eax
    86ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
    86cd:	83 c2 01             	add    $0x1,%edx
    86d0:	d1 fa                	sar    %edx
    86d2:	c1 e2 06             	shl    $0x6,%edx
    86d5:	89 d1                	mov    %edx,%ecx
    86d7:	03 4d ec             	add    -0x14(%ebp),%ecx
												bufOffset[channel]) & 0x3ff];
    86da:	8b 55 0c             	mov    0xc(%ebp),%edx
    86dd:	8b 14 95 24 d6 00 00 	mov    0xd624(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    86e4:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    86e6:	89 d1                	mov    %edx,%ecx
    86e8:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    86ee:	8b 55 0c             	mov    0xc(%ebp),%edx
    86f1:	c1 e2 0a             	shl    $0xa,%edx
    86f4:	01 ca                	add    %ecx,%edx
    86f6:	dd 04 d0             	fldl   (%eax,%edx,8)
    86f9:	de c9                	fmulp  %st,%st(1)
    86fb:	dd 45 e0             	fldl   -0x20(%ebp)
    86fe:	de c1                	faddp  %st,%st(1)
    8700:	dd 5d e0             	fstpl  -0x20(%ebp)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    8703:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8707:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
    870b:	7e 9d                	jle    86aa <SubBandSynthesis+0x13f>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
    {
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    870d:	dd 45 e0             	fldl   -0x20(%ebp)
    8710:	dd 05 a0 90 00 00    	fldl   0x90a0
    8716:	de c9                	fmulp  %st,%st(1)
    8718:	d9 7d c6             	fnstcw -0x3a(%ebp)
    871b:	0f b7 45 c6          	movzwl -0x3a(%ebp),%eax
    871f:	b4 0c                	mov    $0xc,%ah
    8721:	66 89 45 c4          	mov    %ax,-0x3c(%ebp)
    8725:	d9 6d c4             	fldcw  -0x3c(%ebp)
    8728:	db 5d d4             	fistpl -0x2c(%ebp)
    872b:	d9 6d c6             	fldcw  -0x3a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    872e:	81 7d d4 ff 7f 00 00 	cmpl   $0x7fff,-0x2c(%ebp)
    8735:	7e 13                	jle    874a <SubBandSynthesis+0x1df>
    8737:	8b 45 f0             	mov    -0x10(%ebp),%eax
    873a:	01 c0                	add    %eax,%eax
    873c:	03 45 10             	add    0x10(%ebp),%eax
    873f:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    8744:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8748:	eb 2a                	jmp    8774 <SubBandSynthesis+0x209>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    874a:	81 7d d4 00 80 ff ff 	cmpl   $0xffff8000,-0x2c(%ebp)
    8751:	7d 13                	jge    8766 <SubBandSynthesis+0x1fb>
    8753:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8756:	01 c0                	add    %eax,%eax
    8758:	03 45 10             	add    0x10(%ebp),%eax
    875b:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    8760:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    8764:	eb 0e                	jmp    8774 <SubBandSynthesis+0x209>
			else                           samples[j] = foo;
    8766:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8769:	01 c0                	add    %eax,%eax
    876b:	03 45 10             	add    0x10(%ebp),%eax
    876e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    8771:	66 89 10             	mov    %dx,(%eax)
		}
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    8774:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8778:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    877c:	0f 8e 1a ff ff ff    	jle    869c <SubBandSynthesis+0x131>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
    }
	}
    return(clip);
    8782:	8b 45 dc             	mov    -0x24(%ebp),%eax
}
    8785:	c9                   	leave  
    8786:	c3                   	ret    

00008787 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, int fd, unsigned long *psampFrames)
{
    8787:	55                   	push   %ebp
    8788:	89 e5                	mov    %esp,%ebp
    878a:	53                   	push   %ebx
    878b:	83 ec 24             	sub    $0x24,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    878e:	8b 45 10             	mov    0x10(%ebp),%eax
    8791:	8b 40 08             	mov    0x8(%eax),%eax
    8794:	89 45 e8             	mov    %eax,-0x18(%ebp)
	//int sblimit = fr_ps->sblimit;
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    8797:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    879e:	e9 ce 00 00 00       	jmp    8871 <out_fifo+0xea>
    87a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    87aa:	e9 b4 00 00 00       	jmp    8863 <out_fifo+0xdc>
      (*psampFrames)++;
    87af:	8b 45 18             	mov    0x18(%ebp),%eax
    87b2:	8b 00                	mov    (%eax),%eax
    87b4:	8d 50 01             	lea    0x1(%eax),%edx
    87b7:	8b 45 18             	mov    0x18(%ebp),%eax
    87ba:	89 10                	mov    %edx,(%eax)
      for (l=0;l<stereo;l++) {
    87bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    87c3:	e9 8b 00 00 00       	jmp    8853 <out_fifo+0xcc>
          if (!(k%1600) && k) {
    87c8:	8b 0d 64 d6 00 00    	mov    0xd664,%ecx
    87ce:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    87d3:	89 c8                	mov    %ecx,%eax
    87d5:	f7 ea                	imul   %edx
    87d7:	c1 fa 09             	sar    $0x9,%edx
    87da:	89 c8                	mov    %ecx,%eax
    87dc:	c1 f8 1f             	sar    $0x1f,%eax
    87df:	89 d3                	mov    %edx,%ebx
    87e1:	29 c3                	sub    %eax,%ebx
    87e3:	89 d8                	mov    %ebx,%eax
    87e5:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    87eb:	89 ca                	mov    %ecx,%edx
    87ed:	29 c2                	sub    %eax,%edx
    87ef:	89 d0                	mov    %edx,%eax
    87f1:	85 c0                	test   %eax,%eax
    87f3:	75 27                	jne    881c <out_fifo+0x95>
    87f5:	a1 64 d6 00 00       	mov    0xd664,%eax
    87fa:	85 c0                	test   %eax,%eax
    87fc:	74 1e                	je     881c <out_fifo+0x95>
              // write(fd, outsamp, 3200);
              kwrite(outsamp, 3200);
    87fe:	c7 44 24 04 80 0c 00 	movl   $0xc80,0x4(%esp)
    8805:	00 
    8806:	c7 04 24 80 d6 00 00 	movl   $0xd680,(%esp)
    880d:	e8 06 b5 ff ff       	call   3d18 <kwrite>
              //     printf(0, "\n");
              //   }
              //   printf(0, "%x%x%x%x ", (outsamp[t] >> 12) & 15, (outsamp[t] >> 8) & 15, (outsamp[t] >> 4) & 15, (outsamp[t]) & 15);
              // }
              // printf(0, "\n");
              k = 0;
    8812:	c7 05 64 d6 00 00 00 	movl   $0x0,0xd664
    8819:	00 00 00 
          }
          outsamp[k++] = pcm_sample[l][i][j];
    881c:	8b 15 64 d6 00 00    	mov    0xd664,%edx
    8822:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    8825:	89 c8                	mov    %ecx,%eax
    8827:	c1 e0 03             	shl    $0x3,%eax
    882a:	01 c8                	add    %ecx,%eax
    882c:	c1 e0 07             	shl    $0x7,%eax
    882f:	03 45 08             	add    0x8(%ebp),%eax
    8832:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8835:	c1 e1 05             	shl    $0x5,%ecx
    8838:	03 4d f0             	add    -0x10(%ebp),%ecx
    883b:	0f b7 04 48          	movzwl (%eax,%ecx,2),%eax
    883f:	66 89 84 12 80 d6 00 	mov    %ax,0xd680(%edx,%edx,1)
    8846:	00 
    8847:	8d 42 01             	lea    0x1(%edx),%eax
    884a:	a3 64 d6 00 00       	mov    %eax,0xd664
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
      (*psampFrames)++;
      for (l=0;l<stereo;l++) {
    884f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8853:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8856:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8859:	0f 8c 69 ff ff ff    	jl     87c8 <out_fifo+0x41>
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    885f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8863:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8867:	0f 8e 42 ff ff ff    	jle    87af <out_fifo+0x28>
    886d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8871:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8874:	3b 45 0c             	cmp    0xc(%ebp),%eax
    8877:	0f 8c 26 ff ff ff    	jl     87a3 <out_fifo+0x1c>
              k = 0;
          }
          outsamp[k++] = pcm_sample[l][i][j];
      }
  }
}
    887d:	83 c4 24             	add    $0x24,%esp
    8880:	5b                   	pop    %ebx
    8881:	5d                   	pop    %ebp
    8882:	c3                   	ret    

00008883 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    8883:	55                   	push   %ebp
    8884:	89 e5                	mov    %esp,%ebp
    8886:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    8889:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    8890:	00 
    8891:	8b 45 08             	mov    0x8(%ebp),%eax
    8894:	89 04 24             	mov    %eax,(%esp)
    8897:	e8 bb c0 ff ff       	call   4957 <getbits>
    889c:	8b 55 0c             	mov    0xc(%ebp),%edx
    889f:	89 02                	mov    %eax,(%edx)
}
    88a1:	c9                   	leave  
    88a2:	c3                   	ret    

000088a3 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    88a3:	55                   	push   %ebp
    88a4:	89 e5                	mov    %esp,%ebp
    88a6:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    88a9:	8b 45 08             	mov    0x8(%ebp),%eax
    88ac:	8b 40 0c             	mov    0xc(%eax),%eax
    88af:	83 c0 1e             	add    $0x1e,%eax
    88b2:	8b 14 85 a0 a5 00 00 	mov    0xa5a0(,%eax,4),%edx
    88b9:	89 d0                	mov    %edx,%eax
    88bb:	c1 e0 03             	shl    $0x3,%eax
    88be:	01 d0                	add    %edx,%eax
    88c0:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    88c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    88c6:	db 45 ec             	fildl  -0x14(%ebp)
    88c9:	8b 45 08             	mov    0x8(%ebp),%eax
    88cc:	8b 40 10             	mov    0x10(%eax),%eax
    88cf:	dd 04 c5 60 a6 00 00 	fldl   0xa660(,%eax,8)
    88d6:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    88d8:	d9 7d ea             	fnstcw -0x16(%ebp)
    88db:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    88df:	b4 0c                	mov    $0xc,%ah
    88e1:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    88e5:	d9 6d e8             	fldcw  -0x18(%ebp)
    88e8:	db 5d fc             	fistpl -0x4(%ebp)
    88eb:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    88ee:	8b 45 08             	mov    0x8(%ebp),%eax
    88f1:	8b 40 14             	mov    0x14(%eax),%eax
    88f4:	85 c0                	test   %eax,%eax
    88f6:	74 04                	je     88fc <main_data_slots+0x59>
    88f8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    88fc:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    8900:	8b 45 08             	mov    0x8(%ebp),%eax
    8903:	8b 40 08             	mov    0x8(%eax),%eax
    8906:	85 c0                	test   %eax,%eax
    8908:	74 04                	je     890e <main_data_slots+0x6b>
		nSlots -= 2;
    890a:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    890e:	8b 45 10             	mov    0x10(%ebp),%eax
    8911:	83 f8 01             	cmp    $0x1,%eax
    8914:	75 06                	jne    891c <main_data_slots+0x79>
		nSlots -= 17;
    8916:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    891a:	eb 04                	jmp    8920 <main_data_slots+0x7d>
	else
		nSlots -=32;
    891c:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    8920:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    8923:	c9                   	leave  
    8924:	c3                   	ret    
