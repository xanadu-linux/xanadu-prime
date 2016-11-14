#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
LC_ALL=C
if [[ "$EUID" != "0" ]]; then
	echo -e "\e[00;31mERROR: DEBES SER ROOT\e[00m"
	exit 1
fi
trap "rm -f /run/$(basename $0).pid; exit" 0 1 2 3 15
echo "$BASHPID" > /run/$(basename $0).pid

function limpieza_1 (){
	history -c
	rm -rf /root/.local/share/Trash/*
	rm -rf /home/*/.local/share/Trash/*
	rm -rf /home/*/.mozilla/firefox/*/*Cache*
	rm -rf /usr/share/doc/*
	rm -rf /usr/share/gtk-doc/*
	rm -rf /usr/share/help/*
	rm -rf /usr/share/info/*
	rm -rf /usr/share/kde4/*
	rm -rf /usr/share/lintian/*
	rm -rf /var/cache/man/*
	rm -rf /tmp/*
	rm -rf /var/tmp/*
	rm -rf /etc/apt/old/*
	rm -rf /usr/share/icons/Mint-X-Dark/*
	rm -rf /usr/share/icons/nuoveXT2/*
	rm -rf /usr/share/themes/Crux/*
	rm -rf /usr/share/themes/Industrial/*
	rm -rf /usr/share/themes/Mikachu/*
	rm -rf /usr/share/themes/Mint-X/*
	rm -rf /usr/share/themes/Mint-Z/*
	rm -rf /usr/share/themes/Mist/*
	rm -rf /usr/share/themes/Natura/*
	rm -rf /usr/share/themes/Onyx/*
	rm -rf /usr/share/themes/Onyx-Citrus/*
	rm -rf /usr/share/themes/Orang/*
	rm -rf /usr/share/themes/Raleigh/*
	rm -rf /usr/share/themes/Redmond/*
	rm -rf /usr/share/themes/Syscrash/*
	rm -rf /usr/share/themes/ThinIce/*
	rm -rf /usr/share/themes/Artwiz-boxed/*
	rm -rf /usr/share/themes/Bear2/*
	rm -f /etc/iceweasel/searchplugins/common/debsearch.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/amazon*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/bing*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/drae*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/eBay*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/twitter*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/wikipedia*.xml
	rm -f /etc/iceweasel/searchplugins/locale/*/yahoo*.xml
	rm -f /usr/share/images/desktop-base/debian-blueish-wallpaper-640x480.png
	rm -f /usr/share/images/desktop-base/debian-blueish-wallpaper.svg
	rm -f /usr/share/images/desktop-base/debian-blueish-wallpaper-widescreen.svg
	rm -f /usr/share/images/desktop-base/gnome-splash-curves.png
	rm -f /usr/share/images/desktop-base/joy-inksplat-wallpaper_1920x1080.svg
	rm -f /usr/share/images/desktop-base/moreblue-orbit-grub.png
	rm -f /usr/share/images/desktop-base/moreblue-orbit-splash.png
	rm -f /usr/share/images/desktop-base/moreblue-orbit-wallpaper.png
	rm -f /usr/share/images/desktop-base/moreblue-orbit-wallpaper.svg
	rm -f /usr/share/images/desktop-base/moreblue-orbit-wallpaper-widescreen.png
	rm -f /usr/share/images/desktop-base/moreblue-orbit-wallpaper-widescreen.svg
	rm -f /usr/share/images/desktop-base/nightly-wallpaper.png
	rm -f /usr/share/images/desktop-base/spacefun-grub.png
	rm -f /usr/share/images/desktop-base/spacefun-grub-widescreen.png
	rm -f /usr/share/images/desktop-base/spacefun-splash.svg
	rm -f /usr/share/images/desktop-base/spacefun-wallpaper.svg
	rm -f /usr/share/images/desktop-base/spacefun-wallpaper-widescreen.svg
	rm -f /usr/share/images/desktop-base/joy-wallpaper_1600x1200.svg
	rm -f /usr/share/images/desktop-base/joy-wallpaper_1920x1080.svg
	rm -f /usr/share/images/desktop-base/joy-wallpaper_1920x1200.svg
	rm -f /usr/share/images/desktop-base/lines-grub.png
	rm -f /usr/share/images/desktop-base/lines-grub-1920x1080.png
	rm -f /usr/share/images/desktop-base/lines-lockscreen_1280x1024.svg
	rm -f /usr/share/images/desktop-base/lines-lockscreen_1600x1200.svg
	rm -f /usr/share/images/desktop-base/lines-lockscreen_1920x1080.svg
	rm -f /usr/share/images/desktop-base/lines-lockscreen_1920x1200.svg
	rm -f /usr/share/images/desktop-base/lines-lockscreen_2560x1080.svg
	rm -f /usr/share/images/desktop-base/lines-wallpaper_1280x1024.svg
	rm -f /usr/share/images/desktop-base/lines-wallpaper_1600x1200.svg
	rm -f /usr/share/images/desktop-base/lines-wallpaper_1920x1080.svg
	rm -f /usr/share/images/desktop-base/lines-wallpaper_1920x1200.svg
	rm -f /usr/share/images/desktop-base/lines-wallpaper_2560x1080.svg
	rm -f /usr/share/lxde/wallpapers/lxde_blue.jpg
	rm -f /usr/share/lxde/wallpapers/lxde_green.jpg
	rm -f /usr/share/lxde/wallpapers/lxde_red.jpg
	rm -f /usr/share/xmms2/silence-cellule_snippet.ogg
	rm -f /var/cache/apt/pkgcache.bin
	rm -f /var/cache/apt/srcpkgcache.bin
	rm -f /etc/apt/preferences.d/exclude.pref
	rm -f /etc/apt/preferences	
	find . -type f -name "readme.*" -exec rm -f {} \;
	find . -type f -name "README.*" -exec rm -f {} \;
	find . -type f -name "README" -exec rm -f {} \;
	find /var/log/ -type f -exec rm -f {} \;
}

