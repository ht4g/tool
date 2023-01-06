red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
purple(){
    echo -e "\033[35m\033[01m$1\033[0m"
}

# cài đặt aapanel quốc tế
function aapanelgoc(){
yum install -y wget && wget -O install.sh http://www.aapanel.com/script/install_6.0_en.sh && bash install.sh aapanel
red "Đã cài đặt thành công aaPanel"
}

# cài đặt bản aapanel bản tàu khựa
function aapanelTQ(){  
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
red "Đã cài đặt aaPanel bản Trung thành công"
}

# bẻ khoá aapanel bản hiện tại
function panelcrack(){  
bash <(curl -Ls https://raw.githubusercontent.com/AZZ-vopp/Z_OV/main/script/Z_OVpanel.sh)
red "Đã crack aaPanel xong, vui lòng login lại aaPanel"
}
# mở chặn speedtest
function unspeedtest(){
iptables -F && clear && echo "Đã mở khoá speedtest !"
cd /etc/iptables
rm rules.v4 rules.v6
reboot
}



# gỡ cài đặt aapanel
function uninstall(){
service bt stop && chkconfig --del bt && rm -f /etc/init.d/bt && rm -rf /www/server/panel
red "Gỡ cài đặt hoàn tất"
}

# anti l4
function anti-l4(){
bash <(curl -Ls https://raw.githubusercontent.com/AZZ-vopp/Z_OV/main/lo4.sh)
green "Thiết lập Antiddos l4 hoàn tất"
}

function blockspeed(){
bash <(curl -Ls https://raw.githubusercontent.com/AZZ-vopp/code-/main/blockspeedtest.sh)
}

function hacap(){
wget -O "/root/LinuxPanel_EN-6.8.23.zip" "https://github.com/AZZ-vopp/code-/raw/main/LinuxPanel_EN-6.8.23.zip"
blue "Đang tải tệp zip."
unzip LinuxPanel_EN-6.8.23.zip
cd /root/panel
wget -O "/root/panel/confhacap.sh" "https://raw.githubusercontent.com/AZZ-vopp/code-/main/confhacap.sh" 
bash "/root/panel/confhacap.sh"
red "Hạ cấp hoàn tất"
rm /root/LinuxPanel_EN-6.8.23.zip /root/panel/ -rf
}



# menu
function start_menu(){
    clear
    purple " Chào mừng bạn đến với tool aaPanel."
    yellow " ————————————————————————————————————————————————"
    green " 1. Cài đặt aaanel bản gốc (cho CentOS)"
    green " 2. Chặn speedtestspeedtest"
    yellow " ————————————————————————————————————————————————"
    green " 3. Hạ cấp xuống bản ổn định 6.8.23 (một ssố chỗ tiếng Trung)"
    green " 4. Mở khoá chặn speedtest"
    green " 5. Crack bản aaPanel hiện tại (ưu tiên cài mới) "
    green " 6. Antiddos L4"
    green " 7. Cài đặt aaPanel bản Trung (cho CentOS)"
    yellow " ————————————————————————————————————————————————"
    green " 8. Gỡ cài đặt bản aaPanel hiện tại"
    green " 0. Thoát giao diện tool"

    echo
    read -p "Vui lòng chọn chức năng:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           aapanelgoc
	    ;;
        2 )
           blockspeed
        ;;
        3 )
           hacap
        ;;
        4 )
           unspeedtest
        ;;
        5 )
           panelcrack
        ;;
        6 )
           anti-l4
        ;;
        7 )
           aapanelTQ
        ;;
        8 )
           uninstall
        ;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "Vui lòng nhập đúng số"
            start_menu
        ;;
    esac
}
start_menu "first"
