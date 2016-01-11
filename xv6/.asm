
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
       e:	e8 54 41 00 00       	call   4167 <malloc>
      13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      16:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1d:	e8 45 41 00 00       	call   4167 <malloc>
      22:	8b 55 f4             	mov    -0xc(%ebp),%edx
      25:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      28:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2b:	8b 40 14             	mov    0x14(%eax),%eax
      2e:	8b 55 1c             	mov    0x1c(%ebp),%edx
      31:	89 54 24 04          	mov    %edx,0x4(%esp)
      35:	89 04 24             	mov    %eax,(%esp)
      38:	e8 13 3a 00 00       	call   3a50 <strcpy>
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
      5d:	8b 15 04 eb 00 00    	mov    0xeb04,%edx
      63:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      66:	8d 45 d8             	lea    -0x28(%ebp),%eax
      69:	89 54 24 10          	mov    %edx,0x10(%esp)
      6d:	8b 15 f0 18 01 00    	mov    0x118f0,%edx
      73:	89 54 24 04          	mov    %edx,0x4(%esp)
      77:	8b 15 f4 18 01 00    	mov    0x118f4,%edx
      7d:	89 54 24 08          	mov    %edx,0x8(%esp)
      81:	8b 15 f8 18 01 00    	mov    0x118f8,%edx
      87:	89 54 24 0c          	mov    %edx,0xc(%esp)
      8b:	89 04 24             	mov    %eax,(%esp)
      8e:	e8 ca 0d 00 00       	call   e5d <getPos>
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
      ae:	8b 15 00 eb 00 00    	mov    0xeb00,%edx
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b7:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c7:	a3 00 eb 00 00       	mov    %eax,0xeb00
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
      d7:	a1 00 eb 00 00       	mov    0xeb00,%eax
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
      f9:	e8 30 3f 00 00       	call   402e <free>
		free(temp);
      fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     101:	89 04 24             	mov    %eax,(%esp)
     104:	e8 25 3f 00 00       	call   402e <free>
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
     10f:	c7 05 00 eb 00 00 00 	movl   $0x0,0xeb00
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
     127:	e8 93 39 00 00       	call   3abf <strlen>
     12c:	8b 55 08             	mov    0x8(%ebp),%edx
     12f:	01 d0                	add    %edx,%eax
     131:	89 45 f4             	mov    %eax,-0xc(%ebp)
     134:	eb 04                	jmp    13a <fmtname+0x1f>
     136:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     13a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     13d:	3b 45 08             	cmp    0x8(%ebp),%eax
     140:	72 0a                	jb     14c <fmtname+0x31>
     142:	8b 45 f4             	mov    -0xc(%ebp),%eax
     145:	0f b6 00             	movzbl (%eax),%eax
     148:	3c 2f                	cmp    $0x2f,%al
     14a:	75 ea                	jne    136 <fmtname+0x1b>
		;
	p++;
     14c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     150:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     153:	c9                   	leave  
     154:	c3                   	ret    

00000155 <isListable>:

int isListable(char *name, short type) {
     155:	55                   	push   %ebp
     156:	89 e5                	mov    %esp,%ebp
     158:	83 ec 14             	sub    $0x14,%esp
     15b:	8b 45 0c             	mov    0xc(%ebp),%eax
     15e:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     162:	8b 45 08             	mov    0x8(%ebp),%eax
     165:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     168:	8b 45 fc             	mov    -0x4(%ebp),%eax
     16b:	0f b6 00             	movzbl (%eax),%eax
     16e:	3c 2e                	cmp    $0x2e,%al
     170:	75 07                	jne    179 <isListable+0x24>
     172:	b8 00 00 00 00       	mov    $0x0,%eax
     177:	eb 34                	jmp    1ad <isListable+0x58>
	if (type == T_DIR) return 1;
     179:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     17e:	75 07                	jne    187 <isListable+0x32>
     180:	b8 01 00 00 00       	mov    $0x1,%eax
     185:	eb 26                	jmp    1ad <isListable+0x58>
	while (*p != 0) {
     187:	eb 15                	jmp    19e <isListable+0x49>
		if (*p == '.')
     189:	8b 45 fc             	mov    -0x4(%ebp),%eax
     18c:	0f b6 00             	movzbl (%eax),%eax
     18f:	3c 2e                	cmp    $0x2e,%al
     191:	75 07                	jne    19a <isListable+0x45>
			return 1;
     193:	b8 01 00 00 00       	mov    $0x1,%eax
     198:	eb 13                	jmp    1ad <isListable+0x58>
		p++;
     19a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     19e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     1a1:	0f b6 00             	movzbl (%eax),%eax
     1a4:	84 c0                	test   %al,%al
     1a6:	75 e1                	jne    189 <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     1a8:	b8 00 00 00 00       	mov    $0x0,%eax
}
     1ad:	c9                   	leave  
     1ae:	c3                   	ret    

000001af <list>:

void list(char *path) {
     1af:	55                   	push   %ebp
     1b0:	89 e5                	mov    %esp,%ebp
     1b2:	57                   	push   %edi
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     1bb:	c7 05 04 eb 00 00 00 	movl   $0x0,0xeb04
     1c2:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1cc:	00 
     1cd:	8b 45 08             	mov    0x8(%ebp),%eax
     1d0:	89 04 24             	mov    %eax,(%esp)
     1d3:	e8 fb 3a 00 00       	call   3cd3 <open>
     1d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1db:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1df:	79 20                	jns    201 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     1e1:	8b 45 08             	mov    0x8(%ebp),%eax
     1e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     1e8:	c7 44 24 04 e0 a4 00 	movl   $0xa4e0,0x4(%esp)
     1ef:	00 
     1f0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f7:	e8 7f 3c 00 00       	call   3e7b <printf>
		return;
     1fc:	e9 8f 02 00 00       	jmp    490 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     201:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     207:	89 44 24 04          	mov    %eax,0x4(%esp)
     20b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     20e:	89 04 24             	mov    %eax,(%esp)
     211:	e8 d5 3a 00 00       	call   3ceb <fstat>
     216:	85 c0                	test   %eax,%eax
     218:	79 2b                	jns    245 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     21a:	8b 45 08             	mov    0x8(%ebp),%eax
     21d:	89 44 24 08          	mov    %eax,0x8(%esp)
     221:	c7 44 24 04 f4 a4 00 	movl   $0xa4f4,0x4(%esp)
     228:	00 
     229:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     230:	e8 46 3c 00 00       	call   3e7b <printf>
		close(fd);
     235:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     238:	89 04 24             	mov    %eax,(%esp)
     23b:	e8 7b 3a 00 00       	call   3cbb <close>
		return;
     240:	e9 4b 02 00 00       	jmp    490 <list+0x2e1>
	}

	switch (st.type) {
     245:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     24c:	98                   	cwtl   
     24d:	83 f8 01             	cmp    $0x1,%eax
     250:	74 53                	je     2a5 <list+0xf6>
     252:	83 f8 02             	cmp    $0x2,%eax
     255:	0f 85 2a 02 00 00    	jne    485 <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     25b:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     261:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     267:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     26e:	0f bf d8             	movswl %ax,%ebx
     271:	8b 45 08             	mov    0x8(%ebp),%eax
     274:	89 04 24             	mov    %eax,(%esp)
     277:	e8 9f fe ff ff       	call   11b <fmtname>
     27c:	89 7c 24 14          	mov    %edi,0x14(%esp)
     280:	89 74 24 10          	mov    %esi,0x10(%esp)
     284:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     288:	89 44 24 08          	mov    %eax,0x8(%esp)
     28c:	c7 44 24 04 08 a5 00 	movl   $0xa508,0x4(%esp)
     293:	00 
     294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29b:	e8 db 3b 00 00       	call   3e7b <printf>
		break;
     2a0:	e9 e0 01 00 00       	jmp    485 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     2a5:	8b 45 08             	mov    0x8(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 0f 38 00 00       	call   3abf <strlen>
     2b0:	83 c0 10             	add    $0x10,%eax
     2b3:	3d 00 02 00 00       	cmp    $0x200,%eax
     2b8:	76 19                	jbe    2d3 <list+0x124>
			printf(1, "ls: path too long\n");
     2ba:	c7 44 24 04 15 a5 00 	movl   $0xa515,0x4(%esp)
     2c1:	00 
     2c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2c9:	e8 ad 3b 00 00       	call   3e7b <printf>
			break;
     2ce:	e9 b2 01 00 00       	jmp    485 <list+0x2d6>
		}
		strcpy(buf, path);
     2d3:	8b 45 08             	mov    0x8(%ebp),%eax
     2d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     2da:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2e0:	89 04 24             	mov    %eax,(%esp)
     2e3:	e8 68 37 00 00       	call   3a50 <strcpy>
		p = buf + strlen(buf);
     2e8:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 c9 37 00 00       	call   3abf <strlen>
     2f6:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     2fc:	01 d0                	add    %edx,%eax
     2fe:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     301:	8b 45 e0             	mov    -0x20(%ebp),%eax
     304:	8d 50 01             	lea    0x1(%eax),%edx
     307:	89 55 e0             	mov    %edx,-0x20(%ebp)
     30a:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     30d:	e9 4c 01 00 00       	jmp    45e <list+0x2af>
			if (de.inum == 0)
     312:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     319:	66 85 c0             	test   %ax,%ax
     31c:	75 05                	jne    323 <list+0x174>
				continue;
     31e:	e9 3b 01 00 00       	jmp    45e <list+0x2af>
			memmove(p, de.name, DIRSIZ);
     323:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     32a:	00 
     32b:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     331:	83 c0 02             	add    $0x2,%eax
     334:	89 44 24 04          	mov    %eax,0x4(%esp)
     338:	8b 45 e0             	mov    -0x20(%ebp),%eax
     33b:	89 04 24             	mov    %eax,(%esp)
     33e:	e8 0b 39 00 00       	call   3c4e <memmove>
			p[DIRSIZ] = 0;
     343:	8b 45 e0             	mov    -0x20(%ebp),%eax
     346:	83 c0 0e             	add    $0xe,%eax
     349:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     34c:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     352:	89 44 24 04          	mov    %eax,0x4(%esp)
     356:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 4f 38 00 00       	call   3bb3 <stat>
     364:	85 c0                	test   %eax,%eax
     366:	79 23                	jns    38b <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     368:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     36e:	89 44 24 08          	mov    %eax,0x8(%esp)
     372:	c7 44 24 04 f4 a4 00 	movl   $0xa4f4,0x4(%esp)
     379:	00 
     37a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     381:	e8 f5 3a 00 00       	call   3e7b <printf>
				continue;
     386:	e9 d3 00 00 00       	jmp    45e <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     38b:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     392:	0f bf d8             	movswl %ax,%ebx
     395:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     39b:	89 04 24             	mov    %eax,(%esp)
     39e:	e8 78 fd ff ff       	call   11b <fmtname>
     3a3:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     3a7:	89 04 24             	mov    %eax,(%esp)
     3aa:	e8 a6 fd ff ff       	call   155 <isListable>
     3af:	85 c0                	test   %eax,%eax
     3b1:	0f 84 a7 00 00 00    	je     45e <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     3b7:	8b 15 04 eb 00 00    	mov    0xeb04,%edx
     3bd:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3c0:	89 54 24 10          	mov    %edx,0x10(%esp)
     3c4:	8b 15 f0 18 01 00    	mov    0x118f0,%edx
     3ca:	89 54 24 04          	mov    %edx,0x4(%esp)
     3ce:	8b 15 f4 18 01 00    	mov    0x118f4,%edx
     3d4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3d8:	8b 15 f8 18 01 00    	mov    0x118f8,%edx
     3de:	89 54 24 0c          	mov    %edx,0xc(%esp)
     3e2:	89 04 24             	mov    %eax,(%esp)
     3e5:	e8 73 0a 00 00       	call   e5d <getPos>
     3ea:	83 ec 04             	sub    $0x4,%esp
     3ed:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     3f3:	89 04 24             	mov    %eax,(%esp)
     3f6:	e8 20 fd ff ff       	call   11b <fmtname>
     3fb:	8b 55 d0             	mov    -0x30(%ebp),%edx
     3fe:	89 54 24 18          	mov    %edx,0x18(%esp)
     402:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     405:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     409:	8b 55 d8             	mov    -0x28(%ebp),%edx
     40c:	89 54 24 20          	mov    %edx,0x20(%esp)
     410:	8b 55 dc             	mov    -0x24(%ebp),%edx
     413:	89 54 24 24          	mov    %edx,0x24(%esp)
     417:	89 44 24 14          	mov    %eax,0x14(%esp)
     41b:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     421:	89 04 24             	mov    %eax,(%esp)
     424:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     42a:	89 44 24 04          	mov    %eax,0x4(%esp)
     42e:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     434:	89 44 24 08          	mov    %eax,0x8(%esp)
     438:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     43e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     442:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     448:	89 44 24 10          	mov    %eax,0x10(%esp)
     44c:	e8 af fb ff ff       	call   0 <addFileItem>
				itemCounter++;
     451:	a1 04 eb 00 00       	mov    0xeb04,%eax
     456:	83 c0 01             	add    $0x1,%eax
     459:	a3 04 eb 00 00       	mov    %eax,0xeb04
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     45e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     465:	00 
     466:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     46c:	89 44 24 04          	mov    %eax,0x4(%esp)
     470:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     473:	89 04 24             	mov    %eax,(%esp)
     476:	e8 30 38 00 00       	call   3cab <read>
     47b:	83 f8 10             	cmp    $0x10,%eax
     47e:	0f 84 8e fe ff ff    	je     312 <list+0x163>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     484:	90                   	nop
	}
	close(fd);
     485:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     488:	89 04 24             	mov    %eax,(%esp)
     48b:	e8 2b 38 00 00       	call   3cbb <close>
}
     490:	8d 65 f4             	lea    -0xc(%ebp),%esp
     493:	5b                   	pop    %ebx
     494:	5e                   	pop    %esi
     495:	5f                   	pop    %edi
     496:	5d                   	pop    %ebp
     497:	c3                   	ret    

00000498 <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     498:	55                   	push   %ebp
     499:	89 e5                	mov    %esp,%ebp
     49b:	53                   	push   %ebx
     49c:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0)
     49f:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     4a3:	75 08                	jne    4ad <drawItem+0x15>
		nameColor = 0x0;
     4a5:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     4ab:	eb 49                	jmp    4f6 <drawItem+0x5e>
	else
	{
		nameColor = 0xFFFF;
     4ad:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     4b3:	8b 45 38             	mov    0x38(%ebp),%eax
     4b6:	89 c3                	mov    %eax,%ebx
     4b8:	8b 45 34             	mov    0x34(%ebp),%eax
     4bb:	89 c1                	mov    %eax,%ecx
     4bd:	8b 45 30             	mov    0x30(%ebp),%eax
     4c0:	89 c2                	mov    %eax,%edx
     4c2:	8b 45 2c             	mov    0x2c(%ebp),%eax
     4c5:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     4cc:	00 
     4cd:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     4d1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     4d5:	89 54 24 10          	mov    %edx,0x10(%esp)
     4d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     4dd:	8b 45 08             	mov    0x8(%ebp),%eax
     4e0:	89 04 24             	mov    %eax,(%esp)
     4e3:	8b 45 0c             	mov    0xc(%ebp),%eax
     4e6:	89 44 24 04          	mov    %eax,0x4(%esp)
     4ea:	8b 45 10             	mov    0x10(%ebp),%eax
     4ed:	89 44 24 08          	mov    %eax,0x8(%esp)
     4f1:	e8 35 1a 00 00       	call   1f2b <fill_rect>
	}
	if (style == ICON_STYLE) {
     4f6:	a1 44 e3 00 00       	mov    0xe344,%eax
     4fb:	83 f8 01             	cmp    $0x1,%eax
     4fe:	0f 85 13 01 00 00    	jne    617 <drawItem+0x17f>
		switch (st.type) {
     504:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     508:	98                   	cwtl   
     509:	83 f8 01             	cmp    $0x1,%eax
     50c:	74 53                	je     561 <drawItem+0xc9>
     50e:	83 f8 02             	cmp    $0x2,%eax
     511:	0f 85 93 00 00 00    	jne    5aa <drawItem+0x112>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     517:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     51a:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     51d:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     520:	83 c0 19             	add    $0x19,%eax
     523:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     527:	89 44 24 18          	mov    %eax,0x18(%esp)
     52b:	a1 88 e3 00 00       	mov    0xe388,%eax
     530:	89 44 24 0c          	mov    %eax,0xc(%esp)
     534:	a1 8c e3 00 00       	mov    0xe38c,%eax
     539:	89 44 24 10          	mov    %eax,0x10(%esp)
     53d:	a1 90 e3 00 00       	mov    0xe390,%eax
     542:	89 44 24 14          	mov    %eax,0x14(%esp)
     546:	8b 45 08             	mov    0x8(%ebp),%eax
     549:	89 04 24             	mov    %eax,(%esp)
     54c:	8b 45 0c             	mov    0xc(%ebp),%eax
     54f:	89 44 24 04          	mov    %eax,0x4(%esp)
     553:	8b 45 10             	mov    0x10(%ebp),%eax
     556:	89 44 24 08          	mov    %eax,0x8(%esp)
     55a:	e8 6b 20 00 00       	call   25ca <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     55f:	eb 49                	jmp    5aa <drawItem+0x112>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     561:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     564:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     567:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     56a:	83 c0 19             	add    $0x19,%eax
     56d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     571:	89 44 24 18          	mov    %eax,0x18(%esp)
     575:	a1 f0 e3 00 00       	mov    0xe3f0,%eax
     57a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     57e:	a1 f4 e3 00 00       	mov    0xe3f4,%eax
     583:	89 44 24 10          	mov    %eax,0x10(%esp)
     587:	a1 f8 e3 00 00       	mov    0xe3f8,%eax
     58c:	89 44 24 14          	mov    %eax,0x14(%esp)
     590:	8b 45 08             	mov    0x8(%ebp),%eax
     593:	89 04 24             	mov    %eax,(%esp)
     596:	8b 45 0c             	mov    0xc(%ebp),%eax
     599:	89 44 24 04          	mov    %eax,0x4(%esp)
     59d:	8b 45 10             	mov    0x10(%ebp),%eax
     5a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a4:	e8 21 20 00 00       	call   25ca <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5a9:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5aa:	8b 45 14             	mov    0x14(%ebp),%eax
     5ad:	89 04 24             	mov    %eax,(%esp)
     5b0:	e8 0a 35 00 00       	call   3abf <strlen>
     5b5:	89 c2                	mov    %eax,%edx
     5b7:	b8 00 00 00 00       	mov    $0x0,%eax
     5bc:	29 d0                	sub    %edx,%eax
     5be:	c1 e0 02             	shl    $0x2,%eax
     5c1:	83 c0 30             	add    $0x30,%eax
     5c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     5c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     5cb:	79 07                	jns    5d4 <drawItem+0x13c>
			indent = 0;
     5cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     5d4:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     5d7:	8d 48 46             	lea    0x46(%eax),%ecx
     5da:	8b 55 2c             	mov    0x2c(%ebp),%edx
     5dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5e0:	01 c2                	add    %eax,%edx
     5e2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     5e6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     5ea:	89 54 24 14          	mov    %edx,0x14(%esp)
     5ee:	89 44 24 10          	mov    %eax,0x10(%esp)
     5f2:	8b 45 14             	mov    0x14(%ebp),%eax
     5f5:	89 44 24 0c          	mov    %eax,0xc(%esp)
     5f9:	8b 45 08             	mov    0x8(%ebp),%eax
     5fc:	89 04 24             	mov    %eax,(%esp)
     5ff:	8b 45 0c             	mov    0xc(%ebp),%eax
     602:	89 44 24 04          	mov    %eax,0x4(%esp)
     606:	8b 45 10             	mov    0x10(%ebp),%eax
     609:	89 44 24 08          	mov    %eax,0x8(%esp)
     60d:	e8 f8 1e 00 00       	call   250a <puts_str>
     612:	e9 33 01 00 00       	jmp    74a <drawItem+0x2b2>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     617:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     61b:	98                   	cwtl   
     61c:	83 f8 01             	cmp    $0x1,%eax
     61f:	0f 84 a0 00 00 00    	je     6c5 <drawItem+0x22d>
     625:	83 f8 02             	cmp    $0x2,%eax
     628:	0f 85 e0 00 00 00    	jne    70e <drawItem+0x276>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     62e:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
     631:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     634:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
     637:	83 c0 08             	add    $0x8,%eax
     63a:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     63e:	89 44 24 18          	mov    %eax,0x18(%esp)
     642:	a1 bc e3 00 00       	mov    0xe3bc,%eax
     647:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64b:	a1 c0 e3 00 00       	mov    0xe3c0,%eax
     650:	89 44 24 10          	mov    %eax,0x10(%esp)
     654:	a1 c4 e3 00 00       	mov    0xe3c4,%eax
     659:	89 44 24 14          	mov    %eax,0x14(%esp)
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
     660:	89 04 24             	mov    %eax,(%esp)
     663:	8b 45 0c             	mov    0xc(%ebp),%eax
     666:	89 44 24 04          	mov    %eax,0x4(%esp)
     66a:	8b 45 10             	mov    0x10(%ebp),%eax
     66d:	89 44 24 08          	mov    %eax,0x8(%esp)
     671:	e8 54 1f 00 00       	call   25ca <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     676:	8b 45 28             	mov    0x28(%ebp),%eax
     679:	89 04 24             	mov    %eax,(%esp)
     67c:	e8 cf 00 00 00       	call   750 <sizeFormat>
     681:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     684:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     687:	8d 48 03             	lea    0x3(%eax),%ecx
     68a:	8b 45 2c             	mov    0x2c(%ebp),%eax
     68d:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     693:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     697:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     69b:	89 54 24 14          	mov    %edx,0x14(%esp)
     69f:	89 44 24 10          	mov    %eax,0x10(%esp)
     6a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
     6a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6aa:	8b 45 08             	mov    0x8(%ebp),%eax
     6ad:	89 04 24             	mov    %eax,(%esp)
     6b0:	8b 45 0c             	mov    0xc(%ebp),%eax
     6b3:	89 44 24 04          	mov    %eax,0x4(%esp)
     6b7:	8b 45 10             	mov    0x10(%ebp),%eax
     6ba:	89 44 24 08          	mov    %eax,0x8(%esp)
     6be:	e8 47 1e 00 00       	call   250a <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     6c3:	eb 49                	jmp    70e <drawItem+0x276>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6c5:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6c8:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     6cb:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     6ce:	83 c0 08             	add    $0x8,%eax
     6d1:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     6d5:	89 44 24 18          	mov    %eax,0x18(%esp)
     6d9:	a1 24 e4 00 00       	mov    0xe424,%eax
     6de:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e2:	a1 28 e4 00 00       	mov    0xe428,%eax
     6e7:	89 44 24 10          	mov    %eax,0x10(%esp)
     6eb:	a1 2c e4 00 00       	mov    0xe42c,%eax
     6f0:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f4:	8b 45 08             	mov    0x8(%ebp),%eax
     6f7:	89 04 24             	mov    %eax,(%esp)
     6fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
     701:	8b 45 10             	mov    0x10(%ebp),%eax
     704:	89 44 24 08          	mov    %eax,0x8(%esp)
     708:	e8 bd 1e 00 00       	call   25ca <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     70d:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     70e:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     711:	8d 48 03             	lea    0x3(%eax),%ecx
     714:	8b 45 2c             	mov    0x2c(%ebp),%eax
     717:	8d 50 28             	lea    0x28(%eax),%edx
     71a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     71e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     722:	89 54 24 14          	mov    %edx,0x14(%esp)
     726:	89 44 24 10          	mov    %eax,0x10(%esp)
     72a:	8b 45 14             	mov    0x14(%ebp),%eax
     72d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     731:	8b 45 08             	mov    0x8(%ebp),%eax
     734:	89 04 24             	mov    %eax,(%esp)
     737:	8b 45 0c             	mov    0xc(%ebp),%eax
     73a:	89 44 24 04          	mov    %eax,0x4(%esp)
     73e:	8b 45 10             	mov    0x10(%ebp),%eax
     741:	89 44 24 08          	mov    %eax,0x8(%esp)
     745:	e8 c0 1d 00 00       	call   250a <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     74a:	83 c4 34             	add    $0x34,%esp
     74d:	5b                   	pop    %ebx
     74e:	5d                   	pop    %ebp
     74f:	c3                   	ret    

00000750 <sizeFormat>:

char *sizeFormat(uint size){
     750:	55                   	push   %ebp
     751:	89 e5                	mov    %esp,%ebp
     753:	53                   	push   %ebx
     754:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     757:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     75e:	e8 04 3a 00 00       	call   4167 <malloc>
     763:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     766:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400)
     76d:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     774:	0f 86 8b 00 00 00    	jbe    805 <sizeFormat+0xb5>
	{
		size = size / (0x400);
     77a:	8b 45 08             	mov    0x8(%ebp),%eax
     77d:	c1 e8 0a             	shr    $0xa,%eax
     780:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     783:	8b 45 f4             	mov    -0xc(%ebp),%eax
     786:	8d 50 01             	lea    0x1(%eax),%edx
     789:	89 55 f4             	mov    %edx,-0xc(%ebp)
     78c:	89 c2                	mov    %eax,%edx
     78e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     791:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     794:	8b 4d 08             	mov    0x8(%ebp),%ecx
     797:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     79c:	89 c8                	mov    %ecx,%eax
     79e:	f7 e2                	mul    %edx
     7a0:	c1 ea 03             	shr    $0x3,%edx
     7a3:	89 d0                	mov    %edx,%eax
     7a5:	c1 e0 02             	shl    $0x2,%eax
     7a8:	01 d0                	add    %edx,%eax
     7aa:	01 c0                	add    %eax,%eax
     7ac:	29 c1                	sub    %eax,%ecx
     7ae:	89 ca                	mov    %ecx,%edx
     7b0:	89 d0                	mov    %edx,%eax
     7b2:	83 c0 30             	add    $0x30,%eax
     7b5:	88 03                	mov    %al,(%ebx)
			size /= 10;
     7b7:	8b 45 08             	mov    0x8(%ebp),%eax
     7ba:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     7bf:	f7 e2                	mul    %edx
     7c1:	89 d0                	mov    %edx,%eax
     7c3:	c1 e8 03             	shr    $0x3,%eax
     7c6:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     7c9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     7cd:	75 b4                	jne    783 <sizeFormat+0x33>
		result[n++] = 'K';
     7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7d2:	8d 50 01             	lea    0x1(%eax),%edx
     7d5:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7d8:	89 c2                	mov    %eax,%edx
     7da:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7dd:	01 d0                	add    %edx,%eax
     7df:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e5:	8d 50 01             	lea    0x1(%eax),%edx
     7e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7eb:	89 c2                	mov    %eax,%edx
     7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7f0:	01 d0                	add    %edx,%eax
     7f2:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     7f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
     7f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7fb:	01 d0                	add    %edx,%eax
     7fd:	c6 00 00             	movb   $0x0,(%eax)
     800:	e9 a3 00 00 00       	jmp    8a8 <sizeFormat+0x158>
	}
	else
	{
		do{
			result[n++] = (size % 10) + '0';
     805:	8b 45 f4             	mov    -0xc(%ebp),%eax
     808:	8d 50 01             	lea    0x1(%eax),%edx
     80b:	89 55 f4             	mov    %edx,-0xc(%ebp)
     80e:	89 c2                	mov    %eax,%edx
     810:	8b 45 f0             	mov    -0x10(%ebp),%eax
     813:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     816:	8b 4d 08             	mov    0x8(%ebp),%ecx
     819:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     81e:	89 c8                	mov    %ecx,%eax
     820:	f7 e2                	mul    %edx
     822:	c1 ea 03             	shr    $0x3,%edx
     825:	89 d0                	mov    %edx,%eax
     827:	c1 e0 02             	shl    $0x2,%eax
     82a:	01 d0                	add    %edx,%eax
     82c:	01 c0                	add    %eax,%eax
     82e:	29 c1                	sub    %eax,%ecx
     830:	89 ca                	mov    %ecx,%edx
     832:	89 d0                	mov    %edx,%eax
     834:	83 c0 30             	add    $0x30,%eax
     837:	88 03                	mov    %al,(%ebx)
			size /= 10;
     839:	8b 45 08             	mov    0x8(%ebp),%eax
     83c:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     841:	f7 e2                	mul    %edx
     843:	89 d0                	mov    %edx,%eax
     845:	c1 e8 03             	shr    $0x3,%eax
     848:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     84b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     84f:	75 b4                	jne    805 <sizeFormat+0xb5>
		result[n++] = 'b';
     851:	8b 45 f4             	mov    -0xc(%ebp),%eax
     854:	8d 50 01             	lea    0x1(%eax),%edx
     857:	89 55 f4             	mov    %edx,-0xc(%ebp)
     85a:	89 c2                	mov    %eax,%edx
     85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     85f:	01 d0                	add    %edx,%eax
     861:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     864:	8b 45 f4             	mov    -0xc(%ebp),%eax
     867:	8d 50 01             	lea    0x1(%eax),%edx
     86a:	89 55 f4             	mov    %edx,-0xc(%ebp)
     86d:	89 c2                	mov    %eax,%edx
     86f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     872:	01 d0                	add    %edx,%eax
     874:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     877:	8b 45 f4             	mov    -0xc(%ebp),%eax
     87a:	8d 50 01             	lea    0x1(%eax),%edx
     87d:	89 55 f4             	mov    %edx,-0xc(%ebp)
     880:	89 c2                	mov    %eax,%edx
     882:	8b 45 f0             	mov    -0x10(%ebp),%eax
     885:	01 d0                	add    %edx,%eax
     887:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     88d:	8d 50 01             	lea    0x1(%eax),%edx
     890:	89 55 f4             	mov    %edx,-0xc(%ebp)
     893:	89 c2                	mov    %eax,%edx
     895:	8b 45 f0             	mov    -0x10(%ebp),%eax
     898:	01 d0                	add    %edx,%eax
     89a:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     89d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     8a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     8a3:	01 d0                	add    %edx,%eax
     8a5:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     8ab:	83 c4 24             	add    $0x24,%esp
     8ae:	5b                   	pop    %ebx
     8af:	5d                   	pop    %ebp
     8b0:	c3                   	ret    

000008b1 <drawFinderWnd>:
				- (BUTTON_HEIGHT + 3) }, { "up.bmp", 2 * BUTTON_WIDTH + 100,
		TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - (BUTTON_HEIGHT + 3) }, { "trash.bmp",
		3 * BUTTON_WIDTH + 110, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) } };

void drawFinderWnd(Context context) {
     8b1:	55                   	push   %ebp
     8b2:	89 e5                	mov    %esp,%ebp
     8b4:	83 ec 28             	sub    $0x28,%esp
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
     8b7:	8b 45 10             	mov    0x10(%ebp),%eax
     8ba:	89 c2                	mov    %eax,%edx
     8bc:	8b 45 0c             	mov    0xc(%ebp),%eax
     8bf:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     8c6:	00 
     8c7:	89 54 24 18          	mov    %edx,0x18(%esp)
     8cb:	89 44 24 14          	mov    %eax,0x14(%esp)
     8cf:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     8d6:	00 
     8d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8de:	00 
     8df:	8b 45 08             	mov    0x8(%ebp),%eax
     8e2:	89 04 24             	mov    %eax,(%esp)
     8e5:	8b 45 0c             	mov    0xc(%ebp),%eax
     8e8:	89 44 24 04          	mov    %eax,0x4(%esp)
     8ec:	8b 45 10             	mov    0x10(%ebp),%eax
     8ef:	89 44 24 08          	mov    %eax,0x8(%esp)
     8f3:	e8 33 16 00 00       	call   1f2b <fill_rect>

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     8f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     8fb:	83 e8 01             	sub    $0x1,%eax
     8fe:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     905:	00 
     906:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     90d:	00 
     90e:	89 44 24 14          	mov    %eax,0x14(%esp)
     912:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     919:	00 
     91a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     921:	00 
     922:	8b 45 08             	mov    0x8(%ebp),%eax
     925:	89 04 24             	mov    %eax,(%esp)
     928:	8b 45 0c             	mov    0xc(%ebp),%eax
     92b:	89 44 24 04          	mov    %eax,0x4(%esp)
     92f:	8b 45 10             	mov    0x10(%ebp),%eax
     932:	89 44 24 08          	mov    %eax,0x8(%esp)
     936:	e8 65 1d 00 00       	call   26a0 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     93b:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     93e:	8d 48 ff             	lea    -0x1(%eax),%ecx
     941:	8b 45 0c             	mov    0xc(%ebp),%eax
     944:	8d 50 ff             	lea    -0x1(%eax),%edx
     947:	8b 45 0c             	mov    0xc(%ebp),%eax
     94a:	83 e8 01             	sub    $0x1,%eax
     94d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     954:	00 
     955:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     959:	89 54 24 14          	mov    %edx,0x14(%esp)
     95d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     964:	00 
     965:	89 44 24 0c          	mov    %eax,0xc(%esp)
     969:	8b 45 08             	mov    0x8(%ebp),%eax
     96c:	89 04 24             	mov    %eax,(%esp)
     96f:	8b 45 0c             	mov    0xc(%ebp),%eax
     972:	89 44 24 04          	mov    %eax,0x4(%esp)
     976:	8b 45 10             	mov    0x10(%ebp),%eax
     979:	89 44 24 08          	mov    %eax,0x8(%esp)
     97d:	e8 1e 1d 00 00       	call   26a0 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     982:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     985:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     988:	8b 45 0c             	mov    0xc(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     98b:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     98e:	8b 45 10             	mov    0x10(%ebp),%eax
	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);

	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     991:	83 e8 01             	sub    $0x1,%eax
     994:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     99b:	00 
     99c:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     9a0:	89 54 24 14          	mov    %edx,0x14(%esp)
     9a4:	89 44 24 10          	mov    %eax,0x10(%esp)
     9a8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9af:	00 
     9b0:	8b 45 08             	mov    0x8(%ebp),%eax
     9b3:	89 04 24             	mov    %eax,(%esp)
     9b6:	8b 45 0c             	mov    0xc(%ebp),%eax
     9b9:	89 44 24 04          	mov    %eax,0x4(%esp)
     9bd:	8b 45 10             	mov    0x10(%ebp),%eax
     9c0:	89 44 24 08          	mov    %eax,0x8(%esp)
     9c4:	e8 d7 1c 00 00       	call   26a0 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     9c9:	8b 45 10             	mov    0x10(%ebp),%eax
     9cc:	83 e8 01             	sub    $0x1,%eax
     9cf:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     9d6:	00 
     9d7:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     9de:	00 
     9df:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     9e6:	00 
     9e7:	89 44 24 10          	mov    %eax,0x10(%esp)
     9eb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9f2:	00 
     9f3:	8b 45 08             	mov    0x8(%ebp),%eax
     9f6:	89 04 24             	mov    %eax,(%esp)
     9f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     9fc:	89 44 24 04          	mov    %eax,0x4(%esp)
     a00:	8b 45 10             	mov    0x10(%ebp),%eax
     a03:	89 44 24 08          	mov    %eax,0x8(%esp)
     a07:	e8 94 1c 00 00       	call   26a0 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a0f:	83 e8 02             	sub    $0x2,%eax
     a12:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     a19:	00 
     a1a:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     a21:	00 
     a22:	89 44 24 14          	mov    %eax,0x14(%esp)
     a26:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     a2d:	00 
     a2e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     a35:	00 
     a36:	8b 45 08             	mov    0x8(%ebp),%eax
     a39:	89 04 24             	mov    %eax,(%esp)
     a3c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a3f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a43:	8b 45 10             	mov    0x10(%ebp),%eax
     a46:	89 44 24 08          	mov    %eax,0x8(%esp)
     a4a:	e8 dc 14 00 00       	call   1f2b <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     a4f:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     a56:	00 
     a57:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     a5e:	00 
     a5f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a66:	00 
     a67:	c7 44 24 0c 28 a5 00 	movl   $0xa528,0xc(%esp)
     a6e:	00 
     a6f:	8b 45 08             	mov    0x8(%ebp),%eax
     a72:	89 04 24             	mov    %eax,(%esp)
     a75:	8b 45 0c             	mov    0xc(%ebp),%eax
     a78:	89 44 24 04          	mov    %eax,0x4(%esp)
     a7c:	8b 45 10             	mov    0x10(%ebp),%eax
     a7f:	89 44 24 08          	mov    %eax,0x8(%esp)
     a83:	e8 82 1a 00 00       	call   250a <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     a88:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
     a8f:	00 
     a90:	c7 44 24 0c 40 e4 00 	movl   $0xe440,0xc(%esp)
     a97:	00 
     a98:	8b 45 08             	mov    0x8(%ebp),%eax
     a9b:	89 04 24             	mov    %eax,(%esp)
     a9e:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa5:	8b 45 10             	mov    0x10(%ebp),%eax
     aa8:	89 44 24 08          	mov    %eax,0x8(%esp)
     aac:	e8 ca 1f 00 00       	call   2a7b <draw_iconlist>


}
     ab1:	c9                   	leave  
     ab2:	c3                   	ret    

00000ab3 <drawFinderContent>:

void drawFinderContent(Context context) {
     ab3:	55                   	push   %ebp
     ab4:	89 e5                	mov    %esp,%ebp
     ab6:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
     ab9:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
     ac0:	a1 44 e3 00 00       	mov    0xe344,%eax
     ac5:	83 f8 02             	cmp    $0x2,%eax
     ac8:	75 04                	jne    ace <drawFinderContent+0x1b>
     aca:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
     ace:	8b 45 10             	mov    0x10(%ebp),%eax
     ad1:	83 e8 48             	sub    $0x48,%eax
	struct fileItem *p;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
     ad4:	89 c1                	mov    %eax,%ecx
     ad6:	8b 45 0c             	mov    0xc(%ebp),%eax
     ad9:	83 e8 02             	sub    $0x2,%eax
     adc:	89 c2                	mov    %eax,%edx
     ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ae1:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     ae8:	00 
     ae9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     aed:	89 54 24 14          	mov    %edx,0x14(%esp)
     af1:	89 44 24 10          	mov    %eax,0x10(%esp)
     af5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     afc:	00 
     afd:	8b 45 08             	mov    0x8(%ebp),%eax
     b00:	89 04 24             	mov    %eax,(%esp)
     b03:	8b 45 0c             	mov    0xc(%ebp),%eax
     b06:	89 44 24 04          	mov    %eax,0x4(%esp)
     b0a:	8b 45 10             	mov    0x10(%ebp),%eax
     b0d:	89 44 24 08          	mov    %eax,0x8(%esp)
     b11:	e8 15 14 00 00       	call   1f2b <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b16:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     b19:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b1c:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     b1f:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     b22:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
     b25:	83 e8 01             	sub    $0x1,%eax
     b28:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     b2f:	00 
     b30:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b34:	89 54 24 14          	mov    %edx,0x14(%esp)
     b38:	89 44 24 10          	mov    %eax,0x10(%esp)
     b3c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b43:	00 
     b44:	8b 45 08             	mov    0x8(%ebp),%eax
     b47:	89 04 24             	mov    %eax,(%esp)
     b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b4d:	89 44 24 04          	mov    %eax,0x4(%esp)
     b51:	8b 45 10             	mov    0x10(%ebp),%eax
     b54:	89 44 24 08          	mov    %eax,0x8(%esp)
     b58:	e8 43 1b 00 00       	call   26a0 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     b5d:	a1 00 eb 00 00       	mov    0xeb00,%eax
     b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     b65:	c7 05 04 eb 00 00 00 	movl   $0x0,0xeb04
     b6c:	00 00 00 
	while (p != 0) {
     b6f:	eb 7a                	jmp    beb <drawFinderContent+0x138>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
     b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b74:	8b 40 28             	mov    0x28(%eax),%eax
     b77:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b7a:	8b 52 14             	mov    0x14(%edx),%edx
     b7d:	89 44 24 34          	mov    %eax,0x34(%esp)
     b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b84:	8b 48 18             	mov    0x18(%eax),%ecx
     b87:	89 4c 24 24          	mov    %ecx,0x24(%esp)
     b8b:	8b 48 1c             	mov    0x1c(%eax),%ecx
     b8e:	89 4c 24 28          	mov    %ecx,0x28(%esp)
     b92:	8b 48 20             	mov    0x20(%eax),%ecx
     b95:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
     b99:	8b 40 24             	mov    0x24(%eax),%eax
     b9c:	89 44 24 30          	mov    %eax,0x30(%esp)
     ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba3:	8b 08                	mov    (%eax),%ecx
     ba5:	89 4c 24 10          	mov    %ecx,0x10(%esp)
     ba9:	8b 48 04             	mov    0x4(%eax),%ecx
     bac:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     bb0:	8b 48 08             	mov    0x8(%eax),%ecx
     bb3:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     bb7:	8b 48 0c             	mov    0xc(%eax),%ecx
     bba:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
     bbe:	8b 40 10             	mov    0x10(%eax),%eax
     bc1:	89 44 24 20          	mov    %eax,0x20(%esp)
     bc5:	89 54 24 0c          	mov    %edx,0xc(%esp)
     bc9:	8b 45 08             	mov    0x8(%ebp),%eax
     bcc:	89 04 24             	mov    %eax,(%esp)
     bcf:	8b 45 0c             	mov    0xc(%ebp),%eax
     bd2:	89 44 24 04          	mov    %eax,0x4(%esp)
     bd6:	8b 45 10             	mov    0x10(%ebp),%eax
     bd9:	89 44 24 08          	mov    %eax,0x8(%esp)
     bdd:	e8 b6 f8 ff ff       	call   498 <drawItem>
		p = p->next;
     be2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     be5:	8b 40 2c             	mov    0x2c(%eax),%eax
     be8:	89 45 f4             	mov    %eax,-0xc(%ebp)

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
	itemCounter = 0;
	while (p != 0) {
     beb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bef:	75 80                	jne    b71 <drawFinderContent+0xbe>
		//printf(0, "draw item\n");
		drawItem(context, p->name, p->st, p->pos, p->chosen);
		p = p->next;
	}

	if (style == LIST_STYLE)
     bf1:	a1 44 e3 00 00       	mov    0xe344,%eax
     bf6:	83 f8 02             	cmp    $0x2,%eax
     bf9:	0f 85 39 01 00 00    	jne    d38 <drawFinderContent+0x285>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
     bff:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c06:	00 
     c07:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c0e:	00 
     c0f:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
     c16:	00 
     c17:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c1e:	00 
     c1f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     c26:	00 
     c27:	8b 45 08             	mov    0x8(%ebp),%eax
     c2a:	89 04 24             	mov    %eax,(%esp)
     c2d:	8b 45 0c             	mov    0xc(%ebp),%eax
     c30:	89 44 24 04          	mov    %eax,0x4(%esp)
     c34:	8b 45 10             	mov    0x10(%ebp),%eax
     c37:	89 44 24 08          	mov    %eax,0x8(%esp)
     c3b:	e8 eb 12 00 00       	call   1f2b <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     c40:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c47:	00 
     c48:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c4f:	00 
     c50:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
     c57:	00 
     c58:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     c5f:	00 
     c60:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
     c67:	00 
     c68:	8b 45 08             	mov    0x8(%ebp),%eax
     c6b:	89 04 24             	mov    %eax,(%esp)
     c6e:	8b 45 0c             	mov    0xc(%ebp),%eax
     c71:	89 44 24 04          	mov    %eax,0x4(%esp)
     c75:	8b 45 10             	mov    0x10(%ebp),%eax
     c78:	89 44 24 08          	mov    %eax,0x8(%esp)
     c7c:	e8 aa 12 00 00       	call   1f2b <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
     c81:	8b 45 0c             	mov    0xc(%ebp),%eax
     c84:	2d c9 00 00 00       	sub    $0xc9,%eax
     c89:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
     c90:	00 
     c91:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
     c98:	00 
     c99:	89 44 24 14          	mov    %eax,0x14(%esp)
     c9d:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
     ca4:	00 
     ca5:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
     cac:	00 
     cad:	8b 45 08             	mov    0x8(%ebp),%eax
     cb0:	89 04 24             	mov    %eax,(%esp)
     cb3:	8b 45 0c             	mov    0xc(%ebp),%eax
     cb6:	89 44 24 04          	mov    %eax,0x4(%esp)
     cba:	8b 45 10             	mov    0x10(%ebp),%eax
     cbd:	89 44 24 08          	mov    %eax,0x8(%esp)
     cc1:	e8 65 12 00 00       	call   1f2b <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cc6:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     ccd:	00 
     cce:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     cd5:	00 
     cd6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cdd:	00 
     cde:	c7 44 24 0c 2f a5 00 	movl   $0xa52f,0xc(%esp)
     ce5:	00 
     ce6:	8b 45 08             	mov    0x8(%ebp),%eax
     ce9:	89 04 24             	mov    %eax,(%esp)
     cec:	8b 45 0c             	mov    0xc(%ebp),%eax
     cef:	89 44 24 04          	mov    %eax,0x4(%esp)
     cf3:	8b 45 10             	mov    0x10(%ebp),%eax
     cf6:	89 44 24 08          	mov    %eax,0x8(%esp)
     cfa:	e8 0b 18 00 00       	call   250a <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cff:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     d06:	00 
     d07:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     d0e:	00 
     d0f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     d16:	00 
     d17:	c7 44 24 0c 34 a5 00 	movl   $0xa534,0xc(%esp)
     d1e:	00 
     d1f:	8b 45 08             	mov    0x8(%ebp),%eax
     d22:	89 04 24             	mov    %eax,(%esp)
     d25:	8b 45 0c             	mov    0xc(%ebp),%eax
     d28:	89 44 24 04          	mov    %eax,0x4(%esp)
     d2c:	8b 45 10             	mov    0x10(%ebp),%eax
     d2f:	89 44 24 08          	mov    %eax,0x8(%esp)
     d33:	e8 d2 17 00 00       	call   250a <puts_str>
		}
}
     d38:	c9                   	leave  
     d39:	c3                   	ret    

00000d3a <int2str>:

char * int2str(int i)
{
     d3a:	55                   	push   %ebp
     d3b:	89 e5                	mov    %esp,%ebp
     d3d:	53                   	push   %ebx
     d3e:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
     d41:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
     d48:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d4f:	e8 13 34 00 00       	call   4167 <malloc>
     d54:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     d57:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d5e:	e8 04 34 00 00       	call   4167 <malloc>
     d63:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
     d66:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d69:	8d 50 01             	lea    0x1(%eax),%edx
     d6c:	89 55 f0             	mov    %edx,-0x10(%ebp)
     d6f:	89 c2                	mov    %eax,%edx
     d71:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d74:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     d77:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d7a:	ba 67 66 66 66       	mov    $0x66666667,%edx
     d7f:	89 c8                	mov    %ecx,%eax
     d81:	f7 ea                	imul   %edx
     d83:	c1 fa 02             	sar    $0x2,%edx
     d86:	89 c8                	mov    %ecx,%eax
     d88:	c1 f8 1f             	sar    $0x1f,%eax
     d8b:	29 c2                	sub    %eax,%edx
     d8d:	89 d0                	mov    %edx,%eax
     d8f:	c1 e0 02             	shl    $0x2,%eax
     d92:	01 d0                	add    %edx,%eax
     d94:	01 c0                	add    %eax,%eax
     d96:	29 c1                	sub    %eax,%ecx
     d98:	89 ca                	mov    %ecx,%edx
     d9a:	89 d0                	mov    %edx,%eax
     d9c:	83 c0 30             	add    $0x30,%eax
     d9f:	88 03                	mov    %al,(%ebx)
		i /= 10;
     da1:	8b 4d 08             	mov    0x8(%ebp),%ecx
     da4:	ba 67 66 66 66       	mov    $0x66666667,%edx
     da9:	89 c8                	mov    %ecx,%eax
     dab:	f7 ea                	imul   %edx
     dad:	c1 fa 02             	sar    $0x2,%edx
     db0:	89 c8                	mov    %ecx,%eax
     db2:	c1 f8 1f             	sar    $0x1f,%eax
     db5:	29 c2                	sub    %eax,%edx
     db7:	89 d0                	mov    %edx,%eax
     db9:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
     dbc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     dc0:	75 a4                	jne    d66 <int2str+0x2c>
	result[n] = 0;
     dc2:	8b 55 f0             	mov    -0x10(%ebp),%edx
     dc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dc8:	01 d0                	add    %edx,%eax
     dca:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
     dcd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     dd4:	eb 21                	jmp    df7 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
     dd6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     dd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ddc:	01 c2                	add    %eax,%edx
     dde:	8b 45 f0             	mov    -0x10(%ebp),%eax
     de1:	83 e8 01             	sub    $0x1,%eax
     de4:	2b 45 f4             	sub    -0xc(%ebp),%eax
     de7:	89 c1                	mov    %eax,%ecx
     de9:	8b 45 ec             	mov    -0x14(%ebp),%eax
     dec:	01 c8                	add    %ecx,%eax
     dee:	0f b6 00             	movzbl (%eax),%eax
     df1:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
     df3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     df7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dfa:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     dfd:	7c d7                	jl     dd6 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
     dff:	8b 55 f0             	mov    -0x10(%ebp),%edx
     e02:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e05:	01 d0                	add    %edx,%eax
     e07:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
     e0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e0d:	89 04 24             	mov    %eax,(%esp)
     e10:	e8 19 32 00 00       	call   402e <free>
	return temp;
     e15:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
     e18:	83 c4 24             	add    $0x24,%esp
     e1b:	5b                   	pop    %ebx
     e1c:	5d                   	pop    %ebp
     e1d:	c3                   	ret    

00000e1e <printItemList>:

void printItemList() {
     e1e:	55                   	push   %ebp
     e1f:	89 e5                	mov    %esp,%ebp
     e21:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
     e24:	a1 00 eb 00 00       	mov    0xeb00,%eax
     e29:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     e2c:	eb 27                	jmp    e55 <printItemList+0x37>
		printf(0, "%s\n", p->name);
     e2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e31:	8b 40 14             	mov    0x14(%eax),%eax
     e34:	89 44 24 08          	mov    %eax,0x8(%esp)
     e38:	c7 44 24 04 39 a5 00 	movl   $0xa539,0x4(%esp)
     e3f:	00 
     e40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e47:	e8 2f 30 00 00       	call   3e7b <printf>
		p = p->next;
     e4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e4f:	8b 40 2c             	mov    0x2c(%eax),%eax
     e52:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
     e55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e59:	75 d3                	jne    e2e <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
     e5b:	c9                   	leave  
     e5c:	c3                   	ret    

00000e5d <getPos>:

Rect getPos(Context context, int n) {
     e5d:	55                   	push   %ebp
     e5e:	89 e5                	mov    %esp,%ebp
     e60:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
     e63:	a1 44 e3 00 00       	mov    0xe344,%eax
     e68:	83 f8 01             	cmp    $0x1,%eax
     e6b:	75 78                	jne    ee5 <getPos+0x88>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     e6d:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e70:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
     e75:	89 c8                	mov    %ecx,%eax
     e77:	f7 ea                	imul   %edx
     e79:	c1 fa 06             	sar    $0x6,%edx
     e7c:	89 c8                	mov    %ecx,%eax
     e7e:	c1 f8 1f             	sar    $0x1f,%eax
     e81:	29 c2                	sub    %eax,%edx
     e83:	89 d0                	mov    %edx,%eax
     e85:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
     e88:	8b 45 18             	mov    0x18(%ebp),%eax
     e8b:	99                   	cltd   
     e8c:	f7 7d f4             	idivl  -0xc(%ebp)
     e8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
     e92:	8b 45 18             	mov    0x18(%ebp),%eax
     e95:	99                   	cltd   
     e96:	f7 7d f4             	idivl  -0xc(%ebp)
     e99:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
     e9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e9f:	6b c0 73             	imul   $0x73,%eax,%eax
     ea2:	83 c0 5a             	add    $0x5a,%eax
     ea5:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
     ea8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     eab:	01 c0                	add    %eax,%eax
     ead:	89 c2                	mov    %eax,%edx
     eaf:	c1 e2 06             	shl    $0x6,%edx
     eb2:	01 d0                	add    %edx,%eax
     eb4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top, ICON_ITEM_WIDTH,
     eb7:	8b 45 08             	mov    0x8(%ebp),%eax
     eba:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
     ec1:	00 
     ec2:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
     ec9:	00 
     eca:	8b 55 e8             	mov    -0x18(%ebp),%edx
     ecd:	89 54 24 08          	mov    %edx,0x8(%esp)
     ed1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     ed4:	89 54 24 04          	mov    %edx,0x4(%esp)
     ed8:	89 04 24             	mov    %eax,(%esp)
     edb:	e8 95 24 00 00       	call   3375 <initRect>
     ee0:	83 ec 04             	sub    $0x4,%esp
     ee3:	eb 36                	jmp    f1b <getPos+0xbe>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP), context.width,
     ee5:	8b 4d 10             	mov    0x10(%ebp),%ecx
     ee8:	8b 55 18             	mov    0x18(%ebp),%edx
     eeb:	89 d0                	mov    %edx,%eax
     eed:	c1 e0 05             	shl    $0x5,%eax
     ef0:	29 d0                	sub    %edx,%eax
     ef2:	8d 50 62             	lea    0x62(%eax),%edx
     ef5:	8b 45 08             	mov    0x8(%ebp),%eax
     ef8:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
     eff:	00 
     f00:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     f04:	89 54 24 08          	mov    %edx,0x8(%esp)
     f08:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     f0f:	00 
     f10:	89 04 24             	mov    %eax,(%esp)
     f13:	e8 5d 24 00 00       	call   3375 <initRect>
     f18:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
     f1b:	8b 45 08             	mov    0x8(%ebp),%eax
     f1e:	c9                   	leave  
     f1f:	c2 04 00             	ret    $0x4

00000f22 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
     f22:	55                   	push   %ebp
     f23:	89 e5                	mov    %esp,%ebp
     f25:	83 ec 28             	sub    $0x28,%esp
	switch (item.st.type) {
     f28:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
     f2c:	98                   	cwtl   
     f2d:	83 f8 01             	cmp    $0x1,%eax
     f30:	74 45                	je     f77 <addItemEvent+0x55>
     f32:	83 f8 02             	cmp    $0x2,%eax
     f35:	0f 85 ac 00 00 00    	jne    fe7 <addItemEvent+0xc5>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f3b:	c7 44 24 18 1a 17 00 	movl   $0x171a,0x18(%esp)
     f42:	00 
     f43:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f4a:	00 
     f4b:	8b 45 24             	mov    0x24(%ebp),%eax
     f4e:	89 44 24 04          	mov    %eax,0x4(%esp)
     f52:	8b 45 28             	mov    0x28(%ebp),%eax
     f55:	89 44 24 08          	mov    %eax,0x8(%esp)
     f59:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f5c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f60:	8b 45 30             	mov    0x30(%ebp),%eax
     f63:	89 44 24 10          	mov    %eax,0x10(%esp)
     f67:	8b 45 08             	mov    0x8(%ebp),%eax
     f6a:	89 04 24             	mov    %eax,(%esp)
     f6d:	e8 ef 24 00 00       	call   3461 <createClickable>
		break;
     f72:	e9 84 00 00 00       	jmp    ffb <addItemEvent+0xd9>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
     f77:	c7 44 24 18 1a 17 00 	movl   $0x171a,0x18(%esp)
     f7e:	00 
     f7f:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     f86:	00 
     f87:	8b 45 24             	mov    0x24(%ebp),%eax
     f8a:	89 44 24 04          	mov    %eax,0x4(%esp)
     f8e:	8b 45 28             	mov    0x28(%ebp),%eax
     f91:	89 44 24 08          	mov    %eax,0x8(%esp)
     f95:	8b 45 2c             	mov    0x2c(%ebp),%eax
     f98:	89 44 24 0c          	mov    %eax,0xc(%esp)
     f9c:	8b 45 30             	mov    0x30(%ebp),%eax
     f9f:	89 44 24 10          	mov    %eax,0x10(%esp)
     fa3:	8b 45 08             	mov    0x8(%ebp),%eax
     fa6:	89 04 24             	mov    %eax,(%esp)
     fa9:	e8 b3 24 00 00       	call   3461 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
     fae:	c7 44 24 18 f8 11 00 	movl   $0x11f8,0x18(%esp)
     fb5:	00 
     fb6:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
     fbd:	00 
     fbe:	8b 45 24             	mov    0x24(%ebp),%eax
     fc1:	89 44 24 04          	mov    %eax,0x4(%esp)
     fc5:	8b 45 28             	mov    0x28(%ebp),%eax
     fc8:	89 44 24 08          	mov    %eax,0x8(%esp)
     fcc:	8b 45 2c             	mov    0x2c(%ebp),%eax
     fcf:	89 44 24 0c          	mov    %eax,0xc(%esp)
     fd3:	8b 45 30             	mov    0x30(%ebp),%eax
     fd6:	89 44 24 10          	mov    %eax,0x10(%esp)
     fda:	8b 45 08             	mov    0x8(%ebp),%eax
     fdd:	89 04 24             	mov    %eax,(%esp)
     fe0:	e8 7c 24 00 00       	call   3461 <createClickable>
		break;
     fe5:	eb 14                	jmp    ffb <addItemEvent+0xd9>
	default:
		printf(0, "unknown file type!");
     fe7:	c7 44 24 04 3d a5 00 	movl   $0xa53d,0x4(%esp)
     fee:	00 
     fef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ff6:	e8 80 2e 00 00       	call   3e7b <printf>
	}
}
     ffb:	c9                   	leave  
     ffc:	c3                   	ret    

00000ffd <addListEvent>:

void addListEvent(ClickableManager *cm) {
     ffd:	55                   	push   %ebp
     ffe:	89 e5                	mov    %esp,%ebp
    1000:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    1003:	a1 00 eb 00 00       	mov    0xeb00,%eax
    1008:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    100b:	eb 70                	jmp    107d <addListEvent+0x80>
		temp = p;
    100d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1010:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    1013:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1016:	8b 40 2c             	mov    0x2c(%eax),%eax
    1019:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    101c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    101f:	8b 10                	mov    (%eax),%edx
    1021:	89 54 24 04          	mov    %edx,0x4(%esp)
    1025:	8b 50 04             	mov    0x4(%eax),%edx
    1028:	89 54 24 08          	mov    %edx,0x8(%esp)
    102c:	8b 50 08             	mov    0x8(%eax),%edx
    102f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1033:	8b 50 0c             	mov    0xc(%eax),%edx
    1036:	89 54 24 10          	mov    %edx,0x10(%esp)
    103a:	8b 50 10             	mov    0x10(%eax),%edx
    103d:	89 54 24 14          	mov    %edx,0x14(%esp)
    1041:	8b 50 14             	mov    0x14(%eax),%edx
    1044:	89 54 24 18          	mov    %edx,0x18(%esp)
    1048:	8b 50 18             	mov    0x18(%eax),%edx
    104b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    104f:	8b 50 1c             	mov    0x1c(%eax),%edx
    1052:	89 54 24 20          	mov    %edx,0x20(%esp)
    1056:	8b 50 20             	mov    0x20(%eax),%edx
    1059:	89 54 24 24          	mov    %edx,0x24(%esp)
    105d:	8b 50 24             	mov    0x24(%eax),%edx
    1060:	89 54 24 28          	mov    %edx,0x28(%esp)
    1064:	8b 50 28             	mov    0x28(%eax),%edx
    1067:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    106b:	8b 40 2c             	mov    0x2c(%eax),%eax
    106e:	89 44 24 30          	mov    %eax,0x30(%esp)
    1072:	8b 45 08             	mov    0x8(%ebp),%eax
    1075:	89 04 24             	mov    %eax,(%esp)
    1078:	e8 a5 fe ff ff       	call   f22 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    107d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1081:	75 8a                	jne    100d <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    1083:	c9                   	leave  
    1084:	c3                   	ret    

00001085 <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile };

void addWndEvent(ClickableManager *cm) {
    1085:	55                   	push   %ebp
    1086:	89 e5                	mov    %esp,%ebp
    1088:	57                   	push   %edi
    1089:	56                   	push   %esi
    108a:	53                   	push   %ebx
    108b:	83 ec 4c             	sub    $0x4c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    108e:	c7 45 e0 08 00 00 00 	movl   $0x8,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    1095:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    109c:	e9 96 00 00 00       	jmp    1137 <addWndEvent+0xb2>
		createClickable(cm,
    10a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10a4:	8b 1c 85 e0 e5 00 00 	mov    0xe5e0(,%eax,4),%ebx
    10ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ae:	6b c0 34             	imul   $0x34,%eax,%eax
    10b1:	05 60 e4 00 00       	add    $0xe460,%eax
    10b6:	8b 78 10             	mov    0x10(%eax),%edi
    10b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10bc:	6b c0 34             	imul   $0x34,%eax,%eax
    10bf:	05 60 e4 00 00       	add    $0xe460,%eax
    10c4:	8b 70 0c             	mov    0xc(%eax),%esi
    10c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ca:	6b c0 34             	imul   $0x34,%eax,%eax
    10cd:	05 60 e4 00 00       	add    $0xe460,%eax
    10d2:	8b 48 04             	mov    0x4(%eax),%ecx
    10d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10d8:	6b c0 34             	imul   $0x34,%eax,%eax
    10db:	05 60 e4 00 00       	add    $0xe460,%eax
    10e0:	8b 10                	mov    (%eax),%edx
    10e2:	8d 45 d0             	lea    -0x30(%ebp),%eax
    10e5:	89 7c 24 10          	mov    %edi,0x10(%esp)
    10e9:	89 74 24 0c          	mov    %esi,0xc(%esp)
    10ed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    10f5:	89 04 24             	mov    %eax,(%esp)
    10f8:	e8 78 22 00 00       	call   3375 <initRect>
    10fd:	83 ec 04             	sub    $0x4,%esp
    1100:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    1104:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    110b:	00 
    110c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    110f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1113:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1116:	89 44 24 08          	mov    %eax,0x8(%esp)
    111a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    111d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1121:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1124:	89 44 24 10          	mov    %eax,0x10(%esp)
    1128:	8b 45 08             	mov    0x8(%ebp),%eax
    112b:	89 04 24             	mov    %eax,(%esp)
    112e:	e8 2e 23 00 00       	call   3461 <createClickable>
		h_newFile, h_goUp, h_deleteFile };

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    1133:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1137:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    113a:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    113d:	0f 8c 5e ff ff ff    	jl     10a1 <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
}
    1143:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1146:	5b                   	pop    %ebx
    1147:	5e                   	pop    %esi
    1148:	5f                   	pop    %edi
    1149:	5d                   	pop    %ebp
    114a:	c3                   	ret    

0000114b <getFileItem>:

struct fileItem * getFileItem(Point point) {
    114b:	55                   	push   %ebp
    114c:	89 e5                	mov    %esp,%ebp
    114e:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1151:	a1 00 eb 00 00       	mov    0xeb00,%eax
    1156:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1159:	eb 43                	jmp    119e <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    115b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    115e:	8b 50 18             	mov    0x18(%eax),%edx
    1161:	89 54 24 08          	mov    %edx,0x8(%esp)
    1165:	8b 50 1c             	mov    0x1c(%eax),%edx
    1168:	89 54 24 0c          	mov    %edx,0xc(%esp)
    116c:	8b 50 20             	mov    0x20(%eax),%edx
    116f:	89 54 24 10          	mov    %edx,0x10(%esp)
    1173:	8b 40 24             	mov    0x24(%eax),%eax
    1176:	89 44 24 14          	mov    %eax,0x14(%esp)
    117a:	8b 45 08             	mov    0x8(%ebp),%eax
    117d:	8b 55 0c             	mov    0xc(%ebp),%edx
    1180:	89 04 24             	mov    %eax,(%esp)
    1183:	89 54 24 04          	mov    %edx,0x4(%esp)
    1187:	e8 44 22 00 00       	call   33d0 <isIn>
    118c:	85 c0                	test   %eax,%eax
    118e:	74 05                	je     1195 <getFileItem+0x4a>
			return p;
    1190:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1193:	eb 14                	jmp    11a9 <getFileItem+0x5e>
		}
		p = p->next;
    1195:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1198:	8b 40 2c             	mov    0x2c(%eax),%eax
    119b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	}
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    119e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11a2:	75 b7                	jne    115b <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    11a4:	b8 00 00 00 00       	mov    $0x0,%eax
}
    11a9:	c9                   	leave  
    11aa:	c3                   	ret    

000011ab <enterDir>:

// Handlers
void enterDir(char *name) {
    11ab:	55                   	push   %ebp
    11ac:	89 e5                	mov    %esp,%ebp
    11ae:	83 ec 18             	sub    $0x18,%esp
	printf(0, "entering : %s\n", name);
    11b1:	8b 45 08             	mov    0x8(%ebp),%eax
    11b4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b8:	c7 44 24 04 50 a5 00 	movl   $0xa550,0x4(%esp)
    11bf:	00 
    11c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11c7:	e8 af 2c 00 00       	call   3e7b <printf>
	if (chdir(name) < 0)
    11cc:	8b 45 08             	mov    0x8(%ebp),%eax
    11cf:	89 04 24             	mov    %eax,(%esp)
    11d2:	e8 2c 2b 00 00       	call   3d03 <chdir>
    11d7:	85 c0                	test   %eax,%eax
    11d9:	79 1b                	jns    11f6 <enterDir+0x4b>
		printf(2, "cannot cd %s\n", name);
    11db:	8b 45 08             	mov    0x8(%ebp),%eax
    11de:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e2:	c7 44 24 04 5f a5 00 	movl   $0xa55f,0x4(%esp)
    11e9:	00 
    11ea:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    11f1:	e8 85 2c 00 00       	call   3e7b <printf>
}
    11f6:	c9                   	leave  
    11f7:	c3                   	ret    

000011f8 <h_enterDir>:

void h_enterDir(Point p) {
    11f8:	55                   	push   %ebp
    11f9:	89 e5                	mov    %esp,%ebp
    11fb:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    11fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1201:	8b 55 0c             	mov    0xc(%ebp),%edx
    1204:	89 04 24             	mov    %eax,(%esp)
    1207:	89 54 24 04          	mov    %edx,0x4(%esp)
    120b:	e8 3b ff ff ff       	call   114b <getFileItem>
    1210:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1213:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1216:	8b 40 14             	mov    0x14(%eax),%eax
    1219:	89 04 24             	mov    %eax,(%esp)
    121c:	e8 8a ff ff ff       	call   11ab <enterDir>
	freeFileItemList();
    1221:	e8 ab ee ff ff       	call   d1 <freeFileItemList>
	list(".");
    1226:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    122d:	e8 7d ef ff ff       	call   1af <list>
	drawFinderContent(context);
    1232:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1237:	89 04 24             	mov    %eax,(%esp)
    123a:	a1 f4 18 01 00       	mov    0x118f4,%eax
    123f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1243:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1248:	89 44 24 08          	mov    %eax,0x8(%esp)
    124c:	e8 62 f8 ff ff       	call   ab3 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1251:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1254:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    125b:	00 
    125c:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1263:	00 
    1264:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    126b:	00 
    126c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1273:	00 
    1274:	89 04 24             	mov    %eax,(%esp)
    1277:	e8 f9 20 00 00       	call   3375 <initRect>
    127c:	83 ec 04             	sub    $0x4,%esp
    127f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1282:	89 44 24 04          	mov    %eax,0x4(%esp)
    1286:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1289:	89 44 24 08          	mov    %eax,0x8(%esp)
    128d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1290:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1294:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1297:	89 44 24 10          	mov    %eax,0x10(%esp)
    129b:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    12a2:	e8 d1 22 00 00       	call   3578 <deleteClickable>
	addWndEvent(&cm);
    12a7:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    12ae:	e8 d2 fd ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    12b3:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    12ba:	e8 3e fd ff ff       	call   ffd <addListEvent>
}
    12bf:	c9                   	leave  
    12c0:	c3                   	ret    

000012c1 <newFile>:

void newFile(char *name) {
    12c1:	55                   	push   %ebp
    12c2:	89 e5                	mov    %esp,%ebp
    12c4:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    12c7:	8b 45 08             	mov    0x8(%ebp),%eax
    12ca:	89 04 24             	mov    %eax,(%esp)
    12cd:	e8 ed 27 00 00       	call   3abf <strlen>
    12d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    12d5:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    12dc:	eb 60                	jmp    133e <newFile+0x7d>
	{
		n = strlen(name);
    12de:	8b 45 08             	mov    0x8(%ebp),%eax
    12e1:	89 04 24             	mov    %eax,(%esp)
    12e4:	e8 d6 27 00 00       	call   3abf <strlen>
    12e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    12ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12ef:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    12f2:	75 09                	jne    12fd <newFile+0x3c>
		{
			counter = 1;
    12f4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    12fb:	eb 17                	jmp    1314 <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    12fd:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1300:	8b 45 08             	mov    0x8(%ebp),%eax
    1303:	01 d0                	add    %edx,%eax
    1305:	89 04 24             	mov    %eax,(%esp)
    1308:	e8 f4 28 00 00       	call   3c01 <atoi>
    130d:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1310:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1314:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1317:	89 04 24             	mov    %eax,(%esp)
    131a:	e8 1b fa ff ff       	call   d3a <int2str>
    131f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1322:	8b 55 08             	mov    0x8(%ebp),%edx
    1325:	01 ca                	add    %ecx,%edx
    1327:	89 44 24 04          	mov    %eax,0x4(%esp)
    132b:	89 14 24             	mov    %edx,(%esp)
    132e:	e8 1d 27 00 00       	call   3a50 <strcpy>
		close(fd);
    1333:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1336:	89 04 24             	mov    %eax,(%esp)
    1339:	e8 7d 29 00 00       	call   3cbb <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    133e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1345:	00 
    1346:	8b 45 08             	mov    0x8(%ebp),%eax
    1349:	89 04 24             	mov    %eax,(%esp)
    134c:	e8 82 29 00 00       	call   3cd3 <open>
    1351:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1354:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1358:	7f 84                	jg     12de <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    135a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1361:	00 
    1362:	8b 45 08             	mov    0x8(%ebp),%eax
    1365:	89 04 24             	mov    %eax,(%esp)
    1368:	e8 66 29 00 00       	call   3cd3 <open>
    136d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1370:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1374:	79 20                	jns    1396 <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1376:	8b 45 08             	mov    0x8(%ebp),%eax
    1379:	89 44 24 08          	mov    %eax,0x8(%esp)
    137d:	c7 44 24 04 6f a5 00 	movl   $0xa56f,0x4(%esp)
    1384:	00 
    1385:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    138c:	e8 ea 2a 00 00       	call   3e7b <printf>
		exit();
    1391:	e8 fd 28 00 00       	call   3c93 <exit>
	}
	close(fd);
    1396:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1399:	89 04 24             	mov    %eax,(%esp)
    139c:	e8 1a 29 00 00       	call   3cbb <close>
}
    13a1:	c9                   	leave  
    13a2:	c3                   	ret    

000013a3 <h_newFile>:

void h_newFile(Point p) {
    13a3:	55                   	push   %ebp
    13a4:	89 e5                	mov    %esp,%ebp
    13a6:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    13a9:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    13b0:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    13b7:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    13be:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    13c5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    13cc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    13d3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    13da:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    13e1:	8d 45 c8             	lea    -0x38(%ebp),%eax
    13e4:	89 04 24             	mov    %eax,(%esp)
    13e7:	e8 d5 fe ff ff       	call   12c1 <newFile>
	freeFileItemList();
    13ec:	e8 e0 ec ff ff       	call   d1 <freeFileItemList>
	list(".");
    13f1:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    13f8:	e8 b2 ed ff ff       	call   1af <list>
	drawFinderContent(context);
    13fd:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1402:	89 04 24             	mov    %eax,(%esp)
    1405:	a1 f4 18 01 00       	mov    0x118f4,%eax
    140a:	89 44 24 04          	mov    %eax,0x4(%esp)
    140e:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1413:	89 44 24 08          	mov    %eax,0x8(%esp)
    1417:	e8 97 f6 ff ff       	call   ab3 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    141c:	8d 45 e8             	lea    -0x18(%ebp),%eax
    141f:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1426:	00 
    1427:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    142e:	00 
    142f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1436:	00 
    1437:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    143e:	00 
    143f:	89 04 24             	mov    %eax,(%esp)
    1442:	e8 2e 1f 00 00       	call   3375 <initRect>
    1447:	83 ec 04             	sub    $0x4,%esp
    144a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    144d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1451:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1454:	89 44 24 08          	mov    %eax,0x8(%esp)
    1458:	8b 45 f0             	mov    -0x10(%ebp),%eax
    145b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    145f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1462:	89 44 24 10          	mov    %eax,0x10(%esp)
    1466:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    146d:	e8 06 21 00 00       	call   3578 <deleteClickable>
	addWndEvent(&cm);
    1472:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1479:	e8 07 fc ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    147e:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1485:	e8 73 fb ff ff       	call   ffd <addListEvent>
}
    148a:	c9                   	leave  
    148b:	c3                   	ret    

0000148c <newFolder>:

void newFolder(char *name) {
    148c:	55                   	push   %ebp
    148d:	89 e5                	mov    %esp,%ebp
    148f:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    1492:	8b 45 08             	mov    0x8(%ebp),%eax
    1495:	89 04 24             	mov    %eax,(%esp)
    1498:	e8 22 26 00 00       	call   3abf <strlen>
    149d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    14a0:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    14a7:	eb 55                	jmp    14fe <newFolder+0x72>
		n = strlen(name);
    14a9:	8b 45 08             	mov    0x8(%ebp),%eax
    14ac:	89 04 24             	mov    %eax,(%esp)
    14af:	e8 0b 26 00 00       	call   3abf <strlen>
    14b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    14b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    14ba:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    14bd:	75 09                	jne    14c8 <newFolder+0x3c>
		{
			counter = 1;
    14bf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    14c6:	eb 17                	jmp    14df <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    14c8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    14cb:	8b 45 08             	mov    0x8(%ebp),%eax
    14ce:	01 d0                	add    %edx,%eax
    14d0:	89 04 24             	mov    %eax,(%esp)
    14d3:	e8 29 27 00 00       	call   3c01 <atoi>
    14d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    14db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    14df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e2:	89 04 24             	mov    %eax,(%esp)
    14e5:	e8 50 f8 ff ff       	call   d3a <int2str>
    14ea:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    14ed:	8b 55 08             	mov    0x8(%ebp),%edx
    14f0:	01 ca                	add    %ecx,%edx
    14f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    14f6:	89 14 24             	mov    %edx,(%esp)
    14f9:	e8 52 25 00 00       	call   3a50 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    14fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1501:	89 04 24             	mov    %eax,(%esp)
    1504:	e8 f2 27 00 00       	call   3cfb <mkdir>
    1509:	85 c0                	test   %eax,%eax
    150b:	78 9c                	js     14a9 <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    150d:	c9                   	leave  
    150e:	c3                   	ret    

0000150f <h_newFolder>:

void h_newFolder(Point p) {
    150f:	55                   	push   %ebp
    1510:	89 e5                	mov    %esp,%ebp
    1512:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    1515:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    151c:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    1523:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    152a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1531:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1538:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    153f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1546:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    154d:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1550:	89 04 24             	mov    %eax,(%esp)
    1553:	e8 34 ff ff ff       	call   148c <newFolder>
	freeFileItemList();
    1558:	e8 74 eb ff ff       	call   d1 <freeFileItemList>
	printf(0, "new folder!\n");
    155d:	c7 44 24 04 84 a5 00 	movl   $0xa584,0x4(%esp)
    1564:	00 
    1565:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    156c:	e8 0a 29 00 00       	call   3e7b <printf>
	list(".");
    1571:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1578:	e8 32 ec ff ff       	call   1af <list>
	printItemList();
    157d:	e8 9c f8 ff ff       	call   e1e <printItemList>
	drawFinderContent(context);
    1582:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1587:	89 04 24             	mov    %eax,(%esp)
    158a:	a1 f4 18 01 00       	mov    0x118f4,%eax
    158f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1593:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1598:	89 44 24 08          	mov    %eax,0x8(%esp)
    159c:	e8 12 f5 ff ff       	call   ab3 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    15a1:	8d 45 e8             	lea    -0x18(%ebp),%eax
    15a4:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    15ab:	00 
    15ac:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    15b3:	00 
    15b4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    15bb:	00 
    15bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    15c3:	00 
    15c4:	89 04 24             	mov    %eax,(%esp)
    15c7:	e8 a9 1d 00 00       	call   3375 <initRect>
    15cc:	83 ec 04             	sub    $0x4,%esp
    15cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    15dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    15e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e7:	89 44 24 10          	mov    %eax,0x10(%esp)
    15eb:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    15f2:	e8 81 1f 00 00       	call   3578 <deleteClickable>
	addWndEvent(&cm);
    15f7:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    15fe:	e8 82 fa ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    1603:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    160a:	e8 ee f9 ff ff       	call   ffd <addListEvent>
}
    160f:	c9                   	leave  
    1610:	c3                   	ret    

00001611 <deleteFile>:

void deleteFile(char *name)
{
    1611:	55                   	push   %ebp
    1612:	89 e5                	mov    %esp,%ebp
    1614:	83 ec 18             	sub    $0x18,%esp
	if(unlink(name) < 0){
    1617:	8b 45 08             	mov    0x8(%ebp),%eax
    161a:	89 04 24             	mov    %eax,(%esp)
    161d:	e8 c1 26 00 00       	call   3ce3 <unlink>
    1622:	85 c0                	test   %eax,%eax
    1624:	79 1b                	jns    1641 <deleteFile+0x30>
		 printf(2, "rm: %s failed to delete\n", name);
    1626:	8b 45 08             	mov    0x8(%ebp),%eax
    1629:	89 44 24 08          	mov    %eax,0x8(%esp)
    162d:	c7 44 24 04 91 a5 00 	movl   $0xa591,0x4(%esp)
    1634:	00 
    1635:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    163c:	e8 3a 28 00 00       	call   3e7b <printf>
	}
}
    1641:	c9                   	leave  
    1642:	c3                   	ret    

00001643 <h_deleteFile>:
void h_deleteFile(Point p) {
    1643:	55                   	push   %ebp
    1644:	89 e5                	mov    %esp,%ebp
    1646:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    1649:	a1 00 eb 00 00       	mov    0xeb00,%eax
    164e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (q != 0)
    1651:	eb 21                	jmp    1674 <h_deleteFile+0x31>
	{
		if (q->chosen)
    1653:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1656:	8b 40 28             	mov    0x28(%eax),%eax
    1659:	85 c0                	test   %eax,%eax
    165b:	74 0e                	je     166b <h_deleteFile+0x28>
		{
			deleteFile(q->name);
    165d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1660:	8b 40 14             	mov    0x14(%eax),%eax
    1663:	89 04 24             	mov    %eax,(%esp)
    1666:	e8 a6 ff ff ff       	call   1611 <deleteFile>
		}
		q = q->next;
    166b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    166e:	8b 40 2c             	mov    0x2c(%eax),%eax
    1671:	89 45 f4             	mov    %eax,-0xc(%ebp)
		 printf(2, "rm: %s failed to delete\n", name);
	}
}
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	while (q != 0)
    1674:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1678:	75 d9                	jne    1653 <h_deleteFile+0x10>
		{
			deleteFile(q->name);
		}
		q = q->next;
	}
	freeFileItemList();
    167a:	e8 52 ea ff ff       	call   d1 <freeFileItemList>
	list(".");
    167f:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1686:	e8 24 eb ff ff       	call   1af <list>
	drawFinderContent(context);
    168b:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1690:	89 04 24             	mov    %eax,(%esp)
    1693:	a1 f4 18 01 00       	mov    0x118f4,%eax
    1698:	89 44 24 04          	mov    %eax,0x4(%esp)
    169c:	a1 f8 18 01 00       	mov    0x118f8,%eax
    16a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    16a5:	e8 09 f4 ff ff       	call   ab3 <drawFinderContent>
		deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    16aa:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    16ad:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    16b4:	00 
    16b5:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    16bc:	00 
    16bd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    16c4:	00 
    16c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16cc:	00 
    16cd:	89 04 24             	mov    %eax,(%esp)
    16d0:	e8 a0 1c 00 00       	call   3375 <initRect>
    16d5:	83 ec 04             	sub    $0x4,%esp
    16d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16db:	89 44 24 04          	mov    %eax,0x4(%esp)
    16df:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    16e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16f0:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f4:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    16fb:	e8 78 1e 00 00       	call   3578 <deleteClickable>
		addWndEvent(&cm);
    1700:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1707:	e8 79 f9 ff ff       	call   1085 <addWndEvent>
		addListEvent(&cm);
    170c:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1713:	e8 e5 f8 ff ff       	call   ffd <addListEvent>
}
    1718:	c9                   	leave  
    1719:	c3                   	ret    

0000171a <h_chooseFile>:

void h_chooseFile(Point p) {
    171a:	55                   	push   %ebp
    171b:	89 e5                	mov    %esp,%ebp
    171d:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = getFileItem(p);
    1720:	8b 45 08             	mov    0x8(%ebp),%eax
    1723:	8b 55 0c             	mov    0xc(%ebp),%edx
    1726:	89 04 24             	mov    %eax,(%esp)
    1729:	89 54 24 04          	mov    %edx,0x4(%esp)
    172d:	e8 19 fa ff ff       	call   114b <getFileItem>
    1732:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (temp->chosen != 0)
    1735:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1738:	8b 40 28             	mov    0x28(%eax),%eax
    173b:	85 c0                	test   %eax,%eax
    173d:	74 20                	je     175f <h_chooseFile+0x45>
	{
		printf(0, "chooseFile!\n");
    173f:	c7 44 24 04 aa a5 00 	movl   $0xa5aa,0x4(%esp)
    1746:	00 
    1747:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    174e:	e8 28 27 00 00       	call   3e7b <printf>
		temp->chosen = 0;
    1753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1756:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    175d:	eb 1e                	jmp    177d <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    175f:	c7 44 24 04 b7 a5 00 	movl   $0xa5b7,0x4(%esp)
    1766:	00 
    1767:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    176e:	e8 08 27 00 00       	call   3e7b <printf>
		temp->chosen = 1;
    1773:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1776:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    177d:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1782:	89 04 24             	mov    %eax,(%esp)
    1785:	a1 f4 18 01 00       	mov    0x118f4,%eax
    178a:	89 44 24 04          	mov    %eax,0x4(%esp)
    178e:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1793:	89 44 24 08          	mov    %eax,0x8(%esp)
    1797:	e8 17 f3 ff ff       	call   ab3 <drawFinderContent>
}
    179c:	c9                   	leave  
    179d:	c3                   	ret    

0000179e <h_closeWnd>:

void h_closeWnd(Point p) {
    179e:	55                   	push   %ebp
    179f:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    17a1:	c7 05 40 e3 00 00 00 	movl   $0x0,0xe340
    17a8:	00 00 00 
}
    17ab:	5d                   	pop    %ebp
    17ac:	c3                   	ret    

000017ad <h_chvm1>:

void h_chvm1(Point p) {
    17ad:	55                   	push   %ebp
    17ae:	89 e5                	mov    %esp,%ebp
    17b0:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    17b3:	c7 05 44 e3 00 00 01 	movl   $0x1,0xe344
    17ba:	00 00 00 
	freeFileItemList();
    17bd:	e8 0f e9 ff ff       	call   d1 <freeFileItemList>
		list(".");
    17c2:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    17c9:	e8 e1 e9 ff ff       	call   1af <list>
		drawFinderContent(context);
    17ce:	a1 f0 18 01 00       	mov    0x118f0,%eax
    17d3:	89 04 24             	mov    %eax,(%esp)
    17d6:	a1 f4 18 01 00       	mov    0x118f4,%eax
    17db:	89 44 24 04          	mov    %eax,0x4(%esp)
    17df:	a1 f8 18 01 00       	mov    0x118f8,%eax
    17e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    17e8:	e8 c6 f2 ff ff       	call   ab3 <drawFinderContent>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    17ed:	8d 45 e8             	lea    -0x18(%ebp),%eax
    17f0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    17f7:	00 
    17f8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    17ff:	00 
    1800:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1807:	00 
    1808:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    180f:	00 
    1810:	89 04 24             	mov    %eax,(%esp)
    1813:	e8 5d 1b 00 00       	call   3375 <initRect>
    1818:	83 ec 04             	sub    $0x4,%esp
    181b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    181e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1822:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1825:	89 44 24 08          	mov    %eax,0x8(%esp)
    1829:	8b 45 f0             	mov    -0x10(%ebp),%eax
    182c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1833:	89 44 24 10          	mov    %eax,0x10(%esp)
    1837:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    183e:	e8 35 1d 00 00       	call   3578 <deleteClickable>
			addWndEvent(&cm);
    1843:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    184a:	e8 36 f8 ff ff       	call   1085 <addWndEvent>
			addListEvent(&cm);
    184f:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1856:	e8 a2 f7 ff ff       	call   ffd <addListEvent>
}
    185b:	c9                   	leave  
    185c:	c3                   	ret    

0000185d <h_chvm2>:

void h_chvm2(Point p) {
    185d:	55                   	push   %ebp
    185e:	89 e5                	mov    %esp,%ebp
    1860:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    1863:	c7 05 44 e3 00 00 02 	movl   $0x2,0xe344
    186a:	00 00 00 
	freeFileItemList();
    186d:	e8 5f e8 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1872:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1879:	e8 31 e9 ff ff       	call   1af <list>
		drawFinderContent(context);
    187e:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1883:	89 04 24             	mov    %eax,(%esp)
    1886:	a1 f4 18 01 00       	mov    0x118f4,%eax
    188b:	89 44 24 04          	mov    %eax,0x4(%esp)
    188f:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1894:	89 44 24 08          	mov    %eax,0x8(%esp)
    1898:	e8 16 f2 ff ff       	call   ab3 <drawFinderContent>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    189d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    18a0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    18a7:	00 
    18a8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    18af:	00 
    18b0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    18b7:	00 
    18b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    18bf:	00 
    18c0:	89 04 24             	mov    %eax,(%esp)
    18c3:	e8 ad 1a 00 00       	call   3375 <initRect>
    18c8:	83 ec 04             	sub    $0x4,%esp
    18cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    18d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    18e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e3:	89 44 24 10          	mov    %eax,0x10(%esp)
    18e7:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    18ee:	e8 85 1c 00 00       	call   3578 <deleteClickable>
			addWndEvent(&cm);
    18f3:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    18fa:	e8 86 f7 ff ff       	call   1085 <addWndEvent>
			addListEvent(&cm);
    18ff:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1906:	e8 f2 f6 ff ff       	call   ffd <addListEvent>
}
    190b:	c9                   	leave  
    190c:	c3                   	ret    

0000190d <h_goUp>:

void h_goUp(Point p) {
    190d:	55                   	push   %ebp
    190e:	89 e5                	mov    %esp,%ebp
    1910:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    1913:	c7 04 24 c6 a5 00 00 	movl   $0xa5c6,(%esp)
    191a:	e8 8c f8 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    191f:	e8 ad e7 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1924:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    192b:	e8 7f e8 ff ff       	call   1af <list>
	drawFinderContent(context);
    1930:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1935:	89 04 24             	mov    %eax,(%esp)
    1938:	a1 f4 18 01 00       	mov    0x118f4,%eax
    193d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1941:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1946:	89 44 24 08          	mov    %eax,0x8(%esp)
    194a:	e8 64 f1 ff ff       	call   ab3 <drawFinderContent>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    194f:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1952:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1959:	00 
    195a:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1961:	00 
    1962:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1969:	00 
    196a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1971:	00 
    1972:	89 04 24             	mov    %eax,(%esp)
    1975:	e8 fb 19 00 00       	call   3375 <initRect>
    197a:	83 ec 04             	sub    $0x4,%esp
    197d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1980:	89 44 24 04          	mov    %eax,0x4(%esp)
    1984:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1987:	89 44 24 08          	mov    %eax,0x8(%esp)
    198b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    198e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1992:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1995:	89 44 24 10          	mov    %eax,0x10(%esp)
    1999:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    19a0:	e8 d3 1b 00 00       	call   3578 <deleteClickable>
	addWndEvent(&cm);
    19a5:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    19ac:	e8 d4 f6 ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    19b1:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    19b8:	e8 40 f6 ff ff       	call   ffd <addListEvent>
}
    19bd:	c9                   	leave  
    19be:	c3                   	ret    

000019bf <h_empty>:

void h_empty(Point p) {
    19bf:	55                   	push   %ebp
    19c0:	89 e5                	mov    %esp,%ebp

}
    19c2:	5d                   	pop    %ebp
    19c3:	c3                   	ret    

000019c4 <main>:

int main(int argc, char *argv[]) {
    19c4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    19c8:	83 e4 f0             	and    $0xfffffff0,%esp
    19cb:	ff 71 fc             	pushl  -0x4(%ecx)
    19ce:	55                   	push   %ebp
    19cf:	89 e5                	mov    %esp,%ebp
    19d1:	56                   	push   %esi
    19d2:	53                   	push   %ebx
    19d3:	51                   	push   %ecx
    19d4:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
	int winid;
	struct Msg msg;

	Point p;

	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    19da:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    19e1:	00 
    19e2:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    19e9:	00 
    19ea:	c7 04 24 f0 18 01 00 	movl   $0x118f0,(%esp)
    19f1:	e8 49 04 00 00       	call   1e3f <init_context>
    19f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    19f9:	8d 45 88             	lea    -0x78(%ebp),%eax
    19fc:	8b 15 f0 18 01 00    	mov    0x118f0,%edx
    1a02:	89 54 24 04          	mov    %edx,0x4(%esp)
    1a06:	8b 15 f4 18 01 00    	mov    0x118f4,%edx
    1a0c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a10:	8b 15 f8 18 01 00    	mov    0x118f8,%edx
    1a16:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1a1a:	89 04 24             	mov    %eax,(%esp)
    1a1d:	e8 f1 19 00 00       	call   3413 <initClickManager>
    1a22:	83 ec 04             	sub    $0x4,%esp
    1a25:	8b 45 88             	mov    -0x78(%ebp),%eax
    1a28:	a3 fc 18 01 00       	mov    %eax,0x118fc
    1a2d:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1a30:	a3 00 19 01 00       	mov    %eax,0x11900
    1a35:	8b 45 90             	mov    -0x70(%ebp),%eax
    1a38:	a3 04 19 01 00       	mov    %eax,0x11904
    1a3d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1a40:	a3 08 19 01 00       	mov    %eax,0x11908
    1a45:	8b 45 98             	mov    -0x68(%ebp),%eax
    1a48:	a3 0c 19 01 00       	mov    %eax,0x1190c
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1a4d:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    1a54:	00 
    1a55:	c7 04 24 40 e4 00 00 	movl   $0xe440,(%esp)
    1a5c:	e8 d8 0f 00 00       	call   2a39 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1a61:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    1a68:	00 
    1a69:	c7 04 24 60 e3 00 00 	movl   $0xe360,(%esp)
    1a70:	e8 c4 0f 00 00       	call   2a39 <load_iconlist>
	//testHandlers();
	mkdir("userfolder");
    1a75:	c7 04 24 c9 a5 00 00 	movl   $0xa5c9,(%esp)
    1a7c:	e8 7a 22 00 00       	call   3cfb <mkdir>
	enterDir("userfolder");
    1a81:	c7 04 24 c9 a5 00 00 	movl   $0xa5c9,(%esp)
    1a88:	e8 1e f7 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    1a8d:	e8 3f e6 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1a92:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1a99:	e8 11 e7 ff ff       	call   1af <list>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1a9e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    1aa1:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1aa8:	00 
    1aa9:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1ab0:	00 
    1ab1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1ab8:	00 
    1ab9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ac0:	00 
    1ac1:	89 04 24             	mov    %eax,(%esp)
    1ac4:	e8 ac 18 00 00       	call   3375 <initRect>
    1ac9:	83 ec 04             	sub    $0x4,%esp
    1acc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1acf:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ad3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ad6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ada:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1add:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ae4:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ae8:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1aef:	e8 84 1a 00 00       	call   3578 <deleteClickable>
	addWndEvent(&cm);
    1af4:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1afb:	e8 85 f5 ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    1b00:	c7 04 24 fc 18 01 00 	movl   $0x118fc,(%esp)
    1b07:	e8 f1 f4 ff ff       	call   ffd <addListEvent>
	while (isRun) {
    1b0c:	e9 fe 01 00 00       	jmp    1d0f <main+0x34b>
		getMsg(&msg);
    1b11:	8d 45 b8             	lea    -0x48(%ebp),%eax
    1b14:	89 04 24             	mov    %eax,(%esp)
    1b17:	e8 17 22 00 00       	call   3d33 <getMsg>
		switch (msg.msg_type) {
    1b1c:	8b 45 b8             	mov    -0x48(%ebp),%eax
    1b1f:	83 f8 08             	cmp    $0x8,%eax
    1b22:	0f 87 e6 01 00 00    	ja     1d0e <main+0x34a>
    1b28:	8b 04 85 e4 a5 00 00 	mov    0xa5e4(,%eax,4),%eax
    1b2f:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1b31:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1b34:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1b37:	8d 45 b0             	lea    -0x50(%ebp),%eax
    1b3a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1b3e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1b42:	89 04 24             	mov    %eax,(%esp)
    1b45:	e8 04 18 00 00       	call   334e <initPoint>
    1b4a:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1b4d:	8b 0d 00 19 01 00    	mov    0x11900,%ecx
    1b53:	8b 45 b0             	mov    -0x50(%ebp),%eax
    1b56:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    1b59:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b5d:	89 54 24 08          	mov    %edx,0x8(%esp)
    1b61:	89 0c 24             	mov    %ecx,(%esp)
    1b64:	e8 ef 1a 00 00       	call   3658 <executeHandler>
    1b69:	85 c0                	test   %eax,%eax
    1b6b:	74 20                	je     1b8d <main+0x1c9>
				updateWindow(winid, context.addr, msg.msg_detail);
    1b6d:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1b70:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1b75:	89 54 24 08          	mov    %edx,0x8(%esp)
    1b79:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b80:	89 04 24             	mov    %eax,(%esp)
    1b83:	e8 c3 21 00 00       	call   3d4b <updateWindow>
			}
			break;
    1b88:	e9 82 01 00 00       	jmp    1d0f <main+0x34b>
    1b8d:	e9 7d 01 00 00       	jmp    1d0f <main+0x34b>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			printf(1, "msg_detail %d\n", msg.msg_detail);
    1b92:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1b95:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b99:	c7 44 24 04 d4 a5 00 	movl   $0xa5d4,0x4(%esp)
    1ba0:	00 
    1ba1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ba8:	e8 ce 22 00 00       	call   3e7b <printf>
			drawFinderWnd(context);
    1bad:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1bb2:	89 04 24             	mov    %eax,(%esp)
    1bb5:	a1 f4 18 01 00       	mov    0x118f4,%eax
    1bba:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bbe:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1bc3:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bc7:	e8 e5 ec ff ff       	call   8b1 <drawFinderWnd>
			drawFinderContent(context);
    1bcc:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1bd1:	89 04 24             	mov    %eax,(%esp)
    1bd4:	a1 f4 18 01 00       	mov    0x118f4,%eax
    1bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bdd:	a1 f8 18 01 00       	mov    0x118f8,%eax
    1be2:	89 44 24 08          	mov    %eax,0x8(%esp)
    1be6:	e8 c8 ee ff ff       	call   ab3 <drawFinderContent>
			updateWindow(winid, context.addr, msg.msg_detail);
    1beb:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1bee:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1bf3:	89 54 24 08          	mov    %edx,0x8(%esp)
    1bf7:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bfe:	89 04 24             	mov    %eax,(%esp)
    1c01:	e8 45 21 00 00       	call   3d4b <updateWindow>
			break;
    1c06:	e9 04 01 00 00       	jmp    1d0f <main+0x34b>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    1c0b:	8b 75 cc             	mov    -0x34(%ebp),%esi
    1c0e:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    1c11:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1c14:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1c17:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1c1c:	89 74 24 14          	mov    %esi,0x14(%esp)
    1c20:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    1c24:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1c28:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c30:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c33:	89 04 24             	mov    %eax,(%esp)
    1c36:	e8 18 21 00 00       	call   3d53 <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    1c3b:	e9 cf 00 00 00       	jmp    1d0f <main+0x34b>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1c40:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1c43:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1c46:	8d 45 80             	lea    -0x80(%ebp),%eax
    1c49:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1c4d:	89 54 24 04          	mov    %edx,0x4(%esp)
    1c51:	89 04 24             	mov    %eax,(%esp)
    1c54:	e8 f5 16 00 00       	call   334e <initPoint>
    1c59:	83 ec 04             	sub    $0x4,%esp
    1c5c:	8b 45 80             	mov    -0x80(%ebp),%eax
    1c5f:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1c62:	89 45 b0             	mov    %eax,-0x50(%ebp)
    1c65:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    1c68:	8b 0d fc 18 01 00    	mov    0x118fc,%ecx
    1c6e:	8b 45 b0             	mov    -0x50(%ebp),%eax
    1c71:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    1c74:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c78:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c7c:	89 0c 24             	mov    %ecx,(%esp)
    1c7f:	e8 d4 19 00 00       	call   3658 <executeHandler>
    1c84:	85 c0                	test   %eax,%eax
    1c86:	74 1d                	je     1ca5 <main+0x2e1>

				updateWindow(winid, context.addr, msg.msg_detail);
    1c88:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1c8b:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1c90:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c94:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c9b:	89 04 24             	mov    %eax,(%esp)
    1c9e:	e8 a8 20 00 00       	call   3d4b <updateWindow>
			}
			break;
    1ca3:	eb 6a                	jmp    1d0f <main+0x34b>
    1ca5:	eb 68                	jmp    1d0f <main+0x34b>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1ca7:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1caa:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1cad:	8d 45 80             	lea    -0x80(%ebp),%eax
    1cb0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1cb4:	89 54 24 04          	mov    %edx,0x4(%esp)
    1cb8:	89 04 24             	mov    %eax,(%esp)
    1cbb:	e8 8e 16 00 00       	call   334e <initPoint>
    1cc0:	83 ec 04             	sub    $0x4,%esp
    1cc3:	8b 45 80             	mov    -0x80(%ebp),%eax
    1cc6:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1cc9:	89 45 b0             	mov    %eax,-0x50(%ebp)
    1ccc:	89 55 b4             	mov    %edx,-0x4c(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    1ccf:	8b 0d 04 19 01 00    	mov    0x11904,%ecx
    1cd5:	8b 45 b0             	mov    -0x50(%ebp),%eax
    1cd8:	8b 55 b4             	mov    -0x4c(%ebp),%edx
    1cdb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cdf:	89 54 24 08          	mov    %edx,0x8(%esp)
    1ce3:	89 0c 24             	mov    %ecx,(%esp)
    1ce6:	e8 6d 19 00 00       	call   3658 <executeHandler>
    1ceb:	85 c0                	test   %eax,%eax
    1ced:	74 1d                	je     1d0c <main+0x348>
				updateWindow(winid, context.addr, msg.msg_detail);
    1cef:	8b 55 bc             	mov    -0x44(%ebp),%edx
    1cf2:	a1 f0 18 01 00       	mov    0x118f0,%eax
    1cf7:	89 54 24 08          	mov    %edx,0x8(%esp)
    1cfb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d02:	89 04 24             	mov    %eax,(%esp)
    1d05:	e8 41 20 00 00       	call   3d4b <updateWindow>
			}
			break;
    1d0a:	eb 03                	jmp    1d0f <main+0x34b>
    1d0c:	eb 01                	jmp    1d0f <main+0x34b>
		default:
			break;
    1d0e:	90                   	nop
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    1d0f:	a1 40 e3 00 00       	mov    0xe340,%eax
    1d14:	85 c0                	test   %eax,%eax
    1d16:	0f 85 f5 fd ff ff    	jne    1b11 <main+0x14d>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    1d1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1d1f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d23:	c7 04 24 f0 18 01 00 	movl   $0x118f0,(%esp)
    1d2a:	e8 93 01 00 00       	call   1ec2 <free_context>
	exit();
    1d2f:	e8 5f 1f 00 00       	call   3c93 <exit>

00001d34 <testHandlers>:
}

void testHandlers() {
    1d34:	55                   	push   %ebp
    1d35:	89 e5                	mov    %esp,%ebp
    1d37:	83 ec 18             	sub    $0x18,%esp

	list(".");
    1d3a:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1d41:	e8 69 e4 ff ff       	call   1af <list>
	printf(0, "original list:\n");
    1d46:	c7 44 24 04 08 a6 00 	movl   $0xa608,0x4(%esp)
    1d4d:	00 
    1d4e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d55:	e8 21 21 00 00       	call   3e7b <printf>
	printItemList();
    1d5a:	e8 bf f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1d5f:	c7 44 24 04 18 a6 00 	movl   $0xa618,0x4(%esp)
    1d66:	00 
    1d67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d6e:	e8 08 21 00 00       	call   3e7b <printf>
	printf(0, "new a folder:\n");
    1d73:	c7 44 24 04 1a a6 00 	movl   $0xa61a,0x4(%esp)
    1d7a:	00 
    1d7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d82:	e8 f4 20 00 00       	call   3e7b <printf>
	newFolder("newfolder");
    1d87:	c7 04 24 29 a6 00 00 	movl   $0xa629,(%esp)
    1d8e:	e8 f9 f6 ff ff       	call   148c <newFolder>
	freeFileItemList();
    1d93:	e8 39 e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1d98:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1d9f:	e8 0b e4 ff ff       	call   1af <list>
	printItemList();
    1da4:	e8 75 f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1da9:	c7 44 24 04 18 a6 00 	movl   $0xa618,0x4(%esp)
    1db0:	00 
    1db1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1db8:	e8 be 20 00 00       	call   3e7b <printf>
	printf(0, "enter new folder:\n");
    1dbd:	c7 44 24 04 33 a6 00 	movl   $0xa633,0x4(%esp)
    1dc4:	00 
    1dc5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1dcc:	e8 aa 20 00 00       	call   3e7b <printf>
	enterDir("newfolder");
    1dd1:	c7 04 24 29 a6 00 00 	movl   $0xa629,(%esp)
    1dd8:	e8 ce f3 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    1ddd:	e8 ef e2 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1de2:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1de9:	e8 c1 e3 ff ff       	call   1af <list>
	printItemList();
    1dee:	e8 2b f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1df3:	c7 44 24 04 18 a6 00 	movl   $0xa618,0x4(%esp)
    1dfa:	00 
    1dfb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e02:	e8 74 20 00 00       	call   3e7b <printf>
	printf(0, "new a file:\n");
    1e07:	c7 44 24 04 46 a6 00 	movl   $0xa646,0x4(%esp)
    1e0e:	00 
    1e0f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e16:	e8 60 20 00 00       	call   3e7b <printf>
	newFile("newfile.txt");
    1e1b:	c7 04 24 53 a6 00 00 	movl   $0xa653,(%esp)
    1e22:	e8 9a f4 ff ff       	call   12c1 <newFile>
	freeFileItemList();
    1e27:	e8 a5 e2 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1e2c:	c7 04 24 6d a5 00 00 	movl   $0xa56d,(%esp)
    1e33:	e8 77 e3 ff ff       	call   1af <list>
	printItemList();
    1e38:	e8 e1 ef ff ff       	call   e1e <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    1e3d:	c9                   	leave  
    1e3e:	c3                   	ret    

00001e3f <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    1e3f:	55                   	push   %ebp
    1e40:	89 e5                	mov    %esp,%ebp
    1e42:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    1e45:	8b 45 08             	mov    0x8(%ebp),%eax
    1e48:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e4b:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    1e4e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e51:	8b 55 10             	mov    0x10(%ebp),%edx
    1e54:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    1e57:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e5a:	8b 45 10             	mov    0x10(%ebp),%eax
    1e5d:	0f af c2             	imul   %edx,%eax
    1e60:	01 c0                	add    %eax,%eax
    1e62:	89 04 24             	mov    %eax,(%esp)
    1e65:	e8 fd 22 00 00       	call   4167 <malloc>
    1e6a:	8b 55 08             	mov    0x8(%ebp),%edx
    1e6d:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    1e6f:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e72:	8b 45 10             	mov    0x10(%ebp),%eax
    1e75:	0f af c2             	imul   %edx,%eax
    1e78:	8d 14 00             	lea    (%eax,%eax,1),%edx
    1e7b:	8b 45 08             	mov    0x8(%ebp),%eax
    1e7e:	8b 00                	mov    (%eax),%eax
    1e80:	89 54 24 08          	mov    %edx,0x8(%esp)
    1e84:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e8b:	00 
    1e8c:	89 04 24             	mov    %eax,(%esp)
    1e8f:	e8 52 1c 00 00       	call   3ae6 <memset>
    initializeASCII();
    1e94:	e8 93 01 00 00       	call   202c <initializeASCII>
    initializeGBK();
    1e99:	e8 17 03 00 00       	call   21b5 <initializeGBK>
    return createWindow(0, 0, width, height);
    1e9e:	8b 45 10             	mov    0x10(%ebp),%eax
    1ea1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ea5:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ea8:	89 44 24 08          	mov    %eax,0x8(%esp)
    1eac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1eb3:	00 
    1eb4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ebb:	e8 7b 1e 00 00       	call   3d3b <createWindow>
}
    1ec0:	c9                   	leave  
    1ec1:	c3                   	ret    

00001ec2 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    1ec2:	55                   	push   %ebp
    1ec3:	89 e5                	mov    %esp,%ebp
    1ec5:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    1ec8:	8b 45 08             	mov    0x8(%ebp),%eax
    1ecb:	8b 00                	mov    (%eax),%eax
    1ecd:	89 04 24             	mov    %eax,(%esp)
    1ed0:	e8 59 21 00 00       	call   402e <free>
    freeASCII();
    1ed5:	e8 c6 02 00 00       	call   21a0 <freeASCII>
    freeGBK();
    1eda:	e8 7e 03 00 00       	call   225d <freeGBK>
    destroyWindow(winid);
    1edf:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ee2:	89 04 24             	mov    %eax,(%esp)
    1ee5:	e8 59 1e 00 00       	call   3d43 <destroyWindow>
}
    1eea:	c9                   	leave  
    1eeb:	c3                   	ret    

00001eec <draw_point>:
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    1eec:	55                   	push   %ebp
    1eed:	89 e5                	mov    %esp,%ebp
    1eef:	83 ec 04             	sub    $0x4,%esp
    1ef2:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1ef5:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width)
    1ef9:	8b 45 0c             	mov    0xc(%ebp),%eax
    1efc:	3b 45 14             	cmp    0x14(%ebp),%eax
    1eff:	77 02                	ja     1f03 <draw_point+0x17>
    return;
    1f01:	eb 26                	jmp    1f29 <draw_point+0x3d>
  if(y >= c.height)
    1f03:	8b 45 10             	mov    0x10(%ebp),%eax
    1f06:	3b 45 18             	cmp    0x18(%ebp),%eax
    1f09:	77 02                	ja     1f0d <draw_point+0x21>
    return;
    1f0b:	eb 1c                	jmp    1f29 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    1f0d:	8b 55 08             	mov    0x8(%ebp),%edx
    1f10:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f13:	0f af 45 18          	imul   0x18(%ebp),%eax
    1f17:	89 c1                	mov    %eax,%ecx
    1f19:	8b 45 14             	mov    0x14(%ebp),%eax
    1f1c:	01 c8                	add    %ecx,%eax
    1f1e:	01 c0                	add    %eax,%eax
    1f20:	01 c2                	add    %eax,%edx
    1f22:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    1f26:	66 89 02             	mov    %ax,(%edx)
}
    1f29:	c9                   	leave  
    1f2a:	c3                   	ret    

00001f2b <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    1f2b:	55                   	push   %ebp
    1f2c:	89 e5                	mov    %esp,%ebp
    1f2e:	83 ec 2c             	sub    $0x2c,%esp
    1f31:	8b 45 24             	mov    0x24(%ebp),%eax
    1f34:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    1f38:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1f3b:	8b 55 14             	mov    0x14(%ebp),%edx
    1f3e:	01 c2                	add    %eax,%edx
    1f40:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f43:	39 c2                	cmp    %eax,%edx
    1f45:	0f 46 c2             	cmovbe %edx,%eax
    1f48:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height;
    1f4b:	8b 45 20             	mov    0x20(%ebp),%eax
    1f4e:	8b 55 18             	mov    0x18(%ebp),%edx
    1f51:	01 c2                	add    %eax,%edx
    1f53:	8b 45 10             	mov    0x10(%ebp),%eax
    1f56:	39 c2                	cmp    %eax,%edx
    1f58:	0f 46 c2             	cmovbe %edx,%eax
    1f5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    1f5e:	8b 45 18             	mov    0x18(%ebp),%eax
    1f61:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1f64:	eb 47                	jmp    1fad <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    1f66:	8b 45 14             	mov    0x14(%ebp),%eax
    1f69:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1f6c:	eb 33                	jmp    1fa1 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    1f6e:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    1f72:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1f75:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f78:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1f7c:	89 54 24 10          	mov    %edx,0x10(%esp)
    1f80:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f84:	8b 45 08             	mov    0x8(%ebp),%eax
    1f87:	89 04 24             	mov    %eax,(%esp)
    1f8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f91:	8b 45 10             	mov    0x10(%ebp),%eax
    1f94:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f98:	e8 4f ff ff ff       	call   1eec <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    1f9d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1fa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1fa4:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1fa7:	7c c5                	jl     1f6e <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
    1fa9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1fad:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1fb0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1fb3:	7c b1                	jl     1f66 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    1fb5:	c9                   	leave  
    1fb6:	c3                   	ret    

00001fb7 <printBinary>:

void printBinary(char c)
{
    1fb7:	55                   	push   %ebp
    1fb8:	89 e5                	mov    %esp,%ebp
    1fba:	83 ec 28             	sub    $0x28,%esp
    1fbd:	8b 45 08             	mov    0x8(%ebp),%eax
    1fc0:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    1fc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1fca:	eb 44                	jmp    2010 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    1fcc:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    1fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1fd3:	89 c1                	mov    %eax,%ecx
    1fd5:	d3 e2                	shl    %cl,%edx
    1fd7:	89 d0                	mov    %edx,%eax
    1fd9:	25 80 00 00 00       	and    $0x80,%eax
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	74 16                	je     1ff8 <printBinary+0x41>
		{
			printf(0, "1");
    1fe2:	c7 44 24 04 5f a6 00 	movl   $0xa65f,0x4(%esp)
    1fe9:	00 
    1fea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ff1:	e8 85 1e 00 00       	call   3e7b <printf>
    1ff6:	eb 14                	jmp    200c <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    1ff8:	c7 44 24 04 61 a6 00 	movl   $0xa661,0x4(%esp)
    1fff:	00 
    2000:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2007:	e8 6f 1e 00 00       	call   3e7b <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    200c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2010:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    2014:	7e b6                	jle    1fcc <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    2016:	c7 44 24 04 63 a6 00 	movl   $0xa663,0x4(%esp)
    201d:	00 
    201e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2025:	e8 51 1e 00 00       	call   3e7b <printf>
}
    202a:	c9                   	leave  
    202b:	c3                   	ret    

0000202c <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    202c:	55                   	push   %ebp
    202d:	89 e5                	mov    %esp,%ebp
    202f:	56                   	push   %esi
    2030:	53                   	push   %ebx
    2031:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    2034:	c7 44 24 04 65 a6 00 	movl   $0xa665,0x4(%esp)
    203b:	00 
    203c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2043:	e8 33 1e 00 00       	call   3e7b <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    2048:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    204f:	00 
    2050:	c7 04 24 78 a6 00 00 	movl   $0xa678,(%esp)
    2057:	e8 77 1c 00 00       	call   3cd3 <open>
    205c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    205f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2063:	79 21                	jns    2086 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    2065:	c7 44 24 08 78 a6 00 	movl   $0xa678,0x8(%esp)
    206c:	00 
    206d:	c7 44 24 04 84 a6 00 	movl   $0xa684,0x4(%esp)
    2074:	00 
    2075:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    207c:	e8 fa 1d 00 00       	call   3e7b <printf>
	  return;
    2081:	e9 13 01 00 00       	jmp    2199 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    2086:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    208d:	e8 d5 20 00 00       	call   4167 <malloc>
    2092:	a3 20 19 01 00       	mov    %eax,0x11920
	for (i = 0; i < ASCII_NUM; i++)
    2097:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    209e:	eb 12                	jmp    20b2 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    20a0:	8b 15 20 19 01 00    	mov    0x11920,%edx
    20a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20a9:	01 d0                	add    %edx,%eax
    20ab:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    20ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    20b2:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    20b9:	7e e5                	jle    20a0 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    20bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    20c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    20c9:	e9 84 00 00 00       	jmp    2152 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    20ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    20d5:	eb 73                	jmp    214a <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    20d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20da:	05 40 19 01 00       	add    $0x11940,%eax
    20df:	0f b6 00             	movzbl (%eax),%eax
    20e2:	3c 2a                	cmp    $0x2a,%al
    20e4:	74 0f                	je     20f5 <initializeASCII+0xc9>
    20e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20e9:	05 40 19 01 00       	add    $0x11940,%eax
    20ee:	0f b6 00             	movzbl (%eax),%eax
    20f1:	3c 2e                	cmp    $0x2e,%al
    20f3:	75 51                	jne    2146 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    20f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20f8:	05 40 19 01 00       	add    $0x11940,%eax
    20fd:	0f b6 00             	movzbl (%eax),%eax
    2100:	3c 2a                	cmp    $0x2a,%al
    2102:	75 2d                	jne    2131 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    2104:	8b 15 20 19 01 00    	mov    0x11920,%edx
    210a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    210d:	01 c2                	add    %eax,%edx
    210f:	8b 0d 20 19 01 00    	mov    0x11920,%ecx
    2115:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2118:	01 c8                	add    %ecx,%eax
    211a:	0f b6 00             	movzbl (%eax),%eax
    211d:	89 c3                	mov    %eax,%ebx
    211f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2122:	be 80 00 00 00       	mov    $0x80,%esi
    2127:	89 c1                	mov    %eax,%ecx
    2129:	d3 fe                	sar    %cl,%esi
    212b:	89 f0                	mov    %esi,%eax
    212d:	09 d8                	or     %ebx,%eax
    212f:	88 02                	mov    %al,(%edx)
				}
				x ++;
    2131:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    2135:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2139:	7e 0b                	jle    2146 <initializeASCII+0x11a>
				{
					x = 0;
    213b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    2142:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    2146:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    214a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    214d:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2150:	7c 85                	jl     20d7 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2152:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    2159:	00 
    215a:	c7 44 24 04 40 19 01 	movl   $0x11940,0x4(%esp)
    2161:	00 
    2162:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2165:	89 04 24             	mov    %eax,(%esp)
    2168:	e8 3e 1b 00 00       	call   3cab <read>
    216d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2170:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2174:	0f 8f 54 ff ff ff    	jg     20ce <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    217a:	c7 44 24 04 94 a6 00 	movl   $0xa694,0x4(%esp)
    2181:	00 
    2182:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2189:	e8 ed 1c 00 00       	call   3e7b <printf>
	close(fd);
    218e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2191:	89 04 24             	mov    %eax,(%esp)
    2194:	e8 22 1b 00 00       	call   3cbb <close>
}
    2199:	83 c4 30             	add    $0x30,%esp
    219c:	5b                   	pop    %ebx
    219d:	5e                   	pop    %esi
    219e:	5d                   	pop    %ebp
    219f:	c3                   	ret    

000021a0 <freeASCII>:

void freeASCII(){
    21a0:	55                   	push   %ebp
    21a1:	89 e5                	mov    %esp,%ebp
    21a3:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    21a6:	a1 20 19 01 00       	mov    0x11920,%eax
    21ab:	89 04 24             	mov    %eax,(%esp)
    21ae:	e8 7b 1e 00 00       	call   402e <free>
}
    21b3:	c9                   	leave  
    21b4:	c3                   	ret    

000021b5 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    21b5:	55                   	push   %ebp
    21b6:	89 e5                	mov    %esp,%ebp
    21b8:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    21bb:	c7 44 24 04 b1 a6 00 	movl   $0xa6b1,0x4(%esp)
    21c2:	00 
    21c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21ca:	e8 ac 1c 00 00       	call   3e7b <printf>
	if((fd = open(HZK16, 0)) < 0){
    21cf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    21d6:	00 
    21d7:	c7 04 24 c2 a6 00 00 	movl   $0xa6c2,(%esp)
    21de:	e8 f0 1a 00 00       	call   3cd3 <open>
    21e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    21e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21ea:	79 1e                	jns    220a <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    21ec:	c7 44 24 08 c2 a6 00 	movl   $0xa6c2,0x8(%esp)
    21f3:	00 
    21f4:	c7 44 24 04 84 a6 00 	movl   $0xa684,0x4(%esp)
    21fb:	00 
    21fc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2203:	e8 73 1c 00 00       	call   3e7b <printf>
		return;
    2208:	eb 51                	jmp    225b <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    220a:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    2211:	e8 51 1f 00 00       	call   4167 <malloc>
    2216:	a3 24 19 01 00       	mov    %eax,0x11924
	fontFile.size = read(fd, fontFile.buf, 27000);
    221b:	a1 24 19 01 00       	mov    0x11924,%eax
    2220:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    2227:	00 
    2228:	89 44 24 04          	mov    %eax,0x4(%esp)
    222c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    222f:	89 04 24             	mov    %eax,(%esp)
    2232:	e8 74 1a 00 00       	call   3cab <read>
    2237:	a3 28 19 01 00       	mov    %eax,0x11928
	printf(0,"initialzing gbk complete!\n");
    223c:	c7 44 24 04 cc a6 00 	movl   $0xa6cc,0x4(%esp)
    2243:	00 
    2244:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    224b:	e8 2b 1c 00 00       	call   3e7b <printf>
	close(fd);
    2250:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2253:	89 04 24             	mov    %eax,(%esp)
    2256:	e8 60 1a 00 00       	call   3cbb <close>
}
    225b:	c9                   	leave  
    225c:	c3                   	ret    

0000225d <freeGBK>:

void freeGBK(){
    225d:	55                   	push   %ebp
    225e:	89 e5                	mov    %esp,%ebp
    2260:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    2263:	a1 24 19 01 00       	mov    0x11924,%eax
    2268:	89 04 24             	mov    %eax,(%esp)
    226b:	e8 be 1d 00 00       	call   402e <free>
}
    2270:	c9                   	leave  
    2271:	c3                   	ret    

00002272 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    2272:	55                   	push   %ebp
    2273:	89 e5                	mov    %esp,%ebp
    2275:	53                   	push   %ebx
    2276:	83 ec 30             	sub    $0x30,%esp
    2279:	8b 55 14             	mov    0x14(%ebp),%edx
    227c:	8b 45 18             	mov    0x18(%ebp),%eax
    227f:	88 55 e8             	mov    %dl,-0x18(%ebp)
    2282:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2286:	8b 45 20             	mov    0x20(%ebp),%eax
    2289:	89 45 f4             	mov    %eax,-0xc(%ebp)
    228c:	eb 7f                	jmp    230d <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    228e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2295:	eb 6c                	jmp    2303 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2297:	a1 20 19 01 00       	mov    0x11920,%eax
    229c:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    22a0:	c1 e2 04             	shl    $0x4,%edx
    22a3:	89 d1                	mov    %edx,%ecx
    22a5:	8b 55 20             	mov    0x20(%ebp),%edx
    22a8:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    22ab:	29 d3                	sub    %edx,%ebx
    22ad:	89 da                	mov    %ebx,%edx
    22af:	01 ca                	add    %ecx,%edx
    22b1:	01 d0                	add    %edx,%eax
    22b3:	0f b6 00             	movzbl (%eax),%eax
    22b6:	0f b6 d0             	movzbl %al,%edx
    22b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22bc:	89 c1                	mov    %eax,%ecx
    22be:	d3 e2                	shl    %cl,%edx
    22c0:	89 d0                	mov    %edx,%eax
    22c2:	25 80 00 00 00       	and    $0x80,%eax
    22c7:	85 c0                	test   %eax,%eax
    22c9:	74 34                	je     22ff <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    22cb:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    22cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    22d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    22d5:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    22d8:	01 d8                	add    %ebx,%eax
    22da:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    22de:	89 54 24 10          	mov    %edx,0x10(%esp)
    22e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22e6:	8b 45 08             	mov    0x8(%ebp),%eax
    22e9:	89 04 24             	mov    %eax,(%esp)
    22ec:	8b 45 0c             	mov    0xc(%ebp),%eax
    22ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    22f3:	8b 45 10             	mov    0x10(%ebp),%eax
    22f6:	89 44 24 08          	mov    %eax,0x8(%esp)
    22fa:	e8 ed fb ff ff       	call   1eec <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    22ff:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2303:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2307:	7e 8e                	jle    2297 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    2309:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    230d:	8b 45 20             	mov    0x20(%ebp),%eax
    2310:	83 c0 10             	add    $0x10,%eax
    2313:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2316:	0f 8f 72 ff ff ff    	jg     228e <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    231c:	83 c4 30             	add    $0x30,%esp
    231f:	5b                   	pop    %ebx
    2320:	5d                   	pop    %ebp
    2321:	c3                   	ret    

00002322 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    2322:	55                   	push   %ebp
    2323:	89 e5                	mov    %esp,%ebp
    2325:	53                   	push   %ebx
    2326:	83 ec 34             	sub    $0x34,%esp
    2329:	8b 55 14             	mov    0x14(%ebp),%edx
    232c:	8b 45 18             	mov    0x18(%ebp),%eax
    232f:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    2333:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2337:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    233b:	0f b6 c0             	movzbl %al,%eax
    233e:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2343:	0f 8e 40 01 00 00    	jle    2489 <put_gbk+0x167>
    2349:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    234d:	66 c1 f8 08          	sar    $0x8,%ax
    2351:	98                   	cwtl   
    2352:	0f b6 c0             	movzbl %al,%eax
    2355:	3d a0 00 00 00       	cmp    $0xa0,%eax
    235a:	0f 8e 29 01 00 00    	jle    2489 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    2360:	a1 24 19 01 00       	mov    0x11924,%eax
    2365:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2368:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    236c:	0f b6 c0             	movzbl %al,%eax
    236f:	2d a1 00 00 00       	sub    $0xa1,%eax
    2374:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2377:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    237b:	66 c1 fa 08          	sar    $0x8,%dx
    237f:	0f bf d2             	movswl %dx,%edx
    2382:	0f b6 d2             	movzbl %dl,%edx
    2385:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    238b:	01 d0                	add    %edx,%eax
    238d:	c1 e0 05             	shl    $0x5,%eax
    2390:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2393:	8b 45 20             	mov    0x20(%ebp),%eax
    2396:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2399:	e9 da 00 00 00       	jmp    2478 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    239e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    23a5:	eb 58                	jmp    23ff <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    23a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    23ad:	01 d0                	add    %edx,%eax
    23af:	0f b6 00             	movzbl (%eax),%eax
    23b2:	0f b6 d0             	movzbl %al,%edx
    23b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23b8:	89 c1                	mov    %eax,%ecx
    23ba:	d3 e2                	shl    %cl,%edx
    23bc:	89 d0                	mov    %edx,%eax
    23be:	25 80 00 00 00       	and    $0x80,%eax
    23c3:	85 c0                	test   %eax,%eax
    23c5:	74 34                	je     23fb <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    23c7:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    23cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    23ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23d1:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    23d4:	01 d8                	add    %ebx,%eax
    23d6:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    23da:	89 54 24 10          	mov    %edx,0x10(%esp)
    23de:	89 44 24 0c          	mov    %eax,0xc(%esp)
    23e2:	8b 45 08             	mov    0x8(%ebp),%eax
    23e5:	89 04 24             	mov    %eax,(%esp)
    23e8:	8b 45 0c             	mov    0xc(%ebp),%eax
    23eb:	89 44 24 04          	mov    %eax,0x4(%esp)
    23ef:	8b 45 10             	mov    0x10(%ebp),%eax
    23f2:	89 44 24 08          	mov    %eax,0x8(%esp)
    23f6:	e8 f1 fa ff ff       	call   1eec <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    23fb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    23ff:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2403:	7e a2                	jle    23a7 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    2405:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2409:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2410:	eb 58                	jmp    246a <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2412:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2415:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2418:	01 d0                	add    %edx,%eax
    241a:	0f b6 00             	movzbl (%eax),%eax
    241d:	0f b6 d0             	movzbl %al,%edx
    2420:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2423:	89 c1                	mov    %eax,%ecx
    2425:	d3 e2                	shl    %cl,%edx
    2427:	89 d0                	mov    %edx,%eax
    2429:	25 80 00 00 00       	and    $0x80,%eax
    242e:	85 c0                	test   %eax,%eax
    2430:	74 34                	je     2466 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2432:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2436:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2439:	8b 45 f8             	mov    -0x8(%ebp),%eax
    243c:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    243f:	01 d8                	add    %ebx,%eax
    2441:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2445:	89 54 24 10          	mov    %edx,0x10(%esp)
    2449:	89 44 24 0c          	mov    %eax,0xc(%esp)
    244d:	8b 45 08             	mov    0x8(%ebp),%eax
    2450:	89 04 24             	mov    %eax,(%esp)
    2453:	8b 45 0c             	mov    0xc(%ebp),%eax
    2456:	89 44 24 04          	mov    %eax,0x4(%esp)
    245a:	8b 45 10             	mov    0x10(%ebp),%eax
    245d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2461:	e8 86 fa ff ff       	call   1eec <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2466:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    246a:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    246e:	7e a2                	jle    2412 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2470:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    2474:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2478:	8b 45 20             	mov    0x20(%ebp),%eax
    247b:	83 c0 10             	add    $0x10,%eax
    247e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2481:	0f 8f 17 ff ff ff    	jg     239e <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2487:	eb 7b                	jmp    2504 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2489:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    248d:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2491:	0f b6 c0             	movzbl %al,%eax
    2494:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2497:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    249b:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    249e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    24a2:	89 54 24 10          	mov    %edx,0x10(%esp)
    24a6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24aa:	8b 45 08             	mov    0x8(%ebp),%eax
    24ad:	89 04 24             	mov    %eax,(%esp)
    24b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    24b3:	89 44 24 04          	mov    %eax,0x4(%esp)
    24b7:	8b 45 10             	mov    0x10(%ebp),%eax
    24ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    24be:	e8 af fd ff ff       	call   2272 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    24c3:	8b 45 1c             	mov    0x1c(%ebp),%eax
    24c6:	8d 58 08             	lea    0x8(%eax),%ebx
    24c9:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    24cd:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    24d1:	66 c1 f8 08          	sar    $0x8,%ax
    24d5:	0f b6 c0             	movzbl %al,%eax
    24d8:	8b 4d 20             	mov    0x20(%ebp),%ecx
    24db:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    24df:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    24e3:	89 54 24 10          	mov    %edx,0x10(%esp)
    24e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24eb:	8b 45 08             	mov    0x8(%ebp),%eax
    24ee:	89 04 24             	mov    %eax,(%esp)
    24f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    24f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    24f8:	8b 45 10             	mov    0x10(%ebp),%eax
    24fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    24ff:	e8 6e fd ff ff       	call   2272 <put_ascii>
	}
}
    2504:	83 c4 34             	add    $0x34,%esp
    2507:	5b                   	pop    %ebx
    2508:	5d                   	pop    %ebp
    2509:	c3                   	ret    

0000250a <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    250a:	55                   	push   %ebp
    250b:	89 e5                	mov    %esp,%ebp
    250d:	83 ec 38             	sub    $0x38,%esp
    2510:	8b 45 18             	mov    0x18(%ebp),%eax
    2513:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    2517:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    251e:	8b 45 14             	mov    0x14(%ebp),%eax
    2521:	89 04 24             	mov    %eax,(%esp)
    2524:	e8 96 15 00 00       	call   3abf <strlen>
    2529:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    252c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2533:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2536:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2539:	eb 49                	jmp    2584 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    253b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    253f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    2542:	8b 45 14             	mov    0x14(%ebp),%eax
    2545:	01 c8                	add    %ecx,%eax
    2547:	0f b6 00             	movzbl (%eax),%eax
    254a:	0f b6 c0             	movzbl %al,%eax
    254d:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2550:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2554:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    2557:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    255b:	89 54 24 10          	mov    %edx,0x10(%esp)
    255f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2563:	8b 45 08             	mov    0x8(%ebp),%eax
    2566:	89 04 24             	mov    %eax,(%esp)
    2569:	8b 45 0c             	mov    0xc(%ebp),%eax
    256c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2570:	8b 45 10             	mov    0x10(%ebp),%eax
    2573:	89 44 24 08          	mov    %eax,0x8(%esp)
    2577:	e8 f6 fc ff ff       	call   2272 <put_ascii>
			xTmp += 8;
    257c:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2580:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    2584:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2587:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    258a:	72 af                	jb     253b <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    258c:	c9                   	leave  
    258d:	c3                   	ret    

0000258e <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    258e:	55                   	push   %ebp
    258f:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    2591:	8b 45 10             	mov    0x10(%ebp),%eax
    2594:	8d 50 07             	lea    0x7(%eax),%edx
    2597:	85 c0                	test   %eax,%eax
    2599:	0f 48 c2             	cmovs  %edx,%eax
    259c:	c1 f8 03             	sar    $0x3,%eax
    259f:	89 c2                	mov    %eax,%edx
    25a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    25a4:	8d 48 03             	lea    0x3(%eax),%ecx
    25a7:	85 c0                	test   %eax,%eax
    25a9:	0f 48 c1             	cmovs  %ecx,%eax
    25ac:	c1 f8 02             	sar    $0x2,%eax
    25af:	c1 e0 05             	shl    $0x5,%eax
    25b2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    25b5:	8b 45 08             	mov    0x8(%ebp),%eax
    25b8:	8d 50 07             	lea    0x7(%eax),%edx
    25bb:	85 c0                	test   %eax,%eax
    25bd:	0f 48 c2             	cmovs  %edx,%eax
    25c0:	c1 f8 03             	sar    $0x3,%eax
    25c3:	c1 e0 0b             	shl    $0xb,%eax
    25c6:	01 c8                	add    %ecx,%eax
}
    25c8:	5d                   	pop    %ebp
    25c9:	c3                   	ret    

000025ca <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    25ca:	55                   	push   %ebp
    25cb:	89 e5                	mov    %esp,%ebp
    25cd:	53                   	push   %ebx
    25ce:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    25d1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    25d8:	e9 b1 00 00 00       	jmp    268e <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    25dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    25e4:	e9 95 00 00 00       	jmp    267e <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    25e9:	8b 55 14             	mov    0x14(%ebp),%edx
    25ec:	8b 45 18             	mov    0x18(%ebp),%eax
    25ef:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    25f3:	89 c1                	mov    %eax,%ecx
    25f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25f8:	01 c8                	add    %ecx,%eax
    25fa:	c1 e0 02             	shl    $0x2,%eax
    25fd:	01 d0                	add    %edx,%eax
    25ff:	8b 00                	mov    (%eax),%eax
    2601:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    2604:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    2608:	3c 01                	cmp    $0x1,%al
    260a:	75 02                	jne    260e <draw_picture+0x44>
    260c:	eb 6c                	jmp    267a <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    260e:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    2612:	0f b6 c8             	movzbl %al,%ecx
    2615:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    2619:	0f b6 d0             	movzbl %al,%edx
    261c:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    2620:	0f b6 c0             	movzbl %al,%eax
    2623:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    2627:	89 54 24 04          	mov    %edx,0x4(%esp)
    262b:	89 04 24             	mov    %eax,(%esp)
    262e:	e8 5b ff ff ff       	call   258e <_RGB16BIT565>
    2633:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2637:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    263b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    263e:	83 e8 01             	sub    $0x1,%eax
    2641:	2b 45 f8             	sub    -0x8(%ebp),%eax
    2644:	89 c2                	mov    %eax,%edx
    2646:	8b 45 24             	mov    0x24(%ebp),%eax
    2649:	01 d0                	add    %edx,%eax
    264b:	89 c2                	mov    %eax,%edx
    264d:	8b 45 20             	mov    0x20(%ebp),%eax
    2650:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2653:	01 d8                	add    %ebx,%eax
    2655:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2659:	89 54 24 10          	mov    %edx,0x10(%esp)
    265d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2661:	8b 45 08             	mov    0x8(%ebp),%eax
    2664:	89 04 24             	mov    %eax,(%esp)
    2667:	8b 45 0c             	mov    0xc(%ebp),%eax
    266a:	89 44 24 04          	mov    %eax,0x4(%esp)
    266e:	8b 45 10             	mov    0x10(%ebp),%eax
    2671:	89 44 24 08          	mov    %eax,0x8(%esp)
    2675:	e8 72 f8 ff ff       	call   1eec <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    267a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    267e:	8b 45 18             	mov    0x18(%ebp),%eax
    2681:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2684:	0f 8f 5f ff ff ff    	jg     25e9 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    268a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    268e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2691:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    2694:	0f 8f 43 ff ff ff    	jg     25dd <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    269a:	83 c4 28             	add    $0x28,%esp
    269d:	5b                   	pop    %ebx
    269e:	5d                   	pop    %ebp
    269f:	c3                   	ret    

000026a0 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    26a0:	55                   	push   %ebp
    26a1:	89 e5                	mov    %esp,%ebp
    26a3:	83 ec 3c             	sub    $0x3c,%esp
    26a6:	8b 45 24             	mov    0x24(%ebp),%eax
    26a9:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    26ad:	8b 45 14             	mov    0x14(%ebp),%eax
    26b0:	8b 55 1c             	mov    0x1c(%ebp),%edx
    26b3:	29 c2                	sub    %eax,%edx
    26b5:	89 d0                	mov    %edx,%eax
    26b7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    26ba:	8b 45 18             	mov    0x18(%ebp),%eax
    26bd:	8b 55 20             	mov    0x20(%ebp),%edx
    26c0:	29 c2                	sub    %eax,%edx
    26c2:	89 d0                	mov    %edx,%eax
    26c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    26c7:	8b 45 14             	mov    0x14(%ebp),%eax
    26ca:	c1 e0 0a             	shl    $0xa,%eax
    26cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    26d0:	8b 45 18             	mov    0x18(%ebp),%eax
    26d3:	c1 e0 0a             	shl    $0xa,%eax
    26d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    26d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26dc:	c1 f8 1f             	sar    $0x1f,%eax
    26df:	31 45 fc             	xor    %eax,-0x4(%ebp)
    26e2:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    26e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    26e8:	c1 f8 1f             	sar    $0x1f,%eax
    26eb:	31 45 f8             	xor    %eax,-0x8(%ebp)
    26ee:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    26f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26f4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    26f7:	7c 57                	jl     2750 <draw_line+0xb0>
		len = dx + 1;
    26f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26fc:	83 c0 01             	add    $0x1,%eax
    26ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    2702:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2705:	3b 45 14             	cmp    0x14(%ebp),%eax
    2708:	7e 07                	jle    2711 <draw_line+0x71>
    270a:	b8 00 04 00 00       	mov    $0x400,%eax
    270f:	eb 05                	jmp    2716 <draw_line+0x76>
    2711:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2716:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    2719:	8b 45 20             	mov    0x20(%ebp),%eax
    271c:	3b 45 18             	cmp    0x18(%ebp),%eax
    271f:	7c 16                	jl     2737 <draw_line+0x97>
    2721:	8b 45 18             	mov    0x18(%ebp),%eax
    2724:	8b 55 20             	mov    0x20(%ebp),%edx
    2727:	29 c2                	sub    %eax,%edx
    2729:	89 d0                	mov    %edx,%eax
    272b:	83 c0 01             	add    $0x1,%eax
    272e:	c1 e0 0a             	shl    $0xa,%eax
    2731:	99                   	cltd   
    2732:	f7 7d ec             	idivl  -0x14(%ebp)
    2735:	eb 14                	jmp    274b <draw_line+0xab>
    2737:	8b 45 18             	mov    0x18(%ebp),%eax
    273a:	8b 55 20             	mov    0x20(%ebp),%edx
    273d:	29 c2                	sub    %eax,%edx
    273f:	89 d0                	mov    %edx,%eax
    2741:	83 e8 01             	sub    $0x1,%eax
    2744:	c1 e0 0a             	shl    $0xa,%eax
    2747:	99                   	cltd   
    2748:	f7 7d ec             	idivl  -0x14(%ebp)
    274b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    274e:	eb 55                	jmp    27a5 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    2750:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2753:	83 c0 01             	add    $0x1,%eax
    2756:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    2759:	8b 45 20             	mov    0x20(%ebp),%eax
    275c:	3b 45 18             	cmp    0x18(%ebp),%eax
    275f:	7e 07                	jle    2768 <draw_line+0xc8>
    2761:	b8 00 04 00 00       	mov    $0x400,%eax
    2766:	eb 05                	jmp    276d <draw_line+0xcd>
    2768:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    276d:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2770:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2773:	3b 45 14             	cmp    0x14(%ebp),%eax
    2776:	7c 16                	jl     278e <draw_line+0xee>
    2778:	8b 45 14             	mov    0x14(%ebp),%eax
    277b:	8b 55 1c             	mov    0x1c(%ebp),%edx
    277e:	29 c2                	sub    %eax,%edx
    2780:	89 d0                	mov    %edx,%eax
    2782:	83 c0 01             	add    $0x1,%eax
    2785:	c1 e0 0a             	shl    $0xa,%eax
    2788:	99                   	cltd   
    2789:	f7 7d ec             	idivl  -0x14(%ebp)
    278c:	eb 14                	jmp    27a2 <draw_line+0x102>
    278e:	8b 45 14             	mov    0x14(%ebp),%eax
    2791:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2794:	29 c2                	sub    %eax,%edx
    2796:	89 d0                	mov    %edx,%eax
    2798:	83 e8 01             	sub    $0x1,%eax
    279b:	c1 e0 0a             	shl    $0xa,%eax
    279e:	99                   	cltd   
    279f:	f7 7d ec             	idivl  -0x14(%ebp)
    27a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    27a5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    27ac:	eb 47                	jmp    27f5 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    27ae:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    27b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27b5:	c1 f8 0a             	sar    $0xa,%eax
    27b8:	89 c2                	mov    %eax,%edx
    27ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27bd:	c1 f8 0a             	sar    $0xa,%eax
    27c0:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    27c4:	89 54 24 10          	mov    %edx,0x10(%esp)
    27c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    27cc:	8b 45 08             	mov    0x8(%ebp),%eax
    27cf:	89 04 24             	mov    %eax,(%esp)
    27d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    27d5:	89 44 24 04          	mov    %eax,0x4(%esp)
    27d9:	8b 45 10             	mov    0x10(%ebp),%eax
    27dc:	89 44 24 08          	mov    %eax,0x8(%esp)
    27e0:	e8 07 f7 ff ff       	call   1eec <draw_point>
		y += dy;
    27e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27e8:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    27eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27ee:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    27f1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    27f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27f8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    27fb:	7c b1                	jl     27ae <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    27fd:	c9                   	leave  
    27fe:	c3                   	ret    

000027ff <draw_window>:

void
draw_window(Context c, char *title)
{
    27ff:	55                   	push   %ebp
    2800:	89 e5                	mov    %esp,%ebp
    2802:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    2805:	8b 45 0c             	mov    0xc(%ebp),%eax
    2808:	83 e8 01             	sub    $0x1,%eax
    280b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2812:	00 
    2813:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    281a:	00 
    281b:	89 44 24 14          	mov    %eax,0x14(%esp)
    281f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2826:	00 
    2827:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    282e:	00 
    282f:	8b 45 08             	mov    0x8(%ebp),%eax
    2832:	89 04 24             	mov    %eax,(%esp)
    2835:	8b 45 0c             	mov    0xc(%ebp),%eax
    2838:	89 44 24 04          	mov    %eax,0x4(%esp)
    283c:	8b 45 10             	mov    0x10(%ebp),%eax
    283f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2843:	e8 58 fe ff ff       	call   26a0 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    2848:	8b 45 10             	mov    0x10(%ebp),%eax
    284b:	8d 48 ff             	lea    -0x1(%eax),%ecx
    284e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2851:	8d 50 ff             	lea    -0x1(%eax),%edx
    2854:	8b 45 0c             	mov    0xc(%ebp),%eax
    2857:	83 e8 01             	sub    $0x1,%eax
    285a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2861:	00 
    2862:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2866:	89 54 24 14          	mov    %edx,0x14(%esp)
    286a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    2871:	00 
    2872:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2876:	8b 45 08             	mov    0x8(%ebp),%eax
    2879:	89 04 24             	mov    %eax,(%esp)
    287c:	8b 45 0c             	mov    0xc(%ebp),%eax
    287f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2883:	8b 45 10             	mov    0x10(%ebp),%eax
    2886:	89 44 24 08          	mov    %eax,0x8(%esp)
    288a:	e8 11 fe ff ff       	call   26a0 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    288f:	8b 45 10             	mov    0x10(%ebp),%eax
    2892:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2895:	8b 45 10             	mov    0x10(%ebp),%eax
    2898:	8d 50 ff             	lea    -0x1(%eax),%edx
    289b:	8b 45 0c             	mov    0xc(%ebp),%eax
    289e:	83 e8 01             	sub    $0x1,%eax
    28a1:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    28a8:	00 
    28a9:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    28ad:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    28b4:	00 
    28b5:	89 54 24 10          	mov    %edx,0x10(%esp)
    28b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    28bd:	8b 45 08             	mov    0x8(%ebp),%eax
    28c0:	89 04 24             	mov    %eax,(%esp)
    28c3:	8b 45 0c             	mov    0xc(%ebp),%eax
    28c6:	89 44 24 04          	mov    %eax,0x4(%esp)
    28ca:	8b 45 10             	mov    0x10(%ebp),%eax
    28cd:	89 44 24 08          	mov    %eax,0x8(%esp)
    28d1:	e8 ca fd ff ff       	call   26a0 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    28d6:	8b 45 10             	mov    0x10(%ebp),%eax
    28d9:	83 e8 01             	sub    $0x1,%eax
    28dc:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    28e3:	00 
    28e4:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    28eb:	00 
    28ec:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    28f3:	00 
    28f4:	89 44 24 10          	mov    %eax,0x10(%esp)
    28f8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    28ff:	00 
    2900:	8b 45 08             	mov    0x8(%ebp),%eax
    2903:	89 04 24             	mov    %eax,(%esp)
    2906:	8b 45 0c             	mov    0xc(%ebp),%eax
    2909:	89 44 24 04          	mov    %eax,0x4(%esp)
    290d:	8b 45 10             	mov    0x10(%ebp),%eax
    2910:	89 44 24 08          	mov    %eax,0x8(%esp)
    2914:	e8 87 fd ff ff       	call   26a0 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    2919:	8b 45 0c             	mov    0xc(%ebp),%eax
    291c:	83 e8 02             	sub    $0x2,%eax
    291f:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2926:	00 
    2927:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    292e:	00 
    292f:	89 44 24 14          	mov    %eax,0x14(%esp)
    2933:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    293a:	00 
    293b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2942:	00 
    2943:	8b 45 08             	mov    0x8(%ebp),%eax
    2946:	89 04 24             	mov    %eax,(%esp)
    2949:	8b 45 0c             	mov    0xc(%ebp),%eax
    294c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2950:	8b 45 10             	mov    0x10(%ebp),%eax
    2953:	89 44 24 08          	mov    %eax,0x8(%esp)
    2957:	e8 cf f5 ff ff       	call   1f2b <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    295c:	8b 45 0c             	mov    0xc(%ebp),%eax
    295f:	83 e8 02             	sub    $0x2,%eax
    2962:	89 c2                	mov    %eax,%edx
    2964:	8b 45 10             	mov    0x10(%ebp),%eax
    2967:	83 e8 15             	sub    $0x15,%eax
    296a:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    2971:	00 
    2972:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    2979:	00 
    297a:	89 54 24 14          	mov    %edx,0x14(%esp)
    297e:	89 44 24 10          	mov    %eax,0x10(%esp)
    2982:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2989:	00 
    298a:	8b 45 08             	mov    0x8(%ebp),%eax
    298d:	89 04 24             	mov    %eax,(%esp)
    2990:	8b 45 0c             	mov    0xc(%ebp),%eax
    2993:	89 44 24 04          	mov    %eax,0x4(%esp)
    2997:	8b 45 10             	mov    0x10(%ebp),%eax
    299a:	89 44 24 08          	mov    %eax,0x8(%esp)
    299e:	e8 88 f5 ff ff       	call   1f2b <fill_rect>

  loadBitmap(&pic, "close.bmp");
    29a3:	c7 44 24 04 e7 a6 00 	movl   $0xa6e7,0x4(%esp)
    29aa:	00 
    29ab:	8d 45 ec             	lea    -0x14(%ebp),%eax
    29ae:	89 04 24             	mov    %eax,(%esp)
    29b1:	e8 44 01 00 00       	call   2afa <loadBitmap>
  draw_picture(c, pic, 3, 3);
    29b6:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    29bd:	00 
    29be:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    29c5:	00 
    29c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    29c9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    29cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    29d0:	89 44 24 10          	mov    %eax,0x10(%esp)
    29d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29d7:	89 44 24 14          	mov    %eax,0x14(%esp)
    29db:	8b 45 08             	mov    0x8(%ebp),%eax
    29de:	89 04 24             	mov    %eax,(%esp)
    29e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    29e4:	89 44 24 04          	mov    %eax,0x4(%esp)
    29e8:	8b 45 10             	mov    0x10(%ebp),%eax
    29eb:	89 44 24 08          	mov    %eax,0x8(%esp)
    29ef:	e8 d6 fb ff ff       	call   25ca <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    29f4:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    29fb:	00 
    29fc:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    2a03:	00 
    2a04:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    2a0b:	00 
    2a0c:	8b 45 14             	mov    0x14(%ebp),%eax
    2a0f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2a13:	8b 45 08             	mov    0x8(%ebp),%eax
    2a16:	89 04 24             	mov    %eax,(%esp)
    2a19:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a20:	8b 45 10             	mov    0x10(%ebp),%eax
    2a23:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a27:	e8 de fa ff ff       	call   250a <puts_str>
  freepic(&pic);
    2a2c:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2a2f:	89 04 24             	mov    %eax,(%esp)
    2a32:	e8 6f 06 00 00       	call   30a6 <freepic>
}
    2a37:	c9                   	leave  
    2a38:	c3                   	ret    

00002a39 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2a39:	55                   	push   %ebp
    2a3a:	89 e5                	mov    %esp,%ebp
    2a3c:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    2a3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a46:	eb 29                	jmp    2a71 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a4b:	6b d0 34             	imul   $0x34,%eax,%edx
    2a4e:	8b 45 08             	mov    0x8(%ebp),%eax
    2a51:	01 d0                	add    %edx,%eax
    2a53:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a56:	6b ca 34             	imul   $0x34,%edx,%ecx
    2a59:	8b 55 08             	mov    0x8(%ebp),%edx
    2a5c:	01 ca                	add    %ecx,%edx
    2a5e:	83 c2 28             	add    $0x28,%edx
    2a61:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a65:	89 14 24             	mov    %edx,(%esp)
    2a68:	e8 8d 00 00 00       	call   2afa <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2a6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a74:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2a77:	7c cf                	jl     2a48 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2a79:	c9                   	leave  
    2a7a:	c3                   	ret    

00002a7b <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2a7b:	55                   	push   %ebp
    2a7c:	89 e5                	mov    %esp,%ebp
    2a7e:	53                   	push   %ebx
    2a7f:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    2a82:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2a89:	eb 61                	jmp    2aec <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2a8b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a8e:	6b d0 34             	imul   $0x34,%eax,%edx
    2a91:	8b 45 14             	mov    0x14(%ebp),%eax
    2a94:	01 d0                	add    %edx,%eax
    2a96:	8b 48 24             	mov    0x24(%eax),%ecx
    2a99:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a9c:	6b d0 34             	imul   $0x34,%eax,%edx
    2a9f:	8b 45 14             	mov    0x14(%ebp),%eax
    2aa2:	01 d0                	add    %edx,%eax
    2aa4:	8b 50 20             	mov    0x20(%eax),%edx
    2aa7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2aaa:	6b d8 34             	imul   $0x34,%eax,%ebx
    2aad:	8b 45 14             	mov    0x14(%ebp),%eax
    2ab0:	01 d8                	add    %ebx,%eax
    2ab2:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2ab6:	89 54 24 18          	mov    %edx,0x18(%esp)
    2aba:	8b 50 28             	mov    0x28(%eax),%edx
    2abd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2ac1:	8b 50 2c             	mov    0x2c(%eax),%edx
    2ac4:	89 54 24 10          	mov    %edx,0x10(%esp)
    2ac8:	8b 40 30             	mov    0x30(%eax),%eax
    2acb:	89 44 24 14          	mov    %eax,0x14(%esp)
    2acf:	8b 45 08             	mov    0x8(%ebp),%eax
    2ad2:	89 04 24             	mov    %eax,(%esp)
    2ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ad8:	89 44 24 04          	mov    %eax,0x4(%esp)
    2adc:	8b 45 10             	mov    0x10(%ebp),%eax
    2adf:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ae3:	e8 e2 fa ff ff       	call   25ca <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2ae8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2aec:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2aef:	3b 45 18             	cmp    0x18(%ebp),%eax
    2af2:	7c 97                	jl     2a8b <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2af4:	83 c4 30             	add    $0x30,%esp
    2af7:	5b                   	pop    %ebx
    2af8:	5d                   	pop    %ebp
    2af9:	c3                   	ret    

00002afa <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2afa:	55                   	push   %ebp
    2afb:	89 e5                	mov    %esp,%ebp
    2afd:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2b03:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2b0a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2b11:	00 
    2b12:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b15:	89 04 24             	mov    %eax,(%esp)
    2b18:	e8 b6 11 00 00       	call   3cd3 <open>
    2b1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b20:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2b24:	79 20                	jns    2b46 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    2b26:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b29:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b2d:	c7 44 24 04 f4 a6 00 	movl   $0xa6f4,0x4(%esp)
    2b34:	00 
    2b35:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b3c:	e8 3a 13 00 00       	call   3e7b <printf>
		return;
    2b41:	e9 ef 02 00 00       	jmp    2e35 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    2b46:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b49:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b4d:	c7 44 24 04 04 a7 00 	movl   $0xa704,0x4(%esp)
    2b54:	00 
    2b55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b5c:	e8 1a 13 00 00       	call   3e7b <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2b61:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    2b68:	e8 fa 15 00 00       	call   4167 <malloc>
    2b6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2b70:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    2b77:	00 
    2b78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b7b:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b82:	89 04 24             	mov    %eax,(%esp)
    2b85:	e8 21 11 00 00       	call   3cab <read>
    2b8a:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    2b8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b90:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2b93:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b96:	0f b7 00             	movzwl (%eax),%eax
    2b99:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    2b9d:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2ba1:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2ba5:	74 19                	je     2bc0 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    2ba7:	c7 44 24 04 18 a7 00 	movl   $0xa718,0x4(%esp)
    2bae:	00 
    2baf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bb6:	e8 c0 12 00 00       	call   3e7b <printf>
		return;
    2bbb:	e9 75 02 00 00       	jmp    2e35 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2bc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bc3:	83 c0 02             	add    $0x2,%eax
    2bc6:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    2bc9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2bcc:	8b 00                	mov    (%eax),%eax
    2bce:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2bd1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bd4:	83 c0 06             	add    $0x6,%eax
    2bd7:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    2bda:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2bdd:	0f b7 00             	movzwl (%eax),%eax
    2be0:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2be4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2be7:	83 c0 08             	add    $0x8,%eax
    2bea:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    2bed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2bf0:	0f b7 00             	movzwl (%eax),%eax
    2bf3:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2bf7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bfa:	83 c0 0a             	add    $0xa,%eax
    2bfd:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    2c00:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2c03:	8b 00                	mov    (%eax),%eax
    2c05:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    2c08:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    2c0f:	00 
    2c10:	8d 45 84             	lea    -0x7c(%ebp),%eax
    2c13:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c17:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2c1a:	89 04 24             	mov    %eax,(%esp)
    2c1d:	e8 89 10 00 00       	call   3cab <read>
	width = bitInfoHead.biWidth;
    2c22:	8b 45 88             	mov    -0x78(%ebp),%eax
    2c25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    2c28:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2c2b:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    2c2e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2c31:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    2c35:	c1 e0 02             	shl    $0x2,%eax
    2c38:	89 44 24 10          	mov    %eax,0x10(%esp)
    2c3c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c3f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2c43:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2c46:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c4a:	c7 44 24 04 30 a7 00 	movl   $0xa730,0x4(%esp)
    2c51:	00 
    2c52:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c59:	e8 1d 12 00 00       	call   3e7b <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2c5e:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2c62:	75 14                	jne    2c78 <loadBitmap+0x17e>
		printf(0, "0");
    2c64:	c7 44 24 04 55 a7 00 	movl   $0xa755,0x4(%esp)
    2c6b:	00 
    2c6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c73:	e8 03 12 00 00       	call   3e7b <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    2c78:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2c7c:	0f b7 c0             	movzwl %ax,%eax
    2c7f:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2c83:	83 c0 1f             	add    $0x1f,%eax
    2c86:	8d 50 1f             	lea    0x1f(%eax),%edx
    2c89:	85 c0                	test   %eax,%eax
    2c8b:	0f 48 c2             	cmovs  %edx,%eax
    2c8e:	c1 f8 05             	sar    $0x5,%eax
    2c91:	c1 e0 02             	shl    $0x2,%eax
    2c94:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2c97:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c9a:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c9e:	89 04 24             	mov    %eax,(%esp)
    2ca1:	e8 c1 14 00 00       	call   4167 <malloc>
    2ca6:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    2ca9:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2cac:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2caf:	0f af c2             	imul   %edx,%eax
    2cb2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cb6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2cbd:	00 
    2cbe:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2cc1:	89 04 24             	mov    %eax,(%esp)
    2cc4:	e8 1d 0e 00 00       	call   3ae6 <memset>
	long nData = height * l_width;
    2cc9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2ccc:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2cd0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2cd3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2cd6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cda:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
    2ce1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ce4:	89 04 24             	mov    %eax,(%esp)
    2ce7:	e8 bf 0f 00 00       	call   3cab <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    2cec:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2cef:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    2cf3:	c1 e0 02             	shl    $0x2,%eax
    2cf6:	89 04 24             	mov    %eax,(%esp)
    2cf9:	e8 69 14 00 00       	call   4167 <malloc>
    2cfe:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    2d01:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2d04:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2d07:	0f af c2             	imul   %edx,%eax
    2d0a:	c1 e0 02             	shl    $0x2,%eax
    2d0d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d11:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d18:	00 
    2d19:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d1c:	89 04 24             	mov    %eax,(%esp)
    2d1f:	e8 c2 0d 00 00       	call   3ae6 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    2d24:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2d28:	66 83 f8 17          	cmp    $0x17,%ax
    2d2c:	77 19                	ja     2d47 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    2d2e:	c7 44 24 04 58 a7 00 	movl   $0xa758,0x4(%esp)
    2d35:	00 
    2d36:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d3d:	e8 39 11 00 00       	call   3e7b <printf>
		return;
    2d42:	e9 ee 00 00 00       	jmp    2e35 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    2d47:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2d4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2d55:	e9 94 00 00 00       	jmp    2dee <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    2d5a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d61:	eb 7b                	jmp    2dde <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    2d63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d66:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2d6a:	89 c1                	mov    %eax,%ecx
    2d6c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2d6f:	89 d0                	mov    %edx,%eax
    2d71:	01 c0                	add    %eax,%eax
    2d73:	01 d0                	add    %edx,%eax
    2d75:	01 c8                	add    %ecx,%eax
    2d77:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    2d7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d7d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d84:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d87:	01 c2                	add    %eax,%edx
    2d89:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2d8c:	8d 48 02             	lea    0x2(%eax),%ecx
    2d8f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d92:	01 c8                	add    %ecx,%eax
    2d94:	0f b6 00             	movzbl (%eax),%eax
    2d97:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    2d9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d9d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2da4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2da7:	01 c2                	add    %eax,%edx
    2da9:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2dac:	8d 48 01             	lea    0x1(%eax),%ecx
    2daf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2db2:	01 c8                	add    %ecx,%eax
    2db4:	0f b6 00             	movzbl (%eax),%eax
    2db7:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    2dba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2dbd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2dc4:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2dc7:	01 c2                	add    %eax,%edx
    2dc9:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    2dcc:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2dcf:	01 c8                	add    %ecx,%eax
    2dd1:	0f b6 00             	movzbl (%eax),%eax
    2dd4:	88 02                	mov    %al,(%edx)
				index++;
    2dd6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    2dda:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2dde:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2de1:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2de4:	0f 8c 79 ff ff ff    	jl     2d63 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    2dea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2dee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2df1:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    2df4:	0f 8c 60 ff ff ff    	jl     2d5a <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    2dfa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dfd:	89 04 24             	mov    %eax,(%esp)
    2e00:	e8 b6 0e 00 00       	call   3cbb <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    2e05:	8b 45 08             	mov    0x8(%ebp),%eax
    2e08:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2e0b:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    2e0d:	8b 45 08             	mov    0x8(%ebp),%eax
    2e10:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2e13:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    2e16:	8b 45 08             	mov    0x8(%ebp),%eax
    2e19:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2e1c:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    2e1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2e22:	89 04 24             	mov    %eax,(%esp)
    2e25:	e8 04 12 00 00       	call   402e <free>
	free(BmpFileHeader);
    2e2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2e2d:	89 04 24             	mov    %eax,(%esp)
    2e30:	e8 f9 11 00 00       	call   402e <free>
	//printf("\n");
}
    2e35:	c9                   	leave  
    2e36:	c3                   	ret    

00002e37 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    2e37:	55                   	push   %ebp
    2e38:	89 e5                	mov    %esp,%ebp
    2e3a:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    2e3d:	c7 44 24 04 78 a7 00 	movl   $0xa778,0x4(%esp)
    2e44:	00 
    2e45:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e4c:	e8 2a 10 00 00       	call   3e7b <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2e51:	8b 45 08             	mov    0x8(%ebp),%eax
    2e54:	0f b7 00             	movzwl (%eax),%eax
    2e57:	0f b7 c0             	movzwl %ax,%eax
    2e5a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e5e:	c7 44 24 04 8a a7 00 	movl   $0xa78a,0x4(%esp)
    2e65:	00 
    2e66:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e6d:	e8 09 10 00 00       	call   3e7b <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    2e72:	8b 45 08             	mov    0x8(%ebp),%eax
    2e75:	8b 40 04             	mov    0x4(%eax),%eax
    2e78:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e7c:	c7 44 24 04 a8 a7 00 	movl   $0xa7a8,0x4(%esp)
    2e83:	00 
    2e84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e8b:	e8 eb 0f 00 00       	call   3e7b <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    2e90:	8b 45 08             	mov    0x8(%ebp),%eax
    2e93:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    2e97:	0f b7 c0             	movzwl %ax,%eax
    2e9a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e9e:	c7 44 24 04 b9 a7 00 	movl   $0xa7b9,0x4(%esp)
    2ea5:	00 
    2ea6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ead:	e8 c9 0f 00 00       	call   3e7b <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    2eb2:	8b 45 08             	mov    0x8(%ebp),%eax
    2eb5:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    2eb9:	0f b7 c0             	movzwl %ax,%eax
    2ebc:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ec0:	c7 44 24 04 b9 a7 00 	movl   $0xa7b9,0x4(%esp)
    2ec7:	00 
    2ec8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ecf:	e8 a7 0f 00 00       	call   3e7b <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    2ed4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ed7:	8b 40 0c             	mov    0xc(%eax),%eax
    2eda:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ede:	c7 44 24 04 c8 a7 00 	movl   $0xa7c8,0x4(%esp)
    2ee5:	00 
    2ee6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eed:	e8 89 0f 00 00       	call   3e7b <printf>
}
    2ef2:	c9                   	leave  
    2ef3:	c3                   	ret    

00002ef4 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    2ef4:	55                   	push   %ebp
    2ef5:	89 e5                	mov    %esp,%ebp
    2ef7:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    2efa:	c7 44 24 04 f1 a7 00 	movl   $0xa7f1,0x4(%esp)
    2f01:	00 
    2f02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f09:	e8 6d 0f 00 00       	call   3e7b <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    2f0e:	8b 45 08             	mov    0x8(%ebp),%eax
    2f11:	8b 00                	mov    (%eax),%eax
    2f13:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f17:	c7 44 24 04 03 a8 00 	movl   $0xa803,0x4(%esp)
    2f1e:	00 
    2f1f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f26:	e8 50 0f 00 00       	call   3e7b <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    2f2b:	8b 45 08             	mov    0x8(%ebp),%eax
    2f2e:	8b 40 04             	mov    0x4(%eax),%eax
    2f31:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f35:	c7 44 24 04 1a a8 00 	movl   $0xa81a,0x4(%esp)
    2f3c:	00 
    2f3d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f44:	e8 32 0f 00 00       	call   3e7b <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    2f49:	8b 45 08             	mov    0x8(%ebp),%eax
    2f4c:	8b 40 08             	mov    0x8(%eax),%eax
    2f4f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f53:	c7 44 24 04 28 a8 00 	movl   $0xa828,0x4(%esp)
    2f5a:	00 
    2f5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f62:	e8 14 0f 00 00       	call   3e7b <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    2f67:	8b 45 08             	mov    0x8(%ebp),%eax
    2f6a:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    2f6e:	0f b7 c0             	movzwl %ax,%eax
    2f71:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f75:	c7 44 24 04 36 a8 00 	movl   $0xa836,0x4(%esp)
    2f7c:	00 
    2f7d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f84:	e8 f2 0e 00 00       	call   3e7b <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    2f89:	8b 45 08             	mov    0x8(%ebp),%eax
    2f8c:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    2f90:	0f b7 c0             	movzwl %ax,%eax
    2f93:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f97:	c7 44 24 04 4c a8 00 	movl   $0xa84c,0x4(%esp)
    2f9e:	00 
    2f9f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fa6:	e8 d0 0e 00 00       	call   3e7b <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    2fab:	8b 45 08             	mov    0x8(%ebp),%eax
    2fae:	8b 40 10             	mov    0x10(%eax),%eax
    2fb1:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fb5:	c7 44 24 04 6d a8 00 	movl   $0xa86d,0x4(%esp)
    2fbc:	00 
    2fbd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fc4:	e8 b2 0e 00 00       	call   3e7b <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    2fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    2fcc:	8b 40 14             	mov    0x14(%eax),%eax
    2fcf:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fd3:	c7 44 24 04 80 a8 00 	movl   $0xa880,0x4(%esp)
    2fda:	00 
    2fdb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fe2:	e8 94 0e 00 00       	call   3e7b <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    2fe7:	8b 45 08             	mov    0x8(%ebp),%eax
    2fea:	8b 40 18             	mov    0x18(%eax),%eax
    2fed:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ff1:	c7 44 24 04 b4 a8 00 	movl   $0xa8b4,0x4(%esp)
    2ff8:	00 
    2ff9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3000:	e8 76 0e 00 00       	call   3e7b <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    3005:	8b 45 08             	mov    0x8(%ebp),%eax
    3008:	8b 40 1c             	mov    0x1c(%eax),%eax
    300b:	89 44 24 08          	mov    %eax,0x8(%esp)
    300f:	c7 44 24 04 c9 a8 00 	movl   $0xa8c9,0x4(%esp)
    3016:	00 
    3017:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    301e:	e8 58 0e 00 00       	call   3e7b <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    3023:	8b 45 08             	mov    0x8(%ebp),%eax
    3026:	8b 40 20             	mov    0x20(%eax),%eax
    3029:	89 44 24 08          	mov    %eax,0x8(%esp)
    302d:	c7 44 24 04 de a8 00 	movl   $0xa8de,0x4(%esp)
    3034:	00 
    3035:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    303c:	e8 3a 0e 00 00       	call   3e7b <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    3041:	8b 45 08             	mov    0x8(%ebp),%eax
    3044:	8b 40 24             	mov    0x24(%eax),%eax
    3047:	89 44 24 08          	mov    %eax,0x8(%esp)
    304b:	c7 44 24 04 f5 a8 00 	movl   $0xa8f5,0x4(%esp)
    3052:	00 
    3053:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    305a:	e8 1c 0e 00 00       	call   3e7b <printf>
}
    305f:	c9                   	leave  
    3060:	c3                   	ret    

00003061 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    3061:	55                   	push   %ebp
    3062:	89 e5                	mov    %esp,%ebp
    3064:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    3067:	8b 45 08             	mov    0x8(%ebp),%eax
    306a:	0f b6 00             	movzbl (%eax),%eax
    306d:	0f b6 c8             	movzbl %al,%ecx
    3070:	8b 45 08             	mov    0x8(%ebp),%eax
    3073:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3077:	0f b6 d0             	movzbl %al,%edx
    307a:	8b 45 08             	mov    0x8(%ebp),%eax
    307d:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3081:	0f b6 c0             	movzbl %al,%eax
    3084:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3088:	89 54 24 0c          	mov    %edx,0xc(%esp)
    308c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3090:	c7 44 24 04 09 a9 00 	movl   $0xa909,0x4(%esp)
    3097:	00 
    3098:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    309f:	e8 d7 0d 00 00       	call   3e7b <printf>
}
    30a4:	c9                   	leave  
    30a5:	c3                   	ret    

000030a6 <freepic>:

void freepic(PICNODE *pic) {
    30a6:	55                   	push   %ebp
    30a7:	89 e5                	mov    %esp,%ebp
    30a9:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    30ac:	8b 45 08             	mov    0x8(%ebp),%eax
    30af:	8b 00                	mov    (%eax),%eax
    30b1:	89 04 24             	mov    %eax,(%esp)
    30b4:	e8 75 0f 00 00       	call   402e <free>
}
    30b9:	c9                   	leave  
    30ba:	c3                   	ret    

000030bb <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    30bb:	55                   	push   %ebp
    30bc:	89 e5                	mov    %esp,%ebp
    30be:	53                   	push   %ebx
    30bf:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    30c5:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    30cc:	8d 45 dc             	lea    -0x24(%ebp),%eax
    30cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    30d2:	89 54 24 10          	mov    %edx,0x10(%esp)
    30d6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    30d9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    30dd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    30e4:	00 
    30e5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    30ec:	00 
    30ed:	89 04 24             	mov    %eax,(%esp)
    30f0:	e8 80 02 00 00       	call   3375 <initRect>
    30f5:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    30f8:	8b 45 08             	mov    0x8(%ebp),%eax
    30fb:	8b 40 04             	mov    0x4(%eax),%eax
    30fe:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3101:	89 c2                	mov    %eax,%edx
    3103:	8d 45 cc             	lea    -0x34(%ebp),%eax
    3106:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3109:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    310d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3110:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3114:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    311b:	00 
    311c:	89 54 24 04          	mov    %edx,0x4(%esp)
    3120:	89 04 24             	mov    %eax,(%esp)
    3123:	e8 4d 02 00 00       	call   3375 <initRect>
    3128:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    312b:	8b 45 08             	mov    0x8(%ebp),%eax
    312e:	8b 40 08             	mov    0x8(%eax),%eax
    3131:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3134:	89 c1                	mov    %eax,%ecx
    3136:	8b 45 08             	mov    0x8(%ebp),%eax
    3139:	8b 40 04             	mov    0x4(%eax),%eax
    313c:	2b 45 ec             	sub    -0x14(%ebp),%eax
    313f:	89 c2                	mov    %eax,%edx
    3141:	8d 45 bc             	lea    -0x44(%ebp),%eax
    3144:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3147:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    314b:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    314e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3152:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    3156:	89 54 24 04          	mov    %edx,0x4(%esp)
    315a:	89 04 24             	mov    %eax,(%esp)
    315d:	e8 13 02 00 00       	call   3375 <initRect>
    3162:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    3165:	8b 45 08             	mov    0x8(%ebp),%eax
    3168:	8b 40 08             	mov    0x8(%eax),%eax
    316b:	2b 45 ec             	sub    -0x14(%ebp),%eax
    316e:	89 c2                	mov    %eax,%edx
    3170:	8d 45 ac             	lea    -0x54(%ebp),%eax
    3173:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3176:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    317a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    317d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    3181:	89 54 24 08          	mov    %edx,0x8(%esp)
    3185:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    318c:	00 
    318d:	89 04 24             	mov    %eax,(%esp)
    3190:	e8 e0 01 00 00       	call   3375 <initRect>
    3195:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3198:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    319f:	e9 96 01 00 00       	jmp    333a <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    31a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    31ab:	e9 77 01 00 00       	jmp    3327 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    31b0:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    31b3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    31b6:	89 54 24 08          	mov    %edx,0x8(%esp)
    31ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
    31bd:	89 54 24 04          	mov    %edx,0x4(%esp)
    31c1:	89 04 24             	mov    %eax,(%esp)
    31c4:	e8 85 01 00 00       	call   334e <initPoint>
    31c9:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    31cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    31cf:	89 44 24 08          	mov    %eax,0x8(%esp)
    31d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    31d6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31dd:	89 44 24 10          	mov    %eax,0x10(%esp)
    31e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31e4:	89 44 24 14          	mov    %eax,0x14(%esp)
    31e8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    31eb:	8b 55 a8             	mov    -0x58(%ebp),%edx
    31ee:	89 04 24             	mov    %eax,(%esp)
    31f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    31f5:	e8 d6 01 00 00       	call   33d0 <isIn>
    31fa:	85 c0                	test   %eax,%eax
    31fc:	0f 85 9a 00 00 00    	jne    329c <set_icon_alpha+0x1e1>
    3202:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3205:	89 44 24 08          	mov    %eax,0x8(%esp)
    3209:	8b 45 d0             	mov    -0x30(%ebp),%eax
    320c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3210:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3213:	89 44 24 10          	mov    %eax,0x10(%esp)
    3217:	8b 45 d8             	mov    -0x28(%ebp),%eax
    321a:	89 44 24 14          	mov    %eax,0x14(%esp)
    321e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3221:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3224:	89 04 24             	mov    %eax,(%esp)
    3227:	89 54 24 04          	mov    %edx,0x4(%esp)
    322b:	e8 a0 01 00 00       	call   33d0 <isIn>
    3230:	85 c0                	test   %eax,%eax
    3232:	75 68                	jne    329c <set_icon_alpha+0x1e1>
    3234:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3237:	89 44 24 08          	mov    %eax,0x8(%esp)
    323b:	8b 45 c0             	mov    -0x40(%ebp),%eax
    323e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3242:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3245:	89 44 24 10          	mov    %eax,0x10(%esp)
    3249:	8b 45 c8             	mov    -0x38(%ebp),%eax
    324c:	89 44 24 14          	mov    %eax,0x14(%esp)
    3250:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3253:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3256:	89 04 24             	mov    %eax,(%esp)
    3259:	89 54 24 04          	mov    %edx,0x4(%esp)
    325d:	e8 6e 01 00 00       	call   33d0 <isIn>
    3262:	85 c0                	test   %eax,%eax
    3264:	75 36                	jne    329c <set_icon_alpha+0x1e1>
    3266:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3269:	89 44 24 08          	mov    %eax,0x8(%esp)
    326d:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3270:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3274:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    3277:	89 44 24 10          	mov    %eax,0x10(%esp)
    327b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    327e:	89 44 24 14          	mov    %eax,0x14(%esp)
    3282:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    3285:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3288:	89 04 24             	mov    %eax,(%esp)
    328b:	89 54 24 04          	mov    %edx,0x4(%esp)
    328f:	e8 3c 01 00 00       	call   33d0 <isIn>
    3294:	85 c0                	test   %eax,%eax
    3296:	0f 84 87 00 00 00    	je     3323 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    329c:	8b 45 08             	mov    0x8(%ebp),%eax
    329f:	8b 10                	mov    (%eax),%edx
    32a1:	8b 45 08             	mov    0x8(%ebp),%eax
    32a4:	8b 40 04             	mov    0x4(%eax),%eax
    32a7:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32ab:	89 c1                	mov    %eax,%ecx
    32ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32b0:	01 c8                	add    %ecx,%eax
    32b2:	c1 e0 02             	shl    $0x2,%eax
    32b5:	01 d0                	add    %edx,%eax
    32b7:	0f b6 00             	movzbl (%eax),%eax
    32ba:	3c ff                	cmp    $0xff,%al
    32bc:	75 65                	jne    3323 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    32be:	8b 45 08             	mov    0x8(%ebp),%eax
    32c1:	8b 10                	mov    (%eax),%edx
    32c3:	8b 45 08             	mov    0x8(%ebp),%eax
    32c6:	8b 40 04             	mov    0x4(%eax),%eax
    32c9:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32cd:	89 c1                	mov    %eax,%ecx
    32cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d2:	01 c8                	add    %ecx,%eax
    32d4:	c1 e0 02             	shl    $0x2,%eax
    32d7:	01 d0                	add    %edx,%eax
    32d9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    32dd:	3c ff                	cmp    $0xff,%al
    32df:	75 42                	jne    3323 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    32e1:	8b 45 08             	mov    0x8(%ebp),%eax
    32e4:	8b 10                	mov    (%eax),%edx
    32e6:	8b 45 08             	mov    0x8(%ebp),%eax
    32e9:	8b 40 04             	mov    0x4(%eax),%eax
    32ec:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32f0:	89 c1                	mov    %eax,%ecx
    32f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32f5:	01 c8                	add    %ecx,%eax
    32f7:	c1 e0 02             	shl    $0x2,%eax
    32fa:	01 d0                	add    %edx,%eax
    32fc:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    3300:	3c ff                	cmp    $0xff,%al
    3302:	75 1f                	jne    3323 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    3304:	8b 45 08             	mov    0x8(%ebp),%eax
    3307:	8b 10                	mov    (%eax),%edx
    3309:	8b 45 08             	mov    0x8(%ebp),%eax
    330c:	8b 40 04             	mov    0x4(%eax),%eax
    330f:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3313:	89 c1                	mov    %eax,%ecx
    3315:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3318:	01 c8                	add    %ecx,%eax
    331a:	c1 e0 02             	shl    $0x2,%eax
    331d:	01 d0                	add    %edx,%eax
    331f:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    3323:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3327:	8b 45 08             	mov    0x8(%ebp),%eax
    332a:	8b 40 08             	mov    0x8(%eax),%eax
    332d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3330:	0f 8f 7a fe ff ff    	jg     31b0 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    333a:	8b 45 08             	mov    0x8(%ebp),%eax
    333d:	8b 40 04             	mov    0x4(%eax),%eax
    3340:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3343:	0f 8f 5b fe ff ff    	jg     31a4 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3349:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    334c:	c9                   	leave  
    334d:	c3                   	ret    

0000334e <initPoint>:
#include "context.h"
#include "message.h"
#include "types.h"
#include "user.h"
Point initPoint(int x, int y)
{
    334e:	55                   	push   %ebp
    334f:	89 e5                	mov    %esp,%ebp
    3351:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    3354:	8b 45 0c             	mov    0xc(%ebp),%eax
    3357:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    335a:	8b 45 10             	mov    0x10(%ebp),%eax
    335d:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3360:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3363:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3366:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3369:	89 01                	mov    %eax,(%ecx)
    336b:	89 51 04             	mov    %edx,0x4(%ecx)
}
    336e:	8b 45 08             	mov    0x8(%ebp),%eax
    3371:	c9                   	leave  
    3372:	c2 04 00             	ret    $0x4

00003375 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    3375:	55                   	push   %ebp
    3376:	89 e5                	mov    %esp,%ebp
    3378:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    337b:	8d 45 e8             	lea    -0x18(%ebp),%eax
    337e:	8b 55 10             	mov    0x10(%ebp),%edx
    3381:	89 54 24 08          	mov    %edx,0x8(%esp)
    3385:	8b 55 0c             	mov    0xc(%ebp),%edx
    3388:	89 54 24 04          	mov    %edx,0x4(%esp)
    338c:	89 04 24             	mov    %eax,(%esp)
    338f:	e8 ba ff ff ff       	call   334e <initPoint>
    3394:	83 ec 04             	sub    $0x4,%esp
    3397:	8b 45 e8             	mov    -0x18(%ebp),%eax
    339a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    339d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    33a0:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    33a3:	8b 45 14             	mov    0x14(%ebp),%eax
    33a6:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    33a9:	8b 45 18             	mov    0x18(%ebp),%eax
    33ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    33af:	8b 45 08             	mov    0x8(%ebp),%eax
    33b2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    33b5:	89 10                	mov    %edx,(%eax)
    33b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
    33ba:	89 50 04             	mov    %edx,0x4(%eax)
    33bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
    33c0:	89 50 08             	mov    %edx,0x8(%eax)
    33c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
    33c6:	89 50 0c             	mov    %edx,0xc(%eax)
}
    33c9:	8b 45 08             	mov    0x8(%ebp),%eax
    33cc:	c9                   	leave  
    33cd:	c2 04 00             	ret    $0x4

000033d0 <isIn>:

int isIn(Point p, Rect r)
{
    33d0:	55                   	push   %ebp
    33d1:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    33d3:	8b 55 08             	mov    0x8(%ebp),%edx
    33d6:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    33d9:	39 c2                	cmp    %eax,%edx
    33db:	7c 2f                	jl     340c <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    33dd:	8b 45 08             	mov    0x8(%ebp),%eax
    33e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
    33e3:	8b 55 18             	mov    0x18(%ebp),%edx
    33e6:	01 ca                	add    %ecx,%edx
    33e8:	39 d0                	cmp    %edx,%eax
    33ea:	7d 20                	jge    340c <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    33ec:	8b 55 0c             	mov    0xc(%ebp),%edx
    33ef:	8b 45 14             	mov    0x14(%ebp),%eax
    33f2:	39 c2                	cmp    %eax,%edx
    33f4:	7c 16                	jl     340c <isIn+0x3c>
    33f6:	8b 45 0c             	mov    0xc(%ebp),%eax
    33f9:	8b 4d 14             	mov    0x14(%ebp),%ecx
    33fc:	8b 55 1c             	mov    0x1c(%ebp),%edx
    33ff:	01 ca                	add    %ecx,%edx
    3401:	39 d0                	cmp    %edx,%eax
    3403:	7d 07                	jge    340c <isIn+0x3c>
    3405:	b8 01 00 00 00       	mov    $0x1,%eax
    340a:	eb 05                	jmp    3411 <isIn+0x41>
    340c:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3411:	5d                   	pop    %ebp
    3412:	c3                   	ret    

00003413 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    3413:	55                   	push   %ebp
    3414:	89 e5                	mov    %esp,%ebp
    3416:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    3419:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    3420:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    3427:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    342e:	8b 45 10             	mov    0x10(%ebp),%eax
    3431:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    3434:	8b 45 14             	mov    0x14(%ebp),%eax
    3437:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    343a:	8b 45 08             	mov    0x8(%ebp),%eax
    343d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3440:	89 10                	mov    %edx,(%eax)
    3442:	8b 55 f0             	mov    -0x10(%ebp),%edx
    3445:	89 50 04             	mov    %edx,0x4(%eax)
    3448:	8b 55 f4             	mov    -0xc(%ebp),%edx
    344b:	89 50 08             	mov    %edx,0x8(%eax)
    344e:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3451:	89 50 0c             	mov    %edx,0xc(%eax)
    3454:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3457:	89 50 10             	mov    %edx,0x10(%eax)
}
    345a:	8b 45 08             	mov    0x8(%ebp),%eax
    345d:	c9                   	leave  
    345e:	c2 04 00             	ret    $0x4

00003461 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    3461:	55                   	push   %ebp
    3462:	89 e5                	mov    %esp,%ebp
    3464:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    3467:	8b 45 1c             	mov    0x1c(%ebp),%eax
    346a:	83 f8 03             	cmp    $0x3,%eax
    346d:	74 72                	je     34e1 <createClickable+0x80>
    346f:	83 f8 04             	cmp    $0x4,%eax
    3472:	74 0a                	je     347e <createClickable+0x1d>
    3474:	83 f8 02             	cmp    $0x2,%eax
    3477:	74 38                	je     34b1 <createClickable+0x50>
    3479:	e9 96 00 00 00       	jmp    3514 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    347e:	8b 45 08             	mov    0x8(%ebp),%eax
    3481:	8d 50 04             	lea    0x4(%eax),%edx
    3484:	8b 45 20             	mov    0x20(%ebp),%eax
    3487:	89 44 24 14          	mov    %eax,0x14(%esp)
    348b:	8b 45 0c             	mov    0xc(%ebp),%eax
    348e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3492:	8b 45 10             	mov    0x10(%ebp),%eax
    3495:	89 44 24 08          	mov    %eax,0x8(%esp)
    3499:	8b 45 14             	mov    0x14(%ebp),%eax
    349c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    34a0:	8b 45 18             	mov    0x18(%ebp),%eax
    34a3:	89 44 24 10          	mov    %eax,0x10(%esp)
    34a7:	89 14 24             	mov    %edx,(%esp)
    34aa:	e8 7c 00 00 00       	call   352b <addClickable>
	        break;
    34af:	eb 78                	jmp    3529 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    34b1:	8b 45 08             	mov    0x8(%ebp),%eax
    34b4:	8b 55 20             	mov    0x20(%ebp),%edx
    34b7:	89 54 24 14          	mov    %edx,0x14(%esp)
    34bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    34be:	89 54 24 04          	mov    %edx,0x4(%esp)
    34c2:	8b 55 10             	mov    0x10(%ebp),%edx
    34c5:	89 54 24 08          	mov    %edx,0x8(%esp)
    34c9:	8b 55 14             	mov    0x14(%ebp),%edx
    34cc:	89 54 24 0c          	mov    %edx,0xc(%esp)
    34d0:	8b 55 18             	mov    0x18(%ebp),%edx
    34d3:	89 54 24 10          	mov    %edx,0x10(%esp)
    34d7:	89 04 24             	mov    %eax,(%esp)
    34da:	e8 4c 00 00 00       	call   352b <addClickable>
	    	break;
    34df:	eb 48                	jmp    3529 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    34e1:	8b 45 08             	mov    0x8(%ebp),%eax
    34e4:	8d 50 08             	lea    0x8(%eax),%edx
    34e7:	8b 45 20             	mov    0x20(%ebp),%eax
    34ea:	89 44 24 14          	mov    %eax,0x14(%esp)
    34ee:	8b 45 0c             	mov    0xc(%ebp),%eax
    34f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    34f5:	8b 45 10             	mov    0x10(%ebp),%eax
    34f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    34fc:	8b 45 14             	mov    0x14(%ebp),%eax
    34ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3503:	8b 45 18             	mov    0x18(%ebp),%eax
    3506:	89 44 24 10          	mov    %eax,0x10(%esp)
    350a:	89 14 24             	mov    %edx,(%esp)
    350d:	e8 19 00 00 00       	call   352b <addClickable>
	    	break;
    3512:	eb 15                	jmp    3529 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    3514:	c7 44 24 04 18 a9 00 	movl   $0xa918,0x4(%esp)
    351b:	00 
    351c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3523:	e8 53 09 00 00       	call   3e7b <printf>
	    	break;
    3528:	90                   	nop
	}
}
    3529:	c9                   	leave  
    352a:	c3                   	ret    

0000352b <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    352b:	55                   	push   %ebp
    352c:	89 e5                	mov    %esp,%ebp
    352e:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    3531:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    3538:	e8 2a 0c 00 00       	call   4167 <malloc>
    353d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3540:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3543:	8b 55 0c             	mov    0xc(%ebp),%edx
    3546:	89 10                	mov    %edx,(%eax)
    3548:	8b 55 10             	mov    0x10(%ebp),%edx
    354b:	89 50 04             	mov    %edx,0x4(%eax)
    354e:	8b 55 14             	mov    0x14(%ebp),%edx
    3551:	89 50 08             	mov    %edx,0x8(%eax)
    3554:	8b 55 18             	mov    0x18(%ebp),%edx
    3557:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    355a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    355d:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3560:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    3563:	8b 45 08             	mov    0x8(%ebp),%eax
    3566:	8b 10                	mov    (%eax),%edx
    3568:	8b 45 f4             	mov    -0xc(%ebp),%eax
    356b:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    356e:	8b 45 08             	mov    0x8(%ebp),%eax
    3571:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3574:	89 10                	mov    %edx,(%eax)
}
    3576:	c9                   	leave  
    3577:	c3                   	ret    

00003578 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3578:	55                   	push   %ebp
    3579:	89 e5                	mov    %esp,%ebp
    357b:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    357e:	8b 45 08             	mov    0x8(%ebp),%eax
    3581:	8b 00                	mov    (%eax),%eax
    3583:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3586:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3589:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    358c:	e9 bb 00 00 00       	jmp    364c <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    3591:	8b 45 0c             	mov    0xc(%ebp),%eax
    3594:	89 44 24 08          	mov    %eax,0x8(%esp)
    3598:	8b 45 10             	mov    0x10(%ebp),%eax
    359b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    359f:	8b 45 14             	mov    0x14(%ebp),%eax
    35a2:	89 44 24 10          	mov    %eax,0x10(%esp)
    35a6:	8b 45 18             	mov    0x18(%ebp),%eax
    35a9:	89 44 24 14          	mov    %eax,0x14(%esp)
    35ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35b0:	8b 50 04             	mov    0x4(%eax),%edx
    35b3:	8b 00                	mov    (%eax),%eax
    35b5:	89 04 24             	mov    %eax,(%esp)
    35b8:	89 54 24 04          	mov    %edx,0x4(%esp)
    35bc:	e8 0f fe ff ff       	call   33d0 <isIn>
    35c1:	85 c0                	test   %eax,%eax
    35c3:	74 60                	je     3625 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    35c5:	8b 45 08             	mov    0x8(%ebp),%eax
    35c8:	8b 00                	mov    (%eax),%eax
    35ca:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    35cd:	75 2e                	jne    35fd <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    35cf:	8b 45 08             	mov    0x8(%ebp),%eax
    35d2:	8b 00                	mov    (%eax),%eax
    35d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    35d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35da:	8b 50 14             	mov    0x14(%eax),%edx
    35dd:	8b 45 08             	mov    0x8(%ebp),%eax
    35e0:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    35e2:	8b 45 08             	mov    0x8(%ebp),%eax
    35e5:	8b 00                	mov    (%eax),%eax
    35e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    35ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    35f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35f3:	89 04 24             	mov    %eax,(%esp)
    35f6:	e8 33 0a 00 00       	call   402e <free>
    35fb:	eb 4f                	jmp    364c <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    35fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3600:	8b 50 14             	mov    0x14(%eax),%edx
    3603:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3606:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    3609:	8b 45 f0             	mov    -0x10(%ebp),%eax
    360c:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    360f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3612:	8b 40 14             	mov    0x14(%eax),%eax
    3615:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    3618:	8b 45 ec             	mov    -0x14(%ebp),%eax
    361b:	89 04 24             	mov    %eax,(%esp)
    361e:	e8 0b 0a 00 00       	call   402e <free>
    3623:	eb 27                	jmp    364c <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    3625:	8b 45 08             	mov    0x8(%ebp),%eax
    3628:	8b 00                	mov    (%eax),%eax
    362a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    362d:	75 0b                	jne    363a <deleteClickable+0xc2>
			{
				cur = cur->next;
    362f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3632:	8b 40 14             	mov    0x14(%eax),%eax
    3635:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3638:	eb 12                	jmp    364c <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    363a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    363d:	8b 40 14             	mov    0x14(%eax),%eax
    3640:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    3643:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3646:	8b 40 14             	mov    0x14(%eax),%eax
    3649:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    364c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3650:	0f 85 3b ff ff ff    	jne    3591 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    3656:	c9                   	leave  
    3657:	c3                   	ret    

00003658 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3658:	55                   	push   %ebp
    3659:	89 e5                	mov    %esp,%ebp
    365b:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    365e:	8b 45 08             	mov    0x8(%ebp),%eax
    3661:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3664:	eb 59                	jmp    36bf <executeHandler+0x67>
	{
		if (isIn(click, cur->area))
    3666:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3669:	8b 10                	mov    (%eax),%edx
    366b:	89 54 24 08          	mov    %edx,0x8(%esp)
    366f:	8b 50 04             	mov    0x4(%eax),%edx
    3672:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3676:	8b 50 08             	mov    0x8(%eax),%edx
    3679:	89 54 24 10          	mov    %edx,0x10(%esp)
    367d:	8b 40 0c             	mov    0xc(%eax),%eax
    3680:	89 44 24 14          	mov    %eax,0x14(%esp)
    3684:	8b 45 0c             	mov    0xc(%ebp),%eax
    3687:	8b 55 10             	mov    0x10(%ebp),%edx
    368a:	89 04 24             	mov    %eax,(%esp)
    368d:	89 54 24 04          	mov    %edx,0x4(%esp)
    3691:	e8 3a fd ff ff       	call   33d0 <isIn>
    3696:	85 c0                	test   %eax,%eax
    3698:	74 1c                	je     36b6 <executeHandler+0x5e>
		{
			cur->handler(click);
    369a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    369d:	8b 48 10             	mov    0x10(%eax),%ecx
    36a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    36a3:	8b 55 10             	mov    0x10(%ebp),%edx
    36a6:	89 04 24             	mov    %eax,(%esp)
    36a9:	89 54 24 04          	mov    %edx,0x4(%esp)
    36ad:	ff d1                	call   *%ecx
			return 1;
    36af:	b8 01 00 00 00       	mov    $0x1,%eax
    36b4:	eb 28                	jmp    36de <executeHandler+0x86>
		}
		cur = cur->next;
    36b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36b9:	8b 40 14             	mov    0x14(%eax),%eax
    36bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    36bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    36c3:	75 a1                	jne    3666 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    36c5:	c7 44 24 04 46 a9 00 	movl   $0xa946,0x4(%esp)
    36cc:	00 
    36cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36d4:	e8 a2 07 00 00       	call   3e7b <printf>
	return 0;
    36d9:	b8 00 00 00 00       	mov    $0x0,%eax
}
    36de:	c9                   	leave  
    36df:	c3                   	ret    

000036e0 <printClickable>:

void printClickable(Clickable *c)
{
    36e0:	55                   	push   %ebp
    36e1:	89 e5                	mov    %esp,%ebp
    36e3:	53                   	push   %ebx
    36e4:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    36e7:	8b 45 08             	mov    0x8(%ebp),%eax
    36ea:	8b 58 0c             	mov    0xc(%eax),%ebx
    36ed:	8b 45 08             	mov    0x8(%ebp),%eax
    36f0:	8b 48 08             	mov    0x8(%eax),%ecx
    36f3:	8b 45 08             	mov    0x8(%ebp),%eax
    36f6:	8b 50 04             	mov    0x4(%eax),%edx
    36f9:	8b 45 08             	mov    0x8(%ebp),%eax
    36fc:	8b 00                	mov    (%eax),%eax
    36fe:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    3702:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3706:	89 54 24 0c          	mov    %edx,0xc(%esp)
    370a:	89 44 24 08          	mov    %eax,0x8(%esp)
    370e:	c7 44 24 04 56 a9 00 	movl   $0xa956,0x4(%esp)
    3715:	00 
    3716:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    371d:	e8 59 07 00 00       	call   3e7b <printf>
}
    3722:	83 c4 24             	add    $0x24,%esp
    3725:	5b                   	pop    %ebx
    3726:	5d                   	pop    %ebp
    3727:	c3                   	ret    

00003728 <printClickableList>:

void printClickableList(Clickable *head)
{
    3728:	55                   	push   %ebp
    3729:	89 e5                	mov    %esp,%ebp
    372b:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    372e:	8b 45 08             	mov    0x8(%ebp),%eax
    3731:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    3734:	c7 44 24 04 68 a9 00 	movl   $0xa968,0x4(%esp)
    373b:	00 
    373c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3743:	e8 33 07 00 00       	call   3e7b <printf>
	while(cur != 0)
    3748:	eb 14                	jmp    375e <printClickableList+0x36>
	{
		printClickable(cur);
    374a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    374d:	89 04 24             	mov    %eax,(%esp)
    3750:	e8 8b ff ff ff       	call   36e0 <printClickable>
		cur = cur->next;
    3755:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3758:	8b 40 14             	mov    0x14(%eax),%eax
    375b:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    375e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3762:	75 e6                	jne    374a <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    3764:	c7 44 24 04 79 a9 00 	movl   $0xa979,0x4(%esp)
    376b:	00 
    376c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3773:	e8 03 07 00 00       	call   3e7b <printf>
}
    3778:	c9                   	leave  
    3779:	c3                   	ret    

0000377a <testHanler>:

void testHanler(struct Point p)
{
    377a:	55                   	push   %ebp
    377b:	89 e5                	mov    %esp,%ebp
    377d:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3780:	8b 55 0c             	mov    0xc(%ebp),%edx
    3783:	8b 45 08             	mov    0x8(%ebp),%eax
    3786:	89 54 24 0c          	mov    %edx,0xc(%esp)
    378a:	89 44 24 08          	mov    %eax,0x8(%esp)
    378e:	c7 44 24 04 7b a9 00 	movl   $0xa97b,0x4(%esp)
    3795:	00 
    3796:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    379d:	e8 d9 06 00 00       	call   3e7b <printf>
}
    37a2:	c9                   	leave  
    37a3:	c3                   	ret    

000037a4 <testClickable>:
void testClickable(struct Context c)
{
    37a4:	55                   	push   %ebp
    37a5:	89 e5                	mov    %esp,%ebp
    37a7:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    37ad:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    37b0:	8b 55 08             	mov    0x8(%ebp),%edx
    37b3:	89 54 24 04          	mov    %edx,0x4(%esp)
    37b7:	8b 55 0c             	mov    0xc(%ebp),%edx
    37ba:	89 54 24 08          	mov    %edx,0x8(%esp)
    37be:	8b 55 10             	mov    0x10(%ebp),%edx
    37c1:	89 54 24 0c          	mov    %edx,0xc(%esp)
    37c5:	89 04 24             	mov    %eax,(%esp)
    37c8:	e8 46 fc ff ff       	call   3413 <initClickManager>
    37cd:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    37d0:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    37d3:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    37da:	00 
    37db:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    37e2:	00 
    37e3:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    37ea:	00 
    37eb:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    37f2:	00 
    37f3:	89 04 24             	mov    %eax,(%esp)
    37f6:	e8 7a fb ff ff       	call   3375 <initRect>
    37fb:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    37fe:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    3801:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    3808:	00 
    3809:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    3810:	00 
    3811:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    3818:	00 
    3819:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    3820:	00 
    3821:	89 04 24             	mov    %eax,(%esp)
    3824:	e8 4c fb ff ff       	call   3375 <initRect>
    3829:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    382c:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    382f:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    3836:	00 
    3837:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    383e:	00 
    383f:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    3846:	00 
    3847:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    384e:	00 
    384f:	89 04 24             	mov    %eax,(%esp)
    3852:	e8 1e fb ff ff       	call   3375 <initRect>
    3857:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    385a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    385d:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    3864:	00 
    3865:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    386c:	00 
    386d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3874:	00 
    3875:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    387c:	00 
    387d:	89 04 24             	mov    %eax,(%esp)
    3880:	e8 f0 fa ff ff       	call   3375 <initRect>
    3885:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    3888:	8d 45 9c             	lea    -0x64(%ebp),%eax
    388b:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    3892:	00 
    3893:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    389a:	00 
    389b:	89 04 24             	mov    %eax,(%esp)
    389e:	e8 ab fa ff ff       	call   334e <initPoint>
    38a3:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    38a6:	8d 45 94             	lea    -0x6c(%ebp),%eax
    38a9:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    38b0:	00 
    38b1:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    38b8:	00 
    38b9:	89 04 24             	mov    %eax,(%esp)
    38bc:	e8 8d fa ff ff       	call   334e <initPoint>
    38c1:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    38c4:	c7 44 24 18 7a 37 00 	movl   $0x377a,0x18(%esp)
    38cb:	00 
    38cc:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    38d3:	00 
    38d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    38d7:	89 44 24 04          	mov    %eax,0x4(%esp)
    38db:	8b 45 d8             	mov    -0x28(%ebp),%eax
    38de:	89 44 24 08          	mov    %eax,0x8(%esp)
    38e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
    38e5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
    38ec:	89 44 24 10          	mov    %eax,0x10(%esp)
    38f0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    38f3:	89 04 24             	mov    %eax,(%esp)
    38f6:	e8 66 fb ff ff       	call   3461 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    38fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38fe:	89 44 24 08          	mov    %eax,0x8(%esp)
    3902:	c7 44 24 04 8f a9 00 	movl   $0xa98f,0x4(%esp)
    3909:	00 
    390a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3911:	e8 65 05 00 00       	call   3e7b <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    3916:	c7 44 24 18 7a 37 00 	movl   $0x377a,0x18(%esp)
    391d:	00 
    391e:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3925:	00 
    3926:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3929:	89 44 24 04          	mov    %eax,0x4(%esp)
    392d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3930:	89 44 24 08          	mov    %eax,0x8(%esp)
    3934:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3937:	89 44 24 0c          	mov    %eax,0xc(%esp)
    393b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    393e:	89 44 24 10          	mov    %eax,0x10(%esp)
    3942:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3945:	89 04 24             	mov    %eax,(%esp)
    3948:	e8 14 fb ff ff       	call   3461 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    394d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3950:	89 44 24 08          	mov    %eax,0x8(%esp)
    3954:	c7 44 24 04 8f a9 00 	movl   $0xa98f,0x4(%esp)
    395b:	00 
    395c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3963:	e8 13 05 00 00       	call   3e7b <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    3968:	c7 44 24 18 7a 37 00 	movl   $0x377a,0x18(%esp)
    396f:	00 
    3970:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    3977:	00 
    3978:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    397b:	89 44 24 04          	mov    %eax,0x4(%esp)
    397f:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3982:	89 44 24 08          	mov    %eax,0x8(%esp)
    3986:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3989:	89 44 24 0c          	mov    %eax,0xc(%esp)
    398d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3990:	89 44 24 10          	mov    %eax,0x10(%esp)
    3994:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3997:	89 04 24             	mov    %eax,(%esp)
    399a:	e8 c2 fa ff ff       	call   3461 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    399f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39a2:	89 44 24 08          	mov    %eax,0x8(%esp)
    39a6:	c7 44 24 04 8f a9 00 	movl   $0xa98f,0x4(%esp)
    39ad:	00 
    39ae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39b5:	e8 c1 04 00 00       	call   3e7b <printf>
	printClickableList(cm.left_click);
    39ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39bd:	89 04 24             	mov    %eax,(%esp)
    39c0:	e8 63 fd ff ff       	call   3728 <printClickableList>
	executeHandler(cm.left_click, p1);
    39c5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    39c8:	8b 45 9c             	mov    -0x64(%ebp),%eax
    39cb:	8b 55 a0             	mov    -0x60(%ebp),%edx
    39ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    39d2:	89 54 24 08          	mov    %edx,0x8(%esp)
    39d6:	89 0c 24             	mov    %ecx,(%esp)
    39d9:	e8 7a fc ff ff       	call   3658 <executeHandler>
	executeHandler(cm.left_click, p2);
    39de:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    39e1:	8b 45 94             	mov    -0x6c(%ebp),%eax
    39e4:	8b 55 98             	mov    -0x68(%ebp),%edx
    39e7:	89 44 24 04          	mov    %eax,0x4(%esp)
    39eb:	89 54 24 08          	mov    %edx,0x8(%esp)
    39ef:	89 0c 24             	mov    %ecx,(%esp)
    39f2:	e8 61 fc ff ff       	call   3658 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    39f7:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    39fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    39fe:	8b 45 a8             	mov    -0x58(%ebp),%eax
    3a01:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a05:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3a08:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3a0c:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3a0f:	89 44 24 10          	mov    %eax,0x10(%esp)
    3a13:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3a16:	89 04 24             	mov    %eax,(%esp)
    3a19:	e8 5a fb ff ff       	call   3578 <deleteClickable>
	printClickableList(cm.left_click);
    3a1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a21:	89 04 24             	mov    %eax,(%esp)
    3a24:	e8 ff fc ff ff       	call   3728 <printClickableList>
}
    3a29:	c9                   	leave  
    3a2a:	c3                   	ret    

00003a2b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3a2b:	55                   	push   %ebp
    3a2c:	89 e5                	mov    %esp,%ebp
    3a2e:	57                   	push   %edi
    3a2f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3a30:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3a33:	8b 55 10             	mov    0x10(%ebp),%edx
    3a36:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a39:	89 cb                	mov    %ecx,%ebx
    3a3b:	89 df                	mov    %ebx,%edi
    3a3d:	89 d1                	mov    %edx,%ecx
    3a3f:	fc                   	cld    
    3a40:	f3 aa                	rep stos %al,%es:(%edi)
    3a42:	89 ca                	mov    %ecx,%edx
    3a44:	89 fb                	mov    %edi,%ebx
    3a46:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3a49:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3a4c:	5b                   	pop    %ebx
    3a4d:	5f                   	pop    %edi
    3a4e:	5d                   	pop    %ebp
    3a4f:	c3                   	ret    

00003a50 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3a50:	55                   	push   %ebp
    3a51:	89 e5                	mov    %esp,%ebp
    3a53:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3a56:	8b 45 08             	mov    0x8(%ebp),%eax
    3a59:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3a5c:	90                   	nop
    3a5d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a60:	8d 50 01             	lea    0x1(%eax),%edx
    3a63:	89 55 08             	mov    %edx,0x8(%ebp)
    3a66:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a69:	8d 4a 01             	lea    0x1(%edx),%ecx
    3a6c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3a6f:	0f b6 12             	movzbl (%edx),%edx
    3a72:	88 10                	mov    %dl,(%eax)
    3a74:	0f b6 00             	movzbl (%eax),%eax
    3a77:	84 c0                	test   %al,%al
    3a79:	75 e2                	jne    3a5d <strcpy+0xd>
    ;
  return os;
    3a7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a7e:	c9                   	leave  
    3a7f:	c3                   	ret    

00003a80 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a80:	55                   	push   %ebp
    3a81:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a83:	eb 08                	jmp    3a8d <strcmp+0xd>
    p++, q++;
    3a85:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a89:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a8d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a90:	0f b6 00             	movzbl (%eax),%eax
    3a93:	84 c0                	test   %al,%al
    3a95:	74 10                	je     3aa7 <strcmp+0x27>
    3a97:	8b 45 08             	mov    0x8(%ebp),%eax
    3a9a:	0f b6 10             	movzbl (%eax),%edx
    3a9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aa0:	0f b6 00             	movzbl (%eax),%eax
    3aa3:	38 c2                	cmp    %al,%dl
    3aa5:	74 de                	je     3a85 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3aa7:	8b 45 08             	mov    0x8(%ebp),%eax
    3aaa:	0f b6 00             	movzbl (%eax),%eax
    3aad:	0f b6 d0             	movzbl %al,%edx
    3ab0:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ab3:	0f b6 00             	movzbl (%eax),%eax
    3ab6:	0f b6 c0             	movzbl %al,%eax
    3ab9:	29 c2                	sub    %eax,%edx
    3abb:	89 d0                	mov    %edx,%eax
}
    3abd:	5d                   	pop    %ebp
    3abe:	c3                   	ret    

00003abf <strlen>:

uint
strlen(char *s)
{
    3abf:	55                   	push   %ebp
    3ac0:	89 e5                	mov    %esp,%ebp
    3ac2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3ac5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3acc:	eb 04                	jmp    3ad2 <strlen+0x13>
    3ace:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3ad2:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3ad5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ad8:	01 d0                	add    %edx,%eax
    3ada:	0f b6 00             	movzbl (%eax),%eax
    3add:	84 c0                	test   %al,%al
    3adf:	75 ed                	jne    3ace <strlen+0xf>
    ;
  return n;
    3ae1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3ae4:	c9                   	leave  
    3ae5:	c3                   	ret    

00003ae6 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3ae6:	55                   	push   %ebp
    3ae7:	89 e5                	mov    %esp,%ebp
    3ae9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3aec:	8b 45 10             	mov    0x10(%ebp),%eax
    3aef:	89 44 24 08          	mov    %eax,0x8(%esp)
    3af3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3af6:	89 44 24 04          	mov    %eax,0x4(%esp)
    3afa:	8b 45 08             	mov    0x8(%ebp),%eax
    3afd:	89 04 24             	mov    %eax,(%esp)
    3b00:	e8 26 ff ff ff       	call   3a2b <stosb>
  return dst;
    3b05:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b08:	c9                   	leave  
    3b09:	c3                   	ret    

00003b0a <strchr>:

char*
strchr(const char *s, char c)
{
    3b0a:	55                   	push   %ebp
    3b0b:	89 e5                	mov    %esp,%ebp
    3b0d:	83 ec 04             	sub    $0x4,%esp
    3b10:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b13:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3b16:	eb 14                	jmp    3b2c <strchr+0x22>
    if(*s == c)
    3b18:	8b 45 08             	mov    0x8(%ebp),%eax
    3b1b:	0f b6 00             	movzbl (%eax),%eax
    3b1e:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3b21:	75 05                	jne    3b28 <strchr+0x1e>
      return (char*)s;
    3b23:	8b 45 08             	mov    0x8(%ebp),%eax
    3b26:	eb 13                	jmp    3b3b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3b28:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3b2c:	8b 45 08             	mov    0x8(%ebp),%eax
    3b2f:	0f b6 00             	movzbl (%eax),%eax
    3b32:	84 c0                	test   %al,%al
    3b34:	75 e2                	jne    3b18 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3b36:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3b3b:	c9                   	leave  
    3b3c:	c3                   	ret    

00003b3d <gets>:

char*
gets(char *buf, int max)
{
    3b3d:	55                   	push   %ebp
    3b3e:	89 e5                	mov    %esp,%ebp
    3b40:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3b4a:	eb 4c                	jmp    3b98 <gets+0x5b>
    cc = read(0, &c, 1);
    3b4c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3b53:	00 
    3b54:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3b57:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b62:	e8 44 01 00 00       	call   3cab <read>
    3b67:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3b6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b6e:	7f 02                	jg     3b72 <gets+0x35>
      break;
    3b70:	eb 31                	jmp    3ba3 <gets+0x66>
    buf[i++] = c;
    3b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b75:	8d 50 01             	lea    0x1(%eax),%edx
    3b78:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3b7b:	89 c2                	mov    %eax,%edx
    3b7d:	8b 45 08             	mov    0x8(%ebp),%eax
    3b80:	01 c2                	add    %eax,%edx
    3b82:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b86:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3b88:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b8c:	3c 0a                	cmp    $0xa,%al
    3b8e:	74 13                	je     3ba3 <gets+0x66>
    3b90:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b94:	3c 0d                	cmp    $0xd,%al
    3b96:	74 0b                	je     3ba3 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b98:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b9b:	83 c0 01             	add    $0x1,%eax
    3b9e:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3ba1:	7c a9                	jl     3b4c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3ba3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3ba6:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba9:	01 d0                	add    %edx,%eax
    3bab:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3bae:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3bb1:	c9                   	leave  
    3bb2:	c3                   	ret    

00003bb3 <stat>:

int
stat(char *n, struct stat *st)
{
    3bb3:	55                   	push   %ebp
    3bb4:	89 e5                	mov    %esp,%ebp
    3bb6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3bb9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3bc0:	00 
    3bc1:	8b 45 08             	mov    0x8(%ebp),%eax
    3bc4:	89 04 24             	mov    %eax,(%esp)
    3bc7:	e8 07 01 00 00       	call   3cd3 <open>
    3bcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3bcf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bd3:	79 07                	jns    3bdc <stat+0x29>
    return -1;
    3bd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3bda:	eb 23                	jmp    3bff <stat+0x4c>
  r = fstat(fd, st);
    3bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
    3be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3be6:	89 04 24             	mov    %eax,(%esp)
    3be9:	e8 fd 00 00 00       	call   3ceb <fstat>
    3bee:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3bf1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bf4:	89 04 24             	mov    %eax,(%esp)
    3bf7:	e8 bf 00 00 00       	call   3cbb <close>
  return r;
    3bfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3bff:	c9                   	leave  
    3c00:	c3                   	ret    

00003c01 <atoi>:

int
atoi(const char *s)
{
    3c01:	55                   	push   %ebp
    3c02:	89 e5                	mov    %esp,%ebp
    3c04:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3c07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3c0e:	eb 25                	jmp    3c35 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3c10:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3c13:	89 d0                	mov    %edx,%eax
    3c15:	c1 e0 02             	shl    $0x2,%eax
    3c18:	01 d0                	add    %edx,%eax
    3c1a:	01 c0                	add    %eax,%eax
    3c1c:	89 c1                	mov    %eax,%ecx
    3c1e:	8b 45 08             	mov    0x8(%ebp),%eax
    3c21:	8d 50 01             	lea    0x1(%eax),%edx
    3c24:	89 55 08             	mov    %edx,0x8(%ebp)
    3c27:	0f b6 00             	movzbl (%eax),%eax
    3c2a:	0f be c0             	movsbl %al,%eax
    3c2d:	01 c8                	add    %ecx,%eax
    3c2f:	83 e8 30             	sub    $0x30,%eax
    3c32:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3c35:	8b 45 08             	mov    0x8(%ebp),%eax
    3c38:	0f b6 00             	movzbl (%eax),%eax
    3c3b:	3c 2f                	cmp    $0x2f,%al
    3c3d:	7e 0a                	jle    3c49 <atoi+0x48>
    3c3f:	8b 45 08             	mov    0x8(%ebp),%eax
    3c42:	0f b6 00             	movzbl (%eax),%eax
    3c45:	3c 39                	cmp    $0x39,%al
    3c47:	7e c7                	jle    3c10 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3c49:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3c4c:	c9                   	leave  
    3c4d:	c3                   	ret    

00003c4e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3c4e:	55                   	push   %ebp
    3c4f:	89 e5                	mov    %esp,%ebp
    3c51:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3c54:	8b 45 08             	mov    0x8(%ebp),%eax
    3c57:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3c60:	eb 17                	jmp    3c79 <memmove+0x2b>
    *dst++ = *src++;
    3c62:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3c65:	8d 50 01             	lea    0x1(%eax),%edx
    3c68:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3c6b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3c6e:	8d 4a 01             	lea    0x1(%edx),%ecx
    3c71:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3c74:	0f b6 12             	movzbl (%edx),%edx
    3c77:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c79:	8b 45 10             	mov    0x10(%ebp),%eax
    3c7c:	8d 50 ff             	lea    -0x1(%eax),%edx
    3c7f:	89 55 10             	mov    %edx,0x10(%ebp)
    3c82:	85 c0                	test   %eax,%eax
    3c84:	7f dc                	jg     3c62 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3c86:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3c89:	c9                   	leave  
    3c8a:	c3                   	ret    

00003c8b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c8b:	b8 01 00 00 00       	mov    $0x1,%eax
    3c90:	cd 40                	int    $0x40
    3c92:	c3                   	ret    

00003c93 <exit>:
SYSCALL(exit)
    3c93:	b8 02 00 00 00       	mov    $0x2,%eax
    3c98:	cd 40                	int    $0x40
    3c9a:	c3                   	ret    

00003c9b <wait>:
SYSCALL(wait)
    3c9b:	b8 03 00 00 00       	mov    $0x3,%eax
    3ca0:	cd 40                	int    $0x40
    3ca2:	c3                   	ret    

00003ca3 <pipe>:
SYSCALL(pipe)
    3ca3:	b8 04 00 00 00       	mov    $0x4,%eax
    3ca8:	cd 40                	int    $0x40
    3caa:	c3                   	ret    

00003cab <read>:
SYSCALL(read)
    3cab:	b8 05 00 00 00       	mov    $0x5,%eax
    3cb0:	cd 40                	int    $0x40
    3cb2:	c3                   	ret    

00003cb3 <write>:
SYSCALL(write)
    3cb3:	b8 10 00 00 00       	mov    $0x10,%eax
    3cb8:	cd 40                	int    $0x40
    3cba:	c3                   	ret    

00003cbb <close>:
SYSCALL(close)
    3cbb:	b8 15 00 00 00       	mov    $0x15,%eax
    3cc0:	cd 40                	int    $0x40
    3cc2:	c3                   	ret    

00003cc3 <kill>:
SYSCALL(kill)
    3cc3:	b8 06 00 00 00       	mov    $0x6,%eax
    3cc8:	cd 40                	int    $0x40
    3cca:	c3                   	ret    

00003ccb <exec>:
SYSCALL(exec)
    3ccb:	b8 07 00 00 00       	mov    $0x7,%eax
    3cd0:	cd 40                	int    $0x40
    3cd2:	c3                   	ret    

00003cd3 <open>:
SYSCALL(open)
    3cd3:	b8 0f 00 00 00       	mov    $0xf,%eax
    3cd8:	cd 40                	int    $0x40
    3cda:	c3                   	ret    

00003cdb <mknod>:
SYSCALL(mknod)
    3cdb:	b8 11 00 00 00       	mov    $0x11,%eax
    3ce0:	cd 40                	int    $0x40
    3ce2:	c3                   	ret    

00003ce3 <unlink>:
SYSCALL(unlink)
    3ce3:	b8 12 00 00 00       	mov    $0x12,%eax
    3ce8:	cd 40                	int    $0x40
    3cea:	c3                   	ret    

00003ceb <fstat>:
SYSCALL(fstat)
    3ceb:	b8 08 00 00 00       	mov    $0x8,%eax
    3cf0:	cd 40                	int    $0x40
    3cf2:	c3                   	ret    

00003cf3 <link>:
SYSCALL(link)
    3cf3:	b8 13 00 00 00       	mov    $0x13,%eax
    3cf8:	cd 40                	int    $0x40
    3cfa:	c3                   	ret    

00003cfb <mkdir>:
SYSCALL(mkdir)
    3cfb:	b8 14 00 00 00       	mov    $0x14,%eax
    3d00:	cd 40                	int    $0x40
    3d02:	c3                   	ret    

00003d03 <chdir>:
SYSCALL(chdir)
    3d03:	b8 09 00 00 00       	mov    $0x9,%eax
    3d08:	cd 40                	int    $0x40
    3d0a:	c3                   	ret    

00003d0b <dup>:
SYSCALL(dup)
    3d0b:	b8 0a 00 00 00       	mov    $0xa,%eax
    3d10:	cd 40                	int    $0x40
    3d12:	c3                   	ret    

00003d13 <getpid>:
SYSCALL(getpid)
    3d13:	b8 0b 00 00 00       	mov    $0xb,%eax
    3d18:	cd 40                	int    $0x40
    3d1a:	c3                   	ret    

00003d1b <sbrk>:
SYSCALL(sbrk)
    3d1b:	b8 0c 00 00 00       	mov    $0xc,%eax
    3d20:	cd 40                	int    $0x40
    3d22:	c3                   	ret    

00003d23 <sleep>:
SYSCALL(sleep)
    3d23:	b8 0d 00 00 00       	mov    $0xd,%eax
    3d28:	cd 40                	int    $0x40
    3d2a:	c3                   	ret    

00003d2b <uptime>:
SYSCALL(uptime)
    3d2b:	b8 0e 00 00 00       	mov    $0xe,%eax
    3d30:	cd 40                	int    $0x40
    3d32:	c3                   	ret    

00003d33 <getMsg>:
SYSCALL(getMsg)
    3d33:	b8 16 00 00 00       	mov    $0x16,%eax
    3d38:	cd 40                	int    $0x40
    3d3a:	c3                   	ret    

00003d3b <createWindow>:
SYSCALL(createWindow)
    3d3b:	b8 17 00 00 00       	mov    $0x17,%eax
    3d40:	cd 40                	int    $0x40
    3d42:	c3                   	ret    

00003d43 <destroyWindow>:
SYSCALL(destroyWindow)
    3d43:	b8 18 00 00 00       	mov    $0x18,%eax
    3d48:	cd 40                	int    $0x40
    3d4a:	c3                   	ret    

00003d4b <updateWindow>:
SYSCALL(updateWindow)
    3d4b:	b8 19 00 00 00       	mov    $0x19,%eax
    3d50:	cd 40                	int    $0x40
    3d52:	c3                   	ret    

00003d53 <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3d53:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3d58:	cd 40                	int    $0x40
    3d5a:	c3                   	ret    

00003d5b <kwrite>:
SYSCALL(kwrite)
    3d5b:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3d60:	cd 40                	int    $0x40
    3d62:	c3                   	ret    

00003d63 <setSampleRate>:
SYSCALL(setSampleRate)
    3d63:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3d68:	cd 40                	int    $0x40
    3d6a:	c3                   	ret    

00003d6b <pause>:
SYSCALL(pause)
    3d6b:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3d70:	cd 40                	int    $0x40
    3d72:	c3                   	ret    

00003d73 <wavdecode>:
SYSCALL(wavdecode)
    3d73:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3d78:	cd 40                	int    $0x40
    3d7a:	c3                   	ret    

00003d7b <beginDecode>:
SYSCALL(beginDecode)
    3d7b:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3d80:	cd 40                	int    $0x40
    3d82:	c3                   	ret    

00003d83 <waitForDecode>:
SYSCALL(waitForDecode)
    3d83:	b8 20 00 00 00       	mov    $0x20,%eax
    3d88:	cd 40                	int    $0x40
    3d8a:	c3                   	ret    

00003d8b <endDecode>:
SYSCALL(endDecode)
    3d8b:	b8 21 00 00 00       	mov    $0x21,%eax
    3d90:	cd 40                	int    $0x40
    3d92:	c3                   	ret    

00003d93 <getCoreBuf>:
    3d93:	b8 22 00 00 00       	mov    $0x22,%eax
    3d98:	cd 40                	int    $0x40
    3d9a:	c3                   	ret    

00003d9b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3d9b:	55                   	push   %ebp
    3d9c:	89 e5                	mov    %esp,%ebp
    3d9e:	83 ec 18             	sub    $0x18,%esp
    3da1:	8b 45 0c             	mov    0xc(%ebp),%eax
    3da4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3da7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3dae:	00 
    3daf:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3db2:	89 44 24 04          	mov    %eax,0x4(%esp)
    3db6:	8b 45 08             	mov    0x8(%ebp),%eax
    3db9:	89 04 24             	mov    %eax,(%esp)
    3dbc:	e8 f2 fe ff ff       	call   3cb3 <write>
}
    3dc1:	c9                   	leave  
    3dc2:	c3                   	ret    

00003dc3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3dc3:	55                   	push   %ebp
    3dc4:	89 e5                	mov    %esp,%ebp
    3dc6:	56                   	push   %esi
    3dc7:	53                   	push   %ebx
    3dc8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3dcb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3dd2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3dd6:	74 17                	je     3def <printint+0x2c>
    3dd8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3ddc:	79 11                	jns    3def <printint+0x2c>
    neg = 1;
    3dde:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3de5:	8b 45 0c             	mov    0xc(%ebp),%eax
    3de8:	f7 d8                	neg    %eax
    3dea:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3ded:	eb 06                	jmp    3df5 <printint+0x32>
  } else {
    x = xx;
    3def:	8b 45 0c             	mov    0xc(%ebp),%eax
    3df2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3df5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3dfc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3dff:	8d 41 01             	lea    0x1(%ecx),%eax
    3e02:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3e05:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3e08:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e0b:	ba 00 00 00 00       	mov    $0x0,%edx
    3e10:	f7 f3                	div    %ebx
    3e12:	89 d0                	mov    %edx,%eax
    3e14:	0f b6 80 00 e6 00 00 	movzbl 0xe600(%eax),%eax
    3e1b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3e1f:	8b 75 10             	mov    0x10(%ebp),%esi
    3e22:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e25:	ba 00 00 00 00       	mov    $0x0,%edx
    3e2a:	f7 f6                	div    %esi
    3e2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3e2f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3e33:	75 c7                	jne    3dfc <printint+0x39>
  if(neg)
    3e35:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e39:	74 10                	je     3e4b <printint+0x88>
    buf[i++] = '-';
    3e3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e3e:	8d 50 01             	lea    0x1(%eax),%edx
    3e41:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3e44:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3e49:	eb 1f                	jmp    3e6a <printint+0xa7>
    3e4b:	eb 1d                	jmp    3e6a <printint+0xa7>
    putc(fd, buf[i]);
    3e4d:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e53:	01 d0                	add    %edx,%eax
    3e55:	0f b6 00             	movzbl (%eax),%eax
    3e58:	0f be c0             	movsbl %al,%eax
    3e5b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e5f:	8b 45 08             	mov    0x8(%ebp),%eax
    3e62:	89 04 24             	mov    %eax,(%esp)
    3e65:	e8 31 ff ff ff       	call   3d9b <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3e6a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3e6e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e72:	79 d9                	jns    3e4d <printint+0x8a>
    putc(fd, buf[i]);
}
    3e74:	83 c4 30             	add    $0x30,%esp
    3e77:	5b                   	pop    %ebx
    3e78:	5e                   	pop    %esi
    3e79:	5d                   	pop    %ebp
    3e7a:	c3                   	ret    

00003e7b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3e7b:	55                   	push   %ebp
    3e7c:	89 e5                	mov    %esp,%ebp
    3e7e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3e81:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3e88:	8d 45 0c             	lea    0xc(%ebp),%eax
    3e8b:	83 c0 04             	add    $0x4,%eax
    3e8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3e91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3e98:	e9 7c 01 00 00       	jmp    4019 <printf+0x19e>
    c = fmt[i] & 0xff;
    3e9d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ea3:	01 d0                	add    %edx,%eax
    3ea5:	0f b6 00             	movzbl (%eax),%eax
    3ea8:	0f be c0             	movsbl %al,%eax
    3eab:	25 ff 00 00 00       	and    $0xff,%eax
    3eb0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3eb3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3eb7:	75 2c                	jne    3ee5 <printf+0x6a>
      if(c == '%'){
    3eb9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3ebd:	75 0c                	jne    3ecb <printf+0x50>
        state = '%';
    3ebf:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3ec6:	e9 4a 01 00 00       	jmp    4015 <printf+0x19a>
      } else {
        putc(fd, c);
    3ecb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ece:	0f be c0             	movsbl %al,%eax
    3ed1:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ed5:	8b 45 08             	mov    0x8(%ebp),%eax
    3ed8:	89 04 24             	mov    %eax,(%esp)
    3edb:	e8 bb fe ff ff       	call   3d9b <putc>
    3ee0:	e9 30 01 00 00       	jmp    4015 <printf+0x19a>
      }
    } else if(state == '%'){
    3ee5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3ee9:	0f 85 26 01 00 00    	jne    4015 <printf+0x19a>
      if(c == 'd'){
    3eef:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3ef3:	75 2d                	jne    3f22 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    3ef5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ef8:	8b 00                	mov    (%eax),%eax
    3efa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3f01:	00 
    3f02:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3f09:	00 
    3f0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f0e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f11:	89 04 24             	mov    %eax,(%esp)
    3f14:	e8 aa fe ff ff       	call   3dc3 <printint>
        ap++;
    3f19:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f1d:	e9 ec 00 00 00       	jmp    400e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    3f22:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3f26:	74 06                	je     3f2e <printf+0xb3>
    3f28:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3f2c:	75 2d                	jne    3f5b <printf+0xe0>
        printint(fd, *ap, 16, 0);
    3f2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f31:	8b 00                	mov    (%eax),%eax
    3f33:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3f3a:	00 
    3f3b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    3f42:	00 
    3f43:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f47:	8b 45 08             	mov    0x8(%ebp),%eax
    3f4a:	89 04 24             	mov    %eax,(%esp)
    3f4d:	e8 71 fe ff ff       	call   3dc3 <printint>
        ap++;
    3f52:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f56:	e9 b3 00 00 00       	jmp    400e <printf+0x193>
      } else if(c == 's'){
    3f5b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3f5f:	75 45                	jne    3fa6 <printf+0x12b>
        s = (char*)*ap;
    3f61:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f64:	8b 00                	mov    (%eax),%eax
    3f66:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3f69:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3f6d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f71:	75 09                	jne    3f7c <printf+0x101>
          s = "(null)";
    3f73:	c7 45 f4 9f a9 00 00 	movl   $0xa99f,-0xc(%ebp)
        while(*s != 0){
    3f7a:	eb 1e                	jmp    3f9a <printf+0x11f>
    3f7c:	eb 1c                	jmp    3f9a <printf+0x11f>
          putc(fd, *s);
    3f7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f81:	0f b6 00             	movzbl (%eax),%eax
    3f84:	0f be c0             	movsbl %al,%eax
    3f87:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f8b:	8b 45 08             	mov    0x8(%ebp),%eax
    3f8e:	89 04 24             	mov    %eax,(%esp)
    3f91:	e8 05 fe ff ff       	call   3d9b <putc>
          s++;
    3f96:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3f9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f9d:	0f b6 00             	movzbl (%eax),%eax
    3fa0:	84 c0                	test   %al,%al
    3fa2:	75 da                	jne    3f7e <printf+0x103>
    3fa4:	eb 68                	jmp    400e <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3fa6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3faa:	75 1d                	jne    3fc9 <printf+0x14e>
        putc(fd, *ap);
    3fac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3faf:	8b 00                	mov    (%eax),%eax
    3fb1:	0f be c0             	movsbl %al,%eax
    3fb4:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fb8:	8b 45 08             	mov    0x8(%ebp),%eax
    3fbb:	89 04 24             	mov    %eax,(%esp)
    3fbe:	e8 d8 fd ff ff       	call   3d9b <putc>
        ap++;
    3fc3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3fc7:	eb 45                	jmp    400e <printf+0x193>
      } else if(c == '%'){
    3fc9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3fcd:	75 17                	jne    3fe6 <printf+0x16b>
        putc(fd, c);
    3fcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3fd2:	0f be c0             	movsbl %al,%eax
    3fd5:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fd9:	8b 45 08             	mov    0x8(%ebp),%eax
    3fdc:	89 04 24             	mov    %eax,(%esp)
    3fdf:	e8 b7 fd ff ff       	call   3d9b <putc>
    3fe4:	eb 28                	jmp    400e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3fe6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    3fed:	00 
    3fee:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff1:	89 04 24             	mov    %eax,(%esp)
    3ff4:	e8 a2 fd ff ff       	call   3d9b <putc>
        putc(fd, c);
    3ff9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ffc:	0f be c0             	movsbl %al,%eax
    3fff:	89 44 24 04          	mov    %eax,0x4(%esp)
    4003:	8b 45 08             	mov    0x8(%ebp),%eax
    4006:	89 04 24             	mov    %eax,(%esp)
    4009:	e8 8d fd ff ff       	call   3d9b <putc>
      }
      state = 0;
    400e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    4015:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4019:	8b 55 0c             	mov    0xc(%ebp),%edx
    401c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    401f:	01 d0                	add    %edx,%eax
    4021:	0f b6 00             	movzbl (%eax),%eax
    4024:	84 c0                	test   %al,%al
    4026:	0f 85 71 fe ff ff    	jne    3e9d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    402c:	c9                   	leave  
    402d:	c3                   	ret    

0000402e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    402e:	55                   	push   %ebp
    402f:	89 e5                	mov    %esp,%ebp
    4031:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4034:	8b 45 08             	mov    0x8(%ebp),%eax
    4037:	83 e8 08             	sub    $0x8,%eax
    403a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    403d:	a1 10 eb 00 00       	mov    0xeb10,%eax
    4042:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4045:	eb 24                	jmp    406b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4047:	8b 45 fc             	mov    -0x4(%ebp),%eax
    404a:	8b 00                	mov    (%eax),%eax
    404c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    404f:	77 12                	ja     4063 <free+0x35>
    4051:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4054:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4057:	77 24                	ja     407d <free+0x4f>
    4059:	8b 45 fc             	mov    -0x4(%ebp),%eax
    405c:	8b 00                	mov    (%eax),%eax
    405e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4061:	77 1a                	ja     407d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4063:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4066:	8b 00                	mov    (%eax),%eax
    4068:	89 45 fc             	mov    %eax,-0x4(%ebp)
    406b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    406e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4071:	76 d4                	jbe    4047 <free+0x19>
    4073:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4076:	8b 00                	mov    (%eax),%eax
    4078:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    407b:	76 ca                	jbe    4047 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    407d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4080:	8b 40 04             	mov    0x4(%eax),%eax
    4083:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    408a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    408d:	01 c2                	add    %eax,%edx
    408f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4092:	8b 00                	mov    (%eax),%eax
    4094:	39 c2                	cmp    %eax,%edx
    4096:	75 24                	jne    40bc <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    4098:	8b 45 f8             	mov    -0x8(%ebp),%eax
    409b:	8b 50 04             	mov    0x4(%eax),%edx
    409e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40a1:	8b 00                	mov    (%eax),%eax
    40a3:	8b 40 04             	mov    0x4(%eax),%eax
    40a6:	01 c2                	add    %eax,%edx
    40a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40ab:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    40ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40b1:	8b 00                	mov    (%eax),%eax
    40b3:	8b 10                	mov    (%eax),%edx
    40b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40b8:	89 10                	mov    %edx,(%eax)
    40ba:	eb 0a                	jmp    40c6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    40bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40bf:	8b 10                	mov    (%eax),%edx
    40c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40c4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    40c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40c9:	8b 40 04             	mov    0x4(%eax),%eax
    40cc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    40d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40d6:	01 d0                	add    %edx,%eax
    40d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    40db:	75 20                	jne    40fd <free+0xcf>
    p->s.size += bp->s.size;
    40dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40e0:	8b 50 04             	mov    0x4(%eax),%edx
    40e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40e6:	8b 40 04             	mov    0x4(%eax),%eax
    40e9:	01 c2                	add    %eax,%edx
    40eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40ee:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    40f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40f4:	8b 10                	mov    (%eax),%edx
    40f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40f9:	89 10                	mov    %edx,(%eax)
    40fb:	eb 08                	jmp    4105 <free+0xd7>
  } else
    p->s.ptr = bp;
    40fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4100:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4103:	89 10                	mov    %edx,(%eax)
  freep = p;
    4105:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4108:	a3 10 eb 00 00       	mov    %eax,0xeb10
}
    410d:	c9                   	leave  
    410e:	c3                   	ret    

0000410f <morecore>:

static Header*
morecore(uint nu)
{
    410f:	55                   	push   %ebp
    4110:	89 e5                	mov    %esp,%ebp
    4112:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4115:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    411c:	77 07                	ja     4125 <morecore+0x16>
    nu = 4096;
    411e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4125:	8b 45 08             	mov    0x8(%ebp),%eax
    4128:	c1 e0 03             	shl    $0x3,%eax
    412b:	89 04 24             	mov    %eax,(%esp)
    412e:	e8 e8 fb ff ff       	call   3d1b <sbrk>
    4133:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    4136:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    413a:	75 07                	jne    4143 <morecore+0x34>
    return 0;
    413c:	b8 00 00 00 00       	mov    $0x0,%eax
    4141:	eb 22                	jmp    4165 <morecore+0x56>
  hp = (Header*)p;
    4143:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4146:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4149:	8b 45 f0             	mov    -0x10(%ebp),%eax
    414c:	8b 55 08             	mov    0x8(%ebp),%edx
    414f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4152:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4155:	83 c0 08             	add    $0x8,%eax
    4158:	89 04 24             	mov    %eax,(%esp)
    415b:	e8 ce fe ff ff       	call   402e <free>
  return freep;
    4160:	a1 10 eb 00 00       	mov    0xeb10,%eax
}
    4165:	c9                   	leave  
    4166:	c3                   	ret    

00004167 <malloc>:

void*
malloc(uint nbytes)
{
    4167:	55                   	push   %ebp
    4168:	89 e5                	mov    %esp,%ebp
    416a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    416d:	8b 45 08             	mov    0x8(%ebp),%eax
    4170:	83 c0 07             	add    $0x7,%eax
    4173:	c1 e8 03             	shr    $0x3,%eax
    4176:	83 c0 01             	add    $0x1,%eax
    4179:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    417c:	a1 10 eb 00 00       	mov    0xeb10,%eax
    4181:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4184:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4188:	75 23                	jne    41ad <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    418a:	c7 45 f0 08 eb 00 00 	movl   $0xeb08,-0x10(%ebp)
    4191:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4194:	a3 10 eb 00 00       	mov    %eax,0xeb10
    4199:	a1 10 eb 00 00       	mov    0xeb10,%eax
    419e:	a3 08 eb 00 00       	mov    %eax,0xeb08
    base.s.size = 0;
    41a3:	c7 05 0c eb 00 00 00 	movl   $0x0,0xeb0c
    41aa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    41ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41b0:	8b 00                	mov    (%eax),%eax
    41b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    41b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41b8:	8b 40 04             	mov    0x4(%eax),%eax
    41bb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    41be:	72 4d                	jb     420d <malloc+0xa6>
      if(p->s.size == nunits)
    41c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41c3:	8b 40 04             	mov    0x4(%eax),%eax
    41c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    41c9:	75 0c                	jne    41d7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    41cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ce:	8b 10                	mov    (%eax),%edx
    41d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41d3:	89 10                	mov    %edx,(%eax)
    41d5:	eb 26                	jmp    41fd <malloc+0x96>
      else {
        p->s.size -= nunits;
    41d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41da:	8b 40 04             	mov    0x4(%eax),%eax
    41dd:	2b 45 ec             	sub    -0x14(%ebp),%eax
    41e0:	89 c2                	mov    %eax,%edx
    41e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41e5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    41e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41eb:	8b 40 04             	mov    0x4(%eax),%eax
    41ee:	c1 e0 03             	shl    $0x3,%eax
    41f1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    41f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41f7:	8b 55 ec             	mov    -0x14(%ebp),%edx
    41fa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    41fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4200:	a3 10 eb 00 00       	mov    %eax,0xeb10
      return (void*)(p + 1);
    4205:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4208:	83 c0 08             	add    $0x8,%eax
    420b:	eb 38                	jmp    4245 <malloc+0xde>
    }
    if(p == freep)
    420d:	a1 10 eb 00 00       	mov    0xeb10,%eax
    4212:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    4215:	75 1b                	jne    4232 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    4217:	8b 45 ec             	mov    -0x14(%ebp),%eax
    421a:	89 04 24             	mov    %eax,(%esp)
    421d:	e8 ed fe ff ff       	call   410f <morecore>
    4222:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4225:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4229:	75 07                	jne    4232 <malloc+0xcb>
        return 0;
    422b:	b8 00 00 00 00       	mov    $0x0,%eax
    4230:	eb 13                	jmp    4245 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4235:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4238:	8b 45 f4             	mov    -0xc(%ebp),%eax
    423b:	8b 00                	mov    (%eax),%eax
    423d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4240:	e9 70 ff ff ff       	jmp    41b5 <malloc+0x4e>
}
    4245:	c9                   	leave  
    4246:	c3                   	ret    

00004247 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    4247:	55                   	push   %ebp
    4248:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    424a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    424e:	79 07                	jns    4257 <abs+0x10>
		return x * -1;
    4250:	8b 45 08             	mov    0x8(%ebp),%eax
    4253:	f7 d8                	neg    %eax
    4255:	eb 03                	jmp    425a <abs+0x13>
	else
		return x;
    4257:	8b 45 08             	mov    0x8(%ebp),%eax
}
    425a:	5d                   	pop    %ebp
    425b:	c3                   	ret    

0000425c <sin>:
double sin(double x)  
{  
    425c:	55                   	push   %ebp
    425d:	89 e5                	mov    %esp,%ebp
    425f:	83 ec 3c             	sub    $0x3c,%esp
    4262:	8b 45 08             	mov    0x8(%ebp),%eax
    4265:	89 45 c8             	mov    %eax,-0x38(%ebp)
    4268:	8b 45 0c             	mov    0xc(%ebp),%eax
    426b:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    426e:	dd 45 c8             	fldl   -0x38(%ebp)
    4271:	dd 5d f8             	fstpl  -0x8(%ebp)
    4274:	d9 e8                	fld1   
    4276:	dd 5d f0             	fstpl  -0x10(%ebp)
    4279:	dd 45 c8             	fldl   -0x38(%ebp)
    427c:	dd 5d e8             	fstpl  -0x18(%ebp)
    427f:	dd 45 c8             	fldl   -0x38(%ebp)
    4282:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    4285:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    428c:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    4293:	eb 50                	jmp    42e5 <sin+0x89>
	{  
		n = n+1;  
    4295:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    4299:	db 45 dc             	fildl  -0x24(%ebp)
    429c:	dc 4d f0             	fmull  -0x10(%ebp)
    429f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    42a2:	83 c0 01             	add    $0x1,%eax
    42a5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    42a8:	db 45 c4             	fildl  -0x3c(%ebp)
    42ab:	de c9                	fmulp  %st,%st(1)
    42ad:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    42b0:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    42b4:	dd 45 c8             	fldl   -0x38(%ebp)
    42b7:	dc 4d c8             	fmull  -0x38(%ebp)
    42ba:	dd 45 e8             	fldl   -0x18(%ebp)
    42bd:	de c9                	fmulp  %st,%st(1)
    42bf:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    42c2:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    42c5:	dd 45 e8             	fldl   -0x18(%ebp)
    42c8:	dc 75 f0             	fdivl  -0x10(%ebp)
    42cb:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    42ce:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    42d2:	7e 08                	jle    42dc <sin+0x80>
    42d4:	dd 45 f8             	fldl   -0x8(%ebp)
    42d7:	dc 45 e0             	faddl  -0x20(%ebp)
    42da:	eb 06                	jmp    42e2 <sin+0x86>
    42dc:	dd 45 f8             	fldl   -0x8(%ebp)
    42df:	dc 65 e0             	fsubl  -0x20(%ebp)
    42e2:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    42e5:	dd 45 e0             	fldl   -0x20(%ebp)
    42e8:	dd 05 a8 a9 00 00    	fldl   0xa9a8
    42ee:	d9 c9                	fxch   %st(1)
    42f0:	df e9                	fucomip %st(1),%st
    42f2:	dd d8                	fstp   %st(0)
    42f4:	77 9f                	ja     4295 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    42f6:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    42f9:	c9                   	leave  
    42fa:	c3                   	ret    

000042fb <cos>:
double cos(double x)  
{  
    42fb:	55                   	push   %ebp
    42fc:	89 e5                	mov    %esp,%ebp
    42fe:	83 ec 10             	sub    $0x10,%esp
    4301:	8b 45 08             	mov    0x8(%ebp),%eax
    4304:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4307:	8b 45 0c             	mov    0xc(%ebp),%eax
    430a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    430d:	dd 05 b0 a9 00 00    	fldl   0xa9b0
    4313:	dc 65 f8             	fsubl  -0x8(%ebp)
    4316:	dd 1c 24             	fstpl  (%esp)
    4319:	e8 3e ff ff ff       	call   425c <sin>
}  
    431e:	c9                   	leave  
    431f:	c3                   	ret    

00004320 <tan>:
double tan(double x)  
{  
    4320:	55                   	push   %ebp
    4321:	89 e5                	mov    %esp,%ebp
    4323:	83 ec 18             	sub    $0x18,%esp
    4326:	8b 45 08             	mov    0x8(%ebp),%eax
    4329:	89 45 f8             	mov    %eax,-0x8(%ebp)
    432c:	8b 45 0c             	mov    0xc(%ebp),%eax
    432f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    4332:	dd 45 f8             	fldl   -0x8(%ebp)
    4335:	dd 1c 24             	fstpl  (%esp)
    4338:	e8 1f ff ff ff       	call   425c <sin>
    433d:	dd 5d f0             	fstpl  -0x10(%ebp)
    4340:	dd 45 f8             	fldl   -0x8(%ebp)
    4343:	dd 1c 24             	fstpl  (%esp)
    4346:	e8 b0 ff ff ff       	call   42fb <cos>
    434b:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    434e:	c9                   	leave  
    434f:	c3                   	ret    

00004350 <pow>:

double pow(double x, double y)
{
    4350:	55                   	push   %ebp
    4351:	89 e5                	mov    %esp,%ebp
    4353:	83 ec 48             	sub    $0x48,%esp
    4356:	8b 45 08             	mov    0x8(%ebp),%eax
    4359:	89 45 e0             	mov    %eax,-0x20(%ebp)
    435c:	8b 45 0c             	mov    0xc(%ebp),%eax
    435f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4362:	8b 45 10             	mov    0x10(%ebp),%eax
    4365:	89 45 d8             	mov    %eax,-0x28(%ebp)
    4368:	8b 45 14             	mov    0x14(%ebp),%eax
    436b:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    436e:	dd 45 e0             	fldl   -0x20(%ebp)
    4371:	d9 ee                	fldz   
    4373:	df e9                	fucomip %st(1),%st
    4375:	dd d8                	fstp   %st(0)
    4377:	7a 28                	jp     43a1 <pow+0x51>
    4379:	dd 45 e0             	fldl   -0x20(%ebp)
    437c:	d9 ee                	fldz   
    437e:	df e9                	fucomip %st(1),%st
    4380:	dd d8                	fstp   %st(0)
    4382:	75 1d                	jne    43a1 <pow+0x51>
    4384:	dd 45 d8             	fldl   -0x28(%ebp)
    4387:	d9 ee                	fldz   
    4389:	df e9                	fucomip %st(1),%st
    438b:	dd d8                	fstp   %st(0)
    438d:	7a 0b                	jp     439a <pow+0x4a>
    438f:	dd 45 d8             	fldl   -0x28(%ebp)
    4392:	d9 ee                	fldz   
    4394:	df e9                	fucomip %st(1),%st
    4396:	dd d8                	fstp   %st(0)
    4398:	74 07                	je     43a1 <pow+0x51>
    439a:	d9 ee                	fldz   
    439c:	e9 30 01 00 00       	jmp    44d1 <pow+0x181>
	else if(x==0 && y==0) return 1;
    43a1:	dd 45 e0             	fldl   -0x20(%ebp)
    43a4:	d9 ee                	fldz   
    43a6:	df e9                	fucomip %st(1),%st
    43a8:	dd d8                	fstp   %st(0)
    43aa:	7a 28                	jp     43d4 <pow+0x84>
    43ac:	dd 45 e0             	fldl   -0x20(%ebp)
    43af:	d9 ee                	fldz   
    43b1:	df e9                	fucomip %st(1),%st
    43b3:	dd d8                	fstp   %st(0)
    43b5:	75 1d                	jne    43d4 <pow+0x84>
    43b7:	dd 45 d8             	fldl   -0x28(%ebp)
    43ba:	d9 ee                	fldz   
    43bc:	df e9                	fucomip %st(1),%st
    43be:	dd d8                	fstp   %st(0)
    43c0:	7a 12                	jp     43d4 <pow+0x84>
    43c2:	dd 45 d8             	fldl   -0x28(%ebp)
    43c5:	d9 ee                	fldz   
    43c7:	df e9                	fucomip %st(1),%st
    43c9:	dd d8                	fstp   %st(0)
    43cb:	75 07                	jne    43d4 <pow+0x84>
    43cd:	d9 e8                	fld1   
    43cf:	e9 fd 00 00 00       	jmp    44d1 <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    43d4:	d9 ee                	fldz   
    43d6:	dd 45 d8             	fldl   -0x28(%ebp)
    43d9:	d9 c9                	fxch   %st(1)
    43db:	df e9                	fucomip %st(1),%st
    43dd:	dd d8                	fstp   %st(0)
    43df:	76 1d                	jbe    43fe <pow+0xae>
    43e1:	dd 45 d8             	fldl   -0x28(%ebp)
    43e4:	d9 e0                	fchs   
    43e6:	dd 5c 24 08          	fstpl  0x8(%esp)
    43ea:	dd 45 e0             	fldl   -0x20(%ebp)
    43ed:	dd 1c 24             	fstpl  (%esp)
    43f0:	e8 5b ff ff ff       	call   4350 <pow>
    43f5:	d9 e8                	fld1   
    43f7:	de f1                	fdivp  %st,%st(1)
    43f9:	e9 d3 00 00 00       	jmp    44d1 <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    43fe:	d9 ee                	fldz   
    4400:	dd 45 e0             	fldl   -0x20(%ebp)
    4403:	d9 c9                	fxch   %st(1)
    4405:	df e9                	fucomip %st(1),%st
    4407:	dd d8                	fstp   %st(0)
    4409:	76 40                	jbe    444b <pow+0xfb>
    440b:	dd 45 d8             	fldl   -0x28(%ebp)
    440e:	d9 7d d6             	fnstcw -0x2a(%ebp)
    4411:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4415:	b4 0c                	mov    $0xc,%ah
    4417:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    441b:	d9 6d d4             	fldcw  -0x2c(%ebp)
    441e:	db 5d d0             	fistpl -0x30(%ebp)
    4421:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4424:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4427:	89 45 d0             	mov    %eax,-0x30(%ebp)
    442a:	db 45 d0             	fildl  -0x30(%ebp)
    442d:	dd 45 d8             	fldl   -0x28(%ebp)
    4430:	de e1                	fsubp  %st,%st(1)
    4432:	d9 ee                	fldz   
    4434:	df e9                	fucomip %st(1),%st
    4436:	7a 0a                	jp     4442 <pow+0xf2>
    4438:	d9 ee                	fldz   
    443a:	df e9                	fucomip %st(1),%st
    443c:	dd d8                	fstp   %st(0)
    443e:	74 0b                	je     444b <pow+0xfb>
    4440:	eb 02                	jmp    4444 <pow+0xf4>
    4442:	dd d8                	fstp   %st(0)
    4444:	d9 ee                	fldz   
    4446:	e9 86 00 00 00       	jmp    44d1 <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    444b:	d9 ee                	fldz   
    444d:	dd 45 e0             	fldl   -0x20(%ebp)
    4450:	d9 c9                	fxch   %st(1)
    4452:	df e9                	fucomip %st(1),%st
    4454:	dd d8                	fstp   %st(0)
    4456:	76 63                	jbe    44bb <pow+0x16b>
    4458:	dd 45 d8             	fldl   -0x28(%ebp)
    445b:	d9 7d d6             	fnstcw -0x2a(%ebp)
    445e:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    4462:	b4 0c                	mov    $0xc,%ah
    4464:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    4468:	d9 6d d4             	fldcw  -0x2c(%ebp)
    446b:	db 5d d0             	fistpl -0x30(%ebp)
    446e:	d9 6d d6             	fldcw  -0x2a(%ebp)
    4471:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4474:	89 45 d0             	mov    %eax,-0x30(%ebp)
    4477:	db 45 d0             	fildl  -0x30(%ebp)
    447a:	dd 45 d8             	fldl   -0x28(%ebp)
    447d:	de e1                	fsubp  %st,%st(1)
    447f:	d9 ee                	fldz   
    4481:	df e9                	fucomip %st(1),%st
    4483:	7a 34                	jp     44b9 <pow+0x169>
    4485:	d9 ee                	fldz   
    4487:	df e9                	fucomip %st(1),%st
    4489:	dd d8                	fstp   %st(0)
    448b:	75 2e                	jne    44bb <pow+0x16b>
	{
		double powint=1;
    448d:	d9 e8                	fld1   
    448f:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    4492:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    4499:	eb 0d                	jmp    44a8 <pow+0x158>
    449b:	dd 45 f0             	fldl   -0x10(%ebp)
    449e:	dc 4d e0             	fmull  -0x20(%ebp)
    44a1:	dd 5d f0             	fstpl  -0x10(%ebp)
    44a4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    44a8:	db 45 ec             	fildl  -0x14(%ebp)
    44ab:	dd 45 d8             	fldl   -0x28(%ebp)
    44ae:	df e9                	fucomip %st(1),%st
    44b0:	dd d8                	fstp   %st(0)
    44b2:	73 e7                	jae    449b <pow+0x14b>
		return powint;
    44b4:	dd 45 f0             	fldl   -0x10(%ebp)
    44b7:	eb 18                	jmp    44d1 <pow+0x181>
    44b9:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    44bb:	dd 45 e0             	fldl   -0x20(%ebp)
    44be:	dd 1c 24             	fstpl  (%esp)
    44c1:	e8 36 00 00 00       	call   44fc <ln>
    44c6:	dc 4d d8             	fmull  -0x28(%ebp)
    44c9:	dd 1c 24             	fstpl  (%esp)
    44cc:	e8 0e 02 00 00       	call   46df <exp>
}
    44d1:	c9                   	leave  
    44d2:	c3                   	ret    

000044d3 <sqrt>:
// 求根
double sqrt(double x)
{
    44d3:	55                   	push   %ebp
    44d4:	89 e5                	mov    %esp,%ebp
    44d6:	83 ec 28             	sub    $0x28,%esp
    44d9:	8b 45 08             	mov    0x8(%ebp),%eax
    44dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    44df:	8b 45 0c             	mov    0xc(%ebp),%eax
    44e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    44e5:	dd 05 b8 a9 00 00    	fldl   0xa9b8
    44eb:	dd 5c 24 08          	fstpl  0x8(%esp)
    44ef:	dd 45 f0             	fldl   -0x10(%ebp)
    44f2:	dd 1c 24             	fstpl  (%esp)
    44f5:	e8 56 fe ff ff       	call   4350 <pow>
}
    44fa:	c9                   	leave  
    44fb:	c3                   	ret    

000044fc <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    44fc:	55                   	push   %ebp
    44fd:	89 e5                	mov    %esp,%ebp
    44ff:	81 ec 88 00 00 00    	sub    $0x88,%esp
    4505:	8b 45 08             	mov    0x8(%ebp),%eax
    4508:	89 45 90             	mov    %eax,-0x70(%ebp)
    450b:	8b 45 0c             	mov    0xc(%ebp),%eax
    450e:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    4511:	dd 45 90             	fldl   -0x70(%ebp)
    4514:	d9 e8                	fld1   
    4516:	de e9                	fsubrp %st,%st(1)
    4518:	dd 5d c0             	fstpl  -0x40(%ebp)
    451b:	d9 ee                	fldz   
    451d:	dd 5d f0             	fstpl  -0x10(%ebp)
    4520:	d9 ee                	fldz   
    4522:	dd 5d b8             	fstpl  -0x48(%ebp)
    4525:	d9 ee                	fldz   
    4527:	dd 5d b0             	fstpl  -0x50(%ebp)
    452a:	d9 ee                	fldz   
    452c:	dd 5d e8             	fstpl  -0x18(%ebp)
    452f:	d9 e8                	fld1   
    4531:	dd 5d e0             	fstpl  -0x20(%ebp)
    4534:	d9 e8                	fld1   
    4536:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    4539:	dd 45 90             	fldl   -0x70(%ebp)
    453c:	d9 e8                	fld1   
    453e:	df e9                	fucomip %st(1),%st
    4540:	dd d8                	fstp   %st(0)
    4542:	7a 12                	jp     4556 <ln+0x5a>
    4544:	dd 45 90             	fldl   -0x70(%ebp)
    4547:	d9 e8                	fld1   
    4549:	df e9                	fucomip %st(1),%st
    454b:	dd d8                	fstp   %st(0)
    454d:	75 07                	jne    4556 <ln+0x5a>
    454f:	d9 ee                	fldz   
    4551:	e9 87 01 00 00       	jmp    46dd <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    4556:	dd 45 90             	fldl   -0x70(%ebp)
    4559:	dd 05 c0 a9 00 00    	fldl   0xa9c0
    455f:	d9 c9                	fxch   %st(1)
    4561:	df e9                	fucomip %st(1),%st
    4563:	dd d8                	fstp   %st(0)
    4565:	76 14                	jbe    457b <ln+0x7f>
    4567:	d9 e8                	fld1   
    4569:	dc 75 90             	fdivl  -0x70(%ebp)
    456c:	dd 1c 24             	fstpl  (%esp)
    456f:	e8 88 ff ff ff       	call   44fc <ln>
    4574:	d9 e0                	fchs   
    4576:	e9 62 01 00 00       	jmp    46dd <ln+0x1e1>
	else if(x<.1)
    457b:	dd 05 c8 a9 00 00    	fldl   0xa9c8
    4581:	dd 45 90             	fldl   -0x70(%ebp)
    4584:	d9 c9                	fxch   %st(1)
    4586:	df e9                	fucomip %st(1),%st
    4588:	dd d8                	fstp   %st(0)
    458a:	76 59                	jbe    45e5 <ln+0xe9>
	{
		double n=-1;
    458c:	d9 e8                	fld1   
    458e:	d9 e0                	fchs   
    4590:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    4593:	dd 45 c8             	fldl   -0x38(%ebp)
    4596:	dd 05 d0 a9 00 00    	fldl   0xa9d0
    459c:	de e9                	fsubrp %st,%st(1)
    459e:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    45a1:	dd 45 c8             	fldl   -0x38(%ebp)
    45a4:	dd 1c 24             	fstpl  (%esp)
    45a7:	e8 33 01 00 00       	call   46df <exp>
    45ac:	dd 45 90             	fldl   -0x70(%ebp)
    45af:	de f1                	fdivp  %st,%st(1)
    45b1:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    45b4:	dd 45 a0             	fldl   -0x60(%ebp)
    45b7:	dd 05 c0 a9 00 00    	fldl   0xa9c0
    45bd:	d9 c9                	fxch   %st(1)
    45bf:	df e9                	fucomip %st(1),%st
    45c1:	dd d8                	fstp   %st(0)
    45c3:	77 ce                	ja     4593 <ln+0x97>
    45c5:	d9 e8                	fld1   
    45c7:	dd 45 a0             	fldl   -0x60(%ebp)
    45ca:	d9 c9                	fxch   %st(1)
    45cc:	df e9                	fucomip %st(1),%st
    45ce:	dd d8                	fstp   %st(0)
    45d0:	77 c1                	ja     4593 <ln+0x97>
		return ln(a)+n;
    45d2:	dd 45 a0             	fldl   -0x60(%ebp)
    45d5:	dd 1c 24             	fstpl  (%esp)
    45d8:	e8 1f ff ff ff       	call   44fc <ln>
    45dd:	dc 45 c8             	faddl  -0x38(%ebp)
    45e0:	e9 f8 00 00 00       	jmp    46dd <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    45e5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    45ec:	d9 e8                	fld1   
    45ee:	dd 5d d8             	fstpl  -0x28(%ebp)
    45f1:	e9 b6 00 00 00       	jmp    46ac <ln+0x1b0>
	{
		ln_tmp=ln_px;
    45f6:	dd 45 e8             	fldl   -0x18(%ebp)
    45f9:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    45fc:	dd 45 d8             	fldl   -0x28(%ebp)
    45ff:	dc 4d c0             	fmull  -0x40(%ebp)
    4602:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    4605:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    4609:	75 0d                	jne    4618 <ln+0x11c>
    460b:	db 45 d4             	fildl  -0x2c(%ebp)
    460e:	dd 45 d8             	fldl   -0x28(%ebp)
    4611:	de f1                	fdivp  %st,%st(1)
    4613:	dd 5d d8             	fstpl  -0x28(%ebp)
    4616:	eb 13                	jmp    462b <ln+0x12f>
		else tmp=tmp/-l;
    4618:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    461b:	f7 d8                	neg    %eax
    461d:	89 45 8c             	mov    %eax,-0x74(%ebp)
    4620:	db 45 8c             	fildl  -0x74(%ebp)
    4623:	dd 45 d8             	fldl   -0x28(%ebp)
    4626:	de f1                	fdivp  %st,%st(1)
    4628:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    462b:	dd 45 f0             	fldl   -0x10(%ebp)
    462e:	dc 45 d8             	faddl  -0x28(%ebp)
    4631:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    4634:	dd 45 d8             	fldl   -0x28(%ebp)
    4637:	d9 e0                	fchs   
    4639:	dc 4d c0             	fmull  -0x40(%ebp)
    463c:	db 45 d4             	fildl  -0x2c(%ebp)
    463f:	de c9                	fmulp  %st,%st(1)
    4641:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4644:	83 c0 01             	add    $0x1,%eax
    4647:	89 45 8c             	mov    %eax,-0x74(%ebp)
    464a:	db 45 8c             	fildl  -0x74(%ebp)
    464d:	de f9                	fdivrp %st,%st(1)
    464f:	dc 45 f0             	faddl  -0x10(%ebp)
    4652:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    4655:	dd 45 d8             	fldl   -0x28(%ebp)
    4658:	dc 4d c0             	fmull  -0x40(%ebp)
    465b:	dc 4d c0             	fmull  -0x40(%ebp)
    465e:	db 45 d4             	fildl  -0x2c(%ebp)
    4661:	de c9                	fmulp  %st,%st(1)
    4663:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4666:	83 c0 02             	add    $0x2,%eax
    4669:	89 45 8c             	mov    %eax,-0x74(%ebp)
    466c:	db 45 8c             	fildl  -0x74(%ebp)
    466f:	de f9                	fdivrp %st,%st(1)
    4671:	dc 45 b8             	faddl  -0x48(%ebp)
    4674:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    4677:	dd 45 b0             	fldl   -0x50(%ebp)
    467a:	dc 65 b8             	fsubl  -0x48(%ebp)
    467d:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    4680:	dd 45 a8             	fldl   -0x58(%ebp)
    4683:	dc 4d a8             	fmull  -0x58(%ebp)
    4686:	dd 45 b8             	fldl   -0x48(%ebp)
    4689:	d8 c0                	fadd   %st(0),%st
    468b:	dd 45 b0             	fldl   -0x50(%ebp)
    468e:	de e1                	fsubp  %st,%st(1)
    4690:	dc 45 f0             	faddl  -0x10(%ebp)
    4693:	de f9                	fdivrp %st,%st(1)
    4695:	dd 45 b0             	fldl   -0x50(%ebp)
    4698:	de e1                	fsubp  %st,%st(1)
    469a:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    469d:	db 45 d4             	fildl  -0x2c(%ebp)
    46a0:	dd 45 d8             	fldl   -0x28(%ebp)
    46a3:	de c9                	fmulp  %st,%st(1)
    46a5:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    46a8:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    46ac:	dd 45 e8             	fldl   -0x18(%ebp)
    46af:	dc 65 e0             	fsubl  -0x20(%ebp)
    46b2:	dd 05 d8 a9 00 00    	fldl   0xa9d8
    46b8:	d9 c9                	fxch   %st(1)
    46ba:	df e9                	fucomip %st(1),%st
    46bc:	dd d8                	fstp   %st(0)
    46be:	0f 87 32 ff ff ff    	ja     45f6 <ln+0xfa>
    46c4:	dd 45 e8             	fldl   -0x18(%ebp)
    46c7:	dc 65 e0             	fsubl  -0x20(%ebp)
    46ca:	dd 05 e0 a9 00 00    	fldl   0xa9e0
    46d0:	df e9                	fucomip %st(1),%st
    46d2:	dd d8                	fstp   %st(0)
    46d4:	0f 87 1c ff ff ff    	ja     45f6 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    46da:	dd 45 e8             	fldl   -0x18(%ebp)
}
    46dd:	c9                   	leave  
    46de:	c3                   	ret    

000046df <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    46df:	55                   	push   %ebp
    46e0:	89 e5                	mov    %esp,%ebp
    46e2:	83 ec 78             	sub    $0x78,%esp
    46e5:	8b 45 08             	mov    0x8(%ebp),%eax
    46e8:	89 45 a0             	mov    %eax,-0x60(%ebp)
    46eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    46ee:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    46f1:	dd 45 a0             	fldl   -0x60(%ebp)
    46f4:	dd 5d c0             	fstpl  -0x40(%ebp)
    46f7:	d9 ee                	fldz   
    46f9:	dd 5d f0             	fstpl  -0x10(%ebp)
    46fc:	d9 ee                	fldz   
    46fe:	dd 5d b8             	fstpl  -0x48(%ebp)
    4701:	d9 ee                	fldz   
    4703:	dd 5d b0             	fstpl  -0x50(%ebp)
    4706:	d9 ee                	fldz   
    4708:	dd 5d e8             	fstpl  -0x18(%ebp)
    470b:	d9 e8                	fld1   
    470d:	dd 5d e0             	fstpl  -0x20(%ebp)
    4710:	d9 e8                	fld1   
    4712:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    4715:	dd 45 a0             	fldl   -0x60(%ebp)
    4718:	d9 ee                	fldz   
    471a:	df e9                	fucomip %st(1),%st
    471c:	dd d8                	fstp   %st(0)
    471e:	7a 12                	jp     4732 <exp+0x53>
    4720:	dd 45 a0             	fldl   -0x60(%ebp)
    4723:	d9 ee                	fldz   
    4725:	df e9                	fucomip %st(1),%st
    4727:	dd d8                	fstp   %st(0)
    4729:	75 07                	jne    4732 <exp+0x53>
    472b:	d9 e8                	fld1   
    472d:	e9 08 01 00 00       	jmp    483a <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    4732:	d9 ee                	fldz   
    4734:	dd 45 a0             	fldl   -0x60(%ebp)
    4737:	d9 c9                	fxch   %st(1)
    4739:	df e9                	fucomip %st(1),%st
    473b:	dd d8                	fstp   %st(0)
    473d:	76 16                	jbe    4755 <exp+0x76>
    473f:	dd 45 a0             	fldl   -0x60(%ebp)
    4742:	d9 e0                	fchs   
    4744:	dd 1c 24             	fstpl  (%esp)
    4747:	e8 93 ff ff ff       	call   46df <exp>
    474c:	d9 e8                	fld1   
    474e:	de f1                	fdivp  %st,%st(1)
    4750:	e9 e5 00 00 00       	jmp    483a <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    4755:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    475c:	d9 e8                	fld1   
    475e:	dd 5d d0             	fstpl  -0x30(%ebp)
    4761:	e9 92 00 00 00       	jmp    47f8 <exp+0x119>
	{
		ex_tmp=ex_px;
    4766:	dd 45 e8             	fldl   -0x18(%ebp)
    4769:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    476c:	dd 45 d0             	fldl   -0x30(%ebp)
    476f:	dc 4d c0             	fmull  -0x40(%ebp)
    4772:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    4775:	db 45 cc             	fildl  -0x34(%ebp)
    4778:	dd 45 d0             	fldl   -0x30(%ebp)
    477b:	de f1                	fdivp  %st,%st(1)
    477d:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    4780:	dd 45 f0             	fldl   -0x10(%ebp)
    4783:	dc 45 d0             	faddl  -0x30(%ebp)
    4786:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    4789:	dd 45 d0             	fldl   -0x30(%ebp)
    478c:	dc 4d c0             	fmull  -0x40(%ebp)
    478f:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4792:	83 c0 01             	add    $0x1,%eax
    4795:	89 45 9c             	mov    %eax,-0x64(%ebp)
    4798:	db 45 9c             	fildl  -0x64(%ebp)
    479b:	de f9                	fdivrp %st,%st(1)
    479d:	dc 45 f0             	faddl  -0x10(%ebp)
    47a0:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    47a3:	dd 45 d0             	fldl   -0x30(%ebp)
    47a6:	dc 4d c0             	fmull  -0x40(%ebp)
    47a9:	dc 4d c0             	fmull  -0x40(%ebp)
    47ac:	8b 45 cc             	mov    -0x34(%ebp),%eax
    47af:	83 c0 01             	add    $0x1,%eax
    47b2:	89 45 9c             	mov    %eax,-0x64(%ebp)
    47b5:	db 45 9c             	fildl  -0x64(%ebp)
    47b8:	de f9                	fdivrp %st,%st(1)
    47ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
    47bd:	83 c0 02             	add    $0x2,%eax
    47c0:	89 45 9c             	mov    %eax,-0x64(%ebp)
    47c3:	db 45 9c             	fildl  -0x64(%ebp)
    47c6:	de f9                	fdivrp %st,%st(1)
    47c8:	dc 45 b8             	faddl  -0x48(%ebp)
    47cb:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    47ce:	dd 45 b0             	fldl   -0x50(%ebp)
    47d1:	dc 65 b8             	fsubl  -0x48(%ebp)
    47d4:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    47d7:	dd 45 d8             	fldl   -0x28(%ebp)
    47da:	dc 4d d8             	fmull  -0x28(%ebp)
    47dd:	dd 45 b8             	fldl   -0x48(%ebp)
    47e0:	d8 c0                	fadd   %st(0),%st
    47e2:	dd 45 b0             	fldl   -0x50(%ebp)
    47e5:	de e1                	fsubp  %st,%st(1)
    47e7:	dc 45 f0             	faddl  -0x10(%ebp)
    47ea:	de f9                	fdivrp %st,%st(1)
    47ec:	dd 45 b0             	fldl   -0x50(%ebp)
    47ef:	de e1                	fsubp  %st,%st(1)
    47f1:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    47f4:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    47f8:	dd 45 e8             	fldl   -0x18(%ebp)
    47fb:	dc 65 e0             	fsubl  -0x20(%ebp)
    47fe:	dd 05 e8 a9 00 00    	fldl   0xa9e8
    4804:	d9 c9                	fxch   %st(1)
    4806:	df e9                	fucomip %st(1),%st
    4808:	dd d8                	fstp   %st(0)
    480a:	77 12                	ja     481e <exp+0x13f>
    480c:	dd 45 e8             	fldl   -0x18(%ebp)
    480f:	dc 65 e0             	fsubl  -0x20(%ebp)
    4812:	dd 05 f0 a9 00 00    	fldl   0xa9f0
    4818:	df e9                	fucomip %st(1),%st
    481a:	dd d8                	fstp   %st(0)
    481c:	76 15                	jbe    4833 <exp+0x154>
    481e:	dd 45 d8             	fldl   -0x28(%ebp)
    4821:	dd 05 e8 a9 00 00    	fldl   0xa9e8
    4827:	d9 c9                	fxch   %st(1)
    4829:	df e9                	fucomip %st(1),%st
    482b:	dd d8                	fstp   %st(0)
    482d:	0f 87 33 ff ff ff    	ja     4766 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    4833:	dd 45 e8             	fldl   -0x18(%ebp)
    4836:	d9 e8                	fld1   
    4838:	de c1                	faddp  %st,%st(1)
    483a:	c9                   	leave  
    483b:	c3                   	ret    

0000483c <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    483c:	55                   	push   %ebp
    483d:	89 e5                	mov    %esp,%ebp
    483f:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    4842:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4846:	8b 45 08             	mov    0x8(%ebp),%eax
    4849:	89 44 24 04          	mov    %eax,0x4(%esp)
    484d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4850:	89 04 24             	mov    %eax,(%esp)
    4853:	e8 f8 f1 ff ff       	call   3a50 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4858:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    485f:	00 
    4860:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4863:	89 04 24             	mov    %eax,(%esp)
    4866:	e8 68 f4 ff ff       	call   3cd3 <open>
    486b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    486e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4872:	75 1b                	jne    488f <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    4874:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4877:	89 44 24 08          	mov    %eax,0x8(%esp)
    487b:	c7 44 24 04 24 aa 00 	movl   $0xaa24,0x4(%esp)
    4882:	00 
    4883:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    488a:	e8 ec f5 ff ff       	call   3e7b <printf>
    }
    return f;
    488f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4892:	c9                   	leave  
    4893:	c3                   	ret    

00004894 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    4894:	55                   	push   %ebp
    4895:	89 e5                	mov    %esp,%ebp
    4897:	57                   	push   %edi
    4898:	56                   	push   %esi
    4899:	53                   	push   %ebx
    489a:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    489d:	8b 45 08             	mov    0x8(%ebp),%eax
    48a0:	8b 00                	mov    (%eax),%eax
    48a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    48a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48a8:	8b 78 14             	mov    0x14(%eax),%edi
    48ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48ae:	8b 70 10             	mov    0x10(%eax),%esi
    48b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48b4:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    48b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48ba:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    48bd:	85 c0                	test   %eax,%eax
    48bf:	0f 94 c0             	sete   %al
    48c2:	0f b6 c8             	movzbl %al,%ecx
    48c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48c8:	8b 50 04             	mov    0x4(%eax),%edx
    48cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48ce:	8b 00                	mov    (%eax),%eax
    48d0:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    48d4:	89 74 24 18          	mov    %esi,0x18(%esp)
    48d8:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    48dc:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    48e0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    48e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    48e8:	c7 44 24 04 44 aa 00 	movl   $0xaa44,0x4(%esp)
    48ef:	00 
    48f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48f7:	e8 7f f5 ff ff       	call   3e7b <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    48fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    48ff:	8b 78 2c             	mov    0x2c(%eax),%edi
    4902:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4905:	8b 70 28             	mov    0x28(%eax),%esi
    4908:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    490b:	8b 58 24             	mov    0x24(%eax),%ebx
    490e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4911:	8b 48 20             	mov    0x20(%eax),%ecx
    4914:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4917:	8b 50 1c             	mov    0x1c(%eax),%edx
    491a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    491d:	8b 40 18             	mov    0x18(%eax),%eax
    4920:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    4924:	89 74 24 18          	mov    %esi,0x18(%esp)
    4928:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    492c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    4930:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4934:	89 44 24 08          	mov    %eax,0x8(%esp)
    4938:	c7 44 24 04 84 aa 00 	movl   $0xaa84,0x4(%esp)
    493f:	00 
    4940:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4947:	e8 2f f5 ff ff       	call   3e7b <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    494c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    494f:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4952:	8b 0c 85 20 e7 00 00 	mov    0xe720(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4959:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    495c:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    495f:	dd 04 c5 00 e7 00 00 	fldl   0xe700(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4966:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4969:	8b 40 04             	mov    0x4(%eax),%eax
    496c:	8d 50 ff             	lea    -0x1(%eax),%edx
    496f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4972:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4975:	89 d0                	mov    %edx,%eax
    4977:	c1 e0 04             	shl    $0x4,%eax
    497a:	29 d0                	sub    %edx,%eax
    497c:	01 d8                	add    %ebx,%eax
    497e:	8b 14 85 40 e6 00 00 	mov    0xe640(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4985:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4988:	8b 40 04             	mov    0x4(%eax),%eax
    498b:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    498e:	8b 04 85 20 e6 00 00 	mov    0xe620(,%eax,4),%eax
    4995:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4999:	dd 5c 24 10          	fstpl  0x10(%esp)
    499d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    49a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    49a5:	c7 44 24 04 ac aa 00 	movl   $0xaaac,0x4(%esp)
    49ac:	00 
    49ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    49b4:	e8 c2 f4 ff ff       	call   3e7b <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    49b9:	8b 45 08             	mov    0x8(%ebp),%eax
    49bc:	8b 48 08             	mov    0x8(%eax),%ecx
    49bf:	8b 45 08             	mov    0x8(%ebp),%eax
    49c2:	8b 50 0c             	mov    0xc(%eax),%edx
    49c5:	8b 45 08             	mov    0x8(%ebp),%eax
    49c8:	8b 40 10             	mov    0x10(%eax),%eax
    49cb:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    49cf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    49d3:	89 44 24 08          	mov    %eax,0x8(%esp)
    49d7:	c7 44 24 04 db aa 00 	movl   $0xaadb,0x4(%esp)
    49de:	00 
    49df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    49e6:	e8 90 f4 ff ff       	call   3e7b <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    49eb:	83 c4 3c             	add    $0x3c,%esp
    49ee:	5b                   	pop    %ebx
    49ef:	5e                   	pop    %esi
    49f0:	5f                   	pop    %edi
    49f1:	5d                   	pop    %ebp
    49f2:	c3                   	ret    

000049f3 <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    49f3:	55                   	push   %ebp
    49f4:	89 e5                	mov    %esp,%ebp
    49f6:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    49f9:	8b 45 08             	mov    0x8(%ebp),%eax
    49fc:	89 04 24             	mov    %eax,(%esp)
    49ff:	e8 63 f7 ff ff       	call   4167 <malloc>
    4a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    4a07:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4a0b:	74 1c                	je     4a29 <mem_alloc+0x36>
		memset(ptr, 0, block);
    4a0d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a10:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a14:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4a1b:	00 
    4a1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a1f:	89 04 24             	mov    %eax,(%esp)
    4a22:	e8 bf f0 ff ff       	call   3ae6 <memset>
    4a27:	eb 20                	jmp    4a49 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4a29:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a30:	c7 44 24 04 f5 aa 00 	movl   $0xaaf5,0x4(%esp)
    4a37:	00 
    4a38:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4a3f:	e8 37 f4 ff ff       	call   3e7b <printf>
		exit();
    4a44:	e8 4a f2 ff ff       	call   3c93 <exit>
	}
	return ptr;
    4a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4a4c:	c9                   	leave  
    4a4d:	c3                   	ret    

00004a4e <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4a4e:	55                   	push   %ebp
    4a4f:	89 e5                	mov    %esp,%ebp
    4a51:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    4a54:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a57:	c7 44 24 04 0c ab 00 	movl   $0xab0c,0x4(%esp)
    4a5e:	00 
    4a5f:	89 04 24             	mov    %eax,(%esp)
    4a62:	e8 8c ff ff ff       	call   49f3 <mem_alloc>
    4a67:	8b 55 08             	mov    0x8(%ebp),%edx
    4a6a:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    4a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    4a70:	8b 55 0c             	mov    0xc(%ebp),%edx
    4a73:	89 50 08             	mov    %edx,0x8(%eax)
}
    4a76:	c9                   	leave  
    4a77:	c3                   	ret    

00004a78 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4a78:	55                   	push   %ebp
    4a79:	89 e5                	mov    %esp,%ebp
    4a7b:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    4a7e:	8b 45 08             	mov    0x8(%ebp),%eax
    4a81:	8b 40 04             	mov    0x4(%eax),%eax
    4a84:	89 04 24             	mov    %eax,(%esp)
    4a87:	e8 a2 f5 ff ff       	call   402e <free>
}
    4a8c:	c9                   	leave  
    4a8d:	c3                   	ret    

00004a8e <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4a8e:	55                   	push   %ebp
    4a8f:	89 e5                	mov    %esp,%ebp
    4a91:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    4a94:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    4a9b:	00 
    4a9c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a9f:	89 04 24             	mov    %eax,(%esp)
    4aa2:	e8 2c f2 ff ff       	call   3cd3 <open>
    4aa7:	8b 55 08             	mov    0x8(%ebp),%edx
    4aaa:	89 02                	mov    %eax,(%edx)
    4aac:	8b 45 08             	mov    0x8(%ebp),%eax
    4aaf:	8b 00                	mov    (%eax),%eax
    4ab1:	83 f8 ff             	cmp    $0xffffffff,%eax
    4ab4:	75 20                	jne    4ad6 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    4ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ab9:	89 44 24 08          	mov    %eax,0x8(%esp)
    4abd:	c7 44 24 04 13 ab 00 	movl   $0xab13,0x4(%esp)
    4ac4:	00 
    4ac5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4acc:	e8 aa f3 ff ff       	call   3e7b <printf>
		exit();
    4ad1:	e8 bd f1 ff ff       	call   3c93 <exit>
	}

	bs->format = BINARY;
    4ad6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ad9:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    4add:	8b 45 10             	mov    0x10(%ebp),%eax
    4ae0:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ae4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ae7:	89 04 24             	mov    %eax,(%esp)
    4aea:	e8 5f ff ff ff       	call   4a4e <alloc_buffer>
	bs->buf_byte_idx=0;
    4aef:	8b 45 08             	mov    0x8(%ebp),%eax
    4af2:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    4af9:	8b 45 08             	mov    0x8(%ebp),%eax
    4afc:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    4b03:	8b 45 08             	mov    0x8(%ebp),%eax
    4b06:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    4b0d:	8b 45 08             	mov    0x8(%ebp),%eax
    4b10:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4b17:	8b 45 08             	mov    0x8(%ebp),%eax
    4b1a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    4b21:	8b 45 08             	mov    0x8(%ebp),%eax
    4b24:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    4b2b:	c9                   	leave  
    4b2c:	c3                   	ret    

00004b2d <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    4b2d:	55                   	push   %ebp
    4b2e:	89 e5                	mov    %esp,%ebp
    4b30:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    4b33:	8b 45 08             	mov    0x8(%ebp),%eax
    4b36:	8b 00                	mov    (%eax),%eax
    4b38:	89 04 24             	mov    %eax,(%esp)
    4b3b:	e8 7b f1 ff ff       	call   3cbb <close>
	desalloc_buffer(bs);
    4b40:	8b 45 08             	mov    0x8(%ebp),%eax
    4b43:	89 04 24             	mov    %eax,(%esp)
    4b46:	e8 2d ff ff ff       	call   4a78 <desalloc_buffer>
}
    4b4b:	c9                   	leave  
    4b4c:	c3                   	ret    

00004b4d <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    4b4d:	55                   	push   %ebp
    4b4e:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    4b50:	8b 45 08             	mov    0x8(%ebp),%eax
    4b53:	8b 40 20             	mov    0x20(%eax),%eax
}
    4b56:	5d                   	pop    %ebp
    4b57:	c3                   	ret    

00004b58 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    4b58:	55                   	push   %ebp
    4b59:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    4b5b:	8b 45 08             	mov    0x8(%ebp),%eax
    4b5e:	8b 40 0c             	mov    0xc(%eax),%eax
}
    4b61:	5d                   	pop    %ebp
    4b62:	c3                   	ret    

00004b63 <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    4b63:	55                   	push   %ebp
    4b64:	89 e5                	mov    %esp,%ebp
    4b66:	56                   	push   %esi
    4b67:	53                   	push   %ebx
    4b68:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    4b6b:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6e:	8b 40 08             	mov    0x8(%eax),%eax
    4b71:	8d 50 fe             	lea    -0x2(%eax),%edx
    4b74:	8b 45 08             	mov    0x8(%ebp),%eax
    4b77:	8b 40 10             	mov    0x10(%eax),%eax
    4b7a:	89 d3                	mov    %edx,%ebx
    4b7c:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    4b7e:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    4b83:	eb 35                	jmp    4bba <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4b85:	8b 45 08             	mov    0x8(%ebp),%eax
    4b88:	8b 50 04             	mov    0x4(%eax),%edx
    4b8b:	89 d8                	mov    %ebx,%eax
    4b8d:	8d 58 ff             	lea    -0x1(%eax),%ebx
    4b90:	01 c2                	add    %eax,%edx
    4b92:	8b 45 08             	mov    0x8(%ebp),%eax
    4b95:	8b 00                	mov    (%eax),%eax
    4b97:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4b9e:	00 
    4b9f:	89 54 24 04          	mov    %edx,0x4(%esp)
    4ba3:	89 04 24             	mov    %eax,(%esp)
    4ba6:	e8 00 f1 ff ff       	call   3cab <read>
    4bab:	89 c6                	mov    %eax,%esi
		if (!n)
    4bad:	85 f6                	test   %esi,%esi
    4baf:	75 09                	jne    4bba <refill_buffer+0x57>
		bs->eob= i+1;
    4bb1:	8d 53 01             	lea    0x1(%ebx),%edx
    4bb4:	8b 45 08             	mov    0x8(%ebp),%eax
    4bb7:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    4bba:	85 db                	test   %ebx,%ebx
    4bbc:	78 0a                	js     4bc8 <refill_buffer+0x65>
    4bbe:	8b 45 08             	mov    0x8(%ebp),%eax
    4bc1:	8b 40 1c             	mov    0x1c(%eax),%eax
    4bc4:	85 c0                	test   %eax,%eax
    4bc6:	74 bd                	je     4b85 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    4bc8:	83 c4 10             	add    $0x10,%esp
    4bcb:	5b                   	pop    %ebx
    4bcc:	5e                   	pop    %esi
    4bcd:	5d                   	pop    %ebp
    4bce:	c3                   	ret    

00004bcf <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    4bcf:	55                   	push   %ebp
    4bd0:	89 e5                	mov    %esp,%ebp
    4bd2:	53                   	push   %ebx
    4bd3:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    4bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd9:	8b 40 0c             	mov    0xc(%eax),%eax
    4bdc:	8d 50 01             	lea    0x1(%eax),%edx
    4bdf:	8b 45 08             	mov    0x8(%ebp),%eax
    4be2:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    4be5:	8b 45 08             	mov    0x8(%ebp),%eax
    4be8:	8b 40 14             	mov    0x14(%eax),%eax
    4beb:	85 c0                	test   %eax,%eax
    4bed:	0f 85 9f 00 00 00    	jne    4c92 <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    4bf3:	8b 45 08             	mov    0x8(%ebp),%eax
    4bf6:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    4bfd:	8b 45 08             	mov    0x8(%ebp),%eax
    4c00:	8b 40 10             	mov    0x10(%eax),%eax
    4c03:	8d 50 ff             	lea    -0x1(%eax),%edx
    4c06:	8b 45 08             	mov    0x8(%ebp),%eax
    4c09:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4c0c:	8b 45 08             	mov    0x8(%ebp),%eax
    4c0f:	8b 40 10             	mov    0x10(%eax),%eax
    4c12:	83 f8 03             	cmp    $0x3,%eax
    4c15:	7e 10                	jle    4c27 <get1bit+0x58>
    4c17:	8b 45 08             	mov    0x8(%ebp),%eax
    4c1a:	8b 50 10             	mov    0x10(%eax),%edx
    4c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    4c20:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c23:	39 c2                	cmp    %eax,%edx
    4c25:	7d 6b                	jge    4c92 <get1bit+0xc3>
             if (bs->eob)
    4c27:	8b 45 08             	mov    0x8(%ebp),%eax
    4c2a:	8b 40 1c             	mov    0x1c(%eax),%eax
    4c2d:	85 c0                	test   %eax,%eax
    4c2f:	74 0c                	je     4c3d <get1bit+0x6e>
                bs->eobs = TRUE;
    4c31:	8b 45 08             	mov    0x8(%ebp),%eax
    4c34:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4c3b:	eb 55                	jmp    4c92 <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4c3d:	8b 45 08             	mov    0x8(%ebp),%eax
    4c40:	8b 58 10             	mov    0x10(%eax),%ebx
    4c43:	eb 2f                	jmp    4c74 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4c45:	8b 45 08             	mov    0x8(%ebp),%eax
    4c48:	8b 50 04             	mov    0x4(%eax),%edx
    4c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    4c4e:	8b 40 08             	mov    0x8(%eax),%eax
    4c51:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4c54:	8b 45 08             	mov    0x8(%ebp),%eax
    4c57:	8b 40 10             	mov    0x10(%eax),%eax
    4c5a:	29 c1                	sub    %eax,%ecx
    4c5c:	89 c8                	mov    %ecx,%eax
    4c5e:	01 d8                	add    %ebx,%eax
    4c60:	01 c2                	add    %eax,%edx
    4c62:	8b 45 08             	mov    0x8(%ebp),%eax
    4c65:	8b 48 04             	mov    0x4(%eax),%ecx
    4c68:	89 d8                	mov    %ebx,%eax
    4c6a:	01 c8                	add    %ecx,%eax
    4c6c:	0f b6 00             	movzbl (%eax),%eax
    4c6f:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4c71:	83 eb 01             	sub    $0x1,%ebx
    4c74:	85 db                	test   %ebx,%ebx
    4c76:	79 cd                	jns    4c45 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    4c78:	8b 45 08             	mov    0x8(%ebp),%eax
    4c7b:	89 04 24             	mov    %eax,(%esp)
    4c7e:	e8 e0 fe ff ff       	call   4b63 <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    4c83:	8b 45 08             	mov    0x8(%ebp),%eax
    4c86:	8b 40 08             	mov    0x8(%eax),%eax
    4c89:	8d 50 ff             	lea    -0x1(%eax),%edx
    4c8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4c8f:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    4c92:	8b 45 08             	mov    0x8(%ebp),%eax
    4c95:	8b 50 04             	mov    0x4(%eax),%edx
    4c98:	8b 45 08             	mov    0x8(%ebp),%eax
    4c9b:	8b 40 10             	mov    0x10(%eax),%eax
    4c9e:	01 d0                	add    %edx,%eax
    4ca0:	0f b6 00             	movzbl (%eax),%eax
    4ca3:	0f b6 d0             	movzbl %al,%edx
    4ca6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ca9:	8b 40 14             	mov    0x14(%eax),%eax
    4cac:	83 e8 01             	sub    $0x1,%eax
    4caf:	8b 04 85 40 e7 00 00 	mov    0xe740(,%eax,4),%eax
    4cb6:	21 d0                	and    %edx,%eax
    4cb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    4cbb:	8b 45 08             	mov    0x8(%ebp),%eax
    4cbe:	8b 40 14             	mov    0x14(%eax),%eax
    4cc1:	83 e8 01             	sub    $0x1,%eax
    4cc4:	89 c1                	mov    %eax,%ecx
    4cc6:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    4cc9:	8b 45 08             	mov    0x8(%ebp),%eax
    4ccc:	8b 40 14             	mov    0x14(%eax),%eax
    4ccf:	8d 50 ff             	lea    -0x1(%eax),%edx
    4cd2:	8b 45 08             	mov    0x8(%ebp),%eax
    4cd5:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    4cd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4cdb:	83 c4 24             	add    $0x24,%esp
    4cde:	5b                   	pop    %ebx
    4cdf:	5d                   	pop    %ebp
    4ce0:	c3                   	ret    

00004ce1 <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    4ce1:	55                   	push   %ebp
    4ce2:	89 e5                	mov    %esp,%ebp
    4ce4:	57                   	push   %edi
    4ce5:	56                   	push   %esi
    4ce6:	53                   	push   %ebx
    4ce7:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    4cea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    4cf1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    4cf4:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    4cf8:	7e 1c                	jle    4d16 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    4cfa:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    4d01:	00 
    4d02:	c7 44 24 04 2c ab 00 	movl   $0xab2c,0x4(%esp)
    4d09:	00 
    4d0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d11:	e8 65 f1 ff ff       	call   3e7b <printf>

	bs->totbit += N;
    4d16:	8b 45 08             	mov    0x8(%ebp),%eax
    4d19:	8b 50 0c             	mov    0xc(%eax),%edx
    4d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4d1f:	01 c2                	add    %eax,%edx
    4d21:	8b 45 08             	mov    0x8(%ebp),%eax
    4d24:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    4d27:	e9 0a 01 00 00       	jmp    4e36 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    4d2c:	8b 45 08             	mov    0x8(%ebp),%eax
    4d2f:	8b 40 14             	mov    0x14(%eax),%eax
    4d32:	85 c0                	test   %eax,%eax
    4d34:	0f 85 9f 00 00 00    	jne    4dd9 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    4d3a:	8b 45 08             	mov    0x8(%ebp),%eax
    4d3d:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    4d44:	8b 45 08             	mov    0x8(%ebp),%eax
    4d47:	8b 40 10             	mov    0x10(%eax),%eax
    4d4a:	8d 50 ff             	lea    -0x1(%eax),%edx
    4d4d:	8b 45 08             	mov    0x8(%ebp),%eax
    4d50:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    4d53:	8b 45 08             	mov    0x8(%ebp),%eax
    4d56:	8b 40 10             	mov    0x10(%eax),%eax
    4d59:	83 f8 03             	cmp    $0x3,%eax
    4d5c:	7e 10                	jle    4d6e <getbits+0x8d>
    4d5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d61:	8b 50 10             	mov    0x10(%eax),%edx
    4d64:	8b 45 08             	mov    0x8(%ebp),%eax
    4d67:	8b 40 1c             	mov    0x1c(%eax),%eax
    4d6a:	39 c2                	cmp    %eax,%edx
    4d6c:	7d 6b                	jge    4dd9 <getbits+0xf8>
				if (bs->eob)
    4d6e:	8b 45 08             	mov    0x8(%ebp),%eax
    4d71:	8b 40 1c             	mov    0x1c(%eax),%eax
    4d74:	85 c0                	test   %eax,%eax
    4d76:	74 0c                	je     4d84 <getbits+0xa3>
					bs->eobs = TRUE;
    4d78:	8b 45 08             	mov    0x8(%ebp),%eax
    4d7b:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4d82:	eb 55                	jmp    4dd9 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4d84:	8b 45 08             	mov    0x8(%ebp),%eax
    4d87:	8b 70 10             	mov    0x10(%eax),%esi
    4d8a:	eb 2f                	jmp    4dbb <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4d8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4d8f:	8b 50 04             	mov    0x4(%eax),%edx
    4d92:	8b 45 08             	mov    0x8(%ebp),%eax
    4d95:	8b 40 08             	mov    0x8(%eax),%eax
    4d98:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4d9b:	8b 45 08             	mov    0x8(%ebp),%eax
    4d9e:	8b 40 10             	mov    0x10(%eax),%eax
    4da1:	29 c1                	sub    %eax,%ecx
    4da3:	89 c8                	mov    %ecx,%eax
    4da5:	01 f0                	add    %esi,%eax
    4da7:	01 c2                	add    %eax,%edx
    4da9:	8b 45 08             	mov    0x8(%ebp),%eax
    4dac:	8b 48 04             	mov    0x4(%eax),%ecx
    4daf:	89 f0                	mov    %esi,%eax
    4db1:	01 c8                	add    %ecx,%eax
    4db3:	0f b6 00             	movzbl (%eax),%eax
    4db6:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    4db8:	83 ee 01             	sub    $0x1,%esi
    4dbb:	85 f6                	test   %esi,%esi
    4dbd:	79 cd                	jns    4d8c <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    4dbf:	8b 45 08             	mov    0x8(%ebp),%eax
    4dc2:	89 04 24             	mov    %eax,(%esp)
    4dc5:	e8 99 fd ff ff       	call   4b63 <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    4dca:	8b 45 08             	mov    0x8(%ebp),%eax
    4dcd:	8b 40 08             	mov    0x8(%eax),%eax
    4dd0:	8d 50 ff             	lea    -0x1(%eax),%edx
    4dd3:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd6:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    4dd9:	8b 45 08             	mov    0x8(%ebp),%eax
    4ddc:	8b 40 14             	mov    0x14(%eax),%eax
    4ddf:	39 d8                	cmp    %ebx,%eax
    4de1:	0f 4f c3             	cmovg  %ebx,%eax
    4de4:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    4de6:	8b 45 08             	mov    0x8(%ebp),%eax
    4de9:	8b 50 04             	mov    0x4(%eax),%edx
    4dec:	8b 45 08             	mov    0x8(%ebp),%eax
    4def:	8b 40 10             	mov    0x10(%eax),%eax
    4df2:	01 d0                	add    %edx,%eax
    4df4:	0f b6 00             	movzbl (%eax),%eax
    4df7:	0f b6 d0             	movzbl %al,%edx
    4dfa:	8b 45 08             	mov    0x8(%ebp),%eax
    4dfd:	8b 40 14             	mov    0x14(%eax),%eax
    4e00:	8b 04 85 60 e7 00 00 	mov    0xe760(,%eax,4),%eax
    4e07:	89 d7                	mov    %edx,%edi
    4e09:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    4e0b:	8b 45 08             	mov    0x8(%ebp),%eax
    4e0e:	8b 40 14             	mov    0x14(%eax),%eax
    4e11:	29 f0                	sub    %esi,%eax
    4e13:	89 c1                	mov    %eax,%ecx
    4e15:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    4e17:	89 d8                	mov    %ebx,%eax
    4e19:	29 f0                	sub    %esi,%eax
    4e1b:	89 c1                	mov    %eax,%ecx
    4e1d:	d3 e7                	shl    %cl,%edi
    4e1f:	89 f8                	mov    %edi,%eax
    4e21:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    4e24:	8b 45 08             	mov    0x8(%ebp),%eax
    4e27:	8b 40 14             	mov    0x14(%eax),%eax
    4e2a:	29 f0                	sub    %esi,%eax
    4e2c:	89 c2                	mov    %eax,%edx
    4e2e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e31:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    4e34:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    4e36:	85 db                	test   %ebx,%ebx
    4e38:	0f 8f ee fe ff ff    	jg     4d2c <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    4e3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    4e41:	83 c4 2c             	add    $0x2c,%esp
    4e44:	5b                   	pop    %ebx
    4e45:	5e                   	pop    %esi
    4e46:	5f                   	pop    %edi
    4e47:	5d                   	pop    %ebp
    4e48:	c3                   	ret    

00004e49 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    4e49:	55                   	push   %ebp
    4e4a:	89 e5                	mov    %esp,%ebp
    4e4c:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4e4f:	db 45 10             	fildl  0x10(%ebp)
    4e52:	dd 5c 24 08          	fstpl  0x8(%esp)
    4e56:	dd 05 98 ab 00 00    	fldl   0xab98
    4e5c:	dd 1c 24             	fstpl  (%esp)
    4e5f:	e8 ec f4 ff ff       	call   4350 <pow>
    4e64:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4e67:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    4e6b:	b4 0c                	mov    $0xc,%ah
    4e6d:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4e71:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4e74:	db 5d e0             	fistpl -0x20(%ebp)
    4e77:	d9 6d e6             	fldcw  -0x1a(%ebp)
    4e7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4e7d:	83 e8 01             	sub    $0x1,%eax
    4e80:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4e83:	8b 45 08             	mov    0x8(%ebp),%eax
    4e86:	89 04 24             	mov    %eax,(%esp)
    4e89:	e8 ca fc ff ff       	call   4b58 <sstell>
    4e8e:	83 e0 07             	and    $0x7,%eax
    4e91:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4e94:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4e98:	74 17                	je     4eb1 <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    4e9a:	b8 08 00 00 00       	mov    $0x8,%eax
    4e9f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4ea2:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ea6:	8b 45 08             	mov    0x8(%ebp),%eax
    4ea9:	89 04 24             	mov    %eax,(%esp)
    4eac:	e8 30 fe ff ff       	call   4ce1 <getbits>

	val = getbits(bs, N);
    4eb1:	8b 45 10             	mov    0x10(%ebp),%eax
    4eb4:	89 44 24 04          	mov    %eax,0x4(%esp)
    4eb8:	8b 45 08             	mov    0x8(%ebp),%eax
    4ebb:	89 04 24             	mov    %eax,(%esp)
    4ebe:	e8 1e fe ff ff       	call   4ce1 <getbits>
    4ec3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4ec6:	eb 1a                	jmp    4ee2 <seek_sync+0x99>
		val <<= ALIGNING;
    4ec8:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    4ecc:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    4ed3:	00 
    4ed4:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed7:	89 04 24             	mov    %eax,(%esp)
    4eda:	e8 02 fe ff ff       	call   4ce1 <getbits>
    4edf:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4ee2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ee5:	23 45 f4             	and    -0xc(%ebp),%eax
    4ee8:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4eeb:	74 0f                	je     4efc <seek_sync+0xb3>
    4eed:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef0:	89 04 24             	mov    %eax,(%esp)
    4ef3:	e8 55 fc ff ff       	call   4b4d <end_bs>
    4ef8:	85 c0                	test   %eax,%eax
    4efa:	74 cc                	je     4ec8 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    4efc:	8b 45 08             	mov    0x8(%ebp),%eax
    4eff:	89 04 24             	mov    %eax,(%esp)
    4f02:	e8 46 fc ff ff       	call   4b4d <end_bs>
    4f07:	85 c0                	test   %eax,%eax
    4f09:	74 07                	je     4f12 <seek_sync+0xc9>
		return(0);
    4f0b:	b8 00 00 00 00       	mov    $0x0,%eax
    4f10:	eb 05                	jmp    4f17 <seek_sync+0xce>
	else
		return(1);
    4f12:	b8 01 00 00 00       	mov    $0x1,%eax
}
    4f17:	c9                   	leave  
    4f18:	c3                   	ret    

00004f19 <js_bound>:

int js_bound(int lay, int m_ext)
{
    4f19:	55                   	push   %ebp
    4f1a:	89 e5                	mov    %esp,%ebp
    4f1c:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    4f1f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4f23:	7e 12                	jle    4f37 <js_bound+0x1e>
    4f25:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    4f29:	7f 0c                	jg     4f37 <js_bound+0x1e>
    4f2b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4f2f:	78 06                	js     4f37 <js_bound+0x1e>
    4f31:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    4f35:	7e 27                	jle    4f5e <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    4f37:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f3a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4f3e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f41:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f45:	c7 44 24 04 60 ab 00 	movl   $0xab60,0x4(%esp)
    4f4c:	00 
    4f4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f54:	e8 22 ef ff ff       	call   3e7b <printf>
        exit();
    4f59:	e8 35 ed ff ff       	call   3c93 <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4f5e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f61:	83 e8 01             	sub    $0x1,%eax
    4f64:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4f6b:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f6e:	01 d0                	add    %edx,%eax
    4f70:	8b 04 85 a0 e7 00 00 	mov    0xe7a0(,%eax,4),%eax
}
    4f77:	c9                   	leave  
    4f78:	c3                   	ret    

00004f79 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    4f79:	55                   	push   %ebp
    4f7a:	89 e5                	mov    %esp,%ebp
    4f7c:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4f7f:	8b 45 08             	mov    0x8(%ebp),%eax
    4f82:	8b 00                	mov    (%eax),%eax
    4f84:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4f87:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f8a:	8b 50 1c             	mov    0x1c(%eax),%edx
    4f8d:	8b 45 08             	mov    0x8(%ebp),%eax
    4f90:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4f93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4f96:	8b 40 1c             	mov    0x1c(%eax),%eax
    4f99:	83 f8 03             	cmp    $0x3,%eax
    4f9c:	75 07                	jne    4fa5 <hdr_to_frps+0x2c>
    4f9e:	b8 01 00 00 00       	mov    $0x1,%eax
    4fa3:	eb 05                	jmp    4faa <hdr_to_frps+0x31>
    4fa5:	b8 02 00 00 00       	mov    $0x2,%eax
    4faa:	8b 55 08             	mov    0x8(%ebp),%edx
    4fad:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    4fb0:	8b 45 08             	mov    0x8(%ebp),%eax
    4fb3:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    4fba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fbd:	8b 40 1c             	mov    0x1c(%eax),%eax
    4fc0:	83 f8 01             	cmp    $0x1,%eax
    4fc3:	75 20                	jne    4fe5 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fc8:	8b 50 20             	mov    0x20(%eax),%edx
    4fcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4fce:	8b 40 04             	mov    0x4(%eax),%eax
    4fd1:	89 54 24 04          	mov    %edx,0x4(%esp)
    4fd5:	89 04 24             	mov    %eax,(%esp)
    4fd8:	e8 3c ff ff ff       	call   4f19 <js_bound>
    4fdd:	8b 55 08             	mov    0x8(%ebp),%edx
    4fe0:	89 42 0c             	mov    %eax,0xc(%edx)
    4fe3:	eb 0c                	jmp    4ff1 <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4fe5:	8b 45 08             	mov    0x8(%ebp),%eax
    4fe8:	8b 50 10             	mov    0x10(%eax),%edx
    4feb:	8b 45 08             	mov    0x8(%ebp),%eax
    4fee:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4ff1:	c9                   	leave  
    4ff2:	c3                   	ret    

00004ff3 <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    4ff3:	55                   	push   %ebp
    4ff4:	89 e5                	mov    %esp,%ebp
    4ff6:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    4ff9:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    4ffd:	74 19                	je     5018 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    4fff:	c7 44 24 04 83 ab 00 	movl   $0xab83,0x4(%esp)
    5006:	00 
    5007:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    500e:	e8 68 ee ff ff       	call   3e7b <printf>
		exit();
    5013:	e8 7b ec ff ff       	call   3c93 <exit>
	}
	getCoreBuf(1, val);
    5018:	8b 45 08             	mov    0x8(%ebp),%eax
    501b:	89 44 24 04          	mov    %eax,0x4(%esp)
    501f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5026:	e8 68 ed ff ff       	call   3d93 <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    502b:	c9                   	leave  
    502c:	c3                   	ret    

0000502d <hsstell>:

unsigned long hsstell()
{
    502d:	55                   	push   %ebp
    502e:	89 e5                	mov    %esp,%ebp
    5030:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    5033:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    503a:	00 
    503b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    5042:	e8 4c ed ff ff       	call   3d93 <getCoreBuf>
//	return(totbit);
}
    5047:	c9                   	leave  
    5048:	c3                   	ret    

00005049 <hgetbits>:

unsigned long hgetbits(int N)
{
    5049:	55                   	push   %ebp
    504a:	89 e5                	mov    %esp,%ebp
    504c:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    504f:	8b 45 08             	mov    0x8(%ebp),%eax
    5052:	89 44 24 04          	mov    %eax,0x4(%esp)
    5056:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    505d:	e8 31 ed ff ff       	call   3d93 <getCoreBuf>
}
    5062:	c9                   	leave  
    5063:	c3                   	ret    

00005064 <hget1bit>:


unsigned int hget1bit()
{
    5064:	55                   	push   %ebp
    5065:	89 e5                	mov    %esp,%ebp
    5067:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    506a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    5071:	e8 d3 ff ff ff       	call   5049 <hgetbits>
}
    5076:	c9                   	leave  
    5077:	c3                   	ret    

00005078 <rewindNbits>:


void rewindNbits(int N)
{
    5078:	55                   	push   %ebp
    5079:	89 e5                	mov    %esp,%ebp
    507b:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    507e:	8b 45 08             	mov    0x8(%ebp),%eax
    5081:	89 44 24 04          	mov    %eax,0x4(%esp)
    5085:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    508c:	e8 02 ed ff ff       	call   3d93 <getCoreBuf>
}
    5091:	c9                   	leave  
    5092:	c3                   	ret    

00005093 <rewindNbytes>:


void rewindNbytes(int N)
{
    5093:	55                   	push   %ebp
    5094:	89 e5                	mov    %esp,%ebp
    5096:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    5099:	8b 45 08             	mov    0x8(%ebp),%eax
    509c:	89 44 24 04          	mov    %eax,0x4(%esp)
    50a0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    50a7:	e8 e7 ec ff ff       	call   3d93 <getCoreBuf>
}
    50ac:	c9                   	leave  
    50ad:	c3                   	ret    

000050ae <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    50ae:	55                   	push   %ebp
    50af:	89 e5                	mov    %esp,%ebp
    50b1:	57                   	push   %edi
    50b2:	56                   	push   %esi
    50b3:	53                   	push   %ebx
    50b4:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    50ba:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    50be:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    50c2:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    50c6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    50ca:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    50ce:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    50d2:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    50d6:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    50da:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    50de:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    50e2:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    50e6:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    50ea:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    50ee:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    50f2:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    50f6:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    50fa:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    50fe:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    5102:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    5106:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    510a:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    510e:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    5112:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    5116:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    511a:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    511e:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    5122:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    5126:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    512a:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    512e:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    5132:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    5136:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    513a:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    513e:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    5142:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    5146:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    514a:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    514e:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    5152:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    5156:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    515a:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    515e:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    5162:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    5166:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    516a:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    516e:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    5172:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    5176:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    517a:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    517e:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    5182:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    5186:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    518a:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    518e:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    5192:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    5196:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    519a:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    519e:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    51a2:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    51a6:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    51aa:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    51ae:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    51b2:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    51b6:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    51ba:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    51be:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    51c2:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    51c6:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    51ca:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    51ce:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    51d2:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    51d6:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    51da:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    51de:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    51e2:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    51e6:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    51ea:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    51ee:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    51f2:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    51f6:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    51fa:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    51fe:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    5202:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    5209:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    5210:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    5217:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    521e:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    5225:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    522c:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    5233:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    523a:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    5241:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    5248:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    524f:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    5256:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    525d:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    5264:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    526b:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    5272:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    5279:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    5280:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    5287:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    528e:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    5295:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    529c:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    52a3:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    52aa:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    52b1:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    52b8:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    52bf:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    52c6:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    52ca:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    52ce:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    52d2:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    52d6:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    52da:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    52de:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    52e2:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    52e6:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    52ea:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    52ee:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    52f2:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    52f6:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    52fa:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    52fe:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    5302:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    5306:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    530a:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    530e:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    5312:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    5316:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    531a:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    531e:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    5322:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    5326:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    532a:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    532e:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    5332:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    5336:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    533a:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    533e:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    5342:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    5346:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    534a:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    534e:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    5355:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    535c:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    5363:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    536a:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    5371:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    5378:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    537f:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    5386:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    538d:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    5394:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    539b:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    53a2:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    53a9:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    53b0:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    53b7:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    53be:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    53c5:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    53cc:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    53d3:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    53da:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    53e1:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    53e8:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    53ef:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    53f6:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    53fd:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    5404:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    540b:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    5412:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    5419:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    5420:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    5427:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    542e:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    5435:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    543c:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    5443:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    544a:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    5451:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    5458:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    545f:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    5466:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    546d:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    5474:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    547b:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    5482:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    5489:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    5490:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    5497:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    549e:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    54a5:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    54ac:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    54b3:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    54ba:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    54c1:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    54c8:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    54cf:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    54d6:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    54dd:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    54e4:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    54eb:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    54f2:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    54f9:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5500:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    5506:	b8 a0 ab 00 00       	mov    $0xaba0,%eax
    550b:	b9 23 00 00 00       	mov    $0x23,%ecx
    5510:	89 d7                	mov    %edx,%edi
    5512:	89 c6                	mov    %eax,%esi
    5514:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5516:	89 f0                	mov    %esi,%eax
    5518:	89 fa                	mov    %edi,%edx
    551a:	0f b7 08             	movzwl (%eax),%ecx
    551d:	66 89 0a             	mov    %cx,(%edx)
    5520:	83 c2 02             	add    $0x2,%edx
    5523:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    5526:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    552c:	ba 40 ac 00 00       	mov    $0xac40,%edx
    5531:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    5536:	89 c1                	mov    %eax,%ecx
    5538:	83 e1 02             	and    $0x2,%ecx
    553b:	85 c9                	test   %ecx,%ecx
    553d:	74 0f                	je     554e <read_decoder_table+0x4a0>
    553f:	0f b7 0a             	movzwl (%edx),%ecx
    5542:	66 89 08             	mov    %cx,(%eax)
    5545:	83 c0 02             	add    $0x2,%eax
    5548:	83 c2 02             	add    $0x2,%edx
    554b:	83 eb 02             	sub    $0x2,%ebx
    554e:	89 d9                	mov    %ebx,%ecx
    5550:	c1 e9 02             	shr    $0x2,%ecx
    5553:	89 c7                	mov    %eax,%edi
    5555:	89 d6                	mov    %edx,%esi
    5557:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5559:	89 f2                	mov    %esi,%edx
    555b:	89 f8                	mov    %edi,%eax
    555d:	b9 00 00 00 00       	mov    $0x0,%ecx
    5562:	89 de                	mov    %ebx,%esi
    5564:	83 e6 02             	and    $0x2,%esi
    5567:	85 f6                	test   %esi,%esi
    5569:	74 0b                	je     5576 <read_decoder_table+0x4c8>
    556b:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    556f:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    5573:	83 c1 02             	add    $0x2,%ecx
    5576:	83 e3 01             	and    $0x1,%ebx
    5579:	85 db                	test   %ebx,%ebx
    557b:	74 07                	je     5584 <read_decoder_table+0x4d6>
    557d:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5581:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    5584:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    558a:	b8 e0 ac 00 00       	mov    $0xace0,%eax
    558f:	b9 23 00 00 00       	mov    $0x23,%ecx
    5594:	89 d7                	mov    %edx,%edi
    5596:	89 c6                	mov    %eax,%esi
    5598:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    559a:	89 f0                	mov    %esi,%eax
    559c:	89 fa                	mov    %edi,%edx
    559e:	0f b7 08             	movzwl (%eax),%ecx
    55a1:	66 89 0a             	mov    %cx,(%edx)
    55a4:	83 c2 02             	add    $0x2,%edx
    55a7:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    55aa:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    55b0:	ba 80 ad 00 00       	mov    $0xad80,%edx
    55b5:	bb fe 00 00 00       	mov    $0xfe,%ebx
    55ba:	89 c1                	mov    %eax,%ecx
    55bc:	83 e1 02             	and    $0x2,%ecx
    55bf:	85 c9                	test   %ecx,%ecx
    55c1:	74 0f                	je     55d2 <read_decoder_table+0x524>
    55c3:	0f b7 0a             	movzwl (%edx),%ecx
    55c6:	66 89 08             	mov    %cx,(%eax)
    55c9:	83 c0 02             	add    $0x2,%eax
    55cc:	83 c2 02             	add    $0x2,%edx
    55cf:	83 eb 02             	sub    $0x2,%ebx
    55d2:	89 d9                	mov    %ebx,%ecx
    55d4:	c1 e9 02             	shr    $0x2,%ecx
    55d7:	89 c7                	mov    %eax,%edi
    55d9:	89 d6                	mov    %edx,%esi
    55db:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    55dd:	89 f2                	mov    %esi,%edx
    55df:	89 f8                	mov    %edi,%eax
    55e1:	b9 00 00 00 00       	mov    $0x0,%ecx
    55e6:	89 de                	mov    %ebx,%esi
    55e8:	83 e6 02             	and    $0x2,%esi
    55eb:	85 f6                	test   %esi,%esi
    55ed:	74 0b                	je     55fa <read_decoder_table+0x54c>
    55ef:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    55f3:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    55f7:	83 c1 02             	add    $0x2,%ecx
    55fa:	83 e3 01             	and    $0x1,%ebx
    55fd:	85 db                	test   %ebx,%ebx
    55ff:	74 07                	je     5608 <read_decoder_table+0x55a>
    5601:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5605:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    5608:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    560e:	b8 80 ae 00 00       	mov    $0xae80,%eax
    5613:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    5618:	89 d7                	mov    %edx,%edi
    561a:	89 c6                	mov    %eax,%esi
    561c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    561e:	89 f0                	mov    %esi,%eax
    5620:	89 fa                	mov    %edi,%edx
    5622:	0f b7 08             	movzwl (%eax),%ecx
    5625:	66 89 0a             	mov    %cx,(%edx)
    5628:	83 c2 02             	add    $0x2,%edx
    562b:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    562e:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    5634:	ba 80 af 00 00       	mov    $0xaf80,%edx
    5639:	bb fe 00 00 00       	mov    $0xfe,%ebx
    563e:	89 c1                	mov    %eax,%ecx
    5640:	83 e1 02             	and    $0x2,%ecx
    5643:	85 c9                	test   %ecx,%ecx
    5645:	74 0f                	je     5656 <read_decoder_table+0x5a8>
    5647:	0f b7 0a             	movzwl (%edx),%ecx
    564a:	66 89 08             	mov    %cx,(%eax)
    564d:	83 c0 02             	add    $0x2,%eax
    5650:	83 c2 02             	add    $0x2,%edx
    5653:	83 eb 02             	sub    $0x2,%ebx
    5656:	89 d9                	mov    %ebx,%ecx
    5658:	c1 e9 02             	shr    $0x2,%ecx
    565b:	89 c7                	mov    %eax,%edi
    565d:	89 d6                	mov    %edx,%esi
    565f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5661:	89 f2                	mov    %esi,%edx
    5663:	89 f8                	mov    %edi,%eax
    5665:	b9 00 00 00 00       	mov    $0x0,%ecx
    566a:	89 de                	mov    %ebx,%esi
    566c:	83 e6 02             	and    $0x2,%esi
    566f:	85 f6                	test   %esi,%esi
    5671:	74 0b                	je     567e <read_decoder_table+0x5d0>
    5673:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    5677:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    567b:	83 c1 02             	add    $0x2,%ecx
    567e:	83 e3 01             	and    $0x1,%ebx
    5681:	85 db                	test   %ebx,%ebx
    5683:	74 07                	je     568c <read_decoder_table+0x5de>
    5685:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    5689:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    568c:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    5692:	b8 80 b0 00 00       	mov    $0xb080,%eax
    5697:	b9 ff 00 00 00       	mov    $0xff,%ecx
    569c:	89 d7                	mov    %edx,%edi
    569e:	89 c6                	mov    %eax,%esi
    56a0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    56a2:	89 f0                	mov    %esi,%eax
    56a4:	89 fa                	mov    %edi,%edx
    56a6:	0f b7 08             	movzwl (%eax),%ecx
    56a9:	66 89 0a             	mov    %cx,(%edx)
    56ac:	83 c2 02             	add    $0x2,%edx
    56af:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    56b2:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    56b8:	ba 80 b4 00 00       	mov    $0xb480,%edx
    56bd:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    56c2:	89 c1                	mov    %eax,%ecx
    56c4:	83 e1 02             	and    $0x2,%ecx
    56c7:	85 c9                	test   %ecx,%ecx
    56c9:	74 0f                	je     56da <read_decoder_table+0x62c>
    56cb:	0f b7 0a             	movzwl (%edx),%ecx
    56ce:	66 89 08             	mov    %cx,(%eax)
    56d1:	83 c0 02             	add    $0x2,%eax
    56d4:	83 c2 02             	add    $0x2,%edx
    56d7:	83 eb 02             	sub    $0x2,%ebx
    56da:	89 d9                	mov    %ebx,%ecx
    56dc:	c1 e9 02             	shr    $0x2,%ecx
    56df:	89 c7                	mov    %eax,%edi
    56e1:	89 d6                	mov    %edx,%esi
    56e3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    56e5:	89 f2                	mov    %esi,%edx
    56e7:	89 f8                	mov    %edi,%eax
    56e9:	b9 00 00 00 00       	mov    $0x0,%ecx
    56ee:	89 de                	mov    %ebx,%esi
    56f0:	83 e6 02             	and    $0x2,%esi
    56f3:	85 f6                	test   %esi,%esi
    56f5:	74 0b                	je     5702 <read_decoder_table+0x654>
    56f7:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    56fb:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    56ff:	83 c1 02             	add    $0x2,%ecx
    5702:	83 e3 01             	and    $0x1,%ebx
    5705:	85 db                	test   %ebx,%ebx
    5707:	74 07                	je     5710 <read_decoder_table+0x662>
    5709:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    570d:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5710:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    5716:	b8 80 b8 00 00       	mov    $0xb880,%eax
    571b:	b9 ff 00 00 00       	mov    $0xff,%ecx
    5720:	89 d7                	mov    %edx,%edi
    5722:	89 c6                	mov    %eax,%esi
    5724:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    5726:	89 f0                	mov    %esi,%eax
    5728:	89 fa                	mov    %edi,%edx
    572a:	0f b7 08             	movzwl (%eax),%ecx
    572d:	66 89 0a             	mov    %cx,(%edx)
    5730:	83 c2 02             	add    $0x2,%edx
    5733:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    5736:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    573c:	bb 80 bc 00 00       	mov    $0xbc80,%ebx
    5741:	b8 00 01 00 00       	mov    $0x100,%eax
    5746:	89 d7                	mov    %edx,%edi
    5748:	89 de                	mov    %ebx,%esi
    574a:	89 c1                	mov    %eax,%ecx
    574c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    574e:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    5755:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    575c:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    5763:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    576a:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    5771:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    5778:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    577f:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    5786:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    578d:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    5794:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    579b:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    57a2:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    57a9:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    57b0:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    57b7:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    57be:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    57c5:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    57cc:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    57d3:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    57da:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    57e1:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    57e8:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    57ef:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    57f6:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    57fd:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    5804:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    580b:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    5812:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    5819:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    5820:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    5827:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    582e:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    5835:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    583c:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    5843:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    584a:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    5851:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    5858:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    585f:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    5866:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    586d:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    5874:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    587b:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    5882:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    5889:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    5890:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    5897:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    589e:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    58a5:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    58ac:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    58b3:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    58ba:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    58c1:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    58c8:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    58cf:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    58d6:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    58dd:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    58e4:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    58eb:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    58f2:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    58f9:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    5900:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    5907:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    590e:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    5915:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    591c:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    5923:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    592a:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    5931:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    5938:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    593f:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    5946:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    594d:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    5954:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    595b:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    5962:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    5969:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    5970:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    5977:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    597e:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    5985:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    598c:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    5993:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    599a:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    59a1:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    59a8:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    59af:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    59b6:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    59bd:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    59c4:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    59cb:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    59d2:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    59d9:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    59e0:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    59e7:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    59ee:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    59f5:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    59fc:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    5a03:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    5a0a:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    5a11:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    5a18:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    5a1f:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    5a26:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    5a2d:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    5a34:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    5a3b:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    5a42:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    5a49:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    5a50:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    5a57:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    5a5e:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    5a65:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    5a6c:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    5a73:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    5a7a:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    5a81:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    5a88:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    5a8f:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    5a96:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    5a9d:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    5aa4:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    5aab:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    5ab2:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    5ab9:	30 00 
    5abb:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    5ac2:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    5ac9:	00 00 00 
    5acc:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    5ad3:	00 00 00 
    5ad6:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    5add:	00 00 00 
    5ae0:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    5ae7:	00 00 00 
    5aea:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    5af1:	ff ff ff 
    5af4:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    5afb:	00 00 00 
    5afe:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    5b05:	00 00 00 
    5b08:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    5b0f:	00 00 00 
    5b12:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    5b19:	00 00 00 
    5b1c:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    5b23:	31 00 
    5b25:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    5b2c:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    5b33:	00 00 00 
    5b36:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    5b3d:	00 00 00 
    5b40:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    5b47:	00 00 00 
    5b4a:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    5b51:	00 00 00 
    5b54:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    5b5b:	ff ff ff 
    5b5e:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    5b65:	00 00 00 
    5b68:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    5b6f:	00 00 00 
    5b72:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    5b75:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    5b7b:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    5b82:	00 00 00 
    5b85:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    5b8c:	32 00 
    5b8e:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    5b95:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    5b9c:	00 00 00 
    5b9f:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    5ba6:	00 00 00 
    5ba9:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    5bb0:	00 00 00 
    5bb3:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    5bba:	00 00 00 
    5bbd:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    5bc4:	ff ff ff 
    5bc7:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    5bce:	00 00 00 
    5bd1:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    5bd8:	00 00 00 
    5bdb:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    5bde:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    5be4:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    5beb:	00 00 00 
    5bee:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    5bf5:	33 00 
    5bf7:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    5bfe:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    5c05:	00 00 00 
    5c08:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    5c0f:	00 00 00 
    5c12:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    5c19:	00 00 00 
    5c1c:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    5c23:	00 00 00 
    5c26:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    5c2d:	ff ff ff 
    5c30:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    5c37:	00 00 00 
    5c3a:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    5c41:	00 00 00 
    5c44:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    5c47:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    5c4d:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    5c54:	00 00 00 
    5c57:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    5c5e:	34 00 
    5c60:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    5c67:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    5c6e:	00 00 00 
    5c71:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    5c78:	00 00 00 
    5c7b:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    5c82:	00 00 00 
    5c85:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    5c8c:	00 00 00 
    5c8f:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    5c96:	ff ff ff 
    5c99:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    5ca0:	00 00 00 
    5ca3:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    5caa:	00 00 00 
    5cad:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    5cb4:	00 00 00 
    5cb7:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    5cbe:	00 00 00 
    5cc1:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    5cc8:	35 00 
    5cca:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    5cd1:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    5cd8:	00 00 00 
    5cdb:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    5ce2:	00 00 00 
    5ce5:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    5cec:	00 00 00 
    5cef:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    5cf6:	00 00 00 
    5cf9:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    5d00:	ff ff ff 
    5d03:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    5d0a:	00 00 00 
    5d0d:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    5d14:	00 00 00 
    5d17:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    5d1d:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    5d23:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    5d2a:	00 00 00 
    5d2d:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    5d34:	36 00 
    5d36:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    5d3d:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    5d44:	00 00 00 
    5d47:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    5d4e:	00 00 00 
    5d51:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    5d58:	00 00 00 
    5d5b:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    5d62:	00 00 00 
    5d65:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    5d6c:	ff ff ff 
    5d6f:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    5d76:	00 00 00 
    5d79:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    5d80:	00 00 00 
    5d83:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    5d89:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    5d8f:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    5d96:	00 00 00 
    5d99:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    5da0:	37 00 
    5da2:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    5da9:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    5db0:	00 00 00 
    5db3:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    5dba:	00 00 00 
    5dbd:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    5dc4:	00 00 00 
    5dc7:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    5dce:	00 00 00 
    5dd1:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    5dd8:	ff ff ff 
    5ddb:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    5de2:	00 00 00 
    5de5:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    5dec:	00 00 00 
    5def:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    5df5:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    5dfb:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    5e02:	00 00 00 
    5e05:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    5e0c:	38 00 
    5e0e:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    5e15:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    5e1c:	00 00 00 
    5e1f:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    5e26:	00 00 00 
    5e29:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    5e30:	00 00 00 
    5e33:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    5e3a:	00 00 00 
    5e3d:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    5e44:	ff ff ff 
    5e47:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    5e4e:	00 00 00 
    5e51:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    5e58:	00 00 00 
    5e5b:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    5e61:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    5e67:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    5e6e:	00 00 00 
    5e71:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    5e78:	39 00 
    5e7a:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    5e81:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    5e88:	00 00 00 
    5e8b:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    5e92:	00 00 00 
    5e95:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    5e9c:	00 00 00 
    5e9f:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    5ea6:	00 00 00 
    5ea9:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    5eb0:	ff ff ff 
    5eb3:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    5eba:	00 00 00 
    5ebd:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    5ec4:	00 00 00 
    5ec7:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    5ecd:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    5ed3:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    5eda:	00 00 00 
    5edd:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    5ee4:	31 30 
    5ee6:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    5eed:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    5ef4:	00 00 00 
    5ef7:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    5efe:	00 00 00 
    5f01:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    5f08:	00 00 00 
    5f0b:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    5f12:	00 00 00 
    5f15:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    5f1c:	ff ff ff 
    5f1f:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    5f26:	00 00 00 
    5f29:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    5f30:	00 00 00 
    5f33:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    5f39:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    5f3f:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    5f46:	00 00 00 
    5f49:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    5f50:	31 31 
    5f52:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    5f59:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    5f60:	00 00 00 
    5f63:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    5f6a:	00 00 00 
    5f6d:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    5f74:	00 00 00 
    5f77:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    5f7e:	00 00 00 
    5f81:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    5f88:	ff ff ff 
    5f8b:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    5f92:	00 00 00 
    5f95:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    5f9c:	00 00 00 
    5f9f:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    5fa5:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    5fab:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    5fb2:	00 00 00 
    5fb5:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    5fbc:	31 32 
    5fbe:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    5fc5:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    5fcc:	00 00 00 
    5fcf:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    5fd6:	00 00 00 
    5fd9:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    5fe0:	00 00 00 
    5fe3:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    5fea:	00 00 00 
    5fed:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    5ff4:	ff ff ff 
    5ff7:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    5ffe:	00 00 00 
    6001:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    6008:	00 00 00 
    600b:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    6011:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    6017:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    601e:	00 00 00 
    6021:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    6028:	31 33 
    602a:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    6031:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    6038:	00 00 00 
    603b:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    6042:	00 00 00 
    6045:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    604c:	00 00 00 
    604f:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    6056:	00 00 00 
    6059:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    6060:	ff ff ff 
    6063:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    606a:	00 00 00 
    606d:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    6074:	00 00 00 
    6077:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    607d:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    6083:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    608a:	01 00 00 
    608d:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    6094:	31 34 
    6096:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    609d:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    60a4:	00 00 00 
    60a7:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    60ae:	00 00 00 
    60b1:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    60b8:	00 00 00 
    60bb:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    60c2:	00 00 00 
    60c5:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    60cc:	ff ff ff 
    60cf:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    60d6:	00 00 00 
    60d9:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    60e0:	00 00 00 
    60e3:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    60ea:	00 00 00 
    60ed:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    60f4:	00 00 00 
    60f7:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    60fe:	31 35 
    6100:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    6107:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    610e:	00 00 00 
    6111:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    6118:	00 00 00 
    611b:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    6122:	00 00 00 
    6125:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    612c:	00 00 00 
    612f:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    6136:	ff ff ff 
    6139:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    6140:	00 00 00 
    6143:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    614a:	00 00 00 
    614d:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    6153:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    6159:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    6160:	01 00 00 
    6163:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    616a:	31 36 
    616c:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    6173:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    617a:	00 00 00 
    617d:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    6184:	00 00 00 
    6187:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    618e:	00 00 00 
    6191:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    6198:	00 00 00 
    619b:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    61a2:	ff ff ff 
    61a5:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    61ac:	00 00 00 
    61af:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    61b6:	00 00 00 
    61b9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    61bf:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    61c5:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    61cc:	01 00 00 
    61cf:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    61d6:	31 37 
    61d8:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    61df:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    61e6:	00 00 00 
    61e9:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    61f0:	00 00 00 
    61f3:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    61fa:	00 00 00 
    61fd:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    6204:	00 00 00 
    6207:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    620e:	00 00 00 
    6211:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    6218:	00 00 00 
    621b:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    6222:	00 00 00 
    6225:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    622b:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    6231:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    6238:	01 00 00 
    623b:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    6242:	31 38 
    6244:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    624b:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    6252:	00 00 00 
    6255:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    625c:	00 00 00 
    625f:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    6266:	00 00 00 
    6269:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    6270:	00 00 00 
    6273:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    627a:	00 00 00 
    627d:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    6284:	00 00 00 
    6287:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    628e:	00 00 00 
    6291:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6297:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    629d:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    62a4:	01 00 00 
    62a7:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    62ae:	31 39 
    62b0:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    62b7:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    62be:	00 00 00 
    62c1:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    62c8:	00 00 00 
    62cb:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    62d2:	00 00 00 
    62d5:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    62dc:	00 00 00 
    62df:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    62e6:	00 00 00 
    62e9:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    62f0:	00 00 00 
    62f3:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    62fa:	00 00 00 
    62fd:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6303:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    6309:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    6310:	01 00 00 
    6313:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    631a:	32 30 
    631c:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    6323:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    632a:	00 00 00 
    632d:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    6334:	00 00 00 
    6337:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    633e:	00 00 00 
    6341:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    6348:	00 00 00 
    634b:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    6352:	00 00 00 
    6355:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    635c:	00 00 00 
    635f:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    6366:	00 00 00 
    6369:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    636f:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    6375:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    637c:	01 00 00 
    637f:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    6386:	32 31 
    6388:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    638f:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    6396:	00 00 00 
    6399:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    63a0:	00 00 00 
    63a3:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    63aa:	00 00 00 
    63ad:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    63b4:	00 00 00 
    63b7:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    63be:	00 00 00 
    63c1:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    63c8:	00 00 00 
    63cb:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    63d2:	00 00 00 
    63d5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    63db:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    63e1:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    63e8:	01 00 00 
    63eb:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    63f2:	32 32 
    63f4:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    63fb:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    6402:	00 00 00 
    6405:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    640c:	00 00 00 
    640f:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    6416:	00 00 00 
    6419:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    6420:	03 00 00 
    6423:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    642a:	00 00 00 
    642d:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    6434:	00 00 00 
    6437:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    643e:	00 00 00 
    6441:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    6447:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    644d:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    6454:	01 00 00 
    6457:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    645e:	32 33 
    6460:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    6467:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    646e:	00 00 00 
    6471:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    6478:	00 00 00 
    647b:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    6482:	00 00 00 
    6485:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    648c:	1f 00 00 
    648f:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    6496:	00 00 00 
    6499:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    64a0:	00 00 00 
    64a3:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    64aa:	00 00 00 
    64ad:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    64b3:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    64b9:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    64c0:	01 00 00 
    64c3:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    64ca:	32 34 
    64cc:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    64d3:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    64da:	00 00 00 
    64dd:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    64e4:	00 00 00 
    64e7:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    64ee:	00 00 00 
    64f1:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    64f8:	00 00 00 
    64fb:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    6502:	ff ff ff 
    6505:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    650c:	00 00 00 
    650f:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    6516:	00 00 00 
    6519:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    651f:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    6525:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    652c:	02 00 00 
    652f:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    6536:	32 35 
    6538:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    653f:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    6546:	00 00 00 
    6549:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    6550:	00 00 00 
    6553:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    655a:	00 00 00 
    655d:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    6564:	00 00 00 
    6567:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    656e:	00 00 00 
    6571:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    6578:	00 00 00 
    657b:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    6582:	00 00 00 
    6585:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    658b:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    6591:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    6598:	02 00 00 
    659b:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    65a2:	32 36 
    65a4:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    65ab:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    65b2:	00 00 00 
    65b5:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    65bc:	00 00 00 
    65bf:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    65c6:	00 00 00 
    65c9:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    65d0:	00 00 00 
    65d3:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    65da:	00 00 00 
    65dd:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    65e4:	00 00 00 
    65e7:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    65ee:	00 00 00 
    65f1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    65f7:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    65fd:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    6604:	02 00 00 
    6607:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    660e:	32 37 
    6610:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    6617:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    661e:	00 00 00 
    6621:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    6628:	00 00 00 
    662b:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    6632:	00 00 00 
    6635:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    663c:	00 00 00 
    663f:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    6646:	00 00 00 
    6649:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    6650:	00 00 00 
    6653:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    665a:	00 00 00 
    665d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6663:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    6669:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    6670:	02 00 00 
    6673:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    667a:	32 38 
    667c:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    6683:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    668a:	00 00 00 
    668d:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    6694:	00 00 00 
    6697:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    669e:	00 00 00 
    66a1:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    66a8:	00 00 00 
    66ab:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    66b2:	00 00 00 
    66b5:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    66bc:	00 00 00 
    66bf:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    66c6:	00 00 00 
    66c9:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    66cf:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    66d5:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    66dc:	02 00 00 
    66df:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    66e6:	32 39 
    66e8:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    66ef:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    66f6:	00 00 00 
    66f9:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    6700:	00 00 00 
    6703:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    670a:	00 00 00 
    670d:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    6714:	01 00 00 
    6717:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    671e:	00 00 00 
    6721:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    6728:	00 00 00 
    672b:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    6732:	00 00 00 
    6735:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    673b:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    6741:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    6748:	02 00 00 
    674b:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    6752:	33 30 
    6754:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    675b:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    6762:	00 00 00 
    6765:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    676c:	00 00 00 
    676f:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    6776:	00 00 00 
    6779:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    6780:	07 00 00 
    6783:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    678a:	00 00 00 
    678d:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    6794:	00 00 00 
    6797:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    679e:	00 00 00 
    67a1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    67a7:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    67ad:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    67b4:	02 00 00 
    67b7:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    67be:	33 31 
    67c0:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    67c7:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    67ce:	00 00 00 
    67d1:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    67d8:	00 00 00 
    67db:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    67e2:	00 00 00 
    67e5:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    67ec:	1f 00 00 
    67ef:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    67f6:	00 00 00 
    67f9:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    6800:	00 00 00 
    6803:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    680a:	00 00 00 
    680d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    6813:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    6819:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    6820:	02 00 00 
    6823:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    682a:	33 32 
    682c:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    6833:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    683a:	00 00 00 
    683d:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    6844:	00 00 00 
    6847:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    684e:	00 00 00 
    6851:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    6858:	00 00 00 
    685b:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    6862:	ff ff ff 
    6865:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    686c:	00 00 00 
    686f:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    6876:	00 00 00 
    6879:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    687f:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    6885:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    688c:	00 00 00 
    688f:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    6896:	33 33 
    6898:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    689f:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    68a6:	00 00 00 
    68a9:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    68b0:	00 00 00 
    68b3:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    68ba:	00 00 00 
    68bd:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    68c4:	00 00 00 
    68c7:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    68ce:	ff ff ff 
    68d1:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    68d8:	00 00 00 
    68db:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    68e2:	00 00 00 
    68e5:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    68eb:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    68f1:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    68f8:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    68fb:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    6901:	5b                   	pop    %ebx
    6902:	5e                   	pop    %esi
    6903:	5f                   	pop    %edi
    6904:	5d                   	pop    %ebp
    6905:	c3                   	ret    

00006906 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    6906:	55                   	push   %ebp
    6907:	89 e5                	mov    %esp,%ebp
    6909:	53                   	push   %ebx
    690a:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    690d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    6914:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    691b:	a1 d0 e7 00 00       	mov    0xe7d0,%eax
    6920:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    6923:	8b 45 08             	mov    0x8(%ebp),%eax
    6926:	8b 40 20             	mov    0x20(%eax),%eax
    6929:	85 c0                	test   %eax,%eax
    692b:	75 0a                	jne    6937 <huffman_decoder+0x31>
    692d:	b8 02 00 00 00       	mov    $0x2,%eax
    6932:	e9 0d 03 00 00       	jmp    6c44 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    6937:	8b 45 08             	mov    0x8(%ebp),%eax
    693a:	8b 40 24             	mov    0x24(%eax),%eax
    693d:	85 c0                	test   %eax,%eax
    693f:	75 1d                	jne    695e <huffman_decoder+0x58>
  {  *x = *y = 0;
    6941:	8b 45 10             	mov    0x10(%ebp),%eax
    6944:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    694a:	8b 45 10             	mov    0x10(%ebp),%eax
    694d:	8b 10                	mov    (%eax),%edx
    694f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6952:	89 10                	mov    %edx,(%eax)
     return 0;
    6954:	b8 00 00 00 00       	mov    $0x0,%eax
    6959:	e9 e6 02 00 00       	jmp    6c44 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    695e:	8b 45 08             	mov    0x8(%ebp),%eax
    6961:	8b 40 20             	mov    0x20(%eax),%eax
    6964:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6967:	01 d2                	add    %edx,%edx
    6969:	01 d0                	add    %edx,%eax
    696b:	0f b6 00             	movzbl (%eax),%eax
    696e:	84 c0                	test   %al,%al
    6970:	75 46                	jne    69b8 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    6972:	8b 45 08             	mov    0x8(%ebp),%eax
    6975:	8b 40 20             	mov    0x20(%eax),%eax
    6978:	8b 55 f0             	mov    -0x10(%ebp),%edx
    697b:	01 d2                	add    %edx,%edx
    697d:	01 d0                	add    %edx,%eax
    697f:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6983:	c0 e8 04             	shr    $0x4,%al
    6986:	0f b6 d0             	movzbl %al,%edx
    6989:	8b 45 0c             	mov    0xc(%ebp),%eax
    698c:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    698e:	8b 45 08             	mov    0x8(%ebp),%eax
    6991:	8b 40 20             	mov    0x20(%eax),%eax
    6994:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6997:	01 d2                	add    %edx,%edx
    6999:	01 d0                	add    %edx,%eax
    699b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    699f:	0f b6 c0             	movzbl %al,%eax
    69a2:	83 e0 0f             	and    $0xf,%eax
    69a5:	89 c2                	mov    %eax,%edx
    69a7:	8b 45 10             	mov    0x10(%ebp),%eax
    69aa:	89 10                	mov    %edx,(%eax)

      error = 0;
    69ac:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    69b3:	e9 af 00 00 00       	jmp    6a67 <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    69b8:	e8 a7 e6 ff ff       	call   5064 <hget1bit>
    69bd:	85 c0                	test   %eax,%eax
    69bf:	74 47                	je     6a08 <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    69c1:	eb 17                	jmp    69da <huffman_decoder+0xd4>
    69c3:	8b 45 08             	mov    0x8(%ebp),%eax
    69c6:	8b 40 20             	mov    0x20(%eax),%eax
    69c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    69cc:	01 d2                	add    %edx,%edx
    69ce:	01 d0                	add    %edx,%eax
    69d0:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    69d4:	0f b6 c0             	movzbl %al,%eax
    69d7:	01 45 f0             	add    %eax,-0x10(%ebp)
    69da:	8b 45 08             	mov    0x8(%ebp),%eax
    69dd:	8b 40 20             	mov    0x20(%eax),%eax
    69e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    69e3:	01 d2                	add    %edx,%edx
    69e5:	01 d0                	add    %edx,%eax
    69e7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    69eb:	3c f9                	cmp    $0xf9,%al
    69ed:	77 d4                	ja     69c3 <huffman_decoder+0xbd>
      point += h->val[point][1];
    69ef:	8b 45 08             	mov    0x8(%ebp),%eax
    69f2:	8b 40 20             	mov    0x20(%eax),%eax
    69f5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    69f8:	01 d2                	add    %edx,%edx
    69fa:	01 d0                	add    %edx,%eax
    69fc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6a00:	0f b6 c0             	movzbl %al,%eax
    6a03:	01 45 f0             	add    %eax,-0x10(%ebp)
    6a06:	eb 42                	jmp    6a4a <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    6a08:	eb 16                	jmp    6a20 <huffman_decoder+0x11a>
    6a0a:	8b 45 08             	mov    0x8(%ebp),%eax
    6a0d:	8b 40 20             	mov    0x20(%eax),%eax
    6a10:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6a13:	01 d2                	add    %edx,%edx
    6a15:	01 d0                	add    %edx,%eax
    6a17:	0f b6 00             	movzbl (%eax),%eax
    6a1a:	0f b6 c0             	movzbl %al,%eax
    6a1d:	01 45 f0             	add    %eax,-0x10(%ebp)
    6a20:	8b 45 08             	mov    0x8(%ebp),%eax
    6a23:	8b 40 20             	mov    0x20(%eax),%eax
    6a26:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6a29:	01 d2                	add    %edx,%edx
    6a2b:	01 d0                	add    %edx,%eax
    6a2d:	0f b6 00             	movzbl (%eax),%eax
    6a30:	3c f9                	cmp    $0xf9,%al
    6a32:	77 d6                	ja     6a0a <huffman_decoder+0x104>
      point += h->val[point][0];
    6a34:	8b 45 08             	mov    0x8(%ebp),%eax
    6a37:	8b 40 20             	mov    0x20(%eax),%eax
    6a3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6a3d:	01 d2                	add    %edx,%edx
    6a3f:	01 d0                	add    %edx,%eax
    6a41:	0f b6 00             	movzbl (%eax),%eax
    6a44:	0f b6 c0             	movzbl %al,%eax
    6a47:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    6a4a:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    6a4d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6a51:	0f 85 07 ff ff ff    	jne    695e <huffman_decoder+0x58>
    6a57:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6a5a:	a1 64 1b 01 00       	mov    0x11b64,%eax
    6a5f:	39 c2                	cmp    %eax,%edx
    6a61:	0f 82 f7 fe ff ff    	jb     695e <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    6a67:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6a6b:	74 24                	je     6a91 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    6a6d:	8b 45 08             	mov    0x8(%ebp),%eax
    6a70:	8b 40 04             	mov    0x4(%eax),%eax
    6a73:	83 e8 01             	sub    $0x1,%eax
    6a76:	01 c0                	add    %eax,%eax
    6a78:	89 c2                	mov    %eax,%edx
    6a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a7d:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    6a7f:	8b 45 08             	mov    0x8(%ebp),%eax
    6a82:	8b 40 08             	mov    0x8(%eax),%eax
    6a85:	83 e8 01             	sub    $0x1,%eax
    6a88:	01 c0                	add    %eax,%eax
    6a8a:	89 c2                	mov    %eax,%edx
    6a8c:	8b 45 10             	mov    0x10(%ebp),%eax
    6a8f:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    6a91:	8b 45 08             	mov    0x8(%ebp),%eax
    6a94:	0f b6 00             	movzbl (%eax),%eax
    6a97:	3c 33                	cmp    $0x33,%al
    6a99:	0f 85 ec 00 00 00    	jne    6b8b <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    6a9f:	8b 45 08             	mov    0x8(%ebp),%eax
    6aa2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6aa6:	3c 32                	cmp    $0x32,%al
    6aa8:	74 0f                	je     6ab9 <huffman_decoder+0x1b3>
    6aaa:	8b 45 08             	mov    0x8(%ebp),%eax
    6aad:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    6ab1:	3c 33                	cmp    $0x33,%al
    6ab3:	0f 85 d2 00 00 00    	jne    6b8b <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    6ab9:	8b 45 10             	mov    0x10(%ebp),%eax
    6abc:	8b 00                	mov    (%eax),%eax
    6abe:	c1 f8 03             	sar    $0x3,%eax
    6ac1:	83 e0 01             	and    $0x1,%eax
    6ac4:	89 c2                	mov    %eax,%edx
    6ac6:	8b 45 14             	mov    0x14(%ebp),%eax
    6ac9:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    6acb:	8b 45 10             	mov    0x10(%ebp),%eax
    6ace:	8b 00                	mov    (%eax),%eax
    6ad0:	c1 f8 02             	sar    $0x2,%eax
    6ad3:	83 e0 01             	and    $0x1,%eax
    6ad6:	89 c2                	mov    %eax,%edx
    6ad8:	8b 45 18             	mov    0x18(%ebp),%eax
    6adb:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    6add:	8b 45 10             	mov    0x10(%ebp),%eax
    6ae0:	8b 00                	mov    (%eax),%eax
    6ae2:	d1 f8                	sar    %eax
    6ae4:	83 e0 01             	and    $0x1,%eax
    6ae7:	89 c2                	mov    %eax,%edx
    6ae9:	8b 45 0c             	mov    0xc(%ebp),%eax
    6aec:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    6aee:	8b 45 10             	mov    0x10(%ebp),%eax
    6af1:	8b 00                	mov    (%eax),%eax
    6af3:	83 e0 01             	and    $0x1,%eax
    6af6:	89 c2                	mov    %eax,%edx
    6af8:	8b 45 10             	mov    0x10(%ebp),%eax
    6afb:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    6afd:	8b 45 14             	mov    0x14(%ebp),%eax
    6b00:	8b 00                	mov    (%eax),%eax
    6b02:	85 c0                	test   %eax,%eax
    6b04:	74 18                	je     6b1e <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    6b06:	e8 59 e5 ff ff       	call   5064 <hget1bit>
    6b0b:	83 f8 01             	cmp    $0x1,%eax
    6b0e:	75 0e                	jne    6b1e <huffman_decoder+0x218>
    6b10:	8b 45 14             	mov    0x14(%ebp),%eax
    6b13:	8b 00                	mov    (%eax),%eax
    6b15:	f7 d8                	neg    %eax
    6b17:	89 c2                	mov    %eax,%edx
    6b19:	8b 45 14             	mov    0x14(%ebp),%eax
    6b1c:	89 10                	mov    %edx,(%eax)
     if (*w)
    6b1e:	8b 45 18             	mov    0x18(%ebp),%eax
    6b21:	8b 00                	mov    (%eax),%eax
    6b23:	85 c0                	test   %eax,%eax
    6b25:	74 18                	je     6b3f <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    6b27:	e8 38 e5 ff ff       	call   5064 <hget1bit>
    6b2c:	83 f8 01             	cmp    $0x1,%eax
    6b2f:	75 0e                	jne    6b3f <huffman_decoder+0x239>
    6b31:	8b 45 18             	mov    0x18(%ebp),%eax
    6b34:	8b 00                	mov    (%eax),%eax
    6b36:	f7 d8                	neg    %eax
    6b38:	89 c2                	mov    %eax,%edx
    6b3a:	8b 45 18             	mov    0x18(%ebp),%eax
    6b3d:	89 10                	mov    %edx,(%eax)
     if (*x)
    6b3f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b42:	8b 00                	mov    (%eax),%eax
    6b44:	85 c0                	test   %eax,%eax
    6b46:	74 18                	je     6b60 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    6b48:	e8 17 e5 ff ff       	call   5064 <hget1bit>
    6b4d:	83 f8 01             	cmp    $0x1,%eax
    6b50:	75 0e                	jne    6b60 <huffman_decoder+0x25a>
    6b52:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b55:	8b 00                	mov    (%eax),%eax
    6b57:	f7 d8                	neg    %eax
    6b59:	89 c2                	mov    %eax,%edx
    6b5b:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b5e:	89 10                	mov    %edx,(%eax)
     if (*y)
    6b60:	8b 45 10             	mov    0x10(%ebp),%eax
    6b63:	8b 00                	mov    (%eax),%eax
    6b65:	85 c0                	test   %eax,%eax
    6b67:	74 1d                	je     6b86 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    6b69:	e8 f6 e4 ff ff       	call   5064 <hget1bit>
    6b6e:	83 f8 01             	cmp    $0x1,%eax
    6b71:	75 13                	jne    6b86 <huffman_decoder+0x280>
    6b73:	8b 45 10             	mov    0x10(%ebp),%eax
    6b76:	8b 00                	mov    (%eax),%eax
    6b78:	f7 d8                	neg    %eax
    6b7a:	89 c2                	mov    %eax,%edx
    6b7c:	8b 45 10             	mov    0x10(%ebp),%eax
    6b7f:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    6b81:	e9 bb 00 00 00       	jmp    6c41 <huffman_decoder+0x33b>
    6b86:	e9 b6 00 00 00       	jmp    6c41 <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    6b8b:	8b 45 08             	mov    0x8(%ebp),%eax
    6b8e:	8b 40 0c             	mov    0xc(%eax),%eax
    6b91:	85 c0                	test   %eax,%eax
    6b93:	74 30                	je     6bc5 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    6b95:	8b 45 08             	mov    0x8(%ebp),%eax
    6b98:	8b 40 04             	mov    0x4(%eax),%eax
    6b9b:	8d 50 ff             	lea    -0x1(%eax),%edx
    6b9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    6ba1:	8b 00                	mov    (%eax),%eax
    6ba3:	39 c2                	cmp    %eax,%edx
    6ba5:	75 1e                	jne    6bc5 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    6ba7:	8b 45 0c             	mov    0xc(%ebp),%eax
    6baa:	8b 00                	mov    (%eax),%eax
    6bac:	89 c3                	mov    %eax,%ebx
    6bae:	8b 45 08             	mov    0x8(%ebp),%eax
    6bb1:	8b 40 0c             	mov    0xc(%eax),%eax
    6bb4:	89 04 24             	mov    %eax,(%esp)
    6bb7:	e8 8d e4 ff ff       	call   5049 <hgetbits>
    6bbc:	01 d8                	add    %ebx,%eax
    6bbe:	89 c2                	mov    %eax,%edx
    6bc0:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bc3:	89 10                	mov    %edx,(%eax)
     if (*x)
    6bc5:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bc8:	8b 00                	mov    (%eax),%eax
    6bca:	85 c0                	test   %eax,%eax
    6bcc:	74 18                	je     6be6 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    6bce:	e8 91 e4 ff ff       	call   5064 <hget1bit>
    6bd3:	83 f8 01             	cmp    $0x1,%eax
    6bd6:	75 0e                	jne    6be6 <huffman_decoder+0x2e0>
    6bd8:	8b 45 0c             	mov    0xc(%ebp),%eax
    6bdb:	8b 00                	mov    (%eax),%eax
    6bdd:	f7 d8                	neg    %eax
    6bdf:	89 c2                	mov    %eax,%edx
    6be1:	8b 45 0c             	mov    0xc(%ebp),%eax
    6be4:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    6be6:	8b 45 08             	mov    0x8(%ebp),%eax
    6be9:	8b 40 0c             	mov    0xc(%eax),%eax
    6bec:	85 c0                	test   %eax,%eax
    6bee:	74 30                	je     6c20 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    6bf0:	8b 45 08             	mov    0x8(%ebp),%eax
    6bf3:	8b 40 08             	mov    0x8(%eax),%eax
    6bf6:	8d 50 ff             	lea    -0x1(%eax),%edx
    6bf9:	8b 45 10             	mov    0x10(%ebp),%eax
    6bfc:	8b 00                	mov    (%eax),%eax
    6bfe:	39 c2                	cmp    %eax,%edx
    6c00:	75 1e                	jne    6c20 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    6c02:	8b 45 10             	mov    0x10(%ebp),%eax
    6c05:	8b 00                	mov    (%eax),%eax
    6c07:	89 c3                	mov    %eax,%ebx
    6c09:	8b 45 08             	mov    0x8(%ebp),%eax
    6c0c:	8b 40 0c             	mov    0xc(%eax),%eax
    6c0f:	89 04 24             	mov    %eax,(%esp)
    6c12:	e8 32 e4 ff ff       	call   5049 <hgetbits>
    6c17:	01 d8                	add    %ebx,%eax
    6c19:	89 c2                	mov    %eax,%edx
    6c1b:	8b 45 10             	mov    0x10(%ebp),%eax
    6c1e:	89 10                	mov    %edx,(%eax)
     if (*y)
    6c20:	8b 45 10             	mov    0x10(%ebp),%eax
    6c23:	8b 00                	mov    (%eax),%eax
    6c25:	85 c0                	test   %eax,%eax
    6c27:	74 18                	je     6c41 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    6c29:	e8 36 e4 ff ff       	call   5064 <hget1bit>
    6c2e:	83 f8 01             	cmp    $0x1,%eax
    6c31:	75 0e                	jne    6c41 <huffman_decoder+0x33b>
    6c33:	8b 45 10             	mov    0x10(%ebp),%eax
    6c36:	8b 00                	mov    (%eax),%eax
    6c38:	f7 d8                	neg    %eax
    6c3a:	89 c2                	mov    %eax,%edx
    6c3c:	8b 45 10             	mov    0x10(%ebp),%eax
    6c3f:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    6c41:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    6c44:	83 c4 24             	add    $0x24,%esp
    6c47:	5b                   	pop    %ebx
    6c48:	5d                   	pop    %ebp
    6c49:	c3                   	ret    

00006c4a <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    6c4a:	55                   	push   %ebp
    6c4b:	89 e5                	mov    %esp,%ebp
    6c4d:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    6c50:	8b 45 0c             	mov    0xc(%ebp),%eax
    6c53:	8b 00                	mov    (%eax),%eax
    6c55:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    6c58:	8b 45 08             	mov    0x8(%ebp),%eax
    6c5b:	89 04 24             	mov    %eax,(%esp)
    6c5e:	e8 6c df ff ff       	call   4bcf <get1bit>
    6c63:	89 c2                	mov    %eax,%edx
    6c65:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c68:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    6c6a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6c71:	00 
    6c72:	8b 45 08             	mov    0x8(%ebp),%eax
    6c75:	89 04 24             	mov    %eax,(%esp)
    6c78:	e8 64 e0 ff ff       	call   4ce1 <getbits>
    6c7d:	ba 04 00 00 00       	mov    $0x4,%edx
    6c82:	29 c2                	sub    %eax,%edx
    6c84:	89 d0                	mov    %edx,%eax
    6c86:	89 c2                	mov    %eax,%edx
    6c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6c8b:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    6c8e:	8b 45 08             	mov    0x8(%ebp),%eax
    6c91:	89 04 24             	mov    %eax,(%esp)
    6c94:	e8 36 df ff ff       	call   4bcf <get1bit>
    6c99:	85 c0                	test   %eax,%eax
    6c9b:	0f 94 c0             	sete   %al
    6c9e:	0f b6 d0             	movzbl %al,%edx
    6ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ca4:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    6ca7:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    6cae:	00 
    6caf:	8b 45 08             	mov    0x8(%ebp),%eax
    6cb2:	89 04 24             	mov    %eax,(%esp)
    6cb5:	e8 27 e0 ff ff       	call   4ce1 <getbits>
    6cba:	89 c2                	mov    %eax,%edx
    6cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6cbf:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    6cc2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6cc9:	00 
    6cca:	8b 45 08             	mov    0x8(%ebp),%eax
    6ccd:	89 04 24             	mov    %eax,(%esp)
    6cd0:	e8 0c e0 ff ff       	call   4ce1 <getbits>
    6cd5:	89 c2                	mov    %eax,%edx
    6cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6cda:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    6cdd:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce0:	89 04 24             	mov    %eax,(%esp)
    6ce3:	e8 e7 de ff ff       	call   4bcf <get1bit>
    6ce8:	89 c2                	mov    %eax,%edx
    6cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ced:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    6cf0:	8b 45 08             	mov    0x8(%ebp),%eax
    6cf3:	89 04 24             	mov    %eax,(%esp)
    6cf6:	e8 d4 de ff ff       	call   4bcf <get1bit>
    6cfb:	89 c2                	mov    %eax,%edx
    6cfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d00:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    6d03:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6d0a:	00 
    6d0b:	8b 45 08             	mov    0x8(%ebp),%eax
    6d0e:	89 04 24             	mov    %eax,(%esp)
    6d11:	e8 cb df ff ff       	call   4ce1 <getbits>
    6d16:	89 c2                	mov    %eax,%edx
    6d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d1b:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    6d1e:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6d25:	00 
    6d26:	8b 45 08             	mov    0x8(%ebp),%eax
    6d29:	89 04 24             	mov    %eax,(%esp)
    6d2c:	e8 b0 df ff ff       	call   4ce1 <getbits>
    6d31:	89 c2                	mov    %eax,%edx
    6d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d36:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    6d39:	8b 45 08             	mov    0x8(%ebp),%eax
    6d3c:	89 04 24             	mov    %eax,(%esp)
    6d3f:	e8 8b de ff ff       	call   4bcf <get1bit>
    6d44:	89 c2                	mov    %eax,%edx
    6d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d49:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    6d4c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d4f:	89 04 24             	mov    %eax,(%esp)
    6d52:	e8 78 de ff ff       	call   4bcf <get1bit>
    6d57:	89 c2                	mov    %eax,%edx
    6d59:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d5c:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    6d5f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6d66:	00 
    6d67:	8b 45 08             	mov    0x8(%ebp),%eax
    6d6a:	89 04 24             	mov    %eax,(%esp)
    6d6d:	e8 6f df ff ff       	call   4ce1 <getbits>
    6d72:	89 c2                	mov    %eax,%edx
    6d74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6d77:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    6d7a:	c9                   	leave  
    6d7b:	c3                   	ret    

00006d7c <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    6d7c:	55                   	push   %ebp
    6d7d:	89 e5                	mov    %esp,%ebp
    6d7f:	56                   	push   %esi
    6d80:	53                   	push   %ebx
    6d81:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    6d84:	8b 45 10             	mov    0x10(%ebp),%eax
    6d87:	8b 40 08             	mov    0x8(%eax),%eax
    6d8a:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    6d8d:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    6d94:	00 
    6d95:	8b 45 08             	mov    0x8(%ebp),%eax
    6d98:	89 04 24             	mov    %eax,(%esp)
    6d9b:	e8 41 df ff ff       	call   4ce1 <getbits>
    6da0:	8b 55 0c             	mov    0xc(%ebp),%edx
    6da3:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    6da5:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    6da9:	75 1b                	jne    6dc6 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    6dab:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    6db2:	00 
    6db3:	8b 45 08             	mov    0x8(%ebp),%eax
    6db6:	89 04 24             	mov    %eax,(%esp)
    6db9:	e8 23 df ff ff       	call   4ce1 <getbits>
    6dbe:	8b 55 0c             	mov    0xc(%ebp),%edx
    6dc1:	89 42 04             	mov    %eax,0x4(%edx)
    6dc4:	eb 19                	jmp    6ddf <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    6dc6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    6dcd:	00 
    6dce:	8b 45 08             	mov    0x8(%ebp),%eax
    6dd1:	89 04 24             	mov    %eax,(%esp)
    6dd4:	e8 08 df ff ff       	call   4ce1 <getbits>
    6dd9:	8b 55 0c             	mov    0xc(%ebp),%edx
    6ddc:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    6ddf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6de6:	eb 3d                	jmp    6e25 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    6de8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6def:	eb 2a                	jmp    6e1b <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    6df1:	8b 45 08             	mov    0x8(%ebp),%eax
    6df4:	89 04 24             	mov    %eax,(%esp)
    6df7:	e8 d3 dd ff ff       	call   4bcf <get1bit>
    6dfc:	89 c1                	mov    %eax,%ecx
    6dfe:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6e01:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6e04:	89 d0                	mov    %edx,%eax
    6e06:	c1 e0 02             	shl    $0x2,%eax
    6e09:	01 d0                	add    %edx,%eax
    6e0b:	c1 e0 03             	shl    $0x3,%eax
    6e0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6e11:	01 d0                	add    %edx,%eax
    6e13:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    6e17:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6e1b:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    6e1f:	7e d0                	jle    6df1 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    6e21:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    6e25:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6e28:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    6e2b:	7c bb                	jl     6de8 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    6e2d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6e34:	e9 c5 05 00 00       	jmp    73fe <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    6e39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6e40:	e9 a9 05 00 00       	jmp    73ee <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    6e45:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    6e4c:	00 
    6e4d:	8b 45 08             	mov    0x8(%ebp),%eax
    6e50:	89 04 24             	mov    %eax,(%esp)
    6e53:	e8 89 de ff ff       	call   4ce1 <getbits>
    6e58:	89 c3                	mov    %eax,%ebx
    6e5a:	8b 75 0c             	mov    0xc(%ebp),%esi
    6e5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6e60:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6e63:	89 c2                	mov    %eax,%edx
    6e65:	c1 e2 03             	shl    $0x3,%edx
    6e68:	01 c2                	add    %eax,%edx
    6e6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6e71:	89 c2                	mov    %eax,%edx
    6e73:	89 c8                	mov    %ecx,%eax
    6e75:	c1 e0 02             	shl    $0x2,%eax
    6e78:	01 c8                	add    %ecx,%eax
    6e7a:	c1 e0 05             	shl    $0x5,%eax
    6e7d:	01 d0                	add    %edx,%eax
    6e7f:	01 f0                	add    %esi,%eax
    6e81:	83 c0 18             	add    $0x18,%eax
    6e84:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    6e86:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    6e8d:	00 
    6e8e:	8b 45 08             	mov    0x8(%ebp),%eax
    6e91:	89 04 24             	mov    %eax,(%esp)
    6e94:	e8 48 de ff ff       	call   4ce1 <getbits>
    6e99:	89 c3                	mov    %eax,%ebx
    6e9b:	8b 75 0c             	mov    0xc(%ebp),%esi
    6e9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ea1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ea4:	89 c2                	mov    %eax,%edx
    6ea6:	c1 e2 03             	shl    $0x3,%edx
    6ea9:	01 c2                	add    %eax,%edx
    6eab:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6eb2:	89 c2                	mov    %eax,%edx
    6eb4:	89 c8                	mov    %ecx,%eax
    6eb6:	c1 e0 02             	shl    $0x2,%eax
    6eb9:	01 c8                	add    %ecx,%eax
    6ebb:	c1 e0 05             	shl    $0x5,%eax
    6ebe:	01 d0                	add    %edx,%eax
    6ec0:	01 f0                	add    %esi,%eax
    6ec2:	83 c0 1c             	add    $0x1c,%eax
    6ec5:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    6ec7:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    6ece:	00 
    6ecf:	8b 45 08             	mov    0x8(%ebp),%eax
    6ed2:	89 04 24             	mov    %eax,(%esp)
    6ed5:	e8 07 de ff ff       	call   4ce1 <getbits>
    6eda:	89 c3                	mov    %eax,%ebx
    6edc:	8b 75 0c             	mov    0xc(%ebp),%esi
    6edf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ee2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6ee5:	89 c2                	mov    %eax,%edx
    6ee7:	c1 e2 03             	shl    $0x3,%edx
    6eea:	01 c2                	add    %eax,%edx
    6eec:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6ef3:	89 c2                	mov    %eax,%edx
    6ef5:	89 c8                	mov    %ecx,%eax
    6ef7:	c1 e0 02             	shl    $0x2,%eax
    6efa:	01 c8                	add    %ecx,%eax
    6efc:	c1 e0 05             	shl    $0x5,%eax
    6eff:	01 d0                	add    %edx,%eax
    6f01:	01 f0                	add    %esi,%eax
    6f03:	83 c0 20             	add    $0x20,%eax
    6f06:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    6f08:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    6f0f:	00 
    6f10:	8b 45 08             	mov    0x8(%ebp),%eax
    6f13:	89 04 24             	mov    %eax,(%esp)
    6f16:	e8 c6 dd ff ff       	call   4ce1 <getbits>
    6f1b:	89 c3                	mov    %eax,%ebx
    6f1d:	8b 75 0c             	mov    0xc(%ebp),%esi
    6f20:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f23:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f26:	89 c2                	mov    %eax,%edx
    6f28:	c1 e2 03             	shl    $0x3,%edx
    6f2b:	01 c2                	add    %eax,%edx
    6f2d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f34:	89 c2                	mov    %eax,%edx
    6f36:	89 c8                	mov    %ecx,%eax
    6f38:	c1 e0 02             	shl    $0x2,%eax
    6f3b:	01 c8                	add    %ecx,%eax
    6f3d:	c1 e0 05             	shl    $0x5,%eax
    6f40:	01 d0                	add    %edx,%eax
    6f42:	01 f0                	add    %esi,%eax
    6f44:	83 c0 24             	add    $0x24,%eax
    6f47:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    6f49:	8b 45 08             	mov    0x8(%ebp),%eax
    6f4c:	89 04 24             	mov    %eax,(%esp)
    6f4f:	e8 7b dc ff ff       	call   4bcf <get1bit>
    6f54:	89 c3                	mov    %eax,%ebx
    6f56:	8b 75 0c             	mov    0xc(%ebp),%esi
    6f59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f5c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f5f:	89 c2                	mov    %eax,%edx
    6f61:	c1 e2 03             	shl    $0x3,%edx
    6f64:	01 c2                	add    %eax,%edx
    6f66:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f6d:	89 c2                	mov    %eax,%edx
    6f6f:	89 c8                	mov    %ecx,%eax
    6f71:	c1 e0 02             	shl    $0x2,%eax
    6f74:	01 c8                	add    %ecx,%eax
    6f76:	c1 e0 05             	shl    $0x5,%eax
    6f79:	01 d0                	add    %edx,%eax
    6f7b:	01 f0                	add    %esi,%eax
    6f7d:	83 c0 28             	add    $0x28,%eax
    6f80:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    6f82:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    6f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f88:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6f8b:	89 c2                	mov    %eax,%edx
    6f8d:	c1 e2 03             	shl    $0x3,%edx
    6f90:	01 c2                	add    %eax,%edx
    6f92:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6f99:	89 c2                	mov    %eax,%edx
    6f9b:	89 c8                	mov    %ecx,%eax
    6f9d:	c1 e0 02             	shl    $0x2,%eax
    6fa0:	01 c8                	add    %ecx,%eax
    6fa2:	c1 e0 05             	shl    $0x5,%eax
    6fa5:	01 d0                	add    %edx,%eax
    6fa7:	01 d8                	add    %ebx,%eax
    6fa9:	83 c0 28             	add    $0x28,%eax
    6fac:	8b 00                	mov    (%eax),%eax
    6fae:	85 c0                	test   %eax,%eax
    6fb0:	0f 84 82 02 00 00    	je     7238 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    6fb6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6fbd:	00 
    6fbe:	8b 45 08             	mov    0x8(%ebp),%eax
    6fc1:	89 04 24             	mov    %eax,(%esp)
    6fc4:	e8 18 dd ff ff       	call   4ce1 <getbits>
    6fc9:	89 c3                	mov    %eax,%ebx
    6fcb:	8b 75 0c             	mov    0xc(%ebp),%esi
    6fce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6fd1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    6fd4:	89 c2                	mov    %eax,%edx
    6fd6:	c1 e2 03             	shl    $0x3,%edx
    6fd9:	01 c2                	add    %eax,%edx
    6fdb:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6fe2:	89 c2                	mov    %eax,%edx
    6fe4:	89 c8                	mov    %ecx,%eax
    6fe6:	c1 e0 02             	shl    $0x2,%eax
    6fe9:	01 c8                	add    %ecx,%eax
    6feb:	c1 e0 05             	shl    $0x5,%eax
    6fee:	01 d0                	add    %edx,%eax
    6ff0:	01 f0                	add    %esi,%eax
    6ff2:	83 c0 2c             	add    $0x2c,%eax
    6ff5:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    6ff7:	8b 45 08             	mov    0x8(%ebp),%eax
    6ffa:	89 04 24             	mov    %eax,(%esp)
    6ffd:	e8 cd db ff ff       	call   4bcf <get1bit>
    7002:	89 c3                	mov    %eax,%ebx
    7004:	8b 75 0c             	mov    0xc(%ebp),%esi
    7007:	8b 45 f0             	mov    -0x10(%ebp),%eax
    700a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    700d:	89 c2                	mov    %eax,%edx
    700f:	c1 e2 03             	shl    $0x3,%edx
    7012:	01 c2                	add    %eax,%edx
    7014:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    701b:	89 c2                	mov    %eax,%edx
    701d:	89 c8                	mov    %ecx,%eax
    701f:	c1 e0 02             	shl    $0x2,%eax
    7022:	01 c8                	add    %ecx,%eax
    7024:	c1 e0 05             	shl    $0x5,%eax
    7027:	01 d0                	add    %edx,%eax
    7029:	01 f0                	add    %esi,%eax
    702b:	83 c0 30             	add    $0x30,%eax
    702e:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    7030:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7037:	eb 46                	jmp    707f <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7039:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7040:	00 
    7041:	8b 45 08             	mov    0x8(%ebp),%eax
    7044:	89 04 24             	mov    %eax,(%esp)
    7047:	e8 95 dc ff ff       	call   4ce1 <getbits>
    704c:	89 c3                	mov    %eax,%ebx
    704e:	8b 75 0c             	mov    0xc(%ebp),%esi
    7051:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7054:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7057:	89 c2                	mov    %eax,%edx
    7059:	c1 e2 03             	shl    $0x3,%edx
    705c:	01 c2                	add    %eax,%edx
    705e:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7061:	89 c2                	mov    %eax,%edx
    7063:	89 c8                	mov    %ecx,%eax
    7065:	c1 e0 02             	shl    $0x2,%eax
    7068:	01 c8                	add    %ecx,%eax
    706a:	c1 e0 03             	shl    $0x3,%eax
    706d:	01 c2                	add    %eax,%edx
    706f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7072:	01 d0                	add    %edx,%eax
    7074:	83 c0 08             	add    $0x8,%eax
    7077:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    707b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    707f:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    7083:	7e b4                	jle    7039 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    7085:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    708c:	eb 46                	jmp    70d4 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    708e:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    7095:	00 
    7096:	8b 45 08             	mov    0x8(%ebp),%eax
    7099:	89 04 24             	mov    %eax,(%esp)
    709c:	e8 40 dc ff ff       	call   4ce1 <getbits>
    70a1:	89 c3                	mov    %eax,%ebx
    70a3:	8b 75 0c             	mov    0xc(%ebp),%esi
    70a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    70a9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    70ac:	89 c2                	mov    %eax,%edx
    70ae:	c1 e2 03             	shl    $0x3,%edx
    70b1:	01 c2                	add    %eax,%edx
    70b3:	8d 04 12             	lea    (%edx,%edx,1),%eax
    70b6:	89 c2                	mov    %eax,%edx
    70b8:	89 c8                	mov    %ecx,%eax
    70ba:	c1 e0 02             	shl    $0x2,%eax
    70bd:	01 c8                	add    %ecx,%eax
    70bf:	c1 e0 03             	shl    $0x3,%eax
    70c2:	01 c2                	add    %eax,%edx
    70c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    70c7:	01 d0                	add    %edx,%eax
    70c9:	83 c0 0c             	add    $0xc,%eax
    70cc:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    70d0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    70d4:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    70d8:	7e b4                	jle    708e <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    70da:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    70dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    70e0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    70e3:	89 c2                	mov    %eax,%edx
    70e5:	c1 e2 03             	shl    $0x3,%edx
    70e8:	01 c2                	add    %eax,%edx
    70ea:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    70f1:	89 c2                	mov    %eax,%edx
    70f3:	89 c8                	mov    %ecx,%eax
    70f5:	c1 e0 02             	shl    $0x2,%eax
    70f8:	01 c8                	add    %ecx,%eax
    70fa:	c1 e0 05             	shl    $0x5,%eax
    70fd:	01 d0                	add    %edx,%eax
    70ff:	01 d8                	add    %ebx,%eax
    7101:	83 c0 2c             	add    $0x2c,%eax
    7104:	8b 00                	mov    (%eax),%eax
    7106:	85 c0                	test   %eax,%eax
    7108:	75 05                	jne    710f <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    710a:	e8 84 cb ff ff       	call   3c93 <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    710f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7112:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7115:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7118:	89 c2                	mov    %eax,%edx
    711a:	c1 e2 03             	shl    $0x3,%edx
    711d:	01 c2                	add    %eax,%edx
    711f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7126:	89 c2                	mov    %eax,%edx
    7128:	89 c8                	mov    %ecx,%eax
    712a:	c1 e0 02             	shl    $0x2,%eax
    712d:	01 c8                	add    %ecx,%eax
    712f:	c1 e0 05             	shl    $0x5,%eax
    7132:	01 d0                	add    %edx,%eax
    7134:	01 d8                	add    %ebx,%eax
    7136:	83 c0 2c             	add    $0x2c,%eax
    7139:	8b 00                	mov    (%eax),%eax
    713b:	83 f8 02             	cmp    $0x2,%eax
    713e:	75 62                	jne    71a2 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    7140:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7143:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7146:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7149:	89 c2                	mov    %eax,%edx
    714b:	c1 e2 03             	shl    $0x3,%edx
    714e:	01 c2                	add    %eax,%edx
    7150:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7157:	89 c2                	mov    %eax,%edx
    7159:	89 c8                	mov    %ecx,%eax
    715b:	c1 e0 02             	shl    $0x2,%eax
    715e:	01 c8                	add    %ecx,%eax
    7160:	c1 e0 05             	shl    $0x5,%eax
    7163:	01 d0                	add    %edx,%eax
    7165:	01 d8                	add    %ebx,%eax
    7167:	83 c0 30             	add    $0x30,%eax
    716a:	8b 00                	mov    (%eax),%eax
    716c:	85 c0                	test   %eax,%eax
    716e:	75 32                	jne    71a2 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    7170:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7173:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7176:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7179:	89 c2                	mov    %eax,%edx
    717b:	c1 e2 03             	shl    $0x3,%edx
    717e:	01 c2                	add    %eax,%edx
    7180:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7187:	89 c2                	mov    %eax,%edx
    7189:	89 c8                	mov    %ecx,%eax
    718b:	c1 e0 02             	shl    $0x2,%eax
    718e:	01 c8                	add    %ecx,%eax
    7190:	c1 e0 05             	shl    $0x5,%eax
    7193:	01 d0                	add    %edx,%eax
    7195:	01 d8                	add    %ebx,%eax
    7197:	83 c0 4c             	add    $0x4c,%eax
    719a:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    71a0:	eb 30                	jmp    71d2 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    71a2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    71a8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    71ab:	89 c2                	mov    %eax,%edx
    71ad:	c1 e2 03             	shl    $0x3,%edx
    71b0:	01 c2                	add    %eax,%edx
    71b2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71b9:	89 c2                	mov    %eax,%edx
    71bb:	89 c8                	mov    %ecx,%eax
    71bd:	c1 e0 02             	shl    $0x2,%eax
    71c0:	01 c8                	add    %ecx,%eax
    71c2:	c1 e0 05             	shl    $0x5,%eax
    71c5:	01 d0                	add    %edx,%eax
    71c7:	01 d8                	add    %ebx,%eax
    71c9:	83 c0 4c             	add    $0x4c,%eax
    71cc:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    71d2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    71d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    71d8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    71db:	89 c2                	mov    %eax,%edx
    71dd:	c1 e2 03             	shl    $0x3,%edx
    71e0:	01 c2                	add    %eax,%edx
    71e2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    71e9:	89 c2                	mov    %eax,%edx
    71eb:	89 c8                	mov    %ecx,%eax
    71ed:	c1 e0 02             	shl    $0x2,%eax
    71f0:	01 c8                	add    %ecx,%eax
    71f2:	c1 e0 05             	shl    $0x5,%eax
    71f5:	01 d0                	add    %edx,%eax
    71f7:	01 d8                	add    %ebx,%eax
    71f9:	83 c0 4c             	add    $0x4c,%eax
    71fc:	8b 00                	mov    (%eax),%eax
    71fe:	ba 14 00 00 00       	mov    $0x14,%edx
    7203:	89 d3                	mov    %edx,%ebx
    7205:	29 c3                	sub    %eax,%ebx
    7207:	8b 75 0c             	mov    0xc(%ebp),%esi
    720a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    720d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7210:	89 c2                	mov    %eax,%edx
    7212:	c1 e2 03             	shl    $0x3,%edx
    7215:	01 c2                	add    %eax,%edx
    7217:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    721e:	89 c2                	mov    %eax,%edx
    7220:	89 c8                	mov    %ecx,%eax
    7222:	c1 e0 02             	shl    $0x2,%eax
    7225:	01 c8                	add    %ecx,%eax
    7227:	c1 e0 05             	shl    $0x5,%eax
    722a:	01 d0                	add    %edx,%eax
    722c:	01 f0                	add    %esi,%eax
    722e:	83 c0 50             	add    $0x50,%eax
    7231:	89 18                	mov    %ebx,(%eax)
    7233:	e9 07 01 00 00       	jmp    733f <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    7238:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    723f:	eb 46                	jmp    7287 <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    7241:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    7248:	00 
    7249:	8b 45 08             	mov    0x8(%ebp),%eax
    724c:	89 04 24             	mov    %eax,(%esp)
    724f:	e8 8d da ff ff       	call   4ce1 <getbits>
    7254:	89 c3                	mov    %eax,%ebx
    7256:	8b 75 0c             	mov    0xc(%ebp),%esi
    7259:	8b 45 f0             	mov    -0x10(%ebp),%eax
    725c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    725f:	89 c2                	mov    %eax,%edx
    7261:	c1 e2 03             	shl    $0x3,%edx
    7264:	01 c2                	add    %eax,%edx
    7266:	8d 04 12             	lea    (%edx,%edx,1),%eax
    7269:	89 c2                	mov    %eax,%edx
    726b:	89 c8                	mov    %ecx,%eax
    726d:	c1 e0 02             	shl    $0x2,%eax
    7270:	01 c8                	add    %ecx,%eax
    7272:	c1 e0 03             	shl    $0x3,%eax
    7275:	01 c2                	add    %eax,%edx
    7277:	8b 45 ec             	mov    -0x14(%ebp),%eax
    727a:	01 d0                	add    %edx,%eax
    727c:	83 c0 08             	add    $0x8,%eax
    727f:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    7283:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7287:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    728b:	7e b4                	jle    7241 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    728d:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    7294:	00 
    7295:	8b 45 08             	mov    0x8(%ebp),%eax
    7298:	89 04 24             	mov    %eax,(%esp)
    729b:	e8 41 da ff ff       	call   4ce1 <getbits>
    72a0:	89 c3                	mov    %eax,%ebx
    72a2:	8b 75 0c             	mov    0xc(%ebp),%esi
    72a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72a8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72ab:	89 c2                	mov    %eax,%edx
    72ad:	c1 e2 03             	shl    $0x3,%edx
    72b0:	01 c2                	add    %eax,%edx
    72b2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72b9:	89 c2                	mov    %eax,%edx
    72bb:	89 c8                	mov    %ecx,%eax
    72bd:	c1 e0 02             	shl    $0x2,%eax
    72c0:	01 c8                	add    %ecx,%eax
    72c2:	c1 e0 05             	shl    $0x5,%eax
    72c5:	01 d0                	add    %edx,%eax
    72c7:	01 f0                	add    %esi,%eax
    72c9:	83 c0 4c             	add    $0x4c,%eax
    72cc:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    72ce:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    72d5:	00 
    72d6:	8b 45 08             	mov    0x8(%ebp),%eax
    72d9:	89 04 24             	mov    %eax,(%esp)
    72dc:	e8 00 da ff ff       	call   4ce1 <getbits>
    72e1:	89 c3                	mov    %eax,%ebx
    72e3:	8b 75 0c             	mov    0xc(%ebp),%esi
    72e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    72e9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    72ec:	89 c2                	mov    %eax,%edx
    72ee:	c1 e2 03             	shl    $0x3,%edx
    72f1:	01 c2                	add    %eax,%edx
    72f3:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    72fa:	89 c2                	mov    %eax,%edx
    72fc:	89 c8                	mov    %ecx,%eax
    72fe:	c1 e0 02             	shl    $0x2,%eax
    7301:	01 c8                	add    %ecx,%eax
    7303:	c1 e0 05             	shl    $0x5,%eax
    7306:	01 d0                	add    %edx,%eax
    7308:	01 f0                	add    %esi,%eax
    730a:	83 c0 50             	add    $0x50,%eax
    730d:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    730f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7312:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7315:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7318:	89 c2                	mov    %eax,%edx
    731a:	c1 e2 03             	shl    $0x3,%edx
    731d:	01 c2                	add    %eax,%edx
    731f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7326:	89 c2                	mov    %eax,%edx
    7328:	89 c8                	mov    %ecx,%eax
    732a:	c1 e0 02             	shl    $0x2,%eax
    732d:	01 c8                	add    %ecx,%eax
    732f:	c1 e0 05             	shl    $0x5,%eax
    7332:	01 d0                	add    %edx,%eax
    7334:	01 d8                	add    %ebx,%eax
    7336:	83 c0 2c             	add    $0x2c,%eax
    7339:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    733f:	8b 45 08             	mov    0x8(%ebp),%eax
    7342:	89 04 24             	mov    %eax,(%esp)
    7345:	e8 85 d8 ff ff       	call   4bcf <get1bit>
    734a:	89 c3                	mov    %eax,%ebx
    734c:	8b 75 0c             	mov    0xc(%ebp),%esi
    734f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7352:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    7355:	89 c2                	mov    %eax,%edx
    7357:	c1 e2 03             	shl    $0x3,%edx
    735a:	01 c2                	add    %eax,%edx
    735c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7363:	89 c2                	mov    %eax,%edx
    7365:	89 c8                	mov    %ecx,%eax
    7367:	c1 e0 02             	shl    $0x2,%eax
    736a:	01 c8                	add    %ecx,%eax
    736c:	c1 e0 05             	shl    $0x5,%eax
    736f:	01 d0                	add    %edx,%eax
    7371:	01 f0                	add    %esi,%eax
    7373:	83 c0 54             	add    $0x54,%eax
    7376:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    7378:	8b 45 08             	mov    0x8(%ebp),%eax
    737b:	89 04 24             	mov    %eax,(%esp)
    737e:	e8 4c d8 ff ff       	call   4bcf <get1bit>
    7383:	89 c3                	mov    %eax,%ebx
    7385:	8b 75 0c             	mov    0xc(%ebp),%esi
    7388:	8b 45 f0             	mov    -0x10(%ebp),%eax
    738b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    738e:	89 c2                	mov    %eax,%edx
    7390:	c1 e2 03             	shl    $0x3,%edx
    7393:	01 c2                	add    %eax,%edx
    7395:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    739c:	89 c2                	mov    %eax,%edx
    739e:	89 c8                	mov    %ecx,%eax
    73a0:	c1 e0 02             	shl    $0x2,%eax
    73a3:	01 c8                	add    %ecx,%eax
    73a5:	c1 e0 05             	shl    $0x5,%eax
    73a8:	01 d0                	add    %edx,%eax
    73aa:	01 f0                	add    %esi,%eax
    73ac:	83 c0 58             	add    $0x58,%eax
    73af:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    73b1:	8b 45 08             	mov    0x8(%ebp),%eax
    73b4:	89 04 24             	mov    %eax,(%esp)
    73b7:	e8 13 d8 ff ff       	call   4bcf <get1bit>
    73bc:	89 c3                	mov    %eax,%ebx
    73be:	8b 75 0c             	mov    0xc(%ebp),%esi
    73c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73c4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    73c7:	89 c2                	mov    %eax,%edx
    73c9:	c1 e2 03             	shl    $0x3,%edx
    73cc:	01 c2                	add    %eax,%edx
    73ce:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    73d5:	89 c2                	mov    %eax,%edx
    73d7:	89 c8                	mov    %ecx,%eax
    73d9:	c1 e0 02             	shl    $0x2,%eax
    73dc:	01 c8                	add    %ecx,%eax
    73de:	c1 e0 05             	shl    $0x5,%eax
    73e1:	01 d0                	add    %edx,%eax
    73e3:	01 f0                	add    %esi,%eax
    73e5:	83 c0 5c             	add    $0x5c,%eax
    73e8:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    73ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    73ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    73f1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    73f4:	0f 8c 4b fa ff ff    	jl     6e45 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    73fa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    73fe:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7402:	0f 8e 31 fa ff ff    	jle    6e39 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    7408:	83 c4 20             	add    $0x20,%esp
    740b:	5b                   	pop    %ebx
    740c:	5e                   	pop    %esi
    740d:	5d                   	pop    %ebp
    740e:	c3                   	ret    

0000740f <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    740f:	55                   	push   %ebp
    7410:	89 e5                	mov    %esp,%ebp
    7412:	56                   	push   %esi
    7413:	53                   	push   %ebx
    7414:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    7417:	8b 45 10             	mov    0x10(%ebp),%eax
    741a:	89 c2                	mov    %eax,%edx
    741c:	c1 e2 03             	shl    $0x3,%edx
    741f:	01 c2                	add    %eax,%edx
    7421:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7428:	89 c2                	mov    %eax,%edx
    742a:	8b 4d 14             	mov    0x14(%ebp),%ecx
    742d:	89 c8                	mov    %ecx,%eax
    742f:	c1 e0 02             	shl    $0x2,%eax
    7432:	01 c8                	add    %ecx,%eax
    7434:	c1 e0 05             	shl    $0x5,%eax
    7437:	01 d0                	add    %edx,%eax
    7439:	8d 50 10             	lea    0x10(%eax),%edx
    743c:	8b 45 0c             	mov    0xc(%ebp),%eax
    743f:	01 d0                	add    %edx,%eax
    7441:	83 c0 08             	add    $0x8,%eax
    7444:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7447:	8b 45 e8             	mov    -0x18(%ebp),%eax
    744a:	8b 40 10             	mov    0x10(%eax),%eax
    744d:	85 c0                	test   %eax,%eax
    744f:	0f 84 7e 02 00 00    	je     76d3 <III_get_scale_factors+0x2c4>
    7455:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7458:	8b 40 14             	mov    0x14(%eax),%eax
    745b:	83 f8 02             	cmp    $0x2,%eax
    745e:	0f 85 6f 02 00 00    	jne    76d3 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    7464:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7467:	8b 40 18             	mov    0x18(%eax),%eax
    746a:	85 c0                	test   %eax,%eax
    746c:	0f 84 6b 01 00 00    	je     75dd <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    7472:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7479:	eb 32                	jmp    74ad <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    747b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    747e:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    7481:	8b 04 85 00 e8 00 00 	mov    0xe800(,%eax,4),%eax
    7488:	89 04 24             	mov    %eax,(%esp)
    748b:	e8 b9 db ff ff       	call   5049 <hgetbits>
    7490:	89 c3                	mov    %eax,%ebx
    7492:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7495:	8b 45 14             	mov    0x14(%ebp),%eax
    7498:	01 c0                	add    %eax,%eax
    749a:	89 c2                	mov    %eax,%edx
    749c:	c1 e2 05             	shl    $0x5,%edx
    749f:	29 c2                	sub    %eax,%edx
    74a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    74a4:	01 d0                	add    %edx,%eax
    74a6:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    74a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    74ad:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    74b1:	7e c8                	jle    747b <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    74b3:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    74ba:	eb 5c                	jmp    7518 <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    74bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    74c3:	eb 49                	jmp    750e <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    74c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    74c8:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    74cb:	8b 04 85 00 e8 00 00 	mov    0xe800(,%eax,4),%eax
    74d2:	89 04 24             	mov    %eax,(%esp)
    74d5:	e8 6f db ff ff       	call   5049 <hgetbits>
    74da:	89 c6                	mov    %eax,%esi
    74dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
    74df:	8b 55 ec             	mov    -0x14(%ebp),%edx
    74e2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    74e5:	89 d0                	mov    %edx,%eax
    74e7:	01 c0                	add    %eax,%eax
    74e9:	01 d0                	add    %edx,%eax
    74eb:	c1 e0 02             	shl    $0x2,%eax
    74ee:	01 d0                	add    %edx,%eax
    74f0:	89 ca                	mov    %ecx,%edx
    74f2:	01 d2                	add    %edx,%edx
    74f4:	89 d1                	mov    %edx,%ecx
    74f6:	c1 e1 05             	shl    $0x5,%ecx
    74f9:	29 d1                	sub    %edx,%ecx
    74fb:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    74fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7501:	01 d0                	add    %edx,%eax
    7503:	83 c0 14             	add    $0x14,%eax
    7506:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    750a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    750e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7512:	7e b1                	jle    74c5 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    7514:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7518:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    751c:	7e 9e                	jle    74bc <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    751e:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7525:	eb 5f                	jmp    7586 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    7527:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    752e:	eb 4c                	jmp    757c <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    7530:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7533:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    7536:	83 c0 10             	add    $0x10,%eax
    7539:	8b 04 85 00 e8 00 00 	mov    0xe800(,%eax,4),%eax
    7540:	89 04 24             	mov    %eax,(%esp)
    7543:	e8 01 db ff ff       	call   5049 <hgetbits>
    7548:	89 c6                	mov    %eax,%esi
    754a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    754d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7550:	8b 4d 14             	mov    0x14(%ebp),%ecx
    7553:	89 d0                	mov    %edx,%eax
    7555:	01 c0                	add    %eax,%eax
    7557:	01 d0                	add    %edx,%eax
    7559:	c1 e0 02             	shl    $0x2,%eax
    755c:	01 d0                	add    %edx,%eax
    755e:	89 ca                	mov    %ecx,%edx
    7560:	01 d2                	add    %edx,%edx
    7562:	89 d1                	mov    %edx,%ecx
    7564:	c1 e1 05             	shl    $0x5,%ecx
    7567:	29 d1                	sub    %edx,%ecx
    7569:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    756c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    756f:	01 d0                	add    %edx,%eax
    7571:	83 c0 14             	add    $0x14,%eax
    7574:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    7578:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    757c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7580:	7e ae                	jle    7530 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    7582:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7586:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    758a:	7e 9b                	jle    7527 <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    758c:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7593:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    759a:	eb 36                	jmp    75d2 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    759c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    759f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    75a2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    75a5:	89 d0                	mov    %edx,%eax
    75a7:	01 c0                	add    %eax,%eax
    75a9:	01 d0                	add    %edx,%eax
    75ab:	c1 e0 02             	shl    $0x2,%eax
    75ae:	01 d0                	add    %edx,%eax
    75b0:	89 ca                	mov    %ecx,%edx
    75b2:	01 d2                	add    %edx,%edx
    75b4:	89 d1                	mov    %edx,%ecx
    75b6:	c1 e1 05             	shl    $0x5,%ecx
    75b9:	29 d1                	sub    %edx,%ecx
    75bb:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    75be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    75c1:	01 d0                	add    %edx,%eax
    75c3:	83 c0 14             	add    $0x14,%eax
    75c6:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    75cd:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    75ce:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    75d2:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    75d6:	7e c4                	jle    759c <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    75d8:	e9 b1 01 00 00       	jmp    778e <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    75dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    75e4:	e9 8f 00 00 00       	jmp    7678 <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    75e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75ec:	83 c0 04             	add    $0x4,%eax
    75ef:	8b 04 85 e4 e7 00 00 	mov    0xe7e4(,%eax,4),%eax
    75f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    75f9:	eb 64                	jmp    765f <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    75fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7602:	eb 51                	jmp    7655 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    7604:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7607:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    760a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    760d:	c1 e2 04             	shl    $0x4,%edx
    7610:	01 d0                	add    %edx,%eax
    7612:	8b 04 85 00 e8 00 00 	mov    0xe800(,%eax,4),%eax
    7619:	89 04 24             	mov    %eax,(%esp)
    761c:	e8 28 da ff ff       	call   5049 <hgetbits>
    7621:	89 c6                	mov    %eax,%esi
    7623:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7626:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7629:	8b 4d 14             	mov    0x14(%ebp),%ecx
    762c:	89 d0                	mov    %edx,%eax
    762e:	01 c0                	add    %eax,%eax
    7630:	01 d0                	add    %edx,%eax
    7632:	c1 e0 02             	shl    $0x2,%eax
    7635:	01 d0                	add    %edx,%eax
    7637:	89 ca                	mov    %ecx,%edx
    7639:	01 d2                	add    %edx,%edx
    763b:	89 d1                	mov    %edx,%ecx
    763d:	c1 e1 05             	shl    $0x5,%ecx
    7640:	29 d1                	sub    %edx,%ecx
    7642:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    7645:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7648:	01 d0                	add    %edx,%eax
    764a:	83 c0 14             	add    $0x14,%eax
    764d:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    7651:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7655:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7659:	7e a9                	jle    7604 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    765b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    765f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7662:	83 c0 01             	add    $0x1,%eax
    7665:	83 c0 04             	add    $0x4,%eax
    7668:	8b 04 85 e4 e7 00 00 	mov    0xe7e4(,%eax,4),%eax
    766f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7672:	7f 87                	jg     75fb <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    7674:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7678:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    767c:	0f 8e 67 ff ff ff    	jle    75e9 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    7682:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7689:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7690:	eb 36                	jmp    76c8 <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    7692:	8b 5d 08             	mov    0x8(%ebp),%ebx
    7695:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7698:	8b 4d 14             	mov    0x14(%ebp),%ecx
    769b:	89 d0                	mov    %edx,%eax
    769d:	01 c0                	add    %eax,%eax
    769f:	01 d0                	add    %edx,%eax
    76a1:	c1 e0 02             	shl    $0x2,%eax
    76a4:	01 d0                	add    %edx,%eax
    76a6:	89 ca                	mov    %ecx,%edx
    76a8:	01 d2                	add    %edx,%edx
    76aa:	89 d1                	mov    %edx,%ecx
    76ac:	c1 e1 05             	shl    $0x5,%ecx
    76af:	29 d1                	sub    %edx,%ecx
    76b1:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    76b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76b7:	01 d0                	add    %edx,%eax
    76b9:	83 c0 14             	add    $0x14,%eax
    76bc:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    76c3:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    76c4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76c8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    76cc:	7e c4                	jle    7692 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    76ce:	e9 bb 00 00 00       	jmp    778e <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    76d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    76da:	e9 89 00 00 00       	jmp    7768 <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    76df:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    76e2:	8b 55 14             	mov    0x14(%ebp),%edx
    76e5:	89 d0                	mov    %edx,%eax
    76e7:	c1 e0 02             	shl    $0x2,%eax
    76ea:	01 d0                	add    %edx,%eax
    76ec:	c1 e0 03             	shl    $0x3,%eax
    76ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
    76f2:	01 d0                	add    %edx,%eax
    76f4:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    76f8:	85 c0                	test   %eax,%eax
    76fa:	74 06                	je     7702 <III_get_scale_factors+0x2f3>
    76fc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    7700:	75 62                	jne    7764 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    7702:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7705:	8b 04 85 e0 e7 00 00 	mov    0xe7e0(,%eax,4),%eax
    770c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    770f:	eb 41                	jmp    7752 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    7711:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    7715:	0f 9f c0             	setg   %al
    7718:	0f b6 d0             	movzbl %al,%edx
    771b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    771e:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    7721:	c1 e2 04             	shl    $0x4,%edx
    7724:	01 d0                	add    %edx,%eax
    7726:	8b 04 85 00 e8 00 00 	mov    0xe800(,%eax,4),%eax
    772d:	89 04 24             	mov    %eax,(%esp)
    7730:	e8 14 d9 ff ff       	call   5049 <hgetbits>
    7735:	89 c3                	mov    %eax,%ebx
    7737:	8b 4d 08             	mov    0x8(%ebp),%ecx
    773a:	8b 45 14             	mov    0x14(%ebp),%eax
    773d:	01 c0                	add    %eax,%eax
    773f:	89 c2                	mov    %eax,%edx
    7741:	c1 e2 05             	shl    $0x5,%edx
    7744:	29 c2                	sub    %eax,%edx
    7746:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7749:	01 d0                	add    %edx,%eax
    774b:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    774e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7752:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7755:	83 c0 01             	add    $0x1,%eax
    7758:	8b 04 85 e0 e7 00 00 	mov    0xe7e0(,%eax,4),%eax
    775f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    7762:	7f ad                	jg     7711 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    7764:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7768:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    776c:	0f 8e 6d ff ff ff    	jle    76df <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    7772:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7775:	8b 45 14             	mov    0x14(%ebp),%eax
    7778:	c1 e0 03             	shl    $0x3,%eax
    777b:	89 c2                	mov    %eax,%edx
    777d:	c1 e2 05             	shl    $0x5,%edx
    7780:	29 c2                	sub    %eax,%edx
    7782:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    7785:	83 c0 58             	add    $0x58,%eax
    7788:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    778e:	83 c4 20             	add    $0x20,%esp
    7791:	5b                   	pop    %ebx
    7792:	5e                   	pop    %esi
    7793:	5d                   	pop    %ebp
    7794:	c3                   	ret    

00007795 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    7795:	55                   	push   %ebp
    7796:	89 e5                	mov    %esp,%ebp
    7798:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    779b:	a1 20 eb 00 00       	mov    0xeb20,%eax
    77a0:	85 c0                	test   %eax,%eax
    77a2:	74 02                	je     77a6 <initialize_huffman+0x11>
    77a4:	eb 0f                	jmp    77b5 <initialize_huffman+0x20>
	read_decoder_table();
    77a6:	e8 03 d9 ff ff       	call   50ae <read_decoder_table>
	huffman_initialized = TRUE;
    77ab:	c7 05 20 eb 00 00 01 	movl   $0x1,0xeb20
    77b2:	00 00 00 
}
    77b5:	c9                   	leave  
    77b6:	c3                   	ret    

000077b7 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    77b7:	55                   	push   %ebp
    77b8:	89 e5                	mov    %esp,%ebp
    77ba:	57                   	push   %edi
    77bb:	56                   	push   %esi
    77bc:	53                   	push   %ebx
    77bd:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    77c0:	e8 d0 ff ff ff       	call   7795 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    77c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77c8:	8b 45 14             	mov    0x14(%ebp),%eax
    77cb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    77ce:	89 c2                	mov    %eax,%edx
    77d0:	c1 e2 03             	shl    $0x3,%edx
    77d3:	01 c2                	add    %eax,%edx
    77d5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    77dc:	89 c2                	mov    %eax,%edx
    77de:	89 c8                	mov    %ecx,%eax
    77e0:	c1 e0 02             	shl    $0x2,%eax
    77e3:	01 c8                	add    %ecx,%eax
    77e5:	c1 e0 05             	shl    $0x5,%eax
    77e8:	01 d0                	add    %edx,%eax
    77ea:	01 d8                	add    %ebx,%eax
    77ec:	83 c0 28             	add    $0x28,%eax
    77ef:	8b 00                	mov    (%eax),%eax
    77f1:	85 c0                	test   %eax,%eax
    77f3:	74 44                	je     7839 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    77f5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    77f8:	8b 45 14             	mov    0x14(%ebp),%eax
    77fb:	8b 4d 10             	mov    0x10(%ebp),%ecx
    77fe:	89 c2                	mov    %eax,%edx
    7800:	c1 e2 03             	shl    $0x3,%edx
    7803:	01 c2                	add    %eax,%edx
    7805:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    780c:	89 c2                	mov    %eax,%edx
    780e:	89 c8                	mov    %ecx,%eax
    7810:	c1 e0 02             	shl    $0x2,%eax
    7813:	01 c8                	add    %ecx,%eax
    7815:	c1 e0 05             	shl    $0x5,%eax
    7818:	01 d0                	add    %edx,%eax
    781a:	01 d8                	add    %ebx,%eax
    781c:	83 c0 2c             	add    $0x2c,%eax
    781f:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    7821:	83 f8 02             	cmp    $0x2,%eax
    7824:	75 13                	jne    7839 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    7826:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    782d:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    7834:	e9 cc 00 00 00       	jmp    7905 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7839:	8b 45 1c             	mov    0x1c(%ebp),%eax
    783c:	8b 00                	mov    (%eax),%eax
    783e:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    7841:	8b 75 0c             	mov    0xc(%ebp),%esi
    7844:	8b 45 14             	mov    0x14(%ebp),%eax
    7847:	8b 5d 10             	mov    0x10(%ebp),%ebx
    784a:	89 c2                	mov    %eax,%edx
    784c:	c1 e2 03             	shl    $0x3,%edx
    784f:	01 c2                	add    %eax,%edx
    7851:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7858:	89 c2                	mov    %eax,%edx
    785a:	89 d8                	mov    %ebx,%eax
    785c:	c1 e0 02             	shl    $0x2,%eax
    785f:	01 d8                	add    %ebx,%eax
    7861:	c1 e0 05             	shl    $0x5,%eax
    7864:	01 d0                	add    %edx,%eax
    7866:	01 f0                	add    %esi,%eax
    7868:	83 c0 4c             	add    $0x4c,%eax
    786b:	8b 00                	mov    (%eax),%eax
    786d:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7870:	89 c8                	mov    %ecx,%eax
    7872:	c1 e0 03             	shl    $0x3,%eax
    7875:	01 c8                	add    %ecx,%eax
    7877:	c1 e0 02             	shl    $0x2,%eax
    787a:	01 c8                	add    %ecx,%eax
    787c:	01 d0                	add    %edx,%eax
    787e:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    7885:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    7888:	8b 45 1c             	mov    0x1c(%ebp),%eax
    788b:	8b 00                	mov    (%eax),%eax
    788d:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    7890:	8b 75 0c             	mov    0xc(%ebp),%esi
    7893:	8b 45 14             	mov    0x14(%ebp),%eax
    7896:	8b 5d 10             	mov    0x10(%ebp),%ebx
    7899:	89 c2                	mov    %eax,%edx
    789b:	c1 e2 03             	shl    $0x3,%edx
    789e:	01 c2                	add    %eax,%edx
    78a0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78a7:	89 c2                	mov    %eax,%edx
    78a9:	89 d8                	mov    %ebx,%eax
    78ab:	c1 e0 02             	shl    $0x2,%eax
    78ae:	01 d8                	add    %ebx,%eax
    78b0:	c1 e0 05             	shl    $0x5,%eax
    78b3:	01 d0                	add    %edx,%eax
    78b5:	01 f0                	add    %esi,%eax
    78b7:	83 c0 4c             	add    $0x4c,%eax
    78ba:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    78bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
    78bf:	8b 45 14             	mov    0x14(%ebp),%eax
    78c2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    78c5:	89 c2                	mov    %eax,%edx
    78c7:	c1 e2 03             	shl    $0x3,%edx
    78ca:	01 c2                	add    %eax,%edx
    78cc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    78d3:	89 c2                	mov    %eax,%edx
    78d5:	89 d8                	mov    %ebx,%eax
    78d7:	c1 e0 02             	shl    $0x2,%eax
    78da:	01 d8                	add    %ebx,%eax
    78dc:	c1 e0 05             	shl    $0x5,%eax
    78df:	01 d0                	add    %edx,%eax
    78e1:	01 f8                	add    %edi,%eax
    78e3:	83 c0 50             	add    $0x50,%eax
    78e6:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    78e8:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    78ea:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    78ed:	89 c8                	mov    %ecx,%eax
    78ef:	c1 e0 03             	shl    $0x3,%eax
    78f2:	01 c8                	add    %ecx,%eax
    78f4:	c1 e0 02             	shl    $0x2,%eax
    78f7:	01 c8                	add    %ecx,%eax
    78f9:	01 d0                	add    %edx,%eax
    78fb:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    7902:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7905:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    790c:	e9 ac 01 00 00       	jmp    7abd <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    7911:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7914:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7917:	7d 43                	jge    795c <III_hufman_decode+0x1a5>
    7919:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    791c:	8b 45 14             	mov    0x14(%ebp),%eax
    791f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7922:	89 c2                	mov    %eax,%edx
    7924:	c1 e2 03             	shl    $0x3,%edx
    7927:	01 c2                	add    %eax,%edx
    7929:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7930:	89 c2                	mov    %eax,%edx
    7932:	89 c8                	mov    %ecx,%eax
    7934:	c1 e0 02             	shl    $0x2,%eax
    7937:	01 c8                	add    %ecx,%eax
    7939:	c1 e0 05             	shl    $0x5,%eax
    793c:	01 d0                	add    %edx,%eax
    793e:	01 d8                	add    %ebx,%eax
    7940:	83 c0 34             	add    $0x34,%eax
    7943:	8b 10                	mov    (%eax),%edx
    7945:	89 d0                	mov    %edx,%eax
    7947:	c1 e0 02             	shl    $0x2,%eax
    794a:	01 d0                	add    %edx,%eax
    794c:	c1 e0 03             	shl    $0x3,%eax
    794f:	05 40 1b 01 00       	add    $0x11b40,%eax
    7954:	89 45 e0             	mov    %eax,-0x20(%ebp)
    7957:	e9 86 00 00 00       	jmp    79e2 <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    795c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    795f:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    7962:	7d 40                	jge    79a4 <III_hufman_decode+0x1ed>
    7964:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7967:	8b 45 14             	mov    0x14(%ebp),%eax
    796a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    796d:	89 c2                	mov    %eax,%edx
    796f:	c1 e2 03             	shl    $0x3,%edx
    7972:	01 c2                	add    %eax,%edx
    7974:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    797b:	89 c2                	mov    %eax,%edx
    797d:	89 c8                	mov    %ecx,%eax
    797f:	c1 e0 02             	shl    $0x2,%eax
    7982:	01 c8                	add    %ecx,%eax
    7984:	c1 e0 05             	shl    $0x5,%eax
    7987:	01 d0                	add    %edx,%eax
    7989:	01 d8                	add    %ebx,%eax
    798b:	83 c0 38             	add    $0x38,%eax
    798e:	8b 10                	mov    (%eax),%edx
    7990:	89 d0                	mov    %edx,%eax
    7992:	c1 e0 02             	shl    $0x2,%eax
    7995:	01 d0                	add    %edx,%eax
    7997:	c1 e0 03             	shl    $0x3,%eax
    799a:	05 40 1b 01 00       	add    $0x11b40,%eax
    799f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    79a2:	eb 3e                	jmp    79e2 <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    79a4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    79a7:	8b 45 14             	mov    0x14(%ebp),%eax
    79aa:	8b 4d 10             	mov    0x10(%ebp),%ecx
    79ad:	89 c2                	mov    %eax,%edx
    79af:	c1 e2 03             	shl    $0x3,%edx
    79b2:	01 c2                	add    %eax,%edx
    79b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    79bb:	89 c2                	mov    %eax,%edx
    79bd:	89 c8                	mov    %ecx,%eax
    79bf:	c1 e0 02             	shl    $0x2,%eax
    79c2:	01 c8                	add    %ecx,%eax
    79c4:	c1 e0 05             	shl    $0x5,%eax
    79c7:	01 d0                	add    %edx,%eax
    79c9:	01 d8                	add    %ebx,%eax
    79cb:	83 c0 3c             	add    $0x3c,%eax
    79ce:	8b 10                	mov    (%eax),%edx
    79d0:	89 d0                	mov    %edx,%eax
    79d2:	c1 e0 02             	shl    $0x2,%eax
    79d5:	01 d0                	add    %edx,%eax
    79d7:	c1 e0 03             	shl    $0x3,%eax
    79da:	05 40 1b 01 00       	add    $0x11b40,%eax
    79df:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    79e2:	8d 45 c8             	lea    -0x38(%ebp),%eax
    79e5:	89 44 24 10          	mov    %eax,0x10(%esp)
    79e9:	8d 45 cc             	lea    -0x34(%ebp),%eax
    79ec:	89 44 24 0c          	mov    %eax,0xc(%esp)
    79f0:	8d 45 d0             	lea    -0x30(%ebp),%eax
    79f3:	89 44 24 08          	mov    %eax,0x8(%esp)
    79f7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    79fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    79fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7a01:	89 04 24             	mov    %eax,(%esp)
    7a04:	e8 fd ee ff ff       	call   6906 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    7a09:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7a0c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a11:	89 c8                	mov    %ecx,%eax
    7a13:	f7 ea                	imul   %edx
    7a15:	c1 fa 02             	sar    $0x2,%edx
    7a18:	89 c8                	mov    %ecx,%eax
    7a1a:	c1 f8 1f             	sar    $0x1f,%eax
    7a1d:	29 c2                	sub    %eax,%edx
    7a1f:	89 d0                	mov    %edx,%eax
    7a21:	89 c2                	mov    %eax,%edx
    7a23:	89 d0                	mov    %edx,%eax
    7a25:	c1 e0 03             	shl    $0x3,%eax
    7a28:	01 d0                	add    %edx,%eax
    7a2a:	c1 e0 03             	shl    $0x3,%eax
    7a2d:	89 c2                	mov    %eax,%edx
    7a2f:	8b 45 08             	mov    0x8(%ebp),%eax
    7a32:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a35:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7a38:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a3d:	89 c8                	mov    %ecx,%eax
    7a3f:	f7 ea                	imul   %edx
    7a41:	c1 fa 02             	sar    $0x2,%edx
    7a44:	89 c8                	mov    %ecx,%eax
    7a46:	c1 f8 1f             	sar    $0x1f,%eax
    7a49:	29 c2                	sub    %eax,%edx
    7a4b:	89 d0                	mov    %edx,%eax
    7a4d:	c1 e0 03             	shl    $0x3,%eax
    7a50:	01 d0                	add    %edx,%eax
    7a52:	01 c0                	add    %eax,%eax
    7a54:	29 c1                	sub    %eax,%ecx
    7a56:	89 ca                	mov    %ecx,%edx
    7a58:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7a5b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    7a5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7a61:	8d 48 01             	lea    0x1(%eax),%ecx
    7a64:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a69:	89 c8                	mov    %ecx,%eax
    7a6b:	f7 ea                	imul   %edx
    7a6d:	c1 fa 02             	sar    $0x2,%edx
    7a70:	89 c8                	mov    %ecx,%eax
    7a72:	c1 f8 1f             	sar    $0x1f,%eax
    7a75:	29 c2                	sub    %eax,%edx
    7a77:	89 d0                	mov    %edx,%eax
    7a79:	89 c2                	mov    %eax,%edx
    7a7b:	89 d0                	mov    %edx,%eax
    7a7d:	c1 e0 03             	shl    $0x3,%eax
    7a80:	01 d0                	add    %edx,%eax
    7a82:	c1 e0 03             	shl    $0x3,%eax
    7a85:	89 c2                	mov    %eax,%edx
    7a87:	8b 45 08             	mov    0x8(%ebp),%eax
    7a8a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7a8d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7a90:	8d 48 01             	lea    0x1(%eax),%ecx
    7a93:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7a98:	89 c8                	mov    %ecx,%eax
    7a9a:	f7 ea                	imul   %edx
    7a9c:	c1 fa 02             	sar    $0x2,%edx
    7a9f:	89 c8                	mov    %ecx,%eax
    7aa1:	c1 f8 1f             	sar    $0x1f,%eax
    7aa4:	29 c2                	sub    %eax,%edx
    7aa6:	89 d0                	mov    %edx,%eax
    7aa8:	c1 e0 03             	shl    $0x3,%eax
    7aab:	01 d0                	add    %edx,%eax
    7aad:	01 c0                	add    %eax,%eax
    7aaf:	29 c1                	sub    %eax,%ecx
    7ab1:	89 ca                	mov    %ecx,%edx
    7ab3:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7ab6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    7ab9:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    7abd:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    7ac0:	8b 75 0c             	mov    0xc(%ebp),%esi
    7ac3:	8b 45 14             	mov    0x14(%ebp),%eax
    7ac6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ac9:	89 c2                	mov    %eax,%edx
    7acb:	c1 e2 03             	shl    $0x3,%edx
    7ace:	01 c2                	add    %eax,%edx
    7ad0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ad7:	89 c2                	mov    %eax,%edx
    7ad9:	89 c8                	mov    %ecx,%eax
    7adb:	c1 e0 02             	shl    $0x2,%eax
    7ade:	01 c8                	add    %ecx,%eax
    7ae0:	c1 e0 05             	shl    $0x5,%eax
    7ae3:	01 d0                	add    %edx,%eax
    7ae5:	01 f0                	add    %esi,%eax
    7ae7:	83 c0 1c             	add    $0x1c,%eax
    7aea:	8b 00                	mov    (%eax),%eax
    7aec:	01 c0                	add    %eax,%eax
    7aee:	39 c3                	cmp    %eax,%ebx
    7af0:	0f 82 1b fe ff ff    	jb     7911 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    7af6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7af9:	8b 45 14             	mov    0x14(%ebp),%eax
    7afc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7aff:	89 c2                	mov    %eax,%edx
    7b01:	c1 e2 03             	shl    $0x3,%edx
    7b04:	01 c2                	add    %eax,%edx
    7b06:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7b0d:	89 c2                	mov    %eax,%edx
    7b0f:	89 c8                	mov    %ecx,%eax
    7b11:	c1 e0 02             	shl    $0x2,%eax
    7b14:	01 c8                	add    %ecx,%eax
    7b16:	c1 e0 05             	shl    $0x5,%eax
    7b19:	01 d0                	add    %edx,%eax
    7b1b:	01 d8                	add    %ebx,%eax
    7b1d:	83 c0 5c             	add    $0x5c,%eax
    7b20:	8b 00                	mov    (%eax),%eax
    7b22:	8d 50 20             	lea    0x20(%eax),%edx
    7b25:	89 d0                	mov    %edx,%eax
    7b27:	c1 e0 02             	shl    $0x2,%eax
    7b2a:	01 d0                	add    %edx,%eax
    7b2c:	c1 e0 03             	shl    $0x3,%eax
    7b2f:	05 40 1b 01 00       	add    $0x11b40,%eax
    7b34:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7b37:	e9 91 01 00 00       	jmp    7ccd <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    7b3c:	8d 45 c8             	lea    -0x38(%ebp),%eax
    7b3f:	89 44 24 10          	mov    %eax,0x10(%esp)
    7b43:	8d 45 cc             	lea    -0x34(%ebp),%eax
    7b46:	89 44 24 0c          	mov    %eax,0xc(%esp)
    7b4a:	8d 45 d0             	lea    -0x30(%ebp),%eax
    7b4d:	89 44 24 08          	mov    %eax,0x8(%esp)
    7b51:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    7b54:	89 44 24 04          	mov    %eax,0x4(%esp)
    7b58:	8b 45 e0             	mov    -0x20(%ebp),%eax
    7b5b:	89 04 24             	mov    %eax,(%esp)
    7b5e:	e8 a3 ed ff ff       	call   6906 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    7b63:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7b66:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7b6b:	89 c8                	mov    %ecx,%eax
    7b6d:	f7 ea                	imul   %edx
    7b6f:	c1 fa 02             	sar    $0x2,%edx
    7b72:	89 c8                	mov    %ecx,%eax
    7b74:	c1 f8 1f             	sar    $0x1f,%eax
    7b77:	29 c2                	sub    %eax,%edx
    7b79:	89 d0                	mov    %edx,%eax
    7b7b:	89 c2                	mov    %eax,%edx
    7b7d:	89 d0                	mov    %edx,%eax
    7b7f:	c1 e0 03             	shl    $0x3,%eax
    7b82:	01 d0                	add    %edx,%eax
    7b84:	c1 e0 03             	shl    $0x3,%eax
    7b87:	89 c2                	mov    %eax,%edx
    7b89:	8b 45 08             	mov    0x8(%ebp),%eax
    7b8c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7b8f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7b92:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7b97:	89 c8                	mov    %ecx,%eax
    7b99:	f7 ea                	imul   %edx
    7b9b:	c1 fa 02             	sar    $0x2,%edx
    7b9e:	89 c8                	mov    %ecx,%eax
    7ba0:	c1 f8 1f             	sar    $0x1f,%eax
    7ba3:	29 c2                	sub    %eax,%edx
    7ba5:	89 d0                	mov    %edx,%eax
    7ba7:	c1 e0 03             	shl    $0x3,%eax
    7baa:	01 d0                	add    %edx,%eax
    7bac:	01 c0                	add    %eax,%eax
    7bae:	29 c1                	sub    %eax,%ecx
    7bb0:	89 ca                	mov    %ecx,%edx
    7bb2:	8b 45 cc             	mov    -0x34(%ebp),%eax
    7bb5:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    7bb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7bbb:	8d 48 01             	lea    0x1(%eax),%ecx
    7bbe:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7bc3:	89 c8                	mov    %ecx,%eax
    7bc5:	f7 ea                	imul   %edx
    7bc7:	c1 fa 02             	sar    $0x2,%edx
    7bca:	89 c8                	mov    %ecx,%eax
    7bcc:	c1 f8 1f             	sar    $0x1f,%eax
    7bcf:	29 c2                	sub    %eax,%edx
    7bd1:	89 d0                	mov    %edx,%eax
    7bd3:	89 c2                	mov    %eax,%edx
    7bd5:	89 d0                	mov    %edx,%eax
    7bd7:	c1 e0 03             	shl    $0x3,%eax
    7bda:	01 d0                	add    %edx,%eax
    7bdc:	c1 e0 03             	shl    $0x3,%eax
    7bdf:	89 c2                	mov    %eax,%edx
    7be1:	8b 45 08             	mov    0x8(%ebp),%eax
    7be4:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7be7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7bea:	8d 48 01             	lea    0x1(%eax),%ecx
    7bed:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7bf2:	89 c8                	mov    %ecx,%eax
    7bf4:	f7 ea                	imul   %edx
    7bf6:	c1 fa 02             	sar    $0x2,%edx
    7bf9:	89 c8                	mov    %ecx,%eax
    7bfb:	c1 f8 1f             	sar    $0x1f,%eax
    7bfe:	29 c2                	sub    %eax,%edx
    7c00:	89 d0                	mov    %edx,%eax
    7c02:	c1 e0 03             	shl    $0x3,%eax
    7c05:	01 d0                	add    %edx,%eax
    7c07:	01 c0                	add    %eax,%eax
    7c09:	29 c1                	sub    %eax,%ecx
    7c0b:	89 ca                	mov    %ecx,%edx
    7c0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7c10:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    7c13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7c16:	8d 48 02             	lea    0x2(%eax),%ecx
    7c19:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c1e:	89 c8                	mov    %ecx,%eax
    7c20:	f7 ea                	imul   %edx
    7c22:	c1 fa 02             	sar    $0x2,%edx
    7c25:	89 c8                	mov    %ecx,%eax
    7c27:	c1 f8 1f             	sar    $0x1f,%eax
    7c2a:	29 c2                	sub    %eax,%edx
    7c2c:	89 d0                	mov    %edx,%eax
    7c2e:	89 c2                	mov    %eax,%edx
    7c30:	89 d0                	mov    %edx,%eax
    7c32:	c1 e0 03             	shl    $0x3,%eax
    7c35:	01 d0                	add    %edx,%eax
    7c37:	c1 e0 03             	shl    $0x3,%eax
    7c3a:	89 c2                	mov    %eax,%edx
    7c3c:	8b 45 08             	mov    0x8(%ebp),%eax
    7c3f:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7c42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7c45:	8d 48 02             	lea    0x2(%eax),%ecx
    7c48:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c4d:	89 c8                	mov    %ecx,%eax
    7c4f:	f7 ea                	imul   %edx
    7c51:	c1 fa 02             	sar    $0x2,%edx
    7c54:	89 c8                	mov    %ecx,%eax
    7c56:	c1 f8 1f             	sar    $0x1f,%eax
    7c59:	29 c2                	sub    %eax,%edx
    7c5b:	89 d0                	mov    %edx,%eax
    7c5d:	c1 e0 03             	shl    $0x3,%eax
    7c60:	01 d0                	add    %edx,%eax
    7c62:	01 c0                	add    %eax,%eax
    7c64:	29 c1                	sub    %eax,%ecx
    7c66:	89 ca                	mov    %ecx,%edx
    7c68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    7c6b:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    7c6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7c71:	8d 48 03             	lea    0x3(%eax),%ecx
    7c74:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7c79:	89 c8                	mov    %ecx,%eax
    7c7b:	f7 ea                	imul   %edx
    7c7d:	c1 fa 02             	sar    $0x2,%edx
    7c80:	89 c8                	mov    %ecx,%eax
    7c82:	c1 f8 1f             	sar    $0x1f,%eax
    7c85:	29 c2                	sub    %eax,%edx
    7c87:	89 d0                	mov    %edx,%eax
    7c89:	89 c2                	mov    %eax,%edx
    7c8b:	89 d0                	mov    %edx,%eax
    7c8d:	c1 e0 03             	shl    $0x3,%eax
    7c90:	01 d0                	add    %edx,%eax
    7c92:	c1 e0 03             	shl    $0x3,%eax
    7c95:	89 c2                	mov    %eax,%edx
    7c97:	8b 45 08             	mov    0x8(%ebp),%eax
    7c9a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7c9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7ca0:	8d 48 03             	lea    0x3(%eax),%ecx
    7ca3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7ca8:	89 c8                	mov    %ecx,%eax
    7caa:	f7 ea                	imul   %edx
    7cac:	c1 fa 02             	sar    $0x2,%edx
    7caf:	89 c8                	mov    %ecx,%eax
    7cb1:	c1 f8 1f             	sar    $0x1f,%eax
    7cb4:	29 c2                	sub    %eax,%edx
    7cb6:	89 d0                	mov    %edx,%eax
    7cb8:	c1 e0 03             	shl    $0x3,%eax
    7cbb:	01 d0                	add    %edx,%eax
    7cbd:	01 c0                	add    %eax,%eax
    7cbf:	29 c1                	sub    %eax,%ecx
    7cc1:	89 ca                	mov    %ecx,%edx
    7cc3:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7cc6:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    7cc9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    7ccd:	e8 5b d3 ff ff       	call   502d <hsstell>
    7cd2:	89 c3                	mov    %eax,%ebx
    7cd4:	8b 75 0c             	mov    0xc(%ebp),%esi
    7cd7:	8b 45 14             	mov    0x14(%ebp),%eax
    7cda:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7cdd:	89 c2                	mov    %eax,%edx
    7cdf:	c1 e2 03             	shl    $0x3,%edx
    7ce2:	01 c2                	add    %eax,%edx
    7ce4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ceb:	89 c2                	mov    %eax,%edx
    7ced:	89 c8                	mov    %ecx,%eax
    7cef:	c1 e0 02             	shl    $0x2,%eax
    7cf2:	01 c8                	add    %ecx,%eax
    7cf4:	c1 e0 05             	shl    $0x5,%eax
    7cf7:	01 d0                	add    %edx,%eax
    7cf9:	01 f0                	add    %esi,%eax
    7cfb:	83 c0 18             	add    $0x18,%eax
    7cfe:	8b 10                	mov    (%eax),%edx
    7d00:	8b 45 18             	mov    0x18(%ebp),%eax
    7d03:	01 d0                	add    %edx,%eax
    7d05:	39 c3                	cmp    %eax,%ebx
    7d07:	73 0d                	jae    7d16 <III_hufman_decode+0x55f>
    7d09:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7d10:	0f 8e 26 fe ff ff    	jle    7b3c <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    7d16:	e8 12 d3 ff ff       	call   502d <hsstell>
    7d1b:	89 c3                	mov    %eax,%ebx
    7d1d:	8b 75 0c             	mov    0xc(%ebp),%esi
    7d20:	8b 45 14             	mov    0x14(%ebp),%eax
    7d23:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7d26:	89 c2                	mov    %eax,%edx
    7d28:	c1 e2 03             	shl    $0x3,%edx
    7d2b:	01 c2                	add    %eax,%edx
    7d2d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d34:	89 c2                	mov    %eax,%edx
    7d36:	89 c8                	mov    %ecx,%eax
    7d38:	c1 e0 02             	shl    $0x2,%eax
    7d3b:	01 c8                	add    %ecx,%eax
    7d3d:	c1 e0 05             	shl    $0x5,%eax
    7d40:	01 d0                	add    %edx,%eax
    7d42:	01 f0                	add    %esi,%eax
    7d44:	83 c0 18             	add    $0x18,%eax
    7d47:	8b 10                	mov    (%eax),%edx
    7d49:	8b 45 18             	mov    0x18(%ebp),%eax
    7d4c:	01 d0                	add    %edx,%eax
    7d4e:	39 c3                	cmp    %eax,%ebx
    7d50:	76 48                	jbe    7d9a <III_hufman_decode+0x5e3>
   {  i -=4;
    7d52:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    7d56:	e8 d2 d2 ff ff       	call   502d <hsstell>
    7d5b:	8b 55 18             	mov    0x18(%ebp),%edx
    7d5e:	29 d0                	sub    %edx,%eax
    7d60:	89 c6                	mov    %eax,%esi
    7d62:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7d65:	8b 45 14             	mov    0x14(%ebp),%eax
    7d68:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7d6b:	89 c2                	mov    %eax,%edx
    7d6d:	c1 e2 03             	shl    $0x3,%edx
    7d70:	01 c2                	add    %eax,%edx
    7d72:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7d79:	89 c2                	mov    %eax,%edx
    7d7b:	89 c8                	mov    %ecx,%eax
    7d7d:	c1 e0 02             	shl    $0x2,%eax
    7d80:	01 c8                	add    %ecx,%eax
    7d82:	c1 e0 05             	shl    $0x5,%eax
    7d85:	01 d0                	add    %edx,%eax
    7d87:	01 d8                	add    %ebx,%eax
    7d89:	83 c0 18             	add    $0x18,%eax
    7d8c:	8b 00                	mov    (%eax),%eax
    7d8e:	29 c6                	sub    %eax,%esi
    7d90:	89 f0                	mov    %esi,%eax
    7d92:	89 04 24             	mov    %eax,(%esp)
    7d95:	e8 de d2 ff ff       	call   5078 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    7d9a:	e8 8e d2 ff ff       	call   502d <hsstell>
    7d9f:	89 c3                	mov    %eax,%ebx
    7da1:	8b 75 0c             	mov    0xc(%ebp),%esi
    7da4:	8b 45 14             	mov    0x14(%ebp),%eax
    7da7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7daa:	89 c2                	mov    %eax,%edx
    7dac:	c1 e2 03             	shl    $0x3,%edx
    7daf:	01 c2                	add    %eax,%edx
    7db1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7db8:	89 c2                	mov    %eax,%edx
    7dba:	89 c8                	mov    %ecx,%eax
    7dbc:	c1 e0 02             	shl    $0x2,%eax
    7dbf:	01 c8                	add    %ecx,%eax
    7dc1:	c1 e0 05             	shl    $0x5,%eax
    7dc4:	01 d0                	add    %edx,%eax
    7dc6:	01 f0                	add    %esi,%eax
    7dc8:	83 c0 18             	add    $0x18,%eax
    7dcb:	8b 10                	mov    (%eax),%edx
    7dcd:	8b 45 18             	mov    0x18(%ebp),%eax
    7dd0:	01 d0                	add    %edx,%eax
    7dd2:	39 c3                	cmp    %eax,%ebx
    7dd4:	73 45                	jae    7e1b <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    7dd6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    7dd9:	8b 45 14             	mov    0x14(%ebp),%eax
    7ddc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7ddf:	89 c2                	mov    %eax,%edx
    7de1:	c1 e2 03             	shl    $0x3,%edx
    7de4:	01 c2                	add    %eax,%edx
    7de6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    7ded:	89 c2                	mov    %eax,%edx
    7def:	89 c8                	mov    %ecx,%eax
    7df1:	c1 e0 02             	shl    $0x2,%eax
    7df4:	01 c8                	add    %ecx,%eax
    7df6:	c1 e0 05             	shl    $0x5,%eax
    7df9:	01 d0                	add    %edx,%eax
    7dfb:	01 d8                	add    %ebx,%eax
    7dfd:	83 c0 18             	add    $0x18,%eax
    7e00:	8b 10                	mov    (%eax),%edx
    7e02:	8b 45 18             	mov    0x18(%ebp),%eax
    7e05:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7e08:	e8 20 d2 ff ff       	call   502d <hsstell>
    7e0d:	29 c3                	sub    %eax,%ebx
    7e0f:	89 d8                	mov    %ebx,%eax
    7e11:	89 04 24             	mov    %eax,(%esp)
    7e14:	e8 30 d2 ff ff       	call   5049 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7e19:	eb 5c                	jmp    7e77 <III_hufman_decode+0x6c0>
    7e1b:	eb 5a                	jmp    7e77 <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    7e1d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7e20:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7e25:	89 c8                	mov    %ecx,%eax
    7e27:	f7 ea                	imul   %edx
    7e29:	c1 fa 02             	sar    $0x2,%edx
    7e2c:	89 c8                	mov    %ecx,%eax
    7e2e:	c1 f8 1f             	sar    $0x1f,%eax
    7e31:	29 c2                	sub    %eax,%edx
    7e33:	89 d0                	mov    %edx,%eax
    7e35:	89 c2                	mov    %eax,%edx
    7e37:	89 d0                	mov    %edx,%eax
    7e39:	c1 e0 03             	shl    $0x3,%eax
    7e3c:	01 d0                	add    %edx,%eax
    7e3e:	c1 e0 03             	shl    $0x3,%eax
    7e41:	89 c2                	mov    %eax,%edx
    7e43:	8b 45 08             	mov    0x8(%ebp),%eax
    7e46:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    7e49:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    7e4c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    7e51:	89 c8                	mov    %ecx,%eax
    7e53:	f7 ea                	imul   %edx
    7e55:	c1 fa 02             	sar    $0x2,%edx
    7e58:	89 c8                	mov    %ecx,%eax
    7e5a:	c1 f8 1f             	sar    $0x1f,%eax
    7e5d:	29 c2                	sub    %eax,%edx
    7e5f:	89 d0                	mov    %edx,%eax
    7e61:	c1 e0 03             	shl    $0x3,%eax
    7e64:	01 d0                	add    %edx,%eax
    7e66:	01 c0                	add    %eax,%eax
    7e68:	29 c1                	sub    %eax,%ecx
    7e6a:	89 ca                	mov    %ecx,%edx
    7e6c:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    7e73:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7e77:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    7e7e:	7e 9d                	jle    7e1d <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    7e80:	83 c4 4c             	add    $0x4c,%esp
    7e83:	5b                   	pop    %ebx
    7e84:	5e                   	pop    %esi
    7e85:	5f                   	pop    %edi
    7e86:	5d                   	pop    %ebp
    7e87:	c3                   	ret    

00007e88 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    7e88:	55                   	push   %ebp
    7e89:	89 e5                	mov    %esp,%ebp
    7e8b:	56                   	push   %esi
    7e8c:	53                   	push   %ebx
    7e8d:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    7e90:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    7e97:	8b 45 1c             	mov    0x1c(%ebp),%eax
    7e9a:	8b 00                	mov    (%eax),%eax
    7e9c:	8b 40 10             	mov    0x10(%eax),%eax
    7e9f:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    7ea2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    7ea9:	8b 45 14             	mov    0x14(%ebp),%eax
    7eac:	8b 40 10             	mov    0x10(%eax),%eax
    7eaf:	85 c0                	test   %eax,%eax
    7eb1:	74 61                	je     7f14 <III_dequantize_sample+0x8c>
    7eb3:	8b 45 14             	mov    0x14(%ebp),%eax
    7eb6:	8b 40 14             	mov    0x14(%eax),%eax
    7eb9:	83 f8 02             	cmp    $0x2,%eax
    7ebc:	75 56                	jne    7f14 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    7ebe:	8b 45 14             	mov    0x14(%ebp),%eax
    7ec1:	8b 40 18             	mov    0x18(%eax),%eax
    7ec4:	85 c0                	test   %eax,%eax
    7ec6:	74 15                	je     7edd <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7ec8:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7ecb:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7ed1:	05 84 e8 00 00       	add    $0xe884,%eax
    7ed6:	8b 00                	mov    (%eax),%eax
    7ed8:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7edb:	eb 4a                	jmp    7f27 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    7edd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7ee0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7ee6:	05 d4 e8 00 00       	add    $0xe8d4,%eax
    7eeb:	8b 50 0c             	mov    0xc(%eax),%edx
    7eee:	89 d0                	mov    %edx,%eax
    7ef0:	01 c0                	add    %eax,%eax
    7ef2:	01 d0                	add    %edx,%eax
    7ef4:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    7ef7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7efa:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f00:	05 d4 e8 00 00       	add    $0xe8d4,%eax
    7f05:	8b 40 0c             	mov    0xc(%eax),%eax
    7f08:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    7f0b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    7f12:	eb 13                	jmp    7f27 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    7f14:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7f17:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7f1d:	05 84 e8 00 00       	add    $0xe884,%eax
    7f22:	8b 00                	mov    (%eax),%eax
    7f24:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    7f27:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7f2e:	e9 3d 06 00 00       	jmp    8570 <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    7f33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f3a:	e9 23 06 00 00       	jmp    8562 <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    7f3f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f42:	89 d0                	mov    %edx,%eax
    7f44:	c1 e0 03             	shl    $0x3,%eax
    7f47:	01 d0                	add    %edx,%eax
    7f49:	01 c0                	add    %eax,%eax
    7f4b:	89 c2                	mov    %eax,%edx
    7f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f50:	01 d0                	add    %edx,%eax
    7f52:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7f55:	0f 85 9e 02 00 00    	jne    81f9 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    7f5b:	8b 45 14             	mov    0x14(%ebp),%eax
    7f5e:	8b 40 10             	mov    0x10(%eax),%eax
    7f61:	85 c0                	test   %eax,%eax
    7f63:	0f 84 6b 02 00 00    	je     81d4 <III_dequantize_sample+0x34c>
    7f69:	8b 45 14             	mov    0x14(%ebp),%eax
    7f6c:	8b 40 14             	mov    0x14(%eax),%eax
    7f6f:	83 f8 02             	cmp    $0x2,%eax
    7f72:	0f 85 5c 02 00 00    	jne    81d4 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    7f78:	8b 45 14             	mov    0x14(%ebp),%eax
    7f7b:	8b 40 18             	mov    0x18(%eax),%eax
    7f7e:	85 c0                	test   %eax,%eax
    7f80:	0f 84 af 01 00 00    	je     8135 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    7f86:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7f89:	89 d0                	mov    %edx,%eax
    7f8b:	c1 e0 03             	shl    $0x3,%eax
    7f8e:	01 d0                	add    %edx,%eax
    7f90:	01 c0                	add    %eax,%eax
    7f92:	89 c2                	mov    %eax,%edx
    7f94:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f97:	01 c2                	add    %eax,%edx
    7f99:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7f9c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7fa2:	05 a0 e8 00 00       	add    $0xe8a0,%eax
    7fa7:	8b 00                	mov    (%eax),%eax
    7fa9:	39 c2                	cmp    %eax,%edx
    7fab:	0f 85 93 00 00 00    	jne    8044 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    7fb1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    7fb4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7fba:	05 e0 e8 00 00       	add    $0xe8e0,%eax
    7fbf:	8b 50 0c             	mov    0xc(%eax),%edx
    7fc2:	89 d0                	mov    %edx,%eax
    7fc4:	01 c0                	add    %eax,%eax
    7fc6:	01 d0                	add    %edx,%eax
    7fc8:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    7fcb:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    7fd2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7fd5:	8d 48 01             	lea    0x1(%eax),%ecx
    7fd8:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7fdb:	89 d0                	mov    %edx,%eax
    7fdd:	c1 e0 03             	shl    $0x3,%eax
    7fe0:	01 d0                	add    %edx,%eax
    7fe2:	c1 e0 02             	shl    $0x2,%eax
    7fe5:	01 d0                	add    %edx,%eax
    7fe7:	01 c8                	add    %ecx,%eax
    7fe9:	83 c0 14             	add    $0x14,%eax
    7fec:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    7ff3:	8b 55 dc             	mov    -0x24(%ebp),%edx
    7ff6:	89 d0                	mov    %edx,%eax
    7ff8:	c1 e0 03             	shl    $0x3,%eax
    7ffb:	01 d0                	add    %edx,%eax
    7ffd:	c1 e0 02             	shl    $0x2,%eax
    8000:	01 d0                	add    %edx,%eax
    8002:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8005:	01 d0                	add    %edx,%eax
    8007:	83 c0 14             	add    $0x14,%eax
    800a:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8011:	29 c1                	sub    %eax,%ecx
    8013:	89 c8                	mov    %ecx,%eax
    8015:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8018:	8b 55 dc             	mov    -0x24(%ebp),%edx
    801b:	89 d0                	mov    %edx,%eax
    801d:	c1 e0 03             	shl    $0x3,%eax
    8020:	01 d0                	add    %edx,%eax
    8022:	c1 e0 02             	shl    $0x2,%eax
    8025:	01 d0                	add    %edx,%eax
    8027:	8b 55 ec             	mov    -0x14(%ebp),%edx
    802a:	01 d0                	add    %edx,%eax
    802c:	83 c0 14             	add    $0x14,%eax
    802f:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    8036:	89 d0                	mov    %edx,%eax
    8038:	01 c0                	add    %eax,%eax
    803a:	01 d0                	add    %edx,%eax
    803c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    803f:	e9 8e 01 00 00       	jmp    81d2 <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    8044:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8047:	89 d0                	mov    %edx,%eax
    8049:	c1 e0 03             	shl    $0x3,%eax
    804c:	01 d0                	add    %edx,%eax
    804e:	01 c0                	add    %eax,%eax
    8050:	89 c2                	mov    %eax,%edx
    8052:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8055:	01 c2                	add    %eax,%edx
    8057:	8b 45 dc             	mov    -0x24(%ebp),%eax
    805a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8060:	05 a0 e8 00 00       	add    $0xe8a0,%eax
    8065:	8b 00                	mov    (%eax),%eax
    8067:	39 c2                	cmp    %eax,%edx
    8069:	7d 2a                	jge    8095 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    806b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    806f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8072:	8d 48 01             	lea    0x1(%eax),%ecx
    8075:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8078:	89 d0                	mov    %edx,%eax
    807a:	c1 e0 03             	shl    $0x3,%eax
    807d:	01 d0                	add    %edx,%eax
    807f:	c1 e0 02             	shl    $0x2,%eax
    8082:	01 d0                	add    %edx,%eax
    8084:	01 c8                	add    %ecx,%eax
    8086:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    808d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    8090:	e9 3d 01 00 00       	jmp    81d2 <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8095:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8099:	8b 45 ec             	mov    -0x14(%ebp),%eax
    809c:	8d 48 01             	lea    0x1(%eax),%ecx
    809f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    80a2:	89 d0                	mov    %edx,%eax
    80a4:	c1 e0 03             	shl    $0x3,%eax
    80a7:	01 d0                	add    %edx,%eax
    80a9:	c1 e0 02             	shl    $0x2,%eax
    80ac:	01 d0                	add    %edx,%eax
    80ae:	01 c8                	add    %ecx,%eax
    80b0:	83 c0 14             	add    $0x14,%eax
    80b3:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    80ba:	89 d0                	mov    %edx,%eax
    80bc:	01 c0                	add    %eax,%eax
    80be:	01 d0                	add    %edx,%eax
    80c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    80c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    80c6:	8d 48 01             	lea    0x1(%eax),%ecx
    80c9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    80cc:	89 d0                	mov    %edx,%eax
    80ce:	c1 e0 03             	shl    $0x3,%eax
    80d1:	01 d0                	add    %edx,%eax
    80d3:	c1 e0 02             	shl    $0x2,%eax
    80d6:	01 d0                	add    %edx,%eax
    80d8:	01 c8                	add    %ecx,%eax
    80da:	83 c0 14             	add    $0x14,%eax
    80dd:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    80e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
    80e7:	89 d0                	mov    %edx,%eax
    80e9:	c1 e0 03             	shl    $0x3,%eax
    80ec:	01 d0                	add    %edx,%eax
    80ee:	c1 e0 02             	shl    $0x2,%eax
    80f1:	01 d0                	add    %edx,%eax
    80f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
    80f6:	01 d0                	add    %edx,%eax
    80f8:	83 c0 14             	add    $0x14,%eax
    80fb:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    8102:	29 c1                	sub    %eax,%ecx
    8104:	89 c8                	mov    %ecx,%eax
    8106:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    8109:	8b 55 dc             	mov    -0x24(%ebp),%edx
    810c:	89 d0                	mov    %edx,%eax
    810e:	c1 e0 03             	shl    $0x3,%eax
    8111:	01 d0                	add    %edx,%eax
    8113:	c1 e0 02             	shl    $0x2,%eax
    8116:	01 d0                	add    %edx,%eax
    8118:	8b 55 ec             	mov    -0x14(%ebp),%edx
    811b:	01 d0                	add    %edx,%eax
    811d:	83 c0 14             	add    $0x14,%eax
    8120:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    8127:	89 d0                	mov    %edx,%eax
    8129:	01 c0                	add    %eax,%eax
    812b:	01 d0                	add    %edx,%eax
    812d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    8130:	e9 c4 00 00 00       	jmp    81f9 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    8135:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8139:	8b 45 ec             	mov    -0x14(%ebp),%eax
    813c:	8d 48 01             	lea    0x1(%eax),%ecx
    813f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8142:	89 d0                	mov    %edx,%eax
    8144:	c1 e0 03             	shl    $0x3,%eax
    8147:	01 d0                	add    %edx,%eax
    8149:	c1 e0 02             	shl    $0x2,%eax
    814c:	01 d0                	add    %edx,%eax
    814e:	01 c8                	add    %ecx,%eax
    8150:	83 c0 14             	add    $0x14,%eax
    8153:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    815a:	89 d0                	mov    %edx,%eax
    815c:	01 c0                	add    %eax,%eax
    815e:	01 d0                	add    %edx,%eax
    8160:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    8163:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8166:	8d 48 01             	lea    0x1(%eax),%ecx
    8169:	8b 55 dc             	mov    -0x24(%ebp),%edx
    816c:	89 d0                	mov    %edx,%eax
    816e:	c1 e0 03             	shl    $0x3,%eax
    8171:	01 d0                	add    %edx,%eax
    8173:	c1 e0 02             	shl    $0x2,%eax
    8176:	01 d0                	add    %edx,%eax
    8178:	01 c8                	add    %ecx,%eax
    817a:	83 c0 14             	add    $0x14,%eax
    817d:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    8184:	8b 55 dc             	mov    -0x24(%ebp),%edx
    8187:	89 d0                	mov    %edx,%eax
    8189:	c1 e0 03             	shl    $0x3,%eax
    818c:	01 d0                	add    %edx,%eax
    818e:	c1 e0 02             	shl    $0x2,%eax
    8191:	01 d0                	add    %edx,%eax
    8193:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8196:	01 d0                	add    %edx,%eax
    8198:	83 c0 14             	add    $0x14,%eax
    819b:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    81a2:	29 c1                	sub    %eax,%ecx
    81a4:	89 c8                	mov    %ecx,%eax
    81a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    81a9:	8b 55 dc             	mov    -0x24(%ebp),%edx
    81ac:	89 d0                	mov    %edx,%eax
    81ae:	c1 e0 03             	shl    $0x3,%eax
    81b1:	01 d0                	add    %edx,%eax
    81b3:	c1 e0 02             	shl    $0x2,%eax
    81b6:	01 d0                	add    %edx,%eax
    81b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    81bb:	01 d0                	add    %edx,%eax
    81bd:	83 c0 14             	add    $0x14,%eax
    81c0:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    81c7:	89 d0                	mov    %edx,%eax
    81c9:	01 c0                	add    %eax,%eax
    81cb:	01 d0                	add    %edx,%eax
    81cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    81d0:	eb 27                	jmp    81f9 <III_dequantize_sample+0x371>
    81d2:	eb 25                	jmp    81f9 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    81d4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81db:	8d 48 01             	lea    0x1(%eax),%ecx
    81de:	8b 55 dc             	mov    -0x24(%ebp),%edx
    81e1:	89 d0                	mov    %edx,%eax
    81e3:	c1 e0 03             	shl    $0x3,%eax
    81e6:	01 d0                	add    %edx,%eax
    81e8:	c1 e0 02             	shl    $0x2,%eax
    81eb:	01 d0                	add    %edx,%eax
    81ed:	01 c8                	add    %ecx,%eax
    81ef:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    81f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    81f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    81fc:	89 d0                	mov    %edx,%eax
    81fe:	c1 e0 03             	shl    $0x3,%eax
    8201:	01 d0                	add    %edx,%eax
    8203:	c1 e0 04             	shl    $0x4,%eax
    8206:	89 c2                	mov    %eax,%edx
    8208:	8b 45 0c             	mov    0xc(%ebp),%eax
    820b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    820e:	8b 45 14             	mov    0x14(%ebp),%eax
    8211:	8b 40 08             	mov    0x8(%eax),%eax
    8214:	ba 00 00 00 00       	mov    $0x0,%edx
    8219:	89 45 c8             	mov    %eax,-0x38(%ebp)
    821c:	89 55 cc             	mov    %edx,-0x34(%ebp)
    821f:	df 6d c8             	fildll -0x38(%ebp)
    8222:	dd 05 b0 d0 00 00    	fldl   0xd0b0
    8228:	de e9                	fsubrp %st,%st(1)
    822a:	dd 05 b8 d0 00 00    	fldl   0xd0b8
    8230:	de c9                	fmulp  %st,%st(1)
    8232:	dd 5c 24 08          	fstpl  0x8(%esp)
    8236:	dd 05 c0 d0 00 00    	fldl   0xd0c0
    823c:	dd 1c 24             	fstpl  (%esp)
    823f:	e8 0c c1 ff ff       	call   4350 <pow>
    8244:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8247:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    824a:	8b 45 14             	mov    0x14(%ebp),%eax
    824d:	8b 40 10             	mov    0x10(%eax),%eax
    8250:	85 c0                	test   %eax,%eax
    8252:	0f 84 86 01 00 00    	je     83de <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8258:	8b 45 14             	mov    0x14(%ebp),%eax
    825b:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    825e:	83 f8 02             	cmp    $0x2,%eax
    8261:	75 0a                	jne    826d <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8263:	8b 45 14             	mov    0x14(%ebp),%eax
    8266:	8b 40 18             	mov    0x18(%eax),%eax
    8269:	85 c0                	test   %eax,%eax
    826b:	74 27                	je     8294 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    826d:	8b 45 14             	mov    0x14(%ebp),%eax
    8270:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    8273:	83 f8 02             	cmp    $0x2,%eax
    8276:	0f 85 62 01 00 00    	jne    83de <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    827c:	8b 45 14             	mov    0x14(%ebp),%eax
    827f:	8b 40 18             	mov    0x18(%eax),%eax
    8282:	85 c0                	test   %eax,%eax
    8284:	0f 84 54 01 00 00    	je     83de <III_dequantize_sample+0x556>
    828a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    828e:	0f 8e 4a 01 00 00    	jle    83de <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    8294:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8297:	89 d0                	mov    %edx,%eax
    8299:	c1 e0 03             	shl    $0x3,%eax
    829c:	01 d0                	add    %edx,%eax
    829e:	c1 e0 04             	shl    $0x4,%eax
    82a1:	89 c2                	mov    %eax,%edx
    82a3:	8b 45 0c             	mov    0xc(%ebp),%eax
    82a6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    82a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    82ac:	89 d0                	mov    %edx,%eax
    82ae:	c1 e0 03             	shl    $0x3,%eax
    82b1:	01 d0                	add    %edx,%eax
    82b3:	c1 e0 04             	shl    $0x4,%eax
    82b6:	89 c2                	mov    %eax,%edx
    82b8:	8b 45 0c             	mov    0xc(%ebp),%eax
    82bb:	01 c2                	add    %eax,%edx
    82bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    82c0:	dd 04 c2             	fldl   (%edx,%eax,8)
    82c3:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    82c6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    82c9:	89 d0                	mov    %edx,%eax
    82cb:	c1 e0 03             	shl    $0x3,%eax
    82ce:	01 d0                	add    %edx,%eax
    82d0:	01 c0                	add    %eax,%eax
    82d2:	89 c2                	mov    %eax,%edx
    82d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    82d7:	01 d0                	add    %edx,%eax
    82d9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    82dc:	99                   	cltd   
    82dd:	f7 7d e0             	idivl  -0x20(%ebp)
    82e0:	89 c2                	mov    %eax,%edx
    82e2:	8b 45 14             	mov    0x14(%ebp),%eax
    82e5:	83 c2 08             	add    $0x8,%edx
    82e8:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    82ec:	ba 00 00 00 00       	mov    $0x0,%edx
    82f1:	89 45 c8             	mov    %eax,-0x38(%ebp)
    82f4:	89 55 cc             	mov    %edx,-0x34(%ebp)
    82f7:	df 6d c8             	fildll -0x38(%ebp)
    82fa:	dd 05 c8 d0 00 00    	fldl   0xd0c8
    8300:	de c9                	fmulp  %st,%st(1)
    8302:	dd 5c 24 08          	fstpl  0x8(%esp)
    8306:	dd 05 c0 d0 00 00    	fldl   0xd0c0
    830c:	dd 1c 24             	fstpl  (%esp)
    830f:	e8 3c c0 ff ff       	call   4350 <pow>
    8314:	dc 4d c0             	fmull  -0x40(%ebp)
    8317:	8b 45 f4             	mov    -0xc(%ebp),%eax
    831a:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    831d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8320:	89 d0                	mov    %edx,%eax
    8322:	c1 e0 03             	shl    $0x3,%eax
    8325:	01 d0                	add    %edx,%eax
    8327:	c1 e0 04             	shl    $0x4,%eax
    832a:	89 c2                	mov    %eax,%edx
    832c:	8b 45 0c             	mov    0xc(%ebp),%eax
    832f:	8d 34 02             	lea    (%edx,%eax,1),%esi
    8332:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8335:	89 d0                	mov    %edx,%eax
    8337:	c1 e0 03             	shl    $0x3,%eax
    833a:	01 d0                	add    %edx,%eax
    833c:	c1 e0 04             	shl    $0x4,%eax
    833f:	89 c2                	mov    %eax,%edx
    8341:	8b 45 0c             	mov    0xc(%ebp),%eax
    8344:	01 c2                	add    %eax,%edx
    8346:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8349:	dd 04 c2             	fldl   (%edx,%eax,8)
    834c:	dd 5d c0             	fstpl  -0x40(%ebp)
    834f:	8b 45 14             	mov    0x14(%ebp),%eax
    8352:	8b 40 40             	mov    0x40(%eax),%eax
    8355:	ba 00 00 00 00       	mov    $0x0,%edx
    835a:	89 45 c8             	mov    %eax,-0x38(%ebp)
    835d:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8360:	df 6d c8             	fildll -0x38(%ebp)
    8363:	d9 e8                	fld1   
    8365:	de c1                	faddp  %st,%st(1)
    8367:	dd 05 d0 d0 00 00    	fldl   0xd0d0
    836d:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    836f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8372:	89 d0                	mov    %edx,%eax
    8374:	c1 e0 03             	shl    $0x3,%eax
    8377:	01 d0                	add    %edx,%eax
    8379:	01 c0                	add    %eax,%eax
    837b:	89 c2                	mov    %eax,%edx
    837d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8380:	01 d0                	add    %edx,%eax
    8382:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    8385:	99                   	cltd   
    8386:	f7 7d e0             	idivl  -0x20(%ebp)
    8389:	89 c2                	mov    %eax,%edx
    838b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    838e:	8b 4d 18             	mov    0x18(%ebp),%ecx
    8391:	89 d0                	mov    %edx,%eax
    8393:	01 c0                	add    %eax,%eax
    8395:	01 d0                	add    %edx,%eax
    8397:	c1 e0 02             	shl    $0x2,%eax
    839a:	01 d0                	add    %edx,%eax
    839c:	89 ca                	mov    %ecx,%edx
    839e:	01 d2                	add    %edx,%edx
    83a0:	89 d1                	mov    %edx,%ecx
    83a2:	c1 e1 05             	shl    $0x5,%ecx
    83a5:	29 d1                	sub    %edx,%ecx
    83a7:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    83aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    83ad:	01 d0                	add    %edx,%eax
    83af:	83 c0 14             	add    $0x14,%eax
    83b2:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    83b6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    83b9:	db 45 d4             	fildl  -0x2c(%ebp)
    83bc:	de c9                	fmulp  %st,%st(1)
    83be:	dd 5c 24 08          	fstpl  0x8(%esp)
    83c2:	dd 05 c0 d0 00 00    	fldl   0xd0c0
    83c8:	dd 1c 24             	fstpl  (%esp)
    83cb:	e8 80 bf ff ff       	call   4350 <pow>
    83d0:	dc 4d c0             	fmull  -0x40(%ebp)
    83d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83d6:	dd 1c c6             	fstpl  (%esi,%eax,8)
    83d9:	e9 ab 00 00 00       	jmp    8489 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    83de:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83e1:	89 d0                	mov    %edx,%eax
    83e3:	c1 e0 03             	shl    $0x3,%eax
    83e6:	01 d0                	add    %edx,%eax
    83e8:	c1 e0 04             	shl    $0x4,%eax
    83eb:	89 c2                	mov    %eax,%edx
    83ed:	8b 45 0c             	mov    0xc(%ebp),%eax
    83f0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    83f3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    83f6:	89 d0                	mov    %edx,%eax
    83f8:	c1 e0 03             	shl    $0x3,%eax
    83fb:	01 d0                	add    %edx,%eax
    83fd:	c1 e0 04             	shl    $0x4,%eax
    8400:	89 c2                	mov    %eax,%edx
    8402:	8b 45 0c             	mov    0xc(%ebp),%eax
    8405:	01 c2                	add    %eax,%edx
    8407:	8b 45 f4             	mov    -0xc(%ebp),%eax
    840a:	dd 04 c2             	fldl   (%edx,%eax,8)
    840d:	dd 5d c0             	fstpl  -0x40(%ebp)
    8410:	8b 45 14             	mov    0x14(%ebp),%eax
    8413:	8b 40 40             	mov    0x40(%eax),%eax
    8416:	ba 00 00 00 00       	mov    $0x0,%edx
    841b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    841e:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8421:	df 6d c8             	fildll -0x38(%ebp)
    8424:	d9 e8                	fld1   
    8426:	de c1                	faddp  %st,%st(1)
    8428:	dd 05 d0 d0 00 00    	fldl   0xd0d0
    842e:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    8430:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8433:	8b 45 18             	mov    0x18(%ebp),%eax
    8436:	01 c0                	add    %eax,%eax
    8438:	89 c2                	mov    %eax,%edx
    843a:	c1 e2 05             	shl    $0x5,%edx
    843d:	29 c2                	sub    %eax,%edx
    843f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8442:	01 d0                	add    %edx,%eax
    8444:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    8447:	89 c2                	mov    %eax,%edx
    8449:	8b 45 14             	mov    0x14(%ebp),%eax
    844c:	8b 48 3c             	mov    0x3c(%eax),%ecx
    844f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8452:	8b 04 85 40 ea 00 00 	mov    0xea40(,%eax,4),%eax
    8459:	0f af c1             	imul   %ecx,%eax
    845c:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    845e:	ba 00 00 00 00       	mov    $0x0,%edx
    8463:	89 45 c8             	mov    %eax,-0x38(%ebp)
    8466:	89 55 cc             	mov    %edx,-0x34(%ebp)
    8469:	df 6d c8             	fildll -0x38(%ebp)
    846c:	de c9                	fmulp  %st,%st(1)
    846e:	dd 5c 24 08          	fstpl  0x8(%esp)
    8472:	dd 05 c0 d0 00 00    	fldl   0xd0c0
    8478:	dd 1c 24             	fstpl  (%esp)
    847b:	e8 d0 be ff ff       	call   4350 <pow>
    8480:	dc 4d c0             	fmull  -0x40(%ebp)
    8483:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8486:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    8489:	8b 55 f0             	mov    -0x10(%ebp),%edx
    848c:	89 d0                	mov    %edx,%eax
    848e:	c1 e0 03             	shl    $0x3,%eax
    8491:	01 d0                	add    %edx,%eax
    8493:	c1 e0 03             	shl    $0x3,%eax
    8496:	89 c2                	mov    %eax,%edx
    8498:	8b 45 08             	mov    0x8(%ebp),%eax
    849b:	01 c2                	add    %eax,%edx
    849d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84a0:	8b 04 82             	mov    (%edx,%eax,4),%eax
    84a3:	c1 e8 1f             	shr    $0x1f,%eax
    84a6:	0f b6 c0             	movzbl %al,%eax
    84a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    84ac:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84af:	89 d0                	mov    %edx,%eax
    84b1:	c1 e0 03             	shl    $0x3,%eax
    84b4:	01 d0                	add    %edx,%eax
    84b6:	c1 e0 04             	shl    $0x4,%eax
    84b9:	89 c2                	mov    %eax,%edx
    84bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    84be:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    84c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84c4:	89 d0                	mov    %edx,%eax
    84c6:	c1 e0 03             	shl    $0x3,%eax
    84c9:	01 d0                	add    %edx,%eax
    84cb:	c1 e0 04             	shl    $0x4,%eax
    84ce:	89 c2                	mov    %eax,%edx
    84d0:	8b 45 0c             	mov    0xc(%ebp),%eax
    84d3:	01 c2                	add    %eax,%edx
    84d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84d8:	dd 04 c2             	fldl   (%edx,%eax,8)
    84db:	dd 5d c0             	fstpl  -0x40(%ebp)
    84de:	8b 55 f0             	mov    -0x10(%ebp),%edx
    84e1:	89 d0                	mov    %edx,%eax
    84e3:	c1 e0 03             	shl    $0x3,%eax
    84e6:	01 d0                	add    %edx,%eax
    84e8:	c1 e0 03             	shl    $0x3,%eax
    84eb:	89 c2                	mov    %eax,%edx
    84ed:	8b 45 08             	mov    0x8(%ebp),%eax
    84f0:	01 c2                	add    %eax,%edx
    84f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84f5:	8b 04 82             	mov    (%edx,%eax,4),%eax
    84f8:	89 04 24             	mov    %eax,(%esp)
    84fb:	e8 47 bd ff ff       	call   4247 <abs>
    8500:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    8503:	db 45 d4             	fildl  -0x2c(%ebp)
    8506:	dd 05 d8 d0 00 00    	fldl   0xd0d8
    850c:	dd 5c 24 08          	fstpl  0x8(%esp)
    8510:	dd 1c 24             	fstpl  (%esp)
    8513:	e8 38 be ff ff       	call   4350 <pow>
    8518:	dc 4d c0             	fmull  -0x40(%ebp)
    851b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    851e:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    8521:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    8525:	74 37                	je     855e <III_dequantize_sample+0x6d6>
    8527:	8b 55 f0             	mov    -0x10(%ebp),%edx
    852a:	89 d0                	mov    %edx,%eax
    852c:	c1 e0 03             	shl    $0x3,%eax
    852f:	01 d0                	add    %edx,%eax
    8531:	c1 e0 04             	shl    $0x4,%eax
    8534:	89 c2                	mov    %eax,%edx
    8536:	8b 45 0c             	mov    0xc(%ebp),%eax
    8539:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    853c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    853f:	89 d0                	mov    %edx,%eax
    8541:	c1 e0 03             	shl    $0x3,%eax
    8544:	01 d0                	add    %edx,%eax
    8546:	c1 e0 04             	shl    $0x4,%eax
    8549:	89 c2                	mov    %eax,%edx
    854b:	8b 45 0c             	mov    0xc(%ebp),%eax
    854e:	01 c2                	add    %eax,%edx
    8550:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8553:	dd 04 c2             	fldl   (%edx,%eax,8)
    8556:	d9 e0                	fchs   
    8558:	8b 45 f4             	mov    -0xc(%ebp),%eax
    855b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    855e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8562:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8566:	0f 8e d3 f9 ff ff    	jle    7f3f <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    856c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8570:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8574:	0f 8e b9 f9 ff ff    	jle    7f33 <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    857a:	83 c4 50             	add    $0x50,%esp
    857d:	5b                   	pop    %ebx
    857e:	5e                   	pop    %esi
    857f:	5d                   	pop    %ebp
    8580:	c3                   	ret    

00008581 <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    8581:	55                   	push   %ebp
    8582:	89 e5                	mov    %esp,%ebp
    8584:	57                   	push   %edi
    8585:	56                   	push   %esi
    8586:	53                   	push   %ebx
    8587:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    858a:	8b 45 14             	mov    0x14(%ebp),%eax
    858d:	8b 00                	mov    (%eax),%eax
    858f:	8b 40 10             	mov    0x10(%eax),%eax
    8592:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    8595:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    859c:	eb 33                	jmp    85d1 <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    859e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    85a5:	eb 20                	jmp    85c7 <III_reorder+0x46>
         ro[sb][ss] = 0;
    85a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    85aa:	89 d0                	mov    %edx,%eax
    85ac:	c1 e0 03             	shl    $0x3,%eax
    85af:	01 d0                	add    %edx,%eax
    85b1:	c1 e0 04             	shl    $0x4,%eax
    85b4:	89 c2                	mov    %eax,%edx
    85b6:	8b 45 0c             	mov    0xc(%ebp),%eax
    85b9:	01 c2                	add    %eax,%edx
    85bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
    85be:	d9 ee                	fldz   
    85c0:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    85c3:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    85c7:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    85cb:	7e da                	jle    85a7 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    85cd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    85d1:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    85d5:	7e c7                	jle    859e <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    85d7:	8b 45 10             	mov    0x10(%ebp),%eax
    85da:	8b 40 10             	mov    0x10(%eax),%eax
    85dd:	85 c0                	test   %eax,%eax
    85df:	0f 84 af 03 00 00    	je     8994 <III_reorder+0x413>
    85e5:	8b 45 10             	mov    0x10(%ebp),%eax
    85e8:	8b 40 14             	mov    0x14(%eax),%eax
    85eb:	83 f8 02             	cmp    $0x2,%eax
    85ee:	0f 85 a0 03 00 00    	jne    8994 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    85f4:	8b 45 10             	mov    0x10(%ebp),%eax
    85f7:	8b 40 18             	mov    0x18(%eax),%eax
    85fa:	85 c0                	test   %eax,%eax
    85fc:	0f 84 00 02 00 00    	je     8802 <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    8602:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    8609:	eb 4c                	jmp    8657 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    860b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    8612:	eb 39                	jmp    864d <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    8614:	8b 55 e0             	mov    -0x20(%ebp),%edx
    8617:	89 d0                	mov    %edx,%eax
    8619:	c1 e0 03             	shl    $0x3,%eax
    861c:	01 d0                	add    %edx,%eax
    861e:	c1 e0 04             	shl    $0x4,%eax
    8621:	89 c2                	mov    %eax,%edx
    8623:	8b 45 0c             	mov    0xc(%ebp),%eax
    8626:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    8629:	8b 55 e0             	mov    -0x20(%ebp),%edx
    862c:	89 d0                	mov    %edx,%eax
    862e:	c1 e0 03             	shl    $0x3,%eax
    8631:	01 d0                	add    %edx,%eax
    8633:	c1 e0 04             	shl    $0x4,%eax
    8636:	89 c2                	mov    %eax,%edx
    8638:	8b 45 08             	mov    0x8(%ebp),%eax
    863b:	01 c2                	add    %eax,%edx
    863d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8640:	dd 04 c2             	fldl   (%edx,%eax,8)
    8643:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8646:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    8649:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    864d:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    8651:	7e c1                	jle    8614 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    8653:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    8657:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    865b:	7e ae                	jle    860b <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    865d:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    8664:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8667:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    866d:	05 dc e8 00 00       	add    $0xe8dc,%eax
    8672:	8b 40 0c             	mov    0xc(%eax),%eax
    8675:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    8678:	8b 45 d0             	mov    -0x30(%ebp),%eax
    867b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8681:	05 e0 e8 00 00       	add    $0xe8e0,%eax
    8686:	8b 40 0c             	mov    0xc(%eax),%eax
    8689:	2b 45 e8             	sub    -0x18(%ebp),%eax
    868c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    868f:	e9 5f 01 00 00       	jmp    87f3 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8694:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    869b:	e9 fd 00 00 00       	jmp    879d <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    86a0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    86a7:	e9 e1 00 00 00       	jmp    878d <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    86ac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    86af:	89 d0                	mov    %edx,%eax
    86b1:	01 c0                	add    %eax,%eax
    86b3:	01 c2                	add    %eax,%edx
    86b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
    86b8:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    86bc:	01 c2                	add    %eax,%edx
    86be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    86c1:	01 d0                	add    %edx,%eax
    86c3:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    86c6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    86c9:	89 d0                	mov    %edx,%eax
    86cb:	01 c0                	add    %eax,%eax
    86cd:	01 c2                	add    %eax,%edx
    86cf:	8b 45 d8             	mov    -0x28(%ebp),%eax
    86d2:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    86d5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    86d8:	89 d0                	mov    %edx,%eax
    86da:	01 c0                	add    %eax,%eax
    86dc:	01 d0                	add    %edx,%eax
    86de:	01 c8                	add    %ecx,%eax
    86e0:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    86e3:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    86e6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    86eb:	89 c8                	mov    %ecx,%eax
    86ed:	f7 ea                	imul   %edx
    86ef:	c1 fa 02             	sar    $0x2,%edx
    86f2:	89 c8                	mov    %ecx,%eax
    86f4:	c1 f8 1f             	sar    $0x1f,%eax
    86f7:	29 c2                	sub    %eax,%edx
    86f9:	89 d0                	mov    %edx,%eax
    86fb:	89 c2                	mov    %eax,%edx
    86fd:	89 d0                	mov    %edx,%eax
    86ff:	c1 e0 03             	shl    $0x3,%eax
    8702:	01 d0                	add    %edx,%eax
    8704:	c1 e0 04             	shl    $0x4,%eax
    8707:	89 c2                	mov    %eax,%edx
    8709:	8b 45 0c             	mov    0xc(%ebp),%eax
    870c:	8d 34 02             	lea    (%edx,%eax,1),%esi
    870f:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    8712:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8717:	89 d8                	mov    %ebx,%eax
    8719:	f7 ea                	imul   %edx
    871b:	c1 fa 02             	sar    $0x2,%edx
    871e:	89 d8                	mov    %ebx,%eax
    8720:	c1 f8 1f             	sar    $0x1f,%eax
    8723:	89 d1                	mov    %edx,%ecx
    8725:	29 c1                	sub    %eax,%ecx
    8727:	89 c8                	mov    %ecx,%eax
    8729:	c1 e0 03             	shl    $0x3,%eax
    872c:	01 c8                	add    %ecx,%eax
    872e:	01 c0                	add    %eax,%eax
    8730:	29 c3                	sub    %eax,%ebx
    8732:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    8734:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8737:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    873c:	89 d8                	mov    %ebx,%eax
    873e:	f7 ea                	imul   %edx
    8740:	c1 fa 02             	sar    $0x2,%edx
    8743:	89 d8                	mov    %ebx,%eax
    8745:	c1 f8 1f             	sar    $0x1f,%eax
    8748:	29 c2                	sub    %eax,%edx
    874a:	89 d0                	mov    %edx,%eax
    874c:	89 c2                	mov    %eax,%edx
    874e:	89 d0                	mov    %edx,%eax
    8750:	c1 e0 03             	shl    $0x3,%eax
    8753:	01 d0                	add    %edx,%eax
    8755:	c1 e0 04             	shl    $0x4,%eax
    8758:	89 c2                	mov    %eax,%edx
    875a:	8b 45 08             	mov    0x8(%ebp),%eax
    875d:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    8760:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    8763:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8768:	89 d8                	mov    %ebx,%eax
    876a:	f7 ea                	imul   %edx
    876c:	c1 fa 02             	sar    $0x2,%edx
    876f:	89 d8                	mov    %ebx,%eax
    8771:	c1 f8 1f             	sar    $0x1f,%eax
    8774:	29 c2                	sub    %eax,%edx
    8776:	89 d0                	mov    %edx,%eax
    8778:	c1 e0 03             	shl    $0x3,%eax
    877b:	01 d0                	add    %edx,%eax
    877d:	01 c0                	add    %eax,%eax
    877f:	29 c3                	sub    %eax,%ebx
    8781:	89 da                	mov    %ebx,%edx
    8783:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8786:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    8789:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    878d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8790:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8793:	0f 8c 13 ff ff ff    	jl     86ac <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8799:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    879d:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    87a1:	0f 8e f9 fe ff ff    	jle    86a0 <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    87a7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    87ab:	8b 55 d0             	mov    -0x30(%ebp),%edx
    87ae:	89 d0                	mov    %edx,%eax
    87b0:	c1 e0 03             	shl    $0x3,%eax
    87b3:	01 d0                	add    %edx,%eax
    87b5:	c1 e0 02             	shl    $0x2,%eax
    87b8:	01 d0                	add    %edx,%eax
    87ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
    87bd:	01 d0                	add    %edx,%eax
    87bf:	83 c0 14             	add    $0x14,%eax
    87c2:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    87c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    87cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    87cf:	8d 48 01             	lea    0x1(%eax),%ecx
    87d2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    87d5:	89 d0                	mov    %edx,%eax
    87d7:	c1 e0 03             	shl    $0x3,%eax
    87da:	01 d0                	add    %edx,%eax
    87dc:	c1 e0 02             	shl    $0x2,%eax
    87df:	01 d0                	add    %edx,%eax
    87e1:	01 c8                	add    %ecx,%eax
    87e3:	83 c0 14             	add    $0x14,%eax
    87e6:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    87ed:	2b 45 e8             	sub    -0x18(%ebp),%eax
    87f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    87f3:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    87f7:	0f 8e 97 fe ff ff    	jle    8694 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    87fd:	e9 ed 01 00 00       	jmp    89ef <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8802:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8809:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8810:	8b 45 d0             	mov    -0x30(%ebp),%eax
    8813:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8819:	05 d4 e8 00 00       	add    $0xe8d4,%eax
    881e:	8b 40 0c             	mov    0xc(%eax),%eax
    8821:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    8824:	e9 5f 01 00 00       	jmp    8988 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    8829:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    8830:	e9 fd 00 00 00       	jmp    8932 <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    8835:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    883c:	e9 e1 00 00 00       	jmp    8922 <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    8841:	8b 55 e8             	mov    -0x18(%ebp),%edx
    8844:	89 d0                	mov    %edx,%eax
    8846:	01 c0                	add    %eax,%eax
    8848:	01 c2                	add    %eax,%edx
    884a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    884d:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    8851:	01 c2                	add    %eax,%edx
    8853:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8856:	01 d0                	add    %edx,%eax
    8858:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    885b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    885e:	89 d0                	mov    %edx,%eax
    8860:	01 c0                	add    %eax,%eax
    8862:	01 c2                	add    %eax,%edx
    8864:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8867:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    886a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    886d:	89 d0                	mov    %edx,%eax
    886f:	01 c0                	add    %eax,%eax
    8871:	01 d0                	add    %edx,%eax
    8873:	01 c8                	add    %ecx,%eax
    8875:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    8878:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    887b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8880:	89 c8                	mov    %ecx,%eax
    8882:	f7 ea                	imul   %edx
    8884:	c1 fa 02             	sar    $0x2,%edx
    8887:	89 c8                	mov    %ecx,%eax
    8889:	c1 f8 1f             	sar    $0x1f,%eax
    888c:	29 c2                	sub    %eax,%edx
    888e:	89 d0                	mov    %edx,%eax
    8890:	89 c2                	mov    %eax,%edx
    8892:	89 d0                	mov    %edx,%eax
    8894:	c1 e0 03             	shl    $0x3,%eax
    8897:	01 d0                	add    %edx,%eax
    8899:	c1 e0 04             	shl    $0x4,%eax
    889c:	89 c2                	mov    %eax,%edx
    889e:	8b 45 0c             	mov    0xc(%ebp),%eax
    88a1:	8d 34 02             	lea    (%edx,%eax,1),%esi
    88a4:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    88a7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    88ac:	89 d8                	mov    %ebx,%eax
    88ae:	f7 ea                	imul   %edx
    88b0:	c1 fa 02             	sar    $0x2,%edx
    88b3:	89 d8                	mov    %ebx,%eax
    88b5:	c1 f8 1f             	sar    $0x1f,%eax
    88b8:	89 d1                	mov    %edx,%ecx
    88ba:	29 c1                	sub    %eax,%ecx
    88bc:	89 c8                	mov    %ecx,%eax
    88be:	c1 e0 03             	shl    $0x3,%eax
    88c1:	01 c8                	add    %ecx,%eax
    88c3:	01 c0                	add    %eax,%eax
    88c5:	29 c3                	sub    %eax,%ebx
    88c7:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    88c9:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    88cc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    88d1:	89 d8                	mov    %ebx,%eax
    88d3:	f7 ea                	imul   %edx
    88d5:	c1 fa 02             	sar    $0x2,%edx
    88d8:	89 d8                	mov    %ebx,%eax
    88da:	c1 f8 1f             	sar    $0x1f,%eax
    88dd:	29 c2                	sub    %eax,%edx
    88df:	89 d0                	mov    %edx,%eax
    88e1:	89 c2                	mov    %eax,%edx
    88e3:	89 d0                	mov    %edx,%eax
    88e5:	c1 e0 03             	shl    $0x3,%eax
    88e8:	01 d0                	add    %edx,%eax
    88ea:	c1 e0 04             	shl    $0x4,%eax
    88ed:	89 c2                	mov    %eax,%edx
    88ef:	8b 45 08             	mov    0x8(%ebp),%eax
    88f2:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    88f5:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    88f8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    88fd:	89 d8                	mov    %ebx,%eax
    88ff:	f7 ea                	imul   %edx
    8901:	c1 fa 02             	sar    $0x2,%edx
    8904:	89 d8                	mov    %ebx,%eax
    8906:	c1 f8 1f             	sar    $0x1f,%eax
    8909:	29 c2                	sub    %eax,%edx
    890b:	89 d0                	mov    %edx,%eax
    890d:	c1 e0 03             	shl    $0x3,%eax
    8910:	01 d0                	add    %edx,%eax
    8912:	01 c0                	add    %eax,%eax
    8914:	29 c3                	sub    %eax,%ebx
    8916:	89 da                	mov    %ebx,%edx
    8918:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    891b:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    891e:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    8922:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    8925:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    8928:	0f 8c 13 ff ff ff    	jl     8841 <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    892e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    8932:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    8936:	0f 8e f9 fe ff ff    	jle    8835 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    893c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8940:	8b 55 d0             	mov    -0x30(%ebp),%edx
    8943:	89 d0                	mov    %edx,%eax
    8945:	c1 e0 03             	shl    $0x3,%eax
    8948:	01 d0                	add    %edx,%eax
    894a:	c1 e0 02             	shl    $0x2,%eax
    894d:	01 d0                	add    %edx,%eax
    894f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8952:	01 d0                	add    %edx,%eax
    8954:	83 c0 14             	add    $0x14,%eax
    8957:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    895e:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    8961:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8964:	8d 48 01             	lea    0x1(%eax),%ecx
    8967:	8b 55 d0             	mov    -0x30(%ebp),%edx
    896a:	89 d0                	mov    %edx,%eax
    896c:	c1 e0 03             	shl    $0x3,%eax
    896f:	01 d0                	add    %edx,%eax
    8971:	c1 e0 02             	shl    $0x2,%eax
    8974:	01 d0                	add    %edx,%eax
    8976:	01 c8                	add    %ecx,%eax
    8978:	83 c0 14             	add    $0x14,%eax
    897b:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    8982:	2b 45 e8             	sub    -0x18(%ebp),%eax
    8985:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    8988:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    898c:	0f 8e 97 fe ff ff    	jle    8829 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    8992:	eb 5b                	jmp    89ef <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    8994:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    899b:	eb 4c                	jmp    89e9 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    899d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    89a4:	eb 39                	jmp    89df <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    89a6:	8b 55 e0             	mov    -0x20(%ebp),%edx
    89a9:	89 d0                	mov    %edx,%eax
    89ab:	c1 e0 03             	shl    $0x3,%eax
    89ae:	01 d0                	add    %edx,%eax
    89b0:	c1 e0 04             	shl    $0x4,%eax
    89b3:	89 c2                	mov    %eax,%edx
    89b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    89b8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    89bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
    89be:	89 d0                	mov    %edx,%eax
    89c0:	c1 e0 03             	shl    $0x3,%eax
    89c3:	01 d0                	add    %edx,%eax
    89c5:	c1 e0 04             	shl    $0x4,%eax
    89c8:	89 c2                	mov    %eax,%edx
    89ca:	8b 45 08             	mov    0x8(%ebp),%eax
    89cd:	01 c2                	add    %eax,%edx
    89cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    89d2:	dd 04 c2             	fldl   (%edx,%eax,8)
    89d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    89d8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    89db:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    89df:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    89e3:	7e c1                	jle    89a6 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    89e5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    89e9:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    89ed:	7e ae                	jle    899d <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    89ef:	83 c4 34             	add    $0x34,%esp
    89f2:	5b                   	pop    %ebx
    89f3:	5e                   	pop    %esi
    89f4:	5f                   	pop    %edi
    89f5:	5d                   	pop    %ebp
    89f6:	c3                   	ret    

000089f7 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    89f7:	55                   	push   %ebp
    89f8:	89 e5                	mov    %esp,%ebp
    89fa:	56                   	push   %esi
    89fb:	53                   	push   %ebx
    89fc:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    8a02:	8b 45 18             	mov    0x18(%ebp),%eax
    8a05:	8b 00                	mov    (%eax),%eax
    8a07:	8b 40 10             	mov    0x10(%eax),%eax
    8a0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    8a0d:	8b 45 18             	mov    0x18(%ebp),%eax
    8a10:	8b 40 08             	mov    0x8(%eax),%eax
    8a13:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8a16:	8b 45 18             	mov    0x18(%ebp),%eax
    8a19:	8b 00                	mov    (%eax),%eax
    8a1b:	8b 40 1c             	mov    0x1c(%eax),%eax
    8a1e:	83 f8 01             	cmp    $0x1,%eax
    8a21:	75 16                	jne    8a39 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    8a23:	8b 45 18             	mov    0x18(%ebp),%eax
    8a26:	8b 00                	mov    (%eax),%eax
    8a28:	8b 40 20             	mov    0x20(%eax),%eax
    8a2b:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8a2e:	85 c0                	test   %eax,%eax
    8a30:	74 07                	je     8a39 <III_stereo+0x42>
    8a32:	b8 01 00 00 00       	mov    $0x1,%eax
    8a37:	eb 05                	jmp    8a3e <III_stereo+0x47>
    8a39:	b8 00 00 00 00       	mov    $0x0,%eax
    8a3e:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8a41:	8b 45 18             	mov    0x18(%ebp),%eax
    8a44:	8b 00                	mov    (%eax),%eax
    8a46:	8b 40 1c             	mov    0x1c(%eax),%eax
    8a49:	83 f8 01             	cmp    $0x1,%eax
    8a4c:	75 16                	jne    8a64 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    8a4e:	8b 45 18             	mov    0x18(%ebp),%eax
    8a51:	8b 00                	mov    (%eax),%eax
    8a53:	8b 40 20             	mov    0x20(%eax),%eax
    8a56:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    8a59:	85 c0                	test   %eax,%eax
    8a5b:	74 07                	je     8a64 <III_stereo+0x6d>
    8a5d:	b8 01 00 00 00       	mov    $0x1,%eax
    8a62:	eb 05                	jmp    8a69 <III_stereo+0x72>
    8a64:	b8 00 00 00 00       	mov    $0x0,%eax
    8a69:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8a6c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8a73:	eb 12                	jmp    8a87 <III_stereo+0x90>
      is_pos[i] = 7;
    8a75:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8a78:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    8a7f:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    8a83:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8a87:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    8a8e:	7e e5                	jle    8a75 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    8a90:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    8a94:	0f 85 18 0a 00 00    	jne    94b2 <III_stereo+0xabb>
    8a9a:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    8a9e:	0f 84 0e 0a 00 00    	je     94b2 <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    8aa4:	8b 45 14             	mov    0x14(%ebp),%eax
    8aa7:	8b 40 10             	mov    0x10(%eax),%eax
    8aaa:	85 c0                	test   %eax,%eax
    8aac:	0f 84 10 08 00 00    	je     92c2 <III_stereo+0x8cb>
    8ab2:	8b 45 14             	mov    0x14(%ebp),%eax
    8ab5:	8b 40 14             	mov    0x14(%eax),%eax
    8ab8:	83 f8 02             	cmp    $0x2,%eax
    8abb:	0f 85 01 08 00 00    	jne    92c2 <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    8ac1:	8b 45 14             	mov    0x14(%ebp),%eax
    8ac4:	8b 40 18             	mov    0x18(%eax),%eax
    8ac7:	85 c0                	test   %eax,%eax
    8ac9:	0f 84 d0 04 00 00    	je     8f9f <III_stereo+0x5a8>
         {  int max_sfb = 0;
    8acf:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    8ad6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8add:	e9 1b 03 00 00       	jmp    8dfd <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    8ae2:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    8ae9:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8af0:	e9 0f 01 00 00       	jmp    8c04 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8af8:	8d 48 01             	lea    0x1(%eax),%ecx
    8afb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8afe:	89 d0                	mov    %edx,%eax
    8b00:	c1 e0 03             	shl    $0x3,%eax
    8b03:	01 d0                	add    %edx,%eax
    8b05:	c1 e0 02             	shl    $0x2,%eax
    8b08:	01 d0                	add    %edx,%eax
    8b0a:	01 c8                	add    %ecx,%eax
    8b0c:	83 c0 14             	add    $0x14,%eax
    8b0f:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
    8b16:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b19:	89 d0                	mov    %edx,%eax
    8b1b:	c1 e0 03             	shl    $0x3,%eax
    8b1e:	01 d0                	add    %edx,%eax
    8b20:	c1 e0 02             	shl    $0x2,%eax
    8b23:	01 d0                	add    %edx,%eax
    8b25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b28:	01 d0                	add    %edx,%eax
    8b2a:	83 c0 14             	add    $0x14,%eax
    8b2d:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    8b34:	29 c1                	sub    %eax,%ecx
    8b36:	89 c8                	mov    %ecx,%eax
    8b38:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    8b3b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8b3e:	89 d0                	mov    %edx,%eax
    8b40:	c1 e0 03             	shl    $0x3,%eax
    8b43:	01 d0                	add    %edx,%eax
    8b45:	c1 e0 02             	shl    $0x2,%eax
    8b48:	01 d0                	add    %edx,%eax
    8b4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8b4d:	01 d0                	add    %edx,%eax
    8b4f:	83 c0 14             	add    $0x14,%eax
    8b52:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    8b59:	89 d0                	mov    %edx,%eax
    8b5b:	01 c0                	add    %eax,%eax
    8b5d:	01 c2                	add    %eax,%edx
    8b5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8b62:	83 c0 01             	add    $0x1,%eax
    8b65:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    8b69:	01 d0                	add    %edx,%eax
    8b6b:	83 e8 01             	sub    $0x1,%eax
    8b6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    8b71:	e9 80 00 00 00       	jmp    8bf6 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    8b76:	8b 45 08             	mov    0x8(%ebp),%eax
    8b79:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    8b7f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8b82:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b87:	89 c8                	mov    %ecx,%eax
    8b89:	f7 ea                	imul   %edx
    8b8b:	c1 fa 02             	sar    $0x2,%edx
    8b8e:	89 c8                	mov    %ecx,%eax
    8b90:	c1 f8 1f             	sar    $0x1f,%eax
    8b93:	89 d3                	mov    %edx,%ebx
    8b95:	29 c3                	sub    %eax,%ebx
    8b97:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8b9a:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    8b9f:	89 c8                	mov    %ecx,%eax
    8ba1:	f7 ea                	imul   %edx
    8ba3:	c1 fa 02             	sar    $0x2,%edx
    8ba6:	89 c8                	mov    %ecx,%eax
    8ba8:	c1 f8 1f             	sar    $0x1f,%eax
    8bab:	29 c2                	sub    %eax,%edx
    8bad:	89 d0                	mov    %edx,%eax
    8baf:	c1 e0 03             	shl    $0x3,%eax
    8bb2:	01 d0                	add    %edx,%eax
    8bb4:	01 c0                	add    %eax,%eax
    8bb6:	29 c1                	sub    %eax,%ecx
    8bb8:	89 ca                	mov    %ecx,%edx
    8bba:	89 d8                	mov    %ebx,%eax
    8bbc:	c1 e0 03             	shl    $0x3,%eax
    8bbf:	01 d8                	add    %ebx,%eax
    8bc1:	01 c0                	add    %eax,%eax
    8bc3:	01 d0                	add    %edx,%eax
    8bc5:	dd 04 c6             	fldl   (%esi,%eax,8)
    8bc8:	d9 ee                	fldz   
    8bca:	df e9                	fucomip %st(1),%st
    8bcc:	7a 0a                	jp     8bd8 <III_stereo+0x1e1>
    8bce:	d9 ee                	fldz   
    8bd0:	df e9                	fucomip %st(1),%st
    8bd2:	dd d8                	fstp   %st(0)
    8bd4:	74 18                	je     8bee <III_stereo+0x1f7>
    8bd6:	eb 02                	jmp    8bda <III_stereo+0x1e3>
    8bd8:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    8bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8bdd:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    8be0:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    8be7:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    8bee:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    8bf2:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    8bf6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    8bfa:	0f 8f 76 ff ff ff    	jg     8b76 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    8c00:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    8c04:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8c08:	0f 8f e7 fe ff ff    	jg     8af5 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    8c0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    8c11:	83 c0 01             	add    $0x1,%eax
    8c14:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    8c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c1a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8c1d:	7e 0b                	jle    8c2a <III_stereo+0x233>
                  max_sfb = sfb;
    8c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c22:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    8c25:	e9 f5 00 00 00       	jmp    8d1f <III_stereo+0x328>
    8c2a:	e9 f0 00 00 00       	jmp    8d1f <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8c32:	8d 48 01             	lea    0x1(%eax),%ecx
    8c35:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c38:	89 d0                	mov    %edx,%eax
    8c3a:	c1 e0 03             	shl    $0x3,%eax
    8c3d:	01 d0                	add    %edx,%eax
    8c3f:	c1 e0 02             	shl    $0x2,%eax
    8c42:	01 d0                	add    %edx,%eax
    8c44:	01 c8                	add    %ecx,%eax
    8c46:	83 c0 14             	add    $0x14,%eax
    8c49:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
    8c50:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c53:	89 d0                	mov    %edx,%eax
    8c55:	c1 e0 03             	shl    $0x3,%eax
    8c58:	01 d0                	add    %edx,%eax
    8c5a:	c1 e0 02             	shl    $0x2,%eax
    8c5d:	01 d0                	add    %edx,%eax
    8c5f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8c62:	01 d0                	add    %edx,%eax
    8c64:	83 c0 14             	add    $0x14,%eax
    8c67:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    8c6e:	29 c1                	sub    %eax,%ecx
    8c70:	89 c8                	mov    %ecx,%eax
    8c72:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    8c75:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8c78:	89 d0                	mov    %edx,%eax
    8c7a:	c1 e0 03             	shl    $0x3,%eax
    8c7d:	01 d0                	add    %edx,%eax
    8c7f:	c1 e0 02             	shl    $0x2,%eax
    8c82:	01 d0                	add    %edx,%eax
    8c84:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8c87:	01 d0                	add    %edx,%eax
    8c89:	83 c0 14             	add    $0x14,%eax
    8c8c:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    8c93:	89 d0                	mov    %edx,%eax
    8c95:	01 c0                	add    %eax,%eax
    8c97:	01 c2                	add    %eax,%edx
    8c99:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8c9c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8ca0:	01 d0                	add    %edx,%eax
    8ca2:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    8ca5:	eb 6e                	jmp    8d15 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    8ca7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    8caa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8cad:	89 d0                	mov    %edx,%eax
    8caf:	01 c0                	add    %eax,%eax
    8cb1:	01 d0                	add    %edx,%eax
    8cb3:	c1 e0 02             	shl    $0x2,%eax
    8cb6:	01 d0                	add    %edx,%eax
    8cb8:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8cbb:	01 d0                	add    %edx,%eax
    8cbd:	83 c0 52             	add    $0x52,%eax
    8cc0:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    8cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cc7:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    8cce:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8cd1:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8cd8:	83 f8 07             	cmp    $0x7,%eax
    8cdb:	74 30                	je     8d0d <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8cdd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ce0:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8ce7:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8ced:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8cf3:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    8cf9:	de c9                	fmulp  %st,%st(1)
    8cfb:	dd 1c 24             	fstpl  (%esp)
    8cfe:	e8 1d b6 ff ff       	call   4320 <tan>
    8d03:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8d06:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    8d0d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    8d11:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8d15:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8d19:	7f 8c                	jg     8ca7 <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    8d1b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    8d1f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8d23:	0f 8e 06 ff ff ff    	jle    8c2f <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    8d29:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d2c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d32:	05 fc e8 00 00       	add    $0xe8fc,%eax
    8d37:	8b 50 0c             	mov    0xc(%eax),%edx
    8d3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d3d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d43:	05 f8 e8 00 00       	add    $0xe8f8,%eax
    8d48:	8b 40 0c             	mov    0xc(%eax),%eax
    8d4b:	29 c2                	sub    %eax,%edx
    8d4d:	89 d0                	mov    %edx,%eax
    8d4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    8d52:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d55:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d5b:	05 f8 e8 00 00       	add    $0xe8f8,%eax
    8d60:	8b 50 0c             	mov    0xc(%eax),%edx
    8d63:	89 d0                	mov    %edx,%eax
    8d65:	01 c0                	add    %eax,%eax
    8d67:	01 c2                	add    %eax,%edx
    8d69:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8d6c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8d70:	01 d0                	add    %edx,%eax
    8d72:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    8d75:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d78:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d7e:	05 00 e9 00 00       	add    $0xe900,%eax
    8d83:	8b 50 0c             	mov    0xc(%eax),%edx
    8d86:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8d89:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8d8f:	05 fc e8 00 00       	add    $0xe8fc,%eax
    8d94:	8b 40 0c             	mov    0xc(%eax),%eax
    8d97:	29 c2                	sub    %eax,%edx
    8d99:	89 d0                	mov    %edx,%eax
    8d9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    8d9e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    8da1:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    8da7:	05 fc e8 00 00       	add    $0xe8fc,%eax
    8dac:	8b 50 0c             	mov    0xc(%eax),%edx
    8daf:	89 d0                	mov    %edx,%eax
    8db1:	01 c0                	add    %eax,%eax
    8db3:	01 c2                	add    %eax,%edx
    8db5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8db8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    8dbc:	01 d0                	add    %edx,%eax
    8dbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    8dc1:	eb 30                	jmp    8df3 <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    8dc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dc6:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    8dcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8dd0:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    8dd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8dda:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    8de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8de4:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    8deb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    8def:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8df3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8df7:	7f ca                	jg     8dc3 <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    8df9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8dfd:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    8e01:	0f 8e db fc ff ff    	jle    8ae2 <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    8e07:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    8e0b:	0f 8f 89 01 00 00    	jg     8f9a <III_stereo+0x5a3>
             {  i = 2;
    8e11:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    8e18:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    8e1f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    8e26:	eb 63                	jmp    8e8b <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    8e28:	8b 45 08             	mov    0x8(%ebp),%eax
    8e2b:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    8e31:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e34:	89 d0                	mov    %edx,%eax
    8e36:	c1 e0 03             	shl    $0x3,%eax
    8e39:	01 d0                	add    %edx,%eax
    8e3b:	01 c0                	add    %eax,%eax
    8e3d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    8e40:	01 d0                	add    %edx,%eax
    8e42:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8e45:	d9 ee                	fldz   
    8e47:	df e9                	fucomip %st(1),%st
    8e49:	7a 0a                	jp     8e55 <III_stereo+0x45e>
    8e4b:	d9 ee                	fldz   
    8e4d:	df e9                	fucomip %st(1),%st
    8e4f:	dd d8                	fstp   %st(0)
    8e51:	74 23                	je     8e76 <III_stereo+0x47f>
    8e53:	eb 02                	jmp    8e57 <III_stereo+0x460>
    8e55:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    8e57:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8e5a:	89 d0                	mov    %edx,%eax
    8e5c:	c1 e0 03             	shl    $0x3,%eax
    8e5f:	01 d0                	add    %edx,%eax
    8e61:	01 c0                	add    %eax,%eax
    8e63:	89 c2                	mov    %eax,%edx
    8e65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    8e68:	01 d0                	add    %edx,%eax
    8e6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    8e6d:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    8e74:	eb 15                	jmp    8e8b <III_stereo+0x494>
                   } else
                   {  ss--;
    8e76:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    8e7a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    8e7e:	79 0b                	jns    8e8b <III_stereo+0x494>
                      {  i--;
    8e80:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    8e84:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    8e8b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8e8f:	79 97                	jns    8e28 <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    8e91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8e98:	eb 04                	jmp    8e9e <III_stereo+0x4a7>
                   i++;
    8e9a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    8e9e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ea1:	89 d0                	mov    %edx,%eax
    8ea3:	c1 e0 03             	shl    $0x3,%eax
    8ea6:	01 d0                	add    %edx,%eax
    8ea8:	c1 e0 02             	shl    $0x2,%eax
    8eab:	01 d0                	add    %edx,%eax
    8ead:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8eb0:	01 d0                	add    %edx,%eax
    8eb2:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    8eb9:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8ebc:	7e dc                	jle    8e9a <III_stereo+0x4a3>
                   i++;
                sfb = i;
    8ebe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8ec1:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    8ec4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ec7:	89 d0                	mov    %edx,%eax
    8ec9:	c1 e0 03             	shl    $0x3,%eax
    8ecc:	01 d0                	add    %edx,%eax
    8ece:	c1 e0 02             	shl    $0x2,%eax
    8ed1:	01 d0                	add    %edx,%eax
    8ed3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8ed6:	01 d0                	add    %edx,%eax
    8ed8:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    8edf:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    8ee2:	e9 a9 00 00 00       	jmp    8f90 <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    8ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8eea:	8d 48 01             	lea    0x1(%eax),%ecx
    8eed:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8ef0:	89 d0                	mov    %edx,%eax
    8ef2:	c1 e0 03             	shl    $0x3,%eax
    8ef5:	01 d0                	add    %edx,%eax
    8ef7:	c1 e0 02             	shl    $0x2,%eax
    8efa:	01 d0                	add    %edx,%eax
    8efc:	01 c8                	add    %ecx,%eax
    8efe:	8b 0c 85 80 e8 00 00 	mov    0xe880(,%eax,4),%ecx
    8f05:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8f08:	89 d0                	mov    %edx,%eax
    8f0a:	c1 e0 03             	shl    $0x3,%eax
    8f0d:	01 d0                	add    %edx,%eax
    8f0f:	c1 e0 02             	shl    $0x2,%eax
    8f12:	01 d0                	add    %edx,%eax
    8f14:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8f17:	01 d0                	add    %edx,%eax
    8f19:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    8f20:	29 c1                	sub    %eax,%ecx
    8f22:	89 c8                	mov    %ecx,%eax
    8f24:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    8f27:	eb 5d                	jmp    8f86 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    8f29:	8b 45 10             	mov    0x10(%ebp),%eax
    8f2c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8f2f:	83 c2 3e             	add    $0x3e,%edx
    8f32:	8b 14 90             	mov    (%eax,%edx,4),%edx
    8f35:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f38:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    8f3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f42:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8f49:	83 f8 07             	cmp    $0x7,%eax
    8f4c:	74 30                	je     8f7e <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    8f4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f51:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    8f58:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    8f5e:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    8f64:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    8f6a:	de c9                	fmulp  %st,%st(1)
    8f6c:	dd 1c 24             	fstpl  (%esp)
    8f6f:	e8 ac b3 ff ff       	call   4320 <tan>
    8f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f77:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    8f7e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    8f82:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    8f86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    8f8a:	7f 9d                	jg     8f29 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    8f8c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8f90:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    8f94:	0f 8e 4d ff ff ff    	jle    8ee7 <III_stereo+0x4f0>
    8f9a:	e9 1e 03 00 00       	jmp    92bd <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    8f9f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8fa6:	e9 08 03 00 00       	jmp    92b3 <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    8fab:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    8fb2:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8fb9:	e9 0f 01 00 00       	jmp    90cd <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    8fbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8fc1:	8d 48 01             	lea    0x1(%eax),%ecx
    8fc4:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8fc7:	89 d0                	mov    %edx,%eax
    8fc9:	c1 e0 03             	shl    $0x3,%eax
    8fcc:	01 d0                	add    %edx,%eax
    8fce:	c1 e0 02             	shl    $0x2,%eax
    8fd1:	01 d0                	add    %edx,%eax
    8fd3:	01 c8                	add    %ecx,%eax
    8fd5:	83 c0 14             	add    $0x14,%eax
    8fd8:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
    8fdf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    8fe2:	89 d0                	mov    %edx,%eax
    8fe4:	c1 e0 03             	shl    $0x3,%eax
    8fe7:	01 d0                	add    %edx,%eax
    8fe9:	c1 e0 02             	shl    $0x2,%eax
    8fec:	01 d0                	add    %edx,%eax
    8fee:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8ff1:	01 d0                	add    %edx,%eax
    8ff3:	83 c0 14             	add    $0x14,%eax
    8ff6:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    8ffd:	29 c1                	sub    %eax,%ecx
    8fff:	89 c8                	mov    %ecx,%eax
    9001:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    9004:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9007:	89 d0                	mov    %edx,%eax
    9009:	c1 e0 03             	shl    $0x3,%eax
    900c:	01 d0                	add    %edx,%eax
    900e:	c1 e0 02             	shl    $0x2,%eax
    9011:	01 d0                	add    %edx,%eax
    9013:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9016:	01 d0                	add    %edx,%eax
    9018:	83 c0 14             	add    $0x14,%eax
    901b:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    9022:	89 d0                	mov    %edx,%eax
    9024:	01 c0                	add    %eax,%eax
    9026:	01 c2                	add    %eax,%edx
    9028:	8b 45 ec             	mov    -0x14(%ebp),%eax
    902b:	83 c0 01             	add    $0x1,%eax
    902e:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    9032:	01 d0                	add    %edx,%eax
    9034:	83 e8 01             	sub    $0x1,%eax
    9037:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    903a:	e9 80 00 00 00       	jmp    90bf <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    903f:	8b 45 08             	mov    0x8(%ebp),%eax
    9042:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    9048:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    904b:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9050:	89 c8                	mov    %ecx,%eax
    9052:	f7 ea                	imul   %edx
    9054:	c1 fa 02             	sar    $0x2,%edx
    9057:	89 c8                	mov    %ecx,%eax
    9059:	c1 f8 1f             	sar    $0x1f,%eax
    905c:	89 d3                	mov    %edx,%ebx
    905e:	29 c3                	sub    %eax,%ebx
    9060:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9063:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9068:	89 c8                	mov    %ecx,%eax
    906a:	f7 ea                	imul   %edx
    906c:	c1 fa 02             	sar    $0x2,%edx
    906f:	89 c8                	mov    %ecx,%eax
    9071:	c1 f8 1f             	sar    $0x1f,%eax
    9074:	29 c2                	sub    %eax,%edx
    9076:	89 d0                	mov    %edx,%eax
    9078:	c1 e0 03             	shl    $0x3,%eax
    907b:	01 d0                	add    %edx,%eax
    907d:	01 c0                	add    %eax,%eax
    907f:	29 c1                	sub    %eax,%ecx
    9081:	89 ca                	mov    %ecx,%edx
    9083:	89 d8                	mov    %ebx,%eax
    9085:	c1 e0 03             	shl    $0x3,%eax
    9088:	01 d8                	add    %ebx,%eax
    908a:	01 c0                	add    %eax,%eax
    908c:	01 d0                	add    %edx,%eax
    908e:	dd 04 c6             	fldl   (%esi,%eax,8)
    9091:	d9 ee                	fldz   
    9093:	df e9                	fucomip %st(1),%st
    9095:	7a 0a                	jp     90a1 <III_stereo+0x6aa>
    9097:	d9 ee                	fldz   
    9099:	df e9                	fucomip %st(1),%st
    909b:	dd d8                	fstp   %st(0)
    909d:	74 18                	je     90b7 <III_stereo+0x6c0>
    909f:	eb 02                	jmp    90a3 <III_stereo+0x6ac>
    90a1:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    90a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90a6:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    90a9:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    90b0:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    90b7:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    90bb:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    90bf:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    90c3:	0f 8f 76 ff ff ff    	jg     903f <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    90c9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    90cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    90d1:	0f 89 e7 fe ff ff    	jns    8fbe <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    90d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
    90da:	83 c0 01             	add    $0x1,%eax
    90dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    90e0:	e9 f0 00 00 00       	jmp    91d5 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    90e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    90e8:	8d 48 01             	lea    0x1(%eax),%ecx
    90eb:	8b 55 c8             	mov    -0x38(%ebp),%edx
    90ee:	89 d0                	mov    %edx,%eax
    90f0:	c1 e0 03             	shl    $0x3,%eax
    90f3:	01 d0                	add    %edx,%eax
    90f5:	c1 e0 02             	shl    $0x2,%eax
    90f8:	01 d0                	add    %edx,%eax
    90fa:	01 c8                	add    %ecx,%eax
    90fc:	83 c0 14             	add    $0x14,%eax
    90ff:	8b 0c 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%ecx
    9106:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9109:	89 d0                	mov    %edx,%eax
    910b:	c1 e0 03             	shl    $0x3,%eax
    910e:	01 d0                	add    %edx,%eax
    9110:	c1 e0 02             	shl    $0x2,%eax
    9113:	01 d0                	add    %edx,%eax
    9115:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9118:	01 d0                	add    %edx,%eax
    911a:	83 c0 14             	add    $0x14,%eax
    911d:	8b 04 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%eax
    9124:	29 c1                	sub    %eax,%ecx
    9126:	89 c8                	mov    %ecx,%eax
    9128:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    912b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    912e:	89 d0                	mov    %edx,%eax
    9130:	c1 e0 03             	shl    $0x3,%eax
    9133:	01 d0                	add    %edx,%eax
    9135:	c1 e0 02             	shl    $0x2,%eax
    9138:	01 d0                	add    %edx,%eax
    913a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    913d:	01 d0                	add    %edx,%eax
    913f:	83 c0 14             	add    $0x14,%eax
    9142:	8b 14 85 8c e8 00 00 	mov    0xe88c(,%eax,4),%edx
    9149:	89 d0                	mov    %edx,%eax
    914b:	01 c0                	add    %eax,%eax
    914d:	01 c2                	add    %eax,%edx
    914f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9152:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9156:	01 d0                	add    %edx,%eax
    9158:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    915b:	eb 6e                	jmp    91cb <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    915d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9160:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9163:	89 d0                	mov    %edx,%eax
    9165:	01 c0                	add    %eax,%eax
    9167:	01 d0                	add    %edx,%eax
    9169:	c1 e0 02             	shl    $0x2,%eax
    916c:	01 d0                	add    %edx,%eax
    916e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9171:	01 d0                	add    %edx,%eax
    9173:	83 c0 52             	add    $0x52,%eax
    9176:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    917a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    917d:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    9184:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9187:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    918e:	83 f8 07             	cmp    $0x7,%eax
    9191:	74 30                	je     91c3 <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    9193:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9196:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    919d:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    91a3:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    91a9:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    91af:	de c9                	fmulp  %st,%st(1)
    91b1:	dd 1c 24             	fstpl  (%esp)
    91b4:	e8 67 b1 ff ff       	call   4320 <tan>
    91b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91bc:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    91c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    91c7:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    91cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    91cf:	7f 8c                	jg     915d <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    91d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    91d5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    91d9:	0f 8e 06 ff ff ff    	jle    90e5 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    91df:	8b 45 c8             	mov    -0x38(%ebp),%eax
    91e2:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91e8:	05 fc e8 00 00       	add    $0xe8fc,%eax
    91ed:	8b 50 0c             	mov    0xc(%eax),%edx
    91f0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    91f3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    91f9:	05 f8 e8 00 00       	add    $0xe8f8,%eax
    91fe:	8b 40 0c             	mov    0xc(%eax),%eax
    9201:	29 c2                	sub    %eax,%edx
    9203:	89 d0                	mov    %edx,%eax
    9205:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    9208:	8b 45 c8             	mov    -0x38(%ebp),%eax
    920b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9211:	05 f8 e8 00 00       	add    $0xe8f8,%eax
    9216:	8b 50 0c             	mov    0xc(%eax),%edx
    9219:	89 d0                	mov    %edx,%eax
    921b:	01 c0                	add    %eax,%eax
    921d:	01 c2                	add    %eax,%edx
    921f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9222:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9226:	01 d0                	add    %edx,%eax
    9228:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    922b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    922e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9234:	05 00 e9 00 00       	add    $0xe900,%eax
    9239:	8b 50 0c             	mov    0xc(%eax),%edx
    923c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    923f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9245:	05 fc e8 00 00       	add    $0xe8fc,%eax
    924a:	8b 40 0c             	mov    0xc(%eax),%eax
    924d:	29 c2                	sub    %eax,%edx
    924f:	89 d0                	mov    %edx,%eax
    9251:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    9254:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9257:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    925d:	05 fc e8 00 00       	add    $0xe8fc,%eax
    9262:	8b 50 0c             	mov    0xc(%eax),%edx
    9265:	89 d0                	mov    %edx,%eax
    9267:	01 c0                	add    %eax,%eax
    9269:	01 c2                	add    %eax,%edx
    926b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    926e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    9272:	01 d0                	add    %edx,%eax
    9274:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    9277:	eb 30                	jmp    92a9 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    9279:	8b 45 f4             	mov    -0xc(%ebp),%eax
    927c:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9283:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9286:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    928d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9290:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    9297:	8b 45 f0             	mov    -0x10(%ebp),%eax
    929a:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    92a1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    92a5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    92a9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    92ad:	7f ca                	jg     9279 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    92af:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92b3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    92b7:	0f 8e ee fc ff ff    	jle    8fab <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    92bd:	e9 f0 01 00 00       	jmp    94b2 <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    92c2:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    92c9:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    92d0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    92d7:	eb 63                	jmp    933c <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    92d9:	8b 45 08             	mov    0x8(%ebp),%eax
    92dc:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    92e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    92e5:	89 d0                	mov    %edx,%eax
    92e7:	c1 e0 03             	shl    $0x3,%eax
    92ea:	01 d0                	add    %edx,%eax
    92ec:	01 c0                	add    %eax,%eax
    92ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    92f1:	01 d0                	add    %edx,%eax
    92f3:	dd 04 c1             	fldl   (%ecx,%eax,8)
    92f6:	d9 ee                	fldz   
    92f8:	df e9                	fucomip %st(1),%st
    92fa:	7a 0a                	jp     9306 <III_stereo+0x90f>
    92fc:	d9 ee                	fldz   
    92fe:	df e9                	fucomip %st(1),%st
    9300:	dd d8                	fstp   %st(0)
    9302:	74 23                	je     9327 <III_stereo+0x930>
    9304:	eb 02                	jmp    9308 <III_stereo+0x911>
    9306:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    9308:	8b 55 f0             	mov    -0x10(%ebp),%edx
    930b:	89 d0                	mov    %edx,%eax
    930d:	c1 e0 03             	shl    $0x3,%eax
    9310:	01 d0                	add    %edx,%eax
    9312:	01 c0                	add    %eax,%eax
    9314:	89 c2                	mov    %eax,%edx
    9316:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9319:	01 d0                	add    %edx,%eax
    931b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    931e:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    9325:	eb 15                	jmp    933c <III_stereo+0x945>
            } else
            {  ss--;
    9327:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    932b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    932f:	79 0b                	jns    933c <III_stereo+0x945>
               {  i--;
    9331:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    9335:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    933c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    9340:	79 97                	jns    92d9 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    9342:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    9349:	eb 04                	jmp    934f <III_stereo+0x958>
            i++;
    934b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    934f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9352:	89 d0                	mov    %edx,%eax
    9354:	c1 e0 03             	shl    $0x3,%eax
    9357:	01 d0                	add    %edx,%eax
    9359:	c1 e0 02             	shl    $0x2,%eax
    935c:	01 d0                	add    %edx,%eax
    935e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9361:	01 d0                	add    %edx,%eax
    9363:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    936a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    936d:	7e dc                	jle    934b <III_stereo+0x954>
            i++;
         sfb = i;
    936f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9372:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    9375:	8b 55 c8             	mov    -0x38(%ebp),%edx
    9378:	89 d0                	mov    %edx,%eax
    937a:	c1 e0 03             	shl    $0x3,%eax
    937d:	01 d0                	add    %edx,%eax
    937f:	c1 e0 02             	shl    $0x2,%eax
    9382:	01 d0                	add    %edx,%eax
    9384:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9387:	01 d0                	add    %edx,%eax
    9389:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    9390:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    9393:	e9 a9 00 00 00       	jmp    9441 <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    9398:	8b 45 f4             	mov    -0xc(%ebp),%eax
    939b:	8d 48 01             	lea    0x1(%eax),%ecx
    939e:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93a1:	89 d0                	mov    %edx,%eax
    93a3:	c1 e0 03             	shl    $0x3,%eax
    93a6:	01 d0                	add    %edx,%eax
    93a8:	c1 e0 02             	shl    $0x2,%eax
    93ab:	01 d0                	add    %edx,%eax
    93ad:	01 c8                	add    %ecx,%eax
    93af:	8b 0c 85 80 e8 00 00 	mov    0xe880(,%eax,4),%ecx
    93b6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    93b9:	89 d0                	mov    %edx,%eax
    93bb:	c1 e0 03             	shl    $0x3,%eax
    93be:	01 d0                	add    %edx,%eax
    93c0:	c1 e0 02             	shl    $0x2,%eax
    93c3:	01 d0                	add    %edx,%eax
    93c5:	8b 55 f4             	mov    -0xc(%ebp),%edx
    93c8:	01 d0                	add    %edx,%eax
    93ca:	8b 04 85 80 e8 00 00 	mov    0xe880(,%eax,4),%eax
    93d1:	29 c1                	sub    %eax,%ecx
    93d3:	89 c8                	mov    %ecx,%eax
    93d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    93d8:	eb 5d                	jmp    9437 <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    93da:	8b 45 10             	mov    0x10(%ebp),%eax
    93dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    93e0:	83 c2 3e             	add    $0x3e,%edx
    93e3:	8b 14 90             	mov    (%eax,%edx,4),%edx
    93e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93e9:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    93f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93f3:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    93fa:	83 f8 07             	cmp    $0x7,%eax
    93fd:	74 30                	je     942f <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    93ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9402:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9409:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    940f:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    9415:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    941b:	de c9                	fmulp  %st,%st(1)
    941d:	dd 1c 24             	fstpl  (%esp)
    9420:	e8 fb ae ff ff       	call   4320 <tan>
    9425:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9428:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    942f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    9433:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    9437:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    943b:	7f 9d                	jg     93da <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    943d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9441:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    9445:	0f 8e 4d ff ff ff    	jle    9398 <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    944b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    944e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9454:	05 d0 e8 00 00       	add    $0xe8d0,%eax
    9459:	8b 00                	mov    (%eax),%eax
    945b:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    945e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9461:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9467:	05 d4 e8 00 00       	add    $0xe8d4,%eax
    946c:	8b 00                	mov    (%eax),%eax
    946e:	ba 40 02 00 00       	mov    $0x240,%edx
    9473:	29 c2                	sub    %eax,%edx
    9475:	89 d0                	mov    %edx,%eax
    9477:	89 45 e8             	mov    %eax,-0x18(%ebp)
    947a:	eb 30                	jmp    94ac <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    947c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    947f:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    9486:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9489:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    9490:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9493:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    949a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    949d:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    94a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    94a8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    94ac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    94b0:	7f ca                	jg     947c <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    94b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    94b9:	eb 55                	jmp    9510 <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    94bb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    94c2:	eb 42                	jmp    9506 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    94c4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    94cb:	eb 2f                	jmp    94fc <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    94cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
    94d0:	89 d0                	mov    %edx,%eax
    94d2:	c1 e0 03             	shl    $0x3,%eax
    94d5:	01 d0                	add    %edx,%eax
    94d7:	c1 e0 09             	shl    $0x9,%eax
    94da:	89 c2                	mov    %eax,%edx
    94dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    94df:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    94e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    94e5:	89 d0                	mov    %edx,%eax
    94e7:	c1 e0 03             	shl    $0x3,%eax
    94ea:	01 d0                	add    %edx,%eax
    94ec:	01 c0                	add    %eax,%eax
    94ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    94f1:	01 d0                	add    %edx,%eax
    94f3:	d9 ee                	fldz   
    94f5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    94f8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    94fc:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9500:	7e cb                	jle    94cd <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    9502:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9506:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    950a:	7e b8                	jle    94c4 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    950c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    9510:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    9514:	7e a5                	jle    94bb <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    9516:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    951a:	0f 85 3d 02 00 00    	jne    975d <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    9520:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9527:	e9 25 02 00 00       	jmp    9751 <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    952c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9533:	e9 0b 02 00 00       	jmp    9743 <III_stereo+0xd4c>
            i = (sb*18)+ss;
    9538:	8b 55 e8             	mov    -0x18(%ebp),%edx
    953b:	89 d0                	mov    %edx,%eax
    953d:	c1 e0 03             	shl    $0x3,%eax
    9540:	01 d0                	add    %edx,%eax
    9542:	01 c0                	add    %eax,%eax
    9544:	89 c2                	mov    %eax,%edx
    9546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9549:	01 d0                	add    %edx,%eax
    954b:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    954e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9551:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    9558:	83 f8 07             	cmp    $0x7,%eax
    955b:	0f 85 2c 01 00 00    	jne    968d <III_stereo+0xc96>
               if ( ms_stereo ) {
    9561:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    9565:	0f 84 b5 00 00 00    	je     9620 <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    956b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    956e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9571:	89 d0                	mov    %edx,%eax
    9573:	c1 e0 03             	shl    $0x3,%eax
    9576:	01 d0                	add    %edx,%eax
    9578:	01 c0                	add    %eax,%eax
    957a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    957d:	01 d0                	add    %edx,%eax
    957f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9582:	8b 45 08             	mov    0x8(%ebp),%eax
    9585:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    958b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    958e:	89 d0                	mov    %edx,%eax
    9590:	c1 e0 03             	shl    $0x3,%eax
    9593:	01 d0                	add    %edx,%eax
    9595:	01 c0                	add    %eax,%eax
    9597:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    959a:	01 d0                	add    %edx,%eax
    959c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    959f:	de c1                	faddp  %st,%st(1)
    95a1:	dd 05 e8 d0 00 00    	fldl   0xd0e8
    95a7:	de f9                	fdivrp %st,%st(1)
    95a9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    95ac:	8b 55 e8             	mov    -0x18(%ebp),%edx
    95af:	89 d0                	mov    %edx,%eax
    95b1:	c1 e0 03             	shl    $0x3,%eax
    95b4:	01 d0                	add    %edx,%eax
    95b6:	01 c0                	add    %eax,%eax
    95b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95bb:	01 d0                	add    %edx,%eax
    95bd:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    95c0:	8b 45 0c             	mov    0xc(%ebp),%eax
    95c3:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    95c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    95cc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    95cf:	89 d0                	mov    %edx,%eax
    95d1:	c1 e0 03             	shl    $0x3,%eax
    95d4:	01 d0                	add    %edx,%eax
    95d6:	01 c0                	add    %eax,%eax
    95d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95db:	01 d0                	add    %edx,%eax
    95dd:	dd 04 c1             	fldl   (%ecx,%eax,8)
    95e0:	8b 45 08             	mov    0x8(%ebp),%eax
    95e3:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    95e9:	8b 55 e8             	mov    -0x18(%ebp),%edx
    95ec:	89 d0                	mov    %edx,%eax
    95ee:	c1 e0 03             	shl    $0x3,%eax
    95f1:	01 d0                	add    %edx,%eax
    95f3:	01 c0                	add    %eax,%eax
    95f5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    95f8:	01 d0                	add    %edx,%eax
    95fa:	dd 04 c1             	fldl   (%ecx,%eax,8)
    95fd:	de e9                	fsubrp %st,%st(1)
    95ff:	dd 05 e8 d0 00 00    	fldl   0xd0e8
    9605:	de f9                	fdivrp %st,%st(1)
    9607:	8b 55 e8             	mov    -0x18(%ebp),%edx
    960a:	89 d0                	mov    %edx,%eax
    960c:	c1 e0 03             	shl    $0x3,%eax
    960f:	01 d0                	add    %edx,%eax
    9611:	01 c0                	add    %eax,%eax
    9613:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9616:	01 d0                	add    %edx,%eax
    9618:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    961b:	e9 1f 01 00 00       	jmp    973f <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    9620:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9623:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9626:	89 d0                	mov    %edx,%eax
    9628:	c1 e0 03             	shl    $0x3,%eax
    962b:	01 d0                	add    %edx,%eax
    962d:	01 c0                	add    %eax,%eax
    962f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9632:	01 d0                	add    %edx,%eax
    9634:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9637:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    963a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    963d:	89 d0                	mov    %edx,%eax
    963f:	c1 e0 03             	shl    $0x3,%eax
    9642:	01 d0                	add    %edx,%eax
    9644:	01 c0                	add    %eax,%eax
    9646:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9649:	01 d0                	add    %edx,%eax
    964b:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    964e:	8b 45 0c             	mov    0xc(%ebp),%eax
    9651:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    9657:	8b 45 08             	mov    0x8(%ebp),%eax
    965a:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    9660:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9663:	89 d0                	mov    %edx,%eax
    9665:	c1 e0 03             	shl    $0x3,%eax
    9668:	01 d0                	add    %edx,%eax
    966a:	01 c0                	add    %eax,%eax
    966c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    966f:	01 d0                	add    %edx,%eax
    9671:	dd 04 c3             	fldl   (%ebx,%eax,8)
    9674:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9677:	89 d0                	mov    %edx,%eax
    9679:	c1 e0 03             	shl    $0x3,%eax
    967c:	01 d0                	add    %edx,%eax
    967e:	01 c0                	add    %eax,%eax
    9680:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9683:	01 d0                	add    %edx,%eax
    9685:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    9688:	e9 b2 00 00 00       	jmp    973f <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    968d:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    9691:	0f 84 94 00 00 00    	je     972b <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    9697:	8b 4d 08             	mov    0x8(%ebp),%ecx
    969a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    969d:	89 d0                	mov    %edx,%eax
    969f:	c1 e0 03             	shl    $0x3,%eax
    96a2:	01 d0                	add    %edx,%eax
    96a4:	01 c0                	add    %eax,%eax
    96a6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    96a9:	01 d0                	add    %edx,%eax
    96ab:	dd 04 c1             	fldl   (%ecx,%eax,8)
    96ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96b1:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    96b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    96bb:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    96c2:	d9 e8                	fld1   
    96c4:	de c1                	faddp  %st,%st(1)
    96c6:	de f9                	fdivrp %st,%st(1)
    96c8:	de c9                	fmulp  %st,%st(1)
    96ca:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    96cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    96d0:	89 d0                	mov    %edx,%eax
    96d2:	c1 e0 03             	shl    $0x3,%eax
    96d5:	01 d0                	add    %edx,%eax
    96d7:	01 c0                	add    %eax,%eax
    96d9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    96dc:	01 d0                	add    %edx,%eax
    96de:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    96e1:	8b 45 0c             	mov    0xc(%ebp),%eax
    96e4:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    96ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
    96ed:	8b 55 e8             	mov    -0x18(%ebp),%edx
    96f0:	89 d0                	mov    %edx,%eax
    96f2:	c1 e0 03             	shl    $0x3,%eax
    96f5:	01 d0                	add    %edx,%eax
    96f7:	01 c0                	add    %eax,%eax
    96f9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    96fc:	01 d0                	add    %edx,%eax
    96fe:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9701:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9704:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    970b:	d9 e8                	fld1   
    970d:	de c1                	faddp  %st,%st(1)
    970f:	d9 e8                	fld1   
    9711:	de f1                	fdivp  %st,%st(1)
    9713:	de c9                	fmulp  %st,%st(1)
    9715:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9718:	89 d0                	mov    %edx,%eax
    971a:	c1 e0 03             	shl    $0x3,%eax
    971d:	01 d0                	add    %edx,%eax
    971f:	01 c0                	add    %eax,%eax
    9721:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9724:	01 d0                	add    %edx,%eax
    9726:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    9729:	eb 14                	jmp    973f <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    972b:	c7 44 24 04 80 c0 00 	movl   $0xc080,0x4(%esp)
    9732:	00 
    9733:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    973a:	e8 3c a7 ff ff       	call   3e7b <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    973f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9743:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    9747:	0f 8e eb fd ff ff    	jle    9538 <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    974d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9751:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    9755:	0f 8e d1 fd ff ff    	jle    952c <III_stereo+0xb35>
    975b:	eb 54                	jmp    97b1 <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    975d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9764:	eb 45                	jmp    97ab <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    9766:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    976d:	eb 32                	jmp    97a1 <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    976f:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9772:	8b 55 e8             	mov    -0x18(%ebp),%edx
    9775:	89 d0                	mov    %edx,%eax
    9777:	c1 e0 03             	shl    $0x3,%eax
    977a:	01 d0                	add    %edx,%eax
    977c:	01 c0                	add    %eax,%eax
    977e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9781:	01 d0                	add    %edx,%eax
    9783:	dd 04 c1             	fldl   (%ecx,%eax,8)
    9786:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    9789:	8b 55 e8             	mov    -0x18(%ebp),%edx
    978c:	89 d0                	mov    %edx,%eax
    978e:	c1 e0 03             	shl    $0x3,%eax
    9791:	01 d0                	add    %edx,%eax
    9793:	01 c0                	add    %eax,%eax
    9795:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    9798:	01 d0                	add    %edx,%eax
    979a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    979d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    97a1:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    97a5:	7e c8                	jle    976f <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    97a7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    97ab:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    97af:	7e b5                	jle    9766 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    97b1:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    97b7:	5b                   	pop    %ebx
    97b8:	5e                   	pop    %esi
    97b9:	5d                   	pop    %ebp
    97ba:	c3                   	ret    

000097bb <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    97bb:	55                   	push   %ebp
    97bc:	89 e5                	mov    %esp,%ebp
    97be:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    97c1:	a1 e0 ea 00 00       	mov    0xeae0,%eax
    97c6:	85 c0                	test   %eax,%eax
    97c8:	74 68                	je     9832 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    97ca:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    97d1:	eb 4f                	jmp    9822 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    97d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    97d6:	dd 04 c5 a0 ea 00 00 	fldl   0xeaa0(,%eax,8)
    97dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    97e0:	dd 04 c5 a0 ea 00 00 	fldl   0xeaa0(,%eax,8)
    97e7:	de c9                	fmulp  %st,%st(1)
    97e9:	d9 e8                	fld1   
    97eb:	de c1                	faddp  %st,%st(1)
    97ed:	dd 1c 24             	fstpl  (%esp)
    97f0:	e8 de ac ff ff       	call   44d3 <sqrt>
    97f5:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    97f8:	d9 e8                	fld1   
    97fa:	dc 75 e0             	fdivl  -0x20(%ebp)
    97fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9800:	dd 1c c5 40 eb 00 00 	fstpl  0xeb40(,%eax,8)
         ca[i] = Ci[i]/sq;
    9807:	8b 45 e8             	mov    -0x18(%ebp),%eax
    980a:	dd 04 c5 a0 ea 00 00 	fldl   0xeaa0(,%eax,8)
    9811:	dc 75 e0             	fdivl  -0x20(%ebp)
    9814:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9817:	dd 1c c5 80 eb 00 00 	fstpl  0xeb80(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    981e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9822:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    9826:	7e ab                	jle    97d3 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    9828:	c7 05 e0 ea 00 00 00 	movl   $0x0,0xeae0
    982f:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9832:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9839:	eb 4c                	jmp    9887 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    983b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9842:	eb 39                	jmp    987d <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    9844:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9847:	89 d0                	mov    %edx,%eax
    9849:	c1 e0 03             	shl    $0x3,%eax
    984c:	01 d0                	add    %edx,%eax
    984e:	c1 e0 04             	shl    $0x4,%eax
    9851:	89 c2                	mov    %eax,%edx
    9853:	8b 45 0c             	mov    0xc(%ebp),%eax
    9856:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9859:	8b 55 f0             	mov    -0x10(%ebp),%edx
    985c:	89 d0                	mov    %edx,%eax
    985e:	c1 e0 03             	shl    $0x3,%eax
    9861:	01 d0                	add    %edx,%eax
    9863:	c1 e0 04             	shl    $0x4,%eax
    9866:	89 c2                	mov    %eax,%edx
    9868:	8b 45 08             	mov    0x8(%ebp),%eax
    986b:	01 c2                	add    %eax,%edx
    986d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9870:	dd 04 c2             	fldl   (%edx,%eax,8)
    9873:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9876:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    9879:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    987d:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9881:	7e c1                	jle    9844 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    9883:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9887:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    988b:	7e ae                	jle    983b <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    988d:	8b 45 10             	mov    0x10(%ebp),%eax
    9890:	8b 40 10             	mov    0x10(%eax),%eax
    9893:	85 c0                	test   %eax,%eax
    9895:	74 1a                	je     98b1 <III_antialias+0xf6>
    9897:	8b 45 10             	mov    0x10(%ebp),%eax
    989a:	8b 40 14             	mov    0x14(%eax),%eax
    989d:	83 f8 02             	cmp    $0x2,%eax
    98a0:	75 0f                	jne    98b1 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    98a2:	8b 45 10             	mov    0x10(%ebp),%eax
    98a5:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    98a8:	85 c0                	test   %eax,%eax
    98aa:	75 05                	jne    98b1 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    98ac:	e9 1c 01 00 00       	jmp    99cd <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    98b1:	8b 45 10             	mov    0x10(%ebp),%eax
    98b4:	8b 40 10             	mov    0x10(%eax),%eax
    98b7:	85 c0                	test   %eax,%eax
    98b9:	74 1e                	je     98d9 <III_antialias+0x11e>
    98bb:	8b 45 10             	mov    0x10(%ebp),%eax
    98be:	8b 40 18             	mov    0x18(%eax),%eax
    98c1:	85 c0                	test   %eax,%eax
    98c3:	74 14                	je     98d9 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    98c5:	8b 45 10             	mov    0x10(%ebp),%eax
    98c8:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    98cb:	83 f8 02             	cmp    $0x2,%eax
    98ce:	75 09                	jne    98d9 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    98d0:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    98d7:	eb 07                	jmp    98e0 <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    98d9:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    98e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    98e7:	e9 d5 00 00 00       	jmp    99c1 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    98ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    98f3:	e9 bb 00 00 00       	jmp    99b3 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    98f8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    98fb:	89 d0                	mov    %edx,%eax
    98fd:	c1 e0 03             	shl    $0x3,%eax
    9900:	01 d0                	add    %edx,%eax
    9902:	c1 e0 04             	shl    $0x4,%eax
    9905:	89 c2                	mov    %eax,%edx
    9907:	8b 45 08             	mov    0x8(%ebp),%eax
    990a:	01 c2                	add    %eax,%edx
    990c:	b8 11 00 00 00       	mov    $0x11,%eax
    9911:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9914:	dd 04 c2             	fldl   (%edx,%eax,8)
    9917:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    991a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    991d:	8d 50 01             	lea    0x1(%eax),%edx
    9920:	89 d0                	mov    %edx,%eax
    9922:	c1 e0 03             	shl    $0x3,%eax
    9925:	01 d0                	add    %edx,%eax
    9927:	c1 e0 04             	shl    $0x4,%eax
    992a:	89 c2                	mov    %eax,%edx
    992c:	8b 45 08             	mov    0x8(%ebp),%eax
    992f:	01 c2                	add    %eax,%edx
    9931:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9934:	dd 04 c2             	fldl   (%edx,%eax,8)
    9937:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    993a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    993d:	89 d0                	mov    %edx,%eax
    993f:	c1 e0 03             	shl    $0x3,%eax
    9942:	01 d0                	add    %edx,%eax
    9944:	c1 e0 04             	shl    $0x4,%eax
    9947:	89 c2                	mov    %eax,%edx
    9949:	8b 45 0c             	mov    0xc(%ebp),%eax
    994c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    994f:	b8 11 00 00 00       	mov    $0x11,%eax
    9954:	2b 45 f4             	sub    -0xc(%ebp),%eax
    9957:	8b 55 f4             	mov    -0xc(%ebp),%edx
    995a:	dd 04 d5 40 eb 00 00 	fldl   0xeb40(,%edx,8)
    9961:	dc 4d d8             	fmull  -0x28(%ebp)
    9964:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9967:	dd 04 d5 80 eb 00 00 	fldl   0xeb80(,%edx,8)
    996e:	dc 4d d0             	fmull  -0x30(%ebp)
    9971:	de e9                	fsubrp %st,%st(1)
    9973:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    9976:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9979:	8d 50 01             	lea    0x1(%eax),%edx
    997c:	89 d0                	mov    %edx,%eax
    997e:	c1 e0 03             	shl    $0x3,%eax
    9981:	01 d0                	add    %edx,%eax
    9983:	c1 e0 04             	shl    $0x4,%eax
    9986:	89 c2                	mov    %eax,%edx
    9988:	8b 45 0c             	mov    0xc(%ebp),%eax
    998b:	01 c2                	add    %eax,%edx
    998d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9990:	dd 04 c5 40 eb 00 00 	fldl   0xeb40(,%eax,8)
    9997:	dc 4d d0             	fmull  -0x30(%ebp)
    999a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    999d:	dd 04 c5 80 eb 00 00 	fldl   0xeb80(,%eax,8)
    99a4:	dc 4d d8             	fmull  -0x28(%ebp)
    99a7:	de c1                	faddp  %st,%st(1)
    99a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    99ac:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    99af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    99b3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    99b7:	0f 8e 3b ff ff ff    	jle    98f8 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    99bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    99c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    99c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    99c7:	0f 8c 1f ff ff ff    	jl     98ec <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    99cd:	c9                   	leave  
    99ce:	c3                   	ret    

000099cf <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    99cf:	55                   	push   %ebp
    99d0:	89 e5                	mov    %esp,%ebp
    99d2:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    99d8:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    99dd:	85 c0                	test   %eax,%eax
    99df:	0f 85 59 02 00 00    	jne    9c3e <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    99e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    99ec:	eb 29                	jmp    9a17 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    99ee:	db 45 f4             	fildl  -0xc(%ebp)
    99f1:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    99f7:	de c1                	faddp  %st,%st(1)
    99f9:	dd 05 f8 d0 00 00    	fldl   0xd0f8
    99ff:	de c9                	fmulp  %st,%st(1)
    9a01:	dd 1c 24             	fstpl  (%esp)
    9a04:	e8 53 a8 ff ff       	call   425c <sin>
    9a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a0c:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    9a13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a17:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9a1b:	7e d1                	jle    99ee <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9a1d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9a24:	eb 2c                	jmp    9a52 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    9a26:	db 45 f4             	fildl  -0xc(%ebp)
    9a29:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    9a2f:	de c1                	faddp  %st,%st(1)
    9a31:	dd 05 f8 d0 00 00    	fldl   0xd0f8
    9a37:	de c9                	fmulp  %st,%st(1)
    9a39:	dd 1c 24             	fstpl  (%esp)
    9a3c:	e8 1b a8 ff ff       	call   425c <sin>
    9a41:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a44:	83 c0 24             	add    $0x24,%eax
    9a47:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    9a4e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a52:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9a56:	7e ce                	jle    9a26 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9a58:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9a5f:	eb 13                	jmp    9a74 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    9a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9a64:	83 c0 24             	add    $0x24,%eax
    9a67:	d9 e8                	fld1   
    9a69:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    9a70:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9a74:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    9a78:	7e e7                	jle    9a61 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9a7a:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    9a81:	eb 34                	jmp    9ab7 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    9a83:	db 45 f4             	fildl  -0xc(%ebp)
    9a86:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    9a8c:	de c1                	faddp  %st,%st(1)
    9a8e:	dd 05 00 d1 00 00    	fldl   0xd100
    9a94:	de e9                	fsubrp %st,%st(1)
    9a96:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    9a9c:	de c9                	fmulp  %st,%st(1)
    9a9e:	dd 1c 24             	fstpl  (%esp)
    9aa1:	e8 b6 a7 ff ff       	call   425c <sin>
    9aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9aa9:	83 c0 24             	add    $0x24,%eax
    9aac:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    9ab3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ab7:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    9abb:	7e c6                	jle    9a83 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9abd:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    9ac4:	eb 13                	jmp    9ad9 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    9ac6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9ac9:	83 c0 24             	add    $0x24,%eax
    9acc:	d9 ee                	fldz   
    9ace:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    9ad5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9ad9:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9add:	7e e7                	jle    9ac6 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9adf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9ae6:	eb 13                	jmp    9afb <inv_mdct+0x12c>
         win[3][i] = 0.0;
    9ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9aeb:	83 c0 6c             	add    $0x6c,%eax
    9aee:	d9 ee                	fldz   
    9af0:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    9af7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9afb:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9aff:	7e e7                	jle    9ae8 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9b01:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    9b08:	eb 34                	jmp    9b3e <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    9b0a:	db 45 f4             	fildl  -0xc(%ebp)
    9b0d:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    9b13:	de c1                	faddp  %st,%st(1)
    9b15:	dd 05 08 d1 00 00    	fldl   0xd108
    9b1b:	de e9                	fsubrp %st,%st(1)
    9b1d:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    9b23:	de c9                	fmulp  %st,%st(1)
    9b25:	dd 1c 24             	fstpl  (%esp)
    9b28:	e8 2f a7 ff ff       	call   425c <sin>
    9b2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b30:	83 c0 6c             	add    $0x6c,%eax
    9b33:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    9b3a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b3e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9b42:	7e c6                	jle    9b0a <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9b44:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9b4b:	eb 13                	jmp    9b60 <inv_mdct+0x191>
         win[3][i] =1.0;
    9b4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b50:	83 c0 6c             	add    $0x6c,%eax
    9b53:	d9 e8                	fld1   
    9b55:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    9b5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b60:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    9b64:	7e e7                	jle    9b4d <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9b66:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    9b6d:	eb 2c                	jmp    9b9b <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    9b6f:	db 45 f4             	fildl  -0xc(%ebp)
    9b72:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    9b78:	de c1                	faddp  %st,%st(1)
    9b7a:	dd 05 f8 d0 00 00    	fldl   0xd0f8
    9b80:	de c9                	fmulp  %st,%st(1)
    9b82:	dd 1c 24             	fstpl  (%esp)
    9b85:	e8 d2 a6 ff ff       	call   425c <sin>
    9b8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9b8d:	83 c0 6c             	add    $0x6c,%eax
    9b90:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    9b97:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9b9b:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9b9f:	7e ce                	jle    9b6f <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9ba1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9ba8:	eb 2c                	jmp    9bd6 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    9baa:	db 45 f4             	fildl  -0xc(%ebp)
    9bad:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    9bb3:	de c1                	faddp  %st,%st(1)
    9bb5:	dd 05 e0 d0 00 00    	fldl   0xd0e0
    9bbb:	de c9                	fmulp  %st,%st(1)
    9bbd:	dd 1c 24             	fstpl  (%esp)
    9bc0:	e8 97 a6 ff ff       	call   425c <sin>
    9bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9bc8:	83 c0 48             	add    $0x48,%eax
    9bcb:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    9bd2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9bd6:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    9bda:	7e ce                	jle    9baa <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9bdc:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    9be3:	eb 13                	jmp    9bf8 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    9be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9be8:	83 c0 48             	add    $0x48,%eax
    9beb:	d9 ee                	fldz   
    9bed:	dd 1c c5 e0 eb 00 00 	fstpl  0xebe0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    9bf4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9bf8:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9bfc:	7e e7                	jle    9be5 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9bfe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c05:	eb 21                	jmp    9c28 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    9c07:	db 45 f4             	fildl  -0xc(%ebp)
    9c0a:	dd 05 10 d1 00 00    	fldl   0xd110
    9c10:	de c9                	fmulp  %st,%st(1)
    9c12:	dd 1c 24             	fstpl  (%esp)
    9c15:	e8 e1 a6 ff ff       	call   42fb <cos>
    9c1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c1d:	dd 1c c5 60 f0 00 00 	fstpl  0xf060(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    9c24:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9c28:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    9c2f:	7e d6                	jle    9c07 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    9c31:	a1 c0 eb 00 00       	mov    0xebc0,%eax
    9c36:	83 c0 01             	add    $0x1,%eax
    9c39:	a3 c0 eb 00 00       	mov    %eax,0xebc0
    }

    for(i=0;i<36;i++)
    9c3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c45:	eb 17                	jmp    9c5e <inv_mdct+0x28f>
       out[i]=0;
    9c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9c4a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9c51:	8b 45 0c             	mov    0xc(%ebp),%eax
    9c54:	01 d0                	add    %edx,%eax
    9c56:	d9 ee                	fldz   
    9c58:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    9c5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9c5e:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    9c62:	7e e3                	jle    9c47 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    9c64:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    9c68:	0f 85 85 01 00 00    	jne    9df3 <inv_mdct+0x424>
       N=12;
    9c6e:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    9c75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9c7c:	e9 63 01 00 00       	jmp    9de4 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    9c81:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9c88:	e9 df 00 00 00       	jmp    9d6c <inv_mdct+0x39d>
             sum = 0.0;
    9c8d:	d9 ee                	fldz   
    9c8f:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    9c92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9c99:	e9 8f 00 00 00       	jmp    9d2d <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    9c9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9ca1:	89 d0                	mov    %edx,%eax
    9ca3:	01 c0                	add    %eax,%eax
    9ca5:	01 c2                	add    %eax,%edx
    9ca7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9caa:	01 d0                	add    %edx,%eax
    9cac:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9cb3:	8b 45 08             	mov    0x8(%ebp),%eax
    9cb6:	01 d0                	add    %edx,%eax
    9cb8:	dd 00                	fldl   (%eax)
    9cba:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    9cc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9cc3:	01 c0                	add    %eax,%eax
    9cc5:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    9ccb:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    9cd1:	dd 05 18 d1 00 00    	fldl   0xd118
    9cd7:	de f1                	fdivp  %st,%st(1)
    9cd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9cdc:	01 c0                	add    %eax,%eax
    9cde:	8d 50 01             	lea    0x1(%eax),%edx
    9ce1:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ce4:	89 c1                	mov    %eax,%ecx
    9ce6:	c1 e9 1f             	shr    $0x1f,%ecx
    9ce9:	01 c8                	add    %ecx,%eax
    9ceb:	d1 f8                	sar    %eax
    9ced:	01 d0                	add    %edx,%eax
    9cef:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    9cf5:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    9cfb:	de c9                	fmulp  %st,%st(1)
    9cfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9d00:	01 c0                	add    %eax,%eax
    9d02:	83 c0 01             	add    $0x1,%eax
    9d05:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    9d0b:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    9d11:	de c9                	fmulp  %st,%st(1)
    9d13:	dd 1c 24             	fstpl  (%esp)
    9d16:	e8 e0 a5 ff ff       	call   42fb <cos>
    9d1b:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    9d21:	dd 45 e0             	fldl   -0x20(%ebp)
    9d24:	de c1                	faddp  %st,%st(1)
    9d26:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    9d29:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9d2d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9d30:	89 c2                	mov    %eax,%edx
    9d32:	c1 ea 1f             	shr    $0x1f,%edx
    9d35:	01 d0                	add    %edx,%eax
    9d37:	d1 f8                	sar    %eax
    9d39:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9d3c:	0f 8f 5c ff ff ff    	jg     9c9e <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    9d42:	8b 55 10             	mov    0x10(%ebp),%edx
    9d45:	89 d0                	mov    %edx,%eax
    9d47:	c1 e0 03             	shl    $0x3,%eax
    9d4a:	01 d0                	add    %edx,%eax
    9d4c:	c1 e0 02             	shl    $0x2,%eax
    9d4f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9d52:	01 d0                	add    %edx,%eax
    9d54:	dd 04 c5 e0 eb 00 00 	fldl   0xebe0(,%eax,8)
    9d5b:	dc 4d e0             	fmull  -0x20(%ebp)
    9d5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d61:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    9d68:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9d6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d6f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9d72:	0f 8c 15 ff ff ff    	jl     9c8d <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9d78:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9d7f:	eb 57                	jmp    9dd8 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    9d81:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9d84:	89 d0                	mov    %edx,%eax
    9d86:	01 c0                	add    %eax,%eax
    9d88:	01 d0                	add    %edx,%eax
    9d8a:	01 c0                	add    %eax,%eax
    9d8c:	89 c2                	mov    %eax,%edx
    9d8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9d91:	01 d0                	add    %edx,%eax
    9d93:	83 c0 06             	add    $0x6,%eax
    9d96:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9d9d:	8b 45 0c             	mov    0xc(%ebp),%eax
    9da0:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9da3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    9da6:	89 d0                	mov    %edx,%eax
    9da8:	01 c0                	add    %eax,%eax
    9daa:	01 d0                	add    %edx,%eax
    9dac:	01 c0                	add    %eax,%eax
    9dae:	89 c2                	mov    %eax,%edx
    9db0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9db3:	01 d0                	add    %edx,%eax
    9db5:	83 c0 06             	add    $0x6,%eax
    9db8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9dbf:	8b 45 0c             	mov    0xc(%ebp),%eax
    9dc2:	01 d0                	add    %edx,%eax
    9dc4:	dd 00                	fldl   (%eax)
    9dc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9dc9:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    9dd0:	de c1                	faddp  %st,%st(1)
    9dd2:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    9dd4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9dd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ddb:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9dde:	7c a1                	jl     9d81 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    9de0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9de4:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    9de8:	0f 8e 93 fe ff ff    	jle    9c81 <inv_mdct+0x2b2>
    9dee:	e9 da 00 00 00       	jmp    9ecd <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    9df3:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    9dfa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9e01:	e9 bb 00 00 00       	jmp    9ec1 <inv_mdct+0x4f2>
         sum = 0.0;
    9e06:	d9 ee                	fldz   
    9e08:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    9e0b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9e12:	eb 6a                	jmp    9e7e <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    9e14:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e17:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9e1e:	8b 45 08             	mov    0x8(%ebp),%eax
    9e21:	01 d0                	add    %edx,%eax
    9e23:	dd 00                	fldl   (%eax)
    9e25:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e28:	01 c0                	add    %eax,%eax
    9e2a:	8d 50 01             	lea    0x1(%eax),%edx
    9e2d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9e30:	89 c1                	mov    %eax,%ecx
    9e32:	c1 e9 1f             	shr    $0x1f,%ecx
    9e35:	01 c8                	add    %ecx,%eax
    9e37:	d1 f8                	sar    %eax
    9e39:	01 c2                	add    %eax,%edx
    9e3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9e3e:	01 c0                	add    %eax,%eax
    9e40:	83 c0 01             	add    $0x1,%eax
    9e43:	89 d1                	mov    %edx,%ecx
    9e45:	0f af c8             	imul   %eax,%ecx
    9e48:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e4d:	89 c8                	mov    %ecx,%eax
    9e4f:	f7 ea                	imul   %edx
    9e51:	c1 fa 05             	sar    $0x5,%edx
    9e54:	89 c8                	mov    %ecx,%eax
    9e56:	c1 f8 1f             	sar    $0x1f,%eax
    9e59:	29 c2                	sub    %eax,%edx
    9e5b:	89 d0                	mov    %edx,%eax
    9e5d:	c1 e0 03             	shl    $0x3,%eax
    9e60:	01 d0                	add    %edx,%eax
    9e62:	c1 e0 04             	shl    $0x4,%eax
    9e65:	29 c1                	sub    %eax,%ecx
    9e67:	89 ca                	mov    %ecx,%edx
    9e69:	dd 04 d5 60 f0 00 00 	fldl   0xf060(,%edx,8)
    9e70:	de c9                	fmulp  %st,%st(1)
    9e72:	dd 45 e0             	fldl   -0x20(%ebp)
    9e75:	de c1                	faddp  %st,%st(1)
    9e77:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    9e7a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9e7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9e81:	89 c2                	mov    %eax,%edx
    9e83:	c1 ea 1f             	shr    $0x1f,%edx
    9e86:	01 d0                	add    %edx,%eax
    9e88:	d1 f8                	sar    %eax
    9e8a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    9e8d:	7f 85                	jg     9e14 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    9e8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9e92:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9e99:	8b 45 0c             	mov    0xc(%ebp),%eax
    9e9c:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    9e9f:	8b 55 10             	mov    0x10(%ebp),%edx
    9ea2:	89 d0                	mov    %edx,%eax
    9ea4:	c1 e0 03             	shl    $0x3,%eax
    9ea7:	01 d0                	add    %edx,%eax
    9ea9:	c1 e0 02             	shl    $0x2,%eax
    9eac:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9eaf:	01 d0                	add    %edx,%eax
    9eb1:	dd 04 c5 e0 eb 00 00 	fldl   0xebe0(,%eax,8)
    9eb8:	dc 4d e0             	fmull  -0x20(%ebp)
    9ebb:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    9ebd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9ec1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9ec4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9ec7:	0f 8c 39 ff ff ff    	jl     9e06 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    9ecd:	c9                   	leave  
    9ece:	c3                   	ret    

00009ecf <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    9ecf:	55                   	push   %ebp
    9ed0:	89 e5                	mov    %esp,%ebp
    9ed2:	53                   	push   %ebx
    9ed3:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    9ed9:	a1 e4 ea 00 00       	mov    0xeae4,%eax
    9ede:	85 c0                	test   %eax,%eax
    9ee0:	74 6f                	je     9f51 <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    9ee2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9ee9:	eb 56                	jmp    9f41 <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    9eeb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ef2:	eb 43                	jmp    9f37 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    9ef4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    9efb:	eb 30                	jmp    9f2d <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    9efd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9f00:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    9f03:	89 c2                	mov    %eax,%edx
    9f05:	c1 e2 03             	shl    $0x3,%edx
    9f08:	01 c2                	add    %eax,%edx
    9f0a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9f0d:	89 c2                	mov    %eax,%edx
    9f0f:	89 c8                	mov    %ecx,%eax
    9f11:	c1 e0 03             	shl    $0x3,%eax
    9f14:	01 c8                	add    %ecx,%eax
    9f16:	c1 e0 06             	shl    $0x6,%eax
    9f19:	01 c2                	add    %eax,%edx
    9f1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9f1e:	01 d0                	add    %edx,%eax
    9f20:	d9 ee                	fldz   
    9f22:	dd 1c c5 e0 f4 00 00 	fstpl  0xf4e0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    9f29:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    9f2d:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    9f31:	7e ca                	jle    9efd <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    9f33:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9f37:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    9f3b:	7e b7                	jle    9ef4 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    9f3d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    9f41:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9f45:	7e a4                	jle    9eeb <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    9f47:	c7 05 e4 ea 00 00 00 	movl   $0x0,0xeae4
    9f4e:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9f51:	8b 45 18             	mov    0x18(%ebp),%eax
    9f54:	8b 40 10             	mov    0x10(%eax),%eax
    9f57:	85 c0                	test   %eax,%eax
    9f59:	74 10                	je     9f6b <III_hybrid+0x9c>
    9f5b:	8b 45 18             	mov    0x18(%ebp),%eax
    9f5e:	8b 40 18             	mov    0x18(%eax),%eax
    9f61:	85 c0                	test   %eax,%eax
    9f63:	74 06                	je     9f6b <III_hybrid+0x9c>
    9f65:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    9f69:	7e 08                	jle    9f73 <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    9f6b:	8b 45 18             	mov    0x18(%ebp),%eax
    9f6e:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    9f71:	eb 05                	jmp    9f78 <III_hybrid+0xa9>
    9f73:	b8 00 00 00 00       	mov    $0x0,%eax
    9f78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    9f7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9f7e:	89 44 24 08          	mov    %eax,0x8(%esp)
    9f82:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    9f88:	89 44 24 04          	mov    %eax,0x4(%esp)
    9f8c:	8b 45 08             	mov    0x8(%ebp),%eax
    9f8f:	89 04 24             	mov    %eax,(%esp)
    9f92:	e8 38 fa ff ff       	call   99cf <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    9f97:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f9e:	e9 83 00 00 00       	jmp    a026 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    9fa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fa6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    9fad:	8b 45 0c             	mov    0xc(%ebp),%eax
    9fb0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9fb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fb6:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9fbd:	8b 45 10             	mov    0x10(%ebp),%eax
    9fc0:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9fc3:	89 c2                	mov    %eax,%edx
    9fc5:	c1 e2 03             	shl    $0x3,%edx
    9fc8:	01 c2                	add    %eax,%edx
    9fca:	8d 04 12             	lea    (%edx,%edx,1),%eax
    9fcd:	89 c2                	mov    %eax,%edx
    9fcf:	89 c8                	mov    %ecx,%eax
    9fd1:	c1 e0 03             	shl    $0x3,%eax
    9fd4:	01 c8                	add    %ecx,%eax
    9fd6:	c1 e0 06             	shl    $0x6,%eax
    9fd9:	01 c2                	add    %eax,%edx
    9fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fde:	01 d0                	add    %edx,%eax
    9fe0:	dd 04 c5 e0 f4 00 00 	fldl   0xf4e0(,%eax,8)
    9fe7:	de c1                	faddp  %st,%st(1)
    9fe9:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    9feb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fee:	83 c0 12             	add    $0x12,%eax
    9ff1:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    9ff8:	8b 45 10             	mov    0x10(%ebp),%eax
    9ffb:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9ffe:	89 c2                	mov    %eax,%edx
    a000:	c1 e2 03             	shl    $0x3,%edx
    a003:	01 c2                	add    %eax,%edx
    a005:	8d 04 12             	lea    (%edx,%edx,1),%eax
    a008:	89 c2                	mov    %eax,%edx
    a00a:	89 c8                	mov    %ecx,%eax
    a00c:	c1 e0 03             	shl    $0x3,%eax
    a00f:	01 c8                	add    %ecx,%eax
    a011:	c1 e0 06             	shl    $0x6,%eax
    a014:	01 c2                	add    %eax,%edx
    a016:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a019:	01 d0                	add    %edx,%eax
    a01b:	dd 1c c5 e0 f4 00 00 	fstpl  0xf4e0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    a022:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a026:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a02a:	0f 8e 73 ff ff ff    	jle    9fa3 <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    a030:	81 c4 54 01 00 00    	add    $0x154,%esp
    a036:	5b                   	pop    %ebx
    a037:	5d                   	pop    %ebp
    a038:	c3                   	ret    

0000a039 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    a039:	55                   	push   %ebp
    a03a:	89 e5                	mov    %esp,%ebp
    a03c:	57                   	push   %edi
    a03d:	56                   	push   %esi
    a03e:	53                   	push   %ebx
    a03f:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    a042:	be 00 00 00 00       	mov    $0x0,%esi
    a047:	e9 1c 01 00 00       	jmp    a168 <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    a04c:	bb 00 00 00 00       	mov    $0x0,%ebx
    a051:	e9 06 01 00 00       	jmp    a15c <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    a056:	89 f0                	mov    %esi,%eax
    a058:	c1 e0 08             	shl    $0x8,%eax
    a05b:	89 c2                	mov    %eax,%edx
    a05d:	8b 45 08             	mov    0x8(%ebp),%eax
    a060:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a063:	89 75 e0             	mov    %esi,-0x20(%ebp)
    a066:	db 45 e0             	fildl  -0x20(%ebp)
    a069:	dd 05 20 d1 00 00    	fldl   0xd120
    a06f:	de c9                	fmulp  %st,%st(1)
    a071:	dd 05 28 d1 00 00    	fldl   0xd128
    a077:	de c1                	faddp  %st,%st(1)
    a079:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    a07c:	83 c0 01             	add    $0x1,%eax
    a07f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a082:	db 45 e0             	fildl  -0x20(%ebp)
    a085:	de c9                	fmulp  %st,%st(1)
    a087:	dd 1c 24             	fstpl  (%esp)
    a08a:	e8 6c a2 ff ff       	call   42fb <cos>
    a08f:	dd 05 30 d1 00 00    	fldl   0xd130
    a095:	de c9                	fmulp  %st,%st(1)
    a097:	dd 1c df             	fstpl  (%edi,%ebx,8)
    a09a:	dd 04 df             	fldl   (%edi,%ebx,8)
    a09d:	d9 ee                	fldz   
    a09f:	d9 c9                	fxch   %st(1)
    a0a1:	df e9                	fucomip %st(1),%st
    a0a3:	dd d8                	fstp   %st(0)
    a0a5:	72 47                	jb     a0ee <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    a0a7:	89 f0                	mov    %esi,%eax
    a0a9:	c1 e0 08             	shl    $0x8,%eax
    a0ac:	89 c2                	mov    %eax,%edx
    a0ae:	8b 45 08             	mov    0x8(%ebp),%eax
    a0b1:	01 c2                	add    %eax,%edx
    a0b3:	89 f0                	mov    %esi,%eax
    a0b5:	c1 e0 08             	shl    $0x8,%eax
    a0b8:	89 c1                	mov    %eax,%ecx
    a0ba:	8b 45 08             	mov    0x8(%ebp),%eax
    a0bd:	01 c8                	add    %ecx,%eax
    a0bf:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a0c2:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    a0c8:	de c1                	faddp  %st,%st(1)
    a0ca:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a0cd:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a0d1:	b4 0c                	mov    $0xc,%ah
    a0d3:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a0d7:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a0da:	db 5d e0             	fistpl -0x20(%ebp)
    a0dd:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a0e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a0e3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a0e6:	db 45 e0             	fildl  -0x20(%ebp)
    a0e9:	dd 1c da             	fstpl  (%edx,%ebx,8)
    a0ec:	eb 45                	jmp    a133 <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    a0ee:	89 f0                	mov    %esi,%eax
    a0f0:	c1 e0 08             	shl    $0x8,%eax
    a0f3:	89 c2                	mov    %eax,%edx
    a0f5:	8b 45 08             	mov    0x8(%ebp),%eax
    a0f8:	01 c2                	add    %eax,%edx
    a0fa:	89 f0                	mov    %esi,%eax
    a0fc:	c1 e0 08             	shl    $0x8,%eax
    a0ff:	89 c1                	mov    %eax,%ecx
    a101:	8b 45 08             	mov    0x8(%ebp),%eax
    a104:	01 c8                	add    %ecx,%eax
    a106:	dd 04 d8             	fldl   (%eax,%ebx,8)
    a109:	dd 05 f0 d0 00 00    	fldl   0xd0f0
    a10f:	de e9                	fsubrp %st,%st(1)
    a111:	d9 7d e6             	fnstcw -0x1a(%ebp)
    a114:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    a118:	b4 0c                	mov    $0xc,%ah
    a11a:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    a11e:	d9 6d e4             	fldcw  -0x1c(%ebp)
    a121:	db 5d e0             	fistpl -0x20(%ebp)
    a124:	d9 6d e6             	fldcw  -0x1a(%ebp)
    a127:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a12a:	89 45 e0             	mov    %eax,-0x20(%ebp)
    a12d:	db 45 e0             	fildl  -0x20(%ebp)
    a130:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    a133:	89 f0                	mov    %esi,%eax
    a135:	c1 e0 08             	shl    $0x8,%eax
    a138:	89 c2                	mov    %eax,%edx
    a13a:	8b 45 08             	mov    0x8(%ebp),%eax
    a13d:	01 d0                	add    %edx,%eax
    a13f:	89 f2                	mov    %esi,%edx
    a141:	89 d1                	mov    %edx,%ecx
    a143:	c1 e1 08             	shl    $0x8,%ecx
    a146:	8b 55 08             	mov    0x8(%ebp),%edx
    a149:	01 ca                	add    %ecx,%edx
    a14b:	dd 04 da             	fldl   (%edx,%ebx,8)
    a14e:	dd 05 38 d1 00 00    	fldl   0xd138
    a154:	de c9                	fmulp  %st,%st(1)
    a156:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    a159:	83 c3 01             	add    $0x1,%ebx
    a15c:	83 fb 1f             	cmp    $0x1f,%ebx
    a15f:	0f 8e f1 fe ff ff    	jle    a056 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    a165:	83 c6 01             	add    $0x1,%esi
    a168:	83 fe 3f             	cmp    $0x3f,%esi
    a16b:	0f 8e db fe ff ff    	jle    a04c <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    a171:	83 c4 1c             	add    $0x1c,%esp
    a174:	5b                   	pop    %ebx
    a175:	5e                   	pop    %esi
    a176:	5f                   	pop    %edi
    a177:	5d                   	pop    %ebp
    a178:	c3                   	ret    

0000a179 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    a179:	55                   	push   %ebp
    a17a:	89 e5                	mov    %esp,%ebp
    a17c:	57                   	push   %edi
    a17d:	56                   	push   %esi
    a17e:	53                   	push   %ebx
    a17f:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    a185:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    a18b:	bb a0 c0 00 00       	mov    $0xc0a0,%ebx
    a190:	b8 00 04 00 00       	mov    $0x400,%eax
    a195:	89 d7                	mov    %edx,%edi
    a197:	89 de                	mov    %ebx,%esi
    a199:	89 c1                	mov    %eax,%ecx
    a19b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    a19d:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    a1a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    a1a6:	81 c4 14 10 00 00    	add    $0x1014,%esp
    a1ac:	5b                   	pop    %ebx
    a1ad:	5e                   	pop    %esi
    a1ae:	5f                   	pop    %edi
    a1af:	5d                   	pop    %ebp
    a1b0:	c3                   	ret    

0000a1b1 <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    a1b1:	55                   	push   %ebp
    a1b2:	89 e5                	mov    %esp,%ebp
    a1b4:	57                   	push   %edi
    a1b5:	56                   	push   %esi
    a1b6:	53                   	push   %ebx
    a1b7:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    a1ba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    a1c1:	a1 e8 ea 00 00       	mov    0xeae8,%eax
    a1c6:	85 c0                	test   %eax,%eax
    a1c8:	74 6f                	je     a239 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    a1ca:	c7 44 24 04 a0 d0 00 	movl   $0xd0a0,0x4(%esp)
    a1d1:	00 
    a1d2:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    a1d9:	e8 15 a8 ff ff       	call   49f3 <mem_alloc>
    a1de:	a3 e0 18 01 00       	mov    %eax,0x118e0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    a1e3:	c7 44 24 04 a3 d0 00 	movl   $0xd0a3,0x4(%esp)
    a1ea:	00 
    a1eb:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    a1f2:	e8 fc a7 ff ff       	call   49f3 <mem_alloc>
    a1f7:	a3 e4 18 01 00       	mov    %eax,0x118e4
		create_syn_filter(*filter);
    a1fc:	a1 e4 18 01 00       	mov    0x118e4,%eax
    a201:	89 04 24             	mov    %eax,(%esp)
    a204:	e8 30 fe ff ff       	call   a039 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    a209:	c7 44 24 04 a6 d0 00 	movl   $0xd0a6,0x4(%esp)
    a210:	00 
    a211:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    a218:	e8 d6 a7 ff ff       	call   49f3 <mem_alloc>
    a21d:	a3 e8 18 01 00       	mov    %eax,0x118e8
		read_syn_window(window);
    a222:	a1 e8 18 01 00       	mov    0x118e8,%eax
    a227:	89 04 24             	mov    %eax,(%esp)
    a22a:	e8 4a ff ff ff       	call   a179 <read_syn_window>
		init = 0;
    a22f:	c7 05 e8 ea 00 00 00 	movl   $0x0,0xeae8
    a236:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    a239:	8b 45 0c             	mov    0xc(%ebp),%eax
    a23c:	8b 04 85 ec ea 00 00 	mov    0xeaec(,%eax,4),%eax
    a243:	83 e8 40             	sub    $0x40,%eax
    a246:	25 ff 03 00 00       	and    $0x3ff,%eax
    a24b:	89 c2                	mov    %eax,%edx
    a24d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a250:	89 14 85 ec ea 00 00 	mov    %edx,0xeaec(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    a257:	8b 15 e0 18 01 00    	mov    0x118e0,%edx
    a25d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a260:	8b 04 85 ec ea 00 00 	mov    0xeaec(,%eax,4),%eax
    a267:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    a26a:	c1 e1 0a             	shl    $0xa,%ecx
    a26d:	01 c8                	add    %ecx,%eax
    a26f:	c1 e0 03             	shl    $0x3,%eax
    a272:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    a275:	bb 00 00 00 00       	mov    $0x0,%ebx
    a27a:	eb 40                	jmp    a2bc <SubBandSynthesis+0x10b>
		sum = 0;
    a27c:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    a27e:	be 00 00 00 00       	mov    $0x0,%esi
    a283:	eb 26                	jmp    a2ab <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    a285:	89 f0                	mov    %esi,%eax
    a287:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    a28e:	8b 45 08             	mov    0x8(%ebp),%eax
    a291:	01 d0                	add    %edx,%eax
    a293:	dd 00                	fldl   (%eax)
    a295:	a1 e4 18 01 00       	mov    0x118e4,%eax
    a29a:	89 da                	mov    %ebx,%edx
    a29c:	c1 e2 05             	shl    $0x5,%edx
    a29f:	01 f2                	add    %esi,%edx
    a2a1:	dd 04 d0             	fldl   (%eax,%edx,8)
    a2a4:	de c9                	fmulp  %st,%st(1)
    a2a6:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    a2a8:	83 c6 01             	add    $0x1,%esi
    a2ab:	83 fe 1f             	cmp    $0x1f,%esi
    a2ae:	7e d5                	jle    a285 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    a2b0:	89 d8                	mov    %ebx,%eax
    a2b2:	c1 e0 03             	shl    $0x3,%eax
    a2b5:	01 f8                	add    %edi,%eax
    a2b7:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    a2b9:	83 c3 01             	add    $0x1,%ebx
    a2bc:	83 fb 3f             	cmp    $0x3f,%ebx
    a2bf:	7e bb                	jle    a27c <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a2c1:	bf 00 00 00 00       	mov    $0x0,%edi
    a2c6:	e9 c7 00 00 00       	jmp    a392 <SubBandSynthesis+0x1e1>
		sum = 0;
    a2cb:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    a2cd:	bb 00 00 00 00       	mov    $0x0,%ebx
    a2d2:	eb 4c                	jmp    a320 <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    a2d4:	89 d8                	mov    %ebx,%eax
    a2d6:	c1 e0 05             	shl    $0x5,%eax
    a2d9:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a2dc:	a1 e8 18 01 00       	mov    0x118e8,%eax
    a2e1:	89 f2                	mov    %esi,%edx
    a2e3:	c1 e2 03             	shl    $0x3,%edx
    a2e6:	01 d0                	add    %edx,%eax
    a2e8:	dd 00                	fldl   (%eax)
    a2ea:	a1 e0 18 01 00       	mov    0x118e0,%eax
    a2ef:	8d 53 01             	lea    0x1(%ebx),%edx
    a2f2:	d1 fa                	sar    %edx
    a2f4:	c1 e2 06             	shl    $0x6,%edx
    a2f7:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    a2fa:	8b 55 0c             	mov    0xc(%ebp),%edx
    a2fd:	8b 14 95 ec ea 00 00 	mov    0xeaec(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a304:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    a306:	89 d1                	mov    %edx,%ecx
    a308:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    a30e:	8b 55 0c             	mov    0xc(%ebp),%edx
    a311:	c1 e2 0a             	shl    $0xa,%edx
    a314:	01 ca                	add    %ecx,%edx
    a316:	dd 04 d0             	fldl   (%eax,%edx,8)
    a319:	de c9                	fmulp  %st,%st(1)
    a31b:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    a31d:	83 c3 01             	add    $0x1,%ebx
    a320:	83 fb 0f             	cmp    $0xf,%ebx
    a323:	7e af                	jle    a2d4 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    a325:	dd 05 40 d1 00 00    	fldl   0xd140
    a32b:	de c9                	fmulp  %st,%st(1)
    a32d:	d9 7d d6             	fnstcw -0x2a(%ebp)
    a330:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    a334:	b4 0c                	mov    $0xc,%ah
    a336:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    a33a:	d9 6d d4             	fldcw  -0x2c(%ebp)
    a33d:	db 5d e0             	fistpl -0x20(%ebp)
    a340:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    a343:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    a34a:	7e 15                	jle    a361 <SubBandSynthesis+0x1b0>
    a34c:	89 f8                	mov    %edi,%eax
    a34e:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a351:	8b 45 10             	mov    0x10(%ebp),%eax
    a354:	01 d0                	add    %edx,%eax
    a356:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    a35b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a35f:	eb 2e                	jmp    a38f <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    a361:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    a368:	7d 15                	jge    a37f <SubBandSynthesis+0x1ce>
    a36a:	89 f8                	mov    %edi,%eax
    a36c:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a36f:	8b 45 10             	mov    0x10(%ebp),%eax
    a372:	01 d0                	add    %edx,%eax
    a374:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    a379:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    a37d:	eb 10                	jmp    a38f <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    a37f:	89 f8                	mov    %edi,%eax
    a381:	8d 14 00             	lea    (%eax,%eax,1),%edx
    a384:	8b 45 10             	mov    0x10(%ebp),%eax
    a387:	01 c2                	add    %eax,%edx
    a389:	8b 45 e0             	mov    -0x20(%ebp),%eax
    a38c:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    a38f:	83 c7 01             	add    $0x1,%edi
    a392:	83 ff 1f             	cmp    $0x1f,%edi
    a395:	0f 8e 30 ff ff ff    	jle    a2cb <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    a39b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    a39e:	83 c4 2c             	add    $0x2c,%esp
    a3a1:	5b                   	pop    %ebx
    a3a2:	5e                   	pop    %esi
    a3a3:	5f                   	pop    %edi
    a3a4:	5d                   	pop    %ebp
    a3a5:	c3                   	ret    

0000a3a6 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    a3a6:	55                   	push   %ebp
    a3a7:	89 e5                	mov    %esp,%ebp
    a3a9:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    a3ac:	8b 45 10             	mov    0x10(%ebp),%eax
    a3af:	8b 40 08             	mov    0x8(%eax),%eax
    a3b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    a3bc:	eb 75                	jmp    a433 <out_fifo+0x8d>
    a3be:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    a3c5:	eb 62                	jmp    a429 <out_fifo+0x83>
            (*psampFrames)++;
    a3c7:	8b 45 14             	mov    0x14(%ebp),%eax
    a3ca:	8b 00                	mov    (%eax),%eax
    a3cc:	8d 50 01             	lea    0x1(%eax),%edx
    a3cf:	8b 45 14             	mov    0x14(%ebp),%eax
    a3d2:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    a3d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    a3db:	eb 40                	jmp    a41d <out_fifo+0x77>
                if (!(k%1600) && k) {
    a3dd:	8b 0d ec 18 01 00    	mov    0x118ec,%ecx
    a3e3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    a3e8:	89 c8                	mov    %ecx,%eax
    a3ea:	f7 ea                	imul   %edx
    a3ec:	c1 fa 09             	sar    $0x9,%edx
    a3ef:	89 c8                	mov    %ecx,%eax
    a3f1:	c1 f8 1f             	sar    $0x1f,%eax
    a3f4:	29 c2                	sub    %eax,%edx
    a3f6:	89 d0                	mov    %edx,%eax
    a3f8:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    a3fe:	29 c1                	sub    %eax,%ecx
    a400:	89 c8                	mov    %ecx,%eax
    a402:	85 c0                	test   %eax,%eax
    a404:	75 13                	jne    a419 <out_fifo+0x73>
    a406:	a1 ec 18 01 00       	mov    0x118ec,%eax
    a40b:	85 c0                	test   %eax,%eax
    a40d:	74 0a                	je     a419 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    a40f:	c7 05 ec 18 01 00 00 	movl   $0x0,0x118ec
    a416:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    a419:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a41d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a420:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    a423:	7c b8                	jl     a3dd <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    a425:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    a429:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    a42d:	7e 98                	jle    a3c7 <out_fifo+0x21>
    a42f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    a433:	8b 45 fc             	mov    -0x4(%ebp),%eax
    a436:	3b 45 0c             	cmp    0xc(%ebp),%eax
    a439:	7c 83                	jl     a3be <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    a43b:	c9                   	leave  
    a43c:	c3                   	ret    

0000a43d <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    a43d:	55                   	push   %ebp
    a43e:	89 e5                	mov    %esp,%ebp
    a440:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    a443:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    a44a:	00 
    a44b:	8b 45 08             	mov    0x8(%ebp),%eax
    a44e:	89 04 24             	mov    %eax,(%esp)
    a451:	e8 8b a8 ff ff       	call   4ce1 <getbits>
    a456:	8b 55 0c             	mov    0xc(%ebp),%edx
    a459:	89 02                	mov    %eax,(%edx)
}
    a45b:	c9                   	leave  
    a45c:	c3                   	ret    

0000a45d <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    a45d:	55                   	push   %ebp
    a45e:	89 e5                	mov    %esp,%ebp
    a460:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a463:	8b 45 08             	mov    0x8(%ebp),%eax
    a466:	8b 40 0c             	mov    0xc(%eax),%eax
    a469:	83 c0 1e             	add    $0x1e,%eax
    a46c:	8b 14 85 40 e6 00 00 	mov    0xe640(,%eax,4),%edx
    a473:	89 d0                	mov    %edx,%eax
    a475:	c1 e0 03             	shl    $0x3,%eax
    a478:	01 d0                	add    %edx,%eax
    a47a:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    a47d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    a480:	db 45 ec             	fildl  -0x14(%ebp)
    a483:	8b 45 08             	mov    0x8(%ebp),%eax
    a486:	8b 40 10             	mov    0x10(%eax),%eax
    a489:	dd 04 c5 00 e7 00 00 	fldl   0xe700(,%eax,8)
    a490:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    a492:	d9 7d ea             	fnstcw -0x16(%ebp)
    a495:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    a499:	b4 0c                	mov    $0xc,%ah
    a49b:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    a49f:	d9 6d e8             	fldcw  -0x18(%ebp)
    a4a2:	db 5d fc             	fistpl -0x4(%ebp)
    a4a5:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    a4a8:	8b 45 08             	mov    0x8(%ebp),%eax
    a4ab:	8b 40 14             	mov    0x14(%eax),%eax
    a4ae:	85 c0                	test   %eax,%eax
    a4b0:	74 04                	je     a4b6 <main_data_slots+0x59>
    a4b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    a4b6:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    a4ba:	8b 45 08             	mov    0x8(%ebp),%eax
    a4bd:	8b 40 08             	mov    0x8(%eax),%eax
    a4c0:	85 c0                	test   %eax,%eax
    a4c2:	74 04                	je     a4c8 <main_data_slots+0x6b>
		nSlots -= 2;
    a4c4:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    a4c8:	8b 45 10             	mov    0x10(%ebp),%eax
    a4cb:	83 f8 01             	cmp    $0x1,%eax
    a4ce:	75 06                	jne    a4d6 <main_data_slots+0x79>
		nSlots -= 17;
    a4d0:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    a4d4:	eb 04                	jmp    a4da <main_data_slots+0x7d>
	else
		nSlots -=32;
    a4d6:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    a4da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    a4dd:	c9                   	leave  
    a4de:	c3                   	ret    
