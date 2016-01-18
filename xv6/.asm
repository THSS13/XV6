
_finder:     file format elf32-i386


Disassembly of section .text:

00000000 <textEditor_init>:
	char content[MAX_KEYLENGTH];
	int length;
}keyContent;

void textEditor_init(char *fileName)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
    int pid;
    char* editor_argv[] = { "textEditor_gui", fileName};
       6:	c7 45 ec 20 c5 00 00 	movl   $0xc520,-0x14(%ebp)
       d:	8b 45 08             	mov    0x8(%ebp),%eax
      10:	89 45 f0             	mov    %eax,-0x10(%ebp)

    printf(1, "init textEditor: starting editor\n");
      13:	c7 44 24 04 30 c5 00 	movl   $0xc530,0x4(%esp)
      1a:	00 
      1b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      22:	e8 90 5e 00 00       	call   5eb7 <printf>
    pid = fork();
      27:	e8 9b 5c 00 00       	call   5cc7 <fork>
      2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (pid < 0)
      2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      33:	79 19                	jns    4e <textEditor_init+0x4e>
    {
        printf(1, "init textEditor: fork failed\n");
      35:	c7 44 24 04 52 c5 00 	movl   $0xc552,0x4(%esp)
      3c:	00 
      3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      44:	e8 6e 5e 00 00       	call   5eb7 <printf>
        exit();
      49:	e8 81 5c 00 00       	call   5ccf <exit>
    }
    if (pid == 0)
      4e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      52:	75 2c                	jne    80 <textEditor_init+0x80>
    {
        exec("txtEditor_gui", editor_argv);
      54:	8d 45 ec             	lea    -0x14(%ebp),%eax
      57:	89 44 24 04          	mov    %eax,0x4(%esp)
      5b:	c7 04 24 70 c5 00 00 	movl   $0xc570,(%esp)
      62:	e8 a0 5c 00 00       	call   5d07 <exec>
        printf(1, "init textEditor: exec editor failed\n");
      67:	c7 44 24 04 80 c5 00 	movl   $0xc580,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      76:	e8 3c 5e 00 00       	call   5eb7 <printf>
        exit();
      7b:	e8 4f 5c 00 00       	call   5ccf <exit>
    }
}
      80:	c9                   	leave  
      81:	c3                   	ret    

00000082 <strstr>:
void printItemList();
void testHandlers();


char* strstr(const char *s1, const char *s2)  
{  
      82:	55                   	push   %ebp
      83:	89 e5                	mov    %esp,%ebp
      85:	83 ec 10             	sub    $0x10,%esp
	int n;  
	if (*s2)  
      88:	8b 45 0c             	mov    0xc(%ebp),%eax
      8b:	0f b6 00             	movzbl (%eax),%eax
      8e:	84 c0                	test   %al,%al
      90:	74 55                	je     e7 <strstr+0x65>
	{  
		while (*s1)  
      92:	eb 42                	jmp    d6 <strstr+0x54>
		{  
			for (n=0; *(s1 + n) == *(s2 + n); n++)  
      94:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
      9b:	eb 1b                	jmp    b8 <strstr+0x36>
			{  
				if (!*(s2 + n + 1))  
      9d:	8b 45 fc             	mov    -0x4(%ebp),%eax
      a0:	8d 50 01             	lea    0x1(%eax),%edx
      a3:	8b 45 0c             	mov    0xc(%ebp),%eax
      a6:	01 d0                	add    %edx,%eax
      a8:	0f b6 00             	movzbl (%eax),%eax
      ab:	84 c0                	test   %al,%al
      ad:	75 05                	jne    b4 <strstr+0x32>
					return (char *)s1;  
      af:	8b 45 08             	mov    0x8(%ebp),%eax
      b2:	eb 36                	jmp    ea <strstr+0x68>
	int n;  
	if (*s2)  
	{  
		while (*s1)  
		{  
			for (n=0; *(s1 + n) == *(s2 + n); n++)  
      b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
      b8:	8b 55 fc             	mov    -0x4(%ebp),%edx
      bb:	8b 45 08             	mov    0x8(%ebp),%eax
      be:	01 d0                	add    %edx,%eax
      c0:	0f b6 10             	movzbl (%eax),%edx
      c3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
      c6:	8b 45 0c             	mov    0xc(%ebp),%eax
      c9:	01 c8                	add    %ecx,%eax
      cb:	0f b6 00             	movzbl (%eax),%eax
      ce:	38 c2                	cmp    %al,%dl
      d0:	74 cb                	je     9d <strstr+0x1b>
			{  
				if (!*(s2 + n + 1))  
					return (char *)s1;  
			}  
			s1++;  
      d2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
char* strstr(const char *s1, const char *s2)  
{  
	int n;  
	if (*s2)  
	{  
		while (*s1)  
      d6:	8b 45 08             	mov    0x8(%ebp),%eax
      d9:	0f b6 00             	movzbl (%eax),%eax
      dc:	84 c0                	test   %al,%al
      de:	75 b4                	jne    94 <strstr+0x12>
				if (!*(s2 + n + 1))  
					return (char *)s1;  
			}  
			s1++;  
		}  
		return 0;  
      e0:	b8 00 00 00 00       	mov    $0x0,%eax
      e5:	eb 03                	jmp    ea <strstr+0x68>
	}  
	else  
		return (char *)s1;  
      e7:	8b 45 08             	mov    0x8(%ebp),%eax
}  
      ea:	c9                   	leave  
      eb:	c3                   	ret    

000000ec <init_keyContent>:
//         ++str2;
//     }
//     return *str1-*str2;
// }

void init_keyContent() {
      ec:	55                   	push   %ebp
      ed:	89 e5                	mov    %esp,%ebp
      ef:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
      f2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
      f9:	eb 0f                	jmp    10a <init_keyContent+0x1e>
		keyContent.content[i] = 0;
      fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
      fe:	05 6c 4b 01 00       	add    $0x14b6c,%eax
     103:	c6 00 00             	movb   $0x0,(%eax)
//     return *str1-*str2;
// }

void init_keyContent() {
	int i;
	for (i=0; i<MAX_KEYLENGTH; i++)
     106:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     10a:	83 7d fc 13          	cmpl   $0x13,-0x4(%ebp)
     10e:	7e eb                	jle    fb <init_keyContent+0xf>
		keyContent.content[i] = 0;
	keyContent.length = 0;
     110:	c7 05 80 4b 01 00 00 	movl   $0x0,0x14b80
     117:	00 00 00 
}
     11a:	c9                   	leave  
     11b:	c3                   	ret    

0000011c <draw_searchbox>:

void draw_searchbox() {
     11c:	55                   	push   %ebp
     11d:	89 e5                	mov    %esp,%ebp
     11f:	83 ec 38             	sub    $0x38,%esp
	createClickable(&cm, initRect(10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     122:	8d 45 e8             	lea    -0x18(%ebp),%eax
     125:	c7 44 24 10 20 00 00 	movl   $0x20,0x10(%esp)
     12c:	00 
     12d:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
     134:	00 
     135:	c7 44 24 08 23 00 00 	movl   $0x23,0x8(%esp)
     13c:	00 
     13d:	c7 44 24 04 a4 01 00 	movl   $0x1a4,0x4(%esp)
     144:	00 
     145:	89 04 24             	mov    %eax,(%esp)
     148:	e8 2b 52 00 00       	call   5378 <initRect>
     14d:	83 ec 04             	sub    $0x4,%esp
     150:	c7 44 24 18 a7 18 00 	movl   $0x18a7,0x18(%esp)
     157:	00 
     158:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
     15f:	00 
     160:	8b 45 e8             	mov    -0x18(%ebp),%eax
     163:	89 44 24 04          	mov    %eax,0x4(%esp)
     167:	8b 45 ec             	mov    -0x14(%ebp),%eax
     16a:	89 44 24 08          	mov    %eax,0x8(%esp)
     16e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     171:	89 44 24 0c          	mov    %eax,0xc(%esp)
     175:	8b 45 f4             	mov    -0xc(%ebp),%eax
     178:	89 44 24 10          	mov    %eax,0x10(%esp)
     17c:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
     183:	e8 dc 52 00 00       	call   5464 <createClickable>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT), MSG_LPRESS, h_searchbox);
	if (isSearching == 0) {
     188:	a1 40 42 01 00       	mov    0x14240,%eax
     18d:	85 c0                	test   %eax,%eax
     18f:	75 49                	jne    1da <draw_searchbox+0xbe>
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     191:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
     198:	00 
     199:	c7 44 24 18 20 00 00 	movl   $0x20,0x18(%esp)
     1a0:	00 
     1a1:	c7 44 24 14 64 00 00 	movl   $0x64,0x14(%esp)
     1a8:	00 
     1a9:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
     1b0:	00 
     1b1:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
     1b8:	00 
     1b9:	a1 60 4b 01 00       	mov    0x14b60,%eax
     1be:	89 04 24             	mov    %eax,(%esp)
     1c1:	a1 64 4b 01 00       	mov    0x14b64,%eax
     1c6:	89 44 24 04          	mov    %eax,0x4(%esp)
     1ca:	a1 68 4b 01 00       	mov    0x14b68,%eax
     1cf:	89 44 24 08          	mov    %eax,0x8(%esp)
     1d3:	e8 56 3d 00 00       	call   3f2e <fill_rect>
     1d8:	eb 47                	jmp    221 <draw_searchbox+0x105>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xFFFF);
	}
	else {
		fill_rect(context, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     1da:	c7 44 24 1c cc cc 00 	movl   $0xcccc,0x1c(%esp)
     1e1:	00 
     1e2:	c7 44 24 18 20 00 00 	movl   $0x20,0x18(%esp)
     1e9:	00 
     1ea:	c7 44 24 14 64 00 00 	movl   $0x64,0x14(%esp)
     1f1:	00 
     1f2:	c7 44 24 10 23 00 00 	movl   $0x23,0x10(%esp)
     1f9:	00 
     1fa:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
     201:	00 
     202:	a1 60 4b 01 00       	mov    0x14b60,%eax
     207:	89 04 24             	mov    %eax,(%esp)
     20a:	a1 64 4b 01 00       	mov    0x14b64,%eax
     20f:	89 44 24 04          	mov    %eax,0x4(%esp)
     213:	a1 68 4b 01 00       	mov    0x14b68,%eax
     218:	89 44 24 08          	mov    %eax,0x8(%esp)
     21c:	e8 0d 3d 00 00       	call   3f2e <fill_rect>
				- (BUTTON_HEIGHT + 3), 100, BUTTON_HEIGHT, 0xCCCC);
	}
}
     221:	c9                   	leave  
     222:	c3                   	ret    

00000223 <fileSortByName>:

void fileSortByName() {
     223:	55                   	push   %ebp
     224:	89 e5                	mov    %esp,%ebp
     226:	53                   	push   %ebx
     227:	83 ec 54             	sub    $0x54,%esp
	updateFileList(context);
     22a:	a1 60 4b 01 00       	mov    0x14b60,%eax
     22f:	89 04 24             	mov    %eax,(%esp)
     232:	a1 64 4b 01 00       	mov    0x14b64,%eax
     237:	89 44 24 04          	mov    %eax,0x4(%esp)
     23b:	a1 68 4b 01 00       	mov    0x14b68,%eax
     240:	89 44 24 08          	mov    %eax,0x8(%esp)
     244:	e8 81 0c 00 00       	call   eca <updateFileList>
	struct fileItem *head;
	head = fileItemList;
     249:	a1 30 14 01 00       	mov    0x11430,%eax
     24e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int tempItemCounter = 0;
     251:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    struct fileItem *first; 
    struct fileItem *t;  
    struct fileItem *p; 
    struct fileItem *q; 
  
    first = head->next; 
     258:	8b 45 f4             	mov    -0xc(%ebp),%eax
     25b:	8b 40 2c             	mov    0x2c(%eax),%eax
     25e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    head->next = 0; 
     261:	8b 45 f4             	mov    -0xc(%ebp),%eax
     264:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  
    while (first != 0) 
     26b:	e9 b8 00 00 00       	jmp    328 <fileSortByName+0x105>
    {
    	tempItemCounter++; 
     270:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
        if (flag_fileSort == 0) {
     274:	a1 28 14 01 00       	mov    0x11428,%eax
     279:	85 c0                	test   %eax,%eax
     27b:	75 41                	jne    2be <fileSortByName+0x9b>
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) < 0)); p = q, q = q->next)
     27d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     280:	89 45 e8             	mov    %eax,-0x18(%ebp)
     283:	8b 45 f4             	mov    -0xc(%ebp),%eax
     286:	89 45 e0             	mov    %eax,-0x20(%ebp)
     289:	eb 0f                	jmp    29a <fileSortByName+0x77>
     28b:	8b 45 e0             	mov    -0x20(%ebp),%eax
     28e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     291:	8b 45 e0             	mov    -0x20(%ebp),%eax
     294:	8b 40 2c             	mov    0x2c(%eax),%eax
     297:	89 45 e0             	mov    %eax,-0x20(%ebp)
     29a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     29e:	74 5d                	je     2fd <fileSortByName+0xda>
     2a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
     2a3:	8b 50 14             	mov    0x14(%eax),%edx
     2a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
     2a9:	8b 40 14             	mov    0x14(%eax),%eax
     2ac:	89 54 24 04          	mov    %edx,0x4(%esp)
     2b0:	89 04 24             	mov    %eax,(%esp)
     2b3:	e8 04 58 00 00       	call   5abc <strcmp>
     2b8:	85 c0                	test   %eax,%eax
     2ba:	78 cf                	js     28b <fileSortByName+0x68>
     2bc:	eb 3f                	jmp    2fd <fileSortByName+0xda>
	        {

	        } 
        }
        else{
	        for (t = first, q = head; ((q != 0) && (strcmp(q->name, t->name) > 0)); p = q, q = q->next)
     2be:	8b 45 ec             	mov    -0x14(%ebp),%eax
     2c1:	89 45 e8             	mov    %eax,-0x18(%ebp)
     2c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     2c7:	89 45 e0             	mov    %eax,-0x20(%ebp)
     2ca:	eb 0f                	jmp    2db <fileSortByName+0xb8>
     2cc:	8b 45 e0             	mov    -0x20(%ebp),%eax
     2cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     2d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     2d5:	8b 40 2c             	mov    0x2c(%eax),%eax
     2d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
     2db:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     2df:	74 1c                	je     2fd <fileSortByName+0xda>
     2e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     2e4:	8b 50 14             	mov    0x14(%eax),%edx
     2e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     2ea:	8b 40 14             	mov    0x14(%eax),%eax
     2ed:	89 54 24 04          	mov    %edx,0x4(%esp)
     2f1:	89 04 24             	mov    %eax,(%esp)
     2f4:	e8 c3 57 00 00       	call   5abc <strcmp>
     2f9:	85 c0                	test   %eax,%eax
     2fb:	7f cf                	jg     2cc <fileSortByName+0xa9>
	        {

	        }
        }
       
        first = first->next;  
     2fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     300:	8b 40 2c             	mov    0x2c(%eax),%eax
     303:	89 45 ec             	mov    %eax,-0x14(%ebp)
    
        if (q == head)   
     306:	8b 45 e0             	mov    -0x20(%ebp),%eax
     309:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     30c:	75 08                	jne    316 <fileSortByName+0xf3>
        {  
            head = t;  
     30e:	8b 45 e8             	mov    -0x18(%ebp),%eax
     311:	89 45 f4             	mov    %eax,-0xc(%ebp)
     314:	eb 09                	jmp    31f <fileSortByName+0xfc>
        }  
        else   
        {  
            p->next = t;  
     316:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     319:	8b 55 e8             	mov    -0x18(%ebp),%edx
     31c:	89 50 2c             	mov    %edx,0x2c(%eax)
        }  
        t->next = q; 
     31f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     322:	8b 55 e0             	mov    -0x20(%ebp),%edx
     325:	89 50 2c             	mov    %edx,0x2c(%eax)
    struct fileItem *q; 
  
    first = head->next; 
    head->next = 0; 
  
    while (first != 0) 
     328:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     32c:	0f 85 3e ff ff ff    	jne    270 <fileSortByName+0x4d>
            p->next = t;  
        }  
        t->next = q; 
    }  

    if (flag_fileSort)
     332:	a1 28 14 01 00       	mov    0x11428,%eax
     337:	85 c0                	test   %eax,%eax
     339:	74 0c                	je     347 <fileSortByName+0x124>
    	flag_fileSort = 0;
     33b:	c7 05 28 14 01 00 00 	movl   $0x0,0x11428
     342:	00 00 00 
     345:	eb 0a                	jmp    351 <fileSortByName+0x12e>
    else
    	flag_fileSort = 1;
     347:	c7 05 28 14 01 00 01 	movl   $0x1,0x11428
     34e:	00 00 00 
    p = head;
     351:	8b 45 f4             	mov    -0xc(%ebp),%eax
     354:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	while(p != 0) {
     357:	eb 5a                	jmp    3b3 <fileSortByName+0x190>
		p->pos = getPos(context, tempItemCounter--);
     359:	8b 45 f0             	mov    -0x10(%ebp),%eax
     35c:	8d 50 ff             	lea    -0x1(%eax),%edx
     35f:	89 55 f0             	mov    %edx,-0x10(%ebp)
     362:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
     365:	8d 55 c8             	lea    -0x38(%ebp),%edx
     368:	89 44 24 10          	mov    %eax,0x10(%esp)
     36c:	a1 60 4b 01 00       	mov    0x14b60,%eax
     371:	89 44 24 04          	mov    %eax,0x4(%esp)
     375:	a1 64 4b 01 00       	mov    0x14b64,%eax
     37a:	89 44 24 08          	mov    %eax,0x8(%esp)
     37e:	a1 68 4b 01 00       	mov    0x14b68,%eax
     383:	89 44 24 0c          	mov    %eax,0xc(%esp)
     387:	89 14 24             	mov    %edx,(%esp)
     38a:	e8 2a 10 00 00       	call   13b9 <getPos>
     38f:	83 ec 04             	sub    $0x4,%esp
     392:	8b 45 c8             	mov    -0x38(%ebp),%eax
     395:	89 43 18             	mov    %eax,0x18(%ebx)
     398:	8b 45 cc             	mov    -0x34(%ebp),%eax
     39b:	89 43 1c             	mov    %eax,0x1c(%ebx)
     39e:	8b 45 d0             	mov    -0x30(%ebp),%eax
     3a1:	89 43 20             	mov    %eax,0x20(%ebx)
     3a4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     3a7:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
     3aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     3ad:	8b 40 2c             	mov    0x2c(%eax),%eax
     3b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if (flag_fileSort)
    	flag_fileSort = 0;
    else
    	flag_fileSort = 1;
    p = head;
	while(p != 0) {
     3b3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     3b7:	75 a0                	jne    359 <fileSortByName+0x136>
		p->pos = getPos(context, tempItemCounter--);
		p = p->next;
	}

    fileItemList = head;
     3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3bc:	a3 30 14 01 00       	mov    %eax,0x11430
}
     3c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c4:	c9                   	leave  
     3c5:	c3                   	ret    

000003c6 <addFileItem>:

// 初始化图片浏览器
void picViewerInit(Point point, char* fileName);

// 文件项列表相关操作
void addFileItem(struct stat st, char *name, Rect pos) {
     3c6:	55                   	push   %ebp
     3c7:	89 e5                	mov    %esp,%ebp
     3c9:	53                   	push   %ebx
     3ca:	83 ec 44             	sub    $0x44,%esp
	//int i;
	struct fileItem *temp = (struct fileItem *) malloc(sizeof(struct fileItem));
     3cd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
     3d4:	e8 ca 5d 00 00       	call   61a3 <malloc>
     3d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
	temp->name = (char *) malloc(32 * sizeof(char));
     3dc:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
     3e3:	e8 bb 5d 00 00       	call   61a3 <malloc>
     3e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
     3eb:	89 42 14             	mov    %eax,0x14(%edx)
	strcpy(temp->name, name);
     3ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3f1:	8b 40 14             	mov    0x14(%eax),%eax
     3f4:	8b 55 1c             	mov    0x1c(%ebp),%edx
     3f7:	89 54 24 04          	mov    %edx,0x4(%esp)
     3fb:	89 04 24             	mov    %eax,(%esp)
     3fe:	e8 89 56 00 00       	call   5a8c <strcpy>
//    for (i = 0; name[i] != 0; i++)
//    	{
//    		printf(0, "%d : %c\n", i, name[i]);
//    	}
	//printf(0, "copying name\n");
	temp->st = st;
     403:	8b 45 f4             	mov    -0xc(%ebp),%eax
     406:	8b 55 08             	mov    0x8(%ebp),%edx
     409:	89 10                	mov    %edx,(%eax)
     40b:	8b 55 0c             	mov    0xc(%ebp),%edx
     40e:	89 50 04             	mov    %edx,0x4(%eax)
     411:	8b 55 10             	mov    0x10(%ebp),%edx
     414:	89 50 08             	mov    %edx,0x8(%eax)
     417:	8b 55 14             	mov    0x14(%ebp),%edx
     41a:	89 50 0c             	mov    %edx,0xc(%eax)
     41d:	8b 55 18             	mov    0x18(%ebp),%edx
     420:	89 50 10             	mov    %edx,0x10(%eax)
	temp->pos = getPos(context, itemCounter);
     423:	8b 15 34 14 01 00    	mov    0x11434,%edx
     429:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     42c:	8d 45 d8             	lea    -0x28(%ebp),%eax
     42f:	89 54 24 10          	mov    %edx,0x10(%esp)
     433:	8b 15 60 4b 01 00    	mov    0x14b60,%edx
     439:	89 54 24 04          	mov    %edx,0x4(%esp)
     43d:	8b 15 64 4b 01 00    	mov    0x14b64,%edx
     443:	89 54 24 08          	mov    %edx,0x8(%esp)
     447:	8b 15 68 4b 01 00    	mov    0x14b68,%edx
     44d:	89 54 24 0c          	mov    %edx,0xc(%esp)
     451:	89 04 24             	mov    %eax,(%esp)
     454:	e8 60 0f 00 00       	call   13b9 <getPos>
     459:	83 ec 04             	sub    $0x4,%esp
     45c:	8b 45 d8             	mov    -0x28(%ebp),%eax
     45f:	89 43 18             	mov    %eax,0x18(%ebx)
     462:	8b 45 dc             	mov    -0x24(%ebp),%eax
     465:	89 43 1c             	mov    %eax,0x1c(%ebx)
     468:	8b 45 e0             	mov    -0x20(%ebp),%eax
     46b:	89 43 20             	mov    %eax,0x20(%ebx)
     46e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     471:	89 43 24             	mov    %eax,0x24(%ebx)
	temp->next = fileItemList;
     474:	8b 15 30 14 01 00    	mov    0x11430,%edx
     47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47d:	89 50 2c             	mov    %edx,0x2c(%eax)
	temp->chosen = 0;
     480:	8b 45 f4             	mov    -0xc(%ebp),%eax
     483:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
	fileItemList = temp;
     48a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     48d:	a3 30 14 01 00       	mov    %eax,0x11430
}
     492:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     495:	c9                   	leave  
     496:	c3                   	ret    

00000497 <freeFileItemList>:

void freeFileItemList() {
     497:	55                   	push   %ebp
     498:	89 e5                	mov    %esp,%ebp
     49a:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
     49d:	a1 30 14 01 00       	mov    0x11430,%eax
     4a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
     4a5:	eb 28                	jmp    4cf <freeFileItemList+0x38>
		temp = p;
     4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
     4ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4b0:	8b 40 2c             	mov    0x2c(%eax),%eax
     4b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		free(temp->name);
     4b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4b9:	8b 40 14             	mov    0x14(%eax),%eax
     4bc:	89 04 24             	mov    %eax,(%esp)
     4bf:	e8 a6 5b 00 00       	call   606a <free>
		free(temp);
     4c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4c7:	89 04 24             	mov    %eax,(%esp)
     4ca:	e8 9b 5b 00 00       	call   606a <free>
}

void freeFileItemList() {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
     4cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     4d3:	75 d2                	jne    4a7 <freeFileItemList+0x10>
		temp = p;
		p = p->next;
		free(temp->name);
		free(temp);
	}
	fileItemList = 0;
     4d5:	c7 05 30 14 01 00 00 	movl   $0x0,0x11430
     4dc:	00 00 00 
}
     4df:	c9                   	leave  
     4e0:	c3                   	ret    

000004e1 <fmtname>:

// 文件信息相关操作
char* fmtname(char *path) {
     4e1:	55                   	push   %ebp
     4e2:	89 e5                	mov    %esp,%ebp
     4e4:	83 ec 28             	sub    $0x28,%esp
	//static char buf[DIRSIZ+1];
	char *p;

	// Find first character after last slash.
	for (p = path + strlen(path); p >= path && *p != '/'; p--)
     4e7:	8b 45 08             	mov    0x8(%ebp),%eax
     4ea:	89 04 24             	mov    %eax,(%esp)
     4ed:	e8 09 56 00 00       	call   5afb <strlen>
     4f2:	8b 55 08             	mov    0x8(%ebp),%edx
     4f5:	01 d0                	add    %edx,%eax
     4f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
     4fa:	eb 04                	jmp    500 <fmtname+0x1f>
     4fc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     500:	8b 45 f4             	mov    -0xc(%ebp),%eax
     503:	3b 45 08             	cmp    0x8(%ebp),%eax
     506:	72 0a                	jb     512 <fmtname+0x31>
     508:	8b 45 f4             	mov    -0xc(%ebp),%eax
     50b:	0f b6 00             	movzbl (%eax),%eax
     50e:	3c 2f                	cmp    $0x2f,%al
     510:	75 ea                	jne    4fc <fmtname+0x1b>
		;
	p++;
     512:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

	return p;
     516:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     519:	c9                   	leave  
     51a:	c3                   	ret    

0000051b <isListable>:

int isListable(char *name, short type) {
     51b:	55                   	push   %ebp
     51c:	89 e5                	mov    %esp,%ebp
     51e:	83 ec 14             	sub    $0x14,%esp
     521:	8b 45 0c             	mov    0xc(%ebp),%eax
     524:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	char *p = name;
     528:	8b 45 08             	mov    0x8(%ebp),%eax
     52b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (*p == '.') return 0;
     52e:	8b 45 fc             	mov    -0x4(%ebp),%eax
     531:	0f b6 00             	movzbl (%eax),%eax
     534:	3c 2e                	cmp    $0x2e,%al
     536:	75 07                	jne    53f <isListable+0x24>
     538:	b8 00 00 00 00       	mov    $0x0,%eax
     53d:	eb 34                	jmp    573 <isListable+0x58>
	if (type == T_DIR) return 1;
     53f:	66 83 7d ec 01       	cmpw   $0x1,-0x14(%ebp)
     544:	75 07                	jne    54d <isListable+0x32>
     546:	b8 01 00 00 00       	mov    $0x1,%eax
     54b:	eb 26                	jmp    573 <isListable+0x58>
	while (*p != 0) {
     54d:	eb 15                	jmp    564 <isListable+0x49>
		if (*p == '.')
     54f:	8b 45 fc             	mov    -0x4(%ebp),%eax
     552:	0f b6 00             	movzbl (%eax),%eax
     555:	3c 2e                	cmp    $0x2e,%al
     557:	75 07                	jne    560 <isListable+0x45>
			return 1;
     559:	b8 01 00 00 00       	mov    $0x1,%eax
     55e:	eb 13                	jmp    573 <isListable+0x58>
		p++;
     560:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int isListable(char *name, short type) {
	char *p = name;
	if (*p == '.') return 0;
	if (type == T_DIR) return 1;
	while (*p != 0) {
     564:	8b 45 fc             	mov    -0x4(%ebp),%eax
     567:	0f b6 00             	movzbl (%eax),%eax
     56a:	84 c0                	test   %al,%al
     56c:	75 e1                	jne    54f <isListable+0x34>
		if (*p == '.')
			return 1;
		p++;
	}
	return 0;
     56e:	b8 00 00 00 00       	mov    $0x0,%eax
}
     573:	c9                   	leave  
     574:	c3                   	ret    

00000575 <list>:

void list(char *path) {
     575:	55                   	push   %ebp
     576:	89 e5                	mov    %esp,%ebp
     578:	57                   	push   %edi
     579:	56                   	push   %esi
     57a:	53                   	push   %ebx
     57b:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
	char buf[512], *p;
	int fd;
	struct dirent de;
	struct stat st;

	itemCounter = 0;
     581:	c7 05 34 14 01 00 00 	movl   $0x0,0x11434
     588:	00 00 00 
	if ((fd = open(path, 0)) < 0) {
     58b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     592:	00 
     593:	8b 45 08             	mov    0x8(%ebp),%eax
     596:	89 04 24             	mov    %eax,(%esp)
     599:	e8 71 57 00 00       	call   5d0f <open>
     59e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     5a1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     5a5:	79 20                	jns    5c7 <list+0x52>
		printf(2, "ls: cannot open %s\n", path);
     5a7:	8b 45 08             	mov    0x8(%ebp),%eax
     5aa:	89 44 24 08          	mov    %eax,0x8(%esp)
     5ae:	c7 44 24 04 a5 c5 00 	movl   $0xc5a5,0x4(%esp)
     5b5:	00 
     5b6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     5bd:	e8 f5 58 00 00       	call   5eb7 <printf>
		return;
     5c2:	e9 8f 02 00 00       	jmp    856 <list+0x2e1>
	}

	if (fstat(fd, &st) < 0) {
     5c7:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     5cd:	89 44 24 04          	mov    %eax,0x4(%esp)
     5d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5d4:	89 04 24             	mov    %eax,(%esp)
     5d7:	e8 4b 57 00 00       	call   5d27 <fstat>
     5dc:	85 c0                	test   %eax,%eax
     5de:	79 2b                	jns    60b <list+0x96>
		printf(2, "ls: cannot stat %s\n", path);
     5e0:	8b 45 08             	mov    0x8(%ebp),%eax
     5e3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5e7:	c7 44 24 04 b9 c5 00 	movl   $0xc5b9,0x4(%esp)
     5ee:	00 
     5ef:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     5f6:	e8 bc 58 00 00       	call   5eb7 <printf>
		close(fd);
     5fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     5fe:	89 04 24             	mov    %eax,(%esp)
     601:	e8 f1 56 00 00       	call   5cf7 <close>
		return;
     606:	e9 4b 02 00 00       	jmp    856 <list+0x2e1>
	}

	switch (st.type) {
     60b:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     612:	98                   	cwtl   
     613:	83 f8 01             	cmp    $0x1,%eax
     616:	74 53                	je     66b <list+0xf6>
     618:	83 f8 02             	cmp    $0x2,%eax
     61b:	0f 85 2a 02 00 00    	jne    84b <list+0x2d6>
	case T_FILE:
		printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     621:	8b bd bc fd ff ff    	mov    -0x244(%ebp),%edi
     627:	8b b5 b4 fd ff ff    	mov    -0x24c(%ebp),%esi
     62d:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     634:	0f bf d8             	movswl %ax,%ebx
     637:	8b 45 08             	mov    0x8(%ebp),%eax
     63a:	89 04 24             	mov    %eax,(%esp)
     63d:	e8 9f fe ff ff       	call   4e1 <fmtname>
     642:	89 7c 24 14          	mov    %edi,0x14(%esp)
     646:	89 74 24 10          	mov    %esi,0x10(%esp)
     64a:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     64e:	89 44 24 08          	mov    %eax,0x8(%esp)
     652:	c7 44 24 04 cd c5 00 	movl   $0xc5cd,0x4(%esp)
     659:	00 
     65a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     661:	e8 51 58 00 00       	call   5eb7 <printf>
		break;
     666:	e9 e0 01 00 00       	jmp    84b <list+0x2d6>

	case T_DIR:
		if (strlen(path) + 1 + DIRSIZ + 1 > sizeof buf) {
     66b:	8b 45 08             	mov    0x8(%ebp),%eax
     66e:	89 04 24             	mov    %eax,(%esp)
     671:	e8 85 54 00 00       	call   5afb <strlen>
     676:	83 c0 10             	add    $0x10,%eax
     679:	3d 00 02 00 00       	cmp    $0x200,%eax
     67e:	76 19                	jbe    699 <list+0x124>
			printf(1, "ls: path too long\n");
     680:	c7 44 24 04 da c5 00 	movl   $0xc5da,0x4(%esp)
     687:	00 
     688:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     68f:	e8 23 58 00 00       	call   5eb7 <printf>
			break;
     694:	e9 b2 01 00 00       	jmp    84b <list+0x2d6>
		}
		strcpy(buf, path);
     699:	8b 45 08             	mov    0x8(%ebp),%eax
     69c:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6a6:	89 04 24             	mov    %eax,(%esp)
     6a9:	e8 de 53 00 00       	call   5a8c <strcpy>
		p = buf + strlen(buf);
     6ae:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     6b4:	89 04 24             	mov    %eax,(%esp)
     6b7:	e8 3f 54 00 00       	call   5afb <strlen>
     6bc:	8d 95 d0 fd ff ff    	lea    -0x230(%ebp),%edx
     6c2:	01 d0                	add    %edx,%eax
     6c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
		*p++ = '/';
     6c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     6ca:	8d 50 01             	lea    0x1(%eax),%edx
     6cd:	89 55 e0             	mov    %edx,-0x20(%ebp)
     6d0:	c6 00 2f             	movb   $0x2f,(%eax)
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     6d3:	e9 4c 01 00 00       	jmp    824 <list+0x2af>
			if (de.inum == 0)
     6d8:	0f b7 85 c0 fd ff ff 	movzwl -0x240(%ebp),%eax
     6df:	66 85 c0             	test   %ax,%ax
     6e2:	75 05                	jne    6e9 <list+0x174>
				continue;
     6e4:	e9 3b 01 00 00       	jmp    824 <list+0x2af>
			memmove(p, de.name, DIRSIZ);
     6e9:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
     6f0:	00 
     6f1:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     6f7:	83 c0 02             	add    $0x2,%eax
     6fa:	89 44 24 04          	mov    %eax,0x4(%esp)
     6fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
     701:	89 04 24             	mov    %eax,(%esp)
     704:	e8 81 55 00 00       	call   5c8a <memmove>
			p[DIRSIZ] = 0;
     709:	8b 45 e0             	mov    -0x20(%ebp),%eax
     70c:	83 c0 0e             	add    $0xe,%eax
     70f:	c6 00 00             	movb   $0x0,(%eax)
			if (stat(buf, &st) < 0) {
     712:	8d 85 ac fd ff ff    	lea    -0x254(%ebp),%eax
     718:	89 44 24 04          	mov    %eax,0x4(%esp)
     71c:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     722:	89 04 24             	mov    %eax,(%esp)
     725:	e8 c5 54 00 00       	call   5bef <stat>
     72a:	85 c0                	test   %eax,%eax
     72c:	79 23                	jns    751 <list+0x1dc>
				printf(1, "ls: cannot stat %s\n", buf);
     72e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     734:	89 44 24 08          	mov    %eax,0x8(%esp)
     738:	c7 44 24 04 b9 c5 00 	movl   $0xc5b9,0x4(%esp)
     73f:	00 
     740:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     747:	e8 6b 57 00 00       	call   5eb7 <printf>
				continue;
     74c:	e9 d3 00 00 00       	jmp    824 <list+0x2af>
			}
			if (isListable(fmtname(buf), st.type)) {
     751:	0f b7 85 ac fd ff ff 	movzwl -0x254(%ebp),%eax
     758:	0f bf d8             	movswl %ax,%ebx
     75b:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     761:	89 04 24             	mov    %eax,(%esp)
     764:	e8 78 fd ff ff       	call   4e1 <fmtname>
     769:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     76d:	89 04 24             	mov    %eax,(%esp)
     770:	e8 a6 fd ff ff       	call   51b <isListable>
     775:	85 c0                	test   %eax,%eax
     777:	0f 84 a7 00 00 00    	je     824 <list+0x2af>
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
     77d:	8b 15 34 14 01 00    	mov    0x11434,%edx
     783:	8d 45 d0             	lea    -0x30(%ebp),%eax
     786:	89 54 24 10          	mov    %edx,0x10(%esp)
     78a:	8b 15 60 4b 01 00    	mov    0x14b60,%edx
     790:	89 54 24 04          	mov    %edx,0x4(%esp)
     794:	8b 15 64 4b 01 00    	mov    0x14b64,%edx
     79a:	89 54 24 08          	mov    %edx,0x8(%esp)
     79e:	8b 15 68 4b 01 00    	mov    0x14b68,%edx
     7a4:	89 54 24 0c          	mov    %edx,0xc(%esp)
     7a8:	89 04 24             	mov    %eax,(%esp)
     7ab:	e8 09 0c 00 00       	call   13b9 <getPos>
     7b0:	83 ec 04             	sub    $0x4,%esp
     7b3:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
     7b9:	89 04 24             	mov    %eax,(%esp)
     7bc:	e8 20 fd ff ff       	call   4e1 <fmtname>
     7c1:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7c4:	89 54 24 18          	mov    %edx,0x18(%esp)
     7c8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     7cb:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     7cf:	8b 55 d8             	mov    -0x28(%ebp),%edx
     7d2:	89 54 24 20          	mov    %edx,0x20(%esp)
     7d6:	8b 55 dc             	mov    -0x24(%ebp),%edx
     7d9:	89 54 24 24          	mov    %edx,0x24(%esp)
     7dd:	89 44 24 14          	mov    %eax,0x14(%esp)
     7e1:	8b 85 ac fd ff ff    	mov    -0x254(%ebp),%eax
     7e7:	89 04 24             	mov    %eax,(%esp)
     7ea:	8b 85 b0 fd ff ff    	mov    -0x250(%ebp),%eax
     7f0:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f4:	8b 85 b4 fd ff ff    	mov    -0x24c(%ebp),%eax
     7fa:	89 44 24 08          	mov    %eax,0x8(%esp)
     7fe:	8b 85 b8 fd ff ff    	mov    -0x248(%ebp),%eax
     804:	89 44 24 0c          	mov    %eax,0xc(%esp)
     808:	8b 85 bc fd ff ff    	mov    -0x244(%ebp),%eax
     80e:	89 44 24 10          	mov    %eax,0x10(%esp)
     812:	e8 af fb ff ff       	call   3c6 <addFileItem>
				itemCounter++;
     817:	a1 34 14 01 00       	mov    0x11434,%eax
     81c:	83 c0 01             	add    $0x1,%eax
     81f:	a3 34 14 01 00       	mov    %eax,0x11434
			break;
		}
		strcpy(buf, path);
		p = buf + strlen(buf);
		*p++ = '/';
		while (read(fd, &de, sizeof(de)) == sizeof(de)) {
     824:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     82b:	00 
     82c:	8d 85 c0 fd ff ff    	lea    -0x240(%ebp),%eax
     832:	89 44 24 04          	mov    %eax,0x4(%esp)
     836:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     839:	89 04 24             	mov    %eax,(%esp)
     83c:	e8 a6 54 00 00       	call   5ce7 <read>
     841:	83 f8 10             	cmp    $0x10,%eax
     844:	0f 84 8e fe ff ff    	je     6d8 <list+0x163>
			if (isListable(fmtname(buf), st.type)) {
				addFileItem(st, fmtname(buf), getPos(context, itemCounter));
				itemCounter++;
			}
		}
		break;
     84a:	90                   	nop
	}
	close(fd);
     84b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     84e:	89 04 24             	mov    %eax,(%esp)
     851:	e8 a1 54 00 00       	call   5cf7 <close>
}
     856:	8d 65 f4             	lea    -0xc(%ebp),%esp
     859:	5b                   	pop    %ebx
     85a:	5e                   	pop    %esi
     85b:	5f                   	pop    %edi
     85c:	5d                   	pop    %ebp
     85d:	c3                   	ret    

0000085e <drawItem>:
#define FILE_ICON_BIG 0
#define FILE_ICON_SMALL 1
#define FOLDER_ICON_BIG 2
#define FOLDER_ICON_SMALL 3

void drawItem(Context context, char *name, struct stat st, Rect rect, int chosen) {
     85e:	55                   	push   %ebp
     85f:	89 e5                	mov    %esp,%ebp
     861:	53                   	push   %ebx
     862:	83 ec 34             	sub    $0x34,%esp
	//cprintf("draw finder Item: type=%d counter=%d\n", type, n);
	unsigned short nameColor;
	if (chosen == 0)
     865:	83 7d 3c 00          	cmpl   $0x0,0x3c(%ebp)
     869:	75 0b                	jne    876 <drawItem+0x18>
		nameColor = 0x0;
     86b:	66 c7 45 f6 00 00    	movw   $0x0,-0xa(%ebp)
     871:	e9 9a 00 00 00       	jmp    910 <drawItem+0xb2>
//<<<<<<< HEAD
	else if (chosen == 1)
     876:	83 7d 3c 01          	cmpl   $0x1,0x3c(%ebp)
     87a:	75 4b                	jne    8c7 <drawItem+0x69>
//=======
//	else
//>>>>>>> GUITeam1
	{
		nameColor = 0xFFFF;
     87c:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0x2110);
     882:	8b 45 38             	mov    0x38(%ebp),%eax
     885:	89 c3                	mov    %eax,%ebx
     887:	8b 45 34             	mov    0x34(%ebp),%eax
     88a:	89 c1                	mov    %eax,%ecx
     88c:	8b 45 30             	mov    0x30(%ebp),%eax
     88f:	89 c2                	mov    %eax,%edx
     891:	8b 45 2c             	mov    0x2c(%ebp),%eax
     894:	c7 44 24 1c 10 21 00 	movl   $0x2110,0x1c(%esp)
     89b:	00 
     89c:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     8a0:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     8a4:	89 54 24 10          	mov    %edx,0x10(%esp)
     8a8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8ac:	8b 45 08             	mov    0x8(%ebp),%eax
     8af:	89 04 24             	mov    %eax,(%esp)
     8b2:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b5:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b9:	8b 45 10             	mov    0x10(%ebp),%eax
     8bc:	89 44 24 08          	mov    %eax,0x8(%esp)
     8c0:	e8 69 36 00 00       	call   3f2e <fill_rect>
     8c5:	eb 49                	jmp    910 <drawItem+0xb2>
	} else
	{
		nameColor = 0xFFFF;
     8c7:	66 c7 45 f6 ff ff    	movw   $0xffff,-0xa(%ebp)
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
     8cd:	8b 45 38             	mov    0x38(%ebp),%eax
     8d0:	89 c3                	mov    %eax,%ebx
     8d2:	8b 45 34             	mov    0x34(%ebp),%eax
     8d5:	89 c1                	mov    %eax,%ecx
     8d7:	8b 45 30             	mov    0x30(%ebp),%eax
     8da:	89 c2                	mov    %eax,%edx
     8dc:	8b 45 2c             	mov    0x2c(%ebp),%eax
     8df:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     8e6:	00 
     8e7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
     8eb:	89 4c 24 14          	mov    %ecx,0x14(%esp)
     8ef:	89 54 24 10          	mov    %edx,0x10(%esp)
     8f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8f7:	8b 45 08             	mov    0x8(%ebp),%eax
     8fa:	89 04 24             	mov    %eax,(%esp)
     8fd:	8b 45 0c             	mov    0xc(%ebp),%eax
     900:	89 44 24 04          	mov    %eax,0x4(%esp)
     904:	8b 45 10             	mov    0x10(%ebp),%eax
     907:	89 44 24 08          	mov    %eax,0x8(%esp)
     90b:	e8 1e 36 00 00       	call   3f2e <fill_rect>
	}
	if (style == ICON_STYLE) {
     910:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
     915:	83 f8 01             	cmp    $0x1,%eax
     918:	0f 85 13 01 00 00    	jne    a31 <drawItem+0x1d3>
		switch (st.type) {
     91e:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     922:	98                   	cwtl   
     923:	83 f8 01             	cmp    $0x1,%eax
     926:	74 53                	je     97b <drawItem+0x11d>
     928:	83 f8 02             	cmp    $0x2,%eax
     92b:	0f 85 93 00 00 00    	jne    9c4 <drawItem+0x166>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     931:	8b 45 30             	mov    0x30(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     934:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     937:	8b 45 2c             	mov    0x2c(%ebp),%eax
		fill_rect(context, rect.start.x, rect.start.y, rect.width, rect.height, 0);
	}
	if (style == ICON_STYLE) {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
     93a:	83 c0 19             	add    $0x19,%eax
     93d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     941:	89 44 24 18          	mov    %eax,0x18(%esp)
     945:	a1 08 0b 01 00       	mov    0x10b08,%eax
     94a:	89 44 24 0c          	mov    %eax,0xc(%esp)
     94e:	a1 0c 0b 01 00       	mov    0x10b0c,%eax
     953:	89 44 24 10          	mov    %eax,0x10(%esp)
     957:	a1 10 0b 01 00       	mov    0x10b10,%eax
     95c:	89 44 24 14          	mov    %eax,0x14(%esp)
     960:	8b 45 08             	mov    0x8(%ebp),%eax
     963:	89 04 24             	mov    %eax,(%esp)
     966:	8b 45 0c             	mov    0xc(%ebp),%eax
     969:	89 44 24 04          	mov    %eax,0x4(%esp)
     96d:	8b 45 10             	mov    0x10(%ebp),%eax
     970:	89 44 24 08          	mov    %eax,0x8(%esp)
     974:	e8 54 3c 00 00       	call   45cd <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     979:	eb 49                	jmp    9c4 <drawItem+0x166>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
     97b:	8b 45 30             	mov    0x30(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     97e:	8d 50 0a             	lea    0xa(%eax),%edx
					rect.start.x + ICON_ITEM_OFFSET_X,
     981:	8b 45 2c             	mov    0x2c(%ebp),%eax
			draw_picture(context, contentRes[FILE_ICON_BIG].pic,
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_BIG].pic,
     984:	83 c0 19             	add    $0x19,%eax
     987:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     98b:	89 44 24 18          	mov    %eax,0x18(%esp)
     98f:	a1 70 0b 01 00       	mov    0x10b70,%eax
     994:	89 44 24 0c          	mov    %eax,0xc(%esp)
     998:	a1 74 0b 01 00       	mov    0x10b74,%eax
     99d:	89 44 24 10          	mov    %eax,0x10(%esp)
     9a1:	a1 78 0b 01 00       	mov    0x10b78,%eax
     9a6:	89 44 24 14          	mov    %eax,0x14(%esp)
     9aa:	8b 45 08             	mov    0x8(%ebp),%eax
     9ad:	89 04 24             	mov    %eax,(%esp)
     9b0:	8b 45 0c             	mov    0xc(%ebp),%eax
     9b3:	89 44 24 04          	mov    %eax,0x4(%esp)
     9b7:	8b 45 10             	mov    0x10(%ebp),%eax
     9ba:	89 44 24 08          	mov    %eax,0x8(%esp)
     9be:	e8 0a 3c 00 00       	call   45cd <draw_picture>
					rect.start.x + ICON_ITEM_OFFSET_X,
					rect.start.y + ICON_ITEM_OFFSET_Y);
			break;
     9c3:	90                   	nop
		}
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
     9c4:	8b 45 14             	mov    0x14(%ebp),%eax
     9c7:	89 04 24             	mov    %eax,(%esp)
     9ca:	e8 2c 51 00 00       	call   5afb <strlen>
     9cf:	89 c2                	mov    %eax,%edx
     9d1:	b8 00 00 00 00       	mov    $0x0,%eax
     9d6:	29 d0                	sub    %edx,%eax
     9d8:	c1 e0 02             	shl    $0x2,%eax
     9db:	83 c0 30             	add    $0x30,%eax
     9de:	89 45 f0             	mov    %eax,-0x10(%ebp)
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
     9e1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     9e5:	79 07                	jns    9ee <drawItem+0x190>
			indent = 0;
     9e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
     9ee:	8b 45 30             	mov    0x30(%ebp),%eax
		int indent;
		indent = ((ICON_ITEM_WIDTH / 8) - strlen(name)) * 4;
		//printf(0,"indent: %d  filenamelen: %d\n", indent, strlen(name));
		if (indent < 0)
			indent = 0;
		puts_str(context, name, nameColor, rect.start.x + indent,
     9f1:	8d 48 46             	lea    0x46(%eax),%ecx
     9f4:	8b 55 2c             	mov    0x2c(%ebp),%edx
     9f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9fa:	01 c2                	add    %eax,%edx
     9fc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     a00:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     a04:	89 54 24 14          	mov    %edx,0x14(%esp)
     a08:	89 44 24 10          	mov    %eax,0x10(%esp)
     a0c:	8b 45 14             	mov    0x14(%ebp),%eax
     a0f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a13:	8b 45 08             	mov    0x8(%ebp),%eax
     a16:	89 04 24             	mov    %eax,(%esp)
     a19:	8b 45 0c             	mov    0xc(%ebp),%eax
     a1c:	89 44 24 04          	mov    %eax,0x4(%esp)
     a20:	8b 45 10             	mov    0x10(%ebp),%eax
     a23:	89 44 24 08          	mov    %eax,0x8(%esp)
     a27:	e8 e1 3a 00 00       	call   450d <puts_str>
     a2c:	e9 33 01 00 00       	jmp    b64 <drawItem+0x306>
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
     a31:	0f b7 45 18          	movzwl 0x18(%ebp),%eax
     a35:	98                   	cwtl   
     a36:	83 f8 01             	cmp    $0x1,%eax
     a39:	0f 84 a0 00 00 00    	je     adf <drawItem+0x281>
     a3f:	83 f8 02             	cmp    $0x2,%eax
     a42:	0f 85 e0 00 00 00    	jne    b28 <drawItem+0x2ca>
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a48:	8b 45 30             	mov    0x30(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
     a4b:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     a4e:	8b 45 2c             	mov    0x2c(%ebp),%eax
		puts_str(context, name, nameColor, rect.start.x + indent,
				rect.start.y + ICON_ITEM_OFFSET_Y + ICON_HEIGHT_BIG + 10);
	} else {
		switch (st.type) {
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
     a51:	83 c0 08             	add    $0x8,%eax
     a54:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     a58:	89 44 24 18          	mov    %eax,0x18(%esp)
     a5c:	a1 3c 0b 01 00       	mov    0x10b3c,%eax
     a61:	89 44 24 0c          	mov    %eax,0xc(%esp)
     a65:	a1 40 0b 01 00       	mov    0x10b40,%eax
     a6a:	89 44 24 10          	mov    %eax,0x10(%esp)
     a6e:	a1 44 0b 01 00       	mov    0x10b44,%eax
     a73:	89 44 24 14          	mov    %eax,0x14(%esp)
     a77:	8b 45 08             	mov    0x8(%ebp),%eax
     a7a:	89 04 24             	mov    %eax,(%esp)
     a7d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a80:	89 44 24 04          	mov    %eax,0x4(%esp)
     a84:	8b 45 10             	mov    0x10(%ebp),%eax
     a87:	89 44 24 08          	mov    %eax,0x8(%esp)
     a8b:	e8 3d 3b 00 00       	call   45cd <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
     a90:	8b 45 28             	mov    0x28(%ebp),%eax
     a93:	89 04 24             	mov    %eax,(%esp)
     a96:	e8 cf 00 00 00       	call   b6a <sizeFormat>
     a9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
     a9e:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_FILE:
			draw_picture(context, contentRes[FILE_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			char *size;
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
     aa1:	8d 48 03             	lea    0x3(%eax),%ecx
     aa4:	8b 45 2c             	mov    0x2c(%ebp),%eax
     aa7:	8d 90 c8 00 00 00    	lea    0xc8(%eax),%edx
     aad:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     ab1:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     ab5:	89 54 24 14          	mov    %edx,0x14(%esp)
     ab9:	89 44 24 10          	mov    %eax,0x10(%esp)
     abd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ac0:	89 44 24 0c          	mov    %eax,0xc(%esp)
     ac4:	8b 45 08             	mov    0x8(%ebp),%eax
     ac7:	89 04 24             	mov    %eax,(%esp)
     aca:	8b 45 0c             	mov    0xc(%ebp),%eax
     acd:	89 44 24 04          	mov    %eax,0x4(%esp)
     ad1:	8b 45 10             	mov    0x10(%ebp),%eax
     ad4:	89 44 24 08          	mov    %eax,0x8(%esp)
     ad8:	e8 30 3a 00 00       	call   450d <puts_str>
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     add:	eb 49                	jmp    b28 <drawItem+0x2ca>
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     adf:	8b 45 30             	mov    0x30(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     ae2:	8d 50 03             	lea    0x3(%eax),%edx
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
     ae5:	8b 45 2c             	mov    0x2c(%ebp),%eax
			size = sizeFormat(st.size);
			puts_str(context, size, nameColor, rect.start.x + LIST_ITEM_SIZE,
					rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
     ae8:	83 c0 08             	add    $0x8,%eax
     aeb:	89 54 24 1c          	mov    %edx,0x1c(%esp)
     aef:	89 44 24 18          	mov    %eax,0x18(%esp)
     af3:	a1 a4 0b 01 00       	mov    0x10ba4,%eax
     af8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     afc:	a1 a8 0b 01 00       	mov    0x10ba8,%eax
     b01:	89 44 24 10          	mov    %eax,0x10(%esp)
     b05:	a1 ac 0b 01 00       	mov    0x10bac,%eax
     b0a:	89 44 24 14          	mov    %eax,0x14(%esp)
     b0e:	8b 45 08             	mov    0x8(%ebp),%eax
     b11:	89 04 24             	mov    %eax,(%esp)
     b14:	8b 45 0c             	mov    0xc(%ebp),%eax
     b17:	89 44 24 04          	mov    %eax,0x4(%esp)
     b1b:	8b 45 10             	mov    0x10(%ebp),%eax
     b1e:	89 44 24 08          	mov    %eax,0x8(%esp)
     b22:	e8 a6 3a 00 00       	call   45cd <draw_picture>
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
     b27:	90                   	nop
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
				rect.start.y + LIST_ITEM_OFFSET_Y);
     b28:	8b 45 30             	mov    0x30(%ebp),%eax
		case T_DIR:
			draw_picture(context, contentRes[FOLDER_ICON_SMALL].pic,
					rect.start.x + LIST_ITEM_OFFSET_X, rect.start.y + LIST_ITEM_OFFSET_Y);
			break;
		}
		puts_str(context, name, nameColor, rect.start.x + LIST_ITEM_FILENAME,
     b2b:	8d 48 03             	lea    0x3(%eax),%ecx
     b2e:	8b 45 2c             	mov    0x2c(%ebp),%eax
     b31:	8d 50 28             	lea    0x28(%eax),%edx
     b34:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
     b38:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     b3c:	89 54 24 14          	mov    %edx,0x14(%esp)
     b40:	89 44 24 10          	mov    %eax,0x10(%esp)
     b44:	8b 45 14             	mov    0x14(%ebp),%eax
     b47:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b4b:	8b 45 08             	mov    0x8(%ebp),%eax
     b4e:	89 04 24             	mov    %eax,(%esp)
     b51:	8b 45 0c             	mov    0xc(%ebp),%eax
     b54:	89 44 24 04          	mov    %eax,0x4(%esp)
     b58:	8b 45 10             	mov    0x10(%ebp),%eax
     b5b:	89 44 24 08          	mov    %eax,0x8(%esp)
     b5f:	e8 a9 39 00 00       	call   450d <puts_str>
				rect.start.y + LIST_ITEM_OFFSET_Y);
	}
}
     b64:	83 c4 34             	add    $0x34,%esp
     b67:	5b                   	pop    %ebx
     b68:	5d                   	pop    %ebp
     b69:	c3                   	ret    

00000b6a <sizeFormat>:

char *sizeFormat(uint size){
     b6a:	55                   	push   %ebp
     b6b:	89 e5                	mov    %esp,%ebp
     b6d:	53                   	push   %ebx
     b6e:	83 ec 24             	sub    $0x24,%esp
	char* result = (char *) malloc(12 * sizeof(char));
     b71:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     b78:	e8 26 56 00 00       	call   61a3 <malloc>
     b7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int n = 0;
     b80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	if (size > 0x400)
     b87:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
     b8e:	0f 86 8b 00 00 00    	jbe    c1f <sizeFormat+0xb5>
	{
		size = size / (0x400);
     b94:	8b 45 08             	mov    0x8(%ebp),%eax
     b97:	c1 e8 0a             	shr    $0xa,%eax
     b9a:	89 45 08             	mov    %eax,0x8(%ebp)
		do{
			result[n++] = (size % 10) + '0';
     b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ba0:	8d 50 01             	lea    0x1(%eax),%edx
     ba3:	89 55 f4             	mov    %edx,-0xc(%ebp)
     ba6:	89 c2                	mov    %eax,%edx
     ba8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bab:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     bae:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bb1:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     bb6:	89 c8                	mov    %ecx,%eax
     bb8:	f7 e2                	mul    %edx
     bba:	c1 ea 03             	shr    $0x3,%edx
     bbd:	89 d0                	mov    %edx,%eax
     bbf:	c1 e0 02             	shl    $0x2,%eax
     bc2:	01 d0                	add    %edx,%eax
     bc4:	01 c0                	add    %eax,%eax
     bc6:	29 c1                	sub    %eax,%ecx
     bc8:	89 ca                	mov    %ecx,%edx
     bca:	89 d0                	mov    %edx,%eax
     bcc:	83 c0 30             	add    $0x30,%eax
     bcf:	88 03                	mov    %al,(%ebx)
			size /= 10;
     bd1:	8b 45 08             	mov    0x8(%ebp),%eax
     bd4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     bd9:	f7 e2                	mul    %edx
     bdb:	89 d0                	mov    %edx,%eax
     bdd:	c1 e8 03             	shr    $0x3,%eax
     be0:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     be3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     be7:	75 b4                	jne    b9d <sizeFormat+0x33>
		result[n++] = 'K';
     be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bec:	8d 50 01             	lea    0x1(%eax),%edx
     bef:	89 55 f4             	mov    %edx,-0xc(%ebp)
     bf2:	89 c2                	mov    %eax,%edx
     bf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bf7:	01 d0                	add    %edx,%eax
     bf9:	c6 00 4b             	movb   $0x4b,(%eax)
		result[n++] = 'b';
     bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bff:	8d 50 01             	lea    0x1(%eax),%edx
     c02:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c05:	89 c2                	mov    %eax,%edx
     c07:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c0a:	01 d0                	add    %edx,%eax
     c0c:	c6 00 62             	movb   $0x62,(%eax)
		result[n] = 0;
     c0f:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c12:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c15:	01 d0                	add    %edx,%eax
     c17:	c6 00 00             	movb   $0x0,(%eax)
     c1a:	e9 a3 00 00 00       	jmp    cc2 <sizeFormat+0x158>
	}
	else
	{
		do{
			result[n++] = (size % 10) + '0';
     c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c22:	8d 50 01             	lea    0x1(%eax),%edx
     c25:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c28:	89 c2                	mov    %eax,%edx
     c2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c2d:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
     c30:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c33:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     c38:	89 c8                	mov    %ecx,%eax
     c3a:	f7 e2                	mul    %edx
     c3c:	c1 ea 03             	shr    $0x3,%edx
     c3f:	89 d0                	mov    %edx,%eax
     c41:	c1 e0 02             	shl    $0x2,%eax
     c44:	01 d0                	add    %edx,%eax
     c46:	01 c0                	add    %eax,%eax
     c48:	29 c1                	sub    %eax,%ecx
     c4a:	89 ca                	mov    %ecx,%edx
     c4c:	89 d0                	mov    %edx,%eax
     c4e:	83 c0 30             	add    $0x30,%eax
     c51:	88 03                	mov    %al,(%ebx)
			size /= 10;
     c53:	8b 45 08             	mov    0x8(%ebp),%eax
     c56:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
     c5b:	f7 e2                	mul    %edx
     c5d:	89 d0                	mov    %edx,%eax
     c5f:	c1 e8 03             	shr    $0x3,%eax
     c62:	89 45 08             	mov    %eax,0x8(%ebp)
		}while (size!=0);
     c65:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c69:	75 b4                	jne    c1f <sizeFormat+0xb5>
		result[n++] = 'b';
     c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c6e:	8d 50 01             	lea    0x1(%eax),%edx
     c71:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c74:	89 c2                	mov    %eax,%edx
     c76:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c79:	01 d0                	add    %edx,%eax
     c7b:	c6 00 62             	movb   $0x62,(%eax)
		result[n++] = 'y';
     c7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c81:	8d 50 01             	lea    0x1(%eax),%edx
     c84:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c87:	89 c2                	mov    %eax,%edx
     c89:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c8c:	01 d0                	add    %edx,%eax
     c8e:	c6 00 79             	movb   $0x79,(%eax)
		result[n++] = 't';
     c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c94:	8d 50 01             	lea    0x1(%eax),%edx
     c97:	89 55 f4             	mov    %edx,-0xc(%ebp)
     c9a:	89 c2                	mov    %eax,%edx
     c9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c9f:	01 d0                	add    %edx,%eax
     ca1:	c6 00 74             	movb   $0x74,(%eax)
		result[n++] = 'e';
     ca4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ca7:	8d 50 01             	lea    0x1(%eax),%edx
     caa:	89 55 f4             	mov    %edx,-0xc(%ebp)
     cad:	89 c2                	mov    %eax,%edx
     caf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cb2:	01 d0                	add    %edx,%eax
     cb4:	c6 00 65             	movb   $0x65,(%eax)
		result[n] = 0;
     cb7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     cba:	8b 45 f0             	mov    -0x10(%ebp),%eax
     cbd:	01 d0                	add    %edx,%eax
     cbf:	c6 00 00             	movb   $0x0,(%eax)
	}
	return result;
     cc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     cc5:	83 c4 24             	add    $0x24,%esp
     cc8:	5b                   	pop    %ebx
     cc9:	5d                   	pop    %ebp
     cca:	c3                   	ret    

00000ccb <drawFinderWnd>:
		10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }, { "rename.bmp",
		2 * BUTTON_WIDTH + 7, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
				- (BUTTON_HEIGHT + 3) }  };

void drawFinderWnd(Context context) {
     ccb:	55                   	push   %ebp
     ccc:	89 e5                	mov    %esp,%ebp
     cce:	83 ec 28             	sub    $0x28,%esp
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
     cd1:	8b 45 0c             	mov    0xc(%ebp),%eax
     cd4:	83 e8 01             	sub    $0x1,%eax
     cd7:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     cde:	00 
     cdf:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     ce6:	00 
     ce7:	89 44 24 14          	mov    %eax,0x14(%esp)
     ceb:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     cf2:	00 
     cf3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     cfa:	00 
     cfb:	8b 45 08             	mov    0x8(%ebp),%eax
     cfe:	89 04 24             	mov    %eax,(%esp)
     d01:	8b 45 0c             	mov    0xc(%ebp),%eax
     d04:	89 44 24 04          	mov    %eax,0x4(%esp)
     d08:	8b 45 10             	mov    0x10(%ebp),%eax
     d0b:	89 44 24 08          	mov    %eax,0x8(%esp)
     d0f:	e8 8f 39 00 00       	call   46a3 <draw_line>
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
     d14:	8b 45 10             	mov    0x10(%ebp),%eax

void drawFinderWnd(Context context) {
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
     d17:	8d 48 ff             	lea    -0x1(%eax),%ecx
     d1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d1d:	8d 50 ff             	lea    -0x1(%eax),%edx
     d20:	8b 45 0c             	mov    0xc(%ebp),%eax
     d23:	83 e8 01             	sub    $0x1,%eax
     d26:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     d2d:	00 
     d2e:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     d32:	89 54 24 14          	mov    %edx,0x14(%esp)
     d36:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     d3d:	00 
     d3e:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d42:	8b 45 08             	mov    0x8(%ebp),%eax
     d45:	89 04 24             	mov    %eax,(%esp)
     d48:	8b 45 0c             	mov    0xc(%ebp),%eax
     d4b:	89 44 24 04          	mov    %eax,0x4(%esp)
     d4f:	8b 45 10             	mov    0x10(%ebp),%eax
     d52:	89 44 24 08          	mov    %eax,0x8(%esp)
     d56:	e8 48 39 00 00       	call   46a3 <draw_line>
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d5b:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     d5e:	8d 48 ff             	lea    -0x1(%eax),%ecx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d61:	8b 45 0c             	mov    0xc(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     d64:	8d 50 ff             	lea    -0x1(%eax),%edx
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
     d67:	8b 45 10             	mov    0x10(%ebp),%eax
//	fill_rect(context, 0, 0, context.width, context.height, 0xFFFF);
	
	draw_line(context, 0, 0, context.width - 1, 0, BORDERLINE_COLOR);
	draw_line(context, context.width - 1, 0, context.width - 1,
			context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0,
     d6a:	83 e8 01             	sub    $0x1,%eax
     d6d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     d74:	00 
     d75:	89 4c 24 18          	mov    %ecx,0x18(%esp)
     d79:	89 54 24 14          	mov    %edx,0x14(%esp)
     d7d:	89 44 24 10          	mov    %eax,0x10(%esp)
     d81:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     d88:	00 
     d89:	8b 45 08             	mov    0x8(%ebp),%eax
     d8c:	89 04 24             	mov    %eax,(%esp)
     d8f:	8b 45 0c             	mov    0xc(%ebp),%eax
     d92:	89 44 24 04          	mov    %eax,0x4(%esp)
     d96:	8b 45 10             	mov    0x10(%ebp),%eax
     d99:	89 44 24 08          	mov    %eax,0x8(%esp)
     d9d:	e8 01 39 00 00       	call   46a3 <draw_line>
			context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
	draw_line(context, 0, context.height - 1, 0, 0, BORDERLINE_COLOR);
     da2:	8b 45 10             	mov    0x10(%ebp),%eax
     da5:	83 e8 01             	sub    $0x1,%eax
     da8:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
     daf:	00 
     db0:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
     db7:	00 
     db8:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
     dbf:	00 
     dc0:	89 44 24 10          	mov    %eax,0x10(%esp)
     dc4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     dcb:	00 
     dcc:	8b 45 08             	mov    0x8(%ebp),%eax
     dcf:	89 04 24             	mov    %eax,(%esp)
     dd2:	8b 45 0c             	mov    0xc(%ebp),%eax
     dd5:	89 44 24 04          	mov    %eax,0x4(%esp)
     dd9:	8b 45 10             	mov    0x10(%ebp),%eax
     ddc:	89 44 24 08          	mov    %eax,0x8(%esp)
     de0:	e8 be 38 00 00       	call   46a3 <draw_line>
	fill_rect(context, 1, 1, context.width - 2, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT,
     de5:	8b 45 0c             	mov    0xc(%ebp),%eax
     de8:	83 e8 02             	sub    $0x2,%eax
     deb:	c7 44 24 1c 18 c6 00 	movl   $0xc618,0x1c(%esp)
     df2:	00 
     df3:	c7 44 24 18 46 00 00 	movl   $0x46,0x18(%esp)
     dfa:	00 
     dfb:	89 44 24 14          	mov    %eax,0x14(%esp)
     dff:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     e06:	00 
     e07:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     e0e:	00 
     e0f:	8b 45 08             	mov    0x8(%ebp),%eax
     e12:	89 04 24             	mov    %eax,(%esp)
     e15:	8b 45 0c             	mov    0xc(%ebp),%eax
     e18:	89 44 24 04          	mov    %eax,0x4(%esp)
     e1c:	8b 45 10             	mov    0x10(%ebp),%eax
     e1f:	89 44 24 08          	mov    %eax,0x8(%esp)
     e23:	e8 06 31 00 00       	call   3f2e <fill_rect>
			TOOLSBAR_COLOR);
	puts_str(context, currentPath, 0, 42, 3);
     e28:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
     e2f:	00 
     e30:	c7 44 24 14 2a 00 00 	movl   $0x2a,0x14(%esp)
     e37:	00 
     e38:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     e3f:	00 
     e40:	c7 44 24 0c a0 4b 01 	movl   $0x14ba0,0xc(%esp)
     e47:	00 
     e48:	8b 45 08             	mov    0x8(%ebp),%eax
     e4b:	89 04 24             	mov    %eax,(%esp)
     e4e:	8b 45 0c             	mov    0xc(%ebp),%eax
     e51:	89 44 24 04          	mov    %eax,0x4(%esp)
     e55:	8b 45 10             	mov    0x10(%ebp),%eax
     e58:	89 44 24 08          	mov    %eax,0x8(%esp)
     e5c:	e8 ac 36 00 00       	call   450d <puts_str>
	//printf(0, "drawing window\n");
	draw_iconlist(context, wndRes, sizeof(wndRes) / sizeof(ICON));
     e61:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
     e68:	00 
     e69:	c7 44 24 0c c0 0b 01 	movl   $0x10bc0,0xc(%esp)
     e70:	00 
     e71:	8b 45 08             	mov    0x8(%ebp),%eax
     e74:	89 04 24             	mov    %eax,(%esp)
     e77:	8b 45 0c             	mov    0xc(%ebp),%eax
     e7a:	89 44 24 04          	mov    %eax,0x4(%esp)
     e7e:	8b 45 10             	mov    0x10(%ebp),%eax
     e81:	89 44 24 08          	mov    %eax,0x8(%esp)
     e85:	e8 f4 3b 00 00       	call   4a7e <draw_iconlist>
	draw_searchbox();
     e8a:	e8 8d f2 ff ff       	call   11c <draw_searchbox>
	puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
     e8f:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
     e96:	00 
     e97:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
     e9e:	00 
     e9f:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     ea6:	00 
     ea7:	c7 44 24 0c 6c 4b 01 	movl   $0x14b6c,0xc(%esp)
     eae:	00 
     eaf:	8b 45 08             	mov    0x8(%ebp),%eax
     eb2:	89 04 24             	mov    %eax,(%esp)
     eb5:	8b 45 0c             	mov    0xc(%ebp),%eax
     eb8:	89 44 24 04          	mov    %eax,0x4(%esp)
     ebc:	8b 45 10             	mov    0x10(%ebp),%eax
     ebf:	89 44 24 08          	mov    %eax,0x8(%esp)
     ec3:	e8 45 36 00 00       	call   450d <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);


}
     ec8:	c9                   	leave  
     ec9:	c3                   	ret    

00000eca <updateFileList>:

void updateFileList(Context context) {
     eca:	55                   	push   %ebp
     ecb:	89 e5                	mov    %esp,%ebp
     ecd:	53                   	push   %ebx
     ece:	83 ec 44             	sub    $0x44,%esp
	struct fileItem *p, *q;
	int tempItemCounter = 0;
     ed1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	freeFileItemList();
     ed8:	e8 ba f5 ff ff       	call   497 <freeFileItemList>
	list(".");
     edd:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
     ee4:	e8 8c f6 ff ff       	call   575 <list>
	if (keyContent.length <= 0)
     ee9:	a1 80 4b 01 00       	mov    0x14b80,%eax
     eee:	85 c0                	test   %eax,%eax
     ef0:	7f 05                	jg     ef7 <updateFileList+0x2d>
		return;
     ef2:	e9 1d 01 00 00       	jmp    1014 <updateFileList+0x14a>
	p = fileItemList;
     ef7:	a1 30 14 01 00       	mov    0x11430,%eax
     efc:	89 45 f4             	mov    %eax,-0xc(%ebp)
	q = 0;
     eff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	while(p != 0) {
     f06:	e9 9d 00 00 00       	jmp    fa8 <updateFileList+0xde>
		if(!strstr(p->name, keyContent.content)) {
     f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f0e:	8b 40 14             	mov    0x14(%eax),%eax
     f11:	c7 44 24 04 6c 4b 01 	movl   $0x14b6c,0x4(%esp)
     f18:	00 
     f19:	89 04 24             	mov    %eax,(%esp)
     f1c:	e8 61 f1 ff ff       	call   82 <strstr>
     f21:	85 c0                	test   %eax,%eax
     f23:	75 70                	jne    f95 <updateFileList+0xcb>
			if(q == 0) {
     f25:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     f29:	75 30                	jne    f5b <updateFileList+0x91>
				fileItemList = fileItemList->next;
     f2b:	a1 30 14 01 00       	mov    0x11430,%eax
     f30:	8b 40 2c             	mov    0x2c(%eax),%eax
     f33:	a3 30 14 01 00       	mov    %eax,0x11430
				free(p->name);
     f38:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f3b:	8b 40 14             	mov    0x14(%eax),%eax
     f3e:	89 04 24             	mov    %eax,(%esp)
     f41:	e8 24 51 00 00       	call   606a <free>
				free(p);
     f46:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f49:	89 04 24             	mov    %eax,(%esp)
     f4c:	e8 19 51 00 00       	call   606a <free>
				p = fileItemList;
     f51:	a1 30 14 01 00       	mov    0x11430,%eax
     f56:	89 45 f4             	mov    %eax,-0xc(%ebp)
     f59:	eb 4d                	jmp    fa8 <updateFileList+0xde>
			}
			else {
				q->next = p->next;
     f5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f5e:	8b 50 2c             	mov    0x2c(%eax),%edx
     f61:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f64:	89 50 2c             	mov    %edx,0x2c(%eax)
				p->next = 0;
     f67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f6a:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
				free(p->name);
     f71:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f74:	8b 40 14             	mov    0x14(%eax),%eax
     f77:	89 04 24             	mov    %eax,(%esp)
     f7a:	e8 eb 50 00 00       	call   606a <free>
				free(p);
     f7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f82:	89 04 24             	mov    %eax,(%esp)
     f85:	e8 e0 50 00 00       	call   606a <free>
				p = q->next;
     f8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f8d:	8b 40 2c             	mov    0x2c(%eax),%eax
     f90:	89 45 f4             	mov    %eax,-0xc(%ebp)
     f93:	eb 13                	jmp    fa8 <updateFileList+0xde>
			}
		}
		else {
			tempItemCounter++;
     f95:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
			q = p;
     f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p = p->next;
     f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fa2:	8b 40 2c             	mov    0x2c(%eax),%eax
     fa5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	list(".");
	if (keyContent.length <= 0)
		return;
	p = fileItemList;
	q = 0;
	while(p != 0) {
     fa8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     fac:	0f 85 59 ff ff ff    	jne    f0b <updateFileList+0x41>
			tempItemCounter++;
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
     fb2:	a1 30 14 01 00       	mov    0x11430,%eax
     fb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0) {
     fba:	eb 52                	jmp    100e <updateFileList+0x144>
		p->pos = getPos(context, --tempItemCounter);
     fbc:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
     fc0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     fc3:	8d 45 d8             	lea    -0x28(%ebp),%eax
     fc6:	8b 55 ec             	mov    -0x14(%ebp),%edx
     fc9:	89 54 24 10          	mov    %edx,0x10(%esp)
     fcd:	8b 55 08             	mov    0x8(%ebp),%edx
     fd0:	89 54 24 04          	mov    %edx,0x4(%esp)
     fd4:	8b 55 0c             	mov    0xc(%ebp),%edx
     fd7:	89 54 24 08          	mov    %edx,0x8(%esp)
     fdb:	8b 55 10             	mov    0x10(%ebp),%edx
     fde:	89 54 24 0c          	mov    %edx,0xc(%esp)
     fe2:	89 04 24             	mov    %eax,(%esp)
     fe5:	e8 cf 03 00 00       	call   13b9 <getPos>
     fea:	83 ec 04             	sub    $0x4,%esp
     fed:	8b 45 d8             	mov    -0x28(%ebp),%eax
     ff0:	89 43 18             	mov    %eax,0x18(%ebx)
     ff3:	8b 45 dc             	mov    -0x24(%ebp),%eax
     ff6:	89 43 1c             	mov    %eax,0x1c(%ebx)
     ff9:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ffc:	89 43 20             	mov    %eax,0x20(%ebx)
     fff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1002:	89 43 24             	mov    %eax,0x24(%ebx)
		p = p->next;
    1005:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1008:	8b 40 2c             	mov    0x2c(%eax),%eax
    100b:	89 45 f4             	mov    %eax,-0xc(%ebp)
			q = p;
			p = p->next;
		}
	}
	p = fileItemList;
	while(p != 0) {
    100e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1012:	75 a8                	jne    fbc <updateFileList+0xf2>
		p->pos = getPos(context, --tempItemCounter);
		p = p->next;
	}
}
    1014:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1017:	c9                   	leave  
    1018:	c3                   	ret    

00001019 <drawFinderContent>:

void drawFinderContent(Context context) {
    1019:	55                   	push   %ebp
    101a:	89 e5                	mov    %esp,%ebp
    101c:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p;
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
    101f:	c7 45 f0 46 00 00 00 	movl   $0x46,-0x10(%ebp)
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
    1026:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    102b:	83 f8 02             	cmp    $0x2,%eax
    102e:	75 04                	jne    1034 <drawFinderContent+0x1b>
    1030:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
    1034:	8b 45 10             	mov    0x10(%ebp),%eax
    1037:	83 e8 48             	sub    $0x48,%eax
	//int tempItemCounter = 0;
	//printf(0, "listing contents\n");

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
    103a:	89 c1                	mov    %eax,%ecx
    103c:	8b 45 0c             	mov    0xc(%ebp),%eax
    103f:	83 e8 02             	sub    $0x2,%eax
    1042:	89 c2                	mov    %eax,%edx
    1044:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1047:	c7 44 24 1c ff ff 00 	movl   $0xffff,0x1c(%esp)
    104e:	00 
    104f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1053:	89 54 24 14          	mov    %edx,0x14(%esp)
    1057:	89 44 24 10          	mov    %eax,0x10(%esp)
    105b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1062:	00 
    1063:	8b 45 08             	mov    0x8(%ebp),%eax
    1066:	89 04 24             	mov    %eax,(%esp)
    1069:	8b 45 0c             	mov    0xc(%ebp),%eax
    106c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1070:	8b 45 10             	mov    0x10(%ebp),%eax
    1073:	89 44 24 08          	mov    %eax,0x8(%esp)
    1077:	e8 b2 2e 00 00       	call   3f2e <fill_rect>
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
    107c:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
    107f:	8d 48 ff             	lea    -0x1(%eax),%ecx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
    1082:	8b 45 0c             	mov    0xc(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
    1085:	8d 50 ff             	lea    -0x1(%eax),%edx
				context.height - 1, context.width - 1, context.height - 1, BORDERLINE_COLOR);
    1088:	8b 45 10             	mov    0x10(%ebp),%eax

	int contentTop = TOPBAR_HEIGHT + TOOLSBAR_HEIGHT;
	if (style == LIST_STYLE) contentTop += TAGBAR_HEIGHT;
	fill_rect(context, 1, contentTop, context.width - 2,
			context.height - (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - 2, 0xFFFF);
	draw_line(context, 0,
    108b:	83 e8 01             	sub    $0x1,%eax
    108e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    1095:	00 
    1096:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    109a:	89 54 24 14          	mov    %edx,0x14(%esp)
    109e:	89 44 24 10          	mov    %eax,0x10(%esp)
    10a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    10a9:	00 
    10aa:	8b 45 08             	mov    0x8(%ebp),%eax
    10ad:	89 04 24             	mov    %eax,(%esp)
    10b0:	8b 45 0c             	mov    0xc(%ebp),%eax
    10b3:	89 44 24 04          	mov    %eax,0x4(%esp)
    10b7:	8b 45 10             	mov    0x10(%ebp),%eax
    10ba:	89 44 24 08          	mov    %eax,0x8(%esp)
    10be:	e8 e0 35 00 00       	call   46a3 <draw_line>
//	q = 0;
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
    10c3:	a1 30 14 01 00       	mov    0x11430,%eax
    10c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
		while (p != 0) {
    10cb:	eb 7a                	jmp    1147 <drawFinderContent+0x12e>
			//printf(0, "draw item\n");
			drawItem(context, p->name, p->st, p->pos, p->chosen);
    10cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10d0:	8b 40 28             	mov    0x28(%eax),%eax
    10d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    10d6:	8b 52 14             	mov    0x14(%edx),%edx
    10d9:	89 44 24 34          	mov    %eax,0x34(%esp)
    10dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e0:	8b 48 18             	mov    0x18(%eax),%ecx
    10e3:	89 4c 24 24          	mov    %ecx,0x24(%esp)
    10e7:	8b 48 1c             	mov    0x1c(%eax),%ecx
    10ea:	89 4c 24 28          	mov    %ecx,0x28(%esp)
    10ee:	8b 48 20             	mov    0x20(%eax),%ecx
    10f1:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
    10f5:	8b 40 24             	mov    0x24(%eax),%eax
    10f8:	89 44 24 30          	mov    %eax,0x30(%esp)
    10fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ff:	8b 08                	mov    (%eax),%ecx
    1101:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    1105:	8b 48 04             	mov    0x4(%eax),%ecx
    1108:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    110c:	8b 48 08             	mov    0x8(%eax),%ecx
    110f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    1113:	8b 48 0c             	mov    0xc(%eax),%ecx
    1116:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    111a:	8b 40 10             	mov    0x10(%eax),%eax
    111d:	89 44 24 20          	mov    %eax,0x20(%esp)
    1121:	89 54 24 0c          	mov    %edx,0xc(%esp)
    1125:	8b 45 08             	mov    0x8(%ebp),%eax
    1128:	89 04 24             	mov    %eax,(%esp)
    112b:	8b 45 0c             	mov    0xc(%ebp),%eax
    112e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1132:	8b 45 10             	mov    0x10(%ebp),%eax
    1135:	89 44 24 08          	mov    %eax,0x8(%esp)
    1139:	e8 20 f7 ff ff       	call   85e <drawItem>
			p = p->next;
    113e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1141:	8b 40 2c             	mov    0x2c(%eax),%eax
    1144:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// if (keyContent.length == 0) {
	// 	printf(0, "currently no searching pattern, so it should display all the files!\ndon't you think so?\n");
//		freeFileItemList();
//		list(".");
		p = fileItemList;
		while (p != 0) {
    1147:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    114b:	75 80                	jne    10cd <drawFinderContent+0xb4>
	// 		p = p->next;
			
	// 	}
	// }

	if (style == LIST_STYLE)
    114d:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    1152:	83 f8 02             	cmp    $0x2,%eax
    1155:	0f 85 39 01 00 00    	jne    1294 <drawFinderContent+0x27b>
		{
			fill_rect(context, 1, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_FILENAME - 2, TAGBAR_HEIGHT, TAGBAR_COLOR);
    115b:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    1162:	00 
    1163:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    116a:	00 
    116b:	c7 44 24 14 26 00 00 	movl   $0x26,0x14(%esp)
    1172:	00 
    1173:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    117a:	00 
    117b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    1182:	00 
    1183:	8b 45 08             	mov    0x8(%ebp),%eax
    1186:	89 04 24             	mov    %eax,(%esp)
    1189:	8b 45 0c             	mov    0xc(%ebp),%eax
    118c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1190:	8b 45 10             	mov    0x10(%ebp),%eax
    1193:	89 44 24 08          	mov    %eax,0x8(%esp)
    1197:	e8 92 2d 00 00       	call   3f2e <fill_rect>
			fill_rect(context, LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    119c:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    11a3:	00 
    11a4:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    11ab:	00 
    11ac:	c7 44 24 14 9f 00 00 	movl   $0x9f,0x14(%esp)
    11b3:	00 
    11b4:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    11bb:	00 
    11bc:	c7 44 24 0c 28 00 00 	movl   $0x28,0xc(%esp)
    11c3:	00 
    11c4:	8b 45 08             	mov    0x8(%ebp),%eax
    11c7:	89 04 24             	mov    %eax,(%esp)
    11ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    11d1:	8b 45 10             	mov    0x10(%ebp),%eax
    11d4:	89 44 24 08          	mov    %eax,0x8(%esp)
    11d8:	e8 51 2d 00 00       	call   3f2e <fill_rect>
			fill_rect(context, LIST_ITEM_SIZE, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, context.width - LIST_ITEM_SIZE - 1, TAGBAR_HEIGHT, TAGBAR_COLOR);
    11dd:	8b 45 0c             	mov    0xc(%ebp),%eax
    11e0:	2d c9 00 00 00       	sub    $0xc9,%eax
    11e5:	c7 44 24 1c 14 a5 00 	movl   $0xa514,0x1c(%esp)
    11ec:	00 
    11ed:	c7 44 24 18 1c 00 00 	movl   $0x1c,0x18(%esp)
    11f4:	00 
    11f5:	89 44 24 14          	mov    %eax,0x14(%esp)
    11f9:	c7 44 24 10 47 00 00 	movl   $0x47,0x10(%esp)
    1200:	00 
    1201:	c7 44 24 0c c8 00 00 	movl   $0xc8,0xc(%esp)
    1208:	00 
    1209:	8b 45 08             	mov    0x8(%ebp),%eax
    120c:	89 04 24             	mov    %eax,(%esp)
    120f:	8b 45 0c             	mov    0xc(%ebp),%eax
    1212:	89 44 24 04          	mov    %eax,0x4(%esp)
    1216:	8b 45 10             	mov    0x10(%ebp),%eax
    1219:	89 44 24 08          	mov    %eax,0x8(%esp)
    121d:	e8 0c 2d 00 00       	call   3f2e <fill_rect>
			puts_str(context, "Name", 0, LIST_ITEM_FILENAME + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    1222:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    1229:	00 
    122a:	c7 44 24 14 2b 00 00 	movl   $0x2b,0x14(%esp)
    1231:	00 
    1232:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1239:	00 
    123a:	c7 44 24 0c ef c5 00 	movl   $0xc5ef,0xc(%esp)
    1241:	00 
    1242:	8b 45 08             	mov    0x8(%ebp),%eax
    1245:	89 04 24             	mov    %eax,(%esp)
    1248:	8b 45 0c             	mov    0xc(%ebp),%eax
    124b:	89 44 24 04          	mov    %eax,0x4(%esp)
    124f:	8b 45 10             	mov    0x10(%ebp),%eax
    1252:	89 44 24 08          	mov    %eax,0x8(%esp)
    1256:	e8 b2 32 00 00       	call   450d <puts_str>
			puts_str(context, "Size", 0, LIST_ITEM_SIZE + 3, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - 18);
    125b:	c7 44 24 18 50 00 00 	movl   $0x50,0x18(%esp)
    1262:	00 
    1263:	c7 44 24 14 cb 00 00 	movl   $0xcb,0x14(%esp)
    126a:	00 
    126b:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    1272:	00 
    1273:	c7 44 24 0c f4 c5 00 	movl   $0xc5f4,0xc(%esp)
    127a:	00 
    127b:	8b 45 08             	mov    0x8(%ebp),%eax
    127e:	89 04 24             	mov    %eax,(%esp)
    1281:	8b 45 0c             	mov    0xc(%ebp),%eax
    1284:	89 44 24 04          	mov    %eax,0x4(%esp)
    1288:	8b 45 10             	mov    0x10(%ebp),%eax
    128b:	89 44 24 08          	mov    %eax,0x8(%esp)
    128f:	e8 79 32 00 00       	call   450d <puts_str>
		}
}
    1294:	c9                   	leave  
    1295:	c3                   	ret    

00001296 <int2str>:

char * int2str(int i)
{
    1296:	55                   	push   %ebp
    1297:	89 e5                	mov    %esp,%ebp
    1299:	53                   	push   %ebx
    129a:	83 ec 24             	sub    $0x24,%esp
	int j;
	int n = 0;
    129d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	char *result = (char *)malloc(4*sizeof(char));
    12a4:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    12ab:	e8 f3 4e 00 00       	call   61a3 <malloc>
    12b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
	char *temp = (char *)malloc(4*sizeof(char));
    12b3:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    12ba:	e8 e4 4e 00 00       	call   61a3 <malloc>
    12bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
	do{
		result[n++] = (i % 10) + '0';
    12c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12c5:	8d 50 01             	lea    0x1(%eax),%edx
    12c8:	89 55 f0             	mov    %edx,-0x10(%ebp)
    12cb:	89 c2                	mov    %eax,%edx
    12cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    12d0:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    12d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    12d6:	ba 67 66 66 66       	mov    $0x66666667,%edx
    12db:	89 c8                	mov    %ecx,%eax
    12dd:	f7 ea                	imul   %edx
    12df:	c1 fa 02             	sar    $0x2,%edx
    12e2:	89 c8                	mov    %ecx,%eax
    12e4:	c1 f8 1f             	sar    $0x1f,%eax
    12e7:	29 c2                	sub    %eax,%edx
    12e9:	89 d0                	mov    %edx,%eax
    12eb:	c1 e0 02             	shl    $0x2,%eax
    12ee:	01 d0                	add    %edx,%eax
    12f0:	01 c0                	add    %eax,%eax
    12f2:	29 c1                	sub    %eax,%ecx
    12f4:	89 ca                	mov    %ecx,%edx
    12f6:	89 d0                	mov    %edx,%eax
    12f8:	83 c0 30             	add    $0x30,%eax
    12fb:	88 03                	mov    %al,(%ebx)
		i /= 10;
    12fd:	8b 4d 08             	mov    0x8(%ebp),%ecx
    1300:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1305:	89 c8                	mov    %ecx,%eax
    1307:	f7 ea                	imul   %edx
    1309:	c1 fa 02             	sar    $0x2,%edx
    130c:	89 c8                	mov    %ecx,%eax
    130e:	c1 f8 1f             	sar    $0x1f,%eax
    1311:	29 c2                	sub    %eax,%edx
    1313:	89 d0                	mov    %edx,%eax
    1315:	89 45 08             	mov    %eax,0x8(%ebp)
	}while (i!=0);
    1318:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    131c:	75 a4                	jne    12c2 <int2str+0x2c>
	result[n] = 0;
    131e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    1321:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1324:	01 d0                	add    %edx,%eax
    1326:	c6 00 00             	movb   $0x0,(%eax)

	for (j = 0; j < n; j++)
    1329:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1330:	eb 21                	jmp    1353 <int2str+0xbd>
	{
		temp[j] = result[n-1-j];
    1332:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1335:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1338:	01 c2                	add    %eax,%edx
    133a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    133d:	83 e8 01             	sub    $0x1,%eax
    1340:	2b 45 f4             	sub    -0xc(%ebp),%eax
    1343:	89 c1                	mov    %eax,%ecx
    1345:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1348:	01 c8                	add    %ecx,%eax
    134a:	0f b6 00             	movzbl (%eax),%eax
    134d:	88 02                	mov    %al,(%edx)
		result[n++] = (i % 10) + '0';
		i /= 10;
	}while (i!=0);
	result[n] = 0;

	for (j = 0; j < n; j++)
    134f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1353:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1356:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    1359:	7c d7                	jl     1332 <int2str+0x9c>
	{
		temp[j] = result[n-1-j];
	}
	temp[n] = 0;
    135b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    135e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1361:	01 d0                	add    %edx,%eax
    1363:	c6 00 00             	movb   $0x0,(%eax)
	free(result);
    1366:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1369:	89 04 24             	mov    %eax,(%esp)
    136c:	e8 f9 4c 00 00       	call   606a <free>
	return temp;
    1371:	8b 45 e8             	mov    -0x18(%ebp),%eax
}
    1374:	83 c4 24             	add    $0x24,%esp
    1377:	5b                   	pop    %ebx
    1378:	5d                   	pop    %ebp
    1379:	c3                   	ret    

0000137a <printItemList>:

void printItemList() {
    137a:	55                   	push   %ebp
    137b:	89 e5                	mov    %esp,%ebp
    137d:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *p;
	p = fileItemList;
    1380:	a1 30 14 01 00       	mov    0x11430,%eax
    1385:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1388:	eb 27                	jmp    13b1 <printItemList+0x37>
		printf(0, "%s\n", p->name);
    138a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    138d:	8b 40 14             	mov    0x14(%eax),%eax
    1390:	89 44 24 08          	mov    %eax,0x8(%esp)
    1394:	c7 44 24 04 f9 c5 00 	movl   $0xc5f9,0x4(%esp)
    139b:	00 
    139c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    13a3:	e8 0f 4b 00 00       	call   5eb7 <printf>
		p = p->next;
    13a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ab:	8b 40 2c             	mov    0x2c(%eax),%eax
    13ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void printItemList() {
	struct fileItem *p;
	p = fileItemList;
	while (p != 0) {
    13b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    13b5:	75 d3                	jne    138a <printItemList+0x10>
		printf(0, "%s\n", p->name);
		p = p->next;
	}
}
    13b7:	c9                   	leave  
    13b8:	c3                   	ret    

000013b9 <getPos>:

Rect getPos(Context context, int n) {
    13b9:	55                   	push   %ebp
    13ba:	89 e5                	mov    %esp,%ebp
    13bc:	83 ec 48             	sub    $0x48,%esp
	if (style == ICON_STYLE) {
    13bf:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    13c4:	83 f8 01             	cmp    $0x1,%eax
    13c7:	0f 85 80 00 00 00    	jne    144d <getPos+0x94>
		int m = context.width / (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    13cd:	8b 4d 10             	mov    0x10(%ebp),%ecx
    13d0:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
    13d5:	89 c8                	mov    %ecx,%eax
    13d7:	f7 ea                	imul   %edx
    13d9:	c1 fa 06             	sar    $0x6,%edx
    13dc:	89 c8                	mov    %ecx,%eax
    13de:	c1 f8 1f             	sar    $0x1f,%eax
    13e1:	29 c2                	sub    %eax,%edx
    13e3:	89 d0                	mov    %edx,%eax
    13e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
		int r = n / m;
    13e8:	8b 45 18             	mov    0x18(%ebp),%eax
    13eb:	99                   	cltd   
    13ec:	f7 7d f4             	idivl  -0xc(%ebp)
    13ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
		int c = n % m;
    13f2:	8b 45 18             	mov    0x18(%ebp),%eax
    13f5:	99                   	cltd   
    13f6:	f7 7d f4             	idivl  -0xc(%ebp)
    13f9:	89 55 ec             	mov    %edx,-0x14(%ebp)
		int y_top = r * (ICON_ITEM_HEIGHT + ICON_ITEM_GAP_Y)+ TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + ICON_ITEM_GAP_Y;
    13fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    13ff:	6b c0 73             	imul   $0x73,%eax,%eax
    1402:	83 c0 5a             	add    $0x5a,%eax
    1405:	89 45 e8             	mov    %eax,-0x18(%ebp)
		int x_left = c * (ICON_ITEM_WIDTH + ICON_ITEM_GAP_X);
    1408:	8b 45 ec             	mov    -0x14(%ebp),%eax
    140b:	01 c0                	add    %eax,%eax
    140d:	89 c2                	mov    %eax,%edx
    140f:	c1 e2 06             	shl    $0x6,%edx
    1412:	01 d0                	add    %edx,%eax
    1414:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		return initRect(x_left, y_top + scrollOffset, ICON_ITEM_WIDTH,
    1417:	8b 15 20 14 01 00    	mov    0x11420,%edx
    141d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1420:	01 c2                	add    %eax,%edx
    1422:	8b 45 08             	mov    0x8(%ebp),%eax
    1425:	c7 44 24 10 5f 00 00 	movl   $0x5f,0x10(%esp)
    142c:	00 
    142d:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
    1434:	00 
    1435:	89 54 24 08          	mov    %edx,0x8(%esp)
    1439:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    143c:	89 54 24 04          	mov    %edx,0x4(%esp)
    1440:	89 04 24             	mov    %eax,(%esp)
    1443:	e8 30 3f 00 00       	call   5378 <initRect>
    1448:	83 ec 04             	sub    $0x4,%esp
    144b:	eb 3d                	jmp    148a <getPos+0xd1>
				ICON_ITEM_HEIGHT);
	} else {
		return initRect(0, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT + n * (LIST_ITEM_HEIGHT + LIST_ITEM_GAP) + scrollOffset, context.width,
    144d:	8b 4d 10             	mov    0x10(%ebp),%ecx
    1450:	8b 55 18             	mov    0x18(%ebp),%edx
    1453:	89 d0                	mov    %edx,%eax
    1455:	c1 e0 05             	shl    $0x5,%eax
    1458:	29 d0                	sub    %edx,%eax
    145a:	8d 50 62             	lea    0x62(%eax),%edx
    145d:	a1 20 14 01 00       	mov    0x11420,%eax
    1462:	01 c2                	add    %eax,%edx
    1464:	8b 45 08             	mov    0x8(%ebp),%eax
    1467:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    146e:	00 
    146f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    1473:	89 54 24 08          	mov    %edx,0x8(%esp)
    1477:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    147e:	00 
    147f:	89 04 24             	mov    %eax,(%esp)
    1482:	e8 f1 3e 00 00       	call   5378 <initRect>
    1487:	83 ec 04             	sub    $0x4,%esp
				LIST_ITEM_HEIGHT);
	}
}
    148a:	8b 45 08             	mov    0x8(%ebp),%eax
    148d:	c9                   	leave  
    148e:	c2 04 00             	ret    $0x4

00001491 <addItemEvent>:

// 事件处理相关操作
void addItemEvent(ClickableManager *cm, struct fileItem item) {
    1491:	55                   	push   %ebp
    1492:	89 e5                	mov    %esp,%ebp
    1494:	83 ec 28             	sub    $0x28,%esp
	if (style == ICON_STYLE) {
    1497:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    149c:	83 f8 01             	cmp    $0x1,%eax
    149f:	75 0d                	jne    14ae <addItemEvent+0x1d>
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)
    14a1:	8b 45 28             	mov    0x28(%ebp),%eax
    14a4:	83 f8 45             	cmp    $0x45,%eax
    14a7:	7f 12                	jg     14bb <addItemEvent+0x2a>
			return;
    14a9:	e9 17 01 00 00       	jmp    15c5 <addItemEvent+0x134>
	} else {
		if (item.pos.start.y < TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)
    14ae:	8b 45 28             	mov    0x28(%ebp),%eax
    14b1:	83 f8 61             	cmp    $0x61,%eax
    14b4:	7f 05                	jg     14bb <addItemEvent+0x2a>
			return;
    14b6:	e9 0a 01 00 00       	jmp    15c5 <addItemEvent+0x134>
	}
	switch (item.st.type) {
    14bb:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
    14bf:	98                   	cwtl   
    14c0:	83 f8 01             	cmp    $0x1,%eax
    14c3:	74 7c                	je     1541 <addItemEvent+0xb0>
    14c5:	83 f8 02             	cmp    $0x2,%eax
    14c8:	0f 85 e3 00 00 00    	jne    15b1 <addItemEvent+0x120>
	case T_FILE:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    14ce:	c7 44 24 18 51 30 00 	movl   $0x3051,0x18(%esp)
    14d5:	00 
    14d6:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    14dd:	00 
    14de:	8b 45 24             	mov    0x24(%ebp),%eax
    14e1:	89 44 24 04          	mov    %eax,0x4(%esp)
    14e5:	8b 45 28             	mov    0x28(%ebp),%eax
    14e8:	89 44 24 08          	mov    %eax,0x8(%esp)
    14ec:	8b 45 2c             	mov    0x2c(%ebp),%eax
    14ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
    14f3:	8b 45 30             	mov    0x30(%ebp),%eax
    14f6:	89 44 24 10          	mov    %eax,0x10(%esp)
    14fa:	8b 45 08             	mov    0x8(%ebp),%eax
    14fd:	89 04 24             	mov    %eax,(%esp)
    1500:	e8 5f 3f 00 00       	call   5464 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_openFile);
    1505:	c7 44 24 18 21 31 00 	movl   $0x3121,0x18(%esp)
    150c:	00 
    150d:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    1514:	00 
    1515:	8b 45 24             	mov    0x24(%ebp),%eax
    1518:	89 44 24 04          	mov    %eax,0x4(%esp)
    151c:	8b 45 28             	mov    0x28(%ebp),%eax
    151f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1523:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1526:	89 44 24 0c          	mov    %eax,0xc(%esp)
    152a:	8b 45 30             	mov    0x30(%ebp),%eax
    152d:	89 44 24 10          	mov    %eax,0x10(%esp)
    1531:	8b 45 08             	mov    0x8(%ebp),%eax
    1534:	89 04 24             	mov    %eax,(%esp)
    1537:	e8 28 3f 00 00       	call   5464 <createClickable>
		break;
    153c:	e9 84 00 00 00       	jmp    15c5 <addItemEvent+0x134>
	case T_DIR:
		createClickable(cm, item.pos, MSG_LPRESS, h_chooseFile);
    1541:	c7 44 24 18 51 30 00 	movl   $0x3051,0x18(%esp)
    1548:	00 
    1549:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    1550:	00 
    1551:	8b 45 24             	mov    0x24(%ebp),%eax
    1554:	89 44 24 04          	mov    %eax,0x4(%esp)
    1558:	8b 45 28             	mov    0x28(%ebp),%eax
    155b:	89 44 24 08          	mov    %eax,0x8(%esp)
    155f:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1562:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1566:	8b 45 30             	mov    0x30(%ebp),%eax
    1569:	89 44 24 10          	mov    %eax,0x10(%esp)
    156d:	8b 45 08             	mov    0x8(%ebp),%eax
    1570:	89 04 24             	mov    %eax,(%esp)
    1573:	e8 ec 3e 00 00       	call   5464 <createClickable>
		createClickable(cm, item.pos, MSG_DOUBLECLICK, h_enterDir);
    1578:	c7 44 24 18 bf 1d 00 	movl   $0x1dbf,0x18(%esp)
    157f:	00 
    1580:	c7 44 24 14 04 00 00 	movl   $0x4,0x14(%esp)
    1587:	00 
    1588:	8b 45 24             	mov    0x24(%ebp),%eax
    158b:	89 44 24 04          	mov    %eax,0x4(%esp)
    158f:	8b 45 28             	mov    0x28(%ebp),%eax
    1592:	89 44 24 08          	mov    %eax,0x8(%esp)
    1596:	8b 45 2c             	mov    0x2c(%ebp),%eax
    1599:	89 44 24 0c          	mov    %eax,0xc(%esp)
    159d:	8b 45 30             	mov    0x30(%ebp),%eax
    15a0:	89 44 24 10          	mov    %eax,0x10(%esp)
    15a4:	8b 45 08             	mov    0x8(%ebp),%eax
    15a7:	89 04 24             	mov    %eax,(%esp)
    15aa:	e8 b5 3e 00 00       	call   5464 <createClickable>
		break;
    15af:	eb 14                	jmp    15c5 <addItemEvent+0x134>
	default:
		printf(0, "unknown file type!");
    15b1:	c7 44 24 04 fd c5 00 	movl   $0xc5fd,0x4(%esp)
    15b8:	00 
    15b9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    15c0:	e8 f2 48 00 00       	call   5eb7 <printf>
	}
}
    15c5:	c9                   	leave  
    15c6:	c3                   	ret    

000015c7 <addListEvent>:

void addListEvent(ClickableManager *cm) {
    15c7:	55                   	push   %ebp
    15c8:	89 e5                	mov    %esp,%ebp
    15ca:	83 ec 58             	sub    $0x58,%esp
	struct fileItem *p, *temp;
	p = fileItemList;
    15cd:	a1 30 14 01 00       	mov    0x11430,%eax
    15d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    15d5:	eb 70                	jmp    1647 <addListEvent+0x80>
		temp = p;
    15d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15da:	89 45 f0             	mov    %eax,-0x10(%ebp)
		p = p->next;
    15dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15e0:	8b 40 2c             	mov    0x2c(%eax),%eax
    15e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
		addItemEvent(cm, *temp);
    15e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e9:	8b 10                	mov    (%eax),%edx
    15eb:	89 54 24 04          	mov    %edx,0x4(%esp)
    15ef:	8b 50 04             	mov    0x4(%eax),%edx
    15f2:	89 54 24 08          	mov    %edx,0x8(%esp)
    15f6:	8b 50 08             	mov    0x8(%eax),%edx
    15f9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    15fd:	8b 50 0c             	mov    0xc(%eax),%edx
    1600:	89 54 24 10          	mov    %edx,0x10(%esp)
    1604:	8b 50 10             	mov    0x10(%eax),%edx
    1607:	89 54 24 14          	mov    %edx,0x14(%esp)
    160b:	8b 50 14             	mov    0x14(%eax),%edx
    160e:	89 54 24 18          	mov    %edx,0x18(%esp)
    1612:	8b 50 18             	mov    0x18(%eax),%edx
    1615:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    1619:	8b 50 1c             	mov    0x1c(%eax),%edx
    161c:	89 54 24 20          	mov    %edx,0x20(%esp)
    1620:	8b 50 20             	mov    0x20(%eax),%edx
    1623:	89 54 24 24          	mov    %edx,0x24(%esp)
    1627:	8b 50 24             	mov    0x24(%eax),%edx
    162a:	89 54 24 28          	mov    %edx,0x28(%esp)
    162e:	8b 50 28             	mov    0x28(%eax),%edx
    1631:	89 54 24 2c          	mov    %edx,0x2c(%esp)
    1635:	8b 40 2c             	mov    0x2c(%eax),%eax
    1638:	89 44 24 30          	mov    %eax,0x30(%esp)
    163c:	8b 45 08             	mov    0x8(%ebp),%eax
    163f:	89 04 24             	mov    %eax,(%esp)
    1642:	e8 4a fe ff ff       	call   1491 <addItemEvent>
}

void addListEvent(ClickableManager *cm) {
	struct fileItem *p, *temp;
	p = fileItemList;
	while (p != 0) {
    1647:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    164b:	75 8a                	jne    15d7 <addListEvent+0x10>
		temp = p;
		p = p->next;
		addItemEvent(cm, *temp);
	}
}
    164d:	c9                   	leave  
    164e:	c3                   	ret    

0000164f <addWndEvent>:

Handler wndEvents[] = { h_closeWnd, h_empty, h_chvm2, h_chvm1, h_newFolder,
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
    164f:	55                   	push   %ebp
    1650:	89 e5                	mov    %esp,%ebp
    1652:	57                   	push   %edi
    1653:	56                   	push   %esi
    1654:	53                   	push   %ebx
    1655:	83 ec 5c             	sub    $0x5c,%esp
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
    1658:	c7 45 e0 0f 00 00 00 	movl   $0xf,-0x20(%ebp)
	for (i = 0; i < n; i++) {
    165f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    1666:	e9 96 00 00 00       	jmp    1701 <addWndEvent+0xb2>
		createClickable(cm,
    166b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    166e:	8b 1c 85 e0 0e 01 00 	mov    0x10ee0(,%eax,4),%ebx
    1675:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1678:	6b c0 34             	imul   $0x34,%eax,%eax
    167b:	05 e0 0b 01 00       	add    $0x10be0,%eax
    1680:	8b 78 10             	mov    0x10(%eax),%edi
    1683:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1686:	6b c0 34             	imul   $0x34,%eax,%eax
    1689:	05 e0 0b 01 00       	add    $0x10be0,%eax
    168e:	8b 70 0c             	mov    0xc(%eax),%esi
    1691:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1694:	6b c0 34             	imul   $0x34,%eax,%eax
    1697:	05 e0 0b 01 00       	add    $0x10be0,%eax
    169c:	8b 48 04             	mov    0x4(%eax),%ecx
    169f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    16a2:	6b c0 34             	imul   $0x34,%eax,%eax
    16a5:	05 e0 0b 01 00       	add    $0x10be0,%eax
    16aa:	8b 10                	mov    (%eax),%edx
    16ac:	8d 45 c0             	lea    -0x40(%ebp),%eax
    16af:	89 7c 24 10          	mov    %edi,0x10(%esp)
    16b3:	89 74 24 0c          	mov    %esi,0xc(%esp)
    16b7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    16bb:	89 54 24 04          	mov    %edx,0x4(%esp)
    16bf:	89 04 24             	mov    %eax,(%esp)
    16c2:	e8 b1 3c 00 00       	call   5378 <initRect>
    16c7:	83 ec 04             	sub    $0x4,%esp
    16ca:	89 5c 24 18          	mov    %ebx,0x18(%esp)
    16ce:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    16d5:	00 
    16d6:	8b 45 c0             	mov    -0x40(%ebp),%eax
    16d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    16dd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    16e0:	89 44 24 08          	mov    %eax,0x8(%esp)
    16e4:	8b 45 c8             	mov    -0x38(%ebp),%eax
    16e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    16eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    16ee:	89 44 24 10          	mov    %eax,0x10(%esp)
    16f2:	8b 45 08             	mov    0x8(%ebp),%eax
    16f5:	89 04 24             	mov    %eax,(%esp)
    16f8:	e8 67 3d 00 00       	call   5464 <createClickable>
		h_newFile, h_goUp, h_deleteFile, h_scrollDown, h_scrollUp, h_cutFile, h_copyFile, h_pasteFile, h_searchbox, h_rename};

void addWndEvent(ClickableManager *cm) {
	int i;
	int n = sizeof(wndEvents) / sizeof(Handler);
	for (i = 0; i < n; i++) {
    16fd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    1701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1704:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    1707:	0f 8c 5e ff ff ff    	jl     166b <addWndEvent+0x1c>
		createClickable(cm,
				initRect(wndRes[i].position_x, wndRes[i].position_y,
						wndRes[i].pic.width, wndRes[i].pic.height), MSG_LPRESS,
				wndEvents[i]);
	}
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
    170d:	8d 45 d0             	lea    -0x30(%ebp),%eax
    1710:	c7 44 24 10 1c 00 00 	movl   $0x1c,0x10(%esp)
    1717:	00 
    1718:	c7 44 24 0c 9f 00 00 	movl   $0x9f,0xc(%esp)
    171f:	00 
    1720:	c7 44 24 08 47 00 00 	movl   $0x47,0x8(%esp)
    1727:	00 
    1728:	c7 44 24 04 28 00 00 	movl   $0x28,0x4(%esp)
    172f:	00 
    1730:	89 04 24             	mov    %eax,(%esp)
    1733:	e8 40 3c 00 00       	call   5378 <initRect>
    1738:	83 ec 04             	sub    $0x4,%esp
    173b:	c7 44 24 18 da 17 00 	movl   $0x17da,0x18(%esp)
    1742:	00 
    1743:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    174a:	00 
    174b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    174e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1752:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1755:	89 44 24 08          	mov    %eax,0x8(%esp)
    1759:	8b 45 d8             	mov    -0x28(%ebp),%eax
    175c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1760:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1763:	89 44 24 10          	mov    %eax,0x10(%esp)
    1767:	8b 45 08             	mov    0x8(%ebp),%eax
    176a:	89 04 24             	mov    %eax,(%esp)
    176d:	e8 f2 3c 00 00       	call   5464 <createClickable>
}
    1772:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1775:	5b                   	pop    %ebx
    1776:	5e                   	pop    %esi
    1777:	5f                   	pop    %edi
    1778:	5d                   	pop    %ebp
    1779:	c3                   	ret    

0000177a <getFileItem>:

struct fileItem * getFileItem(Point point) {
    177a:	55                   	push   %ebp
    177b:	89 e5                	mov    %esp,%ebp
    177d:	83 ec 38             	sub    $0x38,%esp
	struct fileItem *p = fileItemList;
    1780:	a1 30 14 01 00       	mov    0x11430,%eax
    1785:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (p != 0) {
    1788:	eb 43                	jmp    17cd <getFileItem+0x53>
		if (isIn(point, p->pos)) {
    178a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    178d:	8b 50 18             	mov    0x18(%eax),%edx
    1790:	89 54 24 08          	mov    %edx,0x8(%esp)
    1794:	8b 50 1c             	mov    0x1c(%eax),%edx
    1797:	89 54 24 0c          	mov    %edx,0xc(%esp)
    179b:	8b 50 20             	mov    0x20(%eax),%edx
    179e:	89 54 24 10          	mov    %edx,0x10(%esp)
    17a2:	8b 40 24             	mov    0x24(%eax),%eax
    17a5:	89 44 24 14          	mov    %eax,0x14(%esp)
    17a9:	8b 45 08             	mov    0x8(%ebp),%eax
    17ac:	8b 55 0c             	mov    0xc(%ebp),%edx
    17af:	89 04 24             	mov    %eax,(%esp)
    17b2:	89 54 24 04          	mov    %edx,0x4(%esp)
    17b6:	e8 18 3c 00 00       	call   53d3 <isIn>
    17bb:	85 c0                	test   %eax,%eax
    17bd:	74 05                	je     17c4 <getFileItem+0x4a>
			return p;
    17bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c2:	eb 14                	jmp    17d8 <getFileItem+0x5e>
		}
		p = p->next;
    17c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    17c7:	8b 40 2c             	mov    0x2c(%eax),%eax
    17ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
	createClickable(cm, initRect(LIST_ITEM_FILENAME, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + 1, LIST_ITEM_SIZE - LIST_ITEM_FILENAME - 1, TAGBAR_HEIGHT), MSG_LPRESS, h_fileSortByName);
}

struct fileItem * getFileItem(Point point) {
	struct fileItem *p = fileItemList;
	while (p != 0) {
    17cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    17d1:	75 b7                	jne    178a <getFileItem+0x10>
		if (isIn(point, p->pos)) {
			return p;
		}
		p = p->next;
	}
	return 0;
    17d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
    17d8:	c9                   	leave  
    17d9:	c3                   	ret    

000017da <h_fileSortByName>:

void h_fileSortByName(Point p) {
    17da:	55                   	push   %ebp
    17db:	89 e5                	mov    %esp,%ebp
    17dd:	83 ec 38             	sub    $0x38,%esp
	printf(0, "askjhdas\n");
    17e0:	c7 44 24 04 10 c6 00 	movl   $0xc610,0x4(%esp)
    17e7:	00 
    17e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    17ef:	e8 c3 46 00 00       	call   5eb7 <printf>
	fileSortByName();
    17f4:	e8 2a ea ff ff       	call   223 <fileSortByName>
	drawFinderContent(context);
    17f9:	a1 60 4b 01 00       	mov    0x14b60,%eax
    17fe:	89 04 24             	mov    %eax,(%esp)
    1801:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1806:	89 44 24 04          	mov    %eax,0x4(%esp)
    180a:	a1 68 4b 01 00       	mov    0x14b68,%eax
    180f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1813:	e8 01 f8 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    1818:	a1 60 4b 01 00       	mov    0x14b60,%eax
    181d:	89 04 24             	mov    %eax,(%esp)
    1820:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1825:	89 44 24 04          	mov    %eax,0x4(%esp)
    1829:	a1 68 4b 01 00       	mov    0x14b68,%eax
    182e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1832:	e8 94 f4 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1837:	8d 45 e8             	lea    -0x18(%ebp),%eax
    183a:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1841:	00 
    1842:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1849:	00 
    184a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1851:	00 
    1852:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1859:	00 
    185a:	89 04 24             	mov    %eax,(%esp)
    185d:	e8 16 3b 00 00       	call   5378 <initRect>
    1862:	83 ec 04             	sub    $0x4,%esp
    1865:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1868:	89 44 24 04          	mov    %eax,0x4(%esp)
    186c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    186f:	89 44 24 08          	mov    %eax,0x8(%esp)
    1873:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1876:	89 44 24 0c          	mov    %eax,0xc(%esp)
    187a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    187d:	89 44 24 10          	mov    %eax,0x10(%esp)
    1881:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1888:	e8 ee 3c 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    188d:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1894:	e8 b6 fd ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    1899:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    18a0:	e8 22 fd ff ff       	call   15c7 <addListEvent>
}
    18a5:	c9                   	leave  
    18a6:	c3                   	ret    

000018a7 <h_searchbox>:

void h_searchbox(Point p) {
    18a7:	55                   	push   %ebp
    18a8:	89 e5                	mov    %esp,%ebp
	isSearching = 1;
    18aa:	c7 05 40 42 01 00 01 	movl   $0x1,0x14240
    18b1:	00 00 00 
}
    18b4:	5d                   	pop    %ebp
    18b5:	c3                   	ret    

000018b6 <scrollList>:

void scrollList(int offset) {
    18b6:	55                   	push   %ebp
    18b7:	89 e5                	mov    %esp,%ebp
    18b9:	83 ec 10             	sub    $0x10,%esp
	struct fileItem *q = fileItemList;
    18bc:	a1 30 14 01 00       	mov    0x11430,%eax
    18c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while (q != 0){
    18c4:	eb 1a                	jmp    18e0 <scrollList+0x2a>
		q->pos.start.y += offset;
    18c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18c9:	8b 50 1c             	mov    0x1c(%eax),%edx
    18cc:	8b 45 08             	mov    0x8(%ebp),%eax
    18cf:	01 c2                	add    %eax,%edx
    18d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18d4:	89 50 1c             	mov    %edx,0x1c(%eax)
		q = q->next;
    18d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    18da:	8b 40 2c             	mov    0x2c(%eax),%eax
    18dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
	isSearching = 1;
}

void scrollList(int offset) {
	struct fileItem *q = fileItemList;
	while (q != 0){
    18e0:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
    18e4:	75 e0                	jne    18c6 <scrollList+0x10>
		q->pos.start.y += offset;
		q = q->next;
	}
	scrollOffset += offset;
    18e6:	8b 15 20 14 01 00    	mov    0x11420,%edx
    18ec:	8b 45 08             	mov    0x8(%ebp),%eax
    18ef:	01 d0                	add    %edx,%eax
    18f1:	a3 20 14 01 00       	mov    %eax,0x11420
}
    18f6:	c9                   	leave  
    18f7:	c3                   	ret    

000018f8 <scrollDown>:

void scrollDown() {
    18f8:	55                   	push   %ebp
    18f9:	89 e5                	mov    %esp,%ebp
    18fb:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    18fe:	a1 30 14 01 00       	mov    0x11430,%eax
    1903:	89 45 f4             	mov    %eax,-0xc(%ebp)
	// while (q != 0)
	// {
	// 	p = q;
	// 	q = q->next;
	// }
	printf(0, "have you ever had sex?%d\n%d", fileItemList->pos.start.y, (WINDOW_HEIGHT - LIST_ITEM_HEIGHT));
    1906:	a1 30 14 01 00       	mov    0x11430,%eax
    190b:	8b 40 1c             	mov    0x1c(%eax),%eax
    190e:	c7 44 24 0c a4 01 00 	movl   $0x1a4,0xc(%esp)
    1915:	00 
    1916:	89 44 24 08          	mov    %eax,0x8(%esp)
    191a:	c7 44 24 04 1a c6 00 	movl   $0xc61a,0x4(%esp)
    1921:	00 
    1922:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1929:	e8 89 45 00 00       	call   5eb7 <printf>
	if (style == ICON_STYLE){
    192e:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    1933:	83 f8 01             	cmp    $0x1,%eax
    1936:	75 41                	jne    1979 <scrollDown+0x81>
		if(q->pos.start.y > (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)){
    1938:	8b 45 f4             	mov    -0xc(%ebp),%eax
    193b:	8b 40 1c             	mov    0x1c(%eax),%eax
    193e:	3d 63 01 00 00       	cmp    $0x163,%eax
    1943:	7e 73                	jle    19b8 <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1945:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1948:	8b 40 1c             	mov    0x1c(%eax),%eax
    194b:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1950:	7e 0e                	jle    1960 <scrollDown+0x68>
				scrollList(-SCROLL_UNIT);
    1952:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    1959:	e8 58 ff ff ff       	call   18b6 <scrollList>
    195e:	eb 58                	jmp    19b8 <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - ICON_ITEM_HEIGHT)));
    1960:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1963:	8b 40 1c             	mov    0x1c(%eax),%eax
    1966:	ba 63 01 00 00       	mov    $0x163,%edx
    196b:	29 c2                	sub    %eax,%edx
    196d:	89 d0                	mov    %edx,%eax
    196f:	89 04 24             	mov    %eax,(%esp)
    1972:	e8 3f ff ff ff       	call   18b6 <scrollList>
    1977:	eb 3f                	jmp    19b8 <scrollDown+0xc0>
			}
		}
	}
	else{
		if(q->pos.start.y > (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)){
    1979:	8b 45 f4             	mov    -0xc(%ebp),%eax
    197c:	8b 40 1c             	mov    0x1c(%eax),%eax
    197f:	3d a4 01 00 00       	cmp    $0x1a4,%eax
    1984:	7e 32                	jle    19b8 <scrollDown+0xc0>
			if(q->pos.start.y > WINDOW_HEIGHT){
    1986:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1989:	8b 40 1c             	mov    0x1c(%eax),%eax
    198c:	3d c2 01 00 00       	cmp    $0x1c2,%eax
    1991:	7e 0e                	jle    19a1 <scrollDown+0xa9>
				scrollList(-SCROLL_UNIT);
    1993:	c7 04 24 e2 ff ff ff 	movl   $0xffffffe2,(%esp)
    199a:	e8 17 ff ff ff       	call   18b6 <scrollList>
    199f:	eb 17                	jmp    19b8 <scrollDown+0xc0>
			}
			else{
				scrollList(-(q->pos.start.y - (WINDOW_HEIGHT - LIST_ITEM_HEIGHT)));
    19a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    19a4:	8b 40 1c             	mov    0x1c(%eax),%eax
    19a7:	ba a4 01 00 00       	mov    $0x1a4,%edx
    19ac:	29 c2                	sub    %eax,%edx
    19ae:	89 d0                	mov    %edx,%eax
    19b0:	89 04 24             	mov    %eax,(%esp)
    19b3:	e8 fe fe ff ff       	call   18b6 <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollDown, current Offset %d\n", scrollOffset);
	printf(0, "scrollDown, current Offset %d\n", scrollOffset);
    19b8:	a1 20 14 01 00       	mov    0x11420,%eax
    19bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    19c1:	c7 44 24 04 38 c6 00 	movl   $0xc638,0x4(%esp)
    19c8:	00 
    19c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    19d0:	e8 e2 44 00 00       	call   5eb7 <printf>
}
    19d5:	c9                   	leave  
    19d6:	c3                   	ret    

000019d7 <h_scrollDown>:

void h_scrollDown(Point p) {
    19d7:	55                   	push   %ebp
    19d8:	89 e5                	mov    %esp,%ebp
    19da:	83 ec 38             	sub    $0x38,%esp
	scrollDown();
    19dd:	e8 16 ff ff ff       	call   18f8 <scrollDown>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    19e2:	a1 60 4b 01 00       	mov    0x14b60,%eax
    19e7:	89 04 24             	mov    %eax,(%esp)
    19ea:	a1 64 4b 01 00       	mov    0x14b64,%eax
    19ef:	89 44 24 04          	mov    %eax,0x4(%esp)
    19f3:	a1 68 4b 01 00       	mov    0x14b68,%eax
    19f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    19fc:	e8 18 f6 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    1a01:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1a06:	89 04 24             	mov    %eax,(%esp)
    1a09:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1a0e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a12:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1a17:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a1b:	e8 ab f2 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1a20:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1a23:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1a2a:	00 
    1a2b:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1a32:	00 
    1a33:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1a3a:	00 
    1a3b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a42:	00 
    1a43:	89 04 24             	mov    %eax,(%esp)
    1a46:	e8 2d 39 00 00       	call   5378 <initRect>
    1a4b:	83 ec 04             	sub    $0x4,%esp
    1a4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a51:	89 44 24 04          	mov    %eax,0x4(%esp)
    1a55:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1a58:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1a5f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1a66:	89 44 24 10          	mov    %eax,0x10(%esp)
    1a6a:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1a71:	e8 05 3b 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    1a76:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1a7d:	e8 cd fb ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    1a82:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1a89:	e8 39 fb ff ff       	call   15c7 <addListEvent>
}
    1a8e:	c9                   	leave  
    1a8f:	c3                   	ret    

00001a90 <scrollUp>:

void scrollUp() {
    1a90:	55                   	push   %ebp
    1a91:	89 e5                	mov    %esp,%ebp
    1a93:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *q = fileItemList;
    1a96:	a1 30 14 01 00       	mov    0x11430,%eax
    1a9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p;
	while (q != 0)
    1a9e:	eb 0f                	jmp    1aaf <scrollUp+0x1f>
	{
		p = q;
    1aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
		q = q->next;
    1aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa9:	8b 40 2c             	mov    0x2c(%eax),%eax
    1aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void scrollUp() {
	struct fileItem *q = fileItemList;
	struct fileItem *p;
	while (q != 0)
    1aaf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ab3:	75 eb                	jne    1aa0 <scrollUp+0x10>
	{
		p = q;
		q = q->next;
	}
	printf(0, "the first file's y is tmd:%d\n", p->pos.start.y);
    1ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ab8:	8b 40 1c             	mov    0x1c(%eax),%eax
    1abb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1abf:	c7 44 24 04 57 c6 00 	movl   $0xc657,0x4(%esp)
    1ac6:	00 
    1ac7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1ace:	e8 e4 43 00 00       	call   5eb7 <printf>
	printf(0, "have you ever had sex?%d\n", fileItemList->pos.start.y);
    1ad3:	a1 30 14 01 00       	mov    0x11430,%eax
    1ad8:	8b 40 1c             	mov    0x1c(%eax),%eax
    1adb:	89 44 24 08          	mov    %eax,0x8(%esp)
    1adf:	c7 44 24 04 75 c6 00 	movl   $0xc675,0x4(%esp)
    1ae6:	00 
    1ae7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1aee:	e8 c4 43 00 00       	call   5eb7 <printf>
	if (style == ICON_STYLE){
    1af3:	a1 c4 0a 01 00       	mov    0x10ac4,%eax
    1af8:	83 f8 01             	cmp    $0x1,%eax
    1afb:	75 3d                	jne    1b3a <scrollUp+0xaa>
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT)){
    1afd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b00:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b03:	83 f8 45             	cmp    $0x45,%eax
    1b06:	7f 6d                	jg     1b75 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT - ICON_ITEM_HEIGHT)){
    1b08:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b0b:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b0e:	83 f8 e7             	cmp    $0xffffffe7,%eax
    1b11:	7d 0e                	jge    1b21 <scrollUp+0x91>
				scrollList(SCROLL_UNIT);
    1b13:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1b1a:	e8 97 fd ff ff       	call   18b6 <scrollList>
    1b1f:	eb 54                	jmp    1b75 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT) - p->pos.start.y);
    1b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b24:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b27:	ba 46 00 00 00       	mov    $0x46,%edx
    1b2c:	29 c2                	sub    %eax,%edx
    1b2e:	89 d0                	mov    %edx,%eax
    1b30:	89 04 24             	mov    %eax,(%esp)
    1b33:	e8 7e fd ff ff       	call   18b6 <scrollList>
    1b38:	eb 3b                	jmp    1b75 <scrollUp+0xe5>
			}
		}
	}
	else{
		if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT)){
    1b3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b3d:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b40:	83 f8 61             	cmp    $0x61,%eax
    1b43:	7f 30                	jg     1b75 <scrollUp+0xe5>
			if(p->pos.start.y < (TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT - LIST_ITEM_HEIGHT)){
    1b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b48:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b4b:	83 f8 43             	cmp    $0x43,%eax
    1b4e:	7f 0e                	jg     1b5e <scrollUp+0xce>
				scrollList(SCROLL_UNIT);
    1b50:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
    1b57:	e8 5a fd ff ff       	call   18b6 <scrollList>
    1b5c:	eb 17                	jmp    1b75 <scrollUp+0xe5>
			}
			else{
				scrollList((TOPBAR_HEIGHT + TOOLSBAR_HEIGHT + TAGBAR_HEIGHT) - p->pos.start.y);
    1b5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1b61:	8b 40 1c             	mov    0x1c(%eax),%eax
    1b64:	ba 62 00 00 00       	mov    $0x62,%edx
    1b69:	29 c2                	sub    %eax,%edx
    1b6b:	89 d0                	mov    %edx,%eax
    1b6d:	89 04 24             	mov    %eax,(%esp)
    1b70:	e8 41 fd ff ff       	call   18b6 <scrollList>
			}
		}
	}
	//printf(0, "tryingToScrollUp, current Offset %d\n", scrollOffset);
	printf(0, "scrollUp, current Offset %d\n", scrollOffset);
    1b75:	a1 20 14 01 00       	mov    0x11420,%eax
    1b7a:	89 44 24 08          	mov    %eax,0x8(%esp)
    1b7e:	c7 44 24 04 8f c6 00 	movl   $0xc68f,0x4(%esp)
    1b85:	00 
    1b86:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1b8d:	e8 25 43 00 00       	call   5eb7 <printf>
}
    1b92:	c9                   	leave  
    1b93:	c3                   	ret    

00001b94 <h_scrollUp>:

void h_scrollUp(Point p) {
    1b94:	55                   	push   %ebp
    1b95:	89 e5                	mov    %esp,%ebp
    1b97:	83 ec 38             	sub    $0x38,%esp
	scrollUp();
    1b9a:	e8 f1 fe ff ff       	call   1a90 <scrollUp>
//	updateFileList(context);
//	fileSortByName();
	drawFinderContent(context);
    1b9f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1ba4:	89 04 24             	mov    %eax,(%esp)
    1ba7:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1bac:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bb0:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1bb5:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bb9:	e8 5b f4 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    1bbe:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1bc3:	89 04 24             	mov    %eax,(%esp)
    1bc6:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1bcb:	89 44 24 04          	mov    %eax,0x4(%esp)
    1bcf:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1bd4:	89 44 24 08          	mov    %eax,0x8(%esp)
    1bd8:	e8 ee f0 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1bdd:	8d 45 e8             	lea    -0x18(%ebp),%eax
    1be0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1be7:	00 
    1be8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1bef:	00 
    1bf0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1bf7:	00 
    1bf8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1bff:	00 
    1c00:	89 04 24             	mov    %eax,(%esp)
    1c03:	e8 70 37 00 00       	call   5378 <initRect>
    1c08:	83 ec 04             	sub    $0x4,%esp
    1c0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1c0e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c12:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1c15:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1c1c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c23:	89 44 24 10          	mov    %eax,0x10(%esp)
    1c27:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1c2e:	e8 48 39 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    1c33:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1c3a:	e8 10 fa ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    1c3f:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1c46:	e8 7c f9 ff ff       	call   15c7 <addListEvent>
}
    1c4b:	c9                   	leave  
    1c4c:	c3                   	ret    

00001c4d <updatePath>:

void updatePath(char *name) {
    1c4d:	55                   	push   %ebp
    1c4e:	89 e5                	mov    %esp,%ebp
    1c50:	83 ec 28             	sub    $0x28,%esp
	//printf(2, "cd success\r\n");
	int n = strlen(name);
    1c53:	8b 45 08             	mov    0x8(%ebp),%eax
    1c56:	89 04 24             	mov    %eax,(%esp)
    1c59:	e8 9d 3e 00 00       	call   5afb <strlen>
    1c5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
    1c61:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1c65:	0f 85 84 00 00 00    	jne    1cef <updatePath+0xa2>
    1c6b:	8b 45 08             	mov    0x8(%ebp),%eax
    1c6e:	0f b6 00             	movzbl (%eax),%eax
    1c71:	3c 2e                	cmp    $0x2e,%al
    1c73:	75 7a                	jne    1cef <updatePath+0xa2>
    1c75:	8b 45 08             	mov    0x8(%ebp),%eax
    1c78:	83 c0 01             	add    $0x1,%eax
    1c7b:	0f b6 00             	movzbl (%eax),%eax
    1c7e:	3c 2e                	cmp    $0x2e,%al
    1c80:	75 6d                	jne    1cef <updatePath+0xa2>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1c82:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    1c89:	e8 6d 3e 00 00       	call   5afb <strlen>
    1c8e:	83 f8 01             	cmp    $0x1,%eax
    1c91:	75 0b                	jne    1c9e <updatePath+0x51>
    1c93:	0f b6 05 a0 4b 01 00 	movzbl 0x14ba0,%eax
    1c9a:	3c 2f                	cmp    $0x2f,%al
    1c9c:	74 4f                	je     1ced <updatePath+0xa0>
		{
			int tmpn = strlen(currentPath);
    1c9e:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    1ca5:	e8 51 3e 00 00       	call   5afb <strlen>
    1caa:	89 45 ec             	mov    %eax,-0x14(%ebp)
			currentPath[tmpn - 1] = '\0';
    1cad:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cb0:	83 e8 01             	sub    $0x1,%eax
    1cb3:	c6 80 a0 4b 01 00 00 	movb   $0x0,0x14ba0(%eax)
			for (i = tmpn - 2; i > 0; i--)
    1cba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1cbd:	83 e8 02             	sub    $0x2,%eax
    1cc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1cc3:	eb 22                	jmp    1ce7 <updatePath+0x9a>
			{
				if (currentPath[i] != '/')
    1cc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cc8:	05 a0 4b 01 00       	add    $0x14ba0,%eax
    1ccd:	0f b6 00             	movzbl (%eax),%eax
    1cd0:	3c 2f                	cmp    $0x2f,%al
    1cd2:	74 11                	je     1ce5 <updatePath+0x98>
					currentPath[i] = '\0';
    1cd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cd7:	05 a0 4b 01 00       	add    $0x14ba0,%eax
    1cdc:	c6 00 00             	movb   $0x0,(%eax)
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
		{
			int tmpn = strlen(currentPath);
			currentPath[tmpn - 1] = '\0';
			for (i = tmpn - 2; i > 0; i--)
    1cdf:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1ce3:	eb 02                	jmp    1ce7 <updatePath+0x9a>
			{
				if (currentPath[i] != '/')
					currentPath[i] = '\0';
				else
					break;
    1ce5:	eb 06                	jmp    1ced <updatePath+0xa0>
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
		{
			int tmpn = strlen(currentPath);
			currentPath[tmpn - 1] = '\0';
			for (i = tmpn - 2; i > 0; i--)
    1ce7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ceb:	7f d8                	jg     1cc5 <updatePath+0x78>
	//printf(2, "cd success\r\n");
	int n = strlen(name);
	int i;
	if (n == 2 && name[0] == '.' && name[1] == '.')
	{
		if (!(strlen(currentPath) == 1 && currentPath[0] == '/'))
    1ced:	eb 4e                	jmp    1d3d <updatePath+0xf0>
			}
		}
	}
	else
	{
		int tmpn = strlen(currentPath);
    1cef:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    1cf6:	e8 00 3e 00 00       	call   5afb <strlen>
    1cfb:	89 45 e8             	mov    %eax,-0x18(%ebp)
		strcpy(currentPath + tmpn, name);
    1cfe:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d01:	8d 90 a0 4b 01 00    	lea    0x14ba0(%eax),%edx
    1d07:	8b 45 08             	mov    0x8(%ebp),%eax
    1d0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    1d0e:	89 14 24             	mov    %edx,(%esp)
    1d11:	e8 76 3d 00 00       	call   5a8c <strcpy>
		tmpn = strlen(currentPath);
    1d16:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    1d1d:	e8 d9 3d 00 00       	call   5afb <strlen>
    1d22:	89 45 e8             	mov    %eax,-0x18(%ebp)
		currentPath[tmpn] = '/';
    1d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d28:	05 a0 4b 01 00       	add    $0x14ba0,%eax
    1d2d:	c6 00 2f             	movb   $0x2f,(%eax)
		currentPath[tmpn + 1] = '\0';
    1d30:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1d33:	83 c0 01             	add    $0x1,%eax
    1d36:	c6 80 a0 4b 01 00 00 	movb   $0x0,0x14ba0(%eax)
	}
}
    1d3d:	c9                   	leave  
    1d3e:	c3                   	ret    

00001d3f <enterDir>:

// Handlers
void enterDir(char *name) {
    1d3f:	55                   	push   %ebp
    1d40:	89 e5                	mov    %esp,%ebp
    1d42:	83 ec 18             	sub    $0x18,%esp
	scrollOffset = 0;
    1d45:	c7 05 20 14 01 00 00 	movl   $0x0,0x11420
    1d4c:	00 00 00 
	printf(0, "entering : %s\n", name);
    1d4f:	8b 45 08             	mov    0x8(%ebp),%eax
    1d52:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d56:	c7 44 24 04 ac c6 00 	movl   $0xc6ac,0x4(%esp)
    1d5d:	00 
    1d5e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d65:	e8 4d 41 00 00       	call   5eb7 <printf>
	if (chdir(name) < 0)
    1d6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1d6d:	89 04 24             	mov    %eax,(%esp)
    1d70:	e8 ca 3f 00 00       	call   5d3f <chdir>
    1d75:	85 c0                	test   %eax,%eax
    1d77:	79 1d                	jns    1d96 <enterDir+0x57>
		printf(2, "cannot cd %s\n", name);
    1d79:	8b 45 08             	mov    0x8(%ebp),%eax
    1d7c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1d80:	c7 44 24 04 bb c6 00 	movl   $0xc6bb,0x4(%esp)
    1d87:	00 
    1d88:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    1d8f:	e8 23 41 00 00       	call   5eb7 <printf>
    1d94:	eb 0b                	jmp    1da1 <enterDir+0x62>
	else
		updatePath(name);
    1d96:	8b 45 08             	mov    0x8(%ebp),%eax
    1d99:	89 04 24             	mov    %eax,(%esp)
    1d9c:	e8 ac fe ff ff       	call   1c4d <updatePath>
	printf(0, "currentPath: %s\n", currentPath);
    1da1:	c7 44 24 08 a0 4b 01 	movl   $0x14ba0,0x8(%esp)
    1da8:	00 
    1da9:	c7 44 24 04 c9 c6 00 	movl   $0xc6c9,0x4(%esp)
    1db0:	00 
    1db1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1db8:	e8 fa 40 00 00       	call   5eb7 <printf>
}
    1dbd:	c9                   	leave  
    1dbe:	c3                   	ret    

00001dbf <h_enterDir>:

void h_enterDir(Point p) {
    1dbf:	55                   	push   %ebp
    1dc0:	89 e5                	mov    %esp,%ebp
    1dc2:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *temp = getFileItem(p);
    1dc5:	8b 45 08             	mov    0x8(%ebp),%eax
    1dc8:	8b 55 0c             	mov    0xc(%ebp),%edx
    1dcb:	89 04 24             	mov    %eax,(%esp)
    1dce:	89 54 24 04          	mov    %edx,0x4(%esp)
    1dd2:	e8 a3 f9 ff ff       	call   177a <getFileItem>
    1dd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	enterDir(temp->name);
    1dda:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ddd:	8b 40 14             	mov    0x14(%eax),%eax
    1de0:	89 04 24             	mov    %eax,(%esp)
    1de3:	e8 57 ff ff ff       	call   1d3f <enterDir>
	updateFileList(context);
    1de8:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1ded:	89 04 24             	mov    %eax,(%esp)
    1df0:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1df5:	89 44 24 04          	mov    %eax,0x4(%esp)
    1df9:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1dfe:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e02:	e8 c3 f0 ff ff       	call   eca <updateFileList>
	drawFinderContent(context);
    1e07:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1e0c:	89 04 24             	mov    %eax,(%esp)
    1e0f:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1e14:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e18:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1e1d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e21:	e8 f3 f1 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    1e26:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1e2b:	89 04 24             	mov    %eax,(%esp)
    1e2e:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1e33:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e37:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1e3c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e40:	e8 86 ee ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    1e45:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    1e48:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    1e4f:	00 
    1e50:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    1e57:	00 
    1e58:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    1e5f:	00 
    1e60:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e67:	00 
    1e68:	89 04 24             	mov    %eax,(%esp)
    1e6b:	e8 08 35 00 00       	call   5378 <initRect>
    1e70:	83 ec 04             	sub    $0x4,%esp
    1e73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1e76:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1e7d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1e81:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1e84:	89 44 24 0c          	mov    %eax,0xc(%esp)
    1e88:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e8b:	89 44 24 10          	mov    %eax,0x10(%esp)
    1e8f:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1e96:	e8 e0 36 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    1e9b:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1ea2:	e8 a8 f7 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    1ea7:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    1eae:	e8 14 f7 ff ff       	call   15c7 <addListEvent>
}
    1eb3:	c9                   	leave  
    1eb4:	c3                   	ret    

00001eb5 <newFile>:

void newFile(char *name) {
    1eb5:	55                   	push   %ebp
    1eb6:	89 e5                	mov    %esp,%ebp
    1eb8:	83 ec 28             	sub    $0x28,%esp
	int fd;
	int n = strlen(name);
    1ebb:	8b 45 08             	mov    0x8(%ebp),%eax
    1ebe:	89 04 24             	mov    %eax,(%esp)
    1ec1:	e8 35 3c 00 00       	call   5afb <strlen>
    1ec6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 8;
    1ec9:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
	int counter;
	while ((fd = open(name, 0)) > 0)
    1ed0:	eb 60                	jmp    1f32 <newFile+0x7d>
	{
		n = strlen(name);
    1ed2:	8b 45 08             	mov    0x8(%ebp),%eax
    1ed5:	89 04 24             	mov    %eax,(%esp)
    1ed8:	e8 1e 3c 00 00       	call   5afb <strlen>
    1edd:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    1ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ee3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1ee6:	75 09                	jne    1ef1 <newFile+0x3c>
		{
			counter = 1;
    1ee8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    1eef:	eb 17                	jmp    1f08 <newFile+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    1ef1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    1ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    1ef7:	01 d0                	add    %edx,%eax
    1ef9:	89 04 24             	mov    %eax,(%esp)
    1efc:	e8 3c 3d 00 00       	call   5c3d <atoi>
    1f01:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    1f04:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    1f08:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f0b:	89 04 24             	mov    %eax,(%esp)
    1f0e:	e8 83 f3 ff ff       	call   1296 <int2str>
    1f13:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    1f16:	8b 55 08             	mov    0x8(%ebp),%edx
    1f19:	01 ca                	add    %ecx,%edx
    1f1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    1f1f:	89 14 24             	mov    %edx,(%esp)
    1f22:	e8 65 3b 00 00       	call   5a8c <strcpy>
		close(fd);
    1f27:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f2a:	89 04 24             	mov    %eax,(%esp)
    1f2d:	e8 c5 3d 00 00       	call   5cf7 <close>
void newFile(char *name) {
	int fd;
	int n = strlen(name);
	int baseLen = 8;
	int counter;
	while ((fd = open(name, 0)) > 0)
    1f32:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f39:	00 
    1f3a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f3d:	89 04 24             	mov    %eax,(%esp)
    1f40:	e8 ca 3d 00 00       	call   5d0f <open>
    1f45:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1f48:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1f4c:	7f 84                	jg     1ed2 <newFile+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		close(fd);
	}
	if ((fd = open(name, O_CREATE)) < 0) {
    1f4e:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1f55:	00 
    1f56:	8b 45 08             	mov    0x8(%ebp),%eax
    1f59:	89 04 24             	mov    %eax,(%esp)
    1f5c:	e8 ae 3d 00 00       	call   5d0f <open>
    1f61:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1f64:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1f68:	79 20                	jns    1f8a <newFile+0xd5>
		printf(0, "cat: cannot open %s\n", name);
    1f6a:	8b 45 08             	mov    0x8(%ebp),%eax
    1f6d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1f71:	c7 44 24 04 da c6 00 	movl   $0xc6da,0x4(%esp)
    1f78:	00 
    1f79:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1f80:	e8 32 3f 00 00       	call   5eb7 <printf>
		exit();
    1f85:	e8 45 3d 00 00       	call   5ccf <exit>
	}
	close(fd);
    1f8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1f8d:	89 04 24             	mov    %eax,(%esp)
    1f90:	e8 62 3d 00 00       	call   5cf7 <close>
}
    1f95:	c9                   	leave  
    1f96:	c3                   	ret    

00001f97 <h_newFile>:

void h_newFile(Point p) {
    1f97:	55                   	push   %ebp
    1f98:	89 e5                	mov    %esp,%ebp
    1f9a:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "file.txt";
    1f9d:	c7 45 c8 66 69 6c 65 	movl   $0x656c6966,-0x38(%ebp)
    1fa4:	c7 45 cc 2e 74 78 74 	movl   $0x7478742e,-0x34(%ebp)
    1fab:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
    1fb2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    1fb9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    1fc0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    1fc7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    1fce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFile(nf);
    1fd5:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1fd8:	89 04 24             	mov    %eax,(%esp)
    1fdb:	e8 d5 fe ff ff       	call   1eb5 <newFile>
	updateFileList(context);
    1fe0:	a1 60 4b 01 00       	mov    0x14b60,%eax
    1fe5:	89 04 24             	mov    %eax,(%esp)
    1fe8:	a1 64 4b 01 00       	mov    0x14b64,%eax
    1fed:	89 44 24 04          	mov    %eax,0x4(%esp)
    1ff1:	a1 68 4b 01 00       	mov    0x14b68,%eax
    1ff6:	89 44 24 08          	mov    %eax,0x8(%esp)
    1ffa:	e8 cb ee ff ff       	call   eca <updateFileList>
	drawFinderContent(context);
    1fff:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2004:	89 04 24             	mov    %eax,(%esp)
    2007:	a1 64 4b 01 00       	mov    0x14b64,%eax
    200c:	89 44 24 04          	mov    %eax,0x4(%esp)
    2010:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2015:	89 44 24 08          	mov    %eax,0x8(%esp)
    2019:	e8 fb ef ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    201e:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2023:	89 04 24             	mov    %eax,(%esp)
    2026:	a1 64 4b 01 00       	mov    0x14b64,%eax
    202b:	89 44 24 04          	mov    %eax,0x4(%esp)
    202f:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2034:	89 44 24 08          	mov    %eax,0x8(%esp)
    2038:	e8 8e ec ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    203d:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2040:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2047:	00 
    2048:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    204f:	00 
    2050:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2057:	00 
    2058:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    205f:	00 
    2060:	89 04 24             	mov    %eax,(%esp)
    2063:	e8 10 33 00 00       	call   5378 <initRect>
    2068:	83 ec 04             	sub    $0x4,%esp
    206b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    206e:	89 44 24 04          	mov    %eax,0x4(%esp)
    2072:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2075:	89 44 24 08          	mov    %eax,0x8(%esp)
    2079:	8b 45 f0             	mov    -0x10(%ebp),%eax
    207c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2080:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2083:	89 44 24 10          	mov    %eax,0x10(%esp)
    2087:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    208e:	e8 e8 34 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    2093:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    209a:	e8 b0 f5 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    209f:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    20a6:	e8 1c f5 ff ff       	call   15c7 <addListEvent>
}
    20ab:	c9                   	leave  
    20ac:	c3                   	ret    

000020ad <newFolder>:

void newFolder(char *name) {
    20ad:	55                   	push   %ebp
    20ae:	89 e5                	mov    %esp,%ebp
    20b0:	83 ec 28             	sub    $0x28,%esp
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
    20b3:	8b 45 08             	mov    0x8(%ebp),%eax
    20b6:	89 04 24             	mov    %eax,(%esp)
    20b9:	e8 3d 3a 00 00       	call   5afb <strlen>
    20be:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int baseLen = 9;
    20c1:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%ebp)
	int counter;
	while (mkdir(name) < 0) {
    20c8:	eb 55                	jmp    211f <newFolder+0x72>
		n = strlen(name);
    20ca:	8b 45 08             	mov    0x8(%ebp),%eax
    20cd:	89 04 24             	mov    %eax,(%esp)
    20d0:	e8 26 3a 00 00       	call   5afb <strlen>
    20d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
		if (n == baseLen)
    20d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20db:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    20de:	75 09                	jne    20e9 <newFolder+0x3c>
		{
			counter = 1;
    20e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    20e7:	eb 17                	jmp    2100 <newFolder+0x53>
		}
		else
		{
			counter = atoi(&name[baseLen]);
    20e9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    20ec:	8b 45 08             	mov    0x8(%ebp),%eax
    20ef:	01 d0                	add    %edx,%eax
    20f1:	89 04 24             	mov    %eax,(%esp)
    20f4:	e8 44 3b 00 00       	call   5c3d <atoi>
    20f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
			counter ++;
    20fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
		}
		strcpy(&name[baseLen], int2str(counter));
    2100:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2103:	89 04 24             	mov    %eax,(%esp)
    2106:	e8 8b f1 ff ff       	call   1296 <int2str>
    210b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    210e:	8b 55 08             	mov    0x8(%ebp),%edx
    2111:	01 ca                	add    %ecx,%edx
    2113:	89 44 24 04          	mov    %eax,0x4(%esp)
    2117:	89 14 24             	mov    %edx,(%esp)
    211a:	e8 6d 39 00 00       	call   5a8c <strcpy>
//	int fd;
//	int n = strlen(newfolder);
	int n = strlen(name);
	int baseLen = 9;
	int counter;
	while (mkdir(name) < 0) {
    211f:	8b 45 08             	mov    0x8(%ebp),%eax
    2122:	89 04 24             	mov    %eax,(%esp)
    2125:	e8 0d 3c 00 00       	call   5d37 <mkdir>
    212a:	85 c0                	test   %eax,%eax
    212c:	78 9c                	js     20ca <newFolder+0x1d>
			counter ++;
		}
		strcpy(&name[baseLen], int2str(counter));
		//printf(0, "mkdir: %s failed to create\n", newfolder);
	}
}
    212e:	c9                   	leave  
    212f:	c3                   	ret    

00002130 <h_newFolder>:

void h_newFolder(Point p) {
    2130:	55                   	push   %ebp
    2131:	89 e5                	mov    %esp,%ebp
    2133:	83 ec 58             	sub    $0x58,%esp
	char nf[32] = "newFolder";
    2136:	c7 45 c8 6e 65 77 46 	movl   $0x4677656e,-0x38(%ebp)
    213d:	c7 45 cc 6f 6c 64 65 	movl   $0x65646c6f,-0x34(%ebp)
    2144:	c7 45 d0 72 00 00 00 	movl   $0x72,-0x30(%ebp)
    214b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    2152:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    2159:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    2160:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    2167:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	newFolder(nf);
    216e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    2171:	89 04 24             	mov    %eax,(%esp)
    2174:	e8 34 ff ff ff       	call   20ad <newFolder>
	printf(0, "new folder!\n");
    2179:	c7 44 24 04 ef c6 00 	movl   $0xc6ef,0x4(%esp)
    2180:	00 
    2181:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2188:	e8 2a 3d 00 00       	call   5eb7 <printf>
	updateFileList(context);
    218d:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2192:	89 04 24             	mov    %eax,(%esp)
    2195:	a1 64 4b 01 00       	mov    0x14b64,%eax
    219a:	89 44 24 04          	mov    %eax,0x4(%esp)
    219e:	a1 68 4b 01 00       	mov    0x14b68,%eax
    21a3:	89 44 24 08          	mov    %eax,0x8(%esp)
    21a7:	e8 1e ed ff ff       	call   eca <updateFileList>
	printItemList();
    21ac:	e8 c9 f1 ff ff       	call   137a <printItemList>
	drawFinderContent(context);
    21b1:	a1 60 4b 01 00       	mov    0x14b60,%eax
    21b6:	89 04 24             	mov    %eax,(%esp)
    21b9:	a1 64 4b 01 00       	mov    0x14b64,%eax
    21be:	89 44 24 04          	mov    %eax,0x4(%esp)
    21c2:	a1 68 4b 01 00       	mov    0x14b68,%eax
    21c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    21cb:	e8 49 ee ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    21d0:	a1 60 4b 01 00       	mov    0x14b60,%eax
    21d5:	89 04 24             	mov    %eax,(%esp)
    21d8:	a1 64 4b 01 00       	mov    0x14b64,%eax
    21dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    21e1:	a1 68 4b 01 00       	mov    0x14b68,%eax
    21e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    21ea:	e8 dc ea ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    21ef:	8d 45 e8             	lea    -0x18(%ebp),%eax
    21f2:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    21f9:	00 
    21fa:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2201:	00 
    2202:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2209:	00 
    220a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2211:	00 
    2212:	89 04 24             	mov    %eax,(%esp)
    2215:	e8 5e 31 00 00       	call   5378 <initRect>
    221a:	83 ec 04             	sub    $0x4,%esp
    221d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2220:	89 44 24 04          	mov    %eax,0x4(%esp)
    2224:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2227:	89 44 24 08          	mov    %eax,0x8(%esp)
    222b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    222e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2235:	89 44 24 10          	mov    %eax,0x10(%esp)
    2239:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    2240:	e8 36 33 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    2245:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    224c:	e8 fe f3 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    2251:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    2258:	e8 6a f3 ff ff       	call   15c7 <addListEvent>
}
    225d:	c9                   	leave  
    225e:	c3                   	ret    

0000225f <deleteFile>:

void deleteFile(char *name)
{
    225f:	55                   	push   %ebp
    2260:	89 e5                	mov    %esp,%ebp
    2262:	83 ec 28             	sub    $0x28,%esp
	printf(0, "currently having sex with %s\n", name);
    2265:	8b 45 08             	mov    0x8(%ebp),%eax
    2268:	89 44 24 08          	mov    %eax,0x8(%esp)
    226c:	c7 44 24 04 fc c6 00 	movl   $0xc6fc,0x4(%esp)
    2273:	00 
    2274:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    227b:	e8 37 3c 00 00       	call   5eb7 <printf>
	if(unlink(name) < 0){
    2280:	8b 45 08             	mov    0x8(%ebp),%eax
    2283:	89 04 24             	mov    %eax,(%esp)
    2286:	e8 94 3a 00 00       	call   5d1f <unlink>
    228b:	85 c0                	test   %eax,%eax
    228d:	0f 89 c9 00 00 00    	jns    235c <deleteFile+0xfd>
		if (chdir(name) < 0){
    2293:	8b 45 08             	mov    0x8(%ebp),%eax
    2296:	89 04 24             	mov    %eax,(%esp)
    2299:	e8 a1 3a 00 00       	call   5d3f <chdir>
    229e:	85 c0                	test   %eax,%eax
    22a0:	79 20                	jns    22c2 <deleteFile+0x63>
			printf(2, "rm: %s failed to delete\n", name);
    22a2:	8b 45 08             	mov    0x8(%ebp),%eax
    22a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    22a9:	c7 44 24 04 1a c7 00 	movl   $0xc71a,0x4(%esp)
    22b0:	00 
    22b1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    22b8:	e8 fa 3b 00 00       	call   5eb7 <printf>
    22bd:	e9 9a 00 00 00       	jmp    235c <deleteFile+0xfd>
		}
		else{
			updateFileList(context);
    22c2:	a1 60 4b 01 00       	mov    0x14b60,%eax
    22c7:	89 04 24             	mov    %eax,(%esp)
    22ca:	a1 64 4b 01 00       	mov    0x14b64,%eax
    22cf:	89 44 24 04          	mov    %eax,0x4(%esp)
    22d3:	a1 68 4b 01 00       	mov    0x14b68,%eax
    22d8:	89 44 24 08          	mov    %eax,0x8(%esp)
    22dc:	e8 e9 eb ff ff       	call   eca <updateFileList>
			struct fileItem *p;
			p = fileItemList;
    22e1:	a1 30 14 01 00       	mov    0x11430,%eax
    22e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while (p != 0) {
    22e9:	eb 35                	jmp    2320 <deleteFile+0xc1>
				deleteFile(p->name);
    22eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    22ee:	8b 40 14             	mov    0x14(%eax),%eax
    22f1:	89 04 24             	mov    %eax,(%esp)
    22f4:	e8 66 ff ff ff       	call   225f <deleteFile>
				updateFileList(context);
    22f9:	a1 60 4b 01 00       	mov    0x14b60,%eax
    22fe:	89 04 24             	mov    %eax,(%esp)
    2301:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2306:	89 44 24 04          	mov    %eax,0x4(%esp)
    230a:	a1 68 4b 01 00       	mov    0x14b68,%eax
    230f:	89 44 24 08          	mov    %eax,0x8(%esp)
    2313:	e8 b2 eb ff ff       	call   eca <updateFileList>
				p = fileItemList;
    2318:	a1 30 14 01 00       	mov    0x11430,%eax
    231d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		}
		else{
			updateFileList(context);
			struct fileItem *p;
			p = fileItemList;
			while (p != 0) {
    2320:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2324:	75 c5                	jne    22eb <deleteFile+0x8c>
				deleteFile(p->name);
				updateFileList(context);
				p = fileItemList;
			}
			chdir("..");
    2326:	c7 04 24 33 c7 00 00 	movl   $0xc733,(%esp)
    232d:	e8 0d 3a 00 00       	call   5d3f <chdir>
			updateFileList(context);
    2332:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2337:	89 04 24             	mov    %eax,(%esp)
    233a:	a1 64 4b 01 00       	mov    0x14b64,%eax
    233f:	89 44 24 04          	mov    %eax,0x4(%esp)
    2343:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2348:	89 44 24 08          	mov    %eax,0x8(%esp)
    234c:	e8 79 eb ff ff       	call   eca <updateFileList>
			unlink(name);
    2351:	8b 45 08             	mov    0x8(%ebp),%eax
    2354:	89 04 24             	mov    %eax,(%esp)
    2357:	e8 c3 39 00 00       	call   5d1f <unlink>
		}
	}
}
    235c:	c9                   	leave  
    235d:	c3                   	ret    

0000235e <h_deleteFile>:
void h_deleteFile(Point p) {
    235e:	55                   	push   %ebp
    235f:	89 e5                	mov    %esp,%ebp
    2361:	83 ec 48             	sub    $0x48,%esp
	struct fileItem *q = fileItemList;
    2364:	a1 30 14 01 00       	mov    0x11430,%eax
    2369:	89 45 f4             	mov    %eax,-0xc(%ebp)
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
    236c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    2373:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2376:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2379:	8b 45 f0             	mov    -0x10(%ebp),%eax
    237c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	printf(0, "hi1\n");
    237f:	c7 44 24 04 36 c7 00 	movl   $0xc736,0x4(%esp)
    2386:	00 
    2387:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    238e:	e8 24 3b 00 00       	call   5eb7 <printf>
	while (q != 0)
    2393:	e9 8d 00 00 00       	jmp    2425 <h_deleteFile+0xc7>
	{
		printf(0, "hi2\n");
    2398:	c7 44 24 04 3b c7 00 	movl   $0xc73b,0x4(%esp)
    239f:	00 
    23a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23a7:	e8 0b 3b 00 00       	call   5eb7 <printf>
		if (q->chosen)
    23ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23af:	8b 40 28             	mov    0x28(%eax),%eax
    23b2:	85 c0                	test   %eax,%eax
    23b4:	74 66                	je     241c <h_deleteFile+0xbe>
		{
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    23b6:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    23bd:	e8 e1 3d 00 00       	call   61a3 <malloc>
    23c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    23c5:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    23cc:	e8 d2 3d 00 00       	call   61a3 <malloc>
    23d1:	8b 55 f0             	mov    -0x10(%ebp),%edx
    23d4:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, q->name);
    23d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    23da:	8b 50 14             	mov    0x14(%eax),%edx
    23dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23e0:	8b 40 14             	mov    0x14(%eax),%eax
    23e3:	89 54 24 04          	mov    %edx,0x4(%esp)
    23e7:	89 04 24             	mov    %eax,(%esp)
    23ea:	e8 9d 36 00 00       	call   5a8c <strcpy>
			if(head == 0)
    23ef:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    23f3:	75 0e                	jne    2403 <h_deleteFile+0xa5>
			{
				head = p1;
    23f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
				p2 = p1;
    23fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
    23fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2401:	eb 0f                	jmp    2412 <h_deleteFile+0xb4>
			} else {
				p2->next = p1;
    2403:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2406:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2409:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    240c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    240f:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
    2412:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2415:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
		}
		q = q->next;
    241c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    241f:	8b 40 2c             	mov    0x2c(%eax),%eax
    2422:	89 45 f4             	mov    %eax,-0xc(%ebp)
void h_deleteFile(Point p) {
	struct fileItem *q = fileItemList;
	struct fileItem *p1, *head, *p2;
	head = p1 = p2 = 0;
	printf(0, "hi1\n");
	while (q != 0)
    2425:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2429:	0f 85 69 ff ff ff    	jne    2398 <h_deleteFile+0x3a>
			}
			p1->next = 0;
		}
		q = q->next;
	}
	p1 = head;
    242f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2432:	89 45 f0             	mov    %eax,-0x10(%ebp)
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
    2435:	c7 44 24 04 40 c7 00 	movl   $0xc740,0x4(%esp)
    243c:	00 
    243d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2444:	e8 6e 3a 00 00       	call   5eb7 <printf>
	while (p1 != 0)
    2449:	eb 17                	jmp    2462 <h_deleteFile+0x104>
	{
		deleteFile(p1->name);
    244b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    244e:	8b 40 14             	mov    0x14(%eax),%eax
    2451:	89 04 24             	mov    %eax,(%esp)
    2454:	e8 06 fe ff ff       	call   225f <deleteFile>
		p1 = p1->next;
    2459:	8b 45 f0             	mov    -0x10(%ebp),%eax
    245c:	8b 40 2c             	mov    0x2c(%eax),%eax
    245f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		}
		q = q->next;
	}
	p1 = head;
	printf(0, "here, I know what files are chosen, and is going to delete every single one of them! wish me good luck\n");
	while (p1 != 0)
    2462:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2466:	75 e3                	jne    244b <h_deleteFile+0xed>
	{
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
    2468:	c7 44 24 04 a8 c7 00 	movl   $0xc7a8,0x4(%esp)
    246f:	00 
    2470:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2477:	e8 3b 3a 00 00       	call   5eb7 <printf>
	p1 = head;
    247c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    247f:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while (p1 != 0) {
    2482:	eb 46                	jmp    24ca <h_deleteFile+0x16c>
		p2 = p1;
    2484:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2487:	89 45 e8             	mov    %eax,-0x18(%ebp)
		printf(0, "freeing %s\n", p2->name);
    248a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    248d:	8b 40 14             	mov    0x14(%eax),%eax
    2490:	89 44 24 08          	mov    %eax,0x8(%esp)
    2494:	c7 44 24 04 be c7 00 	movl   $0xc7be,0x4(%esp)
    249b:	00 
    249c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24a3:	e8 0f 3a 00 00       	call   5eb7 <printf>
		p1 = p1->next;
    24a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    24ab:	8b 40 2c             	mov    0x2c(%eax),%eax
    24ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
		free(p2->name);
    24b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24b4:	8b 40 14             	mov    0x14(%eax),%eax
    24b7:	89 04 24             	mov    %eax,(%esp)
    24ba:	e8 ab 3b 00 00       	call   606a <free>
		free(p2);
    24bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24c2:	89 04 24             	mov    %eax,(%esp)
    24c5:	e8 a0 3b 00 00       	call   606a <free>
		deleteFile(p1->name);
		p1 = p1->next;
	}
	printf(0, "i was so tm fast. :p\n");
	p1 = head;
	while (p1 != 0) {
    24ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    24ce:	75 b4                	jne    2484 <h_deleteFile+0x126>
		printf(0, "freeing %s\n", p2->name);
		p1 = p1->next;
		free(p2->name);
		free(p2);
	}
	printf(0, "done freeing!~~~\n");
    24d0:	c7 44 24 04 ca c7 00 	movl   $0xc7ca,0x4(%esp)
    24d7:	00 
    24d8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24df:	e8 d3 39 00 00       	call   5eb7 <printf>
	updateFileList(context);
    24e4:	a1 60 4b 01 00       	mov    0x14b60,%eax
    24e9:	89 04 24             	mov    %eax,(%esp)
    24ec:	a1 64 4b 01 00       	mov    0x14b64,%eax
    24f1:	89 44 24 04          	mov    %eax,0x4(%esp)
    24f5:	a1 68 4b 01 00       	mov    0x14b68,%eax
    24fa:	89 44 24 08          	mov    %eax,0x8(%esp)
    24fe:	e8 c7 e9 ff ff       	call   eca <updateFileList>
	printItemList();
    2503:	e8 72 ee ff ff       	call   137a <printItemList>
	drawFinderContent(context);
    2508:	a1 60 4b 01 00       	mov    0x14b60,%eax
    250d:	89 04 24             	mov    %eax,(%esp)
    2510:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2515:	89 44 24 04          	mov    %eax,0x4(%esp)
    2519:	a1 68 4b 01 00       	mov    0x14b68,%eax
    251e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2522:	e8 f2 ea ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    2527:	a1 60 4b 01 00       	mov    0x14b60,%eax
    252c:	89 04 24             	mov    %eax,(%esp)
    252f:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2534:	89 44 24 04          	mov    %eax,0x4(%esp)
    2538:	a1 68 4b 01 00       	mov    0x14b68,%eax
    253d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2541:	e8 85 e7 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2546:	8d 45 d8             	lea    -0x28(%ebp),%eax
    2549:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2550:	00 
    2551:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2558:	00 
    2559:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2560:	00 
    2561:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2568:	00 
    2569:	89 04 24             	mov    %eax,(%esp)
    256c:	e8 07 2e 00 00       	call   5378 <initRect>
    2571:	83 ec 04             	sub    $0x4,%esp
    2574:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2577:	89 44 24 04          	mov    %eax,0x4(%esp)
    257b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    257e:	89 44 24 08          	mov    %eax,0x8(%esp)
    2582:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2585:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2589:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    258c:	89 44 24 10          	mov    %eax,0x10(%esp)
    2590:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    2597:	e8 df 2f 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    259c:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    25a3:	e8 a7 f0 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    25a8:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    25af:	e8 13 f0 ff ff       	call   15c7 <addListEvent>
}
    25b4:	c9                   	leave  
    25b5:	c3                   	ret    

000025b6 <saveRename>:

void saveRename(){
    25b6:	55                   	push   %ebp
    25b7:	89 e5                	mov    %esp,%ebp
    25b9:	53                   	push   %ebx
    25ba:	81 ec 24 02 00 00    	sub    $0x224,%esp
	char tempName[MAX_NAME_LEN];
	char tempNameFrom[MAX_NAME_LEN];
	int i;
	strcpy(tempNameFrom, currentPath);
    25c0:	c7 44 24 04 a0 4b 01 	movl   $0x14ba0,0x4(%esp)
    25c7:	00 
    25c8:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    25ce:	89 04 24             	mov    %eax,(%esp)
    25d1:	e8 b6 34 00 00       	call   5a8c <strcpy>
	strcpy(tempName, currentlyRenaming->name);
    25d6:	a1 2c 14 01 00       	mov    0x1142c,%eax
    25db:	8b 40 14             	mov    0x14(%eax),%eax
    25de:	89 44 24 04          	mov    %eax,0x4(%esp)
    25e2:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    25e8:	89 04 24             	mov    %eax,(%esp)
    25eb:	e8 9c 34 00 00       	call   5a8c <strcpy>
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
    25f0:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    25f6:	89 04 24             	mov    %eax,(%esp)
    25f9:	e8 fd 34 00 00       	call   5afb <strlen>
    25fe:	8d 95 f4 fd ff ff    	lea    -0x20c(%ebp),%edx
    2604:	01 d0                	add    %edx,%eax
    2606:	c7 44 24 04 60 4a 01 	movl   $0x14a60,0x4(%esp)
    260d:	00 
    260e:	89 04 24             	mov    %eax,(%esp)
    2611:	e8 76 34 00 00       	call   5a8c <strcpy>
	printf(0, "why? %s", tempName);
    2616:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    261c:	89 44 24 08          	mov    %eax,0x8(%esp)
    2620:	c7 44 24 04 dc c7 00 	movl   $0xc7dc,0x4(%esp)
    2627:	00 
    2628:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    262f:	e8 83 38 00 00       	call   5eb7 <printf>
	if(currentlyRenaming->st.type != T_DIR){
    2634:	a1 2c 14 01 00       	mov    0x1142c,%eax
    2639:	0f b7 00             	movzwl (%eax),%eax
    263c:	66 83 f8 01          	cmp    $0x1,%ax
    2640:	74 7c                	je     26be <saveRename+0x108>
		for(i = 0; i < strlen(tempName); i++){
    2642:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2649:	eb 42                	jmp    268d <saveRename+0xd7>
			if(tempName[i] == '.'){
    264b:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    2651:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2654:	01 d0                	add    %edx,%eax
    2656:	0f b6 00             	movzbl (%eax),%eax
    2659:	3c 2e                	cmp    $0x2e,%al
    265b:	75 2c                	jne    2689 <saveRename+0xd3>
				if(pasteJustFile(tempNameFrom, tempName)){
    265d:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2663:	89 44 24 04          	mov    %eax,0x4(%esp)
    2667:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    266d:	89 04 24             	mov    %eax,(%esp)
    2670:	e8 5c 03 00 00       	call   29d1 <pasteJustFile>
    2675:	85 c0                	test   %eax,%eax
    2677:	74 10                	je     2689 <saveRename+0xd3>
					deleteFile(tempNameFrom);
    2679:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    267f:	89 04 24             	mov    %eax,(%esp)
    2682:	e8 d8 fb ff ff       	call   225f <deleteFile>
    2687:	eb 7d                	jmp    2706 <saveRename+0x150>
	strcpy(tempNameFrom, currentPath);
	strcpy(tempName, currentlyRenaming->name);
	strcpy(tempNameFrom + strlen(tempNameFrom), renameFrom);
	printf(0, "why? %s", tempName);
	if(currentlyRenaming->st.type != T_DIR){
		for(i = 0; i < strlen(tempName); i++){
    2689:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    268d:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    2690:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    2696:	89 04 24             	mov    %eax,(%esp)
    2699:	e8 5d 34 00 00       	call   5afb <strlen>
    269e:	39 c3                	cmp    %eax,%ebx
    26a0:	72 a9                	jb     264b <saveRename+0x95>
					deleteFile(tempNameFrom);
					return;
				}
			}
		}
		tempName[i] = '.';
    26a2:	8d 95 f4 fe ff ff    	lea    -0x10c(%ebp),%edx
    26a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26ab:	01 d0                	add    %edx,%eax
    26ad:	c6 00 2e             	movb   $0x2e,(%eax)
		tempName[i + 1] = 0;
    26b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26b3:	83 c0 01             	add    $0x1,%eax
    26b6:	c6 84 05 f4 fe ff ff 	movb   $0x0,-0x10c(%ebp,%eax,1)
    26bd:	00 
	}
	printf(0, "renameFrom is %s\n", tempNameFrom);
    26be:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    26c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    26c8:	c7 44 24 04 e4 c7 00 	movl   $0xc7e4,0x4(%esp)
    26cf:	00 
    26d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26d7:	e8 db 37 00 00       	call   5eb7 <printf>
	if(pasteJustFile(tempNameFrom, tempName))
    26dc:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
    26e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    26e6:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    26ec:	89 04 24             	mov    %eax,(%esp)
    26ef:	e8 dd 02 00 00       	call   29d1 <pasteJustFile>
    26f4:	85 c0                	test   %eax,%eax
    26f6:	74 0e                	je     2706 <saveRename+0x150>
		deleteFile(tempNameFrom);
    26f8:	8d 85 f4 fd ff ff    	lea    -0x20c(%ebp),%eax
    26fe:	89 04 24             	mov    %eax,(%esp)
    2701:	e8 59 fb ff ff       	call   225f <deleteFile>
}
    2706:	81 c4 24 02 00 00    	add    $0x224,%esp
    270c:	5b                   	pop    %ebx
    270d:	5d                   	pop    %ebp
    270e:	c3                   	ret    

0000270f <unrename>:

void unrename(){
    270f:	55                   	push   %ebp
    2710:	89 e5                	mov    %esp,%ebp
    2712:	83 ec 38             	sub    $0x38,%esp
	printf(0, "renaming! currentlyRenaming: %s\n", currentlyRenaming->name);
    2715:	a1 2c 14 01 00       	mov    0x1142c,%eax
    271a:	8b 40 14             	mov    0x14(%eax),%eax
    271d:	89 44 24 08          	mov    %eax,0x8(%esp)
    2721:	c7 44 24 04 f8 c7 00 	movl   $0xc7f8,0x4(%esp)
    2728:	00 
    2729:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2730:	e8 82 37 00 00       	call   5eb7 <printf>
	saveRename();
    2735:	e8 7c fe ff ff       	call   25b6 <saveRename>
	currentlyRenaming->chosen = 1;
    273a:	a1 2c 14 01 00       	mov    0x1142c,%eax
    273f:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	currentlyRenaming = 0;
    2746:	c7 05 2c 14 01 00 00 	movl   $0x0,0x1142c
    274d:	00 00 00 
	renaming = 0;
    2750:	c7 05 b4 4c 01 00 00 	movl   $0x0,0x14cb4
    2757:	00 00 00 
	freeFileItemList();
    275a:	e8 38 dd ff ff       	call   497 <freeFileItemList>
	list(".");
    275f:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    2766:	e8 0a de ff ff       	call   575 <list>
	printItemList();
    276b:	e8 0a ec ff ff       	call   137a <printItemList>
	drawFinderContent(context);
    2770:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2775:	89 04 24             	mov    %eax,(%esp)
    2778:	a1 64 4b 01 00       	mov    0x14b64,%eax
    277d:	89 44 24 04          	mov    %eax,0x4(%esp)
    2781:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2786:	89 44 24 08          	mov    %eax,0x8(%esp)
    278a:	e8 8a e8 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    278f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2794:	89 04 24             	mov    %eax,(%esp)
    2797:	a1 64 4b 01 00       	mov    0x14b64,%eax
    279c:	89 44 24 04          	mov    %eax,0x4(%esp)
    27a0:	a1 68 4b 01 00       	mov    0x14b68,%eax
    27a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    27a9:	e8 1d e5 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    27ae:	8d 45 e8             	lea    -0x18(%ebp),%eax
    27b1:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    27b8:	00 
    27b9:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    27c0:	00 
    27c1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    27c8:	00 
    27c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    27d0:	00 
    27d1:	89 04 24             	mov    %eax,(%esp)
    27d4:	e8 9f 2b 00 00       	call   5378 <initRect>
    27d9:	83 ec 04             	sub    $0x4,%esp
    27dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27df:	89 44 24 04          	mov    %eax,0x4(%esp)
    27e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27e6:	89 44 24 08          	mov    %eax,0x8(%esp)
    27ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    27ed:	89 44 24 0c          	mov    %eax,0xc(%esp)
    27f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f4:	89 44 24 10          	mov    %eax,0x10(%esp)
    27f8:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    27ff:	e8 77 2d 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    2804:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    280b:	e8 3f ee ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    2810:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    2817:	e8 ab ed ff ff       	call   15c7 <addListEvent>
}
    281c:	c9                   	leave  
    281d:	c3                   	ret    

0000281e <copyFile>:

void copyFile(){
    281e:	55                   	push   %ebp
    281f:	89 e5                	mov    %esp,%ebp
    2821:	56                   	push   %esi
    2822:	53                   	push   %ebx
    2823:	83 ec 20             	sub    $0x20,%esp
	int fd;
	struct fileItem *p = fileItemList;
    2826:	a1 30 14 01 00       	mov    0x11430,%eax
    282b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(p != 0){
    282e:	e9 0f 01 00 00       	jmp    2942 <copyFile+0x124>
		if (p->chosen == 1){
    2833:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2836:	8b 40 28             	mov    0x28(%eax),%eax
    2839:	83 f8 01             	cmp    $0x1,%eax
    283c:	0f 85 f7 00 00 00    	jne    2939 <copyFile+0x11b>
			if(lenOfWaited >= MAX_COPY_SIZE){
    2842:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    2847:	83 f8 07             	cmp    $0x7,%eax
    284a:	7e 22                	jle    286e <copyFile+0x50>
				printf(0, "Too Much Files To Copy %d\n", lenOfWaited);
    284c:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    2851:	89 44 24 08          	mov    %eax,0x8(%esp)
    2855:	c7 44 24 04 19 c8 00 	movl   $0xc819,0x4(%esp)
    285c:	00 
    285d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2864:	e8 4e 36 00 00       	call   5eb7 <printf>
    2869:	e9 cb 00 00 00       	jmp    2939 <copyFile+0x11b>
			}
			else{
				if((fd = open(p->name, O_RDONLY)) >= 0){
    286e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2871:	8b 40 14             	mov    0x14(%eax),%eax
    2874:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    287b:	00 
    287c:	89 04 24             	mov    %eax,(%esp)
    287f:	e8 8b 34 00 00       	call   5d0f <open>
    2884:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2887:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    288b:	0f 88 8a 00 00 00    	js     291b <copyFile+0xfd>
					strcpy(filesWaited[lenOfWaited], currentPath);
    2891:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    2896:	c1 e0 08             	shl    $0x8,%eax
    2899:	05 60 42 01 00       	add    $0x14260,%eax
    289e:	c7 44 24 04 a0 4b 01 	movl   $0x14ba0,0x4(%esp)
    28a5:	00 
    28a6:	89 04 24             	mov    %eax,(%esp)
    28a9:	e8 de 31 00 00       	call   5a8c <strcpy>
					strcpy(filesWaited[lenOfWaited] + strlen(currentPath), p->name);
    28ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    28b1:	8b 58 14             	mov    0x14(%eax),%ebx
    28b4:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    28b9:	c1 e0 08             	shl    $0x8,%eax
    28bc:	8d b0 60 42 01 00    	lea    0x14260(%eax),%esi
    28c2:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    28c9:	e8 2d 32 00 00       	call   5afb <strlen>
    28ce:	01 f0                	add    %esi,%eax
    28d0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    28d4:	89 04 24             	mov    %eax,(%esp)
    28d7:	e8 b0 31 00 00       	call   5a8c <strcpy>
					printf(0, "Open File %s Succeed\n", filesWaited[lenOfWaited]);
    28dc:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    28e1:	c1 e0 08             	shl    $0x8,%eax
    28e4:	05 60 42 01 00       	add    $0x14260,%eax
    28e9:	89 44 24 08          	mov    %eax,0x8(%esp)
    28ed:	c7 44 24 04 34 c8 00 	movl   $0xc834,0x4(%esp)
    28f4:	00 
    28f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28fc:	e8 b6 35 00 00       	call   5eb7 <printf>
					lenOfWaited++;
    2901:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    2906:	83 c0 01             	add    $0x1,%eax
    2909:	a3 b8 4c 01 00       	mov    %eax,0x14cb8
					close(fd);
    290e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2911:	89 04 24             	mov    %eax,(%esp)
    2914:	e8 de 33 00 00       	call   5cf7 <close>
    2919:	eb 1e                	jmp    2939 <copyFile+0x11b>
				}
				else{
					printf(0, "Open File %s Failed\n", p->name);
    291b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    291e:	8b 40 14             	mov    0x14(%eax),%eax
    2921:	89 44 24 08          	mov    %eax,0x8(%esp)
    2925:	c7 44 24 04 4a c8 00 	movl   $0xc84a,0x4(%esp)
    292c:	00 
    292d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2934:	e8 7e 35 00 00       	call   5eb7 <printf>
				}
			}
		}
		p = p->next;
    2939:	8b 45 f4             	mov    -0xc(%ebp),%eax
    293c:	8b 40 2c             	mov    0x2c(%eax),%eax
    293f:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

void copyFile(){
	int fd;
	struct fileItem *p = fileItemList;
	while(p != 0){
    2942:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2946:	0f 85 e7 fe ff ff    	jne    2833 <copyFile+0x15>
				}
			}
		}
		p = p->next;
	}
}
    294c:	83 c4 20             	add    $0x20,%esp
    294f:	5b                   	pop    %ebx
    2950:	5e                   	pop    %esi
    2951:	5d                   	pop    %ebp
    2952:	c3                   	ret    

00002953 <h_copyFile>:

void h_copyFile(Point p){
    2953:	55                   	push   %ebp
    2954:	89 e5                	mov    %esp,%ebp
    2956:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 0;
    2959:	c7 05 24 14 01 00 00 	movl   $0x0,0x11424
    2960:	00 00 00 
	lenOfWaited = 0;
    2963:	c7 05 b8 4c 01 00 00 	movl   $0x0,0x14cb8
    296a:	00 00 00 
	copyFile();
    296d:	e8 ac fe ff ff       	call   281e <copyFile>
}
    2972:	c9                   	leave  
    2973:	c3                   	ret    

00002974 <moveFile>:

void moveFile(){
    2974:	55                   	push   %ebp
    2975:	89 e5                	mov    %esp,%ebp
    2977:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < lenOfWaited; i++)
    297a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2981:	eb 17                	jmp    299a <moveFile+0x26>
		deleteFile(filesWaited[i]);
    2983:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2986:	c1 e0 08             	shl    $0x8,%eax
    2989:	05 60 42 01 00       	add    $0x14260,%eax
    298e:	89 04 24             	mov    %eax,(%esp)
    2991:	e8 c9 f8 ff ff       	call   225f <deleteFile>
	copyFile();
}

void moveFile(){
	int i;
	for (i = 0; i < lenOfWaited; i++)
    2996:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    299a:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    299f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    29a2:	7c df                	jl     2983 <moveFile+0xf>
		deleteFile(filesWaited[i]);
	lenOfWaited = 0;
    29a4:	c7 05 b8 4c 01 00 00 	movl   $0x0,0x14cb8
    29ab:	00 00 00 
}
    29ae:	c9                   	leave  
    29af:	c3                   	ret    

000029b0 <h_cutFile>:

void h_cutFile(Point p){
    29b0:	55                   	push   %ebp
    29b1:	89 e5                	mov    %esp,%ebp
    29b3:	83 ec 08             	sub    $0x8,%esp
	copyOrCut = 1;
    29b6:	c7 05 24 14 01 00 01 	movl   $0x1,0x11424
    29bd:	00 00 00 
	lenOfWaited = 0;
    29c0:	c7 05 b8 4c 01 00 00 	movl   $0x0,0x14cb8
    29c7:	00 00 00 
	copyFile();
    29ca:	e8 4f fe ff ff       	call   281e <copyFile>
}
    29cf:	c9                   	leave  
    29d0:	c3                   	ret    

000029d1 <pasteJustFile>:

int pasteJustFile(char *src, char *filename){
    29d1:	55                   	push   %ebp
    29d2:	89 e5                	mov    %esp,%ebp
    29d4:	81 ec 48 02 00 00    	sub    $0x248,%esp
	printf(0, "currentPath: %s, copying from %s, to %s~\n", currentPath, src, filename);
    29da:	8b 45 0c             	mov    0xc(%ebp),%eax
    29dd:	89 44 24 10          	mov    %eax,0x10(%esp)
    29e1:	8b 45 08             	mov    0x8(%ebp),%eax
    29e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    29e8:	c7 44 24 08 a0 4b 01 	movl   $0x14ba0,0x8(%esp)
    29ef:	00 
    29f0:	c7 44 24 04 60 c8 00 	movl   $0xc860,0x4(%esp)
    29f7:	00 
    29f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29ff:	e8 b3 34 00 00       	call   5eb7 <printf>
	int size = 0;
    2a04:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
	int file_src, file_dest;
	struct fileItem *p;
	struct fileItem *p1, *head, *p2;
	char* buff = (char*)malloc(4096 * sizeof(char));
    2a0b:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2a12:	e8 8c 37 00 00       	call   61a3 <malloc>
    2a17:	89 45 d8             	mov    %eax,-0x28(%ebp)
	char tempSrc[MAX_NAME_LEN];
	char tempName[MAX_NAME_LEN];
	memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2a1a:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2a21:	00 
    2a22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a29:	00 
    2a2a:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2a30:	89 04 24             	mov    %eax,(%esp)
    2a33:	e8 ea 30 00 00       	call   5b22 <memset>
	memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2a38:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2a3f:	00 
    2a40:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a47:	00 
    2a48:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2a4e:	89 04 24             	mov    %eax,(%esp)
    2a51:	e8 cc 30 00 00       	call   5b22 <memset>
	memset(buff, 0, 4096);
    2a56:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2a5d:	00 
    2a5e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2a65:	00 
    2a66:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2a69:	89 04 24             	mov    %eax,(%esp)
    2a6c:	e8 b1 30 00 00       	call   5b22 <memset>
	if(chdir(filename) >= 0){
    2a71:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a74:	89 04 24             	mov    %eax,(%esp)
    2a77:	e8 c3 32 00 00       	call   5d3f <chdir>
    2a7c:	85 c0                	test   %eax,%eax
    2a7e:	78 3c                	js     2abc <pasteJustFile+0xeb>
		printf(0, "Directory %s already exist\n", filename);
    2a80:	8b 45 0c             	mov    0xc(%ebp),%eax
    2a83:	89 44 24 08          	mov    %eax,0x8(%esp)
    2a87:	c7 44 24 04 8a c8 00 	movl   $0xc88a,0x4(%esp)
    2a8e:	00 
    2a8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a96:	e8 1c 34 00 00       	call   5eb7 <printf>
		free(buff);
    2a9b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2a9e:	89 04 24             	mov    %eax,(%esp)
    2aa1:	e8 c4 35 00 00       	call   606a <free>
		chdir("..");
    2aa6:	c7 04 24 33 c7 00 00 	movl   $0xc733,(%esp)
    2aad:	e8 8d 32 00 00       	call   5d3f <chdir>
		return 0;
    2ab2:	b8 00 00 00 00       	mov    $0x0,%eax
    2ab7:	e9 c9 03 00 00       	jmp    2e85 <pasteJustFile+0x4b4>
	}
	else if(chdir(src) >= 0){
    2abc:	8b 45 08             	mov    0x8(%ebp),%eax
    2abf:	89 04 24             	mov    %eax,(%esp)
    2ac2:	e8 78 32 00 00       	call   5d3f <chdir>
    2ac7:	85 c0                	test   %eax,%eax
    2ac9:	0f 88 67 02 00 00    	js     2d36 <pasteJustFile+0x365>
		freeFileItemList();
    2acf:	e8 c3 d9 ff ff       	call   497 <freeFileItemList>
		list(".");
    2ad4:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    2adb:	e8 95 da ff ff       	call   575 <list>
		chdir(currentPath);
    2ae0:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    2ae7:	e8 53 32 00 00       	call   5d3f <chdir>
		mkdir(filename);
    2aec:	8b 45 0c             	mov    0xc(%ebp),%eax
    2aef:	89 04 24             	mov    %eax,(%esp)
    2af2:	e8 40 32 00 00       	call   5d37 <mkdir>
		updatePath(filename);
    2af7:	8b 45 0c             	mov    0xc(%ebp),%eax
    2afa:	89 04 24             	mov    %eax,(%esp)
    2afd:	e8 4b f1 ff ff       	call   1c4d <updatePath>
		chdir(currentPath);
    2b02:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    2b09:	e8 31 32 00 00       	call   5d3f <chdir>
        head = p1 = p2 = 0;
    2b0e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    2b15:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2b18:	89 45 e8             	mov    %eax,-0x18(%ebp)
    2b1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        p = fileItemList;
    2b21:	a1 30 14 01 00       	mov    0x11430,%eax
    2b26:	89 45 ec             	mov    %eax,-0x14(%ebp)
	    printf(0, "hello1\n");
    2b29:	c7 44 24 04 a6 c8 00 	movl   $0xc8a6,0x4(%esp)
    2b30:	00 
    2b31:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b38:	e8 7a 33 00 00       	call   5eb7 <printf>
		while (p != 0)
    2b3d:	e9 83 00 00 00       	jmp    2bc5 <pasteJustFile+0x1f4>
		{
			printf(0, "hello2\n");
    2b42:	c7 44 24 04 ae c8 00 	movl   $0xc8ae,0x4(%esp)
    2b49:	00 
    2b4a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b51:	e8 61 33 00 00       	call   5eb7 <printf>
			p1 = (struct fileItem *)malloc(sizeof(struct fileItem));
    2b56:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
    2b5d:	e8 41 36 00 00       	call   61a3 <malloc>
    2b62:	89 45 e8             	mov    %eax,-0x18(%ebp)
			p1->name = (char *)malloc(32 * sizeof(char));
    2b65:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    2b6c:	e8 32 36 00 00       	call   61a3 <malloc>
    2b71:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2b74:	89 42 14             	mov    %eax,0x14(%edx)
			strcpy(p1->name, p->name);
    2b77:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2b7a:	8b 50 14             	mov    0x14(%eax),%edx
    2b7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b80:	8b 40 14             	mov    0x14(%eax),%eax
    2b83:	89 54 24 04          	mov    %edx,0x4(%esp)
    2b87:	89 04 24             	mov    %eax,(%esp)
    2b8a:	e8 fd 2e 00 00       	call   5a8c <strcpy>
			if(head == 0)
    2b8f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2b93:	75 0e                	jne    2ba3 <pasteJustFile+0x1d2>
			{
				head = p1;
    2b95:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
				p2 = p1;
    2b9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2b9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
    2ba1:	eb 0f                	jmp    2bb2 <pasteJustFile+0x1e1>
			} else {
				p2->next = p1;
    2ba3:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2ba6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2ba9:	89 50 2c             	mov    %edx,0x2c(%eax)
				p2 = p1;
    2bac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2baf:	89 45 e0             	mov    %eax,-0x20(%ebp)
			}
			p1->next = 0;
    2bb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2bb5:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
			p = p->next;
    2bbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2bbf:	8b 40 2c             	mov    0x2c(%eax),%eax
    2bc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
		updatePath(filename);
		chdir(currentPath);
        head = p1 = p2 = 0;
        p = fileItemList;
	    printf(0, "hello1\n");
		while (p != 0)
    2bc5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2bc9:	0f 85 73 ff ff ff    	jne    2b42 <pasteJustFile+0x171>
				p2 = p1;
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
    2bcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2bd2:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while(p1 != 0){
    2bd5:	e9 e1 00 00 00       	jmp    2cbb <pasteJustFile+0x2ea>
			strcpy(tempSrc, src);
    2bda:	8b 45 08             	mov    0x8(%ebp),%eax
    2bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
    2be1:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2be7:	89 04 24             	mov    %eax,(%esp)
    2bea:	e8 9d 2e 00 00       	call   5a8c <strcpy>
			strcpy(tempName, p1->name);
    2bef:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2bf2:	8b 40 14             	mov    0x14(%eax),%eax
    2bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
    2bf9:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2bff:	89 04 24             	mov    %eax,(%esp)
    2c02:	e8 85 2e 00 00       	call   5a8c <strcpy>
			tempSrc[strlen(tempSrc) + 1] = 0;
    2c07:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2c0d:	89 04 24             	mov    %eax,(%esp)
    2c10:	e8 e6 2e 00 00       	call   5afb <strlen>
    2c15:	83 c0 01             	add    $0x1,%eax
    2c18:	c6 84 05 d8 fe ff ff 	movb   $0x0,-0x128(%ebp,%eax,1)
    2c1f:	00 
			tempSrc[strlen(tempSrc)] = '/';
    2c20:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2c26:	89 04 24             	mov    %eax,(%esp)
    2c29:	e8 cd 2e 00 00       	call   5afb <strlen>
    2c2e:	c6 84 05 d8 fe ff ff 	movb   $0x2f,-0x128(%ebp,%eax,1)
    2c35:	2f 
			strcpy(tempSrc+strlen(tempSrc), tempName);
    2c36:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2c3c:	89 04 24             	mov    %eax,(%esp)
    2c3f:	e8 b7 2e 00 00       	call   5afb <strlen>
    2c44:	8d 95 d8 fe ff ff    	lea    -0x128(%ebp),%edx
    2c4a:	01 c2                	add    %eax,%edx
    2c4c:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2c52:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c56:	89 14 24             	mov    %edx,(%esp)
    2c59:	e8 2e 2e 00 00       	call   5a8c <strcpy>
			pasteJustFile(tempSrc, tempName);
    2c5e:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2c64:	89 44 24 04          	mov    %eax,0x4(%esp)
    2c68:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2c6e:	89 04 24             	mov    %eax,(%esp)
    2c71:	e8 5b fd ff ff       	call   29d1 <pasteJustFile>
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
    2c76:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2c7d:	00 
    2c7e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2c85:	00 
    2c86:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
    2c8c:	89 04 24             	mov    %eax,(%esp)
    2c8f:	e8 8e 2e 00 00       	call   5b22 <memset>
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
    2c94:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
    2c9b:	00 
    2c9c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ca3:	00 
    2ca4:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
    2caa:	89 04 24             	mov    %eax,(%esp)
    2cad:	e8 70 2e 00 00       	call   5b22 <memset>
			p1 = p1->next;
    2cb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2cb5:	8b 40 2c             	mov    0x2c(%eax),%eax
    2cb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}
			p1->next = 0;
			p = p->next;
		}
		p1 = head;
		while(p1 != 0){
    2cbb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2cbf:	0f 85 15 ff ff ff    	jne    2bda <pasteJustFile+0x209>
			pasteJustFile(tempSrc, tempName);
			memset(tempName, '\0', sizeof(tempName)/sizeof(char));
			memset(tempSrc, '\0', sizeof(tempSrc)/sizeof(char));
			p1 = p1->next;
		}
		chdir("..");
    2cc5:	c7 04 24 33 c7 00 00 	movl   $0xc733,(%esp)
    2ccc:	e8 6e 30 00 00       	call   5d3f <chdir>
		updatePath("..");
    2cd1:	c7 04 24 33 c7 00 00 	movl   $0xc733,(%esp)
    2cd8:	e8 70 ef ff ff       	call   1c4d <updatePath>
		p1 = head;
    2cdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    2ce0:	89 45 e8             	mov    %eax,-0x18(%ebp)
		while (p1 != 0) {
    2ce3:	eb 46                	jmp    2d2b <pasteJustFile+0x35a>
			p2 = p1;
    2ce5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ce8:	89 45 e0             	mov    %eax,-0x20(%ebp)
			printf(0, "freeing %s\n", p2->name);
    2ceb:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2cee:	8b 40 14             	mov    0x14(%eax),%eax
    2cf1:	89 44 24 08          	mov    %eax,0x8(%esp)
    2cf5:	c7 44 24 04 be c7 00 	movl   $0xc7be,0x4(%esp)
    2cfc:	00 
    2cfd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d04:	e8 ae 31 00 00       	call   5eb7 <printf>
			p1 = p1->next;
    2d09:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2d0c:	8b 40 2c             	mov    0x2c(%eax),%eax
    2d0f:	89 45 e8             	mov    %eax,-0x18(%ebp)
			free(p2->name);
    2d12:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d15:	8b 40 14             	mov    0x14(%eax),%eax
    2d18:	89 04 24             	mov    %eax,(%esp)
    2d1b:	e8 4a 33 00 00       	call   606a <free>
			free(p2);
    2d20:	8b 45 e0             	mov    -0x20(%ebp),%eax
    2d23:	89 04 24             	mov    %eax,(%esp)
    2d26:	e8 3f 33 00 00       	call   606a <free>
			p1 = p1->next;
		}
		chdir("..");
		updatePath("..");
		p1 = head;
		while (p1 != 0) {
    2d2b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2d2f:	75 b4                	jne    2ce5 <pasteJustFile+0x314>
    2d31:	e9 15 01 00 00       	jmp    2e4b <pasteJustFile+0x47a>
			free(p2->name);
			free(p2);
		}
	}
	else{
		file_src = open(src, O_RDONLY);
    2d36:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d3d:	00 
    2d3e:	8b 45 08             	mov    0x8(%ebp),%eax
    2d41:	89 04 24             	mov    %eax,(%esp)
    2d44:	e8 c6 2f 00 00       	call   5d0f <open>
    2d49:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if((file_dest = open(filename, O_RDONLY)) >= 0){
    2d4c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d53:	00 
    2d54:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d57:	89 04 24             	mov    %eax,(%esp)
    2d5a:	e8 b0 2f 00 00       	call   5d0f <open>
    2d5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2d62:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d66:	78 46                	js     2dae <pasteJustFile+0x3dd>
			printf(0, "File %s already exist\n", filename);
    2d68:	8b 45 0c             	mov    0xc(%ebp),%eax
    2d6b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2d6f:	c7 44 24 04 b6 c8 00 	movl   $0xc8b6,0x4(%esp)
    2d76:	00 
    2d77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d7e:	e8 34 31 00 00       	call   5eb7 <printf>
			close(file_dest);
    2d83:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d86:	89 04 24             	mov    %eax,(%esp)
    2d89:	e8 69 2f 00 00       	call   5cf7 <close>
			close(file_src);
    2d8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2d91:	89 04 24             	mov    %eax,(%esp)
    2d94:	e8 5e 2f 00 00       	call   5cf7 <close>
			free(buff);
    2d99:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2d9c:	89 04 24             	mov    %eax,(%esp)
    2d9f:	e8 c6 32 00 00       	call   606a <free>
			return 0;
    2da4:	b8 00 00 00 00       	mov    $0x0,%eax
    2da9:	e9 d7 00 00 00       	jmp    2e85 <pasteJustFile+0x4b4>
		}
		else{
			file_dest = open(filename, O_CREATE);
    2dae:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2db5:	00 
    2db6:	8b 45 0c             	mov    0xc(%ebp),%eax
    2db9:	89 04 24             	mov    %eax,(%esp)
    2dbc:	e8 4e 2f 00 00       	call   5d0f <open>
    2dc1:	89 45 f0             	mov    %eax,-0x10(%ebp)
			while((size = read(file_src, buff, 4096)) > 0)
    2dc4:	eb 19                	jmp    2ddf <pasteJustFile+0x40e>
				write(file_dest, buff, size);
    2dc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2dc9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2dcd:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2dd0:	89 44 24 04          	mov    %eax,0x4(%esp)
    2dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2dd7:	89 04 24             	mov    %eax,(%esp)
    2dda:	e8 10 2f 00 00       	call   5cef <write>
			free(buff);
			return 0;
		}
		else{
			file_dest = open(filename, O_CREATE);
			while((size = read(file_src, buff, 4096)) > 0)
    2ddf:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    2de6:	00 
    2de7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2dea:	89 44 24 04          	mov    %eax,0x4(%esp)
    2dee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2df1:	89 04 24             	mov    %eax,(%esp)
    2df4:	e8 ee 2e 00 00       	call   5ce7 <read>
    2df9:	89 45 dc             	mov    %eax,-0x24(%ebp)
    2dfc:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2e00:	7f c4                	jg     2dc6 <pasteJustFile+0x3f5>
				write(file_dest, buff, size);
			if(size < 0)
    2e02:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    2e06:	79 43                	jns    2e4b <pasteJustFile+0x47a>
			{
				//printf(2, "copy file error!!!\r\n");
				printf(0, "File %s error\n", filename);
    2e08:	8b 45 0c             	mov    0xc(%ebp),%eax
    2e0b:	89 44 24 08          	mov    %eax,0x8(%esp)
    2e0f:	c7 44 24 04 cd c8 00 	movl   $0xc8cd,0x4(%esp)
    2e16:	00 
    2e17:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e1e:	e8 94 30 00 00       	call   5eb7 <printf>
				close(file_dest);
    2e23:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e26:	89 04 24             	mov    %eax,(%esp)
    2e29:	e8 c9 2e 00 00       	call   5cf7 <close>
				close(file_src);
    2e2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e31:	89 04 24             	mov    %eax,(%esp)
    2e34:	e8 be 2e 00 00       	call   5cf7 <close>
				free(buff);
    2e39:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2e3c:	89 04 24             	mov    %eax,(%esp)
    2e3f:	e8 26 32 00 00       	call   606a <free>
				return 0;
    2e44:	b8 00 00 00 00       	mov    $0x0,%eax
    2e49:	eb 3a                	jmp    2e85 <pasteJustFile+0x4b4>
			}
		}
	}
	close(file_dest);
    2e4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2e4e:	89 04 24             	mov    %eax,(%esp)
    2e51:	e8 a1 2e 00 00       	call   5cf7 <close>
	close(file_src);
    2e56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e59:	89 04 24             	mov    %eax,(%esp)
    2e5c:	e8 96 2e 00 00       	call   5cf7 <close>
	free(buff);
    2e61:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2e64:	89 04 24             	mov    %eax,(%esp)
    2e67:	e8 fe 31 00 00       	call   606a <free>
	printf(0,"copy end\n");
    2e6c:	c7 44 24 04 dc c8 00 	movl   $0xc8dc,0x4(%esp)
    2e73:	00 
    2e74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e7b:	e8 37 30 00 00       	call   5eb7 <printf>
	return 1;
    2e80:	b8 01 00 00 00       	mov    $0x1,%eax
}
    2e85:	c9                   	leave  
    2e86:	c3                   	ret    

00002e87 <pasteFile>:

void pasteFile(){
    2e87:	55                   	push   %ebp
    2e88:	89 e5                	mov    %esp,%ebp
    2e8a:	83 ec 28             	sub    $0x28,%esp
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2e8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2e94:	e9 c1 00 00 00       	jmp    2f5a <pasteFile+0xd3>
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
    2e99:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e9c:	c1 e0 08             	shl    $0x8,%eax
    2e9f:	05 60 42 01 00       	add    $0x14260,%eax
    2ea4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2ea8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2eab:	89 44 24 08          	mov    %eax,0x8(%esp)
    2eaf:	c7 44 24 04 e6 c8 00 	movl   $0xc8e6,0x4(%esp)
    2eb6:	00 
    2eb7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ebe:	e8 f4 2f 00 00       	call   5eb7 <printf>
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2ec3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ec6:	c1 e0 08             	shl    $0x8,%eax
    2ec9:	05 60 42 01 00       	add    $0x14260,%eax
    2ece:	89 04 24             	mov    %eax,(%esp)
    2ed1:	e8 25 2c 00 00       	call   5afb <strlen>
    2ed6:	83 e8 01             	sub    $0x1,%eax
    2ed9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    2edc:	eb 35                	jmp    2f13 <pasteFile+0x8c>
			if (*(filesWaited[i]+j) == '/'){
    2ede:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ee1:	c1 e0 08             	shl    $0x8,%eax
    2ee4:	8d 90 60 42 01 00    	lea    0x14260(%eax),%edx
    2eea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2eed:	01 d0                	add    %edx,%eax
    2eef:	0f b6 00             	movzbl (%eax),%eax
    2ef2:	3c 2f                	cmp    $0x2f,%al
    2ef4:	75 19                	jne    2f0f <pasteFile+0x88>
				filename = filesWaited[i] + j + 1;
    2ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2ef9:	c1 e0 08             	shl    $0x8,%eax
    2efc:	8d 90 60 42 01 00    	lea    0x14260(%eax),%edx
    2f02:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2f05:	83 c0 01             	add    $0x1,%eax
    2f08:	01 d0                	add    %edx,%eax
    2f0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
				break;
    2f0d:	eb 0a                	jmp    2f19 <pasteFile+0x92>
void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
		printf(0, "this is NO.%d file names %s\n", i, filesWaited[i]);
		for(j = strlen(filesWaited[i])-1; j >= 0; j--){
    2f0f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    2f13:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2f17:	79 c5                	jns    2ede <pasteFile+0x57>
			if (*(filesWaited[i]+j) == '/'){
				filename = filesWaited[i] + j + 1;
				break;
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
    2f19:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f1c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    2f20:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f23:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f27:	c7 44 24 04 03 c9 00 	movl   $0xc903,0x4(%esp)
    2f2e:	00 
    2f2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f36:	e8 7c 2f 00 00       	call   5eb7 <printf>
		pasteJustFile(filesWaited[i], filename);
    2f3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f3e:	c1 e0 08             	shl    $0x8,%eax
    2f41:	8d 90 60 42 01 00    	lea    0x14260(%eax),%edx
    2f47:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2f4a:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f4e:	89 14 24             	mov    %edx,(%esp)
    2f51:	e8 7b fa ff ff       	call   29d1 <pasteJustFile>
}

void pasteFile(){
	int i,j;
	char *filename;
	for(i = 0; i < lenOfWaited; i++){
    2f56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2f5a:	a1 b8 4c 01 00       	mov    0x14cb8,%eax
    2f5f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    2f62:	0f 8c 31 ff ff ff    	jl     2e99 <pasteFile+0x12>
			}
		}
		printf(0, "NO.%d file %s name get\n", i, filename);
		pasteJustFile(filesWaited[i], filename);
	}
}
    2f68:	c9                   	leave  
    2f69:	c3                   	ret    

00002f6a <h_pasteFile>:

void h_pasteFile(Point p){
    2f6a:	55                   	push   %ebp
    2f6b:	89 e5                	mov    %esp,%ebp
    2f6d:	83 ec 38             	sub    $0x38,%esp
	pasteFile();
    2f70:	e8 12 ff ff ff       	call   2e87 <pasteFile>
	if(copyOrCut == 1)
    2f75:	a1 24 14 01 00       	mov    0x11424,%eax
    2f7a:	83 f8 01             	cmp    $0x1,%eax
    2f7d:	75 05                	jne    2f84 <h_pasteFile+0x1a>
		moveFile();
    2f7f:	e8 f0 f9 ff ff       	call   2974 <moveFile>
    updateFileList(context);
    2f84:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2f89:	89 04 24             	mov    %eax,(%esp)
    2f8c:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2f91:	89 44 24 04          	mov    %eax,0x4(%esp)
    2f95:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2f9a:	89 44 24 08          	mov    %eax,0x8(%esp)
    2f9e:	e8 27 df ff ff       	call   eca <updateFileList>
	drawFinderContent(context);
    2fa3:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2fa8:	89 04 24             	mov    %eax,(%esp)
    2fab:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2fb0:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fb4:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2fb9:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fbd:	e8 57 e0 ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    2fc2:	a1 60 4b 01 00       	mov    0x14b60,%eax
    2fc7:	89 04 24             	mov    %eax,(%esp)
    2fca:	a1 64 4b 01 00       	mov    0x14b64,%eax
    2fcf:	89 44 24 04          	mov    %eax,0x4(%esp)
    2fd3:	a1 68 4b 01 00       	mov    0x14b68,%eax
    2fd8:	89 44 24 08          	mov    %eax,0x8(%esp)
    2fdc:	e8 ea dc ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    2fe1:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2fe4:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    2feb:	00 
    2fec:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    2ff3:	00 
    2ff4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    2ffb:	00 
    2ffc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3003:	00 
    3004:	89 04 24             	mov    %eax,(%esp)
    3007:	e8 6c 23 00 00       	call   5378 <initRect>
    300c:	83 ec 04             	sub    $0x4,%esp
    300f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3012:	89 44 24 04          	mov    %eax,0x4(%esp)
    3016:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3019:	89 44 24 08          	mov    %eax,0x8(%esp)
    301d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3020:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3024:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3027:	89 44 24 10          	mov    %eax,0x10(%esp)
    302b:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3032:	e8 44 25 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    3037:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    303e:	e8 0c e6 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    3043:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    304a:	e8 78 e5 ff ff       	call   15c7 <addListEvent>
}
    304f:	c9                   	leave  
    3050:	c3                   	ret    

00003051 <h_chooseFile>:

void h_chooseFile(Point p) {
    3051:	55                   	push   %ebp
    3052:	89 e5                	mov    %esp,%ebp
    3054:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *allfile = fileItemList;
    3057:	a1 30 14 01 00       	mov    0x11430,%eax
    305c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (allfile != 0) {
    305f:	eb 1d                	jmp    307e <h_chooseFile+0x2d>
	  if (allfile->chosen != 0) allfile->chosen = 0;
    3061:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3064:	8b 40 28             	mov    0x28(%eax),%eax
    3067:	85 c0                	test   %eax,%eax
    3069:	74 0a                	je     3075 <h_chooseFile+0x24>
    306b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    306e:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
		allfile = allfile->next;
    3075:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3078:	8b 40 2c             	mov    0x2c(%eax),%eax
    307b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	addListEvent(&cm);
}

void h_chooseFile(Point p) {
	struct fileItem *allfile = fileItemList;
	while (allfile != 0) {
    307e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3082:	75 dd                	jne    3061 <h_chooseFile+0x10>
	  if (allfile->chosen != 0) allfile->chosen = 0;
		allfile = allfile->next;
	}
	struct fileItem *temp = getFileItem(p);
    3084:	8b 45 08             	mov    0x8(%ebp),%eax
    3087:	8b 55 0c             	mov    0xc(%ebp),%edx
    308a:	89 04 24             	mov    %eax,(%esp)
    308d:	89 54 24 04          	mov    %edx,0x4(%esp)
    3091:	e8 e4 e6 ff ff       	call   177a <getFileItem>
    3096:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (temp->chosen != 0)
    3099:	8b 45 f0             	mov    -0x10(%ebp),%eax
    309c:	8b 40 28             	mov    0x28(%eax),%eax
    309f:	85 c0                	test   %eax,%eax
    30a1:	74 20                	je     30c3 <h_chooseFile+0x72>
	{
		printf(0, "unchooseFile!\n");
    30a3:	c7 44 24 04 1b c9 00 	movl   $0xc91b,0x4(%esp)
    30aa:	00 
    30ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30b2:	e8 00 2e 00 00       	call   5eb7 <printf>
		temp->chosen = 0;
    30b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    30ba:	c7 40 28 00 00 00 00 	movl   $0x0,0x28(%eax)
    30c1:	eb 1e                	jmp    30e1 <h_chooseFile+0x90>
	}
	else
	{
		printf(0, "chooseFile!\n");
    30c3:	c7 44 24 04 2a c9 00 	movl   $0xc92a,0x4(%esp)
    30ca:	00 
    30cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30d2:	e8 e0 2d 00 00       	call   5eb7 <printf>
		temp->chosen = 1;
    30d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    30da:	c7 40 28 01 00 00 00 	movl   $0x1,0x28(%eax)
	}
	drawFinderContent(context);
    30e1:	a1 60 4b 01 00       	mov    0x14b60,%eax
    30e6:	89 04 24             	mov    %eax,(%esp)
    30e9:	a1 64 4b 01 00       	mov    0x14b64,%eax
    30ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    30f2:	a1 68 4b 01 00       	mov    0x14b68,%eax
    30f7:	89 44 24 08          	mov    %eax,0x8(%esp)
    30fb:	e8 19 df ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    3100:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3105:	89 04 24             	mov    %eax,(%esp)
    3108:	a1 64 4b 01 00       	mov    0x14b64,%eax
    310d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3111:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3116:	89 44 24 08          	mov    %eax,0x8(%esp)
    311a:	e8 ac db ff ff       	call   ccb <drawFinderWnd>
}
    311f:	c9                   	leave  
    3120:	c3                   	ret    

00003121 <h_openFile>:

void h_openFile(Point p) {
    3121:	55                   	push   %ebp
    3122:	89 e5                	mov    %esp,%ebp
    3124:	81 ec f8 00 00 00    	sub    $0xf8,%esp
	struct fileItem *temp = getFileItem(p);
    312a:	8b 45 08             	mov    0x8(%ebp),%eax
    312d:	8b 55 0c             	mov    0xc(%ebp),%edx
    3130:	89 04 24             	mov    %eax,(%esp)
    3133:	89 54 24 04          	mov    %edx,0x4(%esp)
    3137:	e8 3e e6 ff ff       	call   177a <getFileItem>
    313c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	char fileName[201];
	strcpy(fileName, temp->name);
    313f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3142:	8b 40 14             	mov    0x14(%eax),%eax
    3145:	89 44 24 04          	mov    %eax,0x4(%esp)
    3149:	8d 85 27 ff ff ff    	lea    -0xd9(%ebp),%eax
    314f:	89 04 24             	mov    %eax,(%esp)
    3152:	e8 35 29 00 00       	call   5a8c <strcpy>
	int length = strlen(fileName);
    3157:	8d 85 27 ff ff ff    	lea    -0xd9(%ebp),%eax
    315d:	89 04 24             	mov    %eax,(%esp)
    3160:	e8 96 29 00 00       	call   5afb <strlen>
    3165:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if (length <= 4) {
    3168:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    316c:	0f 8e dd 00 00 00    	jle    324f <h_openFile+0x12e>
		return;
	}

	// if it is txt file
	if (fileName[length-4] == '.' && fileName[length-3] == 't' && fileName[length-2] == 'x' && fileName[length-1] == 't') {
    3172:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3175:	83 e8 04             	sub    $0x4,%eax
    3178:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    317f:	ff 
    3180:	3c 2e                	cmp    $0x2e,%al
    3182:	75 49                	jne    31cd <h_openFile+0xac>
    3184:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3187:	83 e8 03             	sub    $0x3,%eax
    318a:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    3191:	ff 
    3192:	3c 74                	cmp    $0x74,%al
    3194:	75 37                	jne    31cd <h_openFile+0xac>
    3196:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3199:	83 e8 02             	sub    $0x2,%eax
    319c:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    31a3:	ff 
    31a4:	3c 78                	cmp    $0x78,%al
    31a6:	75 25                	jne    31cd <h_openFile+0xac>
    31a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31ab:	83 e8 01             	sub    $0x1,%eax
    31ae:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    31b5:	ff 
    31b6:	3c 74                	cmp    $0x74,%al
    31b8:	75 13                	jne    31cd <h_openFile+0xac>
        // do something...
		textEditor_init(fileName);
    31ba:	8d 85 27 ff ff ff    	lea    -0xd9(%ebp),%eax
    31c0:	89 04 24             	mov    %eax,(%esp)
    31c3:	e8 38 ce ff ff       	call   0 <textEditor_init>
    31c8:	e9 82 00 00 00       	jmp    324f <h_openFile+0x12e>
	} else if (fileName[length-4] == '.' && fileName[length-3] == 'b' && fileName[length-2] == 'm' && fileName[length-1] == 'p') {
    31cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31d0:	83 e8 04             	sub    $0x4,%eax
    31d3:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    31da:	ff 
    31db:	3c 2e                	cmp    $0x2e,%al
    31dd:	75 70                	jne    324f <h_openFile+0x12e>
    31df:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31e2:	83 e8 03             	sub    $0x3,%eax
    31e5:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    31ec:	ff 
    31ed:	3c 62                	cmp    $0x62,%al
    31ef:	75 5e                	jne    324f <h_openFile+0x12e>
    31f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    31f4:	83 e8 02             	sub    $0x2,%eax
    31f7:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    31fe:	ff 
    31ff:	3c 6d                	cmp    $0x6d,%al
    3201:	75 4c                	jne    324f <h_openFile+0x12e>
    3203:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3206:	83 e8 01             	sub    $0x1,%eax
    3209:	0f b6 84 05 27 ff ff 	movzbl -0xd9(%ebp,%eax,1),%eax
    3210:	ff 
    3211:	3c 70                	cmp    $0x70,%al
    3213:	75 3a                	jne    324f <h_openFile+0x12e>
		printf(0, "bmp!! %s\n", temp->name);
    3215:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3218:	8b 40 14             	mov    0x14(%eax),%eax
    321b:	89 44 24 08          	mov    %eax,0x8(%esp)
    321f:	c7 44 24 04 37 c9 00 	movl   $0xc937,0x4(%esp)
    3226:	00 
    3227:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    322e:	e8 84 2c 00 00       	call   5eb7 <printf>
		picViewerInit(p, temp->name);
    3233:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3236:	8b 40 14             	mov    0x14(%eax),%eax
    3239:	89 44 24 08          	mov    %eax,0x8(%esp)
    323d:	8b 45 08             	mov    0x8(%ebp),%eax
    3240:	8b 55 0c             	mov    0xc(%ebp),%edx
    3243:	89 04 24             	mov    %eax,(%esp)
    3246:	89 54 24 04          	mov    %edx,0x4(%esp)
    324a:	e8 5a 03 00 00       	call   35a9 <picViewerInit>
	}
}
    324f:	c9                   	leave  
    3250:	c3                   	ret    

00003251 <h_closeWnd>:

void h_closeWnd(Point p) {
    3251:	55                   	push   %ebp
    3252:	89 e5                	mov    %esp,%ebp
	isRun = 0;
    3254:	c7 05 c0 0a 01 00 00 	movl   $0x0,0x10ac0
    325b:	00 00 00 
}
    325e:	5d                   	pop    %ebp
    325f:	c3                   	ret    

00003260 <h_chvm1>:

void h_chvm1(Point p) {
    3260:	55                   	push   %ebp
    3261:	89 e5                	mov    %esp,%ebp
    3263:	83 ec 38             	sub    $0x38,%esp
	style = ICON_STYLE;
    3266:	c7 05 c4 0a 01 00 01 	movl   $0x1,0x10ac4
    326d:	00 00 00 
	updateFileList(context);
    3270:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3275:	89 04 24             	mov    %eax,(%esp)
    3278:	a1 64 4b 01 00       	mov    0x14b64,%eax
    327d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3281:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3286:	89 44 24 08          	mov    %eax,0x8(%esp)
    328a:	e8 3b dc ff ff       	call   eca <updateFileList>
		drawFinderContent(context);
    328f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3294:	89 04 24             	mov    %eax,(%esp)
    3297:	a1 64 4b 01 00       	mov    0x14b64,%eax
    329c:	89 44 24 04          	mov    %eax,0x4(%esp)
    32a0:	a1 68 4b 01 00       	mov    0x14b68,%eax
    32a5:	89 44 24 08          	mov    %eax,0x8(%esp)
    32a9:	e8 6b dd ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    32ae:	a1 60 4b 01 00       	mov    0x14b60,%eax
    32b3:	89 04 24             	mov    %eax,(%esp)
    32b6:	a1 64 4b 01 00       	mov    0x14b64,%eax
    32bb:	89 44 24 04          	mov    %eax,0x4(%esp)
    32bf:	a1 68 4b 01 00       	mov    0x14b68,%eax
    32c4:	89 44 24 08          	mov    %eax,0x8(%esp)
    32c8:	e8 fe d9 ff ff       	call   ccb <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    32cd:	8d 45 e8             	lea    -0x18(%ebp),%eax
    32d0:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    32d7:	00 
    32d8:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    32df:	00 
    32e0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    32e7:	00 
    32e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    32ef:	00 
    32f0:	89 04 24             	mov    %eax,(%esp)
    32f3:	e8 80 20 00 00       	call   5378 <initRect>
    32f8:	83 ec 04             	sub    $0x4,%esp
    32fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    32fe:	89 44 24 04          	mov    %eax,0x4(%esp)
    3302:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3305:	89 44 24 08          	mov    %eax,0x8(%esp)
    3309:	8b 45 f0             	mov    -0x10(%ebp),%eax
    330c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3310:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3313:	89 44 24 10          	mov    %eax,0x10(%esp)
    3317:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    331e:	e8 58 22 00 00       	call   557b <deleteClickable>
			addWndEvent(&cm);
    3323:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    332a:	e8 20 e3 ff ff       	call   164f <addWndEvent>
			addListEvent(&cm);
    332f:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3336:	e8 8c e2 ff ff       	call   15c7 <addListEvent>
}
    333b:	c9                   	leave  
    333c:	c3                   	ret    

0000333d <h_chvm2>:

void h_chvm2(Point p) {
    333d:	55                   	push   %ebp
    333e:	89 e5                	mov    %esp,%ebp
    3340:	83 ec 38             	sub    $0x38,%esp
	style = LIST_STYLE;
    3343:	c7 05 c4 0a 01 00 02 	movl   $0x2,0x10ac4
    334a:	00 00 00 
	updateFileList(context);
    334d:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3352:	89 04 24             	mov    %eax,(%esp)
    3355:	a1 64 4b 01 00       	mov    0x14b64,%eax
    335a:	89 44 24 04          	mov    %eax,0x4(%esp)
    335e:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3363:	89 44 24 08          	mov    %eax,0x8(%esp)
    3367:	e8 5e db ff ff       	call   eca <updateFileList>
		drawFinderContent(context);
    336c:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3371:	89 04 24             	mov    %eax,(%esp)
    3374:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3379:	89 44 24 04          	mov    %eax,0x4(%esp)
    337d:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3382:	89 44 24 08          	mov    %eax,0x8(%esp)
    3386:	e8 8e dc ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    338b:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3390:	89 04 24             	mov    %eax,(%esp)
    3393:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3398:	89 44 24 04          	mov    %eax,0x4(%esp)
    339c:	a1 68 4b 01 00       	mov    0x14b68,%eax
    33a1:	89 44 24 08          	mov    %eax,0x8(%esp)
    33a5:	e8 21 d9 ff ff       	call   ccb <drawFinderWnd>
			deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    33aa:	8d 45 e8             	lea    -0x18(%ebp),%eax
    33ad:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    33b4:	00 
    33b5:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    33bc:	00 
    33bd:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    33c4:	00 
    33c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    33cc:	00 
    33cd:	89 04 24             	mov    %eax,(%esp)
    33d0:	e8 a3 1f 00 00       	call   5378 <initRect>
    33d5:	83 ec 04             	sub    $0x4,%esp
    33d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    33db:	89 44 24 04          	mov    %eax,0x4(%esp)
    33df:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33e2:	89 44 24 08          	mov    %eax,0x8(%esp)
    33e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    33e9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    33ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33f0:	89 44 24 10          	mov    %eax,0x10(%esp)
    33f4:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    33fb:	e8 7b 21 00 00       	call   557b <deleteClickable>
			addWndEvent(&cm);
    3400:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3407:	e8 43 e2 ff ff       	call   164f <addWndEvent>
			addListEvent(&cm);
    340c:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3413:	e8 af e1 ff ff       	call   15c7 <addListEvent>
}
    3418:	c9                   	leave  
    3419:	c3                   	ret    

0000341a <h_goUp>:

void h_goUp(Point p) {
    341a:	55                   	push   %ebp
    341b:	89 e5                	mov    %esp,%ebp
    341d:	83 ec 38             	sub    $0x38,%esp
	enterDir("..");
    3420:	c7 04 24 33 c7 00 00 	movl   $0xc733,(%esp)
    3427:	e8 13 e9 ff ff       	call   1d3f <enterDir>
	updateFileList(context);
    342c:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3431:	89 04 24             	mov    %eax,(%esp)
    3434:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3439:	89 44 24 04          	mov    %eax,0x4(%esp)
    343d:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3442:	89 44 24 08          	mov    %eax,0x8(%esp)
    3446:	e8 7f da ff ff       	call   eca <updateFileList>
	drawFinderContent(context);
    344b:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3450:	89 04 24             	mov    %eax,(%esp)
    3453:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3458:	89 44 24 04          	mov    %eax,0x4(%esp)
    345c:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3461:	89 44 24 08          	mov    %eax,0x8(%esp)
    3465:	e8 af db ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    346a:	a1 60 4b 01 00       	mov    0x14b60,%eax
    346f:	89 04 24             	mov    %eax,(%esp)
    3472:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3477:	89 44 24 04          	mov    %eax,0x4(%esp)
    347b:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3480:	89 44 24 08          	mov    %eax,0x8(%esp)
    3484:	e8 42 d8 ff ff       	call   ccb <drawFinderWnd>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3489:	8d 45 e8             	lea    -0x18(%ebp),%eax
    348c:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3493:	00 
    3494:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    349b:	00 
    349c:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    34a3:	00 
    34a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    34ab:	00 
    34ac:	89 04 24             	mov    %eax,(%esp)
    34af:	e8 c4 1e 00 00       	call   5378 <initRect>
    34b4:	83 ec 04             	sub    $0x4,%esp
    34b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    34ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    34be:	8b 45 ec             	mov    -0x14(%ebp),%eax
    34c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    34c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
    34cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34cf:	89 44 24 10          	mov    %eax,0x10(%esp)
    34d3:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    34da:	e8 9c 20 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    34df:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    34e6:	e8 64 e1 ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    34eb:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    34f2:	e8 d0 e0 ff ff       	call   15c7 <addListEvent>
}
    34f7:	c9                   	leave  
    34f8:	c3                   	ret    

000034f9 <h_empty>:

void h_empty(Point p) {
    34f9:	55                   	push   %ebp
    34fa:	89 e5                	mov    %esp,%ebp

}
    34fc:	5d                   	pop    %ebp
    34fd:	c3                   	ret    

000034fe <rename>:

void rename() {
    34fe:	55                   	push   %ebp
    34ff:	89 e5                	mov    %esp,%ebp
    3501:	83 ec 28             	sub    $0x28,%esp
	struct fileItem *temp = fileItemList;
    3504:	a1 30 14 01 00       	mov    0x11430,%eax
    3509:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (temp != 0){
    350c:	eb 48                	jmp    3556 <rename+0x58>
		if (temp->chosen == 1){
    350e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3511:	8b 40 28             	mov    0x28(%eax),%eax
    3514:	83 f8 01             	cmp    $0x1,%eax
    3517:	75 34                	jne    354d <rename+0x4f>
			currentlyRenaming = temp;
    3519:	8b 45 f4             	mov    -0xc(%ebp),%eax
    351c:	a3 2c 14 01 00       	mov    %eax,0x1142c
			temp->chosen = 2;
    3521:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3524:	c7 40 28 02 00 00 00 	movl   $0x2,0x28(%eax)
			strcpy(renameFrom, temp->name);
    352b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    352e:	8b 40 14             	mov    0x14(%eax),%eax
    3531:	89 44 24 04          	mov    %eax,0x4(%esp)
    3535:	c7 04 24 60 4a 01 00 	movl   $0x14a60,(%esp)
    353c:	e8 4b 25 00 00       	call   5a8c <strcpy>
			renaming = 1;
    3541:	c7 05 b4 4c 01 00 01 	movl   $0x1,0x14cb4
    3548:	00 00 00 
			break;
    354b:	eb 0f                	jmp    355c <rename+0x5e>
		}
		else
			temp = temp->next;
    354d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3550:	8b 40 2c             	mov    0x2c(%eax),%eax
    3553:	89 45 f4             	mov    %eax,-0xc(%ebp)

}

void rename() {
	struct fileItem *temp = fileItemList;
	while (temp != 0){
    3556:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    355a:	75 b2                	jne    350e <rename+0x10>
			break;
		}
		else
			temp = temp->next;
	}
}
    355c:	c9                   	leave  
    355d:	c3                   	ret    

0000355e <h_rename>:

void h_rename(Point p) {
    355e:	55                   	push   %ebp
    355f:	89 e5                	mov    %esp,%ebp
    3561:	83 ec 18             	sub    $0x18,%esp
	rename();
    3564:	e8 95 ff ff ff       	call   34fe <rename>
	drawFinderContent(context);
    3569:	a1 60 4b 01 00       	mov    0x14b60,%eax
    356e:	89 04 24             	mov    %eax,(%esp)
    3571:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3576:	89 44 24 04          	mov    %eax,0x4(%esp)
    357a:	a1 68 4b 01 00       	mov    0x14b68,%eax
    357f:	89 44 24 08          	mov    %eax,0x8(%esp)
    3583:	e8 91 da ff ff       	call   1019 <drawFinderContent>
	drawFinderWnd(context);
    3588:	a1 60 4b 01 00       	mov    0x14b60,%eax
    358d:	89 04 24             	mov    %eax,(%esp)
    3590:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3595:	89 44 24 04          	mov    %eax,0x4(%esp)
    3599:	a1 68 4b 01 00       	mov    0x14b68,%eax
    359e:	89 44 24 08          	mov    %eax,0x8(%esp)
    35a2:	e8 24 d7 ff ff       	call   ccb <drawFinderWnd>
}
    35a7:	c9                   	leave  
    35a8:	c3                   	ret    

000035a9 <picViewerInit>:

void picViewerInit(Point point, char* fileName)
{
    35a9:	55                   	push   %ebp
    35aa:	89 e5                	mov    %esp,%ebp
    35ac:	83 ec 28             	sub    $0x28,%esp
    int pid;
    char* picViewer_argv[] = { "picviewer", fileName };
    35af:	c7 45 ec 41 c9 00 00 	movl   $0xc941,-0x14(%ebp)
    35b6:	8b 45 10             	mov    0x10(%ebp),%eax
    35b9:	89 45 f0             	mov    %eax,-0x10(%ebp)

    printf(1, "init picViewer: starting picViewer\n");
    35bc:	c7 44 24 04 4c c9 00 	movl   $0xc94c,0x4(%esp)
    35c3:	00 
    35c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35cb:	e8 e7 28 00 00       	call   5eb7 <printf>
    pid = fork();
    35d0:	e8 f2 26 00 00       	call   5cc7 <fork>
    35d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (pid < 0)
    35d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    35dc:	79 19                	jns    35f7 <picViewerInit+0x4e>
    {
        printf(1, "init picViewer: fork failed\n");
    35de:	c7 44 24 04 70 c9 00 	movl   $0xc970,0x4(%esp)
    35e5:	00 
    35e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35ed:	e8 c5 28 00 00       	call   5eb7 <printf>
        exit();
    35f2:	e8 d8 26 00 00       	call   5ccf <exit>
    }
    if (pid == 0)
    35f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    35fb:	75 2c                	jne    3629 <picViewerInit+0x80>
    {
        exec("picviewer", picViewer_argv);
    35fd:	8d 45 ec             	lea    -0x14(%ebp),%eax
    3600:	89 44 24 04          	mov    %eax,0x4(%esp)
    3604:	c7 04 24 41 c9 00 00 	movl   $0xc941,(%esp)
    360b:	e8 f7 26 00 00       	call   5d07 <exec>
        printf(1, "init picViewer: exec picViewer failed\n");
    3610:	c7 44 24 04 90 c9 00 	movl   $0xc990,0x4(%esp)
    3617:	00 
    3618:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    361f:	e8 93 28 00 00       	call   5eb7 <printf>
        exit();
    3624:	e8 a6 26 00 00       	call   5ccf <exit>
    }
}
    3629:	c9                   	leave  
    362a:	c3                   	ret    

0000362b <main>:

int main(int argc, char *argv[]) {
    362b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    362f:	83 e4 f0             	and    $0xfffffff0,%esp
    3632:	ff 71 fc             	pushl  -0x4(%ecx)
    3635:	55                   	push   %ebp
    3636:	89 e5                	mov    %esp,%ebp
    3638:	56                   	push   %esi
    3639:	53                   	push   %ebx
    363a:	51                   	push   %ecx
    363b:	81 ec ac 00 00 00    	sub    $0xac,%esp
	struct Msg msg;
	char key;

	Point p;

	init_keyContent();
    3641:	e8 a6 ca ff ff       	call   ec <init_keyContent>
	winid = init_context(&context, WINDOW_WIDTH, WINDOW_HEIGHT);
    3646:	c7 44 24 08 c2 01 00 	movl   $0x1c2,0x8(%esp)
    364d:	00 
    364e:	c7 44 24 04 58 02 00 	movl   $0x258,0x4(%esp)
    3655:	00 
    3656:	c7 04 24 60 4b 01 00 	movl   $0x14b60,(%esp)
    365d:	e8 e0 07 00 00       	call   3e42 <init_context>
    3662:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	cm = initClickManager(context);
    3665:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
    366b:	8b 15 60 4b 01 00    	mov    0x14b60,%edx
    3671:	89 54 24 04          	mov    %edx,0x4(%esp)
    3675:	8b 15 64 4b 01 00    	mov    0x14b64,%edx
    367b:	89 54 24 08          	mov    %edx,0x8(%esp)
    367f:	8b 15 68 4b 01 00    	mov    0x14b68,%edx
    3685:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3689:	89 04 24             	mov    %eax,(%esp)
    368c:	e8 85 1d 00 00       	call   5416 <initClickManager>
    3691:	83 ec 04             	sub    $0x4,%esp
    3694:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
    369a:	a3 a0 4c 01 00       	mov    %eax,0x14ca0
    369f:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
    36a5:	a3 a4 4c 01 00       	mov    %eax,0x14ca4
    36aa:	8b 45 80             	mov    -0x80(%ebp),%eax
    36ad:	a3 a8 4c 01 00       	mov    %eax,0x14ca8
    36b2:	8b 45 84             	mov    -0x7c(%ebp),%eax
    36b5:	a3 ac 4c 01 00       	mov    %eax,0x14cac
    36ba:	8b 45 88             	mov    -0x78(%ebp),%eax
    36bd:	a3 b0 4c 01 00       	mov    %eax,0x14cb0
	load_iconlist(wndRes, sizeof(wndRes) / sizeof(ICON));
    36c2:	c7 44 24 04 0f 00 00 	movl   $0xf,0x4(%esp)
    36c9:	00 
    36ca:	c7 04 24 c0 0b 01 00 	movl   $0x10bc0,(%esp)
    36d1:	e8 66 13 00 00       	call   4a3c <load_iconlist>
	load_iconlist(contentRes, sizeof(contentRes) / sizeof(ICON));
    36d6:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    36dd:	00 
    36de:	c7 04 24 e0 0a 01 00 	movl   $0x10ae0,(%esp)
    36e5:	e8 52 13 00 00       	call   4a3c <load_iconlist>
	//testHandlers();
	strcpy(currentPath, "/");
    36ea:	c7 44 24 04 b7 c9 00 	movl   $0xc9b7,0x4(%esp)
    36f1:	00 
    36f2:	c7 04 24 a0 4b 01 00 	movl   $0x14ba0,(%esp)
    36f9:	e8 8e 23 00 00       	call   5a8c <strcpy>
	mkdir("userfolder");
    36fe:	c7 04 24 b9 c9 00 00 	movl   $0xc9b9,(%esp)
    3705:	e8 2d 26 00 00       	call   5d37 <mkdir>
	enterDir("userfolder");
    370a:	c7 04 24 b9 c9 00 00 	movl   $0xc9b9,(%esp)
    3711:	e8 29 e6 ff ff       	call   1d3f <enterDir>
	updateFileList(context);
    3716:	a1 60 4b 01 00       	mov    0x14b60,%eax
    371b:	89 04 24             	mov    %eax,(%esp)
    371e:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3723:	89 44 24 04          	mov    %eax,0x4(%esp)
    3727:	a1 68 4b 01 00       	mov    0x14b68,%eax
    372c:	89 44 24 08          	mov    %eax,0x8(%esp)
    3730:	e8 95 d7 ff ff       	call   eca <updateFileList>
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3735:	8d 45 c0             	lea    -0x40(%ebp),%eax
    3738:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    373f:	00 
    3740:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    3747:	00 
    3748:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    374f:	00 
    3750:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3757:	00 
    3758:	89 04 24             	mov    %eax,(%esp)
    375b:	e8 18 1c 00 00       	call   5378 <initRect>
    3760:	83 ec 04             	sub    $0x4,%esp
    3763:	8b 45 c0             	mov    -0x40(%ebp),%eax
    3766:	89 44 24 04          	mov    %eax,0x4(%esp)
    376a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    376d:	89 44 24 08          	mov    %eax,0x8(%esp)
    3771:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3774:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3778:	8b 45 cc             	mov    -0x34(%ebp),%eax
    377b:	89 44 24 10          	mov    %eax,0x10(%esp)
    377f:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3786:	e8 f0 1d 00 00       	call   557b <deleteClickable>
	addWndEvent(&cm);
    378b:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3792:	e8 b8 de ff ff       	call   164f <addWndEvent>
	addListEvent(&cm);
    3797:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    379e:	e8 24 de ff ff       	call   15c7 <addListEvent>
	lenOfWaited = 0;
    37a3:	c7 05 b8 4c 01 00 00 	movl   $0x0,0x14cb8
    37aa:	00 00 00 
	while (isRun) {
    37ad:	e9 60 05 00 00       	jmp    3d12 <main+0x6e7>
		getMsg(&msg);
    37b2:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    37b5:	89 04 24             	mov    %eax,(%esp)
    37b8:	e8 b2 25 00 00       	call   5d6f <getMsg>
		switch (msg.msg_type) {
    37bd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    37c0:	83 f8 08             	cmp    $0x8,%eax
    37c3:	0f 87 48 05 00 00    	ja     3d11 <main+0x6e6>
    37c9:	8b 04 85 d4 c9 00 00 	mov    0xc9d4(,%eax,4),%eax
    37d0:	ff e0                	jmp    *%eax
		case MSG_DOUBLECLICK:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    37d2:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    37d5:	8b 55 ac             	mov    -0x54(%ebp),%edx
    37d8:	8d 45 9c             	lea    -0x64(%ebp),%eax
    37db:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    37df:	89 54 24 04          	mov    %edx,0x4(%esp)
    37e3:	89 04 24             	mov    %eax,(%esp)
    37e6:	e8 66 1b 00 00       	call   5351 <initPoint>
    37eb:	83 ec 04             	sub    $0x4,%esp
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.double_click, p)) {
    37ee:	8b 0d a4 4c 01 00    	mov    0x14ca4,%ecx
    37f4:	8b 45 9c             	mov    -0x64(%ebp),%eax
    37f7:	8b 55 a0             	mov    -0x60(%ebp),%edx
    37fa:	89 44 24 04          	mov    %eax,0x4(%esp)
    37fe:	89 54 24 08          	mov    %edx,0x8(%esp)
    3802:	89 0c 24             	mov    %ecx,(%esp)
    3805:	e8 51 1e 00 00       	call   565b <executeHandler>
    380a:	85 c0                	test   %eax,%eax
    380c:	74 20                	je     382e <main+0x203>
				updateWindow(winid, context.addr, msg.msg_detail);
    380e:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3811:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3816:	89 54 24 08          	mov    %edx,0x8(%esp)
    381a:	89 44 24 04          	mov    %eax,0x4(%esp)
    381e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3821:	89 04 24             	mov    %eax,(%esp)
    3824:	e8 5e 25 00 00       	call   5d87 <updateWindow>
			}
			break;
    3829:	e9 e4 04 00 00       	jmp    3d12 <main+0x6e7>
    382e:	e9 df 04 00 00       	jmp    3d12 <main+0x6e7>
		case MSG_UPDATE:
			//printf(0, "update event!\n");

			printf(1, "msg_detail %d\n", msg.msg_detail);
    3833:	8b 45 a8             	mov    -0x58(%ebp),%eax
    3836:	89 44 24 08          	mov    %eax,0x8(%esp)
    383a:	c7 44 24 04 c4 c9 00 	movl   $0xc9c4,0x4(%esp)
    3841:	00 
    3842:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3849:	e8 69 26 00 00       	call   5eb7 <printf>
			drawFinderWnd(context);
    384e:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3853:	89 04 24             	mov    %eax,(%esp)
    3856:	a1 64 4b 01 00       	mov    0x14b64,%eax
    385b:	89 44 24 04          	mov    %eax,0x4(%esp)
    385f:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3864:	89 44 24 08          	mov    %eax,0x8(%esp)
    3868:	e8 5e d4 ff ff       	call   ccb <drawFinderWnd>
			drawFinderContent(context);
    386d:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3872:	89 04 24             	mov    %eax,(%esp)
    3875:	a1 64 4b 01 00       	mov    0x14b64,%eax
    387a:	89 44 24 04          	mov    %eax,0x4(%esp)
    387e:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3883:	89 44 24 08          	mov    %eax,0x8(%esp)
    3887:	e8 8d d7 ff ff       	call   1019 <drawFinderContent>
			updateWindow(winid, context.addr, msg.msg_detail);
    388c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    388f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3894:	89 54 24 08          	mov    %edx,0x8(%esp)
    3898:	89 44 24 04          	mov    %eax,0x4(%esp)
    389c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    389f:	89 04 24             	mov    %eax,(%esp)
    38a2:	e8 e0 24 00 00       	call   5d87 <updateWindow>

			break;
    38a7:	e9 66 04 00 00       	jmp    3d12 <main+0x6e7>
		case MSG_PARTIAL_UPDATE:
			updatePartialWindow(winid, context.addr,
    38ac:	8b 75 b8             	mov    -0x48(%ebp),%esi
    38af:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
    38b2:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    38b5:	8b 55 ac             	mov    -0x54(%ebp),%edx
    38b8:	a1 60 4b 01 00       	mov    0x14b60,%eax
    38bd:	89 74 24 14          	mov    %esi,0x14(%esp)
    38c1:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    38c5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    38c9:	89 54 24 08          	mov    %edx,0x8(%esp)
    38cd:	89 44 24 04          	mov    %eax,0x4(%esp)
    38d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    38d4:	89 04 24             	mov    %eax,(%esp)
    38d7:	e8 b3 24 00 00       	call   5d8f <updatePartialWindow>
					msg.concrete_msg.msg_partial_update.x1,
					msg.concrete_msg.msg_partial_update.y1,
					msg.concrete_msg.msg_partial_update.x2,
					msg.concrete_msg.msg_partial_update.y2);
			break;
    38dc:	e9 31 04 00 00       	jmp    3d12 <main+0x6e7>
		case MSG_LPRESS:
			//printf(0, "left click event!\n");
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    38e1:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    38e4:	8b 55 ac             	mov    -0x54(%ebp),%edx
    38e7:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    38ed:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    38f1:	89 54 24 04          	mov    %edx,0x4(%esp)
    38f5:	89 04 24             	mov    %eax,(%esp)
    38f8:	e8 54 1a 00 00       	call   5351 <initPoint>
    38fd:	83 ec 04             	sub    $0x4,%esp
    3900:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    3906:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    390c:	89 45 9c             	mov    %eax,-0x64(%ebp)
    390f:	89 55 a0             	mov    %edx,-0x60(%ebp)
					msg.concrete_msg.msg_mouse.y);

			// if (executeHandler(cm.left_click, p)) {
			// 	updateWindow(winid, context.addr);
			// }
			if(renaming == 1){
    3912:	a1 b4 4c 01 00       	mov    0x14cb4,%eax
    3917:	83 f8 01             	cmp    $0x1,%eax
    391a:	75 20                	jne    393c <main+0x311>
				unrename();
    391c:	e8 ee ed ff ff       	call   270f <unrename>
				updateWindow(winid, context.addr, msg.msg_detail);
    3921:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3924:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3929:	89 54 24 08          	mov    %edx,0x8(%esp)
    392d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3931:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3934:	89 04 24             	mov    %eax,(%esp)
    3937:	e8 4b 24 00 00       	call   5d87 <updateWindow>
			if (executeHandler(cm.left_click, p)) {

				updateWindow(winid, context.addr, msg.msg_detail);
//>>>>>>> GUITeam1
			}*/
			executeHandler(cm.left_click, p);
    393c:	8b 0d a0 4c 01 00    	mov    0x14ca0,%ecx
    3942:	8b 45 9c             	mov    -0x64(%ebp),%eax
    3945:	8b 55 a0             	mov    -0x60(%ebp),%edx
    3948:	89 44 24 04          	mov    %eax,0x4(%esp)
    394c:	89 54 24 08          	mov    %edx,0x8(%esp)
    3950:	89 0c 24             	mov    %ecx,(%esp)
    3953:	e8 03 1d 00 00       	call   565b <executeHandler>
			draw_searchbox();
    3958:	e8 bf c7 ff ff       	call   11c <draw_searchbox>
			puts_str(context, keyContent.content, 0, 10 * BUTTON_WIDTH + 100, TOPBAR_HEIGHT + TOOLSBAR_HEIGHT
    395d:	c7 44 24 18 28 00 00 	movl   $0x28,0x18(%esp)
    3964:	00 
    3965:	c7 44 24 14 a4 01 00 	movl   $0x1a4,0x14(%esp)
    396c:	00 
    396d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    3974:	00 
    3975:	c7 44 24 0c 6c 4b 01 	movl   $0x14b6c,0xc(%esp)
    397c:	00 
    397d:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3982:	89 04 24             	mov    %eax,(%esp)
    3985:	a1 64 4b 01 00       	mov    0x14b64,%eax
    398a:	89 44 24 04          	mov    %eax,0x4(%esp)
    398e:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3993:	89 44 24 08          	mov    %eax,0x8(%esp)
    3997:	e8 71 0b 00 00       	call   450d <puts_str>
				- (BUTTON_HEIGHT + 3) + 5);
			updateWindow(winid, context.addr, msg.msg_detail);
    399c:	8b 55 a8             	mov    -0x58(%ebp),%edx
    399f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    39a4:	89 54 24 08          	mov    %edx,0x8(%esp)
    39a8:	89 44 24 04          	mov    %eax,0x4(%esp)
    39ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    39af:	89 04 24             	mov    %eax,(%esp)
    39b2:	e8 d0 23 00 00       	call   5d87 <updateWindow>
			break;
    39b7:	e9 56 03 00 00       	jmp    3d12 <main+0x6e7>
		case MSG_RPRESS:
			p = initPoint(msg.concrete_msg.msg_mouse.x,
    39bc:	8b 4d b0             	mov    -0x50(%ebp),%ecx
    39bf:	8b 55 ac             	mov    -0x54(%ebp),%edx
    39c2:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
    39c8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    39cc:	89 54 24 04          	mov    %edx,0x4(%esp)
    39d0:	89 04 24             	mov    %eax,(%esp)
    39d3:	e8 79 19 00 00       	call   5351 <initPoint>
    39d8:	83 ec 04             	sub    $0x4,%esp
    39db:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
    39e1:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
    39e7:	89 45 9c             	mov    %eax,-0x64(%ebp)
    39ea:	89 55 a0             	mov    %edx,-0x60(%ebp)
					msg.concrete_msg.msg_mouse.y);
			if (executeHandler(cm.right_click, p)) {
    39ed:	8b 0d a8 4c 01 00    	mov    0x14ca8,%ecx
    39f3:	8b 45 9c             	mov    -0x64(%ebp),%eax
    39f6:	8b 55 a0             	mov    -0x60(%ebp),%edx
    39f9:	89 44 24 04          	mov    %eax,0x4(%esp)
    39fd:	89 54 24 08          	mov    %edx,0x8(%esp)
    3a01:	89 0c 24             	mov    %ecx,(%esp)
    3a04:	e8 52 1c 00 00       	call   565b <executeHandler>
    3a09:	85 c0                	test   %eax,%eax
    3a0b:	74 20                	je     3a2d <main+0x402>
				updateWindow(winid, context.addr, msg.msg_detail);
    3a0d:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3a10:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3a15:	89 54 24 08          	mov    %edx,0x8(%esp)
    3a19:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a20:	89 04 24             	mov    %eax,(%esp)
    3a23:	e8 5f 23 00 00       	call   5d87 <updateWindow>
			}
			break;
    3a28:	e9 e5 02 00 00       	jmp    3d12 <main+0x6e7>
    3a2d:	e9 e0 02 00 00       	jmp    3d12 <main+0x6e7>
		case MSG_KEYDOWN:
			key = msg.concrete_msg.msg_key.key;
    3a32:	0f b6 45 ac          	movzbl -0x54(%ebp),%eax
    3a36:	88 45 e3             	mov    %al,-0x1d(%ebp)
			if (isSearching) {
    3a39:	a1 40 42 01 00       	mov    0x14240,%eax
    3a3e:	85 c0                	test   %eax,%eax
    3a40:	0f 84 92 01 00 00    	je     3bd8 <main+0x5ad>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (keyContent.length<MAX_KEYLENGTH)) {
    3a46:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3a4a:	74 2a                	je     3a76 <main+0x44b>
    3a4c:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    3a50:	74 24                	je     3a76 <main+0x44b>
    3a52:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3a56:	7e 06                	jle    3a5e <main+0x433>
    3a58:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3a5c:	7e 18                	jle    3a76 <main+0x44b>
    3a5e:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    3a62:	7e 06                	jle    3a6a <main+0x43f>
    3a64:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3a68:	7e 0c                	jle    3a76 <main+0x44b>
    3a6a:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3a6e:	7e 50                	jle    3ac0 <main+0x495>
    3a70:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    3a74:	7f 4a                	jg     3ac0 <main+0x495>
    3a76:	a1 80 4b 01 00       	mov    0x14b80,%eax
    3a7b:	83 f8 13             	cmp    $0x13,%eax
    3a7e:	7f 40                	jg     3ac0 <main+0x495>
					keyContent.content[keyContent.length++] = key;
    3a80:	a1 80 4b 01 00       	mov    0x14b80,%eax
    3a85:	8d 50 01             	lea    0x1(%eax),%edx
    3a88:	89 15 80 4b 01 00    	mov    %edx,0x14b80
    3a8e:	0f b6 55 e3          	movzbl -0x1d(%ebp),%edx
    3a92:	88 90 6c 4b 01 00    	mov    %dl,0x14b6c(%eax)
					scrollOffset = 0;
    3a98:	c7 05 20 14 01 00 00 	movl   $0x0,0x11420
    3a9f:	00 00 00 
					printf(0, "%s\n", keyContent.content);
    3aa2:	c7 44 24 08 6c 4b 01 	movl   $0x14b6c,0x8(%esp)
    3aa9:	00 
    3aaa:	c7 44 24 04 f9 c5 00 	movl   $0xc5f9,0x4(%esp)
    3ab1:	00 
    3ab2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ab9:	e8 f9 23 00 00       	call   5eb7 <printf>
    3abe:	eb 32                	jmp    3af2 <main+0x4c7>
				}
				else if (key == 8 && keyContent.length > 0) {
    3ac0:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    3ac4:	75 2c                	jne    3af2 <main+0x4c7>
    3ac6:	a1 80 4b 01 00       	mov    0x14b80,%eax
    3acb:	85 c0                	test   %eax,%eax
    3acd:	7e 23                	jle    3af2 <main+0x4c7>
					keyContent.content[--keyContent.length] = 0;
    3acf:	a1 80 4b 01 00       	mov    0x14b80,%eax
    3ad4:	83 e8 01             	sub    $0x1,%eax
    3ad7:	a3 80 4b 01 00       	mov    %eax,0x14b80
    3adc:	a1 80 4b 01 00       	mov    0x14b80,%eax
    3ae1:	c6 80 6c 4b 01 00 00 	movb   $0x0,0x14b6c(%eax)
					scrollOffset = 0;
    3ae8:	c7 05 20 14 01 00 00 	movl   $0x0,0x11420
    3aef:	00 00 00 
				}
				deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
    3af2:	8d 45 d0             	lea    -0x30(%ebp),%eax
    3af5:	c7 44 24 10 58 02 00 	movl   $0x258,0x10(%esp)
    3afc:	00 
    3afd:	c7 44 24 0c 20 03 00 	movl   $0x320,0xc(%esp)
    3b04:	00 
    3b05:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    3b0c:	00 
    3b0d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3b14:	00 
    3b15:	89 04 24             	mov    %eax,(%esp)
    3b18:	e8 5b 18 00 00       	call   5378 <initRect>
    3b1d:	83 ec 04             	sub    $0x4,%esp
    3b20:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b23:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b2a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3b31:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3b35:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3b38:	89 44 24 10          	mov    %eax,0x10(%esp)
    3b3c:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3b43:	e8 33 1a 00 00       	call   557b <deleteClickable>
				addWndEvent(&cm);
    3b48:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3b4f:	e8 fb da ff ff       	call   164f <addWndEvent>
				updateFileList(context);
    3b54:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3b59:	89 04 24             	mov    %eax,(%esp)
    3b5c:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3b61:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b65:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3b6a:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b6e:	e8 57 d3 ff ff       	call   eca <updateFileList>
				addListEvent(&cm);
    3b73:	c7 04 24 a0 4c 01 00 	movl   $0x14ca0,(%esp)
    3b7a:	e8 48 da ff ff       	call   15c7 <addListEvent>
				drawFinderContent(context);
    3b7f:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3b84:	89 04 24             	mov    %eax,(%esp)
    3b87:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3b8c:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b90:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3b95:	89 44 24 08          	mov    %eax,0x8(%esp)
    3b99:	e8 7b d4 ff ff       	call   1019 <drawFinderContent>
				drawFinderWnd(context);
    3b9e:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3ba3:	89 04 24             	mov    %eax,(%esp)
    3ba6:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3bab:	89 44 24 04          	mov    %eax,0x4(%esp)
    3baf:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3bb4:	89 44 24 08          	mov    %eax,0x8(%esp)
    3bb8:	e8 0e d1 ff ff       	call   ccb <drawFinderWnd>
				updateWindow(winid, context.addr, msg.msg_detail);
    3bbd:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3bc0:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3bc5:	89 54 24 08          	mov    %edx,0x8(%esp)
    3bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
    3bcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3bd0:	89 04 24             	mov    %eax,(%esp)
    3bd3:	e8 af 21 00 00       	call   5d87 <updateWindow>
			}
			if (renaming) {
    3bd8:	a1 b4 4c 01 00       	mov    0x14cb4,%eax
    3bdd:	85 c0                	test   %eax,%eax
    3bdf:	0f 84 2a 01 00 00    	je     3d0f <main+0x6e4>
				if (((key=='_')||(key=='.')||(key>='0'&&key<='9')||(key>='a'&&key<='z')||(key>='A'&&key<='Z')) && (strlen(currentlyRenaming->name)<30)) {
    3be5:	80 7d e3 5f          	cmpb   $0x5f,-0x1d(%ebp)
    3be9:	74 2a                	je     3c15 <main+0x5ea>
    3beb:	80 7d e3 2e          	cmpb   $0x2e,-0x1d(%ebp)
    3bef:	74 24                	je     3c15 <main+0x5ea>
    3bf1:	80 7d e3 2f          	cmpb   $0x2f,-0x1d(%ebp)
    3bf5:	7e 06                	jle    3bfd <main+0x5d2>
    3bf7:	80 7d e3 39          	cmpb   $0x39,-0x1d(%ebp)
    3bfb:	7e 18                	jle    3c15 <main+0x5ea>
    3bfd:	80 7d e3 60          	cmpb   $0x60,-0x1d(%ebp)
    3c01:	7e 06                	jle    3c09 <main+0x5de>
    3c03:	80 7d e3 7a          	cmpb   $0x7a,-0x1d(%ebp)
    3c07:	7e 0c                	jle    3c15 <main+0x5ea>
    3c09:	80 7d e3 40          	cmpb   $0x40,-0x1d(%ebp)
    3c0d:	7e 5e                	jle    3c6d <main+0x642>
    3c0f:	80 7d e3 5a          	cmpb   $0x5a,-0x1d(%ebp)
    3c13:	7f 58                	jg     3c6d <main+0x642>
    3c15:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c1a:	8b 40 14             	mov    0x14(%eax),%eax
    3c1d:	89 04 24             	mov    %eax,(%esp)
    3c20:	e8 d6 1e 00 00       	call   5afb <strlen>
    3c25:	83 f8 1d             	cmp    $0x1d,%eax
    3c28:	77 43                	ja     3c6d <main+0x642>
					currentlyRenaming->name[strlen(currentlyRenaming->name) + 1] = 0;
    3c2a:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c2f:	8b 58 14             	mov    0x14(%eax),%ebx
    3c32:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c37:	8b 40 14             	mov    0x14(%eax),%eax
    3c3a:	89 04 24             	mov    %eax,(%esp)
    3c3d:	e8 b9 1e 00 00       	call   5afb <strlen>
    3c42:	83 c0 01             	add    $0x1,%eax
    3c45:	01 d8                	add    %ebx,%eax
    3c47:	c6 00 00             	movb   $0x0,(%eax)
					currentlyRenaming->name[strlen(currentlyRenaming->name)] = key;
    3c4a:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c4f:	8b 58 14             	mov    0x14(%eax),%ebx
    3c52:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c57:	8b 40 14             	mov    0x14(%eax),%eax
    3c5a:	89 04 24             	mov    %eax,(%esp)
    3c5d:	e8 99 1e 00 00       	call   5afb <strlen>
    3c62:	8d 14 03             	lea    (%ebx,%eax,1),%edx
    3c65:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
    3c69:	88 02                	mov    %al,(%edx)
    3c6b:	eb 47                	jmp    3cb4 <main+0x689>
				}
				else if (key == 8 && (strlen(currentlyRenaming->name)>0)) {
    3c6d:	80 7d e3 08          	cmpb   $0x8,-0x1d(%ebp)
    3c71:	75 36                	jne    3ca9 <main+0x67e>
    3c73:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c78:	8b 40 14             	mov    0x14(%eax),%eax
    3c7b:	89 04 24             	mov    %eax,(%esp)
    3c7e:	e8 78 1e 00 00       	call   5afb <strlen>
    3c83:	85 c0                	test   %eax,%eax
    3c85:	74 22                	je     3ca9 <main+0x67e>
					currentlyRenaming->name[strlen(currentlyRenaming->name) - 1] = 0;
    3c87:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c8c:	8b 58 14             	mov    0x14(%eax),%ebx
    3c8f:	a1 2c 14 01 00       	mov    0x1142c,%eax
    3c94:	8b 40 14             	mov    0x14(%eax),%eax
    3c97:	89 04 24             	mov    %eax,(%esp)
    3c9a:	e8 5c 1e 00 00       	call   5afb <strlen>
    3c9f:	83 e8 01             	sub    $0x1,%eax
    3ca2:	01 d8                	add    %ebx,%eax
    3ca4:	c6 00 00             	movb   $0x0,(%eax)
    3ca7:	eb 0b                	jmp    3cb4 <main+0x689>
				} else if (key == '\n') {
    3ca9:	80 7d e3 0a          	cmpb   $0xa,-0x1d(%ebp)
    3cad:	75 05                	jne    3cb4 <main+0x689>
					unrename();
    3caf:	e8 5b ea ff ff       	call   270f <unrename>
				}
				drawFinderContent(context);
    3cb4:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3cb9:	89 04 24             	mov    %eax,(%esp)
    3cbc:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3cc1:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cc5:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3cca:	89 44 24 08          	mov    %eax,0x8(%esp)
    3cce:	e8 46 d3 ff ff       	call   1019 <drawFinderContent>
				drawFinderWnd(context);
    3cd3:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3cd8:	89 04 24             	mov    %eax,(%esp)
    3cdb:	a1 64 4b 01 00       	mov    0x14b64,%eax
    3ce0:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ce4:	a1 68 4b 01 00       	mov    0x14b68,%eax
    3ce9:	89 44 24 08          	mov    %eax,0x8(%esp)
    3ced:	e8 d9 cf ff ff       	call   ccb <drawFinderWnd>
				updateWindow(winid, context.addr, msg.msg_detail);
    3cf2:	8b 55 a8             	mov    -0x58(%ebp),%edx
    3cf5:	a1 60 4b 01 00       	mov    0x14b60,%eax
    3cfa:	89 54 24 08          	mov    %edx,0x8(%esp)
    3cfe:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d05:	89 04 24             	mov    %eax,(%esp)
    3d08:	e8 7a 20 00 00       	call   5d87 <updateWindow>
			}
			break;
    3d0d:	eb 03                	jmp    3d12 <main+0x6e7>
    3d0f:	eb 01                	jmp    3d12 <main+0x6e7>
		default:
			break;
    3d11:	90                   	nop
	updateFileList(context);
	deleteClickable(&cm.left_click, initRect(0, 0, 800, 600));
	addWndEvent(&cm);
	addListEvent(&cm);
	lenOfWaited = 0;
	while (isRun) {
    3d12:	a1 c0 0a 01 00       	mov    0x10ac0,%eax
    3d17:	85 c0                	test   %eax,%eax
    3d19:	0f 85 93 fa ff ff    	jne    37b2 <main+0x187>
			break;
		default:
			break;
		}
	}
	free_context(&context, winid);
    3d1f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3d22:	89 44 24 04          	mov    %eax,0x4(%esp)
    3d26:	c7 04 24 60 4b 01 00 	movl   $0x14b60,(%esp)
    3d2d:	e8 93 01 00 00       	call   3ec5 <free_context>
	exit();
    3d32:	e8 98 1f 00 00       	call   5ccf <exit>

00003d37 <testHandlers>:
}

void testHandlers() {
    3d37:	55                   	push   %ebp
    3d38:	89 e5                	mov    %esp,%ebp
    3d3a:	83 ec 18             	sub    $0x18,%esp

	list(".");
    3d3d:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    3d44:	e8 2c c8 ff ff       	call   575 <list>
	printf(0, "original list:\n");
    3d49:	c7 44 24 04 f8 c9 00 	movl   $0xc9f8,0x4(%esp)
    3d50:	00 
    3d51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d58:	e8 5a 21 00 00       	call   5eb7 <printf>
	printItemList();
    3d5d:	e8 18 d6 ff ff       	call   137a <printItemList>
	printf(0, "\n");
    3d62:	c7 44 24 04 08 ca 00 	movl   $0xca08,0x4(%esp)
    3d69:	00 
    3d6a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d71:	e8 41 21 00 00       	call   5eb7 <printf>
	printf(0, "new a folder:\n");
    3d76:	c7 44 24 04 0a ca 00 	movl   $0xca0a,0x4(%esp)
    3d7d:	00 
    3d7e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3d85:	e8 2d 21 00 00       	call   5eb7 <printf>
	newFolder("newfolder");
    3d8a:	c7 04 24 19 ca 00 00 	movl   $0xca19,(%esp)
    3d91:	e8 17 e3 ff ff       	call   20ad <newFolder>
	freeFileItemList();
    3d96:	e8 fc c6 ff ff       	call   497 <freeFileItemList>
	list(".");
    3d9b:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    3da2:	e8 ce c7 ff ff       	call   575 <list>
	printItemList();
    3da7:	e8 ce d5 ff ff       	call   137a <printItemList>
	printf(0, "\n");
    3dac:	c7 44 24 04 08 ca 00 	movl   $0xca08,0x4(%esp)
    3db3:	00 
    3db4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3dbb:	e8 f7 20 00 00       	call   5eb7 <printf>
	printf(0, "enter new folder:\n");
    3dc0:	c7 44 24 04 23 ca 00 	movl   $0xca23,0x4(%esp)
    3dc7:	00 
    3dc8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3dcf:	e8 e3 20 00 00       	call   5eb7 <printf>
	enterDir("newfolder");
    3dd4:	c7 04 24 19 ca 00 00 	movl   $0xca19,(%esp)
    3ddb:	e8 5f df ff ff       	call   1d3f <enterDir>
	freeFileItemList();
    3de0:	e8 b2 c6 ff ff       	call   497 <freeFileItemList>
	list(".");
    3de5:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    3dec:	e8 84 c7 ff ff       	call   575 <list>
	printItemList();
    3df1:	e8 84 d5 ff ff       	call   137a <printItemList>
	printf(0, "\n");
    3df6:	c7 44 24 04 08 ca 00 	movl   $0xca08,0x4(%esp)
    3dfd:	00 
    3dfe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e05:	e8 ad 20 00 00       	call   5eb7 <printf>
	printf(0, "new a file:\n");
    3e0a:	c7 44 24 04 36 ca 00 	movl   $0xca36,0x4(%esp)
    3e11:	00 
    3e12:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e19:	e8 99 20 00 00       	call   5eb7 <printf>
	newFile("newfile.txt");
    3e1e:	c7 04 24 43 ca 00 00 	movl   $0xca43,(%esp)
    3e25:	e8 8b e0 ff ff       	call   1eb5 <newFile>
	freeFileItemList();
    3e2a:	e8 68 c6 ff ff       	call   497 <freeFileItemList>
	list(".");
    3e2f:	c7 04 24 ed c5 00 00 	movl   $0xc5ed,(%esp)
    3e36:	e8 3a c7 ff ff       	call   575 <list>
	printItemList();
    3e3b:	e8 3a d5 ff ff       	call   137a <printItemList>
//	printf(0, "enter last folder:\n");
//	enterDir("..");
//	freeFileItemList();
//	list(".");
//	printItemList();
}
    3e40:	c9                   	leave  
    3e41:	c3                   	ret    

00003e42 <init_context>:
#include "stat.h"
#include "user.h"
#include "drawingAPI.h"

int init_context(struct Context* context_ptr, int width, int height)
{
    3e42:	55                   	push   %ebp
    3e43:	89 e5                	mov    %esp,%ebp
    3e45:	83 ec 18             	sub    $0x18,%esp
    context_ptr->width = width;
    3e48:	8b 45 08             	mov    0x8(%ebp),%eax
    3e4b:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e4e:	89 50 04             	mov    %edx,0x4(%eax)
    context_ptr->height = height;
    3e51:	8b 45 08             	mov    0x8(%ebp),%eax
    3e54:	8b 55 10             	mov    0x10(%ebp),%edx
    3e57:	89 50 08             	mov    %edx,0x8(%eax)
    context_ptr->addr = (unsigned short*)malloc(sizeof(unsigned short) * width * height);
    3e5a:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e5d:	8b 45 10             	mov    0x10(%ebp),%eax
    3e60:	0f af c2             	imul   %edx,%eax
    3e63:	01 c0                	add    %eax,%eax
    3e65:	89 04 24             	mov    %eax,(%esp)
    3e68:	e8 36 23 00 00       	call   61a3 <malloc>
    3e6d:	8b 55 08             	mov    0x8(%ebp),%edx
    3e70:	89 02                	mov    %eax,(%edx)
    memset(context_ptr->addr, 0, sizeof(unsigned short) * width * height);
    3e72:	8b 55 0c             	mov    0xc(%ebp),%edx
    3e75:	8b 45 10             	mov    0x10(%ebp),%eax
    3e78:	0f af c2             	imul   %edx,%eax
    3e7b:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3e7e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e81:	8b 00                	mov    (%eax),%eax
    3e83:	89 54 24 08          	mov    %edx,0x8(%esp)
    3e87:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3e8e:	00 
    3e8f:	89 04 24             	mov    %eax,(%esp)
    3e92:	e8 8b 1c 00 00       	call   5b22 <memset>
    initializeASCII();
    3e97:	e8 93 01 00 00       	call   402f <initializeASCII>
    initializeGBK();
    3e9c:	e8 17 03 00 00       	call   41b8 <initializeGBK>
    return createWindow(0, 0, width, height);
    3ea1:	8b 45 10             	mov    0x10(%ebp),%eax
    3ea4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eab:	89 44 24 08          	mov    %eax,0x8(%esp)
    3eaf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3eb6:	00 
    3eb7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ebe:	e8 b4 1e 00 00       	call   5d77 <createWindow>
}
    3ec3:	c9                   	leave  
    3ec4:	c3                   	ret    

00003ec5 <free_context>:

void free_context(struct Context* context_ptr, int winid)
{
    3ec5:	55                   	push   %ebp
    3ec6:	89 e5                	mov    %esp,%ebp
    3ec8:	83 ec 18             	sub    $0x18,%esp
    free(context_ptr->addr);
    3ecb:	8b 45 08             	mov    0x8(%ebp),%eax
    3ece:	8b 00                	mov    (%eax),%eax
    3ed0:	89 04 24             	mov    %eax,(%esp)
    3ed3:	e8 92 21 00 00       	call   606a <free>
    freeASCII();
    3ed8:	e8 c6 02 00 00       	call   41a3 <freeASCII>
    freeGBK();
    3edd:	e8 7e 03 00 00       	call   4260 <freeGBK>
    destroyWindow(winid);
    3ee2:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ee5:	89 04 24             	mov    %eax,(%esp)
    3ee8:	e8 92 1e 00 00       	call   5d7f <destroyWindow>
}
    3eed:	c9                   	leave  
    3eee:	c3                   	ret    

00003eef <draw_point>:
*             then do nothing!
*/

void
draw_point(struct Context c, unsigned int x, unsigned int y, unsigned short color)
{
    3eef:	55                   	push   %ebp
    3ef0:	89 e5                	mov    %esp,%ebp
    3ef2:	83 ec 04             	sub    $0x4,%esp
    3ef5:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3ef8:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  if(x >= c.width)
    3efc:	8b 45 0c             	mov    0xc(%ebp),%eax
    3eff:	3b 45 14             	cmp    0x14(%ebp),%eax
    3f02:	77 02                	ja     3f06 <draw_point+0x17>
    return;
    3f04:	eb 26                	jmp    3f2c <draw_point+0x3d>
  if(y >= c.height)
    3f06:	8b 45 10             	mov    0x10(%ebp),%eax
    3f09:	3b 45 18             	cmp    0x18(%ebp),%eax
    3f0c:	77 02                	ja     3f10 <draw_point+0x21>
    return;
    3f0e:	eb 1c                	jmp    3f2c <draw_point+0x3d>
  c.addr[y*c.width+x] = color;
    3f10:	8b 55 08             	mov    0x8(%ebp),%edx
    3f13:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f16:	0f af 45 18          	imul   0x18(%ebp),%eax
    3f1a:	89 c1                	mov    %eax,%ecx
    3f1c:	8b 45 14             	mov    0x14(%ebp),%eax
    3f1f:	01 c8                	add    %ecx,%eax
    3f21:	01 c0                	add    %eax,%eax
    3f23:	01 c2                	add    %eax,%edx
    3f25:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
    3f29:	66 89 02             	mov    %ax,(%edx)
}
    3f2c:	c9                   	leave  
    3f2d:	c3                   	ret    

00003f2e <fill_rect>:
/*
*fill_rect: set a rect area with a certain color
*/
void
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
    3f2e:	55                   	push   %ebp
    3f2f:	89 e5                	mov    %esp,%ebp
    3f31:	83 ec 2c             	sub    $0x2c,%esp
    3f34:	8b 45 24             	mov    0x24(%ebp),%eax
    3f37:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
    3f3b:	8b 45 1c             	mov    0x1c(%ebp),%eax
    3f3e:	8b 55 14             	mov    0x14(%ebp),%edx
    3f41:	01 c2                	add    %eax,%edx
    3f43:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f46:	39 c2                	cmp    %eax,%edx
    3f48:	0f 46 c2             	cmovbe %edx,%eax
    3f4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int my = c.height < by + height ? c.height : by + height;
    3f4e:	8b 45 20             	mov    0x20(%ebp),%eax
    3f51:	8b 55 18             	mov    0x18(%ebp),%edx
    3f54:	01 c2                	add    %eax,%edx
    3f56:	8b 45 10             	mov    0x10(%ebp),%eax
    3f59:	39 c2                	cmp    %eax,%edx
    3f5b:	0f 46 c2             	cmovbe %edx,%eax
    3f5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
	for (y = by; y < my; y++)
    3f61:	8b 45 18             	mov    0x18(%ebp),%eax
    3f64:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3f67:	eb 47                	jmp    3fb0 <fill_rect+0x82>
	{
		for (x = bx; x < mx; x++)
    3f69:	8b 45 14             	mov    0x14(%ebp),%eax
    3f6c:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f6f:	eb 33                	jmp    3fa4 <fill_rect+0x76>
		{
			draw_point(c, x, y, color);
    3f71:	0f b7 4d ec          	movzwl -0x14(%ebp),%ecx
    3f75:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3f78:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f7b:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    3f7f:	89 54 24 10          	mov    %edx,0x10(%esp)
    3f83:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3f87:	8b 45 08             	mov    0x8(%ebp),%eax
    3f8a:	89 04 24             	mov    %eax,(%esp)
    3f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f90:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f94:	8b 45 10             	mov    0x10(%ebp),%eax
    3f97:	89 44 24 08          	mov    %eax,0x8(%esp)
    3f9b:	e8 4f ff ff ff       	call   3eef <draw_point>
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
	{
		for (x = bx; x < mx; x++)
    3fa0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3fa4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fa7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3faa:	7c c5                	jl     3f71 <fill_rect+0x43>
fill_rect(struct Context c, unsigned int bx, unsigned int by, unsigned int width, unsigned int height, unsigned short color)
{
	int x, y;
	int mx = c.width < bx + width ? c.width : bx + width;
	int my = c.height < by + height ? c.height : by + height;
	for (y = by; y < my; y++)
    3fac:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    3fb0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fb3:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    3fb6:	7c b1                	jl     3f69 <fill_rect+0x3b>
		for (x = bx; x < mx; x++)
		{
			draw_point(c, x, y, color);
		}
	}
}
    3fb8:	c9                   	leave  
    3fb9:	c3                   	ret    

00003fba <printBinary>:

void printBinary(char c)
{
    3fba:	55                   	push   %ebp
    3fbb:	89 e5                	mov    %esp,%ebp
    3fbd:	83 ec 28             	sub    $0x28,%esp
    3fc0:	8b 45 08             	mov    0x8(%ebp),%eax
    3fc3:	88 45 e4             	mov    %al,-0x1c(%ebp)
	int i;
	for (i = 0; i < 8; i++)
    3fc6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3fcd:	eb 44                	jmp    4013 <printBinary+0x59>
	{
		if(((c << i) & 0x80) != 0)
    3fcf:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
    3fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fd6:	89 c1                	mov    %eax,%ecx
    3fd8:	d3 e2                	shl    %cl,%edx
    3fda:	89 d0                	mov    %edx,%eax
    3fdc:	25 80 00 00 00       	and    $0x80,%eax
    3fe1:	85 c0                	test   %eax,%eax
    3fe3:	74 16                	je     3ffb <printBinary+0x41>
		{
			printf(0, "1");
    3fe5:	c7 44 24 04 4f ca 00 	movl   $0xca4f,0x4(%esp)
    3fec:	00 
    3fed:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ff4:	e8 be 1e 00 00       	call   5eb7 <printf>
    3ff9:	eb 14                	jmp    400f <printBinary+0x55>
		}
		else
		{
			printf(0, "0");
    3ffb:	c7 44 24 04 51 ca 00 	movl   $0xca51,0x4(%esp)
    4002:	00 
    4003:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    400a:	e8 a8 1e 00 00       	call   5eb7 <printf>
}

void printBinary(char c)
{
	int i;
	for (i = 0; i < 8; i++)
    400f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4013:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    4017:	7e b6                	jle    3fcf <printBinary+0x15>
		{
			printf(0, "0");
		}
	}

	printf(0, "\n");
    4019:	c7 44 24 04 53 ca 00 	movl   $0xca53,0x4(%esp)
    4020:	00 
    4021:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4028:	e8 8a 1e 00 00       	call   5eb7 <printf>
}
    402d:	c9                   	leave  
    402e:	c3                   	ret    

0000402f <initializeASCII>:
char buf[512];
//hankaku是一个数组，将hankaku.txt文件中的每一行转化成一个8位整数（unsigned short）
//每16个整数可以代表一个字符
unsigned char *hankaku;
void initializeASCII()
{
    402f:	55                   	push   %ebp
    4030:	89 e5                	mov    %esp,%ebp
    4032:	56                   	push   %esi
    4033:	53                   	push   %ebx
    4034:	83 ec 30             	sub    $0x30,%esp

	int fd, n, i;
	int x, y;
	printf(0,"initialzing ASCII\n");
    4037:	c7 44 24 04 55 ca 00 	movl   $0xca55,0x4(%esp)
    403e:	00 
    403f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4046:	e8 6c 1e 00 00       	call   5eb7 <printf>
	//打开hankaku.txt文件
	if((fd = open(HANKAKU, 0)) < 0){
    404b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4052:	00 
    4053:	c7 04 24 68 ca 00 00 	movl   $0xca68,(%esp)
    405a:	e8 b0 1c 00 00       	call   5d0f <open>
    405f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4062:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4066:	79 21                	jns    4089 <initializeASCII+0x5a>
	  printf(0,"cannot open %s\n", HANKAKU);
    4068:	c7 44 24 08 68 ca 00 	movl   $0xca68,0x8(%esp)
    406f:	00 
    4070:	c7 44 24 04 74 ca 00 	movl   $0xca74,0x4(%esp)
    4077:	00 
    4078:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    407f:	e8 33 1e 00 00       	call   5eb7 <printf>
	  return;
    4084:	e9 13 01 00 00       	jmp    419c <initializeASCII+0x16d>
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
    4089:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    4090:	e8 0e 21 00 00       	call   61a3 <malloc>
    4095:	a3 c0 4c 01 00       	mov    %eax,0x14cc0
	for (i = 0; i < ASCII_NUM; i++)
    409a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40a1:	eb 12                	jmp    40b5 <initializeASCII+0x86>
	{
		hankaku[i] = 0;
    40a3:	8b 15 c0 4c 01 00    	mov    0x14cc0,%edx
    40a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ac:	01 d0                	add    %edx,%eax
    40ae:	c6 00 00             	movb   $0x0,(%eax)
	  printf(0,"cannot open %s\n", HANKAKU);
	  return;
	}
	//申请hankaku数组
	hankaku = malloc(ASCII_NUM*ASCII_HEIGHT);
	for (i = 0; i < ASCII_NUM; i++)
    40b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    40b5:	81 7d f4 ff 00 00 00 	cmpl   $0xff,-0xc(%ebp)
    40bc:	7e e5                	jle    40a3 <initializeASCII+0x74>

	//不断读取文件，如果读到的字符是“*/."，就按顺序记录到hankaku数组中
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
    40be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	y = 0;
    40c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	while((n = read(fd, buf, sizeof(buf))) > 0)
    40cc:	e9 84 00 00 00       	jmp    4155 <initializeASCII+0x126>
	{
		for (i = 0; i < n; i++){
    40d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    40d8:	eb 73                	jmp    414d <initializeASCII+0x11e>
			//printf(0,"%c, %d", buf[i], i);
			if (buf[i] == '*' || buf[i] == '.')
    40da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40dd:	05 e0 4c 01 00       	add    $0x14ce0,%eax
    40e2:	0f b6 00             	movzbl (%eax),%eax
    40e5:	3c 2a                	cmp    $0x2a,%al
    40e7:	74 0f                	je     40f8 <initializeASCII+0xc9>
    40e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40ec:	05 e0 4c 01 00       	add    $0x14ce0,%eax
    40f1:	0f b6 00             	movzbl (%eax),%eax
    40f4:	3c 2e                	cmp    $0x2e,%al
    40f6:	75 51                	jne    4149 <initializeASCII+0x11a>
			{
				if (buf[i] == '*')
    40f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40fb:	05 e0 4c 01 00       	add    $0x14ce0,%eax
    4100:	0f b6 00             	movzbl (%eax),%eax
    4103:	3c 2a                	cmp    $0x2a,%al
    4105:	75 2d                	jne    4134 <initializeASCII+0x105>
				{
					hankaku[y] |= (0x80 >> x);
    4107:	8b 15 c0 4c 01 00    	mov    0x14cc0,%edx
    410d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4110:	01 c2                	add    %eax,%edx
    4112:	8b 0d c0 4c 01 00    	mov    0x14cc0,%ecx
    4118:	8b 45 ec             	mov    -0x14(%ebp),%eax
    411b:	01 c8                	add    %ecx,%eax
    411d:	0f b6 00             	movzbl (%eax),%eax
    4120:	89 c3                	mov    %eax,%ebx
    4122:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4125:	be 80 00 00 00       	mov    $0x80,%esi
    412a:	89 c1                	mov    %eax,%ecx
    412c:	d3 fe                	sar    %cl,%esi
    412e:	89 f0                	mov    %esi,%eax
    4130:	09 d8                	or     %ebx,%eax
    4132:	88 02                	mov    %al,(%edx)
				}
				x ++;
    4134:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
				if (x >= ASCII_WIDTH)
    4138:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    413c:	7e 0b                	jle    4149 <initializeASCII+0x11a>
				{
					x = 0;
    413e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
					y ++;
    4145:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
	{
		for (i = 0; i < n; i++){
    4149:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    414d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4150:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    4153:	7c 85                	jl     40da <initializeASCII+0xab>
	//y表示当前记录到第几行（对应于hankaku数组里的第几个数），x表示当前记录到第几列
	//如果当前字符是"*",则对应第y个数第x位置为1
	//每当x == ASCII_WIDTH，x重新置为0, y++
	x = 0;
	y = 0;
	while((n = read(fd, buf, sizeof(buf))) > 0)
    4155:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    415c:	00 
    415d:	c7 44 24 04 e0 4c 01 	movl   $0x14ce0,0x4(%esp)
    4164:	00 
    4165:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4168:	89 04 24             	mov    %eax,(%esp)
    416b:	e8 77 1b 00 00       	call   5ce7 <read>
    4170:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    4173:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    4177:	0f 8f 54 ff ff ff    	jg     40d1 <initializeASCII+0xa2>

//	for (i = 0; i < ASCII_NUM * ASCII_HEIGHT; i++)
//	{
//		printBinary(hankaku[i]);
//	}
	printf(0,"initialzing ASCII complete!\n");
    417d:	c7 44 24 04 84 ca 00 	movl   $0xca84,0x4(%esp)
    4184:	00 
    4185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    418c:	e8 26 1d 00 00       	call   5eb7 <printf>
	close(fd);
    4191:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4194:	89 04 24             	mov    %eax,(%esp)
    4197:	e8 5b 1b 00 00       	call   5cf7 <close>
}
    419c:	83 c4 30             	add    $0x30,%esp
    419f:	5b                   	pop    %ebx
    41a0:	5e                   	pop    %esi
    41a1:	5d                   	pop    %ebp
    41a2:	c3                   	ret    

000041a3 <freeASCII>:

void freeASCII(){
    41a3:	55                   	push   %ebp
    41a4:	89 e5                	mov    %esp,%ebp
    41a6:	83 ec 18             	sub    $0x18,%esp
	free(hankaku);
    41a9:	a1 c0 4c 01 00       	mov    0x14cc0,%eax
    41ae:	89 04 24             	mov    %eax,(%esp)
    41b1:	e8 b4 1e 00 00       	call   606a <free>
}
    41b6:	c9                   	leave  
    41b7:	c3                   	ret    

000041b8 <initializeGBK>:

struct File_Node fontFile;
void initializeGBK(){
    41b8:	55                   	push   %ebp
    41b9:	89 e5                	mov    %esp,%ebp
    41bb:	83 ec 28             	sub    $0x28,%esp
	int fd;
	printf(0,"initialzing gbk\n");
    41be:	c7 44 24 04 a1 ca 00 	movl   $0xcaa1,0x4(%esp)
    41c5:	00 
    41c6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    41cd:	e8 e5 1c 00 00       	call   5eb7 <printf>
	if((fd = open(HZK16, 0)) < 0){
    41d2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    41d9:	00 
    41da:	c7 04 24 b2 ca 00 00 	movl   $0xcab2,(%esp)
    41e1:	e8 29 1b 00 00       	call   5d0f <open>
    41e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    41e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    41ed:	79 1e                	jns    420d <initializeGBK+0x55>
		printf(0,"cannot open %s\n", HZK16);
    41ef:	c7 44 24 08 b2 ca 00 	movl   $0xcab2,0x8(%esp)
    41f6:	00 
    41f7:	c7 44 24 04 74 ca 00 	movl   $0xca74,0x4(%esp)
    41fe:	00 
    41ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4206:	e8 ac 1c 00 00       	call   5eb7 <printf>
		return;
    420b:	eb 51                	jmp    425e <initializeGBK+0xa6>
	}
	fontFile.buf = malloc(27000*sizeof(unsigned char));
    420d:	c7 04 24 78 69 00 00 	movl   $0x6978,(%esp)
    4214:	e8 8a 1f 00 00       	call   61a3 <malloc>
    4219:	a3 c4 4c 01 00       	mov    %eax,0x14cc4
	fontFile.size = read(fd, fontFile.buf, 27000);
    421e:	a1 c4 4c 01 00       	mov    0x14cc4,%eax
    4223:	c7 44 24 08 78 69 00 	movl   $0x6978,0x8(%esp)
    422a:	00 
    422b:	89 44 24 04          	mov    %eax,0x4(%esp)
    422f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4232:	89 04 24             	mov    %eax,(%esp)
    4235:	e8 ad 1a 00 00       	call   5ce7 <read>
    423a:	a3 c8 4c 01 00       	mov    %eax,0x14cc8
	printf(0,"initialzing gbk complete!\n");
    423f:	c7 44 24 04 bc ca 00 	movl   $0xcabc,0x4(%esp)
    4246:	00 
    4247:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    424e:	e8 64 1c 00 00       	call   5eb7 <printf>
	close(fd);
    4253:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4256:	89 04 24             	mov    %eax,(%esp)
    4259:	e8 99 1a 00 00       	call   5cf7 <close>
}
    425e:	c9                   	leave  
    425f:	c3                   	ret    

00004260 <freeGBK>:

void freeGBK(){
    4260:	55                   	push   %ebp
    4261:	89 e5                	mov    %esp,%ebp
    4263:	83 ec 18             	sub    $0x18,%esp
	free(fontFile.buf);
    4266:	a1 c4 4c 01 00       	mov    0x14cc4,%eax
    426b:	89 04 24             	mov    %eax,(%esp)
    426e:	e8 f7 1d 00 00       	call   606a <free>
}
    4273:	c9                   	leave  
    4274:	c3                   	ret    

00004275 <put_ascii>:

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
    4275:	55                   	push   %ebp
    4276:	89 e5                	mov    %esp,%ebp
    4278:	53                   	push   %ebx
    4279:	83 ec 30             	sub    $0x30,%esp
    427c:	8b 55 14             	mov    0x14(%ebp),%edx
    427f:	8b 45 18             	mov    0x18(%ebp),%eax
    4282:	88 55 e8             	mov    %dl,-0x18(%ebp)
    4285:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    4289:	8b 45 20             	mov    0x20(%ebp),%eax
    428c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    428f:	eb 7f                	jmp    4310 <put_ascii+0x9b>
		for(tmpX = 0; tmpX < 8; tmpX++) {
    4291:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4298:	eb 6c                	jmp    4306 <put_ascii+0x91>
			if((((hankaku + (ascii * 16))[tmpY - y] << tmpX) & 0x80) == 0x80) {
    429a:	a1 c0 4c 01 00       	mov    0x14cc0,%eax
    429f:	0f b6 55 e8          	movzbl -0x18(%ebp),%edx
    42a3:	c1 e2 04             	shl    $0x4,%edx
    42a6:	89 d1                	mov    %edx,%ecx
    42a8:	8b 55 20             	mov    0x20(%ebp),%edx
    42ab:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    42ae:	29 d3                	sub    %edx,%ebx
    42b0:	89 da                	mov    %ebx,%edx
    42b2:	01 ca                	add    %ecx,%edx
    42b4:	01 d0                	add    %edx,%eax
    42b6:	0f b6 00             	movzbl (%eax),%eax
    42b9:	0f b6 d0             	movzbl %al,%edx
    42bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42bf:	89 c1                	mov    %eax,%ecx
    42c1:	d3 e2                	shl    %cl,%edx
    42c3:	89 d0                	mov    %edx,%eax
    42c5:	25 80 00 00 00       	and    $0x80,%eax
    42ca:	85 c0                	test   %eax,%eax
    42cc:	74 34                	je     4302 <put_ascii+0x8d>
				//printf(0, "x: %d, y: %d\n", x + tmpX, tmpY);
				draw_point(c, x + tmpX, tmpY, colorNum);
    42ce:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    42d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    42d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    42d8:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    42db:	01 d8                	add    %ebx,%eax
    42dd:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    42e1:	89 54 24 10          	mov    %edx,0x10(%esp)
    42e5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    42e9:	8b 45 08             	mov    0x8(%ebp),%eax
    42ec:	89 04 24             	mov    %eax,(%esp)
    42ef:	8b 45 0c             	mov    0xc(%ebp),%eax
    42f2:	89 44 24 04          	mov    %eax,0x4(%esp)
    42f6:	8b 45 10             	mov    0x10(%ebp),%eax
    42f9:	89 44 24 08          	mov    %eax,0x8(%esp)
    42fd:	e8 ed fb ff ff       	call   3eef <draw_point>
void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
		for(tmpX = 0; tmpX < 8; tmpX++) {
    4302:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4306:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    430a:	7e 8e                	jle    429a <put_ascii+0x25>

void put_ascii(struct Context c, unsigned char ascii, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	//printf(0, "put ascii: %c, color: %d\n", ascii, colorNum);
	for(tmpY = y; tmpY < y + 16; tmpY++) {
    430c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4310:	8b 45 20             	mov    0x20(%ebp),%eax
    4313:	83 c0 10             	add    $0x10,%eax
    4316:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4319:	0f 8f 72 ff ff ff    	jg     4291 <put_ascii+0x1c>
				draw_point(c, x + tmpX, tmpY, colorNum);
				//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
			}
		}
	}
}
    431f:	83 c4 30             	add    $0x30,%esp
    4322:	5b                   	pop    %ebx
    4323:	5d                   	pop    %ebp
    4324:	c3                   	ret    

00004325 <put_gbk>:

void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
    4325:	55                   	push   %ebp
    4326:	89 e5                	mov    %esp,%ebp
    4328:	53                   	push   %ebx
    4329:	83 ec 34             	sub    $0x34,%esp
    432c:	8b 55 14             	mov    0x14(%ebp),%edx
    432f:	8b 45 18             	mov    0x18(%ebp),%eax
    4332:	66 89 55 e8          	mov    %dx,-0x18(%ebp)
    4336:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    433a:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    433e:	0f b6 c0             	movzbl %al,%eax
    4341:	3d a0 00 00 00       	cmp    $0xa0,%eax
    4346:	0f 8e 40 01 00 00    	jle    448c <put_gbk+0x167>
    434c:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    4350:	66 c1 f8 08          	sar    $0x8,%ax
    4354:	98                   	cwtl   
    4355:	0f b6 c0             	movzbl %al,%eax
    4358:	3d a0 00 00 00       	cmp    $0xa0,%eax
    435d:	0f 8e 29 01 00 00    	jle    448c <put_gbk+0x167>
		hzk16Base = fontFile.buf;
    4363:	a1 c4 4c 01 00       	mov    0x14cc4,%eax
    4368:	89 45 ec             	mov    %eax,-0x14(%ebp)
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;
    436b:	0f bf 45 e8          	movswl -0x18(%ebp),%eax
    436f:	0f b6 c0             	movzbl %al,%eax
    4372:	2d a1 00 00 00       	sub    $0xa1,%eax
    4377:	6b c0 5e             	imul   $0x5e,%eax,%eax
    437a:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
    437e:	66 c1 fa 08          	sar    $0x8,%dx
    4382:	0f bf d2             	movswl %dx,%edx
    4385:	0f b6 d2             	movzbl %dl,%edx
    4388:	81 ea a1 00 00 00    	sub    $0xa1,%edx
    438e:	01 d0                	add    %edx,%eax
    4390:	c1 e0 05             	shl    $0x5,%eax
    4393:	89 45 f0             	mov    %eax,-0x10(%ebp)

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    4396:	8b 45 20             	mov    0x20(%ebp),%eax
    4399:	89 45 f4             	mov    %eax,-0xc(%ebp)
    439c:	e9 da 00 00 00       	jmp    447b <put_gbk+0x156>
			for(tmpX = 0; tmpX < 8; tmpX++) {
    43a1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    43a8:	eb 58                	jmp    4402 <put_gbk+0xdd>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    43aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
    43b0:	01 d0                	add    %edx,%eax
    43b2:	0f b6 00             	movzbl (%eax),%eax
    43b5:	0f b6 d0             	movzbl %al,%edx
    43b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43bb:	89 c1                	mov    %eax,%ecx
    43bd:	d3 e2                	shl    %cl,%edx
    43bf:	89 d0                	mov    %edx,%eax
    43c1:	25 80 00 00 00       	and    $0x80,%eax
    43c6:	85 c0                	test   %eax,%eax
    43c8:	74 34                	je     43fe <put_gbk+0xd9>
					draw_point(c, x + tmpX, tmpY, colorNum);
    43ca:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    43ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
    43d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    43d4:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    43d7:	01 d8                	add    %ebx,%eax
    43d9:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    43dd:	89 54 24 10          	mov    %edx,0x10(%esp)
    43e1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    43e5:	8b 45 08             	mov    0x8(%ebp),%eax
    43e8:	89 04 24             	mov    %eax,(%esp)
    43eb:	8b 45 0c             	mov    0xc(%ebp),%eax
    43ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    43f2:	8b 45 10             	mov    0x10(%ebp),%eax
    43f5:	89 44 24 08          	mov    %eax,0x8(%esp)
    43f9:	e8 f1 fa ff ff       	call   3eef <draw_point>
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
			for(tmpX = 0; tmpX < 8; tmpX++) {
    43fe:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4402:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    4406:	7e a2                	jle    43aa <put_gbk+0x85>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
    4408:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
			for(tmpX = 0; tmpX < 8; tmpX++) {
    440c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4413:	eb 58                	jmp    446d <put_gbk+0x148>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
    4415:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4418:	8b 55 ec             	mov    -0x14(%ebp),%edx
    441b:	01 d0                	add    %edx,%eax
    441d:	0f b6 00             	movzbl (%eax),%eax
    4420:	0f b6 d0             	movzbl %al,%edx
    4423:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4426:	89 c1                	mov    %eax,%ecx
    4428:	d3 e2                	shl    %cl,%edx
    442a:	89 d0                	mov    %edx,%eax
    442c:	25 80 00 00 00       	and    $0x80,%eax
    4431:	85 c0                	test   %eax,%eax
    4433:	74 34                	je     4469 <put_gbk+0x144>
					draw_point(c, x + tmpX, tmpY, colorNum);
    4435:	0f b7 4d e4          	movzwl -0x1c(%ebp),%ecx
    4439:	8b 55 f4             	mov    -0xc(%ebp),%edx
    443c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    443f:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    4442:	01 d8                	add    %ebx,%eax
    4444:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    4448:	89 54 24 10          	mov    %edx,0x10(%esp)
    444c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4450:	8b 45 08             	mov    0x8(%ebp),%eax
    4453:	89 04 24             	mov    %eax,(%esp)
    4456:	8b 45 0c             	mov    0xc(%ebp),%eax
    4459:	89 44 24 04          	mov    %eax,0x4(%esp)
    445d:	8b 45 10             	mov    0x10(%ebp),%eax
    4460:	89 44 24 08          	mov    %eax,0x8(%esp)
    4464:	e8 86 fa ff ff       	call   3eef <draw_point>
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX] = colorNum;
				}
			}
			offset++;
			for(tmpX = 0; tmpX < 8; tmpX++) {
    4469:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    446d:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
    4471:	7e a2                	jle    4415 <put_gbk+0xf0>
				if(((hzk16Base[offset] << tmpX) & 0x80) == 0x80) {
					draw_point(c, x + tmpX, tmpY, colorNum);
					//sheet->buf[tmpY * sheet->width + x + tmpX + 8] = colorNum;
				}
			}
			offset++;
    4473:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
		hzk16Base = fontFile.buf;
		offset = (((gbk & 0x00FF) - 0xa1) * 94 + (((gbk >> 8) & 0x00FF) - 0xa1)) * 32;

		for(tmpY = y; tmpY < 16 + y; tmpY++) {
    4477:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    447b:	8b 45 20             	mov    0x20(%ebp),%eax
    447e:	83 c0 10             	add    $0x10,%eax
    4481:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4484:	0f 8f 17 ff ff ff    	jg     43a1 <put_gbk+0x7c>
void put_gbk(struct Context c, short gbk, unsigned short colorNum, int x, int y)
{
	int tmpX, tmpY;
	unsigned int offset;
	unsigned char *hzk16Base;
	if((gbk & 0x00FF) >= 0xA1 && ((gbk >> 8) & 0x00FF) >= 0xA1) {
    448a:	eb 7b                	jmp    4507 <put_gbk+0x1e2>
			}
			offset++;
		}
	}
	else {
		put_ascii(c, (gbk & 0x00FF), colorNum, x, y);
    448c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    4490:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    4494:	0f b6 c0             	movzbl %al,%eax
    4497:	8b 4d 20             	mov    0x20(%ebp),%ecx
    449a:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    449e:	8b 4d 1c             	mov    0x1c(%ebp),%ecx
    44a1:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    44a5:	89 54 24 10          	mov    %edx,0x10(%esp)
    44a9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44ad:	8b 45 08             	mov    0x8(%ebp),%eax
    44b0:	89 04 24             	mov    %eax,(%esp)
    44b3:	8b 45 0c             	mov    0xc(%ebp),%eax
    44b6:	89 44 24 04          	mov    %eax,0x4(%esp)
    44ba:	8b 45 10             	mov    0x10(%ebp),%eax
    44bd:	89 44 24 08          	mov    %eax,0x8(%esp)
    44c1:	e8 af fd ff ff       	call   4275 <put_ascii>
		put_ascii(c, ((gbk >> 8) & 0x00FF), colorNum, x + 8, y);
    44c6:	8b 45 1c             	mov    0x1c(%ebp),%eax
    44c9:	8d 58 08             	lea    0x8(%eax),%ebx
    44cc:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    44d0:	0f b7 45 e8          	movzwl -0x18(%ebp),%eax
    44d4:	66 c1 f8 08          	sar    $0x8,%ax
    44d8:	0f b6 c0             	movzbl %al,%eax
    44db:	8b 4d 20             	mov    0x20(%ebp),%ecx
    44de:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    44e2:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    44e6:	89 54 24 10          	mov    %edx,0x10(%esp)
    44ea:	89 44 24 0c          	mov    %eax,0xc(%esp)
    44ee:	8b 45 08             	mov    0x8(%ebp),%eax
    44f1:	89 04 24             	mov    %eax,(%esp)
    44f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    44f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    44fb:	8b 45 10             	mov    0x10(%ebp),%eax
    44fe:	89 44 24 08          	mov    %eax,0x8(%esp)
    4502:	e8 6e fd ff ff       	call   4275 <put_ascii>
	}
}
    4507:	83 c4 34             	add    $0x34,%esp
    450a:	5b                   	pop    %ebx
    450b:	5d                   	pop    %ebp
    450c:	c3                   	ret    

0000450d <puts_str>:

void puts_str(struct Context c, char *str, unsigned short colorNum, int x, int y)
{
    450d:	55                   	push   %ebp
    450e:	89 e5                	mov    %esp,%ebp
    4510:	83 ec 38             	sub    $0x38,%esp
    4513:	8b 45 18             	mov    0x18(%ebp),%eax
    4516:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
	//printf(0,"puts string : %s\n", str);
	int i = 0, xTmp;
    451a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
    4521:	8b 45 14             	mov    0x14(%ebp),%eax
    4524:	89 04 24             	mov    %eax,(%esp)
    4527:	e8 cf 15 00 00       	call   5afb <strlen>
    452c:	89 45 ec             	mov    %eax,-0x14(%ebp)
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    452f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4536:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4539:	89 45 f0             	mov    %eax,-0x10(%ebp)
    453c:	eb 49                	jmp    4587 <puts_str+0x7a>
		if(str[i] < 0xA1) {
			put_ascii(c, str[i], colorNum, xTmp, y);
    453e:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
    4542:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    4545:	8b 45 14             	mov    0x14(%ebp),%eax
    4548:	01 c8                	add    %ecx,%eax
    454a:	0f b6 00             	movzbl (%eax),%eax
    454d:	0f b6 c0             	movzbl %al,%eax
    4550:	8b 4d 20             	mov    0x20(%ebp),%ecx
    4553:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4557:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    455a:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    455e:	89 54 24 10          	mov    %edx,0x10(%esp)
    4562:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4566:	8b 45 08             	mov    0x8(%ebp),%eax
    4569:	89 04 24             	mov    %eax,(%esp)
    456c:	8b 45 0c             	mov    0xc(%ebp),%eax
    456f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4573:	8b 45 10             	mov    0x10(%ebp),%eax
    4576:	89 44 24 08          	mov    %eax,0x8(%esp)
    457a:	e8 f6 fc ff ff       	call   4275 <put_ascii>
			xTmp += 8;
    457f:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
			i++;
    4583:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
	int i = 0, xTmp;
	short wStr;
	uint rowLetterCnt;

	rowLetterCnt = strlen(str);
	for(i = 0, xTmp = x; i < rowLetterCnt;) {
    4587:	8b 45 f4             	mov    -0xc(%ebp),%eax
    458a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    458d:	72 af                	jb     453e <puts_str+0x31>
			put_gbk(c, wStr, colorNum, xTmp, y);
			xTmp += 16;
			i += 2;
		}
	}
}
    458f:	c9                   	leave  
    4590:	c3                   	ret    

00004591 <_RGB16BIT565>:

int _RGB16BIT565(int r,int g,int b){
    4591:	55                   	push   %ebp
    4592:	89 e5                	mov    %esp,%ebp
	return ((b / 8)+((g / 4)<<5)+((r / 8)<<11));
    4594:	8b 45 10             	mov    0x10(%ebp),%eax
    4597:	8d 50 07             	lea    0x7(%eax),%edx
    459a:	85 c0                	test   %eax,%eax
    459c:	0f 48 c2             	cmovs  %edx,%eax
    459f:	c1 f8 03             	sar    $0x3,%eax
    45a2:	89 c2                	mov    %eax,%edx
    45a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    45a7:	8d 48 03             	lea    0x3(%eax),%ecx
    45aa:	85 c0                	test   %eax,%eax
    45ac:	0f 48 c1             	cmovs  %ecx,%eax
    45af:	c1 f8 02             	sar    $0x2,%eax
    45b2:	c1 e0 05             	shl    $0x5,%eax
    45b5:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    45b8:	8b 45 08             	mov    0x8(%ebp),%eax
    45bb:	8d 50 07             	lea    0x7(%eax),%edx
    45be:	85 c0                	test   %eax,%eax
    45c0:	0f 48 c2             	cmovs  %edx,%eax
    45c3:	c1 f8 03             	sar    $0x3,%eax
    45c6:	c1 e0 0b             	shl    $0xb,%eax
    45c9:	01 c8                	add    %ecx,%eax
}
    45cb:	5d                   	pop    %ebp
    45cc:	c3                   	ret    

000045cd <draw_picture>:

void draw_picture(Context c, PICNODE pic, int x, int y)
{
    45cd:	55                   	push   %ebp
    45ce:	89 e5                	mov    %esp,%ebp
    45d0:	53                   	push   %ebx
    45d1:	83 ec 28             	sub    $0x28,%esp
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    45d4:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    45db:	e9 b1 00 00 00       	jmp    4691 <draw_picture+0xc4>
	{
		for (j = 0; j < pic.width; j++)
    45e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    45e7:	e9 95 00 00 00       	jmp    4681 <draw_picture+0xb4>
		{
			rgb = pic.data[i*pic.width+j];
    45ec:	8b 55 14             	mov    0x14(%ebp),%edx
    45ef:	8b 45 18             	mov    0x18(%ebp),%eax
    45f2:	0f af 45 f8          	imul   -0x8(%ebp),%eax
    45f6:	89 c1                	mov    %eax,%ecx
    45f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45fb:	01 c8                	add    %ecx,%eax
    45fd:	c1 e0 02             	shl    $0x2,%eax
    4600:	01 d0                	add    %edx,%eax
    4602:	8b 00                	mov    (%eax),%eax
    4604:	89 45 ee             	mov    %eax,-0x12(%ebp)
			if (rgb.rgbReserved == 1) continue;
    4607:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    460b:	3c 01                	cmp    $0x1,%al
    460d:	75 02                	jne    4611 <draw_picture+0x44>
    460f:	eb 6c                	jmp    467d <draw_picture+0xb0>
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
    4611:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
    4615:	0f b6 c8             	movzbl %al,%ecx
    4618:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    461c:	0f b6 d0             	movzbl %al,%edx
    461f:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
    4623:	0f b6 c0             	movzbl %al,%eax
    4626:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    462a:	89 54 24 04          	mov    %edx,0x4(%esp)
    462e:	89 04 24             	mov    %eax,(%esp)
    4631:	e8 5b ff ff ff       	call   4591 <_RGB16BIT565>
    4636:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
			draw_point(c, j + x, pic.height - 1 - i + y, color);
    463a:	0f b7 4d f2          	movzwl -0xe(%ebp),%ecx
    463e:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4641:	83 e8 01             	sub    $0x1,%eax
    4644:	2b 45 f8             	sub    -0x8(%ebp),%eax
    4647:	89 c2                	mov    %eax,%edx
    4649:	8b 45 24             	mov    0x24(%ebp),%eax
    464c:	01 d0                	add    %edx,%eax
    464e:	89 c2                	mov    %eax,%edx
    4650:	8b 45 20             	mov    0x20(%ebp),%eax
    4653:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    4656:	01 d8                	add    %ebx,%eax
    4658:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    465c:	89 54 24 10          	mov    %edx,0x10(%esp)
    4660:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4664:	8b 45 08             	mov    0x8(%ebp),%eax
    4667:	89 04 24             	mov    %eax,(%esp)
    466a:	8b 45 0c             	mov    0xc(%ebp),%eax
    466d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4671:	8b 45 10             	mov    0x10(%ebp),%eax
    4674:	89 44 24 08          	mov    %eax,0x8(%esp)
    4678:	e8 72 f8 ff ff       	call   3eef <draw_point>
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
	{
		for (j = 0; j < pic.width; j++)
    467d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4681:	8b 45 18             	mov    0x18(%ebp),%eax
    4684:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4687:	0f 8f 5f ff ff ff    	jg     45ec <draw_picture+0x1f>
void draw_picture(Context c, PICNODE pic, int x, int y)
{
	int i, j;
	unsigned short color;
	RGBQUAD rgb;
	for (i = 0; i < pic.height; i++)
    468d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4691:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4694:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4697:	0f 8f 43 ff ff ff    	jg     45e0 <draw_picture+0x13>
			if (rgb.rgbReserved == 1) continue;
			color = (unsigned short)_RGB16BIT565(rgb.rgbRed, rgb.rgbGreen, rgb.rgbBlue);
			draw_point(c, j + x, pic.height - 1 - i + y, color);
		}
	}
}
    469d:	83 c4 28             	add    $0x28,%esp
    46a0:	5b                   	pop    %ebx
    46a1:	5d                   	pop    %ebp
    46a2:	c3                   	ret    

000046a3 <draw_line>:

void draw_line(Context c, int x0, int y0, int x1, int y1, unsigned short color)
{
    46a3:	55                   	push   %ebp
    46a4:	89 e5                	mov    %esp,%ebp
    46a6:	83 ec 3c             	sub    $0x3c,%esp
    46a9:	8b 45 24             	mov    0x24(%ebp),%eax
    46ac:	66 89 45 dc          	mov    %ax,-0x24(%ebp)
	int dx, dy, x, y, len, i;
	dx = x1 - x0;
    46b0:	8b 45 14             	mov    0x14(%ebp),%eax
    46b3:	8b 55 1c             	mov    0x1c(%ebp),%edx
    46b6:	29 c2                	sub    %eax,%edx
    46b8:	89 d0                	mov    %edx,%eax
    46ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
	dy = y1 - y0;
    46bd:	8b 45 18             	mov    0x18(%ebp),%eax
    46c0:	8b 55 20             	mov    0x20(%ebp),%edx
    46c3:	29 c2                	sub    %eax,%edx
    46c5:	89 d0                	mov    %edx,%eax
    46c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
	x = x0 << 10;
    46ca:	8b 45 14             	mov    0x14(%ebp),%eax
    46cd:	c1 e0 0a             	shl    $0xa,%eax
    46d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	y = y0 << 10;
    46d3:	8b 45 18             	mov    0x18(%ebp),%eax
    46d6:	c1 e0 0a             	shl    $0xa,%eax
    46d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	dx = (dx < 0) ? -dx : dx;
    46dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    46df:	c1 f8 1f             	sar    $0x1f,%eax
    46e2:	31 45 fc             	xor    %eax,-0x4(%ebp)
    46e5:	29 45 fc             	sub    %eax,-0x4(%ebp)
	dy = (dy < 0) ? -dy : dy;
    46e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    46eb:	c1 f8 1f             	sar    $0x1f,%eax
    46ee:	31 45 f8             	xor    %eax,-0x8(%ebp)
    46f1:	29 45 f8             	sub    %eax,-0x8(%ebp)
	if(dx >= dy) {
    46f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    46f7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    46fa:	7c 57                	jl     4753 <draw_line+0xb0>
		len = dx + 1;
    46fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
    46ff:	83 c0 01             	add    $0x1,%eax
    4702:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dx = (x1 > x0) ? 1024 : -1024;
    4705:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4708:	3b 45 14             	cmp    0x14(%ebp),%eax
    470b:	7e 07                	jle    4714 <draw_line+0x71>
    470d:	b8 00 04 00 00       	mov    $0x400,%eax
    4712:	eb 05                	jmp    4719 <draw_line+0x76>
    4714:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    4719:	89 45 fc             	mov    %eax,-0x4(%ebp)
		dy = (y1 >= y0) ? (((y1 - y0 + 1) << 10) / len) : (((y1 - y0 - 1) << 10) / len);
    471c:	8b 45 20             	mov    0x20(%ebp),%eax
    471f:	3b 45 18             	cmp    0x18(%ebp),%eax
    4722:	7c 16                	jl     473a <draw_line+0x97>
    4724:	8b 45 18             	mov    0x18(%ebp),%eax
    4727:	8b 55 20             	mov    0x20(%ebp),%edx
    472a:	29 c2                	sub    %eax,%edx
    472c:	89 d0                	mov    %edx,%eax
    472e:	83 c0 01             	add    $0x1,%eax
    4731:	c1 e0 0a             	shl    $0xa,%eax
    4734:	99                   	cltd   
    4735:	f7 7d ec             	idivl  -0x14(%ebp)
    4738:	eb 14                	jmp    474e <draw_line+0xab>
    473a:	8b 45 18             	mov    0x18(%ebp),%eax
    473d:	8b 55 20             	mov    0x20(%ebp),%edx
    4740:	29 c2                	sub    %eax,%edx
    4742:	89 d0                	mov    %edx,%eax
    4744:	83 e8 01             	sub    $0x1,%eax
    4747:	c1 e0 0a             	shl    $0xa,%eax
    474a:	99                   	cltd   
    474b:	f7 7d ec             	idivl  -0x14(%ebp)
    474e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    4751:	eb 55                	jmp    47a8 <draw_line+0x105>
	}
	else {
		len = dy + 1;
    4753:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4756:	83 c0 01             	add    $0x1,%eax
    4759:	89 45 ec             	mov    %eax,-0x14(%ebp)
		dy = (y1 > y0) ? 1024 : -1024;
    475c:	8b 45 20             	mov    0x20(%ebp),%eax
    475f:	3b 45 18             	cmp    0x18(%ebp),%eax
    4762:	7e 07                	jle    476b <draw_line+0xc8>
    4764:	b8 00 04 00 00       	mov    $0x400,%eax
    4769:	eb 05                	jmp    4770 <draw_line+0xcd>
    476b:	b8 00 fc ff ff       	mov    $0xfffffc00,%eax
    4770:	89 45 f8             	mov    %eax,-0x8(%ebp)
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
    4773:	8b 45 1c             	mov    0x1c(%ebp),%eax
    4776:	3b 45 14             	cmp    0x14(%ebp),%eax
    4779:	7c 16                	jl     4791 <draw_line+0xee>
    477b:	8b 45 14             	mov    0x14(%ebp),%eax
    477e:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4781:	29 c2                	sub    %eax,%edx
    4783:	89 d0                	mov    %edx,%eax
    4785:	83 c0 01             	add    $0x1,%eax
    4788:	c1 e0 0a             	shl    $0xa,%eax
    478b:	99                   	cltd   
    478c:	f7 7d ec             	idivl  -0x14(%ebp)
    478f:	eb 14                	jmp    47a5 <draw_line+0x102>
    4791:	8b 45 14             	mov    0x14(%ebp),%eax
    4794:	8b 55 1c             	mov    0x1c(%ebp),%edx
    4797:	29 c2                	sub    %eax,%edx
    4799:	89 d0                	mov    %edx,%eax
    479b:	83 e8 01             	sub    $0x1,%eax
    479e:	c1 e0 0a             	shl    $0xa,%eax
    47a1:	99                   	cltd   
    47a2:	f7 7d ec             	idivl  -0x14(%ebp)
    47a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
	}
	for(i = 0; i < len; i++) {
    47a8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    47af:	eb 47                	jmp    47f8 <draw_line+0x155>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
    47b1:	0f b7 4d dc          	movzwl -0x24(%ebp),%ecx
    47b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    47b8:	c1 f8 0a             	sar    $0xa,%eax
    47bb:	89 c2                	mov    %eax,%edx
    47bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    47c0:	c1 f8 0a             	sar    $0xa,%eax
    47c3:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    47c7:	89 54 24 10          	mov    %edx,0x10(%esp)
    47cb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    47cf:	8b 45 08             	mov    0x8(%ebp),%eax
    47d2:	89 04 24             	mov    %eax,(%esp)
    47d5:	8b 45 0c             	mov    0xc(%ebp),%eax
    47d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    47dc:	8b 45 10             	mov    0x10(%ebp),%eax
    47df:	89 44 24 08          	mov    %eax,0x8(%esp)
    47e3:	e8 07 f7 ff ff       	call   3eef <draw_point>
		y += dy;
    47e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
    47eb:	01 45 f0             	add    %eax,-0x10(%ebp)
		x += dx;
    47ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
    47f1:	01 45 f4             	add    %eax,-0xc(%ebp)
	else {
		len = dy + 1;
		dy = (y1 > y0) ? 1024 : -1024;
		dx = (x1 >= x0) ? (((x1 - x0 + 1) << 10) / len) : (((x1 - x0 - 1) << 10) / len);
	}
	for(i = 0; i < len; i++) {
    47f4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    47f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    47fb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    47fe:	7c b1                	jl     47b1 <draw_line+0x10e>
		//printf(0, "draw line point: x=%d, y=%d\n", (x >> 10), (y >> 10));
		draw_point(c, (x >> 10), (y >> 10), color);
		y += dy;
		x += dx;
	}
}
    4800:	c9                   	leave  
    4801:	c3                   	ret    

00004802 <draw_window>:

void
draw_window(Context c, char *title)
{
    4802:	55                   	push   %ebp
    4803:	89 e5                	mov    %esp,%ebp
    4805:	83 ec 38             	sub    $0x38,%esp
  PICNODE pic;
  draw_line(c, 0, 0, c.width - 1, 0, BORDERLINE_COLOR);
    4808:	8b 45 0c             	mov    0xc(%ebp),%eax
    480b:	83 e8 01             	sub    $0x1,%eax
    480e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4815:	00 
    4816:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    481d:	00 
    481e:	89 44 24 14          	mov    %eax,0x14(%esp)
    4822:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4829:	00 
    482a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4831:	00 
    4832:	8b 45 08             	mov    0x8(%ebp),%eax
    4835:	89 04 24             	mov    %eax,(%esp)
    4838:	8b 45 0c             	mov    0xc(%ebp),%eax
    483b:	89 44 24 04          	mov    %eax,0x4(%esp)
    483f:	8b 45 10             	mov    0x10(%ebp),%eax
    4842:	89 44 24 08          	mov    %eax,0x8(%esp)
    4846:	e8 58 fe ff ff       	call   46a3 <draw_line>
  draw_line(c, c.width - 1, 0, c.width - 1, c.height - 1, BORDERLINE_COLOR);
    484b:	8b 45 10             	mov    0x10(%ebp),%eax
    484e:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4851:	8b 45 0c             	mov    0xc(%ebp),%eax
    4854:	8d 50 ff             	lea    -0x1(%eax),%edx
    4857:	8b 45 0c             	mov    0xc(%ebp),%eax
    485a:	83 e8 01             	sub    $0x1,%eax
    485d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    4864:	00 
    4865:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    4869:	89 54 24 14          	mov    %edx,0x14(%esp)
    486d:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    4874:	00 
    4875:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4879:	8b 45 08             	mov    0x8(%ebp),%eax
    487c:	89 04 24             	mov    %eax,(%esp)
    487f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4882:	89 44 24 04          	mov    %eax,0x4(%esp)
    4886:	8b 45 10             	mov    0x10(%ebp),%eax
    4889:	89 44 24 08          	mov    %eax,0x8(%esp)
    488d:	e8 11 fe ff ff       	call   46a3 <draw_line>
  draw_line(c, c.width - 1, c.height - 1, 0, c.height - 1, BORDERLINE_COLOR);
    4892:	8b 45 10             	mov    0x10(%ebp),%eax
    4895:	8d 48 ff             	lea    -0x1(%eax),%ecx
    4898:	8b 45 10             	mov    0x10(%ebp),%eax
    489b:	8d 50 ff             	lea    -0x1(%eax),%edx
    489e:	8b 45 0c             	mov    0xc(%ebp),%eax
    48a1:	83 e8 01             	sub    $0x1,%eax
    48a4:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    48ab:	00 
    48ac:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    48b0:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    48b7:	00 
    48b8:	89 54 24 10          	mov    %edx,0x10(%esp)
    48bc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    48c0:	8b 45 08             	mov    0x8(%ebp),%eax
    48c3:	89 04 24             	mov    %eax,(%esp)
    48c6:	8b 45 0c             	mov    0xc(%ebp),%eax
    48c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    48cd:	8b 45 10             	mov    0x10(%ebp),%eax
    48d0:	89 44 24 08          	mov    %eax,0x8(%esp)
    48d4:	e8 ca fd ff ff       	call   46a3 <draw_line>
  draw_line(c, 0, c.height - 1, 0, 0, BORDERLINE_COLOR);
    48d9:	8b 45 10             	mov    0x10(%ebp),%eax
    48dc:	83 e8 01             	sub    $0x1,%eax
    48df:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
    48e6:	00 
    48e7:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    48ee:	00 
    48ef:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    48f6:	00 
    48f7:	89 44 24 10          	mov    %eax,0x10(%esp)
    48fb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    4902:	00 
    4903:	8b 45 08             	mov    0x8(%ebp),%eax
    4906:	89 04 24             	mov    %eax,(%esp)
    4909:	8b 45 0c             	mov    0xc(%ebp),%eax
    490c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4910:	8b 45 10             	mov    0x10(%ebp),%eax
    4913:	89 44 24 08          	mov    %eax,0x8(%esp)
    4917:	e8 87 fd ff ff       	call   46a3 <draw_line>
  fill_rect(c, 1, 1, c.width - 2, BOTTOMBAR_HEIGHT, TOPBAR_COLOR);
    491c:	8b 45 0c             	mov    0xc(%ebp),%eax
    491f:	83 e8 02             	sub    $0x2,%eax
    4922:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    4929:	00 
    492a:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    4931:	00 
    4932:	89 44 24 14          	mov    %eax,0x14(%esp)
    4936:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    493d:	00 
    493e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4945:	00 
    4946:	8b 45 08             	mov    0x8(%ebp),%eax
    4949:	89 04 24             	mov    %eax,(%esp)
    494c:	8b 45 0c             	mov    0xc(%ebp),%eax
    494f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4953:	8b 45 10             	mov    0x10(%ebp),%eax
    4956:	89 44 24 08          	mov    %eax,0x8(%esp)
    495a:	e8 cf f5 ff ff       	call   3f2e <fill_rect>
  fill_rect(c, 1, c.height - 1 - BOTTOMBAR_HEIGHT, c.width - 2, BOTTOMBAR_HEIGHT, BOTTOMBAR_COLOR);
    495f:	8b 45 0c             	mov    0xc(%ebp),%eax
    4962:	83 e8 02             	sub    $0x2,%eax
    4965:	89 c2                	mov    %eax,%edx
    4967:	8b 45 10             	mov    0x10(%ebp),%eax
    496a:	83 e8 15             	sub    $0x15,%eax
    496d:	c7 44 24 1c cb 5a 00 	movl   $0x5acb,0x1c(%esp)
    4974:	00 
    4975:	c7 44 24 18 14 00 00 	movl   $0x14,0x18(%esp)
    497c:	00 
    497d:	89 54 24 14          	mov    %edx,0x14(%esp)
    4981:	89 44 24 10          	mov    %eax,0x10(%esp)
    4985:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    498c:	00 
    498d:	8b 45 08             	mov    0x8(%ebp),%eax
    4990:	89 04 24             	mov    %eax,(%esp)
    4993:	8b 45 0c             	mov    0xc(%ebp),%eax
    4996:	89 44 24 04          	mov    %eax,0x4(%esp)
    499a:	8b 45 10             	mov    0x10(%ebp),%eax
    499d:	89 44 24 08          	mov    %eax,0x8(%esp)
    49a1:	e8 88 f5 ff ff       	call   3f2e <fill_rect>

  loadBitmap(&pic, "close.bmp");
    49a6:	c7 44 24 04 d7 ca 00 	movl   $0xcad7,0x4(%esp)
    49ad:	00 
    49ae:	8d 45 ec             	lea    -0x14(%ebp),%eax
    49b1:	89 04 24             	mov    %eax,(%esp)
    49b4:	e8 44 01 00 00       	call   4afd <loadBitmap>
  draw_picture(c, pic, 3, 3);
    49b9:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
    49c0:	00 
    49c1:	c7 44 24 18 03 00 00 	movl   $0x3,0x18(%esp)
    49c8:	00 
    49c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    49cc:	89 44 24 0c          	mov    %eax,0xc(%esp)
    49d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    49d3:	89 44 24 10          	mov    %eax,0x10(%esp)
    49d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    49da:	89 44 24 14          	mov    %eax,0x14(%esp)
    49de:	8b 45 08             	mov    0x8(%ebp),%eax
    49e1:	89 04 24             	mov    %eax,(%esp)
    49e4:	8b 45 0c             	mov    0xc(%ebp),%eax
    49e7:	89 44 24 04          	mov    %eax,0x4(%esp)
    49eb:	8b 45 10             	mov    0x10(%ebp),%eax
    49ee:	89 44 24 08          	mov    %eax,0x8(%esp)
    49f2:	e8 d6 fb ff ff       	call   45cd <draw_picture>
  puts_str(c, title, TITLE_COLOR, TITLE_OFFSET_X, TITLE_OFFSET_Y);
    49f7:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
    49fe:	00 
    49ff:	c7 44 24 14 19 00 00 	movl   $0x19,0x14(%esp)
    4a06:	00 
    4a07:	c7 44 24 10 ff ff 00 	movl   $0xffff,0x10(%esp)
    4a0e:	00 
    4a0f:	8b 45 14             	mov    0x14(%ebp),%eax
    4a12:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4a16:	8b 45 08             	mov    0x8(%ebp),%eax
    4a19:	89 04 24             	mov    %eax,(%esp)
    4a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
    4a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a23:	8b 45 10             	mov    0x10(%ebp),%eax
    4a26:	89 44 24 08          	mov    %eax,0x8(%esp)
    4a2a:	e8 de fa ff ff       	call   450d <puts_str>
  freepic(&pic);
    4a2f:	8d 45 ec             	lea    -0x14(%ebp),%eax
    4a32:	89 04 24             	mov    %eax,(%esp)
    4a35:	e8 6f 06 00 00       	call   50a9 <freepic>
}
    4a3a:	c9                   	leave  
    4a3b:	c3                   	ret    

00004a3c <load_iconlist>:

void load_iconlist(ICON* iconlist, int len)
{
    4a3c:	55                   	push   %ebp
    4a3d:	89 e5                	mov    %esp,%ebp
    4a3f:	83 ec 28             	sub    $0x28,%esp
	int i;
	for (i = 0; i < len; i++)
    4a42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4a49:	eb 29                	jmp    4a74 <load_iconlist+0x38>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
    4a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a4e:	6b d0 34             	imul   $0x34,%eax,%edx
    4a51:	8b 45 08             	mov    0x8(%ebp),%eax
    4a54:	01 d0                	add    %edx,%eax
    4a56:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4a59:	6b ca 34             	imul   $0x34,%edx,%ecx
    4a5c:	8b 55 08             	mov    0x8(%ebp),%edx
    4a5f:	01 ca                	add    %ecx,%edx
    4a61:	83 c2 28             	add    $0x28,%edx
    4a64:	89 44 24 04          	mov    %eax,0x4(%esp)
    4a68:	89 14 24             	mov    %edx,(%esp)
    4a6b:	e8 8d 00 00 00       	call   4afd <loadBitmap>
}

void load_iconlist(ICON* iconlist, int len)
{
	int i;
	for (i = 0; i < len; i++)
    4a70:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4a77:	3b 45 0c             	cmp    0xc(%ebp),%eax
    4a7a:	7c cf                	jl     4a4b <load_iconlist+0xf>
	{
	    loadBitmap(&(iconlist[i].pic), iconlist[i].name);
	}
}
    4a7c:	c9                   	leave  
    4a7d:	c3                   	ret    

00004a7e <draw_iconlist>:
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    4a7e:	55                   	push   %ebp
    4a7f:	89 e5                	mov    %esp,%ebp
    4a81:	53                   	push   %ebx
    4a82:	83 ec 30             	sub    $0x30,%esp
    int i;
    for (i = 0; i < len; i++)
    4a85:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    4a8c:	eb 61                	jmp    4aef <draw_iconlist+0x71>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    4a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4a91:	6b d0 34             	imul   $0x34,%eax,%edx
    4a94:	8b 45 14             	mov    0x14(%ebp),%eax
    4a97:	01 d0                	add    %edx,%eax
    4a99:	8b 48 24             	mov    0x24(%eax),%ecx
    4a9c:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4a9f:	6b d0 34             	imul   $0x34,%eax,%edx
    4aa2:	8b 45 14             	mov    0x14(%ebp),%eax
    4aa5:	01 d0                	add    %edx,%eax
    4aa7:	8b 50 20             	mov    0x20(%eax),%edx
    4aaa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4aad:	6b d8 34             	imul   $0x34,%eax,%ebx
    4ab0:	8b 45 14             	mov    0x14(%ebp),%eax
    4ab3:	01 d8                	add    %ebx,%eax
    4ab5:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
    4ab9:	89 54 24 18          	mov    %edx,0x18(%esp)
    4abd:	8b 50 28             	mov    0x28(%eax),%edx
    4ac0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    4ac4:	8b 50 2c             	mov    0x2c(%eax),%edx
    4ac7:	89 54 24 10          	mov    %edx,0x10(%esp)
    4acb:	8b 40 30             	mov    0x30(%eax),%eax
    4ace:	89 44 24 14          	mov    %eax,0x14(%esp)
    4ad2:	8b 45 08             	mov    0x8(%ebp),%eax
    4ad5:	89 04 24             	mov    %eax,(%esp)
    4ad8:	8b 45 0c             	mov    0xc(%ebp),%eax
    4adb:	89 44 24 04          	mov    %eax,0x4(%esp)
    4adf:	8b 45 10             	mov    0x10(%ebp),%eax
    4ae2:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ae6:	e8 e2 fa ff ff       	call   45cd <draw_picture>
	}
}
void draw_iconlist(Context c, ICON* iconlist, int len)
{
    int i;
    for (i = 0; i < len; i++)
    4aeb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    4aef:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4af2:	3b 45 18             	cmp    0x18(%ebp),%eax
    4af5:	7c 97                	jl     4a8e <draw_iconlist+0x10>
    {
        draw_picture(c, iconlist[i].pic, iconlist[i].position_x, iconlist[i].position_y);
    }
}
    4af7:	83 c4 30             	add    $0x30,%esp
    4afa:	5b                   	pop    %ebx
    4afb:	5d                   	pop    %ebp
    4afc:	c3                   	ret    

00004afd <loadBitmap>:
#include "clickable.h"

void showRgbQuan(RGBQUAD* pRGB);
void showBmpHead(BITMAPFILEHEADER* pBmpHead);
void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead);
void loadBitmap(PICNODE *pic, char pic_name[]) {
    4afd:	55                   	push   %ebp
    4afe:	89 e5                	mov    %esp,%ebp
    4b00:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	BITMAPFILEHEADER bitHead;
	BITMAPINFOHEADER bitInfoHead;
	char *BmpFileHeader;
	WORD *temp_WORD;
	DWORD *temp_DWORD;
	int fd, n, i, j, k, index = 0;
    4b06:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	int width;
	int height;

	if ((fd = open(pic_name, 0)) < 0) {
    4b0d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4b14:	00 
    4b15:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b18:	89 04 24             	mov    %eax,(%esp)
    4b1b:	e8 ef 11 00 00       	call   5d0f <open>
    4b20:	89 45 e8             	mov    %eax,-0x18(%ebp)
    4b23:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    4b27:	79 20                	jns    4b49 <loadBitmap+0x4c>
		printf(0, "cannot open %s\n", pic_name);
    4b29:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b30:	c7 44 24 04 e4 ca 00 	movl   $0xcae4,0x4(%esp)
    4b37:	00 
    4b38:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b3f:	e8 73 13 00 00       	call   5eb7 <printf>
		return;
    4b44:	e9 ef 02 00 00       	jmp    4e38 <loadBitmap+0x33b>
	}
	printf(0, "reading bitmap: %s\n", pic_name);
    4b49:	8b 45 0c             	mov    0xc(%ebp),%eax
    4b4c:	89 44 24 08          	mov    %eax,0x8(%esp)
    4b50:	c7 44 24 04 f4 ca 00 	movl   $0xcaf4,0x4(%esp)
    4b57:	00 
    4b58:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4b5f:	e8 53 13 00 00       	call   5eb7 <printf>
	//pfile = fopen(strFile,"rb");//打开文件
	BmpFileHeader = (char *) malloc(14 * sizeof(char));
    4b64:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
    4b6b:	e8 33 16 00 00       	call   61a3 <malloc>
    4b70:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	//printf(0, "file bmp open success.\n");
	//读取位图文件头信息
	//printf(0, "reading BmpFileHeader.\n");
	n = read(fd, BmpFileHeader, 14);
    4b73:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
    4b7a:	00 
    4b7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b7e:	89 44 24 04          	mov    %eax,0x4(%esp)
    4b82:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4b85:	89 04 24             	mov    %eax,(%esp)
    4b88:	e8 5a 11 00 00       	call   5ce7 <read>
    4b8d:	89 45 e0             	mov    %eax,-0x20(%ebp)
	//fread(BmpFileHeader,1,14,pfile);
	temp_WORD = (WORD*) (BmpFileHeader);
    4b90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4b93:	89 45 dc             	mov    %eax,-0x24(%ebp)
	bitHead.bfType = *temp_WORD;
    4b96:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4b99:	0f b7 00             	movzwl (%eax),%eax
    4b9c:	66 89 45 ac          	mov    %ax,-0x54(%ebp)
	if (bitHead.bfType != 0x4d42) {
    4ba0:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    4ba4:	66 3d 42 4d          	cmp    $0x4d42,%ax
    4ba8:	74 19                	je     4bc3 <loadBitmap+0xc6>
		printf(0, "file is not .bmp file!");
    4baa:	c7 44 24 04 08 cb 00 	movl   $0xcb08,0x4(%esp)
    4bb1:	00 
    4bb2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4bb9:	e8 f9 12 00 00       	call   5eb7 <printf>
		return;
    4bbe:	e9 75 02 00 00       	jmp    4e38 <loadBitmap+0x33b>
	}
	temp_DWORD = (DWORD *) (BmpFileHeader + sizeof(bitHead.bfType));
    4bc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bc6:	83 c0 02             	add    $0x2,%eax
    4bc9:	89 45 d8             	mov    %eax,-0x28(%ebp)
	bitHead.bfSize = *temp_DWORD;
    4bcc:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4bcf:	8b 00                	mov    (%eax),%eax
    4bd1:	89 45 b0             	mov    %eax,-0x50(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4bd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bd7:	83 c0 06             	add    $0x6,%eax
    4bda:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize));
	bitHead.bfReserved1 = *temp_WORD;
    4bdd:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4be0:	0f b7 00             	movzwl (%eax),%eax
    4be3:	66 89 45 b4          	mov    %ax,-0x4c(%ebp)
	temp_WORD = (WORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4be7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bea:	83 c0 08             	add    $0x8,%eax
    4bed:	89 45 dc             	mov    %eax,-0x24(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1));
	bitHead.bfReserved2 = *temp_WORD;
    4bf0:	8b 45 dc             	mov    -0x24(%ebp),%eax
    4bf3:	0f b7 00             	movzwl (%eax),%eax
    4bf6:	66 89 45 b6          	mov    %ax,-0x4a(%ebp)
	temp_DWORD = (DWORD*) (BmpFileHeader + sizeof(bitHead.bfType)
    4bfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4bfd:	83 c0 0a             	add    $0xa,%eax
    4c00:	89 45 d8             	mov    %eax,-0x28(%ebp)
			+ sizeof(bitHead.bfSize) + sizeof(bitHead.bfReserved1)
			+ sizeof(bitHead.bfReserved2));
	bitHead.bfOffBits = *temp_DWORD;
    4c03:	8b 45 d8             	mov    -0x28(%ebp),%eax
    4c06:	8b 00                	mov    (%eax),%eax
    4c08:	89 45 b8             	mov    %eax,-0x48(%ebp)
	//printf(0, "reading BmpFileHeader success!\n");
	//showBmpHead(&bitHead);
	//printf(0, "\n\n");
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
    4c0b:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    4c12:	00 
    4c13:	8d 45 84             	lea    -0x7c(%ebp),%eax
    4c16:	89 44 24 04          	mov    %eax,0x4(%esp)
    4c1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4c1d:	89 04 24             	mov    %eax,(%esp)
    4c20:	e8 c2 10 00 00       	call   5ce7 <read>
	width = bitInfoHead.biWidth;
    4c25:	8b 45 88             	mov    -0x78(%ebp),%eax
    4c28:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	height = bitInfoHead.biHeight;
    4c2b:	8b 45 8c             	mov    -0x74(%ebp),%eax
    4c2e:	89 45 d0             	mov    %eax,-0x30(%ebp)
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
			width * height * sizeof(RGBQUAD));
    4c31:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4c34:	0f af 45 d0          	imul   -0x30(%ebp),%eax
//
//	//读取位图信息头信息
	read(fd, &bitInfoHead, sizeof(BITMAPINFOHEADER));
	width = bitInfoHead.biWidth;
	height = bitInfoHead.biHeight;
	printf(0, "bmp width: %d, height: %d, size: %d\n", width, height,
    4c38:	c1 e0 02             	shl    $0x2,%eax
    4c3b:	89 44 24 10          	mov    %eax,0x10(%esp)
    4c3f:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4c42:	89 44 24 0c          	mov    %eax,0xc(%esp)
    4c46:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4c49:	89 44 24 08          	mov    %eax,0x8(%esp)
    4c4d:	c7 44 24 04 20 cb 00 	movl   $0xcb20,0x4(%esp)
    4c54:	00 
    4c55:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c5c:	e8 56 12 00 00       	call   5eb7 <printf>
			width * height * sizeof(RGBQUAD));
	//fread(&bitInfoHead,1,sizeof(BITMAPINFOHEADER),pfile);
	//showBmpInforHead(&bitInfoHead);
	//printf(0, "\n");
	if (n == 0) {
    4c61:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    4c65:	75 14                	jne    4c7b <loadBitmap+0x17e>
		printf(0, "0");
    4c67:	c7 44 24 04 45 cb 00 	movl   $0xcb45,0x4(%esp)
    4c6e:	00 
    4c6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4c76:	e8 3c 12 00 00       	call   5eb7 <printf>
	}

	//分配内存空间把源图存入内存
	int l_width = WIDTHBYTES(width * bitInfoHead.biBitCount);//计算位图的实际宽度并确保它为32的倍数
    4c7b:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    4c7f:	0f b7 c0             	movzwl %ax,%eax
    4c82:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    4c86:	83 c0 1f             	add    $0x1f,%eax
    4c89:	8d 50 1f             	lea    0x1f(%eax),%edx
    4c8c:	85 c0                	test   %eax,%eax
    4c8e:	0f 48 c2             	cmovs  %edx,%eax
    4c91:	c1 f8 05             	sar    $0x5,%eax
    4c94:	c1 e0 02             	shl    $0x2,%eax
    4c97:	89 45 cc             	mov    %eax,-0x34(%ebp)
	BYTE *pColorData = (BYTE *) malloc(height * l_width);
    4c9a:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4c9d:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4ca1:	89 04 24             	mov    %eax,(%esp)
    4ca4:	e8 fa 14 00 00       	call   61a3 <malloc>
    4ca9:	89 45 c8             	mov    %eax,-0x38(%ebp)
	memset(pColorData, 0, (uint) height * l_width);
    4cac:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4caf:	8b 45 cc             	mov    -0x34(%ebp),%eax
    4cb2:	0f af c2             	imul   %edx,%eax
    4cb5:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cb9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4cc0:	00 
    4cc1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4cc4:	89 04 24             	mov    %eax,(%esp)
    4cc7:	e8 56 0e 00 00       	call   5b22 <memset>
	long nData = height * l_width;
    4ccc:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4ccf:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4cd3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
	//把位图数据信息读到数组里
	read(fd, pColorData, nData);
    4cd6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    4cd9:	89 44 24 08          	mov    %eax,0x8(%esp)
    4cdd:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4ce0:	89 44 24 04          	mov    %eax,0x4(%esp)
    4ce4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4ce7:	89 04 24             	mov    %eax,(%esp)
    4cea:	e8 f8 0f 00 00       	call   5ce7 <read>

	//printf(0, "reading bmp data.\n");
	//将位图数据转化为RGB数据
	RGBQUAD* dataOfBmp;

	dataOfBmp = (RGBQUAD *) malloc(width * height * sizeof(RGBQUAD));//用于保存各像素对应的RGB数据
    4cef:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    4cf2:	0f af 45 d0          	imul   -0x30(%ebp),%eax
    4cf6:	c1 e0 02             	shl    $0x2,%eax
    4cf9:	89 04 24             	mov    %eax,(%esp)
    4cfc:	e8 a2 14 00 00       	call   61a3 <malloc>
    4d01:	89 45 c0             	mov    %eax,-0x40(%ebp)
	memset(dataOfBmp, 0, (uint) width * height * sizeof(RGBQUAD));
    4d04:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4d07:	8b 45 d0             	mov    -0x30(%ebp),%eax
    4d0a:	0f af c2             	imul   %edx,%eax
    4d0d:	c1 e0 02             	shl    $0x2,%eax
    4d10:	89 44 24 08          	mov    %eax,0x8(%esp)
    4d14:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    4d1b:	00 
    4d1c:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4d1f:	89 04 24             	mov    %eax,(%esp)
    4d22:	e8 fb 0d 00 00       	call   5b22 <memset>
	if (bitInfoHead.biBitCount < 24)	//有调色板，即位图为非真彩色
    4d27:	0f b7 45 92          	movzwl -0x6e(%ebp),%eax
    4d2b:	66 83 f8 17          	cmp    $0x17,%ax
    4d2f:	77 19                	ja     4d4a <loadBitmap+0x24d>
			{
		printf(0, "%s is not a 24 bit bmp! return.");
    4d31:	c7 44 24 04 48 cb 00 	movl   $0xcb48,0x4(%esp)
    4d38:	00 
    4d39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4d40:	e8 72 11 00 00       	call   5eb7 <printf>
		return;
    4d45:	e9 ee 00 00 00       	jmp    4e38 <loadBitmap+0x33b>
	} else	//位图为24位真彩色
	{
		index = 0;
    4d4a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
		for (i = 0; i < height; i++)
    4d51:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    4d58:	e9 94 00 00 00       	jmp    4df1 <loadBitmap+0x2f4>
			for (j = 0; j < width; j++) {
    4d5d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4d64:	eb 7b                	jmp    4de1 <loadBitmap+0x2e4>
				k = i * l_width + j * 3;
    4d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4d69:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    4d6d:	89 c1                	mov    %eax,%ecx
    4d6f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    4d72:	89 d0                	mov    %edx,%eax
    4d74:	01 c0                	add    %eax,%eax
    4d76:	01 d0                	add    %edx,%eax
    4d78:	01 c8                	add    %ecx,%eax
    4d7a:	89 45 bc             	mov    %eax,-0x44(%ebp)
				dataOfBmp[index].rgbRed = pColorData[k + 2];
    4d7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4d80:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4d87:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4d8a:	01 c2                	add    %eax,%edx
    4d8c:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4d8f:	8d 48 02             	lea    0x2(%eax),%ecx
    4d92:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4d95:	01 c8                	add    %ecx,%eax
    4d97:	0f b6 00             	movzbl (%eax),%eax
    4d9a:	88 42 02             	mov    %al,0x2(%edx)
				dataOfBmp[index].rgbGreen = pColorData[k + 1];
    4d9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4da0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4da7:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4daa:	01 c2                	add    %eax,%edx
    4dac:	8b 45 bc             	mov    -0x44(%ebp),%eax
    4daf:	8d 48 01             	lea    0x1(%eax),%ecx
    4db2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4db5:	01 c8                	add    %ecx,%eax
    4db7:	0f b6 00             	movzbl (%eax),%eax
    4dba:	88 42 01             	mov    %al,0x1(%edx)
				dataOfBmp[index].rgbBlue = pColorData[k];
    4dbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4dc0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    4dc7:	8b 45 c0             	mov    -0x40(%ebp),%eax
    4dca:	01 c2                	add    %eax,%edx
    4dcc:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    4dcf:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4dd2:	01 c8                	add    %ecx,%eax
    4dd4:	0f b6 00             	movzbl (%eax),%eax
    4dd7:	88 02                	mov    %al,(%edx)
				index++;
    4dd9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
			for (j = 0; j < width; j++) {
    4ddd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    4de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4de4:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
    4de7:	0f 8c 79 ff ff ff    	jl     4d66 <loadBitmap+0x269>
		printf(0, "%s is not a 24 bit bmp! return.");
		return;
	} else	//位图为24位真彩色
	{
		index = 0;
		for (i = 0; i < height; i++)
    4ded:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    4df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4df4:	3b 45 d0             	cmp    -0x30(%ebp),%eax
    4df7:	0f 8c 60 ff ff ff    	jl     4d5d <loadBitmap+0x260>
//			printf(0, "\n");
//		}
//		showRgbQuan(&dataOfBmp[i]);
//	}

	close(fd);
    4dfd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4e00:	89 04 24             	mov    %eax,(%esp)
    4e03:	e8 ef 0e 00 00       	call   5cf7 <close>

	//free(dataOfBmp);
	pic->data = dataOfBmp;
    4e08:	8b 45 08             	mov    0x8(%ebp),%eax
    4e0b:	8b 55 c0             	mov    -0x40(%ebp),%edx
    4e0e:	89 10                	mov    %edx,(%eax)
	pic->width = width;
    4e10:	8b 45 08             	mov    0x8(%ebp),%eax
    4e13:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    4e16:	89 50 04             	mov    %edx,0x4(%eax)
	pic->height = height;
    4e19:	8b 45 08             	mov    0x8(%ebp),%eax
    4e1c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    4e1f:	89 50 08             	mov    %edx,0x8(%eax)
	free(pColorData);
    4e22:	8b 45 c8             	mov    -0x38(%ebp),%eax
    4e25:	89 04 24             	mov    %eax,(%esp)
    4e28:	e8 3d 12 00 00       	call   606a <free>
	free(BmpFileHeader);
    4e2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4e30:	89 04 24             	mov    %eax,(%esp)
    4e33:	e8 32 12 00 00       	call   606a <free>
	//printf("\n");
}
    4e38:	c9                   	leave  
    4e39:	c3                   	ret    

00004e3a <showBmpHead>:

void showBmpHead(BITMAPFILEHEADER* pBmpHead) {
    4e3a:	55                   	push   %ebp
    4e3b:	89 e5                	mov    %esp,%ebp
    4e3d:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图文件头:\n");
    4e40:	c7 44 24 04 68 cb 00 	movl   $0xcb68,0x4(%esp)
    4e47:	00 
    4e48:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e4f:	e8 63 10 00 00       	call   5eb7 <printf>
	printf(0, "bmp格式标志bftype：0x%x\n", pBmpHead->bfType);
    4e54:	8b 45 08             	mov    0x8(%ebp),%eax
    4e57:	0f b7 00             	movzwl (%eax),%eax
    4e5a:	0f b7 c0             	movzwl %ax,%eax
    4e5d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e61:	c7 44 24 04 7a cb 00 	movl   $0xcb7a,0x4(%esp)
    4e68:	00 
    4e69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e70:	e8 42 10 00 00       	call   5eb7 <printf>
	printf(0, "文件大小:%d\n", pBmpHead->bfSize);
    4e75:	8b 45 08             	mov    0x8(%ebp),%eax
    4e78:	8b 40 04             	mov    0x4(%eax),%eax
    4e7b:	89 44 24 08          	mov    %eax,0x8(%esp)
    4e7f:	c7 44 24 04 98 cb 00 	movl   $0xcb98,0x4(%esp)
    4e86:	00 
    4e87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4e8e:	e8 24 10 00 00       	call   5eb7 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved1);
    4e93:	8b 45 08             	mov    0x8(%ebp),%eax
    4e96:	0f b7 40 08          	movzwl 0x8(%eax),%eax
    4e9a:	0f b7 c0             	movzwl %ax,%eax
    4e9d:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ea1:	c7 44 24 04 a9 cb 00 	movl   $0xcba9,0x4(%esp)
    4ea8:	00 
    4ea9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4eb0:	e8 02 10 00 00       	call   5eb7 <printf>
	printf(0, "保留字:%d\n", pBmpHead->bfReserved2);
    4eb5:	8b 45 08             	mov    0x8(%ebp),%eax
    4eb8:	0f b7 40 0a          	movzwl 0xa(%eax),%eax
    4ebc:	0f b7 c0             	movzwl %ax,%eax
    4ebf:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ec3:	c7 44 24 04 a9 cb 00 	movl   $0xcba9,0x4(%esp)
    4eca:	00 
    4ecb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4ed2:	e8 e0 0f 00 00       	call   5eb7 <printf>
	printf(0, "实际位图数据的偏移字节数:%d\n", pBmpHead->bfOffBits);
    4ed7:	8b 45 08             	mov    0x8(%ebp),%eax
    4eda:	8b 40 0c             	mov    0xc(%eax),%eax
    4edd:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ee1:	c7 44 24 04 b8 cb 00 	movl   $0xcbb8,0x4(%esp)
    4ee8:	00 
    4ee9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4ef0:	e8 c2 0f 00 00       	call   5eb7 <printf>
}
    4ef5:	c9                   	leave  
    4ef6:	c3                   	ret    

00004ef7 <showBmpInforHead>:

void showBmpInforHead(BITMAPINFOHEADER* pBmpInforHead) {
    4ef7:	55                   	push   %ebp
    4ef8:	89 e5                	mov    %esp,%ebp
    4efa:	83 ec 18             	sub    $0x18,%esp
	printf(0, "位图信息头:\n");
    4efd:	c7 44 24 04 e1 cb 00 	movl   $0xcbe1,0x4(%esp)
    4f04:	00 
    4f05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f0c:	e8 a6 0f 00 00       	call   5eb7 <printf>
	printf(0, "结构体的长度:%d\n", pBmpInforHead->biSize);
    4f11:	8b 45 08             	mov    0x8(%ebp),%eax
    4f14:	8b 00                	mov    (%eax),%eax
    4f16:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f1a:	c7 44 24 04 f3 cb 00 	movl   $0xcbf3,0x4(%esp)
    4f21:	00 
    4f22:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f29:	e8 89 0f 00 00       	call   5eb7 <printf>
	printf(0, "位图宽:%d\n", pBmpInforHead->biWidth);
    4f2e:	8b 45 08             	mov    0x8(%ebp),%eax
    4f31:	8b 40 04             	mov    0x4(%eax),%eax
    4f34:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f38:	c7 44 24 04 0a cc 00 	movl   $0xcc0a,0x4(%esp)
    4f3f:	00 
    4f40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f47:	e8 6b 0f 00 00       	call   5eb7 <printf>
	printf(0, "位图高:%d\n", pBmpInforHead->biHeight);
    4f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f4f:	8b 40 08             	mov    0x8(%eax),%eax
    4f52:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f56:	c7 44 24 04 18 cc 00 	movl   $0xcc18,0x4(%esp)
    4f5d:	00 
    4f5e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f65:	e8 4d 0f 00 00       	call   5eb7 <printf>
	printf(0, "biPlanes平面数:%d\n", pBmpInforHead->biPlanes);
    4f6a:	8b 45 08             	mov    0x8(%ebp),%eax
    4f6d:	0f b7 40 0c          	movzwl 0xc(%eax),%eax
    4f71:	0f b7 c0             	movzwl %ax,%eax
    4f74:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f78:	c7 44 24 04 26 cc 00 	movl   $0xcc26,0x4(%esp)
    4f7f:	00 
    4f80:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4f87:	e8 2b 0f 00 00       	call   5eb7 <printf>
	printf(0, "biBitCount采用颜色位数:%d\n", pBmpInforHead->biBitCount);
    4f8c:	8b 45 08             	mov    0x8(%ebp),%eax
    4f8f:	0f b7 40 0e          	movzwl 0xe(%eax),%eax
    4f93:	0f b7 c0             	movzwl %ax,%eax
    4f96:	89 44 24 08          	mov    %eax,0x8(%esp)
    4f9a:	c7 44 24 04 3c cc 00 	movl   $0xcc3c,0x4(%esp)
    4fa1:	00 
    4fa2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4fa9:	e8 09 0f 00 00       	call   5eb7 <printf>
	printf(0, "压缩方式:%d\n", pBmpInforHead->biCompression);
    4fae:	8b 45 08             	mov    0x8(%ebp),%eax
    4fb1:	8b 40 10             	mov    0x10(%eax),%eax
    4fb4:	89 44 24 08          	mov    %eax,0x8(%esp)
    4fb8:	c7 44 24 04 5d cc 00 	movl   $0xcc5d,0x4(%esp)
    4fbf:	00 
    4fc0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4fc7:	e8 eb 0e 00 00       	call   5eb7 <printf>
	printf(0, "biSizeImage实际位图数据占用的字节数:%d\n", pBmpInforHead->biSizeImage);
    4fcc:	8b 45 08             	mov    0x8(%ebp),%eax
    4fcf:	8b 40 14             	mov    0x14(%eax),%eax
    4fd2:	89 44 24 08          	mov    %eax,0x8(%esp)
    4fd6:	c7 44 24 04 70 cc 00 	movl   $0xcc70,0x4(%esp)
    4fdd:	00 
    4fde:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4fe5:	e8 cd 0e 00 00       	call   5eb7 <printf>
	printf(0, "X方向分辨率:%d\n", pBmpInforHead->biXPelsPerMeter);
    4fea:	8b 45 08             	mov    0x8(%ebp),%eax
    4fed:	8b 40 18             	mov    0x18(%eax),%eax
    4ff0:	89 44 24 08          	mov    %eax,0x8(%esp)
    4ff4:	c7 44 24 04 a4 cc 00 	movl   $0xcca4,0x4(%esp)
    4ffb:	00 
    4ffc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5003:	e8 af 0e 00 00       	call   5eb7 <printf>
	printf(0, "Y方向分辨率:%d\n", pBmpInforHead->biYPelsPerMeter);
    5008:	8b 45 08             	mov    0x8(%ebp),%eax
    500b:	8b 40 1c             	mov    0x1c(%eax),%eax
    500e:	89 44 24 08          	mov    %eax,0x8(%esp)
    5012:	c7 44 24 04 b9 cc 00 	movl   $0xccb9,0x4(%esp)
    5019:	00 
    501a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5021:	e8 91 0e 00 00       	call   5eb7 <printf>
	printf(0, "使用的颜色数:%d\n", pBmpInforHead->biClrUsed);
    5026:	8b 45 08             	mov    0x8(%ebp),%eax
    5029:	8b 40 20             	mov    0x20(%eax),%eax
    502c:	89 44 24 08          	mov    %eax,0x8(%esp)
    5030:	c7 44 24 04 ce cc 00 	movl   $0xccce,0x4(%esp)
    5037:	00 
    5038:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    503f:	e8 73 0e 00 00       	call   5eb7 <printf>
	printf(0, "重要颜色数:%d\n", pBmpInforHead->biClrImportant);
    5044:	8b 45 08             	mov    0x8(%ebp),%eax
    5047:	8b 40 24             	mov    0x24(%eax),%eax
    504a:	89 44 24 08          	mov    %eax,0x8(%esp)
    504e:	c7 44 24 04 e5 cc 00 	movl   $0xcce5,0x4(%esp)
    5055:	00 
    5056:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    505d:	e8 55 0e 00 00       	call   5eb7 <printf>
}
    5062:	c9                   	leave  
    5063:	c3                   	ret    

00005064 <showRgbQuan>:
void showRgbQuan(RGBQUAD* pRGB) {
    5064:	55                   	push   %ebp
    5065:	89 e5                	mov    %esp,%ebp
    5067:	83 ec 28             	sub    $0x28,%esp
	printf(0, "(%d,%d,%d) ", pRGB->rgbRed, pRGB->rgbGreen, pRGB->rgbBlue);
    506a:	8b 45 08             	mov    0x8(%ebp),%eax
    506d:	0f b6 00             	movzbl (%eax),%eax
    5070:	0f b6 c8             	movzbl %al,%ecx
    5073:	8b 45 08             	mov    0x8(%ebp),%eax
    5076:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    507a:	0f b6 d0             	movzbl %al,%edx
    507d:	8b 45 08             	mov    0x8(%ebp),%eax
    5080:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    5084:	0f b6 c0             	movzbl %al,%eax
    5087:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    508b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    508f:	89 44 24 08          	mov    %eax,0x8(%esp)
    5093:	c7 44 24 04 f9 cc 00 	movl   $0xccf9,0x4(%esp)
    509a:	00 
    509b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    50a2:	e8 10 0e 00 00       	call   5eb7 <printf>
}
    50a7:	c9                   	leave  
    50a8:	c3                   	ret    

000050a9 <freepic>:

void freepic(PICNODE *pic) {
    50a9:	55                   	push   %ebp
    50aa:	89 e5                	mov    %esp,%ebp
    50ac:	83 ec 18             	sub    $0x18,%esp
	free(pic->data);
    50af:	8b 45 08             	mov    0x8(%ebp),%eax
    50b2:	8b 00                	mov    (%eax),%eax
    50b4:	89 04 24             	mov    %eax,(%esp)
    50b7:	e8 ae 0f 00 00       	call   606a <free>
}
    50bc:	c9                   	leave  
    50bd:	c3                   	ret    

000050be <set_icon_alpha>:

void set_icon_alpha(PICNODE *pic) {
    50be:	55                   	push   %ebp
    50bf:	89 e5                	mov    %esp,%ebp
    50c1:	53                   	push   %ebx
    50c2:	81 ec 84 00 00 00    	sub    $0x84,%esp
	int W = 15;
    50c8:	c7 45 ec 0f 00 00 00 	movl   $0xf,-0x14(%ebp)
	Rect r1 = initRect(0, 0, W, W);
    50cf:	8d 45 dc             	lea    -0x24(%ebp),%eax
    50d2:	8b 55 ec             	mov    -0x14(%ebp),%edx
    50d5:	89 54 24 10          	mov    %edx,0x10(%esp)
    50d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
    50dc:	89 54 24 0c          	mov    %edx,0xc(%esp)
    50e0:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    50e7:	00 
    50e8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    50ef:	00 
    50f0:	89 04 24             	mov    %eax,(%esp)
    50f3:	e8 80 02 00 00       	call   5378 <initRect>
    50f8:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(pic->width - W, 0, W, W);
    50fb:	8b 45 08             	mov    0x8(%ebp),%eax
    50fe:	8b 40 04             	mov    0x4(%eax),%eax
    5101:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5104:	89 c2                	mov    %eax,%edx
    5106:	8d 45 cc             	lea    -0x34(%ebp),%eax
    5109:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    510c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5110:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    5113:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    5117:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    511e:	00 
    511f:	89 54 24 04          	mov    %edx,0x4(%esp)
    5123:	89 04 24             	mov    %eax,(%esp)
    5126:	e8 4d 02 00 00       	call   5378 <initRect>
    512b:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
    512e:	8b 45 08             	mov    0x8(%ebp),%eax
    5131:	8b 40 08             	mov    0x8(%eax),%eax
    5134:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5137:	89 c1                	mov    %eax,%ecx
    5139:	8b 45 08             	mov    0x8(%ebp),%eax
    513c:	8b 40 04             	mov    0x4(%eax),%eax
    513f:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5142:	89 c2                	mov    %eax,%edx
    5144:	8d 45 bc             	lea    -0x44(%ebp),%eax
    5147:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    514a:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    514e:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    5151:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    5155:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    5159:	89 54 24 04          	mov    %edx,0x4(%esp)
    515d:	89 04 24             	mov    %eax,(%esp)
    5160:	e8 13 02 00 00       	call   5378 <initRect>
    5165:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0, pic->height - W, W, W);
    5168:	8b 45 08             	mov    0x8(%ebp),%eax
    516b:	8b 40 08             	mov    0x8(%eax),%eax
    516e:	2b 45 ec             	sub    -0x14(%ebp),%eax
    5171:	89 c2                	mov    %eax,%edx
    5173:	8d 45 ac             	lea    -0x54(%ebp),%eax
    5176:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    5179:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    517d:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    5180:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    5184:	89 54 24 08          	mov    %edx,0x8(%esp)
    5188:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    518f:	00 
    5190:	89 04 24             	mov    %eax,(%esp)
    5193:	e8 e0 01 00 00       	call   5378 <initRect>
    5198:	83 ec 04             	sub    $0x4,%esp
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    519b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    51a2:	e9 96 01 00 00       	jmp    533d <set_icon_alpha+0x27f>
		for (j = 0; j < pic->height; j++) {
    51a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    51ae:	e9 77 01 00 00       	jmp    532a <set_icon_alpha+0x26c>
			p = initPoint(i, j);
    51b3:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    51b6:	8b 55 f0             	mov    -0x10(%ebp),%edx
    51b9:	89 54 24 08          	mov    %edx,0x8(%esp)
    51bd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    51c0:	89 54 24 04          	mov    %edx,0x4(%esp)
    51c4:	89 04 24             	mov    %eax,(%esp)
    51c7:	e8 85 01 00 00       	call   5351 <initPoint>
    51cc:	83 ec 04             	sub    $0x4,%esp
			if (isIn(p, r1) || isIn(p, r2) || isIn(p, r3) || isIn(p, r4)) {
    51cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
    51d2:	89 44 24 08          	mov    %eax,0x8(%esp)
    51d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    51d9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    51dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    51e0:	89 44 24 10          	mov    %eax,0x10(%esp)
    51e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    51e7:	89 44 24 14          	mov    %eax,0x14(%esp)
    51eb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    51ee:	8b 55 a8             	mov    -0x58(%ebp),%edx
    51f1:	89 04 24             	mov    %eax,(%esp)
    51f4:	89 54 24 04          	mov    %edx,0x4(%esp)
    51f8:	e8 d6 01 00 00       	call   53d3 <isIn>
    51fd:	85 c0                	test   %eax,%eax
    51ff:	0f 85 9a 00 00 00    	jne    529f <set_icon_alpha+0x1e1>
    5205:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5208:	89 44 24 08          	mov    %eax,0x8(%esp)
    520c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    520f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5213:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5216:	89 44 24 10          	mov    %eax,0x10(%esp)
    521a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    521d:	89 44 24 14          	mov    %eax,0x14(%esp)
    5221:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5224:	8b 55 a8             	mov    -0x58(%ebp),%edx
    5227:	89 04 24             	mov    %eax,(%esp)
    522a:	89 54 24 04          	mov    %edx,0x4(%esp)
    522e:	e8 a0 01 00 00       	call   53d3 <isIn>
    5233:	85 c0                	test   %eax,%eax
    5235:	75 68                	jne    529f <set_icon_alpha+0x1e1>
    5237:	8b 45 bc             	mov    -0x44(%ebp),%eax
    523a:	89 44 24 08          	mov    %eax,0x8(%esp)
    523e:	8b 45 c0             	mov    -0x40(%ebp),%eax
    5241:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5245:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5248:	89 44 24 10          	mov    %eax,0x10(%esp)
    524c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    524f:	89 44 24 14          	mov    %eax,0x14(%esp)
    5253:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5256:	8b 55 a8             	mov    -0x58(%ebp),%edx
    5259:	89 04 24             	mov    %eax,(%esp)
    525c:	89 54 24 04          	mov    %edx,0x4(%esp)
    5260:	e8 6e 01 00 00       	call   53d3 <isIn>
    5265:	85 c0                	test   %eax,%eax
    5267:	75 36                	jne    529f <set_icon_alpha+0x1e1>
    5269:	8b 45 ac             	mov    -0x54(%ebp),%eax
    526c:	89 44 24 08          	mov    %eax,0x8(%esp)
    5270:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5273:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5277:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    527a:	89 44 24 10          	mov    %eax,0x10(%esp)
    527e:	8b 45 b8             	mov    -0x48(%ebp),%eax
    5281:	89 44 24 14          	mov    %eax,0x14(%esp)
    5285:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5288:	8b 55 a8             	mov    -0x58(%ebp),%edx
    528b:	89 04 24             	mov    %eax,(%esp)
    528e:	89 54 24 04          	mov    %edx,0x4(%esp)
    5292:	e8 3c 01 00 00       	call   53d3 <isIn>
    5297:	85 c0                	test   %eax,%eax
    5299:	0f 84 87 00 00 00    	je     5326 <set_icon_alpha+0x268>
				if (pic->data[j * pic->width + i].rgbBlue == 0xff
    529f:	8b 45 08             	mov    0x8(%ebp),%eax
    52a2:	8b 10                	mov    (%eax),%edx
    52a4:	8b 45 08             	mov    0x8(%ebp),%eax
    52a7:	8b 40 04             	mov    0x4(%eax),%eax
    52aa:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    52ae:	89 c1                	mov    %eax,%ecx
    52b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52b3:	01 c8                	add    %ecx,%eax
    52b5:	c1 e0 02             	shl    $0x2,%eax
    52b8:	01 d0                	add    %edx,%eax
    52ba:	0f b6 00             	movzbl (%eax),%eax
    52bd:	3c ff                	cmp    $0xff,%al
    52bf:	75 65                	jne    5326 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbGreen == 0xff
    52c1:	8b 45 08             	mov    0x8(%ebp),%eax
    52c4:	8b 10                	mov    (%eax),%edx
    52c6:	8b 45 08             	mov    0x8(%ebp),%eax
    52c9:	8b 40 04             	mov    0x4(%eax),%eax
    52cc:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    52d0:	89 c1                	mov    %eax,%ecx
    52d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52d5:	01 c8                	add    %ecx,%eax
    52d7:	c1 e0 02             	shl    $0x2,%eax
    52da:	01 d0                	add    %edx,%eax
    52dc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    52e0:	3c ff                	cmp    $0xff,%al
    52e2:	75 42                	jne    5326 <set_icon_alpha+0x268>
						&& pic->data[j * pic->width + i].rgbRed == 0xff) {
    52e4:	8b 45 08             	mov    0x8(%ebp),%eax
    52e7:	8b 10                	mov    (%eax),%edx
    52e9:	8b 45 08             	mov    0x8(%ebp),%eax
    52ec:	8b 40 04             	mov    0x4(%eax),%eax
    52ef:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    52f3:	89 c1                	mov    %eax,%ecx
    52f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    52f8:	01 c8                	add    %ecx,%eax
    52fa:	c1 e0 02             	shl    $0x2,%eax
    52fd:	01 d0                	add    %edx,%eax
    52ff:	0f b6 40 02          	movzbl 0x2(%eax),%eax
    5303:	3c ff                	cmp    $0xff,%al
    5305:	75 1f                	jne    5326 <set_icon_alpha+0x268>
					pic->data[j * pic->width + i].rgbReserved = 1;
    5307:	8b 45 08             	mov    0x8(%ebp),%eax
    530a:	8b 10                	mov    (%eax),%edx
    530c:	8b 45 08             	mov    0x8(%ebp),%eax
    530f:	8b 40 04             	mov    0x4(%eax),%eax
    5312:	0f af 45 f0          	imul   -0x10(%ebp),%eax
    5316:	89 c1                	mov    %eax,%ecx
    5318:	8b 45 f4             	mov    -0xc(%ebp),%eax
    531b:	01 c8                	add    %ecx,%eax
    531d:	c1 e0 02             	shl    $0x2,%eax
    5320:	01 d0                	add    %edx,%eax
    5322:	c6 40 03 01          	movb   $0x1,0x3(%eax)
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
		for (j = 0; j < pic->height; j++) {
    5326:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    532a:	8b 45 08             	mov    0x8(%ebp),%eax
    532d:	8b 40 08             	mov    0x8(%eax),%eax
    5330:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    5333:	0f 8f 7a fe ff ff    	jg     51b3 <set_icon_alpha+0xf5>
	Rect r2 = initRect(pic->width - W, 0, W, W);
	Rect r3 = initRect(pic->width - W, pic->height - W, W, W);
	Rect r4 = initRect(0, pic->height - W, W, W);
	Point p;
	int i, j;
	for (i = 0; i < pic->width; i++) {
    5339:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    533d:	8b 45 08             	mov    0x8(%ebp),%eax
    5340:	8b 40 04             	mov    0x4(%eax),%eax
    5343:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    5346:	0f 8f 5b fe ff ff    	jg     51a7 <set_icon_alpha+0xe9>
					pic->data[j * pic->width + i].rgbReserved = 1;
				}
			}
		}
	}
}
    534c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    534f:	c9                   	leave  
    5350:	c3                   	ret    

00005351 <initPoint>:
#include "message.h"
#include "types.h"
#include "user.h"
#include "finder.h"
Point initPoint(int x, int y)
{
    5351:	55                   	push   %ebp
    5352:	89 e5                	mov    %esp,%ebp
    5354:	83 ec 10             	sub    $0x10,%esp
	Point p;
	p.x = x;
    5357:	8b 45 0c             	mov    0xc(%ebp),%eax
    535a:	89 45 f8             	mov    %eax,-0x8(%ebp)
	p.y = y;
    535d:	8b 45 10             	mov    0x10(%ebp),%eax
    5360:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return p;
    5363:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5366:	8b 45 f8             	mov    -0x8(%ebp),%eax
    5369:	8b 55 fc             	mov    -0x4(%ebp),%edx
    536c:	89 01                	mov    %eax,(%ecx)
    536e:	89 51 04             	mov    %edx,0x4(%ecx)
}
    5371:	8b 45 08             	mov    0x8(%ebp),%eax
    5374:	c9                   	leave  
    5375:	c2 04 00             	ret    $0x4

00005378 <initRect>:

Rect initRect(int x, int y, int w, int h)
{
    5378:	55                   	push   %ebp
    5379:	89 e5                	mov    %esp,%ebp
    537b:	83 ec 24             	sub    $0x24,%esp
	Rect r;
	r.start = initPoint(x, y);
    537e:	8d 45 e8             	lea    -0x18(%ebp),%eax
    5381:	8b 55 10             	mov    0x10(%ebp),%edx
    5384:	89 54 24 08          	mov    %edx,0x8(%esp)
    5388:	8b 55 0c             	mov    0xc(%ebp),%edx
    538b:	89 54 24 04          	mov    %edx,0x4(%esp)
    538f:	89 04 24             	mov    %eax,(%esp)
    5392:	e8 ba ff ff ff       	call   5351 <initPoint>
    5397:	83 ec 04             	sub    $0x4,%esp
    539a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    539d:	8b 55 ec             	mov    -0x14(%ebp),%edx
    53a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    53a3:	89 55 f4             	mov    %edx,-0xc(%ebp)
	r.width = w;
    53a6:	8b 45 14             	mov    0x14(%ebp),%eax
    53a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
	r.height = h;
    53ac:	8b 45 18             	mov    0x18(%ebp),%eax
    53af:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return r;
    53b2:	8b 45 08             	mov    0x8(%ebp),%eax
    53b5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    53b8:	89 10                	mov    %edx,(%eax)
    53ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
    53bd:	89 50 04             	mov    %edx,0x4(%eax)
    53c0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    53c3:	89 50 08             	mov    %edx,0x8(%eax)
    53c6:	8b 55 fc             	mov    -0x4(%ebp),%edx
    53c9:	89 50 0c             	mov    %edx,0xc(%eax)
}
    53cc:	8b 45 08             	mov    0x8(%ebp),%eax
    53cf:	c9                   	leave  
    53d0:	c2 04 00             	ret    $0x4

000053d3 <isIn>:

int isIn(Point p, Rect r)
{
    53d3:	55                   	push   %ebp
    53d4:	89 e5                	mov    %esp,%ebp
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    53d6:	8b 55 08             	mov    0x8(%ebp),%edx
    53d9:	8b 45 10             	mov    0x10(%ebp),%eax
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    53dc:	39 c2                	cmp    %eax,%edx
    53de:	7c 2f                	jl     540f <isIn+0x3c>
	return r;
}

int isIn(Point p, Rect r)
{
	return (p.x >= r.start.x) && (p.x < r.start.x+r.width)
    53e0:	8b 45 08             	mov    0x8(%ebp),%eax
    53e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    53e6:	8b 55 18             	mov    0x18(%ebp),%edx
    53e9:	01 ca                	add    %ecx,%edx
    53eb:	39 d0                	cmp    %edx,%eax
    53ed:	7d 20                	jge    540f <isIn+0x3c>
			&& (p.y >= r.start.y) && (p.y < r.start.y+r.height);
    53ef:	8b 55 0c             	mov    0xc(%ebp),%edx
    53f2:	8b 45 14             	mov    0x14(%ebp),%eax
    53f5:	39 c2                	cmp    %eax,%edx
    53f7:	7c 16                	jl     540f <isIn+0x3c>
    53f9:	8b 45 0c             	mov    0xc(%ebp),%eax
    53fc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    53ff:	8b 55 1c             	mov    0x1c(%ebp),%edx
    5402:	01 ca                	add    %ecx,%edx
    5404:	39 d0                	cmp    %edx,%eax
    5406:	7d 07                	jge    540f <isIn+0x3c>
    5408:	b8 01 00 00 00       	mov    $0x1,%eax
    540d:	eb 05                	jmp    5414 <isIn+0x41>
    540f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5414:	5d                   	pop    %ebp
    5415:	c3                   	ret    

00005416 <initClickManager>:

ClickableManager initClickManager(struct Context c)
{
    5416:	55                   	push   %ebp
    5417:	89 e5                	mov    %esp,%ebp
    5419:	83 ec 20             	sub    $0x20,%esp
	ClickableManager cm;
	cm.left_click = 0;
    541c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	cm.double_click = 0;
    5423:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	cm.right_click = 0;
    542a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	cm.wndWidth = c.width;
    5431:	8b 45 10             	mov    0x10(%ebp),%eax
    5434:	89 45 f8             	mov    %eax,-0x8(%ebp)
	cm.wndHeight = c.height;
    5437:	8b 45 14             	mov    0x14(%ebp),%eax
    543a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return cm;
    543d:	8b 45 08             	mov    0x8(%ebp),%eax
    5440:	8b 55 ec             	mov    -0x14(%ebp),%edx
    5443:	89 10                	mov    %edx,(%eax)
    5445:	8b 55 f0             	mov    -0x10(%ebp),%edx
    5448:	89 50 04             	mov    %edx,0x4(%eax)
    544b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    544e:	89 50 08             	mov    %edx,0x8(%eax)
    5451:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5454:	89 50 0c             	mov    %edx,0xc(%eax)
    5457:	8b 55 fc             	mov    -0x4(%ebp),%edx
    545a:	89 50 10             	mov    %edx,0x10(%eax)
}
    545d:	8b 45 08             	mov    0x8(%ebp),%eax
    5460:	c9                   	leave  
    5461:	c2 04 00             	ret    $0x4

00005464 <createClickable>:

void createClickable(ClickableManager *c, Rect r, int MsgType, Handler h)
{
    5464:	55                   	push   %ebp
    5465:	89 e5                	mov    %esp,%ebp
    5467:	83 ec 28             	sub    $0x28,%esp
	switch (MsgType)
    546a:	8b 45 1c             	mov    0x1c(%ebp),%eax
    546d:	83 f8 03             	cmp    $0x3,%eax
    5470:	74 72                	je     54e4 <createClickable+0x80>
    5472:	83 f8 04             	cmp    $0x4,%eax
    5475:	74 0a                	je     5481 <createClickable+0x1d>
    5477:	83 f8 02             	cmp    $0x2,%eax
    547a:	74 38                	je     54b4 <createClickable+0x50>
    547c:	e9 96 00 00 00       	jmp    5517 <createClickable+0xb3>
	{
		case MSG_DOUBLECLICK:
			addClickable(&c->double_click, r, h);
    5481:	8b 45 08             	mov    0x8(%ebp),%eax
    5484:	8d 50 04             	lea    0x4(%eax),%edx
    5487:	8b 45 20             	mov    0x20(%ebp),%eax
    548a:	89 44 24 14          	mov    %eax,0x14(%esp)
    548e:	8b 45 0c             	mov    0xc(%ebp),%eax
    5491:	89 44 24 04          	mov    %eax,0x4(%esp)
    5495:	8b 45 10             	mov    0x10(%ebp),%eax
    5498:	89 44 24 08          	mov    %eax,0x8(%esp)
    549c:	8b 45 14             	mov    0x14(%ebp),%eax
    549f:	89 44 24 0c          	mov    %eax,0xc(%esp)
    54a3:	8b 45 18             	mov    0x18(%ebp),%eax
    54a6:	89 44 24 10          	mov    %eax,0x10(%esp)
    54aa:	89 14 24             	mov    %edx,(%esp)
    54ad:	e8 7c 00 00 00       	call   552e <addClickable>
	        break;
    54b2:	eb 78                	jmp    552c <createClickable+0xc8>
	    case MSG_LPRESS:
	    	addClickable(&c->left_click, r, h);
    54b4:	8b 45 08             	mov    0x8(%ebp),%eax
    54b7:	8b 55 20             	mov    0x20(%ebp),%edx
    54ba:	89 54 24 14          	mov    %edx,0x14(%esp)
    54be:	8b 55 0c             	mov    0xc(%ebp),%edx
    54c1:	89 54 24 04          	mov    %edx,0x4(%esp)
    54c5:	8b 55 10             	mov    0x10(%ebp),%edx
    54c8:	89 54 24 08          	mov    %edx,0x8(%esp)
    54cc:	8b 55 14             	mov    0x14(%ebp),%edx
    54cf:	89 54 24 0c          	mov    %edx,0xc(%esp)
    54d3:	8b 55 18             	mov    0x18(%ebp),%edx
    54d6:	89 54 24 10          	mov    %edx,0x10(%esp)
    54da:	89 04 24             	mov    %eax,(%esp)
    54dd:	e8 4c 00 00 00       	call   552e <addClickable>
	    	break;
    54e2:	eb 48                	jmp    552c <createClickable+0xc8>
	    case MSG_RPRESS:
	    	addClickable(&c->right_click, r, h);
    54e4:	8b 45 08             	mov    0x8(%ebp),%eax
    54e7:	8d 50 08             	lea    0x8(%eax),%edx
    54ea:	8b 45 20             	mov    0x20(%ebp),%eax
    54ed:	89 44 24 14          	mov    %eax,0x14(%esp)
    54f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    54f4:	89 44 24 04          	mov    %eax,0x4(%esp)
    54f8:	8b 45 10             	mov    0x10(%ebp),%eax
    54fb:	89 44 24 08          	mov    %eax,0x8(%esp)
    54ff:	8b 45 14             	mov    0x14(%ebp),%eax
    5502:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5506:	8b 45 18             	mov    0x18(%ebp),%eax
    5509:	89 44 24 10          	mov    %eax,0x10(%esp)
    550d:	89 14 24             	mov    %edx,(%esp)
    5510:	e8 19 00 00 00       	call   552e <addClickable>
	    	break;
    5515:	eb 15                	jmp    552c <createClickable+0xc8>
	    default:
	    	printf(0, "向clickable传递了非鼠标点击事件！");
    5517:	c7 44 24 04 08 cd 00 	movl   $0xcd08,0x4(%esp)
    551e:	00 
    551f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5526:	e8 8c 09 00 00       	call   5eb7 <printf>
	    	break;
    552b:	90                   	nop
	}
}
    552c:	c9                   	leave  
    552d:	c3                   	ret    

0000552e <addClickable>:

void addClickable(Clickable **head, Rect r, Handler h)
{
    552e:	55                   	push   %ebp
    552f:	89 e5                	mov    %esp,%ebp
    5531:	83 ec 28             	sub    $0x28,%esp
	//printf(0, "adding clickable\n");
	Clickable *c = (Clickable *)malloc(sizeof(Clickable));
    5534:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
    553b:	e8 63 0c 00 00       	call   61a3 <malloc>
    5540:	89 45 f4             	mov    %eax,-0xc(%ebp)
	c->area = r;
    5543:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5546:	8b 55 0c             	mov    0xc(%ebp),%edx
    5549:	89 10                	mov    %edx,(%eax)
    554b:	8b 55 10             	mov    0x10(%ebp),%edx
    554e:	89 50 04             	mov    %edx,0x4(%eax)
    5551:	8b 55 14             	mov    0x14(%ebp),%edx
    5554:	89 50 08             	mov    %edx,0x8(%eax)
    5557:	8b 55 18             	mov    0x18(%ebp),%edx
    555a:	89 50 0c             	mov    %edx,0xc(%eax)
	c->handler = h;
    555d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5560:	8b 55 1c             	mov    0x1c(%ebp),%edx
    5563:	89 50 10             	mov    %edx,0x10(%eax)
	c->next = *head;
    5566:	8b 45 08             	mov    0x8(%ebp),%eax
    5569:	8b 10                	mov    (%eax),%edx
    556b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    556e:	89 50 14             	mov    %edx,0x14(%eax)
	*head = c;
    5571:	8b 45 08             	mov    0x8(%ebp),%eax
    5574:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5577:	89 10                	mov    %edx,(%eax)
}
    5579:	c9                   	leave  
    557a:	c3                   	ret    

0000557b <deleteClickable>:

void deleteClickable(Clickable **head, Rect region)
{
    557b:	55                   	push   %ebp
    557c:	89 e5                	mov    %esp,%ebp
    557e:	83 ec 38             	sub    $0x38,%esp
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
    5581:	8b 45 08             	mov    0x8(%ebp),%eax
    5584:	8b 00                	mov    (%eax),%eax
    5586:	89 45 f0             	mov    %eax,-0x10(%ebp)
    5589:	8b 45 f0             	mov    -0x10(%ebp),%eax
    558c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    558f:	e9 bb 00 00 00       	jmp    564f <deleteClickable+0xd4>
	{
		if (isIn(cur->area.start, region))
    5594:	8b 45 0c             	mov    0xc(%ebp),%eax
    5597:	89 44 24 08          	mov    %eax,0x8(%esp)
    559b:	8b 45 10             	mov    0x10(%ebp),%eax
    559e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    55a2:	8b 45 14             	mov    0x14(%ebp),%eax
    55a5:	89 44 24 10          	mov    %eax,0x10(%esp)
    55a9:	8b 45 18             	mov    0x18(%ebp),%eax
    55ac:	89 44 24 14          	mov    %eax,0x14(%esp)
    55b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55b3:	8b 50 04             	mov    0x4(%eax),%edx
    55b6:	8b 00                	mov    (%eax),%eax
    55b8:	89 04 24             	mov    %eax,(%esp)
    55bb:	89 54 24 04          	mov    %edx,0x4(%esp)
    55bf:	e8 0f fe ff ff       	call   53d3 <isIn>
    55c4:	85 c0                	test   %eax,%eax
    55c6:	74 60                	je     5628 <deleteClickable+0xad>
		{
			//如果当前指针指向头部
			if (cur == *head)
    55c8:	8b 45 08             	mov    0x8(%ebp),%eax
    55cb:	8b 00                	mov    (%eax),%eax
    55cd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    55d0:	75 2e                	jne    5600 <deleteClickable+0x85>
			{
				//删除头节点
				temp = *head;
    55d2:	8b 45 08             	mov    0x8(%ebp),%eax
    55d5:	8b 00                	mov    (%eax),%eax
    55d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
				*head = cur->next;
    55da:	8b 45 f0             	mov    -0x10(%ebp),%eax
    55dd:	8b 50 14             	mov    0x14(%eax),%edx
    55e0:	8b 45 08             	mov    0x8(%ebp),%eax
    55e3:	89 10                	mov    %edx,(%eax)
				cur = prev = *head;
    55e5:	8b 45 08             	mov    0x8(%ebp),%eax
    55e8:	8b 00                	mov    (%eax),%eax
    55ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
    55ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    55f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    55f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    55f6:	89 04 24             	mov    %eax,(%esp)
    55f9:	e8 6c 0a 00 00       	call   606a <free>
    55fe:	eb 4f                	jmp    564f <deleteClickable+0xd4>
			}
			else
			{
				//删除当前节点
				prev->next = cur->next;
    5600:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5603:	8b 50 14             	mov    0x14(%eax),%edx
    5606:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5609:	89 50 14             	mov    %edx,0x14(%eax)
				temp = cur;
    560c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    560f:	89 45 ec             	mov    %eax,-0x14(%ebp)
				cur = cur->next;
    5612:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5615:	8b 40 14             	mov    0x14(%eax),%eax
    5618:	89 45 f0             	mov    %eax,-0x10(%ebp)
				free(temp);
    561b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    561e:	89 04 24             	mov    %eax,(%esp)
    5621:	e8 44 0a 00 00       	call   606a <free>
    5626:	eb 27                	jmp    564f <deleteClickable+0xd4>
			}
		}
		else
		{
			//如果当前节点是头节点，
			if (cur == *head)
    5628:	8b 45 08             	mov    0x8(%ebp),%eax
    562b:	8b 00                	mov    (%eax),%eax
    562d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    5630:	75 0b                	jne    563d <deleteClickable+0xc2>
			{
				cur = cur->next;
    5632:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5635:	8b 40 14             	mov    0x14(%eax),%eax
    5638:	89 45 f0             	mov    %eax,-0x10(%ebp)
    563b:	eb 12                	jmp    564f <deleteClickable+0xd4>
			}
			else
			{
				cur = cur->next;
    563d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5640:	8b 40 14             	mov    0x14(%eax),%eax
    5643:	89 45 f0             	mov    %eax,-0x10(%ebp)
				prev = prev->next;
    5646:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5649:	8b 40 14             	mov    0x14(%eax),%eax
    564c:	89 45 f4             	mov    %eax,-0xc(%ebp)

void deleteClickable(Clickable **head, Rect region)
{
	Clickable *prev, *cur, *temp;
	prev = cur = *head;
	while (cur != 0)
    564f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5653:	0f 85 3b ff ff ff    	jne    5594 <deleteClickable+0x19>
				cur = cur->next;
				prev = prev->next;
			}
		}
	}
}
    5659:	c9                   	leave  
    565a:	c3                   	ret    

0000565b <executeHandler>:

int executeHandler(Clickable *head, Point click)
{
    565b:	55                   	push   %ebp
    565c:	89 e5                	mov    %esp,%ebp
    565e:	83 ec 38             	sub    $0x38,%esp
	Clickable *cur = head;
    5661:	8b 45 08             	mov    0x8(%ebp),%eax
    5664:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (cur != 0)
    5667:	eb 6d                	jmp    56d6 <executeHandler+0x7b>
	{
		if (isIn(click, cur->area))
    5669:	8b 45 f4             	mov    -0xc(%ebp),%eax
    566c:	8b 10                	mov    (%eax),%edx
    566e:	89 54 24 08          	mov    %edx,0x8(%esp)
    5672:	8b 50 04             	mov    0x4(%eax),%edx
    5675:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5679:	8b 50 08             	mov    0x8(%eax),%edx
    567c:	89 54 24 10          	mov    %edx,0x10(%esp)
    5680:	8b 40 0c             	mov    0xc(%eax),%eax
    5683:	89 44 24 14          	mov    %eax,0x14(%esp)
    5687:	8b 45 0c             	mov    0xc(%ebp),%eax
    568a:	8b 55 10             	mov    0x10(%ebp),%edx
    568d:	89 04 24             	mov    %eax,(%esp)
    5690:	89 54 24 04          	mov    %edx,0x4(%esp)
    5694:	e8 3a fd ff ff       	call   53d3 <isIn>
    5699:	85 c0                	test   %eax,%eax
    569b:	74 30                	je     56cd <executeHandler+0x72>
		{
			renaming = 0;
    569d:	c7 05 b4 4c 01 00 00 	movl   $0x0,0x14cb4
    56a4:	00 00 00 
			isSearching = 0;
    56a7:	c7 05 40 42 01 00 00 	movl   $0x0,0x14240
    56ae:	00 00 00 
			cur->handler(click);
    56b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56b4:	8b 48 10             	mov    0x10(%eax),%ecx
    56b7:	8b 45 0c             	mov    0xc(%ebp),%eax
    56ba:	8b 55 10             	mov    0x10(%ebp),%edx
    56bd:	89 04 24             	mov    %eax,(%esp)
    56c0:	89 54 24 04          	mov    %edx,0x4(%esp)
    56c4:	ff d1                	call   *%ecx
			return 1;
    56c6:	b8 01 00 00 00       	mov    $0x1,%eax
    56cb:	eb 4d                	jmp    571a <executeHandler+0xbf>
		}
		cur = cur->next;
    56cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    56d0:	8b 40 14             	mov    0x14(%eax),%eax
    56d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
}

int executeHandler(Clickable *head, Point click)
{
	Clickable *cur = head;
	while (cur != 0)
    56d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    56da:	75 8d                	jne    5669 <executeHandler+0xe>
			cur->handler(click);
			return 1;
		}
		cur = cur->next;
	}
	isSearching = 0;
    56dc:	c7 05 40 42 01 00 00 	movl   $0x0,0x14240
    56e3:	00 00 00 
	if (renaming == 1){
    56e6:	a1 b4 4c 01 00       	mov    0x14cb4,%eax
    56eb:	83 f8 01             	cmp    $0x1,%eax
    56ee:	75 11                	jne    5701 <executeHandler+0xa6>
		renaming = 0;
    56f0:	c7 05 b4 4c 01 00 00 	movl   $0x0,0x14cb4
    56f7:	00 00 00 
		return 1;
    56fa:	b8 01 00 00 00       	mov    $0x1,%eax
    56ff:	eb 19                	jmp    571a <executeHandler+0xbf>
	}
	printf(0, "execute: none!\n");
    5701:	c7 44 24 04 36 cd 00 	movl   $0xcd36,0x4(%esp)
    5708:	00 
    5709:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5710:	e8 a2 07 00 00       	call   5eb7 <printf>
	return 0;
    5715:	b8 00 00 00 00       	mov    $0x0,%eax
}
    571a:	c9                   	leave  
    571b:	c3                   	ret    

0000571c <printClickable>:

void printClickable(Clickable *c)
{
    571c:	55                   	push   %ebp
    571d:	89 e5                	mov    %esp,%ebp
    571f:	53                   	push   %ebx
    5720:	83 ec 24             	sub    $0x24,%esp
	printf(0, "(%d, %d, %d, %d)\n", c->area.start.x, c->area.start.y, c->area.width, c->area.height);
    5723:	8b 45 08             	mov    0x8(%ebp),%eax
    5726:	8b 58 0c             	mov    0xc(%eax),%ebx
    5729:	8b 45 08             	mov    0x8(%ebp),%eax
    572c:	8b 48 08             	mov    0x8(%eax),%ecx
    572f:	8b 45 08             	mov    0x8(%ebp),%eax
    5732:	8b 50 04             	mov    0x4(%eax),%edx
    5735:	8b 45 08             	mov    0x8(%ebp),%eax
    5738:	8b 00                	mov    (%eax),%eax
    573a:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    573e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    5742:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5746:	89 44 24 08          	mov    %eax,0x8(%esp)
    574a:	c7 44 24 04 46 cd 00 	movl   $0xcd46,0x4(%esp)
    5751:	00 
    5752:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5759:	e8 59 07 00 00       	call   5eb7 <printf>
}
    575e:	83 c4 24             	add    $0x24,%esp
    5761:	5b                   	pop    %ebx
    5762:	5d                   	pop    %ebp
    5763:	c3                   	ret    

00005764 <printClickableList>:

void printClickableList(Clickable *head)
{
    5764:	55                   	push   %ebp
    5765:	89 e5                	mov    %esp,%ebp
    5767:	83 ec 28             	sub    $0x28,%esp
	Clickable *cur = head;
    576a:	8b 45 08             	mov    0x8(%ebp),%eax
    576d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	printf(0, "Clickable List:\n");
    5770:	c7 44 24 04 58 cd 00 	movl   $0xcd58,0x4(%esp)
    5777:	00 
    5778:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    577f:	e8 33 07 00 00       	call   5eb7 <printf>
	while(cur != 0)
    5784:	eb 14                	jmp    579a <printClickableList+0x36>
	{
		printClickable(cur);
    5786:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5789:	89 04 24             	mov    %eax,(%esp)
    578c:	e8 8b ff ff ff       	call   571c <printClickable>
		cur = cur->next;
    5791:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5794:	8b 40 14             	mov    0x14(%eax),%eax
    5797:	89 45 f4             	mov    %eax,-0xc(%ebp)

void printClickableList(Clickable *head)
{
	Clickable *cur = head;
	printf(0, "Clickable List:\n");
	while(cur != 0)
    579a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    579e:	75 e6                	jne    5786 <printClickableList+0x22>
	{
		printClickable(cur);
		cur = cur->next;
	}
	printf(0, "\n");
    57a0:	c7 44 24 04 69 cd 00 	movl   $0xcd69,0x4(%esp)
    57a7:	00 
    57a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    57af:	e8 03 07 00 00       	call   5eb7 <printf>
}
    57b4:	c9                   	leave  
    57b5:	c3                   	ret    

000057b6 <testHanler>:

void testHanler(struct Point p)
{
    57b6:	55                   	push   %ebp
    57b7:	89 e5                	mov    %esp,%ebp
    57b9:	83 ec 18             	sub    $0x18,%esp
	printf(0, "execute: (%d, %d)!\n", p.x, p.y);
    57bc:	8b 55 0c             	mov    0xc(%ebp),%edx
    57bf:	8b 45 08             	mov    0x8(%ebp),%eax
    57c2:	89 54 24 0c          	mov    %edx,0xc(%esp)
    57c6:	89 44 24 08          	mov    %eax,0x8(%esp)
    57ca:	c7 44 24 04 6b cd 00 	movl   $0xcd6b,0x4(%esp)
    57d1:	00 
    57d2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    57d9:	e8 d9 06 00 00       	call   5eb7 <printf>
}
    57de:	c9                   	leave  
    57df:	c3                   	ret    

000057e0 <testClickable>:
void testClickable(struct Context c)
{
    57e0:	55                   	push   %ebp
    57e1:	89 e5                	mov    %esp,%ebp
    57e3:	81 ec 98 00 00 00    	sub    $0x98,%esp
	ClickableManager cm = initClickManager(c);
    57e9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    57ec:	8b 55 08             	mov    0x8(%ebp),%edx
    57ef:	89 54 24 04          	mov    %edx,0x4(%esp)
    57f3:	8b 55 0c             	mov    0xc(%ebp),%edx
    57f6:	89 54 24 08          	mov    %edx,0x8(%esp)
    57fa:	8b 55 10             	mov    0x10(%ebp),%edx
    57fd:	89 54 24 0c          	mov    %edx,0xc(%esp)
    5801:	89 04 24             	mov    %eax,(%esp)
    5804:	e8 0d fc ff ff       	call   5416 <initClickManager>
    5809:	83 ec 04             	sub    $0x4,%esp

	Rect r1 = initRect(5,5,20,20);
    580c:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    580f:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    5816:	00 
    5817:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    581e:	00 
    581f:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    5826:	00 
    5827:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    582e:	00 
    582f:	89 04 24             	mov    %eax,(%esp)
    5832:	e8 41 fb ff ff       	call   5378 <initRect>
    5837:	83 ec 04             	sub    $0x4,%esp
	Rect r2 = initRect(20,20,20,20);
    583a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    583d:	c7 44 24 10 14 00 00 	movl   $0x14,0x10(%esp)
    5844:	00 
    5845:	c7 44 24 0c 14 00 00 	movl   $0x14,0xc(%esp)
    584c:	00 
    584d:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
    5854:	00 
    5855:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
    585c:	00 
    585d:	89 04 24             	mov    %eax,(%esp)
    5860:	e8 13 fb ff ff       	call   5378 <initRect>
    5865:	83 ec 04             	sub    $0x4,%esp
	Rect r3 = initRect(50,50,15,15);
    5868:	8d 45 b4             	lea    -0x4c(%ebp),%eax
    586b:	c7 44 24 10 0f 00 00 	movl   $0xf,0x10(%esp)
    5872:	00 
    5873:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%esp)
    587a:	00 
    587b:	c7 44 24 08 32 00 00 	movl   $0x32,0x8(%esp)
    5882:	00 
    5883:	c7 44 24 04 32 00 00 	movl   $0x32,0x4(%esp)
    588a:	00 
    588b:	89 04 24             	mov    %eax,(%esp)
    588e:	e8 e5 fa ff ff       	call   5378 <initRect>
    5893:	83 ec 04             	sub    $0x4,%esp
	Rect r4 = initRect(0,0,30,30);
    5896:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    5899:	c7 44 24 10 1e 00 00 	movl   $0x1e,0x10(%esp)
    58a0:	00 
    58a1:	c7 44 24 0c 1e 00 00 	movl   $0x1e,0xc(%esp)
    58a8:	00 
    58a9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    58b0:	00 
    58b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    58b8:	00 
    58b9:	89 04 24             	mov    %eax,(%esp)
    58bc:	e8 b7 fa ff ff       	call   5378 <initRect>
    58c1:	83 ec 04             	sub    $0x4,%esp
	Point p1 = initPoint(23, 23);
    58c4:	8d 45 9c             	lea    -0x64(%ebp),%eax
    58c7:	c7 44 24 08 17 00 00 	movl   $0x17,0x8(%esp)
    58ce:	00 
    58cf:	c7 44 24 04 17 00 00 	movl   $0x17,0x4(%esp)
    58d6:	00 
    58d7:	89 04 24             	mov    %eax,(%esp)
    58da:	e8 72 fa ff ff       	call   5351 <initPoint>
    58df:	83 ec 04             	sub    $0x4,%esp
	Point p2 = initPoint(70, 70);
    58e2:	8d 45 94             	lea    -0x6c(%ebp),%eax
    58e5:	c7 44 24 08 46 00 00 	movl   $0x46,0x8(%esp)
    58ec:	00 
    58ed:	c7 44 24 04 46 00 00 	movl   $0x46,0x4(%esp)
    58f4:	00 
    58f5:	89 04 24             	mov    %eax,(%esp)
    58f8:	e8 54 fa ff ff       	call   5351 <initPoint>
    58fd:	83 ec 04             	sub    $0x4,%esp
	createClickable(&cm, r1, MSG_LPRESS, &testHanler);
    5900:	c7 44 24 18 b6 57 00 	movl   $0x57b6,0x18(%esp)
    5907:	00 
    5908:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    590f:	00 
    5910:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    5913:	89 44 24 04          	mov    %eax,0x4(%esp)
    5917:	8b 45 d8             	mov    -0x28(%ebp),%eax
    591a:	89 44 24 08          	mov    %eax,0x8(%esp)
    591e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    5921:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5925:	8b 45 e0             	mov    -0x20(%ebp),%eax
    5928:	89 44 24 10          	mov    %eax,0x10(%esp)
    592c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    592f:	89 04 24             	mov    %eax,(%esp)
    5932:	e8 2d fb ff ff       	call   5464 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    5937:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    593a:	89 44 24 08          	mov    %eax,0x8(%esp)
    593e:	c7 44 24 04 7f cd 00 	movl   $0xcd7f,0x4(%esp)
    5945:	00 
    5946:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    594d:	e8 65 05 00 00       	call   5eb7 <printf>
	createClickable(&cm, r2, MSG_LPRESS, &testHanler);
    5952:	c7 44 24 18 b6 57 00 	movl   $0x57b6,0x18(%esp)
    5959:	00 
    595a:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    5961:	00 
    5962:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    5965:	89 44 24 04          	mov    %eax,0x4(%esp)
    5969:	8b 45 c8             	mov    -0x38(%ebp),%eax
    596c:	89 44 24 08          	mov    %eax,0x8(%esp)
    5970:	8b 45 cc             	mov    -0x34(%ebp),%eax
    5973:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5977:	8b 45 d0             	mov    -0x30(%ebp),%eax
    597a:	89 44 24 10          	mov    %eax,0x10(%esp)
    597e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    5981:	89 04 24             	mov    %eax,(%esp)
    5984:	e8 db fa ff ff       	call   5464 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    5989:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    598c:	89 44 24 08          	mov    %eax,0x8(%esp)
    5990:	c7 44 24 04 7f cd 00 	movl   $0xcd7f,0x4(%esp)
    5997:	00 
    5998:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    599f:	e8 13 05 00 00       	call   5eb7 <printf>
	createClickable(&cm, r3, MSG_LPRESS, &testHanler);
    59a4:	c7 44 24 18 b6 57 00 	movl   $0x57b6,0x18(%esp)
    59ab:	00 
    59ac:	c7 44 24 14 02 00 00 	movl   $0x2,0x14(%esp)
    59b3:	00 
    59b4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    59b7:	89 44 24 04          	mov    %eax,0x4(%esp)
    59bb:	8b 45 b8             	mov    -0x48(%ebp),%eax
    59be:	89 44 24 08          	mov    %eax,0x8(%esp)
    59c2:	8b 45 bc             	mov    -0x44(%ebp),%eax
    59c5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    59c9:	8b 45 c0             	mov    -0x40(%ebp),%eax
    59cc:	89 44 24 10          	mov    %eax,0x10(%esp)
    59d0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    59d3:	89 04 24             	mov    %eax,(%esp)
    59d6:	e8 89 fa ff ff       	call   5464 <createClickable>
	printf(0, "left_click: %d\n", cm.left_click);
    59db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    59de:	89 44 24 08          	mov    %eax,0x8(%esp)
    59e2:	c7 44 24 04 7f cd 00 	movl   $0xcd7f,0x4(%esp)
    59e9:	00 
    59ea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    59f1:	e8 c1 04 00 00       	call   5eb7 <printf>
	printClickableList(cm.left_click);
    59f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    59f9:	89 04 24             	mov    %eax,(%esp)
    59fc:	e8 63 fd ff ff       	call   5764 <printClickableList>
	executeHandler(cm.left_click, p1);
    5a01:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5a04:	8b 45 9c             	mov    -0x64(%ebp),%eax
    5a07:	8b 55 a0             	mov    -0x60(%ebp),%edx
    5a0a:	89 44 24 04          	mov    %eax,0x4(%esp)
    5a0e:	89 54 24 08          	mov    %edx,0x8(%esp)
    5a12:	89 0c 24             	mov    %ecx,(%esp)
    5a15:	e8 41 fc ff ff       	call   565b <executeHandler>
	executeHandler(cm.left_click, p2);
    5a1a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    5a1d:	8b 45 94             	mov    -0x6c(%ebp),%eax
    5a20:	8b 55 98             	mov    -0x68(%ebp),%edx
    5a23:	89 44 24 04          	mov    %eax,0x4(%esp)
    5a27:	89 54 24 08          	mov    %edx,0x8(%esp)
    5a2b:	89 0c 24             	mov    %ecx,(%esp)
    5a2e:	e8 28 fc ff ff       	call   565b <executeHandler>
	deleteClickable(&cm.left_click, r4);
    5a33:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    5a36:	89 44 24 04          	mov    %eax,0x4(%esp)
    5a3a:	8b 45 a8             	mov    -0x58(%ebp),%eax
    5a3d:	89 44 24 08          	mov    %eax,0x8(%esp)
    5a41:	8b 45 ac             	mov    -0x54(%ebp),%eax
    5a44:	89 44 24 0c          	mov    %eax,0xc(%esp)
    5a48:	8b 45 b0             	mov    -0x50(%ebp),%eax
    5a4b:	89 44 24 10          	mov    %eax,0x10(%esp)
    5a4f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    5a52:	89 04 24             	mov    %eax,(%esp)
    5a55:	e8 21 fb ff ff       	call   557b <deleteClickable>
	printClickableList(cm.left_click);
    5a5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5a5d:	89 04 24             	mov    %eax,(%esp)
    5a60:	e8 ff fc ff ff       	call   5764 <printClickableList>
}
    5a65:	c9                   	leave  
    5a66:	c3                   	ret    

00005a67 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    5a67:	55                   	push   %ebp
    5a68:	89 e5                	mov    %esp,%ebp
    5a6a:	57                   	push   %edi
    5a6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    5a6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    5a6f:	8b 55 10             	mov    0x10(%ebp),%edx
    5a72:	8b 45 0c             	mov    0xc(%ebp),%eax
    5a75:	89 cb                	mov    %ecx,%ebx
    5a77:	89 df                	mov    %ebx,%edi
    5a79:	89 d1                	mov    %edx,%ecx
    5a7b:	fc                   	cld    
    5a7c:	f3 aa                	rep stos %al,%es:(%edi)
    5a7e:	89 ca                	mov    %ecx,%edx
    5a80:	89 fb                	mov    %edi,%ebx
    5a82:	89 5d 08             	mov    %ebx,0x8(%ebp)
    5a85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    5a88:	5b                   	pop    %ebx
    5a89:	5f                   	pop    %edi
    5a8a:	5d                   	pop    %ebp
    5a8b:	c3                   	ret    

00005a8c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    5a8c:	55                   	push   %ebp
    5a8d:	89 e5                	mov    %esp,%ebp
    5a8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    5a92:	8b 45 08             	mov    0x8(%ebp),%eax
    5a95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    5a98:	90                   	nop
    5a99:	8b 45 08             	mov    0x8(%ebp),%eax
    5a9c:	8d 50 01             	lea    0x1(%eax),%edx
    5a9f:	89 55 08             	mov    %edx,0x8(%ebp)
    5aa2:	8b 55 0c             	mov    0xc(%ebp),%edx
    5aa5:	8d 4a 01             	lea    0x1(%edx),%ecx
    5aa8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    5aab:	0f b6 12             	movzbl (%edx),%edx
    5aae:	88 10                	mov    %dl,(%eax)
    5ab0:	0f b6 00             	movzbl (%eax),%eax
    5ab3:	84 c0                	test   %al,%al
    5ab5:	75 e2                	jne    5a99 <strcpy+0xd>
    ;
  return os;
    5ab7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5aba:	c9                   	leave  
    5abb:	c3                   	ret    

00005abc <strcmp>:

int
strcmp(const char *p, const char *q)
{
    5abc:	55                   	push   %ebp
    5abd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    5abf:	eb 08                	jmp    5ac9 <strcmp+0xd>
    p++, q++;
    5ac1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    5ac5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    5ac9:	8b 45 08             	mov    0x8(%ebp),%eax
    5acc:	0f b6 00             	movzbl (%eax),%eax
    5acf:	84 c0                	test   %al,%al
    5ad1:	74 10                	je     5ae3 <strcmp+0x27>
    5ad3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ad6:	0f b6 10             	movzbl (%eax),%edx
    5ad9:	8b 45 0c             	mov    0xc(%ebp),%eax
    5adc:	0f b6 00             	movzbl (%eax),%eax
    5adf:	38 c2                	cmp    %al,%dl
    5ae1:	74 de                	je     5ac1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    5ae3:	8b 45 08             	mov    0x8(%ebp),%eax
    5ae6:	0f b6 00             	movzbl (%eax),%eax
    5ae9:	0f b6 d0             	movzbl %al,%edx
    5aec:	8b 45 0c             	mov    0xc(%ebp),%eax
    5aef:	0f b6 00             	movzbl (%eax),%eax
    5af2:	0f b6 c0             	movzbl %al,%eax
    5af5:	29 c2                	sub    %eax,%edx
    5af7:	89 d0                	mov    %edx,%eax
}
    5af9:	5d                   	pop    %ebp
    5afa:	c3                   	ret    

00005afb <strlen>:

uint
strlen(char *s)
{
    5afb:	55                   	push   %ebp
    5afc:	89 e5                	mov    %esp,%ebp
    5afe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    5b01:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    5b08:	eb 04                	jmp    5b0e <strlen+0x13>
    5b0a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    5b0e:	8b 55 fc             	mov    -0x4(%ebp),%edx
    5b11:	8b 45 08             	mov    0x8(%ebp),%eax
    5b14:	01 d0                	add    %edx,%eax
    5b16:	0f b6 00             	movzbl (%eax),%eax
    5b19:	84 c0                	test   %al,%al
    5b1b:	75 ed                	jne    5b0a <strlen+0xf>
    ;
  return n;
    5b1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5b20:	c9                   	leave  
    5b21:	c3                   	ret    

00005b22 <memset>:

void*
memset(void *dst, int c, uint n)
{
    5b22:	55                   	push   %ebp
    5b23:	89 e5                	mov    %esp,%ebp
    5b25:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    5b28:	8b 45 10             	mov    0x10(%ebp),%eax
    5b2b:	89 44 24 08          	mov    %eax,0x8(%esp)
    5b2f:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b32:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b36:	8b 45 08             	mov    0x8(%ebp),%eax
    5b39:	89 04 24             	mov    %eax,(%esp)
    5b3c:	e8 26 ff ff ff       	call   5a67 <stosb>
  return dst;
    5b41:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5b44:	c9                   	leave  
    5b45:	c3                   	ret    

00005b46 <strchr>:

char*
strchr(const char *s, char c)
{
    5b46:	55                   	push   %ebp
    5b47:	89 e5                	mov    %esp,%ebp
    5b49:	83 ec 04             	sub    $0x4,%esp
    5b4c:	8b 45 0c             	mov    0xc(%ebp),%eax
    5b4f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    5b52:	eb 14                	jmp    5b68 <strchr+0x22>
    if(*s == c)
    5b54:	8b 45 08             	mov    0x8(%ebp),%eax
    5b57:	0f b6 00             	movzbl (%eax),%eax
    5b5a:	3a 45 fc             	cmp    -0x4(%ebp),%al
    5b5d:	75 05                	jne    5b64 <strchr+0x1e>
      return (char*)s;
    5b5f:	8b 45 08             	mov    0x8(%ebp),%eax
    5b62:	eb 13                	jmp    5b77 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    5b64:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    5b68:	8b 45 08             	mov    0x8(%ebp),%eax
    5b6b:	0f b6 00             	movzbl (%eax),%eax
    5b6e:	84 c0                	test   %al,%al
    5b70:	75 e2                	jne    5b54 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    5b72:	b8 00 00 00 00       	mov    $0x0,%eax
}
    5b77:	c9                   	leave  
    5b78:	c3                   	ret    

00005b79 <gets>:

char*
gets(char *buf, int max)
{
    5b79:	55                   	push   %ebp
    5b7a:	89 e5                	mov    %esp,%ebp
    5b7c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    5b7f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    5b86:	eb 4c                	jmp    5bd4 <gets+0x5b>
    cc = read(0, &c, 1);
    5b88:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5b8f:	00 
    5b90:	8d 45 ef             	lea    -0x11(%ebp),%eax
    5b93:	89 44 24 04          	mov    %eax,0x4(%esp)
    5b97:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    5b9e:	e8 44 01 00 00       	call   5ce7 <read>
    5ba3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    5ba6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5baa:	7f 02                	jg     5bae <gets+0x35>
      break;
    5bac:	eb 31                	jmp    5bdf <gets+0x66>
    buf[i++] = c;
    5bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bb1:	8d 50 01             	lea    0x1(%eax),%edx
    5bb4:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5bb7:	89 c2                	mov    %eax,%edx
    5bb9:	8b 45 08             	mov    0x8(%ebp),%eax
    5bbc:	01 c2                	add    %eax,%edx
    5bbe:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    5bc2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    5bc4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    5bc8:	3c 0a                	cmp    $0xa,%al
    5bca:	74 13                	je     5bdf <gets+0x66>
    5bcc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    5bd0:	3c 0d                	cmp    $0xd,%al
    5bd2:	74 0b                	je     5bdf <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    5bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5bd7:	83 c0 01             	add    $0x1,%eax
    5bda:	3b 45 0c             	cmp    0xc(%ebp),%eax
    5bdd:	7c a9                	jl     5b88 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    5bdf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    5be2:	8b 45 08             	mov    0x8(%ebp),%eax
    5be5:	01 d0                	add    %edx,%eax
    5be7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    5bea:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5bed:	c9                   	leave  
    5bee:	c3                   	ret    

00005bef <stat>:

int
stat(char *n, struct stat *st)
{
    5bef:	55                   	push   %ebp
    5bf0:	89 e5                	mov    %esp,%ebp
    5bf2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    5bf5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    5bfc:	00 
    5bfd:	8b 45 08             	mov    0x8(%ebp),%eax
    5c00:	89 04 24             	mov    %eax,(%esp)
    5c03:	e8 07 01 00 00       	call   5d0f <open>
    5c08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    5c0b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5c0f:	79 07                	jns    5c18 <stat+0x29>
    return -1;
    5c11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    5c16:	eb 23                	jmp    5c3b <stat+0x4c>
  r = fstat(fd, st);
    5c18:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c1b:	89 44 24 04          	mov    %eax,0x4(%esp)
    5c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c22:	89 04 24             	mov    %eax,(%esp)
    5c25:	e8 fd 00 00 00       	call   5d27 <fstat>
    5c2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    5c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5c30:	89 04 24             	mov    %eax,(%esp)
    5c33:	e8 bf 00 00 00       	call   5cf7 <close>
  return r;
    5c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    5c3b:	c9                   	leave  
    5c3c:	c3                   	ret    

00005c3d <atoi>:

int
atoi(const char *s)
{
    5c3d:	55                   	push   %ebp
    5c3e:	89 e5                	mov    %esp,%ebp
    5c40:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    5c43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    5c4a:	eb 25                	jmp    5c71 <atoi+0x34>
    n = n*10 + *s++ - '0';
    5c4c:	8b 55 fc             	mov    -0x4(%ebp),%edx
    5c4f:	89 d0                	mov    %edx,%eax
    5c51:	c1 e0 02             	shl    $0x2,%eax
    5c54:	01 d0                	add    %edx,%eax
    5c56:	01 c0                	add    %eax,%eax
    5c58:	89 c1                	mov    %eax,%ecx
    5c5a:	8b 45 08             	mov    0x8(%ebp),%eax
    5c5d:	8d 50 01             	lea    0x1(%eax),%edx
    5c60:	89 55 08             	mov    %edx,0x8(%ebp)
    5c63:	0f b6 00             	movzbl (%eax),%eax
    5c66:	0f be c0             	movsbl %al,%eax
    5c69:	01 c8                	add    %ecx,%eax
    5c6b:	83 e8 30             	sub    $0x30,%eax
    5c6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    5c71:	8b 45 08             	mov    0x8(%ebp),%eax
    5c74:	0f b6 00             	movzbl (%eax),%eax
    5c77:	3c 2f                	cmp    $0x2f,%al
    5c79:	7e 0a                	jle    5c85 <atoi+0x48>
    5c7b:	8b 45 08             	mov    0x8(%ebp),%eax
    5c7e:	0f b6 00             	movzbl (%eax),%eax
    5c81:	3c 39                	cmp    $0x39,%al
    5c83:	7e c7                	jle    5c4c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    5c85:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    5c88:	c9                   	leave  
    5c89:	c3                   	ret    

00005c8a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    5c8a:	55                   	push   %ebp
    5c8b:	89 e5                	mov    %esp,%ebp
    5c8d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    5c90:	8b 45 08             	mov    0x8(%ebp),%eax
    5c93:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    5c96:	8b 45 0c             	mov    0xc(%ebp),%eax
    5c99:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    5c9c:	eb 17                	jmp    5cb5 <memmove+0x2b>
    *dst++ = *src++;
    5c9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    5ca1:	8d 50 01             	lea    0x1(%eax),%edx
    5ca4:	89 55 fc             	mov    %edx,-0x4(%ebp)
    5ca7:	8b 55 f8             	mov    -0x8(%ebp),%edx
    5caa:	8d 4a 01             	lea    0x1(%edx),%ecx
    5cad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    5cb0:	0f b6 12             	movzbl (%edx),%edx
    5cb3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    5cb5:	8b 45 10             	mov    0x10(%ebp),%eax
    5cb8:	8d 50 ff             	lea    -0x1(%eax),%edx
    5cbb:	89 55 10             	mov    %edx,0x10(%ebp)
    5cbe:	85 c0                	test   %eax,%eax
    5cc0:	7f dc                	jg     5c9e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    5cc2:	8b 45 08             	mov    0x8(%ebp),%eax
}
    5cc5:	c9                   	leave  
    5cc6:	c3                   	ret    

00005cc7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    5cc7:	b8 01 00 00 00       	mov    $0x1,%eax
    5ccc:	cd 40                	int    $0x40
    5cce:	c3                   	ret    

00005ccf <exit>:
SYSCALL(exit)
    5ccf:	b8 02 00 00 00       	mov    $0x2,%eax
    5cd4:	cd 40                	int    $0x40
    5cd6:	c3                   	ret    

00005cd7 <wait>:
SYSCALL(wait)
    5cd7:	b8 03 00 00 00       	mov    $0x3,%eax
    5cdc:	cd 40                	int    $0x40
    5cde:	c3                   	ret    

00005cdf <pipe>:
SYSCALL(pipe)
    5cdf:	b8 04 00 00 00       	mov    $0x4,%eax
    5ce4:	cd 40                	int    $0x40
    5ce6:	c3                   	ret    

00005ce7 <read>:
SYSCALL(read)
    5ce7:	b8 05 00 00 00       	mov    $0x5,%eax
    5cec:	cd 40                	int    $0x40
    5cee:	c3                   	ret    

00005cef <write>:
SYSCALL(write)
    5cef:	b8 10 00 00 00       	mov    $0x10,%eax
    5cf4:	cd 40                	int    $0x40
    5cf6:	c3                   	ret    

00005cf7 <close>:
SYSCALL(close)
    5cf7:	b8 15 00 00 00       	mov    $0x15,%eax
    5cfc:	cd 40                	int    $0x40
    5cfe:	c3                   	ret    

00005cff <kill>:
SYSCALL(kill)
    5cff:	b8 06 00 00 00       	mov    $0x6,%eax
    5d04:	cd 40                	int    $0x40
    5d06:	c3                   	ret    

00005d07 <exec>:
SYSCALL(exec)
    5d07:	b8 07 00 00 00       	mov    $0x7,%eax
    5d0c:	cd 40                	int    $0x40
    5d0e:	c3                   	ret    

00005d0f <open>:
SYSCALL(open)
    5d0f:	b8 0f 00 00 00       	mov    $0xf,%eax
    5d14:	cd 40                	int    $0x40
    5d16:	c3                   	ret    

00005d17 <mknod>:
SYSCALL(mknod)
    5d17:	b8 11 00 00 00       	mov    $0x11,%eax
    5d1c:	cd 40                	int    $0x40
    5d1e:	c3                   	ret    

00005d1f <unlink>:
SYSCALL(unlink)
    5d1f:	b8 12 00 00 00       	mov    $0x12,%eax
    5d24:	cd 40                	int    $0x40
    5d26:	c3                   	ret    

00005d27 <fstat>:
SYSCALL(fstat)
    5d27:	b8 08 00 00 00       	mov    $0x8,%eax
    5d2c:	cd 40                	int    $0x40
    5d2e:	c3                   	ret    

00005d2f <link>:
SYSCALL(link)
    5d2f:	b8 13 00 00 00       	mov    $0x13,%eax
    5d34:	cd 40                	int    $0x40
    5d36:	c3                   	ret    

00005d37 <mkdir>:
SYSCALL(mkdir)
    5d37:	b8 14 00 00 00       	mov    $0x14,%eax
    5d3c:	cd 40                	int    $0x40
    5d3e:	c3                   	ret    

00005d3f <chdir>:
SYSCALL(chdir)
    5d3f:	b8 09 00 00 00       	mov    $0x9,%eax
    5d44:	cd 40                	int    $0x40
    5d46:	c3                   	ret    

00005d47 <dup>:
SYSCALL(dup)
    5d47:	b8 0a 00 00 00       	mov    $0xa,%eax
    5d4c:	cd 40                	int    $0x40
    5d4e:	c3                   	ret    

00005d4f <getpid>:
SYSCALL(getpid)
    5d4f:	b8 0b 00 00 00       	mov    $0xb,%eax
    5d54:	cd 40                	int    $0x40
    5d56:	c3                   	ret    

00005d57 <sbrk>:
SYSCALL(sbrk)
    5d57:	b8 0c 00 00 00       	mov    $0xc,%eax
    5d5c:	cd 40                	int    $0x40
    5d5e:	c3                   	ret    

00005d5f <sleep>:
SYSCALL(sleep)
    5d5f:	b8 0d 00 00 00       	mov    $0xd,%eax
    5d64:	cd 40                	int    $0x40
    5d66:	c3                   	ret    

00005d67 <uptime>:
SYSCALL(uptime)
    5d67:	b8 0e 00 00 00       	mov    $0xe,%eax
    5d6c:	cd 40                	int    $0x40
    5d6e:	c3                   	ret    

00005d6f <getMsg>:
SYSCALL(getMsg)
    5d6f:	b8 16 00 00 00       	mov    $0x16,%eax
    5d74:	cd 40                	int    $0x40
    5d76:	c3                   	ret    

00005d77 <createWindow>:
SYSCALL(createWindow)
    5d77:	b8 17 00 00 00       	mov    $0x17,%eax
    5d7c:	cd 40                	int    $0x40
    5d7e:	c3                   	ret    

00005d7f <destroyWindow>:
SYSCALL(destroyWindow)
    5d7f:	b8 18 00 00 00       	mov    $0x18,%eax
    5d84:	cd 40                	int    $0x40
    5d86:	c3                   	ret    

00005d87 <updateWindow>:
SYSCALL(updateWindow)
    5d87:	b8 19 00 00 00       	mov    $0x19,%eax
    5d8c:	cd 40                	int    $0x40
    5d8e:	c3                   	ret    

00005d8f <updatePartialWindow>:
SYSCALL(updatePartialWindow)
    5d8f:	b8 1a 00 00 00       	mov    $0x1a,%eax
    5d94:	cd 40                	int    $0x40
    5d96:	c3                   	ret    

00005d97 <kwrite>:
SYSCALL(kwrite)
    5d97:	b8 1c 00 00 00       	mov    $0x1c,%eax
    5d9c:	cd 40                	int    $0x40
    5d9e:	c3                   	ret    

00005d9f <setSampleRate>:
SYSCALL(setSampleRate)
    5d9f:	b8 1b 00 00 00       	mov    $0x1b,%eax
    5da4:	cd 40                	int    $0x40
    5da6:	c3                   	ret    

00005da7 <pause>:
SYSCALL(pause)
    5da7:	b8 1d 00 00 00       	mov    $0x1d,%eax
    5dac:	cd 40                	int    $0x40
    5dae:	c3                   	ret    

00005daf <wavdecode>:
SYSCALL(wavdecode)
    5daf:	b8 1e 00 00 00       	mov    $0x1e,%eax
    5db4:	cd 40                	int    $0x40
    5db6:	c3                   	ret    

00005db7 <beginDecode>:
SYSCALL(beginDecode)
    5db7:	b8 1f 00 00 00       	mov    $0x1f,%eax
    5dbc:	cd 40                	int    $0x40
    5dbe:	c3                   	ret    

00005dbf <waitForDecode>:
SYSCALL(waitForDecode)
    5dbf:	b8 20 00 00 00       	mov    $0x20,%eax
    5dc4:	cd 40                	int    $0x40
    5dc6:	c3                   	ret    

00005dc7 <endDecode>:
SYSCALL(endDecode)
    5dc7:	b8 21 00 00 00       	mov    $0x21,%eax
    5dcc:	cd 40                	int    $0x40
    5dce:	c3                   	ret    

00005dcf <getCoreBuf>:
    5dcf:	b8 22 00 00 00       	mov    $0x22,%eax
    5dd4:	cd 40                	int    $0x40
    5dd6:	c3                   	ret    

00005dd7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    5dd7:	55                   	push   %ebp
    5dd8:	89 e5                	mov    %esp,%ebp
    5dda:	83 ec 18             	sub    $0x18,%esp
    5ddd:	8b 45 0c             	mov    0xc(%ebp),%eax
    5de0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    5de3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    5dea:	00 
    5deb:	8d 45 f4             	lea    -0xc(%ebp),%eax
    5dee:	89 44 24 04          	mov    %eax,0x4(%esp)
    5df2:	8b 45 08             	mov    0x8(%ebp),%eax
    5df5:	89 04 24             	mov    %eax,(%esp)
    5df8:	e8 f2 fe ff ff       	call   5cef <write>
}
    5dfd:	c9                   	leave  
    5dfe:	c3                   	ret    

00005dff <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    5dff:	55                   	push   %ebp
    5e00:	89 e5                	mov    %esp,%ebp
    5e02:	56                   	push   %esi
    5e03:	53                   	push   %ebx
    5e04:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    5e07:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    5e0e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    5e12:	74 17                	je     5e2b <printint+0x2c>
    5e14:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    5e18:	79 11                	jns    5e2b <printint+0x2c>
    neg = 1;
    5e1a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    5e21:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e24:	f7 d8                	neg    %eax
    5e26:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5e29:	eb 06                	jmp    5e31 <printint+0x32>
  } else {
    x = xx;
    5e2b:	8b 45 0c             	mov    0xc(%ebp),%eax
    5e2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    5e31:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    5e38:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    5e3b:	8d 41 01             	lea    0x1(%ecx),%eax
    5e3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    5e41:	8b 5d 10             	mov    0x10(%ebp),%ebx
    5e44:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5e47:	ba 00 00 00 00       	mov    $0x0,%edx
    5e4c:	f7 f3                	div    %ebx
    5e4e:	89 d0                	mov    %edx,%eax
    5e50:	0f b6 80 1c 0f 01 00 	movzbl 0x10f1c(%eax),%eax
    5e57:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    5e5b:	8b 75 10             	mov    0x10(%ebp),%esi
    5e5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    5e61:	ba 00 00 00 00       	mov    $0x0,%edx
    5e66:	f7 f6                	div    %esi
    5e68:	89 45 ec             	mov    %eax,-0x14(%ebp)
    5e6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5e6f:	75 c7                	jne    5e38 <printint+0x39>
  if(neg)
    5e71:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    5e75:	74 10                	je     5e87 <printint+0x88>
    buf[i++] = '-';
    5e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e7a:	8d 50 01             	lea    0x1(%eax),%edx
    5e7d:	89 55 f4             	mov    %edx,-0xc(%ebp)
    5e80:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    5e85:	eb 1f                	jmp    5ea6 <printint+0xa7>
    5e87:	eb 1d                	jmp    5ea6 <printint+0xa7>
    putc(fd, buf[i]);
    5e89:	8d 55 dc             	lea    -0x24(%ebp),%edx
    5e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5e8f:	01 d0                	add    %edx,%eax
    5e91:	0f b6 00             	movzbl (%eax),%eax
    5e94:	0f be c0             	movsbl %al,%eax
    5e97:	89 44 24 04          	mov    %eax,0x4(%esp)
    5e9b:	8b 45 08             	mov    0x8(%ebp),%eax
    5e9e:	89 04 24             	mov    %eax,(%esp)
    5ea1:	e8 31 ff ff ff       	call   5dd7 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    5ea6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    5eaa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5eae:	79 d9                	jns    5e89 <printint+0x8a>
    putc(fd, buf[i]);
}
    5eb0:	83 c4 30             	add    $0x30,%esp
    5eb3:	5b                   	pop    %ebx
    5eb4:	5e                   	pop    %esi
    5eb5:	5d                   	pop    %ebp
    5eb6:	c3                   	ret    

00005eb7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    5eb7:	55                   	push   %ebp
    5eb8:	89 e5                	mov    %esp,%ebp
    5eba:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    5ebd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    5ec4:	8d 45 0c             	lea    0xc(%ebp),%eax
    5ec7:	83 c0 04             	add    $0x4,%eax
    5eca:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    5ecd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    5ed4:	e9 7c 01 00 00       	jmp    6055 <printf+0x19e>
    c = fmt[i] & 0xff;
    5ed9:	8b 55 0c             	mov    0xc(%ebp),%edx
    5edc:	8b 45 f0             	mov    -0x10(%ebp),%eax
    5edf:	01 d0                	add    %edx,%eax
    5ee1:	0f b6 00             	movzbl (%eax),%eax
    5ee4:	0f be c0             	movsbl %al,%eax
    5ee7:	25 ff 00 00 00       	and    $0xff,%eax
    5eec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    5eef:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    5ef3:	75 2c                	jne    5f21 <printf+0x6a>
      if(c == '%'){
    5ef5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    5ef9:	75 0c                	jne    5f07 <printf+0x50>
        state = '%';
    5efb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    5f02:	e9 4a 01 00 00       	jmp    6051 <printf+0x19a>
      } else {
        putc(fd, c);
    5f07:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    5f0a:	0f be c0             	movsbl %al,%eax
    5f0d:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f11:	8b 45 08             	mov    0x8(%ebp),%eax
    5f14:	89 04 24             	mov    %eax,(%esp)
    5f17:	e8 bb fe ff ff       	call   5dd7 <putc>
    5f1c:	e9 30 01 00 00       	jmp    6051 <printf+0x19a>
      }
    } else if(state == '%'){
    5f21:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    5f25:	0f 85 26 01 00 00    	jne    6051 <printf+0x19a>
      if(c == 'd'){
    5f2b:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    5f2f:	75 2d                	jne    5f5e <printf+0xa7>
        printint(fd, *ap, 10, 1);
    5f31:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5f34:	8b 00                	mov    (%eax),%eax
    5f36:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    5f3d:	00 
    5f3e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    5f45:	00 
    5f46:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f4a:	8b 45 08             	mov    0x8(%ebp),%eax
    5f4d:	89 04 24             	mov    %eax,(%esp)
    5f50:	e8 aa fe ff ff       	call   5dff <printint>
        ap++;
    5f55:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5f59:	e9 ec 00 00 00       	jmp    604a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    5f5e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    5f62:	74 06                	je     5f6a <printf+0xb3>
    5f64:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    5f68:	75 2d                	jne    5f97 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    5f6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5f6d:	8b 00                	mov    (%eax),%eax
    5f6f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    5f76:	00 
    5f77:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    5f7e:	00 
    5f7f:	89 44 24 04          	mov    %eax,0x4(%esp)
    5f83:	8b 45 08             	mov    0x8(%ebp),%eax
    5f86:	89 04 24             	mov    %eax,(%esp)
    5f89:	e8 71 fe ff ff       	call   5dff <printint>
        ap++;
    5f8e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    5f92:	e9 b3 00 00 00       	jmp    604a <printf+0x193>
      } else if(c == 's'){
    5f97:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    5f9b:	75 45                	jne    5fe2 <printf+0x12b>
        s = (char*)*ap;
    5f9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5fa0:	8b 00                	mov    (%eax),%eax
    5fa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    5fa5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    5fa9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    5fad:	75 09                	jne    5fb8 <printf+0x101>
          s = "(null)";
    5faf:	c7 45 f4 8f cd 00 00 	movl   $0xcd8f,-0xc(%ebp)
        while(*s != 0){
    5fb6:	eb 1e                	jmp    5fd6 <printf+0x11f>
    5fb8:	eb 1c                	jmp    5fd6 <printf+0x11f>
          putc(fd, *s);
    5fba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5fbd:	0f b6 00             	movzbl (%eax),%eax
    5fc0:	0f be c0             	movsbl %al,%eax
    5fc3:	89 44 24 04          	mov    %eax,0x4(%esp)
    5fc7:	8b 45 08             	mov    0x8(%ebp),%eax
    5fca:	89 04 24             	mov    %eax,(%esp)
    5fcd:	e8 05 fe ff ff       	call   5dd7 <putc>
          s++;
    5fd2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    5fd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    5fd9:	0f b6 00             	movzbl (%eax),%eax
    5fdc:	84 c0                	test   %al,%al
    5fde:	75 da                	jne    5fba <printf+0x103>
    5fe0:	eb 68                	jmp    604a <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    5fe2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    5fe6:	75 1d                	jne    6005 <printf+0x14e>
        putc(fd, *ap);
    5fe8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    5feb:	8b 00                	mov    (%eax),%eax
    5fed:	0f be c0             	movsbl %al,%eax
    5ff0:	89 44 24 04          	mov    %eax,0x4(%esp)
    5ff4:	8b 45 08             	mov    0x8(%ebp),%eax
    5ff7:	89 04 24             	mov    %eax,(%esp)
    5ffa:	e8 d8 fd ff ff       	call   5dd7 <putc>
        ap++;
    5fff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    6003:	eb 45                	jmp    604a <printf+0x193>
      } else if(c == '%'){
    6005:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    6009:	75 17                	jne    6022 <printf+0x16b>
        putc(fd, c);
    600b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    600e:	0f be c0             	movsbl %al,%eax
    6011:	89 44 24 04          	mov    %eax,0x4(%esp)
    6015:	8b 45 08             	mov    0x8(%ebp),%eax
    6018:	89 04 24             	mov    %eax,(%esp)
    601b:	e8 b7 fd ff ff       	call   5dd7 <putc>
    6020:	eb 28                	jmp    604a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    6022:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    6029:	00 
    602a:	8b 45 08             	mov    0x8(%ebp),%eax
    602d:	89 04 24             	mov    %eax,(%esp)
    6030:	e8 a2 fd ff ff       	call   5dd7 <putc>
        putc(fd, c);
    6035:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6038:	0f be c0             	movsbl %al,%eax
    603b:	89 44 24 04          	mov    %eax,0x4(%esp)
    603f:	8b 45 08             	mov    0x8(%ebp),%eax
    6042:	89 04 24             	mov    %eax,(%esp)
    6045:	e8 8d fd ff ff       	call   5dd7 <putc>
      }
      state = 0;
    604a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    6051:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    6055:	8b 55 0c             	mov    0xc(%ebp),%edx
    6058:	8b 45 f0             	mov    -0x10(%ebp),%eax
    605b:	01 d0                	add    %edx,%eax
    605d:	0f b6 00             	movzbl (%eax),%eax
    6060:	84 c0                	test   %al,%al
    6062:	0f 85 71 fe ff ff    	jne    5ed9 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    6068:	c9                   	leave  
    6069:	c3                   	ret    

0000606a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    606a:	55                   	push   %ebp
    606b:	89 e5                	mov    %esp,%ebp
    606d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    6070:	8b 45 08             	mov    0x8(%ebp),%eax
    6073:	83 e8 08             	sub    $0x8,%eax
    6076:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    6079:	a1 40 14 01 00       	mov    0x11440,%eax
    607e:	89 45 fc             	mov    %eax,-0x4(%ebp)
    6081:	eb 24                	jmp    60a7 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    6083:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6086:	8b 00                	mov    (%eax),%eax
    6088:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    608b:	77 12                	ja     609f <free+0x35>
    608d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6090:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    6093:	77 24                	ja     60b9 <free+0x4f>
    6095:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6098:	8b 00                	mov    (%eax),%eax
    609a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    609d:	77 1a                	ja     60b9 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    609f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60a2:	8b 00                	mov    (%eax),%eax
    60a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    60a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60aa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    60ad:	76 d4                	jbe    6083 <free+0x19>
    60af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60b2:	8b 00                	mov    (%eax),%eax
    60b4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    60b7:	76 ca                	jbe    6083 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    60b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60bc:	8b 40 04             	mov    0x4(%eax),%eax
    60bf:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    60c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60c9:	01 c2                	add    %eax,%edx
    60cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60ce:	8b 00                	mov    (%eax),%eax
    60d0:	39 c2                	cmp    %eax,%edx
    60d2:	75 24                	jne    60f8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    60d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60d7:	8b 50 04             	mov    0x4(%eax),%edx
    60da:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60dd:	8b 00                	mov    (%eax),%eax
    60df:	8b 40 04             	mov    0x4(%eax),%eax
    60e2:	01 c2                	add    %eax,%edx
    60e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60e7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    60ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60ed:	8b 00                	mov    (%eax),%eax
    60ef:	8b 10                	mov    (%eax),%edx
    60f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
    60f4:	89 10                	mov    %edx,(%eax)
    60f6:	eb 0a                	jmp    6102 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    60f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    60fb:	8b 10                	mov    (%eax),%edx
    60fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6100:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    6102:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6105:	8b 40 04             	mov    0x4(%eax),%eax
    6108:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    610f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6112:	01 d0                	add    %edx,%eax
    6114:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    6117:	75 20                	jne    6139 <free+0xcf>
    p->s.size += bp->s.size;
    6119:	8b 45 fc             	mov    -0x4(%ebp),%eax
    611c:	8b 50 04             	mov    0x4(%eax),%edx
    611f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6122:	8b 40 04             	mov    0x4(%eax),%eax
    6125:	01 c2                	add    %eax,%edx
    6127:	8b 45 fc             	mov    -0x4(%ebp),%eax
    612a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    612d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    6130:	8b 10                	mov    (%eax),%edx
    6132:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6135:	89 10                	mov    %edx,(%eax)
    6137:	eb 08                	jmp    6141 <free+0xd7>
  } else
    p->s.ptr = bp;
    6139:	8b 45 fc             	mov    -0x4(%ebp),%eax
    613c:	8b 55 f8             	mov    -0x8(%ebp),%edx
    613f:	89 10                	mov    %edx,(%eax)
  freep = p;
    6141:	8b 45 fc             	mov    -0x4(%ebp),%eax
    6144:	a3 40 14 01 00       	mov    %eax,0x11440
}
    6149:	c9                   	leave  
    614a:	c3                   	ret    

0000614b <morecore>:

static Header*
morecore(uint nu)
{
    614b:	55                   	push   %ebp
    614c:	89 e5                	mov    %esp,%ebp
    614e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    6151:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    6158:	77 07                	ja     6161 <morecore+0x16>
    nu = 4096;
    615a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    6161:	8b 45 08             	mov    0x8(%ebp),%eax
    6164:	c1 e0 03             	shl    $0x3,%eax
    6167:	89 04 24             	mov    %eax,(%esp)
    616a:	e8 e8 fb ff ff       	call   5d57 <sbrk>
    616f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    6172:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    6176:	75 07                	jne    617f <morecore+0x34>
    return 0;
    6178:	b8 00 00 00 00       	mov    $0x0,%eax
    617d:	eb 22                	jmp    61a1 <morecore+0x56>
  hp = (Header*)p;
    617f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6182:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    6185:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6188:	8b 55 08             	mov    0x8(%ebp),%edx
    618b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    618e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6191:	83 c0 08             	add    $0x8,%eax
    6194:	89 04 24             	mov    %eax,(%esp)
    6197:	e8 ce fe ff ff       	call   606a <free>
  return freep;
    619c:	a1 40 14 01 00       	mov    0x11440,%eax
}
    61a1:	c9                   	leave  
    61a2:	c3                   	ret    

000061a3 <malloc>:

void*
malloc(uint nbytes)
{
    61a3:	55                   	push   %ebp
    61a4:	89 e5                	mov    %esp,%ebp
    61a6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    61a9:	8b 45 08             	mov    0x8(%ebp),%eax
    61ac:	83 c0 07             	add    $0x7,%eax
    61af:	c1 e8 03             	shr    $0x3,%eax
    61b2:	83 c0 01             	add    $0x1,%eax
    61b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    61b8:	a1 40 14 01 00       	mov    0x11440,%eax
    61bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    61c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    61c4:	75 23                	jne    61e9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    61c6:	c7 45 f0 38 14 01 00 	movl   $0x11438,-0x10(%ebp)
    61cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    61d0:	a3 40 14 01 00       	mov    %eax,0x11440
    61d5:	a1 40 14 01 00       	mov    0x11440,%eax
    61da:	a3 38 14 01 00       	mov    %eax,0x11438
    base.s.size = 0;
    61df:	c7 05 3c 14 01 00 00 	movl   $0x0,0x1143c
    61e6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    61e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    61ec:	8b 00                	mov    (%eax),%eax
    61ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    61f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    61f4:	8b 40 04             	mov    0x4(%eax),%eax
    61f7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    61fa:	72 4d                	jb     6249 <malloc+0xa6>
      if(p->s.size == nunits)
    61fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    61ff:	8b 40 04             	mov    0x4(%eax),%eax
    6202:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    6205:	75 0c                	jne    6213 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    6207:	8b 45 f4             	mov    -0xc(%ebp),%eax
    620a:	8b 10                	mov    (%eax),%edx
    620c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    620f:	89 10                	mov    %edx,(%eax)
    6211:	eb 26                	jmp    6239 <malloc+0x96>
      else {
        p->s.size -= nunits;
    6213:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6216:	8b 40 04             	mov    0x4(%eax),%eax
    6219:	2b 45 ec             	sub    -0x14(%ebp),%eax
    621c:	89 c2                	mov    %eax,%edx
    621e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6221:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    6224:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6227:	8b 40 04             	mov    0x4(%eax),%eax
    622a:	c1 e0 03             	shl    $0x3,%eax
    622d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    6230:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6233:	8b 55 ec             	mov    -0x14(%ebp),%edx
    6236:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    6239:	8b 45 f0             	mov    -0x10(%ebp),%eax
    623c:	a3 40 14 01 00       	mov    %eax,0x11440
      return (void*)(p + 1);
    6241:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6244:	83 c0 08             	add    $0x8,%eax
    6247:	eb 38                	jmp    6281 <malloc+0xde>
    }
    if(p == freep)
    6249:	a1 40 14 01 00       	mov    0x11440,%eax
    624e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    6251:	75 1b                	jne    626e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    6253:	8b 45 ec             	mov    -0x14(%ebp),%eax
    6256:	89 04 24             	mov    %eax,(%esp)
    6259:	e8 ed fe ff ff       	call   614b <morecore>
    625e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    6261:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6265:	75 07                	jne    626e <malloc+0xcb>
        return 0;
    6267:	b8 00 00 00 00       	mov    $0x0,%eax
    626c:	eb 13                	jmp    6281 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    626e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6271:	89 45 f0             	mov    %eax,-0x10(%ebp)
    6274:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6277:	8b 00                	mov    (%eax),%eax
    6279:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    627c:	e9 70 ff ff ff       	jmp    61f1 <malloc+0x4e>
}
    6281:	c9                   	leave  
    6282:	c3                   	ret    

00006283 <abs>:
#include "math.h"
#define pi 3.1415926535898 
int abs(int x)
{
    6283:	55                   	push   %ebp
    6284:	89 e5                	mov    %esp,%ebp
	if (x < 0)
    6286:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    628a:	79 07                	jns    6293 <abs+0x10>
		return x * -1;
    628c:	8b 45 08             	mov    0x8(%ebp),%eax
    628f:	f7 d8                	neg    %eax
    6291:	eb 03                	jmp    6296 <abs+0x13>
	else
		return x;
    6293:	8b 45 08             	mov    0x8(%ebp),%eax
}
    6296:	5d                   	pop    %ebp
    6297:	c3                   	ret    

00006298 <sin>:
double sin(double x)  
{  
    6298:	55                   	push   %ebp
    6299:	89 e5                	mov    %esp,%ebp
    629b:	83 ec 3c             	sub    $0x3c,%esp
    629e:	8b 45 08             	mov    0x8(%ebp),%eax
    62a1:	89 45 c8             	mov    %eax,-0x38(%ebp)
    62a4:	8b 45 0c             	mov    0xc(%ebp),%eax
    62a7:	89 45 cc             	mov    %eax,-0x34(%ebp)
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
    62aa:	dd 45 c8             	fldl   -0x38(%ebp)
    62ad:	dd 5d f8             	fstpl  -0x8(%ebp)
    62b0:	d9 e8                	fld1   
    62b2:	dd 5d f0             	fstpl  -0x10(%ebp)
    62b5:	dd 45 c8             	fldl   -0x38(%ebp)
    62b8:	dd 5d e8             	fstpl  -0x18(%ebp)
    62bb:	dd 45 c8             	fldl   -0x38(%ebp)
    62be:	dd 5d e0             	fstpl  -0x20(%ebp)
	int n=1,sign=1;  
    62c1:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
    62c8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
	while(Precious>1e-6)  
    62cf:	eb 50                	jmp    6321 <sin+0x89>
	{  
		n = n+1;  
    62d1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Fac=Fac*n*(n + 1);
    62d5:	db 45 dc             	fildl  -0x24(%ebp)
    62d8:	dc 4d f0             	fmull  -0x10(%ebp)
    62db:	8b 45 dc             	mov    -0x24(%ebp),%eax
    62de:	83 c0 01             	add    $0x1,%eax
    62e1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    62e4:	db 45 c4             	fildl  -0x3c(%ebp)
    62e7:	de c9                	fmulp  %st,%st(1)
    62e9:	dd 5d f0             	fstpl  -0x10(%ebp)
		n = n + 1;  
    62ec:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
		Xn*=x*x;  
    62f0:	dd 45 c8             	fldl   -0x38(%ebp)
    62f3:	dc 4d c8             	fmull  -0x38(%ebp)
    62f6:	dd 45 e8             	fldl   -0x18(%ebp)
    62f9:	de c9                	fmulp  %st,%st(1)
    62fb:	dd 5d e8             	fstpl  -0x18(%ebp)
		sign=-sign;  
    62fe:	f7 5d d8             	negl   -0x28(%ebp)
		Precious=Xn/Fac;  
    6301:	dd 45 e8             	fldl   -0x18(%ebp)
    6304:	dc 75 f0             	fdivl  -0x10(%ebp)
    6307:	dd 5d e0             	fstpl  -0x20(%ebp)
		Result=sign>0?Result+Precious:Result-Precious;  
    630a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    630e:	7e 08                	jle    6318 <sin+0x80>
    6310:	dd 45 f8             	fldl   -0x8(%ebp)
    6313:	dc 45 e0             	faddl  -0x20(%ebp)
    6316:	eb 06                	jmp    631e <sin+0x86>
    6318:	dd 45 f8             	fldl   -0x8(%ebp)
    631b:	dc 65 e0             	fsubl  -0x20(%ebp)
    631e:	dd 5d f8             	fstpl  -0x8(%ebp)
}
double sin(double x)  
{  
	double Result=x,Fac=1.0,Xn=x,Precious=x;  
	int n=1,sign=1;  
	while(Precious>1e-6)  
    6321:	dd 45 e0             	fldl   -0x20(%ebp)
    6324:	dd 05 98 cd 00 00    	fldl   0xcd98
    632a:	d9 c9                	fxch   %st(1)
    632c:	df e9                	fucomip %st(1),%st
    632e:	dd d8                	fstp   %st(0)
    6330:	77 9f                	ja     62d1 <sin+0x39>
		Xn*=x*x;  
		sign=-sign;  
		Precious=Xn/Fac;  
		Result=sign>0?Result+Precious:Result-Precious;  
	}  
	return Result;  
    6332:	dd 45 f8             	fldl   -0x8(%ebp)
}  
    6335:	c9                   	leave  
    6336:	c3                   	ret    

00006337 <cos>:
double cos(double x)  
{  
    6337:	55                   	push   %ebp
    6338:	89 e5                	mov    %esp,%ebp
    633a:	83 ec 10             	sub    $0x10,%esp
    633d:	8b 45 08             	mov    0x8(%ebp),%eax
    6340:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6343:	8b 45 0c             	mov    0xc(%ebp),%eax
    6346:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(pi/2-x);  
    6349:	dd 05 a0 cd 00 00    	fldl   0xcda0
    634f:	dc 65 f8             	fsubl  -0x8(%ebp)
    6352:	dd 1c 24             	fstpl  (%esp)
    6355:	e8 3e ff ff ff       	call   6298 <sin>
}  
    635a:	c9                   	leave  
    635b:	c3                   	ret    

0000635c <tan>:
double tan(double x)  
{  
    635c:	55                   	push   %ebp
    635d:	89 e5                	mov    %esp,%ebp
    635f:	83 ec 18             	sub    $0x18,%esp
    6362:	8b 45 08             	mov    0x8(%ebp),%eax
    6365:	89 45 f8             	mov    %eax,-0x8(%ebp)
    6368:	8b 45 0c             	mov    0xc(%ebp),%eax
    636b:	89 45 fc             	mov    %eax,-0x4(%ebp)
	return sin(x)/cos(x);  
    636e:	dd 45 f8             	fldl   -0x8(%ebp)
    6371:	dd 1c 24             	fstpl  (%esp)
    6374:	e8 1f ff ff ff       	call   6298 <sin>
    6379:	dd 5d f0             	fstpl  -0x10(%ebp)
    637c:	dd 45 f8             	fldl   -0x8(%ebp)
    637f:	dd 1c 24             	fstpl  (%esp)
    6382:	e8 b0 ff ff ff       	call   6337 <cos>
    6387:	dc 7d f0             	fdivrl -0x10(%ebp)
}  
    638a:	c9                   	leave  
    638b:	c3                   	ret    

0000638c <pow>:

double pow(double x, double y)
{
    638c:	55                   	push   %ebp
    638d:	89 e5                	mov    %esp,%ebp
    638f:	83 ec 48             	sub    $0x48,%esp
    6392:	8b 45 08             	mov    0x8(%ebp),%eax
    6395:	89 45 e0             	mov    %eax,-0x20(%ebp)
    6398:	8b 45 0c             	mov    0xc(%ebp),%eax
    639b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    639e:	8b 45 10             	mov    0x10(%ebp),%eax
    63a1:	89 45 d8             	mov    %eax,-0x28(%ebp)
    63a4:	8b 45 14             	mov    0x14(%ebp),%eax
    63a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
	if(x==0 && y!=0) return 0;
    63aa:	dd 45 e0             	fldl   -0x20(%ebp)
    63ad:	d9 ee                	fldz   
    63af:	df e9                	fucomip %st(1),%st
    63b1:	dd d8                	fstp   %st(0)
    63b3:	7a 28                	jp     63dd <pow+0x51>
    63b5:	dd 45 e0             	fldl   -0x20(%ebp)
    63b8:	d9 ee                	fldz   
    63ba:	df e9                	fucomip %st(1),%st
    63bc:	dd d8                	fstp   %st(0)
    63be:	75 1d                	jne    63dd <pow+0x51>
    63c0:	dd 45 d8             	fldl   -0x28(%ebp)
    63c3:	d9 ee                	fldz   
    63c5:	df e9                	fucomip %st(1),%st
    63c7:	dd d8                	fstp   %st(0)
    63c9:	7a 0b                	jp     63d6 <pow+0x4a>
    63cb:	dd 45 d8             	fldl   -0x28(%ebp)
    63ce:	d9 ee                	fldz   
    63d0:	df e9                	fucomip %st(1),%st
    63d2:	dd d8                	fstp   %st(0)
    63d4:	74 07                	je     63dd <pow+0x51>
    63d6:	d9 ee                	fldz   
    63d8:	e9 30 01 00 00       	jmp    650d <pow+0x181>
	else if(x==0 && y==0) return 1;
    63dd:	dd 45 e0             	fldl   -0x20(%ebp)
    63e0:	d9 ee                	fldz   
    63e2:	df e9                	fucomip %st(1),%st
    63e4:	dd d8                	fstp   %st(0)
    63e6:	7a 28                	jp     6410 <pow+0x84>
    63e8:	dd 45 e0             	fldl   -0x20(%ebp)
    63eb:	d9 ee                	fldz   
    63ed:	df e9                	fucomip %st(1),%st
    63ef:	dd d8                	fstp   %st(0)
    63f1:	75 1d                	jne    6410 <pow+0x84>
    63f3:	dd 45 d8             	fldl   -0x28(%ebp)
    63f6:	d9 ee                	fldz   
    63f8:	df e9                	fucomip %st(1),%st
    63fa:	dd d8                	fstp   %st(0)
    63fc:	7a 12                	jp     6410 <pow+0x84>
    63fe:	dd 45 d8             	fldl   -0x28(%ebp)
    6401:	d9 ee                	fldz   
    6403:	df e9                	fucomip %st(1),%st
    6405:	dd d8                	fstp   %st(0)
    6407:	75 07                	jne    6410 <pow+0x84>
    6409:	d9 e8                	fld1   
    640b:	e9 fd 00 00 00       	jmp    650d <pow+0x181>
	else if(y<0) return 1/pow(x,-y);//把指数小于0的情况转为1/x^-y计算
    6410:	d9 ee                	fldz   
    6412:	dd 45 d8             	fldl   -0x28(%ebp)
    6415:	d9 c9                	fxch   %st(1)
    6417:	df e9                	fucomip %st(1),%st
    6419:	dd d8                	fstp   %st(0)
    641b:	76 1d                	jbe    643a <pow+0xae>
    641d:	dd 45 d8             	fldl   -0x28(%ebp)
    6420:	d9 e0                	fchs   
    6422:	dd 5c 24 08          	fstpl  0x8(%esp)
    6426:	dd 45 e0             	fldl   -0x20(%ebp)
    6429:	dd 1c 24             	fstpl  (%esp)
    642c:	e8 5b ff ff ff       	call   638c <pow>
    6431:	d9 e8                	fld1   
    6433:	de f1                	fdivp  %st,%st(1)
    6435:	e9 d3 00 00 00       	jmp    650d <pow+0x181>
	else if(x<0 && y-(int)y!=0) return 0;//若x为负，且y不为整数数，则出错，返回0  
    643a:	d9 ee                	fldz   
    643c:	dd 45 e0             	fldl   -0x20(%ebp)
    643f:	d9 c9                	fxch   %st(1)
    6441:	df e9                	fucomip %st(1),%st
    6443:	dd d8                	fstp   %st(0)
    6445:	76 40                	jbe    6487 <pow+0xfb>
    6447:	dd 45 d8             	fldl   -0x28(%ebp)
    644a:	d9 7d d6             	fnstcw -0x2a(%ebp)
    644d:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    6451:	b4 0c                	mov    $0xc,%ah
    6453:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    6457:	d9 6d d4             	fldcw  -0x2c(%ebp)
    645a:	db 5d d0             	fistpl -0x30(%ebp)
    645d:	d9 6d d6             	fldcw  -0x2a(%ebp)
    6460:	8b 45 d0             	mov    -0x30(%ebp),%eax
    6463:	89 45 d0             	mov    %eax,-0x30(%ebp)
    6466:	db 45 d0             	fildl  -0x30(%ebp)
    6469:	dd 45 d8             	fldl   -0x28(%ebp)
    646c:	de e1                	fsubp  %st,%st(1)
    646e:	d9 ee                	fldz   
    6470:	df e9                	fucomip %st(1),%st
    6472:	7a 0a                	jp     647e <pow+0xf2>
    6474:	d9 ee                	fldz   
    6476:	df e9                	fucomip %st(1),%st
    6478:	dd d8                	fstp   %st(0)
    647a:	74 0b                	je     6487 <pow+0xfb>
    647c:	eb 02                	jmp    6480 <pow+0xf4>
    647e:	dd d8                	fstp   %st(0)
    6480:	d9 ee                	fldz   
    6482:	e9 86 00 00 00       	jmp    650d <pow+0x181>
	else if(x<0 && y-(int)y==0)//若x为负，且y为整数数，则用循环计算 
    6487:	d9 ee                	fldz   
    6489:	dd 45 e0             	fldl   -0x20(%ebp)
    648c:	d9 c9                	fxch   %st(1)
    648e:	df e9                	fucomip %st(1),%st
    6490:	dd d8                	fstp   %st(0)
    6492:	76 63                	jbe    64f7 <pow+0x16b>
    6494:	dd 45 d8             	fldl   -0x28(%ebp)
    6497:	d9 7d d6             	fnstcw -0x2a(%ebp)
    649a:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    649e:	b4 0c                	mov    $0xc,%ah
    64a0:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    64a4:	d9 6d d4             	fldcw  -0x2c(%ebp)
    64a7:	db 5d d0             	fistpl -0x30(%ebp)
    64aa:	d9 6d d6             	fldcw  -0x2a(%ebp)
    64ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
    64b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    64b3:	db 45 d0             	fildl  -0x30(%ebp)
    64b6:	dd 45 d8             	fldl   -0x28(%ebp)
    64b9:	de e1                	fsubp  %st,%st(1)
    64bb:	d9 ee                	fldz   
    64bd:	df e9                	fucomip %st(1),%st
    64bf:	7a 34                	jp     64f5 <pow+0x169>
    64c1:	d9 ee                	fldz   
    64c3:	df e9                	fucomip %st(1),%st
    64c5:	dd d8                	fstp   %st(0)
    64c7:	75 2e                	jne    64f7 <pow+0x16b>
	{
		double powint=1;
    64c9:	d9 e8                	fld1   
    64cb:	dd 5d f0             	fstpl  -0x10(%ebp)
		int i;
		for(i=1;i<=y;i++) powint*=x;
    64ce:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    64d5:	eb 0d                	jmp    64e4 <pow+0x158>
    64d7:	dd 45 f0             	fldl   -0x10(%ebp)
    64da:	dc 4d e0             	fmull  -0x20(%ebp)
    64dd:	dd 5d f0             	fstpl  -0x10(%ebp)
    64e0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    64e4:	db 45 ec             	fildl  -0x14(%ebp)
    64e7:	dd 45 d8             	fldl   -0x28(%ebp)
    64ea:	df e9                	fucomip %st(1),%st
    64ec:	dd d8                	fstp   %st(0)
    64ee:	73 e7                	jae    64d7 <pow+0x14b>
		return powint;
    64f0:	dd 45 f0             	fldl   -0x10(%ebp)
    64f3:	eb 18                	jmp    650d <pow+0x181>
    64f5:	dd d8                	fstp   %st(0)
	}
	return exp(y*ln(x));
    64f7:	dd 45 e0             	fldl   -0x20(%ebp)
    64fa:	dd 1c 24             	fstpl  (%esp)
    64fd:	e8 36 00 00 00       	call   6538 <ln>
    6502:	dc 4d d8             	fmull  -0x28(%ebp)
    6505:	dd 1c 24             	fstpl  (%esp)
    6508:	e8 0e 02 00 00       	call   671b <exp>
}
    650d:	c9                   	leave  
    650e:	c3                   	ret    

0000650f <sqrt>:
// 求根
double sqrt(double x)
{
    650f:	55                   	push   %ebp
    6510:	89 e5                	mov    %esp,%ebp
    6512:	83 ec 28             	sub    $0x28,%esp
    6515:	8b 45 08             	mov    0x8(%ebp),%eax
    6518:	89 45 f0             	mov    %eax,-0x10(%ebp)
    651b:	8b 45 0c             	mov    0xc(%ebp),%eax
    651e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return pow(x,0.5);
    6521:	dd 05 a8 cd 00 00    	fldl   0xcda8
    6527:	dd 5c 24 08          	fstpl  0x8(%esp)
    652b:	dd 45 f0             	fldl   -0x10(%ebp)
    652e:	dd 1c 24             	fstpl  (%esp)
    6531:	e8 56 fe ff ff       	call   638c <pow>
}
    6536:	c9                   	leave  
    6537:	c3                   	ret    

00006538 <ln>:

// ln(x) = 2 arctanh((x-1)/(x+1))
// 调用了Arctanh(double) 方法
double ln(double x)
{
    6538:	55                   	push   %ebp
    6539:	89 e5                	mov    %esp,%ebp
    653b:	81 ec 88 00 00 00    	sub    $0x88,%esp
    6541:	8b 45 08             	mov    0x8(%ebp),%eax
    6544:	89 45 90             	mov    %eax,-0x70(%ebp)
    6547:	8b 45 0c             	mov    0xc(%ebp),%eax
    654a:	89 45 94             	mov    %eax,-0x6c(%ebp)
	double y=x-1,ln_p1=0,ln_p2=0,ln_p3=0,ln_px=0,ln_tmp=1,dln_px=1,tmp;
    654d:	dd 45 90             	fldl   -0x70(%ebp)
    6550:	d9 e8                	fld1   
    6552:	de e9                	fsubrp %st,%st(1)
    6554:	dd 5d c0             	fstpl  -0x40(%ebp)
    6557:	d9 ee                	fldz   
    6559:	dd 5d f0             	fstpl  -0x10(%ebp)
    655c:	d9 ee                	fldz   
    655e:	dd 5d b8             	fstpl  -0x48(%ebp)
    6561:	d9 ee                	fldz   
    6563:	dd 5d b0             	fstpl  -0x50(%ebp)
    6566:	d9 ee                	fldz   
    6568:	dd 5d e8             	fstpl  -0x18(%ebp)
    656b:	d9 e8                	fld1   
    656d:	dd 5d e0             	fstpl  -0x20(%ebp)
    6570:	d9 e8                	fld1   
    6572:	dd 5d a8             	fstpl  -0x58(%ebp)
	int l;
	if(x==1) return 0;
    6575:	dd 45 90             	fldl   -0x70(%ebp)
    6578:	d9 e8                	fld1   
    657a:	df e9                	fucomip %st(1),%st
    657c:	dd d8                	fstp   %st(0)
    657e:	7a 12                	jp     6592 <ln+0x5a>
    6580:	dd 45 90             	fldl   -0x70(%ebp)
    6583:	d9 e8                	fld1   
    6585:	df e9                	fucomip %st(1),%st
    6587:	dd d8                	fstp   %st(0)
    6589:	75 07                	jne    6592 <ln+0x5a>
    658b:	d9 ee                	fldz   
    658d:	e9 87 01 00 00       	jmp    6719 <ln+0x1e1>
	else if(x>2) return -ln(1/x);
    6592:	dd 45 90             	fldl   -0x70(%ebp)
    6595:	dd 05 b0 cd 00 00    	fldl   0xcdb0
    659b:	d9 c9                	fxch   %st(1)
    659d:	df e9                	fucomip %st(1),%st
    659f:	dd d8                	fstp   %st(0)
    65a1:	76 14                	jbe    65b7 <ln+0x7f>
    65a3:	d9 e8                	fld1   
    65a5:	dc 75 90             	fdivl  -0x70(%ebp)
    65a8:	dd 1c 24             	fstpl  (%esp)
    65ab:	e8 88 ff ff ff       	call   6538 <ln>
    65b0:	d9 e0                	fchs   
    65b2:	e9 62 01 00 00       	jmp    6719 <ln+0x1e1>
	else if(x<.1)
    65b7:	dd 05 b8 cd 00 00    	fldl   0xcdb8
    65bd:	dd 45 90             	fldl   -0x70(%ebp)
    65c0:	d9 c9                	fxch   %st(1)
    65c2:	df e9                	fucomip %st(1),%st
    65c4:	dd d8                	fstp   %st(0)
    65c6:	76 59                	jbe    6621 <ln+0xe9>
	{
		double n=-1;
    65c8:	d9 e8                	fld1   
    65ca:	d9 e0                	fchs   
    65cc:	dd 5d c8             	fstpl  -0x38(%ebp)
		double a;
		do
		{
			n=n-.6;
    65cf:	dd 45 c8             	fldl   -0x38(%ebp)
    65d2:	dd 05 c0 cd 00 00    	fldl   0xcdc0
    65d8:	de e9                	fsubrp %st,%st(1)
    65da:	dd 5d c8             	fstpl  -0x38(%ebp)
			a=x/exp(n);
    65dd:	dd 45 c8             	fldl   -0x38(%ebp)
    65e0:	dd 1c 24             	fstpl  (%esp)
    65e3:	e8 33 01 00 00       	call   671b <exp>
    65e8:	dd 45 90             	fldl   -0x70(%ebp)
    65eb:	de f1                	fdivp  %st,%st(1)
    65ed:	dd 5d a0             	fstpl  -0x60(%ebp)
		}
		while(a>2 || a<1);
    65f0:	dd 45 a0             	fldl   -0x60(%ebp)
    65f3:	dd 05 b0 cd 00 00    	fldl   0xcdb0
    65f9:	d9 c9                	fxch   %st(1)
    65fb:	df e9                	fucomip %st(1),%st
    65fd:	dd d8                	fstp   %st(0)
    65ff:	77 ce                	ja     65cf <ln+0x97>
    6601:	d9 e8                	fld1   
    6603:	dd 45 a0             	fldl   -0x60(%ebp)
    6606:	d9 c9                	fxch   %st(1)
    6608:	df e9                	fucomip %st(1),%st
    660a:	dd d8                	fstp   %st(0)
    660c:	77 c1                	ja     65cf <ln+0x97>
		return ln(a)+n;
    660e:	dd 45 a0             	fldl   -0x60(%ebp)
    6611:	dd 1c 24             	fstpl  (%esp)
    6614:	e8 1f ff ff ff       	call   6538 <ln>
    6619:	dc 45 c8             	faddl  -0x38(%ebp)
    661c:	e9 f8 00 00 00       	jmp    6719 <ln+0x1e1>
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    6621:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
    6628:	d9 e8                	fld1   
    662a:	dd 5d d8             	fstpl  -0x28(%ebp)
    662d:	e9 b6 00 00 00       	jmp    66e8 <ln+0x1b0>
	{
		ln_tmp=ln_px;
    6632:	dd 45 e8             	fldl   -0x18(%ebp)
    6635:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    6638:	dd 45 d8             	fldl   -0x28(%ebp)
    663b:	dc 4d c0             	fmull  -0x40(%ebp)
    663e:	dd 5d d8             	fstpl  -0x28(%ebp)
		if(l==1) tmp=tmp/l;
    6641:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
    6645:	75 0d                	jne    6654 <ln+0x11c>
    6647:	db 45 d4             	fildl  -0x2c(%ebp)
    664a:	dd 45 d8             	fldl   -0x28(%ebp)
    664d:	de f1                	fdivp  %st,%st(1)
    664f:	dd 5d d8             	fstpl  -0x28(%ebp)
    6652:	eb 13                	jmp    6667 <ln+0x12f>
		else tmp=tmp/-l;
    6654:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6657:	f7 d8                	neg    %eax
    6659:	89 45 8c             	mov    %eax,-0x74(%ebp)
    665c:	db 45 8c             	fildl  -0x74(%ebp)
    665f:	dd 45 d8             	fldl   -0x28(%ebp)
    6662:	de f1                	fdivp  %st,%st(1)
    6664:	dd 5d d8             	fstpl  -0x28(%ebp)
		ln_p1+=tmp;
    6667:	dd 45 f0             	fldl   -0x10(%ebp)
    666a:	dc 45 d8             	faddl  -0x28(%ebp)
    666d:	dd 5d f0             	fstpl  -0x10(%ebp)
		ln_p2=ln_p1+-1*tmp*y*l/(l+1);
    6670:	dd 45 d8             	fldl   -0x28(%ebp)
    6673:	d9 e0                	fchs   
    6675:	dc 4d c0             	fmull  -0x40(%ebp)
    6678:	db 45 d4             	fildl  -0x2c(%ebp)
    667b:	de c9                	fmulp  %st,%st(1)
    667d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    6680:	83 c0 01             	add    $0x1,%eax
    6683:	89 45 8c             	mov    %eax,-0x74(%ebp)
    6686:	db 45 8c             	fildl  -0x74(%ebp)
    6689:	de f9                	fdivrp %st,%st(1)
    668b:	dc 45 f0             	faddl  -0x10(%ebp)
    668e:	dd 5d b8             	fstpl  -0x48(%ebp)
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
    6691:	dd 45 d8             	fldl   -0x28(%ebp)
    6694:	dc 4d c0             	fmull  -0x40(%ebp)
    6697:	dc 4d c0             	fmull  -0x40(%ebp)
    669a:	db 45 d4             	fildl  -0x2c(%ebp)
    669d:	de c9                	fmulp  %st,%st(1)
    669f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    66a2:	83 c0 02             	add    $0x2,%eax
    66a5:	89 45 8c             	mov    %eax,-0x74(%ebp)
    66a8:	db 45 8c             	fildl  -0x74(%ebp)
    66ab:	de f9                	fdivrp %st,%st(1)
    66ad:	dc 45 b8             	faddl  -0x48(%ebp)
    66b0:	dd 5d b0             	fstpl  -0x50(%ebp)
		dln_px=ln_p3-ln_p2;
    66b3:	dd 45 b0             	fldl   -0x50(%ebp)
    66b6:	dc 65 b8             	fsubl  -0x48(%ebp)
    66b9:	dd 5d a8             	fstpl  -0x58(%ebp)
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
    66bc:	dd 45 a8             	fldl   -0x58(%ebp)
    66bf:	dc 4d a8             	fmull  -0x58(%ebp)
    66c2:	dd 45 b8             	fldl   -0x48(%ebp)
    66c5:	d8 c0                	fadd   %st(0),%st
    66c7:	dd 45 b0             	fldl   -0x50(%ebp)
    66ca:	de e1                	fsubp  %st,%st(1)
    66cc:	dc 45 f0             	faddl  -0x10(%ebp)
    66cf:	de f9                	fdivrp %st,%st(1)
    66d1:	dd 45 b0             	fldl   -0x50(%ebp)
    66d4:	de e1                	fsubp  %st,%st(1)
    66d6:	dd 5d e8             	fstpl  -0x18(%ebp)
		tmp*=l;
    66d9:	db 45 d4             	fildl  -0x2c(%ebp)
    66dc:	dd 45 d8             	fldl   -0x28(%ebp)
    66df:	de c9                	fmulp  %st,%st(1)
    66e1:	dd 5d d8             	fstpl  -0x28(%ebp)
			a=x/exp(n);
		}
		while(a>2 || a<1);
		return ln(a)+n;
	}
	for(l=1,tmp=1;(ln_px-ln_tmp)>1e-9 || (ln_px-ln_tmp)<-1e-9;l++)
    66e4:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    66e8:	dd 45 e8             	fldl   -0x18(%ebp)
    66eb:	dc 65 e0             	fsubl  -0x20(%ebp)
    66ee:	dd 05 c8 cd 00 00    	fldl   0xcdc8
    66f4:	d9 c9                	fxch   %st(1)
    66f6:	df e9                	fucomip %st(1),%st
    66f8:	dd d8                	fstp   %st(0)
    66fa:	0f 87 32 ff ff ff    	ja     6632 <ln+0xfa>
    6700:	dd 45 e8             	fldl   -0x18(%ebp)
    6703:	dc 65 e0             	fsubl  -0x20(%ebp)
    6706:	dd 05 d0 cd 00 00    	fldl   0xcdd0
    670c:	df e9                	fucomip %st(1),%st
    670e:	dd d8                	fstp   %st(0)
    6710:	0f 87 1c ff ff ff    	ja     6632 <ln+0xfa>
		ln_p3=ln_p2+tmp*y*y*l/(l+2);
		dln_px=ln_p3-ln_p2;
		ln_px=ln_p3-dln_px*dln_px/(ln_p3-2*ln_p2+ln_p1);
		tmp*=l;
	}
	return ln_px;
    6716:	dd 45 e8             	fldl   -0x18(%ebp)
}
    6719:	c9                   	leave  
    671a:	c3                   	ret    

0000671b <exp>:

// 求e^x 用于Pow( double, double )调用
// e^x = 1+x+(x^2)/2!+(x^3)/3!+...
// 精度为7位
double exp( double x )
{
    671b:	55                   	push   %ebp
    671c:	89 e5                	mov    %esp,%ebp
    671e:	83 ec 78             	sub    $0x78,%esp
    6721:	8b 45 08             	mov    0x8(%ebp),%eax
    6724:	89 45 a0             	mov    %eax,-0x60(%ebp)
    6727:	8b 45 0c             	mov    0xc(%ebp),%eax
    672a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
    672d:	dd 45 a0             	fldl   -0x60(%ebp)
    6730:	dd 5d c0             	fstpl  -0x40(%ebp)
    6733:	d9 ee                	fldz   
    6735:	dd 5d f0             	fstpl  -0x10(%ebp)
    6738:	d9 ee                	fldz   
    673a:	dd 5d b8             	fstpl  -0x48(%ebp)
    673d:	d9 ee                	fldz   
    673f:	dd 5d b0             	fstpl  -0x50(%ebp)
    6742:	d9 ee                	fldz   
    6744:	dd 5d e8             	fstpl  -0x18(%ebp)
    6747:	d9 e8                	fld1   
    6749:	dd 5d e0             	fstpl  -0x20(%ebp)
    674c:	d9 e8                	fld1   
    674e:	dd 5d d8             	fstpl  -0x28(%ebp)
	int l;
	if(x==0) return 1;
    6751:	dd 45 a0             	fldl   -0x60(%ebp)
    6754:	d9 ee                	fldz   
    6756:	df e9                	fucomip %st(1),%st
    6758:	dd d8                	fstp   %st(0)
    675a:	7a 12                	jp     676e <exp+0x53>
    675c:	dd 45 a0             	fldl   -0x60(%ebp)
    675f:	d9 ee                	fldz   
    6761:	df e9                	fucomip %st(1),%st
    6763:	dd d8                	fstp   %st(0)
    6765:	75 07                	jne    676e <exp+0x53>
    6767:	d9 e8                	fld1   
    6769:	e9 08 01 00 00       	jmp    6876 <exp+0x15b>
	if(x<0) return 1/exp(-x); 
    676e:	d9 ee                	fldz   
    6770:	dd 45 a0             	fldl   -0x60(%ebp)
    6773:	d9 c9                	fxch   %st(1)
    6775:	df e9                	fucomip %st(1),%st
    6777:	dd d8                	fstp   %st(0)
    6779:	76 16                	jbe    6791 <exp+0x76>
    677b:	dd 45 a0             	fldl   -0x60(%ebp)
    677e:	d9 e0                	fchs   
    6780:	dd 1c 24             	fstpl  (%esp)
    6783:	e8 93 ff ff ff       	call   671b <exp>
    6788:	d9 e8                	fld1   
    678a:	de f1                	fdivp  %st,%st(1)
    678c:	e9 e5 00 00 00       	jmp    6876 <exp+0x15b>
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    6791:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
    6798:	d9 e8                	fld1   
    679a:	dd 5d d0             	fstpl  -0x30(%ebp)
    679d:	e9 92 00 00 00       	jmp    6834 <exp+0x119>
	{
		ex_tmp=ex_px;
    67a2:	dd 45 e8             	fldl   -0x18(%ebp)
    67a5:	dd 5d e0             	fstpl  -0x20(%ebp)
		tmp*=y;
    67a8:	dd 45 d0             	fldl   -0x30(%ebp)
    67ab:	dc 4d c0             	fmull  -0x40(%ebp)
    67ae:	dd 5d d0             	fstpl  -0x30(%ebp)
		tmp=tmp/l;
    67b1:	db 45 cc             	fildl  -0x34(%ebp)
    67b4:	dd 45 d0             	fldl   -0x30(%ebp)
    67b7:	de f1                	fdivp  %st,%st(1)
    67b9:	dd 5d d0             	fstpl  -0x30(%ebp)
		ex_p1+=tmp;
    67bc:	dd 45 f0             	fldl   -0x10(%ebp)
    67bf:	dc 45 d0             	faddl  -0x30(%ebp)
    67c2:	dd 5d f0             	fstpl  -0x10(%ebp)
		ex_p2=ex_p1+tmp*y/(l+1);
    67c5:	dd 45 d0             	fldl   -0x30(%ebp)
    67c8:	dc 4d c0             	fmull  -0x40(%ebp)
    67cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
    67ce:	83 c0 01             	add    $0x1,%eax
    67d1:	89 45 9c             	mov    %eax,-0x64(%ebp)
    67d4:	db 45 9c             	fildl  -0x64(%ebp)
    67d7:	de f9                	fdivrp %st,%st(1)
    67d9:	dc 45 f0             	faddl  -0x10(%ebp)
    67dc:	dd 5d b8             	fstpl  -0x48(%ebp)
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
    67df:	dd 45 d0             	fldl   -0x30(%ebp)
    67e2:	dc 4d c0             	fmull  -0x40(%ebp)
    67e5:	dc 4d c0             	fmull  -0x40(%ebp)
    67e8:	8b 45 cc             	mov    -0x34(%ebp),%eax
    67eb:	83 c0 01             	add    $0x1,%eax
    67ee:	89 45 9c             	mov    %eax,-0x64(%ebp)
    67f1:	db 45 9c             	fildl  -0x64(%ebp)
    67f4:	de f9                	fdivrp %st,%st(1)
    67f6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    67f9:	83 c0 02             	add    $0x2,%eax
    67fc:	89 45 9c             	mov    %eax,-0x64(%ebp)
    67ff:	db 45 9c             	fildl  -0x64(%ebp)
    6802:	de f9                	fdivrp %st,%st(1)
    6804:	dc 45 b8             	faddl  -0x48(%ebp)
    6807:	dd 5d b0             	fstpl  -0x50(%ebp)
		dex_px=ex_p3-ex_p2;
    680a:	dd 45 b0             	fldl   -0x50(%ebp)
    680d:	dc 65 b8             	fsubl  -0x48(%ebp)
    6810:	dd 5d d8             	fstpl  -0x28(%ebp)
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
    6813:	dd 45 d8             	fldl   -0x28(%ebp)
    6816:	dc 4d d8             	fmull  -0x28(%ebp)
    6819:	dd 45 b8             	fldl   -0x48(%ebp)
    681c:	d8 c0                	fadd   %st(0),%st
    681e:	dd 45 b0             	fldl   -0x50(%ebp)
    6821:	de e1                	fsubp  %st,%st(1)
    6823:	dc 45 f0             	faddl  -0x10(%ebp)
    6826:	de f9                	fdivrp %st,%st(1)
    6828:	dd 45 b0             	fldl   -0x50(%ebp)
    682b:	de e1                	fsubp  %st,%st(1)
    682d:	dd 5d e8             	fstpl  -0x18(%ebp)
{
	double y=x,ex_p1=0,ex_p2=0,ex_p3=0,ex_px=0,ex_tmp=1,dex_px=1,tmp;
	int l;
	if(x==0) return 1;
	if(x<0) return 1/exp(-x); 
	for(l=1,tmp=1;((ex_px-ex_tmp)>1e-10 || (ex_px-ex_tmp)<-1e-10) && dex_px>1e-10;l++)
    6830:	83 45 cc 01          	addl   $0x1,-0x34(%ebp)
    6834:	dd 45 e8             	fldl   -0x18(%ebp)
    6837:	dc 65 e0             	fsubl  -0x20(%ebp)
    683a:	dd 05 d8 cd 00 00    	fldl   0xcdd8
    6840:	d9 c9                	fxch   %st(1)
    6842:	df e9                	fucomip %st(1),%st
    6844:	dd d8                	fstp   %st(0)
    6846:	77 12                	ja     685a <exp+0x13f>
    6848:	dd 45 e8             	fldl   -0x18(%ebp)
    684b:	dc 65 e0             	fsubl  -0x20(%ebp)
    684e:	dd 05 e0 cd 00 00    	fldl   0xcde0
    6854:	df e9                	fucomip %st(1),%st
    6856:	dd d8                	fstp   %st(0)
    6858:	76 15                	jbe    686f <exp+0x154>
    685a:	dd 45 d8             	fldl   -0x28(%ebp)
    685d:	dd 05 d8 cd 00 00    	fldl   0xcdd8
    6863:	d9 c9                	fxch   %st(1)
    6865:	df e9                	fucomip %st(1),%st
    6867:	dd d8                	fstp   %st(0)
    6869:	0f 87 33 ff ff ff    	ja     67a2 <exp+0x87>
		ex_p2=ex_p1+tmp*y/(l+1);
		ex_p3=ex_p2+tmp*y*y/(l+1)/(l+2);
		dex_px=ex_p3-ex_p2;
		ex_px=ex_p3-dex_px*dex_px/(ex_p3-2*ex_p2+ex_p1);
	}
	return ex_px+1;
    686f:	dd 45 e8             	fldl   -0x18(%ebp)
    6872:	d9 e8                	fld1   
    6874:	de c1                	faddp  %st,%st(1)
    6876:	c9                   	leave  
    6877:	c3                   	ret    

00006878 <OpenTableFile>:
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
    6878:	55                   	push   %ebp
    6879:	89 e5                	mov    %esp,%ebp
    687b:	83 ec 78             	sub    $0x78,%esp
	char fulname[80];
	int f;

	fulname[0] = '\0';
    687e:	c6 45 a4 00          	movb   $0x0,-0x5c(%ebp)
	strcpy(fulname, name);
    6882:	8b 45 08             	mov    0x8(%ebp),%eax
    6885:	89 44 24 04          	mov    %eax,0x4(%esp)
    6889:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    688c:	89 04 24             	mov    %eax,(%esp)
    688f:	e8 f8 f1 ff ff       	call   5a8c <strcpy>
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
    6894:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    689b:	00 
    689c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    689f:	89 04 24             	mov    %eax,(%esp)
    68a2:	e8 68 f4 ff ff       	call   5d0f <open>
    68a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    68aa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    68ae:	75 1b                	jne    68cb <OpenTableFile+0x53>
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    68b0:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    68b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    68b7:	c7 44 24 04 14 ce 00 	movl   $0xce14,0x4(%esp)
    68be:	00 
    68bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    68c6:	e8 ec f5 ff ff       	call   5eb7 <printf>
    }
    return f;
    68cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    68ce:	c9                   	leave  
    68cf:	c3                   	ret    

000068d0 <WriteHdr>:


void WriteHdr(struct frame_params *fr_ps)
{
    68d0:	55                   	push   %ebp
    68d1:	89 e5                	mov    %esp,%ebp
    68d3:	57                   	push   %edi
    68d4:	56                   	push   %esi
    68d5:	53                   	push   %ebx
    68d6:	83 ec 3c             	sub    $0x3c,%esp
	layer *info = fr_ps->header;
    68d9:	8b 45 08             	mov    0x8(%ebp),%eax
    68dc:	8b 00                	mov    (%eax),%eax
    68de:	89 45 e4             	mov    %eax,-0x1c(%ebp)

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    68e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    68e4:	8b 78 14             	mov    0x14(%eax),%edi
    68e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    68ea:	8b 70 10             	mov    0x10(%eax),%esi
    68ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    68f0:	8b 58 0c             	mov    0xc(%eax),%ebx
		info->version, info->lay, !info->error_protection,
    68f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    68f6:	8b 40 08             	mov    0x8(%eax),%eax

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
    68f9:	85 c0                	test   %eax,%eax
    68fb:	0f 94 c0             	sete   %al
    68fe:	0f b6 c8             	movzbl %al,%ecx
    6901:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6904:	8b 50 04             	mov    0x4(%eax),%edx
    6907:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    690a:	8b 00                	mov    (%eax),%eax
    690c:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    6910:	89 74 24 18          	mov    %esi,0x18(%esp)
    6914:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6918:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    691c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    6920:	89 44 24 08          	mov    %eax,0x8(%esp)
    6924:	c7 44 24 04 34 ce 00 	movl   $0xce34,0x4(%esp)
    692b:	00 
    692c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6933:	e8 7f f5 ff ff       	call   5eb7 <printf>
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
    6938:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    693b:	8b 78 2c             	mov    0x2c(%eax),%edi
    693e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6941:	8b 70 28             	mov    0x28(%eax),%esi
    6944:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6947:	8b 58 24             	mov    0x24(%eax),%ebx
    694a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    694d:	8b 48 20             	mov    0x20(%eax),%ecx
    6950:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6953:	8b 50 1c             	mov    0x1c(%eax),%edx
    6956:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6959:	8b 40 18             	mov    0x18(%eax),%eax
    695c:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
    6960:	89 74 24 18          	mov    %esi,0x18(%esp)
    6964:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    6968:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    696c:	89 54 24 0c          	mov    %edx,0xc(%esp)
    6970:	89 44 24 08          	mov    %eax,0x8(%esp)
    6974:	c7 44 24 04 74 ce 00 	movl   $0xce74,0x4(%esp)
    697b:	00 
    697c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6983:	e8 2f f5 ff ff       	call   5eb7 <printf>
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    6988:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    698b:	8b 40 1c             	mov    0x1c(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    698e:	8b 0c 85 40 10 01 00 	mov    0x11040(,%eax,4),%ecx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);
    6995:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    6998:	8b 40 10             	mov    0x10(%eax),%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    699b:	dd 04 c5 20 10 01 00 	fldl   0x11020(,%eax,8)
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    69a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    69a5:	8b 40 04             	mov    0x4(%eax),%eax
    69a8:	8d 50 ff             	lea    -0x1(%eax),%edx
    69ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    69ae:	8b 58 0c             	mov    0xc(%eax),%ebx

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    69b1:	89 d0                	mov    %edx,%eax
    69b3:	c1 e0 04             	shl    $0x4,%eax
    69b6:	29 d0                	sub    %edx,%eax
    69b8:	01 d8                	add    %ebx,%eax
    69ba:	8b 14 85 60 0f 01 00 	mov    0x10f60(,%eax,4),%edx
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
    69c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    69c4:	8b 40 04             	mov    0x4(%eax),%eax
    69c7:	83 e8 01             	sub    $0x1,%eax

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
    69ca:	8b 04 85 40 0f 01 00 	mov    0x10f40(,%eax,4),%eax
    69d1:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    69d5:	dd 5c 24 10          	fstpl  0x10(%esp)
    69d9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    69dd:	89 44 24 08          	mov    %eax,0x8(%esp)
    69e1:	c7 44 24 04 9c ce 00 	movl   $0xce9c,0x4(%esp)
    69e8:	00 
    69e9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    69f0:	e8 c2 f4 ff ff       	call   5eb7 <printf>
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
    69f5:	8b 45 08             	mov    0x8(%ebp),%eax
    69f8:	8b 48 08             	mov    0x8(%eax),%ecx
    69fb:	8b 45 08             	mov    0x8(%ebp),%eax
    69fe:	8b 50 0c             	mov    0xc(%eax),%edx
    6a01:	8b 45 08             	mov    0x8(%ebp),%eax
    6a04:	8b 40 10             	mov    0x10(%eax),%eax
    6a07:	89 4c 24 10          	mov    %ecx,0x10(%esp)
    6a0b:	89 54 24 0c          	mov    %edx,0xc(%esp)
    6a0f:	89 44 24 08          	mov    %eax,0x8(%esp)
    6a13:	c7 44 24 04 cb ce 00 	movl   $0xcecb,0x4(%esp)
    6a1a:	00 
    6a1b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6a22:	e8 90 f4 ff ff       	call   5eb7 <printf>
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}
    6a27:	83 c4 3c             	add    $0x3c,%esp
    6a2a:	5b                   	pop    %ebx
    6a2b:	5e                   	pop    %esi
    6a2c:	5f                   	pop    %edi
    6a2d:	5d                   	pop    %ebp
    6a2e:	c3                   	ret    

00006a2f <mem_alloc>:

void *mem_alloc(unsigned long block, char *item)
{
    6a2f:	55                   	push   %ebp
    6a30:	89 e5                	mov    %esp,%ebp
    6a32:	83 ec 28             	sub    $0x28,%esp
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
    6a35:	8b 45 08             	mov    0x8(%ebp),%eax
    6a38:	89 04 24             	mov    %eax,(%esp)
    6a3b:	e8 63 f7 ff ff       	call   61a3 <malloc>
    6a40:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (ptr != 0)
    6a43:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    6a47:	74 1c                	je     6a65 <mem_alloc+0x36>
		memset(ptr, 0, block);
    6a49:	8b 45 08             	mov    0x8(%ebp),%eax
    6a4c:	89 44 24 08          	mov    %eax,0x8(%esp)
    6a50:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    6a57:	00 
    6a58:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6a5b:	89 04 24             	mov    %eax,(%esp)
    6a5e:	e8 bf f0 ff ff       	call   5b22 <memset>
    6a63:	eb 20                	jmp    6a85 <mem_alloc+0x56>
	else{
		printf(0, "Unable to allocate %s\n", item);
    6a65:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a68:	89 44 24 08          	mov    %eax,0x8(%esp)
    6a6c:	c7 44 24 04 e5 ce 00 	movl   $0xcee5,0x4(%esp)
    6a73:	00 
    6a74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6a7b:	e8 37 f4 ff ff       	call   5eb7 <printf>
		exit();
    6a80:	e8 4a f2 ff ff       	call   5ccf <exit>
	}
	return ptr;
    6a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6a88:	c9                   	leave  
    6a89:	c3                   	ret    

00006a8a <alloc_buffer>:

void alloc_buffer(Bit_stream_struc *bs, int size)
{
    6a8a:	55                   	push   %ebp
    6a8b:	89 e5                	mov    %esp,%ebp
    6a8d:	83 ec 18             	sub    $0x18,%esp
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
    6a90:	8b 45 0c             	mov    0xc(%ebp),%eax
    6a93:	c7 44 24 04 fc ce 00 	movl   $0xcefc,0x4(%esp)
    6a9a:	00 
    6a9b:	89 04 24             	mov    %eax,(%esp)
    6a9e:	e8 8c ff ff ff       	call   6a2f <mem_alloc>
    6aa3:	8b 55 08             	mov    0x8(%ebp),%edx
    6aa6:	89 42 04             	mov    %eax,0x4(%edx)
	bs->buf_size = size;
    6aa9:	8b 45 08             	mov    0x8(%ebp),%eax
    6aac:	8b 55 0c             	mov    0xc(%ebp),%edx
    6aaf:	89 50 08             	mov    %edx,0x8(%eax)
}
    6ab2:	c9                   	leave  
    6ab3:	c3                   	ret    

00006ab4 <desalloc_buffer>:

void desalloc_buffer(Bit_stream_struc *bs)
{
    6ab4:	55                   	push   %ebp
    6ab5:	89 e5                	mov    %esp,%ebp
    6ab7:	83 ec 18             	sub    $0x18,%esp
	free(bs->buf);
    6aba:	8b 45 08             	mov    0x8(%ebp),%eax
    6abd:	8b 40 04             	mov    0x4(%eax),%eax
    6ac0:	89 04 24             	mov    %eax,(%esp)
    6ac3:	e8 a2 f5 ff ff       	call   606a <free>
}
    6ac8:	c9                   	leave  
    6ac9:	c3                   	ret    

00006aca <open_bit_stream_r>:

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
{
    6aca:	55                   	push   %ebp
    6acb:	89 e5                	mov    %esp,%ebp
    6acd:	83 ec 18             	sub    $0x18,%esp
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
    6ad0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    6ad7:	00 
    6ad8:	8b 45 0c             	mov    0xc(%ebp),%eax
    6adb:	89 04 24             	mov    %eax,(%esp)
    6ade:	e8 2c f2 ff ff       	call   5d0f <open>
    6ae3:	8b 55 08             	mov    0x8(%ebp),%edx
    6ae6:	89 02                	mov    %eax,(%edx)
    6ae8:	8b 45 08             	mov    0x8(%ebp),%eax
    6aeb:	8b 00                	mov    (%eax),%eax
    6aed:	83 f8 ff             	cmp    $0xffffffff,%eax
    6af0:	75 20                	jne    6b12 <open_bit_stream_r+0x48>
		printf(0, "Could not find \"%s\".\n", bs_filenam);
    6af2:	8b 45 0c             	mov    0xc(%ebp),%eax
    6af5:	89 44 24 08          	mov    %eax,0x8(%esp)
    6af9:	c7 44 24 04 03 cf 00 	movl   $0xcf03,0x4(%esp)
    6b00:	00 
    6b01:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6b08:	e8 aa f3 ff ff       	call   5eb7 <printf>
		exit();
    6b0d:	e8 bd f1 ff ff       	call   5ccf <exit>
	}

	bs->format = BINARY;
    6b12:	8b 45 08             	mov    0x8(%ebp),%eax
    6b15:	c6 40 24 00          	movb   $0x0,0x24(%eax)
	alloc_buffer(bs, size);
    6b19:	8b 45 10             	mov    0x10(%ebp),%eax
    6b1c:	89 44 24 04          	mov    %eax,0x4(%esp)
    6b20:	8b 45 08             	mov    0x8(%ebp),%eax
    6b23:	89 04 24             	mov    %eax,(%esp)
    6b26:	e8 5f ff ff ff       	call   6a8a <alloc_buffer>
	bs->buf_byte_idx=0;
    6b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    6b2e:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
	bs->buf_bit_idx=0;
    6b35:	8b 45 08             	mov    0x8(%ebp),%eax
    6b38:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
	bs->totbit=0;
    6b3f:	8b 45 08             	mov    0x8(%ebp),%eax
    6b42:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	bs->mode = READ_MODE;
    6b49:	8b 45 08             	mov    0x8(%ebp),%eax
    6b4c:	c7 40 18 00 00 00 00 	movl   $0x0,0x18(%eax)
	bs->eob = FALSE;
    6b53:	8b 45 08             	mov    0x8(%ebp),%eax
    6b56:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
	bs->eobs = FALSE;
    6b5d:	8b 45 08             	mov    0x8(%ebp),%eax
    6b60:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
}
    6b67:	c9                   	leave  
    6b68:	c3                   	ret    

00006b69 <close_bit_stream_r>:

void close_bit_stream_r(Bit_stream_struc *bs)
{
    6b69:	55                   	push   %ebp
    6b6a:	89 e5                	mov    %esp,%ebp
    6b6c:	83 ec 18             	sub    $0x18,%esp
	close(bs->pt);
    6b6f:	8b 45 08             	mov    0x8(%ebp),%eax
    6b72:	8b 00                	mov    (%eax),%eax
    6b74:	89 04 24             	mov    %eax,(%esp)
    6b77:	e8 7b f1 ff ff       	call   5cf7 <close>
	desalloc_buffer(bs);
    6b7c:	8b 45 08             	mov    0x8(%ebp),%eax
    6b7f:	89 04 24             	mov    %eax,(%esp)
    6b82:	e8 2d ff ff ff       	call   6ab4 <desalloc_buffer>
}
    6b87:	c9                   	leave  
    6b88:	c3                   	ret    

00006b89 <end_bs>:

int end_bs(Bit_stream_struc *bs)
{
    6b89:	55                   	push   %ebp
    6b8a:	89 e5                	mov    %esp,%ebp
  return(bs->eobs);
    6b8c:	8b 45 08             	mov    0x8(%ebp),%eax
    6b8f:	8b 40 20             	mov    0x20(%eax),%eax
}
    6b92:	5d                   	pop    %ebp
    6b93:	c3                   	ret    

00006b94 <sstell>:


unsigned long sstell(Bit_stream_struc *bs)
{
    6b94:	55                   	push   %ebp
    6b95:	89 e5                	mov    %esp,%ebp
  return(bs->totbit);
    6b97:	8b 45 08             	mov    0x8(%ebp),%eax
    6b9a:	8b 40 0c             	mov    0xc(%eax),%eax
}
    6b9d:	5d                   	pop    %ebp
    6b9e:	c3                   	ret    

00006b9f <refill_buffer>:


void refill_buffer(Bit_stream_struc *bs)
{
    6b9f:	55                   	push   %ebp
    6ba0:	89 e5                	mov    %esp,%ebp
    6ba2:	56                   	push   %esi
    6ba3:	53                   	push   %ebx
    6ba4:	83 ec 10             	sub    $0x10,%esp
	register int i=bs->buf_size-2-bs->buf_byte_idx;
    6ba7:	8b 45 08             	mov    0x8(%ebp),%eax
    6baa:	8b 40 08             	mov    0x8(%eax),%eax
    6bad:	8d 50 fe             	lea    -0x2(%eax),%edx
    6bb0:	8b 45 08             	mov    0x8(%ebp),%eax
    6bb3:	8b 40 10             	mov    0x10(%eax),%eax
    6bb6:	89 d3                	mov    %edx,%ebx
    6bb8:	29 c3                	sub    %eax,%ebx
	register unsigned long n=1;
    6bba:	be 01 00 00 00       	mov    $0x1,%esi

	while ((i>=0) && (!bs->eob)) {
    6bbf:	eb 35                	jmp    6bf6 <refill_buffer+0x57>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
    6bc1:	8b 45 08             	mov    0x8(%ebp),%eax
    6bc4:	8b 50 04             	mov    0x4(%eax),%edx
    6bc7:	89 d8                	mov    %ebx,%eax
    6bc9:	8d 58 ff             	lea    -0x1(%eax),%ebx
    6bcc:	01 c2                	add    %eax,%edx
    6bce:	8b 45 08             	mov    0x8(%ebp),%eax
    6bd1:	8b 00                	mov    (%eax),%eax
    6bd3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    6bda:	00 
    6bdb:	89 54 24 04          	mov    %edx,0x4(%esp)
    6bdf:	89 04 24             	mov    %eax,(%esp)
    6be2:	e8 00 f1 ff ff       	call   5ce7 <read>
    6be7:	89 c6                	mov    %eax,%esi
		if (!n)
    6be9:	85 f6                	test   %esi,%esi
    6beb:	75 09                	jne    6bf6 <refill_buffer+0x57>
		bs->eob= i+1;
    6bed:	8d 53 01             	lea    0x1(%ebx),%edx
    6bf0:	8b 45 08             	mov    0x8(%ebp),%eax
    6bf3:	89 50 1c             	mov    %edx,0x1c(%eax)
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
    6bf6:	85 db                	test   %ebx,%ebx
    6bf8:	78 0a                	js     6c04 <refill_buffer+0x65>
    6bfa:	8b 45 08             	mov    0x8(%ebp),%eax
    6bfd:	8b 40 1c             	mov    0x1c(%eax),%eax
    6c00:	85 c0                	test   %eax,%eax
    6c02:	74 bd                	je     6bc1 <refill_buffer+0x22>
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}
    6c04:	83 c4 10             	add    $0x10,%esp
    6c07:	5b                   	pop    %ebx
    6c08:	5e                   	pop    %esi
    6c09:	5d                   	pop    %ebp
    6c0a:	c3                   	ret    

00006c0b <get1bit>:


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
{
    6c0b:	55                   	push   %ebp
    6c0c:	89 e5                	mov    %esp,%ebp
    6c0e:	53                   	push   %ebx
    6c0f:	83 ec 24             	sub    $0x24,%esp
   unsigned int bit;
   register int i;

   bs->totbit++;
    6c12:	8b 45 08             	mov    0x8(%ebp),%eax
    6c15:	8b 40 0c             	mov    0xc(%eax),%eax
    6c18:	8d 50 01             	lea    0x1(%eax),%edx
    6c1b:	8b 45 08             	mov    0x8(%ebp),%eax
    6c1e:	89 50 0c             	mov    %edx,0xc(%eax)

   if (!bs->buf_bit_idx) {
    6c21:	8b 45 08             	mov    0x8(%ebp),%eax
    6c24:	8b 40 14             	mov    0x14(%eax),%eax
    6c27:	85 c0                	test   %eax,%eax
    6c29:	0f 85 9f 00 00 00    	jne    6cce <get1bit+0xc3>
        bs->buf_bit_idx = 8;
    6c2f:	8b 45 08             	mov    0x8(%ebp),%eax
    6c32:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
        bs->buf_byte_idx--;
    6c39:	8b 45 08             	mov    0x8(%ebp),%eax
    6c3c:	8b 40 10             	mov    0x10(%eax),%eax
    6c3f:	8d 50 ff             	lea    -0x1(%eax),%edx
    6c42:	8b 45 08             	mov    0x8(%ebp),%eax
    6c45:	89 50 10             	mov    %edx,0x10(%eax)
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6c48:	8b 45 08             	mov    0x8(%ebp),%eax
    6c4b:	8b 40 10             	mov    0x10(%eax),%eax
    6c4e:	83 f8 03             	cmp    $0x3,%eax
    6c51:	7e 10                	jle    6c63 <get1bit+0x58>
    6c53:	8b 45 08             	mov    0x8(%ebp),%eax
    6c56:	8b 50 10             	mov    0x10(%eax),%edx
    6c59:	8b 45 08             	mov    0x8(%ebp),%eax
    6c5c:	8b 40 1c             	mov    0x1c(%eax),%eax
    6c5f:	39 c2                	cmp    %eax,%edx
    6c61:	7d 6b                	jge    6cce <get1bit+0xc3>
             if (bs->eob)
    6c63:	8b 45 08             	mov    0x8(%ebp),%eax
    6c66:	8b 40 1c             	mov    0x1c(%eax),%eax
    6c69:	85 c0                	test   %eax,%eax
    6c6b:	74 0c                	je     6c79 <get1bit+0x6e>
                bs->eobs = TRUE;
    6c6d:	8b 45 08             	mov    0x8(%ebp),%eax
    6c70:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6c77:	eb 55                	jmp    6cce <get1bit+0xc3>
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6c79:	8b 45 08             	mov    0x8(%ebp),%eax
    6c7c:	8b 58 10             	mov    0x10(%eax),%ebx
    6c7f:	eb 2f                	jmp    6cb0 <get1bit+0xa5>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    6c81:	8b 45 08             	mov    0x8(%ebp),%eax
    6c84:	8b 50 04             	mov    0x4(%eax),%edx
    6c87:	8b 45 08             	mov    0x8(%ebp),%eax
    6c8a:	8b 40 08             	mov    0x8(%eax),%eax
    6c8d:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6c90:	8b 45 08             	mov    0x8(%ebp),%eax
    6c93:	8b 40 10             	mov    0x10(%eax),%eax
    6c96:	29 c1                	sub    %eax,%ecx
    6c98:	89 c8                	mov    %ecx,%eax
    6c9a:	01 d8                	add    %ebx,%eax
    6c9c:	01 c2                	add    %eax,%edx
    6c9e:	8b 45 08             	mov    0x8(%ebp),%eax
    6ca1:	8b 48 04             	mov    0x4(%eax),%ecx
    6ca4:	89 d8                	mov    %ebx,%eax
    6ca6:	01 c8                	add    %ecx,%eax
    6ca8:	0f b6 00             	movzbl (%eax),%eax
    6cab:	88 02                	mov    %al,(%edx)
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
    6cad:	83 eb 01             	sub    $0x1,%ebx
    6cb0:	85 db                	test   %ebx,%ebx
    6cb2:	79 cd                	jns    6c81 <get1bit+0x76>
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
    6cb4:	8b 45 08             	mov    0x8(%ebp),%eax
    6cb7:	89 04 24             	mov    %eax,(%esp)
    6cba:	e8 e0 fe ff ff       	call   6b9f <refill_buffer>
                bs->buf_byte_idx = bs->buf_size-1;
    6cbf:	8b 45 08             	mov    0x8(%ebp),%eax
    6cc2:	8b 40 08             	mov    0x8(%eax),%eax
    6cc5:	8d 50 ff             	lea    -0x1(%eax),%edx
    6cc8:	8b 45 08             	mov    0x8(%ebp),%eax
    6ccb:	89 50 10             	mov    %edx,0x10(%eax)
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
    6cce:	8b 45 08             	mov    0x8(%ebp),%eax
    6cd1:	8b 50 04             	mov    0x4(%eax),%edx
    6cd4:	8b 45 08             	mov    0x8(%ebp),%eax
    6cd7:	8b 40 10             	mov    0x10(%eax),%eax
    6cda:	01 d0                	add    %edx,%eax
    6cdc:	0f b6 00             	movzbl (%eax),%eax
    6cdf:	0f b6 d0             	movzbl %al,%edx
    6ce2:	8b 45 08             	mov    0x8(%ebp),%eax
    6ce5:	8b 40 14             	mov    0x14(%eax),%eax
    6ce8:	83 e8 01             	sub    $0x1,%eax
    6ceb:	8b 04 85 60 10 01 00 	mov    0x11060(,%eax,4),%eax
    6cf2:	21 d0                	and    %edx,%eax
    6cf4:	89 45 f4             	mov    %eax,-0xc(%ebp)
   bit = bit >> (bs->buf_bit_idx-1);
    6cf7:	8b 45 08             	mov    0x8(%ebp),%eax
    6cfa:	8b 40 14             	mov    0x14(%eax),%eax
    6cfd:	83 e8 01             	sub    $0x1,%eax
    6d00:	89 c1                	mov    %eax,%ecx
    6d02:	d3 6d f4             	shrl   %cl,-0xc(%ebp)
   bs->buf_bit_idx--;
    6d05:	8b 45 08             	mov    0x8(%ebp),%eax
    6d08:	8b 40 14             	mov    0x14(%eax),%eax
    6d0b:	8d 50 ff             	lea    -0x1(%eax),%edx
    6d0e:	8b 45 08             	mov    0x8(%ebp),%eax
    6d11:	89 50 14             	mov    %edx,0x14(%eax)
   return(bit);
    6d14:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    6d17:	83 c4 24             	add    $0x24,%esp
    6d1a:	5b                   	pop    %ebx
    6d1b:	5d                   	pop    %ebp
    6d1c:	c3                   	ret    

00006d1d <getbits>:

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struc *bs, int N)
{
    6d1d:	55                   	push   %ebp
    6d1e:	89 e5                	mov    %esp,%ebp
    6d20:	57                   	push   %edi
    6d21:	56                   	push   %esi
    6d22:	53                   	push   %ebx
    6d23:	83 ec 2c             	sub    $0x2c,%esp
	unsigned long val=0;
    6d26:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	register int i;
	register int j = N;
    6d2d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	register int k, tmp;

	if (N > MAX_LENGTH)
    6d30:	83 7d 0c 20          	cmpl   $0x20,0xc(%ebp)
    6d34:	7e 1c                	jle    6d52 <getbits+0x35>
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);
    6d36:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    6d3d:	00 
    6d3e:	c7 44 24 04 1c cf 00 	movl   $0xcf1c,0x4(%esp)
    6d45:	00 
    6d46:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6d4d:	e8 65 f1 ff ff       	call   5eb7 <printf>

	bs->totbit += N;
    6d52:	8b 45 08             	mov    0x8(%ebp),%eax
    6d55:	8b 50 0c             	mov    0xc(%eax),%edx
    6d58:	8b 45 0c             	mov    0xc(%ebp),%eax
    6d5b:	01 c2                	add    %eax,%edx
    6d5d:	8b 45 08             	mov    0x8(%ebp),%eax
    6d60:	89 50 0c             	mov    %edx,0xc(%eax)
	while (j > 0) {
    6d63:	e9 0a 01 00 00       	jmp    6e72 <getbits+0x155>
		if (!bs->buf_bit_idx) {
    6d68:	8b 45 08             	mov    0x8(%ebp),%eax
    6d6b:	8b 40 14             	mov    0x14(%eax),%eax
    6d6e:	85 c0                	test   %eax,%eax
    6d70:	0f 85 9f 00 00 00    	jne    6e15 <getbits+0xf8>
			bs->buf_bit_idx = 8;
    6d76:	8b 45 08             	mov    0x8(%ebp),%eax
    6d79:	c7 40 14 08 00 00 00 	movl   $0x8,0x14(%eax)
			bs->buf_byte_idx--;
    6d80:	8b 45 08             	mov    0x8(%ebp),%eax
    6d83:	8b 40 10             	mov    0x10(%eax),%eax
    6d86:	8d 50 ff             	lea    -0x1(%eax),%edx
    6d89:	8b 45 08             	mov    0x8(%ebp),%eax
    6d8c:	89 50 10             	mov    %edx,0x10(%eax)
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
    6d8f:	8b 45 08             	mov    0x8(%ebp),%eax
    6d92:	8b 40 10             	mov    0x10(%eax),%eax
    6d95:	83 f8 03             	cmp    $0x3,%eax
    6d98:	7e 10                	jle    6daa <getbits+0x8d>
    6d9a:	8b 45 08             	mov    0x8(%ebp),%eax
    6d9d:	8b 50 10             	mov    0x10(%eax),%edx
    6da0:	8b 45 08             	mov    0x8(%ebp),%eax
    6da3:	8b 40 1c             	mov    0x1c(%eax),%eax
    6da6:	39 c2                	cmp    %eax,%edx
    6da8:	7d 6b                	jge    6e15 <getbits+0xf8>
				if (bs->eob)
    6daa:	8b 45 08             	mov    0x8(%ebp),%eax
    6dad:	8b 40 1c             	mov    0x1c(%eax),%eax
    6db0:	85 c0                	test   %eax,%eax
    6db2:	74 0c                	je     6dc0 <getbits+0xa3>
					bs->eobs = TRUE;
    6db4:	8b 45 08             	mov    0x8(%ebp),%eax
    6db7:	c7 40 20 01 00 00 00 	movl   $0x1,0x20(%eax)
    6dbe:	eb 55                	jmp    6e15 <getbits+0xf8>
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    6dc0:	8b 45 08             	mov    0x8(%ebp),%eax
    6dc3:	8b 70 10             	mov    0x10(%eax),%esi
    6dc6:	eb 2f                	jmp    6df7 <getbits+0xda>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
    6dc8:	8b 45 08             	mov    0x8(%ebp),%eax
    6dcb:	8b 50 04             	mov    0x4(%eax),%edx
    6dce:	8b 45 08             	mov    0x8(%ebp),%eax
    6dd1:	8b 40 08             	mov    0x8(%eax),%eax
    6dd4:	8d 48 ff             	lea    -0x1(%eax),%ecx
    6dd7:	8b 45 08             	mov    0x8(%ebp),%eax
    6dda:	8b 40 10             	mov    0x10(%eax),%eax
    6ddd:	29 c1                	sub    %eax,%ecx
    6ddf:	89 c8                	mov    %ecx,%eax
    6de1:	01 f0                	add    %esi,%eax
    6de3:	01 c2                	add    %eax,%edx
    6de5:	8b 45 08             	mov    0x8(%ebp),%eax
    6de8:	8b 48 04             	mov    0x4(%eax),%ecx
    6deb:	89 f0                	mov    %esi,%eax
    6ded:	01 c8                	add    %ecx,%eax
    6def:	0f b6 00             	movzbl (%eax),%eax
    6df2:	88 02                	mov    %al,(%edx)
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
    6df4:	83 ee 01             	sub    $0x1,%esi
    6df7:	85 f6                	test   %esi,%esi
    6df9:	79 cd                	jns    6dc8 <getbits+0xab>
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
    6dfb:	8b 45 08             	mov    0x8(%ebp),%eax
    6dfe:	89 04 24             	mov    %eax,(%esp)
    6e01:	e8 99 fd ff ff       	call   6b9f <refill_buffer>
					bs->buf_byte_idx = bs->buf_size-1;
    6e06:	8b 45 08             	mov    0x8(%ebp),%eax
    6e09:	8b 40 08             	mov    0x8(%eax),%eax
    6e0c:	8d 50 ff             	lea    -0x1(%eax),%edx
    6e0f:	8b 45 08             	mov    0x8(%ebp),%eax
    6e12:	89 50 10             	mov    %edx,0x10(%eax)
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
    6e15:	8b 45 08             	mov    0x8(%ebp),%eax
    6e18:	8b 40 14             	mov    0x14(%eax),%eax
    6e1b:	39 d8                	cmp    %ebx,%eax
    6e1d:	0f 4f c3             	cmovg  %ebx,%eax
    6e20:	89 c6                	mov    %eax,%esi
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
    6e22:	8b 45 08             	mov    0x8(%ebp),%eax
    6e25:	8b 50 04             	mov    0x4(%eax),%edx
    6e28:	8b 45 08             	mov    0x8(%ebp),%eax
    6e2b:	8b 40 10             	mov    0x10(%eax),%eax
    6e2e:	01 d0                	add    %edx,%eax
    6e30:	0f b6 00             	movzbl (%eax),%eax
    6e33:	0f b6 d0             	movzbl %al,%edx
    6e36:	8b 45 08             	mov    0x8(%ebp),%eax
    6e39:	8b 40 14             	mov    0x14(%eax),%eax
    6e3c:	8b 04 85 80 10 01 00 	mov    0x11080(,%eax,4),%eax
    6e43:	89 d7                	mov    %edx,%edi
    6e45:	21 c7                	and    %eax,%edi
		tmp = tmp >> (bs->buf_bit_idx-k);
    6e47:	8b 45 08             	mov    0x8(%ebp),%eax
    6e4a:	8b 40 14             	mov    0x14(%eax),%eax
    6e4d:	29 f0                	sub    %esi,%eax
    6e4f:	89 c1                	mov    %eax,%ecx
    6e51:	d3 ff                	sar    %cl,%edi
		val |= tmp << (j-k);
    6e53:	89 d8                	mov    %ebx,%eax
    6e55:	29 f0                	sub    %esi,%eax
    6e57:	89 c1                	mov    %eax,%ecx
    6e59:	d3 e7                	shl    %cl,%edi
    6e5b:	89 f8                	mov    %edi,%eax
    6e5d:	09 45 e4             	or     %eax,-0x1c(%ebp)
		bs->buf_bit_idx -= k;
    6e60:	8b 45 08             	mov    0x8(%ebp),%eax
    6e63:	8b 40 14             	mov    0x14(%eax),%eax
    6e66:	29 f0                	sub    %esi,%eax
    6e68:	89 c2                	mov    %eax,%edx
    6e6a:	8b 45 08             	mov    0x8(%ebp),%eax
    6e6d:	89 50 14             	mov    %edx,0x14(%eax)
		j -= k;
    6e70:	29 f3                	sub    %esi,%ebx

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
    6e72:	85 db                	test   %ebx,%ebx
    6e74:	0f 8f ee fe ff ff    	jg     6d68 <getbits+0x4b>
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
    6e7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    6e7d:	83 c4 2c             	add    $0x2c,%esp
    6e80:	5b                   	pop    %ebx
    6e81:	5e                   	pop    %esi
    6e82:	5f                   	pop    %edi
    6e83:	5d                   	pop    %ebp
    6e84:	c3                   	ret    

00006e85 <seek_sync>:


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
    6e85:	55                   	push   %ebp
    6e86:	89 e5                	mov    %esp,%ebp
    6e88:	83 ec 38             	sub    $0x38,%esp
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;
    6e8b:	db 45 10             	fildl  0x10(%ebp)
    6e8e:	dd 5c 24 08          	fstpl  0x8(%esp)
    6e92:	dd 05 88 cf 00 00    	fldl   0xcf88
    6e98:	dd 1c 24             	fstpl  (%esp)
    6e9b:	e8 ec f4 ff ff       	call   638c <pow>
    6ea0:	d9 7d e6             	fnstcw -0x1a(%ebp)
    6ea3:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    6ea7:	b4 0c                	mov    $0xc,%ah
    6ea9:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    6ead:	d9 6d e4             	fldcw  -0x1c(%ebp)
    6eb0:	db 5d e0             	fistpl -0x20(%ebp)
    6eb3:	d9 6d e6             	fldcw  -0x1a(%ebp)
    6eb6:	8b 45 e0             	mov    -0x20(%ebp),%eax
    6eb9:	83 e8 01             	sub    $0x1,%eax
    6ebc:	89 45 f0             	mov    %eax,-0x10(%ebp)

	aligning = sstell(bs)%ALIGNING;
    6ebf:	8b 45 08             	mov    0x8(%ebp),%eax
    6ec2:	89 04 24             	mov    %eax,(%esp)
    6ec5:	e8 ca fc ff ff       	call   6b94 <sstell>
    6eca:	83 e0 07             	and    $0x7,%eax
    6ecd:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (aligning)
    6ed0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    6ed4:	74 17                	je     6eed <seek_sync+0x68>
		getbits(bs, (int)(ALIGNING-aligning));
    6ed6:	b8 08 00 00 00       	mov    $0x8,%eax
    6edb:	2b 45 ec             	sub    -0x14(%ebp),%eax
    6ede:	89 44 24 04          	mov    %eax,0x4(%esp)
    6ee2:	8b 45 08             	mov    0x8(%ebp),%eax
    6ee5:	89 04 24             	mov    %eax,(%esp)
    6ee8:	e8 30 fe ff ff       	call   6d1d <getbits>

	val = getbits(bs, N);
    6eed:	8b 45 10             	mov    0x10(%ebp),%eax
    6ef0:	89 44 24 04          	mov    %eax,0x4(%esp)
    6ef4:	8b 45 08             	mov    0x8(%ebp),%eax
    6ef7:	89 04 24             	mov    %eax,(%esp)
    6efa:	e8 1e fe ff ff       	call   6d1d <getbits>
    6eff:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6f02:	eb 1a                	jmp    6f1e <seek_sync+0x99>
		val <<= ALIGNING;
    6f04:	c1 65 f4 08          	shll   $0x8,-0xc(%ebp)
		val |= getbits(bs, ALIGNING);
    6f08:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    6f0f:	00 
    6f10:	8b 45 08             	mov    0x8(%ebp),%eax
    6f13:	89 04 24             	mov    %eax,(%esp)
    6f16:	e8 02 fe ff ff       	call   6d1d <getbits>
    6f1b:	09 45 f4             	or     %eax,-0xc(%ebp)
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
    6f1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    6f21:	23 45 f4             	and    -0xc(%ebp),%eax
    6f24:	3b 45 0c             	cmp    0xc(%ebp),%eax
    6f27:	74 0f                	je     6f38 <seek_sync+0xb3>
    6f29:	8b 45 08             	mov    0x8(%ebp),%eax
    6f2c:	89 04 24             	mov    %eax,(%esp)
    6f2f:	e8 55 fc ff ff       	call   6b89 <end_bs>
    6f34:	85 c0                	test   %eax,%eax
    6f36:	74 cc                	je     6f04 <seek_sync+0x7f>
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
    6f38:	8b 45 08             	mov    0x8(%ebp),%eax
    6f3b:	89 04 24             	mov    %eax,(%esp)
    6f3e:	e8 46 fc ff ff       	call   6b89 <end_bs>
    6f43:	85 c0                	test   %eax,%eax
    6f45:	74 07                	je     6f4e <seek_sync+0xc9>
		return(0);
    6f47:	b8 00 00 00 00       	mov    $0x0,%eax
    6f4c:	eb 05                	jmp    6f53 <seek_sync+0xce>
	else
		return(1);
    6f4e:	b8 01 00 00 00       	mov    $0x1,%eax
}
    6f53:	c9                   	leave  
    6f54:	c3                   	ret    

00006f55 <js_bound>:

int js_bound(int lay, int m_ext)
{
    6f55:	55                   	push   %ebp
    6f56:	89 e5                	mov    %esp,%ebp
    6f58:	83 ec 18             	sub    $0x18,%esp
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    6f5b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    6f5f:	7e 12                	jle    6f73 <js_bound+0x1e>
    6f61:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
    6f65:	7f 0c                	jg     6f73 <js_bound+0x1e>
    6f67:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    6f6b:	78 06                	js     6f73 <js_bound+0x1e>
    6f6d:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
    6f71:	7e 27                	jle    6f9a <js_bound+0x45>
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
    6f73:	8b 45 0c             	mov    0xc(%ebp),%eax
    6f76:	89 44 24 0c          	mov    %eax,0xc(%esp)
    6f7a:	8b 45 08             	mov    0x8(%ebp),%eax
    6f7d:	89 44 24 08          	mov    %eax,0x8(%esp)
    6f81:	c7 44 24 04 50 cf 00 	movl   $0xcf50,0x4(%esp)
    6f88:	00 
    6f89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    6f90:	e8 22 ef ff ff       	call   5eb7 <printf>
        exit();
    6f95:	e8 35 ed ff ff       	call   5ccf <exit>
    }
	return(jsb_table[lay-1][m_ext]);
    6f9a:	8b 45 08             	mov    0x8(%ebp),%eax
    6f9d:	83 e8 01             	sub    $0x1,%eax
    6fa0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    6fa7:	8b 45 0c             	mov    0xc(%ebp),%eax
    6faa:	01 d0                	add    %edx,%eax
    6fac:	8b 04 85 c0 10 01 00 	mov    0x110c0(,%eax,4),%eax
}
    6fb3:	c9                   	leave  
    6fb4:	c3                   	ret    

00006fb5 <hdr_to_frps>:

void hdr_to_frps(struct frame_params *fr_ps)
{
    6fb5:	55                   	push   %ebp
    6fb6:	89 e5                	mov    %esp,%ebp
    6fb8:	83 ec 28             	sub    $0x28,%esp
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
    6fbb:	8b 45 08             	mov    0x8(%ebp),%eax
    6fbe:	8b 00                	mov    (%eax),%eax
    6fc0:	89 45 f4             	mov    %eax,-0xc(%ebp)

	fr_ps->actual_mode = hdr->mode;
    6fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fc6:	8b 50 1c             	mov    0x1c(%eax),%edx
    6fc9:	8b 45 08             	mov    0x8(%ebp),%eax
    6fcc:	89 50 04             	mov    %edx,0x4(%eax)
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
    6fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6fd2:	8b 40 1c             	mov    0x1c(%eax),%eax
    6fd5:	83 f8 03             	cmp    $0x3,%eax
    6fd8:	75 07                	jne    6fe1 <hdr_to_frps+0x2c>
    6fda:	b8 01 00 00 00       	mov    $0x1,%eax
    6fdf:	eb 05                	jmp    6fe6 <hdr_to_frps+0x31>
    6fe1:	b8 02 00 00 00       	mov    $0x2,%eax
    6fe6:	8b 55 08             	mov    0x8(%ebp),%edx
    6fe9:	89 42 08             	mov    %eax,0x8(%edx)
	fr_ps->sblimit = SBLIMIT;
    6fec:	8b 45 08             	mov    0x8(%ebp),%eax
    6fef:	c7 40 10 20 00 00 00 	movl   $0x20,0x10(%eax)
	if(hdr->mode == MPG_MD_JOINT_STEREO)
    6ff6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    6ff9:	8b 40 1c             	mov    0x1c(%eax),%eax
    6ffc:	83 f8 01             	cmp    $0x1,%eax
    6fff:	75 20                	jne    7021 <hdr_to_frps+0x6c>
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
    7001:	8b 45 f4             	mov    -0xc(%ebp),%eax
    7004:	8b 50 20             	mov    0x20(%eax),%edx
    7007:	8b 45 f4             	mov    -0xc(%ebp),%eax
    700a:	8b 40 04             	mov    0x4(%eax),%eax
    700d:	89 54 24 04          	mov    %edx,0x4(%esp)
    7011:	89 04 24             	mov    %eax,(%esp)
    7014:	e8 3c ff ff ff       	call   6f55 <js_bound>
    7019:	8b 55 08             	mov    0x8(%ebp),%edx
    701c:	89 42 0c             	mov    %eax,0xc(%edx)
    701f:	eb 0c                	jmp    702d <hdr_to_frps+0x78>
	else
		fr_ps->jsbound = fr_ps->sblimit;
    7021:	8b 45 08             	mov    0x8(%ebp),%eax
    7024:	8b 50 10             	mov    0x10(%eax),%edx
    7027:	8b 45 08             	mov    0x8(%ebp),%eax
    702a:	89 50 0c             	mov    %edx,0xc(%eax)
}
    702d:	c9                   	leave  
    702e:	c3                   	ret    

0000702f <hputbuf>:

void hputbuf(unsigned int val, int N)
{
    702f:	55                   	push   %ebp
    7030:	89 e5                	mov    %esp,%ebp
    7032:	83 ec 18             	sub    $0x18,%esp
	if (N != 8) {
    7035:	83 7d 0c 08          	cmpl   $0x8,0xc(%ebp)
    7039:	74 19                	je     7054 <hputbuf+0x25>
		printf(0,"Not Supported yet!!\n");
    703b:	c7 44 24 04 73 cf 00 	movl   $0xcf73,0x4(%esp)
    7042:	00 
    7043:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    704a:	e8 68 ee ff ff       	call   5eb7 <printf>
		exit();
    704f:	e8 7b ec ff ff       	call   5ccf <exit>
	}
	getCoreBuf(1, val);
    7054:	8b 45 08             	mov    0x8(%ebp),%eax
    7057:	89 44 24 04          	mov    %eax,0x4(%esp)
    705b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    7062:	e8 68 ed ff ff       	call   5dcf <getCoreBuf>
//	buf[offset % BUFSIZE] = val;
//	offset++;
}
    7067:	c9                   	leave  
    7068:	c3                   	ret    

00007069 <hsstell>:

unsigned long hsstell()
{
    7069:	55                   	push   %ebp
    706a:	89 e5                	mov    %esp,%ebp
    706c:	83 ec 18             	sub    $0x18,%esp
	return getCoreBuf(2, 0);
    706f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    7076:	00 
    7077:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    707e:	e8 4c ed ff ff       	call   5dcf <getCoreBuf>
//	return(totbit);
}
    7083:	c9                   	leave  
    7084:	c3                   	ret    

00007085 <hgetbits>:

unsigned long hgetbits(int N)
{
    7085:	55                   	push   %ebp
    7086:	89 e5                	mov    %esp,%ebp
    7088:	83 ec 18             	sub    $0x18,%esp

	return getCoreBuf(3, N);
    708b:	8b 45 08             	mov    0x8(%ebp),%eax
    708e:	89 44 24 04          	mov    %eax,0x4(%esp)
    7092:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    7099:	e8 31 ed ff ff       	call   5dcf <getCoreBuf>
}
    709e:	c9                   	leave  
    709f:	c3                   	ret    

000070a0 <hget1bit>:


unsigned int hget1bit()
{
    70a0:	55                   	push   %ebp
    70a1:	89 e5                	mov    %esp,%ebp
    70a3:	83 ec 18             	sub    $0x18,%esp
	return(hgetbits(1));
    70a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    70ad:	e8 d3 ff ff ff       	call   7085 <hgetbits>
}
    70b2:	c9                   	leave  
    70b3:	c3                   	ret    

000070b4 <rewindNbits>:


void rewindNbits(int N)
{
    70b4:	55                   	push   %ebp
    70b5:	89 e5                	mov    %esp,%ebp
    70b7:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(4, N);
    70ba:	8b 45 08             	mov    0x8(%ebp),%eax
    70bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    70c1:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    70c8:	e8 02 ed ff ff       	call   5dcf <getCoreBuf>
}
    70cd:	c9                   	leave  
    70ce:	c3                   	ret    

000070cf <rewindNbytes>:


void rewindNbytes(int N)
{
    70cf:	55                   	push   %ebp
    70d0:	89 e5                	mov    %esp,%ebp
    70d2:	83 ec 18             	sub    $0x18,%esp
	getCoreBuf(5, N);
    70d5:	8b 45 08             	mov    0x8(%ebp),%eax
    70d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    70dc:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    70e3:	e8 e7 ec ff ff       	call   5dcf <getCoreBuf>
}
    70e8:	c9                   	leave  
    70e9:	c3                   	ret    

000070ea <read_decoder_table>:
				/* 0..31 Huffman code table 0..31	*/
				/* 32,33 count1-tables			*/

/* ��ȡ huffman ����� */
void read_decoder_table() 
{
    70ea:	55                   	push   %ebp
    70eb:	89 e5                	mov    %esp,%ebp
    70ed:	57                   	push   %edi
    70ee:	56                   	push   %esi
    70ef:	53                   	push   %ebx
    70f0:	81 ec 40 1b 00 00    	sub    $0x1b40,%esp
	unsigned char h1[7][2] = {{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11}};
    70f6:	c6 45 e6 02          	movb   $0x2,-0x1a(%ebp)
    70fa:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
    70fe:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
    7102:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    7106:	c6 45 ea 02          	movb   $0x2,-0x16(%ebp)
    710a:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
    710e:	c6 45 ec 00          	movb   $0x0,-0x14(%ebp)
    7112:	c6 45 ed 10          	movb   $0x10,-0x13(%ebp)
    7116:	c6 45 ee 02          	movb   $0x2,-0x12(%ebp)
    711a:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
    711e:	c6 45 f0 00          	movb   $0x0,-0x10(%ebp)
    7122:	c6 45 f1 01          	movb   $0x1,-0xf(%ebp)
    7126:	c6 45 f2 00          	movb   $0x0,-0xe(%ebp)
    712a:	c6 45 f3 11          	movb   $0x11,-0xd(%ebp)

	unsigned char h2[17][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    712e:	c6 45 c4 02          	movb   $0x2,-0x3c(%ebp)
    7132:	c6 45 c5 01          	movb   $0x1,-0x3b(%ebp)
    7136:	c6 45 c6 00          	movb   $0x0,-0x3a(%ebp)
    713a:	c6 45 c7 00          	movb   $0x0,-0x39(%ebp)
    713e:	c6 45 c8 04          	movb   $0x4,-0x38(%ebp)
    7142:	c6 45 c9 01          	movb   $0x1,-0x37(%ebp)
    7146:	c6 45 ca 02          	movb   $0x2,-0x36(%ebp)
    714a:	c6 45 cb 01          	movb   $0x1,-0x35(%ebp)
    714e:	c6 45 cc 00          	movb   $0x0,-0x34(%ebp)
    7152:	c6 45 cd 10          	movb   $0x10,-0x33(%ebp)
    7156:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
    715a:	c6 45 cf 01          	movb   $0x1,-0x31(%ebp)
    715e:	c6 45 d0 02          	movb   $0x2,-0x30(%ebp)
    7162:	c6 45 d1 01          	movb   $0x1,-0x2f(%ebp)
    7166:	c6 45 d2 00          	movb   $0x0,-0x2e(%ebp)
    716a:	c6 45 d3 11          	movb   $0x11,-0x2d(%ebp)
    716e:	c6 45 d4 04          	movb   $0x4,-0x2c(%ebp)
    7172:	c6 45 d5 01          	movb   $0x1,-0x2b(%ebp)
    7176:	c6 45 d6 02          	movb   $0x2,-0x2a(%ebp)
    717a:	c6 45 d7 01          	movb   $0x1,-0x29(%ebp)
    717e:	c6 45 d8 00          	movb   $0x0,-0x28(%ebp)
    7182:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
    7186:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
    718a:	c6 45 db 21          	movb   $0x21,-0x25(%ebp)
    718e:	c6 45 dc 02          	movb   $0x2,-0x24(%ebp)
    7192:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
    7196:	c6 45 de 00          	movb   $0x0,-0x22(%ebp)
    719a:	c6 45 df 12          	movb   $0x12,-0x21(%ebp)
    719e:	c6 45 e0 02          	movb   $0x2,-0x20(%ebp)
    71a2:	c6 45 e1 01          	movb   $0x1,-0x1f(%ebp)
    71a6:	c6 45 e2 00          	movb   $0x0,-0x1e(%ebp)
    71aa:	c6 45 e3 02          	movb   $0x2,-0x1d(%ebp)
    71ae:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
    71b2:	c6 45 e5 22          	movb   $0x22,-0x1b(%ebp)

	unsigned char h3[17][2] = {{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x10},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22}};
    71b6:	c6 45 a2 04          	movb   $0x4,-0x5e(%ebp)
    71ba:	c6 45 a3 01          	movb   $0x1,-0x5d(%ebp)
    71be:	c6 45 a4 02          	movb   $0x2,-0x5c(%ebp)
    71c2:	c6 45 a5 01          	movb   $0x1,-0x5b(%ebp)
    71c6:	c6 45 a6 00          	movb   $0x0,-0x5a(%ebp)
    71ca:	c6 45 a7 00          	movb   $0x0,-0x59(%ebp)
    71ce:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
    71d2:	c6 45 a9 01          	movb   $0x1,-0x57(%ebp)
    71d6:	c6 45 aa 02          	movb   $0x2,-0x56(%ebp)
    71da:	c6 45 ab 01          	movb   $0x1,-0x55(%ebp)
    71de:	c6 45 ac 00          	movb   $0x0,-0x54(%ebp)
    71e2:	c6 45 ad 11          	movb   $0x11,-0x53(%ebp)
    71e6:	c6 45 ae 02          	movb   $0x2,-0x52(%ebp)
    71ea:	c6 45 af 01          	movb   $0x1,-0x51(%ebp)
    71ee:	c6 45 b0 00          	movb   $0x0,-0x50(%ebp)
    71f2:	c6 45 b1 10          	movb   $0x10,-0x4f(%ebp)
    71f6:	c6 45 b2 04          	movb   $0x4,-0x4e(%ebp)
    71fa:	c6 45 b3 01          	movb   $0x1,-0x4d(%ebp)
    71fe:	c6 45 b4 02          	movb   $0x2,-0x4c(%ebp)
    7202:	c6 45 b5 01          	movb   $0x1,-0x4b(%ebp)
    7206:	c6 45 b6 00          	movb   $0x0,-0x4a(%ebp)
    720a:	c6 45 b7 20          	movb   $0x20,-0x49(%ebp)
    720e:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
    7212:	c6 45 b9 21          	movb   $0x21,-0x47(%ebp)
    7216:	c6 45 ba 02          	movb   $0x2,-0x46(%ebp)
    721a:	c6 45 bb 01          	movb   $0x1,-0x45(%ebp)
    721e:	c6 45 bc 00          	movb   $0x0,-0x44(%ebp)
    7222:	c6 45 bd 12          	movb   $0x12,-0x43(%ebp)
    7226:	c6 45 be 02          	movb   $0x2,-0x42(%ebp)
    722a:	c6 45 bf 01          	movb   $0x1,-0x41(%ebp)
    722e:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
    7232:	c6 45 c1 02          	movb   $0x2,-0x3f(%ebp)
    7236:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
    723a:	c6 45 c3 22          	movb   $0x22,-0x3d(%ebp)

	unsigned char h5[31][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x13},{0x2,0x1},{0x0,0x31},{0x2,0x1},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x33}};
    723e:	c6 85 64 ff ff ff 02 	movb   $0x2,-0x9c(%ebp)
    7245:	c6 85 65 ff ff ff 01 	movb   $0x1,-0x9b(%ebp)
    724c:	c6 85 66 ff ff ff 00 	movb   $0x0,-0x9a(%ebp)
    7253:	c6 85 67 ff ff ff 00 	movb   $0x0,-0x99(%ebp)
    725a:	c6 85 68 ff ff ff 04 	movb   $0x4,-0x98(%ebp)
    7261:	c6 85 69 ff ff ff 01 	movb   $0x1,-0x97(%ebp)
    7268:	c6 85 6a ff ff ff 02 	movb   $0x2,-0x96(%ebp)
    726f:	c6 85 6b ff ff ff 01 	movb   $0x1,-0x95(%ebp)
    7276:	c6 85 6c ff ff ff 00 	movb   $0x0,-0x94(%ebp)
    727d:	c6 85 6d ff ff ff 10 	movb   $0x10,-0x93(%ebp)
    7284:	c6 85 6e ff ff ff 00 	movb   $0x0,-0x92(%ebp)
    728b:	c6 85 6f ff ff ff 01 	movb   $0x1,-0x91(%ebp)
    7292:	c6 85 70 ff ff ff 02 	movb   $0x2,-0x90(%ebp)
    7299:	c6 85 71 ff ff ff 01 	movb   $0x1,-0x8f(%ebp)
    72a0:	c6 85 72 ff ff ff 00 	movb   $0x0,-0x8e(%ebp)
    72a7:	c6 85 73 ff ff ff 11 	movb   $0x11,-0x8d(%ebp)
    72ae:	c6 85 74 ff ff ff 08 	movb   $0x8,-0x8c(%ebp)
    72b5:	c6 85 75 ff ff ff 01 	movb   $0x1,-0x8b(%ebp)
    72bc:	c6 85 76 ff ff ff 04 	movb   $0x4,-0x8a(%ebp)
    72c3:	c6 85 77 ff ff ff 01 	movb   $0x1,-0x89(%ebp)
    72ca:	c6 85 78 ff ff ff 02 	movb   $0x2,-0x88(%ebp)
    72d1:	c6 85 79 ff ff ff 01 	movb   $0x1,-0x87(%ebp)
    72d8:	c6 85 7a ff ff ff 00 	movb   $0x0,-0x86(%ebp)
    72df:	c6 85 7b ff ff ff 20 	movb   $0x20,-0x85(%ebp)
    72e6:	c6 85 7c ff ff ff 00 	movb   $0x0,-0x84(%ebp)
    72ed:	c6 85 7d ff ff ff 02 	movb   $0x2,-0x83(%ebp)
    72f4:	c6 85 7e ff ff ff 02 	movb   $0x2,-0x82(%ebp)
    72fb:	c6 85 7f ff ff ff 01 	movb   $0x1,-0x81(%ebp)
    7302:	c6 45 80 00          	movb   $0x0,-0x80(%ebp)
    7306:	c6 45 81 21          	movb   $0x21,-0x7f(%ebp)
    730a:	c6 45 82 00          	movb   $0x0,-0x7e(%ebp)
    730e:	c6 45 83 12          	movb   $0x12,-0x7d(%ebp)
    7312:	c6 45 84 08          	movb   $0x8,-0x7c(%ebp)
    7316:	c6 45 85 01          	movb   $0x1,-0x7b(%ebp)
    731a:	c6 45 86 04          	movb   $0x4,-0x7a(%ebp)
    731e:	c6 45 87 01          	movb   $0x1,-0x79(%ebp)
    7322:	c6 45 88 02          	movb   $0x2,-0x78(%ebp)
    7326:	c6 45 89 01          	movb   $0x1,-0x77(%ebp)
    732a:	c6 45 8a 00          	movb   $0x0,-0x76(%ebp)
    732e:	c6 45 8b 22          	movb   $0x22,-0x75(%ebp)
    7332:	c6 45 8c 00          	movb   $0x0,-0x74(%ebp)
    7336:	c6 45 8d 30          	movb   $0x30,-0x73(%ebp)
    733a:	c6 45 8e 02          	movb   $0x2,-0x72(%ebp)
    733e:	c6 45 8f 01          	movb   $0x1,-0x71(%ebp)
    7342:	c6 45 90 00          	movb   $0x0,-0x70(%ebp)
    7346:	c6 45 91 03          	movb   $0x3,-0x6f(%ebp)
    734a:	c6 45 92 00          	movb   $0x0,-0x6e(%ebp)
    734e:	c6 45 93 13          	movb   $0x13,-0x6d(%ebp)
    7352:	c6 45 94 02          	movb   $0x2,-0x6c(%ebp)
    7356:	c6 45 95 01          	movb   $0x1,-0x6b(%ebp)
    735a:	c6 45 96 00          	movb   $0x0,-0x6a(%ebp)
    735e:	c6 45 97 31          	movb   $0x31,-0x69(%ebp)
    7362:	c6 45 98 02          	movb   $0x2,-0x68(%ebp)
    7366:	c6 45 99 01          	movb   $0x1,-0x67(%ebp)
    736a:	c6 45 9a 00          	movb   $0x0,-0x66(%ebp)
    736e:	c6 45 9b 32          	movb   $0x32,-0x65(%ebp)
    7372:	c6 45 9c 02          	movb   $0x2,-0x64(%ebp)
    7376:	c6 45 9d 01          	movb   $0x1,-0x63(%ebp)
    737a:	c6 45 9e 00          	movb   $0x0,-0x62(%ebp)
    737e:	c6 45 9f 23          	movb   $0x23,-0x61(%ebp)
    7382:	c6 45 a0 00          	movb   $0x0,-0x60(%ebp)
    7386:	c6 45 a1 33          	movb   $0x33,-0x5f(%ebp)

	unsigned char h6[31][2] = {{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x0,0x11},{0x6,0x1},{0x2,0x1},{0x0,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x2,0x1},{0x0,0x3},{0x0,0x33}};
    738a:	c6 85 26 ff ff ff 06 	movb   $0x6,-0xda(%ebp)
    7391:	c6 85 27 ff ff ff 01 	movb   $0x1,-0xd9(%ebp)
    7398:	c6 85 28 ff ff ff 04 	movb   $0x4,-0xd8(%ebp)
    739f:	c6 85 29 ff ff ff 01 	movb   $0x1,-0xd7(%ebp)
    73a6:	c6 85 2a ff ff ff 02 	movb   $0x2,-0xd6(%ebp)
    73ad:	c6 85 2b ff ff ff 01 	movb   $0x1,-0xd5(%ebp)
    73b4:	c6 85 2c ff ff ff 00 	movb   $0x0,-0xd4(%ebp)
    73bb:	c6 85 2d ff ff ff 00 	movb   $0x0,-0xd3(%ebp)
    73c2:	c6 85 2e ff ff ff 00 	movb   $0x0,-0xd2(%ebp)
    73c9:	c6 85 2f ff ff ff 10 	movb   $0x10,-0xd1(%ebp)
    73d0:	c6 85 30 ff ff ff 00 	movb   $0x0,-0xd0(%ebp)
    73d7:	c6 85 31 ff ff ff 11 	movb   $0x11,-0xcf(%ebp)
    73de:	c6 85 32 ff ff ff 06 	movb   $0x6,-0xce(%ebp)
    73e5:	c6 85 33 ff ff ff 01 	movb   $0x1,-0xcd(%ebp)
    73ec:	c6 85 34 ff ff ff 02 	movb   $0x2,-0xcc(%ebp)
    73f3:	c6 85 35 ff ff ff 01 	movb   $0x1,-0xcb(%ebp)
    73fa:	c6 85 36 ff ff ff 00 	movb   $0x0,-0xca(%ebp)
    7401:	c6 85 37 ff ff ff 01 	movb   $0x1,-0xc9(%ebp)
    7408:	c6 85 38 ff ff ff 02 	movb   $0x2,-0xc8(%ebp)
    740f:	c6 85 39 ff ff ff 01 	movb   $0x1,-0xc7(%ebp)
    7416:	c6 85 3a ff ff ff 00 	movb   $0x0,-0xc6(%ebp)
    741d:	c6 85 3b ff ff ff 20 	movb   $0x20,-0xc5(%ebp)
    7424:	c6 85 3c ff ff ff 00 	movb   $0x0,-0xc4(%ebp)
    742b:	c6 85 3d ff ff ff 21 	movb   $0x21,-0xc3(%ebp)
    7432:	c6 85 3e ff ff ff 06 	movb   $0x6,-0xc2(%ebp)
    7439:	c6 85 3f ff ff ff 01 	movb   $0x1,-0xc1(%ebp)
    7440:	c6 85 40 ff ff ff 02 	movb   $0x2,-0xc0(%ebp)
    7447:	c6 85 41 ff ff ff 01 	movb   $0x1,-0xbf(%ebp)
    744e:	c6 85 42 ff ff ff 00 	movb   $0x0,-0xbe(%ebp)
    7455:	c6 85 43 ff ff ff 12 	movb   $0x12,-0xbd(%ebp)
    745c:	c6 85 44 ff ff ff 02 	movb   $0x2,-0xbc(%ebp)
    7463:	c6 85 45 ff ff ff 01 	movb   $0x1,-0xbb(%ebp)
    746a:	c6 85 46 ff ff ff 00 	movb   $0x0,-0xba(%ebp)
    7471:	c6 85 47 ff ff ff 02 	movb   $0x2,-0xb9(%ebp)
    7478:	c6 85 48 ff ff ff 00 	movb   $0x0,-0xb8(%ebp)
    747f:	c6 85 49 ff ff ff 22 	movb   $0x22,-0xb7(%ebp)
    7486:	c6 85 4a ff ff ff 04 	movb   $0x4,-0xb6(%ebp)
    748d:	c6 85 4b ff ff ff 01 	movb   $0x1,-0xb5(%ebp)
    7494:	c6 85 4c ff ff ff 02 	movb   $0x2,-0xb4(%ebp)
    749b:	c6 85 4d ff ff ff 01 	movb   $0x1,-0xb3(%ebp)
    74a2:	c6 85 4e ff ff ff 00 	movb   $0x0,-0xb2(%ebp)
    74a9:	c6 85 4f ff ff ff 31 	movb   $0x31,-0xb1(%ebp)
    74b0:	c6 85 50 ff ff ff 00 	movb   $0x0,-0xb0(%ebp)
    74b7:	c6 85 51 ff ff ff 13 	movb   $0x13,-0xaf(%ebp)
    74be:	c6 85 52 ff ff ff 04 	movb   $0x4,-0xae(%ebp)
    74c5:	c6 85 53 ff ff ff 01 	movb   $0x1,-0xad(%ebp)
    74cc:	c6 85 54 ff ff ff 02 	movb   $0x2,-0xac(%ebp)
    74d3:	c6 85 55 ff ff ff 01 	movb   $0x1,-0xab(%ebp)
    74da:	c6 85 56 ff ff ff 00 	movb   $0x0,-0xaa(%ebp)
    74e1:	c6 85 57 ff ff ff 30 	movb   $0x30,-0xa9(%ebp)
    74e8:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%ebp)
    74ef:	c6 85 59 ff ff ff 32 	movb   $0x32,-0xa7(%ebp)
    74f6:	c6 85 5a ff ff ff 02 	movb   $0x2,-0xa6(%ebp)
    74fd:	c6 85 5b ff ff ff 01 	movb   $0x1,-0xa5(%ebp)
    7504:	c6 85 5c ff ff ff 00 	movb   $0x0,-0xa4(%ebp)
    750b:	c6 85 5d ff ff ff 23 	movb   $0x23,-0xa3(%ebp)
    7512:	c6 85 5e ff ff ff 02 	movb   $0x2,-0xa2(%ebp)
    7519:	c6 85 5f ff ff ff 01 	movb   $0x1,-0xa1(%ebp)
    7520:	c6 85 60 ff ff ff 00 	movb   $0x0,-0xa0(%ebp)
    7527:	c6 85 61 ff ff ff 03 	movb   $0x3,-0x9f(%ebp)
    752e:	c6 85 62 ff ff ff 00 	movb   $0x0,-0x9e(%ebp)
    7535:	c6 85 63 ff ff ff 33 	movb   $0x33,-0x9d(%ebp)

	unsigned char h7[71][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x12,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x4},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x5},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    753c:	8d 95 98 fe ff ff    	lea    -0x168(%ebp),%edx
    7542:	b8 a0 cf 00 00       	mov    $0xcfa0,%eax
    7547:	b9 23 00 00 00       	mov    $0x23,%ecx
    754c:	89 d7                	mov    %edx,%edi
    754e:	89 c6                	mov    %eax,%esi
    7550:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7552:	89 f0                	mov    %esi,%eax
    7554:	89 fa                	mov    %edi,%edx
    7556:	0f b7 08             	movzwl (%eax),%ecx
    7559:	66 89 0a             	mov    %cx,(%edx)
    755c:	83 c2 02             	add    $0x2,%edx
    755f:	83 c0 02             	add    $0x2,%eax

	unsigned char h8[71][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x22},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x33},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x6,0x1},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x2,0x1},{0x0,0x53},{0x2,0x1},{0x0,0x45},{0x2,0x1},{0x0,0x54},{0x0,0x55}};
    7562:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7568:	ba 40 d0 00 00       	mov    $0xd040,%edx
    756d:	bb 8e 00 00 00       	mov    $0x8e,%ebx
    7572:	89 c1                	mov    %eax,%ecx
    7574:	83 e1 02             	and    $0x2,%ecx
    7577:	85 c9                	test   %ecx,%ecx
    7579:	74 0f                	je     758a <read_decoder_table+0x4a0>
    757b:	0f b7 0a             	movzwl (%edx),%ecx
    757e:	66 89 08             	mov    %cx,(%eax)
    7581:	83 c0 02             	add    $0x2,%eax
    7584:	83 c2 02             	add    $0x2,%edx
    7587:	83 eb 02             	sub    $0x2,%ebx
    758a:	89 d9                	mov    %ebx,%ecx
    758c:	c1 e9 02             	shr    $0x2,%ecx
    758f:	89 c7                	mov    %eax,%edi
    7591:	89 d6                	mov    %edx,%esi
    7593:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7595:	89 f2                	mov    %esi,%edx
    7597:	89 f8                	mov    %edi,%eax
    7599:	b9 00 00 00 00       	mov    $0x0,%ecx
    759e:	89 de                	mov    %ebx,%esi
    75a0:	83 e6 02             	and    $0x2,%esi
    75a3:	85 f6                	test   %esi,%esi
    75a5:	74 0b                	je     75b2 <read_decoder_table+0x4c8>
    75a7:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    75ab:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    75af:	83 c1 02             	add    $0x2,%ecx
    75b2:	83 e3 01             	and    $0x1,%ebx
    75b5:	85 db                	test   %ebx,%ebx
    75b7:	74 07                	je     75c0 <read_decoder_table+0x4d6>
    75b9:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    75bd:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h9[71][2] = {{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x2},{0x0,0x22},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x0,0x43},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x15},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x54},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x45},{0x0,0x55}};
    75c0:	8d 95 7c fd ff ff    	lea    -0x284(%ebp),%edx
    75c6:	b8 e0 d0 00 00       	mov    $0xd0e0,%eax
    75cb:	b9 23 00 00 00       	mov    $0x23,%ecx
    75d0:	89 d7                	mov    %edx,%edi
    75d2:	89 c6                	mov    %eax,%esi
    75d4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    75d6:	89 f0                	mov    %esi,%eax
    75d8:	89 fa                	mov    %edi,%edx
    75da:	0f b7 08             	movzwl (%eax),%ecx
    75dd:	66 89 0a             	mov    %cx,(%edx)
    75e0:	83 c2 02             	add    $0x2,%edx
    75e3:	83 c0 02             	add    $0x2,%eax

	unsigned char h10[127][2] = {{0x2,0x1},{0x0,0x0},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0xa,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3},{0x0,0x32},{0x2,0x1},{0x0,0x23},{0x0,0x40},{0x4,0x1},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x1c,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x60},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x36},{0x0,0x71},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x45},{0x0,0x62},{0x2,0x1},{0x0,0x70},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x6,0x1},{0x2,0x1},{0x0,0x63},{0x2,0x1},{0x0,0x54},{0x0,0x55},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x6,0x1},{0x2,0x1},{0x0,0x47},{0x2,0x1},{0x0,0x66},{0x0,0x75},{0x4,0x1},{0x2,0x1},{0x0,0x57},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    75e6:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    75ec:	ba 80 d1 00 00       	mov    $0xd180,%edx
    75f1:	bb fe 00 00 00       	mov    $0xfe,%ebx
    75f6:	89 c1                	mov    %eax,%ecx
    75f8:	83 e1 02             	and    $0x2,%ecx
    75fb:	85 c9                	test   %ecx,%ecx
    75fd:	74 0f                	je     760e <read_decoder_table+0x524>
    75ff:	0f b7 0a             	movzwl (%edx),%ecx
    7602:	66 89 08             	mov    %cx,(%eax)
    7605:	83 c0 02             	add    $0x2,%eax
    7608:	83 c2 02             	add    $0x2,%edx
    760b:	83 eb 02             	sub    $0x2,%ebx
    760e:	89 d9                	mov    %ebx,%ecx
    7610:	c1 e9 02             	shr    $0x2,%ecx
    7613:	89 c7                	mov    %eax,%edi
    7615:	89 d6                	mov    %edx,%esi
    7617:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7619:	89 f2                	mov    %esi,%edx
    761b:	89 f8                	mov    %edi,%eax
    761d:	b9 00 00 00 00       	mov    $0x0,%ecx
    7622:	89 de                	mov    %ebx,%esi
    7624:	83 e6 02             	and    $0x2,%esi
    7627:	85 f6                	test   %esi,%esi
    7629:	74 0b                	je     7636 <read_decoder_table+0x54c>
    762b:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    762f:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    7633:	83 c1 02             	add    $0x2,%ecx
    7636:	83 e3 01             	and    $0x1,%ebx
    7639:	85 db                	test   %ebx,%ebx
    763b:	74 07                	je     7644 <read_decoder_table+0x55a>
    763d:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    7641:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h11[127][2] = {{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x12},{0x18,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x21},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x2,0x1},{0x0,0x41},{0x0,0x14},{0x1e,0x1},{0x10,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x43},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x34},{0x0,0x51},{0x0,0x61},{0x6,0x1},{0x2,0x1},{0x0,0x16},{0x2,0x1},{0x0,0x6},{0x0,0x26},{0x2,0x1},{0x0,0x62},{0x2,0x1},{0x0,0x15},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x25},{0x0,0x44},{0x0,0x60},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x17},{0x0,0x71},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x64},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x55},{0x0,0x57},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    7644:	8d 95 80 fb ff ff    	lea    -0x480(%ebp),%edx
    764a:	b8 80 d2 00 00       	mov    $0xd280,%eax
    764f:	b9 3f 00 00 00       	mov    $0x3f,%ecx
    7654:	89 d7                	mov    %edx,%edi
    7656:	89 c6                	mov    %eax,%esi
    7658:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    765a:	89 f0                	mov    %esi,%eax
    765c:	89 fa                	mov    %edi,%edx
    765e:	0f b7 08             	movzwl (%eax),%ecx
    7661:	66 89 0a             	mov    %cx,(%edx)
    7664:	83 c2 02             	add    $0x2,%edx
    7667:	83 c0 02             	add    $0x2,%eax

	unsigned char h12[127][2] = {{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x31},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x1a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x2,0x1},{0x0,0x41},{0x0,0x33},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x2,0x1},{0x0,0x4},{0x0,0x50},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x1c,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x2,0x1},{0x0,0x53},{0x0,0x35},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x16},{0x0,0x61},{0x4,0x1},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x6},{0x0,0x44},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x71},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x46},{0x0,0x72},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x27},{0x2,0x1},{0x0,0x55},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x56},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x74},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x77}};
    766a:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    7670:	ba 80 d3 00 00       	mov    $0xd380,%edx
    7675:	bb fe 00 00 00       	mov    $0xfe,%ebx
    767a:	89 c1                	mov    %eax,%ecx
    767c:	83 e1 02             	and    $0x2,%ecx
    767f:	85 c9                	test   %ecx,%ecx
    7681:	74 0f                	je     7692 <read_decoder_table+0x5a8>
    7683:	0f b7 0a             	movzwl (%edx),%ecx
    7686:	66 89 08             	mov    %cx,(%eax)
    7689:	83 c0 02             	add    $0x2,%eax
    768c:	83 c2 02             	add    $0x2,%edx
    768f:	83 eb 02             	sub    $0x2,%ebx
    7692:	89 d9                	mov    %ebx,%ecx
    7694:	c1 e9 02             	shr    $0x2,%ecx
    7697:	89 c7                	mov    %eax,%edi
    7699:	89 d6                	mov    %edx,%esi
    769b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    769d:	89 f2                	mov    %esi,%edx
    769f:	89 f8                	mov    %edi,%eax
    76a1:	b9 00 00 00 00       	mov    $0x0,%ecx
    76a6:	89 de                	mov    %ebx,%esi
    76a8:	83 e6 02             	and    $0x2,%esi
    76ab:	85 f6                	test   %esi,%esi
    76ad:	74 0b                	je     76ba <read_decoder_table+0x5d0>
    76af:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    76b3:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    76b7:	83 c1 02             	add    $0x2,%ecx
    76ba:	83 e3 01             	and    $0x1,%ebx
    76bd:	85 db                	test   %ebx,%ebx
    76bf:	74 07                	je     76c8 <read_decoder_table+0x5de>
    76c1:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    76c5:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h13[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x1c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x22},{0x0,0x30},{0x2,0x1},{0x0,0x3},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x46,0x1},{0x1c,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x4,0x1},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x52},{0x2,0x1},{0x0,0x25},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x35},{0x0,0x62},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x4,0x1},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x7},{0x0,0x55},{0x0,0x71},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x48,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x4,0x1},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x0,0x72},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x2,0x1},{0x0,0x90},{0x0,0x9},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x73},{0x0,0x65},{0x2,0x1},{0x0,0x56},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x0,0x83},{0x6,0x1},{0x2,0x1},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x85},{0x2,0x1},{0x0,0x58},{0x0,0x39},{0x2,0x1},{0x0,0x93},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0x6,0x1},{0x2,0x1},{0x0,0xa0},{0x2,0x1},{0x0,0x68},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x44,0x1},{0x18,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x4,0x1},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x2,0x1},{0x0,0xb1},{0x0,0x1b},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xb2},{0x4,0x1},{0x2,0x1},{0x0,0x76},{0x0,0x77},{0x0,0x94},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x0,0xa4},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xa5},{0x0,0x2b},{0xc,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x88},{0x0,0xb3},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0x79},{0x0,0xa6},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x98},{0x0,0xc1},{0x3c,0x1},{0x16,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x2,0x1},{0x0,0xd0},{0x0,0xd},{0x2,0x1},{0x0,0xd1},{0x2,0x1},{0x0,0x4b},{0x2,0x1},{0x0,0x97},{0x0,0xa7},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xc3},{0x2,0x1},{0x0,0x7a},{0x0,0x99},{0x4,0x1},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x0,0xb7},{0x4,0x1},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x2,0x1},{0x0,0x7b},{0x0,0xd3},{0x34,0x1},{0x1c,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe0},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe1},{0x0,0x1e},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0x2e},{0x0,0xe2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe3},{0x0,0x6d},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x0,0xf0},{0x26,0x1},{0x10,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xaa},{0x0,0x9b},{0x0,0xb9},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0xd6},{0x0,0xc8},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x2,0x1},{0x0,0xab},{0x2,0x1},{0x0,0x5e},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xf},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x20,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x0,0x3f},{0x6,0x1},{0x2,0x1},{0x0,0xf3},{0x2,0x1},{0x0,0xe6},{0x0,0xca},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbb},{0x0,0xac},{0x2,0x1},{0x0,0xe7},{0x0,0xf5},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0x9d},{0x2,0x1},{0x0,0x5f},{0x0,0xe8},{0x1e,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x6f},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xad},{0x0,0xda},{0x8,0x1},{0x2,0x1},{0x0,0xf7},{0x4,0x1},{0x2,0x1},{0x0,0x7e},{0x0,0x7f},{0x0,0x8e},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xae},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xeb},{0x2,0x1},{0x0,0xbe},{0x2,0x1},{0x0,0xcd},{0x0,0xfa},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe9},{0x0,0xaf},{0x0,0xdc},{0x2,0x1},{0x0,0xce},{0x0,0xfb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xde},{0x2,0x1},{0x0,0xcf},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xef},{0x2,0x1},{0x0,0xff},{0x2,0x1},{0x0,0xed},{0x2,0x1},{0x0,0xfd},{0x2,0x1},{0x0,0xfc},{0x0,0xfe}};
    76c8:	8d 95 84 f6 ff ff    	lea    -0x97c(%ebp),%edx
    76ce:	b8 80 d4 00 00       	mov    $0xd480,%eax
    76d3:	b9 ff 00 00 00       	mov    $0xff,%ecx
    76d8:	89 d7                	mov    %edx,%edi
    76da:	89 c6                	mov    %eax,%esi
    76dc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    76de:	89 f0                	mov    %esi,%eax
    76e0:	89 fa                	mov    %edi,%edx
    76e2:	0f b7 08             	movzwl (%eax),%ecx
    76e5:	66 89 0a             	mov    %cx,(%edx)
    76e8:	83 c2 02             	add    $0x2,%edx
    76eb:	83 c0 02             	add    $0x2,%eax

	unsigned char h15[511][2] = {{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x0},{0x2,0x1},{0x0,0x10},{0x0,0x1},{0x2,0x1},{0x0,0x11},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0x32,0x1},{0x10,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x31},{0x6,0x1},{0x2,0x1},{0x0,0x13},{0x2,0x1},{0x0,0x3},{0x0,0x40},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x14},{0x0,0x41},{0x4,0x1},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x2,0x1},{0x0,0x24},{0x0,0x43},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x34},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x2,0x1},{0x0,0x51},{0x0,0x15},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x0,0x61},{0x5a,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x36},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x4,0x1},{0x2,0x1},{0x0,0x17},{0x0,0x64},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x18,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x73},{0x2,0x1},{0x0,0x37},{0x0,0x65},{0x4,0x1},{0x2,0x1},{0x0,0x56},{0x0,0x80},{0x2,0x1},{0x0,0x8},{0x0,0x74},{0x4,0x1},{0x2,0x1},{0x0,0x81},{0x0,0x18},{0x2,0x1},{0x0,0x82},{0x0,0x28},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x47},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x90},{0x0,0x19},{0x0,0x91},{0x4,0x1},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x5c,0x1},{0x24,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x4,0x1},{0x2,0x1},{0x0,0x9},{0x0,0x77},{0x0,0x93},{0x4,0x1},{0x2,0x1},{0x0,0x39},{0x0,0x94},{0x2,0x1},{0x0,0x49},{0x0,0x86},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x68},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x2,0x1},{0x0,0xa1},{0x0,0x1a},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x1a,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x3a},{0x0,0x87},{0x4,0x1},{0x2,0x1},{0x0,0x78},{0x0,0xa4},{0x2,0x1},{0x0,0x4a},{0x0,0x96},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb0},{0x0,0xb1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x0,0xb2},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0x79},{0x0,0x3b},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x6a},{0x0,0xb4},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x4,0x1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x50,0x1},{0x22,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5b},{0x0,0x2c},{0x0,0xc2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x0,0xa6},{0x2,0x1},{0x0,0xa7},{0x0,0x7a},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc3},{0x0,0x3c},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0x99},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x2,0x1},{0x0,0x4c},{0x0,0xa8},{0x14,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x2,0x1},{0x0,0xd},{0x0,0x2d},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd2},{0x0,0xd3},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9a},{0x0,0xb8},{0x0,0xd4},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x44,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x4,0x1},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x0,0xe1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0x2e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb9},{0x0,0x9b},{0x2,0x1},{0x0,0xe3},{0x0,0xd6},{0x4,0x1},{0x2,0x1},{0x0,0x6d},{0x0,0x3e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0x4e},{0x2,0x1},{0x0,0xd7},{0x0,0x7d},{0x4,0x1},{0x2,0x1},{0x0,0xe5},{0x0,0xba},{0x2,0x1},{0x0,0xab},{0x0,0x5e},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc9},{0x0,0x9c},{0x2,0x1},{0x0,0xf1},{0x0,0x1f},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x6e},{0x0,0xf2},{0x2,0x1},{0x0,0x2f},{0x0,0xe6},{0x26,0x1},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0xf3},{0x2,0x1},{0x0,0x3f},{0x0,0xf4},{0x6,0x1},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0x8d},{0x0,0xd9},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xf5},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0x5f},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x2,0x1},{0x0,0xf6},{0x0,0xcb},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf},{0x0,0xae},{0x0,0x6f},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x4,0x1},{0x2,0x1},{0x0,0xad},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0xe9},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xf8},{0x0,0x8f},{0x4,0x1},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x2,0x1},{0x0,0xea},{0x0,0xf9},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xeb},{0x4,0x1},{0x2,0x1},{0x0,0xbe},{0x0,0xfa},{0x2,0x1},{0x0,0xaf},{0x0,0xdd},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xec},{0x0,0xce},{0x0,0xfb},{0x4,0x1},{0x2,0x1},{0x0,0xbf},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xfc},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xcf},{0x0,0xfd},{0x0,0xee},{0x4,0x1},{0x2,0x1},{0x0,0xdf},{0x0,0xfe},{0x2,0x1},{0x0,0xef},{0x0,0xff}};
    76ee:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    76f4:	ba 80 d8 00 00       	mov    $0xd880,%edx
    76f9:	bb fe 03 00 00       	mov    $0x3fe,%ebx
    76fe:	89 c1                	mov    %eax,%ecx
    7700:	83 e1 02             	and    $0x2,%ecx
    7703:	85 c9                	test   %ecx,%ecx
    7705:	74 0f                	je     7716 <read_decoder_table+0x62c>
    7707:	0f b7 0a             	movzwl (%edx),%ecx
    770a:	66 89 08             	mov    %cx,(%eax)
    770d:	83 c0 02             	add    $0x2,%eax
    7710:	83 c2 02             	add    $0x2,%edx
    7713:	83 eb 02             	sub    $0x2,%ebx
    7716:	89 d9                	mov    %ebx,%ecx
    7718:	c1 e9 02             	shr    $0x2,%ecx
    771b:	89 c7                	mov    %eax,%edi
    771d:	89 d6                	mov    %edx,%esi
    771f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7721:	89 f2                	mov    %esi,%edx
    7723:	89 f8                	mov    %edi,%eax
    7725:	b9 00 00 00 00       	mov    $0x0,%ecx
    772a:	89 de                	mov    %ebx,%esi
    772c:	83 e6 02             	and    $0x2,%esi
    772f:	85 f6                	test   %esi,%esi
    7731:	74 0b                	je     773e <read_decoder_table+0x654>
    7733:	0f b7 34 0a          	movzwl (%edx,%ecx,1),%esi
    7737:	66 89 34 08          	mov    %si,(%eax,%ecx,1)
    773b:	83 c1 02             	add    $0x2,%ecx
    773e:	83 e3 01             	and    $0x1,%ebx
    7741:	85 db                	test   %ebx,%ebx
    7743:	74 07                	je     774c <read_decoder_table+0x662>
    7745:	0f b6 14 0a          	movzbl (%edx,%ecx,1),%edx
    7749:	88 14 08             	mov    %dl,(%eax,%ecx,1)

	unsigned char h16[511][2] = {{0x2,0x1},{0x0,0x0},{0x6,0x1},{0x2,0x1},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0x2a,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x2,0x1},{0x0,0x21},{0x0,0x12},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x6,0x1},{0x2,0x1},{0x0,0x14},{0x2,0x1},{0x0,0x33},{0x0,0x42},{0x4,0x1},{0x2,0x1},{0x0,0x24},{0x0,0x50},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x8a,0x1},{0x28,0x1},{0x10,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x5},{0x0,0x15},{0x0,0x51},{0x4,0x1},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x35},{0x0,0x53},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x0,0x61},{0x2,0x1},{0x0,0x16},{0x0,0x62},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x26},{0x0,0x54},{0x2,0x1},{0x0,0x45},{0x0,0x63},{0x4,0x1},{0x2,0x1},{0x0,0x36},{0x0,0x70},{0x0,0x71},{0x28,0x1},{0x12,0x1},{0x8,0x1},{0x2,0x1},{0x0,0x17},{0x2,0x1},{0x0,0x7},{0x2,0x1},{0x0,0x55},{0x0,0x64},{0x4,0x1},{0x2,0x1},{0x0,0x72},{0x0,0x27},{0x4,0x1},{0x2,0x1},{0x0,0x46},{0x0,0x65},{0x0,0x73},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x37},{0x2,0x1},{0x0,0x56},{0x0,0x8},{0x2,0x1},{0x0,0x80},{0x0,0x81},{0x6,0x1},{0x2,0x1},{0x0,0x18},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x82},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x18,0x1},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x2,0x1},{0x0,0x75},{0x0,0x84},{0x4,0x1},{0x2,0x1},{0x0,0x48},{0x0,0x90},{0x0,0x91},{0x6,0x1},{0x2,0x1},{0x0,0x19},{0x2,0x1},{0x0,0x9},{0x0,0x76},{0x2,0x1},{0x0,0x92},{0x0,0x29},{0xe,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x4,0x1},{0x2,0x1},{0x0,0xa0},{0x0,0xa},{0x0,0x1a},{0x8,0x1},{0x2,0x1},{0x0,0xa2},{0x2,0x1},{0x0,0x67},{0x2,0x1},{0x0,0x57},{0x0,0x49},{0x6,0x1},{0x2,0x1},{0x0,0x94},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0xa1},{0x2,0x1},{0x0,0x68},{0x0,0x95},{0xdc,0x1},{0x7e,0x1},{0x32,0x1},{0x1a,0x1},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x2a},{0x2,0x1},{0x0,0x59},{0x0,0x3a},{0x2,0x1},{0x0,0xa3},{0x2,0x1},{0x0,0x87},{0x0,0x78},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x4a},{0x2,0x1},{0x0,0x96},{0x0,0x69},{0x4,0x1},{0x2,0x1},{0x0,0xb0},{0x0,0xb},{0x0,0xb1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1b},{0x0,0xb2},{0x2,0x1},{0x0,0x2b},{0x2,0x1},{0x0,0xa5},{0x0,0x5a},{0x6,0x1},{0x2,0x1},{0x0,0xb3},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x4,0x1},{0x2,0x1},{0x0,0xb4},{0x0,0x4b},{0x2,0x1},{0x0,0xc},{0x0,0xc1},{0x1e,0x1},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb5},{0x0,0xc2},{0x0,0x2c},{0x4,0x1},{0x2,0x1},{0x0,0xa7},{0x0,0xc3},{0x2,0x1},{0x0,0x6b},{0x0,0xc4},{0x8,0x1},{0x2,0x1},{0x0,0x1d},{0x4,0x1},{0x2,0x1},{0x0,0x88},{0x0,0x97},{0x0,0x3b},{0x4,0x1},{0x2,0x1},{0x0,0xd1},{0x0,0xd2},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x12,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0x2e},{0x0,0xe2},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x79},{0x0,0x98},{0x0,0xc0},{0x2,0x1},{0x0,0x1c},{0x2,0x1},{0x0,0x89},{0x0,0x5b},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0x7a},{0x0,0xb6},{0x4,0x1},{0x2,0x1},{0x0,0x4c},{0x0,0x99},{0x2,0x1},{0x0,0xa8},{0x0,0x8a},{0x6,0x1},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xc5},{0x0,0x5c},{0x4,0x1},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x2,0x1},{0x0,0x6c},{0x0,0x9a},{0x58,0x1},{0x56,0x1},{0x24,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8b},{0x0,0x4d},{0x2,0x1},{0x0,0xc7},{0x0,0x7c},{0x4,0x1},{0x2,0x1},{0x0,0xd5},{0x0,0x5d},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x8,0x1},{0x2,0x1},{0x0,0xe3},{0x4,0x1},{0x2,0x1},{0x0,0xd0},{0x0,0xb7},{0x0,0x7b},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa9},{0x0,0xb8},{0x0,0xd4},{0x2,0x1},{0x0,0xe1},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x18,0x1},{0xa,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xd6},{0x0,0x6d},{0x2,0x1},{0x0,0x3e},{0x0,0xc8},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8c},{0x0,0xe4},{0x0,0x4e},{0x4,0x1},{0x2,0x1},{0x0,0xd7},{0x0,0xe5},{0x2,0x1},{0x0,0xba},{0x0,0xab},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x9c},{0x0,0xe6},{0x4,0x1},{0x2,0x1},{0x0,0x6e},{0x0,0xd8},{0x2,0x1},{0x0,0x8d},{0x0,0xbb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xe7},{0x0,0x9d},{0x2,0x1},{0x0,0xe8},{0x0,0x8e},{0x4,0x1},{0x2,0x1},{0x0,0xcb},{0x0,0xbc},{0x0,0x9e},{0x0,0xf1},{0x2,0x1},{0x0,0x1f},{0x2,0x1},{0x0,0xf},{0x0,0x2f},{0x42,0x1},{0x38,0x1},{0x2,0x1},{0x0,0xf2},{0x34,0x1},{0x32,0x1},{0x14,0x1},{0x8,0x1},{0x2,0x1},{0x0,0xbd},{0x2,0x1},{0x0,0x5e},{0x2,0x1},{0x0,0x7d},{0x0,0xc9},{0x6,0x1},{0x2,0x1},{0x0,0xca},{0x2,0x1},{0x0,0xac},{0x0,0x7e},{0x4,0x1},{0x2,0x1},{0x0,0xda},{0x0,0xad},{0x0,0xcc},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0xae},{0x2,0x1},{0x0,0xdb},{0x0,0xdc},{0x2,0x1},{0x0,0xcd},{0x0,0xbe},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xed},{0x0,0xee},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xd9},{0x0,0xea},{0x0,0xe9},{0x2,0x1},{0x0,0xde},{0x4,0x1},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x0,0xce},{0x0,0x3f},{0x0,0xf0},{0x4,0x1},{0x2,0x1},{0x0,0xf3},{0x0,0xf4},{0x2,0x1},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0xa,0x1},{0x2,0x1},{0x0,0xff},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x0,0x7f},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x8f},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xfa},{0x0,0xaf},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    774c:	8d 95 88 ee ff ff    	lea    -0x1178(%ebp),%edx
    7752:	b8 80 dc 00 00       	mov    $0xdc80,%eax
    7757:	b9 ff 00 00 00       	mov    $0xff,%ecx
    775c:	89 d7                	mov    %edx,%edi
    775e:	89 c6                	mov    %eax,%esi
    7760:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    7762:	89 f0                	mov    %esi,%eax
    7764:	89 fa                	mov    %edi,%edx
    7766:	0f b7 08             	movzwl (%eax),%ecx
    7769:	66 89 0a             	mov    %cx,(%edx)
    776c:	83 c2 02             	add    $0x2,%edx
    776f:	83 c0 02             	add    $0x2,%eax

	unsigned char h24[512][2] = {{0x3c,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x10},{0x2,0x1},{0x0,0x1},{0x0,0x11},{0xe,0x1},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x20},{0x0,0x2},{0x0,0x21},{0x2,0x1},{0x0,0x12},{0x2,0x1},{0x0,0x22},{0x2,0x1},{0x0,0x30},{0x0,0x3},{0xe,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x31},{0x0,0x13},{0x4,0x1},{0x2,0x1},{0x0,0x32},{0x0,0x23},{0x4,0x1},{0x2,0x1},{0x0,0x40},{0x0,0x4},{0x0,0x41},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x14},{0x0,0x33},{0x2,0x1},{0x0,0x42},{0x0,0x24},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x43},{0x0,0x34},{0x0,0x51},{0x6,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x50},{0x0,0x5},{0x0,0x15},{0x2,0x1},{0x0,0x52},{0x0,0x25},{0xfa,0x1},{0x62,0x1},{0x22,0x1},{0x12,0x1},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x44},{0x0,0x53},{0x2,0x1},{0x0,0x35},{0x2,0x1},{0x0,0x60},{0x0,0x6},{0x4,0x1},{0x2,0x1},{0x0,0x61},{0x0,0x16},{0x2,0x1},{0x0,0x62},{0x0,0x26},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x54},{0x0,0x45},{0x2,0x1},{0x0,0x63},{0x0,0x36},{0x4,0x1},{0x2,0x1},{0x0,0x71},{0x0,0x55},{0x2,0x1},{0x0,0x64},{0x0,0x46},{0x20,0x1},{0xe,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x72},{0x2,0x1},{0x0,0x27},{0x0,0x37},{0x2,0x1},{0x0,0x73},{0x4,0x1},{0x2,0x1},{0x0,0x70},{0x0,0x7},{0x0,0x17},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x65},{0x0,0x56},{0x4,0x1},{0x2,0x1},{0x0,0x80},{0x0,0x8},{0x0,0x81},{0x4,0x1},{0x2,0x1},{0x0,0x74},{0x0,0x47},{0x2,0x1},{0x0,0x18},{0x0,0x82},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x28},{0x0,0x66},{0x2,0x1},{0x0,0x83},{0x0,0x38},{0x4,0x1},{0x2,0x1},{0x0,0x75},{0x0,0x57},{0x2,0x1},{0x0,0x84},{0x0,0x48},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x91},{0x0,0x19},{0x2,0x1},{0x0,0x92},{0x0,0x76},{0x4,0x1},{0x2,0x1},{0x0,0x67},{0x0,0x29},{0x2,0x1},{0x0,0x85},{0x0,0x58},{0x5c,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x93},{0x0,0x39},{0x2,0x1},{0x0,0x94},{0x0,0x49},{0x4,0x1},{0x2,0x1},{0x0,0x77},{0x0,0x86},{0x2,0x1},{0x0,0x68},{0x0,0xa1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa2},{0x0,0x2a},{0x2,0x1},{0x0,0x95},{0x0,0x59},{0x4,0x1},{0x2,0x1},{0x0,0xa3},{0x0,0x3a},{0x2,0x1},{0x0,0x87},{0x2,0x1},{0x0,0x78},{0x0,0x4a},{0x16,0x1},{0xc,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xa4},{0x0,0x96},{0x4,0x1},{0x2,0x1},{0x0,0x69},{0x0,0xb1},{0x2,0x1},{0x0,0x1b},{0x0,0xa5},{0x6,0x1},{0x2,0x1},{0x0,0xb2},{0x2,0x1},{0x0,0x5a},{0x0,0x2b},{0x2,0x1},{0x0,0x88},{0x0,0xb3},{0x10,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x90},{0x2,0x1},{0x0,0x9},{0x0,0xa0},{0x2,0x1},{0x0,0x97},{0x0,0x79},{0x4,0x1},{0x2,0x1},{0x0,0xa6},{0x0,0x6a},{0x0,0xb4},{0xc,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x1a},{0x2,0x1},{0x0,0xa},{0x0,0xb0},{0x2,0x1},{0x0,0x3b},{0x2,0x1},{0x0,0xb},{0x0,0xc0},{0x4,0x1},{0x2,0x1},{0x0,0x4b},{0x0,0xc1},{0x2,0x1},{0x0,0x98},{0x0,0x89},{0x43,0x1},{0x22,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1c},{0x0,0xb5},{0x2,0x1},{0x0,0x5b},{0x0,0xc2},{0x4,0x1},{0x2,0x1},{0x0,0x2c},{0x0,0xa7},{0x2,0x1},{0x0,0x7a},{0x0,0xc3},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3c},{0x2,0x1},{0x0,0xc},{0x0,0xd0},{0x2,0x1},{0x0,0xb6},{0x0,0x6b},{0x4,0x1},{0x2,0x1},{0x0,0xc4},{0x0,0x4c},{0x2,0x1},{0x0,0x99},{0x0,0xa8},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8a},{0x0,0xc5},{0x2,0x1},{0x0,0x5c},{0x0,0xd1},{0x4,0x1},{0x2,0x1},{0x0,0xb7},{0x0,0x7b},{0x2,0x1},{0x0,0x1d},{0x0,0xd2},{0x9,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x2d},{0x0,0xd3},{0x2,0x1},{0x0,0x3d},{0x0,0xc6},{0x55,0xfa},{0x4,0x1},{0x2,0x1},{0x0,0x6c},{0x0,0xa9},{0x2,0x1},{0x0,0x9a},{0x0,0xd4},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xb8},{0x0,0x8b},{0x2,0x1},{0x0,0x4d},{0x0,0xc7},{0x4,0x1},{0x2,0x1},{0x0,0x7c},{0x0,0xd5},{0x2,0x1},{0x0,0x5d},{0x0,0xe1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x1e},{0x0,0xe2},{0x2,0x1},{0x0,0xaa},{0x0,0xb9},{0x4,0x1},{0x2,0x1},{0x0,0x9b},{0x0,0xe3},{0x2,0x1},{0x0,0xd6},{0x0,0x6d},{0x14,0x1},{0xa,0x1},{0x6,0x1},{0x2,0x1},{0x0,0x3e},{0x2,0x1},{0x0,0x2e},{0x0,0x4e},{0x2,0x1},{0x0,0xc8},{0x0,0x8c},{0x4,0x1},{0x2,0x1},{0x0,0xe4},{0x0,0xd7},{0x4,0x1},{0x2,0x1},{0x0,0x7d},{0x0,0xab},{0x0,0xe5},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xba},{0x0,0x5e},{0x2,0x1},{0x0,0xc9},{0x2,0x1},{0x0,0x9c},{0x0,0x6e},{0x8,0x1},{0x2,0x1},{0x0,0xe6},{0x2,0x1},{0x0,0xd},{0x2,0x1},{0x0,0xe0},{0x0,0xe},{0x4,0x1},{0x2,0x1},{0x0,0xd8},{0x0,0x8d},{0x2,0x1},{0x0,0xbb},{0x0,0xca},{0x4a,0x1},{0x2,0x1},{0x0,0xff},{0x40,0x1},{0x3a,0x1},{0x20,0x1},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xac},{0x0,0xe7},{0x2,0x1},{0x0,0x7e},{0x0,0xd9},{0x4,0x1},{0x2,0x1},{0x0,0x9d},{0x0,0xe8},{0x2,0x1},{0x0,0x8e},{0x0,0xcb},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xbc},{0x0,0xda},{0x2,0x1},{0x0,0xad},{0x0,0xe9},{0x4,0x1},{0x2,0x1},{0x0,0x9e},{0x0,0xcc},{0x2,0x1},{0x0,0xdb},{0x0,0xbd},{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xea},{0x0,0xae},{0x2,0x1},{0x0,0xdc},{0x0,0xcd},{0x4,0x1},{0x2,0x1},{0x0,0xeb},{0x0,0xbe},{0x2,0x1},{0x0,0xdd},{0x0,0xec},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xce},{0x0,0xed},{0x2,0x1},{0x0,0xde},{0x0,0xee},{0x0,0xf},{0x4,0x1},{0x2,0x1},{0x0,0xf0},{0x0,0x1f},{0x0,0xf1},{0x4,0x1},{0x2,0x1},{0x0,0xf2},{0x0,0x2f},{0x2,0x1},{0x0,0xf3},{0x0,0x3f},{0x12,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf4},{0x0,0x4f},{0x2,0x1},{0x0,0xf5},{0x0,0x5f},{0x4,0x1},{0x2,0x1},{0x0,0xf6},{0x0,0x6f},{0x2,0x1},{0x0,0xf7},{0x2,0x1},{0x0,0x7f},{0x0,0x8f},{0xa,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xf8},{0x0,0xf9},{0x4,0x1},{0x2,0x1},{0x0,0x9f},{0x0,0xaf},{0x0,0xfa},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xfb},{0x0,0xbf},{0x2,0x1},{0x0,0xfc},{0x0,0xcf},{0x4,0x1},{0x2,0x1},{0x0,0xfd},{0x0,0xdf},{0x2,0x1},{0x0,0xfe},{0x0,0xef}};
    7772:	8d 95 88 ea ff ff    	lea    -0x1578(%ebp),%edx
    7778:	bb 80 e0 00 00       	mov    $0xe080,%ebx
    777d:	b8 00 01 00 00       	mov    $0x100,%eax
    7782:	89 d7                	mov    %edx,%edi
    7784:	89 de                	mov    %ebx,%esi
    7786:	89 c1                	mov    %eax,%ecx
    7788:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	unsigned char hA[31][2] = {{0x2,0x1},{0x0,0x0},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x4},{0x2,0x1},{0x0,0x1},{0x0,0x2},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xa},{0x2,0x1},{0x0,0x3},{0x0,0x6},{0x6,0x1},{0x2,0x1},{0x0,0x9},{0x2,0x1},{0x0,0x5},{0x0,0x7},{0x4,0x1},{0x2,0x1},{0x0,0xe},{0x0,0xd},{0x2,0x1},{0x0,0xf},{0x0,0xb}};
    778a:	c6 85 4a ea ff ff 02 	movb   $0x2,-0x15b6(%ebp)
    7791:	c6 85 4b ea ff ff 01 	movb   $0x1,-0x15b5(%ebp)
    7798:	c6 85 4c ea ff ff 00 	movb   $0x0,-0x15b4(%ebp)
    779f:	c6 85 4d ea ff ff 00 	movb   $0x0,-0x15b3(%ebp)
    77a6:	c6 85 4e ea ff ff 08 	movb   $0x8,-0x15b2(%ebp)
    77ad:	c6 85 4f ea ff ff 01 	movb   $0x1,-0x15b1(%ebp)
    77b4:	c6 85 50 ea ff ff 04 	movb   $0x4,-0x15b0(%ebp)
    77bb:	c6 85 51 ea ff ff 01 	movb   $0x1,-0x15af(%ebp)
    77c2:	c6 85 52 ea ff ff 02 	movb   $0x2,-0x15ae(%ebp)
    77c9:	c6 85 53 ea ff ff 01 	movb   $0x1,-0x15ad(%ebp)
    77d0:	c6 85 54 ea ff ff 00 	movb   $0x0,-0x15ac(%ebp)
    77d7:	c6 85 55 ea ff ff 08 	movb   $0x8,-0x15ab(%ebp)
    77de:	c6 85 56 ea ff ff 00 	movb   $0x0,-0x15aa(%ebp)
    77e5:	c6 85 57 ea ff ff 04 	movb   $0x4,-0x15a9(%ebp)
    77ec:	c6 85 58 ea ff ff 02 	movb   $0x2,-0x15a8(%ebp)
    77f3:	c6 85 59 ea ff ff 01 	movb   $0x1,-0x15a7(%ebp)
    77fa:	c6 85 5a ea ff ff 00 	movb   $0x0,-0x15a6(%ebp)
    7801:	c6 85 5b ea ff ff 01 	movb   $0x1,-0x15a5(%ebp)
    7808:	c6 85 5c ea ff ff 00 	movb   $0x0,-0x15a4(%ebp)
    780f:	c6 85 5d ea ff ff 02 	movb   $0x2,-0x15a3(%ebp)
    7816:	c6 85 5e ea ff ff 08 	movb   $0x8,-0x15a2(%ebp)
    781d:	c6 85 5f ea ff ff 01 	movb   $0x1,-0x15a1(%ebp)
    7824:	c6 85 60 ea ff ff 04 	movb   $0x4,-0x15a0(%ebp)
    782b:	c6 85 61 ea ff ff 01 	movb   $0x1,-0x159f(%ebp)
    7832:	c6 85 62 ea ff ff 02 	movb   $0x2,-0x159e(%ebp)
    7839:	c6 85 63 ea ff ff 01 	movb   $0x1,-0x159d(%ebp)
    7840:	c6 85 64 ea ff ff 00 	movb   $0x0,-0x159c(%ebp)
    7847:	c6 85 65 ea ff ff 0c 	movb   $0xc,-0x159b(%ebp)
    784e:	c6 85 66 ea ff ff 00 	movb   $0x0,-0x159a(%ebp)
    7855:	c6 85 67 ea ff ff 0a 	movb   $0xa,-0x1599(%ebp)
    785c:	c6 85 68 ea ff ff 02 	movb   $0x2,-0x1598(%ebp)
    7863:	c6 85 69 ea ff ff 01 	movb   $0x1,-0x1597(%ebp)
    786a:	c6 85 6a ea ff ff 00 	movb   $0x0,-0x1596(%ebp)
    7871:	c6 85 6b ea ff ff 03 	movb   $0x3,-0x1595(%ebp)
    7878:	c6 85 6c ea ff ff 00 	movb   $0x0,-0x1594(%ebp)
    787f:	c6 85 6d ea ff ff 06 	movb   $0x6,-0x1593(%ebp)
    7886:	c6 85 6e ea ff ff 06 	movb   $0x6,-0x1592(%ebp)
    788d:	c6 85 6f ea ff ff 01 	movb   $0x1,-0x1591(%ebp)
    7894:	c6 85 70 ea ff ff 02 	movb   $0x2,-0x1590(%ebp)
    789b:	c6 85 71 ea ff ff 01 	movb   $0x1,-0x158f(%ebp)
    78a2:	c6 85 72 ea ff ff 00 	movb   $0x0,-0x158e(%ebp)
    78a9:	c6 85 73 ea ff ff 09 	movb   $0x9,-0x158d(%ebp)
    78b0:	c6 85 74 ea ff ff 02 	movb   $0x2,-0x158c(%ebp)
    78b7:	c6 85 75 ea ff ff 01 	movb   $0x1,-0x158b(%ebp)
    78be:	c6 85 76 ea ff ff 00 	movb   $0x0,-0x158a(%ebp)
    78c5:	c6 85 77 ea ff ff 05 	movb   $0x5,-0x1589(%ebp)
    78cc:	c6 85 78 ea ff ff 00 	movb   $0x0,-0x1588(%ebp)
    78d3:	c6 85 79 ea ff ff 07 	movb   $0x7,-0x1587(%ebp)
    78da:	c6 85 7a ea ff ff 04 	movb   $0x4,-0x1586(%ebp)
    78e1:	c6 85 7b ea ff ff 01 	movb   $0x1,-0x1585(%ebp)
    78e8:	c6 85 7c ea ff ff 02 	movb   $0x2,-0x1584(%ebp)
    78ef:	c6 85 7d ea ff ff 01 	movb   $0x1,-0x1583(%ebp)
    78f6:	c6 85 7e ea ff ff 00 	movb   $0x0,-0x1582(%ebp)
    78fd:	c6 85 7f ea ff ff 0e 	movb   $0xe,-0x1581(%ebp)
    7904:	c6 85 80 ea ff ff 00 	movb   $0x0,-0x1580(%ebp)
    790b:	c6 85 81 ea ff ff 0d 	movb   $0xd,-0x157f(%ebp)
    7912:	c6 85 82 ea ff ff 02 	movb   $0x2,-0x157e(%ebp)
    7919:	c6 85 83 ea ff ff 01 	movb   $0x1,-0x157d(%ebp)
    7920:	c6 85 84 ea ff ff 00 	movb   $0x0,-0x157c(%ebp)
    7927:	c6 85 85 ea ff ff 0f 	movb   $0xf,-0x157b(%ebp)
    792e:	c6 85 86 ea ff ff 00 	movb   $0x0,-0x157a(%ebp)
    7935:	c6 85 87 ea ff ff 0b 	movb   $0xb,-0x1579(%ebp)

	unsigned char hB[31][2] = {{0x10,0x1},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x0},{0x0,0x1},{0x2,0x1},{0x0,0x2},{0x0,0x3},{0x4,0x1},{0x2,0x1},{0x0,0x4},{0x0,0x5},{0x2,0x1},{0x0,0x6},{0x0,0x7},{0x8,0x1},{0x4,0x1},{0x2,0x1},{0x0,0x8},{0x0,0x9},{0x2,0x1},{0x0,0xa},{0x0,0xb},{0x4,0x1},{0x2,0x1},{0x0,0xc},{0x0,0xd},{0x2,0x1},{0x0,0xe},{0x0,0xf}};
    793c:	c6 85 0c ea ff ff 10 	movb   $0x10,-0x15f4(%ebp)
    7943:	c6 85 0d ea ff ff 01 	movb   $0x1,-0x15f3(%ebp)
    794a:	c6 85 0e ea ff ff 08 	movb   $0x8,-0x15f2(%ebp)
    7951:	c6 85 0f ea ff ff 01 	movb   $0x1,-0x15f1(%ebp)
    7958:	c6 85 10 ea ff ff 04 	movb   $0x4,-0x15f0(%ebp)
    795f:	c6 85 11 ea ff ff 01 	movb   $0x1,-0x15ef(%ebp)
    7966:	c6 85 12 ea ff ff 02 	movb   $0x2,-0x15ee(%ebp)
    796d:	c6 85 13 ea ff ff 01 	movb   $0x1,-0x15ed(%ebp)
    7974:	c6 85 14 ea ff ff 00 	movb   $0x0,-0x15ec(%ebp)
    797b:	c6 85 15 ea ff ff 00 	movb   $0x0,-0x15eb(%ebp)
    7982:	c6 85 16 ea ff ff 00 	movb   $0x0,-0x15ea(%ebp)
    7989:	c6 85 17 ea ff ff 01 	movb   $0x1,-0x15e9(%ebp)
    7990:	c6 85 18 ea ff ff 02 	movb   $0x2,-0x15e8(%ebp)
    7997:	c6 85 19 ea ff ff 01 	movb   $0x1,-0x15e7(%ebp)
    799e:	c6 85 1a ea ff ff 00 	movb   $0x0,-0x15e6(%ebp)
    79a5:	c6 85 1b ea ff ff 02 	movb   $0x2,-0x15e5(%ebp)
    79ac:	c6 85 1c ea ff ff 00 	movb   $0x0,-0x15e4(%ebp)
    79b3:	c6 85 1d ea ff ff 03 	movb   $0x3,-0x15e3(%ebp)
    79ba:	c6 85 1e ea ff ff 04 	movb   $0x4,-0x15e2(%ebp)
    79c1:	c6 85 1f ea ff ff 01 	movb   $0x1,-0x15e1(%ebp)
    79c8:	c6 85 20 ea ff ff 02 	movb   $0x2,-0x15e0(%ebp)
    79cf:	c6 85 21 ea ff ff 01 	movb   $0x1,-0x15df(%ebp)
    79d6:	c6 85 22 ea ff ff 00 	movb   $0x0,-0x15de(%ebp)
    79dd:	c6 85 23 ea ff ff 04 	movb   $0x4,-0x15dd(%ebp)
    79e4:	c6 85 24 ea ff ff 00 	movb   $0x0,-0x15dc(%ebp)
    79eb:	c6 85 25 ea ff ff 05 	movb   $0x5,-0x15db(%ebp)
    79f2:	c6 85 26 ea ff ff 02 	movb   $0x2,-0x15da(%ebp)
    79f9:	c6 85 27 ea ff ff 01 	movb   $0x1,-0x15d9(%ebp)
    7a00:	c6 85 28 ea ff ff 00 	movb   $0x0,-0x15d8(%ebp)
    7a07:	c6 85 29 ea ff ff 06 	movb   $0x6,-0x15d7(%ebp)
    7a0e:	c6 85 2a ea ff ff 00 	movb   $0x0,-0x15d6(%ebp)
    7a15:	c6 85 2b ea ff ff 07 	movb   $0x7,-0x15d5(%ebp)
    7a1c:	c6 85 2c ea ff ff 08 	movb   $0x8,-0x15d4(%ebp)
    7a23:	c6 85 2d ea ff ff 01 	movb   $0x1,-0x15d3(%ebp)
    7a2a:	c6 85 2e ea ff ff 04 	movb   $0x4,-0x15d2(%ebp)
    7a31:	c6 85 2f ea ff ff 01 	movb   $0x1,-0x15d1(%ebp)
    7a38:	c6 85 30 ea ff ff 02 	movb   $0x2,-0x15d0(%ebp)
    7a3f:	c6 85 31 ea ff ff 01 	movb   $0x1,-0x15cf(%ebp)
    7a46:	c6 85 32 ea ff ff 00 	movb   $0x0,-0x15ce(%ebp)
    7a4d:	c6 85 33 ea ff ff 08 	movb   $0x8,-0x15cd(%ebp)
    7a54:	c6 85 34 ea ff ff 00 	movb   $0x0,-0x15cc(%ebp)
    7a5b:	c6 85 35 ea ff ff 09 	movb   $0x9,-0x15cb(%ebp)
    7a62:	c6 85 36 ea ff ff 02 	movb   $0x2,-0x15ca(%ebp)
    7a69:	c6 85 37 ea ff ff 01 	movb   $0x1,-0x15c9(%ebp)
    7a70:	c6 85 38 ea ff ff 00 	movb   $0x0,-0x15c8(%ebp)
    7a77:	c6 85 39 ea ff ff 0a 	movb   $0xa,-0x15c7(%ebp)
    7a7e:	c6 85 3a ea ff ff 00 	movb   $0x0,-0x15c6(%ebp)
    7a85:	c6 85 3b ea ff ff 0b 	movb   $0xb,-0x15c5(%ebp)
    7a8c:	c6 85 3c ea ff ff 04 	movb   $0x4,-0x15c4(%ebp)
    7a93:	c6 85 3d ea ff ff 01 	movb   $0x1,-0x15c3(%ebp)
    7a9a:	c6 85 3e ea ff ff 02 	movb   $0x2,-0x15c2(%ebp)
    7aa1:	c6 85 3f ea ff ff 01 	movb   $0x1,-0x15c1(%ebp)
    7aa8:	c6 85 40 ea ff ff 00 	movb   $0x0,-0x15c0(%ebp)
    7aaf:	c6 85 41 ea ff ff 0c 	movb   $0xc,-0x15bf(%ebp)
    7ab6:	c6 85 42 ea ff ff 00 	movb   $0x0,-0x15be(%ebp)
    7abd:	c6 85 43 ea ff ff 0d 	movb   $0xd,-0x15bd(%ebp)
    7ac4:	c6 85 44 ea ff ff 02 	movb   $0x2,-0x15bc(%ebp)
    7acb:	c6 85 45 ea ff ff 01 	movb   $0x1,-0x15bb(%ebp)
    7ad2:	c6 85 46 ea ff ff 00 	movb   $0x0,-0x15ba(%ebp)
    7ad9:	c6 85 47 ea ff ff 0e 	movb   $0xe,-0x15b9(%ebp)
    7ae0:	c6 85 48 ea ff ff 00 	movb   $0x0,-0x15b8(%ebp)
    7ae7:	c6 85 49 ea ff ff 0f 	movb   $0xf,-0x15b7(%ebp)
	
	struct huffcodetab ht[HTN] = {
    7aee:	66 c7 85 bc e4 ff ff 	movw   $0x30,-0x1b44(%ebp)
    7af5:	30 00 
    7af7:	c6 85 be e4 ff ff 00 	movb   $0x0,-0x1b42(%ebp)
    7afe:	c7 85 c0 e4 ff ff 00 	movl   $0x0,-0x1b40(%ebp)
    7b05:	00 00 00 
    7b08:	c7 85 c4 e4 ff ff 00 	movl   $0x0,-0x1b3c(%ebp)
    7b0f:	00 00 00 
    7b12:	c7 85 c8 e4 ff ff 00 	movl   $0x0,-0x1b38(%ebp)
    7b19:	00 00 00 
    7b1c:	c7 85 cc e4 ff ff 00 	movl   $0x0,-0x1b34(%ebp)
    7b23:	00 00 00 
    7b26:	c7 85 d0 e4 ff ff ff 	movl   $0xffffffff,-0x1b30(%ebp)
    7b2d:	ff ff ff 
    7b30:	c7 85 d4 e4 ff ff 00 	movl   $0x0,-0x1b2c(%ebp)
    7b37:	00 00 00 
    7b3a:	c7 85 d8 e4 ff ff 00 	movl   $0x0,-0x1b28(%ebp)
    7b41:	00 00 00 
    7b44:	c7 85 dc e4 ff ff 00 	movl   $0x0,-0x1b24(%ebp)
    7b4b:	00 00 00 
    7b4e:	c7 85 e0 e4 ff ff 00 	movl   $0x0,-0x1b20(%ebp)
    7b55:	00 00 00 
    7b58:	66 c7 85 e4 e4 ff ff 	movw   $0x31,-0x1b1c(%ebp)
    7b5f:	31 00 
    7b61:	c6 85 e6 e4 ff ff 00 	movb   $0x0,-0x1b1a(%ebp)
    7b68:	c7 85 e8 e4 ff ff 02 	movl   $0x2,-0x1b18(%ebp)
    7b6f:	00 00 00 
    7b72:	c7 85 ec e4 ff ff 02 	movl   $0x2,-0x1b14(%ebp)
    7b79:	00 00 00 
    7b7c:	c7 85 f0 e4 ff ff 00 	movl   $0x0,-0x1b10(%ebp)
    7b83:	00 00 00 
    7b86:	c7 85 f4 e4 ff ff 00 	movl   $0x0,-0x1b0c(%ebp)
    7b8d:	00 00 00 
    7b90:	c7 85 f8 e4 ff ff ff 	movl   $0xffffffff,-0x1b08(%ebp)
    7b97:	ff ff ff 
    7b9a:	c7 85 fc e4 ff ff 00 	movl   $0x0,-0x1b04(%ebp)
    7ba1:	00 00 00 
    7ba4:	c7 85 00 e5 ff ff 00 	movl   $0x0,-0x1b00(%ebp)
    7bab:	00 00 00 
    7bae:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    7bb1:	89 85 04 e5 ff ff    	mov    %eax,-0x1afc(%ebp)
    7bb7:	c7 85 08 e5 ff ff 07 	movl   $0x7,-0x1af8(%ebp)
    7bbe:	00 00 00 
    7bc1:	66 c7 85 0c e5 ff ff 	movw   $0x32,-0x1af4(%ebp)
    7bc8:	32 00 
    7bca:	c6 85 0e e5 ff ff 00 	movb   $0x0,-0x1af2(%ebp)
    7bd1:	c7 85 10 e5 ff ff 03 	movl   $0x3,-0x1af0(%ebp)
    7bd8:	00 00 00 
    7bdb:	c7 85 14 e5 ff ff 03 	movl   $0x3,-0x1aec(%ebp)
    7be2:	00 00 00 
    7be5:	c7 85 18 e5 ff ff 00 	movl   $0x0,-0x1ae8(%ebp)
    7bec:	00 00 00 
    7bef:	c7 85 1c e5 ff ff 00 	movl   $0x0,-0x1ae4(%ebp)
    7bf6:	00 00 00 
    7bf9:	c7 85 20 e5 ff ff ff 	movl   $0xffffffff,-0x1ae0(%ebp)
    7c00:	ff ff ff 
    7c03:	c7 85 24 e5 ff ff 00 	movl   $0x0,-0x1adc(%ebp)
    7c0a:	00 00 00 
    7c0d:	c7 85 28 e5 ff ff 00 	movl   $0x0,-0x1ad8(%ebp)
    7c14:	00 00 00 
    7c17:	8d 45 c4             	lea    -0x3c(%ebp),%eax
    7c1a:	89 85 2c e5 ff ff    	mov    %eax,-0x1ad4(%ebp)
    7c20:	c7 85 30 e5 ff ff 11 	movl   $0x11,-0x1ad0(%ebp)
    7c27:	00 00 00 
    7c2a:	66 c7 85 34 e5 ff ff 	movw   $0x33,-0x1acc(%ebp)
    7c31:	33 00 
    7c33:	c6 85 36 e5 ff ff 00 	movb   $0x0,-0x1aca(%ebp)
    7c3a:	c7 85 38 e5 ff ff 03 	movl   $0x3,-0x1ac8(%ebp)
    7c41:	00 00 00 
    7c44:	c7 85 3c e5 ff ff 03 	movl   $0x3,-0x1ac4(%ebp)
    7c4b:	00 00 00 
    7c4e:	c7 85 40 e5 ff ff 00 	movl   $0x0,-0x1ac0(%ebp)
    7c55:	00 00 00 
    7c58:	c7 85 44 e5 ff ff 00 	movl   $0x0,-0x1abc(%ebp)
    7c5f:	00 00 00 
    7c62:	c7 85 48 e5 ff ff ff 	movl   $0xffffffff,-0x1ab8(%ebp)
    7c69:	ff ff ff 
    7c6c:	c7 85 4c e5 ff ff 00 	movl   $0x0,-0x1ab4(%ebp)
    7c73:	00 00 00 
    7c76:	c7 85 50 e5 ff ff 00 	movl   $0x0,-0x1ab0(%ebp)
    7c7d:	00 00 00 
    7c80:	8d 45 a2             	lea    -0x5e(%ebp),%eax
    7c83:	89 85 54 e5 ff ff    	mov    %eax,-0x1aac(%ebp)
    7c89:	c7 85 58 e5 ff ff 11 	movl   $0x11,-0x1aa8(%ebp)
    7c90:	00 00 00 
    7c93:	66 c7 85 5c e5 ff ff 	movw   $0x34,-0x1aa4(%ebp)
    7c9a:	34 00 
    7c9c:	c6 85 5e e5 ff ff 00 	movb   $0x0,-0x1aa2(%ebp)
    7ca3:	c7 85 60 e5 ff ff 00 	movl   $0x0,-0x1aa0(%ebp)
    7caa:	00 00 00 
    7cad:	c7 85 64 e5 ff ff 00 	movl   $0x0,-0x1a9c(%ebp)
    7cb4:	00 00 00 
    7cb7:	c7 85 68 e5 ff ff 00 	movl   $0x0,-0x1a98(%ebp)
    7cbe:	00 00 00 
    7cc1:	c7 85 6c e5 ff ff 00 	movl   $0x0,-0x1a94(%ebp)
    7cc8:	00 00 00 
    7ccb:	c7 85 70 e5 ff ff ff 	movl   $0xffffffff,-0x1a90(%ebp)
    7cd2:	ff ff ff 
    7cd5:	c7 85 74 e5 ff ff 00 	movl   $0x0,-0x1a8c(%ebp)
    7cdc:	00 00 00 
    7cdf:	c7 85 78 e5 ff ff 00 	movl   $0x0,-0x1a88(%ebp)
    7ce6:	00 00 00 
    7ce9:	c7 85 7c e5 ff ff 00 	movl   $0x0,-0x1a84(%ebp)
    7cf0:	00 00 00 
    7cf3:	c7 85 80 e5 ff ff 00 	movl   $0x0,-0x1a80(%ebp)
    7cfa:	00 00 00 
    7cfd:	66 c7 85 84 e5 ff ff 	movw   $0x35,-0x1a7c(%ebp)
    7d04:	35 00 
    7d06:	c6 85 86 e5 ff ff 00 	movb   $0x0,-0x1a7a(%ebp)
    7d0d:	c7 85 88 e5 ff ff 04 	movl   $0x4,-0x1a78(%ebp)
    7d14:	00 00 00 
    7d17:	c7 85 8c e5 ff ff 04 	movl   $0x4,-0x1a74(%ebp)
    7d1e:	00 00 00 
    7d21:	c7 85 90 e5 ff ff 00 	movl   $0x0,-0x1a70(%ebp)
    7d28:	00 00 00 
    7d2b:	c7 85 94 e5 ff ff 00 	movl   $0x0,-0x1a6c(%ebp)
    7d32:	00 00 00 
    7d35:	c7 85 98 e5 ff ff ff 	movl   $0xffffffff,-0x1a68(%ebp)
    7d3c:	ff ff ff 
    7d3f:	c7 85 9c e5 ff ff 00 	movl   $0x0,-0x1a64(%ebp)
    7d46:	00 00 00 
    7d49:	c7 85 a0 e5 ff ff 00 	movl   $0x0,-0x1a60(%ebp)
    7d50:	00 00 00 
    7d53:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
    7d59:	89 85 a4 e5 ff ff    	mov    %eax,-0x1a5c(%ebp)
    7d5f:	c7 85 a8 e5 ff ff 1f 	movl   $0x1f,-0x1a58(%ebp)
    7d66:	00 00 00 
    7d69:	66 c7 85 ac e5 ff ff 	movw   $0x36,-0x1a54(%ebp)
    7d70:	36 00 
    7d72:	c6 85 ae e5 ff ff 00 	movb   $0x0,-0x1a52(%ebp)
    7d79:	c7 85 b0 e5 ff ff 04 	movl   $0x4,-0x1a50(%ebp)
    7d80:	00 00 00 
    7d83:	c7 85 b4 e5 ff ff 04 	movl   $0x4,-0x1a4c(%ebp)
    7d8a:	00 00 00 
    7d8d:	c7 85 b8 e5 ff ff 00 	movl   $0x0,-0x1a48(%ebp)
    7d94:	00 00 00 
    7d97:	c7 85 bc e5 ff ff 00 	movl   $0x0,-0x1a44(%ebp)
    7d9e:	00 00 00 
    7da1:	c7 85 c0 e5 ff ff ff 	movl   $0xffffffff,-0x1a40(%ebp)
    7da8:	ff ff ff 
    7dab:	c7 85 c4 e5 ff ff 00 	movl   $0x0,-0x1a3c(%ebp)
    7db2:	00 00 00 
    7db5:	c7 85 c8 e5 ff ff 00 	movl   $0x0,-0x1a38(%ebp)
    7dbc:	00 00 00 
    7dbf:	8d 85 26 ff ff ff    	lea    -0xda(%ebp),%eax
    7dc5:	89 85 cc e5 ff ff    	mov    %eax,-0x1a34(%ebp)
    7dcb:	c7 85 d0 e5 ff ff 1f 	movl   $0x1f,-0x1a30(%ebp)
    7dd2:	00 00 00 
    7dd5:	66 c7 85 d4 e5 ff ff 	movw   $0x37,-0x1a2c(%ebp)
    7ddc:	37 00 
    7dde:	c6 85 d6 e5 ff ff 00 	movb   $0x0,-0x1a2a(%ebp)
    7de5:	c7 85 d8 e5 ff ff 06 	movl   $0x6,-0x1a28(%ebp)
    7dec:	00 00 00 
    7def:	c7 85 dc e5 ff ff 06 	movl   $0x6,-0x1a24(%ebp)
    7df6:	00 00 00 
    7df9:	c7 85 e0 e5 ff ff 00 	movl   $0x0,-0x1a20(%ebp)
    7e00:	00 00 00 
    7e03:	c7 85 e4 e5 ff ff 00 	movl   $0x0,-0x1a1c(%ebp)
    7e0a:	00 00 00 
    7e0d:	c7 85 e8 e5 ff ff ff 	movl   $0xffffffff,-0x1a18(%ebp)
    7e14:	ff ff ff 
    7e17:	c7 85 ec e5 ff ff 00 	movl   $0x0,-0x1a14(%ebp)
    7e1e:	00 00 00 
    7e21:	c7 85 f0 e5 ff ff 00 	movl   $0x0,-0x1a10(%ebp)
    7e28:	00 00 00 
    7e2b:	8d 85 98 fe ff ff    	lea    -0x168(%ebp),%eax
    7e31:	89 85 f4 e5 ff ff    	mov    %eax,-0x1a0c(%ebp)
    7e37:	c7 85 f8 e5 ff ff 47 	movl   $0x47,-0x1a08(%ebp)
    7e3e:	00 00 00 
    7e41:	66 c7 85 fc e5 ff ff 	movw   $0x38,-0x1a04(%ebp)
    7e48:	38 00 
    7e4a:	c6 85 fe e5 ff ff 00 	movb   $0x0,-0x1a02(%ebp)
    7e51:	c7 85 00 e6 ff ff 06 	movl   $0x6,-0x1a00(%ebp)
    7e58:	00 00 00 
    7e5b:	c7 85 04 e6 ff ff 06 	movl   $0x6,-0x19fc(%ebp)
    7e62:	00 00 00 
    7e65:	c7 85 08 e6 ff ff 00 	movl   $0x0,-0x19f8(%ebp)
    7e6c:	00 00 00 
    7e6f:	c7 85 0c e6 ff ff 00 	movl   $0x0,-0x19f4(%ebp)
    7e76:	00 00 00 
    7e79:	c7 85 10 e6 ff ff ff 	movl   $0xffffffff,-0x19f0(%ebp)
    7e80:	ff ff ff 
    7e83:	c7 85 14 e6 ff ff 00 	movl   $0x0,-0x19ec(%ebp)
    7e8a:	00 00 00 
    7e8d:	c7 85 18 e6 ff ff 00 	movl   $0x0,-0x19e8(%ebp)
    7e94:	00 00 00 
    7e97:	8d 85 0a fe ff ff    	lea    -0x1f6(%ebp),%eax
    7e9d:	89 85 1c e6 ff ff    	mov    %eax,-0x19e4(%ebp)
    7ea3:	c7 85 20 e6 ff ff 47 	movl   $0x47,-0x19e0(%ebp)
    7eaa:	00 00 00 
    7ead:	66 c7 85 24 e6 ff ff 	movw   $0x39,-0x19dc(%ebp)
    7eb4:	39 00 
    7eb6:	c6 85 26 e6 ff ff 00 	movb   $0x0,-0x19da(%ebp)
    7ebd:	c7 85 28 e6 ff ff 06 	movl   $0x6,-0x19d8(%ebp)
    7ec4:	00 00 00 
    7ec7:	c7 85 2c e6 ff ff 06 	movl   $0x6,-0x19d4(%ebp)
    7ece:	00 00 00 
    7ed1:	c7 85 30 e6 ff ff 00 	movl   $0x0,-0x19d0(%ebp)
    7ed8:	00 00 00 
    7edb:	c7 85 34 e6 ff ff 00 	movl   $0x0,-0x19cc(%ebp)
    7ee2:	00 00 00 
    7ee5:	c7 85 38 e6 ff ff ff 	movl   $0xffffffff,-0x19c8(%ebp)
    7eec:	ff ff ff 
    7eef:	c7 85 3c e6 ff ff 00 	movl   $0x0,-0x19c4(%ebp)
    7ef6:	00 00 00 
    7ef9:	c7 85 40 e6 ff ff 00 	movl   $0x0,-0x19c0(%ebp)
    7f00:	00 00 00 
    7f03:	8d 85 7c fd ff ff    	lea    -0x284(%ebp),%eax
    7f09:	89 85 44 e6 ff ff    	mov    %eax,-0x19bc(%ebp)
    7f0f:	c7 85 48 e6 ff ff 47 	movl   $0x47,-0x19b8(%ebp)
    7f16:	00 00 00 
    7f19:	66 c7 85 4c e6 ff ff 	movw   $0x3031,-0x19b4(%ebp)
    7f20:	31 30 
    7f22:	c6 85 4e e6 ff ff 00 	movb   $0x0,-0x19b2(%ebp)
    7f29:	c7 85 50 e6 ff ff 08 	movl   $0x8,-0x19b0(%ebp)
    7f30:	00 00 00 
    7f33:	c7 85 54 e6 ff ff 08 	movl   $0x8,-0x19ac(%ebp)
    7f3a:	00 00 00 
    7f3d:	c7 85 58 e6 ff ff 00 	movl   $0x0,-0x19a8(%ebp)
    7f44:	00 00 00 
    7f47:	c7 85 5c e6 ff ff 00 	movl   $0x0,-0x19a4(%ebp)
    7f4e:	00 00 00 
    7f51:	c7 85 60 e6 ff ff ff 	movl   $0xffffffff,-0x19a0(%ebp)
    7f58:	ff ff ff 
    7f5b:	c7 85 64 e6 ff ff 00 	movl   $0x0,-0x199c(%ebp)
    7f62:	00 00 00 
    7f65:	c7 85 68 e6 ff ff 00 	movl   $0x0,-0x1998(%ebp)
    7f6c:	00 00 00 
    7f6f:	8d 85 7e fc ff ff    	lea    -0x382(%ebp),%eax
    7f75:	89 85 6c e6 ff ff    	mov    %eax,-0x1994(%ebp)
    7f7b:	c7 85 70 e6 ff ff 7f 	movl   $0x7f,-0x1990(%ebp)
    7f82:	00 00 00 
    7f85:	66 c7 85 74 e6 ff ff 	movw   $0x3131,-0x198c(%ebp)
    7f8c:	31 31 
    7f8e:	c6 85 76 e6 ff ff 00 	movb   $0x0,-0x198a(%ebp)
    7f95:	c7 85 78 e6 ff ff 08 	movl   $0x8,-0x1988(%ebp)
    7f9c:	00 00 00 
    7f9f:	c7 85 7c e6 ff ff 08 	movl   $0x8,-0x1984(%ebp)
    7fa6:	00 00 00 
    7fa9:	c7 85 80 e6 ff ff 00 	movl   $0x0,-0x1980(%ebp)
    7fb0:	00 00 00 
    7fb3:	c7 85 84 e6 ff ff 00 	movl   $0x0,-0x197c(%ebp)
    7fba:	00 00 00 
    7fbd:	c7 85 88 e6 ff ff ff 	movl   $0xffffffff,-0x1978(%ebp)
    7fc4:	ff ff ff 
    7fc7:	c7 85 8c e6 ff ff 00 	movl   $0x0,-0x1974(%ebp)
    7fce:	00 00 00 
    7fd1:	c7 85 90 e6 ff ff 00 	movl   $0x0,-0x1970(%ebp)
    7fd8:	00 00 00 
    7fdb:	8d 85 80 fb ff ff    	lea    -0x480(%ebp),%eax
    7fe1:	89 85 94 e6 ff ff    	mov    %eax,-0x196c(%ebp)
    7fe7:	c7 85 98 e6 ff ff 7f 	movl   $0x7f,-0x1968(%ebp)
    7fee:	00 00 00 
    7ff1:	66 c7 85 9c e6 ff ff 	movw   $0x3231,-0x1964(%ebp)
    7ff8:	31 32 
    7ffa:	c6 85 9e e6 ff ff 00 	movb   $0x0,-0x1962(%ebp)
    8001:	c7 85 a0 e6 ff ff 08 	movl   $0x8,-0x1960(%ebp)
    8008:	00 00 00 
    800b:	c7 85 a4 e6 ff ff 08 	movl   $0x8,-0x195c(%ebp)
    8012:	00 00 00 
    8015:	c7 85 a8 e6 ff ff 00 	movl   $0x0,-0x1958(%ebp)
    801c:	00 00 00 
    801f:	c7 85 ac e6 ff ff 00 	movl   $0x0,-0x1954(%ebp)
    8026:	00 00 00 
    8029:	c7 85 b0 e6 ff ff ff 	movl   $0xffffffff,-0x1950(%ebp)
    8030:	ff ff ff 
    8033:	c7 85 b4 e6 ff ff 00 	movl   $0x0,-0x194c(%ebp)
    803a:	00 00 00 
    803d:	c7 85 b8 e6 ff ff 00 	movl   $0x0,-0x1948(%ebp)
    8044:	00 00 00 
    8047:	8d 85 82 fa ff ff    	lea    -0x57e(%ebp),%eax
    804d:	89 85 bc e6 ff ff    	mov    %eax,-0x1944(%ebp)
    8053:	c7 85 c0 e6 ff ff 7f 	movl   $0x7f,-0x1940(%ebp)
    805a:	00 00 00 
    805d:	66 c7 85 c4 e6 ff ff 	movw   $0x3331,-0x193c(%ebp)
    8064:	31 33 
    8066:	c6 85 c6 e6 ff ff 00 	movb   $0x0,-0x193a(%ebp)
    806d:	c7 85 c8 e6 ff ff 10 	movl   $0x10,-0x1938(%ebp)
    8074:	00 00 00 
    8077:	c7 85 cc e6 ff ff 10 	movl   $0x10,-0x1934(%ebp)
    807e:	00 00 00 
    8081:	c7 85 d0 e6 ff ff 00 	movl   $0x0,-0x1930(%ebp)
    8088:	00 00 00 
    808b:	c7 85 d4 e6 ff ff 00 	movl   $0x0,-0x192c(%ebp)
    8092:	00 00 00 
    8095:	c7 85 d8 e6 ff ff ff 	movl   $0xffffffff,-0x1928(%ebp)
    809c:	ff ff ff 
    809f:	c7 85 dc e6 ff ff 00 	movl   $0x0,-0x1924(%ebp)
    80a6:	00 00 00 
    80a9:	c7 85 e0 e6 ff ff 00 	movl   $0x0,-0x1920(%ebp)
    80b0:	00 00 00 
    80b3:	8d 85 84 f6 ff ff    	lea    -0x97c(%ebp),%eax
    80b9:	89 85 e4 e6 ff ff    	mov    %eax,-0x191c(%ebp)
    80bf:	c7 85 e8 e6 ff ff ff 	movl   $0x1ff,-0x1918(%ebp)
    80c6:	01 00 00 
    80c9:	66 c7 85 ec e6 ff ff 	movw   $0x3431,-0x1914(%ebp)
    80d0:	31 34 
    80d2:	c6 85 ee e6 ff ff 00 	movb   $0x0,-0x1912(%ebp)
    80d9:	c7 85 f0 e6 ff ff 00 	movl   $0x0,-0x1910(%ebp)
    80e0:	00 00 00 
    80e3:	c7 85 f4 e6 ff ff 00 	movl   $0x0,-0x190c(%ebp)
    80ea:	00 00 00 
    80ed:	c7 85 f8 e6 ff ff 00 	movl   $0x0,-0x1908(%ebp)
    80f4:	00 00 00 
    80f7:	c7 85 fc e6 ff ff 00 	movl   $0x0,-0x1904(%ebp)
    80fe:	00 00 00 
    8101:	c7 85 00 e7 ff ff ff 	movl   $0xffffffff,-0x1900(%ebp)
    8108:	ff ff ff 
    810b:	c7 85 04 e7 ff ff 00 	movl   $0x0,-0x18fc(%ebp)
    8112:	00 00 00 
    8115:	c7 85 08 e7 ff ff 00 	movl   $0x0,-0x18f8(%ebp)
    811c:	00 00 00 
    811f:	c7 85 0c e7 ff ff 00 	movl   $0x0,-0x18f4(%ebp)
    8126:	00 00 00 
    8129:	c7 85 10 e7 ff ff 00 	movl   $0x0,-0x18f0(%ebp)
    8130:	00 00 00 
    8133:	66 c7 85 14 e7 ff ff 	movw   $0x3531,-0x18ec(%ebp)
    813a:	31 35 
    813c:	c6 85 16 e7 ff ff 00 	movb   $0x0,-0x18ea(%ebp)
    8143:	c7 85 18 e7 ff ff 10 	movl   $0x10,-0x18e8(%ebp)
    814a:	00 00 00 
    814d:	c7 85 1c e7 ff ff 10 	movl   $0x10,-0x18e4(%ebp)
    8154:	00 00 00 
    8157:	c7 85 20 e7 ff ff 00 	movl   $0x0,-0x18e0(%ebp)
    815e:	00 00 00 
    8161:	c7 85 24 e7 ff ff 00 	movl   $0x0,-0x18dc(%ebp)
    8168:	00 00 00 
    816b:	c7 85 28 e7 ff ff ff 	movl   $0xffffffff,-0x18d8(%ebp)
    8172:	ff ff ff 
    8175:	c7 85 2c e7 ff ff 00 	movl   $0x0,-0x18d4(%ebp)
    817c:	00 00 00 
    817f:	c7 85 30 e7 ff ff 00 	movl   $0x0,-0x18d0(%ebp)
    8186:	00 00 00 
    8189:	8d 85 86 f2 ff ff    	lea    -0xd7a(%ebp),%eax
    818f:	89 85 34 e7 ff ff    	mov    %eax,-0x18cc(%ebp)
    8195:	c7 85 38 e7 ff ff ff 	movl   $0x1ff,-0x18c8(%ebp)
    819c:	01 00 00 
    819f:	66 c7 85 3c e7 ff ff 	movw   $0x3631,-0x18c4(%ebp)
    81a6:	31 36 
    81a8:	c6 85 3e e7 ff ff 00 	movb   $0x0,-0x18c2(%ebp)
    81af:	c7 85 40 e7 ff ff 10 	movl   $0x10,-0x18c0(%ebp)
    81b6:	00 00 00 
    81b9:	c7 85 44 e7 ff ff 10 	movl   $0x10,-0x18bc(%ebp)
    81c0:	00 00 00 
    81c3:	c7 85 48 e7 ff ff 01 	movl   $0x1,-0x18b8(%ebp)
    81ca:	00 00 00 
    81cd:	c7 85 4c e7 ff ff 01 	movl   $0x1,-0x18b4(%ebp)
    81d4:	00 00 00 
    81d7:	c7 85 50 e7 ff ff ff 	movl   $0xffffffff,-0x18b0(%ebp)
    81de:	ff ff ff 
    81e1:	c7 85 54 e7 ff ff 00 	movl   $0x0,-0x18ac(%ebp)
    81e8:	00 00 00 
    81eb:	c7 85 58 e7 ff ff 00 	movl   $0x0,-0x18a8(%ebp)
    81f2:	00 00 00 
    81f5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    81fb:	89 85 5c e7 ff ff    	mov    %eax,-0x18a4(%ebp)
    8201:	c7 85 60 e7 ff ff ff 	movl   $0x1ff,-0x18a0(%ebp)
    8208:	01 00 00 
    820b:	66 c7 85 64 e7 ff ff 	movw   $0x3731,-0x189c(%ebp)
    8212:	31 37 
    8214:	c6 85 66 e7 ff ff 00 	movb   $0x0,-0x189a(%ebp)
    821b:	c7 85 68 e7 ff ff 10 	movl   $0x10,-0x1898(%ebp)
    8222:	00 00 00 
    8225:	c7 85 6c e7 ff ff 10 	movl   $0x10,-0x1894(%ebp)
    822c:	00 00 00 
    822f:	c7 85 70 e7 ff ff 02 	movl   $0x2,-0x1890(%ebp)
    8236:	00 00 00 
    8239:	c7 85 74 e7 ff ff 03 	movl   $0x3,-0x188c(%ebp)
    8240:	00 00 00 
    8243:	c7 85 78 e7 ff ff 10 	movl   $0x10,-0x1888(%ebp)
    824a:	00 00 00 
    824d:	c7 85 7c e7 ff ff 00 	movl   $0x0,-0x1884(%ebp)
    8254:	00 00 00 
    8257:	c7 85 80 e7 ff ff 00 	movl   $0x0,-0x1880(%ebp)
    825e:	00 00 00 
    8261:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    8267:	89 85 84 e7 ff ff    	mov    %eax,-0x187c(%ebp)
    826d:	c7 85 88 e7 ff ff ff 	movl   $0x1ff,-0x1878(%ebp)
    8274:	01 00 00 
    8277:	66 c7 85 8c e7 ff ff 	movw   $0x3831,-0x1874(%ebp)
    827e:	31 38 
    8280:	c6 85 8e e7 ff ff 00 	movb   $0x0,-0x1872(%ebp)
    8287:	c7 85 90 e7 ff ff 10 	movl   $0x10,-0x1870(%ebp)
    828e:	00 00 00 
    8291:	c7 85 94 e7 ff ff 10 	movl   $0x10,-0x186c(%ebp)
    8298:	00 00 00 
    829b:	c7 85 98 e7 ff ff 03 	movl   $0x3,-0x1868(%ebp)
    82a2:	00 00 00 
    82a5:	c7 85 9c e7 ff ff 07 	movl   $0x7,-0x1864(%ebp)
    82ac:	00 00 00 
    82af:	c7 85 a0 e7 ff ff 10 	movl   $0x10,-0x1860(%ebp)
    82b6:	00 00 00 
    82b9:	c7 85 a4 e7 ff ff 00 	movl   $0x0,-0x185c(%ebp)
    82c0:	00 00 00 
    82c3:	c7 85 a8 e7 ff ff 00 	movl   $0x0,-0x1858(%ebp)
    82ca:	00 00 00 
    82cd:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    82d3:	89 85 ac e7 ff ff    	mov    %eax,-0x1854(%ebp)
    82d9:	c7 85 b0 e7 ff ff ff 	movl   $0x1ff,-0x1850(%ebp)
    82e0:	01 00 00 
    82e3:	66 c7 85 b4 e7 ff ff 	movw   $0x3931,-0x184c(%ebp)
    82ea:	31 39 
    82ec:	c6 85 b6 e7 ff ff 00 	movb   $0x0,-0x184a(%ebp)
    82f3:	c7 85 b8 e7 ff ff 10 	movl   $0x10,-0x1848(%ebp)
    82fa:	00 00 00 
    82fd:	c7 85 bc e7 ff ff 10 	movl   $0x10,-0x1844(%ebp)
    8304:	00 00 00 
    8307:	c7 85 c0 e7 ff ff 04 	movl   $0x4,-0x1840(%ebp)
    830e:	00 00 00 
    8311:	c7 85 c4 e7 ff ff 0f 	movl   $0xf,-0x183c(%ebp)
    8318:	00 00 00 
    831b:	c7 85 c8 e7 ff ff 10 	movl   $0x10,-0x1838(%ebp)
    8322:	00 00 00 
    8325:	c7 85 cc e7 ff ff 00 	movl   $0x0,-0x1834(%ebp)
    832c:	00 00 00 
    832f:	c7 85 d0 e7 ff ff 00 	movl   $0x0,-0x1830(%ebp)
    8336:	00 00 00 
    8339:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    833f:	89 85 d4 e7 ff ff    	mov    %eax,-0x182c(%ebp)
    8345:	c7 85 d8 e7 ff ff ff 	movl   $0x1ff,-0x1828(%ebp)
    834c:	01 00 00 
    834f:	66 c7 85 dc e7 ff ff 	movw   $0x3032,-0x1824(%ebp)
    8356:	32 30 
    8358:	c6 85 de e7 ff ff 00 	movb   $0x0,-0x1822(%ebp)
    835f:	c7 85 e0 e7 ff ff 10 	movl   $0x10,-0x1820(%ebp)
    8366:	00 00 00 
    8369:	c7 85 e4 e7 ff ff 10 	movl   $0x10,-0x181c(%ebp)
    8370:	00 00 00 
    8373:	c7 85 e8 e7 ff ff 06 	movl   $0x6,-0x1818(%ebp)
    837a:	00 00 00 
    837d:	c7 85 ec e7 ff ff 3f 	movl   $0x3f,-0x1814(%ebp)
    8384:	00 00 00 
    8387:	c7 85 f0 e7 ff ff 10 	movl   $0x10,-0x1810(%ebp)
    838e:	00 00 00 
    8391:	c7 85 f4 e7 ff ff 00 	movl   $0x0,-0x180c(%ebp)
    8398:	00 00 00 
    839b:	c7 85 f8 e7 ff ff 00 	movl   $0x0,-0x1808(%ebp)
    83a2:	00 00 00 
    83a5:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    83ab:	89 85 fc e7 ff ff    	mov    %eax,-0x1804(%ebp)
    83b1:	c7 85 00 e8 ff ff ff 	movl   $0x1ff,-0x1800(%ebp)
    83b8:	01 00 00 
    83bb:	66 c7 85 04 e8 ff ff 	movw   $0x3132,-0x17fc(%ebp)
    83c2:	32 31 
    83c4:	c6 85 06 e8 ff ff 00 	movb   $0x0,-0x17fa(%ebp)
    83cb:	c7 85 08 e8 ff ff 10 	movl   $0x10,-0x17f8(%ebp)
    83d2:	00 00 00 
    83d5:	c7 85 0c e8 ff ff 10 	movl   $0x10,-0x17f4(%ebp)
    83dc:	00 00 00 
    83df:	c7 85 10 e8 ff ff 08 	movl   $0x8,-0x17f0(%ebp)
    83e6:	00 00 00 
    83e9:	c7 85 14 e8 ff ff ff 	movl   $0xff,-0x17ec(%ebp)
    83f0:	00 00 00 
    83f3:	c7 85 18 e8 ff ff 10 	movl   $0x10,-0x17e8(%ebp)
    83fa:	00 00 00 
    83fd:	c7 85 1c e8 ff ff 00 	movl   $0x0,-0x17e4(%ebp)
    8404:	00 00 00 
    8407:	c7 85 20 e8 ff ff 00 	movl   $0x0,-0x17e0(%ebp)
    840e:	00 00 00 
    8411:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    8417:	89 85 24 e8 ff ff    	mov    %eax,-0x17dc(%ebp)
    841d:	c7 85 28 e8 ff ff ff 	movl   $0x1ff,-0x17d8(%ebp)
    8424:	01 00 00 
    8427:	66 c7 85 2c e8 ff ff 	movw   $0x3232,-0x17d4(%ebp)
    842e:	32 32 
    8430:	c6 85 2e e8 ff ff 00 	movb   $0x0,-0x17d2(%ebp)
    8437:	c7 85 30 e8 ff ff 10 	movl   $0x10,-0x17d0(%ebp)
    843e:	00 00 00 
    8441:	c7 85 34 e8 ff ff 10 	movl   $0x10,-0x17cc(%ebp)
    8448:	00 00 00 
    844b:	c7 85 38 e8 ff ff 0a 	movl   $0xa,-0x17c8(%ebp)
    8452:	00 00 00 
    8455:	c7 85 3c e8 ff ff ff 	movl   $0x3ff,-0x17c4(%ebp)
    845c:	03 00 00 
    845f:	c7 85 40 e8 ff ff 10 	movl   $0x10,-0x17c0(%ebp)
    8466:	00 00 00 
    8469:	c7 85 44 e8 ff ff 00 	movl   $0x0,-0x17bc(%ebp)
    8470:	00 00 00 
    8473:	c7 85 48 e8 ff ff 00 	movl   $0x0,-0x17b8(%ebp)
    847a:	00 00 00 
    847d:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    8483:	89 85 4c e8 ff ff    	mov    %eax,-0x17b4(%ebp)
    8489:	c7 85 50 e8 ff ff ff 	movl   $0x1ff,-0x17b0(%ebp)
    8490:	01 00 00 
    8493:	66 c7 85 54 e8 ff ff 	movw   $0x3332,-0x17ac(%ebp)
    849a:	32 33 
    849c:	c6 85 56 e8 ff ff 00 	movb   $0x0,-0x17aa(%ebp)
    84a3:	c7 85 58 e8 ff ff 10 	movl   $0x10,-0x17a8(%ebp)
    84aa:	00 00 00 
    84ad:	c7 85 5c e8 ff ff 10 	movl   $0x10,-0x17a4(%ebp)
    84b4:	00 00 00 
    84b7:	c7 85 60 e8 ff ff 0d 	movl   $0xd,-0x17a0(%ebp)
    84be:	00 00 00 
    84c1:	c7 85 64 e8 ff ff ff 	movl   $0x1fff,-0x179c(%ebp)
    84c8:	1f 00 00 
    84cb:	c7 85 68 e8 ff ff 10 	movl   $0x10,-0x1798(%ebp)
    84d2:	00 00 00 
    84d5:	c7 85 6c e8 ff ff 00 	movl   $0x0,-0x1794(%ebp)
    84dc:	00 00 00 
    84df:	c7 85 70 e8 ff ff 00 	movl   $0x0,-0x1790(%ebp)
    84e6:	00 00 00 
    84e9:	8d 85 88 ee ff ff    	lea    -0x1178(%ebp),%eax
    84ef:	89 85 74 e8 ff ff    	mov    %eax,-0x178c(%ebp)
    84f5:	c7 85 78 e8 ff ff ff 	movl   $0x1ff,-0x1788(%ebp)
    84fc:	01 00 00 
    84ff:	66 c7 85 7c e8 ff ff 	movw   $0x3432,-0x1784(%ebp)
    8506:	32 34 
    8508:	c6 85 7e e8 ff ff 00 	movb   $0x0,-0x1782(%ebp)
    850f:	c7 85 80 e8 ff ff 10 	movl   $0x10,-0x1780(%ebp)
    8516:	00 00 00 
    8519:	c7 85 84 e8 ff ff 10 	movl   $0x10,-0x177c(%ebp)
    8520:	00 00 00 
    8523:	c7 85 88 e8 ff ff 04 	movl   $0x4,-0x1778(%ebp)
    852a:	00 00 00 
    852d:	c7 85 8c e8 ff ff 0f 	movl   $0xf,-0x1774(%ebp)
    8534:	00 00 00 
    8537:	c7 85 90 e8 ff ff ff 	movl   $0xffffffff,-0x1770(%ebp)
    853e:	ff ff ff 
    8541:	c7 85 94 e8 ff ff 00 	movl   $0x0,-0x176c(%ebp)
    8548:	00 00 00 
    854b:	c7 85 98 e8 ff ff 00 	movl   $0x0,-0x1768(%ebp)
    8552:	00 00 00 
    8555:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    855b:	89 85 9c e8 ff ff    	mov    %eax,-0x1764(%ebp)
    8561:	c7 85 a0 e8 ff ff 00 	movl   $0x200,-0x1760(%ebp)
    8568:	02 00 00 
    856b:	66 c7 85 a4 e8 ff ff 	movw   $0x3532,-0x175c(%ebp)
    8572:	32 35 
    8574:	c6 85 a6 e8 ff ff 00 	movb   $0x0,-0x175a(%ebp)
    857b:	c7 85 a8 e8 ff ff 10 	movl   $0x10,-0x1758(%ebp)
    8582:	00 00 00 
    8585:	c7 85 ac e8 ff ff 10 	movl   $0x10,-0x1754(%ebp)
    858c:	00 00 00 
    858f:	c7 85 b0 e8 ff ff 05 	movl   $0x5,-0x1750(%ebp)
    8596:	00 00 00 
    8599:	c7 85 b4 e8 ff ff 1f 	movl   $0x1f,-0x174c(%ebp)
    85a0:	00 00 00 
    85a3:	c7 85 b8 e8 ff ff 18 	movl   $0x18,-0x1748(%ebp)
    85aa:	00 00 00 
    85ad:	c7 85 bc e8 ff ff 00 	movl   $0x0,-0x1744(%ebp)
    85b4:	00 00 00 
    85b7:	c7 85 c0 e8 ff ff 00 	movl   $0x0,-0x1740(%ebp)
    85be:	00 00 00 
    85c1:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    85c7:	89 85 c4 e8 ff ff    	mov    %eax,-0x173c(%ebp)
    85cd:	c7 85 c8 e8 ff ff 00 	movl   $0x200,-0x1738(%ebp)
    85d4:	02 00 00 
    85d7:	66 c7 85 cc e8 ff ff 	movw   $0x3632,-0x1734(%ebp)
    85de:	32 36 
    85e0:	c6 85 ce e8 ff ff 00 	movb   $0x0,-0x1732(%ebp)
    85e7:	c7 85 d0 e8 ff ff 10 	movl   $0x10,-0x1730(%ebp)
    85ee:	00 00 00 
    85f1:	c7 85 d4 e8 ff ff 10 	movl   $0x10,-0x172c(%ebp)
    85f8:	00 00 00 
    85fb:	c7 85 d8 e8 ff ff 06 	movl   $0x6,-0x1728(%ebp)
    8602:	00 00 00 
    8605:	c7 85 dc e8 ff ff 3f 	movl   $0x3f,-0x1724(%ebp)
    860c:	00 00 00 
    860f:	c7 85 e0 e8 ff ff 18 	movl   $0x18,-0x1720(%ebp)
    8616:	00 00 00 
    8619:	c7 85 e4 e8 ff ff 00 	movl   $0x0,-0x171c(%ebp)
    8620:	00 00 00 
    8623:	c7 85 e8 e8 ff ff 00 	movl   $0x0,-0x1718(%ebp)
    862a:	00 00 00 
    862d:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8633:	89 85 ec e8 ff ff    	mov    %eax,-0x1714(%ebp)
    8639:	c7 85 f0 e8 ff ff 00 	movl   $0x200,-0x1710(%ebp)
    8640:	02 00 00 
    8643:	66 c7 85 f4 e8 ff ff 	movw   $0x3732,-0x170c(%ebp)
    864a:	32 37 
    864c:	c6 85 f6 e8 ff ff 00 	movb   $0x0,-0x170a(%ebp)
    8653:	c7 85 f8 e8 ff ff 10 	movl   $0x10,-0x1708(%ebp)
    865a:	00 00 00 
    865d:	c7 85 fc e8 ff ff 10 	movl   $0x10,-0x1704(%ebp)
    8664:	00 00 00 
    8667:	c7 85 00 e9 ff ff 07 	movl   $0x7,-0x1700(%ebp)
    866e:	00 00 00 
    8671:	c7 85 04 e9 ff ff 7f 	movl   $0x7f,-0x16fc(%ebp)
    8678:	00 00 00 
    867b:	c7 85 08 e9 ff ff 18 	movl   $0x18,-0x16f8(%ebp)
    8682:	00 00 00 
    8685:	c7 85 0c e9 ff ff 00 	movl   $0x0,-0x16f4(%ebp)
    868c:	00 00 00 
    868f:	c7 85 10 e9 ff ff 00 	movl   $0x0,-0x16f0(%ebp)
    8696:	00 00 00 
    8699:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    869f:	89 85 14 e9 ff ff    	mov    %eax,-0x16ec(%ebp)
    86a5:	c7 85 18 e9 ff ff 00 	movl   $0x200,-0x16e8(%ebp)
    86ac:	02 00 00 
    86af:	66 c7 85 1c e9 ff ff 	movw   $0x3832,-0x16e4(%ebp)
    86b6:	32 38 
    86b8:	c6 85 1e e9 ff ff 00 	movb   $0x0,-0x16e2(%ebp)
    86bf:	c7 85 20 e9 ff ff 10 	movl   $0x10,-0x16e0(%ebp)
    86c6:	00 00 00 
    86c9:	c7 85 24 e9 ff ff 10 	movl   $0x10,-0x16dc(%ebp)
    86d0:	00 00 00 
    86d3:	c7 85 28 e9 ff ff 08 	movl   $0x8,-0x16d8(%ebp)
    86da:	00 00 00 
    86dd:	c7 85 2c e9 ff ff ff 	movl   $0xff,-0x16d4(%ebp)
    86e4:	00 00 00 
    86e7:	c7 85 30 e9 ff ff 18 	movl   $0x18,-0x16d0(%ebp)
    86ee:	00 00 00 
    86f1:	c7 85 34 e9 ff ff 00 	movl   $0x0,-0x16cc(%ebp)
    86f8:	00 00 00 
    86fb:	c7 85 38 e9 ff ff 00 	movl   $0x0,-0x16c8(%ebp)
    8702:	00 00 00 
    8705:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    870b:	89 85 3c e9 ff ff    	mov    %eax,-0x16c4(%ebp)
    8711:	c7 85 40 e9 ff ff 00 	movl   $0x200,-0x16c0(%ebp)
    8718:	02 00 00 
    871b:	66 c7 85 44 e9 ff ff 	movw   $0x3932,-0x16bc(%ebp)
    8722:	32 39 
    8724:	c6 85 46 e9 ff ff 00 	movb   $0x0,-0x16ba(%ebp)
    872b:	c7 85 48 e9 ff ff 10 	movl   $0x10,-0x16b8(%ebp)
    8732:	00 00 00 
    8735:	c7 85 4c e9 ff ff 10 	movl   $0x10,-0x16b4(%ebp)
    873c:	00 00 00 
    873f:	c7 85 50 e9 ff ff 09 	movl   $0x9,-0x16b0(%ebp)
    8746:	00 00 00 
    8749:	c7 85 54 e9 ff ff ff 	movl   $0x1ff,-0x16ac(%ebp)
    8750:	01 00 00 
    8753:	c7 85 58 e9 ff ff 18 	movl   $0x18,-0x16a8(%ebp)
    875a:	00 00 00 
    875d:	c7 85 5c e9 ff ff 00 	movl   $0x0,-0x16a4(%ebp)
    8764:	00 00 00 
    8767:	c7 85 60 e9 ff ff 00 	movl   $0x0,-0x16a0(%ebp)
    876e:	00 00 00 
    8771:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    8777:	89 85 64 e9 ff ff    	mov    %eax,-0x169c(%ebp)
    877d:	c7 85 68 e9 ff ff 00 	movl   $0x200,-0x1698(%ebp)
    8784:	02 00 00 
    8787:	66 c7 85 6c e9 ff ff 	movw   $0x3033,-0x1694(%ebp)
    878e:	33 30 
    8790:	c6 85 6e e9 ff ff 00 	movb   $0x0,-0x1692(%ebp)
    8797:	c7 85 70 e9 ff ff 10 	movl   $0x10,-0x1690(%ebp)
    879e:	00 00 00 
    87a1:	c7 85 74 e9 ff ff 10 	movl   $0x10,-0x168c(%ebp)
    87a8:	00 00 00 
    87ab:	c7 85 78 e9 ff ff 0b 	movl   $0xb,-0x1688(%ebp)
    87b2:	00 00 00 
    87b5:	c7 85 7c e9 ff ff ff 	movl   $0x7ff,-0x1684(%ebp)
    87bc:	07 00 00 
    87bf:	c7 85 80 e9 ff ff 18 	movl   $0x18,-0x1680(%ebp)
    87c6:	00 00 00 
    87c9:	c7 85 84 e9 ff ff 00 	movl   $0x0,-0x167c(%ebp)
    87d0:	00 00 00 
    87d3:	c7 85 88 e9 ff ff 00 	movl   $0x0,-0x1678(%ebp)
    87da:	00 00 00 
    87dd:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    87e3:	89 85 8c e9 ff ff    	mov    %eax,-0x1674(%ebp)
    87e9:	c7 85 90 e9 ff ff 00 	movl   $0x200,-0x1670(%ebp)
    87f0:	02 00 00 
    87f3:	66 c7 85 94 e9 ff ff 	movw   $0x3133,-0x166c(%ebp)
    87fa:	33 31 
    87fc:	c6 85 96 e9 ff ff 00 	movb   $0x0,-0x166a(%ebp)
    8803:	c7 85 98 e9 ff ff 10 	movl   $0x10,-0x1668(%ebp)
    880a:	00 00 00 
    880d:	c7 85 9c e9 ff ff 10 	movl   $0x10,-0x1664(%ebp)
    8814:	00 00 00 
    8817:	c7 85 a0 e9 ff ff 0d 	movl   $0xd,-0x1660(%ebp)
    881e:	00 00 00 
    8821:	c7 85 a4 e9 ff ff ff 	movl   $0x1fff,-0x165c(%ebp)
    8828:	1f 00 00 
    882b:	c7 85 a8 e9 ff ff 18 	movl   $0x18,-0x1658(%ebp)
    8832:	00 00 00 
    8835:	c7 85 ac e9 ff ff 00 	movl   $0x0,-0x1654(%ebp)
    883c:	00 00 00 
    883f:	c7 85 b0 e9 ff ff 00 	movl   $0x0,-0x1650(%ebp)
    8846:	00 00 00 
    8849:	8d 85 88 ea ff ff    	lea    -0x1578(%ebp),%eax
    884f:	89 85 b4 e9 ff ff    	mov    %eax,-0x164c(%ebp)
    8855:	c7 85 b8 e9 ff ff 00 	movl   $0x200,-0x1648(%ebp)
    885c:	02 00 00 
    885f:	66 c7 85 bc e9 ff ff 	movw   $0x3233,-0x1644(%ebp)
    8866:	33 32 
    8868:	c6 85 be e9 ff ff 00 	movb   $0x0,-0x1642(%ebp)
    886f:	c7 85 c0 e9 ff ff 01 	movl   $0x1,-0x1640(%ebp)
    8876:	00 00 00 
    8879:	c7 85 c4 e9 ff ff 10 	movl   $0x10,-0x163c(%ebp)
    8880:	00 00 00 
    8883:	c7 85 c8 e9 ff ff 00 	movl   $0x0,-0x1638(%ebp)
    888a:	00 00 00 
    888d:	c7 85 cc e9 ff ff 00 	movl   $0x0,-0x1634(%ebp)
    8894:	00 00 00 
    8897:	c7 85 d0 e9 ff ff ff 	movl   $0xffffffff,-0x1630(%ebp)
    889e:	ff ff ff 
    88a1:	c7 85 d4 e9 ff ff 00 	movl   $0x0,-0x162c(%ebp)
    88a8:	00 00 00 
    88ab:	c7 85 d8 e9 ff ff 00 	movl   $0x0,-0x1628(%ebp)
    88b2:	00 00 00 
    88b5:	8d 85 4a ea ff ff    	lea    -0x15b6(%ebp),%eax
    88bb:	89 85 dc e9 ff ff    	mov    %eax,-0x1624(%ebp)
    88c1:	c7 85 e0 e9 ff ff 1f 	movl   $0x1f,-0x1620(%ebp)
    88c8:	00 00 00 
    88cb:	66 c7 85 e4 e9 ff ff 	movw   $0x3333,-0x161c(%ebp)
    88d2:	33 33 
    88d4:	c6 85 e6 e9 ff ff 00 	movb   $0x0,-0x161a(%ebp)
    88db:	c7 85 e8 e9 ff ff 01 	movl   $0x1,-0x1618(%ebp)
    88e2:	00 00 00 
    88e5:	c7 85 ec e9 ff ff 10 	movl   $0x10,-0x1614(%ebp)
    88ec:	00 00 00 
    88ef:	c7 85 f0 e9 ff ff 00 	movl   $0x0,-0x1610(%ebp)
    88f6:	00 00 00 
    88f9:	c7 85 f4 e9 ff ff 00 	movl   $0x0,-0x160c(%ebp)
    8900:	00 00 00 
    8903:	c7 85 f8 e9 ff ff ff 	movl   $0xffffffff,-0x1608(%ebp)
    890a:	ff ff ff 
    890d:	c7 85 fc e9 ff ff 00 	movl   $0x0,-0x1604(%ebp)
    8914:	00 00 00 
    8917:	c7 85 00 ea ff ff 00 	movl   $0x0,-0x1600(%ebp)
    891e:	00 00 00 
    8921:	8d 85 0c ea ff ff    	lea    -0x15f4(%ebp),%eax
    8927:	89 85 04 ea ff ff    	mov    %eax,-0x15fc(%ebp)
    892d:	c7 85 08 ea ff ff 1f 	movl   $0x1f,-0x15f8(%ebp)
    8934:	00 00 00 
		{"31", 16, 16, 13, 8191, 24, 0, 0, h24, 512},
		{"32", 1, 16, 0, 0, -1, 0, 0, hA, 31},
		{"33", 1, 16, 0, 0, -1, 0, 0, hB, 31}
	};
	ht[0] = ht[0];
}
    8937:	81 c4 40 1b 00 00    	add    $0x1b40,%esp
    893d:	5b                   	pop    %ebx
    893e:	5e                   	pop    %esi
    893f:	5f                   	pop    %edi
    8940:	5d                   	pop    %ebp
    8941:	c3                   	ret    

00008942 <huffman_decoder>:


/* ����huffman����	*/
/* ע��! ��counta,countb - 4 bit ֵ �� y����, discard x */
int huffman_decoder(struct huffcodetab *h, int *x, int *y, int *v, int *w)
{  
    8942:	55                   	push   %ebp
    8943:	89 e5                	mov    %esp,%ebp
    8945:	53                   	push   %ebx
    8946:	83 ec 24             	sub    $0x24,%esp
  HUFFBITS level;
  int point = 0;
    8949:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int error = 1;
    8950:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
  level     = dmask;
    8957:	a1 f0 10 01 00       	mov    0x110f0,%eax
    895c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if (h->val == 0) return 2;
    895f:	8b 45 08             	mov    0x8(%ebp),%eax
    8962:	8b 40 20             	mov    0x20(%eax),%eax
    8965:	85 c0                	test   %eax,%eax
    8967:	75 0a                	jne    8973 <huffman_decoder+0x31>
    8969:	b8 02 00 00 00       	mov    $0x2,%eax
    896e:	e9 0d 03 00 00       	jmp    8c80 <huffman_decoder+0x33e>

  /* table 0 ����Ҫ bits */
  if ( h->treelen == 0)
    8973:	8b 45 08             	mov    0x8(%ebp),%eax
    8976:	8b 40 24             	mov    0x24(%eax),%eax
    8979:	85 c0                	test   %eax,%eax
    897b:	75 1d                	jne    899a <huffman_decoder+0x58>
  {  *x = *y = 0;
    897d:	8b 45 10             	mov    0x10(%ebp),%eax
    8980:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    8986:	8b 45 10             	mov    0x10(%ebp),%eax
    8989:	8b 10                	mov    (%eax),%edx
    898b:	8b 45 0c             	mov    0xc(%ebp),%eax
    898e:	89 10                	mov    %edx,(%eax)
     return 0;
    8990:	b8 00 00 00 00       	mov    $0x0,%eax
    8995:	e9 e6 02 00 00       	jmp    8c80 <huffman_decoder+0x33e>


  /* ���� Huffman table. */

  do {
    if (h->val[point][0]==0) {   /*���Ľ�β*/
    899a:	8b 45 08             	mov    0x8(%ebp),%eax
    899d:	8b 40 20             	mov    0x20(%eax),%eax
    89a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89a3:	01 d2                	add    %edx,%edx
    89a5:	01 d0                	add    %edx,%eax
    89a7:	0f b6 00             	movzbl (%eax),%eax
    89aa:	84 c0                	test   %al,%al
    89ac:	75 46                	jne    89f4 <huffman_decoder+0xb2>
      *x = h->val[point][1] >> 4;
    89ae:	8b 45 08             	mov    0x8(%ebp),%eax
    89b1:	8b 40 20             	mov    0x20(%eax),%eax
    89b4:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89b7:	01 d2                	add    %edx,%edx
    89b9:	01 d0                	add    %edx,%eax
    89bb:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    89bf:	c0 e8 04             	shr    $0x4,%al
    89c2:	0f b6 d0             	movzbl %al,%edx
    89c5:	8b 45 0c             	mov    0xc(%ebp),%eax
    89c8:	89 10                	mov    %edx,(%eax)
      *y = h->val[point][1] & 0xf;
    89ca:	8b 45 08             	mov    0x8(%ebp),%eax
    89cd:	8b 40 20             	mov    0x20(%eax),%eax
    89d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    89d3:	01 d2                	add    %edx,%edx
    89d5:	01 d0                	add    %edx,%eax
    89d7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    89db:	0f b6 c0             	movzbl %al,%eax
    89de:	83 e0 0f             	and    $0xf,%eax
    89e1:	89 c2                	mov    %eax,%edx
    89e3:	8b 45 10             	mov    0x10(%ebp),%eax
    89e6:	89 10                	mov    %edx,(%eax)

      error = 0;
    89e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
      break;
    89ef:	e9 af 00 00 00       	jmp    8aa3 <huffman_decoder+0x161>
    } 
    if (hget1bit()) {
    89f4:	e8 a7 e6 ff ff       	call   70a0 <hget1bit>
    89f9:	85 c0                	test   %eax,%eax
    89fb:	74 47                	je     8a44 <huffman_decoder+0x102>
      while (h->val[point][1] >= MXOFF) point += h->val[point][1]; 
    89fd:	eb 17                	jmp    8a16 <huffman_decoder+0xd4>
    89ff:	8b 45 08             	mov    0x8(%ebp),%eax
    8a02:	8b 40 20             	mov    0x20(%eax),%eax
    8a05:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a08:	01 d2                	add    %edx,%edx
    8a0a:	01 d0                	add    %edx,%eax
    8a0c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8a10:	0f b6 c0             	movzbl %al,%eax
    8a13:	01 45 f0             	add    %eax,-0x10(%ebp)
    8a16:	8b 45 08             	mov    0x8(%ebp),%eax
    8a19:	8b 40 20             	mov    0x20(%eax),%eax
    8a1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a1f:	01 d2                	add    %edx,%edx
    8a21:	01 d0                	add    %edx,%eax
    8a23:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8a27:	3c f9                	cmp    $0xf9,%al
    8a29:	77 d4                	ja     89ff <huffman_decoder+0xbd>
      point += h->val[point][1];
    8a2b:	8b 45 08             	mov    0x8(%ebp),%eax
    8a2e:	8b 40 20             	mov    0x20(%eax),%eax
    8a31:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a34:	01 d2                	add    %edx,%edx
    8a36:	01 d0                	add    %edx,%eax
    8a38:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8a3c:	0f b6 c0             	movzbl %al,%eax
    8a3f:	01 45 f0             	add    %eax,-0x10(%ebp)
    8a42:	eb 42                	jmp    8a86 <huffman_decoder+0x144>
    }
    else {
      while (h->val[point][0] >= MXOFF) point += h->val[point][0]; 
    8a44:	eb 16                	jmp    8a5c <huffman_decoder+0x11a>
    8a46:	8b 45 08             	mov    0x8(%ebp),%eax
    8a49:	8b 40 20             	mov    0x20(%eax),%eax
    8a4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a4f:	01 d2                	add    %edx,%edx
    8a51:	01 d0                	add    %edx,%eax
    8a53:	0f b6 00             	movzbl (%eax),%eax
    8a56:	0f b6 c0             	movzbl %al,%eax
    8a59:	01 45 f0             	add    %eax,-0x10(%ebp)
    8a5c:	8b 45 08             	mov    0x8(%ebp),%eax
    8a5f:	8b 40 20             	mov    0x20(%eax),%eax
    8a62:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a65:	01 d2                	add    %edx,%edx
    8a67:	01 d0                	add    %edx,%eax
    8a69:	0f b6 00             	movzbl (%eax),%eax
    8a6c:	3c f9                	cmp    $0xf9,%al
    8a6e:	77 d6                	ja     8a46 <huffman_decoder+0x104>
      point += h->val[point][0];
    8a70:	8b 45 08             	mov    0x8(%ebp),%eax
    8a73:	8b 40 20             	mov    0x20(%eax),%eax
    8a76:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a79:	01 d2                	add    %edx,%edx
    8a7b:	01 d0                	add    %edx,%eax
    8a7d:	0f b6 00             	movzbl (%eax),%eax
    8a80:	0f b6 c0             	movzbl %al,%eax
    8a83:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    level >>= 1;
    8a86:	d1 6d f4             	shrl   -0xc(%ebp)
  } while (level  || (point < ht->treelen) );
    8a89:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    8a8d:	0f 85 07 ff ff ff    	jne    899a <huffman_decoder+0x58>
    8a93:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8a96:	a1 04 4f 01 00       	mov    0x14f04,%eax
    8a9b:	39 c2                	cmp    %eax,%edx
    8a9d:	0f 82 f7 fe ff ff    	jb     899a <huffman_decoder+0x58>
  
  /* ������ */
  
  if (error) { /* ���� x �� y Ϊһ�м�ֵ */
    8aa3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    8aa7:	74 24                	je     8acd <huffman_decoder+0x18b>
    //print(0, "Illegal Huffman code in data.\n");
    *x = ((h->xlen-1) << 1);
    8aa9:	8b 45 08             	mov    0x8(%ebp),%eax
    8aac:	8b 40 04             	mov    0x4(%eax),%eax
    8aaf:	83 e8 01             	sub    $0x1,%eax
    8ab2:	01 c0                	add    %eax,%eax
    8ab4:	89 c2                	mov    %eax,%edx
    8ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
    8ab9:	89 10                	mov    %edx,(%eax)
    *y = ((h->ylen-1) << 1);
    8abb:	8b 45 08             	mov    0x8(%ebp),%eax
    8abe:	8b 40 08             	mov    0x8(%eax),%eax
    8ac1:	83 e8 01             	sub    $0x1,%eax
    8ac4:	01 c0                	add    %eax,%eax
    8ac6:	89 c2                	mov    %eax,%edx
    8ac8:	8b 45 10             	mov    0x10(%ebp),%eax
    8acb:	89 10                	mov    %edx,(%eax)
  }

  /* �����źű��� */

  if (h->tablename[0] == '3'
    8acd:	8b 45 08             	mov    0x8(%ebp),%eax
    8ad0:	0f b6 00             	movzbl (%eax),%eax
    8ad3:	3c 33                	cmp    $0x33,%al
    8ad5:	0f 85 ec 00 00 00    	jne    8bc7 <huffman_decoder+0x285>
      && (h->tablename[1] == '2' || h->tablename[1] == '3')) {
    8adb:	8b 45 08             	mov    0x8(%ebp),%eax
    8ade:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8ae2:	3c 32                	cmp    $0x32,%al
    8ae4:	74 0f                	je     8af5 <huffman_decoder+0x1b3>
    8ae6:	8b 45 08             	mov    0x8(%ebp),%eax
    8ae9:	0f b6 40 01          	movzbl 0x1(%eax),%eax
    8aed:	3c 33                	cmp    $0x33,%al
    8aef:	0f 85 d2 00 00 00    	jne    8bc7 <huffman_decoder+0x285>
     *v = (*y>>3) & 1;
    8af5:	8b 45 10             	mov    0x10(%ebp),%eax
    8af8:	8b 00                	mov    (%eax),%eax
    8afa:	c1 f8 03             	sar    $0x3,%eax
    8afd:	83 e0 01             	and    $0x1,%eax
    8b00:	89 c2                	mov    %eax,%edx
    8b02:	8b 45 14             	mov    0x14(%ebp),%eax
    8b05:	89 10                	mov    %edx,(%eax)
     *w = (*y>>2) & 1;
    8b07:	8b 45 10             	mov    0x10(%ebp),%eax
    8b0a:	8b 00                	mov    (%eax),%eax
    8b0c:	c1 f8 02             	sar    $0x2,%eax
    8b0f:	83 e0 01             	and    $0x1,%eax
    8b12:	89 c2                	mov    %eax,%edx
    8b14:	8b 45 18             	mov    0x18(%ebp),%eax
    8b17:	89 10                	mov    %edx,(%eax)
     *x = (*y>>1) & 1;
    8b19:	8b 45 10             	mov    0x10(%ebp),%eax
    8b1c:	8b 00                	mov    (%eax),%eax
    8b1e:	d1 f8                	sar    %eax
    8b20:	83 e0 01             	and    $0x1,%eax
    8b23:	89 c2                	mov    %eax,%edx
    8b25:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b28:	89 10                	mov    %edx,(%eax)
     *y = *y & 1;
    8b2a:	8b 45 10             	mov    0x10(%ebp),%eax
    8b2d:	8b 00                	mov    (%eax),%eax
    8b2f:	83 e0 01             	and    $0x1,%eax
    8b32:	89 c2                	mov    %eax,%edx
    8b34:	8b 45 10             	mov    0x10(%ebp),%eax
    8b37:	89 10                	mov    %edx,(%eax)
     /* v, w, x �� y �ڱ��������ǵߵ��ģ��������� 
         */
     
/*   {int i=*v; *v=*y; *y=i; i=*w; *w=*x; *x=i;}  MI */

     if (*v)
    8b39:	8b 45 14             	mov    0x14(%ebp),%eax
    8b3c:	8b 00                	mov    (%eax),%eax
    8b3e:	85 c0                	test   %eax,%eax
    8b40:	74 18                	je     8b5a <huffman_decoder+0x218>
        if (hget1bit() == 1) *v = -*v;
    8b42:	e8 59 e5 ff ff       	call   70a0 <hget1bit>
    8b47:	83 f8 01             	cmp    $0x1,%eax
    8b4a:	75 0e                	jne    8b5a <huffman_decoder+0x218>
    8b4c:	8b 45 14             	mov    0x14(%ebp),%eax
    8b4f:	8b 00                	mov    (%eax),%eax
    8b51:	f7 d8                	neg    %eax
    8b53:	89 c2                	mov    %eax,%edx
    8b55:	8b 45 14             	mov    0x14(%ebp),%eax
    8b58:	89 10                	mov    %edx,(%eax)
     if (*w)
    8b5a:	8b 45 18             	mov    0x18(%ebp),%eax
    8b5d:	8b 00                	mov    (%eax),%eax
    8b5f:	85 c0                	test   %eax,%eax
    8b61:	74 18                	je     8b7b <huffman_decoder+0x239>
        if (hget1bit() == 1) *w = -*w;
    8b63:	e8 38 e5 ff ff       	call   70a0 <hget1bit>
    8b68:	83 f8 01             	cmp    $0x1,%eax
    8b6b:	75 0e                	jne    8b7b <huffman_decoder+0x239>
    8b6d:	8b 45 18             	mov    0x18(%ebp),%eax
    8b70:	8b 00                	mov    (%eax),%eax
    8b72:	f7 d8                	neg    %eax
    8b74:	89 c2                	mov    %eax,%edx
    8b76:	8b 45 18             	mov    0x18(%ebp),%eax
    8b79:	89 10                	mov    %edx,(%eax)
     if (*x)
    8b7b:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b7e:	8b 00                	mov    (%eax),%eax
    8b80:	85 c0                	test   %eax,%eax
    8b82:	74 18                	je     8b9c <huffman_decoder+0x25a>
        if (hget1bit() == 1) *x = -*x;
    8b84:	e8 17 e5 ff ff       	call   70a0 <hget1bit>
    8b89:	83 f8 01             	cmp    $0x1,%eax
    8b8c:	75 0e                	jne    8b9c <huffman_decoder+0x25a>
    8b8e:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b91:	8b 00                	mov    (%eax),%eax
    8b93:	f7 d8                	neg    %eax
    8b95:	89 c2                	mov    %eax,%edx
    8b97:	8b 45 0c             	mov    0xc(%ebp),%eax
    8b9a:	89 10                	mov    %edx,(%eax)
     if (*y)
    8b9c:	8b 45 10             	mov    0x10(%ebp),%eax
    8b9f:	8b 00                	mov    (%eax),%eax
    8ba1:	85 c0                	test   %eax,%eax
    8ba3:	74 1d                	je     8bc2 <huffman_decoder+0x280>
        if (hget1bit() == 1) *y = -*y;
    8ba5:	e8 f6 e4 ff ff       	call   70a0 <hget1bit>
    8baa:	83 f8 01             	cmp    $0x1,%eax
    8bad:	75 13                	jne    8bc2 <huffman_decoder+0x280>
    8baf:	8b 45 10             	mov    0x10(%ebp),%eax
    8bb2:	8b 00                	mov    (%eax),%eax
    8bb4:	f7 d8                	neg    %eax
    8bb6:	89 c2                	mov    %eax,%edx
    8bb8:	8b 45 10             	mov    0x10(%ebp),%eax
    8bbb:	89 10                	mov    %edx,(%eax)
        if (hget1bit() == 1) *v = -*v;
     if (*w)
        if (hget1bit() == 1) *w = -*w;
     if (*x)
        if (hget1bit() == 1) *x = -*x;
     if (*y)
    8bbd:	e9 bb 00 00 00       	jmp    8c7d <huffman_decoder+0x33b>
    8bc2:	e9 b6 00 00 00       	jmp    8c7d <huffman_decoder+0x33b>
  else {
  
      /* �ڲ��Ա�������x �� y�ǵߵ��� 
         ����ߵ� x �� y ʹ���Ա��������� */
    
     if (h->linbits)
    8bc7:	8b 45 08             	mov    0x8(%ebp),%eax
    8bca:	8b 40 0c             	mov    0xc(%eax),%eax
    8bcd:	85 c0                	test   %eax,%eax
    8bcf:	74 30                	je     8c01 <huffman_decoder+0x2bf>
       if ((h->xlen-1) == *x) 
    8bd1:	8b 45 08             	mov    0x8(%ebp),%eax
    8bd4:	8b 40 04             	mov    0x4(%eax),%eax
    8bd7:	8d 50 ff             	lea    -0x1(%eax),%edx
    8bda:	8b 45 0c             	mov    0xc(%ebp),%eax
    8bdd:	8b 00                	mov    (%eax),%eax
    8bdf:	39 c2                	cmp    %eax,%edx
    8be1:	75 1e                	jne    8c01 <huffman_decoder+0x2bf>
         *x += hgetbits(h->linbits);
    8be3:	8b 45 0c             	mov    0xc(%ebp),%eax
    8be6:	8b 00                	mov    (%eax),%eax
    8be8:	89 c3                	mov    %eax,%ebx
    8bea:	8b 45 08             	mov    0x8(%ebp),%eax
    8bed:	8b 40 0c             	mov    0xc(%eax),%eax
    8bf0:	89 04 24             	mov    %eax,(%esp)
    8bf3:	e8 8d e4 ff ff       	call   7085 <hgetbits>
    8bf8:	01 d8                	add    %ebx,%eax
    8bfa:	89 c2                	mov    %eax,%edx
    8bfc:	8b 45 0c             	mov    0xc(%ebp),%eax
    8bff:	89 10                	mov    %edx,(%eax)
     if (*x)
    8c01:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c04:	8b 00                	mov    (%eax),%eax
    8c06:	85 c0                	test   %eax,%eax
    8c08:	74 18                	je     8c22 <huffman_decoder+0x2e0>
        if (hget1bit() == 1) *x = -*x;
    8c0a:	e8 91 e4 ff ff       	call   70a0 <hget1bit>
    8c0f:	83 f8 01             	cmp    $0x1,%eax
    8c12:	75 0e                	jne    8c22 <huffman_decoder+0x2e0>
    8c14:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c17:	8b 00                	mov    (%eax),%eax
    8c19:	f7 d8                	neg    %eax
    8c1b:	89 c2                	mov    %eax,%edx
    8c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c20:	89 10                	mov    %edx,(%eax)
     if (h->linbits)	  
    8c22:	8b 45 08             	mov    0x8(%ebp),%eax
    8c25:	8b 40 0c             	mov    0xc(%eax),%eax
    8c28:	85 c0                	test   %eax,%eax
    8c2a:	74 30                	je     8c5c <huffman_decoder+0x31a>
       if ((h->ylen-1) == *y)
    8c2c:	8b 45 08             	mov    0x8(%ebp),%eax
    8c2f:	8b 40 08             	mov    0x8(%eax),%eax
    8c32:	8d 50 ff             	lea    -0x1(%eax),%edx
    8c35:	8b 45 10             	mov    0x10(%ebp),%eax
    8c38:	8b 00                	mov    (%eax),%eax
    8c3a:	39 c2                	cmp    %eax,%edx
    8c3c:	75 1e                	jne    8c5c <huffman_decoder+0x31a>
         *y += hgetbits(h->linbits);
    8c3e:	8b 45 10             	mov    0x10(%ebp),%eax
    8c41:	8b 00                	mov    (%eax),%eax
    8c43:	89 c3                	mov    %eax,%ebx
    8c45:	8b 45 08             	mov    0x8(%ebp),%eax
    8c48:	8b 40 0c             	mov    0xc(%eax),%eax
    8c4b:	89 04 24             	mov    %eax,(%esp)
    8c4e:	e8 32 e4 ff ff       	call   7085 <hgetbits>
    8c53:	01 d8                	add    %ebx,%eax
    8c55:	89 c2                	mov    %eax,%edx
    8c57:	8b 45 10             	mov    0x10(%ebp),%eax
    8c5a:	89 10                	mov    %edx,(%eax)
     if (*y)
    8c5c:	8b 45 10             	mov    0x10(%ebp),%eax
    8c5f:	8b 00                	mov    (%eax),%eax
    8c61:	85 c0                	test   %eax,%eax
    8c63:	74 18                	je     8c7d <huffman_decoder+0x33b>
        if (hget1bit() == 1) *y = -*y;
    8c65:	e8 36 e4 ff ff       	call   70a0 <hget1bit>
    8c6a:	83 f8 01             	cmp    $0x1,%eax
    8c6d:	75 0e                	jne    8c7d <huffman_decoder+0x33b>
    8c6f:	8b 45 10             	mov    0x10(%ebp),%eax
    8c72:	8b 00                	mov    (%eax),%eax
    8c74:	f7 d8                	neg    %eax
    8c76:	89 c2                	mov    %eax,%edx
    8c78:	8b 45 10             	mov    0x10(%ebp),%eax
    8c7b:	89 10                	mov    %edx,(%eax)
     }
	  
  return error;  
    8c7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
    8c80:	83 c4 24             	add    $0x24,%esp
    8c83:	5b                   	pop    %ebx
    8c84:	5d                   	pop    %ebp
    8c85:	c3                   	ret    

00008c86 <decode_info>:
#include "common.h"
#include "decode.h"
#include "huffman.h"

void decode_info(Bit_stream_struc *bs, struct frame_params *fr_ps)
{
    8c86:	55                   	push   %ebp
    8c87:	89 e5                	mov    %esp,%ebp
    8c89:	83 ec 28             	sub    $0x28,%esp
    layer *hdr = fr_ps->header;
    8c8c:	8b 45 0c             	mov    0xc(%ebp),%eax
    8c8f:	8b 00                	mov    (%eax),%eax
    8c91:	89 45 f4             	mov    %eax,-0xc(%ebp)

    hdr->version = get1bit(bs);
    8c94:	8b 45 08             	mov    0x8(%ebp),%eax
    8c97:	89 04 24             	mov    %eax,(%esp)
    8c9a:	e8 6c df ff ff       	call   6c0b <get1bit>
    8c9f:	89 c2                	mov    %eax,%edx
    8ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ca4:	89 10                	mov    %edx,(%eax)
    hdr->lay = 4-getbits(bs,2);
    8ca6:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8cad:	00 
    8cae:	8b 45 08             	mov    0x8(%ebp),%eax
    8cb1:	89 04 24             	mov    %eax,(%esp)
    8cb4:	e8 64 e0 ff ff       	call   6d1d <getbits>
    8cb9:	ba 04 00 00 00       	mov    $0x4,%edx
    8cbe:	29 c2                	sub    %eax,%edx
    8cc0:	89 d0                	mov    %edx,%eax
    8cc2:	89 c2                	mov    %eax,%edx
    8cc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cc7:	89 50 04             	mov    %edx,0x4(%eax)
    hdr->error_protection = !get1bit(bs); /* ���󱣻�. TRUE/FALSE */
    8cca:	8b 45 08             	mov    0x8(%ebp),%eax
    8ccd:	89 04 24             	mov    %eax,(%esp)
    8cd0:	e8 36 df ff ff       	call   6c0b <get1bit>
    8cd5:	85 c0                	test   %eax,%eax
    8cd7:	0f 94 c0             	sete   %al
    8cda:	0f b6 d0             	movzbl %al,%edx
    8cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8ce0:	89 50 08             	mov    %edx,0x8(%eax)
    hdr->bitrate_index = getbits(bs,4);
    8ce3:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8cea:	00 
    8ceb:	8b 45 08             	mov    0x8(%ebp),%eax
    8cee:	89 04 24             	mov    %eax,(%esp)
    8cf1:	e8 27 e0 ff ff       	call   6d1d <getbits>
    8cf6:	89 c2                	mov    %eax,%edx
    8cf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8cfb:	89 50 0c             	mov    %edx,0xc(%eax)
    hdr->sampling_frequency = getbits(bs,2);
    8cfe:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8d05:	00 
    8d06:	8b 45 08             	mov    0x8(%ebp),%eax
    8d09:	89 04 24             	mov    %eax,(%esp)
    8d0c:	e8 0c e0 ff ff       	call   6d1d <getbits>
    8d11:	89 c2                	mov    %eax,%edx
    8d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d16:	89 50 10             	mov    %edx,0x10(%eax)
    hdr->padding = get1bit(bs);
    8d19:	8b 45 08             	mov    0x8(%ebp),%eax
    8d1c:	89 04 24             	mov    %eax,(%esp)
    8d1f:	e8 e7 de ff ff       	call   6c0b <get1bit>
    8d24:	89 c2                	mov    %eax,%edx
    8d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d29:	89 50 14             	mov    %edx,0x14(%eax)
    hdr->extension = get1bit(bs);
    8d2c:	8b 45 08             	mov    0x8(%ebp),%eax
    8d2f:	89 04 24             	mov    %eax,(%esp)
    8d32:	e8 d4 de ff ff       	call   6c0b <get1bit>
    8d37:	89 c2                	mov    %eax,%edx
    8d39:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d3c:	89 50 18             	mov    %edx,0x18(%eax)
    hdr->mode = getbits(bs,2);
    8d3f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8d46:	00 
    8d47:	8b 45 08             	mov    0x8(%ebp),%eax
    8d4a:	89 04 24             	mov    %eax,(%esp)
    8d4d:	e8 cb df ff ff       	call   6d1d <getbits>
    8d52:	89 c2                	mov    %eax,%edx
    8d54:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d57:	89 50 1c             	mov    %edx,0x1c(%eax)
    hdr->mode_ext = getbits(bs,2);
    8d5a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8d61:	00 
    8d62:	8b 45 08             	mov    0x8(%ebp),%eax
    8d65:	89 04 24             	mov    %eax,(%esp)
    8d68:	e8 b0 df ff ff       	call   6d1d <getbits>
    8d6d:	89 c2                	mov    %eax,%edx
    8d6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d72:	89 50 20             	mov    %edx,0x20(%eax)
    hdr->copyright = get1bit(bs);
    8d75:	8b 45 08             	mov    0x8(%ebp),%eax
    8d78:	89 04 24             	mov    %eax,(%esp)
    8d7b:	e8 8b de ff ff       	call   6c0b <get1bit>
    8d80:	89 c2                	mov    %eax,%edx
    8d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d85:	89 50 24             	mov    %edx,0x24(%eax)
    hdr->original = get1bit(bs);
    8d88:	8b 45 08             	mov    0x8(%ebp),%eax
    8d8b:	89 04 24             	mov    %eax,(%esp)
    8d8e:	e8 78 de ff ff       	call   6c0b <get1bit>
    8d93:	89 c2                	mov    %eax,%edx
    8d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8d98:	89 50 28             	mov    %edx,0x28(%eax)
    hdr->emphasis = getbits(bs,2);
    8d9b:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8da2:	00 
    8da3:	8b 45 08             	mov    0x8(%ebp),%eax
    8da6:	89 04 24             	mov    %eax,(%esp)
    8da9:	e8 6f df ff ff       	call   6d1d <getbits>
    8dae:	89 c2                	mov    %eax,%edx
    8db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8db3:	89 50 2c             	mov    %edx,0x2c(%eax)
}
    8db6:	c9                   	leave  
    8db7:	c3                   	ret    

00008db8 <III_get_side_info>:

void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    8db8:	55                   	push   %ebp
    8db9:	89 e5                	mov    %esp,%ebp
    8dbb:	56                   	push   %esi
    8dbc:	53                   	push   %ebx
    8dbd:	83 ec 20             	sub    $0x20,%esp
	int ch, gr, i;
	int stereo = fr_ps->stereo;
    8dc0:	8b 45 10             	mov    0x10(%ebp),%eax
    8dc3:	8b 40 08             	mov    0x8(%eax),%eax
    8dc6:	89 45 e8             	mov    %eax,-0x18(%ebp)

	si->main_data_begin = getbits(bs, 9);
    8dc9:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8dd0:	00 
    8dd1:	8b 45 08             	mov    0x8(%ebp),%eax
    8dd4:	89 04 24             	mov    %eax,(%esp)
    8dd7:	e8 41 df ff ff       	call   6d1d <getbits>
    8ddc:	8b 55 0c             	mov    0xc(%ebp),%edx
    8ddf:	89 02                	mov    %eax,(%edx)
	if (stereo == 1)
    8de1:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
    8de5:	75 1b                	jne    8e02 <III_get_side_info+0x4a>
		si->private_bits = getbits(bs,5);
    8de7:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    8dee:	00 
    8def:	8b 45 08             	mov    0x8(%ebp),%eax
    8df2:	89 04 24             	mov    %eax,(%esp)
    8df5:	e8 23 df ff ff       	call   6d1d <getbits>
    8dfa:	8b 55 0c             	mov    0xc(%ebp),%edx
    8dfd:	89 42 04             	mov    %eax,0x4(%edx)
    8e00:	eb 19                	jmp    8e1b <III_get_side_info+0x63>
	else
		si->private_bits = getbits(bs,3);
    8e02:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    8e09:	00 
    8e0a:	8b 45 08             	mov    0x8(%ebp),%eax
    8e0d:	89 04 24             	mov    %eax,(%esp)
    8e10:	e8 08 df ff ff       	call   6d1d <getbits>
    8e15:	8b 55 0c             	mov    0xc(%ebp),%edx
    8e18:	89 42 04             	mov    %eax,0x4(%edx)

	for (ch=0; ch<stereo; ch++)
    8e1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8e22:	eb 3d                	jmp    8e61 <III_get_side_info+0xa9>
		for (i=0; i<4; i++)
    8e24:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    8e2b:	eb 2a                	jmp    8e57 <III_get_side_info+0x9f>
			si->ch[ch].scfsi[i] = get1bit(bs);
    8e2d:	8b 45 08             	mov    0x8(%ebp),%eax
    8e30:	89 04 24             	mov    %eax,(%esp)
    8e33:	e8 d3 dd ff ff       	call   6c0b <get1bit>
    8e38:	89 c1                	mov    %eax,%ecx
    8e3a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8e3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    8e40:	89 d0                	mov    %edx,%eax
    8e42:	c1 e0 02             	shl    $0x2,%eax
    8e45:	01 d0                	add    %edx,%eax
    8e47:	c1 e0 03             	shl    $0x3,%eax
    8e4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
    8e4d:	01 d0                	add    %edx,%eax
    8e4f:	89 4c 83 08          	mov    %ecx,0x8(%ebx,%eax,4)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
    8e53:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    8e57:	83 7d ec 03          	cmpl   $0x3,-0x14(%ebp)
    8e5b:	7e d0                	jle    8e2d <III_get_side_info+0x75>
	if (stereo == 1)
		si->private_bits = getbits(bs,5);
	else
		si->private_bits = getbits(bs,3);

	for (ch=0; ch<stereo; ch++)
    8e5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    8e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    8e64:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    8e67:	7c bb                	jl     8e24 <III_get_side_info+0x6c>
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    8e69:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    8e70:	e9 c5 05 00 00       	jmp    943a <III_get_side_info+0x682>
		for (ch=0; ch<stereo; ch++) {
    8e75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    8e7c:	e9 a9 05 00 00       	jmp    942a <III_get_side_info+0x672>
			si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
    8e81:	c7 44 24 04 0c 00 00 	movl   $0xc,0x4(%esp)
    8e88:	00 
    8e89:	8b 45 08             	mov    0x8(%ebp),%eax
    8e8c:	89 04 24             	mov    %eax,(%esp)
    8e8f:	e8 89 de ff ff       	call   6d1d <getbits>
    8e94:	89 c3                	mov    %eax,%ebx
    8e96:	8b 75 0c             	mov    0xc(%ebp),%esi
    8e99:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8e9c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8e9f:	89 c2                	mov    %eax,%edx
    8ea1:	c1 e2 03             	shl    $0x3,%edx
    8ea4:	01 c2                	add    %eax,%edx
    8ea6:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8ead:	89 c2                	mov    %eax,%edx
    8eaf:	89 c8                	mov    %ecx,%eax
    8eb1:	c1 e0 02             	shl    $0x2,%eax
    8eb4:	01 c8                	add    %ecx,%eax
    8eb6:	c1 e0 05             	shl    $0x5,%eax
    8eb9:	01 d0                	add    %edx,%eax
    8ebb:	01 f0                	add    %esi,%eax
    8ebd:	83 c0 18             	add    $0x18,%eax
    8ec0:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].big_values = getbits(bs, 9);
    8ec2:	c7 44 24 04 09 00 00 	movl   $0x9,0x4(%esp)
    8ec9:	00 
    8eca:	8b 45 08             	mov    0x8(%ebp),%eax
    8ecd:	89 04 24             	mov    %eax,(%esp)
    8ed0:	e8 48 de ff ff       	call   6d1d <getbits>
    8ed5:	89 c3                	mov    %eax,%ebx
    8ed7:	8b 75 0c             	mov    0xc(%ebp),%esi
    8eda:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8edd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8ee0:	89 c2                	mov    %eax,%edx
    8ee2:	c1 e2 03             	shl    $0x3,%edx
    8ee5:	01 c2                	add    %eax,%edx
    8ee7:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8eee:	89 c2                	mov    %eax,%edx
    8ef0:	89 c8                	mov    %ecx,%eax
    8ef2:	c1 e0 02             	shl    $0x2,%eax
    8ef5:	01 c8                	add    %ecx,%eax
    8ef7:	c1 e0 05             	shl    $0x5,%eax
    8efa:	01 d0                	add    %edx,%eax
    8efc:	01 f0                	add    %esi,%eax
    8efe:	83 c0 1c             	add    $0x1c,%eax
    8f01:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
    8f03:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    8f0a:	00 
    8f0b:	8b 45 08             	mov    0x8(%ebp),%eax
    8f0e:	89 04 24             	mov    %eax,(%esp)
    8f11:	e8 07 de ff ff       	call   6d1d <getbits>
    8f16:	89 c3                	mov    %eax,%ebx
    8f18:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f1e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f21:	89 c2                	mov    %eax,%edx
    8f23:	c1 e2 03             	shl    $0x3,%edx
    8f26:	01 c2                	add    %eax,%edx
    8f28:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f2f:	89 c2                	mov    %eax,%edx
    8f31:	89 c8                	mov    %ecx,%eax
    8f33:	c1 e0 02             	shl    $0x2,%eax
    8f36:	01 c8                	add    %ecx,%eax
    8f38:	c1 e0 05             	shl    $0x5,%eax
    8f3b:	01 d0                	add    %edx,%eax
    8f3d:	01 f0                	add    %esi,%eax
    8f3f:	83 c0 20             	add    $0x20,%eax
    8f42:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
    8f44:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    8f4b:	00 
    8f4c:	8b 45 08             	mov    0x8(%ebp),%eax
    8f4f:	89 04 24             	mov    %eax,(%esp)
    8f52:	e8 c6 dd ff ff       	call   6d1d <getbits>
    8f57:	89 c3                	mov    %eax,%ebx
    8f59:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f5f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f62:	89 c2                	mov    %eax,%edx
    8f64:	c1 e2 03             	shl    $0x3,%edx
    8f67:	01 c2                	add    %eax,%edx
    8f69:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8f70:	89 c2                	mov    %eax,%edx
    8f72:	89 c8                	mov    %ecx,%eax
    8f74:	c1 e0 02             	shl    $0x2,%eax
    8f77:	01 c8                	add    %ecx,%eax
    8f79:	c1 e0 05             	shl    $0x5,%eax
    8f7c:	01 d0                	add    %edx,%eax
    8f7e:	01 f0                	add    %esi,%eax
    8f80:	83 c0 24             	add    $0x24,%eax
    8f83:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
    8f85:	8b 45 08             	mov    0x8(%ebp),%eax
    8f88:	89 04 24             	mov    %eax,(%esp)
    8f8b:	e8 7b dc ff ff       	call   6c0b <get1bit>
    8f90:	89 c3                	mov    %eax,%ebx
    8f92:	8b 75 0c             	mov    0xc(%ebp),%esi
    8f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8f98:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8f9b:	89 c2                	mov    %eax,%edx
    8f9d:	c1 e2 03             	shl    $0x3,%edx
    8fa0:	01 c2                	add    %eax,%edx
    8fa2:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8fa9:	89 c2                	mov    %eax,%edx
    8fab:	89 c8                	mov    %ecx,%eax
    8fad:	c1 e0 02             	shl    $0x2,%eax
    8fb0:	01 c8                	add    %ecx,%eax
    8fb2:	c1 e0 05             	shl    $0x5,%eax
    8fb5:	01 d0                	add    %edx,%eax
    8fb7:	01 f0                	add    %esi,%eax
    8fb9:	83 c0 28             	add    $0x28,%eax
    8fbc:	89 18                	mov    %ebx,(%eax)
			if (si->ch[ch].gr[gr].window_switching_flag) {
    8fbe:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    8fc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8fc4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    8fc7:	89 c2                	mov    %eax,%edx
    8fc9:	c1 e2 03             	shl    $0x3,%edx
    8fcc:	01 c2                	add    %eax,%edx
    8fce:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    8fd5:	89 c2                	mov    %eax,%edx
    8fd7:	89 c8                	mov    %ecx,%eax
    8fd9:	c1 e0 02             	shl    $0x2,%eax
    8fdc:	01 c8                	add    %ecx,%eax
    8fde:	c1 e0 05             	shl    $0x5,%eax
    8fe1:	01 d0                	add    %edx,%eax
    8fe3:	01 d8                	add    %ebx,%eax
    8fe5:	83 c0 28             	add    $0x28,%eax
    8fe8:	8b 00                	mov    (%eax),%eax
    8fea:	85 c0                	test   %eax,%eax
    8fec:	0f 84 82 02 00 00    	je     9274 <III_get_side_info+0x4bc>
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
    8ff2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    8ff9:	00 
    8ffa:	8b 45 08             	mov    0x8(%ebp),%eax
    8ffd:	89 04 24             	mov    %eax,(%esp)
    9000:	e8 18 dd ff ff       	call   6d1d <getbits>
    9005:	89 c3                	mov    %eax,%ebx
    9007:	8b 75 0c             	mov    0xc(%ebp),%esi
    900a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    900d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9010:	89 c2                	mov    %eax,%edx
    9012:	c1 e2 03             	shl    $0x3,%edx
    9015:	01 c2                	add    %eax,%edx
    9017:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    901e:	89 c2                	mov    %eax,%edx
    9020:	89 c8                	mov    %ecx,%eax
    9022:	c1 e0 02             	shl    $0x2,%eax
    9025:	01 c8                	add    %ecx,%eax
    9027:	c1 e0 05             	shl    $0x5,%eax
    902a:	01 d0                	add    %edx,%eax
    902c:	01 f0                	add    %esi,%eax
    902e:	83 c0 2c             	add    $0x2c,%eax
    9031:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
    9033:	8b 45 08             	mov    0x8(%ebp),%eax
    9036:	89 04 24             	mov    %eax,(%esp)
    9039:	e8 cd db ff ff       	call   6c0b <get1bit>
    903e:	89 c3                	mov    %eax,%ebx
    9040:	8b 75 0c             	mov    0xc(%ebp),%esi
    9043:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9046:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9049:	89 c2                	mov    %eax,%edx
    904b:	c1 e2 03             	shl    $0x3,%edx
    904e:	01 c2                	add    %eax,%edx
    9050:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9057:	89 c2                	mov    %eax,%edx
    9059:	89 c8                	mov    %ecx,%eax
    905b:	c1 e0 02             	shl    $0x2,%eax
    905e:	01 c8                	add    %ecx,%eax
    9060:	c1 e0 05             	shl    $0x5,%eax
    9063:	01 d0                	add    %edx,%eax
    9065:	01 f0                	add    %esi,%eax
    9067:	83 c0 30             	add    $0x30,%eax
    906a:	89 18                	mov    %ebx,(%eax)
				for (i=0; i<2; i++)
    906c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9073:	eb 46                	jmp    90bb <III_get_side_info+0x303>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    9075:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    907c:	00 
    907d:	8b 45 08             	mov    0x8(%ebp),%eax
    9080:	89 04 24             	mov    %eax,(%esp)
    9083:	e8 95 dc ff ff       	call   6d1d <getbits>
    9088:	89 c3                	mov    %eax,%ebx
    908a:	8b 75 0c             	mov    0xc(%ebp),%esi
    908d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9090:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9093:	89 c2                	mov    %eax,%edx
    9095:	c1 e2 03             	shl    $0x3,%edx
    9098:	01 c2                	add    %eax,%edx
    909a:	8d 04 12             	lea    (%edx,%edx,1),%eax
    909d:	89 c2                	mov    %eax,%edx
    909f:	89 c8                	mov    %ecx,%eax
    90a1:	c1 e0 02             	shl    $0x2,%eax
    90a4:	01 c8                	add    %ecx,%eax
    90a6:	c1 e0 03             	shl    $0x3,%eax
    90a9:	01 c2                	add    %eax,%edx
    90ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    90ae:	01 d0                	add    %edx,%eax
    90b0:	83 c0 08             	add    $0x8,%eax
    90b3:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
			si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
			si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
    90b7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    90bb:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    90bf:	7e b4                	jle    9075 <III_get_side_info+0x2bd>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    90c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    90c8:	eb 46                	jmp    9110 <III_get_side_info+0x358>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);
    90ca:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    90d1:	00 
    90d2:	8b 45 08             	mov    0x8(%ebp),%eax
    90d5:	89 04 24             	mov    %eax,(%esp)
    90d8:	e8 40 dc ff ff       	call   6d1d <getbits>
    90dd:	89 c3                	mov    %eax,%ebx
    90df:	8b 75 0c             	mov    0xc(%ebp),%esi
    90e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    90e5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    90e8:	89 c2                	mov    %eax,%edx
    90ea:	c1 e2 03             	shl    $0x3,%edx
    90ed:	01 c2                	add    %eax,%edx
    90ef:	8d 04 12             	lea    (%edx,%edx,1),%eax
    90f2:	89 c2                	mov    %eax,%edx
    90f4:	89 c8                	mov    %ecx,%eax
    90f6:	c1 e0 02             	shl    $0x2,%eax
    90f9:	01 c8                	add    %ecx,%eax
    90fb:	c1 e0 03             	shl    $0x3,%eax
    90fe:	01 c2                	add    %eax,%edx
    9100:	8b 45 ec             	mov    -0x14(%ebp),%eax
    9103:	01 d0                	add    %edx,%eax
    9105:	83 c0 0c             	add    $0xc,%eax
    9108:	89 5c 86 10          	mov    %ebx,0x10(%esi,%eax,4)
			if (si->ch[ch].gr[gr].window_switching_flag) {
				si->ch[ch].gr[gr].block_type = getbits(bs, 2);
				si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
				for (i=0; i<2; i++)
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				for (i=0; i<3; i++)
    910c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9110:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9114:	7e b4                	jle    90ca <III_get_side_info+0x312>
					si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

				/* Set region_count parameters since they are implicit in this case. */

				if (si->ch[ch].gr[gr].block_type == 0) {
    9116:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9119:	8b 45 f0             	mov    -0x10(%ebp),%eax
    911c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    911f:	89 c2                	mov    %eax,%edx
    9121:	c1 e2 03             	shl    $0x3,%edx
    9124:	01 c2                	add    %eax,%edx
    9126:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    912d:	89 c2                	mov    %eax,%edx
    912f:	89 c8                	mov    %ecx,%eax
    9131:	c1 e0 02             	shl    $0x2,%eax
    9134:	01 c8                	add    %ecx,%eax
    9136:	c1 e0 05             	shl    $0x5,%eax
    9139:	01 d0                	add    %edx,%eax
    913b:	01 d8                	add    %ebx,%eax
    913d:	83 c0 2c             	add    $0x2c,%eax
    9140:	8b 00                	mov    (%eax),%eax
    9142:	85 c0                	test   %eax,%eax
    9144:	75 05                	jne    914b <III_get_side_info+0x393>
					//printf("Side info bad: block_type == 0 in split block.\n");
					exit();
    9146:	e8 84 cb ff ff       	call   5ccf <exit>
				}
				else if (si->ch[ch].gr[gr].block_type == 2
    914b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    914e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9151:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9154:	89 c2                	mov    %eax,%edx
    9156:	c1 e2 03             	shl    $0x3,%edx
    9159:	01 c2                	add    %eax,%edx
    915b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9162:	89 c2                	mov    %eax,%edx
    9164:	89 c8                	mov    %ecx,%eax
    9166:	c1 e0 02             	shl    $0x2,%eax
    9169:	01 c8                	add    %ecx,%eax
    916b:	c1 e0 05             	shl    $0x5,%eax
    916e:	01 d0                	add    %edx,%eax
    9170:	01 d8                	add    %ebx,%eax
    9172:	83 c0 2c             	add    $0x2c,%eax
    9175:	8b 00                	mov    (%eax),%eax
    9177:	83 f8 02             	cmp    $0x2,%eax
    917a:	75 62                	jne    91de <III_get_side_info+0x426>
						&& si->ch[ch].gr[gr].mixed_block_flag == 0)
    917c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    917f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9182:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9185:	89 c2                	mov    %eax,%edx
    9187:	c1 e2 03             	shl    $0x3,%edx
    918a:	01 c2                	add    %eax,%edx
    918c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9193:	89 c2                	mov    %eax,%edx
    9195:	89 c8                	mov    %ecx,%eax
    9197:	c1 e0 02             	shl    $0x2,%eax
    919a:	01 c8                	add    %ecx,%eax
    919c:	c1 e0 05             	shl    $0x5,%eax
    919f:	01 d0                	add    %edx,%eax
    91a1:	01 d8                	add    %ebx,%eax
    91a3:	83 c0 30             	add    $0x30,%eax
    91a6:	8b 00                	mov    (%eax),%eax
    91a8:	85 c0                	test   %eax,%eax
    91aa:	75 32                	jne    91de <III_get_side_info+0x426>
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
    91ac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    91af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    91b5:	89 c2                	mov    %eax,%edx
    91b7:	c1 e2 03             	shl    $0x3,%edx
    91ba:	01 c2                	add    %eax,%edx
    91bc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    91c3:	89 c2                	mov    %eax,%edx
    91c5:	89 c8                	mov    %ecx,%eax
    91c7:	c1 e0 02             	shl    $0x2,%eax
    91ca:	01 c8                	add    %ecx,%eax
    91cc:	c1 e0 05             	shl    $0x5,%eax
    91cf:	01 d0                	add    %edx,%eax
    91d1:	01 d8                	add    %ebx,%eax
    91d3:	83 c0 4c             	add    $0x4c,%eax
    91d6:	c7 00 08 00 00 00    	movl   $0x8,(%eax)
    91dc:	eb 30                	jmp    920e <III_get_side_info+0x456>
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
    91de:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    91e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    91e4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    91e7:	89 c2                	mov    %eax,%edx
    91e9:	c1 e2 03             	shl    $0x3,%edx
    91ec:	01 c2                	add    %eax,%edx
    91ee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    91f5:	89 c2                	mov    %eax,%edx
    91f7:	89 c8                	mov    %ecx,%eax
    91f9:	c1 e0 02             	shl    $0x2,%eax
    91fc:	01 c8                	add    %ecx,%eax
    91fe:	c1 e0 05             	shl    $0x5,%eax
    9201:	01 d0                	add    %edx,%eax
    9203:	01 d8                	add    %ebx,%eax
    9205:	83 c0 4c             	add    $0x4c,%eax
    9208:	c7 00 07 00 00 00    	movl   $0x7,(%eax)
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
    920e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9211:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9214:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9217:	89 c2                	mov    %eax,%edx
    9219:	c1 e2 03             	shl    $0x3,%edx
    921c:	01 c2                	add    %eax,%edx
    921e:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9225:	89 c2                	mov    %eax,%edx
    9227:	89 c8                	mov    %ecx,%eax
    9229:	c1 e0 02             	shl    $0x2,%eax
    922c:	01 c8                	add    %ecx,%eax
    922e:	c1 e0 05             	shl    $0x5,%eax
    9231:	01 d0                	add    %edx,%eax
    9233:	01 d8                	add    %ebx,%eax
    9235:	83 c0 4c             	add    $0x4c,%eax
    9238:	8b 00                	mov    (%eax),%eax
    923a:	ba 14 00 00 00       	mov    $0x14,%edx
    923f:	89 d3                	mov    %edx,%ebx
    9241:	29 c3                	sub    %eax,%ebx
    9243:	8b 75 0c             	mov    0xc(%ebp),%esi
    9246:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9249:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    924c:	89 c2                	mov    %eax,%edx
    924e:	c1 e2 03             	shl    $0x3,%edx
    9251:	01 c2                	add    %eax,%edx
    9253:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    925a:	89 c2                	mov    %eax,%edx
    925c:	89 c8                	mov    %ecx,%eax
    925e:	c1 e0 02             	shl    $0x2,%eax
    9261:	01 c8                	add    %ecx,%eax
    9263:	c1 e0 05             	shl    $0x5,%eax
    9266:	01 d0                	add    %edx,%eax
    9268:	01 f0                	add    %esi,%eax
    926a:	83 c0 50             	add    $0x50,%eax
    926d:	89 18                	mov    %ebx,(%eax)
    926f:	e9 07 01 00 00       	jmp    937b <III_get_side_info+0x5c3>
			}
			else {
				for (i=0; i<3; i++)
    9274:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    927b:	eb 46                	jmp    92c3 <III_get_side_info+0x50b>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
    927d:	c7 44 24 04 05 00 00 	movl   $0x5,0x4(%esp)
    9284:	00 
    9285:	8b 45 08             	mov    0x8(%ebp),%eax
    9288:	89 04 24             	mov    %eax,(%esp)
    928b:	e8 8d da ff ff       	call   6d1d <getbits>
    9290:	89 c3                	mov    %eax,%ebx
    9292:	8b 75 0c             	mov    0xc(%ebp),%esi
    9295:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9298:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    929b:	89 c2                	mov    %eax,%edx
    929d:	c1 e2 03             	shl    $0x3,%edx
    92a0:	01 c2                	add    %eax,%edx
    92a2:	8d 04 12             	lea    (%edx,%edx,1),%eax
    92a5:	89 c2                	mov    %eax,%edx
    92a7:	89 c8                	mov    %ecx,%eax
    92a9:	c1 e0 02             	shl    $0x2,%eax
    92ac:	01 c8                	add    %ecx,%eax
    92ae:	c1 e0 03             	shl    $0x3,%eax
    92b1:	01 c2                	add    %eax,%edx
    92b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
    92b6:	01 d0                	add    %edx,%eax
    92b8:	83 c0 08             	add    $0x8,%eax
    92bb:	89 5c 86 14          	mov    %ebx,0x14(%esi,%eax,4)
					si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
				else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
					si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
			}
			else {
				for (i=0; i<3; i++)
    92bf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    92c3:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    92c7:	7e b4                	jle    927d <III_get_side_info+0x4c5>
					si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
				si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
    92c9:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    92d0:	00 
    92d1:	8b 45 08             	mov    0x8(%ebp),%eax
    92d4:	89 04 24             	mov    %eax,(%esp)
    92d7:	e8 41 da ff ff       	call   6d1d <getbits>
    92dc:	89 c3                	mov    %eax,%ebx
    92de:	8b 75 0c             	mov    0xc(%ebp),%esi
    92e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    92e4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    92e7:	89 c2                	mov    %eax,%edx
    92e9:	c1 e2 03             	shl    $0x3,%edx
    92ec:	01 c2                	add    %eax,%edx
    92ee:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    92f5:	89 c2                	mov    %eax,%edx
    92f7:	89 c8                	mov    %ecx,%eax
    92f9:	c1 e0 02             	shl    $0x2,%eax
    92fc:	01 c8                	add    %ecx,%eax
    92fe:	c1 e0 05             	shl    $0x5,%eax
    9301:	01 d0                	add    %edx,%eax
    9303:	01 f0                	add    %esi,%eax
    9305:	83 c0 4c             	add    $0x4c,%eax
    9308:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
    930a:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    9311:	00 
    9312:	8b 45 08             	mov    0x8(%ebp),%eax
    9315:	89 04 24             	mov    %eax,(%esp)
    9318:	e8 00 da ff ff       	call   6d1d <getbits>
    931d:	89 c3                	mov    %eax,%ebx
    931f:	8b 75 0c             	mov    0xc(%ebp),%esi
    9322:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9325:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9328:	89 c2                	mov    %eax,%edx
    932a:	c1 e2 03             	shl    $0x3,%edx
    932d:	01 c2                	add    %eax,%edx
    932f:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9336:	89 c2                	mov    %eax,%edx
    9338:	89 c8                	mov    %ecx,%eax
    933a:	c1 e0 02             	shl    $0x2,%eax
    933d:	01 c8                	add    %ecx,%eax
    933f:	c1 e0 05             	shl    $0x5,%eax
    9342:	01 d0                	add    %edx,%eax
    9344:	01 f0                	add    %esi,%eax
    9346:	83 c0 50             	add    $0x50,%eax
    9349:	89 18                	mov    %ebx,(%eax)
				si->ch[ch].gr[gr].block_type = 0;
    934b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    934e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9351:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9354:	89 c2                	mov    %eax,%edx
    9356:	c1 e2 03             	shl    $0x3,%edx
    9359:	01 c2                	add    %eax,%edx
    935b:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9362:	89 c2                	mov    %eax,%edx
    9364:	89 c8                	mov    %ecx,%eax
    9366:	c1 e0 02             	shl    $0x2,%eax
    9369:	01 c8                	add    %ecx,%eax
    936b:	c1 e0 05             	shl    $0x5,%eax
    936e:	01 d0                	add    %edx,%eax
    9370:	01 d8                	add    %ebx,%eax
    9372:	83 c0 2c             	add    $0x2c,%eax
    9375:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
			}
			si->ch[ch].gr[gr].preflag = get1bit(bs);
    937b:	8b 45 08             	mov    0x8(%ebp),%eax
    937e:	89 04 24             	mov    %eax,(%esp)
    9381:	e8 85 d8 ff ff       	call   6c0b <get1bit>
    9386:	89 c3                	mov    %eax,%ebx
    9388:	8b 75 0c             	mov    0xc(%ebp),%esi
    938b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    938e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9391:	89 c2                	mov    %eax,%edx
    9393:	c1 e2 03             	shl    $0x3,%edx
    9396:	01 c2                	add    %eax,%edx
    9398:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    939f:	89 c2                	mov    %eax,%edx
    93a1:	89 c8                	mov    %ecx,%eax
    93a3:	c1 e0 02             	shl    $0x2,%eax
    93a6:	01 c8                	add    %ecx,%eax
    93a8:	c1 e0 05             	shl    $0x5,%eax
    93ab:	01 d0                	add    %edx,%eax
    93ad:	01 f0                	add    %esi,%eax
    93af:	83 c0 54             	add    $0x54,%eax
    93b2:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
    93b4:	8b 45 08             	mov    0x8(%ebp),%eax
    93b7:	89 04 24             	mov    %eax,(%esp)
    93ba:	e8 4c d8 ff ff       	call   6c0b <get1bit>
    93bf:	89 c3                	mov    %eax,%ebx
    93c1:	8b 75 0c             	mov    0xc(%ebp),%esi
    93c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    93c7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    93ca:	89 c2                	mov    %eax,%edx
    93cc:	c1 e2 03             	shl    $0x3,%edx
    93cf:	01 c2                	add    %eax,%edx
    93d1:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    93d8:	89 c2                	mov    %eax,%edx
    93da:	89 c8                	mov    %ecx,%eax
    93dc:	c1 e0 02             	shl    $0x2,%eax
    93df:	01 c8                	add    %ecx,%eax
    93e1:	c1 e0 05             	shl    $0x5,%eax
    93e4:	01 d0                	add    %edx,%eax
    93e6:	01 f0                	add    %esi,%eax
    93e8:	83 c0 58             	add    $0x58,%eax
    93eb:	89 18                	mov    %ebx,(%eax)
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
    93ed:	8b 45 08             	mov    0x8(%ebp),%eax
    93f0:	89 04 24             	mov    %eax,(%esp)
    93f3:	e8 13 d8 ff ff       	call   6c0b <get1bit>
    93f8:	89 c3                	mov    %eax,%ebx
    93fa:	8b 75 0c             	mov    0xc(%ebp),%esi
    93fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9400:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    9403:	89 c2                	mov    %eax,%edx
    9405:	c1 e2 03             	shl    $0x3,%edx
    9408:	01 c2                	add    %eax,%edx
    940a:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9411:	89 c2                	mov    %eax,%edx
    9413:	89 c8                	mov    %ecx,%eax
    9415:	c1 e0 02             	shl    $0x2,%eax
    9418:	01 c8                	add    %ecx,%eax
    941a:	c1 e0 05             	shl    $0x5,%eax
    941d:	01 d0                	add    %edx,%eax
    941f:	01 f0                	add    %esi,%eax
    9421:	83 c0 5c             	add    $0x5c,%eax
    9424:	89 18                	mov    %ebx,(%eax)
	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
		for (ch=0; ch<stereo; ch++) {
    9426:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    942a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    942d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9430:	0f 8c 4b fa ff ff    	jl     8e81 <III_get_side_info+0xc9>

	for (ch=0; ch<stereo; ch++)
		for (i=0; i<4; i++)
			si->ch[ch].scfsi[i] = get1bit(bs);

	for (gr=0; gr<2; gr++) {
    9436:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    943a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    943e:	0f 8e 31 fa ff ff    	jle    8e75 <III_get_side_info+0xbd>
			si->ch[ch].gr[gr].preflag = get1bit(bs);
			si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
			si->ch[ch].gr[gr].count1table_select = get1bit(bs);
         }
	}
}
    9444:	83 c4 20             	add    $0x20,%esp
    9447:	5b                   	pop    %ebx
    9448:	5e                   	pop    %esi
    9449:	5d                   	pop    %ebp
    944a:	c3                   	ret    

0000944b <III_get_scale_factors>:
	{{0,4,8,12,16,20,24,30,36,44,54,66,82,102,126,156,194,240,296,364,448,550,576},
		{0,4,8,12,16,22,30,42,58,78,104,138,180,192}}
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    944b:	55                   	push   %ebp
    944c:	89 e5                	mov    %esp,%ebp
    944e:	56                   	push   %esi
    944f:	53                   	push   %ebx
    9450:	83 ec 20             	sub    $0x20,%esp
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);
    9453:	8b 45 10             	mov    0x10(%ebp),%eax
    9456:	89 c2                	mov    %eax,%edx
    9458:	c1 e2 03             	shl    $0x3,%edx
    945b:	01 c2                	add    %eax,%edx
    945d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9464:	89 c2                	mov    %eax,%edx
    9466:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9469:	89 c8                	mov    %ecx,%eax
    946b:	c1 e0 02             	shl    $0x2,%eax
    946e:	01 c8                	add    %ecx,%eax
    9470:	c1 e0 05             	shl    $0x5,%eax
    9473:	01 d0                	add    %edx,%eax
    9475:	8d 50 10             	lea    0x10(%eax),%edx
    9478:	8b 45 0c             	mov    0xc(%ebp),%eax
    947b:	01 d0                	add    %edx,%eax
    947d:	83 c0 08             	add    $0x8,%eax
    9480:	89 45 e8             	mov    %eax,-0x18(%ebp)

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9483:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9486:	8b 40 10             	mov    0x10(%eax),%eax
    9489:	85 c0                	test   %eax,%eax
    948b:	0f 84 7e 02 00 00    	je     970f <III_get_scale_factors+0x2c4>
    9491:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9494:	8b 40 14             	mov    0x14(%eax),%eax
    9497:	83 f8 02             	cmp    $0x2,%eax
    949a:	0f 85 6f 02 00 00    	jne    970f <III_get_scale_factors+0x2c4>
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    94a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    94a3:	8b 40 18             	mov    0x18(%eax),%eax
    94a6:	85 c0                	test   %eax,%eax
    94a8:	0f 84 6b 01 00 00    	je     9619 <III_get_scale_factors+0x1ce>
			for (sfb = 0; sfb < 8; sfb++)
    94ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    94b5:	eb 32                	jmp    94e9 <III_get_scale_factors+0x9e>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
    94b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    94ba:	8b 40 0c             	mov    0xc(%eax),%eax
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
    94bd:	8b 04 85 20 11 01 00 	mov    0x11120(,%eax,4),%eax
    94c4:	89 04 24             	mov    %eax,(%esp)
    94c7:	e8 b9 db ff ff       	call   7085 <hgetbits>
    94cc:	89 c3                	mov    %eax,%ebx
    94ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
    94d1:	8b 45 14             	mov    0x14(%ebp),%eax
    94d4:	01 c0                	add    %eax,%eax
    94d6:	89 c2                	mov    %eax,%edx
    94d8:	c1 e2 05             	shl    $0x5,%edx
    94db:	29 c2                	sub    %eax,%edx
    94dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    94e0:	01 d0                	add    %edx,%eax
    94e2:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
    94e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    94e9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    94ed:	7e c8                	jle    94b7 <III_get_scale_factors+0x6c>
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    94ef:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    94f6:	eb 5c                	jmp    9554 <III_get_scale_factors+0x109>
				for (window=0; window<3; window++)
    94f8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    94ff:	eb 49                	jmp    954a <III_get_scale_factors+0xff>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
    9501:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9504:	8b 40 0c             	mov    0xc(%eax),%eax
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    9507:	8b 04 85 20 11 01 00 	mov    0x11120(,%eax,4),%eax
    950e:	89 04 24             	mov    %eax,(%esp)
    9511:	e8 6f db ff ff       	call   7085 <hgetbits>
    9516:	89 c6                	mov    %eax,%esi
    9518:	8b 5d 08             	mov    0x8(%ebp),%ebx
    951b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    951e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9521:	89 d0                	mov    %edx,%eax
    9523:	01 c0                	add    %eax,%eax
    9525:	01 d0                	add    %edx,%eax
    9527:	c1 e0 02             	shl    $0x2,%eax
    952a:	01 d0                	add    %edx,%eax
    952c:	89 ca                	mov    %ecx,%edx
    952e:	01 d2                	add    %edx,%edx
    9530:	89 d1                	mov    %edx,%ecx
    9532:	c1 e1 05             	shl    $0x5,%ecx
    9535:	29 d1                	sub    %edx,%ecx
    9537:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    953a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    953d:	01 d0                	add    %edx,%eax
    953f:	83 c0 14             	add    $0x14,%eax
    9542:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
    9546:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    954a:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    954e:	7e b1                	jle    9501 <III_get_scale_factors+0xb6>
	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
			for (sfb = 0; sfb < 8; sfb++)
				(*scalefac)[ch].l[sfb] = hgetbits(
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
    9550:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    9554:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    9558:	7e 9e                	jle    94f8 <III_get_scale_factors+0xad>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    955a:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    9561:	eb 5f                	jmp    95c2 <III_get_scale_factors+0x177>
				for (window=0; window<3; window++)
    9563:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    956a:	eb 4c                	jmp    95b8 <III_get_scale_factors+0x16d>
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
    956c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    956f:	8b 40 0c             	mov    0xc(%eax),%eax
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
    9572:	83 c0 10             	add    $0x10,%eax
    9575:	8b 04 85 20 11 01 00 	mov    0x11120(,%eax,4),%eax
    957c:	89 04 24             	mov    %eax,(%esp)
    957f:	e8 01 db ff ff       	call   7085 <hgetbits>
    9584:	89 c6                	mov    %eax,%esi
    9586:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9589:	8b 55 ec             	mov    -0x14(%ebp),%edx
    958c:	8b 4d 14             	mov    0x14(%ebp),%ecx
    958f:	89 d0                	mov    %edx,%eax
    9591:	01 c0                	add    %eax,%eax
    9593:	01 d0                	add    %edx,%eax
    9595:	c1 e0 02             	shl    $0x2,%eax
    9598:	01 d0                	add    %edx,%eax
    959a:	89 ca                	mov    %ecx,%edx
    959c:	01 d2                	add    %edx,%edx
    959e:	89 d1                	mov    %edx,%ecx
    95a0:	c1 e1 05             	shl    $0x5,%ecx
    95a3:	29 d1                	sub    %edx,%ecx
    95a5:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    95a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95ab:	01 d0                	add    %edx,%eax
    95ad:	83 c0 14             	add    $0x14,%eax
    95b0:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
    95b4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    95b8:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    95bc:	7e ae                	jle    956c <III_get_scale_factors+0x121>
					slen[0][gr_info->scalefac_compress]);
			for (sfb = 3; sfb < 6; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
    95be:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    95c2:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    95c6:	7e 9b                	jle    9563 <III_get_scale_factors+0x118>
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    95c8:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    95cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    95d6:	eb 36                	jmp    960e <III_get_scale_factors+0x1c3>
				(*scalefac)[ch].s[window][sfb] = 0;
    95d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
    95db:	8b 55 ec             	mov    -0x14(%ebp),%edx
    95de:	8b 4d 14             	mov    0x14(%ebp),%ecx
    95e1:	89 d0                	mov    %edx,%eax
    95e3:	01 c0                	add    %eax,%eax
    95e5:	01 d0                	add    %edx,%eax
    95e7:	c1 e0 02             	shl    $0x2,%eax
    95ea:	01 d0                	add    %edx,%eax
    95ec:	89 ca                	mov    %ecx,%edx
    95ee:	01 d2                	add    %edx,%edx
    95f0:	89 d1                	mov    %edx,%ecx
    95f2:	c1 e1 05             	shl    $0x5,%ecx
    95f5:	29 d1                	sub    %edx,%ecx
    95f7:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    95fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    95fd:	01 d0                	add    %edx,%eax
    95ff:	83 c0 14             	add    $0x14,%eax
    9602:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    9609:	00 
						slen[0][gr_info->scalefac_compress]);
			for (sfb = 6; sfb < 12; sfb++)
				for (window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = hgetbits(
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
    960a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    960e:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9612:	7e c4                	jle    95d8 <III_get_scale_factors+0x18d>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    9614:	e9 b1 01 00 00       	jmp    97ca <III_get_scale_factors+0x37f>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    9619:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9620:	e9 8f 00 00 00       	jmp    96b4 <III_get_scale_factors+0x269>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    9625:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9628:	83 c0 04             	add    $0x4,%eax
    962b:	8b 04 85 04 11 01 00 	mov    0x11104(,%eax,4),%eax
    9632:	89 45 f4             	mov    %eax,-0xc(%ebp)
    9635:	eb 64                	jmp    969b <III_get_scale_factors+0x250>
					for (window=0; window<3; window++)
    9637:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    963e:	eb 51                	jmp    9691 <III_get_scale_factors+0x246>
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
    9640:	8b 45 e8             	mov    -0x18(%ebp),%eax
    9643:	8b 40 0c             	mov    0xc(%eax),%eax
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
    9646:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9649:	c1 e2 04             	shl    $0x4,%edx
    964c:	01 d0                	add    %edx,%eax
    964e:	8b 04 85 20 11 01 00 	mov    0x11120(,%eax,4),%eax
    9655:	89 04 24             	mov    %eax,(%esp)
    9658:	e8 28 da ff ff       	call   7085 <hgetbits>
    965d:	89 c6                	mov    %eax,%esi
    965f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    9662:	8b 55 ec             	mov    -0x14(%ebp),%edx
    9665:	8b 4d 14             	mov    0x14(%ebp),%ecx
    9668:	89 d0                	mov    %edx,%eax
    966a:	01 c0                	add    %eax,%eax
    966c:	01 d0                	add    %edx,%eax
    966e:	c1 e0 02             	shl    $0x2,%eax
    9671:	01 d0                	add    %edx,%eax
    9673:	89 ca                	mov    %ecx,%edx
    9675:	01 d2                	add    %edx,%edx
    9677:	89 d1                	mov    %edx,%ecx
    9679:	c1 e1 05             	shl    $0x5,%ecx
    967c:	29 d1                	sub    %edx,%ecx
    967e:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    9681:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9684:	01 d0                	add    %edx,%eax
    9686:	83 c0 14             	add    $0x14,%eax
    9689:	89 74 83 0c          	mov    %esi,0xc(%ebx,%eax,4)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
    968d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9691:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9695:	7e a9                	jle    9640 <III_get_scale_factors+0x1f5>
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
    9697:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    969b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    969e:	83 c0 01             	add    $0x1,%eax
    96a1:	83 c0 04             	add    $0x4,%eax
    96a4:	8b 04 85 04 11 01 00 	mov    0x11104(,%eax,4),%eax
    96ab:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    96ae:	7f 87                	jg     9637 <III_get_scale_factors+0x1ec>
						slen[1][gr_info->scalefac_compress]);
			for (sfb=12,window=0; window<3; window++)
				(*scalefac)[ch].s[window][sfb] = 0;
		}
		else {  /* SHORT*/
			for (i=0; i<2; i++)
    96b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    96b4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    96b8:	0f 8e 67 ff ff ff    	jle    9625 <III_get_scale_factors+0x1da>
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    96be:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    96c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    96cc:	eb 36                	jmp    9704 <III_get_scale_factors+0x2b9>
					(*scalefac)[ch].s[window][sfb] = 0;
    96ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
    96d1:	8b 55 ec             	mov    -0x14(%ebp),%edx
    96d4:	8b 4d 14             	mov    0x14(%ebp),%ecx
    96d7:	89 d0                	mov    %edx,%eax
    96d9:	01 c0                	add    %eax,%eax
    96db:	01 d0                	add    %edx,%eax
    96dd:	c1 e0 02             	shl    $0x2,%eax
    96e0:	01 d0                	add    %edx,%eax
    96e2:	89 ca                	mov    %ecx,%edx
    96e4:	01 d2                	add    %edx,%edx
    96e6:	89 d1                	mov    %edx,%ecx
    96e8:	c1 e1 05             	shl    $0x5,%ecx
    96eb:	29 d1                	sub    %edx,%ecx
    96ed:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    96f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    96f3:	01 d0                	add    %edx,%eax
    96f5:	83 c0 14             	add    $0x14,%eax
    96f8:	c7 44 83 0c 00 00 00 	movl   $0x0,0xc(%ebx,%eax,4)
    96ff:	00 
			for (i=0; i<2; i++)
				for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i+1]; sfb++)
					for (window=0; window<3; window++)
						(*scalefac)[ch].s[window][sfb] = hgetbits(
							slen[i][gr_info->scalefac_compress]);
				for (sfb=12,window=0; window<3; window++)
    9700:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    9704:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    9708:	7e c4                	jle    96ce <III_get_scale_factors+0x283>
{
	int sfb, i, window;
	struct gr_info_s *gr_info = &(si->ch[ch].gr[gr]);

	if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
		if (gr_info->mixed_block_flag) { /* MIXED */ /* NEW - ag 11/25 */
    970a:	e9 bb 00 00 00       	jmp    97ca <III_get_scale_factors+0x37f>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    970f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9716:	e9 89 00 00 00       	jmp    97a4 <III_get_scale_factors+0x359>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
    971b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    971e:	8b 55 14             	mov    0x14(%ebp),%edx
    9721:	89 d0                	mov    %edx,%eax
    9723:	c1 e0 02             	shl    $0x2,%eax
    9726:	01 d0                	add    %edx,%eax
    9728:	c1 e0 03             	shl    $0x3,%eax
    972b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    972e:	01 d0                	add    %edx,%eax
    9730:	8b 44 81 08          	mov    0x8(%ecx,%eax,4),%eax
    9734:	85 c0                	test   %eax,%eax
    9736:	74 06                	je     973e <III_get_scale_factors+0x2f3>
    9738:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    973c:	75 62                	jne    97a0 <III_get_scale_factors+0x355>
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    973e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9741:	8b 04 85 00 11 01 00 	mov    0x11100(,%eax,4),%eax
    9748:	89 45 f4             	mov    %eax,-0xc(%ebp)
    974b:	eb 41                	jmp    978e <III_get_scale_factors+0x343>
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
    974d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    9751:	0f 9f c0             	setg   %al
    9754:	0f b6 d0             	movzbl %al,%edx
    9757:	8b 45 e8             	mov    -0x18(%ebp),%eax
    975a:	8b 40 0c             	mov    0xc(%eax),%eax
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
    975d:	c1 e2 04             	shl    $0x4,%edx
    9760:	01 d0                	add    %edx,%eax
    9762:	8b 04 85 20 11 01 00 	mov    0x11120(,%eax,4),%eax
    9769:	89 04 24             	mov    %eax,(%esp)
    976c:	e8 14 d9 ff ff       	call   7085 <hgetbits>
    9771:	89 c3                	mov    %eax,%ebx
    9773:	8b 4d 08             	mov    0x8(%ebp),%ecx
    9776:	8b 45 14             	mov    0x14(%ebp),%eax
    9779:	01 c0                	add    %eax,%eax
    977b:	89 c2                	mov    %eax,%edx
    977d:	c1 e2 05             	shl    $0x5,%edx
    9780:	29 c2                	sub    %eax,%edx
    9782:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9785:	01 d0                	add    %edx,%eax
    9787:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
    978a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    978e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    9791:	83 c0 01             	add    $0x1,%eax
    9794:	8b 04 85 00 11 01 00 	mov    0x11100(,%eax,4),%eax
    979b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    979e:	7f ad                	jg     974d <III_get_scale_factors+0x302>
				for (sfb=12,window=0; window<3; window++)
					(*scalefac)[ch].s[window][sfb] = 0;
		}
	}
	else {   /* LONG types 0,1,3 */
		for (i=0; i<4; i++) {
    97a0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    97a4:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    97a8:	0f 8e 6d ff ff ff    	jle    971b <III_get_scale_factors+0x2d0>
			if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))
				for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)
					(*scalefac)[ch].l[sfb] = hgetbits(
						slen[(i<2)?0:1][gr_info->scalefac_compress]);
		}
		(*scalefac)[ch].l[22] = 0;
    97ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
    97b1:	8b 45 14             	mov    0x14(%ebp),%eax
    97b4:	c1 e0 03             	shl    $0x3,%eax
    97b7:	89 c2                	mov    %eax,%edx
    97b9:	c1 e2 05             	shl    $0x5,%edx
    97bc:	29 c2                	sub    %eax,%edx
    97be:	8d 04 11             	lea    (%ecx,%edx,1),%eax
    97c1:	83 c0 58             	add    $0x58,%eax
    97c4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
	}
}
    97ca:	83 c4 20             	add    $0x20,%esp
    97cd:	5b                   	pop    %ebx
    97ce:	5e                   	pop    %esi
    97cf:	5d                   	pop    %ebp
    97d0:	c3                   	ret    

000097d1 <initialize_huffman>:
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    97d1:	55                   	push   %ebp
    97d2:	89 e5                	mov    %esp,%ebp
    97d4:	83 ec 08             	sub    $0x8,%esp
	if (huffman_initialized) return;
    97d7:	a1 60 14 01 00       	mov    0x11460,%eax
    97dc:	85 c0                	test   %eax,%eax
    97de:	74 02                	je     97e2 <initialize_huffman+0x11>
    97e0:	eb 0f                	jmp    97f1 <initialize_huffman+0x20>
	read_decoder_table();
    97e2:	e8 03 d9 ff ff       	call   70ea <read_decoder_table>
	huffman_initialized = TRUE;
    97e7:	c7 05 60 14 01 00 01 	movl   $0x1,0x11460
    97ee:	00 00 00 
}
    97f1:	c9                   	leave  
    97f2:	c3                   	ret    

000097f3 <III_hufman_decode>:


void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    97f3:	55                   	push   %ebp
    97f4:	89 e5                	mov    %esp,%ebp
    97f6:	57                   	push   %edi
    97f7:	56                   	push   %esi
    97f8:	53                   	push   %ebx
    97f9:	83 ec 4c             	sub    $0x4c,%esp
   struct huffcodetab *h;
   int region1Start;
   int region2Start;
   //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

   initialize_huffman();
    97fc:	e8 d0 ff ff ff       	call   97d1 <initialize_huffman>

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    9801:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9804:	8b 45 14             	mov    0x14(%ebp),%eax
    9807:	8b 4d 10             	mov    0x10(%ebp),%ecx
    980a:	89 c2                	mov    %eax,%edx
    980c:	c1 e2 03             	shl    $0x3,%edx
    980f:	01 c2                	add    %eax,%edx
    9811:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9818:	89 c2                	mov    %eax,%edx
    981a:	89 c8                	mov    %ecx,%eax
    981c:	c1 e0 02             	shl    $0x2,%eax
    981f:	01 c8                	add    %ecx,%eax
    9821:	c1 e0 05             	shl    $0x5,%eax
    9824:	01 d0                	add    %edx,%eax
    9826:	01 d8                	add    %ebx,%eax
    9828:	83 c0 28             	add    $0x28,%eax
    982b:	8b 00                	mov    (%eax),%eax
    982d:	85 c0                	test   %eax,%eax
    982f:	74 44                	je     9875 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {
    9831:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9834:	8b 45 14             	mov    0x14(%ebp),%eax
    9837:	8b 4d 10             	mov    0x10(%ebp),%ecx
    983a:	89 c2                	mov    %eax,%edx
    983c:	c1 e2 03             	shl    $0x3,%edx
    983f:	01 c2                	add    %eax,%edx
    9841:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9848:	89 c2                	mov    %eax,%edx
    984a:	89 c8                	mov    %ecx,%eax
    984c:	c1 e0 02             	shl    $0x2,%eax
    984f:	01 c8                	add    %ecx,%eax
    9851:	c1 e0 05             	shl    $0x5,%eax
    9854:	01 d0                	add    %edx,%eax
    9856:	01 d8                	add    %ebx,%eax
    9858:	83 c0 2c             	add    $0x2c,%eax
    985b:	8b 00                	mov    (%eax),%eax

   initialize_huffman();

   /* ��������߽� */

   if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
    985d:	83 f8 02             	cmp    $0x2,%eax
    9860:	75 13                	jne    9875 <III_hufman_decode+0x82>
        ((*si).ch[ch].gr[gr].block_type == 2) ) {

      /* Region2. */

      region1Start = 36;  /* sfb[9/3]*3=36 */
    9862:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      region2Start = 576; /* No Region2 for short block case. */
    9869:	c7 45 d8 40 02 00 00 	movl   $0x240,-0x28(%ebp)
    9870:	e9 cc 00 00 00       	jmp    9941 <III_hufman_decode+0x14e>
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9875:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9878:	8b 00                	mov    (%eax),%eax
    987a:	8b 48 10             	mov    0x10(%eax),%ecx
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
    987d:	8b 75 0c             	mov    0xc(%ebp),%esi
    9880:	8b 45 14             	mov    0x14(%ebp),%eax
    9883:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9886:	89 c2                	mov    %eax,%edx
    9888:	c1 e2 03             	shl    $0x3,%edx
    988b:	01 c2                	add    %eax,%edx
    988d:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9894:	89 c2                	mov    %eax,%edx
    9896:	89 d8                	mov    %ebx,%eax
    9898:	c1 e0 02             	shl    $0x2,%eax
    989b:	01 d8                	add    %ebx,%eax
    989d:	c1 e0 05             	shl    $0x5,%eax
    98a0:	01 d0                	add    %edx,%eax
    98a2:	01 f0                	add    %esi,%eax
    98a4:	83 c0 4c             	add    $0x4c,%eax
    98a7:	8b 00                	mov    (%eax),%eax
    98a9:	8d 50 01             	lea    0x1(%eax),%edx
   }


   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
    98ac:	89 c8                	mov    %ecx,%eax
    98ae:	c1 e0 03             	shl    $0x3,%eax
    98b1:	01 c8                	add    %ecx,%eax
    98b3:	c1 e0 02             	shl    $0x2,%eax
    98b6:	01 c8                	add    %ecx,%eax
    98b8:	01 d0                	add    %edx,%eax
    98ba:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    98c1:	89 45 dc             	mov    %eax,-0x24(%ebp)
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    98c4:	8b 45 1c             	mov    0x1c(%ebp),%eax
    98c7:	8b 00                	mov    (%eax),%eax
    98c9:	8b 48 10             	mov    0x10(%eax),%ecx
                              .l[(*si).ch[ch].gr[gr].region0_count +
    98cc:	8b 75 0c             	mov    0xc(%ebp),%esi
    98cf:	8b 45 14             	mov    0x14(%ebp),%eax
    98d2:	8b 5d 10             	mov    0x10(%ebp),%ebx
    98d5:	89 c2                	mov    %eax,%edx
    98d7:	c1 e2 03             	shl    $0x3,%edx
    98da:	01 c2                	add    %eax,%edx
    98dc:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    98e3:	89 c2                	mov    %eax,%edx
    98e5:	89 d8                	mov    %ebx,%eax
    98e7:	c1 e0 02             	shl    $0x2,%eax
    98ea:	01 d8                	add    %ebx,%eax
    98ec:	c1 e0 05             	shl    $0x5,%eax
    98ef:	01 d0                	add    %edx,%eax
    98f1:	01 f0                	add    %esi,%eax
    98f3:	83 c0 4c             	add    $0x4c,%eax
    98f6:	8b 30                	mov    (%eax),%esi
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    98f8:	8b 7d 0c             	mov    0xc(%ebp),%edi
    98fb:	8b 45 14             	mov    0x14(%ebp),%eax
    98fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
    9901:	89 c2                	mov    %eax,%edx
    9903:	c1 e2 03             	shl    $0x3,%edx
    9906:	01 c2                	add    %eax,%edx
    9908:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    990f:	89 c2                	mov    %eax,%edx
    9911:	89 d8                	mov    %ebx,%eax
    9913:	c1 e0 02             	shl    $0x2,%eax
    9916:	01 d8                	add    %ebx,%eax
    9918:	c1 e0 05             	shl    $0x5,%eax
    991b:	01 d0                	add    %edx,%eax
    991d:	01 f8                	add    %edi,%eax
    991f:	83 c0 50             	add    $0x50,%eax
    9922:	8b 00                	mov    (%eax),%eax
   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                              .l[(*si).ch[ch].gr[gr].region0_count +
    9924:	01 f0                	add    %esi,%eax
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    9926:	8d 50 02             	lea    0x2(%eax),%edx

   else {          /* ���ҳ�������µ�����߽�. */

      region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                           .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
      region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
    9929:	89 c8                	mov    %ecx,%eax
    992b:	c1 e0 03             	shl    $0x3,%eax
    992e:	01 c8                	add    %ecx,%eax
    9930:	c1 e0 02             	shl    $0x2,%eax
    9933:	01 c8                	add    %ecx,%eax
    9935:	01 d0                	add    %edx,%eax
    9937:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    993e:	89 45 d8             	mov    %eax,-0x28(%ebp)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    9941:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    9948:	e9 ac 01 00 00       	jmp    9af9 <III_hufman_decode+0x306>
      if      (i<region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
    994d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9950:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    9953:	7d 43                	jge    9998 <III_hufman_decode+0x1a5>
    9955:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9958:	8b 45 14             	mov    0x14(%ebp),%eax
    995b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    995e:	89 c2                	mov    %eax,%edx
    9960:	c1 e2 03             	shl    $0x3,%edx
    9963:	01 c2                	add    %eax,%edx
    9965:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    996c:	89 c2                	mov    %eax,%edx
    996e:	89 c8                	mov    %ecx,%eax
    9970:	c1 e0 02             	shl    $0x2,%eax
    9973:	01 c8                	add    %ecx,%eax
    9975:	c1 e0 05             	shl    $0x5,%eax
    9978:	01 d0                	add    %edx,%eax
    997a:	01 d8                	add    %ebx,%eax
    997c:	83 c0 34             	add    $0x34,%eax
    997f:	8b 10                	mov    (%eax),%edx
    9981:	89 d0                	mov    %edx,%eax
    9983:	c1 e0 02             	shl    $0x2,%eax
    9986:	01 d0                	add    %edx,%eax
    9988:	c1 e0 03             	shl    $0x3,%eax
    998b:	05 e0 4e 01 00       	add    $0x14ee0,%eax
    9990:	89 45 e0             	mov    %eax,-0x20(%ebp)
    9993:	e9 86 00 00 00       	jmp    9a1e <III_hufman_decode+0x22b>
      else if (i<region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
    9998:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    999b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    999e:	7d 40                	jge    99e0 <III_hufman_decode+0x1ed>
    99a0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    99a3:	8b 45 14             	mov    0x14(%ebp),%eax
    99a6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    99a9:	89 c2                	mov    %eax,%edx
    99ab:	c1 e2 03             	shl    $0x3,%edx
    99ae:	01 c2                	add    %eax,%edx
    99b0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    99b7:	89 c2                	mov    %eax,%edx
    99b9:	89 c8                	mov    %ecx,%eax
    99bb:	c1 e0 02             	shl    $0x2,%eax
    99be:	01 c8                	add    %ecx,%eax
    99c0:	c1 e0 05             	shl    $0x5,%eax
    99c3:	01 d0                	add    %edx,%eax
    99c5:	01 d8                	add    %ebx,%eax
    99c7:	83 c0 38             	add    $0x38,%eax
    99ca:	8b 10                	mov    (%eax),%edx
    99cc:	89 d0                	mov    %edx,%eax
    99ce:	c1 e0 02             	shl    $0x2,%eax
    99d1:	01 d0                	add    %edx,%eax
    99d3:	c1 e0 03             	shl    $0x3,%eax
    99d6:	05 e0 4e 01 00       	add    $0x14ee0,%eax
    99db:	89 45 e0             	mov    %eax,-0x20(%ebp)
    99de:	eb 3e                	jmp    9a1e <III_hufman_decode+0x22b>
           else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
    99e0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    99e3:	8b 45 14             	mov    0x14(%ebp),%eax
    99e6:	8b 4d 10             	mov    0x10(%ebp),%ecx
    99e9:	89 c2                	mov    %eax,%edx
    99eb:	c1 e2 03             	shl    $0x3,%edx
    99ee:	01 c2                	add    %eax,%edx
    99f0:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    99f7:	89 c2                	mov    %eax,%edx
    99f9:	89 c8                	mov    %ecx,%eax
    99fb:	c1 e0 02             	shl    $0x2,%eax
    99fe:	01 c8                	add    %ecx,%eax
    9a00:	c1 e0 05             	shl    $0x5,%eax
    9a03:	01 d0                	add    %edx,%eax
    9a05:	01 d8                	add    %ebx,%eax
    9a07:	83 c0 3c             	add    $0x3c,%eax
    9a0a:	8b 10                	mov    (%eax),%edx
    9a0c:	89 d0                	mov    %edx,%eax
    9a0e:	c1 e0 02             	shl    $0x2,%eax
    9a11:	01 d0                	add    %edx,%eax
    9a13:	c1 e0 03             	shl    $0x3,%eax
    9a16:	05 e0 4e 01 00       	add    $0x14ee0,%eax
    9a1b:	89 45 e0             	mov    %eax,-0x20(%ebp)
      huffman_decoder(h, &x, &y, &v, &w);
    9a1e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    9a21:	89 44 24 10          	mov    %eax,0x10(%esp)
    9a25:	8d 45 cc             	lea    -0x34(%ebp),%eax
    9a28:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9a2c:	8d 45 d0             	lea    -0x30(%ebp),%eax
    9a2f:	89 44 24 08          	mov    %eax,0x8(%esp)
    9a33:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    9a36:	89 44 24 04          	mov    %eax,0x4(%esp)
    9a3a:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9a3d:	89 04 24             	mov    %eax,(%esp)
    9a40:	e8 fd ee ff ff       	call   8942 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = x;
    9a45:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9a48:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a4d:	89 c8                	mov    %ecx,%eax
    9a4f:	f7 ea                	imul   %edx
    9a51:	c1 fa 02             	sar    $0x2,%edx
    9a54:	89 c8                	mov    %ecx,%eax
    9a56:	c1 f8 1f             	sar    $0x1f,%eax
    9a59:	29 c2                	sub    %eax,%edx
    9a5b:	89 d0                	mov    %edx,%eax
    9a5d:	89 c2                	mov    %eax,%edx
    9a5f:	89 d0                	mov    %edx,%eax
    9a61:	c1 e0 03             	shl    $0x3,%eax
    9a64:	01 d0                	add    %edx,%eax
    9a66:	c1 e0 03             	shl    $0x3,%eax
    9a69:	89 c2                	mov    %eax,%edx
    9a6b:	8b 45 08             	mov    0x8(%ebp),%eax
    9a6e:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9a71:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9a74:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9a79:	89 c8                	mov    %ecx,%eax
    9a7b:	f7 ea                	imul   %edx
    9a7d:	c1 fa 02             	sar    $0x2,%edx
    9a80:	89 c8                	mov    %ecx,%eax
    9a82:	c1 f8 1f             	sar    $0x1f,%eax
    9a85:	29 c2                	sub    %eax,%edx
    9a87:	89 d0                	mov    %edx,%eax
    9a89:	c1 e0 03             	shl    $0x3,%eax
    9a8c:	01 d0                	add    %edx,%eax
    9a8e:	01 c0                	add    %eax,%eax
    9a90:	29 c1                	sub    %eax,%ecx
    9a92:	89 ca                	mov    %ecx,%edx
    9a94:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9a97:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
    9a9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9a9d:	8d 48 01             	lea    0x1(%eax),%ecx
    9aa0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9aa5:	89 c8                	mov    %ecx,%eax
    9aa7:	f7 ea                	imul   %edx
    9aa9:	c1 fa 02             	sar    $0x2,%edx
    9aac:	89 c8                	mov    %ecx,%eax
    9aae:	c1 f8 1f             	sar    $0x1f,%eax
    9ab1:	29 c2                	sub    %eax,%edx
    9ab3:	89 d0                	mov    %edx,%eax
    9ab5:	89 c2                	mov    %eax,%edx
    9ab7:	89 d0                	mov    %edx,%eax
    9ab9:	c1 e0 03             	shl    $0x3,%eax
    9abc:	01 d0                	add    %edx,%eax
    9abe:	c1 e0 03             	shl    $0x3,%eax
    9ac1:	89 c2                	mov    %eax,%edx
    9ac3:	8b 45 08             	mov    0x8(%ebp),%eax
    9ac6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9ac9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9acc:	8d 48 01             	lea    0x1(%eax),%ecx
    9acf:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9ad4:	89 c8                	mov    %ecx,%eax
    9ad6:	f7 ea                	imul   %edx
    9ad8:	c1 fa 02             	sar    $0x2,%edx
    9adb:	89 c8                	mov    %ecx,%eax
    9add:	c1 f8 1f             	sar    $0x1f,%eax
    9ae0:	29 c2                	sub    %eax,%edx
    9ae2:	89 d0                	mov    %edx,%eax
    9ae4:	c1 e0 03             	shl    $0x3,%eax
    9ae7:	01 d0                	add    %edx,%eax
    9ae9:	01 c0                	add    %eax,%eax
    9aeb:	29 c1                	sub    %eax,%ecx
    9aed:	89 ca                	mov    %ecx,%edx
    9aef:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9af2:	89 04 93             	mov    %eax,(%ebx,%edx,4)
                              (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
      }


   /* ��ȡ��ֵ����Read bigvalues area. */
   for (i=0; i<(*si).ch[ch].gr[gr].big_values*2; i+=2) {
    9af5:	83 45 e4 02          	addl   $0x2,-0x1c(%ebp)
    9af9:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    9afc:	8b 75 0c             	mov    0xc(%ebp),%esi
    9aff:	8b 45 14             	mov    0x14(%ebp),%eax
    9b02:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9b05:	89 c2                	mov    %eax,%edx
    9b07:	c1 e2 03             	shl    $0x3,%edx
    9b0a:	01 c2                	add    %eax,%edx
    9b0c:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9b13:	89 c2                	mov    %eax,%edx
    9b15:	89 c8                	mov    %ecx,%eax
    9b17:	c1 e0 02             	shl    $0x2,%eax
    9b1a:	01 c8                	add    %ecx,%eax
    9b1c:	c1 e0 05             	shl    $0x5,%eax
    9b1f:	01 d0                	add    %edx,%eax
    9b21:	01 f0                	add    %esi,%eax
    9b23:	83 c0 1c             	add    $0x1c,%eax
    9b26:	8b 00                	mov    (%eax),%eax
    9b28:	01 c0                	add    %eax,%eax
    9b2a:	39 c3                	cmp    %eax,%ebx
    9b2c:	0f 82 1b fe ff ff    	jb     994d <III_hufman_decode+0x15a>
      is[i/SSLIMIT][i%SSLIMIT] = x;
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
    9b32:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9b35:	8b 45 14             	mov    0x14(%ebp),%eax
    9b38:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9b3b:	89 c2                	mov    %eax,%edx
    9b3d:	c1 e2 03             	shl    $0x3,%edx
    9b40:	01 c2                	add    %eax,%edx
    9b42:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9b49:	89 c2                	mov    %eax,%edx
    9b4b:	89 c8                	mov    %ecx,%eax
    9b4d:	c1 e0 02             	shl    $0x2,%eax
    9b50:	01 c8                	add    %ecx,%eax
    9b52:	c1 e0 05             	shl    $0x5,%eax
    9b55:	01 d0                	add    %edx,%eax
    9b57:	01 d8                	add    %ebx,%eax
    9b59:	83 c0 5c             	add    $0x5c,%eax
    9b5c:	8b 00                	mov    (%eax),%eax
    9b5e:	8d 50 20             	lea    0x20(%eax),%edx
    9b61:	89 d0                	mov    %edx,%eax
    9b63:	c1 e0 02             	shl    $0x2,%eax
    9b66:	01 d0                	add    %edx,%eax
    9b68:	c1 e0 03             	shl    $0x3,%eax
    9b6b:	05 e0 4e 01 00       	add    $0x14ee0,%eax
    9b70:	89 45 e0             	mov    %eax,-0x20(%ebp)
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    9b73:	e9 91 01 00 00       	jmp    9d09 <III_hufman_decode+0x516>
     ( i < SSLIMIT*SBLIMIT )) {
      huffman_decoder(h, &x, &y, &v, &w);
    9b78:	8d 45 c8             	lea    -0x38(%ebp),%eax
    9b7b:	89 44 24 10          	mov    %eax,0x10(%esp)
    9b7f:	8d 45 cc             	lea    -0x34(%ebp),%eax
    9b82:	89 44 24 0c          	mov    %eax,0xc(%esp)
    9b86:	8d 45 d0             	lea    -0x30(%ebp),%eax
    9b89:	89 44 24 08          	mov    %eax,0x8(%esp)
    9b8d:	8d 45 d4             	lea    -0x2c(%ebp),%eax
    9b90:	89 44 24 04          	mov    %eax,0x4(%esp)
    9b94:	8b 45 e0             	mov    -0x20(%ebp),%eax
    9b97:	89 04 24             	mov    %eax,(%esp)
    9b9a:	e8 a3 ed ff ff       	call   8942 <huffman_decoder>
      is[i/SSLIMIT][i%SSLIMIT] = v;
    9b9f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9ba2:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9ba7:	89 c8                	mov    %ecx,%eax
    9ba9:	f7 ea                	imul   %edx
    9bab:	c1 fa 02             	sar    $0x2,%edx
    9bae:	89 c8                	mov    %ecx,%eax
    9bb0:	c1 f8 1f             	sar    $0x1f,%eax
    9bb3:	29 c2                	sub    %eax,%edx
    9bb5:	89 d0                	mov    %edx,%eax
    9bb7:	89 c2                	mov    %eax,%edx
    9bb9:	89 d0                	mov    %edx,%eax
    9bbb:	c1 e0 03             	shl    $0x3,%eax
    9bbe:	01 d0                	add    %edx,%eax
    9bc0:	c1 e0 03             	shl    $0x3,%eax
    9bc3:	89 c2                	mov    %eax,%edx
    9bc5:	8b 45 08             	mov    0x8(%ebp),%eax
    9bc8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9bcb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9bce:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bd3:	89 c8                	mov    %ecx,%eax
    9bd5:	f7 ea                	imul   %edx
    9bd7:	c1 fa 02             	sar    $0x2,%edx
    9bda:	89 c8                	mov    %ecx,%eax
    9bdc:	c1 f8 1f             	sar    $0x1f,%eax
    9bdf:	29 c2                	sub    %eax,%edx
    9be1:	89 d0                	mov    %edx,%eax
    9be3:	c1 e0 03             	shl    $0x3,%eax
    9be6:	01 d0                	add    %edx,%eax
    9be8:	01 c0                	add    %eax,%eax
    9bea:	29 c1                	sub    %eax,%ecx
    9bec:	89 ca                	mov    %ecx,%edx
    9bee:	8b 45 cc             	mov    -0x34(%ebp),%eax
    9bf1:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = w;
    9bf4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9bf7:	8d 48 01             	lea    0x1(%eax),%ecx
    9bfa:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9bff:	89 c8                	mov    %ecx,%eax
    9c01:	f7 ea                	imul   %edx
    9c03:	c1 fa 02             	sar    $0x2,%edx
    9c06:	89 c8                	mov    %ecx,%eax
    9c08:	c1 f8 1f             	sar    $0x1f,%eax
    9c0b:	29 c2                	sub    %eax,%edx
    9c0d:	89 d0                	mov    %edx,%eax
    9c0f:	89 c2                	mov    %eax,%edx
    9c11:	89 d0                	mov    %edx,%eax
    9c13:	c1 e0 03             	shl    $0x3,%eax
    9c16:	01 d0                	add    %edx,%eax
    9c18:	c1 e0 03             	shl    $0x3,%eax
    9c1b:	89 c2                	mov    %eax,%edx
    9c1d:	8b 45 08             	mov    0x8(%ebp),%eax
    9c20:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9c23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9c26:	8d 48 01             	lea    0x1(%eax),%ecx
    9c29:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c2e:	89 c8                	mov    %ecx,%eax
    9c30:	f7 ea                	imul   %edx
    9c32:	c1 fa 02             	sar    $0x2,%edx
    9c35:	89 c8                	mov    %ecx,%eax
    9c37:	c1 f8 1f             	sar    $0x1f,%eax
    9c3a:	29 c2                	sub    %eax,%edx
    9c3c:	89 d0                	mov    %edx,%eax
    9c3e:	c1 e0 03             	shl    $0x3,%eax
    9c41:	01 d0                	add    %edx,%eax
    9c43:	01 c0                	add    %eax,%eax
    9c45:	29 c1                	sub    %eax,%ecx
    9c47:	89 ca                	mov    %ecx,%edx
    9c49:	8b 45 c8             	mov    -0x38(%ebp),%eax
    9c4c:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
    9c4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9c52:	8d 48 02             	lea    0x2(%eax),%ecx
    9c55:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c5a:	89 c8                	mov    %ecx,%eax
    9c5c:	f7 ea                	imul   %edx
    9c5e:	c1 fa 02             	sar    $0x2,%edx
    9c61:	89 c8                	mov    %ecx,%eax
    9c63:	c1 f8 1f             	sar    $0x1f,%eax
    9c66:	29 c2                	sub    %eax,%edx
    9c68:	89 d0                	mov    %edx,%eax
    9c6a:	89 c2                	mov    %eax,%edx
    9c6c:	89 d0                	mov    %edx,%eax
    9c6e:	c1 e0 03             	shl    $0x3,%eax
    9c71:	01 d0                	add    %edx,%eax
    9c73:	c1 e0 03             	shl    $0x3,%eax
    9c76:	89 c2                	mov    %eax,%edx
    9c78:	8b 45 08             	mov    0x8(%ebp),%eax
    9c7b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9c7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9c81:	8d 48 02             	lea    0x2(%eax),%ecx
    9c84:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9c89:	89 c8                	mov    %ecx,%eax
    9c8b:	f7 ea                	imul   %edx
    9c8d:	c1 fa 02             	sar    $0x2,%edx
    9c90:	89 c8                	mov    %ecx,%eax
    9c92:	c1 f8 1f             	sar    $0x1f,%eax
    9c95:	29 c2                	sub    %eax,%edx
    9c97:	89 d0                	mov    %edx,%eax
    9c99:	c1 e0 03             	shl    $0x3,%eax
    9c9c:	01 d0                	add    %edx,%eax
    9c9e:	01 c0                	add    %eax,%eax
    9ca0:	29 c1                	sub    %eax,%ecx
    9ca2:	89 ca                	mov    %ecx,%edx
    9ca4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    9ca7:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
    9caa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9cad:	8d 48 03             	lea    0x3(%eax),%ecx
    9cb0:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9cb5:	89 c8                	mov    %ecx,%eax
    9cb7:	f7 ea                	imul   %edx
    9cb9:	c1 fa 02             	sar    $0x2,%edx
    9cbc:	89 c8                	mov    %ecx,%eax
    9cbe:	c1 f8 1f             	sar    $0x1f,%eax
    9cc1:	29 c2                	sub    %eax,%edx
    9cc3:	89 d0                	mov    %edx,%eax
    9cc5:	89 c2                	mov    %eax,%edx
    9cc7:	89 d0                	mov    %edx,%eax
    9cc9:	c1 e0 03             	shl    $0x3,%eax
    9ccc:	01 d0                	add    %edx,%eax
    9cce:	c1 e0 03             	shl    $0x3,%eax
    9cd1:	89 c2                	mov    %eax,%edx
    9cd3:	8b 45 08             	mov    0x8(%ebp),%eax
    9cd6:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9cd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    9cdc:	8d 48 03             	lea    0x3(%eax),%ecx
    9cdf:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9ce4:	89 c8                	mov    %ecx,%eax
    9ce6:	f7 ea                	imul   %edx
    9ce8:	c1 fa 02             	sar    $0x2,%edx
    9ceb:	89 c8                	mov    %ecx,%eax
    9ced:	c1 f8 1f             	sar    $0x1f,%eax
    9cf0:	29 c2                	sub    %eax,%edx
    9cf2:	89 d0                	mov    %edx,%eax
    9cf4:	c1 e0 03             	shl    $0x3,%eax
    9cf7:	01 d0                	add    %edx,%eax
    9cf9:	01 c0                	add    %eax,%eax
    9cfb:	29 c1                	sub    %eax,%ecx
    9cfd:	89 ca                	mov    %ecx,%edx
    9cff:	8b 45 d0             	mov    -0x30(%ebp),%eax
    9d02:	89 04 93             	mov    %eax,(%ebx,%edx,4)
      i += 4;
    9d05:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
      is[(i+1)/SSLIMIT][(i+1)%SSLIMIT] = y;
      }

   /* Read count1 area. */
   h = &ht[(*si).ch[ch].gr[gr].count1table_select+32];
   while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
    9d09:	e8 5b d3 ff ff       	call   7069 <hsstell>
    9d0e:	89 c3                	mov    %eax,%ebx
    9d10:	8b 75 0c             	mov    0xc(%ebp),%esi
    9d13:	8b 45 14             	mov    0x14(%ebp),%eax
    9d16:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9d19:	89 c2                	mov    %eax,%edx
    9d1b:	c1 e2 03             	shl    $0x3,%edx
    9d1e:	01 c2                	add    %eax,%edx
    9d20:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9d27:	89 c2                	mov    %eax,%edx
    9d29:	89 c8                	mov    %ecx,%eax
    9d2b:	c1 e0 02             	shl    $0x2,%eax
    9d2e:	01 c8                	add    %ecx,%eax
    9d30:	c1 e0 05             	shl    $0x5,%eax
    9d33:	01 d0                	add    %edx,%eax
    9d35:	01 f0                	add    %esi,%eax
    9d37:	83 c0 18             	add    $0x18,%eax
    9d3a:	8b 10                	mov    (%eax),%edx
    9d3c:	8b 45 18             	mov    0x18(%ebp),%eax
    9d3f:	01 d0                	add    %edx,%eax
    9d41:	39 c3                	cmp    %eax,%ebx
    9d43:	73 0d                	jae    9d52 <III_hufman_decode+0x55f>
    9d45:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9d4c:	0f 8e 26 fe ff ff    	jle    9b78 <III_hufman_decode+0x385>
      is[(i+2)/SSLIMIT][(i+2)%SSLIMIT] = x;
      is[(i+3)/SSLIMIT][(i+3)%SSLIMIT] = y;
      i += 4;
      }

   if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    9d52:	e8 12 d3 ff ff       	call   7069 <hsstell>
    9d57:	89 c3                	mov    %eax,%ebx
    9d59:	8b 75 0c             	mov    0xc(%ebp),%esi
    9d5c:	8b 45 14             	mov    0x14(%ebp),%eax
    9d5f:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9d62:	89 c2                	mov    %eax,%edx
    9d64:	c1 e2 03             	shl    $0x3,%edx
    9d67:	01 c2                	add    %eax,%edx
    9d69:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9d70:	89 c2                	mov    %eax,%edx
    9d72:	89 c8                	mov    %ecx,%eax
    9d74:	c1 e0 02             	shl    $0x2,%eax
    9d77:	01 c8                	add    %ecx,%eax
    9d79:	c1 e0 05             	shl    $0x5,%eax
    9d7c:	01 d0                	add    %edx,%eax
    9d7e:	01 f0                	add    %esi,%eax
    9d80:	83 c0 18             	add    $0x18,%eax
    9d83:	8b 10                	mov    (%eax),%edx
    9d85:	8b 45 18             	mov    0x18(%ebp),%eax
    9d88:	01 d0                	add    %edx,%eax
    9d8a:	39 c3                	cmp    %eax,%ebx
    9d8c:	76 48                	jbe    9dd6 <III_hufman_decode+0x5e3>
   {  i -=4;
    9d8e:	83 6d e4 04          	subl   $0x4,-0x1c(%ebp)
      rewindNbits(hsstell()-part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    9d92:	e8 d2 d2 ff ff       	call   7069 <hsstell>
    9d97:	8b 55 18             	mov    0x18(%ebp),%edx
    9d9a:	29 d0                	sub    %edx,%eax
    9d9c:	89 c6                	mov    %eax,%esi
    9d9e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9da1:	8b 45 14             	mov    0x14(%ebp),%eax
    9da4:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9da7:	89 c2                	mov    %eax,%edx
    9da9:	c1 e2 03             	shl    $0x3,%edx
    9dac:	01 c2                	add    %eax,%edx
    9dae:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9db5:	89 c2                	mov    %eax,%edx
    9db7:	89 c8                	mov    %ecx,%eax
    9db9:	c1 e0 02             	shl    $0x2,%eax
    9dbc:	01 c8                	add    %ecx,%eax
    9dbe:	c1 e0 05             	shl    $0x5,%eax
    9dc1:	01 d0                	add    %edx,%eax
    9dc3:	01 d8                	add    %ebx,%eax
    9dc5:	83 c0 18             	add    $0x18,%eax
    9dc8:	8b 00                	mov    (%eax),%eax
    9dca:	29 c6                	sub    %eax,%esi
    9dcc:	89 f0                	mov    %esi,%eax
    9dce:	89 04 24             	mov    %eax,(%esp)
    9dd1:	e8 de d2 ff ff       	call   70b4 <rewindNbits>
   }

   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
    9dd6:	e8 8e d2 ff ff       	call   7069 <hsstell>
    9ddb:	89 c3                	mov    %eax,%ebx
    9ddd:	8b 75 0c             	mov    0xc(%ebp),%esi
    9de0:	8b 45 14             	mov    0x14(%ebp),%eax
    9de3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9de6:	89 c2                	mov    %eax,%edx
    9de8:	c1 e2 03             	shl    $0x3,%edx
    9deb:	01 c2                	add    %eax,%edx
    9ded:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9df4:	89 c2                	mov    %eax,%edx
    9df6:	89 c8                	mov    %ecx,%eax
    9df8:	c1 e0 02             	shl    $0x2,%eax
    9dfb:	01 c8                	add    %ecx,%eax
    9dfd:	c1 e0 05             	shl    $0x5,%eax
    9e00:	01 d0                	add    %edx,%eax
    9e02:	01 f0                	add    %esi,%eax
    9e04:	83 c0 18             	add    $0x18,%eax
    9e07:	8b 10                	mov    (%eax),%edx
    9e09:	8b 45 18             	mov    0x18(%ebp),%eax
    9e0c:	01 d0                	add    %edx,%eax
    9e0e:	39 c3                	cmp    %eax,%ebx
    9e10:	73 45                	jae    9e57 <III_hufman_decode+0x664>
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());
    9e12:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    9e15:	8b 45 14             	mov    0x14(%ebp),%eax
    9e18:	8b 4d 10             	mov    0x10(%ebp),%ecx
    9e1b:	89 c2                	mov    %eax,%edx
    9e1d:	c1 e2 03             	shl    $0x3,%edx
    9e20:	01 c2                	add    %eax,%edx
    9e22:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
    9e29:	89 c2                	mov    %eax,%edx
    9e2b:	89 c8                	mov    %ecx,%eax
    9e2d:	c1 e0 02             	shl    $0x2,%eax
    9e30:	01 c8                	add    %ecx,%eax
    9e32:	c1 e0 05             	shl    $0x5,%eax
    9e35:	01 d0                	add    %edx,%eax
    9e37:	01 d8                	add    %ebx,%eax
    9e39:	83 c0 18             	add    $0x18,%eax
    9e3c:	8b 10                	mov    (%eax),%edx
    9e3e:	8b 45 18             	mov    0x18(%ebp),%eax
    9e41:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9e44:	e8 20 d2 ff ff       	call   7069 <hsstell>
    9e49:	29 c3                	sub    %eax,%ebx
    9e4b:	89 d8                	mov    %ebx,%eax
    9e4d:	89 04 24             	mov    %eax,(%esp)
    9e50:	e8 30 d2 ff ff       	call   7085 <hgetbits>

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9e55:	eb 5c                	jmp    9eb3 <III_hufman_decode+0x6c0>
    9e57:	eb 5a                	jmp    9eb3 <III_hufman_decode+0x6c0>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
    9e59:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9e5c:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e61:	89 c8                	mov    %ecx,%eax
    9e63:	f7 ea                	imul   %edx
    9e65:	c1 fa 02             	sar    $0x2,%edx
    9e68:	89 c8                	mov    %ecx,%eax
    9e6a:	c1 f8 1f             	sar    $0x1f,%eax
    9e6d:	29 c2                	sub    %eax,%edx
    9e6f:	89 d0                	mov    %edx,%eax
    9e71:	89 c2                	mov    %eax,%edx
    9e73:	89 d0                	mov    %edx,%eax
    9e75:	c1 e0 03             	shl    $0x3,%eax
    9e78:	01 d0                	add    %edx,%eax
    9e7a:	c1 e0 03             	shl    $0x3,%eax
    9e7d:	89 c2                	mov    %eax,%edx
    9e7f:	8b 45 08             	mov    0x8(%ebp),%eax
    9e82:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    9e85:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    9e88:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    9e8d:	89 c8                	mov    %ecx,%eax
    9e8f:	f7 ea                	imul   %edx
    9e91:	c1 fa 02             	sar    $0x2,%edx
    9e94:	89 c8                	mov    %ecx,%eax
    9e96:	c1 f8 1f             	sar    $0x1f,%eax
    9e99:	29 c2                	sub    %eax,%edx
    9e9b:	89 d0                	mov    %edx,%eax
    9e9d:	c1 e0 03             	shl    $0x3,%eax
    9ea0:	01 d0                	add    %edx,%eax
    9ea2:	01 c0                	add    %eax,%eax
    9ea4:	29 c1                	sub    %eax,%ecx
    9ea6:	89 ca                	mov    %ecx,%edx
    9ea8:	c7 04 93 00 00 00 00 	movl   $0x0,(%ebx,%edx,4)
   /* Dismiss stuffing Bits */
   if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
      hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

   /* Zero out rest. */
   for (; i<SSLIMIT*SBLIMIT; i++)
    9eaf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    9eb3:	81 7d e4 3f 02 00 00 	cmpl   $0x23f,-0x1c(%ebp)
    9eba:	7e 9d                	jle    9e59 <III_hufman_decode+0x666>
      is[i/SSLIMIT][i%SSLIMIT] = 0;
}
    9ebc:	83 c4 4c             	add    $0x4c,%esp
    9ebf:	5b                   	pop    %ebx
    9ec0:	5e                   	pop    %esi
    9ec1:	5f                   	pop    %edi
    9ec2:	5d                   	pop    %ebp
    9ec3:	c3                   	ret    

00009ec4 <III_dequantize_sample>:


int pretab[22] = {0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,3,3,3,2,0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    9ec4:	55                   	push   %ebp
    9ec5:	89 e5                	mov    %esp,%ebp
    9ec7:	56                   	push   %esi
    9ec8:	53                   	push   %ebx
    9ec9:	83 ec 50             	sub    $0x50,%esp
	int ss,sb,cb=0,sfreq=fr_ps->header->sampling_frequency;
    9ecc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    9ed3:	8b 45 1c             	mov    0x1c(%ebp),%eax
    9ed6:	8b 00                	mov    (%eax),%eax
    9ed8:	8b 40 10             	mov    0x10(%eax),%eax
    9edb:	89 45 dc             	mov    %eax,-0x24(%ebp)
	//int stereo = fr_ps->stereo;
	int next_cb_boundary, cb_begin, cb_width = 0, sign;
    9ede:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
    9ee5:	8b 45 14             	mov    0x14(%ebp),%eax
    9ee8:	8b 40 10             	mov    0x10(%eax),%eax
    9eeb:	85 c0                	test   %eax,%eax
    9eed:	74 61                	je     9f50 <III_dequantize_sample+0x8c>
    9eef:	8b 45 14             	mov    0x14(%ebp),%eax
    9ef2:	8b 40 14             	mov    0x14(%eax),%eax
    9ef5:	83 f8 02             	cmp    $0x2,%eax
    9ef8:	75 56                	jne    9f50 <III_dequantize_sample+0x8c>
		if (gr_info->mixed_block_flag)
    9efa:	8b 45 14             	mov    0x14(%ebp),%eax
    9efd:	8b 40 18             	mov    0x18(%eax),%eax
    9f00:	85 c0                	test   %eax,%eax
    9f02:	74 15                	je     9f19 <III_dequantize_sample+0x55>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9f04:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9f07:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f0d:	05 a4 11 01 00       	add    $0x111a4,%eax
    9f12:	8b 00                	mov    (%eax),%eax
    9f14:	89 45 e8             	mov    %eax,-0x18(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9f17:	eb 4a                	jmp    9f63 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
		else {
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
    9f19:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9f1c:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f22:	05 f4 11 01 00       	add    $0x111f4,%eax
    9f27:	8b 50 0c             	mov    0xc(%eax),%edx
    9f2a:	89 d0                	mov    %edx,%eax
    9f2c:	01 c0                	add    %eax,%eax
    9f2e:	01 d0                	add    %edx,%eax
    9f30:	89 45 e8             	mov    %eax,-0x18(%ebp)
			cb_width = sfBandIndex[sfreq].s[1];
    9f33:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9f36:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f3c:	05 f4 11 01 00       	add    $0x111f4,%eax
    9f41:	8b 40 0c             	mov    0xc(%eax),%eax
    9f44:	89 45 e0             	mov    %eax,-0x20(%ebp)
			cb_begin = 0;
    9f47:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
	int next_cb_boundary, cb_begin, cb_width = 0, sign;

	/* choose correct scalefactor band per block type, initalize boundary */

	if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
		if (gr_info->mixed_block_flag)
    9f4e:	eb 13                	jmp    9f63 <III_dequantize_sample+0x9f>
			next_cb_boundary=sfBandIndex[sfreq].s[1]*3; /* pure SHORT block */
			cb_width = sfBandIndex[sfreq].s[1];
			cb_begin = 0;
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */
    9f50:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9f53:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9f59:	05 a4 11 01 00       	add    $0x111a4,%eax
    9f5e:	8b 00                	mov    (%eax),%eax
    9f60:	89 45 e8             	mov    %eax,-0x18(%ebp)

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    9f63:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    9f6a:	e9 3d 06 00 00       	jmp    a5ac <III_dequantize_sample+0x6e8>
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    9f6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    9f76:	e9 23 06 00 00       	jmp    a59e <III_dequantize_sample+0x6da>
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
    9f7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9f7e:	89 d0                	mov    %edx,%eax
    9f80:	c1 e0 03             	shl    $0x3,%eax
    9f83:	01 d0                	add    %edx,%eax
    9f85:	01 c0                	add    %eax,%eax
    9f87:	89 c2                	mov    %eax,%edx
    9f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9f8c:	01 d0                	add    %edx,%eax
    9f8e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    9f91:	0f 85 9e 02 00 00    	jne    a235 <III_dequantize_sample+0x371>
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    9f97:	8b 45 14             	mov    0x14(%ebp),%eax
    9f9a:	8b 40 10             	mov    0x10(%eax),%eax
    9f9d:	85 c0                	test   %eax,%eax
    9f9f:	0f 84 6b 02 00 00    	je     a210 <III_dequantize_sample+0x34c>
    9fa5:	8b 45 14             	mov    0x14(%ebp),%eax
    9fa8:	8b 40 14             	mov    0x14(%eax),%eax
    9fab:	83 f8 02             	cmp    $0x2,%eax
    9fae:	0f 85 5c 02 00 00    	jne    a210 <III_dequantize_sample+0x34c>
					if (gr_info->mixed_block_flag) {
    9fb4:	8b 45 14             	mov    0x14(%ebp),%eax
    9fb7:	8b 40 18             	mov    0x18(%eax),%eax
    9fba:	85 c0                	test   %eax,%eax
    9fbc:	0f 84 af 01 00 00    	je     a171 <III_dequantize_sample+0x2ad>
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
    9fc2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    9fc5:	89 d0                	mov    %edx,%eax
    9fc7:	c1 e0 03             	shl    $0x3,%eax
    9fca:	01 d0                	add    %edx,%eax
    9fcc:	01 c0                	add    %eax,%eax
    9fce:	89 c2                	mov    %eax,%edx
    9fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    9fd3:	01 c2                	add    %eax,%edx
    9fd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9fd8:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9fde:	05 c0 11 01 00       	add    $0x111c0,%eax
    9fe3:	8b 00                	mov    (%eax),%eax
    9fe5:	39 c2                	cmp    %eax,%edx
    9fe7:	0f 85 93 00 00 00    	jne    a080 <III_dequantize_sample+0x1bc>
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
    9fed:	8b 45 dc             	mov    -0x24(%ebp),%eax
    9ff0:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    9ff6:	05 00 12 01 00       	add    $0x11200,%eax
    9ffb:	8b 50 0c             	mov    0xc(%eax),%edx
    9ffe:	89 d0                	mov    %edx,%eax
    a000:	01 c0                	add    %eax,%eax
    a002:	01 d0                	add    %edx,%eax
    a004:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb = 3;
    a007:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    a00e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a011:	8d 48 01             	lea    0x1(%eax),%ecx
    a014:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a017:	89 d0                	mov    %edx,%eax
    a019:	c1 e0 03             	shl    $0x3,%eax
    a01c:	01 d0                	add    %edx,%eax
    a01e:	c1 e0 02             	shl    $0x2,%eax
    a021:	01 d0                	add    %edx,%eax
    a023:	01 c8                	add    %ecx,%eax
    a025:	83 c0 14             	add    $0x14,%eax
    a028:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    a02f:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a032:	89 d0                	mov    %edx,%eax
    a034:	c1 e0 03             	shl    $0x3,%eax
    a037:	01 d0                	add    %edx,%eax
    a039:	c1 e0 02             	shl    $0x2,%eax
    a03c:	01 d0                	add    %edx,%eax
    a03e:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a041:	01 d0                	add    %edx,%eax
    a043:	83 c0 14             	add    $0x14,%eax
    a046:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
						if (((sb*18)+ss) == sfBandIndex[sfreq].l[8])  {
							next_cb_boundary=sfBandIndex[sfreq].s[4]*3;
							cb = 3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    a04d:	29 c1                	sub    %eax,%ecx
    a04f:	89 c8                	mov    %ecx,%eax
    a051:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    a054:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a057:	89 d0                	mov    %edx,%eax
    a059:	c1 e0 03             	shl    $0x3,%eax
    a05c:	01 d0                	add    %edx,%eax
    a05e:	c1 e0 02             	shl    $0x2,%eax
    a061:	01 d0                	add    %edx,%eax
    a063:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a066:	01 d0                	add    %edx,%eax
    a068:	83 c0 14             	add    $0x14,%eax
    a06b:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    a072:	89 d0                	mov    %edx,%eax
    a074:	01 c0                	add    %eax,%eax
    a076:	01 d0                	add    %edx,%eax
    a078:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a07b:	e9 8e 01 00 00       	jmp    a20e <III_dequantize_sample+0x34a>
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
    a080:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a083:	89 d0                	mov    %edx,%eax
    a085:	c1 e0 03             	shl    $0x3,%eax
    a088:	01 d0                	add    %edx,%eax
    a08a:	01 c0                	add    %eax,%eax
    a08c:	89 c2                	mov    %eax,%edx
    a08e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a091:	01 c2                	add    %eax,%edx
    a093:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a096:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a09c:	05 c0 11 01 00       	add    $0x111c0,%eax
    a0a1:	8b 00                	mov    (%eax),%eax
    a0a3:	39 c2                	cmp    %eax,%edx
    a0a5:	7d 2a                	jge    a0d1 <III_dequantize_sample+0x20d>
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    a0a7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a0ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0ae:	8d 48 01             	lea    0x1(%eax),%ecx
    a0b1:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a0b4:	89 d0                	mov    %edx,%eax
    a0b6:	c1 e0 03             	shl    $0x3,%eax
    a0b9:	01 d0                	add    %edx,%eax
    a0bb:	c1 e0 02             	shl    $0x2,%eax
    a0be:	01 d0                	add    %edx,%eax
    a0c0:	01 c8                	add    %ecx,%eax
    a0c2:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    a0c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
    a0cc:	e9 3d 01 00 00       	jmp    a20e <III_dequantize_sample+0x34a>
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    a0d1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a0d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a0d8:	8d 48 01             	lea    0x1(%eax),%ecx
    a0db:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a0de:	89 d0                	mov    %edx,%eax
    a0e0:	c1 e0 03             	shl    $0x3,%eax
    a0e3:	01 d0                	add    %edx,%eax
    a0e5:	c1 e0 02             	shl    $0x2,%eax
    a0e8:	01 d0                	add    %edx,%eax
    a0ea:	01 c8                	add    %ecx,%eax
    a0ec:	83 c0 14             	add    $0x14,%eax
    a0ef:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    a0f6:	89 d0                	mov    %edx,%eax
    a0f8:	01 c0                	add    %eax,%eax
    a0fa:	01 d0                	add    %edx,%eax
    a0fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    a0ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a102:	8d 48 01             	lea    0x1(%eax),%ecx
    a105:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a108:	89 d0                	mov    %edx,%eax
    a10a:	c1 e0 03             	shl    $0x3,%eax
    a10d:	01 d0                	add    %edx,%eax
    a10f:	c1 e0 02             	shl    $0x2,%eax
    a112:	01 d0                	add    %edx,%eax
    a114:	01 c8                	add    %ecx,%eax
    a116:	83 c0 14             	add    $0x14,%eax
    a119:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
										sfBandIndex[sfreq].s[cb];
    a120:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a123:	89 d0                	mov    %edx,%eax
    a125:	c1 e0 03             	shl    $0x3,%eax
    a128:	01 d0                	add    %edx,%eax
    a12a:	c1 e0 02             	shl    $0x2,%eax
    a12d:	01 d0                	add    %edx,%eax
    a12f:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a132:	01 d0                	add    %edx,%eax
    a134:	83 c0 14             	add    $0x14,%eax
    a137:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
						}
						else if (((sb*18)+ss) < sfBandIndex[sfreq].l[8])
							next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
						else {
							next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
							cb_width = sfBandIndex[sfreq].s[cb+1] -
    a13e:	29 c1                	sub    %eax,%ecx
    a140:	89 c8                	mov    %ecx,%eax
    a142:	89 45 e0             	mov    %eax,-0x20(%ebp)
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
    a145:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a148:	89 d0                	mov    %edx,%eax
    a14a:	c1 e0 03             	shl    $0x3,%eax
    a14d:	01 d0                	add    %edx,%eax
    a14f:	c1 e0 02             	shl    $0x2,%eax
    a152:	01 d0                	add    %edx,%eax
    a154:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a157:	01 d0                	add    %edx,%eax
    a159:	83 c0 14             	add    $0x14,%eax
    a15c:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    a163:	89 d0                	mov    %edx,%eax
    a165:	01 c0                	add    %eax,%eax
    a167:	01 d0                	add    %edx,%eax
    a169:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    a16c:	e9 c4 00 00 00       	jmp    a235 <III_dequantize_sample+0x371>
										sfBandIndex[sfreq].s[cb];
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
    a171:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a175:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a178:	8d 48 01             	lea    0x1(%eax),%ecx
    a17b:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a17e:	89 d0                	mov    %edx,%eax
    a180:	c1 e0 03             	shl    $0x3,%eax
    a183:	01 d0                	add    %edx,%eax
    a185:	c1 e0 02             	shl    $0x2,%eax
    a188:	01 d0                	add    %edx,%eax
    a18a:	01 c8                	add    %ecx,%eax
    a18c:	83 c0 14             	add    $0x14,%eax
    a18f:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    a196:	89 d0                	mov    %edx,%eax
    a198:	01 c0                	add    %eax,%eax
    a19a:	01 d0                	add    %edx,%eax
    a19c:	89 45 e8             	mov    %eax,-0x18(%ebp)
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    a19f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a1a2:	8d 48 01             	lea    0x1(%eax),%ecx
    a1a5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a1a8:	89 d0                	mov    %edx,%eax
    a1aa:	c1 e0 03             	shl    $0x3,%eax
    a1ad:	01 d0                	add    %edx,%eax
    a1af:	c1 e0 02             	shl    $0x2,%eax
    a1b2:	01 d0                	add    %edx,%eax
    a1b4:	01 c8                	add    %ecx,%eax
    a1b6:	83 c0 14             	add    $0x14,%eax
    a1b9:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
									sfBandIndex[sfreq].s[cb];
    a1c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a1c3:	89 d0                	mov    %edx,%eax
    a1c5:	c1 e0 03             	shl    $0x3,%eax
    a1c8:	01 d0                	add    %edx,%eax
    a1ca:	c1 e0 02             	shl    $0x2,%eax
    a1cd:	01 d0                	add    %edx,%eax
    a1cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a1d2:	01 d0                	add    %edx,%eax
    a1d4:	83 c0 14             	add    $0x14,%eax
    a1d7:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
							cb_begin = sfBandIndex[sfreq].s[cb]*3;
						}
					}
					else {
						next_cb_boundary = sfBandIndex[sfreq].s[(++cb)+1]*3;
						cb_width = sfBandIndex[sfreq].s[cb+1] -
    a1de:	29 c1                	sub    %eax,%ecx
    a1e0:	89 c8                	mov    %ecx,%eax
    a1e2:	89 45 e0             	mov    %eax,-0x20(%ebp)
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
    a1e5:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a1e8:	89 d0                	mov    %edx,%eax
    a1ea:	c1 e0 03             	shl    $0x3,%eax
    a1ed:	01 d0                	add    %edx,%eax
    a1ef:	c1 e0 02             	shl    $0x2,%eax
    a1f2:	01 d0                	add    %edx,%eax
    a1f4:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a1f7:	01 d0                	add    %edx,%eax
    a1f9:	83 c0 14             	add    $0x14,%eax
    a1fc:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    a203:	89 d0                	mov    %edx,%eax
    a205:	01 c0                	add    %eax,%eax
    a207:	01 d0                	add    %edx,%eax
    a209:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
			if ( (sb*18)+ss == next_cb_boundary) { /* Adjust critical band boundary */
				if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
					if (gr_info->mixed_block_flag) {
    a20c:	eb 27                	jmp    a235 <III_dequantize_sample+0x371>
    a20e:	eb 25                	jmp    a235 <III_dequantize_sample+0x371>
									sfBandIndex[sfreq].s[cb];
						cb_begin = sfBandIndex[sfreq].s[cb]*3;
					}
				}
	            else /* long blocks */
		           next_cb_boundary = sfBandIndex[sfreq].l[(++cb)+1];
    a210:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a214:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a217:	8d 48 01             	lea    0x1(%eax),%ecx
    a21a:	8b 55 dc             	mov    -0x24(%ebp),%edx
    a21d:	89 d0                	mov    %edx,%eax
    a21f:	c1 e0 03             	shl    $0x3,%eax
    a222:	01 d0                	add    %edx,%eax
    a224:	c1 e0 02             	shl    $0x2,%eax
    a227:	01 d0                	add    %edx,%eax
    a229:	01 c8                	add    %ecx,%eax
    a22b:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    a232:	89 45 e8             	mov    %eax,-0x18(%ebp)
			}

			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));
    a235:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a238:	89 d0                	mov    %edx,%eax
    a23a:	c1 e0 03             	shl    $0x3,%eax
    a23d:	01 d0                	add    %edx,%eax
    a23f:	c1 e0 04             	shl    $0x4,%eax
    a242:	89 c2                	mov    %eax,%edx
    a244:	8b 45 0c             	mov    0xc(%ebp),%eax
    a247:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a24a:	8b 45 14             	mov    0x14(%ebp),%eax
    a24d:	8b 40 08             	mov    0x8(%eax),%eax
    a250:	ba 00 00 00 00       	mov    $0x0,%edx
    a255:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a258:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a25b:	df 6d c8             	fildll -0x38(%ebp)
    a25e:	dd 05 b0 f4 00 00    	fldl   0xf4b0
    a264:	de e9                	fsubrp %st,%st(1)
    a266:	dd 05 b8 f4 00 00    	fldl   0xf4b8
    a26c:	de c9                	fmulp  %st,%st(1)
    a26e:	dd 5c 24 08          	fstpl  0x8(%esp)
    a272:	dd 05 c0 f4 00 00    	fldl   0xf4c0
    a278:	dd 1c 24             	fstpl  (%esp)
    a27b:	e8 0c c1 ff ff       	call   638c <pow>
    a280:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a283:	dd 1c c3             	fstpl  (%ebx,%eax,8)

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    a286:	8b 45 14             	mov    0x14(%ebp),%eax
    a289:	8b 40 10             	mov    0x10(%eax),%eax
    a28c:	85 c0                	test   %eax,%eax
    a28e:	0f 84 86 01 00 00    	je     a41a <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    a294:	8b 45 14             	mov    0x14(%ebp),%eax
    a297:	8b 40 14             	mov    0x14(%eax),%eax
			/* Compute overall (global) scaling. */
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
    a29a:	83 f8 02             	cmp    $0x2,%eax
    a29d:	75 0a                	jne    a2a9 <III_dequantize_sample+0x3e5>
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    a29f:	8b 45 14             	mov    0x14(%ebp),%eax
    a2a2:	8b 40 18             	mov    0x18(%eax),%eax
    a2a5:	85 c0                	test   %eax,%eax
    a2a7:	74 27                	je     a2d0 <III_dequantize_sample+0x40c>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    a2a9:	8b 45 14             	mov    0x14(%ebp),%eax
    a2ac:	8b 40 14             	mov    0x14(%eax),%eax
			xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

			/* Do long/short dependent scaling operations. */

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
    a2af:	83 f8 02             	cmp    $0x2,%eax
    a2b2:	0f 85 62 01 00 00    	jne    a41a <III_dequantize_sample+0x556>
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {
    a2b8:	8b 45 14             	mov    0x14(%ebp),%eax
    a2bb:	8b 40 18             	mov    0x18(%eax),%eax
    a2be:	85 c0                	test   %eax,%eax
    a2c0:	0f 84 54 01 00 00    	je     a41a <III_dequantize_sample+0x556>
    a2c6:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    a2ca:	0f 8e 4a 01 00 00    	jle    a41a <III_dequantize_sample+0x556>

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    a2d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a2d3:	89 d0                	mov    %edx,%eax
    a2d5:	c1 e0 03             	shl    $0x3,%eax
    a2d8:	01 d0                	add    %edx,%eax
    a2da:	c1 e0 04             	shl    $0x4,%eax
    a2dd:	89 c2                	mov    %eax,%edx
    a2df:	8b 45 0c             	mov    0xc(%ebp),%eax
    a2e2:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a2e5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a2e8:	89 d0                	mov    %edx,%eax
    a2ea:	c1 e0 03             	shl    $0x3,%eax
    a2ed:	01 d0                	add    %edx,%eax
    a2ef:	c1 e0 04             	shl    $0x4,%eax
    a2f2:	89 c2                	mov    %eax,%edx
    a2f4:	8b 45 0c             	mov    0xc(%ebp),%eax
    a2f7:	01 c2                	add    %eax,%edx
    a2f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a2fc:	dd 04 c2             	fldl   (%edx,%eax,8)
    a2ff:	dd 5d c0             	fstpl  -0x40(%ebp)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
    a302:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a305:	89 d0                	mov    %edx,%eax
    a307:	c1 e0 03             	shl    $0x3,%eax
    a30a:	01 d0                	add    %edx,%eax
    a30c:	01 c0                	add    %eax,%eax
    a30e:	89 c2                	mov    %eax,%edx
    a310:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a313:	01 d0                	add    %edx,%eax
    a315:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    a318:	99                   	cltd   
    a319:	f7 7d e0             	idivl  -0x20(%ebp)
    a31c:	89 c2                	mov    %eax,%edx
    a31e:	8b 45 14             	mov    0x14(%ebp),%eax
    a321:	83 c2 08             	add    $0x8,%edx
    a324:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax

			if (gr_info->window_switching_flag && (
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
    a328:	ba 00 00 00 00       	mov    $0x0,%edx
    a32d:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a330:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a333:	df 6d c8             	fildll -0x38(%ebp)
    a336:	dd 05 c8 f4 00 00    	fldl   0xf4c8
    a33c:	de c9                	fmulp  %st,%st(1)
    a33e:	dd 5c 24 08          	fstpl  0x8(%esp)
    a342:	dd 05 c0 f4 00 00    	fldl   0xf4c0
    a348:	dd 1c 24             	fstpl  (%esp)
    a34b:	e8 3c c0 ff ff       	call   638c <pow>
    a350:	dc 4d c0             	fmull  -0x40(%ebp)
    a353:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a356:	dd 1c c3             	fstpl  (%ebx,%eax,8)
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    a359:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a35c:	89 d0                	mov    %edx,%eax
    a35e:	c1 e0 03             	shl    $0x3,%eax
    a361:	01 d0                	add    %edx,%eax
    a363:	c1 e0 04             	shl    $0x4,%eax
    a366:	89 c2                	mov    %eax,%edx
    a368:	8b 45 0c             	mov    0xc(%ebp),%eax
    a36b:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a36e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a371:	89 d0                	mov    %edx,%eax
    a373:	c1 e0 03             	shl    $0x3,%eax
    a376:	01 d0                	add    %edx,%eax
    a378:	c1 e0 04             	shl    $0x4,%eax
    a37b:	89 c2                	mov    %eax,%edx
    a37d:	8b 45 0c             	mov    0xc(%ebp),%eax
    a380:	01 c2                	add    %eax,%edx
    a382:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a385:	dd 04 c2             	fldl   (%edx,%eax,8)
    a388:	dd 5d c0             	fstpl  -0x40(%ebp)
    a38b:	8b 45 14             	mov    0x14(%ebp),%eax
    a38e:	8b 40 40             	mov    0x40(%eax),%eax
    a391:	ba 00 00 00 00       	mov    $0x0,%edx
    a396:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a399:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a39c:	df 6d c8             	fildll -0x38(%ebp)
    a39f:	d9 e8                	fld1   
    a3a1:	de c1                	faddp  %st,%st(1)
    a3a3:	dd 05 d0 f4 00 00    	fldl   0xf4d0
    a3a9:	de c9                	fmulp  %st,%st(1)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
    a3ab:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a3ae:	89 d0                	mov    %edx,%eax
    a3b0:	c1 e0 03             	shl    $0x3,%eax
    a3b3:	01 d0                	add    %edx,%eax
    a3b5:	01 c0                	add    %eax,%eax
    a3b7:	89 c2                	mov    %eax,%edx
    a3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a3bc:	01 d0                	add    %edx,%eax
    a3be:	2b 45 e4             	sub    -0x1c(%ebp),%eax
    a3c1:	99                   	cltd   
    a3c2:	f7 7d e0             	idivl  -0x20(%ebp)
    a3c5:	89 c2                	mov    %eax,%edx
    a3c7:	8b 5d 10             	mov    0x10(%ebp),%ebx
    a3ca:	8b 4d 18             	mov    0x18(%ebp),%ecx
    a3cd:	89 d0                	mov    %edx,%eax
    a3cf:	01 c0                	add    %eax,%eax
    a3d1:	01 d0                	add    %edx,%eax
    a3d3:	c1 e0 02             	shl    $0x2,%eax
    a3d6:	01 d0                	add    %edx,%eax
    a3d8:	89 ca                	mov    %ecx,%edx
    a3da:	01 d2                	add    %edx,%edx
    a3dc:	89 d1                	mov    %edx,%ecx
    a3de:	c1 e1 05             	shl    $0x5,%ecx
    a3e1:	29 d1                	sub    %edx,%ecx
    a3e3:	8d 14 08             	lea    (%eax,%ecx,1),%edx
    a3e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a3e9:	01 d0                	add    %edx,%eax
    a3eb:	83 c0 14             	add    $0x14,%eax
    a3ee:	8b 44 83 0c          	mov    0xc(%ebx,%eax,4),%eax
				((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
				((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) )) {

				xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
    a3f2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a3f5:	db 45 d4             	fildl  -0x2c(%ebp)
    a3f8:	de c9                	fmulp  %st,%st(1)
    a3fa:	dd 5c 24 08          	fstpl  0x8(%esp)
    a3fe:	dd 05 c0 f4 00 00    	fldl   0xf4c0
    a404:	dd 1c 24             	fstpl  (%esp)
    a407:	e8 80 bf ff ff       	call   638c <pow>
    a40c:	dc 4d c0             	fmull  -0x40(%ebp)
    a40f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a412:	dd 1c c6             	fstpl  (%esi,%eax,8)
    a415:	e9 ab 00 00 00       	jmp    a4c5 <III_dequantize_sample+0x601>
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a41a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a41d:	89 d0                	mov    %edx,%eax
    a41f:	c1 e0 03             	shl    $0x3,%eax
    a422:	01 d0                	add    %edx,%eax
    a424:	c1 e0 04             	shl    $0x4,%eax
    a427:	89 c2                	mov    %eax,%edx
    a429:	8b 45 0c             	mov    0xc(%ebp),%eax
    a42c:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a42f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a432:	89 d0                	mov    %edx,%eax
    a434:	c1 e0 03             	shl    $0x3,%eax
    a437:	01 d0                	add    %edx,%eax
    a439:	c1 e0 04             	shl    $0x4,%eax
    a43c:	89 c2                	mov    %eax,%edx
    a43e:	8b 45 0c             	mov    0xc(%ebp),%eax
    a441:	01 c2                	add    %eax,%edx
    a443:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a446:	dd 04 c2             	fldl   (%edx,%eax,8)
    a449:	dd 5d c0             	fstpl  -0x40(%ebp)
    a44c:	8b 45 14             	mov    0x14(%ebp),%eax
    a44f:	8b 40 40             	mov    0x40(%eax),%eax
    a452:	ba 00 00 00 00       	mov    $0x0,%edx
    a457:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a45a:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a45d:	df 6d c8             	fildll -0x38(%ebp)
    a460:	d9 e8                	fld1   
    a462:	de c1                	faddp  %st,%st(1)
    a464:	dd 05 d0 f4 00 00    	fldl   0xf4d0
    a46a:	de c9                	fmulp  %st,%st(1)
								* ((*scalefac)[ch].l[cb]
    a46c:	8b 4d 10             	mov    0x10(%ebp),%ecx
    a46f:	8b 45 18             	mov    0x18(%ebp),%eax
    a472:	01 c0                	add    %eax,%eax
    a474:	89 c2                	mov    %eax,%edx
    a476:	c1 e2 05             	shl    $0x5,%edx
    a479:	29 c2                	sub    %eax,%edx
    a47b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a47e:	01 d0                	add    %edx,%eax
    a480:	8b 04 81             	mov    (%ecx,%eax,4),%eax
								+ gr_info->preflag * pretab[cb]));
    a483:	89 c2                	mov    %eax,%edx
    a485:	8b 45 14             	mov    0x14(%ebp),%eax
    a488:	8b 48 3c             	mov    0x3c(%eax),%ecx
    a48b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a48e:	8b 04 85 60 13 01 00 	mov    0x11360(,%eax,4),%eax
    a495:	0f af c1             	imul   %ecx,%eax
    a498:	01 d0                	add    %edx,%eax
						gr_info->subblock_gain[(((sb*18)+ss) - cb_begin)/cb_width]);
				xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0+gr_info->scalefac_scale)
						* (*scalefac)[ch].s[(((sb*18)+ss) - cb_begin)/cb_width][cb]);
			}
			else {   /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
				xr[sb][ss] *= pow(2.0, -0.5 * (1.0+gr_info->scalefac_scale)
    a49a:	ba 00 00 00 00       	mov    $0x0,%edx
    a49f:	89 45 c8             	mov    %eax,-0x38(%ebp)
    a4a2:	89 55 cc             	mov    %edx,-0x34(%ebp)
    a4a5:	df 6d c8             	fildll -0x38(%ebp)
    a4a8:	de c9                	fmulp  %st,%st(1)
    a4aa:	dd 5c 24 08          	fstpl  0x8(%esp)
    a4ae:	dd 05 c0 f4 00 00    	fldl   0xf4c0
    a4b4:	dd 1c 24             	fstpl  (%esp)
    a4b7:	e8 d0 be ff ff       	call   638c <pow>
    a4bc:	dc 4d c0             	fmull  -0x40(%ebp)
    a4bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4c2:	dd 1c c3             	fstpl  (%ebx,%eax,8)
								+ gr_info->preflag * pretab[cb]));
			}

			/* Scale quantized value. */

			sign = (is[sb][ss]<0) ? 1 : 0;
    a4c5:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a4c8:	89 d0                	mov    %edx,%eax
    a4ca:	c1 e0 03             	shl    $0x3,%eax
    a4cd:	01 d0                	add    %edx,%eax
    a4cf:	c1 e0 03             	shl    $0x3,%eax
    a4d2:	89 c2                	mov    %eax,%edx
    a4d4:	8b 45 08             	mov    0x8(%ebp),%eax
    a4d7:	01 c2                	add    %eax,%edx
    a4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a4dc:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a4df:	c1 e8 1f             	shr    $0x1f,%eax
    a4e2:	0f b6 c0             	movzbl %al,%eax
    a4e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
    a4e8:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a4eb:	89 d0                	mov    %edx,%eax
    a4ed:	c1 e0 03             	shl    $0x3,%eax
    a4f0:	01 d0                	add    %edx,%eax
    a4f2:	c1 e0 04             	shl    $0x4,%eax
    a4f5:	89 c2                	mov    %eax,%edx
    a4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
    a4fa:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    a4fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a500:	89 d0                	mov    %edx,%eax
    a502:	c1 e0 03             	shl    $0x3,%eax
    a505:	01 d0                	add    %edx,%eax
    a507:	c1 e0 04             	shl    $0x4,%eax
    a50a:	89 c2                	mov    %eax,%edx
    a50c:	8b 45 0c             	mov    0xc(%ebp),%eax
    a50f:	01 c2                	add    %eax,%edx
    a511:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a514:	dd 04 c2             	fldl   (%edx,%eax,8)
    a517:	dd 5d c0             	fstpl  -0x40(%ebp)
    a51a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a51d:	89 d0                	mov    %edx,%eax
    a51f:	c1 e0 03             	shl    $0x3,%eax
    a522:	01 d0                	add    %edx,%eax
    a524:	c1 e0 03             	shl    $0x3,%eax
    a527:	89 c2                	mov    %eax,%edx
    a529:	8b 45 08             	mov    0x8(%ebp),%eax
    a52c:	01 c2                	add    %eax,%edx
    a52e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a531:	8b 04 82             	mov    (%edx,%eax,4),%eax
    a534:	89 04 24             	mov    %eax,(%esp)
    a537:	e8 47 bd ff ff       	call   6283 <abs>
    a53c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    a53f:	db 45 d4             	fildl  -0x2c(%ebp)
    a542:	dd 05 d8 f4 00 00    	fldl   0xf4d8
    a548:	dd 5c 24 08          	fstpl  0x8(%esp)
    a54c:	dd 1c 24             	fstpl  (%esp)
    a54f:	e8 38 be ff ff       	call   638c <pow>
    a554:	dc 4d c0             	fmull  -0x40(%ebp)
    a557:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a55a:	dd 1c c3             	fstpl  (%ebx,%eax,8)
			if (sign) xr[sb][ss] = -xr[sb][ss];
    a55d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    a561:	74 37                	je     a59a <III_dequantize_sample+0x6d6>
    a563:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a566:	89 d0                	mov    %edx,%eax
    a568:	c1 e0 03             	shl    $0x3,%eax
    a56b:	01 d0                	add    %edx,%eax
    a56d:	c1 e0 04             	shl    $0x4,%eax
    a570:	89 c2                	mov    %eax,%edx
    a572:	8b 45 0c             	mov    0xc(%ebp),%eax
    a575:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a578:	8b 55 f0             	mov    -0x10(%ebp),%edx
    a57b:	89 d0                	mov    %edx,%eax
    a57d:	c1 e0 03             	shl    $0x3,%eax
    a580:	01 d0                	add    %edx,%eax
    a582:	c1 e0 04             	shl    $0x4,%eax
    a585:	89 c2                	mov    %eax,%edx
    a587:	8b 45 0c             	mov    0xc(%ebp),%eax
    a58a:	01 c2                	add    %eax,%edx
    a58c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a58f:	dd 04 c2             	fldl   (%edx,%eax,8)
    a592:	d9 e0                	fchs   
    a594:	8b 45 f4             	mov    -0xc(%ebp),%eax
    a597:	dd 1c c1             	fstpl  (%ecx,%eax,8)
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
		for (ss=0 ; ss < SSLIMIT ; ss++) {
    a59a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    a59e:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    a5a2:	0f 8e d3 f9 ff ff    	jle    9f7b <III_dequantize_sample+0xb7>
		}
	else
		next_cb_boundary=sfBandIndex[sfreq].l[1];  /* LONG blocks: 0,1,3 */

	/* apply formula per block type */
	for (sb=0 ; sb < SBLIMIT ; sb++) {
    a5a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    a5ac:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    a5b0:	0f 8e b9 f9 ff ff    	jle    9f6f <III_dequantize_sample+0xab>
			sign = (is[sb][ss]<0) ? 1 : 0;
			xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0/3.0) );
			if (sign) xr[sb][ss] = -xr[sb][ss];
		}
	}
}
    a5b6:	83 c4 50             	add    $0x50,%esp
    a5b9:	5b                   	pop    %ebx
    a5ba:	5e                   	pop    %esi
    a5bb:	5d                   	pop    %ebp
    a5bc:	c3                   	ret    

0000a5bd <III_reorder>:


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    a5bd:	55                   	push   %ebp
    a5be:	89 e5                	mov    %esp,%ebp
    a5c0:	57                   	push   %edi
    a5c1:	56                   	push   %esi
    a5c2:	53                   	push   %ebx
    a5c3:	83 ec 34             	sub    $0x34,%esp
   int sfreq=fr_ps->header->sampling_frequency;
    a5c6:	8b 45 14             	mov    0x14(%ebp),%eax
    a5c9:	8b 00                	mov    (%eax),%eax
    a5cb:	8b 40 10             	mov    0x10(%eax),%eax
    a5ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a5d1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a5d8:	eb 33                	jmp    a60d <III_reorder+0x50>
      for(ss=0;ss<SSLIMIT;ss++)
    a5da:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a5e1:	eb 20                	jmp    a603 <III_reorder+0x46>
         ro[sb][ss] = 0;
    a5e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a5e6:	89 d0                	mov    %edx,%eax
    a5e8:	c1 e0 03             	shl    $0x3,%eax
    a5eb:	01 d0                	add    %edx,%eax
    a5ed:	c1 e0 04             	shl    $0x4,%eax
    a5f0:	89 c2                	mov    %eax,%edx
    a5f2:	8b 45 0c             	mov    0xc(%ebp),%eax
    a5f5:	01 c2                	add    %eax,%edx
    a5f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a5fa:	d9 ee                	fldz   
    a5fc:	dd 1c c2             	fstpl  (%edx,%eax,8)
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
    a5ff:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a603:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a607:	7e da                	jle    a5e3 <III_reorder+0x26>
{
   int sfreq=fr_ps->header->sampling_frequency;
   int sfb, sfb_start, sfb_lines;
   int sb, ss, window, freq, src_line, des_line;

   for(sb=0;sb<SBLIMIT;sb++)
    a609:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a60d:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    a611:	7e c7                	jle    a5da <III_reorder+0x1d>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
    a613:	8b 45 10             	mov    0x10(%ebp),%eax
    a616:	8b 40 10             	mov    0x10(%eax),%eax
    a619:	85 c0                	test   %eax,%eax
    a61b:	0f 84 af 03 00 00    	je     a9d0 <III_reorder+0x413>
    a621:	8b 45 10             	mov    0x10(%ebp),%eax
    a624:	8b 40 14             	mov    0x14(%eax),%eax
    a627:	83 f8 02             	cmp    $0x2,%eax
    a62a:	0f 85 a0 03 00 00    	jne    a9d0 <III_reorder+0x413>
      if (gr_info->mixed_block_flag) {
    a630:	8b 45 10             	mov    0x10(%ebp),%eax
    a633:	8b 40 18             	mov    0x18(%eax),%eax
    a636:	85 c0                	test   %eax,%eax
    a638:	0f 84 00 02 00 00    	je     a83e <III_reorder+0x281>
         for (sb=0 ; sb < 2 ; sb++)
    a63e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a645:	eb 4c                	jmp    a693 <III_reorder+0xd6>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a647:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a64e:	eb 39                	jmp    a689 <III_reorder+0xcc>
               ro[sb][ss] = xr[sb][ss];
    a650:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a653:	89 d0                	mov    %edx,%eax
    a655:	c1 e0 03             	shl    $0x3,%eax
    a658:	01 d0                	add    %edx,%eax
    a65a:	c1 e0 04             	shl    $0x4,%eax
    a65d:	89 c2                	mov    %eax,%edx
    a65f:	8b 45 0c             	mov    0xc(%ebp),%eax
    a662:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a665:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a668:	89 d0                	mov    %edx,%eax
    a66a:	c1 e0 03             	shl    $0x3,%eax
    a66d:	01 d0                	add    %edx,%eax
    a66f:	c1 e0 04             	shl    $0x4,%eax
    a672:	89 c2                	mov    %eax,%edx
    a674:	8b 45 08             	mov    0x8(%ebp),%eax
    a677:	01 c2                	add    %eax,%edx
    a679:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a67c:	dd 04 c2             	fldl   (%edx,%eax,8)
    a67f:	8b 45 dc             	mov    -0x24(%ebp),%eax
    a682:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
    a685:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    a689:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    a68d:	7e c1                	jle    a650 <III_reorder+0x93>
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
    a68f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    a693:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    a697:	7e ae                	jle    a647 <III_reorder+0x8a>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a699:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
    a6a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a6a3:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a6a9:	05 fc 11 01 00       	add    $0x111fc,%eax
    a6ae:	8b 40 0c             	mov    0xc(%eax),%eax
    a6b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
    a6b4:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a6b7:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a6bd:	05 00 12 01 00       	add    $0x11200,%eax
    a6c2:	8b 40 0c             	mov    0xc(%eax),%eax
    a6c5:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a6c8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a6cb:	e9 5f 01 00 00       	jmp    a82f <III_reorder+0x272>
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a6d0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a6d7:	e9 fd 00 00 00       	jmp    a7d9 <III_reorder+0x21c>
                  for(freq=0;freq<sfb_lines;freq++) {
    a6dc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a6e3:	e9 e1 00 00 00       	jmp    a7c9 <III_reorder+0x20c>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a6e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a6eb:	89 d0                	mov    %edx,%eax
    a6ed:	01 c0                	add    %eax,%eax
    a6ef:	01 c2                	add    %eax,%edx
    a6f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a6f4:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a6f8:	01 c2                	add    %eax,%edx
    a6fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a6fd:	01 d0                	add    %edx,%eax
    a6ff:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a702:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a705:	89 d0                	mov    %edx,%eax
    a707:	01 c0                	add    %eax,%eax
    a709:	01 c2                	add    %eax,%edx
    a70b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a70e:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a711:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a714:	89 d0                	mov    %edx,%eax
    a716:	01 c0                	add    %eax,%eax
    a718:	01 d0                	add    %edx,%eax
    a71a:	01 c8                	add    %ecx,%eax
    a71c:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a71f:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a722:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a727:	89 c8                	mov    %ecx,%eax
    a729:	f7 ea                	imul   %edx
    a72b:	c1 fa 02             	sar    $0x2,%edx
    a72e:	89 c8                	mov    %ecx,%eax
    a730:	c1 f8 1f             	sar    $0x1f,%eax
    a733:	29 c2                	sub    %eax,%edx
    a735:	89 d0                	mov    %edx,%eax
    a737:	89 c2                	mov    %eax,%edx
    a739:	89 d0                	mov    %edx,%eax
    a73b:	c1 e0 03             	shl    $0x3,%eax
    a73e:	01 d0                	add    %edx,%eax
    a740:	c1 e0 04             	shl    $0x4,%eax
    a743:	89 c2                	mov    %eax,%edx
    a745:	8b 45 0c             	mov    0xc(%ebp),%eax
    a748:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a74b:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a74e:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a753:	89 d8                	mov    %ebx,%eax
    a755:	f7 ea                	imul   %edx
    a757:	c1 fa 02             	sar    $0x2,%edx
    a75a:	89 d8                	mov    %ebx,%eax
    a75c:	c1 f8 1f             	sar    $0x1f,%eax
    a75f:	89 d1                	mov    %edx,%ecx
    a761:	29 c1                	sub    %eax,%ecx
    a763:	89 c8                	mov    %ecx,%eax
    a765:	c1 e0 03             	shl    $0x3,%eax
    a768:	01 c8                	add    %ecx,%eax
    a76a:	01 c0                	add    %eax,%eax
    a76c:	29 c3                	sub    %eax,%ebx
    a76e:	89 d9                	mov    %ebx,%ecx
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a770:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a773:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a778:	89 d8                	mov    %ebx,%eax
    a77a:	f7 ea                	imul   %edx
    a77c:	c1 fa 02             	sar    $0x2,%edx
    a77f:	89 d8                	mov    %ebx,%eax
    a781:	c1 f8 1f             	sar    $0x1f,%eax
    a784:	29 c2                	sub    %eax,%edx
    a786:	89 d0                	mov    %edx,%eax
    a788:	89 c2                	mov    %eax,%edx
    a78a:	89 d0                	mov    %edx,%eax
    a78c:	c1 e0 03             	shl    $0x3,%eax
    a78f:	01 d0                	add    %edx,%eax
    a791:	c1 e0 04             	shl    $0x4,%eax
    a794:	89 c2                	mov    %eax,%edx
    a796:	8b 45 08             	mov    0x8(%ebp),%eax
    a799:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a79c:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a79f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a7a4:	89 d8                	mov    %ebx,%eax
    a7a6:	f7 ea                	imul   %edx
    a7a8:	c1 fa 02             	sar    $0x2,%edx
    a7ab:	89 d8                	mov    %ebx,%eax
    a7ad:	c1 f8 1f             	sar    $0x1f,%eax
    a7b0:	29 c2                	sub    %eax,%edx
    a7b2:	89 d0                	mov    %edx,%eax
    a7b4:	c1 e0 03             	shl    $0x3,%eax
    a7b7:	01 d0                	add    %edx,%eax
    a7b9:	01 c0                	add    %eax,%eax
    a7bb:	29 c3                	sub    %eax,%ebx
    a7bd:	89 da                	mov    %ebx,%edx
    a7bf:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a7c2:	dd 1c ce             	fstpl  (%esi,%ecx,8)
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a7c5:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a7c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a7cc:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a7cf:	0f 8c 13 ff ff ff    	jl     a6e8 <III_reorder+0x12b>
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a7d5:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a7d9:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a7dd:	0f 8e f9 fe ff ff    	jle    a6dc <III_reorder+0x11f>
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
            sfb_lines=sfBandIndex[sfreq].s[4] - sfb_start;
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a7e3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a7e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a7ea:	89 d0                	mov    %edx,%eax
    a7ec:	c1 e0 03             	shl    $0x3,%eax
    a7ef:	01 d0                	add    %edx,%eax
    a7f1:	c1 e0 02             	shl    $0x2,%eax
    a7f4:	01 d0                	add    %edx,%eax
    a7f6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a7f9:	01 d0                	add    %edx,%eax
    a7fb:	83 c0 14             	add    $0x14,%eax
    a7fe:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    a805:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a808:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a80b:	8d 48 01             	lea    0x1(%eax),%ecx
    a80e:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a811:	89 d0                	mov    %edx,%eax
    a813:	c1 e0 03             	shl    $0x3,%eax
    a816:	01 d0                	add    %edx,%eax
    a818:	c1 e0 02             	shl    $0x2,%eax
    a81b:	01 d0                	add    %edx,%eax
    a81d:	01 c8                	add    %ecx,%eax
    a81f:	83 c0 14             	add    $0x14,%eax
    a822:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    a829:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a82c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if (gr_info->mixed_block_flag) {
         for (sb=0 ; sb < 2 ; sb++)
            for (ss=0 ; ss < SSLIMIT ; ss++) {
               ro[sb][ss] = xr[sb][ss];
            }
         for(sfb=3,sfb_start=sfBandIndex[sfreq].s[3],
    a82f:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a833:	0f 8e 97 fe ff ff    	jle    a6d0 <III_reorder+0x113>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a839:	e9 ed 01 00 00       	jmp    aa2b <III_reorder+0x46e>
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a83e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    a845:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    a84c:	8b 45 d0             	mov    -0x30(%ebp),%eax
    a84f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    a855:	05 f4 11 01 00       	add    $0x111f4,%eax
    a85a:	8b 40 0c             	mov    0xc(%eax),%eax
    a85d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a860:	e9 5f 01 00 00       	jmp    a9c4 <III_reorder+0x407>
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a865:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
    a86c:	e9 fd 00 00 00       	jmp    a96e <III_reorder+0x3b1>
                  for(freq=0;freq<sfb_lines;freq++) {
    a871:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    a878:	e9 e1 00 00 00       	jmp    a95e <III_reorder+0x3a1>
                     src_line = sfb_start*3 + window*sfb_lines + freq;
    a87d:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a880:	89 d0                	mov    %edx,%eax
    a882:	01 c0                	add    %eax,%eax
    a884:	01 c2                	add    %eax,%edx
    a886:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a889:	0f af 45 e4          	imul   -0x1c(%ebp),%eax
    a88d:	01 c2                	add    %eax,%edx
    a88f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a892:	01 d0                	add    %edx,%eax
    a894:	89 45 cc             	mov    %eax,-0x34(%ebp)
                     des_line = (sfb_start*3) + window + (freq*3);
    a897:	8b 55 e8             	mov    -0x18(%ebp),%edx
    a89a:	89 d0                	mov    %edx,%eax
    a89c:	01 c0                	add    %eax,%eax
    a89e:	01 c2                	add    %eax,%edx
    a8a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
    a8a3:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a8a6:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    a8a9:	89 d0                	mov    %edx,%eax
    a8ab:	01 c0                	add    %eax,%eax
    a8ad:	01 d0                	add    %edx,%eax
    a8af:	01 c8                	add    %ecx,%eax
    a8b1:	89 45 c8             	mov    %eax,-0x38(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a8b4:	8b 4d c8             	mov    -0x38(%ebp),%ecx
    a8b7:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a8bc:	89 c8                	mov    %ecx,%eax
    a8be:	f7 ea                	imul   %edx
    a8c0:	c1 fa 02             	sar    $0x2,%edx
    a8c3:	89 c8                	mov    %ecx,%eax
    a8c5:	c1 f8 1f             	sar    $0x1f,%eax
    a8c8:	29 c2                	sub    %eax,%edx
    a8ca:	89 d0                	mov    %edx,%eax
    a8cc:	89 c2                	mov    %eax,%edx
    a8ce:	89 d0                	mov    %edx,%eax
    a8d0:	c1 e0 03             	shl    $0x3,%eax
    a8d3:	01 d0                	add    %edx,%eax
    a8d5:	c1 e0 04             	shl    $0x4,%eax
    a8d8:	89 c2                	mov    %eax,%edx
    a8da:	8b 45 0c             	mov    0xc(%ebp),%eax
    a8dd:	8d 34 02             	lea    (%edx,%eax,1),%esi
    a8e0:	8b 5d c8             	mov    -0x38(%ebp),%ebx
    a8e3:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a8e8:	89 d8                	mov    %ebx,%eax
    a8ea:	f7 ea                	imul   %edx
    a8ec:	c1 fa 02             	sar    $0x2,%edx
    a8ef:	89 d8                	mov    %ebx,%eax
    a8f1:	c1 f8 1f             	sar    $0x1f,%eax
    a8f4:	89 d1                	mov    %edx,%ecx
    a8f6:	29 c1                	sub    %eax,%ecx
    a8f8:	89 c8                	mov    %ecx,%eax
    a8fa:	c1 e0 03             	shl    $0x3,%eax
    a8fd:	01 c8                	add    %ecx,%eax
    a8ff:	01 c0                	add    %eax,%eax
    a901:	29 c3                	sub    %eax,%ebx
    a903:	89 d9                	mov    %ebx,%ecx
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
    a905:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a908:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a90d:	89 d8                	mov    %ebx,%eax
    a90f:	f7 ea                	imul   %edx
    a911:	c1 fa 02             	sar    $0x2,%edx
    a914:	89 d8                	mov    %ebx,%eax
    a916:	c1 f8 1f             	sar    $0x1f,%eax
    a919:	29 c2                	sub    %eax,%edx
    a91b:	89 d0                	mov    %edx,%eax
    a91d:	89 c2                	mov    %eax,%edx
    a91f:	89 d0                	mov    %edx,%eax
    a921:	c1 e0 03             	shl    $0x3,%eax
    a924:	01 d0                	add    %edx,%eax
    a926:	c1 e0 04             	shl    $0x4,%eax
    a929:	89 c2                	mov    %eax,%edx
    a92b:	8b 45 08             	mov    0x8(%ebp),%eax
    a92e:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    a931:	8b 5d cc             	mov    -0x34(%ebp),%ebx
    a934:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    a939:	89 d8                	mov    %ebx,%eax
    a93b:	f7 ea                	imul   %edx
    a93d:	c1 fa 02             	sar    $0x2,%edx
    a940:	89 d8                	mov    %ebx,%eax
    a942:	c1 f8 1f             	sar    $0x1f,%eax
    a945:	29 c2                	sub    %eax,%edx
    a947:	89 d0                	mov    %edx,%eax
    a949:	c1 e0 03             	shl    $0x3,%eax
    a94c:	01 d0                	add    %edx,%eax
    a94e:	01 c0                	add    %eax,%eax
    a950:	29 c3                	sub    %eax,%ebx
    a952:	89 da                	mov    %ebx,%edx
    a954:	dd 04 d7             	fldl   (%edi,%edx,8)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
                     src_line = sfb_start*3 + window*sfb_lines + freq;
                     des_line = (sfb_start*3) + window + (freq*3);
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
    a957:	dd 1c ce             	fstpl  (%esi,%ecx,8)
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
                  for(freq=0;freq<sfb_lines;freq++) {
    a95a:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
    a95e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    a961:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
    a964:	0f 8c 13 ff ff ff    	jl     a87d <III_reorder+0x2c0>
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
               for(window=0; window<3; window++)
    a96a:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
    a96e:	83 7d d8 02          	cmpl   $0x2,-0x28(%ebp)
    a972:	0f 8e f9 fe ff ff    	jle    a871 <III_reorder+0x2b4>
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
            sfb < 13; sfb++,sfb_start=sfBandIndex[sfreq].s[sfb],
    a978:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    a97c:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a97f:	89 d0                	mov    %edx,%eax
    a981:	c1 e0 03             	shl    $0x3,%eax
    a984:	01 d0                	add    %edx,%eax
    a986:	c1 e0 02             	shl    $0x2,%eax
    a989:	01 d0                	add    %edx,%eax
    a98b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    a98e:	01 d0                	add    %edx,%eax
    a990:	83 c0 14             	add    $0x14,%eax
    a993:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    a99a:	89 45 e8             	mov    %eax,-0x18(%ebp)
            (sfb_lines=sfBandIndex[sfreq].s[sfb+1] - sfb_start))
    a99d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    a9a0:	8d 48 01             	lea    0x1(%eax),%ecx
    a9a3:	8b 55 d0             	mov    -0x30(%ebp),%edx
    a9a6:	89 d0                	mov    %edx,%eax
    a9a8:	c1 e0 03             	shl    $0x3,%eax
    a9ab:	01 d0                	add    %edx,%eax
    a9ad:	c1 e0 02             	shl    $0x2,%eax
    a9b0:	01 d0                	add    %edx,%eax
    a9b2:	01 c8                	add    %ecx,%eax
    a9b4:	83 c0 14             	add    $0x14,%eax
    a9b7:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    a9be:	2b 45 e8             	sub    -0x18(%ebp),%eax
    a9c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                     ro[des_line/SSLIMIT][des_line%SSLIMIT] =
                                    xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
      else {
         for(sfb=0,sfb_start=0,sfb_lines=sfBandIndex[sfreq].s[1];
    a9c4:	83 7d ec 0c          	cmpl   $0xc,-0x14(%ebp)
    a9c8:	0f 8e 97 fe ff ff    	jle    a865 <III_reorder+0x2a8>
   for(sb=0;sb<SBLIMIT;sb++)
      for(ss=0;ss<SSLIMIT;ss++)
         ro[sb][ss] = 0;

   if (gr_info->window_switching_flag && (gr_info->block_type == 2)) {
      if (gr_info->mixed_block_flag) {
    a9ce:	eb 5b                	jmp    aa2b <III_reorder+0x46e>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    a9d0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    a9d7:	eb 4c                	jmp    aa25 <III_reorder+0x468>
         for (ss=0 ; ss < SSLIMIT ; ss++)
    a9d9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    a9e0:	eb 39                	jmp    aa1b <III_reorder+0x45e>
            ro[sb][ss] = xr[sb][ss];
    a9e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a9e5:	89 d0                	mov    %edx,%eax
    a9e7:	c1 e0 03             	shl    $0x3,%eax
    a9ea:	01 d0                	add    %edx,%eax
    a9ec:	c1 e0 04             	shl    $0x4,%eax
    a9ef:	89 c2                	mov    %eax,%edx
    a9f1:	8b 45 0c             	mov    0xc(%ebp),%eax
    a9f4:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    a9f7:	8b 55 e0             	mov    -0x20(%ebp),%edx
    a9fa:	89 d0                	mov    %edx,%eax
    a9fc:	c1 e0 03             	shl    $0x3,%eax
    a9ff:	01 d0                	add    %edx,%eax
    aa01:	c1 e0 04             	shl    $0x4,%eax
    aa04:	89 c2                	mov    %eax,%edx
    aa06:	8b 45 08             	mov    0x8(%ebp),%eax
    aa09:	01 c2                	add    %eax,%edx
    aa0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aa0e:	dd 04 c2             	fldl   (%edx,%eax,8)
    aa11:	8b 45 dc             	mov    -0x24(%ebp),%eax
    aa14:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
         for (ss=0 ; ss < SSLIMIT ; ss++)
    aa17:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
    aa1b:	83 7d dc 11          	cmpl   $0x11,-0x24(%ebp)
    aa1f:	7e c1                	jle    a9e2 <III_reorder+0x425>
                       xr[src_line/SSLIMIT][src_line%SSLIMIT];
               }
      }
   }
   else {   /*long blocks */
      for (sb=0 ; sb < SBLIMIT ; sb++)
    aa21:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    aa25:	83 7d e0 1f          	cmpl   $0x1f,-0x20(%ebp)
    aa29:	7e ae                	jle    a9d9 <III_reorder+0x41c>
         for (ss=0 ; ss < SSLIMIT ; ss++)
            ro[sb][ss] = xr[sb][ss];
   }
}
    aa2b:	83 c4 34             	add    $0x34,%esp
    aa2e:	5b                   	pop    %ebx
    aa2f:	5e                   	pop    %esi
    aa30:	5f                   	pop    %edi
    aa31:	5d                   	pop    %ebp
    aa32:	c3                   	ret    

0000aa33 <III_stereo>:


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    aa33:	55                   	push   %ebp
    aa34:	89 e5                	mov    %esp,%ebp
    aa36:	56                   	push   %esi
    aa37:	53                   	push   %ebx
    aa38:	81 ec 50 1b 00 00    	sub    $0x1b50,%esp
   int sfreq = fr_ps->header->sampling_frequency;
    aa3e:	8b 45 18             	mov    0x18(%ebp),%eax
    aa41:	8b 00                	mov    (%eax),%eax
    aa43:	8b 40 10             	mov    0x10(%eax),%eax
    aa46:	89 45 c8             	mov    %eax,-0x38(%ebp)
   int stereo = fr_ps->stereo;
    aa49:	8b 45 18             	mov    0x18(%ebp),%eax
    aa4c:	8b 40 08             	mov    0x8(%eax),%eax
    aa4f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    aa52:	8b 45 18             	mov    0x18(%ebp),%eax
    aa55:	8b 00                	mov    (%eax),%eax
    aa57:	8b 40 1c             	mov    0x1c(%eax),%eax
    aa5a:	83 f8 01             	cmp    $0x1,%eax
    aa5d:	75 16                	jne    aa75 <III_stereo+0x42>
                   (fr_ps->header->mode_ext & 0x2);
    aa5f:	8b 45 18             	mov    0x18(%ebp),%eax
    aa62:	8b 00                	mov    (%eax),%eax
    aa64:	8b 40 20             	mov    0x20(%eax),%eax
    aa67:	83 e0 02             	and    $0x2,%eax

void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    aa6a:	85 c0                	test   %eax,%eax
    aa6c:	74 07                	je     aa75 <III_stereo+0x42>
    aa6e:	b8 01 00 00 00       	mov    $0x1,%eax
    aa73:	eb 05                	jmp    aa7a <III_stereo+0x47>
    aa75:	b8 00 00 00 00       	mov    $0x0,%eax
    aa7a:	89 45 c0             	mov    %eax,-0x40(%ebp)
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    aa7d:	8b 45 18             	mov    0x18(%ebp),%eax
    aa80:	8b 00                	mov    (%eax),%eax
    aa82:	8b 40 1c             	mov    0x1c(%eax),%eax
    aa85:	83 f8 01             	cmp    $0x1,%eax
    aa88:	75 16                	jne    aaa0 <III_stereo+0x6d>
                  (fr_ps->header->mode_ext & 0x1);
    aa8a:	8b 45 18             	mov    0x18(%ebp),%eax
    aa8d:	8b 00                	mov    (%eax),%eax
    aa8f:	8b 40 20             	mov    0x20(%eax),%eax
    aa92:	83 e0 01             	and    $0x1,%eax
{
   int sfreq = fr_ps->header->sampling_frequency;
   int stereo = fr_ps->stereo;
   int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x2);
   int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
    aa95:	85 c0                	test   %eax,%eax
    aa97:	74 07                	je     aaa0 <III_stereo+0x6d>
    aa99:	b8 01 00 00 00       	mov    $0x1,%eax
    aa9e:	eb 05                	jmp    aaa5 <III_stereo+0x72>
    aaa0:	b8 00 00 00 00       	mov    $0x0,%eax
    aaa5:	89 45 bc             	mov    %eax,-0x44(%ebp)
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    aaa8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    aaaf:	eb 12                	jmp    aac3 <III_stereo+0x90>
      is_pos[i] = 7;
    aab1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aab4:	c7 84 85 bc f6 ff ff 	movl   $0x7,-0x944(%ebp,%eax,4)
    aabb:	07 00 00 00 
   int sfb;
   int i,j,sb,ss,ch,is_pos[576];
   double is_ratio[576];

   /* intialization */
   for ( i=0; i<576; i++ )
    aabf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    aac3:	81 7d f0 3f 02 00 00 	cmpl   $0x23f,-0x10(%ebp)
    aaca:	7e e5                	jle    aab1 <III_stereo+0x7e>
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
    aacc:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    aad0:	0f 85 18 0a 00 00    	jne    b4ee <III_stereo+0xabb>
    aad6:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    aada:	0f 84 0e 0a 00 00    	je     b4ee <III_stereo+0xabb>
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    aae0:	8b 45 14             	mov    0x14(%ebp),%eax
    aae3:	8b 40 10             	mov    0x10(%eax),%eax
    aae6:	85 c0                	test   %eax,%eax
    aae8:	0f 84 10 08 00 00    	je     b2fe <III_stereo+0x8cb>
    aaee:	8b 45 14             	mov    0x14(%ebp),%eax
    aaf1:	8b 40 14             	mov    0x14(%eax),%eax
    aaf4:	83 f8 02             	cmp    $0x2,%eax
    aaf7:	0f 85 01 08 00 00    	jne    b2fe <III_stereo+0x8cb>
      {  if( gr_info->mixed_block_flag )
    aafd:	8b 45 14             	mov    0x14(%ebp),%eax
    ab00:	8b 40 18             	mov    0x18(%eax),%eax
    ab03:	85 c0                	test   %eax,%eax
    ab05:	0f 84 d0 04 00 00    	je     afdb <III_stereo+0x5a8>
         {  int max_sfb = 0;
    ab0b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)

            for ( j=0; j<3; j++ )
    ab12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    ab19:	e9 1b 03 00 00       	jmp    ae39 <III_stereo+0x406>
            {  int sfbcnt;
               sfbcnt = 2;
    ab1e:	c7 45 d8 02 00 00 00 	movl   $0x2,-0x28(%ebp)
               for( sfb=12; sfb >=3; sfb-- )
    ab25:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    ab2c:	e9 0f 01 00 00       	jmp    ac40 <III_stereo+0x20d>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ab31:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ab34:	8d 48 01             	lea    0x1(%eax),%ecx
    ab37:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab3a:	89 d0                	mov    %edx,%eax
    ab3c:	c1 e0 03             	shl    $0x3,%eax
    ab3f:	01 d0                	add    %edx,%eax
    ab41:	c1 e0 02             	shl    $0x2,%eax
    ab44:	01 d0                	add    %edx,%eax
    ab46:	01 c8                	add    %ecx,%eax
    ab48:	83 c0 14             	add    $0x14,%eax
    ab4b:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
    ab52:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab55:	89 d0                	mov    %edx,%eax
    ab57:	c1 e0 03             	shl    $0x3,%eax
    ab5a:	01 d0                	add    %edx,%eax
    ab5c:	c1 e0 02             	shl    $0x2,%eax
    ab5f:	01 d0                	add    %edx,%eax
    ab61:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ab64:	01 d0                	add    %edx,%eax
    ab66:	83 c0 14             	add    $0x14,%eax
    ab69:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    ab70:	29 c1                	sub    %eax,%ecx
    ab72:	89 c8                	mov    %ecx,%eax
    ab74:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    ab77:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ab7a:	89 d0                	mov    %edx,%eax
    ab7c:	c1 e0 03             	shl    $0x3,%eax
    ab7f:	01 d0                	add    %edx,%eax
    ab81:	c1 e0 02             	shl    $0x2,%eax
    ab84:	01 d0                	add    %edx,%eax
    ab86:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ab89:	01 d0                	add    %edx,%eax
    ab8b:	83 c0 14             	add    $0x14,%eax
    ab8e:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    ab95:	89 d0                	mov    %edx,%eax
    ab97:	01 c0                	add    %eax,%eax
    ab99:	01 c2                	add    %eax,%edx
    ab9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ab9e:	83 c0 01             	add    $0x1,%eax
    aba1:	0f af 45 d4          	imul   -0x2c(%ebp),%eax
    aba5:	01 d0                	add    %edx,%eax
    aba7:	83 e8 01             	sub    $0x1,%eax
    abaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    abad:	e9 80 00 00 00       	jmp    ac32 <III_stereo+0x1ff>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    abb2:	8b 45 08             	mov    0x8(%ebp),%eax
    abb5:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    abbb:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    abbe:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    abc3:	89 c8                	mov    %ecx,%eax
    abc5:	f7 ea                	imul   %edx
    abc7:	c1 fa 02             	sar    $0x2,%edx
    abca:	89 c8                	mov    %ecx,%eax
    abcc:	c1 f8 1f             	sar    $0x1f,%eax
    abcf:	89 d3                	mov    %edx,%ebx
    abd1:	29 c3                	sub    %eax,%ebx
    abd3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    abd6:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    abdb:	89 c8                	mov    %ecx,%eax
    abdd:	f7 ea                	imul   %edx
    abdf:	c1 fa 02             	sar    $0x2,%edx
    abe2:	89 c8                	mov    %ecx,%eax
    abe4:	c1 f8 1f             	sar    $0x1f,%eax
    abe7:	29 c2                	sub    %eax,%edx
    abe9:	89 d0                	mov    %edx,%eax
    abeb:	c1 e0 03             	shl    $0x3,%eax
    abee:	01 d0                	add    %edx,%eax
    abf0:	01 c0                	add    %eax,%eax
    abf2:	29 c1                	sub    %eax,%ecx
    abf4:	89 ca                	mov    %ecx,%edx
    abf6:	89 d8                	mov    %ebx,%eax
    abf8:	c1 e0 03             	shl    $0x3,%eax
    abfb:	01 d8                	add    %ebx,%eax
    abfd:	01 c0                	add    %eax,%eax
    abff:	01 d0                	add    %edx,%eax
    ac01:	dd 04 c6             	fldl   (%esi,%eax,8)
    ac04:	d9 ee                	fldz   
    ac06:	df e9                	fucomip %st(1),%st
    ac08:	7a 0a                	jp     ac14 <III_stereo+0x1e1>
    ac0a:	d9 ee                	fldz   
    ac0c:	df e9                	fucomip %st(1),%st
    ac0e:	dd d8                	fstp   %st(0)
    ac10:	74 18                	je     ac2a <III_stereo+0x1f7>
    ac12:	eb 02                	jmp    ac16 <III_stereo+0x1e3>
    ac14:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    ac16:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac19:	89 45 d8             	mov    %eax,-0x28(%ebp)
                        sfb = -10;
    ac1c:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    ac23:	c7 45 d4 f6 ff ff ff 	movl   $0xfffffff6,-0x2c(%ebp)
                     }
                     lines--;
    ac2a:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
                     i--;
    ac2e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    ac32:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
    ac36:	0f 8f 76 ff ff ff    	jg     abb2 <III_stereo+0x17f>
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = 2;
               for( sfb=12; sfb >=3; sfb-- )
    ac3c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    ac40:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    ac44:	0f 8f e7 fe ff ff    	jg     ab31 <III_stereo+0xfe>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    ac4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
    ac4d:	83 c0 01             	add    $0x1,%eax
    ac50:	89 45 f4             	mov    %eax,-0xc(%ebp)

               if ( sfb > max_sfb )
    ac53:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac56:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    ac59:	7e 0b                	jle    ac66 <III_stereo+0x233>
                  max_sfb = sfb;
    ac5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac5e:	89 45 dc             	mov    %eax,-0x24(%ebp)

               while( sfb<12 )
    ac61:	e9 f5 00 00 00       	jmp    ad5b <III_stereo+0x328>
    ac66:	e9 f0 00 00 00       	jmp    ad5b <III_stereo+0x328>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    ac6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ac6e:	8d 48 01             	lea    0x1(%eax),%ecx
    ac71:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac74:	89 d0                	mov    %edx,%eax
    ac76:	c1 e0 03             	shl    $0x3,%eax
    ac79:	01 d0                	add    %edx,%eax
    ac7b:	c1 e0 02             	shl    $0x2,%eax
    ac7e:	01 d0                	add    %edx,%eax
    ac80:	01 c8                	add    %ecx,%eax
    ac82:	83 c0 14             	add    $0x14,%eax
    ac85:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
    ac8c:	8b 55 c8             	mov    -0x38(%ebp),%edx
    ac8f:	89 d0                	mov    %edx,%eax
    ac91:	c1 e0 03             	shl    $0x3,%eax
    ac94:	01 d0                	add    %edx,%eax
    ac96:	c1 e0 02             	shl    $0x2,%eax
    ac99:	01 d0                	add    %edx,%eax
    ac9b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    ac9e:	01 d0                	add    %edx,%eax
    aca0:	83 c0 14             	add    $0x14,%eax
    aca3:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    acaa:	29 c1                	sub    %eax,%ecx
    acac:	89 c8                	mov    %ecx,%eax
    acae:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    acb1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    acb4:	89 d0                	mov    %edx,%eax
    acb6:	c1 e0 03             	shl    $0x3,%eax
    acb9:	01 d0                	add    %edx,%eax
    acbb:	c1 e0 02             	shl    $0x2,%eax
    acbe:	01 d0                	add    %edx,%eax
    acc0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    acc3:	01 d0                	add    %edx,%eax
    acc5:	83 c0 14             	add    $0x14,%eax
    acc8:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    accf:	89 d0                	mov    %edx,%eax
    acd1:	01 c0                	add    %eax,%eax
    acd3:	01 c2                	add    %eax,%edx
    acd5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    acd8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    acdc:	01 d0                	add    %edx,%eax
    acde:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    ace1:	eb 6e                	jmp    ad51 <III_stereo+0x31e>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    ace3:	8b 4d 10             	mov    0x10(%ebp),%ecx
    ace6:	8b 55 ec             	mov    -0x14(%ebp),%edx
    ace9:	89 d0                	mov    %edx,%eax
    aceb:	01 c0                	add    %eax,%eax
    aced:	01 d0                	add    %edx,%eax
    acef:	c1 e0 02             	shl    $0x2,%eax
    acf2:	01 d0                	add    %edx,%eax
    acf4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    acf7:	01 d0                	add    %edx,%eax
    acf9:	83 c0 52             	add    $0x52,%eax
    acfc:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    ad00:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ad03:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    ad0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ad0d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    ad14:	83 f8 07             	cmp    $0x7,%eax
    ad17:	74 30                	je     ad49 <III_stereo+0x316>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    ad19:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ad1c:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    ad23:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    ad29:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    ad2f:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    ad35:	de c9                	fmulp  %st,%st(1)
    ad37:	dd 1c 24             	fstpl  (%esp)
    ad3a:	e8 1d b6 ff ff       	call   635c <tan>
    ad3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ad42:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    ad49:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  max_sfb = sfb;

               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    ad4d:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    ad51:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    ad55:	7f 8c                	jg     ace3 <III_stereo+0x2b0>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    ad57:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
               sfb = sfbcnt + 1;

               if ( sfb > max_sfb )
                  max_sfb = sfb;

               while( sfb<12 )
    ad5b:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    ad5f:	0f 8e 06 ff ff ff    	jle    ac6b <III_stereo+0x238>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    ad65:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ad68:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ad6e:	05 1c 12 01 00       	add    $0x1121c,%eax
    ad73:	8b 50 0c             	mov    0xc(%eax),%edx
    ad76:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ad79:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ad7f:	05 18 12 01 00       	add    $0x11218,%eax
    ad84:	8b 40 0c             	mov    0xc(%eax),%eax
    ad87:	29 c2                	sub    %eax,%edx
    ad89:	89 d0                	mov    %edx,%eax
    ad8b:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    ad8e:	8b 45 c8             	mov    -0x38(%ebp),%eax
    ad91:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ad97:	05 18 12 01 00       	add    $0x11218,%eax
    ad9c:	8b 50 0c             	mov    0xc(%eax),%edx
    ad9f:	89 d0                	mov    %edx,%eax
    ada1:	01 c0                	add    %eax,%eax
    ada3:	01 c2                	add    %eax,%edx
    ada5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    ada8:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    adac:	01 d0                	add    %edx,%eax
    adae:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    adb1:	8b 45 c8             	mov    -0x38(%ebp),%eax
    adb4:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    adba:	05 20 12 01 00       	add    $0x11220,%eax
    adbf:	8b 50 0c             	mov    0xc(%eax),%edx
    adc2:	8b 45 c8             	mov    -0x38(%ebp),%eax
    adc5:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    adcb:	05 1c 12 01 00       	add    $0x1121c,%eax
    add0:	8b 40 0c             	mov    0xc(%eax),%eax
    add3:	29 c2                	sub    %eax,%edx
    add5:	89 d0                	mov    %edx,%eax
    add7:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    adda:	8b 45 c8             	mov    -0x38(%ebp),%eax
    addd:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    ade3:	05 1c 12 01 00       	add    $0x1121c,%eax
    ade8:	8b 50 0c             	mov    0xc(%eax),%edx
    adeb:	89 d0                	mov    %edx,%eax
    aded:	01 c0                	add    %eax,%eax
    adef:	01 c2                	add    %eax,%edx
    adf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    adf4:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    adf8:	01 d0                	add    %edx,%eax
    adfa:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    adfd:	eb 30                	jmp    ae2f <III_stereo+0x3fc>
               {  is_pos[i] = is_pos[sfb];
    adff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae02:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    ae09:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae0c:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    ae13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ae16:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    ae1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ae20:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    ae27:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    ae2b:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    ae2f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    ae33:	7f ca                	jg     adff <III_stereo+0x3cc>
   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
         {  int max_sfb = 0;

            for ( j=0; j<3; j++ )
    ae35:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    ae39:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    ae3d:	0f 8e db fc ff ff    	jle    ab1e <III_stereo+0xeb>
               {  is_pos[i] = is_pos[sfb];
                  is_ratio[i] = is_ratio[sfb];
                  i++;
               }
             }
             if ( max_sfb <= 3 )
    ae43:	83 7d dc 03          	cmpl   $0x3,-0x24(%ebp)
    ae47:	0f 8f 89 01 00 00    	jg     afd6 <III_stereo+0x5a3>
             {  i = 2;
    ae4d:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
                ss = 17;
    ae54:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
                sb = -1;
    ae5b:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
                while ( i >= 0 )
    ae62:	eb 63                	jmp    aec7 <III_stereo+0x494>
                {  if ( xr[1][i][ss] != 0.0 )
    ae64:	8b 45 08             	mov    0x8(%ebp),%eax
    ae67:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    ae6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ae70:	89 d0                	mov    %edx,%eax
    ae72:	c1 e0 03             	shl    $0x3,%eax
    ae75:	01 d0                	add    %edx,%eax
    ae77:	01 c0                	add    %eax,%eax
    ae79:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    ae7c:	01 d0                	add    %edx,%eax
    ae7e:	dd 04 c1             	fldl   (%ecx,%eax,8)
    ae81:	d9 ee                	fldz   
    ae83:	df e9                	fucomip %st(1),%st
    ae85:	7a 0a                	jp     ae91 <III_stereo+0x45e>
    ae87:	d9 ee                	fldz   
    ae89:	df e9                	fucomip %st(1),%st
    ae8b:	dd d8                	fstp   %st(0)
    ae8d:	74 23                	je     aeb2 <III_stereo+0x47f>
    ae8f:	eb 02                	jmp    ae93 <III_stereo+0x460>
    ae91:	dd d8                	fstp   %st(0)
                   {  sb = i*18+ss;
    ae93:	8b 55 f0             	mov    -0x10(%ebp),%edx
    ae96:	89 d0                	mov    %edx,%eax
    ae98:	c1 e0 03             	shl    $0x3,%eax
    ae9b:	01 d0                	add    %edx,%eax
    ae9d:	01 c0                	add    %eax,%eax
    ae9f:	89 c2                	mov    %eax,%edx
    aea1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    aea4:	01 d0                	add    %edx,%eax
    aea6:	89 45 e8             	mov    %eax,-0x18(%ebp)
                      i = -1;
    aea9:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    aeb0:	eb 15                	jmp    aec7 <III_stereo+0x494>
                   } else
                   {  ss--;
    aeb2:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
                      if ( ss < 0 )
    aeb6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    aeba:	79 0b                	jns    aec7 <III_stereo+0x494>
                      {  i--;
    aebc:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                         ss = 17;
    aec0:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
             }
             if ( max_sfb <= 3 )
             {  i = 2;
                ss = 17;
                sb = -1;
                while ( i >= 0 )
    aec7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    aecb:	79 97                	jns    ae64 <III_stereo+0x431>
                      {  i--;
                         ss = 17;
                      }
                   }
                }
                i = 0;
    aecd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
                while ( sfBandIndex[sfreq].l[i] <= sb )
    aed4:	eb 04                	jmp    aeda <III_stereo+0x4a7>
                   i++;
    aed6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                         ss = 17;
                      }
                   }
                }
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
    aeda:	8b 55 c8             	mov    -0x38(%ebp),%edx
    aedd:	89 d0                	mov    %edx,%eax
    aedf:	c1 e0 03             	shl    $0x3,%eax
    aee2:	01 d0                	add    %edx,%eax
    aee4:	c1 e0 02             	shl    $0x2,%eax
    aee7:	01 d0                	add    %edx,%eax
    aee9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    aeec:	01 d0                	add    %edx,%eax
    aeee:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    aef5:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    aef8:	7e dc                	jle    aed6 <III_stereo+0x4a3>
                   i++;
                sfb = i;
    aefa:	8b 45 f0             	mov    -0x10(%ebp),%eax
    aefd:	89 45 f4             	mov    %eax,-0xc(%ebp)
                i = sfBandIndex[sfreq].l[i];
    af00:	8b 55 c8             	mov    -0x38(%ebp),%edx
    af03:	89 d0                	mov    %edx,%eax
    af05:	c1 e0 03             	shl    $0x3,%eax
    af08:	01 d0                	add    %edx,%eax
    af0a:	c1 e0 02             	shl    $0x2,%eax
    af0d:	01 d0                	add    %edx,%eax
    af0f:	8b 55 f0             	mov    -0x10(%ebp),%edx
    af12:	01 d0                	add    %edx,%eax
    af14:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    af1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
                for ( ; sfb<8; sfb++ )
    af1e:	e9 a9 00 00 00       	jmp    afcc <III_stereo+0x599>
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
    af23:	8b 45 f4             	mov    -0xc(%ebp),%eax
    af26:	8d 48 01             	lea    0x1(%eax),%ecx
    af29:	8b 55 c8             	mov    -0x38(%ebp),%edx
    af2c:	89 d0                	mov    %edx,%eax
    af2e:	c1 e0 03             	shl    $0x3,%eax
    af31:	01 d0                	add    %edx,%eax
    af33:	c1 e0 02             	shl    $0x2,%eax
    af36:	01 d0                	add    %edx,%eax
    af38:	01 c8                	add    %ecx,%eax
    af3a:	8b 0c 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%ecx
    af41:	8b 55 c8             	mov    -0x38(%ebp),%edx
    af44:	89 d0                	mov    %edx,%eax
    af46:	c1 e0 03             	shl    $0x3,%eax
    af49:	01 d0                	add    %edx,%eax
    af4b:	c1 e0 02             	shl    $0x2,%eax
    af4e:	01 d0                	add    %edx,%eax
    af50:	8b 55 f4             	mov    -0xc(%ebp),%edx
    af53:	01 d0                	add    %edx,%eax
    af55:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    af5c:	29 c1                	sub    %eax,%ecx
    af5e:	89 c8                	mov    %ecx,%eax
    af60:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   for ( ; sb > 0; sb--)
    af63:	eb 5d                	jmp    afc2 <III_stereo+0x58f>
                   {  is_pos[i] = (*scalefac)[1].l[sfb];
    af65:	8b 45 10             	mov    0x10(%ebp),%eax
    af68:	8b 55 f4             	mov    -0xc(%ebp),%edx
    af6b:	83 c2 3e             	add    $0x3e,%edx
    af6e:	8b 14 90             	mov    (%eax,%edx,4),%edx
    af71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    af74:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                      if ( is_pos[i] != 7 )
    af7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    af7e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    af85:	83 f8 07             	cmp    $0x7,%eax
    af88:	74 30                	je     afba <III_stereo+0x587>
                         is_ratio[i] = tan( is_pos[i] * (PI / 12));
    af8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    af8d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    af94:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    af9a:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    afa0:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    afa6:	de c9                	fmulp  %st,%st(1)
    afa8:	dd 1c 24             	fstpl  (%esp)
    afab:	e8 ac b3 ff ff       	call   635c <tan>
    afb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    afb3:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                      i++;
    afba:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
                {  sb = sfBandIndex[sfreq].l[sfb+1]-sfBandIndex[sfreq].l[sfb];
                   for ( ; sb > 0; sb--)
    afbe:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    afc2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    afc6:	7f 9d                	jg     af65 <III_stereo+0x532>
                i = 0;
                while ( sfBandIndex[sfreq].l[i] <= sb )
                   i++;
                sfb = i;
                i = sfBandIndex[sfreq].l[i];
                for ( ; sfb<8; sfb++ )
    afc8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    afcc:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    afd0:	0f 8e 4d ff ff ff    	jle    af23 <III_stereo+0x4f0>
    afd6:	e9 1e 03 00 00       	jmp    b2f9 <III_stereo+0x8c6>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    afdb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    afe2:	e9 08 03 00 00       	jmp    b2ef <III_stereo+0x8bc>
            {  int sfbcnt;
               sfbcnt = -1;
    afe7:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
               for( sfb=12; sfb >=0; sfb-- )
    afee:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    aff5:	e9 0f 01 00 00       	jmp    b109 <III_stereo+0x6d6>
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    affa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    affd:	8d 48 01             	lea    0x1(%eax),%ecx
    b000:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b003:	89 d0                	mov    %edx,%eax
    b005:	c1 e0 03             	shl    $0x3,%eax
    b008:	01 d0                	add    %edx,%eax
    b00a:	c1 e0 02             	shl    $0x2,%eax
    b00d:	01 d0                	add    %edx,%eax
    b00f:	01 c8                	add    %ecx,%eax
    b011:	83 c0 14             	add    $0x14,%eax
    b014:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
    b01b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b01e:	89 d0                	mov    %edx,%eax
    b020:	c1 e0 03             	shl    $0x3,%eax
    b023:	01 d0                	add    %edx,%eax
    b025:	c1 e0 02             	shl    $0x2,%eax
    b028:	01 d0                	add    %edx,%eax
    b02a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b02d:	01 d0                	add    %edx,%eax
    b02f:	83 c0 14             	add    $0x14,%eax
    b032:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    b039:	29 c1                	sub    %eax,%ecx
    b03b:	89 c8                	mov    %ecx,%eax
    b03d:	89 45 cc             	mov    %eax,-0x34(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
    b040:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b043:	89 d0                	mov    %edx,%eax
    b045:	c1 e0 03             	shl    $0x3,%eax
    b048:	01 d0                	add    %edx,%eax
    b04a:	c1 e0 02             	shl    $0x2,%eax
    b04d:	01 d0                	add    %edx,%eax
    b04f:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b052:	01 d0                	add    %edx,%eax
    b054:	83 c0 14             	add    $0x14,%eax
    b057:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    b05e:	89 d0                	mov    %edx,%eax
    b060:	01 c0                	add    %eax,%eax
    b062:	01 c2                	add    %eax,%edx
    b064:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b067:	83 c0 01             	add    $0x1,%eax
    b06a:	0f af 45 cc          	imul   -0x34(%ebp),%eax
    b06e:	01 d0                	add    %edx,%eax
    b070:	83 e8 01             	sub    $0x1,%eax
    b073:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  while ( lines > 0 )
    b076:	e9 80 00 00 00       	jmp    b0fb <III_stereo+0x6c8>
                  {  if ( xr[1][i/SSLIMIT][i%SSLIMIT] != 0.0 )
    b07b:	8b 45 08             	mov    0x8(%ebp),%eax
    b07e:	8d b0 00 12 00 00    	lea    0x1200(%eax),%esi
    b084:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b087:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    b08c:	89 c8                	mov    %ecx,%eax
    b08e:	f7 ea                	imul   %edx
    b090:	c1 fa 02             	sar    $0x2,%edx
    b093:	89 c8                	mov    %ecx,%eax
    b095:	c1 f8 1f             	sar    $0x1f,%eax
    b098:	89 d3                	mov    %edx,%ebx
    b09a:	29 c3                	sub    %eax,%ebx
    b09c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    b09f:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    b0a4:	89 c8                	mov    %ecx,%eax
    b0a6:	f7 ea                	imul   %edx
    b0a8:	c1 fa 02             	sar    $0x2,%edx
    b0ab:	89 c8                	mov    %ecx,%eax
    b0ad:	c1 f8 1f             	sar    $0x1f,%eax
    b0b0:	29 c2                	sub    %eax,%edx
    b0b2:	89 d0                	mov    %edx,%eax
    b0b4:	c1 e0 03             	shl    $0x3,%eax
    b0b7:	01 d0                	add    %edx,%eax
    b0b9:	01 c0                	add    %eax,%eax
    b0bb:	29 c1                	sub    %eax,%ecx
    b0bd:	89 ca                	mov    %ecx,%edx
    b0bf:	89 d8                	mov    %ebx,%eax
    b0c1:	c1 e0 03             	shl    $0x3,%eax
    b0c4:	01 d8                	add    %ebx,%eax
    b0c6:	01 c0                	add    %eax,%eax
    b0c8:	01 d0                	add    %edx,%eax
    b0ca:	dd 04 c6             	fldl   (%esi,%eax,8)
    b0cd:	d9 ee                	fldz   
    b0cf:	df e9                	fucomip %st(1),%st
    b0d1:	7a 0a                	jp     b0dd <III_stereo+0x6aa>
    b0d3:	d9 ee                	fldz   
    b0d5:	df e9                	fucomip %st(1),%st
    b0d7:	dd d8                	fstp   %st(0)
    b0d9:	74 18                	je     b0f3 <III_stereo+0x6c0>
    b0db:	eb 02                	jmp    b0df <III_stereo+0x6ac>
    b0dd:	dd d8                	fstp   %st(0)
                     {  sfbcnt = sfb;
    b0df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b0e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
                        sfb = -10;
    b0e5:	c7 45 f4 f6 ff ff ff 	movl   $0xfffffff6,-0xc(%ebp)
                        lines = -10;
    b0ec:	c7 45 cc f6 ff ff ff 	movl   $0xfffffff6,-0x34(%ebp)
                     }
                     lines--;
    b0f3:	83 6d cc 01          	subl   $0x1,-0x34(%ebp)
                     i--;
    b0f7:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
               {  int lines;
                  lines = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + (j+1) * lines - 1;
                  while ( lines > 0 )
    b0fb:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
    b0ff:	0f 8f 76 ff ff ff    	jg     b07b <III_stereo+0x648>
            }
         } else
         {  for ( j=0; j<3; j++ )
            {  int sfbcnt;
               sfbcnt = -1;
               for( sfb=12; sfb >=0; sfb-- )
    b105:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    b109:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    b10d:	0f 89 e7 fe ff ff    	jns    affa <III_stereo+0x5c7>
                     }
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
    b113:	8b 45 d0             	mov    -0x30(%ebp),%eax
    b116:	83 c0 01             	add    $0x1,%eax
    b119:	89 45 f4             	mov    %eax,-0xc(%ebp)
               while( sfb<12 )
    b11c:	e9 f0 00 00 00       	jmp    b211 <III_stereo+0x7de>
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
    b121:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b124:	8d 48 01             	lea    0x1(%eax),%ecx
    b127:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b12a:	89 d0                	mov    %edx,%eax
    b12c:	c1 e0 03             	shl    $0x3,%eax
    b12f:	01 d0                	add    %edx,%eax
    b131:	c1 e0 02             	shl    $0x2,%eax
    b134:	01 d0                	add    %edx,%eax
    b136:	01 c8                	add    %ecx,%eax
    b138:	83 c0 14             	add    $0x14,%eax
    b13b:	8b 0c 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%ecx
    b142:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b145:	89 d0                	mov    %edx,%eax
    b147:	c1 e0 03             	shl    $0x3,%eax
    b14a:	01 d0                	add    %edx,%eax
    b14c:	c1 e0 02             	shl    $0x2,%eax
    b14f:	01 d0                	add    %edx,%eax
    b151:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b154:	01 d0                	add    %edx,%eax
    b156:	83 c0 14             	add    $0x14,%eax
    b159:	8b 04 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%eax
    b160:	29 c1                	sub    %eax,%ecx
    b162:	89 c8                	mov    %ecx,%eax
    b164:	89 45 e8             	mov    %eax,-0x18(%ebp)
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
    b167:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b16a:	89 d0                	mov    %edx,%eax
    b16c:	c1 e0 03             	shl    $0x3,%eax
    b16f:	01 d0                	add    %edx,%eax
    b171:	c1 e0 02             	shl    $0x2,%eax
    b174:	01 d0                	add    %edx,%eax
    b176:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b179:	01 d0                	add    %edx,%eax
    b17b:	83 c0 14             	add    $0x14,%eax
    b17e:	8b 14 85 ac 11 01 00 	mov    0x111ac(,%eax,4),%edx
    b185:	89 d0                	mov    %edx,%eax
    b187:	01 c0                	add    %eax,%eax
    b189:	01 c2                	add    %eax,%edx
    b18b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b18e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    b192:	01 d0                	add    %edx,%eax
    b194:	89 45 f0             	mov    %eax,-0x10(%ebp)
                  for ( ; sb > 0; sb--)
    b197:	eb 6e                	jmp    b207 <III_stereo+0x7d4>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
    b199:	8b 4d 10             	mov    0x10(%ebp),%ecx
    b19c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    b19f:	89 d0                	mov    %edx,%eax
    b1a1:	01 c0                	add    %eax,%eax
    b1a3:	01 d0                	add    %edx,%eax
    b1a5:	c1 e0 02             	shl    $0x2,%eax
    b1a8:	01 d0                	add    %edx,%eax
    b1aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b1ad:	01 d0                	add    %edx,%eax
    b1af:	83 c0 52             	add    $0x52,%eax
    b1b2:	8b 54 81 0c          	mov    0xc(%ecx,%eax,4),%edx
    b1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1b9:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                     if ( is_pos[i] != 7 )
    b1c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1c3:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b1ca:	83 f8 07             	cmp    $0x7,%eax
    b1cd:	74 30                	je     b1ff <III_stereo+0x7cc>
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
    b1cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1d2:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b1d9:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    b1df:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    b1e5:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    b1eb:	de c9                	fmulp  %st,%st(1)
    b1ed:	dd 1c 24             	fstpl  (%esp)
    b1f0:	e8 67 b1 ff ff       	call   635c <tan>
    b1f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b1f8:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                     i++;
    b1ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
               {  sb = sfBandIndex[sfreq].s[sfb+1]-sfBandIndex[sfreq].s[sfb];
                  i = 3*sfBandIndex[sfreq].s[sfb] + j * sb;
                  for ( ; sb > 0; sb--)
    b203:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b207:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b20b:	7f 8c                	jg     b199 <III_stereo+0x766>
                  {  is_pos[i] = (*scalefac)[1].s[j][sfb];
                     if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                     i++;
                  }
                  sfb++;
    b20d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
                     lines--;
                     i--;
                  }
               }
               sfb = sfbcnt + 1;
               while( sfb<12 )
    b211:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    b215:	0f 8e 06 ff ff ff    	jle    b121 <III_stereo+0x6ee>
                     i++;
                  }
                  sfb++;
               }

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
    b21b:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b21e:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b224:	05 1c 12 01 00       	add    $0x1121c,%eax
    b229:	8b 50 0c             	mov    0xc(%eax),%edx
    b22c:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b22f:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b235:	05 18 12 01 00       	add    $0x11218,%eax
    b23a:	8b 40 0c             	mov    0xc(%eax),%eax
    b23d:	29 c2                	sub    %eax,%edx
    b23f:	89 d0                	mov    %edx,%eax
    b241:	89 45 e8             	mov    %eax,-0x18(%ebp)
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
    b244:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b247:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b24d:	05 18 12 01 00       	add    $0x11218,%eax
    b252:	8b 50 0c             	mov    0xc(%eax),%edx
    b255:	89 d0                	mov    %edx,%eax
    b257:	01 c0                	add    %eax,%eax
    b259:	01 c2                	add    %eax,%edx
    b25b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b25e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    b262:	01 d0                	add    %edx,%eax
    b264:	89 45 f4             	mov    %eax,-0xc(%ebp)
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
    b267:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b26a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b270:	05 20 12 01 00       	add    $0x11220,%eax
    b275:	8b 50 0c             	mov    0xc(%eax),%edx
    b278:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b27b:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b281:	05 1c 12 01 00       	add    $0x1121c,%eax
    b286:	8b 40 0c             	mov    0xc(%eax),%eax
    b289:	29 c2                	sub    %eax,%edx
    b28b:	89 d0                	mov    %edx,%eax
    b28d:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
    b290:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b293:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b299:	05 1c 12 01 00       	add    $0x1121c,%eax
    b29e:	8b 50 0c             	mov    0xc(%eax),%edx
    b2a1:	89 d0                	mov    %edx,%eax
    b2a3:	01 c0                	add    %eax,%eax
    b2a5:	01 c2                	add    %eax,%edx
    b2a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    b2aa:	0f af 45 e8          	imul   -0x18(%ebp),%eax
    b2ae:	01 d0                	add    %edx,%eax
    b2b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
               for ( ; sb > 0; sb-- )
    b2b3:	eb 30                	jmp    b2e5 <III_stereo+0x8b2>
               {  is_pos[i] = is_pos[sfb];
    b2b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2b8:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    b2bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b2c2:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
                  is_ratio[i] = is_ratio[sfb];
    b2c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b2cc:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b2d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b2d6:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
                  i++;
    b2dd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)

               sb = sfBandIndex[sfreq].s[11]-sfBandIndex[sfreq].s[10];
               sfb = 3*sfBandIndex[sfreq].s[10] + j * sb;
               sb = sfBandIndex[sfreq].s[12]-sfBandIndex[sfreq].s[11];
               i = 3*sfBandIndex[sfreq].s[11] + j * sb;
               for ( ; sb > 0; sb-- )
    b2e1:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b2e5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b2e9:	7f ca                	jg     b2b5 <III_stereo+0x882>
                      i++;
                   }
                }
            }
         } else
         {  for ( j=0; j<3; j++ )
    b2eb:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    b2ef:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
    b2f3:	0f 8e ee fc ff ff    	jle    afe7 <III_stereo+0x5b4>
   for ( i=0; i<576; i++ )
      is_pos[i] = 7;

   if ((stereo == 2) && i_stereo )
   {  if (gr_info->window_switching_flag && (gr_info->block_type == 2))
      {  if( gr_info->mixed_block_flag )
    b2f9:	e9 f0 01 00 00       	jmp    b4ee <III_stereo+0xabb>
                  i++;
               }
            }
         }
      } else
      {  i = 31;
    b2fe:	c7 45 f0 1f 00 00 00 	movl   $0x1f,-0x10(%ebp)
         ss = 17;
    b305:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         sb = 0;
    b30c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
         while ( i >= 0 )
    b313:	eb 63                	jmp    b378 <III_stereo+0x945>
         {  if ( xr[1][i][ss] != 0.0 )
    b315:	8b 45 08             	mov    0x8(%ebp),%eax
    b318:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b31e:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b321:	89 d0                	mov    %edx,%eax
    b323:	c1 e0 03             	shl    $0x3,%eax
    b326:	01 d0                	add    %edx,%eax
    b328:	01 c0                	add    %eax,%eax
    b32a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b32d:	01 d0                	add    %edx,%eax
    b32f:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b332:	d9 ee                	fldz   
    b334:	df e9                	fucomip %st(1),%st
    b336:	7a 0a                	jp     b342 <III_stereo+0x90f>
    b338:	d9 ee                	fldz   
    b33a:	df e9                	fucomip %st(1),%st
    b33c:	dd d8                	fstp   %st(0)
    b33e:	74 23                	je     b363 <III_stereo+0x930>
    b340:	eb 02                	jmp    b344 <III_stereo+0x911>
    b342:	dd d8                	fstp   %st(0)
            {  sb = i*18+ss;
    b344:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b347:	89 d0                	mov    %edx,%eax
    b349:	c1 e0 03             	shl    $0x3,%eax
    b34c:	01 d0                	add    %edx,%eax
    b34e:	01 c0                	add    %eax,%eax
    b350:	89 c2                	mov    %eax,%edx
    b352:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b355:	01 d0                	add    %edx,%eax
    b357:	89 45 e8             	mov    %eax,-0x18(%ebp)
               i = -1;
    b35a:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
    b361:	eb 15                	jmp    b378 <III_stereo+0x945>
            } else
            {  ss--;
    b363:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
               if ( ss < 0 )
    b367:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    b36b:	79 0b                	jns    b378 <III_stereo+0x945>
               {  i--;
    b36d:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
                  ss = 17;
    b371:	c7 45 e4 11 00 00 00 	movl   $0x11,-0x1c(%ebp)
         }
      } else
      {  i = 31;
         ss = 17;
         sb = 0;
         while ( i >= 0 )
    b378:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    b37c:	79 97                	jns    b315 <III_stereo+0x8e2>
               {  i--;
                  ss = 17;
               }
            }
         }
         i = 0;
    b37e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
         while ( sfBandIndex[sfreq].l[i] <= sb )
    b385:	eb 04                	jmp    b38b <III_stereo+0x958>
            i++;
    b387:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  ss = 17;
               }
            }
         }
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
    b38b:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b38e:	89 d0                	mov    %edx,%eax
    b390:	c1 e0 03             	shl    $0x3,%eax
    b393:	01 d0                	add    %edx,%eax
    b395:	c1 e0 02             	shl    $0x2,%eax
    b398:	01 d0                	add    %edx,%eax
    b39a:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b39d:	01 d0                	add    %edx,%eax
    b39f:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    b3a6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    b3a9:	7e dc                	jle    b387 <III_stereo+0x954>
            i++;
         sfb = i;
    b3ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b3ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
         i = sfBandIndex[sfreq].l[i];
    b3b1:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b3b4:	89 d0                	mov    %edx,%eax
    b3b6:	c1 e0 03             	shl    $0x3,%eax
    b3b9:	01 d0                	add    %edx,%eax
    b3bb:	c1 e0 02             	shl    $0x2,%eax
    b3be:	01 d0                	add    %edx,%eax
    b3c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b3c3:	01 d0                	add    %edx,%eax
    b3c5:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    b3cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
         for ( ; sfb<21; sfb++ )
    b3cf:	e9 a9 00 00 00       	jmp    b47d <III_stereo+0xa4a>
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
    b3d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b3d7:	8d 48 01             	lea    0x1(%eax),%ecx
    b3da:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b3dd:	89 d0                	mov    %edx,%eax
    b3df:	c1 e0 03             	shl    $0x3,%eax
    b3e2:	01 d0                	add    %edx,%eax
    b3e4:	c1 e0 02             	shl    $0x2,%eax
    b3e7:	01 d0                	add    %edx,%eax
    b3e9:	01 c8                	add    %ecx,%eax
    b3eb:	8b 0c 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%ecx
    b3f2:	8b 55 c8             	mov    -0x38(%ebp),%edx
    b3f5:	89 d0                	mov    %edx,%eax
    b3f7:	c1 e0 03             	shl    $0x3,%eax
    b3fa:	01 d0                	add    %edx,%eax
    b3fc:	c1 e0 02             	shl    $0x2,%eax
    b3ff:	01 d0                	add    %edx,%eax
    b401:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b404:	01 d0                	add    %edx,%eax
    b406:	8b 04 85 a0 11 01 00 	mov    0x111a0(,%eax,4),%eax
    b40d:	29 c1                	sub    %eax,%ecx
    b40f:	89 c8                	mov    %ecx,%eax
    b411:	89 45 e8             	mov    %eax,-0x18(%ebp)
            for ( ; sb > 0; sb--)
    b414:	eb 5d                	jmp    b473 <III_stereo+0xa40>
            {  is_pos[i] = (*scalefac)[1].l[sfb];
    b416:	8b 45 10             	mov    0x10(%ebp),%eax
    b419:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b41c:	83 c2 3e             	add    $0x3e,%edx
    b41f:	8b 14 90             	mov    (%eax,%edx,4),%edx
    b422:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b425:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
               if ( is_pos[i] != 7 )
    b42c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b42f:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b436:	83 f8 07             	cmp    $0x7,%eax
    b439:	74 30                	je     b46b <III_stereo+0xa38>
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
    b43b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b43e:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b445:	89 85 b4 e4 ff ff    	mov    %eax,-0x1b4c(%ebp)
    b44b:	db 85 b4 e4 ff ff    	fildl  -0x1b4c(%ebp)
    b451:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    b457:	de c9                	fmulp  %st,%st(1)
    b459:	dd 1c 24             	fstpl  (%esp)
    b45c:	e8 fb ae ff ff       	call   635c <tan>
    b461:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b464:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
               i++;
    b46b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
         {  sb = sfBandIndex[sfreq].l[sfb+1] - sfBandIndex[sfreq].l[sfb];
            for ( ; sb > 0; sb--)
    b46f:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b473:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b477:	7f 9d                	jg     b416 <III_stereo+0x9e3>
         i = 0;
         while ( sfBandIndex[sfreq].l[i] <= sb )
            i++;
         sfb = i;
         i = sfBandIndex[sfreq].l[i];
         for ( ; sfb<21; sfb++ )
    b479:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b47d:	83 7d f4 14          	cmpl   $0x14,-0xc(%ebp)
    b481:	0f 8e 4d ff ff ff    	jle    b3d4 <III_stereo+0x9a1>
               if ( is_pos[i] != 7 )
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
    b487:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b48a:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b490:	05 f0 11 01 00       	add    $0x111f0,%eax
    b495:	8b 00                	mov    (%eax),%eax
    b497:	89 45 f4             	mov    %eax,-0xc(%ebp)
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b49a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    b49d:	69 c0 94 00 00 00    	imul   $0x94,%eax,%eax
    b4a3:	05 f4 11 01 00       	add    $0x111f4,%eax
    b4a8:	8b 00                	mov    (%eax),%eax
    b4aa:	ba 40 02 00 00       	mov    $0x240,%edx
    b4af:	29 c2                	sub    %eax,%edx
    b4b1:	89 d0                	mov    %edx,%eax
    b4b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    b4b6:	eb 30                	jmp    b4e8 <III_stereo+0xab5>
         {  is_pos[i] = is_pos[sfb];
    b4b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4bb:	8b 94 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%edx
    b4c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b4c5:	89 94 85 bc f6 ff ff 	mov    %edx,-0x944(%ebp,%eax,4)
            is_ratio[i] = is_ratio[sfb];
    b4cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b4cf:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b4d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b4d9:	dd 9c c5 b8 e4 ff ff 	fstpl  -0x1b48(%ebp,%eax,8)
            i++;
    b4e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                  is_ratio[i] = tan( is_pos[i] * (PI / 12));
               i++;
            }
         }
         sfb = sfBandIndex[sfreq].l[20];
         for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
    b4e4:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
    b4e8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    b4ec:	7f ca                	jg     b4b8 <III_stereo+0xa85>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b4ee:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
    b4f5:	eb 55                	jmp    b54c <III_stereo+0xb19>
      for(sb=0;sb<SBLIMIT;sb++)
    b4f7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b4fe:	eb 42                	jmp    b542 <III_stereo+0xb0f>
         for(ss=0;ss<SSLIMIT;ss++)
    b500:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b507:	eb 2f                	jmp    b538 <III_stereo+0xb05>
            lr[ch][sb][ss] = 0;
    b509:	8b 55 e0             	mov    -0x20(%ebp),%edx
    b50c:	89 d0                	mov    %edx,%eax
    b50e:	c1 e0 03             	shl    $0x3,%eax
    b511:	01 d0                	add    %edx,%eax
    b513:	c1 e0 09             	shl    $0x9,%eax
    b516:	89 c2                	mov    %eax,%edx
    b518:	8b 45 0c             	mov    0xc(%ebp),%eax
    b51b:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b51e:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b521:	89 d0                	mov    %edx,%eax
    b523:	c1 e0 03             	shl    $0x3,%eax
    b526:	01 d0                	add    %edx,%eax
    b528:	01 c0                	add    %eax,%eax
    b52a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b52d:	01 d0                	add    %edx,%eax
    b52f:	d9 ee                	fldz   
    b531:	dd 1c c1             	fstpl  (%ecx,%eax,8)
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b534:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b538:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b53c:	7e cb                	jle    b509 <III_stereo+0xad6>
         }
      }
   }

   for(ch=0;ch<2;ch++)
      for(sb=0;sb<SBLIMIT;sb++)
    b53e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b542:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b546:	7e b8                	jle    b500 <III_stereo+0xacd>
            i++;
         }
      }
   }

   for(ch=0;ch<2;ch++)
    b548:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    b54c:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
    b550:	7e a5                	jle    b4f7 <III_stereo+0xac4>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
    b552:	83 7d c4 02          	cmpl   $0x2,-0x3c(%ebp)
    b556:	0f 85 3d 02 00 00    	jne    b799 <III_stereo+0xd66>
      for(sb=0;sb<SBLIMIT;sb++)
    b55c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b563:	e9 25 02 00 00       	jmp    b78d <III_stereo+0xd5a>
         for(ss=0;ss<SSLIMIT;ss++) {
    b568:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b56f:	e9 0b 02 00 00       	jmp    b77f <III_stereo+0xd4c>
            i = (sb*18)+ss;
    b574:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b577:	89 d0                	mov    %edx,%eax
    b579:	c1 e0 03             	shl    $0x3,%eax
    b57c:	01 d0                	add    %edx,%eax
    b57e:	01 c0                	add    %eax,%eax
    b580:	89 c2                	mov    %eax,%edx
    b582:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    b585:	01 d0                	add    %edx,%eax
    b587:	89 45 f0             	mov    %eax,-0x10(%ebp)
            if ( is_pos[i] == 7 ) {
    b58a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b58d:	8b 84 85 bc f6 ff ff 	mov    -0x944(%ebp,%eax,4),%eax
    b594:	83 f8 07             	cmp    $0x7,%eax
    b597:	0f 85 2c 01 00 00    	jne    b6c9 <III_stereo+0xc96>
               if ( ms_stereo ) {
    b59d:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    b5a1:	0f 84 b5 00 00 00    	je     b65c <III_stereo+0xc29>
                  lr[0][sb][ss] = (xr[0][sb][ss]+xr[1][sb][ss])/1.41421356;
    b5a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b5aa:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b5ad:	89 d0                	mov    %edx,%eax
    b5af:	c1 e0 03             	shl    $0x3,%eax
    b5b2:	01 d0                	add    %edx,%eax
    b5b4:	01 c0                	add    %eax,%eax
    b5b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b5b9:	01 d0                	add    %edx,%eax
    b5bb:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b5be:	8b 45 08             	mov    0x8(%ebp),%eax
    b5c1:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b5c7:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b5ca:	89 d0                	mov    %edx,%eax
    b5cc:	c1 e0 03             	shl    $0x3,%eax
    b5cf:	01 d0                	add    %edx,%eax
    b5d1:	01 c0                	add    %eax,%eax
    b5d3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b5d6:	01 d0                	add    %edx,%eax
    b5d8:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b5db:	de c1                	faddp  %st,%st(1)
    b5dd:	dd 05 e8 f4 00 00    	fldl   0xf4e8
    b5e3:	de f9                	fdivrp %st,%st(1)
    b5e5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b5e8:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b5eb:	89 d0                	mov    %edx,%eax
    b5ed:	c1 e0 03             	shl    $0x3,%eax
    b5f0:	01 d0                	add    %edx,%eax
    b5f2:	01 c0                	add    %eax,%eax
    b5f4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b5f7:	01 d0                	add    %edx,%eax
    b5f9:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = (xr[0][sb][ss]-xr[1][sb][ss])/1.41421356;
    b5fc:	8b 45 0c             	mov    0xc(%ebp),%eax
    b5ff:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b605:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b608:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b60b:	89 d0                	mov    %edx,%eax
    b60d:	c1 e0 03             	shl    $0x3,%eax
    b610:	01 d0                	add    %edx,%eax
    b612:	01 c0                	add    %eax,%eax
    b614:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b617:	01 d0                	add    %edx,%eax
    b619:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b61c:	8b 45 08             	mov    0x8(%ebp),%eax
    b61f:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b625:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b628:	89 d0                	mov    %edx,%eax
    b62a:	c1 e0 03             	shl    $0x3,%eax
    b62d:	01 d0                	add    %edx,%eax
    b62f:	01 c0                	add    %eax,%eax
    b631:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b634:	01 d0                	add    %edx,%eax
    b636:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b639:	de e9                	fsubrp %st,%st(1)
    b63b:	dd 05 e8 f4 00 00    	fldl   0xf4e8
    b641:	de f9                	fdivrp %st,%st(1)
    b643:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b646:	89 d0                	mov    %edx,%eax
    b648:	c1 e0 03             	shl    $0x3,%eax
    b64b:	01 d0                	add    %edx,%eax
    b64d:	01 c0                	add    %eax,%eax
    b64f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b652:	01 d0                	add    %edx,%eax
    b654:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b657:	e9 1f 01 00 00       	jmp    b77b <III_stereo+0xd48>
               }
               else {
                  lr[0][sb][ss] = xr[0][sb][ss];
    b65c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b65f:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b662:	89 d0                	mov    %edx,%eax
    b664:	c1 e0 03             	shl    $0x3,%eax
    b667:	01 d0                	add    %edx,%eax
    b669:	01 c0                	add    %eax,%eax
    b66b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b66e:	01 d0                	add    %edx,%eax
    b670:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b673:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b676:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b679:	89 d0                	mov    %edx,%eax
    b67b:	c1 e0 03             	shl    $0x3,%eax
    b67e:	01 d0                	add    %edx,%eax
    b680:	01 c0                	add    %eax,%eax
    b682:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b685:	01 d0                	add    %edx,%eax
    b687:	dd 1c c1             	fstpl  (%ecx,%eax,8)
                  lr[1][sb][ss] = xr[1][sb][ss];
    b68a:	8b 45 0c             	mov    0xc(%ebp),%eax
    b68d:	8d 88 00 12 00 00    	lea    0x1200(%eax),%ecx
    b693:	8b 45 08             	mov    0x8(%ebp),%eax
    b696:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b69c:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b69f:	89 d0                	mov    %edx,%eax
    b6a1:	c1 e0 03             	shl    $0x3,%eax
    b6a4:	01 d0                	add    %edx,%eax
    b6a6:	01 c0                	add    %eax,%eax
    b6a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b6ab:	01 d0                	add    %edx,%eax
    b6ad:	dd 04 c3             	fldl   (%ebx,%eax,8)
    b6b0:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b6b3:	89 d0                	mov    %edx,%eax
    b6b5:	c1 e0 03             	shl    $0x3,%eax
    b6b8:	01 d0                	add    %edx,%eax
    b6ba:	01 c0                	add    %eax,%eax
    b6bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b6bf:	01 d0                	add    %edx,%eax
    b6c1:	dd 1c c1             	fstpl  (%ecx,%eax,8)
    b6c4:	e9 b2 00 00 00       	jmp    b77b <III_stereo+0xd48>
               }
            }
            else if (i_stereo ) {
    b6c9:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
    b6cd:	0f 84 94 00 00 00    	je     b767 <III_stereo+0xd34>
               lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i]/(1+is_ratio[i]));
    b6d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b6d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b6d9:	89 d0                	mov    %edx,%eax
    b6db:	c1 e0 03             	shl    $0x3,%eax
    b6de:	01 d0                	add    %edx,%eax
    b6e0:	01 c0                	add    %eax,%eax
    b6e2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b6e5:	01 d0                	add    %edx,%eax
    b6e7:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b6ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b6ed:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b6f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b6f7:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b6fe:	d9 e8                	fld1   
    b700:	de c1                	faddp  %st,%st(1)
    b702:	de f9                	fdivrp %st,%st(1)
    b704:	de c9                	fmulp  %st,%st(1)
    b706:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b709:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b70c:	89 d0                	mov    %edx,%eax
    b70e:	c1 e0 03             	shl    $0x3,%eax
    b711:	01 d0                	add    %edx,%eax
    b713:	01 c0                	add    %eax,%eax
    b715:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b718:	01 d0                	add    %edx,%eax
    b71a:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               lr[1][sb][ss] = xr[0][sb][ss] * (1/(1+is_ratio[i]));
    b71d:	8b 45 0c             	mov    0xc(%ebp),%eax
    b720:	8d 98 00 12 00 00    	lea    0x1200(%eax),%ebx
    b726:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b729:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b72c:	89 d0                	mov    %edx,%eax
    b72e:	c1 e0 03             	shl    $0x3,%eax
    b731:	01 d0                	add    %edx,%eax
    b733:	01 c0                	add    %eax,%eax
    b735:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b738:	01 d0                	add    %edx,%eax
    b73a:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b73d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b740:	dd 84 c5 b8 e4 ff ff 	fldl   -0x1b48(%ebp,%eax,8)
    b747:	d9 e8                	fld1   
    b749:	de c1                	faddp  %st,%st(1)
    b74b:	d9 e8                	fld1   
    b74d:	de f1                	fdivp  %st,%st(1)
    b74f:	de c9                	fmulp  %st,%st(1)
    b751:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b754:	89 d0                	mov    %edx,%eax
    b756:	c1 e0 03             	shl    $0x3,%eax
    b759:	01 d0                	add    %edx,%eax
    b75b:	01 c0                	add    %eax,%eax
    b75d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b760:	01 d0                	add    %edx,%eax
    b762:	dd 1c c3             	fstpl  (%ebx,%eax,8)
    b765:	eb 14                	jmp    b77b <III_stereo+0xd48>
            }
            else {
               printf(0,"Error in streo processing\n");
    b767:	c7 44 24 04 80 e4 00 	movl   $0xe480,0x4(%esp)
    b76e:	00 
    b76f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b776:	e8 3c a7 ff ff       	call   5eb7 <printf>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++) {
    b77b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b77f:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b783:	0f 8e eb fd ff ff    	jle    b574 <III_stereo+0xb41>
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
            lr[ch][sb][ss] = 0;

   if (stereo==2)
      for(sb=0;sb<SBLIMIT;sb++)
    b789:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b78d:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b791:	0f 8e d1 fd ff ff    	jle    b568 <III_stereo+0xb35>
    b797:	eb 54                	jmp    b7ed <III_stereo+0xdba>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b799:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b7a0:	eb 45                	jmp    b7e7 <III_stereo+0xdb4>
         for(ss=0;ss<SSLIMIT;ss++)
    b7a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    b7a9:	eb 32                	jmp    b7dd <III_stereo+0xdaa>
            lr[0][sb][ss] = xr[0][sb][ss];
    b7ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
    b7ae:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b7b1:	89 d0                	mov    %edx,%eax
    b7b3:	c1 e0 03             	shl    $0x3,%eax
    b7b6:	01 d0                	add    %edx,%eax
    b7b8:	01 c0                	add    %eax,%eax
    b7ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b7bd:	01 d0                	add    %edx,%eax
    b7bf:	dd 04 c1             	fldl   (%ecx,%eax,8)
    b7c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    b7c5:	8b 55 e8             	mov    -0x18(%ebp),%edx
    b7c8:	89 d0                	mov    %edx,%eax
    b7ca:	c1 e0 03             	shl    $0x3,%eax
    b7cd:	01 d0                	add    %edx,%eax
    b7cf:	01 c0                	add    %eax,%eax
    b7d1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    b7d4:	01 d0                	add    %edx,%eax
    b7d6:	dd 1c c1             	fstpl  (%ecx,%eax,8)
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
         for(ss=0;ss<SSLIMIT;ss++)
    b7d9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    b7dd:	83 7d e4 11          	cmpl   $0x11,-0x1c(%ebp)
    b7e1:	7e c8                	jle    b7ab <III_stereo+0xd78>
            else {
               printf(0,"Error in streo processing\n");
            }
         }
   else  /* mono , bypass xr[0][][] to lr[0][][]*/
      for(sb=0;sb<SBLIMIT;sb++)
    b7e3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b7e7:	83 7d e8 1f          	cmpl   $0x1f,-0x18(%ebp)
    b7eb:	7e b5                	jle    b7a2 <III_stereo+0xd6f>
         for(ss=0;ss<SSLIMIT;ss++)
            lr[0][sb][ss] = xr[0][sb][ss];

}
    b7ed:	81 c4 50 1b 00 00    	add    $0x1b50,%esp
    b7f3:	5b                   	pop    %ebx
    b7f4:	5e                   	pop    %esi
    b7f5:	5d                   	pop    %ebp
    b7f6:	c3                   	ret    

0000b7f7 <III_antialias>:


double Ci[8]={-0.6,-0.535,-0.33,-0.185,-0.095,-0.041,-0.0142,-0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    b7f7:	55                   	push   %ebp
    b7f8:	89 e5                	mov    %esp,%ebp
    b7fa:	83 ec 48             	sub    $0x48,%esp
   static int    init = 1;
   static double ca[8],cs[8];
   double        bu,bd;  /* upper and lower butterfly inputs */
   int           ss,sb,sblim;

   if (init) {
    b7fd:	a1 00 14 01 00       	mov    0x11400,%eax
    b802:	85 c0                	test   %eax,%eax
    b804:	74 68                	je     b86e <III_antialias+0x77>
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b806:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    b80d:	eb 4f                	jmp    b85e <III_antialias+0x67>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
    b80f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b812:	dd 04 c5 c0 13 01 00 	fldl   0x113c0(,%eax,8)
    b819:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b81c:	dd 04 c5 c0 13 01 00 	fldl   0x113c0(,%eax,8)
    b823:	de c9                	fmulp  %st,%st(1)
    b825:	d9 e8                	fld1   
    b827:	de c1                	faddp  %st,%st(1)
    b829:	dd 1c 24             	fstpl  (%esp)
    b82c:	e8 de ac ff ff       	call   650f <sqrt>
    b831:	dd 5d e0             	fstpl  -0x20(%ebp)
         cs[i] = 1.0/sq;
    b834:	d9 e8                	fld1   
    b836:	dc 75 e0             	fdivl  -0x20(%ebp)
    b839:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b83c:	dd 1c c5 80 14 01 00 	fstpl  0x11480(,%eax,8)
         ca[i] = Ci[i]/sq;
    b843:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b846:	dd 04 c5 c0 13 01 00 	fldl   0x113c0(,%eax,8)
    b84d:	dc 75 e0             	fdivl  -0x20(%ebp)
    b850:	8b 45 e8             	mov    -0x18(%ebp),%eax
    b853:	dd 1c c5 c0 14 01 00 	fstpl  0x114c0(,%eax,8)
   int           ss,sb,sblim;

   if (init) {
      int i;
      double    sq;
      for (i=0;i<8;i++) {
    b85a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    b85e:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
    b862:	7e ab                	jle    b80f <III_antialias+0x18>
         sq=sqrt(1.0+Ci[i]*Ci[i]);
         cs[i] = 1.0/sq;
         ca[i] = Ci[i]/sq;
      }
      init = 0;
    b864:	c7 05 00 14 01 00 00 	movl   $0x0,0x11400
    b86b:	00 00 00 
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b86e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b875:	eb 4c                	jmp    b8c3 <III_antialias+0xcc>
       for(ss=0;ss<SSLIMIT;ss++)
    b877:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b87e:	eb 39                	jmp    b8b9 <III_antialias+0xc2>
          hybridIn[sb][ss] = xr[sb][ss];
    b880:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b883:	89 d0                	mov    %edx,%eax
    b885:	c1 e0 03             	shl    $0x3,%eax
    b888:	01 d0                	add    %edx,%eax
    b88a:	c1 e0 04             	shl    $0x4,%eax
    b88d:	89 c2                	mov    %eax,%edx
    b88f:	8b 45 0c             	mov    0xc(%ebp),%eax
    b892:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b895:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b898:	89 d0                	mov    %edx,%eax
    b89a:	c1 e0 03             	shl    $0x3,%eax
    b89d:	01 d0                	add    %edx,%eax
    b89f:	c1 e0 04             	shl    $0x4,%eax
    b8a2:	89 c2                	mov    %eax,%edx
    b8a4:	8b 45 08             	mov    0x8(%ebp),%eax
    b8a7:	01 c2                	add    %eax,%edx
    b8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b8ac:	dd 04 c2             	fldl   (%edx,%eax,8)
    b8af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b8b2:	dd 1c c1             	fstpl  (%ecx,%eax,8)
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
    b8b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b8b9:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    b8bd:	7e c1                	jle    b880 <III_antialias+0x89>
      init = 0;
   }

   /* clear all inputs */

    for(sb=0;sb<SBLIMIT;sb++)
    b8bf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b8c3:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
    b8c7:	7e ae                	jle    b877 <III_antialias+0x80>
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b8c9:	8b 45 10             	mov    0x10(%ebp),%eax
    b8cc:	8b 40 10             	mov    0x10(%eax),%eax
    b8cf:	85 c0                	test   %eax,%eax
    b8d1:	74 1a                	je     b8ed <III_antialias+0xf6>
    b8d3:	8b 45 10             	mov    0x10(%ebp),%eax
    b8d6:	8b 40 14             	mov    0x14(%eax),%eax
    b8d9:	83 f8 02             	cmp    $0x2,%eax
    b8dc:	75 0f                	jne    b8ed <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b8de:	8b 45 10             	mov    0x10(%ebp),%eax
    b8e1:	8b 40 18             	mov    0x18(%eax),%eax

    for(sb=0;sb<SBLIMIT;sb++)
       for(ss=0;ss<SSLIMIT;ss++)
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
    b8e4:	85 c0                	test   %eax,%eax
    b8e6:	75 05                	jne    b8ed <III_antialias+0xf6>
       !gr_info->mixed_block_flag ) return;
    b8e8:	e9 1c 01 00 00       	jmp    ba09 <III_antialias+0x212>

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b8ed:	8b 45 10             	mov    0x10(%ebp),%eax
    b8f0:	8b 40 10             	mov    0x10(%eax),%eax
    b8f3:	85 c0                	test   %eax,%eax
    b8f5:	74 1e                	je     b915 <III_antialias+0x11e>
    b8f7:	8b 45 10             	mov    0x10(%ebp),%eax
    b8fa:	8b 40 18             	mov    0x18(%eax),%eax
    b8fd:	85 c0                	test   %eax,%eax
    b8ff:	74 14                	je     b915 <III_antialias+0x11e>
     (gr_info->block_type == 2))
    b901:	8b 45 10             	mov    0x10(%ebp),%eax
    b904:	8b 40 14             	mov    0x14(%eax),%eax
          hybridIn[sb][ss] = xr[sb][ss];

   if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
       !gr_info->mixed_block_flag ) return;

   if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    b907:	83 f8 02             	cmp    $0x2,%eax
    b90a:	75 09                	jne    b915 <III_antialias+0x11e>
     (gr_info->block_type == 2))
      sblim = 1;
    b90c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    b913:	eb 07                	jmp    b91c <III_antialias+0x125>
   else
      sblim = SBLIMIT-1;
    b915:	c7 45 ec 1f 00 00 00 	movl   $0x1f,-0x14(%ebp)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b91c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    b923:	e9 d5 00 00 00       	jmp    b9fd <III_antialias+0x206>
      for(ss=0;ss<8;ss++) {
    b928:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    b92f:	e9 bb 00 00 00       	jmp    b9ef <III_antialias+0x1f8>
         bu = xr[sb][17-ss];
    b934:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b937:	89 d0                	mov    %edx,%eax
    b939:	c1 e0 03             	shl    $0x3,%eax
    b93c:	01 d0                	add    %edx,%eax
    b93e:	c1 e0 04             	shl    $0x4,%eax
    b941:	89 c2                	mov    %eax,%edx
    b943:	8b 45 08             	mov    0x8(%ebp),%eax
    b946:	01 c2                	add    %eax,%edx
    b948:	b8 11 00 00 00       	mov    $0x11,%eax
    b94d:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b950:	dd 04 c2             	fldl   (%edx,%eax,8)
    b953:	dd 5d d8             	fstpl  -0x28(%ebp)
         bd = xr[sb+1][ss];
    b956:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b959:	8d 50 01             	lea    0x1(%eax),%edx
    b95c:	89 d0                	mov    %edx,%eax
    b95e:	c1 e0 03             	shl    $0x3,%eax
    b961:	01 d0                	add    %edx,%eax
    b963:	c1 e0 04             	shl    $0x4,%eax
    b966:	89 c2                	mov    %eax,%edx
    b968:	8b 45 08             	mov    0x8(%ebp),%eax
    b96b:	01 c2                	add    %eax,%edx
    b96d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b970:	dd 04 c2             	fldl   (%edx,%eax,8)
    b973:	dd 5d d0             	fstpl  -0x30(%ebp)
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
    b976:	8b 55 f0             	mov    -0x10(%ebp),%edx
    b979:	89 d0                	mov    %edx,%eax
    b97b:	c1 e0 03             	shl    $0x3,%eax
    b97e:	01 d0                	add    %edx,%eax
    b980:	c1 e0 04             	shl    $0x4,%eax
    b983:	89 c2                	mov    %eax,%edx
    b985:	8b 45 0c             	mov    0xc(%ebp),%eax
    b988:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    b98b:	b8 11 00 00 00       	mov    $0x11,%eax
    b990:	2b 45 f4             	sub    -0xc(%ebp),%eax
    b993:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b996:	dd 04 d5 80 14 01 00 	fldl   0x11480(,%edx,8)
    b99d:	dc 4d d8             	fmull  -0x28(%ebp)
    b9a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
    b9a3:	dd 04 d5 c0 14 01 00 	fldl   0x114c0(,%edx,8)
    b9aa:	dc 4d d0             	fmull  -0x30(%ebp)
    b9ad:	de e9                	fsubrp %st,%st(1)
    b9af:	dd 1c c1             	fstpl  (%ecx,%eax,8)
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
    b9b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    b9b5:	8d 50 01             	lea    0x1(%eax),%edx
    b9b8:	89 d0                	mov    %edx,%eax
    b9ba:	c1 e0 03             	shl    $0x3,%eax
    b9bd:	01 d0                	add    %edx,%eax
    b9bf:	c1 e0 04             	shl    $0x4,%eax
    b9c2:	89 c2                	mov    %eax,%edx
    b9c4:	8b 45 0c             	mov    0xc(%ebp),%eax
    b9c7:	01 c2                	add    %eax,%edx
    b9c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b9cc:	dd 04 c5 80 14 01 00 	fldl   0x11480(,%eax,8)
    b9d3:	dc 4d d0             	fmull  -0x30(%ebp)
    b9d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b9d9:	dd 04 c5 c0 14 01 00 	fldl   0x114c0(,%eax,8)
    b9e0:	dc 4d d8             	fmull  -0x28(%ebp)
    b9e3:	de c1                	faddp  %st,%st(1)
    b9e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    b9e8:	dd 1c c2             	fstpl  (%edx,%eax,8)

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
      for(ss=0;ss<8;ss++) {
    b9eb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    b9ef:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
    b9f3:	0f 8e 3b ff ff ff    	jle    b934 <III_antialias+0x13d>
      sblim = SBLIMIT-1;

   /* 31 alias-reduction operations between each pair of sub-bands */
   /* with 8 butterflies between each pair                         */

   for(sb=0;sb<sblim;sb++)
    b9f9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    b9fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    ba00:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    ba03:	0f 8c 1f ff ff ff    	jl     b928 <III_antialias+0x131>
         bu = xr[sb][17-ss];
         bd = xr[sb+1][ss];
         hybridIn[sb][17-ss] = (bu * cs[ss]) - (bd * ca[ss]);
         hybridIn[sb+1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
         }
}
    ba09:	c9                   	leave  
    ba0a:	c3                   	ret    

0000ba0b <inv_mdct>:


void inv_mdct(double in[18], double out[36], int block_type)
{
    ba0b:	55                   	push   %ebp
    ba0c:	89 e5                	mov    %esp,%ebp
    ba0e:	81 ec a8 00 00 00    	sub    $0xa8,%esp
	double  tmp[12],sum;
	static  double  win[4][36];
	static  int init=0;
	static  double COS[4*36];

    if(init==0){
    ba14:	a1 00 15 01 00       	mov    0x11500,%eax
    ba19:	85 c0                	test   %eax,%eax
    ba1b:	0f 85 59 02 00 00    	jne    bc7a <inv_mdct+0x26f>

    /* type 0 */
      for(i=0;i<36;i++)
    ba21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ba28:	eb 29                	jmp    ba53 <inv_mdct+0x48>
         win[0][i] = sin( PI/36 *(i+0.5) );
    ba2a:	db 45 f4             	fildl  -0xc(%ebp)
    ba2d:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    ba33:	de c1                	faddp  %st,%st(1)
    ba35:	dd 05 f8 f4 00 00    	fldl   0xf4f8
    ba3b:	de c9                	fmulp  %st,%st(1)
    ba3d:	dd 1c 24             	fstpl  (%esp)
    ba40:	e8 53 a8 ff ff       	call   6298 <sin>
    ba45:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ba48:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
	static  double COS[4*36];

    if(init==0){

    /* type 0 */
      for(i=0;i<36;i++)
    ba4f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ba53:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    ba57:	7e d1                	jle    ba2a <inv_mdct+0x1f>
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ba59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    ba60:	eb 2c                	jmp    ba8e <inv_mdct+0x83>
         win[1][i] = sin( PI/36 *(i+0.5) );
    ba62:	db 45 f4             	fildl  -0xc(%ebp)
    ba65:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    ba6b:	de c1                	faddp  %st,%st(1)
    ba6d:	dd 05 f8 f4 00 00    	fldl   0xf4f8
    ba73:	de c9                	fmulp  %st,%st(1)
    ba75:	dd 1c 24             	fstpl  (%esp)
    ba78:	e8 1b a8 ff ff       	call   6298 <sin>
    ba7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    ba80:	83 c0 24             	add    $0x24,%eax
    ba83:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
    /* type 0 */
      for(i=0;i<36;i++)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
    ba8a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    ba8e:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    ba92:	7e ce                	jle    ba62 <inv_mdct+0x57>
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    ba94:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    ba9b:	eb 13                	jmp    bab0 <inv_mdct+0xa5>
         win[1][i] = 1.0;
    ba9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    baa0:	83 c0 24             	add    $0x24,%eax
    baa3:	d9 e8                	fld1   
    baa5:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[0][i] = sin( PI/36 *(i+0.5) );

    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
    baac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bab0:	83 7d f4 17          	cmpl   $0x17,-0xc(%ebp)
    bab4:	7e e7                	jle    ba9d <inv_mdct+0x92>
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    bab6:	c7 45 f4 18 00 00 00 	movl   $0x18,-0xc(%ebp)
    babd:	eb 34                	jmp    baf3 <inv_mdct+0xe8>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
    babf:	db 45 f4             	fildl  -0xc(%ebp)
    bac2:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    bac8:	de c1                	faddp  %st,%st(1)
    baca:	dd 05 00 f5 00 00    	fldl   0xf500
    bad0:	de e9                	fsubrp %st,%st(1)
    bad2:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    bad8:	de c9                	fmulp  %st,%st(1)
    bada:	dd 1c 24             	fstpl  (%esp)
    badd:	e8 b6 a7 ff ff       	call   6298 <sin>
    bae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bae5:	83 c0 24             	add    $0x24,%eax
    bae8:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
    /* type 1*/
      for(i=0;i<18;i++)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
    baef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    baf3:	83 7d f4 1d          	cmpl   $0x1d,-0xc(%ebp)
    baf7:	7e c6                	jle    babf <inv_mdct+0xb4>
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    baf9:	c7 45 f4 1e 00 00 00 	movl   $0x1e,-0xc(%ebp)
    bb00:	eb 13                	jmp    bb15 <inv_mdct+0x10a>
         win[1][i] = 0.0;
    bb02:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bb05:	83 c0 24             	add    $0x24,%eax
    bb08:	d9 ee                	fldz   
    bb0a:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[1][i] = sin( PI/36 *(i+0.5) );
      for(i=18;i<24;i++)
         win[1][i] = 1.0;
      for(i=24;i<30;i++)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
    bb11:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bb15:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    bb19:	7e e7                	jle    bb02 <inv_mdct+0xf7>
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    bb1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bb22:	eb 13                	jmp    bb37 <inv_mdct+0x12c>
         win[3][i] = 0.0;
    bb24:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bb27:	83 c0 6c             	add    $0x6c,%eax
    bb2a:	d9 ee                	fldz   
    bb2c:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[1][i] = sin( PI/12 *(i+0.5-18) );
      for(i=30;i<36;i++)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
    bb33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bb37:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
    bb3b:	7e e7                	jle    bb24 <inv_mdct+0x119>
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    bb3d:	c7 45 f4 06 00 00 00 	movl   $0x6,-0xc(%ebp)
    bb44:	eb 34                	jmp    bb7a <inv_mdct+0x16f>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
    bb46:	db 45 f4             	fildl  -0xc(%ebp)
    bb49:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    bb4f:	de c1                	faddp  %st,%st(1)
    bb51:	dd 05 08 f5 00 00    	fldl   0xf508
    bb57:	de e9                	fsubrp %st,%st(1)
    bb59:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    bb5f:	de c9                	fmulp  %st,%st(1)
    bb61:	dd 1c 24             	fstpl  (%esp)
    bb64:	e8 2f a7 ff ff       	call   6298 <sin>
    bb69:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bb6c:	83 c0 6c             	add    $0x6c,%eax
    bb6f:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[1][i] = 0.0;

    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
    bb76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bb7a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    bb7e:	7e c6                	jle    bb46 <inv_mdct+0x13b>
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    bb80:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    bb87:	eb 13                	jmp    bb9c <inv_mdct+0x191>
         win[3][i] =1.0;
    bb89:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bb8c:	83 c0 6c             	add    $0x6c,%eax
    bb8f:	d9 e8                	fld1   
    bb91:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
    /* type 3*/
      for(i=0;i<6;i++)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
    bb98:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bb9c:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    bba0:	7e e7                	jle    bb89 <inv_mdct+0x17e>
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    bba2:	c7 45 f4 12 00 00 00 	movl   $0x12,-0xc(%ebp)
    bba9:	eb 2c                	jmp    bbd7 <inv_mdct+0x1cc>
         win[3][i] = sin( PI/36*(i+0.5) );
    bbab:	db 45 f4             	fildl  -0xc(%ebp)
    bbae:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    bbb4:	de c1                	faddp  %st,%st(1)
    bbb6:	dd 05 f8 f4 00 00    	fldl   0xf4f8
    bbbc:	de c9                	fmulp  %st,%st(1)
    bbbe:	dd 1c 24             	fstpl  (%esp)
    bbc1:	e8 d2 a6 ff ff       	call   6298 <sin>
    bbc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bbc9:	83 c0 6c             	add    $0x6c,%eax
    bbcc:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[3][i] = 0.0;
      for(i=6;i<12;i++)
         win[3][i] = sin( PI/12 *(i+0.5-6) );
      for(i=12;i<18;i++)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
    bbd3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bbd7:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    bbdb:	7e ce                	jle    bbab <inv_mdct+0x1a0>
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    bbdd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bbe4:	eb 2c                	jmp    bc12 <inv_mdct+0x207>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
    bbe6:	db 45 f4             	fildl  -0xc(%ebp)
    bbe9:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    bbef:	de c1                	faddp  %st,%st(1)
    bbf1:	dd 05 e0 f4 00 00    	fldl   0xf4e0
    bbf7:	de c9                	fmulp  %st,%st(1)
    bbf9:	dd 1c 24             	fstpl  (%esp)
    bbfc:	e8 97 a6 ff ff       	call   6298 <sin>
    bc01:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc04:	83 c0 48             	add    $0x48,%eax
    bc07:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[3][i] =1.0;
      for(i=18;i<36;i++)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
    bc0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bc12:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    bc16:	7e ce                	jle    bbe6 <inv_mdct+0x1db>
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    bc18:	c7 45 f4 0c 00 00 00 	movl   $0xc,-0xc(%ebp)
    bc1f:	eb 13                	jmp    bc34 <inv_mdct+0x229>
         win[2][i] = 0.0 ;
    bc21:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc24:	83 c0 48             	add    $0x48,%eax
    bc27:	d9 ee                	fldz   
    bc29:	dd 1c c5 20 15 01 00 	fstpl  0x11520(,%eax,8)
         win[3][i] = sin( PI/36*(i+0.5) );

    /* type 2*/
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
    bc30:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bc34:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    bc38:	7e e7                	jle    bc21 <inv_mdct+0x216>
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    bc3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bc41:	eb 21                	jmp    bc64 <inv_mdct+0x259>
         COS[i] = cos(PI/(2*36) * i);
    bc43:	db 45 f4             	fildl  -0xc(%ebp)
    bc46:	dd 05 10 f5 00 00    	fldl   0xf510
    bc4c:	de c9                	fmulp  %st,%st(1)
    bc4e:	dd 1c 24             	fstpl  (%esp)
    bc51:	e8 e1 a6 ff ff       	call   6337 <cos>
    bc56:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc59:	dd 1c c5 a0 19 01 00 	fstpl  0x119a0(,%eax,8)
      for(i=0;i<12;i++)
         win[2][i] = sin( PI/12*(i+0.5) ) ;
      for(i=12;i<36;i++)
         win[2][i] = 0.0 ;

      for (i=0; i<4*36; i++)
    bc60:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bc64:	81 7d f4 8f 00 00 00 	cmpl   $0x8f,-0xc(%ebp)
    bc6b:	7e d6                	jle    bc43 <inv_mdct+0x238>
         COS[i] = cos(PI/(2*36) * i);

      init++;
    bc6d:	a1 00 15 01 00       	mov    0x11500,%eax
    bc72:	83 c0 01             	add    $0x1,%eax
    bc75:	a3 00 15 01 00       	mov    %eax,0x11500
    }

    for(i=0;i<36;i++)
    bc7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bc81:	eb 17                	jmp    bc9a <inv_mdct+0x28f>
       out[i]=0;
    bc83:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bc86:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bc8d:	8b 45 0c             	mov    0xc(%ebp),%eax
    bc90:	01 d0                	add    %edx,%eax
    bc92:	d9 ee                	fldz   
    bc94:	dd 18                	fstpl  (%eax)
         COS[i] = cos(PI/(2*36) * i);

      init++;
    }

    for(i=0;i<36;i++)
    bc96:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    bc9a:	83 7d f4 23          	cmpl   $0x23,-0xc(%ebp)
    bc9e:	7e e3                	jle    bc83 <inv_mdct+0x278>
       out[i]=0;

    if(block_type == 2){
    bca0:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
    bca4:	0f 85 85 01 00 00    	jne    be2f <inv_mdct+0x424>
       N=12;
    bcaa:	c7 45 dc 0c 00 00 00 	movl   $0xc,-0x24(%ebp)
       for(i=0;i<3;i++){
    bcb1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bcb8:	e9 63 01 00 00       	jmp    be20 <inv_mdct+0x415>
          for(p= 0;p<N;p++){
    bcbd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bcc4:	e9 df 00 00 00       	jmp    bda8 <inv_mdct+0x39d>
             sum = 0.0;
    bcc9:	d9 ee                	fldz   
    bccb:	dd 5d e0             	fstpl  -0x20(%ebp)
             for(m=0;m<N/2;m++)
    bcce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    bcd5:	e9 8f 00 00 00       	jmp    bd69 <inv_mdct+0x35e>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
    bcda:	8b 55 f0             	mov    -0x10(%ebp),%edx
    bcdd:	89 d0                	mov    %edx,%eax
    bcdf:	01 c0                	add    %eax,%eax
    bce1:	01 c2                	add    %eax,%edx
    bce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bce6:	01 d0                	add    %edx,%eax
    bce8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bcef:	8b 45 08             	mov    0x8(%ebp),%eax
    bcf2:	01 d0                	add    %edx,%eax
    bcf4:	dd 00                	fldl   (%eax)
    bcf6:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
    bcfc:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bcff:	01 c0                	add    %eax,%eax
    bd01:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    bd07:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    bd0d:	dd 05 18 f5 00 00    	fldl   0xf518
    bd13:	de f1                	fdivp  %st,%st(1)
    bd15:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bd18:	01 c0                	add    %eax,%eax
    bd1a:	8d 50 01             	lea    0x1(%eax),%edx
    bd1d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bd20:	89 c1                	mov    %eax,%ecx
    bd22:	c1 e9 1f             	shr    $0x1f,%ecx
    bd25:	01 c8                	add    %ecx,%eax
    bd27:	d1 f8                	sar    %eax
    bd29:	01 d0                	add    %edx,%eax
    bd2b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    bd31:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    bd37:	de c9                	fmulp  %st,%st(1)
    bd39:	8b 45 f0             	mov    -0x10(%ebp),%eax
    bd3c:	01 c0                	add    %eax,%eax
    bd3e:	83 c0 01             	add    $0x1,%eax
    bd41:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
    bd47:	db 85 74 ff ff ff    	fildl  -0x8c(%ebp)
    bd4d:	de c9                	fmulp  %st,%st(1)
    bd4f:	dd 1c 24             	fstpl  (%esp)
    bd52:	e8 e0 a5 ff ff       	call   6337 <cos>
    bd57:	dc 8d 68 ff ff ff    	fmull  -0x98(%ebp)
    bd5d:	dd 45 e0             	fldl   -0x20(%ebp)
    bd60:	de c1                	faddp  %st,%st(1)
    bd62:	dd 5d e0             	fstpl  -0x20(%ebp)
    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
             sum = 0.0;
             for(m=0;m<N/2;m++)
    bd65:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bd69:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bd6c:	89 c2                	mov    %eax,%edx
    bd6e:	c1 ea 1f             	shr    $0x1f,%edx
    bd71:	01 d0                	add    %edx,%eax
    bd73:	d1 f8                	sar    %eax
    bd75:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    bd78:	0f 8f 5c ff ff ff    	jg     bcda <inv_mdct+0x2cf>
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
    bd7e:	8b 55 10             	mov    0x10(%ebp),%edx
    bd81:	89 d0                	mov    %edx,%eax
    bd83:	c1 e0 03             	shl    $0x3,%eax
    bd86:	01 d0                	add    %edx,%eax
    bd88:	c1 e0 02             	shl    $0x2,%eax
    bd8b:	8b 55 ec             	mov    -0x14(%ebp),%edx
    bd8e:	01 d0                	add    %edx,%eax
    bd90:	dd 04 c5 20 15 01 00 	fldl   0x11520(,%eax,8)
    bd97:	dc 4d e0             	fmull  -0x20(%ebp)
    bd9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bd9d:	dd 9c c5 78 ff ff ff 	fstpl  -0x88(%ebp,%eax,8)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
          for(p= 0;p<N;p++){
    bda4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bda8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bdab:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    bdae:	0f 8c 15 ff ff ff    	jl     bcc9 <inv_mdct+0x2be>
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    bdb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bdbb:	eb 57                	jmp    be14 <inv_mdct+0x409>
             out[6*i+p+6] += tmp[p];
    bdbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
    bdc0:	89 d0                	mov    %edx,%eax
    bdc2:	01 c0                	add    %eax,%eax
    bdc4:	01 d0                	add    %edx,%eax
    bdc6:	01 c0                	add    %eax,%eax
    bdc8:	89 c2                	mov    %eax,%edx
    bdca:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bdcd:	01 d0                	add    %edx,%eax
    bdcf:	83 c0 06             	add    $0x6,%eax
    bdd2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bdd9:	8b 45 0c             	mov    0xc(%ebp),%eax
    bddc:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    bddf:	8b 55 f4             	mov    -0xc(%ebp),%edx
    bde2:	89 d0                	mov    %edx,%eax
    bde4:	01 c0                	add    %eax,%eax
    bde6:	01 d0                	add    %edx,%eax
    bde8:	01 c0                	add    %eax,%eax
    bdea:	89 c2                	mov    %eax,%edx
    bdec:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bdef:	01 d0                	add    %edx,%eax
    bdf1:	83 c0 06             	add    $0x6,%eax
    bdf4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bdfb:	8b 45 0c             	mov    0xc(%ebp),%eax
    bdfe:	01 d0                	add    %edx,%eax
    be00:	dd 00                	fldl   (%eax)
    be02:	8b 45 ec             	mov    -0x14(%ebp),%eax
    be05:	dd 84 c5 78 ff ff ff 	fldl   -0x88(%ebp,%eax,8)
    be0c:	de c1                	faddp  %st,%st(1)
    be0e:	dd 19                	fstpl  (%ecx)
             sum = 0.0;
             for(m=0;m<N/2;m++)
                sum += in[i+3*m] * cos( PI/(2*N)*(2*p+1+N/2)*(2*m+1) );
             tmp[p] = sum * win[block_type][p] ;
          }
          for(p=0;p<N;p++)
    be10:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    be14:	8b 45 ec             	mov    -0x14(%ebp),%eax
    be17:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    be1a:	7c a1                	jl     bdbd <inv_mdct+0x3b2>
    for(i=0;i<36;i++)
       out[i]=0;

    if(block_type == 2){
       N=12;
       for(i=0;i<3;i++){
    be1c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    be20:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    be24:	0f 8e 93 fe ff ff    	jle    bcbd <inv_mdct+0x2b2>
    be2a:	e9 da 00 00 00       	jmp    bf09 <inv_mdct+0x4fe>
          for(p=0;p<N;p++)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
    be2f:	c7 45 dc 24 00 00 00 	movl   $0x24,-0x24(%ebp)
      for(p= 0;p<N;p++){
    be36:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    be3d:	e9 bb 00 00 00       	jmp    befd <inv_mdct+0x4f2>
         sum = 0.0;
    be42:	d9 ee                	fldz   
    be44:	dd 5d e0             	fstpl  -0x20(%ebp)
         for(m=0;m<N/2;m++)
    be47:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    be4e:	eb 6a                	jmp    beba <inv_mdct+0x4af>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
    be50:	8b 45 f0             	mov    -0x10(%ebp),%eax
    be53:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    be5a:	8b 45 08             	mov    0x8(%ebp),%eax
    be5d:	01 d0                	add    %edx,%eax
    be5f:	dd 00                	fldl   (%eax)
    be61:	8b 45 ec             	mov    -0x14(%ebp),%eax
    be64:	01 c0                	add    %eax,%eax
    be66:	8d 50 01             	lea    0x1(%eax),%edx
    be69:	8b 45 dc             	mov    -0x24(%ebp),%eax
    be6c:	89 c1                	mov    %eax,%ecx
    be6e:	c1 e9 1f             	shr    $0x1f,%ecx
    be71:	01 c8                	add    %ecx,%eax
    be73:	d1 f8                	sar    %eax
    be75:	01 c2                	add    %eax,%edx
    be77:	8b 45 f0             	mov    -0x10(%ebp),%eax
    be7a:	01 c0                	add    %eax,%eax
    be7c:	83 c0 01             	add    $0x1,%eax
    be7f:	89 d1                	mov    %edx,%ecx
    be81:	0f af c8             	imul   %eax,%ecx
    be84:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
    be89:	89 c8                	mov    %ecx,%eax
    be8b:	f7 ea                	imul   %edx
    be8d:	c1 fa 05             	sar    $0x5,%edx
    be90:	89 c8                	mov    %ecx,%eax
    be92:	c1 f8 1f             	sar    $0x1f,%eax
    be95:	29 c2                	sub    %eax,%edx
    be97:	89 d0                	mov    %edx,%eax
    be99:	c1 e0 03             	shl    $0x3,%eax
    be9c:	01 d0                	add    %edx,%eax
    be9e:	c1 e0 04             	shl    $0x4,%eax
    bea1:	29 c1                	sub    %eax,%ecx
    bea3:	89 ca                	mov    %ecx,%edx
    bea5:	dd 04 d5 a0 19 01 00 	fldl   0x119a0(,%edx,8)
    beac:	de c9                	fmulp  %st,%st(1)
    beae:	dd 45 e0             	fldl   -0x20(%ebp)
    beb1:	de c1                	faddp  %st,%st(1)
    beb3:	dd 5d e0             	fstpl  -0x20(%ebp)
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
         sum = 0.0;
         for(m=0;m<N/2;m++)
    beb6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    beba:	8b 45 dc             	mov    -0x24(%ebp),%eax
    bebd:	89 c2                	mov    %eax,%edx
    bebf:	c1 ea 1f             	shr    $0x1f,%edx
    bec2:	01 d0                	add    %edx,%eax
    bec4:	d1 f8                	sar    %eax
    bec6:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    bec9:	7f 85                	jg     be50 <inv_mdct+0x445>
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
    becb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bece:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bed5:	8b 45 0c             	mov    0xc(%ebp),%eax
    bed8:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    bedb:	8b 55 10             	mov    0x10(%ebp),%edx
    bede:	89 d0                	mov    %edx,%eax
    bee0:	c1 e0 03             	shl    $0x3,%eax
    bee3:	01 d0                	add    %edx,%eax
    bee5:	c1 e0 02             	shl    $0x2,%eax
    bee8:	8b 55 ec             	mov    -0x14(%ebp),%edx
    beeb:	01 d0                	add    %edx,%eax
    beed:	dd 04 c5 20 15 01 00 	fldl   0x11520(,%eax,8)
    bef4:	dc 4d e0             	fmull  -0x20(%ebp)
    bef7:	dd 19                	fstpl  (%ecx)
             out[6*i+p+6] += tmp[p];
       }
    }
    else{
      N=36;
      for(p= 0;p<N;p++){
    bef9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    befd:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bf00:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    bf03:	0f 8c 39 ff ff ff    	jl     be42 <inv_mdct+0x437>
         for(m=0;m<N/2;m++)
           sum += in[m] * COS[((2*p+1+N/2)*(2*m+1))%(4*36)];
         out[p] = sum * win[block_type][p];
      }
    }
}
    bf09:	c9                   	leave  
    bf0a:	c3                   	ret    

0000bf0b <III_hybrid>:


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    bf0b:	55                   	push   %ebp
    bf0c:	89 e5                	mov    %esp,%ebp
    bf0e:	53                   	push   %ebx
    bf0f:	81 ec 54 01 00 00    	sub    $0x154,%esp
   double rawout[36];
   static double prevblck[2][SBLIMIT][SSLIMIT];
   static int init = 1;
   int bt;

   if (init) {
    bf15:	a1 04 14 01 00       	mov    0x11404,%eax
    bf1a:	85 c0                	test   %eax,%eax
    bf1c:	74 6f                	je     bf8d <III_hybrid+0x82>
      int i,j,k;

      for(i=0;i<2;i++)
    bf1e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    bf25:	eb 56                	jmp    bf7d <III_hybrid+0x72>
         for(j=0;j<SBLIMIT;j++)
    bf27:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    bf2e:	eb 43                	jmp    bf73 <III_hybrid+0x68>
            for(k=0;k<SSLIMIT;k++)
    bf30:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    bf37:	eb 30                	jmp    bf69 <III_hybrid+0x5e>
               prevblck[i][j][k]=0.0;
    bf39:	8b 45 ec             	mov    -0x14(%ebp),%eax
    bf3c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    bf3f:	89 c2                	mov    %eax,%edx
    bf41:	c1 e2 03             	shl    $0x3,%edx
    bf44:	01 c2                	add    %eax,%edx
    bf46:	8d 04 12             	lea    (%edx,%edx,1),%eax
    bf49:	89 c2                	mov    %eax,%edx
    bf4b:	89 c8                	mov    %ecx,%eax
    bf4d:	c1 e0 03             	shl    $0x3,%eax
    bf50:	01 c8                	add    %ecx,%eax
    bf52:	c1 e0 06             	shl    $0x6,%eax
    bf55:	01 c2                	add    %eax,%edx
    bf57:	8b 45 e8             	mov    -0x18(%ebp),%eax
    bf5a:	01 d0                	add    %edx,%eax
    bf5c:	d9 ee                	fldz   
    bf5e:	dd 1c c5 20 1e 01 00 	fstpl  0x11e20(,%eax,8)
   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
    bf65:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    bf69:	83 7d e8 11          	cmpl   $0x11,-0x18(%ebp)
    bf6d:	7e ca                	jle    bf39 <III_hybrid+0x2e>

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
         for(j=0;j<SBLIMIT;j++)
    bf6f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    bf73:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%ebp)
    bf77:	7e b7                	jle    bf30 <III_hybrid+0x25>
   int bt;

   if (init) {
      int i,j,k;

      for(i=0;i<2;i++)
    bf79:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    bf7d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    bf81:	7e a4                	jle    bf27 <III_hybrid+0x1c>
         for(j=0;j<SBLIMIT;j++)
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
    bf83:	c7 05 04 14 01 00 00 	movl   $0x0,0x11404
    bf8a:	00 00 00 
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bf8d:	8b 45 18             	mov    0x18(%ebp),%eax
    bf90:	8b 40 10             	mov    0x10(%eax),%eax
    bf93:	85 c0                	test   %eax,%eax
    bf95:	74 10                	je     bfa7 <III_hybrid+0x9c>
    bf97:	8b 45 18             	mov    0x18(%ebp),%eax
    bf9a:	8b 40 18             	mov    0x18(%eax),%eax
    bf9d:	85 c0                	test   %eax,%eax
    bf9f:	74 06                	je     bfa7 <III_hybrid+0x9c>
    bfa1:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
    bfa5:	7e 08                	jle    bfaf <III_hybrid+0xa4>
          (sb < 2)) ? 0 : gr_info->block_type;
    bfa7:	8b 45 18             	mov    0x18(%ebp),%eax
    bfaa:	8b 40 14             	mov    0x14(%eax),%eax
            for(k=0;k<SSLIMIT;k++)
               prevblck[i][j][k]=0.0;
      init = 0;
   }

   bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
    bfad:	eb 05                	jmp    bfb4 <III_hybrid+0xa9>
    bfaf:	b8 00 00 00 00       	mov    $0x0,%eax
    bfb4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);
    bfb7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    bfba:	89 44 24 08          	mov    %eax,0x8(%esp)
    bfbe:	8d 85 c0 fe ff ff    	lea    -0x140(%ebp),%eax
    bfc4:	89 44 24 04          	mov    %eax,0x4(%esp)
    bfc8:	8b 45 08             	mov    0x8(%ebp),%eax
    bfcb:	89 04 24             	mov    %eax,(%esp)
    bfce:	e8 38 fa ff ff       	call   ba0b <inv_mdct>

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    bfd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    bfda:	e9 83 00 00 00       	jmp    c062 <III_hybrid+0x157>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
    bfdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bfe2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    bfe9:	8b 45 0c             	mov    0xc(%ebp),%eax
    bfec:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
    bfef:	8b 45 f4             	mov    -0xc(%ebp),%eax
    bff2:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    bff9:	8b 45 10             	mov    0x10(%ebp),%eax
    bffc:	8b 4d 14             	mov    0x14(%ebp),%ecx
    bfff:	89 c2                	mov    %eax,%edx
    c001:	c1 e2 03             	shl    $0x3,%edx
    c004:	01 c2                	add    %eax,%edx
    c006:	8d 04 12             	lea    (%edx,%edx,1),%eax
    c009:	89 c2                	mov    %eax,%edx
    c00b:	89 c8                	mov    %ecx,%eax
    c00d:	c1 e0 03             	shl    $0x3,%eax
    c010:	01 c8                	add    %ecx,%eax
    c012:	c1 e0 06             	shl    $0x6,%eax
    c015:	01 c2                	add    %eax,%edx
    c017:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c01a:	01 d0                	add    %edx,%eax
    c01c:	dd 04 c5 20 1e 01 00 	fldl   0x11e20(,%eax,8)
    c023:	de c1                	faddp  %st,%st(1)
    c025:	dd 1b                	fstpl  (%ebx)
      prevblck[ch][sb][ss] = rawout[ss+18];
    c027:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c02a:	83 c0 12             	add    $0x12,%eax
    c02d:	dd 84 c5 c0 fe ff ff 	fldl   -0x140(%ebp,%eax,8)
    c034:	8b 45 10             	mov    0x10(%ebp),%eax
    c037:	8b 4d 14             	mov    0x14(%ebp),%ecx
    c03a:	89 c2                	mov    %eax,%edx
    c03c:	c1 e2 03             	shl    $0x3,%edx
    c03f:	01 c2                	add    %eax,%edx
    c041:	8d 04 12             	lea    (%edx,%edx,1),%eax
    c044:	89 c2                	mov    %eax,%edx
    c046:	89 c8                	mov    %ecx,%eax
    c048:	c1 e0 03             	shl    $0x3,%eax
    c04b:	01 c8                	add    %ecx,%eax
    c04d:	c1 e0 06             	shl    $0x6,%eax
    c050:	01 c2                	add    %eax,%edx
    c052:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c055:	01 d0                	add    %edx,%eax
    c057:	dd 1c c5 20 1e 01 00 	fstpl  0x11e20(,%eax,8)
          (sb < 2)) ? 0 : gr_info->block_type;

   inv_mdct( fsIn, rawout, bt);

   /* overlap addition */
   for(ss=0; ss<SSLIMIT; ss++) {
    c05e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    c062:	83 7d f4 11          	cmpl   $0x11,-0xc(%ebp)
    c066:	0f 8e 73 ff ff ff    	jle    bfdf <III_hybrid+0xd4>
      tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
      prevblck[ch][sb][ss] = rawout[ss+18];
   }
}
    c06c:	81 c4 54 01 00 00    	add    $0x154,%esp
    c072:	5b                   	pop    %ebx
    c073:	5d                   	pop    %ebp
    c074:	c3                   	ret    

0000c075 <create_syn_filter>:


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    c075:	55                   	push   %ebp
    c076:	89 e5                	mov    %esp,%ebp
    c078:	57                   	push   %edi
    c079:	56                   	push   %esi
    c07a:	53                   	push   %ebx
    c07b:	83 ec 1c             	sub    $0x1c,%esp
	register int i,k;

	for (i=0; i<64; i++)
    c07e:	be 00 00 00 00       	mov    $0x0,%esi
    c083:	e9 1c 01 00 00       	jmp    c1a4 <create_syn_filter+0x12f>
		for (k=0; k<32; k++) {
    c088:	bb 00 00 00 00       	mov    $0x0,%ebx
    c08d:	e9 06 01 00 00       	jmp    c198 <create_syn_filter+0x123>
			if ((filter[i][k] = 1e9*cos((double)((PI64*i+PI4)*(2*k+1)))) >= 0)
    c092:	89 f0                	mov    %esi,%eax
    c094:	c1 e0 08             	shl    $0x8,%eax
    c097:	89 c2                	mov    %eax,%edx
    c099:	8b 45 08             	mov    0x8(%ebp),%eax
    c09c:	8d 3c 02             	lea    (%edx,%eax,1),%edi
    c09f:	89 75 e0             	mov    %esi,-0x20(%ebp)
    c0a2:	db 45 e0             	fildl  -0x20(%ebp)
    c0a5:	dd 05 20 f5 00 00    	fldl   0xf520
    c0ab:	de c9                	fmulp  %st,%st(1)
    c0ad:	dd 05 28 f5 00 00    	fldl   0xf528
    c0b3:	de c1                	faddp  %st,%st(1)
    c0b5:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
    c0b8:	83 c0 01             	add    $0x1,%eax
    c0bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
    c0be:	db 45 e0             	fildl  -0x20(%ebp)
    c0c1:	de c9                	fmulp  %st,%st(1)
    c0c3:	dd 1c 24             	fstpl  (%esp)
    c0c6:	e8 6c a2 ff ff       	call   6337 <cos>
    c0cb:	dd 05 30 f5 00 00    	fldl   0xf530
    c0d1:	de c9                	fmulp  %st,%st(1)
    c0d3:	dd 1c df             	fstpl  (%edi,%ebx,8)
    c0d6:	dd 04 df             	fldl   (%edi,%ebx,8)
    c0d9:	d9 ee                	fldz   
    c0db:	d9 c9                	fxch   %st(1)
    c0dd:	df e9                	fucomip %st(1),%st
    c0df:	dd d8                	fstp   %st(0)
    c0e1:	72 47                	jb     c12a <create_syn_filter+0xb5>
				filter[i][k] = (int)(filter[i][k]+0.5);
    c0e3:	89 f0                	mov    %esi,%eax
    c0e5:	c1 e0 08             	shl    $0x8,%eax
    c0e8:	89 c2                	mov    %eax,%edx
    c0ea:	8b 45 08             	mov    0x8(%ebp),%eax
    c0ed:	01 c2                	add    %eax,%edx
    c0ef:	89 f0                	mov    %esi,%eax
    c0f1:	c1 e0 08             	shl    $0x8,%eax
    c0f4:	89 c1                	mov    %eax,%ecx
    c0f6:	8b 45 08             	mov    0x8(%ebp),%eax
    c0f9:	01 c8                	add    %ecx,%eax
    c0fb:	dd 04 d8             	fldl   (%eax,%ebx,8)
    c0fe:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    c104:	de c1                	faddp  %st,%st(1)
    c106:	d9 7d e6             	fnstcw -0x1a(%ebp)
    c109:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    c10d:	b4 0c                	mov    $0xc,%ah
    c10f:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    c113:	d9 6d e4             	fldcw  -0x1c(%ebp)
    c116:	db 5d e0             	fistpl -0x20(%ebp)
    c119:	d9 6d e6             	fldcw  -0x1a(%ebp)
    c11c:	8b 45 e0             	mov    -0x20(%ebp),%eax
    c11f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    c122:	db 45 e0             	fildl  -0x20(%ebp)
    c125:	dd 1c da             	fstpl  (%edx,%ebx,8)
    c128:	eb 45                	jmp    c16f <create_syn_filter+0xfa>
				//modf(filter[i][k]+0.5, &filter[i][k]);
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
    c12a:	89 f0                	mov    %esi,%eax
    c12c:	c1 e0 08             	shl    $0x8,%eax
    c12f:	89 c2                	mov    %eax,%edx
    c131:	8b 45 08             	mov    0x8(%ebp),%eax
    c134:	01 c2                	add    %eax,%edx
    c136:	89 f0                	mov    %esi,%eax
    c138:	c1 e0 08             	shl    $0x8,%eax
    c13b:	89 c1                	mov    %eax,%ecx
    c13d:	8b 45 08             	mov    0x8(%ebp),%eax
    c140:	01 c8                	add    %ecx,%eax
    c142:	dd 04 d8             	fldl   (%eax,%ebx,8)
    c145:	dd 05 f0 f4 00 00    	fldl   0xf4f0
    c14b:	de e9                	fsubrp %st,%st(1)
    c14d:	d9 7d e6             	fnstcw -0x1a(%ebp)
    c150:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
    c154:	b4 0c                	mov    $0xc,%ah
    c156:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
    c15a:	d9 6d e4             	fldcw  -0x1c(%ebp)
    c15d:	db 5d e0             	fistpl -0x20(%ebp)
    c160:	d9 6d e6             	fldcw  -0x1a(%ebp)
    c163:	8b 45 e0             	mov    -0x20(%ebp),%eax
    c166:	89 45 e0             	mov    %eax,-0x20(%ebp)
    c169:	db 45 e0             	fildl  -0x20(%ebp)
    c16c:	dd 1c da             	fstpl  (%edx,%ebx,8)
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
    c16f:	89 f0                	mov    %esi,%eax
    c171:	c1 e0 08             	shl    $0x8,%eax
    c174:	89 c2                	mov    %eax,%edx
    c176:	8b 45 08             	mov    0x8(%ebp),%eax
    c179:	01 d0                	add    %edx,%eax
    c17b:	89 f2                	mov    %esi,%edx
    c17d:	89 d1                	mov    %edx,%ecx
    c17f:	c1 e1 08             	shl    $0x8,%ecx
    c182:	8b 55 08             	mov    0x8(%ebp),%edx
    c185:	01 ca                	add    %ecx,%edx
    c187:	dd 04 da             	fldl   (%edx,%ebx,8)
    c18a:	dd 05 38 f5 00 00    	fldl   0xf538
    c190:	de c9                	fmulp  %st,%st(1)
    c192:	dd 1c d8             	fstpl  (%eax,%ebx,8)
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
		for (k=0; k<32; k++) {
    c195:	83 c3 01             	add    $0x1,%ebx
    c198:	83 fb 1f             	cmp    $0x1f,%ebx
    c19b:	0f 8e f1 fe ff ff    	jle    c092 <create_syn_filter+0x1d>
/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
	register int i,k;

	for (i=0; i<64; i++)
    c1a1:	83 c6 01             	add    $0x1,%esi
    c1a4:	83 fe 3f             	cmp    $0x3f,%esi
    c1a7:	0f 8e db fe ff ff    	jle    c088 <create_syn_filter+0x13>
			else
				filter[i][k] = (int)(filter[i][k]-0.5);
				//modf(filter[i][k]-0.5, &filter[i][k]);
			filter[i][k] *= 1e-9;
		}
}
    c1ad:	83 c4 1c             	add    $0x1c,%esp
    c1b0:	5b                   	pop    %ebx
    c1b1:	5e                   	pop    %esi
    c1b2:	5f                   	pop    %edi
    c1b3:	5d                   	pop    %ebp
    c1b4:	c3                   	ret    

0000c1b5 <read_syn_window>:



/* read in synthesis window */
void read_syn_window(double window[HAN_SIZE])
{
    c1b5:	55                   	push   %ebp
    c1b6:	89 e5                	mov    %esp,%ebp
    c1b8:	57                   	push   %edi
    c1b9:	56                   	push   %esi
    c1ba:	53                   	push   %ebx
    c1bb:	81 ec 14 10 00 00    	sub    $0x1014,%esp
	double gb_window[HAN_SIZE] = {0.0000000000, -0.0000152590, -0.0000152590, -0.0000152590,
    c1c1:	8d 95 e8 ef ff ff    	lea    -0x1018(%ebp),%edx
    c1c7:	bb a0 e4 00 00       	mov    $0xe4a0,%ebx
    c1cc:	b8 00 04 00 00       	mov    $0x400,%eax
    c1d1:	89 d7                	mov    %edx,%edi
    c1d3:	89 de                	mov    %ebx,%esi
    c1d5:	89 c1                	mov    %eax,%ecx
    c1d7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
		0.0000762940, 0.0000762940, 0.0000610350, 0.0000610350,
		0.0000457760, 0.0000457760, 0.0000305180, 0.0000305180,
		0.0000305180, 0.0000305180, 0.0000152590, 0.0000152590,
		0.0000152590, 0.0000152590, 0.0000152590, 0.0000152590,
	};
	window = gb_window;
    c1d9:	8d 85 e8 ef ff ff    	lea    -0x1018(%ebp),%eax
    c1df:	89 45 ec             	mov    %eax,-0x14(%ebp)
}
    c1e2:	81 c4 14 10 00 00    	add    $0x1014,%esp
    c1e8:	5b                   	pop    %ebx
    c1e9:	5e                   	pop    %esi
    c1ea:	5f                   	pop    %edi
    c1eb:	5d                   	pop    %ebp
    c1ec:	c3                   	ret    

0000c1ed <SubBandSynthesis>:

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    c1ed:	55                   	push   %ebp
    c1ee:	89 e5                	mov    %esp,%ebp
    c1f0:	57                   	push   %edi
    c1f1:	56                   	push   %esi
    c1f2:	53                   	push   %ebx
    c1f3:	83 ec 2c             	sub    $0x2c,%esp
	static NN *filter;
	typedef double BB[2][2*HAN_SIZE];
	static BB *buf;
	static int bufOffset[2] = {64,64};
	static double *window;
	int clip = 0;               /* count & return how many samples clipped */
    c1f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

	if (init) {
    c1fd:	a1 08 14 01 00       	mov    0x11408,%eax
    c202:	85 c0                	test   %eax,%eax
    c204:	74 6f                	je     c275 <SubBandSynthesis+0x88>
		buf = (BB *) mem_alloc(sizeof(BB),"BB");
    c206:	c7 44 24 04 a0 f4 00 	movl   $0xf4a0,0x4(%esp)
    c20d:	00 
    c20e:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    c215:	e8 15 a8 ff ff       	call   6a2f <mem_alloc>
    c21a:	a3 20 42 01 00       	mov    %eax,0x14220
		filter = (NN *) mem_alloc(sizeof(NN), "NN");
    c21f:	c7 44 24 04 a3 f4 00 	movl   $0xf4a3,0x4(%esp)
    c226:	00 
    c227:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
    c22e:	e8 fc a7 ff ff       	call   6a2f <mem_alloc>
    c233:	a3 24 42 01 00       	mov    %eax,0x14224
		create_syn_filter(*filter);
    c238:	a1 24 42 01 00       	mov    0x14224,%eax
    c23d:	89 04 24             	mov    %eax,(%esp)
    c240:	e8 30 fe ff ff       	call   c075 <create_syn_filter>
		window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
    c245:	c7 44 24 04 a6 f4 00 	movl   $0xf4a6,0x4(%esp)
    c24c:	00 
    c24d:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    c254:	e8 d6 a7 ff ff       	call   6a2f <mem_alloc>
    c259:	a3 28 42 01 00       	mov    %eax,0x14228
		read_syn_window(window);
    c25e:	a1 28 42 01 00       	mov    0x14228,%eax
    c263:	89 04 24             	mov    %eax,(%esp)
    c266:	e8 4a ff ff ff       	call   c1b5 <read_syn_window>
		init = 0;
    c26b:	c7 05 08 14 01 00 00 	movl   $0x0,0x11408
    c272:	00 00 00 
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    c275:	8b 45 0c             	mov    0xc(%ebp),%eax
    c278:	8b 04 85 0c 14 01 00 	mov    0x1140c(,%eax,4),%eax
    c27f:	83 e8 40             	sub    $0x40,%eax
    c282:	25 ff 03 00 00       	and    $0x3ff,%eax
    c287:	89 c2                	mov    %eax,%edx
    c289:	8b 45 0c             	mov    0xc(%ebp),%eax
    c28c:	89 14 85 0c 14 01 00 	mov    %edx,0x1140c(,%eax,4)
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);
    c293:	8b 15 20 42 01 00    	mov    0x14220,%edx
    c299:	8b 45 0c             	mov    0xc(%ebp),%eax
    c29c:	8b 04 85 0c 14 01 00 	mov    0x1140c(,%eax,4),%eax
    c2a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    c2a6:	c1 e1 0a             	shl    $0xa,%ecx
    c2a9:	01 c8                	add    %ecx,%eax
    c2ab:	c1 e0 03             	shl    $0x3,%eax
    c2ae:	8d 3c 02             	lea    (%edx,%eax,1),%edi

	for (i=0; i<64; i++) {
    c2b1:	bb 00 00 00 00       	mov    $0x0,%ebx
    c2b6:	eb 40                	jmp    c2f8 <SubBandSynthesis+0x10b>
		sum = 0;
    c2b8:	d9 ee                	fldz   
		for (k=0; k<32; k++)
    c2ba:	be 00 00 00 00       	mov    $0x0,%esi
    c2bf:	eb 26                	jmp    c2e7 <SubBandSynthesis+0xfa>
			sum += bandPtr[k] * (*filter)[i][k];
    c2c1:	89 f0                	mov    %esi,%eax
    c2c3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    c2ca:	8b 45 08             	mov    0x8(%ebp),%eax
    c2cd:	01 d0                	add    %edx,%eax
    c2cf:	dd 00                	fldl   (%eax)
    c2d1:	a1 24 42 01 00       	mov    0x14224,%eax
    c2d6:	89 da                	mov    %ebx,%edx
    c2d8:	c1 e2 05             	shl    $0x5,%edx
    c2db:	01 f2                	add    %esi,%edx
    c2dd:	dd 04 d0             	fldl   (%eax,%edx,8)
    c2e0:	de c9                	fmulp  %st,%st(1)
    c2e2:	de c1                	faddp  %st,%st(1)
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
		sum = 0;
		for (k=0; k<32; k++)
    c2e4:	83 c6 01             	add    $0x1,%esi
    c2e7:	83 fe 1f             	cmp    $0x1f,%esi
    c2ea:	7e d5                	jle    c2c1 <SubBandSynthesis+0xd4>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
    c2ec:	89 d8                	mov    %ebx,%eax
    c2ee:	c1 e0 03             	shl    $0x3,%eax
    c2f1:	01 f8                	add    %edi,%eax
    c2f3:	dd 18                	fstpl  (%eax)
	}
/*    if (channel == 0) */
	bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
	bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

	for (i=0; i<64; i++) {
    c2f5:	83 c3 01             	add    $0x1,%ebx
    c2f8:	83 fb 3f             	cmp    $0x3f,%ebx
    c2fb:	7e bb                	jle    c2b8 <SubBandSynthesis+0xcb>
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    c2fd:	bf 00 00 00 00       	mov    $0x0,%edi
    c302:	e9 c7 00 00 00       	jmp    c3ce <SubBandSynthesis+0x1e1>
		sum = 0;
    c307:	d9 ee                	fldz   
		for (i=0; i<16; i++) {
    c309:	bb 00 00 00 00       	mov    $0x0,%ebx
    c30e:	eb 4c                	jmp    c35c <SubBandSynthesis+0x16f>
			k = j + (i<<5);
    c310:	89 d8                	mov    %ebx,%eax
    c312:	c1 e0 05             	shl    $0x5,%eax
    c315:	8d 34 38             	lea    (%eax,%edi,1),%esi
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c318:	a1 28 42 01 00       	mov    0x14228,%eax
    c31d:	89 f2                	mov    %esi,%edx
    c31f:	c1 e2 03             	shl    $0x3,%edx
    c322:	01 d0                	add    %edx,%eax
    c324:	dd 00                	fldl   (%eax)
    c326:	a1 20 42 01 00       	mov    0x14220,%eax
    c32b:	8d 53 01             	lea    0x1(%ebx),%edx
    c32e:	d1 fa                	sar    %edx
    c330:	c1 e2 06             	shl    $0x6,%edx
    c333:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
												bufOffset[channel]) & 0x3ff];
    c336:	8b 55 0c             	mov    0xc(%ebp),%edx
    c339:	8b 14 95 0c 14 01 00 	mov    0x1140c(,%edx,4),%edx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c340:	01 ca                	add    %ecx,%edx
												bufOffset[channel]) & 0x3ff];
    c342:	89 d1                	mov    %edx,%ecx
    c344:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
			k = j + (i<<5);
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
    c34a:	8b 55 0c             	mov    0xc(%ebp),%edx
    c34d:	c1 e2 0a             	shl    $0xa,%edx
    c350:	01 ca                	add    %ecx,%edx
    c352:	dd 04 d0             	fldl   (%eax,%edx,8)
    c355:	de c9                	fmulp  %st,%st(1)
    c357:	de c1                	faddp  %st,%st(1)
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
		sum = 0;
		for (i=0; i<16; i++) {
    c359:	83 c3 01             	add    $0x1,%ebx
    c35c:	83 fb 0f             	cmp    $0xf,%ebx
    c35f:	7e af                	jle    c310 <SubBandSynthesis+0x123>
			sum += window[k] * (*buf) [channel] [( (k + ( ((i+1)>>1) <<6) ) +
												bufOffset[channel]) & 0x3ff];
		}
		{
			/*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
			long foo = sum * SCALE;
    c361:	dd 05 40 f5 00 00    	fldl   0xf540
    c367:	de c9                	fmulp  %st,%st(1)
    c369:	d9 7d d6             	fnstcw -0x2a(%ebp)
    c36c:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
    c370:	b4 0c                	mov    $0xc,%ah
    c372:	66 89 45 d4          	mov    %ax,-0x2c(%ebp)
    c376:	d9 6d d4             	fldcw  -0x2c(%ebp)
    c379:	db 5d e0             	fistpl -0x20(%ebp)
    c37c:	d9 6d d6             	fldcw  -0x2a(%ebp)
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
    c37f:	81 7d e0 ff 7f 00 00 	cmpl   $0x7fff,-0x20(%ebp)
    c386:	7e 15                	jle    c39d <SubBandSynthesis+0x1b0>
    c388:	89 f8                	mov    %edi,%eax
    c38a:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c38d:	8b 45 10             	mov    0x10(%ebp),%eax
    c390:	01 d0                	add    %edx,%eax
    c392:	66 c7 00 ff 7f       	movw   $0x7fff,(%eax)
    c397:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    c39b:	eb 2e                	jmp    c3cb <SubBandSynthesis+0x1de>
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
    c39d:	81 7d e0 00 80 ff ff 	cmpl   $0xffff8000,-0x20(%ebp)
    c3a4:	7d 15                	jge    c3bb <SubBandSynthesis+0x1ce>
    c3a6:	89 f8                	mov    %edi,%eax
    c3a8:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c3ab:	8b 45 10             	mov    0x10(%ebp),%eax
    c3ae:	01 d0                	add    %edx,%eax
    c3b0:	66 c7 00 00 80       	movw   $0x8000,(%eax)
    c3b5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    c3b9:	eb 10                	jmp    c3cb <SubBandSynthesis+0x1de>
			else                           samples[j] = foo;
    c3bb:	89 f8                	mov    %edi,%eax
    c3bd:	8d 14 00             	lea    (%eax,%eax,1),%edx
    c3c0:	8b 45 10             	mov    0x10(%ebp),%eax
    c3c3:	01 c2                	add    %eax,%edx
    c3c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    c3c8:	66 89 02             	mov    %ax,(%edx)
			sum += bandPtr[k] * (*filter)[i][k];
		bufOffsetPtr[i] = sum;
	}
	/*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
	/*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
	for (j=0; j<32; j++) {
    c3cb:	83 c7 01             	add    $0x1,%edi
    c3ce:	83 ff 1f             	cmp    $0x1f,%edi
    c3d1:	0f 8e 30 ff ff ff    	jle    c307 <SubBandSynthesis+0x11a>
			if (foo >= (long) SCALE)      {samples[j] = SCALE-1; ++clip;}
			else if (foo < (long) -SCALE) {samples[j] = -SCALE;  ++clip;}
			else                           samples[j] = foo;
		}
	}
    return(clip);
    c3d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
    c3da:	83 c4 2c             	add    $0x2c,%esp
    c3dd:	5b                   	pop    %ebx
    c3de:	5e                   	pop    %esi
    c3df:	5f                   	pop    %edi
    c3e0:	5d                   	pop    %ebp
    c3e1:	c3                   	ret    

0000c3e2 <out_fifo>:

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames)
{
    c3e2:	55                   	push   %ebp
    c3e3:	89 e5                	mov    %esp,%ebp
    c3e5:	83 ec 10             	sub    $0x10,%esp
	int i,j,l;
	int stereo = fr_ps->stereo;
    c3e8:	8b 45 10             	mov    0x10(%ebp),%eax
    c3eb:	8b 40 08             	mov    0x8(%eax),%eax
    c3ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    c3f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    c3f8:	eb 75                	jmp    c46f <out_fifo+0x8d>
    c3fa:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    c401:	eb 62                	jmp    c465 <out_fifo+0x83>
            (*psampFrames)++;
    c403:	8b 45 14             	mov    0x14(%ebp),%eax
    c406:	8b 00                	mov    (%eax),%eax
    c408:	8d 50 01             	lea    0x1(%eax),%edx
    c40b:	8b 45 14             	mov    0x14(%ebp),%eax
    c40e:	89 10                	mov    %edx,(%eax)
            for (l=0;l<stereo;l++) {
    c410:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    c417:	eb 40                	jmp    c459 <out_fifo+0x77>
                if (!(k%1600) && k) {
    c419:	8b 0d 2c 42 01 00    	mov    0x1422c,%ecx
    c41f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    c424:	89 c8                	mov    %ecx,%eax
    c426:	f7 ea                	imul   %edx
    c428:	c1 fa 09             	sar    $0x9,%edx
    c42b:	89 c8                	mov    %ecx,%eax
    c42d:	c1 f8 1f             	sar    $0x1f,%eax
    c430:	29 c2                	sub    %eax,%edx
    c432:	89 d0                	mov    %edx,%eax
    c434:	69 c0 40 06 00 00    	imul   $0x640,%eax,%eax
    c43a:	29 c1                	sub    %eax,%ecx
    c43c:	89 c8                	mov    %ecx,%eax
    c43e:	85 c0                	test   %eax,%eax
    c440:	75 13                	jne    c455 <out_fifo+0x73>
    c442:	a1 2c 42 01 00       	mov    0x1422c,%eax
    c447:	85 c0                	test   %eax,%eax
    c449:	74 0a                	je     c455 <out_fifo+0x73>
                    //fwrite(outsamp,2,1600,outFile);
                    k = 0;
    c44b:	c7 05 2c 42 01 00 00 	movl   $0x0,0x1422c
    c452:	00 00 00 
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
            (*psampFrames)++;
            for (l=0;l<stereo;l++) {
    c455:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    c459:	8b 45 f4             	mov    -0xc(%ebp),%eax
    c45c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
    c45f:	7c b8                	jl     c419 <out_fifo+0x37>
	int i,j,l;
	int stereo = fr_ps->stereo;
	//int sblimit = fr_ps->sblimit;
	static long k = 0;

        for (i=0;i<num;i++) for (j=0;j<SBLIMIT;j++) {
    c461:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    c465:	83 7d f8 1f          	cmpl   $0x1f,-0x8(%ebp)
    c469:	7e 98                	jle    c403 <out_fifo+0x21>
    c46b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    c46f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    c472:	3b 45 0c             	cmp    0xc(%ebp),%eax
    c475:	7c 83                	jl     c3fa <out_fifo+0x18>
                    k = 0;
                }
                //outsamp[k++] = pcm_sample[l][i][j];
            }
        }
}
    c477:	c9                   	leave  
    c478:	c3                   	ret    

0000c479 <buffer_CRC>:


void  buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc)
{
    c479:	55                   	push   %ebp
    c47a:	89 e5                	mov    %esp,%ebp
    c47c:	83 ec 18             	sub    $0x18,%esp
    *old_crc = getbits(bs, 16);
    c47f:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
    c486:	00 
    c487:	8b 45 08             	mov    0x8(%ebp),%eax
    c48a:	89 04 24             	mov    %eax,(%esp)
    c48d:	e8 8b a8 ff ff       	call   6d1d <getbits>
    c492:	8b 55 0c             	mov    0xc(%ebp),%edx
    c495:	89 02                	mov    %eax,(%edx)
}
    c497:	c9                   	leave  
    c498:	c3                   	ret    

0000c499 <main_data_slots>:

extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    c499:	55                   	push   %ebp
    c49a:	89 e5                	mov    %esp,%ebp
    c49c:	83 ec 18             	sub    $0x18,%esp
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c49f:	8b 45 08             	mov    0x8(%ebp),%eax
    c4a2:	8b 40 0c             	mov    0xc(%eax),%eax
    c4a5:	83 c0 1e             	add    $0x1e,%eax
    c4a8:	8b 14 85 60 0f 01 00 	mov    0x10f60(,%eax,4),%edx
    c4af:	89 d0                	mov    %edx,%eax
    c4b1:	c1 e0 03             	shl    $0x3,%eax
    c4b4:	01 d0                	add    %edx,%eax
    c4b6:	c1 e0 04             	shl    $0x4,%eax
			/ s_freq[fr_ps.header->sampling_frequency];
    c4b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    c4bc:	db 45 ec             	fildl  -0x14(%ebp)
    c4bf:	8b 45 08             	mov    0x8(%ebp),%eax
    c4c2:	8b 40 10             	mov    0x10(%eax),%eax
    c4c5:	dd 04 c5 20 10 01 00 	fldl   0x11020(,%eax,8)
    c4cc:	de f9                	fdivrp %st,%st(1)
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
	int nSlots;

	nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
    c4ce:	d9 7d ea             	fnstcw -0x16(%ebp)
    c4d1:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
    c4d5:	b4 0c                	mov    $0xc,%ah
    c4d7:	66 89 45 e8          	mov    %ax,-0x18(%ebp)
    c4db:	d9 6d e8             	fldcw  -0x18(%ebp)
    c4de:	db 5d fc             	fistpl -0x4(%ebp)
    c4e1:	d9 6d ea             	fldcw  -0x16(%ebp)
			/ s_freq[fr_ps.header->sampling_frequency];
	if (fr_ps.header->padding) nSlots++;
    c4e4:	8b 45 08             	mov    0x8(%ebp),%eax
    c4e7:	8b 40 14             	mov    0x14(%eax),%eax
    c4ea:	85 c0                	test   %eax,%eax
    c4ec:	74 04                	je     c4f2 <main_data_slots+0x59>
    c4ee:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
	nSlots -= 4;
    c4f2:	83 6d fc 04          	subl   $0x4,-0x4(%ebp)
	if (fr_ps.header->error_protection)
    c4f6:	8b 45 08             	mov    0x8(%ebp),%eax
    c4f9:	8b 40 08             	mov    0x8(%eax),%eax
    c4fc:	85 c0                	test   %eax,%eax
    c4fe:	74 04                	je     c504 <main_data_slots+0x6b>
		nSlots -= 2;
    c500:	83 6d fc 02          	subl   $0x2,-0x4(%ebp)
	if (fr_ps.stereo == 1)
    c504:	8b 45 10             	mov    0x10(%ebp),%eax
    c507:	83 f8 01             	cmp    $0x1,%eax
    c50a:	75 06                	jne    c512 <main_data_slots+0x79>
		nSlots -= 17;
    c50c:	83 6d fc 11          	subl   $0x11,-0x4(%ebp)
    c510:	eb 04                	jmp    c516 <main_data_slots+0x7d>
	else
		nSlots -=32;
    c512:	83 6d fc 20          	subl   $0x20,-0x4(%ebp)
	return(nSlots);
    c516:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    c519:	c9                   	leave  
    c51a:	c3                   	ret    
