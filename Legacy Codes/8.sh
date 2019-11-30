#!/bin/bash
#!/bin/ksh

declare -a array
i=0;
sisikubus=0.0;
palass3=0.0;
talas3=0.0;
lbidang=0.0;
slimas=0.0;
tlimas=0.0;



select menu in "LUAS KUBUS " "LUAS PERMUKAAN PRISMA SEGITIGA " "LUAS PERMUKAAN LIMAS PERSEGI " "NILAI TENGAH (MEDIAN) " "KELUAR"
do
 case $menu in
  "LUAS KUBUS ")
   echo -n "Input Sisi"
   read sisikubus;
   let lkubus=$sisikubus*$sisikubus*6;
   let array[$i]=$lkubus;
   echo "Hasilnya="${array[$i]}
   let i=$i+1;
   ;;
   


  "LUAS PERMUKAAN PRISMA SEGITIGA ")
   echo -n "Input Panjang Alas Segitiga"
   read palass3;
   echo -n "Input Tinggi Alas"
   read talas3;
   echo -n "Input Luas Bidang Tegak"
   read lbidang;
   let lalas3=$palass3*$talas3/2;
   let lprisma3=2*$lalas3+3*$lbidang;
   let array[$i]=$lprisma3;
   echo "Hasilnya="${array[$i]}
   let i=$i+1;
   ;;

  "LUAS PERMUKAAN LIMAS PERSEGI ")
    echo -n "Input Sisi"
    read slimas;
    echo -n "Input Tinggi Limas"
    read tlimas;
    let llimas=$slimas*$slimas*$tlimas/3;
    let array[$i]=$llimas;  
    echo "Hasilnya="${array[$i]}
    let i=$i+1;
    ;;


  "NILAI TENGAH (MEDIAN) ")
   
   echo ${array[@]}

   for((x=0;x<i-1;x++))
   do
    let small=${array[$x]};
    let index=$x;
       for((y=x+1;y<i;y++))
       do
           if((array[$y]<small));
         then
               let small=${array[$y]};
               let index=$y;
          fi
       done
    let temp=${array[$x]};
    let array[$x]=${array[$index]};
    let array[$index]=$temp;
   done

    for ((x=0;x<$i;x++))
     do    
       echo -n ${array[$x]} " "
     done
    
   let m=$i%2
   if(($m==0))
   then
    let x=($i/2);
    let median=(${array[$x-1]}+${array[$x]})/2;
    echo ${array[$x-1]} ${array[$x]} ;
    echo $x;
   else
    let x=$i/2;
    let median=${array[$x]};    
   fi
   
   echo "Nilai Tengah = "$median
    

   ;;

  "KELUAR")
   exit 1
   ;;

 esac
done
