#! /bin/bash
# 保存当前目录
cwd=$(pwd)
# 切换到脚本目录
script_dir=$(dirname $0)
cd $script_dir

echo > last_3_boot.txt
for n in 0 1 2
do
    sudo journalctl -b -$n >> last_3_boot.txt
done
# 返回原目录
cd $cwd