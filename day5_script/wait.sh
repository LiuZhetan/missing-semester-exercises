#! /bin/bash
if [ $# != 2 ] 
then {
    echo Input 2 argments 
    echo The first is the pid of the process to wait 
    echo The seccond is the command or script to run 
}
else {
    while kill -0 $1
    do
        echo waiting....
        sleep 1
    done
    eval $2
}
fi