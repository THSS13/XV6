# XV6
软件学院 2015年计算机系统软件 XV6 系统优化开发

整合MP3部分(徐京傲组修改版)

-----

## 进展说明
1. 已经将去年优秀作业一里面的`xv6_mp3(刘俊麟小组)` 代码整合进入`XV6`系统之中
-  能够无卡顿播放`wav`格式音乐，极其卡顿播放`MP3`格式文件
-  将鼠标点击事件绑定在播放音乐按钮上面，解决鼠标乱窜问题导致的无法调试

## 环境说明
1. Ubuntu 12.04 32位操作系统（不支持14.04、10.10以及64位的Ubuntu 12.04）

-----
## 代码修改说明
### 鼠标点击事件：
  `message.c` 53、54行
  ```C
	MsgQueue[i].concrete_msg.msg_mouse.x = 227;
MsgQueue[i].concrete_msg.msg_mouse.y = 452;
  ```
  将鼠标点击固定在音乐播放器的按钮之上，其中(227,452)为播放器的坐标
### 播放MP3方法：
  `desktop.c` 62、63行
  ```C
  //char* argv[] = { "play", "qian.wav" };
char* argv[] = { "playmp3", "in.mp3" };
  ```
  `desktop.c` 73、74行
  ```C
  //exec("play", argv);
exec("playmp3",argv);
  ```
  将默认播放的WAV格式改变为MP3格式。
### 音乐播放：
  修改代码(基本上是替换+调试)：`sound.c`、`sound.h`、`mp3dec.c`、`sysaudio.c`、`sysmp3.c`
  修改代码(部分改)：`common.c`、`common.h`、`math.c`

## 存在问题（定时更新）
1. MP3播放非常卡顿，我们认为是目前MP3的解码速度过慢
2. 方案一优秀作业没有其余进程会占用mp3播放的内存，可整合进入XV6之后会有GUI等部分占用内存，导致无法开很大的数组开保存解码内容。
学长所开数组大小(sound.h)：
```C
#define DMA_BUF_NUM  32
#define DMA_SMP_NUM  0x1000
#define	BUFSIZE	819200
```
我们目前所开数组大小
```C
#define DMA_BUF_NUM  32
#define DMA_SMP_NUM  0x100
#define	BUFSIZE	16384
```

