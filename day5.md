# 命令行环境

1. 我们可以使用类似 ps aux | grep 这样的命令来获取任务的 pid ，然后您可以基于pid 来结束这些进程。但我们其实有更好的方法来做这件事。在终端中执行 sleep 10000 这个任务。然后用 Ctrl-Z 将其切换到后台并使用 bg来继续允许它。现在，使用 pgrep 来查找 pid 并使用 pkill 结束进程而不需要手动输入pid。(提示：: 使用 -af 标记)。

    ```shell
    # 多创建几个sleep进程
    sleep 1000
    # 显示所有的sleep进程
    $pgrep sleep
    # 删除所有的sleep进程
    pkill -9 -f sleep
    ```
