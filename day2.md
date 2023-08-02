# Shell 工具和脚本
1. 阅读 man ls ，然后使用ls 命令进行如下操作：
```
# 所有文件（包括隐藏文件）
ls -a
# 文件打印以人类可以理解的格式输出 (例如，使用454M 而不是 454279954)
ls -l -h
# 文件以最近访问顺序排序
ls -l --sort=time
# 以彩色文本显示输出结果
ls --color
```
2. 编写两个bash函数 marco 和 polo 执行下面的操作。 每当你执行 marco 时，当前的工作目录应当以某种形式保存，当执行 polo 时，无论现在处在什么目录下，都应当 cd 回到当时执行 marco 的目录。 为了方便debug，你可以把代码写在单独的文件 marco.sh 中，并通过 source marco.sh命令，（重新）加载函数。
> 脚本文件放在day2_script中。
> macro.sh将当前的工作木目录保存在/tmp/macro.tmp文件中，polo.sh读取该文件中的路径并切换目录，merge_together.sh测试了两个脚本的功能。

3. 假设您有一个命令，它很少出错。因此为了在出错时能够对其进行调试，需要花费大量的时间重现错误并捕获输出。 编写一段bash脚本，运行如下的脚本直到它出错，将它的标准输出和标准错误流记录到文件，并在最后输出所有内容。 加分项：报告脚本在失败前共运行了多少次。
> day2_script目录下的record_err.sh脚本反复执行test.sh并将标准输出和标准错误写入到record文件中。当test.sh执行失败时record_err.sh终止执行并打印test.sh的执行次数

4. 编写一个命令，它可以递归地查找文件夹中所有的HTML文件，并将它们压缩成zip文件。注意，即使文件名中包含空格，您的命令也应该能够正确执行
```
#不用-exec的做法, html文件已经下载在day2_script/htmls目录下
find day2_script/htmls -name *.html -type f -print0 | xargs -0 tar cf day2_script/htmls.tar
```
5. （进阶）编写一个命令或脚本递归的查找文件夹中最近使用的文件。更通用的做法，你可以按照最近的使用时间列出文件吗？
```
# 只使用ls命令
ls -l -R -t
# 使用find
find . -type f -mmin -60 -print0 | xargs -0 ls -lt | head -10
```