function preparar_1 (){
	mkdir -p /etc/fstab.d
	mkdir -p /etc/apt/old
	echo "deb http://httpredir.debian.org/debian sid main contrib non-free" > /etc/apt/sources.list
	echo "deb-src http://httpredir.debian.org/debian sid main contrib non-free" >> /etc/apt/sources.list
	echo "deb http://www.deb-multimedia.org sid main non-free" > /etc/apt/sources.list.d/debmulti.list
	echo "deb-src http://www.deb-multimedia.org sid main" >> /etc/apt/sources.list.d/debmulti.list
	echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list.d/kali.list
	echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list.d/kali.list
	echo "deb http://security.kali.org/kali-security kali-current/updates main contrib non-free" >> /etc/apt/sources.list.d/kali.list
	echo "deb-src http://security.kali.org/kali-security kali-current/updates main contrib non-free" >> /etc/apt/sources.list.d/kali.list
	echo "deb http://httpredir.debian.org/debian experimental main" > /etc/apt/sources.list.d/mirror.list
	echo "deb http://packages.siduction.org/base unstable main" > /etc/apt/sources.list.d/siduction.list
	echo "deb-src http://packages.siduction.org/base unstable main" >> /etc/apt/sources.list.d/siduction.list
	echo "deb http://packages.siduction.org/extra unstable main" >> /etc/apt/sources.list.d/siduction.list
	echo "deb-src http://packages.siduction.org/extra unstable main" >> /etc/apt/sources.list.d/siduction.list
	echo "deb http://packages.siduction.org/user unstable main contrib non-free" >> /etc/apt/sources.list.d/siduction.list
	echo "deb-src http://packages.siduction.org/user unstable main contrib non-free" >> /etc/apt/sources.list.d/siduction.list
	echo "deb http://packages.siduction.org/fixes unstable main contrib non-free" >> /etc/apt/sources.list.d/siduction.list
	echo "deb-src http://packages.siduction.org/fixes unstable main contrib non-free" >> /etc/apt/sources.list.d/siduction.list
	echo "deb http://deb.torproject.org/torproject.org/ sid main" > /etc/apt/sources.list.d/tor.list
	echo "deb-src http://deb.torproject.org/torproject.org/ sid main" >> /etc/apt/sources.list.d/tor.list
	echo "deb http://ppa.launchpad.net/sinfallas/xanadu/ubuntu trusty main" > /etc/apt/sources.list.d/xanadu-ppa.list
	echo "deb-src http://ppa.launchpad.net/sinfallas/xanadu/ubuntu trusty main" >> /etc/apt/sources.list.d/xanadu-ppa.list
	wget -q -O - http://www.kali.org/archive-key.asc | gpg --import
	sed -i 's_proc_#proc_g' /etc/fstab
	echo "proc /proc proc defaults,hidepid=2 0 0" >> /etc/fstab
	echo "tmpfs /run tmpfs rw,nosuid,async,noexec,nodev,noatime,mode=755" >> /etc/fstab
	echo "tmpfs /tmp tmpfs noatime,async,nosuid,noexec,nodev,rw" >> /etc/fstab
	echo "tmpfs /var/cache/samba tmpfs noatime,async,nodev" >> /etc/fstab
	echo "tmpfs /var/spool tmpfs noatime,async,nodev" >> /etc/fstab
	echo "tmpfs /var/tmp tmpfs noatime,async,nosuid,noexec,nodev,rw" >> /etc/fstab 
	echo xanadu-$(date | md5sum | cut -c 1-10) > /etc/hostname
}

