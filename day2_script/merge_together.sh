#!/bin/bash
echo error > /tmp/macro.tmp
cwd=$(pwd)
echo current working directory:
echo $cwd
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
$script_dir/macro.sh
tmp_res=$(cat /tmp/macro.tmp)
echo exec macro.sh
echo /tmp/macro.tmp:
echo $tmp_res
cd ..
echo channge current working directory to parent directory:
cwd=$(pwd)
echo $cwd
echo exec polo.sh
$script_dir/polo.sh