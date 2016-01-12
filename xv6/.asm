
_finder：     文件格式 elf32-i386


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
       e:	e8 4b 41 00 00       	call   415e <malloc>
      13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
      16:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
      1d:	e8 3c 41 00 00       	call   415e <malloc>
      22:	8b 55 f4             	mov    -0xc(%ebp),%edx
      25:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
      28:	8b 45 f4             	mov    -0xc(%ebp),%eax
      2b:	8b 40 14             	mov    0x14(%eax),%eax
      2e:	8b 55 1c             	mov    0x1c(%ebp),%edx
      31:	89 54 24 04          	mov    %edx,0x4(%esp)
      35:	89 04 24             	mov    %eax,(%esp)
      38:	e8 0a 3a 00 00       	call   3a47 <strcpy>
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
      5d:	8b 15 04 d7 00 00    	mov    0xd704,%edx
      63:	8b 5d f4             	mov    -0xc(%ebp),%ebx
      66:	8d 45 d8             	lea    -0x28(%ebp),%eax
      69:	89 54 24 10          	mov    %edx,0x10(%esp)
      6d:	8b 15 80 11 01 00    	mov    0x11180,%edx
      73:	89 54 24 04          	mov    %edx,0x4(%esp)
      77:	8b 15 84 11 01 00    	mov    0x11184,%edx
      7d:	89 54 24 08          	mov    %edx,0x8(%esp)
      81:	8b 15 88 11 01 00    	mov    0x11188,%edx
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
      ae:	8b 15 00 d7 00 00    	mov    0xd700,%edx
      b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      b7:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
      ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
      bd:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
      c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
      c7:	a3 00 d7 00 00       	mov    %eax,0xd700
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
      d7:	a1 00 d7 00 00       	mov    0xd700,%eax
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
      f9:	e8 27 3f 00 00       	call   4025 <free>
		free(temp);
      fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     101:	89 04 24             	mov    %eax,(%esp)
     104:	e8 1c 3f 00 00       	call   4025 <free>
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
     10f:	c7 05 00 d7 00 00 00 	movl   $0x0,0xd700
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
     127:	e8 8a 39 00 00       	call   3ab6 <strlen>
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
     1bb:	c7 05 04 d7 00 00 00 	movl   $0x0,0xd704
     1c2:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     1c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1cc:	00 
     1cd:	8b 45 08             	mov    0x8(%ebp),%eax
     1d0:	89 04 24             	mov    %eax,(%esp)
     1d3:	e8 f2 3a 00 00       	call   3cca <open>
     1d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     1db:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     1df:	79 20                	jns    201 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     1e1:	8b 45 08             	mov    0x8(%ebp),%eax
     1e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     1e8:	c7 44 24 04 e8 89 00 	movl   $0x89e8,0x4(%esp)
     1ef:	00 
     1f0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1f7:	e8 76 3c 00 00       	call   3e72 <printf>
		return;
     1fc:	e9 8f 02 00 00       	jmp    490 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     201:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     207:	89 44 24 04          	mov    %eax,0x4(%esp)
     20b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     20e:	89 04 24             	mov    %eax,(%esp)
     211:	e8 cc 3a 00 00       	call   3ce2 <fstat>
     216:	85 c0                	test   %eax,%eax
     218:	79 2b                	jns    245 <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     21a:	8b 45 08             	mov    0x8(%ebp),%eax
     21d:	89 44 24 08          	mov    %eax,0x8(%esp)
     221:	c7 44 24 04 fc 89 00 	movl   $0x89fc,0x4(%esp)
     228:	00 
     229:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     230:	e8 3d 3c 00 00       	call   3e72 <printf>
		close(fd);
     235:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     238:	89 04 24             	mov    %eax,(%esp)
     23b:	e8 72 3a 00 00       	call   3cb2 <close>
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
     28c:	c7 44 24 04 10 8a 00 	movl   $0x8a10,0x4(%esp)
     293:	00 
     294:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     29b:	e8 d2 3b 00 00       	call   3e72 <printf>
		break;
     2a0:	e9 e0 01 00 00       	jmp    485 <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     2a5:	8b 45 08             	mov    0x8(%ebp),%eax
     2a8:	89 04 24             	mov    %eax,(%esp)
     2ab:	e8 06 38 00 00       	call   3ab6 <strlen>
     2b0:	83 c0 10             	add    $0x10,%eax
     2b3:	3d 00 02 00 00       	cmp    $0x200,%eax
     2b8:	76 19                	jbe    2d3 <list+0x124>
			printf(1, "ls: path too long\n");
     2ba:	c7 44 24 04 1d 8a 00 	movl   $0x8a1d,0x4(%esp)
     2c1:	00 
     2c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2c9:	e8 a4 3b 00 00       	call   3e72 <printf>
			break;
     2ce:	e9 b2 01 00 00       	jmp    485 <list+0x2d6>
		}
		strcpy(buf, path);
     2d3:	8b 45 08             	mov    0x8(%ebp),%eax
     2d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     2da:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2e0:	89 04 24             	mov    %eax,(%esp)
     2e3:	e8 5f 37 00 00       	call   3a47 <strcpy>
		p = buf + strlen(buf);
     2e8:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 c0 37 00 00       	call   3ab6 <strlen>
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
     33e:	e8 02 39 00 00       	call   3c45 <memmove>
			p[DIRSIZ] = 0;
     343:	8b 45 e0             	mov    -0x20(%ebp),%eax
     346:	83 c0 0e             	add    $0xe,%eax
     349:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     34c:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     352:	89 44 24 04          	mov    %eax,0x4(%esp)
     356:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 46 38 00 00       	call   3baa <stat>
     364:	85 c0                	test   %eax,%eax
     366:	79 23                	jns    38b <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     368:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     36e:	89 44 24 08          	mov    %eax,0x8(%esp)
     372:	c7 44 24 04 fc 89 00 	movl   $0x89fc,0x4(%esp)
     379:	00 
     37a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     381:	e8 ec 3a 00 00       	call   3e72 <printf>
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
     3b7:	8b 15 04 d7 00 00    	mov    0xd704,%edx
     3bd:	8d 45 d0             	lea    -0x30(%ebp),%eax
     3c0:	89 54 24 10          	mov    %edx,0x10(%esp)
     3c4:	8b 15 80 11 01 00    	mov    0x11180,%edx
     3ca:	89 54 24 04          	mov    %edx,0x4(%esp)
     3ce:	8b 15 84 11 01 00    	mov    0x11184,%edx
     3d4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3d8:	8b 15 88 11 01 00    	mov    0x11188,%edx
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
     451:	a1 04 d7 00 00       	mov    0xd704,%eax
     456:	83 c0 01             	add    $0x1,%eax
     459:	a3 04 d7 00 00       	mov    %eax,0xd704
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
     476:	e8 27 38 00 00       	call   3ca2 <read>
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
     48b:	e8 22 38 00 00       	call   3cb2 <close>
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
     4f1:	e8 fe 19 00 00       	call   1ef4 <fill_rect>
	}
	if (style == ICON_STYLE) {
     4f6:	a1 64 a3 00 00       	mov    0xa364,%eax
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
     52b:	a1 a8 a3 00 00       	mov    0xa3a8,%eax
     530:	89 44 24 0c          	mov    %eax,0xc(%esp)
     534:	a1 ac a3 00 00       	mov    0xa3ac,%eax
     539:	89 44 24 10          	mov    %eax,0x10(%esp)
     53d:	a1 b0 a3 00 00       	mov    0xa3b0,%eax
     542:	89 44 24 14          	mov    %eax,0x14(%esp)
     546:	8b 45 08             	mov    0x8(%ebp),%eax
     549:	89 04 24             	mov    %eax,(%esp)
     54c:	8b 45 0c             	mov    0xc(%ebp),%eax
     54f:	89 44 24 04          	mov    %eax,0x4(%esp)
     553:	8b 45 10             	mov    0x10(%ebp),%eax
     556:	89 44 24 08          	mov    %eax,0x8(%esp)
     55a:	e8 34 20 00 00       	call   2593 <draw_picture>
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
     575:	a1 10 a4 00 00       	mov    0xa410,%eax
     57a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     57e:	a1 14 a4 00 00       	mov    0xa414,%eax
     583:	89 44 24 10          	mov    %eax,0x10(%esp)
     587:	a1 18 a4 00 00       	mov    0xa418,%eax
     58c:	89 44 24 14          	mov    %eax,0x14(%esp)
     590:	8b 45 08             	mov    0x8(%ebp),%eax
     593:	89 04 24             	mov    %eax,(%esp)
     596:	8b 45 0c             	mov    0xc(%ebp),%eax
     599:	89 44 24 04          	mov    %eax,0x4(%esp)
     59d:	8b 45 10             	mov    0x10(%ebp),%eax
     5a0:	89 44 24 08          	mov    %eax,0x8(%esp)
     5a4:	e8 ea 1f 00 00       	call   2593 <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     5a9:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     5aa:	8b 45 14             	mov    0x14(%ebp),%eax
     5ad:	89 04 24             	mov    %eax,(%esp)
     5b0:	e8 01 35 00 00       	call   3ab6 <strlen>
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
     60d:	e8 c1 1e 00 00       	call   24d3 <puts_str>
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
     642:	a1 dc a3 00 00       	mov    0xa3dc,%eax
     647:	89 44 24 0c          	mov    %eax,0xc(%esp)
     64b:	a1 e0 a3 00 00       	mov    0xa3e0,%eax
     650:	89 44 24 10          	mov    %eax,0x10(%esp)
     654:	a1 e4 a3 00 00       	mov    0xa3e4,%eax
     659:	89 44 24 14          	mov    %eax,0x14(%esp)
     65d:	8b 45 08             	mov    0x8(%ebp),%eax
     660:	89 04 24             	mov    %eax,(%esp)
     663:	8b 45 0c             	mov    0xc(%ebp),%eax
     666:	89 44 24 04          	mov    %eax,0x4(%esp)
     66a:	8b 45 10             	mov    0x10(%ebp),%eax
     66d:	89 44 24 08          	mov    %eax,0x8(%esp)
     671:	e8 1d 1f 00 00       	call   2593 <draw_picture>
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
     6be:	e8 10 1e 00 00       	call   24d3 <puts_str>
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
     6d9:	a1 44 a4 00 00       	mov    0xa444,%eax
     6de:	89 44 24 0c          	mov    %eax,0xc(%esp)
     6e2:	a1 48 a4 00 00       	mov    0xa448,%eax
     6e7:	89 44 24 10          	mov    %eax,0x10(%esp)
     6eb:	a1 4c a4 00 00       	mov    0xa44c,%eax
     6f0:	89 44 24 14          	mov    %eax,0x14(%esp)
     6f4:	8b 45 08             	mov    0x8(%ebp),%eax
     6f7:	89 04 24             	mov    %eax,(%esp)
     6fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     6fd:	89 44 24 04          	mov    %eax,0x4(%esp)
     701:	8b 45 10             	mov    0x10(%ebp),%eax
     704:	89 44 24 08          	mov    %eax,0x8(%esp)
     708:	e8 86 1e 00 00       	call   2593 <draw_picture>
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
     745:	e8 89 1d 00 00       	call   24d3 <puts_str>
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
     75e:	e8 fb 39 00 00       	call   415e <malloc>
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
     8f3:	e8 fc 15 00 00       	call   1ef4 <fill_rect>

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
     936:	e8 2e 1d 00 00       	call   2669 <draw_line>
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
     97d:	e8 e7 1c 00 00       	call   2669 <draw_line>
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
     9c4:	e8 a0 1c 00 00       	call   2669 <draw_line>
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
     a07:	e8 5d 1c 00 00       	call   2669 <draw_line>
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
     a4a:	e8 a5 14 00 00       	call   1ef4 <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, "Finder", 0, WINDOW_WIDTH / 2, 3);
     a4f:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     a56:	00 
     a57:	c7 44 24 14 2c 01 00 	movl   $0x12c,0x14(%esp)
     a5e:	00 
     a5f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     a66:	00 
     a67:	c7 44 24 0c 30 8a 00 	movl   $0x8a30,0xc(%esp)
     a6e:	00 
     a6f:	8b 45 08             	mov    0x8(%ebp),%eax
     a72:	89 04 24             	mov    %eax,(%esp)
     a75:	8b 45 0c             	mov    0xc(%ebp),%eax
     a78:	89 44 24 04          	mov    %eax,0x4(%esp)
     a7c:	8b 45 10             	mov    0x10(%ebp),%eax
     a7f:	89 44 24 08          	mov    %eax,0x8(%esp)
     a83:	e8 4b 1a 00 00       	call   24d3 <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     a88:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
     a8f:	00 
     a90:	c7 44 24 0c 60 a4 00 	movl   $0xa460,0xc(%esp)
     a97:	00 
     a98:	8b 45 08             	mov    0x8(%ebp),%eax
     a9b:	89 04 24             	mov    %eax,(%esp)
     a9e:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa5:	8b 45 10             	mov    0x10(%ebp),%eax
     aa8:	89 44 24 08          	mov    %eax,0x8(%esp)
     aac:	e8 93 1f 00 00       	call   2a44 <draw_iconlist>


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
     ac0:	a1 64 a3 00 00       	mov    0xa364,%eax
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
     b11:	e8 de 13 00 00       	call   1ef4 <fill_rect>
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
     b58:	e8 0c 1b 00 00       	call   2669 <draw_line>
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);

	//printf(0, "listing complete!\n");
	//printItemList();
	p = fileItemList;
     b5d:	a1 00 d7 00 00       	mov    0xd700,%eax
     b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
	itemCounter = 0;
     b65:	c7 05 04 d7 00 00 00 	movl   $0x0,0xd704
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
     bf1:	a1 64 a3 00 00       	mov    0xa364,%eax
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
     c3b:	e8 b4 12 00 00       	call   1ef4 <fill_rect>
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
     c7c:	e8 73 12 00 00       	call   1ef4 <fill_rect>
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
     cc1:	e8 2e 12 00 00       	call   1ef4 <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cc6:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     ccd:	00 
     cce:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
     cd5:	00 
     cd6:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cdd:	00 
     cde:	c7 44 24 0c 37 8a 00 	movl   $0x8a37,0xc(%esp)
     ce5:	00 
     ce6:	8b 45 08             	mov    0x8(%ebp),%eax
     ce9:	89 04 24             	mov    %eax,(%esp)
     cec:	8b 45 0c             	mov    0xc(%ebp),%eax
     cef:	89 44 24 04          	mov    %eax,0x4(%esp)
     cf3:	8b 45 10             	mov    0x10(%ebp),%eax
     cf6:	89 44 24 08          	mov    %eax,0x8(%esp)
     cfa:	e8 d4 17 00 00       	call   24d3 <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
     cff:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
     d06:	00 
     d07:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
     d0e:	00 
     d0f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     d16:	00 
     d17:	c7 44 24 0c 3c 8a 00 	movl   $0x8a3c,0xc(%esp)
     d1e:	00 
     d1f:	8b 45 08             	mov    0x8(%ebp),%eax
     d22:	89 04 24             	mov    %eax,(%esp)
     d25:	8b 45 0c             	mov    0xc(%ebp),%eax
     d28:	89 44 24 04          	mov    %eax,0x4(%esp)
     d2c:	8b 45 10             	mov    0x10(%ebp),%eax
     d2f:	89 44 24 08          	mov    %eax,0x8(%esp)
     d33:	e8 9b 17 00 00       	call   24d3 <puts_str>
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
     d4f:	e8 0a 34 00 00       	call   415e <malloc>
     d54:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
     d57:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
     d5e:	e8 fb 33 00 00       	call   415e <malloc>
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
     e10:	e8 10 32 00 00       	call   4025 <free>
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
     e24:	a1 00 d7 00 00       	mov    0xd700,%eax
     e29:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     e2c:	eb 27                	jmp    e55 <printItemList+0x37>
		printf(0, "%s\n", p->name);
     e2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e31:	8b 40 14             	mov    0x14(%eax),%eax
     e34:	89 44 24 08          	mov    %eax,0x8(%esp)
     e38:	c7 44 24 04 41 8a 00 	movl   $0x8a41,0x4(%esp)
     e3f:	00 
     e40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e47:	e8 26 30 00 00       	call   3e72 <printf>
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
     e63:	a1 64 a3 00 00       	mov    0xa364,%eax
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
     edb:	e8 5e 24 00 00       	call   333e <initRect>
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
     f13:	e8 26 24 00 00       	call   333e <initRect>
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
     f6d:	e8 b8 24 00 00       	call   342a <createClickable>
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
     fa9:	e8 7c 24 00 00       	call   342a <createClickable>
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
     fe0:	e8 45 24 00 00       	call   342a <createClickable>
		break;
     fe5:	eb 14                	jmp    ffb <addItemEvent+0xd9>
	default:
		printf(0, "unknown file type!");
     fe7:	c7 44 24 04 45 8a 00 	movl   $0x8a45,0x4(%esp)
     fee:	00 
     fef:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ff6:	e8 77 2e 00 00       	call   3e72 <printf>
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
    1003:	a1 00 d7 00 00       	mov    0xd700,%eax
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
    10a4:	8b 1c 85 00 a6 00 00 	mov    0xa600(,%eax,4),%ebx
    10ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ae:	6b c0 34             	imul   $0x34,%eax,%eax
    10b1:	05 80 a4 00 00       	add    $0xa480,%eax
    10b6:	8b 78 10             	mov    0x10(%eax),%edi
    10b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10bc:	6b c0 34             	imul   $0x34,%eax,%eax
    10bf:	05 80 a4 00 00       	add    $0xa480,%eax
    10c4:	8b 70 0c             	mov    0xc(%eax),%esi
    10c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10ca:	6b c0 34             	imul   $0x34,%eax,%eax
    10cd:	05 80 a4 00 00       	add    $0xa480,%eax
    10d2:	8b 48 04             	mov    0x4(%eax),%ecx
    10d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10d8:	6b c0 34             	imul   $0x34,%eax,%eax
    10db:	05 80 a4 00 00       	add    $0xa480,%eax
    10e0:	8b 10                	mov    (%eax),%edx
    10e2:	8d 45 d0             	lea    -0x30(%ebp),%eax
    10e5:	89 7c 24 10          	mov    %edi,0x10(%esp)
    10e9:	89 74 24 0c          	mov    %esi,0xc(%esp)
    10ed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    10f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    10f5:	89 04 24             	mov    %eax,(%esp)
    10f8:	e8 41 22 00 00       	call   333e <initRect>
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
    112e:	e8 f7 22 00 00       	call   342a <createClickable>
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
    1151:	a1 00 d7 00 00       	mov    0xd700,%eax
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
    1187:	e8 0d 22 00 00       	call   3399 <isIn>
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
    11b8:	c7 44 24 04 58 8a 00 	movl   $0x8a58,0x4(%esp)
    11bf:	00 
    11c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11c7:	e8 a6 2c 00 00       	call   3e72 <printf>
	if (chdir(name) < 0)
    11cc:	8b 45 08             	mov    0x8(%ebp),%eax
    11cf:	89 04 24             	mov    %eax,(%esp)
    11d2:	e8 23 2b 00 00       	call   3cfa <chdir>
    11d7:	85 c0                	test   %eax,%eax
    11d9:	79 1b                	jns    11f6 <enterDir+0x4b>
		printf(2, "cannot cd %s\n", name);
    11db:	8b 45 08             	mov    0x8(%ebp),%eax
    11de:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e2:	c7 44 24 04 67 8a 00 	movl   $0x8a67,0x4(%esp)
    11e9:	00 
    11ea:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    11f1:	e8 7c 2c 00 00       	call   3e72 <printf>
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
    1226:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    122d:	e8 7d ef ff ff       	call   1af <list>
	drawFinderContent(context);
    1232:	a1 80 11 01 00       	mov    0x11180,%eax
    1237:	89 04 24             	mov    %eax,(%esp)
    123a:	a1 84 11 01 00       	mov    0x11184,%eax
    123f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1243:	a1 88 11 01 00       	mov    0x11188,%eax
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
    1277:	e8 c2 20 00 00       	call   333e <initRect>
    127c:	83 ec 04             	sub    $0x4,%esp
    127f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1282:	89 44 24 04          	mov    %eax,0x4(%esp)
    1286:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1289:	89 44 24 08          	mov    %eax,0x8(%esp)
    128d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1290:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1294:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1297:	89 44 24 10          	mov    %eax,0x10(%esp)
    129b:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    12a2:	e8 9a 22 00 00       	call   3541 <deleteClickable>
	addWndEvent(&cm);
    12a7:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    12ae:	e8 d2 fd ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    12b3:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    12cd:	e8 e4 27 00 00       	call   3ab6 <strlen>
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
    12e4:	e8 cd 27 00 00       	call   3ab6 <strlen>
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
    1308:	e8 eb 28 00 00       	call   3bf8 <atoi>
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
    132e:	e8 14 27 00 00       	call   3a47 <strcpy>
		close(fd);
    1333:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1336:	89 04 24             	mov    %eax,(%esp)
    1339:	e8 74 29 00 00       	call   3cb2 <close>
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
    134c:	e8 79 29 00 00       	call   3cca <open>
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
    1368:	e8 5d 29 00 00       	call   3cca <open>
    136d:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1370:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1374:	79 20                	jns    1396 <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1376:	8b 45 08             	mov    0x8(%ebp),%eax
    1379:	89 44 24 08          	mov    %eax,0x8(%esp)
    137d:	c7 44 24 04 77 8a 00 	movl   $0x8a77,0x4(%esp)
    1384:	00 
    1385:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    138c:	e8 e1 2a 00 00       	call   3e72 <printf>
		exit();
    1391:	e8 f4 28 00 00       	call   3c8a <exit>
	}
	close(fd);
    1396:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1399:	89 04 24             	mov    %eax,(%esp)
    139c:	e8 11 29 00 00       	call   3cb2 <close>
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
    13f1:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    13f8:	e8 b2 ed ff ff       	call   1af <list>
	drawFinderContent(context);
    13fd:	a1 80 11 01 00       	mov    0x11180,%eax
    1402:	89 04 24             	mov    %eax,(%esp)
    1405:	a1 84 11 01 00       	mov    0x11184,%eax
    140a:	89 44 24 04          	mov    %eax,0x4(%esp)
    140e:	a1 88 11 01 00       	mov    0x11188,%eax
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
    1442:	e8 f7 1e 00 00       	call   333e <initRect>
    1447:	83 ec 04             	sub    $0x4,%esp
    144a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    144d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1451:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1454:	89 44 24 08          	mov    %eax,0x8(%esp)
    1458:	8b 45 f0             	mov    -0x10(%ebp),%eax
    145b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    145f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1462:	89 44 24 10          	mov    %eax,0x10(%esp)
    1466:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    146d:	e8 cf 20 00 00       	call   3541 <deleteClickable>
	addWndEvent(&cm);
    1472:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    1479:	e8 07 fc ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    147e:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    1498:	e8 19 26 00 00       	call   3ab6 <strlen>
    149d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    14a0:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    14a7:	eb 55                	jmp    14fe <newFolder+0x72>
		n = strlen(name);
    14a9:	8b 45 08             	mov    0x8(%ebp),%eax
    14ac:	89 04 24             	mov    %eax,(%esp)
    14af:	e8 02 26 00 00       	call   3ab6 <strlen>
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
    14d3:	e8 20 27 00 00       	call   3bf8 <atoi>
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
    14f9:	e8 49 25 00 00       	call   3a47 <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    14fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1501:	89 04 24             	mov    %eax,(%esp)
    1504:	e8 e9 27 00 00       	call   3cf2 <mkdir>
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
    155d:	c7 44 24 04 8c 8a 00 	movl   $0x8a8c,0x4(%esp)
    1564:	00 
    1565:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    156c:	e8 01 29 00 00       	call   3e72 <printf>
	list(".");
    1571:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1578:	e8 32 ec ff ff       	call   1af <list>
	printItemList();
    157d:	e8 9c f8 ff ff       	call   e1e <printItemList>
	drawFinderContent(context);
    1582:	a1 80 11 01 00       	mov    0x11180,%eax
    1587:	89 04 24             	mov    %eax,(%esp)
    158a:	a1 84 11 01 00       	mov    0x11184,%eax
    158f:	89 44 24 04          	mov    %eax,0x4(%esp)
    1593:	a1 88 11 01 00       	mov    0x11188,%eax
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
    15c7:	e8 72 1d 00 00       	call   333e <initRect>
    15cc:	83 ec 04             	sub    $0x4,%esp
    15cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    15d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    15d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    15dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    15e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e7:	89 44 24 10          	mov    %eax,0x10(%esp)
    15eb:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    15f2:	e8 4a 1f 00 00       	call   3541 <deleteClickable>
	addWndEvent(&cm);
    15f7:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    15fe:	e8 82 fa ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    1603:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    161d:	e8 b8 26 00 00       	call   3cda <unlink>
    1622:	85 c0                	test   %eax,%eax
    1624:	79 1b                	jns    1641 <deleteFile+0x30>
		 printf(2, "rm: %s failed to delete\n", name);
    1626:	8b 45 08             	mov    0x8(%ebp),%eax
    1629:	89 44 24 08          	mov    %eax,0x8(%esp)
    162d:	c7 44 24 04 99 8a 00 	movl   $0x8a99,0x4(%esp)
    1634:	00 
    1635:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    163c:	e8 31 28 00 00       	call   3e72 <printf>
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
    1649:	a1 00 d7 00 00       	mov    0xd700,%eax
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
    167f:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1686:	e8 24 eb ff ff       	call   1af <list>
	drawFinderContent(context);
    168b:	a1 80 11 01 00       	mov    0x11180,%eax
    1690:	89 04 24             	mov    %eax,(%esp)
    1693:	a1 84 11 01 00       	mov    0x11184,%eax
    1698:	89 44 24 04          	mov    %eax,0x4(%esp)
    169c:	a1 88 11 01 00       	mov    0x11188,%eax
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
    16d0:	e8 69 1c 00 00       	call   333e <initRect>
    16d5:	83 ec 04             	sub    $0x4,%esp
    16d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16db:	89 44 24 04          	mov    %eax,0x4(%esp)
    16df:	8b 45 e8             	mov    -0x18(%ebp),%eax
    16e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    16e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    16e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
    16f0:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f4:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    16fb:	e8 41 1e 00 00       	call   3541 <deleteClickable>
		addWndEvent(&cm);
    1700:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    1707:	e8 79 f9 ff ff       	call   1085 <addWndEvent>
		addListEvent(&cm);
    170c:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    173f:	c7 44 24 04 b2 8a 00 	movl   $0x8ab2,0x4(%esp)
    1746:	00 
    1747:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    174e:	e8 1f 27 00 00       	call   3e72 <printf>
		temp->chosen = 0;
    1753:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1756:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    175d:	eb 1e                	jmp    177d <h_chooseFile+0x63>
	}
	else
	{
		printf(0, "unchooseFile!\n");
    175f:	c7 44 24 04 bf 8a 00 	movl   $0x8abf,0x4(%esp)
    1766:	00 
    1767:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    176e:	e8 ff 26 00 00       	call   3e72 <printf>
		temp->chosen = 1;
    1773:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1776:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    177d:	a1 80 11 01 00       	mov    0x11180,%eax
    1782:	89 04 24             	mov    %eax,(%esp)
    1785:	a1 84 11 01 00       	mov    0x11184,%eax
    178a:	89 44 24 04          	mov    %eax,0x4(%esp)
    178e:	a1 88 11 01 00       	mov    0x11188,%eax
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
    17a1:	c7 05 60 a3 00 00 00 	movl   $0x0,0xa360
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
    17b3:	c7 05 64 a3 00 00 01 	movl   $0x1,0xa364
    17ba:	00 00 00 
	freeFileItemList();
    17bd:	e8 0f e9 ff ff       	call   d1 <freeFileItemList>
		list(".");
    17c2:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    17c9:	e8 e1 e9 ff ff       	call   1af <list>
		drawFinderContent(context);
    17ce:	a1 80 11 01 00       	mov    0x11180,%eax
    17d3:	89 04 24             	mov    %eax,(%esp)
    17d6:	a1 84 11 01 00       	mov    0x11184,%eax
    17db:	89 44 24 04          	mov    %eax,0x4(%esp)
    17df:	a1 88 11 01 00       	mov    0x11188,%eax
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
    1813:	e8 26 1b 00 00       	call   333e <initRect>
    1818:	83 ec 04             	sub    $0x4,%esp
    181b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    181e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1822:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1825:	89 44 24 08          	mov    %eax,0x8(%esp)
    1829:	8b 45 f0             	mov    -0x10(%ebp),%eax
    182c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1833:	89 44 24 10          	mov    %eax,0x10(%esp)
    1837:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    183e:	e8 fe 1c 00 00       	call   3541 <deleteClickable>
			addWndEvent(&cm);
    1843:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    184a:	e8 36 f8 ff ff       	call   1085 <addWndEvent>
			addListEvent(&cm);
    184f:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    1863:	c7 05 64 a3 00 00 02 	movl   $0x2,0xa364
    186a:	00 00 00 
	freeFileItemList();
    186d:	e8 5f e8 ff ff       	call   d1 <freeFileItemList>
		list(".");
    1872:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1879:	e8 31 e9 ff ff       	call   1af <list>
		drawFinderContent(context);
    187e:	a1 80 11 01 00       	mov    0x11180,%eax
    1883:	89 04 24             	mov    %eax,(%esp)
    1886:	a1 84 11 01 00       	mov    0x11184,%eax
    188b:	89 44 24 04          	mov    %eax,0x4(%esp)
    188f:	a1 88 11 01 00       	mov    0x11188,%eax
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
    18c3:	e8 76 1a 00 00       	call   333e <initRect>
    18c8:	83 ec 04             	sub    $0x4,%esp
    18cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    18d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    18d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    18d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    18dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    18e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18e3:	89 44 24 10          	mov    %eax,0x10(%esp)
    18e7:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    18ee:	e8 4e 1c 00 00       	call   3541 <deleteClickable>
			addWndEvent(&cm);
    18f3:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    18fa:	e8 86 f7 ff ff       	call   1085 <addWndEvent>
			addListEvent(&cm);
    18ff:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    1913:	c7 04 24 ce 8a 00 00 	movl   $0x8ace,(%esp)
    191a:	e8 8c f8 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    191f:	e8 ad e7 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1924:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    192b:	e8 7f e8 ff ff       	call   1af <list>
	drawFinderContent(context);
    1930:	a1 80 11 01 00       	mov    0x11180,%eax
    1935:	89 04 24             	mov    %eax,(%esp)
    1938:	a1 84 11 01 00       	mov    0x11184,%eax
    193d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1941:	a1 88 11 01 00       	mov    0x11188,%eax
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
    1975:	e8 c4 19 00 00       	call   333e <initRect>
    197a:	83 ec 04             	sub    $0x4,%esp
    197d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1980:	89 44 24 04          	mov    %eax,0x4(%esp)
    1984:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1987:	89 44 24 08          	mov    %eax,0x8(%esp)
    198b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    198e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1992:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1995:	89 44 24 10          	mov    %eax,0x10(%esp)
    1999:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    19a0:	e8 9c 1b 00 00       	call   3541 <deleteClickable>
	addWndEvent(&cm);
    19a5:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    19ac:	e8 d4 f6 ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    19b1:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
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
    19ea:	c7 04 24 80 11 01 00 	movl   $0x11180,(%esp)
    19f1:	e8 12 04 00 00       	call   1e08 <init_context>
    19f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    19f9:	8d 45 88             	lea    -0x78(%ebp),%eax
    19fc:	8b 15 80 11 01 00    	mov    0x11180,%edx
    1a02:	89 54 24 04          	mov    %edx,0x4(%esp)
    1a06:	8b 15 84 11 01 00    	mov    0x11184,%edx
    1a0c:	89 54 24 08          	mov    %edx,0x8(%esp)
    1a10:	8b 15 88 11 01 00    	mov    0x11188,%edx
    1a16:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1a1a:	89 04 24             	mov    %eax,(%esp)
    1a1d:	e8 ba 19 00 00       	call   33dc <initClickManager>
    1a22:	83 ec 04             	sub    $0x4,%esp
    1a25:	8b 45 88             	mov    -0x78(%ebp),%eax
    1a28:	a3 8c 11 01 00       	mov    %eax,0x1118c
    1a2d:	8b 45 8c             	mov    -0x74(%ebp),%eax
    1a30:	a3 90 11 01 00       	mov    %eax,0x11190
    1a35:	8b 45 90             	mov    -0x70(%ebp),%eax
    1a38:	a3 94 11 01 00       	mov    %eax,0x11194
    1a3d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    1a40:	a3 98 11 01 00       	mov    %eax,0x11198
    1a45:	8b 45 98             	mov    -0x68(%ebp),%eax
    1a48:	a3 9c 11 01 00       	mov    %eax,0x1119c
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    1a4d:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    1a54:	00 
    1a55:	c7 04 24 60 a4 00 00 	movl   $0xa460,(%esp)
    1a5c:	e8 a1 0f 00 00       	call   2a02 <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    1a61:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    1a68:	00 
    1a69:	c7 04 24 80 a3 00 00 	movl   $0xa380,(%esp)
    1a70:	e8 8d 0f 00 00       	call   2a02 <load_iconlist>
	//testHandlers();
	mkdir("userfolder");
    1a75:	c7 04 24 d1 8a 00 00 	movl   $0x8ad1,(%esp)
    1a7c:	e8 71 22 00 00       	call   3cf2 <mkdir>
	enterDir("userfolder");
    1a81:	c7 04 24 d1 8a 00 00 	movl   $0x8ad1,(%esp)
    1a88:	e8 1e f7 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    1a8d:	e8 3f e6 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1a92:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
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
    1ac4:	e8 75 18 00 00       	call   333e <initRect>
    1ac9:	83 ec 04             	sub    $0x4,%esp
    1acc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1acf:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ad3:	8b 45 d8             	mov    -0x28(%ebp),%eax
    1ad6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ada:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1add:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
    1ae4:	89 44 24 10          	mov    %eax,0x10(%esp)
    1ae8:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    1aef:	e8 4d 1a 00 00       	call   3541 <deleteClickable>
	addWndEvent(&cm);
    1af4:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    1afb:	e8 85 f5 ff ff       	call   1085 <addWndEvent>
	addListEvent(&cm);
    1b00:	c7 04 24 8c 11 01 00 	movl   $0x1118c,(%esp)
    1b07:	e8 f1 f4 ff ff       	call   ffd <addListEvent>
	while (isRun) {
    1b0c:	e9 c7 01 00 00       	jmp    1cd8 <main+0x314>
		getMsg(&msg);
    1b11:	8d 45 bc             	lea    -0x44(%ebp),%eax
    1b14:	89 04 24             	mov    %eax,(%esp)
    1b17:	e8 0e 22 00 00       	call   3d2a <getMsg>
		switch (msg.msg_type) {
    1b1c:	8b 45 bc             	mov    -0x44(%ebp),%eax
    1b1f:	83 f8 08             	cmp    $0x8,%eax
    1b22:	0f 87 af 01 00 00    	ja     1cd7 <main+0x313>
    1b28:	8b 04 85 dc 8a 00 00 	mov    0x8adc(,%eax,4),%eax
    1b2f:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1b31:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1b34:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1b37:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    1b3a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1b3e:	89 54 24 04          	mov    %edx,0x4(%esp)
    1b42:	89 04 24             	mov    %eax,(%esp)
    1b45:	e8 cd 17 00 00       	call   3317 <initPoint>
    1b4a:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    1b4d:	8b 0d 90 11 01 00    	mov    0x11190,%ecx
    1b53:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1b56:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1b59:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b5d:	89 54 24 08          	mov    %edx,0x8(%esp)
    1b61:	89 0c 24             	mov    %ecx,(%esp)
    1b64:	e8 b8 1a 00 00       	call   3621 <executeHandler>
    1b69:	85 c0                	test   %eax,%eax
    1b6b:	74 19                	je     1b86 <main+0x1c2>
				updateWindow(winid, context.addr);
    1b6d:	a1 80 11 01 00       	mov    0x11180,%eax
    1b72:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b79:	89 04 24             	mov    %eax,(%esp)
    1b7c:	e8 c1 21 00 00       	call   3d42 <updateWindow>
			}
			break;
    1b81:	e9 52 01 00 00       	jmp    1cd8 <main+0x314>
    1b86:	e9 4d 01 00 00       	jmp    1cd8 <main+0x314>
		case MSG_UPDATE:
			//printf(0, "update event!\n");
			drawFinderWnd(context);
    1b8b:	a1 80 11 01 00       	mov    0x11180,%eax
    1b90:	89 04 24             	mov    %eax,(%esp)
    1b93:	a1 84 11 01 00       	mov    0x11184,%eax
    1b98:	89 44 24 04          	mov    %eax,0x4(%esp)
    1b9c:	a1 88 11 01 00       	mov    0x11188,%eax
    1ba1:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ba5:	e8 07 ed ff ff       	call   8b1 <drawFinderWnd>
			drawFinderContent(context);
    1baa:	a1 80 11 01 00       	mov    0x11180,%eax
    1baf:	89 04 24             	mov    %eax,(%esp)
    1bb2:	a1 84 11 01 00       	mov    0x11184,%eax
    1bb7:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bbb:	a1 88 11 01 00       	mov    0x11188,%eax
    1bc0:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bc4:	e8 ea ee ff ff       	call   ab3 <drawFinderContent>
			updateWindow(winid, context.addr);
    1bc9:	a1 80 11 01 00       	mov    0x11180,%eax
    1bce:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bd2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1bd5:	89 04 24             	mov    %eax,(%esp)
    1bd8:	e8 65 21 00 00       	call   3d42 <updateWindow>
			break;
    1bdd:	e9 f6 00 00 00       	jmp    1cd8 <main+0x314>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    1be2:	8b 75 cc             	mov    -0x34(%ebp),%esi
    1be5:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    1be8:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1beb:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1bee:	a1 80 11 01 00       	mov    0x11180,%eax
    1bf3:	89 74 24 14          	mov    %esi,0x14(%esp)
    1bf7:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    1bfb:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1bff:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c03:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c07:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c0a:	89 04 24             	mov    %eax,(%esp)
    1c0d:	e8 38 21 00 00       	call   3d4a <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    1c12:	e9 c1 00 00 00       	jmp    1cd8 <main+0x314>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1c17:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1c1a:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1c1d:	8d 45 80             	lea    -0x80(%ebp),%eax
    1c20:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1c24:	89 54 24 04          	mov    %edx,0x4(%esp)
    1c28:	89 04 24             	mov    %eax,(%esp)
    1c2b:	e8 e7 16 00 00       	call   3317 <initPoint>
    1c30:	83 ec 04             	sub    $0x4,%esp
    1c33:	8b 45 80             	mov    -0x80(%ebp),%eax
    1c36:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1c39:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1c3c:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.left_click, p)) {
    1c3f:	8b 0d 8c 11 01 00    	mov    0x1118c,%ecx
    1c45:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1c48:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1c4b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c4f:	89 54 24 08          	mov    %edx,0x8(%esp)
    1c53:	89 0c 24             	mov    %ecx,(%esp)
    1c56:	e8 c6 19 00 00       	call   3621 <executeHandler>
    1c5b:	85 c0                	test   %eax,%eax
    1c5d:	74 16                	je     1c75 <main+0x2b1>

				updateWindow(winid, context.addr);
    1c5f:	a1 80 11 01 00       	mov    0x11180,%eax
    1c64:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1c6b:	89 04 24             	mov    %eax,(%esp)
    1c6e:	e8 cf 20 00 00       	call   3d42 <updateWindow>
			}
			break;
    1c73:	eb 63                	jmp    1cd8 <main+0x314>
    1c75:	eb 61                	jmp    1cd8 <main+0x314>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    1c77:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
    1c7a:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1c7d:	8d 45 80             	lea    -0x80(%ebp),%eax
    1c80:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1c84:	89 54 24 04          	mov    %edx,0x4(%esp)
    1c88:	89 04 24             	mov    %eax,(%esp)
    1c8b:	e8 87 16 00 00       	call   3317 <initPoint>
    1c90:	83 ec 04             	sub    $0x4,%esp
    1c93:	8b 45 80             	mov    -0x80(%ebp),%eax
    1c96:	8b 55 84             	mov    -0x7c(%ebp),%edx
    1c99:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    1c9c:	89 55 b8             	mov    %edx,-0x48(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    1c9f:	8b 0d 94 11 01 00    	mov    0x11194,%ecx
    1ca5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    1ca8:	8b 55 b8             	mov    -0x48(%ebp),%edx
    1cab:	89 44 24 04          	mov    %eax,0x4(%esp)
    1caf:	89 54 24 08          	mov    %edx,0x8(%esp)
    1cb3:	89 0c 24             	mov    %ecx,(%esp)
    1cb6:	e8 66 19 00 00       	call   3621 <executeHandler>
    1cbb:	85 c0                	test   %eax,%eax
    1cbd:	74 16                	je     1cd5 <main+0x311>
				updateWindow(winid, context.addr);
    1cbf:	a1 80 11 01 00       	mov    0x11180,%eax
    1cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ccb:	89 04 24             	mov    %eax,(%esp)
    1cce:	e8 6f 20 00 00       	call   3d42 <updateWindow>
			}
			break;
    1cd3:	eb 03                	jmp    1cd8 <main+0x314>
    1cd5:	eb 01                	jmp    1cd8 <main+0x314>
		default:
			break;
    1cd7:	90                   	nop
	freeFileItemList();
	list(".");
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	while (isRun) {
    1cd8:	a1 60 a3 00 00       	mov    0xa360,%eax
    1cdd:	85 c0                	test   %eax,%eax
    1cdf:	0f 85 2c fe ff ff    	jne    1b11 <main+0x14d>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    1ce5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1ce8:	89 44 24 04          	mov    %eax,0x4(%esp)
    1cec:	c7 04 24 80 11 01 00 	movl   $0x11180,(%esp)
    1cf3:	e8 93 01 00 00       	call   1e8b <free_context>
	exit();
    1cf8:	e8 8d 1f 00 00       	call   3c8a <exit>

00001cfd <testHandlers>:
}

void testHandlers() {
    1cfd:	55                   	push   %ebp
    1cfe:	89 e5                	mov    %esp,%ebp
    1d00:	83 ec 18             	sub    $0x18,%esp

	list(".");
    1d03:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1d0a:	e8 a0 e4 ff ff       	call   1af <list>
	printf(0, "original list:\n");
    1d0f:	c7 44 24 04 00 8b 00 	movl   $0x8b00,0x4(%esp)
    1d16:	00 
    1d17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d1e:	e8 4f 21 00 00       	call   3e72 <printf>
	printItemList();
    1d23:	e8 f6 f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1d28:	c7 44 24 04 10 8b 00 	movl   $0x8b10,0x4(%esp)
    1d2f:	00 
    1d30:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d37:	e8 36 21 00 00       	call   3e72 <printf>
	printf(0, "new a folder:\n");
    1d3c:	c7 44 24 04 12 8b 00 	movl   $0x8b12,0x4(%esp)
    1d43:	00 
    1d44:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d4b:	e8 22 21 00 00       	call   3e72 <printf>
	newFolder("newfolder");
    1d50:	c7 04 24 21 8b 00 00 	movl   $0x8b21,(%esp)
    1d57:	e8 30 f7 ff ff       	call   148c <newFolder>
	freeFileItemList();
    1d5c:	e8 70 e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1d61:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1d68:	e8 42 e4 ff ff       	call   1af <list>
	printItemList();
    1d6d:	e8 ac f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1d72:	c7 44 24 04 10 8b 00 	movl   $0x8b10,0x4(%esp)
    1d79:	00 
    1d7a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d81:	e8 ec 20 00 00       	call   3e72 <printf>
	printf(0, "enter new folder:\n");
    1d86:	c7 44 24 04 2b 8b 00 	movl   $0x8b2b,0x4(%esp)
    1d8d:	00 
    1d8e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d95:	e8 d8 20 00 00       	call   3e72 <printf>
	enterDir("newfolder");
    1d9a:	c7 04 24 21 8b 00 00 	movl   $0x8b21,(%esp)
    1da1:	e8 05 f4 ff ff       	call   11ab <enterDir>
	freeFileItemList();
    1da6:	e8 26 e3 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1dab:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1db2:	e8 f8 e3 ff ff       	call   1af <list>
	printItemList();
    1db7:	e8 62 f0 ff ff       	call   e1e <printItemList>
	printf(0, "\n");
    1dbc:	c7 44 24 04 10 8b 00 	movl   $0x8b10,0x4(%esp)
    1dc3:	00 
    1dc4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1dcb:	e8 a2 20 00 00       	call   3e72 <printf>
	printf(0, "new a file:\n");
    1dd0:	c7 44 24 04 3e 8b 00 	movl   $0x8b3e,0x4(%esp)
    1dd7:	00 
    1dd8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ddf:	e8 8e 20 00 00       	call   3e72 <printf>
	newFile("newfile.txt");
    1de4:	c7 04 24 4b 8b 00 00 	movl   $0x8b4b,(%esp)
    1deb:	e8 d1 f4 ff ff       	call   12c1 <newFile>
	freeFileItemList();
    1df0:	e8 dc e2 ff ff       	call   d1 <freeFileItemList>
	list(".");
    1df5:	c7 04 24 75 8a 00 00 	movl   $0x8a75,(%esp)
    1dfc:	e8 ae e3 ff ff       	call   1af <list>
	printItemList();
    1e01:	e8 18 f0 ff ff       	call   e1e <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    1e06:	c9                   	leave  
    1e07:	c3                   	ret    

00001e08 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    1e08:	55                   	push   %ebp
    1e09:	89 e5                	mov    %esp,%ebp
    1e0b:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    1e0e:	8b 45 08             	mov    0x8(%ebp),%eax
    1e11:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e14:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    1e17:	8b 45 08             	mov    0x8(%ebp),%eax
    1e1a:	8b 55 10             	mov    0x10(%ebp),%edx
    1e1d:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    1e20:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e23:	8b 45 10             	mov    0x10(%ebp),%eax
    1e26:	0f af c2             	imul   %edx,%eax
    1e29:	01 c0                	add    %eax,%eax
    1e2b:	89 04 24             	mov    %eax,(%esp)
    1e2e:	e8 2b 23 00 00       	call   415e <malloc>
    1e33:	8b 55 08             	mov    0x8(%ebp),%edx
    1e36:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    1e38:	8b 55 0c             	mov    0xc(%ebp),%edx
    1e3b:	8b 45 10             	mov    0x10(%ebp),%eax
    1e3e:	0f af c2             	imul   %edx,%eax
    1e41:	8d 14 00             	lea    (%eax,%eax,1),%edx
    1e44:	8b 45 08             	mov    0x8(%ebp),%eax
    1e47:	8b 00                	mov    (%eax),%eax
    1e49:	89 54 24 08          	mov    %edx,0x8(%esp)
    1e4d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e54:	00 
    1e55:	89 04 24             	mov    %eax,(%esp)
    1e58:	e8 80 1c 00 00       	call   3add <memset>
    initializeASCII();
    1e5d:	e8 93 01 00 00       	call   1ff5 <initializeASCII>
    initializeGBK();
    1e62:	e8 17 03 00 00       	call   217e <initializeGBK>
    return createWindow(0, 0, width, height);
    1e67:	8b 45 10             	mov    0x10(%ebp),%eax
    1e6a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1e6e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1e71:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e75:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e7c:	00 
    1e7d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1e84:	e8 a9 1e 00 00       	call   3d32 <createWindow>
}
    1e89:	c9                   	leave  
    1e8a:	c3                   	ret    

00001e8b <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    1e8b:	55                   	push   %ebp
    1e8c:	89 e5                	mov    %esp,%ebp
    1e8e:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    1e91:	8b 45 08             	mov    0x8(%ebp),%eax
    1e94:	8b 00                	mov    (%eax),%eax
    1e96:	89 04 24             	mov    %eax,(%esp)
    1e99:	e8 87 21 00 00       	call   4025 <free>
    freeASCII();
    1e9e:	e8 c6 02 00 00       	call   2169 <freeASCII>
    freeGBK();
    1ea3:	e8 7e 03 00 00       	call   2226 <freeGBK>
    destroyWindow(winid);
    1ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
    1eab:	89 04 24             	mov    %eax,(%esp)
    1eae:	e8 87 1e 00 00       	call   3d3a <destroyWindow>
}
    1eb3:	c9                   	leave  
    1eb4:	c3                   	ret    

00001eb5 <draw_point>:
*             then do nothing!
*/

void 
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    1eb5:	55                   	push   %ebp
    1eb6:	89 e5                	mov    %esp,%ebp
    1eb8:	83 ec 04             	sub    $0x4,%esp
    1ebb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1ebe:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width) 
    1ec2:	8b 45 0c             	mov    0xc(%ebp),%eax
    1ec5:	3b 45 14             	cmp    0x14(%ebp),%eax
    1ec8:	77 02                	ja     1ecc <draw_point+0x17>
    return;
    1eca:	eb 26                	jmp    1ef2 <draw_point+0x3d>
  if(y >= c.height)
    1ecc:	8b 45 10             	mov    0x10(%ebp),%eax
    1ecf:	3b 45 18             	cmp    0x18(%ebp),%eax
    1ed2:	77 02                	ja     1ed6 <draw_point+0x21>
    return;
    1ed4:	eb 1c                	jmp    1ef2 <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    1ed6:	8b 55 08             	mov    0x8(%ebp),%edx
    1ed9:	8b 45 0c             	mov    0xc(%ebp),%eax
    1edc:	0f af 45 18          	imul   0x18(%ebp),%eax
    1ee0:	89 c1                	mov    %eax,%ecx
    1ee2:	8b 45 14             	mov    0x14(%ebp),%eax
    1ee5:	01 c8                	add    %ecx,%eax
    1ee7:	01 c0                	add    %eax,%eax
    1ee9:	01 c2                	add    %eax,%edx
    1eeb:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    1eef:	66 89 02             	mov    %ax,(%edx)
}
    1ef2:	c9                   	leave  
    1ef3:	c3                   	ret    

00001ef4 <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    1ef4:	55                   	push   %ebp
    1ef5:	89 e5                	mov    %esp,%ebp
    1ef7:	83 ec 2c             	sub    $0x2c,%esp
    1efa:	8b 45 24             	mov    0x24(%ebp),%eax
    1efd:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    1f01:	8b 45 1c             	mov    0x1c(%ebp),%eax
    1f04:	8b 55 14             	mov    0x14(%ebp),%edx
    1f07:	01 c2                	add    %eax,%edx
    1f09:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f0c:	39 c2                	cmp    %eax,%edx
    1f0e:	0f 46 c2             	cmovbe %edx,%eax
    1f11:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height; 
    1f14:	8b 45 20             	mov    0x20(%ebp),%eax
    1f17:	8b 55 18             	mov    0x18(%ebp),%edx
    1f1a:	01 c2                	add    %eax,%edx
    1f1c:	8b 45 10             	mov    0x10(%ebp),%eax
    1f1f:	39 c2                	cmp    %eax,%edx
    1f21:	0f 46 c2             	cmovbe %edx,%eax
    1f24:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    1f27:	8b 45 18             	mov    0x18(%ebp),%eax
    1f2a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1f2d:	eb 47                	jmp    1f76 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    1f2f:	8b 45 14             	mov    0x14(%ebp),%eax
    1f32:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1f35:	eb 33                	jmp    1f6a <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    1f37:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    1f3b:	8b 55 f8             	mov    -0x8(%ebp),%edx
    1f3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f41:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    1f45:	89 54 24 10          	mov    %edx,0x10(%esp)
    1f49:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1f4d:	8b 45 08             	mov    0x8(%ebp),%eax
    1f50:	89 04 24             	mov    %eax,(%esp)
    1f53:	8b 45 0c             	mov    0xc(%ebp),%eax
    1f56:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f5a:	8b 45 10             	mov    0x10(%ebp),%eax
    1f5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f61:	e8 4f ff ff ff       	call   1eb5 <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    1f66:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    1f6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1f6d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    1f70:	7c c5                	jl     1f37 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height; 
	for (y = by; y < my; y++)
    1f72:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1f76:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1f79:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1f7c:	7c b1                	jl     1f2f <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    1f7e:	c9                   	leave  
    1f7f:	c3                   	ret    

00001f80 <printBinary>:

void printBinary(char c)
{
    1f80:	55                   	push   %ebp
    1f81:	89 e5                	mov    %esp,%ebp
    1f83:	83 ec 28             	sub    $0x28,%esp
    1f86:	8b 45 08             	mov    0x8(%ebp),%eax
    1f89:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    1f8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f93:	eb 44                	jmp    1fd9 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    1f95:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    1f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f9c:	89 c1                	mov    %eax,%ecx
    1f9e:	d3 e2                	shl    %cl,%edx
    1fa0:	89 d0                	mov    %edx,%eax
    1fa2:	25 80 00 00 00       	and    $0x80,%eax
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	74 16                	je     1fc1 <printBinary+0x41>
		{
			printf(0, "1");
    1fab:	c7 44 24 04 57 8b 00 	movl   $0x8b57,0x4(%esp)
    1fb2:	00 
    1fb3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fba:	e8 b3 1e 00 00       	call   3e72 <printf>
    1fbf:	eb 14                	jmp    1fd5 <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    1fc1:	c7 44 24 04 59 8b 00 	movl   $0x8b59,0x4(%esp)
    1fc8:	00 
    1fc9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fd0:	e8 9d 1e 00 00       	call   3e72 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    1fd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1fd9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    1fdd:	7e b6                	jle    1f95 <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    1fdf:	c7 44 24 04 5b 8b 00 	movl   $0x8b5b,0x4(%esp)
    1fe6:	00 
    1fe7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1fee:	e8 7f 1e 00 00       	call   3e72 <printf>
}
    1ff3:	c9                   	leave  
    1ff4:	c3                   	ret    

00001ff5 <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    1ff5:	55                   	push   %ebp
    1ff6:	89 e5                	mov    %esp,%ebp
    1ff8:	56                   	push   %esi
    1ff9:	53                   	push   %ebx
    1ffa:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    1ffd:	c7 44 24 04 5d 8b 00 	movl   $0x8b5d,0x4(%esp)
    2004:	00 
    2005:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    200c:	e8 61 1e 00 00       	call   3e72 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    2011:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2018:	00 
    2019:	c7 04 24 70 8b 00 00 	movl   $0x8b70,(%esp)
    2020:	e8 a5 1c 00 00       	call   3cca <open>
    2025:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2028:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    202c:	79 21                	jns    204f <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    202e:	c7 44 24 08 70 8b 00 	movl   $0x8b70,0x8(%esp)
    2035:	00 
    2036:	c7 44 24 04 7c 8b 00 	movl   $0x8b7c,0x4(%esp)
    203d:	00 
    203e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2045:	e8 28 1e 00 00       	call   3e72 <printf>
	  return;
    204a:	e9 13 01 00 00       	jmp    2162 <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    204f:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2056:	e8 03 21 00 00       	call   415e <malloc>
    205b:	a3 a0 11 01 00       	mov    %eax,0x111a0
	for (i = 0; i < ASCII_NUM; i++)
    2060:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2067:	eb 12                	jmp    207b <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    2069:	8b 15 a0 11 01 00    	mov    0x111a0,%edx
    206f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2072:	01 d0                	add    %edx,%eax
    2074:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    2077:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    207b:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    2082:	7e e5                	jle    2069 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    2084:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    208b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    2092:	e9 84 00 00 00       	jmp    211b <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    2097:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    209e:	eb 73                	jmp    2113 <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    20a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20a3:	05 c0 11 01 00       	add    $0x111c0,%eax
    20a8:	0f b6 00             	movzbl (%eax),%eax
    20ab:	3c 2a                	cmp    $0x2a,%al
    20ad:	74 0f                	je     20be <initializeASCII+0xc9>
    20af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20b2:	05 c0 11 01 00       	add    $0x111c0,%eax
    20b7:	0f b6 00             	movzbl (%eax),%eax
    20ba:	3c 2e                	cmp    $0x2e,%al
    20bc:	75 51                	jne    210f <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    20be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    20c1:	05 c0 11 01 00       	add    $0x111c0,%eax
    20c6:	0f b6 00             	movzbl (%eax),%eax
    20c9:	3c 2a                	cmp    $0x2a,%al
    20cb:	75 2d                	jne    20fa <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    20cd:	8b 15 a0 11 01 00    	mov    0x111a0,%edx
    20d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20d6:	01 c2                	add    %eax,%edx
    20d8:	8b 0d a0 11 01 00    	mov    0x111a0,%ecx
    20de:	8b 45 ec             	mov    -0x14(%ebp),%eax
    20e1:	01 c8                	add    %ecx,%eax
    20e3:	0f b6 00             	movzbl (%eax),%eax
    20e6:	89 c3                	mov    %eax,%ebx
    20e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20eb:	be 80 00 00 00       	mov    $0x80,%esi
    20f0:	89 c1                	mov    %eax,%ecx
    20f2:	d3 fe                	sar    %cl,%esi
    20f4:	89 f0                	mov    %esi,%eax
    20f6:	09 d8                	or     %ebx,%eax
    20f8:	88 02                	mov    %al,(%edx)
				}
				x ++;
    20fa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    20fe:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    2102:	7e 0b                	jle    210f <initializeASCII+0x11a>
				{
					x = 0;
    2104:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    210b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    210f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2113:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2116:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    2119:	7c 85                	jl     20a0 <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    211b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    2122:	00 
    2123:	c7 44 24 04 c0 11 01 	movl   $0x111c0,0x4(%esp)
    212a:	00 
    212b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    212e:	89 04 24             	mov    %eax,(%esp)
    2131:	e8 6c 1b 00 00       	call   3ca2 <read>
    2136:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    2139:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    213d:	0f 8f 54 ff ff ff    	jg     2097 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    2143:	c7 44 24 04 8c 8b 00 	movl   $0x8b8c,0x4(%esp)
    214a:	00 
    214b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2152:	e8 1b 1d 00 00       	call   3e72 <printf>
	close(fd);
    2157:	8b 45 e8             	mov    -0x18(%ebp),%eax
    215a:	89 04 24             	mov    %eax,(%esp)
    215d:	e8 50 1b 00 00       	call   3cb2 <close>
}
    2162:	83 c4 30             	add    $0x30,%esp
    2165:	5b                   	pop    %ebx
    2166:	5e                   	pop    %esi
    2167:	5d                   	pop    %ebp
    2168:	c3                   	ret    

00002169 <freeASCII>:

void freeASCII(){
    2169:	55                   	push   %ebp
    216a:	89 e5                	mov    %esp,%ebp
    216c:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    216f:	a1 a0 11 01 00       	mov    0x111a0,%eax
    2174:	89 04 24             	mov    %eax,(%esp)
    2177:	e8 a9 1e 00 00       	call   4025 <free>
}
    217c:	c9                   	leave  
    217d:	c3                   	ret    

0000217e <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    217e:	55                   	push   %ebp
    217f:	89 e5                	mov    %esp,%ebp
    2181:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    2184:	c7 44 24 04 a9 8b 00 	movl   $0x8ba9,0x4(%esp)
    218b:	00 
    218c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2193:	e8 da 1c 00 00       	call   3e72 <printf>
	if((fd = open(HZK16, 0)) < 0){
    2198:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    219f:	00 
    21a0:	c7 04 24 ba 8b 00 00 	movl   $0x8bba,(%esp)
    21a7:	e8 1e 1b 00 00       	call   3cca <open>
    21ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    21af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    21b3:	79 1e                	jns    21d3 <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    21b5:	c7 44 24 08 ba 8b 00 	movl   $0x8bba,0x8(%esp)
    21bc:	00 
    21bd:	c7 44 24 04 7c 8b 00 	movl   $0x8b7c,0x4(%esp)
    21c4:	00 
    21c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21cc:	e8 a1 1c 00 00       	call   3e72 <printf>
		return;
    21d1:	eb 51                	jmp    2224 <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    21d3:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    21da:	e8 7f 1f 00 00       	call   415e <malloc>
    21df:	a3 a4 11 01 00       	mov    %eax,0x111a4
	fontFile.size = read(fd, fontFile.buf, 27000);
    21e4:	a1 a4 11 01 00       	mov    0x111a4,%eax
    21e9:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    21f0:	00 
    21f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    21f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    21f8:	89 04 24             	mov    %eax,(%esp)
    21fb:	e8 a2 1a 00 00       	call   3ca2 <read>
    2200:	a3 a8 11 01 00       	mov    %eax,0x111a8
	printf(0,"initialzing gbk complete!\n");
    2205:	c7 44 24 04 c4 8b 00 	movl   $0x8bc4,0x4(%esp)
    220c:	00 
    220d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2214:	e8 59 1c 00 00       	call   3e72 <printf>
	close(fd);
    2219:	8b 45 f4             	mov    -0xc(%ebp),%eax
    221c:	89 04 24             	mov    %eax,(%esp)
    221f:	e8 8e 1a 00 00       	call   3cb2 <close>
}
    2224:	c9                   	leave  
    2225:	c3                   	ret    

00002226 <freeGBK>:

void freeGBK(){
    2226:	55                   	push   %ebp
    2227:	89 e5                	mov    %esp,%ebp
    2229:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    222c:	a1 a4 11 01 00       	mov    0x111a4,%eax
    2231:	89 04 24             	mov    %eax,(%esp)
    2234:	e8 ec 1d 00 00       	call   4025 <free>
}
    2239:	c9                   	leave  
    223a:	c3                   	ret    

0000223b <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    223b:	55                   	push   %ebp
    223c:	89 e5                	mov    %esp,%ebp
    223e:	53                   	push   %ebx
    223f:	83 ec 30             	sub    $0x30,%esp
    2242:	8b 55 14             	mov    0x14(%ebp),%edx
    2245:	8b 45 18             	mov    0x18(%ebp),%eax
    2248:	88 55 e8             	mov    %dl,-0x18(%ebp)
    224b:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    224f:	8b 45 20             	mov    0x20(%ebp),%eax
    2252:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2255:	eb 7f                	jmp    22d6 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    2257:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    225e:	eb 6c                	jmp    22cc <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    2260:	a1 a0 11 01 00       	mov    0x111a0,%eax
    2265:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    2269:	c1 e2 04             	shl    $0x4,%edx
    226c:	89 d1                	mov    %edx,%ecx
    226e:	8b 55 20             	mov    0x20(%ebp),%edx
    2271:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2274:	29 d3                	sub    %edx,%ebx
    2276:	89 da                	mov    %ebx,%edx
    2278:	01 ca                	add    %ecx,%edx
    227a:	01 d0                	add    %edx,%eax
    227c:	0f b6 00             	movzbl (%eax),%eax
    227f:	0f b6 d0             	movzbl %al,%edx
    2282:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2285:	89 c1                	mov    %eax,%ecx
    2287:	d3 e2                	shl    %cl,%edx
    2289:	89 d0                	mov    %edx,%eax
    228b:	25 80 00 00 00       	and    $0x80,%eax
    2290:	85 c0                	test   %eax,%eax
    2292:	74 34                	je     22c8 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    2294:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2298:	8b 55 f4             	mov    -0xc(%ebp),%edx
    229b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    229e:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    22a1:	01 d8                	add    %ebx,%eax
    22a3:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    22a7:	89 54 24 10          	mov    %edx,0x10(%esp)
    22ab:	89 44 24 0c          	mov    %eax,0xc(%esp)
    22af:	8b 45 08             	mov    0x8(%ebp),%eax
    22b2:	89 04 24             	mov    %eax,(%esp)
    22b5:	8b 45 0c             	mov    0xc(%ebp),%eax
    22b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    22bc:	8b 45 10             	mov    0x10(%ebp),%eax
    22bf:	89 44 24 08          	mov    %eax,0x8(%esp)
    22c3:	e8 ed fb ff ff       	call   1eb5 <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    22c8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    22cc:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    22d0:	7e 8e                	jle    2260 <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    22d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    22d6:	8b 45 20             	mov    0x20(%ebp),%eax
    22d9:	83 c0 10             	add    $0x10,%eax
    22dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    22df:	0f 8f 72 ff ff ff    	jg     2257 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    22e5:	83 c4 30             	add    $0x30,%esp
    22e8:	5b                   	pop    %ebx
    22e9:	5d                   	pop    %ebp
    22ea:	c3                   	ret    

000022eb <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    22eb:	55                   	push   %ebp
    22ec:	89 e5                	mov    %esp,%ebp
    22ee:	53                   	push   %ebx
    22ef:	83 ec 34             	sub    $0x34,%esp
    22f2:	8b 55 14             	mov    0x14(%ebp),%edx
    22f5:	8b 45 18             	mov    0x18(%ebp),%eax
    22f8:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    22fc:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2300:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2304:	0f b6 c0             	movzbl %al,%eax
    2307:	3d a0 00 00 00       	cmp    $0xa0,%eax
    230c:	0f 8e 40 01 00 00    	jle    2452 <put_gbk+0x167>
    2312:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    2316:	66 c1 f8 08          	sar    $0x8,%ax
    231a:	98                   	cwtl   
    231b:	0f b6 c0             	movzbl %al,%eax
    231e:	3d a0 00 00 00       	cmp    $0xa0,%eax
    2323:	0f 8e 29 01 00 00    	jle    2452 <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    2329:	a1 a4 11 01 00       	mov    0x111a4,%eax
    232e:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    2331:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    2335:	0f b6 c0             	movzbl %al,%eax
    2338:	2d a1 00 00 00       	sub    $0xa1,%eax
    233d:	6b c0 5e             	imul   $0x5e,%eax,%eax
    2340:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    2344:	66 c1 fa 08          	sar    $0x8,%dx
    2348:	0f bf d2             	movswl %dx,%edx
    234b:	0f b6 d2             	movzbl %dl,%edx
    234e:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    2354:	01 d0                	add    %edx,%eax
    2356:	c1 e0 05             	shl    $0x5,%eax
    2359:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    235c:	8b 45 20             	mov    0x20(%ebp),%eax
    235f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    2362:	e9 da 00 00 00       	jmp    2441 <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    2367:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    236e:	eb 58                	jmp    23c8 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    2370:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2373:	8b 55 ec             	mov    -0x14(%ebp),%edx
    2376:	01 d0                	add    %edx,%eax
    2378:	0f b6 00             	movzbl (%eax),%eax
    237b:	0f b6 d0             	movzbl %al,%edx
    237e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2381:	89 c1                	mov    %eax,%ecx
    2383:	d3 e2                	shl    %cl,%edx
    2385:	89 d0                	mov    %edx,%eax
    2387:	25 80 00 00 00       	and    $0x80,%eax
    238c:	85 c0                	test   %eax,%eax
    238e:	74 34                	je     23c4 <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    2390:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    2394:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2397:	8b 45 f8             	mov    -0x8(%ebp),%eax
    239a:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    239d:	01 d8                	add    %ebx,%eax
    239f:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    23a3:	89 54 24 10          	mov    %edx,0x10(%esp)
    23a7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    23ab:	8b 45 08             	mov    0x8(%ebp),%eax
    23ae:	89 04 24             	mov    %eax,(%esp)
    23b1:	8b 45 0c             	mov    0xc(%ebp),%eax
    23b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    23b8:	8b 45 10             	mov    0x10(%ebp),%eax
    23bb:	89 44 24 08          	mov    %eax,0x8(%esp)
    23bf:	e8 f1 fa ff ff       	call   1eb5 <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    23c4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    23c8:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    23cc:	7e a2                	jle    2370 <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    23ce:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    23d2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    23d9:	eb 58                	jmp    2433 <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    23db:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23de:	8b 55 ec             	mov    -0x14(%ebp),%edx
    23e1:	01 d0                	add    %edx,%eax
    23e3:	0f b6 00             	movzbl (%eax),%eax
    23e6:	0f b6 d0             	movzbl %al,%edx
    23e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    23ec:	89 c1                	mov    %eax,%ecx
    23ee:	d3 e2                	shl    %cl,%edx
    23f0:	89 d0                	mov    %edx,%eax
    23f2:	25 80 00 00 00       	and    $0x80,%eax
    23f7:	85 c0                	test   %eax,%eax
    23f9:	74 34                	je     242f <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    23fb:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    23ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2402:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2405:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    2408:	01 d8                	add    %ebx,%eax
    240a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    240e:	89 54 24 10          	mov    %edx,0x10(%esp)
    2412:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2416:	8b 45 08             	mov    0x8(%ebp),%eax
    2419:	89 04 24             	mov    %eax,(%esp)
    241c:	8b 45 0c             	mov    0xc(%ebp),%eax
    241f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2423:	8b 45 10             	mov    0x10(%ebp),%eax
    2426:	89 44 24 08          	mov    %eax,0x8(%esp)
    242a:	e8 86 fa ff ff       	call   1eb5 <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    242f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2433:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    2437:	7e a2                	jle    23db <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    2439:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    243d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2441:	8b 45 20             	mov    0x20(%ebp),%eax
    2444:	83 c0 10             	add    $0x10,%eax
    2447:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    244a:	0f 8f 17 ff ff ff    	jg     2367 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    2450:	eb 7b                	jmp    24cd <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    2452:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2456:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    245a:	0f b6 c0             	movzbl %al,%eax
    245d:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2460:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2464:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    2467:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    246b:	89 54 24 10          	mov    %edx,0x10(%esp)
    246f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2473:	8b 45 08             	mov    0x8(%ebp),%eax
    2476:	89 04 24             	mov    %eax,(%esp)
    2479:	8b 45 0c             	mov    0xc(%ebp),%eax
    247c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2480:	8b 45 10             	mov    0x10(%ebp),%eax
    2483:	89 44 24 08          	mov    %eax,0x8(%esp)
    2487:	e8 af fd ff ff       	call   223b <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    248c:	8b 45 1c             	mov    0x1c(%ebp),%eax
    248f:	8d 58 08             	lea    0x8(%eax),%ebx
    2492:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2496:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    249a:	66 c1 f8 08          	sar    $0x8,%ax
    249e:	0f b6 c0             	movzbl %al,%eax
    24a1:	8b 4d 20             	mov    0x20(%ebp),%ecx
    24a4:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    24a8:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    24ac:	89 54 24 10          	mov    %edx,0x10(%esp)
    24b0:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24b4:	8b 45 08             	mov    0x8(%ebp),%eax
    24b7:	89 04 24             	mov    %eax,(%esp)
    24ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    24bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    24c1:	8b 45 10             	mov    0x10(%ebp),%eax
    24c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    24c8:	e8 6e fd ff ff       	call   223b <put_ascii>
	}
}
    24cd:	83 c4 34             	add    $0x34,%esp
    24d0:	5b                   	pop    %ebx
    24d1:	5d                   	pop    %ebp
    24d2:	c3                   	ret    

000024d3 <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    24d3:	55                   	push   %ebp
    24d4:	89 e5                	mov    %esp,%ebp
    24d6:	83 ec 38             	sub    $0x38,%esp
    24d9:	8b 45 18             	mov    0x18(%ebp),%eax
    24dc:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    24e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    24e7:	8b 45 14             	mov    0x14(%ebp),%eax
    24ea:	89 04 24             	mov    %eax,(%esp)
    24ed:	e8 c4 15 00 00       	call   3ab6 <strlen>
    24f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    24f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    24fc:	8b 45 1c             	mov    0x1c(%ebp),%eax
    24ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2502:	eb 49                	jmp    254d <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    2504:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    2508:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    250b:	8b 45 14             	mov    0x14(%ebp),%eax
    250e:	01 c8                	add    %ecx,%eax
    2510:	0f b6 00             	movzbl (%eax),%eax
    2513:	0f b6 c0             	movzbl %al,%eax
    2516:	8b 4d 20             	mov    0x20(%ebp),%ecx
    2519:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    251d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    2520:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2524:	89 54 24 10          	mov    %edx,0x10(%esp)
    2528:	89 44 24 0c          	mov    %eax,0xc(%esp)
    252c:	8b 45 08             	mov    0x8(%ebp),%eax
    252f:	89 04 24             	mov    %eax,(%esp)
    2532:	8b 45 0c             	mov    0xc(%ebp),%eax
    2535:	89 44 24 04          	mov    %eax,0x4(%esp)
    2539:	8b 45 10             	mov    0x10(%ebp),%eax
    253c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2540:	e8 f6 fc ff ff       	call   223b <put_ascii>
			xTmp += 8;
    2545:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    2549:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    254d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2550:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2553:	72 af                	jb     2504 <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    2555:	c9                   	leave  
    2556:	c3                   	ret    

00002557 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    2557:	55                   	push   %ebp
    2558:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    255a:	8b 45 10             	mov    0x10(%ebp),%eax
    255d:	8d 50 07             	lea    0x7(%eax),%edx
    2560:	85 c0                	test   %eax,%eax
    2562:	0f 48 c2             	cmovs  %edx,%eax
    2565:	c1 f8 03             	sar    $0x3,%eax
    2568:	89 c2                	mov    %eax,%edx
    256a:	8b 45 0c             	mov    0xc(%ebp),%eax
    256d:	8d 48 03             	lea    0x3(%eax),%ecx
    2570:	85 c0                	test   %eax,%eax
    2572:	0f 48 c1             	cmovs  %ecx,%eax
    2575:	c1 f8 02             	sar    $0x2,%eax
    2578:	c1 e0 05             	shl    $0x5,%eax
    257b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    257e:	8b 45 08             	mov    0x8(%ebp),%eax
    2581:	8d 50 07             	lea    0x7(%eax),%edx
    2584:	85 c0                	test   %eax,%eax
    2586:	0f 48 c2             	cmovs  %edx,%eax
    2589:	c1 f8 03             	sar    $0x3,%eax
    258c:	c1 e0 0b             	shl    $0xb,%eax
    258f:	01 c8                	add    %ecx,%eax
}
    2591:	5d                   	pop    %ebp
    2592:	c3                   	ret    

00002593 <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    2593:	55                   	push   %ebp
    2594:	89 e5                	mov    %esp,%ebp
    2596:	53                   	push   %ebx
    2597:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    259a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    25a1:	e9 b1 00 00 00       	jmp    2657 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    25a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    25ad:	e9 95 00 00 00       	jmp    2647 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    25b2:	8b 55 14             	mov    0x14(%ebp),%edx
    25b5:	8b 45 18             	mov    0x18(%ebp),%eax
    25b8:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    25bc:	89 c1                	mov    %eax,%ecx
    25be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    25c1:	01 c8                	add    %ecx,%eax
    25c3:	c1 e0 02             	shl    $0x2,%eax
    25c6:	01 d0                	add    %edx,%eax
    25c8:	8b 00                	mov    (%eax),%eax
    25ca:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    25cd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    25d1:	3c 01                	cmp    $0x1,%al
    25d3:	75 02                	jne    25d7 <draw_picture+0x44>
    25d5:	eb 6c                	jmp    2643 <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    25d7:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    25db:	0f b6 c8             	movzbl %al,%ecx
    25de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    25e2:	0f b6 d0             	movzbl %al,%edx
    25e5:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    25e9:	0f b6 c0             	movzbl %al,%eax
    25ec:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    25f0:	89 54 24 04          	mov    %edx,0x4(%esp)
    25f4:	89 04 24             	mov    %eax,(%esp)
    25f7:	e8 5b ff ff ff       	call   2557 <_RGB16BIT565>
    25fc:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    2600:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    2604:	8b 45 1c             	mov    0x1c(%ebp),%eax
    2607:	83 e8 01             	sub    $0x1,%eax
    260a:	2b 45 f8             	sub    -0x8(%ebp),%eax
    260d:	89 c2                	mov    %eax,%edx
    260f:	8b 45 24             	mov    0x24(%ebp),%eax
    2612:	01 d0                	add    %edx,%eax
    2614:	89 c2                	mov    %eax,%edx
    2616:	8b 45 20             	mov    0x20(%ebp),%eax
    2619:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    261c:	01 d8                	add    %ebx,%eax
    261e:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    2622:	89 54 24 10          	mov    %edx,0x10(%esp)
    2626:	89 44 24 0c          	mov    %eax,0xc(%esp)
    262a:	8b 45 08             	mov    0x8(%ebp),%eax
    262d:	89 04 24             	mov    %eax,(%esp)
    2630:	8b 45 0c             	mov    0xc(%ebp),%eax
    2633:	89 44 24 04          	mov    %eax,0x4(%esp)
    2637:	8b 45 10             	mov    0x10(%ebp),%eax
    263a:	89 44 24 08          	mov    %eax,0x8(%esp)
    263e:	e8 72 f8 ff ff       	call   1eb5 <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    2643:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2647:	8b 45 18             	mov    0x18(%ebp),%eax
    264a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    264d:	0f 8f 5f ff ff ff    	jg     25b2 <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    2653:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2657:	8b 45 1c             	mov    0x1c(%ebp),%eax
    265a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    265d:	0f 8f 43 ff ff ff    	jg     25a6 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    2663:	83 c4 28             	add    $0x28,%esp
    2666:	5b                   	pop    %ebx
    2667:	5d                   	pop    %ebp
    2668:	c3                   	ret    

00002669 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    2669:	55                   	push   %ebp
    266a:	89 e5                	mov    %esp,%ebp
    266c:	83 ec 3c             	sub    $0x3c,%esp
    266f:	8b 45 24             	mov    0x24(%ebp),%eax
    2672:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    2676:	8b 45 14             	mov    0x14(%ebp),%eax
    2679:	8b 55 1c             	mov    0x1c(%ebp),%edx
    267c:	29 c2                	sub    %eax,%edx
    267e:	89 d0                	mov    %edx,%eax
    2680:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    2683:	8b 45 18             	mov    0x18(%ebp),%eax
    2686:	8b 55 20             	mov    0x20(%ebp),%edx
    2689:	29 c2                	sub    %eax,%edx
    268b:	89 d0                	mov    %edx,%eax
    268d:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    2690:	8b 45 14             	mov    0x14(%ebp),%eax
    2693:	c1 e0 0a             	shl    $0xa,%eax
    2696:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    2699:	8b 45 18             	mov    0x18(%ebp),%eax
    269c:	c1 e0 0a             	shl    $0xa,%eax
    269f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    26a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26a5:	c1 f8 1f             	sar    $0x1f,%eax
    26a8:	31 45 fc             	xor    %eax,-0x4(%ebp)
    26ab:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    26ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
    26b1:	c1 f8 1f             	sar    $0x1f,%eax
    26b4:	31 45 f8             	xor    %eax,-0x8(%ebp)
    26b7:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    26ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26bd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    26c0:	7c 57                	jl     2719 <draw_line+0xb0>
		len = dx + 1;
    26c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    26c5:	83 c0 01             	add    $0x1,%eax
    26c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    26cb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    26ce:	3b 45 14             	cmp    0x14(%ebp),%eax
    26d1:	7e 07                	jle    26da <draw_line+0x71>
    26d3:	b8 00 04 00 00       	mov    $0x400,%eax
    26d8:	eb 05                	jmp    26df <draw_line+0x76>
    26da:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    26df:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    26e2:	8b 45 20             	mov    0x20(%ebp),%eax
    26e5:	3b 45 18             	cmp    0x18(%ebp),%eax
    26e8:	7c 16                	jl     2700 <draw_line+0x97>
    26ea:	8b 45 18             	mov    0x18(%ebp),%eax
    26ed:	8b 55 20             	mov    0x20(%ebp),%edx
    26f0:	29 c2                	sub    %eax,%edx
    26f2:	89 d0                	mov    %edx,%eax
    26f4:	83 c0 01             	add    $0x1,%eax
    26f7:	c1 e0 0a             	shl    $0xa,%eax
    26fa:	99                   	cltd   
    26fb:	f7 7d ec             	idivl  -0x14(%ebp)
    26fe:	eb 14                	jmp    2714 <draw_line+0xab>
    2700:	8b 45 18             	mov    0x18(%ebp),%eax
    2703:	8b 55 20             	mov    0x20(%ebp),%edx
    2706:	29 c2                	sub    %eax,%edx
    2708:	89 d0                	mov    %edx,%eax
    270a:	83 e8 01             	sub    $0x1,%eax
    270d:	c1 e0 0a             	shl    $0xa,%eax
    2710:	99                   	cltd   
    2711:	f7 7d ec             	idivl  -0x14(%ebp)
    2714:	89 45 f8             	mov    %eax,-0x8(%ebp)
    2717:	eb 55                	jmp    276e <draw_line+0x105>
	}
	else {
		len = dy + 1;
    2719:	8b 45 f8             	mov    -0x8(%ebp),%eax
    271c:	83 c0 01             	add    $0x1,%eax
    271f:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    2722:	8b 45 20             	mov    0x20(%ebp),%eax
    2725:	3b 45 18             	cmp    0x18(%ebp),%eax
    2728:	7e 07                	jle    2731 <draw_line+0xc8>
    272a:	b8 00 04 00 00       	mov    $0x400,%eax
    272f:	eb 05                	jmp    2736 <draw_line+0xcd>
    2731:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    2736:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    2739:	8b 45 1c             	mov    0x1c(%ebp),%eax
    273c:	3b 45 14             	cmp    0x14(%ebp),%eax
    273f:	7c 16                	jl     2757 <draw_line+0xee>
    2741:	8b 45 14             	mov    0x14(%ebp),%eax
    2744:	8b 55 1c             	mov    0x1c(%ebp),%edx
    2747:	29 c2                	sub    %eax,%edx
    2749:	89 d0                	mov    %edx,%eax
    274b:	83 c0 01             	add    $0x1,%eax
    274e:	c1 e0 0a             	shl    $0xa,%eax
    2751:	99                   	cltd   
    2752:	f7 7d ec             	idivl  -0x14(%ebp)
    2755:	eb 14                	jmp    276b <draw_line+0x102>
    2757:	8b 45 14             	mov    0x14(%ebp),%eax
    275a:	8b 55 1c             	mov    0x1c(%ebp),%edx
    275d:	29 c2                	sub    %eax,%edx
    275f:	89 d0                	mov    %edx,%eax
    2761:	83 e8 01             	sub    $0x1,%eax
    2764:	c1 e0 0a             	shl    $0xa,%eax
    2767:	99                   	cltd   
    2768:	f7 7d ec             	idivl  -0x14(%ebp)
    276b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    276e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2775:	eb 47                	jmp    27be <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    2777:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    277b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    277e:	c1 f8 0a             	sar    $0xa,%eax
    2781:	89 c2                	mov    %eax,%edx
    2783:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2786:	c1 f8 0a             	sar    $0xa,%eax
    2789:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    278d:	89 54 24 10          	mov    %edx,0x10(%esp)
    2791:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2795:	8b 45 08             	mov    0x8(%ebp),%eax
    2798:	89 04 24             	mov    %eax,(%esp)
    279b:	8b 45 0c             	mov    0xc(%ebp),%eax
    279e:	89 44 24 04          	mov    %eax,0x4(%esp)
    27a2:	8b 45 10             	mov    0x10(%ebp),%eax
    27a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    27a9:	e8 07 f7 ff ff       	call   1eb5 <draw_point>
		y += dy;
    27ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
    27b1:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    27b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    27b7:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    27ba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    27be:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27c1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    27c4:	7c b1                	jl     2777 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    27c6:	c9                   	leave  
    27c7:	c3                   	ret    

000027c8 <draw_window>:

void
draw_window(Context c, char *title)
{
    27c8:	55                   	push   %ebp
    27c9:	89 e5                	mov    %esp,%ebp
    27cb:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    27ce:	8b 45 0c             	mov    0xc(%ebp),%eax
    27d1:	83 e8 01             	sub    $0x1,%eax
    27d4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    27db:	00 
    27dc:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    27e3:	00 
    27e4:	89 44 24 14          	mov    %eax,0x14(%esp)
    27e8:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    27ef:	00 
    27f0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    27f7:	00 
    27f8:	8b 45 08             	mov    0x8(%ebp),%eax
    27fb:	89 04 24             	mov    %eax,(%esp)
    27fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    2801:	89 44 24 04          	mov    %eax,0x4(%esp)
    2805:	8b 45 10             	mov    0x10(%ebp),%eax
    2808:	89 44 24 08          	mov    %eax,0x8(%esp)
    280c:	e8 58 fe ff ff       	call   2669 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    2811:	8b 45 10             	mov    0x10(%ebp),%eax
    2814:	8d 48 ff             	lea    -0x1(%eax),%ecx
    2817:	8b 45 0c             	mov    0xc(%ebp),%eax
    281a:	8d 50 ff             	lea    -0x1(%eax),%edx
    281d:	8b 45 0c             	mov    0xc(%ebp),%eax
    2820:	83 e8 01             	sub    $0x1,%eax
    2823:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    282a:	00 
    282b:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    282f:	89 54 24 14          	mov    %edx,0x14(%esp)
    2833:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    283a:	00 
    283b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    283f:	8b 45 08             	mov    0x8(%ebp),%eax
    2842:	89 04 24             	mov    %eax,(%esp)
    2845:	8b 45 0c             	mov    0xc(%ebp),%eax
    2848:	89 44 24 04          	mov    %eax,0x4(%esp)
    284c:	8b 45 10             	mov    0x10(%ebp),%eax
    284f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2853:	e8 11 fe ff ff       	call   2669 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    2858:	8b 45 10             	mov    0x10(%ebp),%eax
    285b:	8d 48 ff             	lea    -0x1(%eax),%ecx
    285e:	8b 45 10             	mov    0x10(%ebp),%eax
    2861:	8d 50 ff             	lea    -0x1(%eax),%edx
    2864:	8b 45 0c             	mov    0xc(%ebp),%eax
    2867:	83 e8 01             	sub    $0x1,%eax
    286a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    2871:	00 
    2872:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    2876:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    287d:	00 
    287e:	89 54 24 10          	mov    %edx,0x10(%esp)
    2882:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2886:	8b 45 08             	mov    0x8(%ebp),%eax
    2889:	89 04 24             	mov    %eax,(%esp)
    288c:	8b 45 0c             	mov    0xc(%ebp),%eax
    288f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2893:	8b 45 10             	mov    0x10(%ebp),%eax
    2896:	89 44 24 08          	mov    %eax,0x8(%esp)
    289a:	e8 ca fd ff ff       	call   2669 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    289f:	8b 45 10             	mov    0x10(%ebp),%eax
    28a2:	83 e8 01             	sub    $0x1,%eax
    28a5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    28ac:	00 
    28ad:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    28b4:	00 
    28b5:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    28bc:	00 
    28bd:	89 44 24 10          	mov    %eax,0x10(%esp)
    28c1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    28c8:	00 
    28c9:	8b 45 08             	mov    0x8(%ebp),%eax
    28cc:	89 04 24             	mov    %eax,(%esp)
    28cf:	8b 45 0c             	mov    0xc(%ebp),%eax
    28d2:	89 44 24 04          	mov    %eax,0x4(%esp)
    28d6:	8b 45 10             	mov    0x10(%ebp),%eax
    28d9:	89 44 24 08          	mov    %eax,0x8(%esp)
    28dd:	e8 87 fd ff ff       	call   2669 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    28e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    28e5:	83 e8 02             	sub    $0x2,%eax
    28e8:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    28ef:	00 
    28f0:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    28f7:	00 
    28f8:	89 44 24 14          	mov    %eax,0x14(%esp)
    28fc:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    2903:	00 
    2904:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    290b:	00 
    290c:	8b 45 08             	mov    0x8(%ebp),%eax
    290f:	89 04 24             	mov    %eax,(%esp)
    2912:	8b 45 0c             	mov    0xc(%ebp),%eax
    2915:	89 44 24 04          	mov    %eax,0x4(%esp)
    2919:	8b 45 10             	mov    0x10(%ebp),%eax
    291c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2920:	e8 cf f5 ff ff       	call   1ef4 <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    2925:	8b 45 0c             	mov    0xc(%ebp),%eax
    2928:	83 e8 02             	sub    $0x2,%eax
    292b:	89 c2                	mov    %eax,%edx
    292d:	8b 45 10             	mov    0x10(%ebp),%eax
    2930:	83 e8 15             	sub    $0x15,%eax
    2933:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    293a:	00 
    293b:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    2942:	00 
    2943:	89 54 24 14          	mov    %edx,0x14(%esp)
    2947:	89 44 24 10          	mov    %eax,0x10(%esp)
    294b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    2952:	00 
    2953:	8b 45 08             	mov    0x8(%ebp),%eax
    2956:	89 04 24             	mov    %eax,(%esp)
    2959:	8b 45 0c             	mov    0xc(%ebp),%eax
    295c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2960:	8b 45 10             	mov    0x10(%ebp),%eax
    2963:	89 44 24 08          	mov    %eax,0x8(%esp)
    2967:	e8 88 f5 ff ff       	call   1ef4 <fill_rect>

  loadBitmap(&pic, "close.bmp");
    296c:	c7 44 24 04 df 8b 00 	movl   $0x8bdf,0x4(%esp)
    2973:	00 
    2974:	8d 45 ec             	lea    -0x14(%ebp),%eax
    2977:	89 04 24             	mov    %eax,(%esp)
    297a:	e8 44 01 00 00       	call   2ac3 <loadBitmap>
  draw_picture(c, pic, 3, 3);
    297f:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    2986:	00 
    2987:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    298e:	00 
    298f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2992:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2996:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2999:	89 44 24 10          	mov    %eax,0x10(%esp)
    299d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    29a0:	89 44 24 14          	mov    %eax,0x14(%esp)
    29a4:	8b 45 08             	mov    0x8(%ebp),%eax
    29a7:	89 04 24             	mov    %eax,(%esp)
    29aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    29ad:	89 44 24 04          	mov    %eax,0x4(%esp)
    29b1:	8b 45 10             	mov    0x10(%ebp),%eax
    29b4:	89 44 24 08          	mov    %eax,0x8(%esp)
    29b8:	e8 d6 fb ff ff       	call   2593 <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    29bd:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    29c4:	00 
    29c5:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    29cc:	00 
    29cd:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    29d4:	00 
    29d5:	8b 45 14             	mov    0x14(%ebp),%eax
    29d8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    29dc:	8b 45 08             	mov    0x8(%ebp),%eax
    29df:	89 04 24             	mov    %eax,(%esp)
    29e2:	8b 45 0c             	mov    0xc(%ebp),%eax
    29e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    29e9:	8b 45 10             	mov    0x10(%ebp),%eax
    29ec:	89 44 24 08          	mov    %eax,0x8(%esp)
    29f0:	e8 de fa ff ff       	call   24d3 <puts_str>
  freepic(&pic);
    29f5:	8d 45 ec             	lea    -0x14(%ebp),%eax
    29f8:	89 04 24             	mov    %eax,(%esp)
    29fb:	e8 6f 06 00 00       	call   306f <freepic>
}
    2a00:	c9                   	leave  
    2a01:	c3                   	ret    

00002a02 <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    2a02:	55                   	push   %ebp
    2a03:	89 e5                	mov    %esp,%ebp
    2a05:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    2a08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2a0f:	eb 29                	jmp    2a3a <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    2a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a14:	6b d0 34             	imul   $0x34,%eax,%edx
    2a17:	8b 45 08             	mov    0x8(%ebp),%eax
    2a1a:	01 d0                	add    %edx,%eax
    2a1c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2a1f:	6b ca 34             	imul   $0x34,%edx,%ecx
    2a22:	8b 55 08             	mov    0x8(%ebp),%edx
    2a25:	01 ca                	add    %ecx,%edx
    2a27:	83 c2 28             	add    $0x28,%edx
    2a2a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2a2e:	89 14 24             	mov    %edx,(%esp)
    2a31:	e8 8d 00 00 00       	call   2ac3 <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    2a36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a3d:	3b 45 0c             	cmp    0xc(%ebp),%eax
    2a40:	7c cf                	jl     2a11 <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    2a42:	c9                   	leave  
    2a43:	c3                   	ret    

00002a44 <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    2a44:	55                   	push   %ebp
    2a45:	89 e5                	mov    %esp,%ebp
    2a47:	53                   	push   %ebx
    2a48:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    2a4b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    2a52:	eb 61                	jmp    2ab5 <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    2a54:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a57:	6b d0 34             	imul   $0x34,%eax,%edx
    2a5a:	8b 45 14             	mov    0x14(%ebp),%eax
    2a5d:	01 d0                	add    %edx,%eax
    2a5f:	8b 48 24             	mov    0x24(%eax),%ecx
    2a62:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a65:	6b d0 34             	imul   $0x34,%eax,%edx
    2a68:	8b 45 14             	mov    0x14(%ebp),%eax
    2a6b:	01 d0                	add    %edx,%eax
    2a6d:	8b 50 20             	mov    0x20(%eax),%edx
    2a70:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2a73:	6b d8 34             	imul   $0x34,%eax,%ebx
    2a76:	8b 45 14             	mov    0x14(%ebp),%eax
    2a79:	01 d8                	add    %ebx,%eax
    2a7b:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    2a7f:	89 54 24 18          	mov    %edx,0x18(%esp)
    2a83:	8b 50 28             	mov    0x28(%eax),%edx
    2a86:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2a8a:	8b 50 2c             	mov    0x2c(%eax),%edx
    2a8d:	89 54 24 10          	mov    %edx,0x10(%esp)
    2a91:	8b 40 30             	mov    0x30(%eax),%eax
    2a94:	89 44 24 14          	mov    %eax,0x14(%esp)
    2a98:	8b 45 08             	mov    0x8(%ebp),%eax
    2a9b:	89 04 24             	mov    %eax,(%esp)
    2a9e:	8b 45 0c             	mov    0xc(%ebp),%eax
    2aa1:	89 44 24 04          	mov    %eax,0x4(%esp)
    2aa5:	8b 45 10             	mov    0x10(%ebp),%eax
    2aa8:	89 44 24 08          	mov    %eax,0x8(%esp)
    2aac:	e8 e2 fa ff ff       	call   2593 <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    2ab1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    2ab5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    2ab8:	3b 45 18             	cmp    0x18(%ebp),%eax
    2abb:	7c 97                	jl     2a54 <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    2abd:	83 c4 30             	add    $0x30,%esp
    2ac0:	5b                   	pop    %ebx
    2ac1:	5d                   	pop    %ebp
    2ac2:	c3                   	ret    

00002ac3 <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    2ac3:	55                   	push   %ebp
    2ac4:	89 e5                	mov    %esp,%ebp
    2ac6:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    2acc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    2ad3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ada:	00 
    2adb:	8b 45 0c             	mov    0xc(%ebp),%eax
    2ade:	89 04 24             	mov    %eax,(%esp)
    2ae1:	e8 e4 11 00 00       	call   3cca <open>
    2ae6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2ae9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2aed:	79 20                	jns    2b0f <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    2aef:	8b 45 0c             	mov    0xc(%ebp),%eax
    2af2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2af6:	c7 44 24 04 ec 8b 00 	movl   $0x8bec,0x4(%esp)
    2afd:	00 
    2afe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b05:	e8 68 13 00 00       	call   3e72 <printf>
		return;
    2b0a:	e9 ef 02 00 00       	jmp    2dfe <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    2b0f:	8b 45 0c             	mov    0xc(%ebp),%eax
    2b12:	89 44 24 08          	mov    %eax,0x8(%esp)
    2b16:	c7 44 24 04 fc 8b 00 	movl   $0x8bfc,0x4(%esp)
    2b1d:	00 
    2b1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b25:	e8 48 13 00 00       	call   3e72 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    2b2a:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    2b31:	e8 28 16 00 00       	call   415e <malloc>
    2b36:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    2b39:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    2b40:	00 
    2b41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b44:	89 44 24 04          	mov    %eax,0x4(%esp)
    2b48:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b4b:	89 04 24             	mov    %eax,(%esp)
    2b4e:	e8 4f 11 00 00       	call   3ca2 <read>
    2b53:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    2b56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b59:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    2b5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2b5f:	0f b7 00             	movzwl (%eax),%eax
    2b62:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    2b66:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    2b6a:	66 3d 42 4d          	cmp    $0x4d42,%ax
    2b6e:	74 19                	je     2b89 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    2b70:	c7 44 24 04 10 8c 00 	movl   $0x8c10,0x4(%esp)
    2b77:	00 
    2b78:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b7f:	e8 ee 12 00 00       	call   3e72 <printf>
		return;
    2b84:	e9 75 02 00 00       	jmp    2dfe <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    2b89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b8c:	83 c0 02             	add    $0x2,%eax
    2b8f:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    2b92:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2b95:	8b 00                	mov    (%eax),%eax
    2b97:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2b9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2b9d:	83 c0 06             	add    $0x6,%eax
    2ba0:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    2ba3:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2ba6:	0f b7 00             	movzwl (%eax),%eax
    2ba9:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2bad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bb0:	83 c0 08             	add    $0x8,%eax
    2bb3:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    2bb6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2bb9:	0f b7 00             	movzwl (%eax),%eax
    2bbc:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    2bc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bc3:	83 c0 0a             	add    $0xa,%eax
    2bc6:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    2bc9:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2bcc:	8b 00                	mov    (%eax),%eax
    2bce:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    2bd1:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    2bd8:	00 
    2bd9:	8d 45 84             	lea    -0x7c(%ebp),%eax
    2bdc:	89 44 24 04          	mov    %eax,0x4(%esp)
    2be0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2be3:	89 04 24             	mov    %eax,(%esp)
    2be6:	e8 b7 10 00 00       	call   3ca2 <read>
	width = bitInfoHead.biWidth;
    2beb:	8b 45 88             	mov    -0x78(%ebp),%eax
    2bee:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    2bf1:	8b 45 8c             	mov    -0x74(%ebp),%eax
    2bf4:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    2bf7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2bfa:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    2bfe:	c1 e0 02             	shl    $0x2,%eax
    2c01:	89 44 24 10          	mov    %eax,0x10(%esp)
    2c05:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c08:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2c0c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2c0f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c13:	c7 44 24 04 28 8c 00 	movl   $0x8c28,0x4(%esp)
    2c1a:	00 
    2c1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c22:	e8 4b 12 00 00       	call   3e72 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    2c27:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    2c2b:	75 14                	jne    2c41 <loadBitmap+0x17e>
		printf(0, "0");
    2c2d:	c7 44 24 04 4d 8c 00 	movl   $0x8c4d,0x4(%esp)
    2c34:	00 
    2c35:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c3c:	e8 31 12 00 00       	call   3e72 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    2c41:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2c45:	0f b7 c0             	movzwl %ax,%eax
    2c48:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    2c4c:	83 c0 1f             	add    $0x1f,%eax
    2c4f:	8d 50 1f             	lea    0x1f(%eax),%edx
    2c52:	85 c0                	test   %eax,%eax
    2c54:	0f 48 c2             	cmovs  %edx,%eax
    2c57:	c1 f8 05             	sar    $0x5,%eax
    2c5a:	c1 e0 02             	shl    $0x2,%eax
    2c5d:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    2c60:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c63:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c67:	89 04 24             	mov    %eax,(%esp)
    2c6a:	e8 ef 14 00 00       	call   415e <malloc>
    2c6f:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    2c72:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2c75:	8b 45 cc             	mov    -0x34(%ebp),%eax
    2c78:	0f af c2             	imul   %edx,%eax
    2c7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2c7f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c86:	00 
    2c87:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2c8a:	89 04 24             	mov    %eax,(%esp)
    2c8d:	e8 4b 0e 00 00       	call   3add <memset>
	long nData = height * l_width;
    2c92:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2c95:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2c99:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    2c9c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    2c9f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ca3:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2ca6:	89 44 24 04          	mov    %eax,0x4(%esp)
    2caa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cad:	89 04 24             	mov    %eax,(%esp)
    2cb0:	e8 ed 0f 00 00       	call   3ca2 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    2cb5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2cb8:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    2cbc:	c1 e0 02             	shl    $0x2,%eax
    2cbf:	89 04 24             	mov    %eax,(%esp)
    2cc2:	e8 97 14 00 00       	call   415e <malloc>
    2cc7:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    2cca:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2ccd:	8b 45 d0             	mov    -0x30(%ebp),%eax
    2cd0:	0f af c2             	imul   %edx,%eax
    2cd3:	c1 e0 02             	shl    $0x2,%eax
    2cd6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cda:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ce1:	00 
    2ce2:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2ce5:	89 04 24             	mov    %eax,(%esp)
    2ce8:	e8 f0 0d 00 00       	call   3add <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    2ced:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    2cf1:	66 83 f8 17          	cmp    $0x17,%ax
    2cf5:	77 19                	ja     2d10 <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    2cf7:	c7 44 24 04 50 8c 00 	movl   $0x8c50,0x4(%esp)
    2cfe:	00 
    2cff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d06:	e8 67 11 00 00       	call   3e72 <printf>
		return;
    2d0b:	e9 ee 00 00 00       	jmp    2dfe <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    2d10:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    2d17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2d1e:	e9 94 00 00 00       	jmp    2db7 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    2d23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2d2a:	eb 7b                	jmp    2da7 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    2d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d2f:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    2d33:	89 c1                	mov    %eax,%ecx
    2d35:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2d38:	89 d0                	mov    %edx,%eax
    2d3a:	01 c0                	add    %eax,%eax
    2d3c:	01 d0                	add    %edx,%eax
    2d3e:	01 c8                	add    %ecx,%eax
    2d40:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    2d43:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d46:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d4d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d50:	01 c2                	add    %eax,%edx
    2d52:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2d55:	8d 48 02             	lea    0x2(%eax),%ecx
    2d58:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d5b:	01 c8                	add    %ecx,%eax
    2d5d:	0f b6 00             	movzbl (%eax),%eax
    2d60:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    2d63:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d66:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d6d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d70:	01 c2                	add    %eax,%edx
    2d72:	8b 45 bc             	mov    -0x44(%ebp),%eax
    2d75:	8d 48 01             	lea    0x1(%eax),%ecx
    2d78:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d7b:	01 c8                	add    %ecx,%eax
    2d7d:	0f b6 00             	movzbl (%eax),%eax
    2d80:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    2d83:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2d86:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    2d8d:	8b 45 c0             	mov    -0x40(%ebp),%eax
    2d90:	01 c2                	add    %eax,%edx
    2d92:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    2d95:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2d98:	01 c8                	add    %ecx,%eax
    2d9a:	0f b6 00             	movzbl (%eax),%eax
    2d9d:	88 02                	mov    %al,(%edx)
				index++;
    2d9f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    2da3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2da7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2daa:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    2dad:	0f 8c 79 ff ff ff    	jl     2d2c <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    2db3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2db7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2dba:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    2dbd:	0f 8c 60 ff ff ff    	jl     2d23 <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    2dc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2dc6:	89 04 24             	mov    %eax,(%esp)
    2dc9:	e8 e4 0e 00 00       	call   3cb2 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    2dce:	8b 45 08             	mov    0x8(%ebp),%eax
    2dd1:	8b 55 c0             	mov    -0x40(%ebp),%edx
    2dd4:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    2dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    2dd9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    2ddc:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    2ddf:	8b 45 08             	mov    0x8(%ebp),%eax
    2de2:	8b 55 d0             	mov    -0x30(%ebp),%edx
    2de5:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    2de8:	8b 45 c8             	mov    -0x38(%ebp),%eax
    2deb:	89 04 24             	mov    %eax,(%esp)
    2dee:	e8 32 12 00 00       	call   4025 <free>
	free(BmpFileHeader);
    2df3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2df6:	89 04 24             	mov    %eax,(%esp)
    2df9:	e8 27 12 00 00       	call   4025 <free>
	//printf("\n");
}
    2dfe:	c9                   	leave  
    2dff:	c3                   	ret    

00002e00 <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    2e00:	55                   	push   %ebp
    2e01:	89 e5                	mov    %esp,%ebp
    2e03:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    2e06:	c7 44 24 04 70 8c 00 	movl   $0x8c70,0x4(%esp)
    2e0d:	00 
    2e0e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e15:	e8 58 10 00 00       	call   3e72 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    2e1a:	8b 45 08             	mov    0x8(%ebp),%eax
    2e1d:	0f b7 00             	movzwl (%eax),%eax
    2e20:	0f b7 c0             	movzwl %ax,%eax
    2e23:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e27:	c7 44 24 04 82 8c 00 	movl   $0x8c82,0x4(%esp)
    2e2e:	00 
    2e2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e36:	e8 37 10 00 00       	call   3e72 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    2e3b:	8b 45 08             	mov    0x8(%ebp),%eax
    2e3e:	8b 40 04             	mov    0x4(%eax),%eax
    2e41:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e45:	c7 44 24 04 a0 8c 00 	movl   $0x8ca0,0x4(%esp)
    2e4c:	00 
    2e4d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e54:	e8 19 10 00 00       	call   3e72 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    2e59:	8b 45 08             	mov    0x8(%ebp),%eax
    2e5c:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    2e60:	0f b7 c0             	movzwl %ax,%eax
    2e63:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e67:	c7 44 24 04 b1 8c 00 	movl   $0x8cb1,0x4(%esp)
    2e6e:	00 
    2e6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e76:	e8 f7 0f 00 00       	call   3e72 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    2e7b:	8b 45 08             	mov    0x8(%ebp),%eax
    2e7e:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    2e82:	0f b7 c0             	movzwl %ax,%eax
    2e85:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e89:	c7 44 24 04 b1 8c 00 	movl   $0x8cb1,0x4(%esp)
    2e90:	00 
    2e91:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e98:	e8 d5 0f 00 00       	call   3e72 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    2e9d:	8b 45 08             	mov    0x8(%ebp),%eax
    2ea0:	8b 40 0c             	mov    0xc(%eax),%eax
    2ea3:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ea7:	c7 44 24 04 c0 8c 00 	movl   $0x8cc0,0x4(%esp)
    2eae:	00 
    2eaf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eb6:	e8 b7 0f 00 00       	call   3e72 <printf>
}
    2ebb:	c9                   	leave  
    2ebc:	c3                   	ret    

00002ebd <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    2ebd:	55                   	push   %ebp
    2ebe:	89 e5                	mov    %esp,%ebp
    2ec0:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    2ec3:	c7 44 24 04 e9 8c 00 	movl   $0x8ce9,0x4(%esp)
    2eca:	00 
    2ecb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ed2:	e8 9b 0f 00 00       	call   3e72 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    2ed7:	8b 45 08             	mov    0x8(%ebp),%eax
    2eda:	8b 00                	mov    (%eax),%eax
    2edc:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ee0:	c7 44 24 04 fb 8c 00 	movl   $0x8cfb,0x4(%esp)
    2ee7:	00 
    2ee8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2eef:	e8 7e 0f 00 00       	call   3e72 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    2ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    2ef7:	8b 40 04             	mov    0x4(%eax),%eax
    2efa:	89 44 24 08          	mov    %eax,0x8(%esp)
    2efe:	c7 44 24 04 12 8d 00 	movl   $0x8d12,0x4(%esp)
    2f05:	00 
    2f06:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f0d:	e8 60 0f 00 00       	call   3e72 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    2f12:	8b 45 08             	mov    0x8(%ebp),%eax
    2f15:	8b 40 08             	mov    0x8(%eax),%eax
    2f18:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f1c:	c7 44 24 04 20 8d 00 	movl   $0x8d20,0x4(%esp)
    2f23:	00 
    2f24:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f2b:	e8 42 0f 00 00       	call   3e72 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    2f30:	8b 45 08             	mov    0x8(%ebp),%eax
    2f33:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    2f37:	0f b7 c0             	movzwl %ax,%eax
    2f3a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f3e:	c7 44 24 04 2e 8d 00 	movl   $0x8d2e,0x4(%esp)
    2f45:	00 
    2f46:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f4d:	e8 20 0f 00 00       	call   3e72 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    2f52:	8b 45 08             	mov    0x8(%ebp),%eax
    2f55:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    2f59:	0f b7 c0             	movzwl %ax,%eax
    2f5c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f60:	c7 44 24 04 44 8d 00 	movl   $0x8d44,0x4(%esp)
    2f67:	00 
    2f68:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f6f:	e8 fe 0e 00 00       	call   3e72 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    2f74:	8b 45 08             	mov    0x8(%ebp),%eax
    2f77:	8b 40 10             	mov    0x10(%eax),%eax
    2f7a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f7e:	c7 44 24 04 65 8d 00 	movl   $0x8d65,0x4(%esp)
    2f85:	00 
    2f86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f8d:	e8 e0 0e 00 00       	call   3e72 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    2f92:	8b 45 08             	mov    0x8(%ebp),%eax
    2f95:	8b 40 14             	mov    0x14(%eax),%eax
    2f98:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f9c:	c7 44 24 04 78 8d 00 	movl   $0x8d78,0x4(%esp)
    2fa3:	00 
    2fa4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fab:	e8 c2 0e 00 00       	call   3e72 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    2fb0:	8b 45 08             	mov    0x8(%ebp),%eax
    2fb3:	8b 40 18             	mov    0x18(%eax),%eax
    2fb6:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fba:	c7 44 24 04 ac 8d 00 	movl   $0x8dac,0x4(%esp)
    2fc1:	00 
    2fc2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fc9:	e8 a4 0e 00 00       	call   3e72 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    2fce:	8b 45 08             	mov    0x8(%ebp),%eax
    2fd1:	8b 40 1c             	mov    0x1c(%eax),%eax
    2fd4:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fd8:	c7 44 24 04 c1 8d 00 	movl   $0x8dc1,0x4(%esp)
    2fdf:	00 
    2fe0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fe7:	e8 86 0e 00 00       	call   3e72 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    2fec:	8b 45 08             	mov    0x8(%ebp),%eax
    2fef:	8b 40 20             	mov    0x20(%eax),%eax
    2ff2:	89 44 24 08          	mov    %eax,0x8(%esp)
    2ff6:	c7 44 24 04 d6 8d 00 	movl   $0x8dd6,0x4(%esp)
    2ffd:	00 
    2ffe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3005:	e8 68 0e 00 00       	call   3e72 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    300a:	8b 45 08             	mov    0x8(%ebp),%eax
    300d:	8b 40 24             	mov    0x24(%eax),%eax
    3010:	89 44 24 08          	mov    %eax,0x8(%esp)
    3014:	c7 44 24 04 ed 8d 00 	movl   $0x8ded,0x4(%esp)
    301b:	00 
    301c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3023:	e8 4a 0e 00 00       	call   3e72 <printf>
}
    3028:	c9                   	leave  
    3029:	c3                   	ret    

0000302a <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    302a:	55                   	push   %ebp
    302b:	89 e5                	mov    %esp,%ebp
    302d:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    3030:	8b 45 08             	mov    0x8(%ebp),%eax
    3033:	0f b6 00             	movzbl (%eax),%eax
    3036:	0f b6 c8             	movzbl %al,%ecx
    3039:	8b 45 08             	mov    0x8(%ebp),%eax
    303c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    3040:	0f b6 d0             	movzbl %al,%edx
    3043:	8b 45 08             	mov    0x8(%ebp),%eax
    3046:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    304a:	0f b6 c0             	movzbl %al,%eax
    304d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3051:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3055:	89 44 24 08          	mov    %eax,0x8(%esp)
    3059:	c7 44 24 04 01 8e 00 	movl   $0x8e01,0x4(%esp)
    3060:	00 
    3061:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3068:	e8 05 0e 00 00       	call   3e72 <printf>
}
    306d:	c9                   	leave  
    306e:	c3                   	ret    

0000306f <freepic>:

void freepic(PICNODE *pic) {
    306f:	55                   	push   %ebp
    3070:	89 e5                	mov    %esp,%ebp
    3072:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    3075:	8b 45 08             	mov    0x8(%ebp),%eax
    3078:	8b 00                	mov    (%eax),%eax
    307a:	89 04 24             	mov    %eax,(%esp)
    307d:	e8 a3 0f 00 00       	call   4025 <free>
}
    3082:	c9                   	leave  
    3083:	c3                   	ret    

00003084 <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    3084:	55                   	push   %ebp
    3085:	89 e5                	mov    %esp,%ebp
    3087:	53                   	push   %ebx
    3088:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    308e:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    3095:	8d 45 dc             	lea    -0x24(%ebp),%eax
    3098:	8b 55 ec             	mov    -0x14(%ebp),%edx
    309b:	89 54 24 10          	mov    %edx,0x10(%esp)
    309f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    30a2:	89 54 24 0c          	mov    %edx,0xc(%esp)
    30a6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    30ad:	00 
    30ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    30b5:	00 
    30b6:	89 04 24             	mov    %eax,(%esp)
    30b9:	e8 80 02 00 00       	call   333e <initRect>
    30be:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    30c1:	8b 45 08             	mov    0x8(%ebp),%eax
    30c4:	8b 40 04             	mov    0x4(%eax),%eax
    30c7:	2b 45 ec             	sub    -0x14(%ebp),%eax
    30ca:	89 c2                	mov    %eax,%edx
    30cc:	8d 45 cc             	lea    -0x34(%ebp),%eax
    30cf:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    30d2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    30d6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    30d9:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    30dd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    30e4:	00 
    30e5:	89 54 24 04          	mov    %edx,0x4(%esp)
    30e9:	89 04 24             	mov    %eax,(%esp)
    30ec:	e8 4d 02 00 00       	call   333e <initRect>
    30f1:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    30f4:	8b 45 08             	mov    0x8(%ebp),%eax
    30f7:	8b 40 08             	mov    0x8(%eax),%eax
    30fa:	2b 45 ec             	sub    -0x14(%ebp),%eax
    30fd:	89 c1                	mov    %eax,%ecx
    30ff:	8b 45 08             	mov    0x8(%ebp),%eax
    3102:	8b 40 04             	mov    0x4(%eax),%eax
    3105:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3108:	89 c2                	mov    %eax,%edx
    310a:	8d 45 bc             	lea    -0x44(%ebp),%eax
    310d:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3110:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    3114:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3117:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    311b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    311f:	89 54 24 04          	mov    %edx,0x4(%esp)
    3123:	89 04 24             	mov    %eax,(%esp)
    3126:	e8 13 02 00 00       	call   333e <initRect>
    312b:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    312e:	8b 45 08             	mov    0x8(%ebp),%eax
    3131:	8b 40 08             	mov    0x8(%eax),%eax
    3134:	2b 45 ec             	sub    -0x14(%ebp),%eax
    3137:	89 c2                	mov    %eax,%edx
    3139:	8d 45 ac             	lea    -0x54(%ebp),%eax
    313c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    313f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    3143:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    3146:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    314a:	89 54 24 08          	mov    %edx,0x8(%esp)
    314e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3155:	00 
    3156:	89 04 24             	mov    %eax,(%esp)
    3159:	e8 e0 01 00 00       	call   333e <initRect>
    315e:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    3161:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3168:	e9 96 01 00 00       	jmp    3303 <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    316d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3174:	e9 77 01 00 00       	jmp    32f0 <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    3179:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    317c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    317f:	89 54 24 08          	mov    %edx,0x8(%esp)
    3183:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3186:	89 54 24 04          	mov    %edx,0x4(%esp)
    318a:	89 04 24             	mov    %eax,(%esp)
    318d:	e8 85 01 00 00       	call   3317 <initPoint>
    3192:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    3195:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3198:	89 44 24 08          	mov    %eax,0x8(%esp)
    319c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    319f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    31a6:	89 44 24 10          	mov    %eax,0x10(%esp)
    31aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
    31ad:	89 44 24 14          	mov    %eax,0x14(%esp)
    31b1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    31b4:	8b 55 a8             	mov    -0x58(%ebp),%edx
    31b7:	89 04 24             	mov    %eax,(%esp)
    31ba:	89 54 24 04          	mov    %edx,0x4(%esp)
    31be:	e8 d6 01 00 00       	call   3399 <isIn>
    31c3:	85 c0                	test   %eax,%eax
    31c5:	0f 85 9a 00 00 00    	jne    3265 <set_icon_alpha+0x1e1>
    31cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    31ce:	89 44 24 08          	mov    %eax,0x8(%esp)
    31d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31d5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    31d9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    31dc:	89 44 24 10          	mov    %eax,0x10(%esp)
    31e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    31e3:	89 44 24 14          	mov    %eax,0x14(%esp)
    31e7:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    31ea:	8b 55 a8             	mov    -0x58(%ebp),%edx
    31ed:	89 04 24             	mov    %eax,(%esp)
    31f0:	89 54 24 04          	mov    %edx,0x4(%esp)
    31f4:	e8 a0 01 00 00       	call   3399 <isIn>
    31f9:	85 c0                	test   %eax,%eax
    31fb:	75 68                	jne    3265 <set_icon_alpha+0x1e1>
    31fd:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3200:	89 44 24 08          	mov    %eax,0x8(%esp)
    3204:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3207:	89 44 24 0c          	mov    %eax,0xc(%esp)
    320b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    320e:	89 44 24 10          	mov    %eax,0x10(%esp)
    3212:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3215:	89 44 24 14          	mov    %eax,0x14(%esp)
    3219:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    321c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    321f:	89 04 24             	mov    %eax,(%esp)
    3222:	89 54 24 04          	mov    %edx,0x4(%esp)
    3226:	e8 6e 01 00 00       	call   3399 <isIn>
    322b:	85 c0                	test   %eax,%eax
    322d:	75 36                	jne    3265 <set_icon_alpha+0x1e1>
    322f:	8b 45 ac             	mov    -0x54(%ebp),%eax
    3232:	89 44 24 08          	mov    %eax,0x8(%esp)
    3236:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3239:	89 44 24 0c          	mov    %eax,0xc(%esp)
    323d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    3240:	89 44 24 10          	mov    %eax,0x10(%esp)
    3244:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3247:	89 44 24 14          	mov    %eax,0x14(%esp)
    324b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    324e:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3251:	89 04 24             	mov    %eax,(%esp)
    3254:	89 54 24 04          	mov    %edx,0x4(%esp)
    3258:	e8 3c 01 00 00       	call   3399 <isIn>
    325d:	85 c0                	test   %eax,%eax
    325f:	0f 84 87 00 00 00    	je     32ec <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    3265:	8b 45 08             	mov    0x8(%ebp),%eax
    3268:	8b 10                	mov    (%eax),%edx
    326a:	8b 45 08             	mov    0x8(%ebp),%eax
    326d:	8b 40 04             	mov    0x4(%eax),%eax
    3270:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3274:	89 c1                	mov    %eax,%ecx
    3276:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3279:	01 c8                	add    %ecx,%eax
    327b:	c1 e0 02             	shl    $0x2,%eax
    327e:	01 d0                	add    %edx,%eax
    3280:	0f b6 00             	movzbl (%eax),%eax
    3283:	3c ff                	cmp    $0xff,%al
    3285:	75 65                	jne    32ec <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    3287:	8b 45 08             	mov    0x8(%ebp),%eax
    328a:	8b 10                	mov    (%eax),%edx
    328c:	8b 45 08             	mov    0x8(%ebp),%eax
    328f:	8b 40 04             	mov    0x4(%eax),%eax
    3292:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    3296:	89 c1                	mov    %eax,%ecx
    3298:	8b 45 f4             	mov    -0xc(%ebp),%eax
    329b:	01 c8                	add    %ecx,%eax
    329d:	c1 e0 02             	shl    $0x2,%eax
    32a0:	01 d0                	add    %edx,%eax
    32a2:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    32a6:	3c ff                	cmp    $0xff,%al
    32a8:	75 42                	jne    32ec <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    32aa:	8b 45 08             	mov    0x8(%ebp),%eax
    32ad:	8b 10                	mov    (%eax),%edx
    32af:	8b 45 08             	mov    0x8(%ebp),%eax
    32b2:	8b 40 04             	mov    0x4(%eax),%eax
    32b5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32b9:	89 c1                	mov    %eax,%ecx
    32bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32be:	01 c8                	add    %ecx,%eax
    32c0:	c1 e0 02             	shl    $0x2,%eax
    32c3:	01 d0                	add    %edx,%eax
    32c5:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    32c9:	3c ff                	cmp    $0xff,%al
    32cb:	75 1f                	jne    32ec <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    32cd:	8b 45 08             	mov    0x8(%ebp),%eax
    32d0:	8b 10                	mov    (%eax),%edx
    32d2:	8b 45 08             	mov    0x8(%ebp),%eax
    32d5:	8b 40 04             	mov    0x4(%eax),%eax
    32d8:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    32dc:	89 c1                	mov    %eax,%ecx
    32de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32e1:	01 c8                	add    %ecx,%eax
    32e3:	c1 e0 02             	shl    $0x2,%eax
    32e6:	01 d0                	add    %edx,%eax
    32e8:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    32ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32f0:	8b 45 08             	mov    0x8(%ebp),%eax
    32f3:	8b 40 08             	mov    0x8(%eax),%eax
    32f6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    32f9:	0f 8f 7a fe ff ff    	jg     3179 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    32ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3303:	8b 45 08             	mov    0x8(%ebp),%eax
    3306:	8b 40 04             	mov    0x4(%eax),%eax
    3309:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    330c:	0f 8f 5b fe ff ff    	jg     316d <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    3312:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3315:	c9                   	leave  
    3316:	c3                   	ret    

00003317 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"

Point initPoint(int x, int y)
{
    3317:	55                   	push   %ebp
    3318:	89 e5                	mov    %esp,%ebp
    331a:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    331d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3320:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    3323:	8b 45 10             	mov    0x10(%ebp),%eax
    3326:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    3329:	8b 4d 08             	mov    0x8(%ebp),%ecx
    332c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    332f:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3332:	89 01                	mov    %eax,(%ecx)
    3334:	89 51 04             	mov    %edx,0x4(%ecx)
}
    3337:	8b 45 08             	mov    0x8(%ebp),%eax
    333a:	c9                   	leave  
    333b:	c2 04 00             	ret    $0x4

0000333e <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    333e:	55                   	push   %ebp
    333f:	89 e5                	mov    %esp,%ebp
    3341:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    3344:	8d 45 e8             	lea    -0x18(%ebp),%eax
    3347:	8b 55 10             	mov    0x10(%ebp),%edx
    334a:	89 54 24 08          	mov    %edx,0x8(%esp)
    334e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3351:	89 54 24 04          	mov    %edx,0x4(%esp)
    3355:	89 04 24             	mov    %eax,(%esp)
    3358:	e8 ba ff ff ff       	call   3317 <initPoint>
    335d:	83 ec 04             	sub    $0x4,%esp
    3360:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3363:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3366:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3369:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    336c:	8b 45 14             	mov    0x14(%ebp),%eax
    336f:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    3372:	8b 45 18             	mov    0x18(%ebp),%eax
    3375:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    3378:	8b 45 08             	mov    0x8(%ebp),%eax
    337b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    337e:	89 10                	mov    %edx,(%eax)
    3380:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3383:	89 50 04             	mov    %edx,0x4(%eax)
    3386:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3389:	89 50 08             	mov    %edx,0x8(%eax)
    338c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    338f:	89 50 0c             	mov    %edx,0xc(%eax)
}
    3392:	8b 45 08             	mov    0x8(%ebp),%eax
    3395:	c9                   	leave  
    3396:	c2 04 00             	ret    $0x4

00003399 <isIn>:

int isIn(Point p, Rect r)
{
    3399:	55                   	push   %ebp
    339a:	89 e5                	mov    %esp,%ebp
	//printf(0, "Click point: %d %d\n", p.x, p.y);
	//printf(0, "Rect area: %d %d %d %d\n",r.start.x, r.start.y, r.start.x+r.width, r.start.y+r.height);
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    339c:	8b 55 08             	mov    0x8(%ebp),%edx
    339f:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    33a2:	39 c2                	cmp    %eax,%edx
    33a4:	7c 2f                	jl     33d5 <isIn+0x3c>

int isIn(Point p, Rect r)
{
	//printf(0, "Click point: %d %d\n", p.x, p.y);
	//printf(0, "Rect area: %d %d %d %d\n",r.start.x, r.start.y, r.start.x+r.width, r.start.y+r.height);
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    33a6:	8b 45 08             	mov    0x8(%ebp),%eax
    33a9:	8b 4d 10             	mov    0x10(%ebp),%ecx
    33ac:	8b 55 18             	mov    0x18(%ebp),%edx
    33af:	01 ca                	add    %ecx,%edx
    33b1:	39 d0                	cmp    %edx,%eax
    33b3:	7d 20                	jge    33d5 <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    33b5:	8b 55 0c             	mov    0xc(%ebp),%edx
    33b8:	8b 45 14             	mov    0x14(%ebp),%eax
    33bb:	39 c2                	cmp    %eax,%edx
    33bd:	7c 16                	jl     33d5 <isIn+0x3c>
    33bf:	8b 45 0c             	mov    0xc(%ebp),%eax
    33c2:	8b 4d 14             	mov    0x14(%ebp),%ecx
    33c5:	8b 55 1c             	mov    0x1c(%ebp),%edx
    33c8:	01 ca                	add    %ecx,%edx
    33ca:	39 d0                	cmp    %edx,%eax
    33cc:	7d 07                	jge    33d5 <isIn+0x3c>
    33ce:	b8 01 00 00 00       	mov    $0x1,%eax
    33d3:	eb 05                	jmp    33da <isIn+0x41>
    33d5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    33da:	5d                   	pop    %ebp
    33db:	c3                   	ret    

000033dc <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    33dc:	55                   	push   %ebp
    33dd:	89 e5                	mov    %esp,%ebp
    33df:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    33e2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    33e9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    33f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    33f7:	8b 45 10             	mov    0x10(%ebp),%eax
    33fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    33fd:	8b 45 14             	mov    0x14(%ebp),%eax
    3400:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    3403:	8b 45 08             	mov    0x8(%ebp),%eax
    3406:	8b 55 ec             	mov    -0x14(%ebp),%edx
    3409:	89 10                	mov    %edx,(%eax)
    340b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    340e:	89 50 04             	mov    %edx,0x4(%eax)
    3411:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3414:	89 50 08             	mov    %edx,0x8(%eax)
    3417:	8b 55 f8             	mov    -0x8(%ebp),%edx
    341a:	89 50 0c             	mov    %edx,0xc(%eax)
    341d:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3420:	89 50 10             	mov    %edx,0x10(%eax)
}
    3423:	8b 45 08             	mov    0x8(%ebp),%eax
    3426:	c9                   	leave  
    3427:	c2 04 00             	ret    $0x4

0000342a <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    342a:	55                   	push   %ebp
    342b:	89 e5                	mov    %esp,%ebp
    342d:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    3430:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3433:	83 f8 03             	cmp    $0x3,%eax
    3436:	74 72                	je     34aa <createClickable+0x80>
    3438:	83 f8 04             	cmp    $0x4,%eax
    343b:	74 0a                	je     3447 <createClickable+0x1d>
    343d:	83 f8 02             	cmp    $0x2,%eax
    3440:	74 38                	je     347a <createClickable+0x50>
    3442:	e9 96 00 00 00       	jmp    34dd <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    3447:	8b 45 08             	mov    0x8(%ebp),%eax
    344a:	8d 50 04             	lea    0x4(%eax),%edx
    344d:	8b 45 20             	mov    0x20(%ebp),%eax
    3450:	89 44 24 14          	mov    %eax,0x14(%esp)
    3454:	8b 45 0c             	mov    0xc(%ebp),%eax
    3457:	89 44 24 04          	mov    %eax,0x4(%esp)
    345b:	8b 45 10             	mov    0x10(%ebp),%eax
    345e:	89 44 24 08          	mov    %eax,0x8(%esp)
    3462:	8b 45 14             	mov    0x14(%ebp),%eax
    3465:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3469:	8b 45 18             	mov    0x18(%ebp),%eax
    346c:	89 44 24 10          	mov    %eax,0x10(%esp)
    3470:	89 14 24             	mov    %edx,(%esp)
    3473:	e8 7c 00 00 00       	call   34f4 <addClickable>
	        break;
    3478:	eb 78                	jmp    34f2 <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    347a:	8b 45 08             	mov    0x8(%ebp),%eax
    347d:	8b 55 20             	mov    0x20(%ebp),%edx
    3480:	89 54 24 14          	mov    %edx,0x14(%esp)
    3484:	8b 55 0c             	mov    0xc(%ebp),%edx
    3487:	89 54 24 04          	mov    %edx,0x4(%esp)
    348b:	8b 55 10             	mov    0x10(%ebp),%edx
    348e:	89 54 24 08          	mov    %edx,0x8(%esp)
    3492:	8b 55 14             	mov    0x14(%ebp),%edx
    3495:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3499:	8b 55 18             	mov    0x18(%ebp),%edx
    349c:	89 54 24 10          	mov    %edx,0x10(%esp)
    34a0:	89 04 24             	mov    %eax,(%esp)
    34a3:	e8 4c 00 00 00       	call   34f4 <addClickable>
	    	break;
    34a8:	eb 48                	jmp    34f2 <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    34aa:	8b 45 08             	mov    0x8(%ebp),%eax
    34ad:	8d 50 08             	lea    0x8(%eax),%edx
    34b0:	8b 45 20             	mov    0x20(%ebp),%eax
    34b3:	89 44 24 14          	mov    %eax,0x14(%esp)
    34b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    34ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    34be:	8b 45 10             	mov    0x10(%ebp),%eax
    34c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    34c5:	8b 45 14             	mov    0x14(%ebp),%eax
    34c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    34cc:	8b 45 18             	mov    0x18(%ebp),%eax
    34cf:	89 44 24 10          	mov    %eax,0x10(%esp)
    34d3:	89 14 24             	mov    %edx,(%esp)
    34d6:	e8 19 00 00 00       	call   34f4 <addClickable>
	    	break;
    34db:	eb 15                	jmp    34f2 <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    34dd:	c7 44 24 04 10 8e 00 	movl   $0x8e10,0x4(%esp)
    34e4:	00 
    34e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34ec:	e8 81 09 00 00       	call   3e72 <printf>
	    	break;
    34f1:	90                   	nop
	}
}
    34f2:	c9                   	leave  
    34f3:	c3                   	ret    

000034f4 <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    34f4:	55                   	push   %ebp
    34f5:	89 e5                	mov    %esp,%ebp
    34f7:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    34fa:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    3501:	e8 58 0c 00 00       	call   415e <malloc>
    3506:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    3509:	8b 45 f4             	mov    -0xc(%ebp),%eax
    350c:	8b 55 0c             	mov    0xc(%ebp),%edx
    350f:	89 10                	mov    %edx,(%eax)
    3511:	8b 55 10             	mov    0x10(%ebp),%edx
    3514:	89 50 04             	mov    %edx,0x4(%eax)
    3517:	8b 55 14             	mov    0x14(%ebp),%edx
    351a:	89 50 08             	mov    %edx,0x8(%eax)
    351d:	8b 55 18             	mov    0x18(%ebp),%edx
    3520:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    3523:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3526:	8b 55 1c             	mov    0x1c(%ebp),%edx
    3529:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    352c:	8b 45 08             	mov    0x8(%ebp),%eax
    352f:	8b 10                	mov    (%eax),%edx
    3531:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3534:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    3537:	8b 45 08             	mov    0x8(%ebp),%eax
    353a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    353d:	89 10                	mov    %edx,(%eax)
}
    353f:	c9                   	leave  
    3540:	c3                   	ret    

00003541 <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    3541:	55                   	push   %ebp
    3542:	89 e5                	mov    %esp,%ebp
    3544:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    3547:	8b 45 08             	mov    0x8(%ebp),%eax
    354a:	8b 00                	mov    (%eax),%eax
    354c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    354f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3552:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    3555:	e9 bb 00 00 00       	jmp    3615 <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    355a:	8b 45 0c             	mov    0xc(%ebp),%eax
    355d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3561:	8b 45 10             	mov    0x10(%ebp),%eax
    3564:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3568:	8b 45 14             	mov    0x14(%ebp),%eax
    356b:	89 44 24 10          	mov    %eax,0x10(%esp)
    356f:	8b 45 18             	mov    0x18(%ebp),%eax
    3572:	89 44 24 14          	mov    %eax,0x14(%esp)
    3576:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3579:	8b 50 04             	mov    0x4(%eax),%edx
    357c:	8b 00                	mov    (%eax),%eax
    357e:	89 04 24             	mov    %eax,(%esp)
    3581:	89 54 24 04          	mov    %edx,0x4(%esp)
    3585:	e8 0f fe ff ff       	call   3399 <isIn>
    358a:	85 c0                	test   %eax,%eax
    358c:	74 60                	je     35ee <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    358e:	8b 45 08             	mov    0x8(%ebp),%eax
    3591:	8b 00                	mov    (%eax),%eax
    3593:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3596:	75 2e                	jne    35c6 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    3598:	8b 45 08             	mov    0x8(%ebp),%eax
    359b:	8b 00                	mov    (%eax),%eax
    359d:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    35a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35a3:	8b 50 14             	mov    0x14(%eax),%edx
    35a6:	8b 45 08             	mov    0x8(%ebp),%eax
    35a9:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    35ab:	8b 45 08             	mov    0x8(%ebp),%eax
    35ae:	8b 00                	mov    (%eax),%eax
    35b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    35b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    35b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35bc:	89 04 24             	mov    %eax,(%esp)
    35bf:	e8 61 0a 00 00       	call   4025 <free>
    35c4:	eb 4f                	jmp    3615 <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    35c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35c9:	8b 50 14             	mov    0x14(%eax),%edx
    35cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    35cf:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    35d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    35d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35db:	8b 40 14             	mov    0x14(%eax),%eax
    35de:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    35e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35e4:	89 04 24             	mov    %eax,(%esp)
    35e7:	e8 39 0a 00 00       	call   4025 <free>
    35ec:	eb 27                	jmp    3615 <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    35ee:	8b 45 08             	mov    0x8(%ebp),%eax
    35f1:	8b 00                	mov    (%eax),%eax
    35f3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    35f6:	75 0b                	jne    3603 <deleteClickable+0xc2>
			{
				cur = cur->next;
    35f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    35fb:	8b 40 14             	mov    0x14(%eax),%eax
    35fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
    3601:	eb 12                	jmp    3615 <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    3603:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3606:	8b 40 14             	mov    0x14(%eax),%eax
    3609:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    360c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    360f:	8b 40 14             	mov    0x14(%eax),%eax
    3612:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    3615:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3619:	0f 85 3b ff ff ff    	jne    355a <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    361f:	c9                   	leave  
    3620:	c3                   	ret    

00003621 <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    3621:	55                   	push   %ebp
    3622:	89 e5                	mov    %esp,%ebp
    3624:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    3627:	8b 45 08             	mov    0x8(%ebp),%eax
    362a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    362d:	e9 80 00 00 00       	jmp    36b2 <executeHandler+0x91>
	{
		printf(0, "CurArea:X:%d Y:%d\n", cur->area.start.x, cur->area.start.y);
    3632:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3635:	8b 50 04             	mov    0x4(%eax),%edx
    3638:	8b 45 f4             	mov    -0xc(%ebp),%eax
    363b:	8b 00                	mov    (%eax),%eax
    363d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3641:	89 44 24 08          	mov    %eax,0x8(%esp)
    3645:	c7 44 24 04 3e 8e 00 	movl   $0x8e3e,0x4(%esp)
    364c:	00 
    364d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3654:	e8 19 08 00 00       	call   3e72 <printf>
		if (isIn(click, cur->area))
    3659:	8b 45 f4             	mov    -0xc(%ebp),%eax
    365c:	8b 10                	mov    (%eax),%edx
    365e:	89 54 24 08          	mov    %edx,0x8(%esp)
    3662:	8b 50 04             	mov    0x4(%eax),%edx
    3665:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3669:	8b 50 08             	mov    0x8(%eax),%edx
    366c:	89 54 24 10          	mov    %edx,0x10(%esp)
    3670:	8b 40 0c             	mov    0xc(%eax),%eax
    3673:	89 44 24 14          	mov    %eax,0x14(%esp)
    3677:	8b 45 0c             	mov    0xc(%ebp),%eax
    367a:	8b 55 10             	mov    0x10(%ebp),%edx
    367d:	89 04 24             	mov    %eax,(%esp)
    3680:	89 54 24 04          	mov    %edx,0x4(%esp)
    3684:	e8 10 fd ff ff       	call   3399 <isIn>
    3689:	85 c0                	test   %eax,%eax
    368b:	74 1c                	je     36a9 <executeHandler+0x88>
		{
			cur->handler(click);
    368d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3690:	8b 48 10             	mov    0x10(%eax),%ecx
    3693:	8b 45 0c             	mov    0xc(%ebp),%eax
    3696:	8b 55 10             	mov    0x10(%ebp),%edx
    3699:	89 04 24             	mov    %eax,(%esp)
    369c:	89 54 24 04          	mov    %edx,0x4(%esp)
    36a0:	ff d1                	call   *%ecx
			return 1;
    36a2:	b8 01 00 00 00       	mov    $0x1,%eax
    36a7:	eb 2c                	jmp    36d5 <executeHandler+0xb4>
		}
		cur = cur->next;
    36a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    36ac:	8b 40 14             	mov    0x14(%eax),%eax
    36af:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    36b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    36b6:	0f 85 76 ff ff ff    	jne    3632 <executeHandler+0x11>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	printf(0, "execute: none!\n");
    36bc:	c7 44 24 04 51 8e 00 	movl   $0x8e51,0x4(%esp)
    36c3:	00 
    36c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36cb:	e8 a2 07 00 00       	call   3e72 <printf>
	return 0;
    36d0:	b8 00 00 00 00       	mov    $0x0,%eax
}
    36d5:	c9                   	leave  
    36d6:	c3                   	ret    

000036d7 <printClickable>:

void printClickable(Clickable *c)
{
    36d7:	55                   	push   %ebp
    36d8:	89 e5                	mov    %esp,%ebp
    36da:	53                   	push   %ebx
    36db:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    36de:	8b 45 08             	mov    0x8(%ebp),%eax
    36e1:	8b 58 0c             	mov    0xc(%eax),%ebx
    36e4:	8b 45 08             	mov    0x8(%ebp),%eax
    36e7:	8b 48 08             	mov    0x8(%eax),%ecx
    36ea:	8b 45 08             	mov    0x8(%ebp),%eax
    36ed:	8b 50 04             	mov    0x4(%eax),%edx
    36f0:	8b 45 08             	mov    0x8(%ebp),%eax
    36f3:	8b 00                	mov    (%eax),%eax
    36f5:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    36f9:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    36fd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3701:	89 44 24 08          	mov    %eax,0x8(%esp)
    3705:	c7 44 24 04 61 8e 00 	movl   $0x8e61,0x4(%esp)
    370c:	00 
    370d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3714:	e8 59 07 00 00       	call   3e72 <printf>
}
    3719:	83 c4 24             	add    $0x24,%esp
    371c:	5b                   	pop    %ebx
    371d:	5d                   	pop    %ebp
    371e:	c3                   	ret    

0000371f <printClickableList>:

void printClickableList(Clickable *head)
{
    371f:	55                   	push   %ebp
    3720:	89 e5                	mov    %esp,%ebp
    3722:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    3725:	8b 45 08             	mov    0x8(%ebp),%eax
    3728:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    372b:	c7 44 24 04 73 8e 00 	movl   $0x8e73,0x4(%esp)
    3732:	00 
    3733:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    373a:	e8 33 07 00 00       	call   3e72 <printf>
	while(cur != 0)
    373f:	eb 14                	jmp    3755 <printClickableList+0x36>
	{
		printClickable(cur);
    3741:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3744:	89 04 24             	mov    %eax,(%esp)
    3747:	e8 8b ff ff ff       	call   36d7 <printClickable>
		cur = cur->next;
    374c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    374f:	8b 40 14             	mov    0x14(%eax),%eax
    3752:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    3755:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3759:	75 e6                	jne    3741 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    375b:	c7 44 24 04 84 8e 00 	movl   $0x8e84,0x4(%esp)
    3762:	00 
    3763:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    376a:	e8 03 07 00 00       	call   3e72 <printf>
}
    376f:	c9                   	leave  
    3770:	c3                   	ret    

00003771 <testHanler>:

void testHanler(struct Point p)
{
    3771:	55                   	push   %ebp
    3772:	89 e5                	mov    %esp,%ebp
    3774:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    3777:	8b 55 0c             	mov    0xc(%ebp),%edx
    377a:	8b 45 08             	mov    0x8(%ebp),%eax
    377d:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3781:	89 44 24 08          	mov    %eax,0x8(%esp)
    3785:	c7 44 24 04 86 8e 00 	movl   $0x8e86,0x4(%esp)
    378c:	00 
    378d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3794:	e8 d9 06 00 00       	call   3e72 <printf>
}
    3799:	c9                   	leave  
    379a:	c3                   	ret    

0000379b <testClickable>:
void testClickable(struct Context c)
{
    379b:	55                   	push   %ebp
    379c:	89 e5                	mov    %esp,%ebp
    379e:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    37a4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    37a7:	8b 55 08             	mov    0x8(%ebp),%edx
    37aa:	89 54 24 04          	mov    %edx,0x4(%esp)
    37ae:	8b 55 0c             	mov    0xc(%ebp),%edx
    37b1:	89 54 24 08          	mov    %edx,0x8(%esp)
    37b5:	8b 55 10             	mov    0x10(%ebp),%edx
    37b8:	89 54 24 0c          	mov    %edx,0xc(%esp)
    37bc:	89 04 24             	mov    %eax,(%esp)
    37bf:	e8 18 fc ff ff       	call   33dc <initClickManager>
    37c4:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    37c7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    37ca:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    37d1:	00 
    37d2:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    37d9:	00 
    37da:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    37e1:	00 
    37e2:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    37e9:	00 
    37ea:	89 04 24             	mov    %eax,(%esp)
    37ed:	e8 4c fb ff ff       	call   333e <initRect>
    37f2:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    37f5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    37f8:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    37ff:	00 
    3800:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    3807:	00 
    3808:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    380f:	00 
    3810:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    3817:	00 
    3818:	89 04 24             	mov    %eax,(%esp)
    381b:	e8 1e fb ff ff       	call   333e <initRect>
    3820:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    3823:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    3826:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    382d:	00 
    382e:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    3835:	00 
    3836:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    383d:	00 
    383e:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    3845:	00 
    3846:	89 04 24             	mov    %eax,(%esp)
    3849:	e8 f0 fa ff ff       	call   333e <initRect>
    384e:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    3851:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3854:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    385b:	00 
    385c:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    3863:	00 
    3864:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    386b:	00 
    386c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3873:	00 
    3874:	89 04 24             	mov    %eax,(%esp)
    3877:	e8 c2 fa ff ff       	call   333e <initRect>
    387c:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    387f:	8d 45 9c             	lea    -0x64(%ebp),%eax
    3882:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    3889:	00 
    388a:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    3891:	00 
    3892:	89 04 24             	mov    %eax,(%esp)
    3895:	e8 7d fa ff ff       	call   3317 <initPoint>
    389a:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    389d:	8d 45 94             	lea    -0x6c(%ebp),%eax
    38a0:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    38a7:	00 
    38a8:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    38af:	00 
    38b0:	89 04 24             	mov    %eax,(%esp)
    38b3:	e8 5f fa ff ff       	call   3317 <initPoint>
    38b8:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    38bb:	c7 44 24 18 71 37 00 	movl   $0x3771,0x18(%esp)
    38c2:	00 
    38c3:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    38ca:	00 
    38cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    38ce:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
    38d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    38d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
    38dc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    38e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
    38e3:	89 44 24 10          	mov    %eax,0x10(%esp)
    38e7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    38ea:	89 04 24             	mov    %eax,(%esp)
    38ed:	e8 38 fb ff ff       	call   342a <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    38f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38f5:	89 44 24 08          	mov    %eax,0x8(%esp)
    38f9:	c7 44 24 04 9a 8e 00 	movl   $0x8e9a,0x4(%esp)
    3900:	00 
    3901:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3908:	e8 65 05 00 00       	call   3e72 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    390d:	c7 44 24 18 71 37 00 	movl   $0x3771,0x18(%esp)
    3914:	00 
    3915:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    391c:	00 
    391d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    3920:	89 44 24 04          	mov    %eax,0x4(%esp)
    3924:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3927:	89 44 24 08          	mov    %eax,0x8(%esp)
    392b:	8b 45 cc             	mov    -0x34(%ebp),%eax
    392e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3932:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3935:	89 44 24 10          	mov    %eax,0x10(%esp)
    3939:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    393c:	89 04 24             	mov    %eax,(%esp)
    393f:	e8 e6 fa ff ff       	call   342a <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3944:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3947:	89 44 24 08          	mov    %eax,0x8(%esp)
    394b:	c7 44 24 04 9a 8e 00 	movl   $0x8e9a,0x4(%esp)
    3952:	00 
    3953:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    395a:	e8 13 05 00 00       	call   3e72 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    395f:	c7 44 24 18 71 37 00 	movl   $0x3771,0x18(%esp)
    3966:	00 
    3967:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    396e:	00 
    396f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    3972:	89 44 24 04          	mov    %eax,0x4(%esp)
    3976:	8b 45 b8             	mov    -0x48(%ebp),%eax
    3979:	89 44 24 08          	mov    %eax,0x8(%esp)
    397d:	8b 45 bc             	mov    -0x44(%ebp),%eax
    3980:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3984:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3987:	89 44 24 10          	mov    %eax,0x10(%esp)
    398b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    398e:	89 04 24             	mov    %eax,(%esp)
    3991:	e8 94 fa ff ff       	call   342a <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    3996:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3999:	89 44 24 08          	mov    %eax,0x8(%esp)
    399d:	c7 44 24 04 9a 8e 00 	movl   $0x8e9a,0x4(%esp)
    39a4:	00 
    39a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39ac:	e8 c1 04 00 00       	call   3e72 <printf>
	printClickableList(cm.left_click);
    39b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39b4:	89 04 24             	mov    %eax,(%esp)
    39b7:	e8 63 fd ff ff       	call   371f <printClickableList>
	executeHandler(cm.left_click, p1);
    39bc:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    39bf:	8b 45 9c             	mov    -0x64(%ebp),%eax
    39c2:	8b 55 a0             	mov    -0x60(%ebp),%edx
    39c5:	89 44 24 04          	mov    %eax,0x4(%esp)
    39c9:	89 54 24 08          	mov    %edx,0x8(%esp)
    39cd:	89 0c 24             	mov    %ecx,(%esp)
    39d0:	e8 4c fc ff ff       	call   3621 <executeHandler>
	executeHandler(cm.left_click, p2);
    39d5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    39d8:	8b 45 94             	mov    -0x6c(%ebp),%eax
    39db:	8b 55 98             	mov    -0x68(%ebp),%edx
    39de:	89 44 24 04          	mov    %eax,0x4(%esp)
    39e2:	89 54 24 08          	mov    %edx,0x8(%esp)
    39e6:	89 0c 24             	mov    %ecx,(%esp)
    39e9:	e8 33 fc ff ff       	call   3621 <executeHandler>
	deleteClickable(&cm.left_click, r4);
    39ee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    39f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    39f5:	8b 45 a8             	mov    -0x58(%ebp),%eax
    39f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    39fc:	8b 45 ac             	mov    -0x54(%ebp),%eax
    39ff:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3a03:	8b 45 b0             	mov    -0x50(%ebp),%eax
    3a06:	89 44 24 10          	mov    %eax,0x10(%esp)
    3a0a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3a0d:	89 04 24             	mov    %eax,(%esp)
    3a10:	e8 2c fb ff ff       	call   3541 <deleteClickable>
	printClickableList(cm.left_click);
    3a15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a18:	89 04 24             	mov    %eax,(%esp)
    3a1b:	e8 ff fc ff ff       	call   371f <printClickableList>
}
    3a20:	c9                   	leave  
    3a21:	c3                   	ret    

00003a22 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3a22:	55                   	push   %ebp
    3a23:	89 e5                	mov    %esp,%ebp
    3a25:	57                   	push   %edi
    3a26:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3a27:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3a2a:	8b 55 10             	mov    0x10(%ebp),%edx
    3a2d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a30:	89 cb                	mov    %ecx,%ebx
    3a32:	89 df                	mov    %ebx,%edi
    3a34:	89 d1                	mov    %edx,%ecx
    3a36:	fc                   	cld    
    3a37:	f3 aa                	rep stos %al,%es:(%edi)
    3a39:	89 ca                	mov    %ecx,%edx
    3a3b:	89 fb                	mov    %edi,%ebx
    3a3d:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3a40:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3a43:	5b                   	pop    %ebx
    3a44:	5f                   	pop    %edi
    3a45:	5d                   	pop    %ebp
    3a46:	c3                   	ret    

00003a47 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3a47:	55                   	push   %ebp
    3a48:	89 e5                	mov    %esp,%ebp
    3a4a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3a4d:	8b 45 08             	mov    0x8(%ebp),%eax
    3a50:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3a53:	90                   	nop
    3a54:	8b 45 08             	mov    0x8(%ebp),%eax
    3a57:	8d 50 01             	lea    0x1(%eax),%edx
    3a5a:	89 55 08             	mov    %edx,0x8(%ebp)
    3a5d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a60:	8d 4a 01             	lea    0x1(%edx),%ecx
    3a63:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    3a66:	0f b6 12             	movzbl (%edx),%edx
    3a69:	88 10                	mov    %dl,(%eax)
    3a6b:	0f b6 00             	movzbl (%eax),%eax
    3a6e:	84 c0                	test   %al,%al
    3a70:	75 e2                	jne    3a54 <strcpy+0xd>
    ;
  return os;
    3a72:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a75:	c9                   	leave  
    3a76:	c3                   	ret    

00003a77 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a77:	55                   	push   %ebp
    3a78:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a7a:	eb 08                	jmp    3a84 <strcmp+0xd>
    p++, q++;
    3a7c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a80:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a84:	8b 45 08             	mov    0x8(%ebp),%eax
    3a87:	0f b6 00             	movzbl (%eax),%eax
    3a8a:	84 c0                	test   %al,%al
    3a8c:	74 10                	je     3a9e <strcmp+0x27>
    3a8e:	8b 45 08             	mov    0x8(%ebp),%eax
    3a91:	0f b6 10             	movzbl (%eax),%edx
    3a94:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a97:	0f b6 00             	movzbl (%eax),%eax
    3a9a:	38 c2                	cmp    %al,%dl
    3a9c:	74 de                	je     3a7c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3a9e:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa1:	0f b6 00             	movzbl (%eax),%eax
    3aa4:	0f b6 d0             	movzbl %al,%edx
    3aa7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aaa:	0f b6 00             	movzbl (%eax),%eax
    3aad:	0f b6 c0             	movzbl %al,%eax
    3ab0:	29 c2                	sub    %eax,%edx
    3ab2:	89 d0                	mov    %edx,%eax
}
    3ab4:	5d                   	pop    %ebp
    3ab5:	c3                   	ret    

00003ab6 <strlen>:

uint
strlen(char *s)
{
    3ab6:	55                   	push   %ebp
    3ab7:	89 e5                	mov    %esp,%ebp
    3ab9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3abc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3ac3:	eb 04                	jmp    3ac9 <strlen+0x13>
    3ac5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3ac9:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3acc:	8b 45 08             	mov    0x8(%ebp),%eax
    3acf:	01 d0                	add    %edx,%eax
    3ad1:	0f b6 00             	movzbl (%eax),%eax
    3ad4:	84 c0                	test   %al,%al
    3ad6:	75 ed                	jne    3ac5 <strlen+0xf>
    ;
  return n;
    3ad8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3adb:	c9                   	leave  
    3adc:	c3                   	ret    

00003add <memset>:

void*
memset(void *dst, int c, uint n)
{
    3add:	55                   	push   %ebp
    3ade:	89 e5                	mov    %esp,%ebp
    3ae0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3ae3:	8b 45 10             	mov    0x10(%ebp),%eax
    3ae6:	89 44 24 08          	mov    %eax,0x8(%esp)
    3aea:	8b 45 0c             	mov    0xc(%ebp),%eax
    3aed:	89 44 24 04          	mov    %eax,0x4(%esp)
    3af1:	8b 45 08             	mov    0x8(%ebp),%eax
    3af4:	89 04 24             	mov    %eax,(%esp)
    3af7:	e8 26 ff ff ff       	call   3a22 <stosb>
  return dst;
    3afc:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3aff:	c9                   	leave  
    3b00:	c3                   	ret    

00003b01 <strchr>:

char*
strchr(const char *s, char c)
{
    3b01:	55                   	push   %ebp
    3b02:	89 e5                	mov    %esp,%ebp
    3b04:	83 ec 04             	sub    $0x4,%esp
    3b07:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b0a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3b0d:	eb 14                	jmp    3b23 <strchr+0x22>
    if(*s == c)
    3b0f:	8b 45 08             	mov    0x8(%ebp),%eax
    3b12:	0f b6 00             	movzbl (%eax),%eax
    3b15:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3b18:	75 05                	jne    3b1f <strchr+0x1e>
      return (char*)s;
    3b1a:	8b 45 08             	mov    0x8(%ebp),%eax
    3b1d:	eb 13                	jmp    3b32 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3b1f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3b23:	8b 45 08             	mov    0x8(%ebp),%eax
    3b26:	0f b6 00             	movzbl (%eax),%eax
    3b29:	84 c0                	test   %al,%al
    3b2b:	75 e2                	jne    3b0f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3b2d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3b32:	c9                   	leave  
    3b33:	c3                   	ret    

00003b34 <gets>:

char*
gets(char *buf, int max)
{
    3b34:	55                   	push   %ebp
    3b35:	89 e5                	mov    %esp,%ebp
    3b37:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3b41:	eb 4c                	jmp    3b8f <gets+0x5b>
    cc = read(0, &c, 1);
    3b43:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3b4a:	00 
    3b4b:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b52:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b59:	e8 44 01 00 00       	call   3ca2 <read>
    3b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3b61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3b65:	7f 02                	jg     3b69 <gets+0x35>
      break;
    3b67:	eb 31                	jmp    3b9a <gets+0x66>
    buf[i++] = c;
    3b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b6c:	8d 50 01             	lea    0x1(%eax),%edx
    3b6f:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3b72:	89 c2                	mov    %eax,%edx
    3b74:	8b 45 08             	mov    0x8(%ebp),%eax
    3b77:	01 c2                	add    %eax,%edx
    3b79:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b7d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3b7f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b83:	3c 0a                	cmp    $0xa,%al
    3b85:	74 13                	je     3b9a <gets+0x66>
    3b87:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b8b:	3c 0d                	cmp    $0xd,%al
    3b8d:	74 0b                	je     3b9a <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b92:	83 c0 01             	add    $0x1,%eax
    3b95:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3b98:	7c a9                	jl     3b43 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3b9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3b9d:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba0:	01 d0                	add    %edx,%eax
    3ba2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3ba5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3ba8:	c9                   	leave  
    3ba9:	c3                   	ret    

00003baa <stat>:

int
stat(char *n, struct stat *st)
{
    3baa:	55                   	push   %ebp
    3bab:	89 e5                	mov    %esp,%ebp
    3bad:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3bb0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3bb7:	00 
    3bb8:	8b 45 08             	mov    0x8(%ebp),%eax
    3bbb:	89 04 24             	mov    %eax,(%esp)
    3bbe:	e8 07 01 00 00       	call   3cca <open>
    3bc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3bc6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3bca:	79 07                	jns    3bd3 <stat+0x29>
    return -1;
    3bcc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3bd1:	eb 23                	jmp    3bf6 <stat+0x4c>
  r = fstat(fd, st);
    3bd3:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bd6:	89 44 24 04          	mov    %eax,0x4(%esp)
    3bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3bdd:	89 04 24             	mov    %eax,(%esp)
    3be0:	e8 fd 00 00 00       	call   3ce2 <fstat>
    3be5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3be8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3beb:	89 04 24             	mov    %eax,(%esp)
    3bee:	e8 bf 00 00 00       	call   3cb2 <close>
  return r;
    3bf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3bf6:	c9                   	leave  
    3bf7:	c3                   	ret    

00003bf8 <atoi>:

int
atoi(const char *s)
{
    3bf8:	55                   	push   %ebp
    3bf9:	89 e5                	mov    %esp,%ebp
    3bfb:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3bfe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3c05:	eb 25                	jmp    3c2c <atoi+0x34>
    n = n*10 + *s++ - '0';
    3c07:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3c0a:	89 d0                	mov    %edx,%eax
    3c0c:	c1 e0 02             	shl    $0x2,%eax
    3c0f:	01 d0                	add    %edx,%eax
    3c11:	01 c0                	add    %eax,%eax
    3c13:	89 c1                	mov    %eax,%ecx
    3c15:	8b 45 08             	mov    0x8(%ebp),%eax
    3c18:	8d 50 01             	lea    0x1(%eax),%edx
    3c1b:	89 55 08             	mov    %edx,0x8(%ebp)
    3c1e:	0f b6 00             	movzbl (%eax),%eax
    3c21:	0f be c0             	movsbl %al,%eax
    3c24:	01 c8                	add    %ecx,%eax
    3c26:	83 e8 30             	sub    $0x30,%eax
    3c29:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    3c2f:	0f b6 00             	movzbl (%eax),%eax
    3c32:	3c 2f                	cmp    $0x2f,%al
    3c34:	7e 0a                	jle    3c40 <atoi+0x48>
    3c36:	8b 45 08             	mov    0x8(%ebp),%eax
    3c39:	0f b6 00             	movzbl (%eax),%eax
    3c3c:	3c 39                	cmp    $0x39,%al
    3c3e:	7e c7                	jle    3c07 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3c40:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3c43:	c9                   	leave  
    3c44:	c3                   	ret    

00003c45 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3c45:	55                   	push   %ebp
    3c46:	89 e5                	mov    %esp,%ebp
    3c48:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3c4b:	8b 45 08             	mov    0x8(%ebp),%eax
    3c4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3c51:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c54:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3c57:	eb 17                	jmp    3c70 <memmove+0x2b>
    *dst++ = *src++;
    3c59:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3c5c:	8d 50 01             	lea    0x1(%eax),%edx
    3c5f:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3c62:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3c65:	8d 4a 01             	lea    0x1(%edx),%ecx
    3c68:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3c6b:	0f b6 12             	movzbl (%edx),%edx
    3c6e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c70:	8b 45 10             	mov    0x10(%ebp),%eax
    3c73:	8d 50 ff             	lea    -0x1(%eax),%edx
    3c76:	89 55 10             	mov    %edx,0x10(%ebp)
    3c79:	85 c0                	test   %eax,%eax
    3c7b:	7f dc                	jg     3c59 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3c7d:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3c80:	c9                   	leave  
    3c81:	c3                   	ret    

00003c82 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c82:	b8 01 00 00 00       	mov    $0x1,%eax
    3c87:	cd 40                	int    $0x40
    3c89:	c3                   	ret    

00003c8a <exit>:
SYSCALL(exit)
    3c8a:	b8 02 00 00 00       	mov    $0x2,%eax
    3c8f:	cd 40                	int    $0x40
    3c91:	c3                   	ret    

00003c92 <wait>:
SYSCALL(wait)
    3c92:	b8 03 00 00 00       	mov    $0x3,%eax
    3c97:	cd 40                	int    $0x40
    3c99:	c3                   	ret    

00003c9a <pipe>:
SYSCALL(pipe)
    3c9a:	b8 04 00 00 00       	mov    $0x4,%eax
    3c9f:	cd 40                	int    $0x40
    3ca1:	c3                   	ret    

00003ca2 <read>:
SYSCALL(read)
    3ca2:	b8 05 00 00 00       	mov    $0x5,%eax
    3ca7:	cd 40                	int    $0x40
    3ca9:	c3                   	ret    

00003caa <write>:
SYSCALL(write)
    3caa:	b8 10 00 00 00       	mov    $0x10,%eax
    3caf:	cd 40                	int    $0x40
    3cb1:	c3                   	ret    

00003cb2 <close>:
SYSCALL(close)
    3cb2:	b8 15 00 00 00       	mov    $0x15,%eax
    3cb7:	cd 40                	int    $0x40
    3cb9:	c3                   	ret    

00003cba <kill>:
SYSCALL(kill)
    3cba:	b8 06 00 00 00       	mov    $0x6,%eax
    3cbf:	cd 40                	int    $0x40
    3cc1:	c3                   	ret    

00003cc2 <exec>:
SYSCALL(exec)
    3cc2:	b8 07 00 00 00       	mov    $0x7,%eax
    3cc7:	cd 40                	int    $0x40
    3cc9:	c3                   	ret    

00003cca <open>:
SYSCALL(open)
    3cca:	b8 0f 00 00 00       	mov    $0xf,%eax
    3ccf:	cd 40                	int    $0x40
    3cd1:	c3                   	ret    

00003cd2 <mknod>:
SYSCALL(mknod)
    3cd2:	b8 11 00 00 00       	mov    $0x11,%eax
    3cd7:	cd 40                	int    $0x40
    3cd9:	c3                   	ret    

00003cda <unlink>:
SYSCALL(unlink)
    3cda:	b8 12 00 00 00       	mov    $0x12,%eax
    3cdf:	cd 40                	int    $0x40
    3ce1:	c3                   	ret    

00003ce2 <fstat>:
SYSCALL(fstat)
    3ce2:	b8 08 00 00 00       	mov    $0x8,%eax
    3ce7:	cd 40                	int    $0x40
    3ce9:	c3                   	ret    

00003cea <link>:
SYSCALL(link)
    3cea:	b8 13 00 00 00       	mov    $0x13,%eax
    3cef:	cd 40                	int    $0x40
    3cf1:	c3                   	ret    

00003cf2 <mkdir>:
SYSCALL(mkdir)
    3cf2:	b8 14 00 00 00       	mov    $0x14,%eax
    3cf7:	cd 40                	int    $0x40
    3cf9:	c3                   	ret    

00003cfa <chdir>:
SYSCALL(chdir)
    3cfa:	b8 09 00 00 00       	mov    $0x9,%eax
    3cff:	cd 40                	int    $0x40
    3d01:	c3                   	ret    

00003d02 <dup>:
SYSCALL(dup)
    3d02:	b8 0a 00 00 00       	mov    $0xa,%eax
    3d07:	cd 40                	int    $0x40
    3d09:	c3                   	ret    

00003d0a <getpid>:
SYSCALL(getpid)
    3d0a:	b8 0b 00 00 00       	mov    $0xb,%eax
    3d0f:	cd 40                	int    $0x40
    3d11:	c3                   	ret    

00003d12 <sbrk>:
SYSCALL(sbrk)
    3d12:	b8 0c 00 00 00       	mov    $0xc,%eax
    3d17:	cd 40                	int    $0x40
    3d19:	c3                   	ret    

00003d1a <sleep>:
SYSCALL(sleep)
    3d1a:	b8 0d 00 00 00       	mov    $0xd,%eax
    3d1f:	cd 40                	int    $0x40
    3d21:	c3                   	ret    

00003d22 <uptime>:
SYSCALL(uptime)
    3d22:	b8 0e 00 00 00       	mov    $0xe,%eax
    3d27:	cd 40                	int    $0x40
    3d29:	c3                   	ret    

00003d2a <getMsg>:
SYSCALL(getMsg)
    3d2a:	b8 16 00 00 00       	mov    $0x16,%eax
    3d2f:	cd 40                	int    $0x40
    3d31:	c3                   	ret    

00003d32 <createWindow>:
SYSCALL(createWindow)
    3d32:	b8 17 00 00 00       	mov    $0x17,%eax
    3d37:	cd 40                	int    $0x40
    3d39:	c3                   	ret    

00003d3a <destroyWindow>:
SYSCALL(destroyWindow)
    3d3a:	b8 18 00 00 00       	mov    $0x18,%eax
    3d3f:	cd 40                	int    $0x40
    3d41:	c3                   	ret    

00003d42 <updateWindow>:
SYSCALL(updateWindow)
    3d42:	b8 19 00 00 00       	mov    $0x19,%eax
    3d47:	cd 40                	int    $0x40
    3d49:	c3                   	ret    

00003d4a <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    3d4a:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3d4f:	cd 40                	int    $0x40
    3d51:	c3                   	ret    

00003d52 <kwrite>:
SYSCALL(kwrite)
    3d52:	b8 1c 00 00 00       	mov    $0x1c,%eax
    3d57:	cd 40                	int    $0x40
    3d59:	c3                   	ret    

00003d5a <setSampleRate>:
SYSCALL(setSampleRate)
    3d5a:	b8 1b 00 00 00       	mov    $0x1b,%eax
    3d5f:	cd 40                	int    $0x40
    3d61:	c3                   	ret    

00003d62 <pause>:
SYSCALL(pause)
    3d62:	b8 1d 00 00 00       	mov    $0x1d,%eax
    3d67:	cd 40                	int    $0x40
    3d69:	c3                   	ret    

00003d6a <wavdecode>:
SYSCALL(wavdecode)
    3d6a:	b8 1e 00 00 00       	mov    $0x1e,%eax
    3d6f:	cd 40                	int    $0x40
    3d71:	c3                   	ret    

00003d72 <beginDecode>:
SYSCALL(beginDecode)
    3d72:	b8 1f 00 00 00       	mov    $0x1f,%eax
    3d77:	cd 40                	int    $0x40
    3d79:	c3                   	ret    

00003d7a <waitForDecode>:
SYSCALL(waitForDecode)
    3d7a:	b8 20 00 00 00       	mov    $0x20,%eax
    3d7f:	cd 40                	int    $0x40
    3d81:	c3                   	ret    

00003d82 <endDecode>:
SYSCALL(endDecode)
    3d82:	b8 21 00 00 00       	mov    $0x21,%eax
    3d87:	cd 40                	int    $0x40
    3d89:	c3                   	ret    

00003d8a <getCoreBuf>:
    3d8a:	b8 22 00 00 00       	mov    $0x22,%eax
    3d8f:	cd 40                	int    $0x40
    3d91:	c3                   	ret    

00003d92 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3d92:	55                   	push   %ebp
    3d93:	89 e5                	mov    %esp,%ebp
    3d95:	83 ec 18             	sub    $0x18,%esp
    3d98:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d9b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3d9e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3da5:	00 
    3da6:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3da9:	89 44 24 04          	mov    %eax,0x4(%esp)
    3dad:	8b 45 08             	mov    0x8(%ebp),%eax
    3db0:	89 04 24             	mov    %eax,(%esp)
    3db3:	e8 f2 fe ff ff       	call   3caa <write>
}
    3db8:	c9                   	leave  
    3db9:	c3                   	ret    

00003dba <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3dba:	55                   	push   %ebp
    3dbb:	89 e5                	mov    %esp,%ebp
    3dbd:	56                   	push   %esi
    3dbe:	53                   	push   %ebx
    3dbf:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3dc2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3dc9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3dcd:	74 17                	je     3de6 <printint+0x2c>
    3dcf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3dd3:	79 11                	jns    3de6 <printint+0x2c>
    neg = 1;
    3dd5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3ddc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ddf:	f7 d8                	neg    %eax
    3de1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3de4:	eb 06                	jmp    3dec <printint+0x32>
  } else {
    x = xx;
    3de6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3de9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3dec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3df3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3df6:	8d 41 01             	lea    0x1(%ecx),%eax
    3df9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3dfc:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3dff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e02:	ba 00 00 00 00       	mov    $0x0,%edx
    3e07:	f7 f3                	div    %ebx
    3e09:	89 d0                	mov    %edx,%eax
    3e0b:	0f b6 80 20 a6 00 00 	movzbl 0xa620(%eax),%eax
    3e12:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3e16:	8b 75 10             	mov    0x10(%ebp),%esi
    3e19:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3e1c:	ba 00 00 00 00       	mov    $0x0,%edx
    3e21:	f7 f6                	div    %esi
    3e23:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3e26:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3e2a:	75 c7                	jne    3df3 <printint+0x39>
  if(neg)
    3e2c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3e30:	74 10                	je     3e42 <printint+0x88>
    buf[i++] = '-';
    3e32:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e35:	8d 50 01             	lea    0x1(%eax),%edx
    3e38:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3e3b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3e40:	eb 1f                	jmp    3e61 <printint+0xa7>
    3e42:	eb 1d                	jmp    3e61 <printint+0xa7>
    putc(fd, buf[i]);
    3e44:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3e4a:	01 d0                	add    %edx,%eax
    3e4c:	0f b6 00             	movzbl (%eax),%eax
    3e4f:	0f be c0             	movsbl %al,%eax
    3e52:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e56:	8b 45 08             	mov    0x8(%ebp),%eax
    3e59:	89 04 24             	mov    %eax,(%esp)
    3e5c:	e8 31 ff ff ff       	call   3d92 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3e61:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3e65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e69:	79 d9                	jns    3e44 <printint+0x8a>
    putc(fd, buf[i]);
}
    3e6b:	83 c4 30             	add    $0x30,%esp
    3e6e:	5b                   	pop    %ebx
    3e6f:	5e                   	pop    %esi
    3e70:	5d                   	pop    %ebp
    3e71:	c3                   	ret    

00003e72 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3e72:	55                   	push   %ebp
    3e73:	89 e5                	mov    %esp,%ebp
    3e75:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3e78:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3e7f:	8d 45 0c             	lea    0xc(%ebp),%eax
    3e82:	83 c0 04             	add    $0x4,%eax
    3e85:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3e88:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3e8f:	e9 7c 01 00 00       	jmp    4010 <printf+0x19e>
    c = fmt[i] & 0xff;
    3e94:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e97:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3e9a:	01 d0                	add    %edx,%eax
    3e9c:	0f b6 00             	movzbl (%eax),%eax
    3e9f:	0f be c0             	movsbl %al,%eax
    3ea2:	25 ff 00 00 00       	and    $0xff,%eax
    3ea7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3eaa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3eae:	75 2c                	jne    3edc <printf+0x6a>
      if(c == '%'){
    3eb0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3eb4:	75 0c                	jne    3ec2 <printf+0x50>
        state = '%';
    3eb6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3ebd:	e9 4a 01 00 00       	jmp    400c <printf+0x19a>
      } else {
        putc(fd, c);
    3ec2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ec5:	0f be c0             	movsbl %al,%eax
    3ec8:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ecc:	8b 45 08             	mov    0x8(%ebp),%eax
    3ecf:	89 04 24             	mov    %eax,(%esp)
    3ed2:	e8 bb fe ff ff       	call   3d92 <putc>
    3ed7:	e9 30 01 00 00       	jmp    400c <printf+0x19a>
      }
    } else if(state == '%'){
    3edc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3ee0:	0f 85 26 01 00 00    	jne    400c <printf+0x19a>
      if(c == 'd'){
    3ee6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3eea:	75 2d                	jne    3f19 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    3eec:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3eef:	8b 00                	mov    (%eax),%eax
    3ef1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3ef8:	00 
    3ef9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3f00:	00 
    3f01:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f05:	8b 45 08             	mov    0x8(%ebp),%eax
    3f08:	89 04 24             	mov    %eax,(%esp)
    3f0b:	e8 aa fe ff ff       	call   3dba <printint>
        ap++;
    3f10:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f14:	e9 ec 00 00 00       	jmp    4005 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    3f19:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3f1d:	74 06                	je     3f25 <printf+0xb3>
    3f1f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3f23:	75 2d                	jne    3f52 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    3f25:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f28:	8b 00                	mov    (%eax),%eax
    3f2a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3f31:	00 
    3f32:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    3f39:	00 
    3f3a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f3e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f41:	89 04 24             	mov    %eax,(%esp)
    3f44:	e8 71 fe ff ff       	call   3dba <printint>
        ap++;
    3f49:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f4d:	e9 b3 00 00 00       	jmp    4005 <printf+0x193>
      } else if(c == 's'){
    3f52:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3f56:	75 45                	jne    3f9d <printf+0x12b>
        s = (char*)*ap;
    3f58:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3f5b:	8b 00                	mov    (%eax),%eax
    3f5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3f60:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3f64:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3f68:	75 09                	jne    3f73 <printf+0x101>
          s = "(null)";
    3f6a:	c7 45 f4 aa 8e 00 00 	movl   $0x8eaa,-0xc(%ebp)
        while(*s != 0){
    3f71:	eb 1e                	jmp    3f91 <printf+0x11f>
    3f73:	eb 1c                	jmp    3f91 <printf+0x11f>
          putc(fd, *s);
    3f75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f78:	0f b6 00             	movzbl (%eax),%eax
    3f7b:	0f be c0             	movsbl %al,%eax
    3f7e:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f82:	8b 45 08             	mov    0x8(%ebp),%eax
    3f85:	89 04 24             	mov    %eax,(%esp)
    3f88:	e8 05 fe ff ff       	call   3d92 <putc>
          s++;
    3f8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3f94:	0f b6 00             	movzbl (%eax),%eax
    3f97:	84 c0                	test   %al,%al
    3f99:	75 da                	jne    3f75 <printf+0x103>
    3f9b:	eb 68                	jmp    4005 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3f9d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3fa1:	75 1d                	jne    3fc0 <printf+0x14e>
        putc(fd, *ap);
    3fa3:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3fa6:	8b 00                	mov    (%eax),%eax
    3fa8:	0f be c0             	movsbl %al,%eax
    3fab:	89 44 24 04          	mov    %eax,0x4(%esp)
    3faf:	8b 45 08             	mov    0x8(%ebp),%eax
    3fb2:	89 04 24             	mov    %eax,(%esp)
    3fb5:	e8 d8 fd ff ff       	call   3d92 <putc>
        ap++;
    3fba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3fbe:	eb 45                	jmp    4005 <printf+0x193>
      } else if(c == '%'){
    3fc0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3fc4:	75 17                	jne    3fdd <printf+0x16b>
        putc(fd, c);
    3fc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3fc9:	0f be c0             	movsbl %al,%eax
    3fcc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    3fd3:	89 04 24             	mov    %eax,(%esp)
    3fd6:	e8 b7 fd ff ff       	call   3d92 <putc>
    3fdb:	eb 28                	jmp    4005 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3fdd:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    3fe4:	00 
    3fe5:	8b 45 08             	mov    0x8(%ebp),%eax
    3fe8:	89 04 24             	mov    %eax,(%esp)
    3feb:	e8 a2 fd ff ff       	call   3d92 <putc>
        putc(fd, c);
    3ff0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ff3:	0f be c0             	movsbl %al,%eax
    3ff6:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ffa:	8b 45 08             	mov    0x8(%ebp),%eax
    3ffd:	89 04 24             	mov    %eax,(%esp)
    4000:	e8 8d fd ff ff       	call   3d92 <putc>
      }
      state = 0;
    4005:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    400c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4010:	8b 55 0c             	mov    0xc(%ebp),%edx
    4013:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4016:	01 d0                	add    %edx,%eax
    4018:	0f b6 00             	movzbl (%eax),%eax
    401b:	84 c0                	test   %al,%al
    401d:	0f 85 71 fe ff ff    	jne    3e94 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4023:	c9                   	leave  
    4024:	c3                   	ret    

00004025 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4025:	55                   	push   %ebp
    4026:	89 e5                	mov    %esp,%ebp
    4028:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    402b:	8b 45 08             	mov    0x8(%ebp),%eax
    402e:	83 e8 08             	sub    $0x8,%eax
    4031:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4034:	a1 10 d7 00 00       	mov    0xd710,%eax
    4039:	89 45 fc             	mov    %eax,-0x4(%ebp)
    403c:	eb 24                	jmp    4062 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    403e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4041:	8b 00                	mov    (%eax),%eax
    4043:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4046:	77 12                	ja     405a <free+0x35>
    4048:	8b 45 f8             	mov    -0x8(%ebp),%eax
    404b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    404e:	77 24                	ja     4074 <free+0x4f>
    4050:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4053:	8b 00                	mov    (%eax),%eax
    4055:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4058:	77 1a                	ja     4074 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    405a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    405d:	8b 00                	mov    (%eax),%eax
    405f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4062:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4065:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    4068:	76 d4                	jbe    403e <free+0x19>
    406a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    406d:	8b 00                	mov    (%eax),%eax
    406f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4072:	76 ca                	jbe    403e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    4074:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4077:	8b 40 04             	mov    0x4(%eax),%eax
    407a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4081:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4084:	01 c2                	add    %eax,%edx
    4086:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4089:	8b 00                	mov    (%eax),%eax
    408b:	39 c2                	cmp    %eax,%edx
    408d:	75 24                	jne    40b3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    408f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4092:	8b 50 04             	mov    0x4(%eax),%edx
    4095:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4098:	8b 00                	mov    (%eax),%eax
    409a:	8b 40 04             	mov    0x4(%eax),%eax
    409d:	01 c2                	add    %eax,%edx
    409f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40a2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    40a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40a8:	8b 00                	mov    (%eax),%eax
    40aa:	8b 10                	mov    (%eax),%edx
    40ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40af:	89 10                	mov    %edx,(%eax)
    40b1:	eb 0a                	jmp    40bd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    40b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40b6:	8b 10                	mov    (%eax),%edx
    40b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40bb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    40bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40c0:	8b 40 04             	mov    0x4(%eax),%eax
    40c3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    40ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40cd:	01 d0                	add    %edx,%eax
    40cf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    40d2:	75 20                	jne    40f4 <free+0xcf>
    p->s.size += bp->s.size;
    40d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40d7:	8b 50 04             	mov    0x4(%eax),%edx
    40da:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40dd:	8b 40 04             	mov    0x4(%eax),%eax
    40e0:	01 c2                	add    %eax,%edx
    40e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40e5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    40e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    40eb:	8b 10                	mov    (%eax),%edx
    40ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40f0:	89 10                	mov    %edx,(%eax)
    40f2:	eb 08                	jmp    40fc <free+0xd7>
  } else
    p->s.ptr = bp;
    40f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40f7:	8b 55 f8             	mov    -0x8(%ebp),%edx
    40fa:	89 10                	mov    %edx,(%eax)
  freep = p;
    40fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    40ff:	a3 10 d7 00 00       	mov    %eax,0xd710
}
    4104:	c9                   	leave  
    4105:	c3                   	ret    

00004106 <morecore>:

static Header*
morecore(uint nu)
{
    4106:	55                   	push   %ebp
    4107:	89 e5                	mov    %esp,%ebp
    4109:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    410c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4113:	77 07                	ja     411c <morecore+0x16>
    nu = 4096;
    4115:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    411c:	8b 45 08             	mov    0x8(%ebp),%eax
    411f:	c1 e0 03             	shl    $0x3,%eax
    4122:	89 04 24             	mov    %eax,(%esp)
    4125:	e8 e8 fb ff ff       	call   3d12 <sbrk>
    412a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    412d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4131:	75 07                	jne    413a <morecore+0x34>
    return 0;
    4133:	b8 00 00 00 00       	mov    $0x0,%eax
    4138:	eb 22                	jmp    415c <morecore+0x56>
  hp = (Header*)p;
    413a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    413d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    4140:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4143:	8b 55 08             	mov    0x8(%ebp),%edx
    4146:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4149:	8b 45 f0             	mov    -0x10(%ebp),%eax
    414c:	83 c0 08             	add    $0x8,%eax
    414f:	89 04 24             	mov    %eax,(%esp)
    4152:	e8 ce fe ff ff       	call   4025 <free>
  return freep;
    4157:	a1 10 d7 00 00       	mov    0xd710,%eax
}
    415c:	c9                   	leave  
    415d:	c3                   	ret    

0000415e <malloc>:

void*
malloc(uint nbytes)
{
    415e:	55                   	push   %ebp
    415f:	89 e5                	mov    %esp,%ebp
    4161:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4164:	8b 45 08             	mov    0x8(%ebp),%eax
    4167:	83 c0 07             	add    $0x7,%eax
    416a:	c1 e8 03             	shr    $0x3,%eax
    416d:	83 c0 01             	add    $0x1,%eax
    4170:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    4173:	a1 10 d7 00 00       	mov    0xd710,%eax
    4178:	89 45 f0             	mov    %eax,-0x10(%ebp)
    417b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    417f:	75 23                	jne    41a4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    4181:	c7 45 f0 08 d7 00 00 	movl   $0xd708,-0x10(%ebp)
    4188:	8b 45 f0             	mov    -0x10(%ebp),%eax
    418b:	a3 10 d7 00 00       	mov    %eax,0xd710
    4190:	a1 10 d7 00 00       	mov    0xd710,%eax
    4195:	a3 08 d7 00 00       	mov    %eax,0xd708
    base.s.size = 0;
    419a:	c7 05 0c d7 00 00 00 	movl   $0x0,0xd70c
    41a1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    41a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41a7:	8b 00                	mov    (%eax),%eax
    41a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    41ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41af:	8b 40 04             	mov    0x4(%eax),%eax
    41b2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    41b5:	72 4d                	jb     4204 <malloc+0xa6>
      if(p->s.size == nunits)
    41b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ba:	8b 40 04             	mov    0x4(%eax),%eax
    41bd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    41c0:	75 0c                	jne    41ce <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    41c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41c5:	8b 10                	mov    (%eax),%edx
    41c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41ca:	89 10                	mov    %edx,(%eax)
    41cc:	eb 26                	jmp    41f4 <malloc+0x96>
      else {
        p->s.size -= nunits;
    41ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41d1:	8b 40 04             	mov    0x4(%eax),%eax
    41d4:	2b 45 ec             	sub    -0x14(%ebp),%eax
    41d7:	89 c2                	mov    %eax,%edx
    41d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41dc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    41df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41e2:	8b 40 04             	mov    0x4(%eax),%eax
    41e5:	c1 e0 03             	shl    $0x3,%eax
    41e8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    41eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ee:	8b 55 ec             	mov    -0x14(%ebp),%edx
    41f1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    41f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41f7:	a3 10 d7 00 00       	mov    %eax,0xd710
      return (void*)(p + 1);
    41fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    41ff:	83 c0 08             	add    $0x8,%eax
    4202:	eb 38                	jmp    423c <malloc+0xde>
    }
    if(p == freep)
    4204:	a1 10 d7 00 00       	mov    0xd710,%eax
    4209:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    420c:	75 1b                	jne    4229 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    420e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4211:	89 04 24             	mov    %eax,(%esp)
    4214:	e8 ed fe ff ff       	call   4106 <morecore>
    4219:	89 45 f4             	mov    %eax,-0xc(%ebp)
    421c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4220:	75 07                	jne    4229 <malloc+0xcb>
        return 0;
    4222:	b8 00 00 00 00       	mov    $0x0,%eax
    4227:	eb 13                	jmp    423c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4229:	8b 45 f4             	mov    -0xc(%ebp),%eax
    422c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    422f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4232:	8b 00                	mov    (%eax),%eax
    4234:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4237:	e9 70 ff ff ff       	jmp    41ac <malloc+0x4e>
}
    423c:	c9                   	leave  
    423d:	c3                   	ret    

0000423e <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    423e:	55                   	push   %ebp
    423f:	89 e5                	mov    %esp,%ebp
	return (x>= 0 ? x : -x);
    4241:	8b 45 08             	mov    0x8(%ebp),%eax
    4244:	99                   	cltd   
    4245:	89 d0                	mov    %edx,%eax
    4247:	33 45 08             	xor    0x8(%ebp),%eax
    424a:	29 d0                	sub    %edx,%eax
}
    424c:	5d                   	pop    %ebp
    424d:	c3                   	ret    

0000424e <sin>:

double sin(double x)  
{  
    424e:	55                   	push   %ebp
    424f:	89 e5                	mov    %esp,%ebp
    4251:	83 ec 10             	sub    $0x10,%esp
    4254:	8b 45 08             	mov    0x8(%ebp),%eax
    4257:	89 45 f8             	mov    %eax,-0x8(%ebp)
    425a:	8b 45 0c             	mov    0xc(%ebp),%eax
    425d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   __asm__ (
    4260:	dd 45 f8             	fldl   -0x8(%ebp)
    4263:	d9 fe                	fsin   
    4265:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fsin"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
    4268:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    426b:	c9                   	leave  
    426c:	c3                   	ret    

0000426d <cos>:

double cos(double x)  
{  
    426d:	55                   	push   %ebp
    426e:	89 e5                	mov    %esp,%ebp
    4270:	83 ec 10             	sub    $0x10,%esp
    4273:	8b 45 08             	mov    0x8(%ebp),%eax
    4276:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4279:	8b 45 0c             	mov    0xc(%ebp),%eax
    427c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    427f:	dd 45 f8             	fldl   -0x8(%ebp)
    4282:	d9 ff                	fcos   
    4284:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fcos"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;  
    4287:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    428a:	c9                   	leave  
    428b:	c3                   	ret    

0000428c <tan>:

double tan(double x)  
{  
    428c:	55                   	push   %ebp
    428d:	89 e5                	mov    %esp,%ebp
    428f:	83 ec 10             	sub    $0x10,%esp
    4292:	8b 45 08             	mov    0x8(%ebp),%eax
    4295:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4298:	8b 45 0c             	mov    0xc(%ebp),%eax
    429b:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   register double value;
   __asm__(
    429e:	dd 45 f8             	fldl   -0x8(%ebp)
    42a1:	d9 f2                	fptan  
    42a3:	dd d8                	fstp   %st(0)
    42a5:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fptan"
      : "=t" (value),
      "=u" (ret)
      : "0" (x)
   );
   return ret;
    42a8:	dd 45 f0             	fldl   -0x10(%ebp)
}  
    42ab:	c9                   	leave  
    42ac:	c3                   	ret    

000042ad <log2>:

double log2(double x)
{
    42ad:	55                   	push   %ebp
    42ae:	89 e5                	mov    %esp,%ebp
    42b0:	83 ec 10             	sub    $0x10,%esp
    42b3:	8b 45 08             	mov    0x8(%ebp),%eax
    42b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    42b9:	8b 45 0c             	mov    0xc(%ebp),%eax
    42bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
   register double ret;
   __asm__(
    42bf:	dd 45 f8             	fldl   -0x8(%ebp)
    42c2:	d9 e8                	fld1   
    42c4:	d9 c9                	fxch   %st(1)
    42c6:	d9 f1                	fyl2x  
    42c8:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fxch\n\t"
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );
   return ret;
    42cb:	dd 45 f0             	fldl   -0x10(%ebp)
}
    42ce:	c9                   	leave  
    42cf:	c3                   	ret    

000042d0 <pow>:

double pow(double x, double y)
{
    42d0:	55                   	push   %ebp
    42d1:	89 e5                	mov    %esp,%ebp
    42d3:	83 ec 30             	sub    $0x30,%esp
    42d6:	8b 45 08             	mov    0x8(%ebp),%eax
    42d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    42dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    42df:	89 45 ec             	mov    %eax,-0x14(%ebp)
    42e2:	8b 45 10             	mov    0x10(%ebp),%eax
    42e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    42e8:	8b 45 14             	mov    0x14(%ebp),%eax
    42eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   register double ret, value;
   double r = 1.0;
    42ee:	d9 e8                	fld1   
    42f0:	dd 5d f8             	fstpl  -0x8(%ebp)
   long p = (long) y;
    42f3:	dd 45 e0             	fldl   -0x20(%ebp)
    42f6:	d9 7d de             	fnstcw -0x22(%ebp)
    42f9:	0f b7 45 de          	movzwl -0x22(%ebp),%eax
    42fd:	b4 0c                	mov    $0xc,%ah
    42ff:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
    4303:	d9 6d dc             	fldcw  -0x24(%ebp)
    4306:	db 5d f4             	fistpl -0xc(%ebp)
    4309:	d9 6d de             	fldcw  -0x22(%ebp)
   if (x == 0.0 && y > 0.0)
    430c:	dd 45 e8             	fldl   -0x18(%ebp)
    430f:	d9 ee                	fldz   
    4311:	df e9                	fucomip %st(1),%st
    4313:	dd d8                	fstp   %st(0)
    4315:	7a 1f                	jp     4336 <pow+0x66>
    4317:	dd 45 e8             	fldl   -0x18(%ebp)
    431a:	d9 ee                	fldz   
    431c:	df e9                	fucomip %st(1),%st
    431e:	dd d8                	fstp   %st(0)
    4320:	75 14                	jne    4336 <pow+0x66>
    4322:	dd 45 e0             	fldl   -0x20(%ebp)
    4325:	d9 ee                	fldz   
    4327:	d9 c9                	fxch   %st(1)
    4329:	df e9                	fucomip %st(1),%st
    432b:	dd d8                	fstp   %st(0)
    432d:	76 07                	jbe    4336 <pow+0x66>
      return 0.0;
    432f:	d9 ee                	fldz   
    4331:	e9 80 00 00 00       	jmp    43b6 <pow+0xe6>
   if (y == (double) p)
    4336:	db 45 f4             	fildl  -0xc(%ebp)
    4339:	dd 45 e0             	fldl   -0x20(%ebp)
    433c:	df e9                	fucomip %st(1),%st
    433e:	7a 50                	jp     4390 <pow+0xc0>
    4340:	dd 45 e0             	fldl   -0x20(%ebp)
    4343:	df e9                	fucomip %st(1),%st
    4345:	dd d8                	fstp   %st(0)
    4347:	75 49                	jne    4392 <pow+0xc2>
   {
      if (p == 0)
    4349:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    434d:	75 04                	jne    4353 <pow+0x83>
        return 1.0;
    434f:	d9 e8                	fld1   
    4351:	eb 63                	jmp    43b6 <pow+0xe6>
      if (p < 0)
    4353:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4357:	79 0b                	jns    4364 <pow+0x94>
      {
        p = -p;
    4359:	f7 5d f4             	negl   -0xc(%ebp)
        x = 1.0 / x;
    435c:	d9 e8                	fld1   
    435e:	dc 75 e8             	fdivl  -0x18(%ebp)
    4361:	dd 5d e8             	fstpl  -0x18(%ebp)
      }
      while (1)
      {
        if (p & 1)
    4364:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4367:	83 e0 01             	and    $0x1,%eax
    436a:	85 c0                	test   %eax,%eax
    436c:	74 09                	je     4377 <pow+0xa7>
           r *= x;
    436e:	dd 45 f8             	fldl   -0x8(%ebp)
    4371:	dc 4d e8             	fmull  -0x18(%ebp)
    4374:	dd 5d f8             	fstpl  -0x8(%ebp)
        p >>= 1;
    4377:	d1 7d f4             	sarl   -0xc(%ebp)
        if (p == 0)
    437a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    437e:	75 05                	jne    4385 <pow+0xb5>
           return r;
    4380:	dd 45 f8             	fldl   -0x8(%ebp)
    4383:	eb 31                	jmp    43b6 <pow+0xe6>
        x *= x;
    4385:	dd 45 e8             	fldl   -0x18(%ebp)
    4388:	dc 4d e8             	fmull  -0x18(%ebp)
    438b:	dd 5d e8             	fstpl  -0x18(%ebp)
      }
    438e:	eb d4                	jmp    4364 <pow+0x94>
    4390:	dd d8                	fstp   %st(0)
      "frndint;\n\t"
      "fxch;\n\t"
      "fsub %%st(1);\n\t"
      "f2xm1;\n\t"
      : "=t" (ret), "=u" (value)
      :  "0" (log2 (x)), "1" (y)
    4392:	dd 45 e8             	fldl   -0x18(%ebp)
    4395:	dd 1c 24             	fstpl  (%esp)
    4398:	e8 10 ff ff ff       	call   42ad <log2>
        if (p == 0)
           return r;
        x *= x;
      }
   }
   __asm__(
    439d:	dd 45 e0             	fldl   -0x20(%ebp)
    43a0:	d9 c9                	fxch   %st(1)
    43a2:	d8 c9                	fmul   %st(1),%st
    43a4:	dd d1                	fst    %st(1)
    43a6:	d9 fc                	frndint 
    43a8:	d9 c9                	fxch   %st(1)
    43aa:	d8 e1                	fsub   %st(1),%st
    43ac:	d9 f0                	f2xm1  
      "fsub %%st(1);\n\t"
      "f2xm1;\n\t"
      : "=t" (ret), "=u" (value)
      :  "0" (log2 (x)), "1" (y)
   );
   ret += 1.0;
    43ae:	d9 e8                	fld1   
    43b0:	de c1                	faddp  %st,%st(1)
   __asm__(
    43b2:	d9 fd                	fscale 
    43b4:	dd d9                	fstp   %st(1)
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
}
    43b6:	c9                   	leave  
    43b7:	c3                   	ret    

000043b8 <sqrt>:
// 求根
double sqrt(double x)
{
    43b8:	55                   	push   %ebp
    43b9:	89 e5                	mov    %esp,%ebp
    43bb:	83 ec 10             	sub    $0x10,%esp
    43be:	8b 45 08             	mov    0x8(%ebp),%eax
    43c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
    43c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    43c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    43ca:	dd 45 f8             	fldl   -0x8(%ebp)
    43cd:	d9 fa                	fsqrt  
    43cf:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fsqrt"
      : "=t" (ret)
      : "0" (x)
      );
   return ret;
    43d2:	dd 45 f0             	fldl   -0x10(%ebp)
}
    43d5:	c9                   	leave  
    43d6:	c3                   	ret    

000043d7 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    43d7:	55                   	push   %ebp
    43d8:	89 e5                	mov    %esp,%ebp
    43da:	83 ec 10             	sub    $0x10,%esp
    43dd:	8b 45 08             	mov    0x8(%ebp),%eax
    43e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
    43e3:	8b 45 0c             	mov    0xc(%ebp),%eax
    43e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret;
   __asm__(
    43e9:	dd 45 f8             	fldl   -0x8(%ebp)
    43ec:	d9 ed                	fldln2 
    43ee:	d9 c9                	fxch   %st(1)
    43f0:	d9 f1                	fyl2x  
    43f2:	dd 5d f0             	fstpl  -0x10(%ebp)
      "fyl2x"
      : "=t" (ret)
      : "0" (x)
   );

   return ret;
    43f5:	dd 45 f0             	fldl   -0x10(%ebp)
}
    43f8:	c9                   	leave  
    43f9:	c3                   	ret    

000043fa <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    43fa:	55                   	push   %ebp
    43fb:	89 e5                	mov    %esp,%ebp
    43fd:	83 ec 08             	sub    $0x8,%esp
    4400:	8b 45 08             	mov    0x8(%ebp),%eax
    4403:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4406:	8b 45 0c             	mov    0xc(%ebp),%eax
    4409:	89 45 fc             	mov    %eax,-0x4(%ebp)
	register double ret, value;
   __asm__(
    440c:	dd 45 f8             	fldl   -0x8(%ebp)
    440f:	d9 ea                	fldl2e 
    4411:	d8 c9                	fmul   %st(1),%st
    4413:	dd d1                	fst    %st(1)
    4415:	d9 fc                	frndint 
    4417:	d9 c9                	fxch   %st(1)
    4419:	d8 e1                	fsub   %st(1),%st
    441b:	d9 f0                	f2xm1  
      "fsub %%st(1);" 
      "f2xm1"
      : "=t" (ret), "=u" (value)
      : "0" (x)
   );
   ret += 1.0;
    441d:	d9 e8                	fld1   
    441f:	de c1                	faddp  %st,%st(1)
   __asm__(
    4421:	d9 fd                	fscale 
    4423:	dd d9                	fstp   %st(1)
      "fscale"
      : "=t" (ret)
      : "0" (ret), "u" (value)
   );
   return ret;
}
    4425:	c9                   	leave  
    4426:	c3                   	ret    

00004427 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    4427:	55                   	push   %ebp
    4428:	89 e5                	mov    %esp,%ebp
    442a:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    442d:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    4431:	8b 45 08             	mov    0x8(%ebp),%eax
    4434:	89 44 24 04          	mov    %eax,0x4(%esp)
    4438:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    443b:	89 04 24             	mov    %eax,(%esp)
    443e:	e8 04 f6 ff ff       	call   3a47 <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    4443:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    444a:	00 
    444b:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    444e:	89 04 24             	mov    %eax,(%esp)
    4451:	e8 74 f8 ff ff       	call   3cca <open>
    4456:	89 45 f4             	mov    %eax,-0xc(%ebp)
    4459:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    445d:	75 1b                	jne    447a <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    445f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    4462:	89 44 24 08          	mov    %eax,0x8(%esp)
    4466:	c7 44 24 04 e4 8e 00 	movl   $0x8ee4,0x4(%esp)
    446d:	00 
    446e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4475:	e8 f8 f9 ff ff       	call   3e72 <printf>
    }
    return f;
    447a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    447d:	c9                   	leave  
    447e:	c3                   	ret    

0000447f <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    447f:	55                   	push   %ebp
    4480:	89 e5                	mov    %esp,%ebp
    4482:	57                   	push   %edi
    4483:	56                   	push   %esi
    4484:	53                   	push   %ebx
    4485:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    4488:	8b 45 08             	mov    0x8(%ebp),%eax
    448b:	8b 00                	mov    (%eax),%eax
    448d:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    4490:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4493:	8b 78 14             	mov    0x14(%eax),%edi
    4496:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4499:	8b 70 10             	mov    0x10(%eax),%esi
    449c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    449f:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    44a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44a5:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    44a8:	85 c0                	test   %eax,%eax
    44aa:	0f 94 c0             	sete   %al
    44ad:	0f b6 c8             	movzbl %al,%ecx
    44b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44b3:	8b 50 04             	mov    0x4(%eax),%edx
    44b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44b9:	8b 00                	mov    (%eax),%eax
    44bb:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    44bf:	89 74 24 18          	mov    %esi,0x18(%esp)
    44c3:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    44c7:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    44cb:	89 54 24 0c          	mov    %edx,0xc(%esp)
    44cf:	89 44 24 08          	mov    %eax,0x8(%esp)
    44d3:	c7 44 24 04 04 8f 00 	movl   $0x8f04,0x4(%esp)
    44da:	00 
    44db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    44e2:	e8 8b f9 ff ff       	call   3e72 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    44e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44ea:	8b 78 2c             	mov    0x2c(%eax),%edi
    44ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44f0:	8b 70 28             	mov    0x28(%eax),%esi
    44f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44f6:	8b 58 24             	mov    0x24(%eax),%ebx
    44f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    44fc:	8b 48 20             	mov    0x20(%eax),%ecx
    44ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4502:	8b 50 1c             	mov    0x1c(%eax),%edx
    4505:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4508:	8b 40 18             	mov    0x18(%eax),%eax
    450b:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    450f:	89 74 24 18          	mov    %esi,0x18(%esp)
    4513:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    4517:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    451b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    451f:	89 44 24 08          	mov    %eax,0x8(%esp)
    4523:	c7 44 24 04 44 8f 00 	movl   $0x8f44,0x4(%esp)
    452a:	00 
    452b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4532:	e8 3b f9 ff ff       	call   3e72 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4537:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    453a:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    453d:	8b 0c 85 40 a7 00 00 	mov    0xa740(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    4544:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4547:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    454a:	dd 04 c5 20 a7 00 00 	fldl   0xa720(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4551:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4554:	8b 40 04             	mov    0x4(%eax),%eax
    4557:	8d 50 ff             	lea    -0x1(%eax),%edx
    455a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    455d:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4560:	89 d0                	mov    %edx,%eax
    4562:	c1 e0 04             	shl    $0x4,%eax
    4565:	29 d0                	sub    %edx,%eax
    4567:	01 d8                	add    %ebx,%eax
    4569:	8b 14 85 60 a6 00 00 	mov    0xa660(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    4570:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4573:	8b 40 04             	mov    0x4(%eax),%eax
    4576:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    4579:	8b 04 85 40 a6 00 00 	mov    0xa640(,%eax,4),%eax
    4580:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4584:	dd 5c 24 10          	fstpl  0x10(%esp)
    4588:	89 54 24 0c          	mov    %edx,0xc(%esp)
    458c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4590:	c7 44 24 04 6c 8f 00 	movl   $0x8f6c,0x4(%esp)
    4597:	00 
    4598:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    459f:	e8 ce f8 ff ff       	call   3e72 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    45a4:	8b 45 08             	mov    0x8(%ebp),%eax
    45a7:	8b 48 08             	mov    0x8(%eax),%ecx
    45aa:	8b 45 08             	mov    0x8(%ebp),%eax
    45ad:	8b 50 0c             	mov    0xc(%eax),%edx
    45b0:	8b 45 08             	mov    0x8(%ebp),%eax
    45b3:	8b 40 10             	mov    0x10(%eax),%eax
    45b6:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    45ba:	89 54 24 0c          	mov    %edx,0xc(%esp)
    45be:	89 44 24 08          	mov    %eax,0x8(%esp)
    45c2:	c7 44 24 04 9b 8f 00 	movl   $0x8f9b,0x4(%esp)
    45c9:	00 
    45ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    45d1:	e8 9c f8 ff ff       	call   3e72 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    45d6:	83 c4 3c             	add    $0x3c,%esp
    45d9:	5b                   	pop    %ebx
    45da:	5e                   	pop    %esi
    45db:	5f                   	pop    %edi
    45dc:	5d                   	pop    %ebp
    45dd:	c3                   	ret    

000045de <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    45de:	55                   	push   %ebp
    45df:	89 e5                	mov    %esp,%ebp
    45e1:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    45e4:	8b 45 08             	mov    0x8(%ebp),%eax
    45e7:	89 04 24             	mov    %eax,(%esp)
    45ea:	e8 6f fb ff ff       	call   415e <malloc>
    45ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    45f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    45f6:	74 1c                	je     4614 <mem_alloc+0x36>
		memset(ptr, 0, block);
    45f8:	8b 45 08             	mov    0x8(%ebp),%eax
    45fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    45ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4606:	00 
    4607:	8b 45 f4             	mov    -0xc(%ebp),%eax
    460a:	89 04 24             	mov    %eax,(%esp)
    460d:	e8 cb f4 ff ff       	call   3add <memset>
    4612:	eb 20                	jmp    4634 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    4614:	8b 45 0c             	mov    0xc(%ebp),%eax
    4617:	89 44 24 08          	mov    %eax,0x8(%esp)
    461b:	c7 44 24 04 b5 8f 00 	movl   $0x8fb5,0x4(%esp)
    4622:	00 
    4623:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    462a:	e8 43 f8 ff ff       	call   3e72 <printf>
		exit();
    462f:	e8 56 f6 ff ff       	call   3c8a <exit>
	}
	return ptr;
    4634:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    4637:	c9                   	leave  
    4638:	c3                   	ret    

00004639 <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    4639:	55                   	push   %ebp
    463a:	89 e5                	mov    %esp,%ebp
    463c:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    463f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4642:	c7 44 24 04 cc 8f 00 	movl   $0x8fcc,0x4(%esp)
    4649:	00 
    464a:	89 04 24             	mov    %eax,(%esp)
    464d:	e8 8c ff ff ff       	call   45de <mem_alloc>
    4652:	8b 55 08             	mov    0x8(%ebp),%edx
    4655:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    4658:	8b 45 08             	mov    0x8(%ebp),%eax
    465b:	8b 55 0c             	mov    0xc(%ebp),%edx
    465e:	89 50 08             	mov    %edx,0x8(%eax)
}
    4661:	c9                   	leave  
    4662:	c3                   	ret    

00004663 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    4663:	55                   	push   %ebp
    4664:	89 e5                	mov    %esp,%ebp
    4666:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    4669:	8b 45 08             	mov    0x8(%ebp),%eax
    466c:	8b 40 04             	mov    0x4(%eax),%eax
    466f:	89 04 24             	mov    %eax,(%esp)
    4672:	e8 ae f9 ff ff       	call   4025 <free>
}
    4677:	c9                   	leave  
    4678:	c3                   	ret    

00004679 <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    4679:	55                   	push   %ebp
    467a:	89 e5                	mov    %esp,%ebp
    467c:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    467f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    4686:	00 
    4687:	8b 45 0c             	mov    0xc(%ebp),%eax
    468a:	89 04 24             	mov    %eax,(%esp)
    468d:	e8 38 f6 ff ff       	call   3cca <open>
    4692:	8b 55 08             	mov    0x8(%ebp),%edx
    4695:	89 02                	mov    %eax,(%edx)
    4697:	8b 45 08             	mov    0x8(%ebp),%eax
    469a:	8b 00                	mov    (%eax),%eax
    469c:	83 f8 ff             	cmp    $0xffffffff,%eax
    469f:	75 20                	jne    46c1 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    46a1:	8b 45 0c             	mov    0xc(%ebp),%eax
    46a4:	89 44 24 08          	mov    %eax,0x8(%esp)
    46a8:	c7 44 24 04 d3 8f 00 	movl   $0x8fd3,0x4(%esp)
    46af:	00 
    46b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    46b7:	e8 b6 f7 ff ff       	call   3e72 <printf>
		exit();
    46bc:	e8 c9 f5 ff ff       	call   3c8a <exit>
	}

	bs->format = BINARY;
    46c1:	8b 45 08             	mov    0x8(%ebp),%eax
    46c4:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    46c8:	8b 45 10             	mov    0x10(%ebp),%eax
    46cb:	89 44 24 04          	mov    %eax,0x4(%esp)
    46cf:	8b 45 08             	mov    0x8(%ebp),%eax
    46d2:	89 04 24             	mov    %eax,(%esp)
    46d5:	e8 5f ff ff ff       	call   4639 <alloc_buffer>
	bs->buf_byte_idx=0;
    46da:	8b 45 08             	mov    0x8(%ebp),%eax
    46dd:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    46e4:	8b 45 08             	mov    0x8(%ebp),%eax
    46e7:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    46ee:	8b 45 08             	mov    0x8(%ebp),%eax
    46f1:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    46f8:	8b 45 08             	mov    0x8(%ebp),%eax
    46fb:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    4702:	8b 45 08             	mov    0x8(%ebp),%eax
    4705:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    470c:	8b 45 08             	mov    0x8(%ebp),%eax
    470f:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    4716:	c9                   	leave  
    4717:	c3                   	ret    

00004718 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    4718:	55                   	push   %ebp
    4719:	89 e5                	mov    %esp,%ebp
    471b:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    471e:	8b 45 08             	mov    0x8(%ebp),%eax
    4721:	8b 00                	mov    (%eax),%eax
    4723:	89 04 24             	mov    %eax,(%esp)
    4726:	e8 87 f5 ff ff       	call   3cb2 <close>
	desalloc_buffer(bs);
    472b:	8b 45 08             	mov    0x8(%ebp),%eax
    472e:	89 04 24             	mov    %eax,(%esp)
    4731:	e8 2d ff ff ff       	call   4663 <desalloc_buffer>
}
    4736:	c9                   	leave  
    4737:	c3                   	ret    

00004738 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    4738:	55                   	push   %ebp
    4739:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    473b:	8b 45 08             	mov    0x8(%ebp),%eax
    473e:	8b 40 20             	mov    0x20(%eax),%eax
}
    4741:	5d                   	pop    %ebp
    4742:	c3                   	ret    

00004743 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    4743:	55                   	push   %ebp
    4744:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    4746:	8b 45 08             	mov    0x8(%ebp),%eax
    4749:	8b 40 0c             	mov    0xc(%eax),%eax
}
    474c:	5d                   	pop    %ebp
    474d:	c3                   	ret    

0000474e <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    474e:	55                   	push   %ebp
    474f:	89 e5                	mov    %esp,%ebp
    4751:	56                   	push   %esi
    4752:	53                   	push   %ebx
    4753:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    4756:	8b 45 08             	mov    0x8(%ebp),%eax
    4759:	8b 40 08             	mov    0x8(%eax),%eax
    475c:	8d 50 fe             	lea    -0x2(%eax),%edx
    475f:	8b 45 08             	mov    0x8(%ebp),%eax
    4762:	8b 40 10             	mov    0x10(%eax),%eax
    4765:	89 d3                	mov    %edx,%ebx
    4767:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    4769:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    476e:	eb 35                	jmp    47a5 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    4770:	8b 45 08             	mov    0x8(%ebp),%eax
    4773:	8b 50 04             	mov    0x4(%eax),%edx
    4776:	89 d8                	mov    %ebx,%eax
    4778:	8d 58 ff             	lea    -0x1(%eax),%ebx
    477b:	01 c2                	add    %eax,%edx
    477d:	8b 45 08             	mov    0x8(%ebp),%eax
    4780:	8b 00                	mov    (%eax),%eax
    4782:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4789:	00 
    478a:	89 54 24 04          	mov    %edx,0x4(%esp)
    478e:	89 04 24             	mov    %eax,(%esp)
    4791:	e8 0c f5 ff ff       	call   3ca2 <read>
    4796:	89 c6                	mov    %eax,%esi
		if (!n)
    4798:	85 f6                	test   %esi,%esi
    479a:	75 09                	jne    47a5 <refill_buffer+0x57>
		bs->eob= i+1;
    479c:	8d 53 01             	lea    0x1(%ebx),%edx
    479f:	8b 45 08             	mov    0x8(%ebp),%eax
    47a2:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    47a5:	85 db                	test   %ebx,%ebx
    47a7:	78 0a                	js     47b3 <refill_buffer+0x65>
    47a9:	8b 45 08             	mov    0x8(%ebp),%eax
    47ac:	8b 40 1c             	mov    0x1c(%eax),%eax
    47af:	85 c0                	test   %eax,%eax
    47b1:	74 bd                	je     4770 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    47b3:	83 c4 10             	add    $0x10,%esp
    47b6:	5b                   	pop    %ebx
    47b7:	5e                   	pop    %esi
    47b8:	5d                   	pop    %ebp
    47b9:	c3                   	ret    

000047ba <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    47ba:	55                   	push   %ebp
    47bb:	89 e5                	mov    %esp,%ebp
    47bd:	53                   	push   %ebx
    47be:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    47c1:	8b 45 08             	mov    0x8(%ebp),%eax
    47c4:	8b 40 0c             	mov    0xc(%eax),%eax
    47c7:	8d 50 01             	lea    0x1(%eax),%edx
    47ca:	8b 45 08             	mov    0x8(%ebp),%eax
    47cd:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    47d0:	8b 45 08             	mov    0x8(%ebp),%eax
    47d3:	8b 40 14             	mov    0x14(%eax),%eax
    47d6:	85 c0                	test   %eax,%eax
    47d8:	0f 85 9f 00 00 00    	jne    487d <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    47de:	8b 45 08             	mov    0x8(%ebp),%eax
    47e1:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    47e8:	8b 45 08             	mov    0x8(%ebp),%eax
    47eb:	8b 40 10             	mov    0x10(%eax),%eax
    47ee:	8d 50 ff             	lea    -0x1(%eax),%edx
    47f1:	8b 45 08             	mov    0x8(%ebp),%eax
    47f4:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    47f7:	8b 45 08             	mov    0x8(%ebp),%eax
    47fa:	8b 40 10             	mov    0x10(%eax),%eax
    47fd:	83 f8 03             	cmp    $0x3,%eax
    4800:	7e 10                	jle    4812 <get1bit+0x58>
    4802:	8b 45 08             	mov    0x8(%ebp),%eax
    4805:	8b 50 10             	mov    0x10(%eax),%edx
    4808:	8b 45 08             	mov    0x8(%ebp),%eax
    480b:	8b 40 1c             	mov    0x1c(%eax),%eax
    480e:	39 c2                	cmp    %eax,%edx
    4810:	7d 6b                	jge    487d <get1bit+0xc3>
             if (bs->eob)
    4812:	8b 45 08             	mov    0x8(%ebp),%eax
    4815:	8b 40 1c             	mov    0x1c(%eax),%eax
    4818:	85 c0                	test   %eax,%eax
    481a:	74 0c                	je     4828 <get1bit+0x6e>
                bs->eobs = TRUE;
    481c:	8b 45 08             	mov    0x8(%ebp),%eax
    481f:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    4826:	eb 55                	jmp    487d <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    4828:	8b 45 08             	mov    0x8(%ebp),%eax
    482b:	8b 58 10             	mov    0x10(%eax),%ebx
    482e:	eb 2f                	jmp    485f <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4830:	8b 45 08             	mov    0x8(%ebp),%eax
    4833:	8b 50 04             	mov    0x4(%eax),%edx
    4836:	8b 45 08             	mov    0x8(%ebp),%eax
    4839:	8b 40 08             	mov    0x8(%eax),%eax
    483c:	8d 48 ff             	lea    -0x1(%eax),%ecx
    483f:	8b 45 08             	mov    0x8(%ebp),%eax
    4842:	8b 40 10             	mov    0x10(%eax),%eax
    4845:	29 c1                	sub    %eax,%ecx
    4847:	89 c8                	mov    %ecx,%eax
    4849:	01 d8                	add    %ebx,%eax
    484b:	01 c2                	add    %eax,%edx
    484d:	8b 45 08             	mov    0x8(%ebp),%eax
    4850:	8b 48 04             	mov    0x4(%eax),%ecx
    4853:	89 d8                	mov    %ebx,%eax
    4855:	01 c8                	add    %ecx,%eax
    4857:	0f b6 00             	movzbl (%eax),%eax
    485a:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    485c:	83 eb 01             	sub    $0x1,%ebx
    485f:	85 db                	test   %ebx,%ebx
    4861:	79 cd                	jns    4830 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    4863:	8b 45 08             	mov    0x8(%ebp),%eax
    4866:	89 04 24             	mov    %eax,(%esp)
    4869:	e8 e0 fe ff ff       	call   474e <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    486e:	8b 45 08             	mov    0x8(%ebp),%eax
    4871:	8b 40 08             	mov    0x8(%eax),%eax
    4874:	8d 50 ff             	lea    -0x1(%eax),%edx
    4877:	8b 45 08             	mov    0x8(%ebp),%eax
    487a:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    487d:	8b 45 08             	mov    0x8(%ebp),%eax
    4880:	8b 50 04             	mov    0x4(%eax),%edx
    4883:	8b 45 08             	mov    0x8(%ebp),%eax
    4886:	8b 40 10             	mov    0x10(%eax),%eax
    4889:	01 d0                	add    %edx,%eax
    488b:	0f b6 00             	movzbl (%eax),%eax
    488e:	0f b6 d0             	movzbl %al,%edx
    4891:	8b 45 08             	mov    0x8(%ebp),%eax
    4894:	8b 40 14             	mov    0x14(%eax),%eax
    4897:	83 e8 01             	sub    $0x1,%eax
    489a:	8b 04 85 60 a7 00 00 	mov    0xa760(,%eax,4),%eax
    48a1:	21 d0                	and    %edx,%eax
    48a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    48a6:	8b 45 08             	mov    0x8(%ebp),%eax
    48a9:	8b 40 14             	mov    0x14(%eax),%eax
    48ac:	83 e8 01             	sub    $0x1,%eax
    48af:	89 c1                	mov    %eax,%ecx
    48b1:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    48b4:	8b 45 08             	mov    0x8(%ebp),%eax
    48b7:	8b 40 14             	mov    0x14(%eax),%eax
    48ba:	8d 50 ff             	lea    -0x1(%eax),%edx
    48bd:	8b 45 08             	mov    0x8(%ebp),%eax
    48c0:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    48c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    48c6:	83 c4 24             	add    $0x24,%esp
    48c9:	5b                   	pop    %ebx
    48ca:	5d                   	pop    %ebp
    48cb:	c3                   	ret    

000048cc <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    48cc:	55                   	push   %ebp
    48cd:	89 e5                	mov    %esp,%ebp
    48cf:	57                   	push   %edi
    48d0:	56                   	push   %esi
    48d1:	53                   	push   %ebx
    48d2:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    48d5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    48dc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    48df:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    48e3:	7e 1c                	jle    4901 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    48e5:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    48ec:	00 
    48ed:	c7 44 24 04 ec 8f 00 	movl   $0x8fec,0x4(%esp)
    48f4:	00 
    48f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    48fc:	e8 71 f5 ff ff       	call   3e72 <printf>

	bs->totbit += N;
    4901:	8b 45 08             	mov    0x8(%ebp),%eax
    4904:	8b 50 0c             	mov    0xc(%eax),%edx
    4907:	8b 45 0c             	mov    0xc(%ebp),%eax
    490a:	01 c2                	add    %eax,%edx
    490c:	8b 45 08             	mov    0x8(%ebp),%eax
    490f:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    4912:	e9 0a 01 00 00       	jmp    4a21 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    4917:	8b 45 08             	mov    0x8(%ebp),%eax
    491a:	8b 40 14             	mov    0x14(%eax),%eax
    491d:	85 c0                	test   %eax,%eax
    491f:	0f 85 9f 00 00 00    	jne    49c4 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    4925:	8b 45 08             	mov    0x8(%ebp),%eax
    4928:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    492f:	8b 45 08             	mov    0x8(%ebp),%eax
    4932:	8b 40 10             	mov    0x10(%eax),%eax
    4935:	8d 50 ff             	lea    -0x1(%eax),%edx
    4938:	8b 45 08             	mov    0x8(%ebp),%eax
    493b:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    493e:	8b 45 08             	mov    0x8(%ebp),%eax
    4941:	8b 40 10             	mov    0x10(%eax),%eax
    4944:	83 f8 03             	cmp    $0x3,%eax
    4947:	7e 10                	jle    4959 <getbits+0x8d>
    4949:	8b 45 08             	mov    0x8(%ebp),%eax
    494c:	8b 50 10             	mov    0x10(%eax),%edx
    494f:	8b 45 08             	mov    0x8(%ebp),%eax
    4952:	8b 40 1c             	mov    0x1c(%eax),%eax
    4955:	39 c2                	cmp    %eax,%edx
    4957:	7d 6b                	jge    49c4 <getbits+0xf8>
				if (bs->eob)
    4959:	8b 45 08             	mov    0x8(%ebp),%eax
    495c:	8b 40 1c             	mov    0x1c(%eax),%eax
    495f:	85 c0                	test   %eax,%eax
    4961:	74 0c                	je     496f <getbits+0xa3>
					bs->eobs = TRUE;
    4963:	8b 45 08             	mov    0x8(%ebp),%eax
    4966:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    496d:	eb 55                	jmp    49c4 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    496f:	8b 45 08             	mov    0x8(%ebp),%eax
    4972:	8b 70 10             	mov    0x10(%eax),%esi
    4975:	eb 2f                	jmp    49a6 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    4977:	8b 45 08             	mov    0x8(%ebp),%eax
    497a:	8b 50 04             	mov    0x4(%eax),%edx
    497d:	8b 45 08             	mov    0x8(%ebp),%eax
    4980:	8b 40 08             	mov    0x8(%eax),%eax
    4983:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4986:	8b 45 08             	mov    0x8(%ebp),%eax
    4989:	8b 40 10             	mov    0x10(%eax),%eax
    498c:	29 c1                	sub    %eax,%ecx
    498e:	89 c8                	mov    %ecx,%eax
    4990:	01 f0                	add    %esi,%eax
    4992:	01 c2                	add    %eax,%edx
    4994:	8b 45 08             	mov    0x8(%ebp),%eax
    4997:	8b 48 04             	mov    0x4(%eax),%ecx
    499a:	89 f0                	mov    %esi,%eax
    499c:	01 c8                	add    %ecx,%eax
    499e:	0f b6 00             	movzbl (%eax),%eax
    49a1:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    49a3:	83 ee 01             	sub    $0x1,%esi
    49a6:	85 f6                	test   %esi,%esi
    49a8:	79 cd                	jns    4977 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    49aa:	8b 45 08             	mov    0x8(%ebp),%eax
    49ad:	89 04 24             	mov    %eax,(%esp)
    49b0:	e8 99 fd ff ff       	call   474e <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    49b5:	8b 45 08             	mov    0x8(%ebp),%eax
    49b8:	8b 40 08             	mov    0x8(%eax),%eax
    49bb:	8d 50 ff             	lea    -0x1(%eax),%edx
    49be:	8b 45 08             	mov    0x8(%ebp),%eax
    49c1:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    49c4:	8b 45 08             	mov    0x8(%ebp),%eax
    49c7:	8b 40 14             	mov    0x14(%eax),%eax
    49ca:	39 d8                	cmp    %ebx,%eax
    49cc:	0f 4f c3             	cmovg  %ebx,%eax
    49cf:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    49d1:	8b 45 08             	mov    0x8(%ebp),%eax
    49d4:	8b 50 04             	mov    0x4(%eax),%edx
    49d7:	8b 45 08             	mov    0x8(%ebp),%eax
    49da:	8b 40 10             	mov    0x10(%eax),%eax
    49dd:	01 d0                	add    %edx,%eax
    49df:	0f b6 00             	movzbl (%eax),%eax
    49e2:	0f b6 d0             	movzbl %al,%edx
    49e5:	8b 45 08             	mov    0x8(%ebp),%eax
    49e8:	8b 40 14             	mov    0x14(%eax),%eax
    49eb:	8b 04 85 80 a7 00 00 	mov    0xa780(,%eax,4),%eax
    49f2:	89 d7                	mov    %edx,%edi
    49f4:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    49f6:	8b 45 08             	mov    0x8(%ebp),%eax
    49f9:	8b 40 14             	mov    0x14(%eax),%eax
    49fc:	29 f0                	sub    %esi,%eax
    49fe:	89 c1                	mov    %eax,%ecx
    4a00:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    4a02:	89 d8                	mov    %ebx,%eax
    4a04:	29 f0                	sub    %esi,%eax
    4a06:	89 c1                	mov    %eax,%ecx
    4a08:	d3 e7                	shl    %cl,%edi
    4a0a:	89 f8                	mov    %edi,%eax
    4a0c:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    4a0f:	8b 45 08             	mov    0x8(%ebp),%eax
    4a12:	8b 40 14             	mov    0x14(%eax),%eax
    4a15:	29 f0                	sub    %esi,%eax
    4a17:	89 c2                	mov    %eax,%edx
    4a19:	8b 45 08             	mov    0x8(%ebp),%eax
    4a1c:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    4a1f:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    4a21:	85 db                	test   %ebx,%ebx
    4a23:	0f 8f ee fe ff ff    	jg     4917 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    4a29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    4a2c:	83 c4 2c             	add    $0x2c,%esp
    4a2f:	5b                   	pop    %ebx
    4a30:	5e                   	pop    %esi
    4a31:	5f                   	pop    %edi
    4a32:	5d                   	pop    %ebp
    4a33:	c3                   	ret    

00004a34 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    4a34:	55                   	push   %ebp
    4a35:	89 e5                	mov    %esp,%ebp
    4a37:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    4a3a:	db 45 10             	fildl  0x10(%ebp)
    4a3d:	dd 5c 24 08          	fstpl  0x8(%esp)
    4a41:	dd 05 58 90 00 00    	fldl   0x9058
    4a47:	dd 1c 24             	fstpl  (%esp)
    4a4a:	e8 81 f8 ff ff       	call   42d0 <pow>
    4a4f:	d9 7d e6             	fnstcw -0x1a(%ebp)
    4a52:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    4a56:	b4 0c                	mov    $0xc,%ah
    4a58:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    4a5c:	d9 6d e4             	fldcw  -0x1c(%ebp)
    4a5f:	db 5d e0             	fistpl -0x20(%ebp)
    4a62:	d9 6d e6             	fldcw  -0x1a(%ebp)
    4a65:	8b 45 e0             	mov    -0x20(%ebp),%eax
    4a68:	83 e8 01             	sub    $0x1,%eax
    4a6b:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    4a6e:	8b 45 08             	mov    0x8(%ebp),%eax
    4a71:	89 04 24             	mov    %eax,(%esp)
    4a74:	e8 ca fc ff ff       	call   4743 <sstell>
    4a79:	83 e0 07             	and    $0x7,%eax
    4a7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    4a7f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4a83:	74 17                	je     4a9c <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    4a85:	b8 08 00 00 00       	mov    $0x8,%eax
    4a8a:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4a8d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a91:	8b 45 08             	mov    0x8(%ebp),%eax
    4a94:	89 04 24             	mov    %eax,(%esp)
    4a97:	e8 30 fe ff ff       	call   48cc <getbits>

	val = getbits(bs, N);
    4a9c:	8b 45 10             	mov    0x10(%ebp),%eax
    4a9f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4aa3:	8b 45 08             	mov    0x8(%ebp),%eax
    4aa6:	89 04 24             	mov    %eax,(%esp)
    4aa9:	e8 1e fe ff ff       	call   48cc <getbits>
    4aae:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4ab1:	eb 1a                	jmp    4acd <seek_sync+0x99>
		val <<= ALIGNING;
    4ab3:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    4ab7:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    4abe:	00 
    4abf:	8b 45 08             	mov    0x8(%ebp),%eax
    4ac2:	89 04 24             	mov    %eax,(%esp)
    4ac5:	e8 02 fe ff ff       	call   48cc <getbits>
    4aca:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    4acd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4ad0:	23 45 f4             	and    -0xc(%ebp),%eax
    4ad3:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4ad6:	74 0f                	je     4ae7 <seek_sync+0xb3>
    4ad8:	8b 45 08             	mov    0x8(%ebp),%eax
    4adb:	89 04 24             	mov    %eax,(%esp)
    4ade:	e8 55 fc ff ff       	call   4738 <end_bs>
    4ae3:	85 c0                	test   %eax,%eax
    4ae5:	74 cc                	je     4ab3 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    4ae7:	8b 45 08             	mov    0x8(%ebp),%eax
    4aea:	89 04 24             	mov    %eax,(%esp)
    4aed:	e8 46 fc ff ff       	call   4738 <end_bs>
    4af2:	85 c0                	test   %eax,%eax
    4af4:	74 07                	je     4afd <seek_sync+0xc9>
		return(0);
    4af6:	b8 00 00 00 00       	mov    $0x0,%eax
    4afb:	eb 05                	jmp    4b02 <seek_sync+0xce>
	else
		return(1);
    4afd:	b8 01 00 00 00       	mov    $0x1,%eax
}
    4b02:	c9                   	leave  
    4b03:	c3                   	ret    

00004b04 <js_bound>:

int js_bound(int lay, int m_ext)
{
    4b04:	55                   	push   %ebp
    4b05:	89 e5                	mov    %esp,%ebp
    4b07:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    4b0a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    4b0e:	7e 12                	jle    4b22 <js_bound+0x1e>
    4b10:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    4b14:	7f 0c                	jg     4b22 <js_bound+0x1e>
    4b16:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4b1a:	78 06                	js     4b22 <js_bound+0x1e>
    4b1c:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    4b20:	7e 27                	jle    4b49 <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    4b22:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b25:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4b29:	8b 45 08             	mov    0x8(%ebp),%eax
    4b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b30:	c7 44 24 04 20 90 00 	movl   $0x9020,0x4(%esp)
    4b37:	00 
    4b38:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b3f:	e8 2e f3 ff ff       	call   3e72 <printf>
        exit();
    4b44:	e8 41 f1 ff ff       	call   3c8a <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    4b49:	8b 45 08             	mov    0x8(%ebp),%eax
    4b4c:	83 e8 01             	sub    $0x1,%eax
    4b4f:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4b56:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b59:	01 d0                	add    %edx,%eax
    4b5b:	8b 04 85 c0 a7 00 00 	mov    0xa7c0(,%eax,4),%eax
}
    4b62:	c9                   	leave  
    4b63:	c3                   	ret    

00004b64 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    4b64:	55                   	push   %ebp
    4b65:	89 e5                	mov    %esp,%ebp
    4b67:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    4b6a:	8b 45 08             	mov    0x8(%ebp),%eax
    4b6d:	8b 00                	mov    (%eax),%eax
    4b6f:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    4b72:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b75:	8b 50 1c             	mov    0x1c(%eax),%edx
    4b78:	8b 45 08             	mov    0x8(%ebp),%eax
    4b7b:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    4b7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4b81:	8b 40 1c             	mov    0x1c(%eax),%eax
    4b84:	83 f8 03             	cmp    $0x3,%eax
    4b87:	75 07                	jne    4b90 <hdr_to_frps+0x2c>
    4b89:	b8 01 00 00 00       	mov    $0x1,%eax
    4b8e:	eb 05                	jmp    4b95 <hdr_to_frps+0x31>
    4b90:	b8 02 00 00 00       	mov    $0x2,%eax
    4b95:	8b 55 08             	mov    0x8(%ebp),%edx
    4b98:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    4b9b:	8b 45 08             	mov    0x8(%ebp),%eax
    4b9e:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    4ba5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4ba8:	8b 40 1c             	mov    0x1c(%eax),%eax
    4bab:	83 f8 01             	cmp    $0x1,%eax
    4bae:	75 20                	jne    4bd0 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    4bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bb3:	8b 50 20             	mov    0x20(%eax),%edx
    4bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4bb9:	8b 40 04             	mov    0x4(%eax),%eax
    4bbc:	89 54 24 04          	mov    %edx,0x4(%esp)
    4bc0:	89 04 24             	mov    %eax,(%esp)
    4bc3:	e8 3c ff ff ff       	call   4b04 <js_bound>
    4bc8:	8b 55 08             	mov    0x8(%ebp),%edx
    4bcb:	89 42 0c             	mov    %eax,0xc(%edx)
    4bce:	eb 0c                	jmp    4bdc <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    4bd0:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd3:	8b 50 10             	mov    0x10(%eax),%edx
    4bd6:	8b 45 08             	mov    0x8(%ebp),%eax
    4bd9:	89 50 0c             	mov    %edx,0xc(%eax)
}
    4bdc:	c9                   	leave  
    4bdd:	c3                   	ret    

00004bde <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    4bde:	55                   	push   %ebp
    4bdf:	89 e5                	mov    %esp,%ebp
    4be1:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    4be4:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    4be8:	74 19                	je     4c03 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    4bea:	c7 44 24 04 43 90 00 	movl   $0x9043,0x4(%esp)
    4bf1:	00 
    4bf2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bf9:	e8 74 f2 ff ff       	call   3e72 <printf>
		exit();
    4bfe:	e8 87 f0 ff ff       	call   3c8a <exit>
	}
	getCoreBuf(1, val);
    4c03:	8b 45 08             	mov    0x8(%ebp),%eax
    4c06:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4c11:	e8 74 f1 ff ff       	call   3d8a <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    4c16:	c9                   	leave  
    4c17:	c3                   	ret    

00004c18 <hsstell>:

unsigned long hsstell()
{
    4c18:	55                   	push   %ebp
    4c19:	89 e5                	mov    %esp,%ebp
    4c1b:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    4c1e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4c25:	00 
    4c26:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    4c2d:	e8 58 f1 ff ff       	call   3d8a <getCoreBuf>
//	return(totbit);
}
    4c32:	c9                   	leave  
    4c33:	c3                   	ret    

00004c34 <hgetbits>:

unsigned long hgetbits(int N)
{
    4c34:	55                   	push   %ebp
    4c35:	89 e5                	mov    %esp,%ebp
    4c37:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    4c3a:	8b 45 08             	mov    0x8(%ebp),%eax
    4c3d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c41:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    4c48:	e8 3d f1 ff ff       	call   3d8a <getCoreBuf>
}
    4c4d:	c9                   	leave  
    4c4e:	c3                   	ret    

00004c4f <hget1bit>:


unsigned int hget1bit()
{
    4c4f:	55                   	push   %ebp
    4c50:	89 e5                	mov    %esp,%ebp
    4c52:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    4c55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4c5c:	e8 d3 ff ff ff       	call   4c34 <hgetbits>
}
    4c61:	c9                   	leave  
    4c62:	c3                   	ret    

00004c63 <rewindNbits>:


void rewindNbits(int N)
{
    4c63:	55                   	push   %ebp
    4c64:	89 e5                	mov    %esp,%ebp
    4c66:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    4c69:	8b 45 08             	mov    0x8(%ebp),%eax
    4c6c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c70:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    4c77:	e8 0e f1 ff ff       	call   3d8a <getCoreBuf>
}
    4c7c:	c9                   	leave  
    4c7d:	c3                   	ret    

00004c7e <rewindNbytes>:


void rewindNbytes(int N)
{
    4c7e:	55                   	push   %ebp
    4c7f:	89 e5                	mov    %esp,%ebp
    4c81:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    4c84:	8b 45 08             	mov    0x8(%ebp),%eax
    4c87:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c8b:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    4c92:	e8 f3 f0 ff ff       	call   3d8a <getCoreBuf>
}
    4c97:	c9                   	leave  
    4c98:	c3                   	ret    

00004c99 <read_decoder_table>:
};


/* 读取 huffman 解码表 */
void read_decoder_table() 
{	
    4c99:	55                   	push   %ebp
    4c9a:	89 e5                	mov    %esp,%ebp
	// struct huffcodetab ht[HTN] = 
	// ht[0] = ht[0];
}
    4c9c:	5d                   	pop    %ebp
    4c9d:	c3                   	ret    

00004c9e <output_buf2>:

void output_buf2()
{
    4c9e:	55                   	push   %ebp
    4c9f:	89 e5                	mov    %esp,%ebp
    4ca1:	83 ec 18             	sub    $0x18,%esp
	printf(0, "Core Buffer:\n");
    4ca4:	c7 44 24 04 60 90 00 	movl   $0x9060,0x4(%esp)
    4cab:	00 
    4cac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cb3:	e8 ba f1 ff ff       	call   3e72 <printf>
	printf(0, "totbit=%d ", getCoreBuf(2, 0));
    4cb8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4cbf:	00 
    4cc0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    4cc7:	e8 be f0 ff ff       	call   3d8a <getCoreBuf>
    4ccc:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cd0:	c7 44 24 04 6e 90 00 	movl   $0x906e,0x4(%esp)
    4cd7:	00 
    4cd8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4cdf:	e8 8e f1 ff ff       	call   3e72 <printf>
	printf(0, "buf_byte_idx=%d ", getCoreBuf(6, 0));
    4ce4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4ceb:	00 
    4cec:	c7 04 24 06 00 00 00 	movl   $0x6,(%esp)
    4cf3:	e8 92 f0 ff ff       	call   3d8a <getCoreBuf>
    4cf8:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cfc:	c7 44 24 04 79 90 00 	movl   $0x9079,0x4(%esp)
    4d03:	00 
    4d04:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d0b:	e8 62 f1 ff ff       	call   3e72 <printf>
	printf(0, "buf_bit_idx=%d ", getCoreBuf(7, 0));
    4d10:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d17:	00 
    4d18:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
    4d1f:	e8 66 f0 ff ff       	call   3d8a <getCoreBuf>
    4d24:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d28:	c7 44 24 04 8a 90 00 	movl   $0x908a,0x4(%esp)
    4d2f:	00 
    4d30:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d37:	e8 36 f1 ff ff       	call   3e72 <printf>
	printf(0, "offset=%d\n\n", getCoreBuf(8, 0));
    4d3c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d43:	00 
    4d44:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    4d4b:	e8 3a f0 ff ff       	call   3d8a <getCoreBuf>
    4d50:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d54:	c7 44 24 04 9a 90 00 	movl   $0x909a,0x4(%esp)
    4d5b:	00 
    4d5c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d63:	e8 0a f1 ff ff       	call   3e72 <printf>
}
    4d68:	c9                   	leave  
    4d69:	c3                   	ret    

00004d6a <huffman_decoder>:


/* 进行huffman解码	*/
/* 注意! 对counta,countb - 4 bit 值 用 y返回, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    4d6a:	55                   	push   %ebp
    4d6b:	89 e5                	mov    %esp,%ebp
    4d6d:	53                   	push   %ebx
    4d6e:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    4d71:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    4d78:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    4d7f:	a1 00 a8 00 00       	mov    0xa800,%eax
    4d84:	89 45 f4             	mov    %eax,-0xc(%ebp)

  /* table 0 不需要 bits */
  if ( h->treelen == 0)
    4d87:	8b 45 08             	mov    0x8(%ebp),%eax
    4d8a:	8b 40 24             	mov    0x24(%eax),%eax
    4d8d:	85 c0                	test   %eax,%eax
    4d8f:	75 1d                	jne    4dae <huffman_decoder+0x44>
  {  *x = *y = 0;
    4d91:	8b 45 10             	mov    0x10(%ebp),%eax
    4d94:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    4d9a:	8b 45 10             	mov    0x10(%ebp),%eax
    4d9d:	8b 10                	mov    (%eax),%edx
    4d9f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4da2:	89 10                	mov    %edx,(%eax)
     return 0;
    4da4:	b8 00 00 00 00       	mov    $0x0,%eax
    4da9:	e9 fa 02 00 00       	jmp    50a8 <huffman_decoder+0x33e>
  }

  if (h->val == 0) return 2;
    4dae:	8b 45 08             	mov    0x8(%ebp),%eax
    4db1:	8b 40 20             	mov    0x20(%eax),%eax
    4db4:	85 c0                	test   %eax,%eax
    4db6:	75 0a                	jne    4dc2 <huffman_decoder+0x58>
    4db8:	b8 02 00 00 00       	mov    $0x2,%eax
    4dbd:	e9 e6 02 00 00       	jmp    50a8 <huffman_decoder+0x33e>
  /* 查找 Huffman table. */

  // output_buf2();

  do {
    if (h->val[point][0]==0) {   /*树的结尾*/
    4dc2:	8b 45 08             	mov    0x8(%ebp),%eax
    4dc5:	8b 40 20             	mov    0x20(%eax),%eax
    4dc8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4dcb:	01 d2                	add    %edx,%edx
    4dcd:	01 d0                	add    %edx,%eax
    4dcf:	0f b6 00             	movzbl (%eax),%eax
    4dd2:	84 c0                	test   %al,%al
    4dd4:	75 46                	jne    4e1c <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    4dd6:	8b 45 08             	mov    0x8(%ebp),%eax
    4dd9:	8b 40 20             	mov    0x20(%eax),%eax
    4ddc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ddf:	01 d2                	add    %edx,%edx
    4de1:	01 d0                	add    %edx,%eax
    4de3:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4de7:	c0 e8 04             	shr    $0x4,%al
    4dea:	0f b6 d0             	movzbl %al,%edx
    4ded:	8b 45 0c             	mov    0xc(%ebp),%eax
    4df0:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    4df2:	8b 45 08             	mov    0x8(%ebp),%eax
    4df5:	8b 40 20             	mov    0x20(%eax),%eax
    4df8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4dfb:	01 d2                	add    %edx,%edx
    4dfd:	01 d0                	add    %edx,%eax
    4dff:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e03:	0f b6 c0             	movzbl %al,%eax
    4e06:	83 e0 0f             	and    $0xf,%eax
    4e09:	89 c2                	mov    %eax,%edx
    4e0b:	8b 45 10             	mov    0x10(%ebp),%eax
    4e0e:	89 10                	mov    %edx,(%eax)

      error = 0;
    4e10:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    4e17:	e9 af 00 00 00       	jmp    4ecb <huffman_decoder+0x161>
    } 
    // unsigned int t = hget1bit();
    // printf(0, "t=%d  ", t);
    if (hget1bit()) {
    4e1c:	e8 2e fe ff ff       	call   4c4f <hget1bit>
    4e21:	85 c0                	test   %eax,%eax
    4e23:	74 47                	je     4e6c <huffman_decoder+0x102>
    	// printf(0, "Enter if branch:  ");
    	while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    4e25:	eb 17                	jmp    4e3e <huffman_decoder+0xd4>
    4e27:	8b 45 08             	mov    0x8(%ebp),%eax
    4e2a:	8b 40 20             	mov    0x20(%eax),%eax
    4e2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e30:	01 d2                	add    %edx,%edx
    4e32:	01 d0                	add    %edx,%eax
    4e34:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e38:	0f b6 c0             	movzbl %al,%eax
    4e3b:	01 45 f0             	add    %eax,-0x10(%ebp)
    4e3e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e41:	8b 40 20             	mov    0x20(%eax),%eax
    4e44:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e47:	01 d2                	add    %edx,%edx
    4e49:	01 d0                	add    %edx,%eax
    4e4b:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e4f:	3c f9                	cmp    $0xf9,%al
    4e51:	77 d4                	ja     4e27 <huffman_decoder+0xbd>
    	point += h->val[point][1];
    4e53:	8b 45 08             	mov    0x8(%ebp),%eax
    4e56:	8b 40 20             	mov    0x20(%eax),%eax
    4e59:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e5c:	01 d2                	add    %edx,%edx
    4e5e:	01 d0                	add    %edx,%eax
    4e60:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4e64:	0f b6 c0             	movzbl %al,%eax
    4e67:	01 45 f0             	add    %eax,-0x10(%ebp)
    4e6a:	eb 42                	jmp    4eae <huffman_decoder+0x144>
    }
    else {
    	// printf(0, "Enter else branch:  ");
    	while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    4e6c:	eb 16                	jmp    4e84 <huffman_decoder+0x11a>
    4e6e:	8b 45 08             	mov    0x8(%ebp),%eax
    4e71:	8b 40 20             	mov    0x20(%eax),%eax
    4e74:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e77:	01 d2                	add    %edx,%edx
    4e79:	01 d0                	add    %edx,%eax
    4e7b:	0f b6 00             	movzbl (%eax),%eax
    4e7e:	0f b6 c0             	movzbl %al,%eax
    4e81:	01 45 f0             	add    %eax,-0x10(%ebp)
    4e84:	8b 45 08             	mov    0x8(%ebp),%eax
    4e87:	8b 40 20             	mov    0x20(%eax),%eax
    4e8a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4e8d:	01 d2                	add    %edx,%edx
    4e8f:	01 d0                	add    %edx,%eax
    4e91:	0f b6 00             	movzbl (%eax),%eax
    4e94:	3c f9                	cmp    $0xf9,%al
    4e96:	77 d6                	ja     4e6e <huffman_decoder+0x104>
    	point += h->val[point][0];
    4e98:	8b 45 08             	mov    0x8(%ebp),%eax
    4e9b:	8b 40 20             	mov    0x20(%eax),%eax
    4e9e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ea1:	01 d2                	add    %edx,%edx
    4ea3:	01 d0                	add    %edx,%eax
    4ea5:	0f b6 00             	movzbl (%eax),%eax
    4ea8:	0f b6 c0             	movzbl %al,%eax
    4eab:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    4eae:	d1 6d f4             	shrl   -0xc(%ebp)
    // printf(0, "do while: %d %d %d  ", level, point, ht->treelen);
    // output_buf2();
  } while (level  || (point < ht->treelen) );
    4eb1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4eb5:	0f 85 07 ff ff ff    	jne    4dc2 <huffman_decoder+0x58>
    4ebb:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4ebe:	a1 a4 be 00 00       	mov    0xbea4,%eax
    4ec3:	39 c2                	cmp    %eax,%edx
    4ec5:	0f 82 f7 fe ff ff    	jb     4dc2 <huffman_decoder+0x58>

  // output_buf2();
  
  /* 检查错误 */
  
  if (error) { /* 设置 x 和 y 为一中间值 */
    4ecb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4ecf:	74 24                	je     4ef5 <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    4ed1:	8b 45 08             	mov    0x8(%ebp),%eax
    4ed4:	8b 40 04             	mov    0x4(%eax),%eax
    4ed7:	83 e8 01             	sub    $0x1,%eax
    4eda:	01 c0                	add    %eax,%eax
    4edc:	89 c2                	mov    %eax,%edx
    4ede:	8b 45 0c             	mov    0xc(%ebp),%eax
    4ee1:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    4ee3:	8b 45 08             	mov    0x8(%ebp),%eax
    4ee6:	8b 40 08             	mov    0x8(%eax),%eax
    4ee9:	83 e8 01             	sub    $0x1,%eax
    4eec:	01 c0                	add    %eax,%eax
    4eee:	89 c2                	mov    %eax,%edx
    4ef0:	8b 45 10             	mov    0x10(%ebp),%eax
    4ef3:	89 10                	mov    %edx,(%eax)
  }

  /* 处理信号编码 */

  if (h->tablename[0] == '3'
    4ef5:	8b 45 08             	mov    0x8(%ebp),%eax
    4ef8:	0f b6 00             	movzbl (%eax),%eax
    4efb:	3c 33                	cmp    $0x33,%al
    4efd:	0f 85 ec 00 00 00    	jne    4fef <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    4f03:	8b 45 08             	mov    0x8(%ebp),%eax
    4f06:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4f0a:	3c 32                	cmp    $0x32,%al
    4f0c:	74 0f                	je     4f1d <huffman_decoder+0x1b3>
    4f0e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f11:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    4f15:	3c 33                	cmp    $0x33,%al
    4f17:	0f 85 d2 00 00 00    	jne    4fef <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    4f1d:	8b 45 10             	mov    0x10(%ebp),%eax
    4f20:	8b 00                	mov    (%eax),%eax
    4f22:	c1 f8 03             	sar    $0x3,%eax
    4f25:	83 e0 01             	and    $0x1,%eax
    4f28:	89 c2                	mov    %eax,%edx
    4f2a:	8b 45 14             	mov    0x14(%ebp),%eax
    4f2d:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    4f2f:	8b 45 10             	mov    0x10(%ebp),%eax
    4f32:	8b 00                	mov    (%eax),%eax
    4f34:	c1 f8 02             	sar    $0x2,%eax
    4f37:	83 e0 01             	and    $0x1,%eax
    4f3a:	89 c2                	mov    %eax,%edx
    4f3c:	8b 45 18             	mov    0x18(%ebp),%eax
    4f3f:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    4f41:	8b 45 10             	mov    0x10(%ebp),%eax
    4f44:	8b 00                	mov    (%eax),%eax
    4f46:	d1 f8                	sar    %eax
    4f48:	83 e0 01             	and    $0x1,%eax
    4f4b:	89 c2                	mov    %eax,%edx
    4f4d:	8b 45 0c             	mov    0xc(%ebp),%eax
    4f50:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    4f52:	8b 45 10             	mov    0x10(%ebp),%eax
    4f55:	8b 00                	mov    (%eax),%eax
    4f57:	83 e0 01             	and    $0x1,%eax
    4f5a:	89 c2                	mov    %eax,%edx
    4f5c:	8b 45 10             	mov    0x10(%ebp),%eax
    4f5f:	89 10                	mov    %edx,(%eax)
     /* v, w, x 和 y 在比特流中是颠倒的，交换他们 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    4f61:	8b 45 14             	mov    0x14(%ebp),%eax
    4f64:	8b 00                	mov    (%eax),%eax
    4f66:	85 c0                	test   %eax,%eax
    4f68:	74 18                	je     4f82 <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    4f6a:	e8 e0 fc ff ff       	call   4c4f <hget1bit>
    4f6f:	83 f8 01             	cmp    $0x1,%eax
    4f72:	75 0e                	jne    4f82 <huffman_decoder+0x218>
    4f74:	8b 45 14             	mov    0x14(%ebp),%eax
    4f77:	8b 00                	mov    (%eax),%eax
    4f79:	f7 d8                	neg    %eax
    4f7b:	89 c2                	mov    %eax,%edx
    4f7d:	8b 45 14             	mov    0x14(%ebp),%eax
    4f80:	89 10                	mov    %edx,(%eax)
     if (*w)
    4f82:	8b 45 18             	mov    0x18(%ebp),%eax
    4f85:	8b 00                	mov    (%eax),%eax
    4f87:	85 c0                	test   %eax,%eax
    4f89:	74 18                	je     4fa3 <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    4f8b:	e8 bf fc ff ff       	call   4c4f <hget1bit>
    4f90:	83 f8 01             	cmp    $0x1,%eax
    4f93:	75 0e                	jne    4fa3 <huffman_decoder+0x239>
    4f95:	8b 45 18             	mov    0x18(%ebp),%eax
    4f98:	8b 00                	mov    (%eax),%eax
    4f9a:	f7 d8                	neg    %eax
    4f9c:	89 c2                	mov    %eax,%edx
    4f9e:	8b 45 18             	mov    0x18(%ebp),%eax
    4fa1:	89 10                	mov    %edx,(%eax)
     if (*x)
    4fa3:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fa6:	8b 00                	mov    (%eax),%eax
    4fa8:	85 c0                	test   %eax,%eax
    4faa:	74 18                	je     4fc4 <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    4fac:	e8 9e fc ff ff       	call   4c4f <hget1bit>
    4fb1:	83 f8 01             	cmp    $0x1,%eax
    4fb4:	75 0e                	jne    4fc4 <huffman_decoder+0x25a>
    4fb6:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fb9:	8b 00                	mov    (%eax),%eax
    4fbb:	f7 d8                	neg    %eax
    4fbd:	89 c2                	mov    %eax,%edx
    4fbf:	8b 45 0c             	mov    0xc(%ebp),%eax
    4fc2:	89 10                	mov    %edx,(%eax)
     if (*y)
    4fc4:	8b 45 10             	mov    0x10(%ebp),%eax
    4fc7:	8b 00                	mov    (%eax),%eax
    4fc9:	85 c0                	test   %eax,%eax
    4fcb:	74 1d                	je     4fea <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    4fcd:	e8 7d fc ff ff       	call   4c4f <hget1bit>
    4fd2:	83 f8 01             	cmp    $0x1,%eax
    4fd5:	75 13                	jne    4fea <huffman_decoder+0x280>
    4fd7:	8b 45 10             	mov    0x10(%ebp),%eax
    4fda:	8b 00                	mov    (%eax),%eax
    4fdc:	f7 d8                	neg    %eax
    4fde:	89 c2                	mov    %eax,%edx
    4fe0:	8b 45 10             	mov    0x10(%ebp),%eax
    4fe3:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    4fe5:	e9 bb 00 00 00       	jmp    50a5 <huffman_decoder+0x33b>
    4fea:	e9 b6 00 00 00       	jmp    50a5 <huffman_decoder+0x33b>
  else {
  
      /* 在测试比特流中x 和 y是颠倒的 
         这里颠倒 x 和 y 使测试比特流正常 */
    
     if (h->linbits)
    4fef:	8b 45 08             	mov    0x8(%ebp),%eax
    4ff2:	8b 40 0c             	mov    0xc(%eax),%eax
    4ff5:	85 c0                	test   %eax,%eax
    4ff7:	74 30                	je     5029 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    4ff9:	8b 45 08             	mov    0x8(%ebp),%eax
    4ffc:	8b 40 04             	mov    0x4(%eax),%eax
    4fff:	8d 50 ff             	lea    -0x1(%eax),%edx
    5002:	8b 45 0c             	mov    0xc(%ebp),%eax
    5005:	8b 00                	mov    (%eax),%eax
    5007:	39 c2                	cmp    %eax,%edx
    5009:	75 1e                	jne    5029 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    500b:	8b 45 0c             	mov    0xc(%ebp),%eax
    500e:	8b 00                	mov    (%eax),%eax
    5010:	89 c3                	mov    %eax,%ebx
    5012:	8b 45 08             	mov    0x8(%ebp),%eax
    5015:	8b 40 0c             	mov    0xc(%eax),%eax
    5018:	89 04 24             	mov    %eax,(%esp)
    501b:	e8 14 fc ff ff       	call   4c34 <hgetbits>
    5020:	01 d8                	add    %ebx,%eax
    5022:	89 c2                	mov    %eax,%edx
    5024:	8b 45 0c             	mov    0xc(%ebp),%eax
    5027:	89 10                	mov    %edx,(%eax)
     if (*x)
    5029:	8b 45 0c             	mov    0xc(%ebp),%eax
    502c:	8b 00                	mov    (%eax),%eax
    502e:	85 c0                	test   %eax,%eax
    5030:	74 18                	je     504a <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    5032:	e8 18 fc ff ff       	call   4c4f <hget1bit>
    5037:	83 f8 01             	cmp    $0x1,%eax
    503a:	75 0e                	jne    504a <huffman_decoder+0x2e0>
    503c:	8b 45 0c             	mov    0xc(%ebp),%eax
    503f:	8b 00                	mov    (%eax),%eax
    5041:	f7 d8                	neg    %eax
    5043:	89 c2                	mov    %eax,%edx
    5045:	8b 45 0c             	mov    0xc(%ebp),%eax
    5048:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    504a:	8b 45 08             	mov    0x8(%ebp),%eax
    504d:	8b 40 0c             	mov    0xc(%eax),%eax
    5050:	85 c0                	test   %eax,%eax
    5052:	74 30                	je     5084 <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    5054:	8b 45 08             	mov    0x8(%ebp),%eax
    5057:	8b 40 08             	mov    0x8(%eax),%eax
    505a:	8d 50 ff             	lea    -0x1(%eax),%edx
    505d:	8b 45 10             	mov    0x10(%ebp),%eax
    5060:	8b 00                	mov    (%eax),%eax
    5062:	39 c2                	cmp    %eax,%edx
    5064:	75 1e                	jne    5084 <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    5066:	8b 45 10             	mov    0x10(%ebp),%eax
    5069:	8b 00                	mov    (%eax),%eax
    506b:	89 c3                	mov    %eax,%ebx
    506d:	8b 45 08             	mov    0x8(%ebp),%eax
    5070:	8b 40 0c             	mov    0xc(%eax),%eax
    5073:	89 04 24             	mov    %eax,(%esp)
    5076:	e8 b9 fb ff ff       	call   4c34 <hgetbits>
    507b:	01 d8                	add    %ebx,%eax
    507d:	89 c2                	mov    %eax,%edx
    507f:	8b 45 10             	mov    0x10(%ebp),%eax
    5082:	89 10                	mov    %edx,(%eax)
     if (*y)
    5084:	8b 45 10             	mov    0x10(%ebp),%eax
    5087:	8b 00                	mov    (%eax),%eax
    5089:	85 c0                	test   %eax,%eax
    508b:	74 18                	je     50a5 <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    508d:	e8 bd fb ff ff       	call   4c4f <hget1bit>
    5092:	83 f8 01             	cmp    $0x1,%eax
    5095:	75 0e                	jne    50a5 <huffman_decoder+0x33b>
    5097:	8b 45 10             	mov    0x10(%ebp),%eax
    509a:	8b 00                	mov    (%eax),%eax
    509c:	f7 d8                	neg    %eax
    509e:	89 c2                	mov    %eax,%edx
    50a0:	8b 45 10             	mov    0x10(%ebp),%eax
    50a3:	89 10                	mov    %edx,(%eax)
     }

  // output_buf2();
	  
  return error;  
    50a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    50a8:	83 c4 24             	add    $0x24,%esp
    50ab:	5b                   	pop    %ebx
    50ac:	5d                   	pop    %ebp
    50ad:	c3                   	ret    

000050ae <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    50ae:	55                   	push   %ebp
    50af:	89 e5                	mov    %esp,%ebp
    50b1:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    50b4:	8b 45 0c             	mov    0xc(%ebp),%eax
    50b7:	8b 00                	mov    (%eax),%eax
    50b9:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    50bc:	8b 45 08             	mov    0x8(%ebp),%eax
    50bf:	89 04 24             	mov    %eax,(%esp)
    50c2:	e8 f3 f6 ff ff       	call   47ba <get1bit>
    50c7:	89 c2                	mov    %eax,%edx
    50c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50cc:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    50ce:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    50d5:	00 
    50d6:	8b 45 08             	mov    0x8(%ebp),%eax
    50d9:	89 04 24             	mov    %eax,(%esp)
    50dc:	e8 eb f7 ff ff       	call   48cc <getbits>
    50e1:	ba 04 00 00 00       	mov    $0x4,%edx
    50e6:	29 c2                	sub    %eax,%edx
    50e8:	89 d0                	mov    %edx,%eax
    50ea:	89 c2                	mov    %eax,%edx
    50ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    50ef:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* 错误保护. TRUE/FALSE */
    50f2:	8b 45 08             	mov    0x8(%ebp),%eax
    50f5:	89 04 24             	mov    %eax,(%esp)
    50f8:	e8 bd f6 ff ff       	call   47ba <get1bit>
    50fd:	85 c0                	test   %eax,%eax
    50ff:	0f 94 c0             	sete   %al
    5102:	0f b6 d0             	movzbl %al,%edx
    5105:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5108:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    510b:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5112:	00 
    5113:	8b 45 08             	mov    0x8(%ebp),%eax
    5116:	89 04 24             	mov    %eax,(%esp)
    5119:	e8 ae f7 ff ff       	call   48cc <getbits>
    511e:	89 c2                	mov    %eax,%edx
    5120:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5123:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    5126:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    512d:	00 
    512e:	8b 45 08             	mov    0x8(%ebp),%eax
    5131:	89 04 24             	mov    %eax,(%esp)
    5134:	e8 93 f7 ff ff       	call   48cc <getbits>
    5139:	89 c2                	mov    %eax,%edx
    513b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    513e:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    5141:	8b 45 08             	mov    0x8(%ebp),%eax
    5144:	89 04 24             	mov    %eax,(%esp)
    5147:	e8 6e f6 ff ff       	call   47ba <get1bit>
    514c:	89 c2                	mov    %eax,%edx
    514e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5151:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    5154:	8b 45 08             	mov    0x8(%ebp),%eax
    5157:	89 04 24             	mov    %eax,(%esp)
    515a:	e8 5b f6 ff ff       	call   47ba <get1bit>
    515f:	89 c2                	mov    %eax,%edx
    5161:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5164:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    5167:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    516e:	00 
    516f:	8b 45 08             	mov    0x8(%ebp),%eax
    5172:	89 04 24             	mov    %eax,(%esp)
    5175:	e8 52 f7 ff ff       	call   48cc <getbits>
    517a:	89 c2                	mov    %eax,%edx
    517c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    517f:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    5182:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5189:	00 
    518a:	8b 45 08             	mov    0x8(%ebp),%eax
    518d:	89 04 24             	mov    %eax,(%esp)
    5190:	e8 37 f7 ff ff       	call   48cc <getbits>
    5195:	89 c2                	mov    %eax,%edx
    5197:	8b 45 f4             	mov    -0xc(%ebp),%eax
    519a:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    519d:	8b 45 08             	mov    0x8(%ebp),%eax
    51a0:	89 04 24             	mov    %eax,(%esp)
    51a3:	e8 12 f6 ff ff       	call   47ba <get1bit>
    51a8:	89 c2                	mov    %eax,%edx
    51aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51ad:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    51b0:	8b 45 08             	mov    0x8(%ebp),%eax
    51b3:	89 04 24             	mov    %eax,(%esp)
    51b6:	e8 ff f5 ff ff       	call   47ba <get1bit>
    51bb:	89 c2                	mov    %eax,%edx
    51bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51c0:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    51c3:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    51ca:	00 
    51cb:	8b 45 08             	mov    0x8(%ebp),%eax
    51ce:	89 04 24             	mov    %eax,(%esp)
    51d1:	e8 f6 f6 ff ff       	call   48cc <getbits>
    51d6:	89 c2                	mov    %eax,%edx
    51d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    51db:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    51de:	c9                   	leave  
    51df:	c3                   	ret    

000051e0 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    51e0:	55                   	push   %ebp
    51e1:	89 e5                	mov    %esp,%ebp
    51e3:	56                   	push   %esi
    51e4:	53                   	push   %ebx
    51e5:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    51e8:	8b 45 10             	mov    0x10(%ebp),%eax
    51eb:	8b 40 08             	mov    0x8(%eax),%eax
    51ee:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    51f1:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    51f8:	00 
    51f9:	8b 45 08             	mov    0x8(%ebp),%eax
    51fc:	89 04 24             	mov    %eax,(%esp)
    51ff:	e8 c8 f6 ff ff       	call   48cc <getbits>
    5204:	8b 55 0c             	mov    0xc(%ebp),%edx
    5207:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    5209:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    520d:	75 1b                	jne    522a <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    520f:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    5216:	00 
    5217:	8b 45 08             	mov    0x8(%ebp),%eax
    521a:	89 04 24             	mov    %eax,(%esp)
    521d:	e8 aa f6 ff ff       	call   48cc <getbits>
    5222:	8b 55 0c             	mov    0xc(%ebp),%edx
    5225:	89 42 04             	mov    %eax,0x4(%edx)
    5228:	eb 19                	jmp    5243 <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    522a:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5231:	00 
    5232:	8b 45 08             	mov    0x8(%ebp),%eax
    5235:	89 04 24             	mov    %eax,(%esp)
    5238:	e8 8f f6 ff ff       	call   48cc <getbits>
    523d:	8b 55 0c             	mov    0xc(%ebp),%edx
    5240:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    5243:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    524a:	eb 3d                	jmp    5289 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    524c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5253:	eb 2a                	jmp    527f <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    5255:	8b 45 08             	mov    0x8(%ebp),%eax
    5258:	89 04 24             	mov    %eax,(%esp)
    525b:	e8 5a f5 ff ff       	call   47ba <get1bit>
    5260:	89 c1                	mov    %eax,%ecx
    5262:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5265:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5268:	89 d0                	mov    %edx,%eax
    526a:	c1 e0 02             	shl    $0x2,%eax
    526d:	01 d0                	add    %edx,%eax
    526f:	c1 e0 03             	shl    $0x3,%eax
    5272:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5275:	01 d0                	add    %edx,%eax
    5277:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    527b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    527f:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    5283:	7e d0                	jle    5255 <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    5285:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5289:	8b 45 f4             	mov    -0xc(%ebp),%eax
    528c:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    528f:	7c bb                	jl     524c <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    5291:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5298:	e9 c5 05 00 00       	jmp    5862 <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    529d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    52a4:	e9 a9 05 00 00       	jmp    5852 <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    52a9:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    52b0:	00 
    52b1:	8b 45 08             	mov    0x8(%ebp),%eax
    52b4:	89 04 24             	mov    %eax,(%esp)
    52b7:	e8 10 f6 ff ff       	call   48cc <getbits>
    52bc:	89 c3                	mov    %eax,%ebx
    52be:	8b 75 0c             	mov    0xc(%ebp),%esi
    52c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    52c4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    52c7:	89 c2                	mov    %eax,%edx
    52c9:	c1 e2 03             	shl    $0x3,%edx
    52cc:	01 c2                	add    %eax,%edx
    52ce:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    52d5:	89 c2                	mov    %eax,%edx
    52d7:	89 c8                	mov    %ecx,%eax
    52d9:	c1 e0 02             	shl    $0x2,%eax
    52dc:	01 c8                	add    %ecx,%eax
    52de:	c1 e0 05             	shl    $0x5,%eax
    52e1:	01 d0                	add    %edx,%eax
    52e3:	01 f0                	add    %esi,%eax
    52e5:	83 c0 18             	add    $0x18,%eax
    52e8:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    52ea:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    52f1:	00 
    52f2:	8b 45 08             	mov    0x8(%ebp),%eax
    52f5:	89 04 24             	mov    %eax,(%esp)
    52f8:	e8 cf f5 ff ff       	call   48cc <getbits>
    52fd:	89 c3                	mov    %eax,%ebx
    52ff:	8b 75 0c             	mov    0xc(%ebp),%esi
    5302:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5305:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5308:	89 c2                	mov    %eax,%edx
    530a:	c1 e2 03             	shl    $0x3,%edx
    530d:	01 c2                	add    %eax,%edx
    530f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5316:	89 c2                	mov    %eax,%edx
    5318:	89 c8                	mov    %ecx,%eax
    531a:	c1 e0 02             	shl    $0x2,%eax
    531d:	01 c8                	add    %ecx,%eax
    531f:	c1 e0 05             	shl    $0x5,%eax
    5322:	01 d0                	add    %edx,%eax
    5324:	01 f0                	add    %esi,%eax
    5326:	83 c0 1c             	add    $0x1c,%eax
    5329:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    532b:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    5332:	00 
    5333:	8b 45 08             	mov    0x8(%ebp),%eax
    5336:	89 04 24             	mov    %eax,(%esp)
    5339:	e8 8e f5 ff ff       	call   48cc <getbits>
    533e:	89 c3                	mov    %eax,%ebx
    5340:	8b 75 0c             	mov    0xc(%ebp),%esi
    5343:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5346:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5349:	89 c2                	mov    %eax,%edx
    534b:	c1 e2 03             	shl    $0x3,%edx
    534e:	01 c2                	add    %eax,%edx
    5350:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5357:	89 c2                	mov    %eax,%edx
    5359:	89 c8                	mov    %ecx,%eax
    535b:	c1 e0 02             	shl    $0x2,%eax
    535e:	01 c8                	add    %ecx,%eax
    5360:	c1 e0 05             	shl    $0x5,%eax
    5363:	01 d0                	add    %edx,%eax
    5365:	01 f0                	add    %esi,%eax
    5367:	83 c0 20             	add    $0x20,%eax
    536a:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    536c:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    5373:	00 
    5374:	8b 45 08             	mov    0x8(%ebp),%eax
    5377:	89 04 24             	mov    %eax,(%esp)
    537a:	e8 4d f5 ff ff       	call   48cc <getbits>
    537f:	89 c3                	mov    %eax,%ebx
    5381:	8b 75 0c             	mov    0xc(%ebp),%esi
    5384:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5387:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    538a:	89 c2                	mov    %eax,%edx
    538c:	c1 e2 03             	shl    $0x3,%edx
    538f:	01 c2                	add    %eax,%edx
    5391:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5398:	89 c2                	mov    %eax,%edx
    539a:	89 c8                	mov    %ecx,%eax
    539c:	c1 e0 02             	shl    $0x2,%eax
    539f:	01 c8                	add    %ecx,%eax
    53a1:	c1 e0 05             	shl    $0x5,%eax
    53a4:	01 d0                	add    %edx,%eax
    53a6:	01 f0                	add    %esi,%eax
    53a8:	83 c0 24             	add    $0x24,%eax
    53ab:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    53ad:	8b 45 08             	mov    0x8(%ebp),%eax
    53b0:	89 04 24             	mov    %eax,(%esp)
    53b3:	e8 02 f4 ff ff       	call   47ba <get1bit>
    53b8:	89 c3                	mov    %eax,%ebx
    53ba:	8b 75 0c             	mov    0xc(%ebp),%esi
    53bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    53c3:	89 c2                	mov    %eax,%edx
    53c5:	c1 e2 03             	shl    $0x3,%edx
    53c8:	01 c2                	add    %eax,%edx
    53ca:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    53d1:	89 c2                	mov    %eax,%edx
    53d3:	89 c8                	mov    %ecx,%eax
    53d5:	c1 e0 02             	shl    $0x2,%eax
    53d8:	01 c8                	add    %ecx,%eax
    53da:	c1 e0 05             	shl    $0x5,%eax
    53dd:	01 d0                	add    %edx,%eax
    53df:	01 f0                	add    %esi,%eax
    53e1:	83 c0 28             	add    $0x28,%eax
    53e4:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    53e6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    53e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    53ec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    53ef:	89 c2                	mov    %eax,%edx
    53f1:	c1 e2 03             	shl    $0x3,%edx
    53f4:	01 c2                	add    %eax,%edx
    53f6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    53fd:	89 c2                	mov    %eax,%edx
    53ff:	89 c8                	mov    %ecx,%eax
    5401:	c1 e0 02             	shl    $0x2,%eax
    5404:	01 c8                	add    %ecx,%eax
    5406:	c1 e0 05             	shl    $0x5,%eax
    5409:	01 d0                	add    %edx,%eax
    540b:	01 d8                	add    %ebx,%eax
    540d:	83 c0 28             	add    $0x28,%eax
    5410:	8b 00                	mov    (%eax),%eax
    5412:	85 c0                	test   %eax,%eax
    5414:	0f 84 82 02 00 00    	je     569c <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    541a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    5421:	00 
    5422:	8b 45 08             	mov    0x8(%ebp),%eax
    5425:	89 04 24             	mov    %eax,(%esp)
    5428:	e8 9f f4 ff ff       	call   48cc <getbits>
    542d:	89 c3                	mov    %eax,%ebx
    542f:	8b 75 0c             	mov    0xc(%ebp),%esi
    5432:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5435:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5438:	89 c2                	mov    %eax,%edx
    543a:	c1 e2 03             	shl    $0x3,%edx
    543d:	01 c2                	add    %eax,%edx
    543f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5446:	89 c2                	mov    %eax,%edx
    5448:	89 c8                	mov    %ecx,%eax
    544a:	c1 e0 02             	shl    $0x2,%eax
    544d:	01 c8                	add    %ecx,%eax
    544f:	c1 e0 05             	shl    $0x5,%eax
    5452:	01 d0                	add    %edx,%eax
    5454:	01 f0                	add    %esi,%eax
    5456:	83 c0 2c             	add    $0x2c,%eax
    5459:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    545b:	8b 45 08             	mov    0x8(%ebp),%eax
    545e:	89 04 24             	mov    %eax,(%esp)
    5461:	e8 54 f3 ff ff       	call   47ba <get1bit>
    5466:	89 c3                	mov    %eax,%ebx
    5468:	8b 75 0c             	mov    0xc(%ebp),%esi
    546b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    546e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5471:	89 c2                	mov    %eax,%edx
    5473:	c1 e2 03             	shl    $0x3,%edx
    5476:	01 c2                	add    %eax,%edx
    5478:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    547f:	89 c2                	mov    %eax,%edx
    5481:	89 c8                	mov    %ecx,%eax
    5483:	c1 e0 02             	shl    $0x2,%eax
    5486:	01 c8                	add    %ecx,%eax
    5488:	c1 e0 05             	shl    $0x5,%eax
    548b:	01 d0                	add    %edx,%eax
    548d:	01 f0                	add    %esi,%eax
    548f:	83 c0 30             	add    $0x30,%eax
    5492:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    5494:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    549b:	eb 46                	jmp    54e3 <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    549d:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    54a4:	00 
    54a5:	8b 45 08             	mov    0x8(%ebp),%eax
    54a8:	89 04 24             	mov    %eax,(%esp)
    54ab:	e8 1c f4 ff ff       	call   48cc <getbits>
    54b0:	89 c3                	mov    %eax,%ebx
    54b2:	8b 75 0c             	mov    0xc(%ebp),%esi
    54b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    54b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    54bb:	89 c2                	mov    %eax,%edx
    54bd:	c1 e2 03             	shl    $0x3,%edx
    54c0:	01 c2                	add    %eax,%edx
    54c2:	8d 04 12             	lea    (%edx,%edx,1),%eax
    54c5:	89 c2                	mov    %eax,%edx
    54c7:	89 c8                	mov    %ecx,%eax
    54c9:	c1 e0 02             	shl    $0x2,%eax
    54cc:	01 c8                	add    %ecx,%eax
    54ce:	c1 e0 03             	shl    $0x3,%eax
    54d1:	01 c2                	add    %eax,%edx
    54d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    54d6:	01 d0                	add    %edx,%eax
    54d8:	83 c0 08             	add    $0x8,%eax
    54db:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    54df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    54e3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    54e7:	7e b4                	jle    549d <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    54e9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    54f0:	eb 46                	jmp    5538 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    54f2:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    54f9:	00 
    54fa:	8b 45 08             	mov    0x8(%ebp),%eax
    54fd:	89 04 24             	mov    %eax,(%esp)
    5500:	e8 c7 f3 ff ff       	call   48cc <getbits>
    5505:	89 c3                	mov    %eax,%ebx
    5507:	8b 75 0c             	mov    0xc(%ebp),%esi
    550a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    550d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5510:	89 c2                	mov    %eax,%edx
    5512:	c1 e2 03             	shl    $0x3,%edx
    5515:	01 c2                	add    %eax,%edx
    5517:	8d 04 12             	lea    (%edx,%edx,1),%eax
    551a:	89 c2                	mov    %eax,%edx
    551c:	89 c8                	mov    %ecx,%eax
    551e:	c1 e0 02             	shl    $0x2,%eax
    5521:	01 c8                	add    %ecx,%eax
    5523:	c1 e0 03             	shl    $0x3,%eax
    5526:	01 c2                	add    %eax,%edx
    5528:	8b 45 ec             	mov    -0x14(%ebp),%eax
    552b:	01 d0                	add    %edx,%eax
    552d:	83 c0 0c             	add    $0xc,%eax
    5530:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    5534:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5538:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    553c:	7e b4                	jle    54f2 <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    553e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5541:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5544:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5547:	89 c2                	mov    %eax,%edx
    5549:	c1 e2 03             	shl    $0x3,%edx
    554c:	01 c2                	add    %eax,%edx
    554e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5555:	89 c2                	mov    %eax,%edx
    5557:	89 c8                	mov    %ecx,%eax
    5559:	c1 e0 02             	shl    $0x2,%eax
    555c:	01 c8                	add    %ecx,%eax
    555e:	c1 e0 05             	shl    $0x5,%eax
    5561:	01 d0                	add    %edx,%eax
    5563:	01 d8                	add    %ebx,%eax
    5565:	83 c0 2c             	add    $0x2c,%eax
    5568:	8b 00                	mov    (%eax),%eax
    556a:	85 c0                	test   %eax,%eax
    556c:	75 05                	jne    5573 <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    556e:	e8 17 e7 ff ff       	call   3c8a <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    5573:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5576:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5579:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    557c:	89 c2                	mov    %eax,%edx
    557e:	c1 e2 03             	shl    $0x3,%edx
    5581:	01 c2                	add    %eax,%edx
    5583:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    558a:	89 c2                	mov    %eax,%edx
    558c:	89 c8                	mov    %ecx,%eax
    558e:	c1 e0 02             	shl    $0x2,%eax
    5591:	01 c8                	add    %ecx,%eax
    5593:	c1 e0 05             	shl    $0x5,%eax
    5596:	01 d0                	add    %edx,%eax
    5598:	01 d8                	add    %ebx,%eax
    559a:	83 c0 2c             	add    $0x2c,%eax
    559d:	8b 00                	mov    (%eax),%eax
    559f:	83 f8 02             	cmp    $0x2,%eax
    55a2:	75 62                	jne    5606 <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    55a4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    55a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55aa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    55ad:	89 c2                	mov    %eax,%edx
    55af:	c1 e2 03             	shl    $0x3,%edx
    55b2:	01 c2                	add    %eax,%edx
    55b4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    55bb:	89 c2                	mov    %eax,%edx
    55bd:	89 c8                	mov    %ecx,%eax
    55bf:	c1 e0 02             	shl    $0x2,%eax
    55c2:	01 c8                	add    %ecx,%eax
    55c4:	c1 e0 05             	shl    $0x5,%eax
    55c7:	01 d0                	add    %edx,%eax
    55c9:	01 d8                	add    %ebx,%eax
    55cb:	83 c0 30             	add    $0x30,%eax
    55ce:	8b 00                	mov    (%eax),%eax
    55d0:	85 c0                	test   %eax,%eax
    55d2:	75 32                	jne    5606 <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    55d4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    55d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55da:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    55dd:	89 c2                	mov    %eax,%edx
    55df:	c1 e2 03             	shl    $0x3,%edx
    55e2:	01 c2                	add    %eax,%edx
    55e4:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    55eb:	89 c2                	mov    %eax,%edx
    55ed:	89 c8                	mov    %ecx,%eax
    55ef:	c1 e0 02             	shl    $0x2,%eax
    55f2:	01 c8                	add    %ecx,%eax
    55f4:	c1 e0 05             	shl    $0x5,%eax
    55f7:	01 d0                	add    %edx,%eax
    55f9:	01 d8                	add    %ebx,%eax
    55fb:	83 c0 4c             	add    $0x4c,%eax
    55fe:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    5604:	eb 30                	jmp    5636 <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    5606:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5609:	8b 45 f0             	mov    -0x10(%ebp),%eax
    560c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    560f:	89 c2                	mov    %eax,%edx
    5611:	c1 e2 03             	shl    $0x3,%edx
    5614:	01 c2                	add    %eax,%edx
    5616:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    561d:	89 c2                	mov    %eax,%edx
    561f:	89 c8                	mov    %ecx,%eax
    5621:	c1 e0 02             	shl    $0x2,%eax
    5624:	01 c8                	add    %ecx,%eax
    5626:	c1 e0 05             	shl    $0x5,%eax
    5629:	01 d0                	add    %edx,%eax
    562b:	01 d8                	add    %ebx,%eax
    562d:	83 c0 4c             	add    $0x4c,%eax
    5630:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    5636:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5639:	8b 45 f0             	mov    -0x10(%ebp),%eax
    563c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    563f:	89 c2                	mov    %eax,%edx
    5641:	c1 e2 03             	shl    $0x3,%edx
    5644:	01 c2                	add    %eax,%edx
    5646:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    564d:	89 c2                	mov    %eax,%edx
    564f:	89 c8                	mov    %ecx,%eax
    5651:	c1 e0 02             	shl    $0x2,%eax
    5654:	01 c8                	add    %ecx,%eax
    5656:	c1 e0 05             	shl    $0x5,%eax
    5659:	01 d0                	add    %edx,%eax
    565b:	01 d8                	add    %ebx,%eax
    565d:	83 c0 4c             	add    $0x4c,%eax
    5660:	8b 00                	mov    (%eax),%eax
    5662:	ba 14 00 00 00       	mov    $0x14,%edx
    5667:	89 d3                	mov    %edx,%ebx
    5669:	29 c3                	sub    %eax,%ebx
    566b:	8b 75 0c             	mov    0xc(%ebp),%esi
    566e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5671:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5674:	89 c2                	mov    %eax,%edx
    5676:	c1 e2 03             	shl    $0x3,%edx
    5679:	01 c2                	add    %eax,%edx
    567b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5682:	89 c2                	mov    %eax,%edx
    5684:	89 c8                	mov    %ecx,%eax
    5686:	c1 e0 02             	shl    $0x2,%eax
    5689:	01 c8                	add    %ecx,%eax
    568b:	c1 e0 05             	shl    $0x5,%eax
    568e:	01 d0                	add    %edx,%eax
    5690:	01 f0                	add    %esi,%eax
    5692:	83 c0 50             	add    $0x50,%eax
    5695:	89 18                	mov    %ebx,(%eax)
    5697:	e9 07 01 00 00       	jmp    57a3 <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    569c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    56a3:	eb 46                	jmp    56eb <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    56a5:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    56ac:	00 
    56ad:	8b 45 08             	mov    0x8(%ebp),%eax
    56b0:	89 04 24             	mov    %eax,(%esp)
    56b3:	e8 14 f2 ff ff       	call   48cc <getbits>
    56b8:	89 c3                	mov    %eax,%ebx
    56ba:	8b 75 0c             	mov    0xc(%ebp),%esi
    56bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    56c0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    56c3:	89 c2                	mov    %eax,%edx
    56c5:	c1 e2 03             	shl    $0x3,%edx
    56c8:	01 c2                	add    %eax,%edx
    56ca:	8d 04 12             	lea    (%edx,%edx,1),%eax
    56cd:	89 c2                	mov    %eax,%edx
    56cf:	89 c8                	mov    %ecx,%eax
    56d1:	c1 e0 02             	shl    $0x2,%eax
    56d4:	01 c8                	add    %ecx,%eax
    56d6:	c1 e0 03             	shl    $0x3,%eax
    56d9:	01 c2                	add    %eax,%edx
    56db:	8b 45 ec             	mov    -0x14(%ebp),%eax
    56de:	01 d0                	add    %edx,%eax
    56e0:	83 c0 08             	add    $0x8,%eax
    56e3:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    56e7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    56eb:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    56ef:	7e b4                	jle    56a5 <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    56f1:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    56f8:	00 
    56f9:	8b 45 08             	mov    0x8(%ebp),%eax
    56fc:	89 04 24             	mov    %eax,(%esp)
    56ff:	e8 c8 f1 ff ff       	call   48cc <getbits>
    5704:	89 c3                	mov    %eax,%ebx
    5706:	8b 75 0c             	mov    0xc(%ebp),%esi
    5709:	8b 45 f0             	mov    -0x10(%ebp),%eax
    570c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    570f:	89 c2                	mov    %eax,%edx
    5711:	c1 e2 03             	shl    $0x3,%edx
    5714:	01 c2                	add    %eax,%edx
    5716:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    571d:	89 c2                	mov    %eax,%edx
    571f:	89 c8                	mov    %ecx,%eax
    5721:	c1 e0 02             	shl    $0x2,%eax
    5724:	01 c8                	add    %ecx,%eax
    5726:	c1 e0 05             	shl    $0x5,%eax
    5729:	01 d0                	add    %edx,%eax
    572b:	01 f0                	add    %esi,%eax
    572d:	83 c0 4c             	add    $0x4c,%eax
    5730:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    5732:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    5739:	00 
    573a:	8b 45 08             	mov    0x8(%ebp),%eax
    573d:	89 04 24             	mov    %eax,(%esp)
    5740:	e8 87 f1 ff ff       	call   48cc <getbits>
    5745:	89 c3                	mov    %eax,%ebx
    5747:	8b 75 0c             	mov    0xc(%ebp),%esi
    574a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    574d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5750:	89 c2                	mov    %eax,%edx
    5752:	c1 e2 03             	shl    $0x3,%edx
    5755:	01 c2                	add    %eax,%edx
    5757:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    575e:	89 c2                	mov    %eax,%edx
    5760:	89 c8                	mov    %ecx,%eax
    5762:	c1 e0 02             	shl    $0x2,%eax
    5765:	01 c8                	add    %ecx,%eax
    5767:	c1 e0 05             	shl    $0x5,%eax
    576a:	01 d0                	add    %edx,%eax
    576c:	01 f0                	add    %esi,%eax
    576e:	83 c0 50             	add    $0x50,%eax
    5771:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    5773:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5776:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5779:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    577c:	89 c2                	mov    %eax,%edx
    577e:	c1 e2 03             	shl    $0x3,%edx
    5781:	01 c2                	add    %eax,%edx
    5783:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    578a:	89 c2                	mov    %eax,%edx
    578c:	89 c8                	mov    %ecx,%eax
    578e:	c1 e0 02             	shl    $0x2,%eax
    5791:	01 c8                	add    %ecx,%eax
    5793:	c1 e0 05             	shl    $0x5,%eax
    5796:	01 d0                	add    %edx,%eax
    5798:	01 d8                	add    %ebx,%eax
    579a:	83 c0 2c             	add    $0x2c,%eax
    579d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    57a3:	8b 45 08             	mov    0x8(%ebp),%eax
    57a6:	89 04 24             	mov    %eax,(%esp)
    57a9:	e8 0c f0 ff ff       	call   47ba <get1bit>
    57ae:	89 c3                	mov    %eax,%ebx
    57b0:	8b 75 0c             	mov    0xc(%ebp),%esi
    57b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    57b6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    57b9:	89 c2                	mov    %eax,%edx
    57bb:	c1 e2 03             	shl    $0x3,%edx
    57be:	01 c2                	add    %eax,%edx
    57c0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    57c7:	89 c2                	mov    %eax,%edx
    57c9:	89 c8                	mov    %ecx,%eax
    57cb:	c1 e0 02             	shl    $0x2,%eax
    57ce:	01 c8                	add    %ecx,%eax
    57d0:	c1 e0 05             	shl    $0x5,%eax
    57d3:	01 d0                	add    %edx,%eax
    57d5:	01 f0                	add    %esi,%eax
    57d7:	83 c0 54             	add    $0x54,%eax
    57da:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    57dc:	8b 45 08             	mov    0x8(%ebp),%eax
    57df:	89 04 24             	mov    %eax,(%esp)
    57e2:	e8 d3 ef ff ff       	call   47ba <get1bit>
    57e7:	89 c3                	mov    %eax,%ebx
    57e9:	8b 75 0c             	mov    0xc(%ebp),%esi
    57ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
    57ef:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    57f2:	89 c2                	mov    %eax,%edx
    57f4:	c1 e2 03             	shl    $0x3,%edx
    57f7:	01 c2                	add    %eax,%edx
    57f9:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5800:	89 c2                	mov    %eax,%edx
    5802:	89 c8                	mov    %ecx,%eax
    5804:	c1 e0 02             	shl    $0x2,%eax
    5807:	01 c8                	add    %ecx,%eax
    5809:	c1 e0 05             	shl    $0x5,%eax
    580c:	01 d0                	add    %edx,%eax
    580e:	01 f0                	add    %esi,%eax
    5810:	83 c0 58             	add    $0x58,%eax
    5813:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    5815:	8b 45 08             	mov    0x8(%ebp),%eax
    5818:	89 04 24             	mov    %eax,(%esp)
    581b:	e8 9a ef ff ff       	call   47ba <get1bit>
    5820:	89 c3                	mov    %eax,%ebx
    5822:	8b 75 0c             	mov    0xc(%ebp),%esi
    5825:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5828:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    582b:	89 c2                	mov    %eax,%edx
    582d:	c1 e2 03             	shl    $0x3,%edx
    5830:	01 c2                	add    %eax,%edx
    5832:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5839:	89 c2                	mov    %eax,%edx
    583b:	89 c8                	mov    %ecx,%eax
    583d:	c1 e0 02             	shl    $0x2,%eax
    5840:	01 c8                	add    %ecx,%eax
    5842:	c1 e0 05             	shl    $0x5,%eax
    5845:	01 d0                	add    %edx,%eax
    5847:	01 f0                	add    %esi,%eax
    5849:	83 c0 5c             	add    $0x5c,%eax
    584c:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    584e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5852:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5855:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    5858:	0f 8c 4b fa ff ff    	jl     52a9 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    585e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5862:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5866:	0f 8e 31 fa ff ff    	jle    529d <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    586c:	83 c4 20             	add    $0x20,%esp
    586f:	5b                   	pop    %ebx
    5870:	5e                   	pop    %esi
    5871:	5d                   	pop    %ebp
    5872:	c3                   	ret    

00005873 <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    5873:	55                   	push   %ebp
    5874:	89 e5                	mov    %esp,%ebp
    5876:	56                   	push   %esi
    5877:	53                   	push   %ebx
    5878:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    587b:	8b 45 10             	mov    0x10(%ebp),%eax
    587e:	89 c2                	mov    %eax,%edx
    5880:	c1 e2 03             	shl    $0x3,%edx
    5883:	01 c2                	add    %eax,%edx
    5885:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    588c:	89 c2                	mov    %eax,%edx
    588e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5891:	89 c8                	mov    %ecx,%eax
    5893:	c1 e0 02             	shl    $0x2,%eax
    5896:	01 c8                	add    %ecx,%eax
    5898:	c1 e0 05             	shl    $0x5,%eax
    589b:	01 d0                	add    %edx,%eax
    589d:	8d 50 10             	lea    0x10(%eax),%edx
    58a0:	8b 45 0c             	mov    0xc(%ebp),%eax
    58a3:	01 d0                	add    %edx,%eax
    58a5:	83 c0 08             	add    $0x8,%eax
    58a8:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    58ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58ae:	8b 40 10             	mov    0x10(%eax),%eax
    58b1:	85 c0                	test   %eax,%eax
    58b3:	0f 84 7e 02 00 00    	je     5b37 <III_get_scale_factors+0x2c4>
    58b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58bc:	8b 40 14             	mov    0x14(%eax),%eax
    58bf:	83 f8 02             	cmp    $0x2,%eax
    58c2:	0f 85 6f 02 00 00    	jne    5b37 <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    58c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58cb:	8b 40 18             	mov    0x18(%eax),%eax
    58ce:	85 c0                	test   %eax,%eax
    58d0:	0f 84 6b 01 00 00    	je     5a41 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    58d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    58dd:	eb 32                	jmp    5911 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    58df:	8b 45 e8             	mov    -0x18(%ebp),%eax
    58e2:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    58e5:	8b 04 85 00 c4 00 00 	mov    0xc400(,%eax,4),%eax
    58ec:	89 04 24             	mov    %eax,(%esp)
    58ef:	e8 40 f3 ff ff       	call   4c34 <hgetbits>
    58f4:	89 c3                	mov    %eax,%ebx
    58f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    58f9:	8b 45 14             	mov    0x14(%ebp),%eax
    58fc:	01 c0                	add    %eax,%eax
    58fe:	89 c2                	mov    %eax,%edx
    5900:	c1 e2 05             	shl    $0x5,%edx
    5903:	29 c2                	sub    %eax,%edx
    5905:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5908:	01 d0                	add    %edx,%eax
    590a:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    590d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5911:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    5915:	7e c8                	jle    58df <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    5917:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    591e:	eb 5c                	jmp    597c <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    5920:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5927:	eb 49                	jmp    5972 <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    5929:	8b 45 e8             	mov    -0x18(%ebp),%eax
    592c:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    592f:	8b 04 85 00 c4 00 00 	mov    0xc400(,%eax,4),%eax
    5936:	89 04 24             	mov    %eax,(%esp)
    5939:	e8 f6 f2 ff ff       	call   4c34 <hgetbits>
    593e:	89 c6                	mov    %eax,%esi
    5940:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5943:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5946:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5949:	89 d0                	mov    %edx,%eax
    594b:	01 c0                	add    %eax,%eax
    594d:	01 d0                	add    %edx,%eax
    594f:	c1 e0 02             	shl    $0x2,%eax
    5952:	01 d0                	add    %edx,%eax
    5954:	89 ca                	mov    %ecx,%edx
    5956:	01 d2                	add    %edx,%edx
    5958:	89 d1                	mov    %edx,%ecx
    595a:	c1 e1 05             	shl    $0x5,%ecx
    595d:	29 d1                	sub    %edx,%ecx
    595f:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    5962:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5965:	01 d0                	add    %edx,%eax
    5967:	83 c0 14             	add    $0x14,%eax
    596a:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    596e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5972:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5976:	7e b1                	jle    5929 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    5978:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    597c:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    5980:	7e 9e                	jle    5920 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    5982:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    5989:	eb 5f                	jmp    59ea <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    598b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5992:	eb 4c                	jmp    59e0 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    5994:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5997:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    599a:	83 c0 10             	add    $0x10,%eax
    599d:	8b 04 85 00 c4 00 00 	mov    0xc400(,%eax,4),%eax
    59a4:	89 04 24             	mov    %eax,(%esp)
    59a7:	e8 88 f2 ff ff       	call   4c34 <hgetbits>
    59ac:	89 c6                	mov    %eax,%esi
    59ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
    59b1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    59b4:	8b 4d 14             	mov    0x14(%ebp),%ecx
    59b7:	89 d0                	mov    %edx,%eax
    59b9:	01 c0                	add    %eax,%eax
    59bb:	01 d0                	add    %edx,%eax
    59bd:	c1 e0 02             	shl    $0x2,%eax
    59c0:	01 d0                	add    %edx,%eax
    59c2:	89 ca                	mov    %ecx,%edx
    59c4:	01 d2                	add    %edx,%edx
    59c6:	89 d1                	mov    %edx,%ecx
    59c8:	c1 e1 05             	shl    $0x5,%ecx
    59cb:	29 d1                	sub    %edx,%ecx
    59cd:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    59d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    59d3:	01 d0                	add    %edx,%eax
    59d5:	83 c0 14             	add    $0x14,%eax
    59d8:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    59dc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    59e0:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    59e4:	7e ae                	jle    5994 <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    59e6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    59ea:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    59ee:	7e 9b                	jle    598b <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    59f0:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    59f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    59fe:	eb 36                	jmp    5a36 <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    5a00:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5a03:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a06:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5a09:	89 d0                	mov    %edx,%eax
    5a0b:	01 c0                	add    %eax,%eax
    5a0d:	01 d0                	add    %edx,%eax
    5a0f:	c1 e0 02             	shl    $0x2,%eax
    5a12:	01 d0                	add    %edx,%eax
    5a14:	89 ca                	mov    %ecx,%edx
    5a16:	01 d2                	add    %edx,%edx
    5a18:	89 d1                	mov    %edx,%ecx
    5a1a:	c1 e1 05             	shl    $0x5,%ecx
    5a1d:	29 d1                	sub    %edx,%ecx
    5a1f:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    5a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5a25:	01 d0                	add    %edx,%eax
    5a27:	83 c0 14             	add    $0x14,%eax
    5a2a:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    5a31:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    5a32:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5a36:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5a3a:	7e c4                	jle    5a00 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    5a3c:	e9 b1 01 00 00       	jmp    5bf2 <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    5a41:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5a48:	e9 8f 00 00 00       	jmp    5adc <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    5a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5a50:	83 c0 04             	add    $0x4,%eax
    5a53:	8b 04 85 e4 c3 00 00 	mov    0xc3e4(,%eax,4),%eax
    5a5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5a5d:	eb 64                	jmp    5ac3 <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    5a5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5a66:	eb 51                	jmp    5ab9 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    5a68:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5a6b:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    5a6e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5a71:	c1 e2 04             	shl    $0x4,%edx
    5a74:	01 d0                	add    %edx,%eax
    5a76:	8b 04 85 00 c4 00 00 	mov    0xc400(,%eax,4),%eax
    5a7d:	89 04 24             	mov    %eax,(%esp)
    5a80:	e8 af f1 ff ff       	call   4c34 <hgetbits>
    5a85:	89 c6                	mov    %eax,%esi
    5a87:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5a8a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5a8d:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5a90:	89 d0                	mov    %edx,%eax
    5a92:	01 c0                	add    %eax,%eax
    5a94:	01 d0                	add    %edx,%eax
    5a96:	c1 e0 02             	shl    $0x2,%eax
    5a99:	01 d0                	add    %edx,%eax
    5a9b:	89 ca                	mov    %ecx,%edx
    5a9d:	01 d2                	add    %edx,%edx
    5a9f:	89 d1                	mov    %edx,%ecx
    5aa1:	c1 e1 05             	shl    $0x5,%ecx
    5aa4:	29 d1                	sub    %edx,%ecx
    5aa6:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    5aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5aac:	01 d0                	add    %edx,%eax
    5aae:	83 c0 14             	add    $0x14,%eax
    5ab1:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    5ab5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5ab9:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5abd:	7e a9                	jle    5a68 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    5abf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5ac3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5ac6:	83 c0 01             	add    $0x1,%eax
    5ac9:	83 c0 04             	add    $0x4,%eax
    5acc:	8b 04 85 e4 c3 00 00 	mov    0xc3e4(,%eax,4),%eax
    5ad3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5ad6:	7f 87                	jg     5a5f <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    5ad8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5adc:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5ae0:	0f 8e 67 ff ff ff    	jle    5a4d <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    5ae6:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    5aed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    5af4:	eb 36                	jmp    5b2c <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    5af6:	8b 5d 08             	mov    0x8(%ebp),%ebx
    5af9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5afc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    5aff:	89 d0                	mov    %edx,%eax
    5b01:	01 c0                	add    %eax,%eax
    5b03:	01 d0                	add    %edx,%eax
    5b05:	c1 e0 02             	shl    $0x2,%eax
    5b08:	01 d0                	add    %edx,%eax
    5b0a:	89 ca                	mov    %ecx,%edx
    5b0c:	01 d2                	add    %edx,%edx
    5b0e:	89 d1                	mov    %edx,%ecx
    5b10:	c1 e1 05             	shl    $0x5,%ecx
    5b13:	29 d1                	sub    %edx,%ecx
    5b15:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    5b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5b1b:	01 d0                	add    %edx,%eax
    5b1d:	83 c0 14             	add    $0x14,%eax
    5b20:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    5b27:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    5b28:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    5b2c:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    5b30:	7e c4                	jle    5af6 <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    5b32:	e9 bb 00 00 00       	jmp    5bf2 <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    5b37:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5b3e:	e9 89 00 00 00       	jmp    5bcc <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    5b43:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    5b46:	8b 55 14             	mov    0x14(%ebp),%edx
    5b49:	89 d0                	mov    %edx,%eax
    5b4b:	c1 e0 02             	shl    $0x2,%eax
    5b4e:	01 d0                	add    %edx,%eax
    5b50:	c1 e0 03             	shl    $0x3,%eax
    5b53:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5b56:	01 d0                	add    %edx,%eax
    5b58:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    5b5c:	85 c0                	test   %eax,%eax
    5b5e:	74 06                	je     5b66 <III_get_scale_factors+0x2f3>
    5b60:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    5b64:	75 62                	jne    5bc8 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5b66:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5b69:	8b 04 85 e0 c3 00 00 	mov    0xc3e0(,%eax,4),%eax
    5b70:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5b73:	eb 41                	jmp    5bb6 <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    5b75:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    5b79:	0f 9f c0             	setg   %al
    5b7c:	0f b6 d0             	movzbl %al,%edx
    5b7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5b82:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    5b85:	c1 e2 04             	shl    $0x4,%edx
    5b88:	01 d0                	add    %edx,%eax
    5b8a:	8b 04 85 00 c4 00 00 	mov    0xc400(,%eax,4),%eax
    5b91:	89 04 24             	mov    %eax,(%esp)
    5b94:	e8 9b f0 ff ff       	call   4c34 <hgetbits>
    5b99:	89 c3                	mov    %eax,%ebx
    5b9b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5b9e:	8b 45 14             	mov    0x14(%ebp),%eax
    5ba1:	01 c0                	add    %eax,%eax
    5ba3:	89 c2                	mov    %eax,%edx
    5ba5:	c1 e2 05             	shl    $0x5,%edx
    5ba8:	29 c2                	sub    %eax,%edx
    5baa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bad:	01 d0                	add    %edx,%eax
    5baf:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    5bb2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    5bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5bb9:	83 c0 01             	add    $0x1,%eax
    5bbc:	8b 04 85 e0 c3 00 00 	mov    0xc3e0(,%eax,4),%eax
    5bc3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5bc6:	7f ad                	jg     5b75 <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    5bc8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    5bcc:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    5bd0:	0f 8e 6d ff ff ff    	jle    5b43 <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    5bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5bd9:	8b 45 14             	mov    0x14(%ebp),%eax
    5bdc:	c1 e0 03             	shl    $0x3,%eax
    5bdf:	89 c2                	mov    %eax,%edx
    5be1:	c1 e2 05             	shl    $0x5,%edx
    5be4:	29 c2                	sub    %eax,%edx
    5be6:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    5be9:	83 c0 58             	add    $0x58,%eax
    5bec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    5bf2:	83 c4 20             	add    $0x20,%esp
    5bf5:	5b                   	pop    %ebx
    5bf6:	5e                   	pop    %esi
    5bf7:	5d                   	pop    %ebp
    5bf8:	c3                   	ret    

00005bf9 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    5bf9:	55                   	push   %ebp
    5bfa:	89 e5                	mov    %esp,%ebp
    5bfc:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    5bff:	a1 20 d7 00 00       	mov    0xd720,%eax
    5c04:	85 c0                	test   %eax,%eax
    5c06:	74 02                	je     5c0a <initialize_huffman+0x11>
    5c08:	eb 0f                	jmp    5c19 <initialize_huffman+0x20>
	read_decoder_table();
    5c0a:	e8 8a f0 ff ff       	call   4c99 <read_decoder_table>
	huffman_initialized = TRUE;
    5c0f:	c7 05 20 d7 00 00 01 	movl   $0x1,0xd720
    5c16:	00 00 00 
}
    5c19:	c9                   	leave  
    5c1a:	c3                   	ret    

00005c1b <III_hufman_decode>:
//   }
//   printf(0, "\n");
// }

void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    5c1b:	55                   	push   %ebp
    5c1c:	89 e5                	mov    %esp,%ebp
    5c1e:	57                   	push   %edi
    5c1f:	56                   	push   %esi
    5c20:	53                   	push   %ebx
    5c21:	83 ec 4c             	sub    $0x4c,%esp

   // printf(0, "Now in hufman decode %d %d !\n", ch, gr);
   // output_side_info(si);
   // output_frps2(fr_ps);

   initialize_huffman();
    5c24:	e8 d0 ff ff ff       	call   5bf9 <initialize_huffman>
   //    printf(0, "u:%d %d %d %d %d\n", u, ht[u].xlen, ht[u].ylen, ht[u].linbits, ht[u].linmax);
   // }

   /* 查找区域边界 */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5c29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5c2c:	8b 45 14             	mov    0x14(%ebp),%eax
    5c2f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5c32:	89 c2                	mov    %eax,%edx
    5c34:	c1 e2 03             	shl    $0x3,%edx
    5c37:	01 c2                	add    %eax,%edx
    5c39:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c40:	89 c2                	mov    %eax,%edx
    5c42:	89 c8                	mov    %ecx,%eax
    5c44:	c1 e0 02             	shl    $0x2,%eax
    5c47:	01 c8                	add    %ecx,%eax
    5c49:	c1 e0 05             	shl    $0x5,%eax
    5c4c:	01 d0                	add    %edx,%eax
    5c4e:	01 d8                	add    %ebx,%eax
    5c50:	83 c0 28             	add    $0x28,%eax
    5c53:	8b 00                	mov    (%eax),%eax
    5c55:	85 c0                	test   %eax,%eax
    5c57:	74 44                	je     5c9d <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    5c59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5c5c:	8b 45 14             	mov    0x14(%ebp),%eax
    5c5f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5c62:	89 c2                	mov    %eax,%edx
    5c64:	c1 e2 03             	shl    $0x3,%edx
    5c67:	01 c2                	add    %eax,%edx
    5c69:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5c70:	89 c2                	mov    %eax,%edx
    5c72:	89 c8                	mov    %ecx,%eax
    5c74:	c1 e0 02             	shl    $0x2,%eax
    5c77:	01 c8                	add    %ecx,%eax
    5c79:	c1 e0 05             	shl    $0x5,%eax
    5c7c:	01 d0                	add    %edx,%eax
    5c7e:	01 d8                	add    %ebx,%eax
    5c80:	83 c0 2c             	add    $0x2c,%eax
    5c83:	8b 00                	mov    (%eax),%eax
   //    printf(0, "u:%d %d %d %d %d\n", u, ht[u].xlen, ht[u].ylen, ht[u].linbits, ht[u].linmax);
   // }

   /* 查找区域边界 */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    5c85:	83 f8 02             	cmp    $0x2,%eax
    5c88:	75 13                	jne    5c9d <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    5c8a:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    5c91:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    5c98:	e9 cc 00 00 00       	jmp    5d69 <III_hufman_decode+0x14e>
   }


   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5c9d:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5ca0:	8b 00                	mov    (%eax),%eax
    5ca2:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    5ca5:	8b 75 0c             	mov    0xc(%ebp),%esi
    5ca8:	8b 45 14             	mov    0x14(%ebp),%eax
    5cab:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5cae:	89 c2                	mov    %eax,%edx
    5cb0:	c1 e2 03             	shl    $0x3,%edx
    5cb3:	01 c2                	add    %eax,%edx
    5cb5:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5cbc:	89 c2                	mov    %eax,%edx
    5cbe:	89 d8                	mov    %ebx,%eax
    5cc0:	c1 e0 02             	shl    $0x2,%eax
    5cc3:	01 d8                	add    %ebx,%eax
    5cc5:	c1 e0 05             	shl    $0x5,%eax
    5cc8:	01 d0                	add    %edx,%eax
    5cca:	01 f0                	add    %esi,%eax
    5ccc:	83 c0 4c             	add    $0x4c,%eax
    5ccf:	8b 00                	mov    (%eax),%eax
    5cd1:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5cd4:	89 c8                	mov    %ecx,%eax
    5cd6:	c1 e0 03             	shl    $0x3,%eax
    5cd9:	01 c8                	add    %ecx,%eax
    5cdb:	c1 e0 02             	shl    $0x2,%eax
    5cde:	01 c8                	add    %ecx,%eax
    5ce0:	01 d0                	add    %edx,%eax
    5ce2:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    5ce9:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5cec:	8b 45 1c             	mov    0x1c(%ebp),%eax
    5cef:	8b 00                	mov    (%eax),%eax
    5cf1:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5cf4:	8b 75 0c             	mov    0xc(%ebp),%esi
    5cf7:	8b 45 14             	mov    0x14(%ebp),%eax
    5cfa:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5cfd:	89 c2                	mov    %eax,%edx
    5cff:	c1 e2 03             	shl    $0x3,%edx
    5d02:	01 c2                	add    %eax,%edx
    5d04:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d0b:	89 c2                	mov    %eax,%edx
    5d0d:	89 d8                	mov    %ebx,%eax
    5d0f:	c1 e0 02             	shl    $0x2,%eax
    5d12:	01 d8                	add    %ebx,%eax
    5d14:	c1 e0 05             	shl    $0x5,%eax
    5d17:	01 d0                	add    %edx,%eax
    5d19:	01 f0                	add    %esi,%eax
    5d1b:	83 c0 4c             	add    $0x4c,%eax
    5d1e:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5d20:	8b 7d 0c             	mov    0xc(%ebp),%edi
    5d23:	8b 45 14             	mov    0x14(%ebp),%eax
    5d26:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5d29:	89 c2                	mov    %eax,%edx
    5d2b:	c1 e2 03             	shl    $0x3,%edx
    5d2e:	01 c2                	add    %eax,%edx
    5d30:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d37:	89 c2                	mov    %eax,%edx
    5d39:	89 d8                	mov    %ebx,%eax
    5d3b:	c1 e0 02             	shl    $0x2,%eax
    5d3e:	01 d8                	add    %ebx,%eax
    5d40:	c1 e0 05             	shl    $0x5,%eax
    5d43:	01 d0                	add    %edx,%eax
    5d45:	01 f8                	add    %edi,%eax
    5d47:	83 c0 50             	add    $0x50,%eax
    5d4a:	8b 00                	mov    (%eax),%eax
   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    5d4c:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    5d4e:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* 查找长块情况下的区域边界. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    5d51:	89 c8                	mov    %ecx,%eax
    5d53:	c1 e0 03             	shl    $0x3,%eax
    5d56:	01 c8                	add    %ecx,%eax
    5d58:	c1 e0 02             	shl    $0x2,%eax
    5d5b:	01 c8                	add    %ecx,%eax
    5d5d:	01 d0                	add    %edx,%eax
    5d5f:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    5d66:	89 45 d8             	mov    %eax,-0x28(%ebp)
      }


   /* 读取大值区域Read bigvalues area. */
   // printf(0, "big_values=%d\n", (*si).ch[ch].gr[gr].big_values);
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5d69:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    5d70:	e9 ac 01 00 00       	jmp    5f21 <III_hufman_decode+0x306>
      if (i<region1Start) 
    5d75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5d78:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    5d7b:	7d 43                	jge    5dc0 <III_hufman_decode+0x1a5>
        h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    5d7d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5d80:	8b 45 14             	mov    0x14(%ebp),%eax
    5d83:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5d86:	89 c2                	mov    %eax,%edx
    5d88:	c1 e2 03             	shl    $0x3,%edx
    5d8b:	01 c2                	add    %eax,%edx
    5d8d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5d94:	89 c2                	mov    %eax,%edx
    5d96:	89 c8                	mov    %ecx,%eax
    5d98:	c1 e0 02             	shl    $0x2,%eax
    5d9b:	01 c8                	add    %ecx,%eax
    5d9d:	c1 e0 05             	shl    $0x5,%eax
    5da0:	01 d0                	add    %edx,%eax
    5da2:	01 d8                	add    %ebx,%eax
    5da4:	83 c0 34             	add    $0x34,%eax
    5da7:	8b 10                	mov    (%eax),%edx
    5da9:	89 d0                	mov    %edx,%eax
    5dab:	c1 e0 02             	shl    $0x2,%eax
    5dae:	01 d0                	add    %edx,%eax
    5db0:	c1 e0 03             	shl    $0x3,%eax
    5db3:	05 80 be 00 00       	add    $0xbe80,%eax
    5db8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5dbb:	e9 86 00 00 00       	jmp    5e46 <III_hufman_decode+0x22b>
      else if (i<region2Start) 
    5dc0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5dc3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    5dc6:	7d 40                	jge    5e08 <III_hufman_decode+0x1ed>
        h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    5dc8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5dcb:	8b 45 14             	mov    0x14(%ebp),%eax
    5dce:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5dd1:	89 c2                	mov    %eax,%edx
    5dd3:	c1 e2 03             	shl    $0x3,%edx
    5dd6:	01 c2                	add    %eax,%edx
    5dd8:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5ddf:	89 c2                	mov    %eax,%edx
    5de1:	89 c8                	mov    %ecx,%eax
    5de3:	c1 e0 02             	shl    $0x2,%eax
    5de6:	01 c8                	add    %ecx,%eax
    5de8:	c1 e0 05             	shl    $0x5,%eax
    5deb:	01 d0                	add    %edx,%eax
    5ded:	01 d8                	add    %ebx,%eax
    5def:	83 c0 38             	add    $0x38,%eax
    5df2:	8b 10                	mov    (%eax),%edx
    5df4:	89 d0                	mov    %edx,%eax
    5df6:	c1 e0 02             	shl    $0x2,%eax
    5df9:	01 d0                	add    %edx,%eax
    5dfb:	c1 e0 03             	shl    $0x3,%eax
    5dfe:	05 80 be 00 00       	add    $0xbe80,%eax
    5e03:	89 45 e0             	mov    %eax,-0x20(%ebp)
    5e06:	eb 3e                	jmp    5e46 <III_hufman_decode+0x22b>
      else 
        h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    5e08:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5e0b:	8b 45 14             	mov    0x14(%ebp),%eax
    5e0e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5e11:	89 c2                	mov    %eax,%edx
    5e13:	c1 e2 03             	shl    $0x3,%edx
    5e16:	01 c2                	add    %eax,%edx
    5e18:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5e1f:	89 c2                	mov    %eax,%edx
    5e21:	89 c8                	mov    %ecx,%eax
    5e23:	c1 e0 02             	shl    $0x2,%eax
    5e26:	01 c8                	add    %ecx,%eax
    5e28:	c1 e0 05             	shl    $0x5,%eax
    5e2b:	01 d0                	add    %edx,%eax
    5e2d:	01 d8                	add    %ebx,%eax
    5e2f:	83 c0 3c             	add    $0x3c,%eax
    5e32:	8b 10                	mov    (%eax),%edx
    5e34:	89 d0                	mov    %edx,%eax
    5e36:	c1 e0 02             	shl    $0x2,%eax
    5e39:	01 d0                	add    %edx,%eax
    5e3b:	c1 e0 03             	shl    $0x3,%eax
    5e3e:	05 80 be 00 00       	add    $0xbe80,%eax
    5e43:	89 45 e0             	mov    %eax,-0x20(%ebp)
      // if (i == 0) output_h(h);
      // if (i == 0) printf(0, "%d\n", h->treelen);
      huffman_decoder(h, &x, &y, &v, &w);
    5e46:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5e49:	89 44 24 10          	mov    %eax,0x10(%esp)
    5e4d:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5e50:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5e54:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5e57:	89 44 24 08          	mov    %eax,0x8(%esp)
    5e5b:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5e5e:	89 44 24 04          	mov    %eax,0x4(%esp)
    5e62:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5e65:	89 04 24             	mov    %eax,(%esp)
    5e68:	e8 fd ee ff ff       	call   4d6a <huffman_decoder>
      // if (i == 0) printf(0, "%d\n", h->treelen);
      // if (i == 0) printf(0, "%d %d %d %d\n", x, y, v, w);
      is[i/SSLIMIT][i%SSLIMIT] = x;
    5e6d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5e70:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5e75:	89 c8                	mov    %ecx,%eax
    5e77:	f7 ea                	imul   %edx
    5e79:	c1 fa 02             	sar    $0x2,%edx
    5e7c:	89 c8                	mov    %ecx,%eax
    5e7e:	c1 f8 1f             	sar    $0x1f,%eax
    5e81:	29 c2                	sub    %eax,%edx
    5e83:	89 d0                	mov    %edx,%eax
    5e85:	89 c2                	mov    %eax,%edx
    5e87:	89 d0                	mov    %edx,%eax
    5e89:	c1 e0 03             	shl    $0x3,%eax
    5e8c:	01 d0                	add    %edx,%eax
    5e8e:	c1 e0 03             	shl    $0x3,%eax
    5e91:	89 c2                	mov    %eax,%edx
    5e93:	8b 45 08             	mov    0x8(%ebp),%eax
    5e96:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5e99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5e9c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5ea1:	89 c8                	mov    %ecx,%eax
    5ea3:	f7 ea                	imul   %edx
    5ea5:	c1 fa 02             	sar    $0x2,%edx
    5ea8:	89 c8                	mov    %ecx,%eax
    5eaa:	c1 f8 1f             	sar    $0x1f,%eax
    5ead:	29 c2                	sub    %eax,%edx
    5eaf:	89 d0                	mov    %edx,%eax
    5eb1:	c1 e0 03             	shl    $0x3,%eax
    5eb4:	01 d0                	add    %edx,%eax
    5eb6:	01 c0                	add    %eax,%eax
    5eb8:	29 c1                	sub    %eax,%ecx
    5eba:	89 ca                	mov    %ecx,%edx
    5ebc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5ebf:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    5ec2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ec5:	8d 48 01             	lea    0x1(%eax),%ecx
    5ec8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5ecd:	89 c8                	mov    %ecx,%eax
    5ecf:	f7 ea                	imul   %edx
    5ed1:	c1 fa 02             	sar    $0x2,%edx
    5ed4:	89 c8                	mov    %ecx,%eax
    5ed6:	c1 f8 1f             	sar    $0x1f,%eax
    5ed9:	29 c2                	sub    %eax,%edx
    5edb:	89 d0                	mov    %edx,%eax
    5edd:	89 c2                	mov    %eax,%edx
    5edf:	89 d0                	mov    %edx,%eax
    5ee1:	c1 e0 03             	shl    $0x3,%eax
    5ee4:	01 d0                	add    %edx,%eax
    5ee6:	c1 e0 03             	shl    $0x3,%eax
    5ee9:	89 c2                	mov    %eax,%edx
    5eeb:	8b 45 08             	mov    0x8(%ebp),%eax
    5eee:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5ef1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5ef4:	8d 48 01             	lea    0x1(%eax),%ecx
    5ef7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5efc:	89 c8                	mov    %ecx,%eax
    5efe:	f7 ea                	imul   %edx
    5f00:	c1 fa 02             	sar    $0x2,%edx
    5f03:	89 c8                	mov    %ecx,%eax
    5f05:	c1 f8 1f             	sar    $0x1f,%eax
    5f08:	29 c2                	sub    %eax,%edx
    5f0a:	89 d0                	mov    %edx,%eax
    5f0c:	c1 e0 03             	shl    $0x3,%eax
    5f0f:	01 d0                	add    %edx,%eax
    5f11:	01 c0                	add    %eax,%eax
    5f13:	29 c1                	sub    %eax,%ecx
    5f15:	89 ca                	mov    %ecx,%edx
    5f17:	8b 45 d0             	mov    -0x30(%ebp),%eax
    5f1a:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      }


   /* 读取大值区域Read bigvalues area. */
   // printf(0, "big_values=%d\n", (*si).ch[ch].gr[gr].big_values);
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    5f1d:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    5f21:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    5f24:	8b 75 0c             	mov    0xc(%ebp),%esi
    5f27:	8b 45 14             	mov    0x14(%ebp),%eax
    5f2a:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5f2d:	89 c2                	mov    %eax,%edx
    5f2f:	c1 e2 03             	shl    $0x3,%edx
    5f32:	01 c2                	add    %eax,%edx
    5f34:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5f3b:	89 c2                	mov    %eax,%edx
    5f3d:	89 c8                	mov    %ecx,%eax
    5f3f:	c1 e0 02             	shl    $0x2,%eax
    5f42:	01 c8                	add    %ecx,%eax
    5f44:	c1 e0 05             	shl    $0x5,%eax
    5f47:	01 d0                	add    %edx,%eax
    5f49:	01 f0                	add    %esi,%eax
    5f4b:	83 c0 1c             	add    $0x1c,%eax
    5f4e:	8b 00                	mov    (%eax),%eax
    5f50:	01 c0                	add    %eax,%eax
    5f52:	39 c3                	cmp    %eax,%ebx
    5f54:	0f 82 1b fe ff ff    	jb     5d75 <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    5f5a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    5f5d:	8b 45 14             	mov    0x14(%ebp),%eax
    5f60:	8b 4d 10             	mov    0x10(%ebp),%ecx
    5f63:	89 c2                	mov    %eax,%edx
    5f65:	c1 e2 03             	shl    $0x3,%edx
    5f68:	01 c2                	add    %eax,%edx
    5f6a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    5f71:	89 c2                	mov    %eax,%edx
    5f73:	89 c8                	mov    %ecx,%eax
    5f75:	c1 e0 02             	shl    $0x2,%eax
    5f78:	01 c8                	add    %ecx,%eax
    5f7a:	c1 e0 05             	shl    $0x5,%eax
    5f7d:	01 d0                	add    %edx,%eax
    5f7f:	01 d8                	add    %ebx,%eax
    5f81:	83 c0 5c             	add    $0x5c,%eax
    5f84:	8b 00                	mov    (%eax),%eax
    5f86:	8d 50 20             	lea    0x20(%eax),%edx
    5f89:	89 d0                	mov    %edx,%eax
    5f8b:	c1 e0 02             	shl    $0x2,%eax
    5f8e:	01 d0                	add    %edx,%eax
    5f90:	c1 e0 03             	shl    $0x3,%eax
    5f93:	05 80 be 00 00       	add    $0xbe80,%eax
    5f98:	89 45 e0             	mov    %eax,-0x20(%ebp)
   // printf(0, "second change in hufman decode\n");
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    5f9b:	e9 91 01 00 00       	jmp    6131 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      // printf(0, "i=%d\n", i);
      // output_h(h);
      huffman_decoder(h, &x, &y, &v, &w);
    5fa0:	8d 45 c8             	lea    -0x38(%ebp),%eax
    5fa3:	89 44 24 10          	mov    %eax,0x10(%esp)
    5fa7:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5faa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5fae:	8d 45 d0             	lea    -0x30(%ebp),%eax
    5fb1:	89 44 24 08          	mov    %eax,0x8(%esp)
    5fb5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    5fb8:	89 44 24 04          	mov    %eax,0x4(%esp)
    5fbc:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5fbf:	89 04 24             	mov    %eax,(%esp)
    5fc2:	e8 a3 ed ff ff       	call   4d6a <huffman_decoder>
      // printf(0, "%d %d %d %d\n", x, y, v, w);
      is[i/SSLIMIT][i%SSLIMIT] = v;
    5fc7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5fca:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5fcf:	89 c8                	mov    %ecx,%eax
    5fd1:	f7 ea                	imul   %edx
    5fd3:	c1 fa 02             	sar    $0x2,%edx
    5fd6:	89 c8                	mov    %ecx,%eax
    5fd8:	c1 f8 1f             	sar    $0x1f,%eax
    5fdb:	29 c2                	sub    %eax,%edx
    5fdd:	89 d0                	mov    %edx,%eax
    5fdf:	89 c2                	mov    %eax,%edx
    5fe1:	89 d0                	mov    %edx,%eax
    5fe3:	c1 e0 03             	shl    $0x3,%eax
    5fe6:	01 d0                	add    %edx,%eax
    5fe8:	c1 e0 03             	shl    $0x3,%eax
    5feb:	89 c2                	mov    %eax,%edx
    5fed:	8b 45 08             	mov    0x8(%ebp),%eax
    5ff0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    5ff3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5ff6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    5ffb:	89 c8                	mov    %ecx,%eax
    5ffd:	f7 ea                	imul   %edx
    5fff:	c1 fa 02             	sar    $0x2,%edx
    6002:	89 c8                	mov    %ecx,%eax
    6004:	c1 f8 1f             	sar    $0x1f,%eax
    6007:	29 c2                	sub    %eax,%edx
    6009:	89 d0                	mov    %edx,%eax
    600b:	c1 e0 03             	shl    $0x3,%eax
    600e:	01 d0                	add    %edx,%eax
    6010:	01 c0                	add    %eax,%eax
    6012:	29 c1                	sub    %eax,%ecx
    6014:	89 ca                	mov    %ecx,%edx
    6016:	8b 45 cc             	mov    -0x34(%ebp),%eax
    6019:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    601c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    601f:	8d 48 01             	lea    0x1(%eax),%ecx
    6022:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6027:	89 c8                	mov    %ecx,%eax
    6029:	f7 ea                	imul   %edx
    602b:	c1 fa 02             	sar    $0x2,%edx
    602e:	89 c8                	mov    %ecx,%eax
    6030:	c1 f8 1f             	sar    $0x1f,%eax
    6033:	29 c2                	sub    %eax,%edx
    6035:	89 d0                	mov    %edx,%eax
    6037:	89 c2                	mov    %eax,%edx
    6039:	89 d0                	mov    %edx,%eax
    603b:	c1 e0 03             	shl    $0x3,%eax
    603e:	01 d0                	add    %edx,%eax
    6040:	c1 e0 03             	shl    $0x3,%eax
    6043:	89 c2                	mov    %eax,%edx
    6045:	8b 45 08             	mov    0x8(%ebp),%eax
    6048:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    604b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    604e:	8d 48 01             	lea    0x1(%eax),%ecx
    6051:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6056:	89 c8                	mov    %ecx,%eax
    6058:	f7 ea                	imul   %edx
    605a:	c1 fa 02             	sar    $0x2,%edx
    605d:	89 c8                	mov    %ecx,%eax
    605f:	c1 f8 1f             	sar    $0x1f,%eax
    6062:	29 c2                	sub    %eax,%edx
    6064:	89 d0                	mov    %edx,%eax
    6066:	c1 e0 03             	shl    $0x3,%eax
    6069:	01 d0                	add    %edx,%eax
    606b:	01 c0                	add    %eax,%eax
    606d:	29 c1                	sub    %eax,%ecx
    606f:	89 ca                	mov    %ecx,%edx
    6071:	8b 45 c8             	mov    -0x38(%ebp),%eax
    6074:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    6077:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    607a:	8d 48 02             	lea    0x2(%eax),%ecx
    607d:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6082:	89 c8                	mov    %ecx,%eax
    6084:	f7 ea                	imul   %edx
    6086:	c1 fa 02             	sar    $0x2,%edx
    6089:	89 c8                	mov    %ecx,%eax
    608b:	c1 f8 1f             	sar    $0x1f,%eax
    608e:	29 c2                	sub    %eax,%edx
    6090:	89 d0                	mov    %edx,%eax
    6092:	89 c2                	mov    %eax,%edx
    6094:	89 d0                	mov    %edx,%eax
    6096:	c1 e0 03             	shl    $0x3,%eax
    6099:	01 d0                	add    %edx,%eax
    609b:	c1 e0 03             	shl    $0x3,%eax
    609e:	89 c2                	mov    %eax,%edx
    60a0:	8b 45 08             	mov    0x8(%ebp),%eax
    60a3:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    60a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60a9:	8d 48 02             	lea    0x2(%eax),%ecx
    60ac:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    60b1:	89 c8                	mov    %ecx,%eax
    60b3:	f7 ea                	imul   %edx
    60b5:	c1 fa 02             	sar    $0x2,%edx
    60b8:	89 c8                	mov    %ecx,%eax
    60ba:	c1 f8 1f             	sar    $0x1f,%eax
    60bd:	29 c2                	sub    %eax,%edx
    60bf:	89 d0                	mov    %edx,%eax
    60c1:	c1 e0 03             	shl    $0x3,%eax
    60c4:	01 d0                	add    %edx,%eax
    60c6:	01 c0                	add    %eax,%eax
    60c8:	29 c1                	sub    %eax,%ecx
    60ca:	89 ca                	mov    %ecx,%edx
    60cc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    60cf:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    60d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    60d5:	8d 48 03             	lea    0x3(%eax),%ecx
    60d8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    60dd:	89 c8                	mov    %ecx,%eax
    60df:	f7 ea                	imul   %edx
    60e1:	c1 fa 02             	sar    $0x2,%edx
    60e4:	89 c8                	mov    %ecx,%eax
    60e6:	c1 f8 1f             	sar    $0x1f,%eax
    60e9:	29 c2                	sub    %eax,%edx
    60eb:	89 d0                	mov    %edx,%eax
    60ed:	89 c2                	mov    %eax,%edx
    60ef:	89 d0                	mov    %edx,%eax
    60f1:	c1 e0 03             	shl    $0x3,%eax
    60f4:	01 d0                	add    %edx,%eax
    60f6:	c1 e0 03             	shl    $0x3,%eax
    60f9:	89 c2                	mov    %eax,%edx
    60fb:	8b 45 08             	mov    0x8(%ebp),%eax
    60fe:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6101:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6104:	8d 48 03             	lea    0x3(%eax),%ecx
    6107:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    610c:	89 c8                	mov    %ecx,%eax
    610e:	f7 ea                	imul   %edx
    6110:	c1 fa 02             	sar    $0x2,%edx
    6113:	89 c8                	mov    %ecx,%eax
    6115:	c1 f8 1f             	sar    $0x1f,%eax
    6118:	29 c2                	sub    %eax,%edx
    611a:	89 d0                	mov    %edx,%eax
    611c:	c1 e0 03             	shl    $0x3,%eax
    611f:	01 d0                	add    %edx,%eax
    6121:	01 c0                	add    %eax,%eax
    6123:	29 c1                	sub    %eax,%ecx
    6125:	89 ca                	mov    %ecx,%edx
    6127:	8b 45 d0             	mov    -0x30(%ebp),%eax
    612a:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    612d:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   // printf(0, "second change in hufman decode\n");
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    6131:	e8 e2 ea ff ff       	call   4c18 <hsstell>
    6136:	89 c3                	mov    %eax,%ebx
    6138:	8b 75 0c             	mov    0xc(%ebp),%esi
    613b:	8b 45 14             	mov    0x14(%ebp),%eax
    613e:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6141:	89 c2                	mov    %eax,%edx
    6143:	c1 e2 03             	shl    $0x3,%edx
    6146:	01 c2                	add    %eax,%edx
    6148:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    614f:	89 c2                	mov    %eax,%edx
    6151:	89 c8                	mov    %ecx,%eax
    6153:	c1 e0 02             	shl    $0x2,%eax
    6156:	01 c8                	add    %ecx,%eax
    6158:	c1 e0 05             	shl    $0x5,%eax
    615b:	01 d0                	add    %edx,%eax
    615d:	01 f0                	add    %esi,%eax
    615f:	83 c0 18             	add    $0x18,%eax
    6162:	8b 10                	mov    (%eax),%edx
    6164:	8b 45 18             	mov    0x18(%ebp),%eax
    6167:	01 d0                	add    %edx,%eax
    6169:	39 c3                	cmp    %eax,%ebx
    616b:	73 0d                	jae    617a <III_hufman_decode+0x55f>
    616d:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    6174:	0f 8e 26 fe ff ff    	jle    5fa0 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    617a:	e8 99 ea ff ff       	call   4c18 <hsstell>
    617f:	89 c3                	mov    %eax,%ebx
    6181:	8b 75 0c             	mov    0xc(%ebp),%esi
    6184:	8b 45 14             	mov    0x14(%ebp),%eax
    6187:	8b 4d 10             	mov    0x10(%ebp),%ecx
    618a:	89 c2                	mov    %eax,%edx
    618c:	c1 e2 03             	shl    $0x3,%edx
    618f:	01 c2                	add    %eax,%edx
    6191:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6198:	89 c2                	mov    %eax,%edx
    619a:	89 c8                	mov    %ecx,%eax
    619c:	c1 e0 02             	shl    $0x2,%eax
    619f:	01 c8                	add    %ecx,%eax
    61a1:	c1 e0 05             	shl    $0x5,%eax
    61a4:	01 d0                	add    %edx,%eax
    61a6:	01 f0                	add    %esi,%eax
    61a8:	83 c0 18             	add    $0x18,%eax
    61ab:	8b 10                	mov    (%eax),%edx
    61ad:	8b 45 18             	mov    0x18(%ebp),%eax
    61b0:	01 d0                	add    %edx,%eax
    61b2:	39 c3                	cmp    %eax,%ebx
    61b4:	76 48                	jbe    61fe <III_hufman_decode+0x5e3>
   {  i -=4;
    61b6:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    61ba:	e8 59 ea ff ff       	call   4c18 <hsstell>
    61bf:	8b 55 18             	mov    0x18(%ebp),%edx
    61c2:	29 d0                	sub    %edx,%eax
    61c4:	89 c6                	mov    %eax,%esi
    61c6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    61c9:	8b 45 14             	mov    0x14(%ebp),%eax
    61cc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    61cf:	89 c2                	mov    %eax,%edx
    61d1:	c1 e2 03             	shl    $0x3,%edx
    61d4:	01 c2                	add    %eax,%edx
    61d6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    61dd:	89 c2                	mov    %eax,%edx
    61df:	89 c8                	mov    %ecx,%eax
    61e1:	c1 e0 02             	shl    $0x2,%eax
    61e4:	01 c8                	add    %ecx,%eax
    61e6:	c1 e0 05             	shl    $0x5,%eax
    61e9:	01 d0                	add    %edx,%eax
    61eb:	01 d8                	add    %ebx,%eax
    61ed:	83 c0 18             	add    $0x18,%eax
    61f0:	8b 00                	mov    (%eax),%eax
    61f2:	29 c6                	sub    %eax,%esi
    61f4:	89 f0                	mov    %esi,%eax
    61f6:	89 04 24             	mov    %eax,(%esp)
    61f9:	e8 65 ea ff ff       	call   4c63 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    61fe:	e8 15 ea ff ff       	call   4c18 <hsstell>
    6203:	89 c3                	mov    %eax,%ebx
    6205:	8b 75 0c             	mov    0xc(%ebp),%esi
    6208:	8b 45 14             	mov    0x14(%ebp),%eax
    620b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    620e:	89 c2                	mov    %eax,%edx
    6210:	c1 e2 03             	shl    $0x3,%edx
    6213:	01 c2                	add    %eax,%edx
    6215:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    621c:	89 c2                	mov    %eax,%edx
    621e:	89 c8                	mov    %ecx,%eax
    6220:	c1 e0 02             	shl    $0x2,%eax
    6223:	01 c8                	add    %ecx,%eax
    6225:	c1 e0 05             	shl    $0x5,%eax
    6228:	01 d0                	add    %edx,%eax
    622a:	01 f0                	add    %esi,%eax
    622c:	83 c0 18             	add    $0x18,%eax
    622f:	8b 10                	mov    (%eax),%edx
    6231:	8b 45 18             	mov    0x18(%ebp),%eax
    6234:	01 d0                	add    %edx,%eax
    6236:	39 c3                	cmp    %eax,%ebx
    6238:	73 45                	jae    627f <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    623a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    623d:	8b 45 14             	mov    0x14(%ebp),%eax
    6240:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6243:	89 c2                	mov    %eax,%edx
    6245:	c1 e2 03             	shl    $0x3,%edx
    6248:	01 c2                	add    %eax,%edx
    624a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    6251:	89 c2                	mov    %eax,%edx
    6253:	89 c8                	mov    %ecx,%eax
    6255:	c1 e0 02             	shl    $0x2,%eax
    6258:	01 c8                	add    %ecx,%eax
    625a:	c1 e0 05             	shl    $0x5,%eax
    625d:	01 d0                	add    %edx,%eax
    625f:	01 d8                	add    %ebx,%eax
    6261:	83 c0 18             	add    $0x18,%eax
    6264:	8b 10                	mov    (%eax),%edx
    6266:	8b 45 18             	mov    0x18(%ebp),%eax
    6269:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    626c:	e8 a7 e9 ff ff       	call   4c18 <hsstell>
    6271:	29 c3                	sub    %eax,%ebx
    6273:	89 d8                	mov    %ebx,%eax
    6275:	89 04 24             	mov    %eax,(%esp)
    6278:	e8 b7 e9 ff ff       	call   4c34 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    627d:	eb 5c                	jmp    62db <III_hufman_decode+0x6c0>
    627f:	eb 5a                	jmp    62db <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    6281:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    6284:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6289:	89 c8                	mov    %ecx,%eax
    628b:	f7 ea                	imul   %edx
    628d:	c1 fa 02             	sar    $0x2,%edx
    6290:	89 c8                	mov    %ecx,%eax
    6292:	c1 f8 1f             	sar    $0x1f,%eax
    6295:	29 c2                	sub    %eax,%edx
    6297:	89 d0                	mov    %edx,%eax
    6299:	89 c2                	mov    %eax,%edx
    629b:	89 d0                	mov    %edx,%eax
    629d:	c1 e0 03             	shl    $0x3,%eax
    62a0:	01 d0                	add    %edx,%eax
    62a2:	c1 e0 03             	shl    $0x3,%eax
    62a5:	89 c2                	mov    %eax,%edx
    62a7:	8b 45 08             	mov    0x8(%ebp),%eax
    62aa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    62ad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    62b0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    62b5:	89 c8                	mov    %ecx,%eax
    62b7:	f7 ea                	imul   %edx
    62b9:	c1 fa 02             	sar    $0x2,%edx
    62bc:	89 c8                	mov    %ecx,%eax
    62be:	c1 f8 1f             	sar    $0x1f,%eax
    62c1:	29 c2                	sub    %eax,%edx
    62c3:	89 d0                	mov    %edx,%eax
    62c5:	c1 e0 03             	shl    $0x3,%eax
    62c8:	01 d0                	add    %edx,%eax
    62ca:	01 c0                	add    %eax,%eax
    62cc:	29 c1                	sub    %eax,%ecx
    62ce:	89 ca                	mov    %ecx,%edx
    62d0:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    62d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    62db:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    62e2:	7e 9d                	jle    6281 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    62e4:	83 c4 4c             	add    $0x4c,%esp
    62e7:	5b                   	pop    %ebx
    62e8:	5e                   	pop    %esi
    62e9:	5f                   	pop    %edi
    62ea:	5d                   	pop    %ebp
    62eb:	c3                   	ret    

000062ec <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    62ec:	55                   	push   %ebp
    62ed:	89 e5                	mov    %esp,%ebp
    62ef:	56                   	push   %esi
    62f0:	53                   	push   %ebx
    62f1:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    62f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    62fb:	8b 45 1c             	mov    0x1c(%ebp),%eax
    62fe:	8b 00                	mov    (%eax),%eax
    6300:	8b 40 10             	mov    0x10(%eax),%eax
    6303:	89 45 dc             	mov    %eax,-0x24(%ebp)

  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    6306:	8b 45 14             	mov    0x14(%ebp),%eax
    6309:	8b 40 10             	mov    0x10(%eax),%eax
    630c:	85 c0                	test   %eax,%eax
    630e:	74 61                	je     6371 <III_dequantize_sample+0x85>
    6310:	8b 45 14             	mov    0x14(%ebp),%eax
    6313:	8b 40 14             	mov    0x14(%eax),%eax
    6316:	83 f8 02             	cmp    $0x2,%eax
    6319:	75 56                	jne    6371 <III_dequantize_sample+0x85>
		if (gr_info->mixed_block_flag)
    631b:	8b 45 14             	mov    0x14(%ebp),%eax
    631e:	8b 40 18             	mov    0x18(%eax),%eax
    6321:	85 c0                	test   %eax,%eax
    6323:	74 15                	je     633a <III_dequantize_sample+0x4e>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    6325:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6328:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    632e:	05 84 c4 00 00       	add    $0xc484,%eax
    6333:	8b 00                	mov    (%eax),%eax
    6335:	89 45 e8             	mov    %eax,-0x18(%ebp)
  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    6338:	eb 4a                	jmp    6384 <III_dequantize_sample+0x98>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    633a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    633d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6343:	05 d4 c4 00 00       	add    $0xc4d4,%eax
    6348:	8b 50 0c             	mov    0xc(%eax),%edx
    634b:	89 d0                	mov    %edx,%eax
    634d:	01 c0                	add    %eax,%eax
    634f:	01 d0                	add    %edx,%eax
    6351:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    6354:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6357:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    635d:	05 d4 c4 00 00       	add    $0xc4d4,%eax
    6362:	8b 40 0c             	mov    0xc(%eax),%eax
    6365:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    6368:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  // printf(0, "test point 1 enther function dequantize_sample\n");

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    636f:	eb 13                	jmp    6384 <III_dequantize_sample+0x98>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    6371:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6374:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    637a:	05 84 c4 00 00       	add    $0xc484,%eax
    637f:	8b 00                	mov    (%eax),%eax
    6381:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
    6384:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    638b:	e9 3d 06 00 00       	jmp    69cd <III_dequantize_sample+0x6e1>
		for (ss=0 ; ss < 18 ; ss++) {
    6390:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    6397:	e9 23 06 00 00       	jmp    69bf <III_dequantize_sample+0x6d3>
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    639c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    639f:	89 d0                	mov    %edx,%eax
    63a1:	c1 e0 03             	shl    $0x3,%eax
    63a4:	01 d0                	add    %edx,%eax
    63a6:	01 c0                	add    %eax,%eax
    63a8:	89 c2                	mov    %eax,%edx
    63aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    63ad:	01 d0                	add    %edx,%eax
    63af:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    63b2:	0f 85 9e 02 00 00    	jne    6656 <III_dequantize_sample+0x36a>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    63b8:	8b 45 14             	mov    0x14(%ebp),%eax
    63bb:	8b 40 10             	mov    0x10(%eax),%eax
    63be:	85 c0                	test   %eax,%eax
    63c0:	0f 84 6b 02 00 00    	je     6631 <III_dequantize_sample+0x345>
    63c6:	8b 45 14             	mov    0x14(%ebp),%eax
    63c9:	8b 40 14             	mov    0x14(%eax),%eax
    63cc:	83 f8 02             	cmp    $0x2,%eax
    63cf:	0f 85 5c 02 00 00    	jne    6631 <III_dequantize_sample+0x345>
					if (gr_info->mixed_block_flag) {
    63d5:	8b 45 14             	mov    0x14(%ebp),%eax
    63d8:	8b 40 18             	mov    0x18(%eax),%eax
    63db:	85 c0                	test   %eax,%eax
    63dd:	0f 84 af 01 00 00    	je     6592 <III_dequantize_sample+0x2a6>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    63e3:	8b 55 f0             	mov    -0x10(%ebp),%edx
    63e6:	89 d0                	mov    %edx,%eax
    63e8:	c1 e0 03             	shl    $0x3,%eax
    63eb:	01 d0                	add    %edx,%eax
    63ed:	01 c0                	add    %eax,%eax
    63ef:	89 c2                	mov    %eax,%edx
    63f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    63f4:	01 c2                	add    %eax,%edx
    63f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    63f9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    63ff:	05 a0 c4 00 00       	add    $0xc4a0,%eax
    6404:	8b 00                	mov    (%eax),%eax
    6406:	39 c2                	cmp    %eax,%edx
    6408:	0f 85 93 00 00 00    	jne    64a1 <III_dequantize_sample+0x1b5>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    640e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6411:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6417:	05 e0 c4 00 00       	add    $0xc4e0,%eax
    641c:	8b 50 0c             	mov    0xc(%eax),%edx
    641f:	89 d0                	mov    %edx,%eax
    6421:	01 c0                	add    %eax,%eax
    6423:	01 d0                	add    %edx,%eax
    6425:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    6428:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    642f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6432:	8d 48 01             	lea    0x1(%eax),%ecx
    6435:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6438:	89 d0                	mov    %edx,%eax
    643a:	c1 e0 03             	shl    $0x3,%eax
    643d:	01 d0                	add    %edx,%eax
    643f:	c1 e0 02             	shl    $0x2,%eax
    6442:	01 d0                	add    %edx,%eax
    6444:	01 c8                	add    %ecx,%eax
    6446:	83 c0 14             	add    $0x14,%eax
    6449:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6450:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6453:	89 d0                	mov    %edx,%eax
    6455:	c1 e0 03             	shl    $0x3,%eax
    6458:	01 d0                	add    %edx,%eax
    645a:	c1 e0 02             	shl    $0x2,%eax
    645d:	01 d0                	add    %edx,%eax
    645f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6462:	01 d0                	add    %edx,%eax
    6464:	83 c0 14             	add    $0x14,%eax
    6467:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    646e:	29 c1                	sub    %eax,%ecx
    6470:	89 c8                	mov    %ecx,%eax
    6472:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6475:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6478:	89 d0                	mov    %edx,%eax
    647a:	c1 e0 03             	shl    $0x3,%eax
    647d:	01 d0                	add    %edx,%eax
    647f:	c1 e0 02             	shl    $0x2,%eax
    6482:	01 d0                	add    %edx,%eax
    6484:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6487:	01 d0                	add    %edx,%eax
    6489:	83 c0 14             	add    $0x14,%eax
    648c:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    6493:	89 d0                	mov    %edx,%eax
    6495:	01 c0                	add    %eax,%eax
    6497:	01 d0                	add    %edx,%eax
    6499:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    649c:	e9 8e 01 00 00       	jmp    662f <III_dequantize_sample+0x343>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    64a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    64a4:	89 d0                	mov    %edx,%eax
    64a6:	c1 e0 03             	shl    $0x3,%eax
    64a9:	01 d0                	add    %edx,%eax
    64ab:	01 c0                	add    %eax,%eax
    64ad:	89 c2                	mov    %eax,%edx
    64af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    64b2:	01 c2                	add    %eax,%edx
    64b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
    64b7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    64bd:	05 a0 c4 00 00       	add    $0xc4a0,%eax
    64c2:	8b 00                	mov    (%eax),%eax
    64c4:	39 c2                	cmp    %eax,%edx
    64c6:	7d 2a                	jge    64f2 <III_dequantize_sample+0x206>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    64c8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    64cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    64cf:	8d 48 01             	lea    0x1(%eax),%ecx
    64d2:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64d5:	89 d0                	mov    %edx,%eax
    64d7:	c1 e0 03             	shl    $0x3,%eax
    64da:	01 d0                	add    %edx,%eax
    64dc:	c1 e0 02             	shl    $0x2,%eax
    64df:	01 d0                	add    %edx,%eax
    64e1:	01 c8                	add    %ecx,%eax
    64e3:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    64ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
    64ed:	e9 3d 01 00 00       	jmp    662f <III_dequantize_sample+0x343>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    64f2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    64f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    64f9:	8d 48 01             	lea    0x1(%eax),%ecx
    64fc:	8b 55 dc             	mov    -0x24(%ebp),%edx
    64ff:	89 d0                	mov    %edx,%eax
    6501:	c1 e0 03             	shl    $0x3,%eax
    6504:	01 d0                	add    %edx,%eax
    6506:	c1 e0 02             	shl    $0x2,%eax
    6509:	01 d0                	add    %edx,%eax
    650b:	01 c8                	add    %ecx,%eax
    650d:	83 c0 14             	add    $0x14,%eax
    6510:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    6517:	89 d0                	mov    %edx,%eax
    6519:	01 c0                	add    %eax,%eax
    651b:	01 d0                	add    %edx,%eax
    651d:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    6520:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6523:	8d 48 01             	lea    0x1(%eax),%ecx
    6526:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6529:	89 d0                	mov    %edx,%eax
    652b:	c1 e0 03             	shl    $0x3,%eax
    652e:	01 d0                	add    %edx,%eax
    6530:	c1 e0 02             	shl    $0x2,%eax
    6533:	01 d0                	add    %edx,%eax
    6535:	01 c8                	add    %ecx,%eax
    6537:	83 c0 14             	add    $0x14,%eax
    653a:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    6541:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6544:	89 d0                	mov    %edx,%eax
    6546:	c1 e0 03             	shl    $0x3,%eax
    6549:	01 d0                	add    %edx,%eax
    654b:	c1 e0 02             	shl    $0x2,%eax
    654e:	01 d0                	add    %edx,%eax
    6550:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6553:	01 d0                	add    %edx,%eax
    6555:	83 c0 14             	add    $0x14,%eax
    6558:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    655f:	29 c1                	sub    %eax,%ecx
    6561:	89 c8                	mov    %ecx,%eax
    6563:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6566:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6569:	89 d0                	mov    %edx,%eax
    656b:	c1 e0 03             	shl    $0x3,%eax
    656e:	01 d0                	add    %edx,%eax
    6570:	c1 e0 02             	shl    $0x2,%eax
    6573:	01 d0                	add    %edx,%eax
    6575:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6578:	01 d0                	add    %edx,%eax
    657a:	83 c0 14             	add    $0x14,%eax
    657d:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    6584:	89 d0                	mov    %edx,%eax
    6586:	01 c0                	add    %eax,%eax
    6588:	01 d0                	add    %edx,%eax
    658a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    658d:	e9 c4 00 00 00       	jmp    6656 <III_dequantize_sample+0x36a>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    6592:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6596:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6599:	8d 48 01             	lea    0x1(%eax),%ecx
    659c:	8b 55 dc             	mov    -0x24(%ebp),%edx
    659f:	89 d0                	mov    %edx,%eax
    65a1:	c1 e0 03             	shl    $0x3,%eax
    65a4:	01 d0                	add    %edx,%eax
    65a6:	c1 e0 02             	shl    $0x2,%eax
    65a9:	01 d0                	add    %edx,%eax
    65ab:	01 c8                	add    %ecx,%eax
    65ad:	83 c0 14             	add    $0x14,%eax
    65b0:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    65b7:	89 d0                	mov    %edx,%eax
    65b9:	01 c0                	add    %eax,%eax
    65bb:	01 d0                	add    %edx,%eax
    65bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    65c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
    65c3:	8d 48 01             	lea    0x1(%eax),%ecx
    65c6:	8b 55 dc             	mov    -0x24(%ebp),%edx
    65c9:	89 d0                	mov    %edx,%eax
    65cb:	c1 e0 03             	shl    $0x3,%eax
    65ce:	01 d0                	add    %edx,%eax
    65d0:	c1 e0 02             	shl    $0x2,%eax
    65d3:	01 d0                	add    %edx,%eax
    65d5:	01 c8                	add    %ecx,%eax
    65d7:	83 c0 14             	add    $0x14,%eax
    65da:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    65e1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    65e4:	89 d0                	mov    %edx,%eax
    65e6:	c1 e0 03             	shl    $0x3,%eax
    65e9:	01 d0                	add    %edx,%eax
    65eb:	c1 e0 02             	shl    $0x2,%eax
    65ee:	01 d0                	add    %edx,%eax
    65f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
    65f3:	01 d0                	add    %edx,%eax
    65f5:	83 c0 14             	add    $0x14,%eax
    65f8:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    65ff:	29 c1                	sub    %eax,%ecx
    6601:	89 c8                	mov    %ecx,%eax
    6603:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    6606:	8b 55 dc             	mov    -0x24(%ebp),%edx
    6609:	89 d0                	mov    %edx,%eax
    660b:	c1 e0 03             	shl    $0x3,%eax
    660e:	01 d0                	add    %edx,%eax
    6610:	c1 e0 02             	shl    $0x2,%eax
    6613:	01 d0                	add    %edx,%eax
    6615:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6618:	01 d0                	add    %edx,%eax
    661a:	83 c0 14             	add    $0x14,%eax
    661d:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    6624:	89 d0                	mov    %edx,%eax
    6626:	01 c0                	add    %eax,%eax
    6628:	01 d0                	add    %edx,%eax
    662a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
      // printf(0, "T1: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d\n", &sb, &ss, sb, ss);
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    662d:	eb 27                	jmp    6656 <III_dequantize_sample+0x36a>
    662f:	eb 25                	jmp    6656 <III_dequantize_sample+0x36a>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    6631:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6635:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6638:	8d 48 01             	lea    0x1(%eax),%ecx
    663b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    663e:	89 d0                	mov    %edx,%eax
    6640:	c1 e0 03             	shl    $0x3,%eax
    6643:	01 d0                	add    %edx,%eax
    6645:	c1 e0 02             	shl    $0x2,%eax
    6648:	01 d0                	add    %edx,%eax
    664a:	01 c8                	add    %ecx,%eax
    664c:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    6653:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

      // printf(1, "T2: addr of sb=%x, addr of ss=%x, sb=%d, ss=%d, SBLIMIT=%d, SSLIMIT=%d\n", &sb, &ss, sb, ss, SBLIMIT, SSLIMIT);
			/* Compute overall (global) scaling. */
      // printf(0, "test point 1 in dequantize sample\n");
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    6656:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6659:	89 d0                	mov    %edx,%eax
    665b:	c1 e0 03             	shl    $0x3,%eax
    665e:	01 d0                	add    %edx,%eax
    6660:	c1 e0 04             	shl    $0x4,%eax
    6663:	89 c2                	mov    %eax,%edx
    6665:	8b 45 0c             	mov    0xc(%ebp),%eax
    6668:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    666b:	8b 45 14             	mov    0x14(%ebp),%eax
    666e:	8b 40 08             	mov    0x8(%eax),%eax
    6671:	ba 00 00 00 00       	mov    $0x0,%edx
    6676:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6679:	89 55 cc             	mov    %edx,-0x34(%ebp)
    667c:	df 6d c8             	fildll -0x38(%ebp)
    667f:	dd 05 d0 90 00 00    	fldl   0x90d0
    6685:	de e9                	fsubrp %st,%st(1)
    6687:	dd 05 d8 90 00 00    	fldl   0x90d8
    668d:	de c9                	fmulp  %st,%st(1)
    668f:	dd 5c 24 08          	fstpl  0x8(%esp)
    6693:	dd 05 e0 90 00 00    	fldl   0x90e0
    6699:	dd 1c 24             	fstpl  (%esp)
    669c:	e8 2f dc ff ff       	call   42d0 <pow>
    66a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    66a4:	dd 1c c3             	fstpl  (%ebx,%eax,8)
      // unsigned int *p = (unsigned int*)&xr[sb][ss];
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    66a7:	8b 45 14             	mov    0x14(%ebp),%eax
    66aa:	8b 40 10             	mov    0x10(%eax),%eax
    66ad:	85 c0                	test   %eax,%eax
    66af:	0f 84 86 01 00 00    	je     683b <III_dequantize_sample+0x54f>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    66b5:	8b 45 14             	mov    0x14(%ebp),%eax
    66b8:	8b 40 14             	mov    0x14(%eax),%eax
      // unsigned int *p = (unsigned int*)&xr[sb][ss];
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    66bb:	83 f8 02             	cmp    $0x2,%eax
    66be:	75 0a                	jne    66ca <III_dequantize_sample+0x3de>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    66c0:	8b 45 14             	mov    0x14(%ebp),%eax
    66c3:	8b 40 18             	mov    0x18(%eax),%eax
    66c6:	85 c0                	test   %eax,%eax
    66c8:	74 27                	je     66f1 <III_dequantize_sample+0x405>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    66ca:	8b 45 14             	mov    0x14(%ebp),%eax
    66cd:	8b 40 14             	mov    0x14(%eax),%eax
      // printf(0, "sb=%d ss=%d: %x%x", sb, ss, *p, *(p+1));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    66d0:	83 f8 02             	cmp    $0x2,%eax
    66d3:	0f 85 62 01 00 00    	jne    683b <III_dequantize_sample+0x54f>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    66d9:	8b 45 14             	mov    0x14(%ebp),%eax
    66dc:	8b 40 18             	mov    0x18(%eax),%eax
    66df:	85 c0                	test   %eax,%eax
    66e1:	0f 84 54 01 00 00    	je     683b <III_dequantize_sample+0x54f>
    66e7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    66eb:	0f 8e 4a 01 00 00    	jle    683b <III_dequantize_sample+0x54f>

        //printf(0, "test point 2 in dequantize sample\n");
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
    66f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    66f4:	89 d0                	mov    %edx,%eax
    66f6:	c1 e0 03             	shl    $0x3,%eax
    66f9:	01 d0                	add    %edx,%eax
    66fb:	c1 e0 04             	shl    $0x4,%eax
    66fe:	89 c2                	mov    %eax,%edx
    6700:	8b 45 0c             	mov    0xc(%ebp),%eax
    6703:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6706:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6709:	89 d0                	mov    %edx,%eax
    670b:	c1 e0 03             	shl    $0x3,%eax
    670e:	01 d0                	add    %edx,%eax
    6710:	c1 e0 04             	shl    $0x4,%eax
    6713:	89 c2                	mov    %eax,%edx
    6715:	8b 45 0c             	mov    0xc(%ebp),%eax
    6718:	01 c2                	add    %eax,%edx
    671a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    671d:	dd 04 c2             	fldl   (%edx,%eax,8)
    6720:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    6723:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6726:	89 d0                	mov    %edx,%eax
    6728:	c1 e0 03             	shl    $0x3,%eax
    672b:	01 d0                	add    %edx,%eax
    672d:	01 c0                	add    %eax,%eax
    672f:	89 c2                	mov    %eax,%edx
    6731:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6734:	01 d0                	add    %edx,%eax
    6736:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    6739:	99                   	cltd   
    673a:	f7 7d e0             	idivl  -0x20(%ebp)
    673d:	89 c2                	mov    %eax,%edx
    673f:	8b 45 14             	mov    0x14(%ebp),%eax
    6742:	83 c2 08             	add    $0x8,%edx
    6745:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

        //printf(0, "test point 2 in dequantize sample\n");
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
    6749:	ba 00 00 00 00       	mov    $0x0,%edx
    674e:	89 45 c8             	mov    %eax,-0x38(%ebp)
    6751:	89 55 cc             	mov    %edx,-0x34(%ebp)
    6754:	df 6d c8             	fildll -0x38(%ebp)
    6757:	dd 05 e8 90 00 00    	fldl   0x90e8
    675d:	de c9                	fmulp  %st,%st(1)
    675f:	dd 5c 24 08          	fstpl  0x8(%esp)
    6763:	dd 05 e0 90 00 00    	fldl   0x90e0
    6769:	dd 1c 24             	fstpl  (%esp)
    676c:	e8 5f db ff ff       	call   42d0 <pow>
    6771:	dc 4d c0             	fmull  -0x40(%ebp)
    6774:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6777:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
        //printf(0, "test point 2 in dequantize sample passed\n");
				
        //printf(0, "test point 3 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, 0.25 * (-2.0) * (1.0+gr_info->scalefac_scale)
    677a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    677d:	89 d0                	mov    %edx,%eax
    677f:	c1 e0 03             	shl    $0x3,%eax
    6782:	01 d0                	add    %edx,%eax
    6784:	c1 e0 04             	shl    $0x4,%eax
    6787:	89 c2                	mov    %eax,%edx
    6789:	8b 45 0c             	mov    0xc(%ebp),%eax
    678c:	8d 34 02             	lea    (%edx,%eax,1),%esi
    678f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6792:	89 d0                	mov    %edx,%eax
    6794:	c1 e0 03             	shl    $0x3,%eax
    6797:	01 d0                	add    %edx,%eax
    6799:	c1 e0 04             	shl    $0x4,%eax
    679c:	89 c2                	mov    %eax,%edx
    679e:	8b 45 0c             	mov    0xc(%ebp),%eax
    67a1:	01 c2                	add    %eax,%edx
    67a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    67a6:	dd 04 c2             	fldl   (%edx,%eax,8)
    67a9:	dd 5d c0             	fstpl  -0x40(%ebp)
    67ac:	8b 45 14             	mov    0x14(%ebp),%eax
    67af:	8b 40 40             	mov    0x40(%eax),%eax
    67b2:	ba 00 00 00 00       	mov    $0x0,%edx
    67b7:	89 45 c8             	mov    %eax,-0x38(%ebp)
    67ba:	89 55 cc             	mov    %edx,-0x34(%ebp)
    67bd:	df 6d c8             	fildll -0x38(%ebp)
    67c0:	d9 e8                	fld1   
    67c2:	de c1                	faddp  %st,%st(1)
    67c4:	dd 05 f0 90 00 00    	fldl   0x90f0
    67ca:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    67cc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    67cf:	89 d0                	mov    %edx,%eax
    67d1:	c1 e0 03             	shl    $0x3,%eax
    67d4:	01 d0                	add    %edx,%eax
    67d6:	01 c0                	add    %eax,%eax
    67d8:	89 c2                	mov    %eax,%edx
    67da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    67dd:	01 d0                	add    %edx,%eax
    67df:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    67e2:	99                   	cltd   
    67e3:	f7 7d e0             	idivl  -0x20(%ebp)
    67e6:	89 c2                	mov    %eax,%edx
    67e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    67eb:	8b 4d 18             	mov    0x18(%ebp),%ecx
    67ee:	89 d0                	mov    %edx,%eax
    67f0:	01 c0                	add    %eax,%eax
    67f2:	01 d0                	add    %edx,%eax
    67f4:	c1 e0 02             	shl    $0x2,%eax
    67f7:	01 d0                	add    %edx,%eax
    67f9:	89 ca                	mov    %ecx,%edx
    67fb:	01 d2                	add    %edx,%edx
    67fd:	89 d1                	mov    %edx,%ecx
    67ff:	c1 e1 05             	shl    $0x5,%ecx
    6802:	29 d1                	sub    %edx,%ecx
    6804:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    6807:	8b 45 ec             	mov    -0x14(%ebp),%eax
    680a:	01 d0                	add    %edx,%eax
    680c:	83 c0 14             	add    $0x14,%eax
    680f:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				xr[sb][ss] *= pow(2.0, 0.25 * (-8.0) *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
        //printf(0, "test point 2 in dequantize sample passed\n");
				
        //printf(0, "test point 3 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, 0.25 * (-2.0) * (1.0+gr_info->scalefac_scale)
    6813:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    6816:	db 45 d4             	fildl  -0x2c(%ebp)
    6819:	de c9                	fmulp  %st,%st(1)
    681b:	dd 5c 24 08          	fstpl  0x8(%esp)
    681f:	dd 05 e0 90 00 00    	fldl   0x90e0
    6825:	dd 1c 24             	fstpl  (%esp)
    6828:	e8 a3 da ff ff       	call   42d0 <pow>
    682d:	dc 4d c0             	fmull  -0x40(%ebp)
    6830:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6833:	dd 1c c6             	fstpl  (%esi,%eax,8)
    6836:	e9 ab 00 00 00       	jmp    68e6 <III_dequantize_sample+0x5fa>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
        //printf(0, "test point 3 in dequantize sample passed\n");
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				//printf(0, "test point 4 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, (-0.5) * (1.0+gr_info->scalefac_scale)
    683b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    683e:	89 d0                	mov    %edx,%eax
    6840:	c1 e0 03             	shl    $0x3,%eax
    6843:	01 d0                	add    %edx,%eax
    6845:	c1 e0 04             	shl    $0x4,%eax
    6848:	89 c2                	mov    %eax,%edx
    684a:	8b 45 0c             	mov    0xc(%ebp),%eax
    684d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    6850:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6853:	89 d0                	mov    %edx,%eax
    6855:	c1 e0 03             	shl    $0x3,%eax
    6858:	01 d0                	add    %edx,%eax
    685a:	c1 e0 04             	shl    $0x4,%eax
    685d:	89 c2                	mov    %eax,%edx
    685f:	8b 45 0c             	mov    0xc(%ebp),%eax
    6862:	01 c2                	add    %eax,%edx
    6864:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6867:	dd 04 c2             	fldl   (%edx,%eax,8)
    686a:	dd 5d c0             	fstpl  -0x40(%ebp)
    686d:	8b 45 14             	mov    0x14(%ebp),%eax
    6870:	8b 40 40             	mov    0x40(%eax),%eax
    6873:	ba 00 00 00 00       	mov    $0x0,%edx
    6878:	89 45 c8             	mov    %eax,-0x38(%ebp)
    687b:	89 55 cc             	mov    %edx,-0x34(%ebp)
    687e:	df 6d c8             	fildll -0x38(%ebp)
    6881:	d9 e8                	fld1   
    6883:	de c1                	faddp  %st,%st(1)
    6885:	dd 05 f0 90 00 00    	fldl   0x90f0
    688b:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    688d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    6890:	8b 45 18             	mov    0x18(%ebp),%eax
    6893:	01 c0                	add    %eax,%eax
    6895:	89 c2                	mov    %eax,%edx
    6897:	c1 e2 05             	shl    $0x5,%edx
    689a:	29 c2                	sub    %eax,%edx
    689c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    689f:	01 d0                	add    %edx,%eax
    68a1:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    68a4:	89 c2                	mov    %eax,%edx
    68a6:	8b 45 14             	mov    0x14(%ebp),%eax
    68a9:	8b 48 3c             	mov    0x3c(%eax),%ecx
    68ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
    68af:	8b 04 85 40 c6 00 00 	mov    0xc640(,%eax,4),%eax
    68b6:	0f af c1             	imul   %ecx,%eax
    68b9:	01 d0                	add    %edx,%eax
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
        //printf(0, "test point 3 in dequantize sample passed\n");
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				//printf(0, "test point 4 in dequantize sample\n");
        xr[sb][ss] *= pow(2.0, (-0.5) * (1.0+gr_info->scalefac_scale)
    68bb:	ba 00 00 00 00       	mov    $0x0,%edx
    68c0:	89 45 c8             	mov    %eax,-0x38(%ebp)
    68c3:	89 55 cc             	mov    %edx,-0x34(%ebp)
    68c6:	df 6d c8             	fildll -0x38(%ebp)
    68c9:	de c9                	fmulp  %st,%st(1)
    68cb:	dd 5c 24 08          	fstpl  0x8(%esp)
    68cf:	dd 05 e0 90 00 00    	fldl   0x90e0
    68d5:	dd 1c 24             	fstpl  (%esp)
    68d8:	e8 f3 d9 ff ff       	call   42d0 <pow>
    68dd:	dc 4d c0             	fmull  -0x40(%ebp)
    68e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68e3:	dd 1c c3             	fstpl  (%ebx,%eax,8)
        //printf(0, "test point 4 in dequantize sample passed\n");
			}

			/* Scale quantized value. */
      //printf(0, "test point 5 in dequantize sample\n");
			sign = (is[sb][ss]<0) ? 1 : 0;
    68e6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    68e9:	89 d0                	mov    %edx,%eax
    68eb:	c1 e0 03             	shl    $0x3,%eax
    68ee:	01 d0                	add    %edx,%eax
    68f0:	c1 e0 03             	shl    $0x3,%eax
    68f3:	89 c2                	mov    %eax,%edx
    68f5:	8b 45 08             	mov    0x8(%ebp),%eax
    68f8:	01 c2                	add    %eax,%edx
    68fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    68fd:	8b 04 82             	mov    (%edx,%eax,4),%eax
    6900:	c1 e8 1f             	shr    $0x1f,%eax
    6903:	0f b6 c0             	movzbl %al,%eax
    6906:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    6909:	8b 55 f0             	mov    -0x10(%ebp),%edx
    690c:	89 d0                	mov    %edx,%eax
    690e:	c1 e0 03             	shl    $0x3,%eax
    6911:	01 d0                	add    %edx,%eax
    6913:	c1 e0 04             	shl    $0x4,%eax
    6916:	89 c2                	mov    %eax,%edx
    6918:	8b 45 0c             	mov    0xc(%ebp),%eax
    691b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    691e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6921:	89 d0                	mov    %edx,%eax
    6923:	c1 e0 03             	shl    $0x3,%eax
    6926:	01 d0                	add    %edx,%eax
    6928:	c1 e0 04             	shl    $0x4,%eax
    692b:	89 c2                	mov    %eax,%edx
    692d:	8b 45 0c             	mov    0xc(%ebp),%eax
    6930:	01 c2                	add    %eax,%edx
    6932:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6935:	dd 04 c2             	fldl   (%edx,%eax,8)
    6938:	dd 5d c0             	fstpl  -0x40(%ebp)
    693b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    693e:	89 d0                	mov    %edx,%eax
    6940:	c1 e0 03             	shl    $0x3,%eax
    6943:	01 d0                	add    %edx,%eax
    6945:	c1 e0 03             	shl    $0x3,%eax
    6948:	89 c2                	mov    %eax,%edx
    694a:	8b 45 08             	mov    0x8(%ebp),%eax
    694d:	01 c2                	add    %eax,%edx
    694f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6952:	8b 04 82             	mov    (%edx,%eax,4),%eax
    6955:	89 04 24             	mov    %eax,(%esp)
    6958:	e8 e1 d8 ff ff       	call   423e <abs>
    695d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    6960:	db 45 d4             	fildl  -0x2c(%ebp)
    6963:	dd 05 f8 90 00 00    	fldl   0x90f8
    6969:	dd 5c 24 08          	fstpl  0x8(%esp)
    696d:	dd 1c 24             	fstpl  (%esp)
    6970:	e8 5b d9 ff ff       	call   42d0 <pow>
    6975:	dc 4d c0             	fmull  -0x40(%ebp)
    6978:	8b 45 f4             	mov    -0xc(%ebp),%eax
    697b:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    697e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    6982:	74 37                	je     69bb <III_dequantize_sample+0x6cf>
    6984:	8b 55 f0             	mov    -0x10(%ebp),%edx
    6987:	89 d0                	mov    %edx,%eax
    6989:	c1 e0 03             	shl    $0x3,%eax
    698c:	01 d0                	add    %edx,%eax
    698e:	c1 e0 04             	shl    $0x4,%eax
    6991:	89 c2                	mov    %eax,%edx
    6993:	8b 45 0c             	mov    0xc(%ebp),%eax
    6996:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6999:	8b 55 f0             	mov    -0x10(%ebp),%edx
    699c:	89 d0                	mov    %edx,%eax
    699e:	c1 e0 03             	shl    $0x3,%eax
    69a1:	01 d0                	add    %edx,%eax
    69a3:	c1 e0 04             	shl    $0x4,%eax
    69a6:	89 c2                	mov    %eax,%edx
    69a8:	8b 45 0c             	mov    0xc(%ebp),%eax
    69ab:	01 c2                	add    %eax,%edx
    69ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
    69b0:	dd 04 c2             	fldl   (%edx,%eax,8)
    69b3:	d9 e0                	fchs   
    69b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    69b8:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
		for (ss=0 ; ss < 18 ; ss++) {
    69bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    69bf:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    69c3:	0f 8e d3 f9 ff ff    	jle    639c <III_dequantize_sample+0xb0>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < 32 ; sb++) {
    69c9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    69cd:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    69d1:	0f 8e b9 f9 ff ff    	jle    6390 <III_dequantize_sample+0xa4>
			if (sign) xr[sb][ss] = -xr[sb][ss];
      // printf(0, "test point 5 in dequantize sample passed\n");
      // printf(0, "\n");
		}
	}
}
    69d7:	83 c4 50             	add    $0x50,%esp
    69da:	5b                   	pop    %ebx
    69db:	5e                   	pop    %esi
    69dc:	5d                   	pop    %ebp
    69dd:	c3                   	ret    

000069de <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    69de:	55                   	push   %ebp
    69df:	89 e5                	mov    %esp,%ebp
    69e1:	57                   	push   %edi
    69e2:	56                   	push   %esi
    69e3:	53                   	push   %ebx
    69e4:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    69e7:	8b 45 14             	mov    0x14(%ebp),%eax
    69ea:	8b 00                	mov    (%eax),%eax
    69ec:	8b 40 10             	mov    0x10(%eax),%eax
    69ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    69f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    69f9:	eb 33                	jmp    6a2e <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    69fb:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6a02:	eb 20                	jmp    6a24 <III_reorder+0x46>
         ro[sb][ss] = 0;
    6a04:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6a07:	89 d0                	mov    %edx,%eax
    6a09:	c1 e0 03             	shl    $0x3,%eax
    6a0c:	01 d0                	add    %edx,%eax
    6a0e:	c1 e0 04             	shl    $0x4,%eax
    6a11:	89 c2                	mov    %eax,%edx
    6a13:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a16:	01 c2                	add    %eax,%edx
    6a18:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6a1b:	d9 ee                	fldz   
    6a1d:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    6a20:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6a24:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6a28:	7e da                	jle    6a04 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    6a2a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6a2e:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6a32:	7e c7                	jle    69fb <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    6a34:	8b 45 10             	mov    0x10(%ebp),%eax
    6a37:	8b 40 10             	mov    0x10(%eax),%eax
    6a3a:	85 c0                	test   %eax,%eax
    6a3c:	0f 84 af 03 00 00    	je     6df1 <III_reorder+0x413>
    6a42:	8b 45 10             	mov    0x10(%ebp),%eax
    6a45:	8b 40 14             	mov    0x14(%eax),%eax
    6a48:	83 f8 02             	cmp    $0x2,%eax
    6a4b:	0f 85 a0 03 00 00    	jne    6df1 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    6a51:	8b 45 10             	mov    0x10(%ebp),%eax
    6a54:	8b 40 18             	mov    0x18(%eax),%eax
    6a57:	85 c0                	test   %eax,%eax
    6a59:	0f 84 00 02 00 00    	je     6c5f <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    6a5f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6a66:	eb 4c                	jmp    6ab4 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    6a68:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6a6f:	eb 39                	jmp    6aaa <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    6a71:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6a74:	89 d0                	mov    %edx,%eax
    6a76:	c1 e0 03             	shl    $0x3,%eax
    6a79:	01 d0                	add    %edx,%eax
    6a7b:	c1 e0 04             	shl    $0x4,%eax
    6a7e:	89 c2                	mov    %eax,%edx
    6a80:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a83:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6a86:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6a89:	89 d0                	mov    %edx,%eax
    6a8b:	c1 e0 03             	shl    $0x3,%eax
    6a8e:	01 d0                	add    %edx,%eax
    6a90:	c1 e0 04             	shl    $0x4,%eax
    6a93:	89 c2                	mov    %eax,%edx
    6a95:	8b 45 08             	mov    0x8(%ebp),%eax
    6a98:	01 c2                	add    %eax,%edx
    6a9a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6a9d:	dd 04 c2             	fldl   (%edx,%eax,8)
    6aa0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6aa3:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    6aa6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6aaa:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6aae:	7e c1                	jle    6a71 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    6ab0:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6ab4:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    6ab8:	7e ae                	jle    6a68 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6aba:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    6ac1:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6ac4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6aca:	05 dc c4 00 00       	add    $0xc4dc,%eax
    6acf:	8b 40 0c             	mov    0xc(%eax),%eax
    6ad2:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    6ad5:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6ad8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6ade:	05 e0 c4 00 00       	add    $0xc4e0,%eax
    6ae3:	8b 40 0c             	mov    0xc(%eax),%eax
    6ae6:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6ae9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6aec:	e9 5f 01 00 00       	jmp    6c50 <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6af1:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6af8:	e9 fd 00 00 00       	jmp    6bfa <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    6afd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6b04:	e9 e1 00 00 00       	jmp    6bea <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6b09:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6b0c:	89 d0                	mov    %edx,%eax
    6b0e:	01 c0                	add    %eax,%eax
    6b10:	01 c2                	add    %eax,%edx
    6b12:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6b15:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6b19:	01 c2                	add    %eax,%edx
    6b1b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6b1e:	01 d0                	add    %edx,%eax
    6b20:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6b23:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6b26:	89 d0                	mov    %edx,%eax
    6b28:	01 c0                	add    %eax,%eax
    6b2a:	01 c2                	add    %eax,%edx
    6b2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6b2f:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6b32:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    6b35:	89 d0                	mov    %edx,%eax
    6b37:	01 c0                	add    %eax,%eax
    6b39:	01 d0                	add    %edx,%eax
    6b3b:	01 c8                	add    %ecx,%eax
    6b3d:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6b40:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    6b43:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b48:	89 c8                	mov    %ecx,%eax
    6b4a:	f7 ea                	imul   %edx
    6b4c:	c1 fa 02             	sar    $0x2,%edx
    6b4f:	89 c8                	mov    %ecx,%eax
    6b51:	c1 f8 1f             	sar    $0x1f,%eax
    6b54:	29 c2                	sub    %eax,%edx
    6b56:	89 d0                	mov    %edx,%eax
    6b58:	89 c2                	mov    %eax,%edx
    6b5a:	89 d0                	mov    %edx,%eax
    6b5c:	c1 e0 03             	shl    $0x3,%eax
    6b5f:	01 d0                	add    %edx,%eax
    6b61:	c1 e0 04             	shl    $0x4,%eax
    6b64:	89 c2                	mov    %eax,%edx
    6b66:	8b 45 0c             	mov    0xc(%ebp),%eax
    6b69:	8d 34 02             	lea    (%edx,%eax,1),%esi
    6b6c:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6b6f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b74:	89 d8                	mov    %ebx,%eax
    6b76:	f7 ea                	imul   %edx
    6b78:	c1 fa 02             	sar    $0x2,%edx
    6b7b:	89 d8                	mov    %ebx,%eax
    6b7d:	c1 f8 1f             	sar    $0x1f,%eax
    6b80:	89 d1                	mov    %edx,%ecx
    6b82:	29 c1                	sub    %eax,%ecx
    6b84:	89 c8                	mov    %ecx,%eax
    6b86:	c1 e0 03             	shl    $0x3,%eax
    6b89:	01 c8                	add    %ecx,%eax
    6b8b:	01 c0                	add    %eax,%eax
    6b8d:	29 c3                	sub    %eax,%ebx
    6b8f:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6b91:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6b94:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6b99:	89 d8                	mov    %ebx,%eax
    6b9b:	f7 ea                	imul   %edx
    6b9d:	c1 fa 02             	sar    $0x2,%edx
    6ba0:	89 d8                	mov    %ebx,%eax
    6ba2:	c1 f8 1f             	sar    $0x1f,%eax
    6ba5:	29 c2                	sub    %eax,%edx
    6ba7:	89 d0                	mov    %edx,%eax
    6ba9:	89 c2                	mov    %eax,%edx
    6bab:	89 d0                	mov    %edx,%eax
    6bad:	c1 e0 03             	shl    $0x3,%eax
    6bb0:	01 d0                	add    %edx,%eax
    6bb2:	c1 e0 04             	shl    $0x4,%eax
    6bb5:	89 c2                	mov    %eax,%edx
    6bb7:	8b 45 08             	mov    0x8(%ebp),%eax
    6bba:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    6bbd:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6bc0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6bc5:	89 d8                	mov    %ebx,%eax
    6bc7:	f7 ea                	imul   %edx
    6bc9:	c1 fa 02             	sar    $0x2,%edx
    6bcc:	89 d8                	mov    %ebx,%eax
    6bce:	c1 f8 1f             	sar    $0x1f,%eax
    6bd1:	29 c2                	sub    %eax,%edx
    6bd3:	89 d0                	mov    %edx,%eax
    6bd5:	c1 e0 03             	shl    $0x3,%eax
    6bd8:	01 d0                	add    %edx,%eax
    6bda:	01 c0                	add    %eax,%eax
    6bdc:	29 c3                	sub    %eax,%ebx
    6bde:	89 da                	mov    %ebx,%edx
    6be0:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6be3:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    6be6:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6bea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6bed:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6bf0:	0f 8c 13 ff ff ff    	jl     6b09 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6bf6:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6bfa:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6bfe:	0f 8e f9 fe ff ff    	jle    6afd <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6c04:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6c08:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6c0b:	89 d0                	mov    %edx,%eax
    6c0d:	c1 e0 03             	shl    $0x3,%eax
    6c10:	01 d0                	add    %edx,%eax
    6c12:	c1 e0 02             	shl    $0x2,%eax
    6c15:	01 d0                	add    %edx,%eax
    6c17:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6c1a:	01 d0                	add    %edx,%eax
    6c1c:	83 c0 14             	add    $0x14,%eax
    6c1f:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    6c26:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6c29:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6c2c:	8d 48 01             	lea    0x1(%eax),%ecx
    6c2f:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6c32:	89 d0                	mov    %edx,%eax
    6c34:	c1 e0 03             	shl    $0x3,%eax
    6c37:	01 d0                	add    %edx,%eax
    6c39:	c1 e0 02             	shl    $0x2,%eax
    6c3c:	01 d0                	add    %edx,%eax
    6c3e:	01 c8                	add    %ecx,%eax
    6c40:	83 c0 14             	add    $0x14,%eax
    6c43:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    6c4a:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6c4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    6c50:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6c54:	0f 8e 97 fe ff ff    	jle    6af1 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    6c5a:	e9 ed 01 00 00       	jmp    6e4c <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6c5f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6c66:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    6c6d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6c70:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    6c76:	05 d4 c4 00 00       	add    $0xc4d4,%eax
    6c7b:	8b 40 0c             	mov    0xc(%eax),%eax
    6c7e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    6c81:	e9 5f 01 00 00       	jmp    6de5 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6c86:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    6c8d:	e9 fd 00 00 00       	jmp    6d8f <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    6c92:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    6c99:	e9 e1 00 00 00       	jmp    6d7f <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    6c9e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6ca1:	89 d0                	mov    %edx,%eax
    6ca3:	01 c0                	add    %eax,%eax
    6ca5:	01 c2                	add    %eax,%edx
    6ca7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6caa:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    6cae:	01 c2                	add    %eax,%edx
    6cb0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6cb3:	01 d0                	add    %edx,%eax
    6cb5:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    6cb8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    6cbb:	89 d0                	mov    %edx,%eax
    6cbd:	01 c0                	add    %eax,%eax
    6cbf:	01 c2                	add    %eax,%edx
    6cc1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    6cc4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6cc7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    6cca:	89 d0                	mov    %edx,%eax
    6ccc:	01 c0                	add    %eax,%eax
    6cce:	01 d0                	add    %edx,%eax
    6cd0:	01 c8                	add    %ecx,%eax
    6cd2:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6cd5:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    6cd8:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6cdd:	89 c8                	mov    %ecx,%eax
    6cdf:	f7 ea                	imul   %edx
    6ce1:	c1 fa 02             	sar    $0x2,%edx
    6ce4:	89 c8                	mov    %ecx,%eax
    6ce6:	c1 f8 1f             	sar    $0x1f,%eax
    6ce9:	29 c2                	sub    %eax,%edx
    6ceb:	89 d0                	mov    %edx,%eax
    6ced:	89 c2                	mov    %eax,%edx
    6cef:	89 d0                	mov    %edx,%eax
    6cf1:	c1 e0 03             	shl    $0x3,%eax
    6cf4:	01 d0                	add    %edx,%eax
    6cf6:	c1 e0 04             	shl    $0x4,%eax
    6cf9:	89 c2                	mov    %eax,%edx
    6cfb:	8b 45 0c             	mov    0xc(%ebp),%eax
    6cfe:	8d 34 02             	lea    (%edx,%eax,1),%esi
    6d01:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    6d04:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d09:	89 d8                	mov    %ebx,%eax
    6d0b:	f7 ea                	imul   %edx
    6d0d:	c1 fa 02             	sar    $0x2,%edx
    6d10:	89 d8                	mov    %ebx,%eax
    6d12:	c1 f8 1f             	sar    $0x1f,%eax
    6d15:	89 d1                	mov    %edx,%ecx
    6d17:	29 c1                	sub    %eax,%ecx
    6d19:	89 c8                	mov    %ecx,%eax
    6d1b:	c1 e0 03             	shl    $0x3,%eax
    6d1e:	01 c8                	add    %ecx,%eax
    6d20:	01 c0                	add    %eax,%eax
    6d22:	29 c3                	sub    %eax,%ebx
    6d24:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    6d26:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6d29:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d2e:	89 d8                	mov    %ebx,%eax
    6d30:	f7 ea                	imul   %edx
    6d32:	c1 fa 02             	sar    $0x2,%edx
    6d35:	89 d8                	mov    %ebx,%eax
    6d37:	c1 f8 1f             	sar    $0x1f,%eax
    6d3a:	29 c2                	sub    %eax,%edx
    6d3c:	89 d0                	mov    %edx,%eax
    6d3e:	89 c2                	mov    %eax,%edx
    6d40:	89 d0                	mov    %edx,%eax
    6d42:	c1 e0 03             	shl    $0x3,%eax
    6d45:	01 d0                	add    %edx,%eax
    6d47:	c1 e0 04             	shl    $0x4,%eax
    6d4a:	89 c2                	mov    %eax,%edx
    6d4c:	8b 45 08             	mov    0x8(%ebp),%eax
    6d4f:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    6d52:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    6d55:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6d5a:	89 d8                	mov    %ebx,%eax
    6d5c:	f7 ea                	imul   %edx
    6d5e:	c1 fa 02             	sar    $0x2,%edx
    6d61:	89 d8                	mov    %ebx,%eax
    6d63:	c1 f8 1f             	sar    $0x1f,%eax
    6d66:	29 c2                	sub    %eax,%edx
    6d68:	89 d0                	mov    %edx,%eax
    6d6a:	c1 e0 03             	shl    $0x3,%eax
    6d6d:	01 d0                	add    %edx,%eax
    6d6f:	01 c0                	add    %eax,%eax
    6d71:	29 c3                	sub    %eax,%ebx
    6d73:	89 da                	mov    %ebx,%edx
    6d75:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    6d78:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    6d7b:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    6d7f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6d82:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    6d85:	0f 8c 13 ff ff ff    	jl     6c9e <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    6d8b:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    6d8f:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    6d93:	0f 8e f9 fe ff ff    	jle    6c92 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    6d99:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    6d9d:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6da0:	89 d0                	mov    %edx,%eax
    6da2:	c1 e0 03             	shl    $0x3,%eax
    6da5:	01 d0                	add    %edx,%eax
    6da7:	c1 e0 02             	shl    $0x2,%eax
    6daa:	01 d0                	add    %edx,%eax
    6dac:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6daf:	01 d0                	add    %edx,%eax
    6db1:	83 c0 14             	add    $0x14,%eax
    6db4:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    6dbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    6dbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6dc1:	8d 48 01             	lea    0x1(%eax),%ecx
    6dc4:	8b 55 d0             	mov    -0x30(%ebp),%edx
    6dc7:	89 d0                	mov    %edx,%eax
    6dc9:	c1 e0 03             	shl    $0x3,%eax
    6dcc:	01 d0                	add    %edx,%eax
    6dce:	c1 e0 02             	shl    $0x2,%eax
    6dd1:	01 d0                	add    %edx,%eax
    6dd3:	01 c8                	add    %ecx,%eax
    6dd5:	83 c0 14             	add    $0x14,%eax
    6dd8:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    6ddf:	2b 45 e8             	sub    -0x18(%ebp),%eax
    6de2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    6de5:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    6de9:	0f 8e 97 fe ff ff    	jle    6c86 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    6def:	eb 5b                	jmp    6e4c <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6df1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    6df8:	eb 4c                	jmp    6e46 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6dfa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    6e01:	eb 39                	jmp    6e3c <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    6e03:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6e06:	89 d0                	mov    %edx,%eax
    6e08:	c1 e0 03             	shl    $0x3,%eax
    6e0b:	01 d0                	add    %edx,%eax
    6e0d:	c1 e0 04             	shl    $0x4,%eax
    6e10:	89 c2                	mov    %eax,%edx
    6e12:	8b 45 0c             	mov    0xc(%ebp),%eax
    6e15:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    6e18:	8b 55 e0             	mov    -0x20(%ebp),%edx
    6e1b:	89 d0                	mov    %edx,%eax
    6e1d:	c1 e0 03             	shl    $0x3,%eax
    6e20:	01 d0                	add    %edx,%eax
    6e22:	c1 e0 04             	shl    $0x4,%eax
    6e25:	89 c2                	mov    %eax,%edx
    6e27:	8b 45 08             	mov    0x8(%ebp),%eax
    6e2a:	01 c2                	add    %eax,%edx
    6e2c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6e2f:	dd 04 c2             	fldl   (%edx,%eax,8)
    6e32:	8b 45 dc             	mov    -0x24(%ebp),%eax
    6e35:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    6e38:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    6e3c:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    6e40:	7e c1                	jle    6e03 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    6e42:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    6e46:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    6e4a:	7e ae                	jle    6dfa <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    6e4c:	83 c4 34             	add    $0x34,%esp
    6e4f:	5b                   	pop    %ebx
    6e50:	5e                   	pop    %esi
    6e51:	5f                   	pop    %edi
    6e52:	5d                   	pop    %ebp
    6e53:	c3                   	ret    

00006e54 <III_stereo>:

int is_pos[576];
double is_ratio[576];
void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    6e54:	55                   	push   %ebp
    6e55:	89 e5                	mov    %esp,%ebp
    6e57:	56                   	push   %esi
    6e58:	53                   	push   %ebx
    6e59:	83 ec 50             	sub    $0x50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    6e5c:	8b 45 18             	mov    0x18(%ebp),%eax
    6e5f:	8b 00                	mov    (%eax),%eax
    6e61:	8b 40 10             	mov    0x10(%eax),%eax
    6e64:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    6e67:	8b 45 18             	mov    0x18(%ebp),%eax
    6e6a:	8b 40 08             	mov    0x8(%eax),%eax
    6e6d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e70:	8b 45 18             	mov    0x18(%ebp),%eax
    6e73:	8b 00                	mov    (%eax),%eax
    6e75:	8b 40 1c             	mov    0x1c(%eax),%eax
    6e78:	83 f8 01             	cmp    $0x1,%eax
    6e7b:	75 16                	jne    6e93 <III_stereo+0x3f>
                   (fr_ps->header->mode_ext & 0x2);
    6e7d:	8b 45 18             	mov    0x18(%ebp),%eax
    6e80:	8b 00                	mov    (%eax),%eax
    6e82:	8b 40 20             	mov    0x20(%eax),%eax
    6e85:	83 e0 02             	and    $0x2,%eax
double is_ratio[576];
void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e88:	85 c0                	test   %eax,%eax
    6e8a:	74 07                	je     6e93 <III_stereo+0x3f>
    6e8c:	b8 01 00 00 00       	mov    $0x1,%eax
    6e91:	eb 05                	jmp    6e98 <III_stereo+0x44>
    6e93:	b8 00 00 00 00       	mov    $0x0,%eax
    6e98:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6e9b:	8b 45 18             	mov    0x18(%ebp),%eax
    6e9e:	8b 00                	mov    (%eax),%eax
    6ea0:	8b 40 1c             	mov    0x1c(%eax),%eax
    6ea3:	83 f8 01             	cmp    $0x1,%eax
    6ea6:	75 16                	jne    6ebe <III_stereo+0x6a>
                  (fr_ps->header->mode_ext & 0x1);
    6ea8:	8b 45 18             	mov    0x18(%ebp),%eax
    6eab:	8b 00                	mov    (%eax),%eax
    6ead:	8b 40 20             	mov    0x20(%eax),%eax
    6eb0:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    6eb3:	85 c0                	test   %eax,%eax
    6eb5:	74 07                	je     6ebe <III_stereo+0x6a>
    6eb7:	b8 01 00 00 00       	mov    $0x1,%eax
    6ebc:	eb 05                	jmp    6ec3 <III_stereo+0x6f>
    6ebe:	b8 00 00 00 00       	mov    $0x0,%eax
    6ec3:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int i,j,sb,ss,ch;
   // is_pos[576];
   // double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    6ec6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    6ecd:	eb 12                	jmp    6ee1 <III_stereo+0x8d>
      is_pos[i] = 7;
    6ecf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6ed2:	c7 04 85 e0 26 01 00 	movl   $0x7,0x126e0(,%eax,4)
    6ed9:	07 00 00 00 
   int i,j,sb,ss,ch;
   // is_pos[576];
   // double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    6edd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6ee1:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    6ee8:	7e e5                	jle    6ecf <III_stereo+0x7b>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    6eea:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    6eee:	0f 85 00 0a 00 00    	jne    78f4 <III_stereo+0xaa0>
    6ef4:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    6ef8:	0f 84 f6 09 00 00    	je     78f4 <III_stereo+0xaa0>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    6efe:	8b 45 14             	mov    0x14(%ebp),%eax
    6f01:	8b 40 10             	mov    0x10(%eax),%eax
    6f04:	85 c0                	test   %eax,%eax
    6f06:	0f 84 fe 07 00 00    	je     770a <III_stereo+0x8b6>
    6f0c:	8b 45 14             	mov    0x14(%ebp),%eax
    6f0f:	8b 40 14             	mov    0x14(%eax),%eax
    6f12:	83 f8 02             	cmp    $0x2,%eax
    6f15:	0f 85 ef 07 00 00    	jne    770a <III_stereo+0x8b6>
      {  if( gr_info->mixed_block_flag )
    6f1b:	8b 45 14             	mov    0x14(%ebp),%eax
    6f1e:	8b 40 18             	mov    0x18(%eax),%eax
    6f21:	85 c0                	test   %eax,%eax
    6f23:	0f 84 c4 04 00 00    	je     73ed <III_stereo+0x599>
         {  int max_sfb = 0;
    6f29:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    6f30:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    6f37:	e9 15 03 00 00       	jmp    7251 <III_stereo+0x3fd>
            {  int sfbcnt;
               sfbcnt = 2;
    6f3c:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    6f43:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    6f4a:	e9 0f 01 00 00       	jmp    705e <III_stereo+0x20a>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    6f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6f52:	8d 48 01             	lea    0x1(%eax),%ecx
    6f55:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6f58:	89 d0                	mov    %edx,%eax
    6f5a:	c1 e0 03             	shl    $0x3,%eax
    6f5d:	01 d0                	add    %edx,%eax
    6f5f:	c1 e0 02             	shl    $0x2,%eax
    6f62:	01 d0                	add    %edx,%eax
    6f64:	01 c8                	add    %ecx,%eax
    6f66:	83 c0 14             	add    $0x14,%eax
    6f69:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
    6f70:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6f73:	89 d0                	mov    %edx,%eax
    6f75:	c1 e0 03             	shl    $0x3,%eax
    6f78:	01 d0                	add    %edx,%eax
    6f7a:	c1 e0 02             	shl    $0x2,%eax
    6f7d:	01 d0                	add    %edx,%eax
    6f7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6f82:	01 d0                	add    %edx,%eax
    6f84:	83 c0 14             	add    $0x14,%eax
    6f87:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    6f8e:	29 c1                	sub    %eax,%ecx
    6f90:	89 c8                	mov    %ecx,%eax
    6f92:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    6f95:	8b 55 c8             	mov    -0x38(%ebp),%edx
    6f98:	89 d0                	mov    %edx,%eax
    6f9a:	c1 e0 03             	shl    $0x3,%eax
    6f9d:	01 d0                	add    %edx,%eax
    6f9f:	c1 e0 02             	shl    $0x2,%eax
    6fa2:	01 d0                	add    %edx,%eax
    6fa4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    6fa7:	01 d0                	add    %edx,%eax
    6fa9:	83 c0 14             	add    $0x14,%eax
    6fac:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    6fb3:	89 d0                	mov    %edx,%eax
    6fb5:	01 c0                	add    %eax,%eax
    6fb7:	01 c2                	add    %eax,%edx
    6fb9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6fbc:	83 c0 01             	add    $0x1,%eax
    6fbf:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    6fc3:	01 d0                	add    %edx,%eax
    6fc5:	83 e8 01             	sub    $0x1,%eax
    6fc8:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    6fcb:	e9 80 00 00 00       	jmp    7050 <III_stereo+0x1fc>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    6fd0:	8b 45 08             	mov    0x8(%ebp),%eax
    6fd3:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    6fd9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    6fdc:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6fe1:	89 c8                	mov    %ecx,%eax
    6fe3:	f7 ea                	imul   %edx
    6fe5:	c1 fa 02             	sar    $0x2,%edx
    6fe8:	89 c8                	mov    %ecx,%eax
    6fea:	c1 f8 1f             	sar    $0x1f,%eax
    6fed:	89 d3                	mov    %edx,%ebx
    6fef:	29 c3                	sub    %eax,%ebx
    6ff1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    6ff4:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    6ff9:	89 c8                	mov    %ecx,%eax
    6ffb:	f7 ea                	imul   %edx
    6ffd:	c1 fa 02             	sar    $0x2,%edx
    7000:	89 c8                	mov    %ecx,%eax
    7002:	c1 f8 1f             	sar    $0x1f,%eax
    7005:	29 c2                	sub    %eax,%edx
    7007:	89 d0                	mov    %edx,%eax
    7009:	c1 e0 03             	shl    $0x3,%eax
    700c:	01 d0                	add    %edx,%eax
    700e:	01 c0                	add    %eax,%eax
    7010:	29 c1                	sub    %eax,%ecx
    7012:	89 ca                	mov    %ecx,%edx
    7014:	89 d8                	mov    %ebx,%eax
    7016:	c1 e0 03             	shl    $0x3,%eax
    7019:	01 d8                	add    %ebx,%eax
    701b:	01 c0                	add    %eax,%eax
    701d:	01 d0                	add    %edx,%eax
    701f:	dd 04 c6             	fldl   (%esi,%eax,8)
    7022:	d9 ee                	fldz   
    7024:	df e9                	fucomip %st(1),%st
    7026:	7a 0a                	jp     7032 <III_stereo+0x1de>
    7028:	d9 ee                	fldz   
    702a:	df e9                	fucomip %st(1),%st
    702c:	dd d8                	fstp   %st(0)
    702e:	74 18                	je     7048 <III_stereo+0x1f4>
    7030:	eb 02                	jmp    7034 <III_stereo+0x1e0>
    7032:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    7034:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7037:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    703a:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    7041:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    7048:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    704c:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    7050:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    7054:	0f 8f 76 ff ff ff    	jg     6fd0 <III_stereo+0x17c>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    705a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    705e:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    7062:	0f 8f e7 fe ff ff    	jg     6f4f <III_stereo+0xfb>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    7068:	8b 45 d8             	mov    -0x28(%ebp),%eax
    706b:	83 c0 01             	add    $0x1,%eax
    706e:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    7071:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7074:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    7077:	7e 0b                	jle    7084 <III_stereo+0x230>
                  max_sfb = sfb;
    7079:	8b 45 f4             	mov    -0xc(%ebp),%eax
    707c:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    707f:	e9 ef 00 00 00       	jmp    7173 <III_stereo+0x31f>
    7084:	e9 ea 00 00 00       	jmp    7173 <III_stereo+0x31f>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7089:	8b 45 f4             	mov    -0xc(%ebp),%eax
    708c:	8d 48 01             	lea    0x1(%eax),%ecx
    708f:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7092:	89 d0                	mov    %edx,%eax
    7094:	c1 e0 03             	shl    $0x3,%eax
    7097:	01 d0                	add    %edx,%eax
    7099:	c1 e0 02             	shl    $0x2,%eax
    709c:	01 d0                	add    %edx,%eax
    709e:	01 c8                	add    %ecx,%eax
    70a0:	83 c0 14             	add    $0x14,%eax
    70a3:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
    70aa:	8b 55 c8             	mov    -0x38(%ebp),%edx
    70ad:	89 d0                	mov    %edx,%eax
    70af:	c1 e0 03             	shl    $0x3,%eax
    70b2:	01 d0                	add    %edx,%eax
    70b4:	c1 e0 02             	shl    $0x2,%eax
    70b7:	01 d0                	add    %edx,%eax
    70b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
    70bc:	01 d0                	add    %edx,%eax
    70be:	83 c0 14             	add    $0x14,%eax
    70c1:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    70c8:	29 c1                	sub    %eax,%ecx
    70ca:	89 c8                	mov    %ecx,%eax
    70cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    70cf:	8b 55 c8             	mov    -0x38(%ebp),%edx
    70d2:	89 d0                	mov    %edx,%eax
    70d4:	c1 e0 03             	shl    $0x3,%eax
    70d7:	01 d0                	add    %edx,%eax
    70d9:	c1 e0 02             	shl    $0x2,%eax
    70dc:	01 d0                	add    %edx,%eax
    70de:	8b 55 f4             	mov    -0xc(%ebp),%edx
    70e1:	01 d0                	add    %edx,%eax
    70e3:	83 c0 14             	add    $0x14,%eax
    70e6:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    70ed:	89 d0                	mov    %edx,%eax
    70ef:	01 c0                	add    %eax,%eax
    70f1:	01 c2                	add    %eax,%edx
    70f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    70f6:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    70fa:	01 d0                	add    %edx,%eax
    70fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    70ff:	eb 68                	jmp    7169 <III_stereo+0x315>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    7101:	8b 4d 10             	mov    0x10(%ebp),%ecx
    7104:	8b 55 ec             	mov    -0x14(%ebp),%edx
    7107:	89 d0                	mov    %edx,%eax
    7109:	01 c0                	add    %eax,%eax
    710b:	01 d0                	add    %edx,%eax
    710d:	c1 e0 02             	shl    $0x2,%eax
    7110:	01 d0                	add    %edx,%eax
    7112:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7115:	01 d0                	add    %edx,%eax
    7117:	83 c0 52             	add    $0x52,%eax
    711a:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    711e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7121:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
                     if ( is_pos[i] != 7 )
    7128:	8b 45 f0             	mov    -0x10(%ebp),%eax
    712b:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    7132:	83 f8 07             	cmp    $0x7,%eax
    7135:	74 2a                	je     7161 <III_stereo+0x30d>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7137:	8b 45 f0             	mov    -0x10(%ebp),%eax
    713a:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    7141:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    7144:	db 45 b4             	fildl  -0x4c(%ebp)
    7147:	dd 05 00 91 00 00    	fldl   0x9100
    714d:	de c9                	fmulp  %st,%st(1)
    714f:	dd 1c 24             	fstpl  (%esp)
    7152:	e8 35 d1 ff ff       	call   428c <tan>
    7157:	8b 45 f0             	mov    -0x10(%ebp),%eax
    715a:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
                     i++;
    7161:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    7165:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7169:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    716d:	7f 92                	jg     7101 <III_stereo+0x2ad>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    716f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    7173:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7177:	0f 8e 0c ff ff ff    	jle    7089 <III_stereo+0x235>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    717d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7180:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7186:	05 fc c4 00 00       	add    $0xc4fc,%eax
    718b:	8b 50 0c             	mov    0xc(%eax),%edx
    718e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7191:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7197:	05 f8 c4 00 00       	add    $0xc4f8,%eax
    719c:	8b 40 0c             	mov    0xc(%eax),%eax
    719f:	29 c2                	sub    %eax,%edx
    71a1:	89 d0                	mov    %edx,%eax
    71a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    71a6:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71a9:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71af:	05 f8 c4 00 00       	add    $0xc4f8,%eax
    71b4:	8b 50 0c             	mov    0xc(%eax),%edx
    71b7:	89 d0                	mov    %edx,%eax
    71b9:	01 c0                	add    %eax,%eax
    71bb:	01 c2                	add    %eax,%edx
    71bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    71c0:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    71c4:	01 d0                	add    %edx,%eax
    71c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    71c9:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71cc:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71d2:	05 00 c5 00 00       	add    $0xc500,%eax
    71d7:	8b 50 0c             	mov    0xc(%eax),%edx
    71da:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71dd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71e3:	05 fc c4 00 00       	add    $0xc4fc,%eax
    71e8:	8b 40 0c             	mov    0xc(%eax),%eax
    71eb:	29 c2                	sub    %eax,%edx
    71ed:	89 d0                	mov    %edx,%eax
    71ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    71f2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    71f5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    71fb:	05 fc c4 00 00       	add    $0xc4fc,%eax
    7200:	8b 50 0c             	mov    0xc(%eax),%edx
    7203:	89 d0                	mov    %edx,%eax
    7205:	01 c0                	add    %eax,%eax
    7207:	01 c2                	add    %eax,%edx
    7209:	8b 45 ec             	mov    -0x14(%ebp),%eax
    720c:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    7210:	01 d0                	add    %edx,%eax
    7212:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    7215:	eb 30                	jmp    7247 <III_stereo+0x3f3>
               {  is_pos[i] = is_pos[sfb];
    7217:	8b 45 f4             	mov    -0xc(%ebp),%eax
    721a:	8b 14 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%edx
    7221:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7224:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    722b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    722e:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    7235:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7238:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
                  i++;
    723f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    7243:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7247:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    724b:	7f ca                	jg     7217 <III_stereo+0x3c3>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    724d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    7251:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    7255:	0f 8e e1 fc ff ff    	jle    6f3c <III_stereo+0xe8>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    725b:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    725f:	0f 8f 83 01 00 00    	jg     73e8 <III_stereo+0x594>
             {  i = 2;
    7265:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    726c:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    7273:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    727a:	eb 63                	jmp    72df <III_stereo+0x48b>
                {  if ( xr[1][i][ss] != 0.0 )
    727c:	8b 45 08             	mov    0x8(%ebp),%eax
    727f:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7285:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7288:	89 d0                	mov    %edx,%eax
    728a:	c1 e0 03             	shl    $0x3,%eax
    728d:	01 d0                	add    %edx,%eax
    728f:	01 c0                	add    %eax,%eax
    7291:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7294:	01 d0                	add    %edx,%eax
    7296:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7299:	d9 ee                	fldz   
    729b:	df e9                	fucomip %st(1),%st
    729d:	7a 0a                	jp     72a9 <III_stereo+0x455>
    729f:	d9 ee                	fldz   
    72a1:	df e9                	fucomip %st(1),%st
    72a3:	dd d8                	fstp   %st(0)
    72a5:	74 23                	je     72ca <III_stereo+0x476>
    72a7:	eb 02                	jmp    72ab <III_stereo+0x457>
    72a9:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    72ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    72ae:	89 d0                	mov    %edx,%eax
    72b0:	c1 e0 03             	shl    $0x3,%eax
    72b3:	01 d0                	add    %edx,%eax
    72b5:	01 c0                	add    %eax,%eax
    72b7:	89 c2                	mov    %eax,%edx
    72b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    72bc:	01 d0                	add    %edx,%eax
    72be:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    72c1:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    72c8:	eb 15                	jmp    72df <III_stereo+0x48b>
                   } else
                   {  ss--;
    72ca:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    72ce:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    72d2:	79 0b                	jns    72df <III_stereo+0x48b>
                      {  i--;
    72d4:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    72d8:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    72df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    72e3:	79 97                	jns    727c <III_stereo+0x428>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    72e5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    72ec:	eb 04                	jmp    72f2 <III_stereo+0x49e>
                   i++;
    72ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    72f2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    72f5:	89 d0                	mov    %edx,%eax
    72f7:	c1 e0 03             	shl    $0x3,%eax
    72fa:	01 d0                	add    %edx,%eax
    72fc:	c1 e0 02             	shl    $0x2,%eax
    72ff:	01 d0                	add    %edx,%eax
    7301:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7304:	01 d0                	add    %edx,%eax
    7306:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    730d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    7310:	7e dc                	jle    72ee <III_stereo+0x49a>
                   i++;
                sfb = i;
    7312:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7315:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    7318:	8b 55 c8             	mov    -0x38(%ebp),%edx
    731b:	89 d0                	mov    %edx,%eax
    731d:	c1 e0 03             	shl    $0x3,%eax
    7320:	01 d0                	add    %edx,%eax
    7322:	c1 e0 02             	shl    $0x2,%eax
    7325:	01 d0                	add    %edx,%eax
    7327:	8b 55 f0             	mov    -0x10(%ebp),%edx
    732a:	01 d0                	add    %edx,%eax
    732c:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    7333:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    7336:	e9 a3 00 00 00       	jmp    73de <III_stereo+0x58a>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    733b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    733e:	8d 48 01             	lea    0x1(%eax),%ecx
    7341:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7344:	89 d0                	mov    %edx,%eax
    7346:	c1 e0 03             	shl    $0x3,%eax
    7349:	01 d0                	add    %edx,%eax
    734b:	c1 e0 02             	shl    $0x2,%eax
    734e:	01 d0                	add    %edx,%eax
    7350:	01 c8                	add    %ecx,%eax
    7352:	8b 0c 85 80 c4 00 00 	mov    0xc480(,%eax,4),%ecx
    7359:	8b 55 c8             	mov    -0x38(%ebp),%edx
    735c:	89 d0                	mov    %edx,%eax
    735e:	c1 e0 03             	shl    $0x3,%eax
    7361:	01 d0                	add    %edx,%eax
    7363:	c1 e0 02             	shl    $0x2,%eax
    7366:	01 d0                	add    %edx,%eax
    7368:	8b 55 f4             	mov    -0xc(%ebp),%edx
    736b:	01 d0                	add    %edx,%eax
    736d:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    7374:	29 c1                	sub    %eax,%ecx
    7376:	89 c8                	mov    %ecx,%eax
    7378:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    737b:	eb 57                	jmp    73d4 <III_stereo+0x580>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    737d:	8b 45 10             	mov    0x10(%ebp),%eax
    7380:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7383:	83 c2 3e             	add    $0x3e,%edx
    7386:	8b 14 90             	mov    (%eax,%edx,4),%edx
    7389:	8b 45 f0             	mov    -0x10(%ebp),%eax
    738c:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
                      if ( is_pos[i] != 7 )
    7393:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7396:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    739d:	83 f8 07             	cmp    $0x7,%eax
    73a0:	74 2a                	je     73cc <III_stereo+0x578>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    73a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73a5:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    73ac:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    73af:	db 45 b4             	fildl  -0x4c(%ebp)
    73b2:	dd 05 00 91 00 00    	fldl   0x9100
    73b8:	de c9                	fmulp  %st,%st(1)
    73ba:	dd 1c 24             	fstpl  (%esp)
    73bd:	e8 ca ce ff ff       	call   428c <tan>
    73c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    73c5:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
                      i++;
    73cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    73d0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    73d4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    73d8:	7f a3                	jg     737d <III_stereo+0x529>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    73da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    73de:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    73e2:	0f 8e 53 ff ff ff    	jle    733b <III_stereo+0x4e7>
    73e8:	e9 18 03 00 00       	jmp    7705 <III_stereo+0x8b1>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    73ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    73f4:	e9 02 03 00 00       	jmp    76fb <III_stereo+0x8a7>
            {  int sfbcnt;
               sfbcnt = -1;
    73f9:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    7400:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7407:	e9 0f 01 00 00       	jmp    751b <III_stereo+0x6c7>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    740c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    740f:	8d 48 01             	lea    0x1(%eax),%ecx
    7412:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7415:	89 d0                	mov    %edx,%eax
    7417:	c1 e0 03             	shl    $0x3,%eax
    741a:	01 d0                	add    %edx,%eax
    741c:	c1 e0 02             	shl    $0x2,%eax
    741f:	01 d0                	add    %edx,%eax
    7421:	01 c8                	add    %ecx,%eax
    7423:	83 c0 14             	add    $0x14,%eax
    7426:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
    742d:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7430:	89 d0                	mov    %edx,%eax
    7432:	c1 e0 03             	shl    $0x3,%eax
    7435:	01 d0                	add    %edx,%eax
    7437:	c1 e0 02             	shl    $0x2,%eax
    743a:	01 d0                	add    %edx,%eax
    743c:	8b 55 f4             	mov    -0xc(%ebp),%edx
    743f:	01 d0                	add    %edx,%eax
    7441:	83 c0 14             	add    $0x14,%eax
    7444:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    744b:	29 c1                	sub    %eax,%ecx
    744d:	89 c8                	mov    %ecx,%eax
    744f:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    7452:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7455:	89 d0                	mov    %edx,%eax
    7457:	c1 e0 03             	shl    $0x3,%eax
    745a:	01 d0                	add    %edx,%eax
    745c:	c1 e0 02             	shl    $0x2,%eax
    745f:	01 d0                	add    %edx,%eax
    7461:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7464:	01 d0                	add    %edx,%eax
    7466:	83 c0 14             	add    $0x14,%eax
    7469:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    7470:	89 d0                	mov    %edx,%eax
    7472:	01 c0                	add    %eax,%eax
    7474:	01 c2                	add    %eax,%edx
    7476:	8b 45 ec             	mov    -0x14(%ebp),%eax
    7479:	83 c0 01             	add    $0x1,%eax
    747c:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    7480:	01 d0                	add    %edx,%eax
    7482:	83 e8 01             	sub    $0x1,%eax
    7485:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    7488:	e9 80 00 00 00       	jmp    750d <III_stereo+0x6b9>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    748d:	8b 45 08             	mov    0x8(%ebp),%eax
    7490:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    7496:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    7499:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    749e:	89 c8                	mov    %ecx,%eax
    74a0:	f7 ea                	imul   %edx
    74a2:	c1 fa 02             	sar    $0x2,%edx
    74a5:	89 c8                	mov    %ecx,%eax
    74a7:	c1 f8 1f             	sar    $0x1f,%eax
    74aa:	89 d3                	mov    %edx,%ebx
    74ac:	29 c3                	sub    %eax,%ebx
    74ae:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    74b1:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    74b6:	89 c8                	mov    %ecx,%eax
    74b8:	f7 ea                	imul   %edx
    74ba:	c1 fa 02             	sar    $0x2,%edx
    74bd:	89 c8                	mov    %ecx,%eax
    74bf:	c1 f8 1f             	sar    $0x1f,%eax
    74c2:	29 c2                	sub    %eax,%edx
    74c4:	89 d0                	mov    %edx,%eax
    74c6:	c1 e0 03             	shl    $0x3,%eax
    74c9:	01 d0                	add    %edx,%eax
    74cb:	01 c0                	add    %eax,%eax
    74cd:	29 c1                	sub    %eax,%ecx
    74cf:	89 ca                	mov    %ecx,%edx
    74d1:	89 d8                	mov    %ebx,%eax
    74d3:	c1 e0 03             	shl    $0x3,%eax
    74d6:	01 d8                	add    %ebx,%eax
    74d8:	01 c0                	add    %eax,%eax
    74da:	01 d0                	add    %edx,%eax
    74dc:	dd 04 c6             	fldl   (%esi,%eax,8)
    74df:	d9 ee                	fldz   
    74e1:	df e9                	fucomip %st(1),%st
    74e3:	7a 0a                	jp     74ef <III_stereo+0x69b>
    74e5:	d9 ee                	fldz   
    74e7:	df e9                	fucomip %st(1),%st
    74e9:	dd d8                	fstp   %st(0)
    74eb:	74 18                	je     7505 <III_stereo+0x6b1>
    74ed:	eb 02                	jmp    74f1 <III_stereo+0x69d>
    74ef:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    74f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    74f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    74f7:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    74fe:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    7505:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    7509:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    750d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    7511:	0f 8f 76 ff ff ff    	jg     748d <III_stereo+0x639>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    7517:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    751b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    751f:	0f 89 e7 fe ff ff    	jns    740c <III_stereo+0x5b8>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    7525:	8b 45 d0             	mov    -0x30(%ebp),%eax
    7528:	83 c0 01             	add    $0x1,%eax
    752b:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    752e:	e9 ea 00 00 00       	jmp    761d <III_stereo+0x7c9>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    7533:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7536:	8d 48 01             	lea    0x1(%eax),%ecx
    7539:	8b 55 c8             	mov    -0x38(%ebp),%edx
    753c:	89 d0                	mov    %edx,%eax
    753e:	c1 e0 03             	shl    $0x3,%eax
    7541:	01 d0                	add    %edx,%eax
    7543:	c1 e0 02             	shl    $0x2,%eax
    7546:	01 d0                	add    %edx,%eax
    7548:	01 c8                	add    %ecx,%eax
    754a:	83 c0 14             	add    $0x14,%eax
    754d:	8b 0c 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%ecx
    7554:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7557:	89 d0                	mov    %edx,%eax
    7559:	c1 e0 03             	shl    $0x3,%eax
    755c:	01 d0                	add    %edx,%eax
    755e:	c1 e0 02             	shl    $0x2,%eax
    7561:	01 d0                	add    %edx,%eax
    7563:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7566:	01 d0                	add    %edx,%eax
    7568:	83 c0 14             	add    $0x14,%eax
    756b:	8b 04 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%eax
    7572:	29 c1                	sub    %eax,%ecx
    7574:	89 c8                	mov    %ecx,%eax
    7576:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    7579:	8b 55 c8             	mov    -0x38(%ebp),%edx
    757c:	89 d0                	mov    %edx,%eax
    757e:	c1 e0 03             	shl    $0x3,%eax
    7581:	01 d0                	add    %edx,%eax
    7583:	c1 e0 02             	shl    $0x2,%eax
    7586:	01 d0                	add    %edx,%eax
    7588:	8b 55 f4             	mov    -0xc(%ebp),%edx
    758b:	01 d0                	add    %edx,%eax
    758d:	83 c0 14             	add    $0x14,%eax
    7590:	8b 14 85 8c c4 00 00 	mov    0xc48c(,%eax,4),%edx
    7597:	89 d0                	mov    %edx,%eax
    7599:	01 c0                	add    %eax,%eax
    759b:	01 c2                	add    %eax,%edx
    759d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    75a0:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    75a4:	01 d0                	add    %edx,%eax
    75a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    75a9:	eb 68                	jmp    7613 <III_stereo+0x7bf>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    75ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
    75ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
    75b1:	89 d0                	mov    %edx,%eax
    75b3:	01 c0                	add    %eax,%eax
    75b5:	01 d0                	add    %edx,%eax
    75b7:	c1 e0 02             	shl    $0x2,%eax
    75ba:	01 d0                	add    %edx,%eax
    75bc:	8b 55 f4             	mov    -0xc(%ebp),%edx
    75bf:	01 d0                	add    %edx,%eax
    75c1:	83 c0 52             	add    $0x52,%eax
    75c4:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    75c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75cb:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
                     if ( is_pos[i] != 7 )
    75d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75d5:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    75dc:	83 f8 07             	cmp    $0x7,%eax
    75df:	74 2a                	je     760b <III_stereo+0x7b7>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    75e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    75e4:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    75eb:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    75ee:	db 45 b4             	fildl  -0x4c(%ebp)
    75f1:	dd 05 00 91 00 00    	fldl   0x9100
    75f7:	de c9                	fmulp  %st,%st(1)
    75f9:	dd 1c 24             	fstpl  (%esp)
    75fc:	e8 8b cc ff ff       	call   428c <tan>
    7601:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7604:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
                     i++;
    760b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    760f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7613:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    7617:	7f 92                	jg     75ab <III_stereo+0x757>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    7619:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    761d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7621:	0f 8e 0c ff ff ff    	jle    7533 <III_stereo+0x6df>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    7627:	8b 45 c8             	mov    -0x38(%ebp),%eax
    762a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7630:	05 fc c4 00 00       	add    $0xc4fc,%eax
    7635:	8b 50 0c             	mov    0xc(%eax),%edx
    7638:	8b 45 c8             	mov    -0x38(%ebp),%eax
    763b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7641:	05 f8 c4 00 00       	add    $0xc4f8,%eax
    7646:	8b 40 0c             	mov    0xc(%eax),%eax
    7649:	29 c2                	sub    %eax,%edx
    764b:	89 d0                	mov    %edx,%eax
    764d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    7650:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7653:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7659:	05 f8 c4 00 00       	add    $0xc4f8,%eax
    765e:	8b 50 0c             	mov    0xc(%eax),%edx
    7661:	89 d0                	mov    %edx,%eax
    7663:	01 c0                	add    %eax,%eax
    7665:	01 c2                	add    %eax,%edx
    7667:	8b 45 ec             	mov    -0x14(%ebp),%eax
    766a:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    766e:	01 d0                	add    %edx,%eax
    7670:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    7673:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7676:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    767c:	05 00 c5 00 00       	add    $0xc500,%eax
    7681:	8b 50 0c             	mov    0xc(%eax),%edx
    7684:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7687:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    768d:	05 fc c4 00 00       	add    $0xc4fc,%eax
    7692:	8b 40 0c             	mov    0xc(%eax),%eax
    7695:	29 c2                	sub    %eax,%edx
    7697:	89 d0                	mov    %edx,%eax
    7699:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    769c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    769f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    76a5:	05 fc c4 00 00       	add    $0xc4fc,%eax
    76aa:	8b 50 0c             	mov    0xc(%eax),%edx
    76ad:	89 d0                	mov    %edx,%eax
    76af:	01 c0                	add    %eax,%eax
    76b1:	01 c2                	add    %eax,%edx
    76b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    76b6:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    76ba:	01 d0                	add    %edx,%eax
    76bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    76bf:	eb 30                	jmp    76f1 <III_stereo+0x89d>
               {  is_pos[i] = is_pos[sfb];
    76c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76c4:	8b 14 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%edx
    76cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76ce:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    76d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    76d8:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    76df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    76e2:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
                  i++;
    76e9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    76ed:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    76f1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    76f5:	7f ca                	jg     76c1 <III_stereo+0x86d>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    76f7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    76fb:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    76ff:	0f 8e f4 fc ff ff    	jle    73f9 <III_stereo+0x5a5>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    7705:	e9 ea 01 00 00       	jmp    78f4 <III_stereo+0xaa0>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    770a:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    7711:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    7718:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    771f:	eb 63                	jmp    7784 <III_stereo+0x930>
         {  if ( xr[1][i][ss] != 0.0 )
    7721:	8b 45 08             	mov    0x8(%ebp),%eax
    7724:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    772a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    772d:	89 d0                	mov    %edx,%eax
    772f:	c1 e0 03             	shl    $0x3,%eax
    7732:	01 d0                	add    %edx,%eax
    7734:	01 c0                	add    %eax,%eax
    7736:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7739:	01 d0                	add    %edx,%eax
    773b:	dd 04 c1             	fldl   (%ecx,%eax,8)
    773e:	d9 ee                	fldz   
    7740:	df e9                	fucomip %st(1),%st
    7742:	7a 0a                	jp     774e <III_stereo+0x8fa>
    7744:	d9 ee                	fldz   
    7746:	df e9                	fucomip %st(1),%st
    7748:	dd d8                	fstp   %st(0)
    774a:	74 23                	je     776f <III_stereo+0x91b>
    774c:	eb 02                	jmp    7750 <III_stereo+0x8fc>
    774e:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    7750:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7753:	89 d0                	mov    %edx,%eax
    7755:	c1 e0 03             	shl    $0x3,%eax
    7758:	01 d0                	add    %edx,%eax
    775a:	01 c0                	add    %eax,%eax
    775c:	89 c2                	mov    %eax,%edx
    775e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    7761:	01 d0                	add    %edx,%eax
    7763:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    7766:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    776d:	eb 15                	jmp    7784 <III_stereo+0x930>
            } else
            {  ss--;
    776f:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    7773:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    7777:	79 0b                	jns    7784 <III_stereo+0x930>
               {  i--;
    7779:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    777d:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    7784:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    7788:	79 97                	jns    7721 <III_stereo+0x8cd>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    778a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    7791:	eb 04                	jmp    7797 <III_stereo+0x943>
            i++;
    7793:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    7797:	8b 55 c8             	mov    -0x38(%ebp),%edx
    779a:	89 d0                	mov    %edx,%eax
    779c:	c1 e0 03             	shl    $0x3,%eax
    779f:	01 d0                	add    %edx,%eax
    77a1:	c1 e0 02             	shl    $0x2,%eax
    77a4:	01 d0                	add    %edx,%eax
    77a6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    77a9:	01 d0                	add    %edx,%eax
    77ab:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    77b2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    77b5:	7e dc                	jle    7793 <III_stereo+0x93f>
            i++;
         sfb = i;
    77b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    77ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    77bd:	8b 55 c8             	mov    -0x38(%ebp),%edx
    77c0:	89 d0                	mov    %edx,%eax
    77c2:	c1 e0 03             	shl    $0x3,%eax
    77c5:	01 d0                	add    %edx,%eax
    77c7:	c1 e0 02             	shl    $0x2,%eax
    77ca:	01 d0                	add    %edx,%eax
    77cc:	8b 55 f0             	mov    -0x10(%ebp),%edx
    77cf:	01 d0                	add    %edx,%eax
    77d1:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    77d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    77db:	e9 a3 00 00 00       	jmp    7883 <III_stereo+0xa2f>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    77e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    77e3:	8d 48 01             	lea    0x1(%eax),%ecx
    77e6:	8b 55 c8             	mov    -0x38(%ebp),%edx
    77e9:	89 d0                	mov    %edx,%eax
    77eb:	c1 e0 03             	shl    $0x3,%eax
    77ee:	01 d0                	add    %edx,%eax
    77f0:	c1 e0 02             	shl    $0x2,%eax
    77f3:	01 d0                	add    %edx,%eax
    77f5:	01 c8                	add    %ecx,%eax
    77f7:	8b 0c 85 80 c4 00 00 	mov    0xc480(,%eax,4),%ecx
    77fe:	8b 55 c8             	mov    -0x38(%ebp),%edx
    7801:	89 d0                	mov    %edx,%eax
    7803:	c1 e0 03             	shl    $0x3,%eax
    7806:	01 d0                	add    %edx,%eax
    7808:	c1 e0 02             	shl    $0x2,%eax
    780b:	01 d0                	add    %edx,%eax
    780d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7810:	01 d0                	add    %edx,%eax
    7812:	8b 04 85 80 c4 00 00 	mov    0xc480(,%eax,4),%eax
    7819:	29 c1                	sub    %eax,%ecx
    781b:	89 c8                	mov    %ecx,%eax
    781d:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    7820:	eb 57                	jmp    7879 <III_stereo+0xa25>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    7822:	8b 45 10             	mov    0x10(%ebp),%eax
    7825:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7828:	83 c2 3e             	add    $0x3e,%edx
    782b:	8b 14 90             	mov    (%eax,%edx,4),%edx
    782e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7831:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
               if ( is_pos[i] != 7 )
    7838:	8b 45 f0             	mov    -0x10(%ebp),%eax
    783b:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    7842:	83 f8 07             	cmp    $0x7,%eax
    7845:	74 2a                	je     7871 <III_stereo+0xa1d>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    7847:	8b 45 f0             	mov    -0x10(%ebp),%eax
    784a:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    7851:	89 45 b4             	mov    %eax,-0x4c(%ebp)
    7854:	db 45 b4             	fildl  -0x4c(%ebp)
    7857:	dd 05 00 91 00 00    	fldl   0x9100
    785d:	de c9                	fmulp  %st,%st(1)
    785f:	dd 1c 24             	fstpl  (%esp)
    7862:	e8 25 ca ff ff       	call   428c <tan>
    7867:	8b 45 f0             	mov    -0x10(%ebp),%eax
    786a:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
               i++;
    7871:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    7875:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    7879:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    787d:	7f a3                	jg     7822 <III_stereo+0x9ce>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    787f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7883:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    7887:	0f 8e 53 ff ff ff    	jle    77e0 <III_stereo+0x98c>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    788d:	8b 45 c8             	mov    -0x38(%ebp),%eax
    7890:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    7896:	05 d0 c4 00 00       	add    $0xc4d0,%eax
    789b:	8b 00                	mov    (%eax),%eax
    789d:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    78a0:	8b 45 c8             	mov    -0x38(%ebp),%eax
    78a3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    78a9:	05 d4 c4 00 00       	add    $0xc4d4,%eax
    78ae:	8b 00                	mov    (%eax),%eax
    78b0:	ba 40 02 00 00       	mov    $0x240,%edx
    78b5:	29 c2                	sub    %eax,%edx
    78b7:	89 d0                	mov    %edx,%eax
    78b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    78bc:	eb 30                	jmp    78ee <III_stereo+0xa9a>
         {  is_pos[i] = is_pos[sfb];
    78be:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78c1:	8b 14 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%edx
    78c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78cb:	89 14 85 e0 26 01 00 	mov    %edx,0x126e0(,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    78d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    78d5:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    78dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    78df:	dd 1c c5 e0 14 01 00 	fstpl  0x114e0(,%eax,8)
            i++;
    78e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    78ea:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    78ee:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    78f2:	7f ca                	jg     78be <III_stereo+0xa6a>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    78f4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    78fb:	eb 55                	jmp    7952 <III_stereo+0xafe>
      for(sb=0;sb<SBLIMIT;sb++)
    78fd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7904:	eb 42                	jmp    7948 <III_stereo+0xaf4>
         for(ss=0;ss<SSLIMIT;ss++)
    7906:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    790d:	eb 2f                	jmp    793e <III_stereo+0xaea>
            lr[ch][sb][ss] = 0;
    790f:	8b 55 e0             	mov    -0x20(%ebp),%edx
    7912:	89 d0                	mov    %edx,%eax
    7914:	c1 e0 03             	shl    $0x3,%eax
    7917:	01 d0                	add    %edx,%eax
    7919:	c1 e0 09             	shl    $0x9,%eax
    791c:	89 c2                	mov    %eax,%edx
    791e:	8b 45 0c             	mov    0xc(%ebp),%eax
    7921:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7924:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7927:	89 d0                	mov    %edx,%eax
    7929:	c1 e0 03             	shl    $0x3,%eax
    792c:	01 d0                	add    %edx,%eax
    792e:	01 c0                	add    %eax,%eax
    7930:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7933:	01 d0                	add    %edx,%eax
    7935:	d9 ee                	fldz   
    7937:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    793a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    793e:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7942:	7e cb                	jle    790f <III_stereo+0xabb>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    7944:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7948:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    794c:	7e b8                	jle    7906 <III_stereo+0xab2>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    794e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    7952:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    7956:	7e a5                	jle    78fd <III_stereo+0xaa9>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    7958:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    795c:	0f 85 3d 02 00 00    	jne    7b9f <III_stereo+0xd4b>
      for(sb=0;sb<SBLIMIT;sb++)
    7962:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7969:	e9 25 02 00 00       	jmp    7b93 <III_stereo+0xd3f>
         for(ss=0;ss<SSLIMIT;ss++) {
    796e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7975:	e9 0b 02 00 00       	jmp    7b85 <III_stereo+0xd31>
            i = (sb*18)+ss;
    797a:	8b 55 e8             	mov    -0x18(%ebp),%edx
    797d:	89 d0                	mov    %edx,%eax
    797f:	c1 e0 03             	shl    $0x3,%eax
    7982:	01 d0                	add    %edx,%eax
    7984:	01 c0                	add    %eax,%eax
    7986:	89 c2                	mov    %eax,%edx
    7988:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    798b:	01 d0                	add    %edx,%eax
    798d:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    7990:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7993:	8b 04 85 e0 26 01 00 	mov    0x126e0(,%eax,4),%eax
    799a:	83 f8 07             	cmp    $0x7,%eax
    799d:	0f 85 2c 01 00 00    	jne    7acf <III_stereo+0xc7b>
               if ( ms_stereo ) {
    79a3:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    79a7:	0f 84 b5 00 00 00    	je     7a62 <III_stereo+0xc0e>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    79ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
    79b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79b3:	89 d0                	mov    %edx,%eax
    79b5:	c1 e0 03             	shl    $0x3,%eax
    79b8:	01 d0                	add    %edx,%eax
    79ba:	01 c0                	add    %eax,%eax
    79bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    79bf:	01 d0                	add    %edx,%eax
    79c1:	dd 04 c1             	fldl   (%ecx,%eax,8)
    79c4:	8b 45 08             	mov    0x8(%ebp),%eax
    79c7:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    79cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79d0:	89 d0                	mov    %edx,%eax
    79d2:	c1 e0 03             	shl    $0x3,%eax
    79d5:	01 d0                	add    %edx,%eax
    79d7:	01 c0                	add    %eax,%eax
    79d9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    79dc:	01 d0                	add    %edx,%eax
    79de:	dd 04 c1             	fldl   (%ecx,%eax,8)
    79e1:	de c1                	faddp  %st,%st(1)
    79e3:	dd 05 08 91 00 00    	fldl   0x9108
    79e9:	de f9                	fdivrp %st,%st(1)
    79eb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    79ee:	8b 55 e8             	mov    -0x18(%ebp),%edx
    79f1:	89 d0                	mov    %edx,%eax
    79f3:	c1 e0 03             	shl    $0x3,%eax
    79f6:	01 d0                	add    %edx,%eax
    79f8:	01 c0                	add    %eax,%eax
    79fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    79fd:	01 d0                	add    %edx,%eax
    79ff:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    7a02:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a05:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7a0b:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7a0e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a11:	89 d0                	mov    %edx,%eax
    7a13:	c1 e0 03             	shl    $0x3,%eax
    7a16:	01 d0                	add    %edx,%eax
    7a18:	01 c0                	add    %eax,%eax
    7a1a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7a1d:	01 d0                	add    %edx,%eax
    7a1f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a22:	8b 45 08             	mov    0x8(%ebp),%eax
    7a25:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7a2b:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a2e:	89 d0                	mov    %edx,%eax
    7a30:	c1 e0 03             	shl    $0x3,%eax
    7a33:	01 d0                	add    %edx,%eax
    7a35:	01 c0                	add    %eax,%eax
    7a37:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7a3a:	01 d0                	add    %edx,%eax
    7a3c:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a3f:	de e9                	fsubrp %st,%st(1)
    7a41:	dd 05 08 91 00 00    	fldl   0x9108
    7a47:	de f9                	fdivrp %st,%st(1)
    7a49:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a4c:	89 d0                	mov    %edx,%eax
    7a4e:	c1 e0 03             	shl    $0x3,%eax
    7a51:	01 d0                	add    %edx,%eax
    7a53:	01 c0                	add    %eax,%eax
    7a55:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7a58:	01 d0                	add    %edx,%eax
    7a5a:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    7a5d:	e9 1f 01 00 00       	jmp    7b81 <III_stereo+0xd2d>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    7a62:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7a65:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a68:	89 d0                	mov    %edx,%eax
    7a6a:	c1 e0 03             	shl    $0x3,%eax
    7a6d:	01 d0                	add    %edx,%eax
    7a6f:	01 c0                	add    %eax,%eax
    7a71:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7a74:	01 d0                	add    %edx,%eax
    7a76:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7a79:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7a7c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7a7f:	89 d0                	mov    %edx,%eax
    7a81:	c1 e0 03             	shl    $0x3,%eax
    7a84:	01 d0                	add    %edx,%eax
    7a86:	01 c0                	add    %eax,%eax
    7a88:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7a8b:	01 d0                	add    %edx,%eax
    7a8d:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    7a90:	8b 45 0c             	mov    0xc(%ebp),%eax
    7a93:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    7a99:	8b 45 08             	mov    0x8(%ebp),%eax
    7a9c:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7aa2:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7aa5:	89 d0                	mov    %edx,%eax
    7aa7:	c1 e0 03             	shl    $0x3,%eax
    7aaa:	01 d0                	add    %edx,%eax
    7aac:	01 c0                	add    %eax,%eax
    7aae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7ab1:	01 d0                	add    %edx,%eax
    7ab3:	dd 04 c3             	fldl   (%ebx,%eax,8)
    7ab6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7ab9:	89 d0                	mov    %edx,%eax
    7abb:	c1 e0 03             	shl    $0x3,%eax
    7abe:	01 d0                	add    %edx,%eax
    7ac0:	01 c0                	add    %eax,%eax
    7ac2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7ac5:	01 d0                	add    %edx,%eax
    7ac7:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    7aca:	e9 b2 00 00 00       	jmp    7b81 <III_stereo+0xd2d>
               }
            }
            else if (i_stereo ) {
    7acf:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    7ad3:	0f 84 94 00 00 00    	je     7b6d <III_stereo+0xd19>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    7ad9:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7adc:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7adf:	89 d0                	mov    %edx,%eax
    7ae1:	c1 e0 03             	shl    $0x3,%eax
    7ae4:	01 d0                	add    %edx,%eax
    7ae6:	01 c0                	add    %eax,%eax
    7ae8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7aeb:	01 d0                	add    %edx,%eax
    7aed:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7af3:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    7afa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7afd:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    7b04:	d9 e8                	fld1   
    7b06:	de c1                	faddp  %st,%st(1)
    7b08:	de f9                	fdivrp %st,%st(1)
    7b0a:	de c9                	fmulp  %st,%st(1)
    7b0c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7b0f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b12:	89 d0                	mov    %edx,%eax
    7b14:	c1 e0 03             	shl    $0x3,%eax
    7b17:	01 d0                	add    %edx,%eax
    7b19:	01 c0                	add    %eax,%eax
    7b1b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7b1e:	01 d0                	add    %edx,%eax
    7b20:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    7b23:	8b 45 0c             	mov    0xc(%ebp),%eax
    7b26:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    7b2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7b2f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b32:	89 d0                	mov    %edx,%eax
    7b34:	c1 e0 03             	shl    $0x3,%eax
    7b37:	01 d0                	add    %edx,%eax
    7b39:	01 c0                	add    %eax,%eax
    7b3b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7b3e:	01 d0                	add    %edx,%eax
    7b40:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7b43:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7b46:	dd 04 c5 e0 14 01 00 	fldl   0x114e0(,%eax,8)
    7b4d:	d9 e8                	fld1   
    7b4f:	de c1                	faddp  %st,%st(1)
    7b51:	d9 e8                	fld1   
    7b53:	de f1                	fdivp  %st,%st(1)
    7b55:	de c9                	fmulp  %st,%st(1)
    7b57:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7b5a:	89 d0                	mov    %edx,%eax
    7b5c:	c1 e0 03             	shl    $0x3,%eax
    7b5f:	01 d0                	add    %edx,%eax
    7b61:	01 c0                	add    %eax,%eax
    7b63:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7b66:	01 d0                	add    %edx,%eax
    7b68:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    7b6b:	eb 14                	jmp    7b81 <III_stereo+0xd2d>
            }
            else {
               printf(0,"Error in streo processing\n");
    7b6d:	c7 44 24 04 a8 90 00 	movl   $0x90a8,0x4(%esp)
    7b74:	00 
    7b75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    7b7c:	e8 f1 c2 ff ff       	call   3e72 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    7b81:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7b85:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7b89:	0f 8e eb fd ff ff    	jle    797a <III_stereo+0xb26>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    7b8f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7b93:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    7b97:	0f 8e d1 fd ff ff    	jle    796e <III_stereo+0xb1a>
    7b9d:	eb 54                	jmp    7bf3 <III_stereo+0xd9f>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    7b9f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7ba6:	eb 45                	jmp    7bed <III_stereo+0xd99>
         for(ss=0;ss<SSLIMIT;ss++)
    7ba8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    7baf:	eb 32                	jmp    7be3 <III_stereo+0xd8f>
            lr[0][sb][ss] = xr[0][sb][ss];
    7bb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    7bb4:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7bb7:	89 d0                	mov    %edx,%eax
    7bb9:	c1 e0 03             	shl    $0x3,%eax
    7bbc:	01 d0                	add    %edx,%eax
    7bbe:	01 c0                	add    %eax,%eax
    7bc0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7bc3:	01 d0                	add    %edx,%eax
    7bc5:	dd 04 c1             	fldl   (%ecx,%eax,8)
    7bc8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    7bcb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    7bce:	89 d0                	mov    %edx,%eax
    7bd0:	c1 e0 03             	shl    $0x3,%eax
    7bd3:	01 d0                	add    %edx,%eax
    7bd5:	01 c0                	add    %eax,%eax
    7bd7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    7bda:	01 d0                	add    %edx,%eax
    7bdc:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    7bdf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    7be3:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    7be7:	7e c8                	jle    7bb1 <III_stereo+0xd5d>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    7be9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7bed:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    7bf1:	7e b5                	jle    7ba8 <III_stereo+0xd54>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    7bf3:	83 c4 50             	add    $0x50,%esp
    7bf6:	5b                   	pop    %ebx
    7bf7:	5e                   	pop    %esi
    7bf8:	5d                   	pop    %ebp
    7bf9:	c3                   	ret    

00007bfa <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    7bfa:	55                   	push   %ebp
    7bfb:	89 e5                	mov    %esp,%ebp
    7bfd:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    7c00:	a1 e0 d6 00 00       	mov    0xd6e0,%eax
    7c05:	85 c0                	test   %eax,%eax
    7c07:	74 68                	je     7c71 <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    7c09:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    7c10:	eb 4f                	jmp    7c61 <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    7c12:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c15:	dd 04 c5 a0 c6 00 00 	fldl   0xc6a0(,%eax,8)
    7c1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c1f:	dd 04 c5 a0 c6 00 00 	fldl   0xc6a0(,%eax,8)
    7c26:	de c9                	fmulp  %st,%st(1)
    7c28:	d9 e8                	fld1   
    7c2a:	de c1                	faddp  %st,%st(1)
    7c2c:	dd 1c 24             	fstpl  (%esp)
    7c2f:	e8 84 c7 ff ff       	call   43b8 <sqrt>
    7c34:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    7c37:	d9 e8                	fld1   
    7c39:	dc 75 e0             	fdivl  -0x20(%ebp)
    7c3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c3f:	dd 1c c5 40 d7 00 00 	fstpl  0xd740(,%eax,8)
         ca[i] = Ci[i]/sq;
    7c46:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c49:	dd 04 c5 a0 c6 00 00 	fldl   0xc6a0(,%eax,8)
    7c50:	dc 75 e0             	fdivl  -0x20(%ebp)
    7c53:	8b 45 e8             	mov    -0x18(%ebp),%eax
    7c56:	dd 1c c5 80 d7 00 00 	fstpl  0xd780(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    7c5d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    7c61:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    7c65:	7e ab                	jle    7c12 <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    7c67:	c7 05 e0 d6 00 00 00 	movl   $0x0,0xd6e0
    7c6e:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    7c71:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7c78:	eb 4c                	jmp    7cc6 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    7c7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7c81:	eb 39                	jmp    7cbc <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    7c83:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c86:	89 d0                	mov    %edx,%eax
    7c88:	c1 e0 03             	shl    $0x3,%eax
    7c8b:	01 d0                	add    %edx,%eax
    7c8d:	c1 e0 04             	shl    $0x4,%eax
    7c90:	89 c2                	mov    %eax,%edx
    7c92:	8b 45 0c             	mov    0xc(%ebp),%eax
    7c95:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7c98:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7c9b:	89 d0                	mov    %edx,%eax
    7c9d:	c1 e0 03             	shl    $0x3,%eax
    7ca0:	01 d0                	add    %edx,%eax
    7ca2:	c1 e0 04             	shl    $0x4,%eax
    7ca5:	89 c2                	mov    %eax,%edx
    7ca7:	8b 45 08             	mov    0x8(%ebp),%eax
    7caa:	01 c2                	add    %eax,%edx
    7cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7caf:	dd 04 c2             	fldl   (%edx,%eax,8)
    7cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7cb5:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    7cb8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7cbc:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7cc0:	7e c1                	jle    7c83 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    7cc2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7cc6:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    7cca:	7e ae                	jle    7c7a <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7ccc:	8b 45 10             	mov    0x10(%ebp),%eax
    7ccf:	8b 40 10             	mov    0x10(%eax),%eax
    7cd2:	85 c0                	test   %eax,%eax
    7cd4:	74 1a                	je     7cf0 <III_antialias+0xf6>
    7cd6:	8b 45 10             	mov    0x10(%ebp),%eax
    7cd9:	8b 40 14             	mov    0x14(%eax),%eax
    7cdc:	83 f8 02             	cmp    $0x2,%eax
    7cdf:	75 0f                	jne    7cf0 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    7ce1:	8b 45 10             	mov    0x10(%ebp),%eax
    7ce4:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    7ce7:	85 c0                	test   %eax,%eax
    7ce9:	75 05                	jne    7cf0 <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    7ceb:	e9 1c 01 00 00       	jmp    7e0c <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7cf0:	8b 45 10             	mov    0x10(%ebp),%eax
    7cf3:	8b 40 10             	mov    0x10(%eax),%eax
    7cf6:	85 c0                	test   %eax,%eax
    7cf8:	74 1e                	je     7d18 <III_antialias+0x11e>
    7cfa:	8b 45 10             	mov    0x10(%ebp),%eax
    7cfd:	8b 40 18             	mov    0x18(%eax),%eax
    7d00:	85 c0                	test   %eax,%eax
    7d02:	74 14                	je     7d18 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    7d04:	8b 45 10             	mov    0x10(%ebp),%eax
    7d07:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    7d0a:	83 f8 02             	cmp    $0x2,%eax
    7d0d:	75 09                	jne    7d18 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    7d0f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    7d16:	eb 07                	jmp    7d1f <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    7d18:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    7d1f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    7d26:	e9 d5 00 00 00       	jmp    7e00 <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    7d2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7d32:	e9 bb 00 00 00       	jmp    7df2 <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    7d37:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d3a:	89 d0                	mov    %edx,%eax
    7d3c:	c1 e0 03             	shl    $0x3,%eax
    7d3f:	01 d0                	add    %edx,%eax
    7d41:	c1 e0 04             	shl    $0x4,%eax
    7d44:	89 c2                	mov    %eax,%edx
    7d46:	8b 45 08             	mov    0x8(%ebp),%eax
    7d49:	01 c2                	add    %eax,%edx
    7d4b:	b8 11 00 00 00       	mov    $0x11,%eax
    7d50:	2b 45 f4             	sub    -0xc(%ebp),%eax
    7d53:	dd 04 c2             	fldl   (%edx,%eax,8)
    7d56:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    7d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7d5c:	8d 50 01             	lea    0x1(%eax),%edx
    7d5f:	89 d0                	mov    %edx,%eax
    7d61:	c1 e0 03             	shl    $0x3,%eax
    7d64:	01 d0                	add    %edx,%eax
    7d66:	c1 e0 04             	shl    $0x4,%eax
    7d69:	89 c2                	mov    %eax,%edx
    7d6b:	8b 45 08             	mov    0x8(%ebp),%eax
    7d6e:	01 c2                	add    %eax,%edx
    7d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7d73:	dd 04 c2             	fldl   (%edx,%eax,8)
    7d76:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    7d79:	8b 55 f0             	mov    -0x10(%ebp),%edx
    7d7c:	89 d0                	mov    %edx,%eax
    7d7e:	c1 e0 03             	shl    $0x3,%eax
    7d81:	01 d0                	add    %edx,%eax
    7d83:	c1 e0 04             	shl    $0x4,%eax
    7d86:	89 c2                	mov    %eax,%edx
    7d88:	8b 45 0c             	mov    0xc(%ebp),%eax
    7d8b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    7d8e:	b8 11 00 00 00       	mov    $0x11,%eax
    7d93:	2b 45 f4             	sub    -0xc(%ebp),%eax
    7d96:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7d99:	dd 04 d5 40 d7 00 00 	fldl   0xd740(,%edx,8)
    7da0:	dc 4d d8             	fmull  -0x28(%ebp)
    7da3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    7da6:	dd 04 d5 80 d7 00 00 	fldl   0xd780(,%edx,8)
    7dad:	dc 4d d0             	fmull  -0x30(%ebp)
    7db0:	de e9                	fsubrp %st,%st(1)
    7db2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    7db5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7db8:	8d 50 01             	lea    0x1(%eax),%edx
    7dbb:	89 d0                	mov    %edx,%eax
    7dbd:	c1 e0 03             	shl    $0x3,%eax
    7dc0:	01 d0                	add    %edx,%eax
    7dc2:	c1 e0 04             	shl    $0x4,%eax
    7dc5:	89 c2                	mov    %eax,%edx
    7dc7:	8b 45 0c             	mov    0xc(%ebp),%eax
    7dca:	01 c2                	add    %eax,%edx
    7dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7dcf:	dd 04 c5 40 d7 00 00 	fldl   0xd740(,%eax,8)
    7dd6:	dc 4d d0             	fmull  -0x30(%ebp)
    7dd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ddc:	dd 04 c5 80 d7 00 00 	fldl   0xd780(,%eax,8)
    7de3:	dc 4d d8             	fmull  -0x28(%ebp)
    7de6:	de c1                	faddp  %st,%st(1)
    7de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7deb:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    7dee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7df2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    7df6:	0f 8e 3b ff ff ff    	jle    7d37 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    7dfc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    7e00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    7e03:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    7e06:	0f 8c 1f ff ff ff    	jl     7d2b <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    7e0c:	c9                   	leave  
    7e0d:	c3                   	ret    

00007e0e <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    7e0e:	55                   	push   %ebp
    7e0f:	89 e5                	mov    %esp,%ebp
    7e11:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    7e17:	a1 c0 d7 00 00       	mov    0xd7c0,%eax
    7e1c:	85 c0                	test   %eax,%eax
    7e1e:	0f 85 59 02 00 00    	jne    807d <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    7e24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7e2b:	eb 29                	jmp    7e56 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    7e2d:	db 45 f4             	fildl  -0xc(%ebp)
    7e30:	dd 05 10 91 00 00    	fldl   0x9110
    7e36:	de c1                	faddp  %st,%st(1)
    7e38:	dd 05 18 91 00 00    	fldl   0x9118
    7e3e:	de c9                	fmulp  %st,%st(1)
    7e40:	dd 1c 24             	fstpl  (%esp)
    7e43:	e8 06 c4 ff ff       	call   424e <sin>
    7e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e4b:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    7e52:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e56:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7e5a:	7e d1                	jle    7e2d <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    7e5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7e63:	eb 2c                	jmp    7e91 <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    7e65:	db 45 f4             	fildl  -0xc(%ebp)
    7e68:	dd 05 10 91 00 00    	fldl   0x9110
    7e6e:	de c1                	faddp  %st,%st(1)
    7e70:	dd 05 18 91 00 00    	fldl   0x9118
    7e76:	de c9                	fmulp  %st,%st(1)
    7e78:	dd 1c 24             	fstpl  (%esp)
    7e7b:	e8 ce c3 ff ff       	call   424e <sin>
    7e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7e83:	83 c0 24             	add    $0x24,%eax
    7e86:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    7e8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7e91:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7e95:	7e ce                	jle    7e65 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    7e97:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7e9e:	eb 13                	jmp    7eb3 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    7ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ea3:	83 c0 24             	add    $0x24,%eax
    7ea6:	d9 e8                	fld1   
    7ea8:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    7eaf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7eb3:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    7eb7:	7e e7                	jle    7ea0 <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    7eb9:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    7ec0:	eb 34                	jmp    7ef6 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    7ec2:	db 45 f4             	fildl  -0xc(%ebp)
    7ec5:	dd 05 10 91 00 00    	fldl   0x9110
    7ecb:	de c1                	faddp  %st,%st(1)
    7ecd:	dd 05 20 91 00 00    	fldl   0x9120
    7ed3:	de e9                	fsubrp %st,%st(1)
    7ed5:	dd 05 00 91 00 00    	fldl   0x9100
    7edb:	de c9                	fmulp  %st,%st(1)
    7edd:	dd 1c 24             	fstpl  (%esp)
    7ee0:	e8 69 c3 ff ff       	call   424e <sin>
    7ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7ee8:	83 c0 24             	add    $0x24,%eax
    7eeb:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    7ef2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7ef6:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    7efa:	7e c6                	jle    7ec2 <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    7efc:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    7f03:	eb 13                	jmp    7f18 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    7f05:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f08:	83 c0 24             	add    $0x24,%eax
    7f0b:	d9 ee                	fldz   
    7f0d:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    7f14:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f18:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7f1c:	7e e7                	jle    7f05 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    7f1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7f25:	eb 13                	jmp    7f3a <inv_mdct+0x12c>
         win[3][i] = 0.0;
    7f27:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f2a:	83 c0 6c             	add    $0x6c,%eax
    7f2d:	d9 ee                	fldz   
    7f2f:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    7f36:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f3a:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    7f3e:	7e e7                	jle    7f27 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    7f40:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    7f47:	eb 34                	jmp    7f7d <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    7f49:	db 45 f4             	fildl  -0xc(%ebp)
    7f4c:	dd 05 10 91 00 00    	fldl   0x9110
    7f52:	de c1                	faddp  %st,%st(1)
    7f54:	dd 05 28 91 00 00    	fldl   0x9128
    7f5a:	de e9                	fsubrp %st,%st(1)
    7f5c:	dd 05 00 91 00 00    	fldl   0x9100
    7f62:	de c9                	fmulp  %st,%st(1)
    7f64:	dd 1c 24             	fstpl  (%esp)
    7f67:	e8 e2 c2 ff ff       	call   424e <sin>
    7f6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f6f:	83 c0 6c             	add    $0x6c,%eax
    7f72:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    7f79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f7d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    7f81:	7e c6                	jle    7f49 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    7f83:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    7f8a:	eb 13                	jmp    7f9f <inv_mdct+0x191>
         win[3][i] =1.0;
    7f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7f8f:	83 c0 6c             	add    $0x6c,%eax
    7f92:	d9 e8                	fld1   
    7f94:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    7f9b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7f9f:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    7fa3:	7e e7                	jle    7f8c <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    7fa5:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    7fac:	eb 2c                	jmp    7fda <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    7fae:	db 45 f4             	fildl  -0xc(%ebp)
    7fb1:	dd 05 10 91 00 00    	fldl   0x9110
    7fb7:	de c1                	faddp  %st,%st(1)
    7fb9:	dd 05 18 91 00 00    	fldl   0x9118
    7fbf:	de c9                	fmulp  %st,%st(1)
    7fc1:	dd 1c 24             	fstpl  (%esp)
    7fc4:	e8 85 c2 ff ff       	call   424e <sin>
    7fc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7fcc:	83 c0 6c             	add    $0x6c,%eax
    7fcf:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    7fd6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    7fda:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    7fde:	7e ce                	jle    7fae <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    7fe0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    7fe7:	eb 2c                	jmp    8015 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    7fe9:	db 45 f4             	fildl  -0xc(%ebp)
    7fec:	dd 05 10 91 00 00    	fldl   0x9110
    7ff2:	de c1                	faddp  %st,%st(1)
    7ff4:	dd 05 00 91 00 00    	fldl   0x9100
    7ffa:	de c9                	fmulp  %st,%st(1)
    7ffc:	dd 1c 24             	fstpl  (%esp)
    7fff:	e8 4a c2 ff ff       	call   424e <sin>
    8004:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8007:	83 c0 48             	add    $0x48,%eax
    800a:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    8011:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8015:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    8019:	7e ce                	jle    7fe9 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    801b:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    8022:	eb 13                	jmp    8037 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    8024:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8027:	83 c0 48             	add    $0x48,%eax
    802a:	d9 ee                	fldz   
    802c:	dd 1c c5 e0 d7 00 00 	fstpl  0xd7e0(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    8033:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8037:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    803b:	7e e7                	jle    8024 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    803d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8044:	eb 21                	jmp    8067 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    8046:	db 45 f4             	fildl  -0xc(%ebp)
    8049:	dd 05 30 91 00 00    	fldl   0x9130
    804f:	de c9                	fmulp  %st,%st(1)
    8051:	dd 1c 24             	fstpl  (%esp)
    8054:	e8 14 c2 ff ff       	call   426d <cos>
    8059:	8b 45 f4             	mov    -0xc(%ebp),%eax
    805c:	dd 1c c5 60 dc 00 00 	fstpl  0xdc60(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    8063:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8067:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    806e:	7e d6                	jle    8046 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    8070:	a1 c0 d7 00 00       	mov    0xd7c0,%eax
    8075:	83 c0 01             	add    $0x1,%eax
    8078:	a3 c0 d7 00 00       	mov    %eax,0xd7c0
    }

    for(i=0;i<36;i++)
    807d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8084:	eb 17                	jmp    809d <inv_mdct+0x28f>
       out[i]=0;
    8086:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8089:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8090:	8b 45 0c             	mov    0xc(%ebp),%eax
    8093:	01 d0                	add    %edx,%eax
    8095:	d9 ee                	fldz   
    8097:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    8099:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    809d:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    80a1:	7e e3                	jle    8086 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    80a3:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    80a7:	0f 85 85 01 00 00    	jne    8232 <inv_mdct+0x424>
       N=12;
    80ad:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    80b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    80bb:	e9 63 01 00 00       	jmp    8223 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    80c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    80c7:	e9 df 00 00 00       	jmp    81ab <inv_mdct+0x39d>
             sum = 0.0;
    80cc:	d9 ee                	fldz   
    80ce:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    80d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    80d8:	e9 8f 00 00 00       	jmp    816c <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    80dd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    80e0:	89 d0                	mov    %edx,%eax
    80e2:	01 c0                	add    %eax,%eax
    80e4:	01 c2                	add    %eax,%edx
    80e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    80e9:	01 d0                	add    %edx,%eax
    80eb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    80f2:	8b 45 08             	mov    0x8(%ebp),%eax
    80f5:	01 d0                	add    %edx,%eax
    80f7:	dd 00                	fldl   (%eax)
    80f9:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    80ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8102:	01 c0                	add    %eax,%eax
    8104:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    810a:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    8110:	dd 05 38 91 00 00    	fldl   0x9138
    8116:	de f1                	fdivp  %st,%st(1)
    8118:	8b 45 ec             	mov    -0x14(%ebp),%eax
    811b:	01 c0                	add    %eax,%eax
    811d:	8d 50 01             	lea    0x1(%eax),%edx
    8120:	8b 45 dc             	mov    -0x24(%ebp),%eax
    8123:	89 c1                	mov    %eax,%ecx
    8125:	c1 e9 1f             	shr    $0x1f,%ecx
    8128:	01 c8                	add    %ecx,%eax
    812a:	d1 f8                	sar    %eax
    812c:	01 d0                	add    %edx,%eax
    812e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    8134:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    813a:	de c9                	fmulp  %st,%st(1)
    813c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    813f:	01 c0                	add    %eax,%eax
    8141:	83 c0 01             	add    $0x1,%eax
    8144:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    814a:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    8150:	de c9                	fmulp  %st,%st(1)
    8152:	dd 1c 24             	fstpl  (%esp)
    8155:	e8 13 c1 ff ff       	call   426d <cos>
    815a:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    8160:	dd 45 e0             	fldl   -0x20(%ebp)
    8163:	de c1                	faddp  %st,%st(1)
    8165:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    8168:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    816c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    816f:	89 c2                	mov    %eax,%edx
    8171:	c1 ea 1f             	shr    $0x1f,%edx
    8174:	01 d0                	add    %edx,%eax
    8176:	d1 f8                	sar    %eax
    8178:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    817b:	0f 8f 5c ff ff ff    	jg     80dd <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    8181:	8b 55 10             	mov    0x10(%ebp),%edx
    8184:	89 d0                	mov    %edx,%eax
    8186:	c1 e0 03             	shl    $0x3,%eax
    8189:	01 d0                	add    %edx,%eax
    818b:	c1 e0 02             	shl    $0x2,%eax
    818e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8191:	01 d0                	add    %edx,%eax
    8193:	dd 04 c5 e0 d7 00 00 	fldl   0xd7e0(,%eax,8)
    819a:	dc 4d e0             	fmull  -0x20(%ebp)
    819d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81a0:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    81a7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    81ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81ae:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    81b1:	0f 8c 15 ff ff ff    	jl     80cc <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    81b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    81be:	eb 57                	jmp    8217 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    81c0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    81c3:	89 d0                	mov    %edx,%eax
    81c5:	01 c0                	add    %eax,%eax
    81c7:	01 d0                	add    %edx,%eax
    81c9:	01 c0                	add    %eax,%eax
    81cb:	89 c2                	mov    %eax,%edx
    81cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81d0:	01 d0                	add    %edx,%eax
    81d2:	83 c0 06             	add    $0x6,%eax
    81d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    81dc:	8b 45 0c             	mov    0xc(%ebp),%eax
    81df:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    81e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    81e5:	89 d0                	mov    %edx,%eax
    81e7:	01 c0                	add    %eax,%eax
    81e9:	01 d0                	add    %edx,%eax
    81eb:	01 c0                	add    %eax,%eax
    81ed:	89 c2                	mov    %eax,%edx
    81ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
    81f2:	01 d0                	add    %edx,%eax
    81f4:	83 c0 06             	add    $0x6,%eax
    81f7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    81fe:	8b 45 0c             	mov    0xc(%ebp),%eax
    8201:	01 d0                	add    %edx,%eax
    8203:	dd 00                	fldl   (%eax)
    8205:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8208:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    820f:	de c1                	faddp  %st,%st(1)
    8211:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    8213:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8217:	8b 45 ec             	mov    -0x14(%ebp),%eax
    821a:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    821d:	7c a1                	jl     81c0 <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    821f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8223:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    8227:	0f 8e 93 fe ff ff    	jle    80c0 <inv_mdct+0x2b2>
    822d:	e9 da 00 00 00       	jmp    830c <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    8232:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    8239:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8240:	e9 bb 00 00 00       	jmp    8300 <inv_mdct+0x4f2>
         sum = 0.0;
    8245:	d9 ee                	fldz   
    8247:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    824a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8251:	eb 6a                	jmp    82bd <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    8253:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8256:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    825d:	8b 45 08             	mov    0x8(%ebp),%eax
    8260:	01 d0                	add    %edx,%eax
    8262:	dd 00                	fldl   (%eax)
    8264:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8267:	01 c0                	add    %eax,%eax
    8269:	8d 50 01             	lea    0x1(%eax),%edx
    826c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    826f:	89 c1                	mov    %eax,%ecx
    8271:	c1 e9 1f             	shr    $0x1f,%ecx
    8274:	01 c8                	add    %ecx,%eax
    8276:	d1 f8                	sar    %eax
    8278:	01 c2                	add    %eax,%edx
    827a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    827d:	01 c0                	add    %eax,%eax
    827f:	83 c0 01             	add    $0x1,%eax
    8282:	89 d1                	mov    %edx,%ecx
    8284:	0f af c8             	imul   %eax,%ecx
    8287:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    828c:	89 c8                	mov    %ecx,%eax
    828e:	f7 ea                	imul   %edx
    8290:	c1 fa 05             	sar    $0x5,%edx
    8293:	89 c8                	mov    %ecx,%eax
    8295:	c1 f8 1f             	sar    $0x1f,%eax
    8298:	29 c2                	sub    %eax,%edx
    829a:	89 d0                	mov    %edx,%eax
    829c:	c1 e0 03             	shl    $0x3,%eax
    829f:	01 d0                	add    %edx,%eax
    82a1:	c1 e0 04             	shl    $0x4,%eax
    82a4:	29 c1                	sub    %eax,%ecx
    82a6:	89 ca                	mov    %ecx,%edx
    82a8:	dd 04 d5 60 dc 00 00 	fldl   0xdc60(,%edx,8)
    82af:	de c9                	fmulp  %st,%st(1)
    82b1:	dd 45 e0             	fldl   -0x20(%ebp)
    82b4:	de c1                	faddp  %st,%st(1)
    82b6:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    82b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    82bd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    82c0:	89 c2                	mov    %eax,%edx
    82c2:	c1 ea 1f             	shr    $0x1f,%edx
    82c5:	01 d0                	add    %edx,%eax
    82c7:	d1 f8                	sar    %eax
    82c9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    82cc:	7f 85                	jg     8253 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    82ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
    82d1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    82d8:	8b 45 0c             	mov    0xc(%ebp),%eax
    82db:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    82de:	8b 55 10             	mov    0x10(%ebp),%edx
    82e1:	89 d0                	mov    %edx,%eax
    82e3:	c1 e0 03             	shl    $0x3,%eax
    82e6:	01 d0                	add    %edx,%eax
    82e8:	c1 e0 02             	shl    $0x2,%eax
    82eb:	8b 55 ec             	mov    -0x14(%ebp),%edx
    82ee:	01 d0                	add    %edx,%eax
    82f0:	dd 04 c5 e0 d7 00 00 	fldl   0xd7e0(,%eax,8)
    82f7:	dc 4d e0             	fmull  -0x20(%ebp)
    82fa:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    82fc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8300:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8303:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    8306:	0f 8c 39 ff ff ff    	jl     8245 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    830c:	c9                   	leave  
    830d:	c3                   	ret    

0000830e <III_hybrid>:

double rawout[36];
void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    830e:	55                   	push   %ebp
    830f:	89 e5                	mov    %esp,%ebp
    8311:	53                   	push   %ebx
    8312:	83 ec 34             	sub    $0x34,%esp
   // double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    8315:	a1 e4 d6 00 00       	mov    0xd6e4,%eax
    831a:	85 c0                	test   %eax,%eax
    831c:	74 6f                	je     838d <III_hybrid+0x7f>
      int i,j,k;

      for(i=0;i<2;i++)
    831e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8325:	eb 56                	jmp    837d <III_hybrid+0x6f>
         for(j=0;j<SBLIMIT;j++)
    8327:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    832e:	eb 43                	jmp    8373 <III_hybrid+0x65>
            for(k=0;k<SSLIMIT;k++)
    8330:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    8337:	eb 30                	jmp    8369 <III_hybrid+0x5b>
               prevblck[i][j][k]=0.0;
    8339:	8b 45 ec             	mov    -0x14(%ebp),%eax
    833c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    833f:	89 c2                	mov    %eax,%edx
    8341:	c1 e2 03             	shl    $0x3,%edx
    8344:	01 c2                	add    %eax,%edx
    8346:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8349:	89 c2                	mov    %eax,%edx
    834b:	89 c8                	mov    %ecx,%eax
    834d:	c1 e0 03             	shl    $0x3,%eax
    8350:	01 c8                	add    %ecx,%eax
    8352:	c1 e0 06             	shl    $0x6,%eax
    8355:	01 c2                	add    %eax,%edx
    8357:	8b 45 e8             	mov    -0x18(%ebp),%eax
    835a:	01 d0                	add    %edx,%eax
    835c:	d9 ee                	fldz   
    835e:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    8365:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    8369:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    836d:	7e ca                	jle    8339 <III_hybrid+0x2b>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    836f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8373:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    8377:	7e b7                	jle    8330 <III_hybrid+0x22>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    8379:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    837d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    8381:	7e a4                	jle    8327 <III_hybrid+0x19>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    8383:	c7 05 e4 d6 00 00 00 	movl   $0x0,0xd6e4
    838a:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    838d:	8b 45 18             	mov    0x18(%ebp),%eax
    8390:	8b 40 10             	mov    0x10(%eax),%eax
    8393:	85 c0                	test   %eax,%eax
    8395:	74 10                	je     83a7 <III_hybrid+0x99>
    8397:	8b 45 18             	mov    0x18(%ebp),%eax
    839a:	8b 40 18             	mov    0x18(%eax),%eax
    839d:	85 c0                	test   %eax,%eax
    839f:	74 06                	je     83a7 <III_hybrid+0x99>
    83a1:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    83a5:	7e 08                	jle    83af <III_hybrid+0xa1>
          (sb < 2)) ? 0 : gr_info->block_type;
    83a7:	8b 45 18             	mov    0x18(%ebp),%eax
    83aa:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    83ad:	eb 05                	jmp    83b4 <III_hybrid+0xa6>
    83af:	b8 00 00 00 00       	mov    $0x0,%eax
    83b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    83b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    83ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    83be:	c7 44 24 04 c0 13 01 	movl   $0x113c0,0x4(%esp)
    83c5:	00 
    83c6:	8b 45 08             	mov    0x8(%ebp),%eax
    83c9:	89 04 24             	mov    %eax,(%esp)
    83cc:	e8 3d fa ff ff       	call   7e0e <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    83d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    83d8:	e9 83 00 00 00       	jmp    8460 <III_hybrid+0x152>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    83dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83e0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    83e7:	8b 45 0c             	mov    0xc(%ebp),%eax
    83ea:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    83ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    83f0:	dd 04 c5 c0 13 01 00 	fldl   0x113c0(,%eax,8)
    83f7:	8b 45 10             	mov    0x10(%ebp),%eax
    83fa:	8b 4d 14             	mov    0x14(%ebp),%ecx
    83fd:	89 c2                	mov    %eax,%edx
    83ff:	c1 e2 03             	shl    $0x3,%edx
    8402:	01 c2                	add    %eax,%edx
    8404:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8407:	89 c2                	mov    %eax,%edx
    8409:	89 c8                	mov    %ecx,%eax
    840b:	c1 e0 03             	shl    $0x3,%eax
    840e:	01 c8                	add    %ecx,%eax
    8410:	c1 e0 06             	shl    $0x6,%eax
    8413:	01 c2                	add    %eax,%edx
    8415:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8418:	01 d0                	add    %edx,%eax
    841a:	dd 04 c5 e0 e0 00 00 	fldl   0xe0e0(,%eax,8)
    8421:	de c1                	faddp  %st,%st(1)
    8423:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    8425:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8428:	83 c0 12             	add    $0x12,%eax
    842b:	dd 04 c5 c0 13 01 00 	fldl   0x113c0(,%eax,8)
    8432:	8b 45 10             	mov    0x10(%ebp),%eax
    8435:	8b 4d 14             	mov    0x14(%ebp),%ecx
    8438:	89 c2                	mov    %eax,%edx
    843a:	c1 e2 03             	shl    $0x3,%edx
    843d:	01 c2                	add    %eax,%edx
    843f:	8d 04 12             	lea    (%edx,%edx,1),%eax
    8442:	89 c2                	mov    %eax,%edx
    8444:	89 c8                	mov    %ecx,%eax
    8446:	c1 e0 03             	shl    $0x3,%eax
    8449:	01 c8                	add    %ecx,%eax
    844b:	c1 e0 06             	shl    $0x6,%eax
    844e:	01 c2                	add    %eax,%edx
    8450:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8453:	01 d0                	add    %edx,%eax
    8455:	dd 1c c5 e0 e0 00 00 	fstpl  0xe0e0(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    845c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8460:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    8464:	0f 8e 73 ff ff ff    	jle    83dd <III_hybrid+0xcf>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    846a:	83 c4 34             	add    $0x34,%esp
    846d:	5b                   	pop    %ebx
    846e:	5d                   	pop    %ebp
    846f:	c3                   	ret    

00008470 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    8470:	55                   	push   %ebp
    8471:	89 e5                	mov    %esp,%ebp
    8473:	53                   	push   %ebx
    8474:	83 ec 24             	sub    $0x24,%esp
	int i,k;

	for (i=0; i<64; i++)
    8477:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    847e:	e9 3f 01 00 00       	jmp    85c2 <create_syn_filter+0x152>
		for (k=0; k<32; k++) {
    8483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    848a:	e9 25 01 00 00       	jmp    85b4 <create_syn_filter+0x144>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    848f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8492:	c1 e0 08             	shl    $0x8,%eax
    8495:	89 c2                	mov    %eax,%edx
    8497:	8b 45 08             	mov    0x8(%ebp),%eax
    849a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    849d:	db 45 f4             	fildl  -0xc(%ebp)
    84a0:	dd 05 40 91 00 00    	fldl   0x9140
    84a6:	de c9                	fmulp  %st,%st(1)
    84a8:	dd 05 48 91 00 00    	fldl   0x9148
    84ae:	de c1                	faddp  %st,%st(1)
    84b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84b3:	01 c0                	add    %eax,%eax
    84b5:	83 c0 01             	add    $0x1,%eax
    84b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
    84bb:	db 45 e0             	fildl  -0x20(%ebp)
    84be:	de c9                	fmulp  %st,%st(1)
    84c0:	dd 1c 24             	fstpl  (%esp)
    84c3:	e8 a5 bd ff ff       	call   426d <cos>
    84c8:	dd 05 50 91 00 00    	fldl   0x9150
    84ce:	de c9                	fmulp  %st,%st(1)
    84d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84d3:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    84d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    84d9:	dd 04 c3             	fldl   (%ebx,%eax,8)
    84dc:	d9 ee                	fldz   
    84de:	d9 c9                	fxch   %st(1)
    84e0:	df e9                	fucomip %st(1),%st
    84e2:	dd d8                	fstp   %st(0)
    84e4:	72 4f                	jb     8535 <create_syn_filter+0xc5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    84e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84e9:	c1 e0 08             	shl    $0x8,%eax
    84ec:	89 c2                	mov    %eax,%edx
    84ee:	8b 45 08             	mov    0x8(%ebp),%eax
    84f1:	01 c2                	add    %eax,%edx
    84f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    84f6:	c1 e0 08             	shl    $0x8,%eax
    84f9:	89 c1                	mov    %eax,%ecx
    84fb:	8b 45 08             	mov    0x8(%ebp),%eax
    84fe:	01 c1                	add    %eax,%ecx
    8500:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8503:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8506:	dd 05 10 91 00 00    	fldl   0x9110
    850c:	de c1                	faddp  %st,%st(1)
    850e:	d9 7d e6             	fnstcw -0x1a(%ebp)
    8511:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    8515:	b4 0c                	mov    $0xc,%ah
    8517:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    851b:	d9 6d e4             	fldcw  -0x1c(%ebp)
    851e:	db 5d e0             	fistpl -0x20(%ebp)
    8521:	d9 6d e6             	fldcw  -0x1a(%ebp)
    8524:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8527:	89 45 e0             	mov    %eax,-0x20(%ebp)
    852a:	db 45 e0             	fildl  -0x20(%ebp)
    852d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8530:	dd 1c c2             	fstpl  (%edx,%eax,8)
    8533:	eb 4d                	jmp    8582 <create_syn_filter+0x112>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    8535:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8538:	c1 e0 08             	shl    $0x8,%eax
    853b:	89 c2                	mov    %eax,%edx
    853d:	8b 45 08             	mov    0x8(%ebp),%eax
    8540:	01 c2                	add    %eax,%edx
    8542:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8545:	c1 e0 08             	shl    $0x8,%eax
    8548:	89 c1                	mov    %eax,%ecx
    854a:	8b 45 08             	mov    0x8(%ebp),%eax
    854d:	01 c1                	add    %eax,%ecx
    854f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8552:	dd 04 c1             	fldl   (%ecx,%eax,8)
    8555:	dd 05 10 91 00 00    	fldl   0x9110
    855b:	de e9                	fsubrp %st,%st(1)
    855d:	d9 7d e6             	fnstcw -0x1a(%ebp)
    8560:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    8564:	b4 0c                	mov    $0xc,%ah
    8566:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    856a:	d9 6d e4             	fldcw  -0x1c(%ebp)
    856d:	db 5d e0             	fistpl -0x20(%ebp)
    8570:	d9 6d e6             	fldcw  -0x1a(%ebp)
    8573:	8b 45 e0             	mov    -0x20(%ebp),%eax
    8576:	89 45 e0             	mov    %eax,-0x20(%ebp)
    8579:	db 45 e0             	fildl  -0x20(%ebp)
    857c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    857f:	dd 1c c2             	fstpl  (%edx,%eax,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    8582:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8585:	c1 e0 08             	shl    $0x8,%eax
    8588:	89 c2                	mov    %eax,%edx
    858a:	8b 45 08             	mov    0x8(%ebp),%eax
    858d:	01 c2                	add    %eax,%edx
    858f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8592:	c1 e0 08             	shl    $0x8,%eax
    8595:	89 c1                	mov    %eax,%ecx
    8597:	8b 45 08             	mov    0x8(%ebp),%eax
    859a:	01 c1                	add    %eax,%ecx
    859c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    859f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    85a2:	dd 05 58 91 00 00    	fldl   0x9158
    85a8:	de c9                	fmulp  %st,%st(1)
    85aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    85ad:	dd 1c c2             	fstpl  (%edx,%eax,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    85b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    85b4:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    85b8:	0f 8e d1 fe ff ff    	jle    848f <create_syn_filter+0x1f>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	int i,k;

	for (i=0; i<64; i++)
    85be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    85c2:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    85c6:	0f 8e b7 fe ff ff    	jle    8483 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    85cc:	83 c4 24             	add    $0x24,%esp
    85cf:	5b                   	pop    %ebx
    85d0:	5d                   	pop    %ebp
    85d1:	c3                   	ret    

000085d2 <read_syn_window>:
  0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
};

/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    85d2:	55                   	push   %ebp
    85d3:	89 e5                	mov    %esp,%ebp
    85d5:	83 ec 10             	sub    $0x10,%esp
  int i;
  for (i = 0; i < HAN_SIZE; i++) {
    85d8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    85df:	eb 1f                	jmp    8600 <read_syn_window+0x2e>
    window[i] = gb_window[i];
    85e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    85e4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    85eb:	8b 45 08             	mov    0x8(%ebp),%eax
    85ee:	01 c2                	add    %eax,%edx
    85f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    85f3:	dd 04 c5 e0 c6 00 00 	fldl   0xc6e0(,%eax,8)
    85fa:	dd 1a                	fstpl  (%edx)

/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
  int i;
  for (i = 0; i < HAN_SIZE; i++) {
    85fc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    8600:	81 7d fc ff 01 00 00 	cmpl   $0x1ff,-0x4(%ebp)
    8607:	7e d8                	jle    85e1 <read_syn_window+0xf>
    window[i] = gb_window[i];
  }
}
    8609:	c9                   	leave  
    860a:	c3                   	ret    

0000860b <SubBandSynthesis>:

typedef double NN[64][32];
typedef double BB[2][2*HAN_SIZE];
int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    860b:	55                   	push   %ebp
    860c:	89 e5                	mov    %esp,%ebp
    860e:	83 ec 48             	sub    $0x48,%esp
	static int flag = 1;
	static NN *filter;
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    8611:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

	if (flag) {
    8618:	a1 e8 d6 00 00       	mov    0xd6e8,%eax
    861d:	85 c0                	test   %eax,%eax
    861f:	74 6f                	je     8690 <SubBandSynthesis+0x85>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    8621:	c7 44 24 04 c3 90 00 	movl   $0x90c3,0x4(%esp)
    8628:	00 
    8629:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    8630:	e8 a9 bf ff ff       	call   45de <mem_alloc>
    8635:	a3 e0 04 01 00       	mov    %eax,0x104e0
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    863a:	c7 44 24 04 c6 90 00 	movl   $0x90c6,0x4(%esp)
    8641:	00 
    8642:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    8649:	e8 90 bf ff ff       	call   45de <mem_alloc>
    864e:	a3 e4 04 01 00       	mov    %eax,0x104e4
		create_syn_filter(*filter);
    8653:	a1 e4 04 01 00       	mov    0x104e4,%eax
    8658:	89 04 24             	mov    %eax,(%esp)
    865b:	e8 10 fe ff ff       	call   8470 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    8660:	c7 44 24 04 c9 90 00 	movl   $0x90c9,0x4(%esp)
    8667:	00 
    8668:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    866f:	e8 6a bf ff ff       	call   45de <mem_alloc>
    8674:	a3 e8 04 01 00       	mov    %eax,0x104e8
		read_syn_window(window);
    8679:	a1 e8 04 01 00       	mov    0x104e8,%eax
    867e:	89 04 24             	mov    %eax,(%esp)
    8681:	e8 4c ff ff ff       	call   85d2 <read_syn_window>
    	//unsigned int *p = (unsigned int*)window;
    // printf(0, "Come here\n");
    // printf(0, "%x %x %x %x %x %x\n", *p, *(p+1), *(p+2), *(p+3), *(p+4), *(p+5));
		flag = 0;
    8686:	c7 05 e8 d6 00 00 00 	movl   $0x0,0xd6e8
    868d:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    8690:	8b 45 0c             	mov    0xc(%ebp),%eax
    8693:	8b 04 85 ec d6 00 00 	mov    0xd6ec(,%eax,4),%eax
    869a:	83 e8 40             	sub    $0x40,%eax
    869d:	25 ff 03 00 00       	and    $0x3ff,%eax
    86a2:	89 c2                	mov    %eax,%edx
    86a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    86a7:	89 14 85 ec d6 00 00 	mov    %edx,0xd6ec(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    86ae:	8b 15 e0 04 01 00    	mov    0x104e0,%edx
    86b4:	8b 45 0c             	mov    0xc(%ebp),%eax
    86b7:	8b 04 85 ec d6 00 00 	mov    0xd6ec(,%eax,4),%eax
    86be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    86c1:	c1 e1 0a             	shl    $0xa,%ecx
    86c4:	01 c8                	add    %ecx,%eax
    86c6:	c1 e0 03             	shl    $0x3,%eax
    86c9:	01 d0                	add    %edx,%eax
    86cb:	89 45 d8             	mov    %eax,-0x28(%ebp)
	for (i=0; i<64; i++) {
    86ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    86d5:	eb 60                	jmp    8737 <SubBandSynthesis+0x12c>
		sum = 0;
    86d7:	d9 ee                	fldz   
    86d9:	dd 5d e0             	fstpl  -0x20(%ebp)
		for (k=0; k<32; k++){
    86dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    86e3:	eb 34                	jmp    8719 <SubBandSynthesis+0x10e>
			sum += bandPtr[k] * (*filter)[i][k];
    86e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    86e8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    86ef:	8b 45 08             	mov    0x8(%ebp),%eax
    86f2:	01 d0                	add    %edx,%eax
    86f4:	dd 00                	fldl   (%eax)
    86f6:	a1 e4 04 01 00       	mov    0x104e4,%eax
    86fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
    86fe:	89 d1                	mov    %edx,%ecx
    8700:	c1 e1 05             	shl    $0x5,%ecx
    8703:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8706:	01 ca                	add    %ecx,%edx
    8708:	dd 04 d0             	fldl   (%eax,%edx,8)
    870b:	de c9                	fmulp  %st,%st(1)
    870d:	dd 45 e0             	fldl   -0x20(%ebp)
    8710:	de c1                	faddp  %st,%st(1)
    8712:	dd 5d e0             	fstpl  -0x20(%ebp)
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++){
    8715:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8719:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    871d:	7e c6                	jle    86e5 <SubBandSynthesis+0xda>
			sum += bandPtr[k] * (*filter)[i][k];
		}
		bufOffsetPtr[i] = sum;
    871f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8722:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    8729:	8b 45 d8             	mov    -0x28(%ebp),%eax
    872c:	01 d0                	add    %edx,%eax
    872e:	dd 45 e0             	fldl   -0x20(%ebp)
    8731:	dd 18                	fstpl  (%eax)
		flag = 0;
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
	for (i=0; i<64; i++) {
    8733:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8737:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
    873b:	7e 9a                	jle    86d7 <SubBandSynthesis+0xcc>
		}
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    873d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8744:	e9 eb 00 00 00       	jmp    8834 <SubBandSynthesis+0x229>
		sum = 0;
    8749:	d9 ee                	fldz   
    874b:	dd 5d e0             	fstpl  -0x20(%ebp)
		for (i=0; i<16; i++) {
    874e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8755:	eb 63                	jmp    87ba <SubBandSynthesis+0x1af>
			k = j + (i<<5);
    8757:	8b 45 f4             	mov    -0xc(%ebp),%eax
    875a:	c1 e0 05             	shl    $0x5,%eax
    875d:	89 c2                	mov    %eax,%edx
    875f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8762:	01 d0                	add    %edx,%eax
    8764:	89 45 ec             	mov    %eax,-0x14(%ebp)
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    8767:	a1 e8 04 01 00       	mov    0x104e8,%eax
    876c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    876f:	c1 e2 03             	shl    $0x3,%edx
    8772:	01 d0                	add    %edx,%eax
    8774:	dd 00                	fldl   (%eax)
    8776:	a1 e0 04 01 00       	mov    0x104e0,%eax
    877b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    877e:	83 c2 01             	add    $0x1,%edx
    8781:	d1 fa                	sar    %edx
    8783:	89 d1                	mov    %edx,%ecx
    8785:	c1 e1 06             	shl    $0x6,%ecx
    8788:	8b 55 ec             	mov    -0x14(%ebp),%edx
    878b:	01 d1                	add    %edx,%ecx
												bufOffset[channel]) & 0x3ff];
    878d:	8b 55 0c             	mov    0xc(%ebp),%edx
    8790:	8b 14 95 ec d6 00 00 	mov    0xd6ec(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    8797:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    8799:	89 d1                	mov    %edx,%ecx
    879b:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    87a1:	8b 55 0c             	mov    0xc(%ebp),%edx
    87a4:	c1 e2 0a             	shl    $0xa,%edx
    87a7:	01 ca                	add    %ecx,%edx
    87a9:	dd 04 d0             	fldl   (%eax,%edx,8)
    87ac:	de c9                	fmulp  %st,%st(1)
    87ae:	dd 45 e0             	fldl   -0x20(%ebp)
    87b1:	de c1                	faddp  %st,%st(1)
    87b3:	dd 5d e0             	fstpl  -0x20(%ebp)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    87b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    87ba:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
    87be:	7e 97                	jle    8757 <SubBandSynthesis+0x14c>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
    {
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    87c0:	dd 45 e0             	fldl   -0x20(%ebp)
    87c3:	dd 05 60 91 00 00    	fldl   0x9160
    87c9:	de c9                	fmulp  %st,%st(1)
    87cb:	d9 7d c6             	fnstcw -0x3a(%ebp)
    87ce:	0f b7 45 c6          	movzwl -0x3a(%ebp),%eax
    87d2:	b4 0c                	mov    $0xc,%ah
    87d4:	66 89 45 c4          	mov    %ax,-0x3c(%ebp)
    87d8:	d9 6d c4             	fldcw  -0x3c(%ebp)
    87db:	db 5d d4             	fistpl -0x2c(%ebp)
    87de:	d9 6d c6             	fldcw  -0x3a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    87e1:	81 7d d4 ff 7f 00 00 	cmpl   $0x7fff,-0x2c(%ebp)
    87e8:	7e 16                	jle    8800 <SubBandSynthesis+0x1f5>
    87ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    87ed:	8d 14 00             	lea    (%eax,%eax,1),%edx
    87f0:	8b 45 10             	mov    0x10(%ebp),%eax
    87f3:	01 d0                	add    %edx,%eax
    87f5:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    87fa:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    87fe:	eb 30                	jmp    8830 <SubBandSynthesis+0x225>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    8800:	81 7d d4 00 80 ff ff 	cmpl   $0xffff8000,-0x2c(%ebp)
    8807:	7d 16                	jge    881f <SubBandSynthesis+0x214>
    8809:	8b 45 f0             	mov    -0x10(%ebp),%eax
    880c:	8d 14 00             	lea    (%eax,%eax,1),%edx
    880f:	8b 45 10             	mov    0x10(%ebp),%eax
    8812:	01 d0                	add    %edx,%eax
    8814:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    8819:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    881d:	eb 11                	jmp    8830 <SubBandSynthesis+0x225>
			else                           samples[j] = foo;
    881f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8822:	8d 14 00             	lea    (%eax,%eax,1),%edx
    8825:	8b 45 10             	mov    0x10(%ebp),%eax
    8828:	01 c2                	add    %eax,%edx
    882a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    882d:	66 89 02             	mov    %ax,(%edx)
		}
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    8830:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8834:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8838:	0f 8e 0b ff ff ff    	jle    8749 <SubBandSynthesis+0x13e>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
    }
	}
    return(clip);
    883e:	8b 45 dc             	mov    -0x24(%ebp),%eax
}
    8841:	c9                   	leave  
    8842:	c3                   	ret    

00008843 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, int fd, unsigned long *psampFrames)
{
    8843:	55                   	push   %ebp
    8844:	89 e5                	mov    %esp,%ebp
    8846:	53                   	push   %ebx
    8847:	83 ec 24             	sub    $0x24,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    884a:	8b 45 10             	mov    0x10(%ebp),%eax
    884d:	8b 40 08             	mov    0x8(%eax),%eax
    8850:	89 45 e8             	mov    %eax,-0x18(%ebp)
	//int sblimit = fr_ps->sblimit;
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    8853:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    885a:	e9 d3 00 00 00       	jmp    8932 <out_fifo+0xef>
    885f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8866:	e9 b9 00 00 00       	jmp    8924 <out_fifo+0xe1>
      (*psampFrames)++;
    886b:	8b 45 18             	mov    0x18(%ebp),%eax
    886e:	8b 00                	mov    (%eax),%eax
    8870:	8d 50 01             	lea    0x1(%eax),%edx
    8873:	8b 45 18             	mov    0x18(%ebp),%eax
    8876:	89 10                	mov    %edx,(%eax)
      for (l=0;l<stereo;l++) {
    8878:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    887f:	e9 90 00 00 00       	jmp    8914 <out_fifo+0xd1>
          if (!(k%1600) && k) {
    8884:	8b 0d ec 04 01 00    	mov    0x104ec,%ecx
    888a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    888f:	89 c8                	mov    %ecx,%eax
    8891:	f7 ea                	imul   %edx
    8893:	c1 fa 09             	sar    $0x9,%edx
    8896:	89 c8                	mov    %ecx,%eax
    8898:	c1 f8 1f             	sar    $0x1f,%eax
    889b:	29 c2                	sub    %eax,%edx
    889d:	89 d0                	mov    %edx,%eax
    889f:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    88a5:	29 c1                	sub    %eax,%ecx
    88a7:	89 c8                	mov    %ecx,%eax
    88a9:	85 c0                	test   %eax,%eax
    88ab:	75 27                	jne    88d4 <out_fifo+0x91>
    88ad:	a1 ec 04 01 00       	mov    0x104ec,%eax
    88b2:	85 c0                	test   %eax,%eax
    88b4:	74 1e                	je     88d4 <out_fifo+0x91>
              // write(fd, outsamp, 3200);
              kwrite(outsamp, 3200);
    88b6:	c7 44 24 04 80 0c 00 	movl   $0xc80,0x4(%esp)
    88bd:	00 
    88be:	c7 04 24 00 05 01 00 	movl   $0x10500,(%esp)
    88c5:	e8 88 b4 ff ff       	call   3d52 <kwrite>
              //     printf(0, "\n");
              //   }
              //   printf(0, "%x%x%x%x ", (outsamp[t] >> 12) & 15, (outsamp[t] >> 8) & 15, (outsamp[t] >> 4) & 15, (outsamp[t]) & 15);
              // }
              // printf(0, "\n");
              k = 0;
    88ca:	c7 05 ec 04 01 00 00 	movl   $0x0,0x104ec
    88d1:	00 00 00 
          }
          outsamp[k++] = pcm_sample[l][i][j];
    88d4:	a1 ec 04 01 00       	mov    0x104ec,%eax
    88d9:	89 c2                	mov    %eax,%edx
    88db:	8d 42 01             	lea    0x1(%edx),%eax
    88de:	a3 ec 04 01 00       	mov    %eax,0x104ec
    88e3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    88e6:	89 c8                	mov    %ecx,%eax
    88e8:	c1 e0 03             	shl    $0x3,%eax
    88eb:	01 c8                	add    %ecx,%eax
    88ed:	c1 e0 07             	shl    $0x7,%eax
    88f0:	89 c1                	mov    %eax,%ecx
    88f2:	8b 45 08             	mov    0x8(%ebp),%eax
    88f5:	01 c8                	add    %ecx,%eax
    88f7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    88fa:	89 cb                	mov    %ecx,%ebx
    88fc:	c1 e3 05             	shl    $0x5,%ebx
    88ff:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    8902:	01 d9                	add    %ebx,%ecx
    8904:	0f b7 04 48          	movzwl (%eax,%ecx,2),%eax
    8908:	66 89 84 12 00 05 01 	mov    %ax,0x10500(%edx,%edx,1)
    890f:	00 
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
      (*psampFrames)++;
      for (l=0;l<stereo;l++) {
    8910:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8914:	8b 45 ec             	mov    -0x14(%ebp),%eax
    8917:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    891a:	0f 8c 64 ff ff ff    	jl     8884 <out_fifo+0x41>
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static short int outsamp[1600];
	static long k = 0;

  for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    8920:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    8924:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    8928:	0f 8e 3d ff ff ff    	jle    886b <out_fifo+0x28>
    892e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8932:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8935:	3b 45 0c             	cmp    0xc(%ebp),%eax
    8938:	0f 8c 21 ff ff ff    	jl     885f <out_fifo+0x1c>
              k = 0;
          }
          outsamp[k++] = pcm_sample[l][i][j];
      }
  }
}
    893e:	83 c4 24             	add    $0x24,%esp
    8941:	5b                   	pop    %ebx
    8942:	5d                   	pop    %ebp
    8943:	c3                   	ret    

00008944 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    8944:	55                   	push   %ebp
    8945:	89 e5                	mov    %esp,%ebp
    8947:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    894a:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    8951:	00 
    8952:	8b 45 08             	mov    0x8(%ebp),%eax
    8955:	89 04 24             	mov    %eax,(%esp)
    8958:	e8 6f bf ff ff       	call   48cc <getbits>
    895d:	8b 55 0c             	mov    0xc(%ebp),%edx
    8960:	89 02                	mov    %eax,(%edx)
}
    8962:	c9                   	leave  
    8963:	c3                   	ret    

00008964 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    8964:	55                   	push   %ebp
    8965:	89 e5                	mov    %esp,%ebp
    8967:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    896a:	8b 45 08             	mov    0x8(%ebp),%eax
    896d:	8b 40 0c             	mov    0xc(%eax),%eax
    8970:	83 c0 1e             	add    $0x1e,%eax
    8973:	8b 14 85 60 a6 00 00 	mov    0xa660(,%eax,4),%edx
    897a:	89 d0                	mov    %edx,%eax
    897c:	c1 e0 03             	shl    $0x3,%eax
    897f:	01 d0                	add    %edx,%eax
    8981:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    8984:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8987:	db 45 ec             	fildl  -0x14(%ebp)
    898a:	8b 45 08             	mov    0x8(%ebp),%eax
    898d:	8b 40 10             	mov    0x10(%eax),%eax
    8990:	dd 04 c5 20 a7 00 00 	fldl   0xa720(,%eax,8)
    8997:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    8999:	d9 7d ea             	fnstcw -0x16(%ebp)
    899c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    89a0:	b4 0c                	mov    $0xc,%ah
    89a2:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    89a6:	d9 6d e8             	fldcw  -0x18(%ebp)
    89a9:	db 5d fc             	fistpl -0x4(%ebp)
    89ac:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    89af:	8b 45 08             	mov    0x8(%ebp),%eax
    89b2:	8b 40 14             	mov    0x14(%eax),%eax
    89b5:	85 c0                	test   %eax,%eax
    89b7:	74 04                	je     89bd <main_data_slots+0x59>
    89b9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    89bd:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    89c1:	8b 45 08             	mov    0x8(%ebp),%eax
    89c4:	8b 40 08             	mov    0x8(%eax),%eax
    89c7:	85 c0                	test   %eax,%eax
    89c9:	74 04                	je     89cf <main_data_slots+0x6b>
		nSlots -= 2;
    89cb:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    89cf:	8b 45 10             	mov    0x10(%ebp),%eax
    89d2:	83 f8 01             	cmp    $0x1,%eax
    89d5:	75 06                	jne    89dd <main_data_slots+0x79>
		nSlots -= 17;
    89d7:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    89db:	eb 04                	jmp    89e1 <main_data_slots+0x7d>
	else
		nSlots -=32;
    89dd:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    89e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    89e4:	c9                   	leave  
    89e5:	c3                   	ret    
