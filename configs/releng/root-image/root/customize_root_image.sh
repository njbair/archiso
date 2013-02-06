#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /bin/zsh root
cp -aT /etc/skel/ /root/

useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /bin/zsh arch
useradd -m -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -d /home/njbair -s /bin/zsh njbair

/home/njbair/dotfiles/install.sh /home/njbair/dotfiles

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/*

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

sed 's#\(^ExecStart=-/sbin/agetty\)#\1 --autologin njbair#;
     s#\(^Alias=getty.target.wants/\).\+#\1autologin@tty1.service#' \
     /usr/lib/systemd/system/getty@.service > /etc/systemd/system/autologin@.service

systemctl disable getty@tty1.service
systemctl enable multi-user.target pacman-init.service autologin@.service dhcpcd.service gpm.service
