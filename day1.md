## 课程概览与 shell
### 课后练习
1. 本课程需要使用类Unix shell，例如 Bash 或 ZSH。如果您在 Linux 或者 MacOS 上面完成本课程的练习，则不需要做任何特殊的操作。如果您使用的是 Windows，则您不应该使用 cmd 或是 Powershell；您可以使用Windows Subsystem for Linux或者是 Linux 虚拟机。使用echo $SHELL命令可以查看您的 shell 是否满足要求。如果打印结果为/bin/bash或/usr/bin/zsh则是可以的。

```
echo $SHELL
```
2. 在 /tmp 下新建一个名为 missing 的文件夹。
```
sudo mkdir /tmp/missing
ls -l /tmp | grep missing
```
3. 用 man 查看程序 touch 的使用手册。
```
man touch
```
4. 用 touch 在 missing 文件夹中新建一个叫 semester 的文件。
```
sudo touch  /tmp/missing/semester
```
5. 将以下内容一行一行地写入 semester 文件
```
echo #!/bin/sh >> sudo /tmp/missing/semester
echo curl --head --silent https://missing.csail.mit.edu >> sudo /tmp/missing/semester
```