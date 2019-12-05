declare -a idd_karyawan
declare -a nama
declare -a umur
declare -a jabatan
declare -a gaji

i=0
n=0

cekping(){
    echo "Are You Online?"
    echo ""
    echo "Masukkan Service yang akan anda test PING"
    read cekname
    echo ""
    echo "Press CTRL + C to END Test Mode"
    ping $cekname
}

folder(){
	echo "Masukkan Nama Folder yang Ingin Dibuat : "
	read new_folder
	mkdir $new_folder
	echo "Folder $new_folder Telah Berhasil Dibuat"
	ls -l
	read hold
}

manipulasi(){
	echo "Manipulasi Hak Akses Berkas"
	read ubah

	echo "---penjelasan---"
	echo "*hak akses untuk owner, group, dan other"
	echo "*r = 4 (read-mengizinkan membaca berkas)"
	echo "*w = 2 (write0-mengizinkan mengedit berkas)"
	echo "*x = 1 (excutable-mengizinkan mengeksekusi berkas binary)"
	echo "masukkan angkanya : "
	read angka

	echo -e "\nOke anda memilih $ubah"
	sudo chmod $angka $ubah
	echo -e "\nManipulasi berkas sudah selesai"
	ls -l
	read hold
}

tambah(){
    flag=0
    id_cari=0
    echo -n "ID Karyawan        : "
    read id_temp
    echo -n "Nama Karyawan      : "
    read nama_temp
    echo -n "Umur Karyawan      : "
    read umur_temp
    echo -n "Jabatan            : "
    read jabatan_temp
    echo -n "Gaji Karyawan      : "
    read gaji_temp

    for id_cari in ${id_karyawan[*]}
    do
        if [[ $id_cari == $id_temp ]]
        then
            flag=1
            break
        fi
    done
    
    if [[ $flag == 1 ]]
    then
        echo "ID Karyawan sudah ada!"
    else
        id_karyawan[$i]=$id_temp
        nama[$i]=$nama_temp
        umur[$i]=$umur_temp
        jabatan[$i]=$jabatan_temp
        gaji[$i]=$gaji_temp
        i=$i+1
        n=$n+1
    fi
}

lihat(){
    if(( $n==0 ))
    then
        echo "Tidak Ada Data!, Silahkan Tambahkan Data"
    fi

    for((i=0;i<n;i++))
    do
        echo "=================================================="
        echo "ID Karyawan       : ${id_karyawan[$i]}"
        echo "Nama Karyawan     : ${nama[$i]}"
        echo "Umur              : ${umur[$i]}"
        echo "Jabatan           : ${jabatan[$i]}"
        echo "Gaji              : ${gaji[$i]}"
        echo "=================================================="
    done
}

cari_karyawan(){
    echo -n "Masukkan ID Karyawan : "
    read id_cari
    a=0

    for((i=0;i<n;i++))
    do
        if(( $id_cari == ${id_karyawan[$i]} ))
        then 
            a=1
            break
        fi
    done
    
    if(( $a == 1 ))
    then
        echo "ID Karyawan Telah Ditemukan"
        echo ""
        echo "=================================================="
        echo "ID Karyawan        : ${id_karyawan[$i]}"
        echo "Nama Karyawan      : ${nama[$i]}"
        echo "Umur               : ${umur[$i]}"
        echo "Jabatan            : ${jabatan[$i]}"
        echo "Gaji               : ${gaji[$i]}"
        echo "=================================================="
    else
        echo "ID Karyawan tidak ditemukan, Coba lagi"
    fi
}

perbarui(){
    echo -n "Masukkan ID Karyawan yang ingin diupdate : "
    read update_id
    b=0

    for((i=0;i<n;i++))
    do
        if(( $update_id == ${id_karyawan[$i]} ))
        then 
            b=1
            break
        fi
    done

    if(( $b == 1 ))
    then
        u=0
        echo -n "ID Karyawan      : "
        read id_temp
        echo -n "Nama Karyawan    : "
        read nama_temp
        echo -n "Umur             : "
        read umur_temp
        echo -n "Jabatan          : "
        read jabatan_temp
        echo -n "Gaji             : "
        read gaji_temp
           
        for id_cari in ${id_karyawan[*]}
        do
            if [[ $id_cari == $id_temp ]]
            then
                u=1
                break
            fi
        done
    
        if [[ $u == 1 ]]
        then
            echo "ID Karyawan sudah digunakan"
        else
            id_karyawan[$i]=$id_temp
            nama[$i]=$nama_temp
            umur[$i]=$umur_temp
            jabatan[$i]=$jabatan_temp
            gaji[$i]=$gaji_temp
        fi
    else
        echo "Karyawan belum terdaftar"
    fi
}

phk(){
    echo -n "Masukkan ID Karyawan yang ingin dipecat : "
    read pecat_id
    c=0

    for((i=0;i<n;i++))
    do 
        if(( $pecat_id == ${id_karyawan[$i]} ))
        then
            c=1
            break
        fi
    done

    if(( $c == 1 ))
    then
        unset id_karyawan[$i] 
        unset nama[$i]
        unset umur[$i] 
        unset jabatan[$i]
        unset gaji[$i]
        echo "Karyawan telah dipecat"

        id_karyawan=( "${id_karyawan[@]}" )
        nama=( "${nama[@]}" )
        umur=( "${umur[@]}" )
        jabatan=( "${jabatan[@]}" )
        gaji=( "${gaji[@]}" )
        n=$n-1
    else
        echo "ID Karyawan Tidak Ditemukan"
    fi
}
#--------------------------MAIN
while :;
do
    echo "==========================================================="
    echo "=                  MYJob Assistent                        ="
    echo "=                Portal Karyawan Kita                     ="
    echo "=                Server Status: ONLINE                    ="
    echo "==========================================================="
    echo "System Time : "
    date
    echo ""
    echo " 1. Tambah Karyawan Baru"
    echo " 2. Lihat Karyawan Lama"
    echo " 3. Cari Karyawan"
    echo " 4. Perbarui Data Karyawan"
    echo " 5. Pecat Karyawan"
    echo " 6. Cek Koneksi Internet ke Server"
    echo " 7. Manipulasi Hak Akses Berkas"
    echo " 8. Buat folder"
    echo " 9. Shutdown Komputer"
    echo " 0. Exit"
    echo ""
    echo -n "Pilih menu : "
    read pilih

    if(( $pilih == 1 ))
    then
        clear
        tambah
	echo "Sukses!, ID $id_temp Berhasil diperkerjakan"
	echo ""	
	echo "Press any key to continue"	
	read hold
        clear
    elif(( $pilih == 2 ))
    then
        clear
        lihat
	read hold
	clear
    elif(( $pilih == 3 ))
    then 
        clear
        cari_karyawan
	read hold
	clear
    elif(( $pilih == 4 ))
    then
        clear
        perbarui
	read hold
        clear
    elif(( $pilih == 5 ))
    then 
        clear
        phk
	read hold
	clear
    elif(( $pilih == 6 ))
    then
	clear
	cekping
	read hold
	clear
    elif(( $pilih == 7 ))
    then
	clear
	manipulasi
	read hold
	clear
    elif(( $pilih == 8 ))
    then 
	clear
	folder
	read hold
	clear
    elif(( $pilih == 9 ))
    then 
	clear
	echo "BYE!"
	poweroff
    elif(( $pilih == 0 ))
    then
	echo "Shut about to down"
	echo "thx"
        exit
    else
        echo "Input yang Anda masukkan Salah!"
    fi
done
