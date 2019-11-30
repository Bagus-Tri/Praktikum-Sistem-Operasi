#!/bin/bash

echo "Masukkan Nilai: "
read num
echo "=====Hitung Mulai====="

x=1

while [ $x -le $num ]
do
    if [[ 0 -eq "($x%3) + ($x%5)" ]]
    then
    echo "Fizz Buzz"
    elif [[ 0 -eq "($x%3)" ]]
    then
    echo "Fizz"  
    elif [[ 0 -eq "($x%5)" ]]
    then
    echo "Buzz"
    else
    echo "$x"
    fi    
    x=$(( $x + 1 ))
done

