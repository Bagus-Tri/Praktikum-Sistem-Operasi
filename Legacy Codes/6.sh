#!/bin/bash
clear
tes=y

while [ $tes == 'y' ]
do
echo " Program Nilai Terbesar Kedua di dalam Array "
echo "1. Demo Program Array"
echo "2. Lihat Data Array"
echo "3. Penjumlahan Data Array"
echo "4. Exit"
echo "Pilihan :"
read pil

case $pil in
    1)
    echo "Masukkan banyak element array : "
        read input
        for((i=0;i<$input;i++))
        do
            printf "Index Array - $i : "
            read array[i]
        done
        terbesar_satu=0
            for((i=0;i<$input;i++))
        do
            if [[ $terbesar_satu -lt ${array[i]} ]]
        then
            let terbesar_satu=${array[i]}
            let j=i
        fi
        done
        terbesar_dua=0
        index=0
            for((i=0;i<$input;i++))    
        do
            if [[ $i -eq $j ]]
        then
            let i=i+1
            let i=i-1
        else
        if [[ $terbesar_dua -lt ${array[i]} ]]
        then    
            let terbesar_dua=${array[i]}
            let index=i
            fi
        fi
        done
        printf "\n"
        echo "Nilai terbesar kedua di dalam array adalah : $terbesar_dua"
        echo "Index Array ke : $index"
        read
        clear
;;

    2)
    if [[ $input -eq 0 ]]
    then
        printf "Data Kosong \n"
    else
        echo ${array[@]}
    fi
    read
    clear
;;

    3)
    if [[ $input -eq 0 ]]
    then
        printf "\n"
        printf "0\n"
    else
        banyak_data=${#array[@]};
        flag=0
            for((i=0;i<$banyak_data;i++))
    do
        let flag=$(expr "$flag" + "${array[i]}")
    done
    echo "Jumlah Semua Data Array : $flag"    
    fi
    read
    clear
;;

    4)
    printf "\n"
    echo "Thx :)"
exit 1
esac
done
