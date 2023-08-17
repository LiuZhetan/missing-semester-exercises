#!/bin/awk -f
#运行前
BEGIN {
    sum_t = 0
    avg_t = 0
    mid_t = 0

    i = 0
    array[0] = 0
 
    printf "Boot-time(ms):\n"
    printf "--------------\n"
}
#运行中
{
    i+=1
    sum_t+=$1
    array[i]=$1
}
#运行后
END {
    if (NR%2 == 0) {
        mid_t = (array[NR/2] + array[NR/2 + 1])/2
    }
    else {
        mid_t = array[NR/2 + 1]
    }

    printf "MAX:%10.2f\n", array[1]
    printf "MID:%10.2f\n", mid_t
    printf "AVERAGE:%10.2f\n", sum_t/NR
}