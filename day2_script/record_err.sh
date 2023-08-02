#! /usr/bin/env bash
> record
num=0
exit=0

while [[ $exit -eq 0 ]]
do
    echo record NO.$(($num+1)) >> record
    ./test.sh >> record 2>&1
    if [[ $? -eq 1 ]]
    then
        # 程序错误
        echo test.sh goes wrong
        break
    fi
    let num=$num+1
done
    if [[ $num -eq 1 ]]
    then
        echo "test.sh has successfully run once"
    else
        echo "test.sh has successfully run $num times"
    fi