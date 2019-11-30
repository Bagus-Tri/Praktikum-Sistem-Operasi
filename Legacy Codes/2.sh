#!/bin/bash

printf "Masukkan Detik = "
read "detik"

menit=60
jam=3600
hari=86400

if [[ $detik -le $menit ]]
then
    echo "$detik Detik"
elif [[ $detik -le $jam ]]
then
    let menit=$detik/60
    let detik=$detik-$menit*60    
    echo "$menit menit $detik detik"
elif [[ $detik -le $hari ]]
then
    let jam=$detik/3600
    let detik=$detik-$jam*3600
    let menit=$detik/60
    let detik=$detik-$menit*60
    echo "$jam jam $menit menit $detik detik"
fi