function instalar_1 (){
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1378B444
	apt-get update
	apt-get -y install deb-multimedia-keyring deb.torproject.org-keyring kali-archive-keyring siduction-archive-keyring xanadu-archive-keyring
	apt-get -y install xanadu-full
	localepurge
	chmod 644 /usr/lib/libvte9/gnome-pty-helper
	chmod 644 /usr/lib/libvte-2.90-9/gnome-pty-helper
	chmod 644 /usr/bin/lxpolkit
	/bin/echo amd64-microcode hold | /usr/bin/dpkg --set-selections
	/bin/echo dash hold | /usr/bin/dpkg --set-selections
	/bin/echo locales hold | /usr/bin/dpkg --set-selections
	/bin/echo vainfo hold | /usr/bin/dpkg --set-selections
	/bin/echo systemd-shim hold | /usr/bin/dpkg --set-selections
	apt-get -y purge $(deborphan --libdevel) $(deborphan --find-config) bluetooth bluez bluez-alsa bluez-firmware bluez-gstreamer linux-wlan-ng-doc aptitude aptitude-common vim-tiny vim-common
	apt-get -y --force-yes autoremove
	apt-get -y purge $(deborphan)
	apt-get clean
}

function servicios_1 (){
	systemctl disable clamav-freshclam
	systemctl disable fail2ban
	systemctl disable i2p
	systemctl disable memlockd
	systemctl disable ntp
	systemctl disable onioncat
	systemctl disable polipo
	systemctl disable privoxy
	systemctl disable psad
	systemctl disable shorewall
	systemctl disable ssh
	systemctl disable tor
	systemctl enable systemd-readahead-collect systemd-readahead-replay
}

sed -i 's_xanadu_'$(cat /etc/hostname)'_g' /etc/hosts
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT="acpi_osi=Linux swapaccount=1 numa=on apic lapic cgroup_enable=memory security=apparmor apparmor=1 swapaccount=1 panic=10 quiet"/g' /etc/default/grub
chmod 600 /etc/sudoers
update-grub2

iucode_tool --scan-system
update-initramfs -u
chage -M 365 root


hardlink -f -x /sys -t -o /
prelink -amR

# source /usr/bin/variables
sed -i 's_autologin-user=user_#autologin-user=user_g' /etc/lightdm/lightdm.conf
sed -i 's_autologin-user-timeout=0_#autologin-user-timeout=0_g' /etc/lightdm/lightdm.conf
sed -i 's_#greeter-hide-users=false_greeter-hide-users=false_g' /etc/lightdm/lightdm.conf
sed -i 's_#session-cleanup-script=_session-cleanup-script=/usr/bin/fin_g' /etc/lightdm/lightdm.conf
sed -i 's_show-indicators=~language;~session;~power_show-indicators=~session;~power_g' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's_#show-clock=_show-clock=true_g' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's_#clock-format=_clock-format=%a, %d %b %I:%M_g' /etc/lightdm/lightdm-gtk-greeter.conf
sed -i 's_umask 022_umask 027_g' /etc/init.d/rc
sed -i 's_umask 022_umask 027_g' /etc/login.defs
sed -i 's_/bin/bash_/usr/bin/fish_g' /etc/passwd
sed -i 's_service anacron stop_#service anacron stop_g' /etc/rc.local
sed -i 's_service cron stop_#service cron stop_g' /etc/rc.local
echo "default-user-image=/usr/share/images/desktop-base/logo.png" >> /etc/lightdm/lightdm-gtk-greeter.conf
echo "user ALL=(ALL) ALL" > /etc/sudoers.d/live
echo "umask 027" >> /etc/profile
echo "auth required pam_succeed_if.so user != root quiet" >> /etc/pam.d/lightdm
if [ -n "$(lspci | grep -E 'VGA|Display' | head -n1 | cut -d ':' -f3 | grep -F 'Intel')" ]; then
	echo 'Section "Device"' > /etc/X11/xorg.conf
	echo ' Identifier "intel"' >> /etc/X11/xorg.conf
	echo ' Driver "intel"' >> /etc/X11/xorg.conf
	echo ' BusID  "PCI:0:2:0"' >> /etc/X11/xorg.conf
	echo ' Option "AccelMethod" "SNA"' >> /etc/X11/xorg.conf
	echo ' Option "SwapbuffersWait" "false"' >> /etc/X11/xorg.conf
	echo ' Option "Tiling" "true"' >> /etc/X11/xorg.conf
	echo ' Option "BackingStore" "True"' >> /etc/X11/xorg.conf
	echo ' Option "XvMC" "on"' >> /etc/X11/xorg.conf
	echo ' Option "TripleBuffer" "true"' >> /etc/X11/xorg.conf
	echo ' Option "DRI" "true"' >> /etc/X11/xorg.conf
	echo 'EndSection' >> /etc/X11/xorg.conf
fi
if (( $memoria > 4096000 )); then
	echo "tmpfs /var/cache/apt/archives tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
fi
chmod 600 /etc/sudoers
update-grub2

iucode_tool --scan-system
update-initramfs -u
chage -M 365 root

rm -f /run/$(basename $0).pid
exit 0
