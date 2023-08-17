#!/bin/awk -f
#运行前
BEGIN {
    min = 66666666666
    max = 0
}
{
    if ($2 < min) {
        min = $2
    }
    if ($2 > min) {
        max = $2
    }
}
END {
    printf "MAX:%d\n", max
    printf "MID:%d\n", min
}