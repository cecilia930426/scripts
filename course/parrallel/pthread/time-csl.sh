#!/bin/bash

function softtest(){
    echo $1 "threads"
    ./dijkstra_pthread -n $1 -i ~/Research/input/input2.txt
    echo "---Diff---"
    diff output.txt version/output2.txt
    echo "============"
    sleep 3
}

for ii in {1..11}
do
    softtest $ii
done


#echo "20 threads"
#./dijkstra_pthread -n 20 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#
#sleep 4
#echo "10 threads"
#./dijkstra_pthread -n 10 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#
#sleep 4
#echo "5 threads"
#./dijkstra_pthread -n 5 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#
#sleep 4
#echo "4 threads"
#./dijkstra_pthread -n 4 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#sleep 4
#
#echo "3 threads"
#./dijkstra_pthread -n 3 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#sleep 4
#
#echo "2 threads"
#./dijkstra_pthread -n 2 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#sleep 4
#
#echo "1 thread"
#./dijkstra_pthread -n 1 -i ~/Research/input/input2.txt
#diff output.txt version/output2.txt
#
