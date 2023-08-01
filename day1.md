## 课程概览与 shell
### 课后练习
1. 本课程需要使用类Unix shell，例如 Bash 或 ZSH。如果您在 Linux 或者 MacOS 上面完成本课程的练习，则不需要做任何特殊的操作。如果您使用的是 Windows，则您不应该使用 cmd 或是 Powershell；您可以使用Windows Subsystem for Linux或者是 Linux 虚拟机。使用echo $SHELL命令可以查看您的 shell 是否满足要求。如果打印结果为/bin/bash或/usr/bin/zsh则是可以的。

```
echo $SHELL
```
2. 在 /tmp 下新建一个名为 missing 的文件夹。
```
sudo mkdir /tmp/missing
# 查看创建的文件及其权限
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
# 使用tee处理权限问题
echo '#!/bin/sh' | sudo tee /tmp/missing/semester
# 使用tee的-a选项在文件后最佳内容
echo 'curl --head --silent https://missing.csail.mit.edu' | sudo tee -a /tmp/missing/semester
```
6. 尝试执行这个文件。例如，将该脚本的路径（./semester）输入到您的shell中并回车。如果程序无法执行，请使用 ls 命令来获取信息并理解其不能执行的原因
```
# 结果为command not found
sudo /tmp/missing/semester
# 查看文件权限
sudo ls -l /tmp/missing
```
semester的权限为-rw-r--r-- 1 root root。即对于root用户可读可写，对于其他用户只可读，semester对于所有用户不可执行。

7. 查看 chmod 的手册(例如，使用 man chmod 命令)
```
man chmod
```
8. 使用 chmod 命令改变权限，使 ./semester 能够成功执行，不要使用 sh semester 来执行该程序。您的 shell 是如何知晓这个文件需要使用 sh 来解析呢？更多信息请参考：shebang
```
# 改变权限，使得所有用户可读、可写、可执行
sudo chmod 777 /tmp/missing/semester
```
```
# 执行semester文件,终端输出HTTP/1.1 200 Connection established
sudo /tmp/missing/semester
```

9. 使用 | 和 > ，将 semester 文件输出的最后更改日期信息，写入主目录下的 last-modified.txt 的文件中
```
# 先使用ls -l列出/tmp/missing下的文件的详细信息
# 再使用grep查找semester文件所在的行
# 最后用cut提取修改的时间信息
ls -l /tmp/missing | grep semester | cut --delimiter=' ' --fields=6-9
```
~~一开始理解错了~~
真确答案是这样的
```
/tmp/missing/semester | grep last-modified > ~/last-modified.txt
```

10. 写一段命令来从 /sys 中获取笔记本的电量信息，或者台式机 CPU 的温度。注意：macOS 并没有 sysfs，所以 Mac 用户可以跳过这一题。
```
# 电池的电量信息存放在/sys/class/power_supply/BAT1/capacity目录下
cat /sys/class/power_supply/BAT1/capacity
```