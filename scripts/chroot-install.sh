#!/bin/env bash
# Written by: vividsystem
# License: MIT

$efidirectory = "${1}/boot"
$aurpkgs = $2

# Timezone 
echo "Displaying regions"
ls /usr/share/zoneinfo
read -p "Region: " region
echo "Showing cities"
ls /usr/share/zoneinfo/$region
read -p "City: " city

ln -sf /usr/share/zoneinfo/$region/$city /etc/localtime
hwclock --systohc
echo "Done setting timezone (set to: ${region}/${city})"

# LANG/KEYMAP
echo "Edit locale.gen"
vim /etc/locale.gen
locale-gen
read -p "LANG: " lang
echo "LANG=${lang}" > /etc/locale.conf
echo "Set LANG succesfully"

read -p "keymap: " keymap
echo "KEYMAP=${keymap}" > /etc/vconsole.conf
timedatectl set-x11-keymap $keymap

# Hostname
read -p "Hostname: " hostname
echo $hostname > /etc/hostname

# Initramfs
echo "Making initramfs"
mkinitcpio -P

#uncomment wheel
EDITOR=vim visudo

# root password
passwd

# New User
echo "Create new admin"
read -p "username: " user
useradd -m $user
$defaultgroups = "wheel,video,audio,storage,input"
read -e -i $defaultgroups -p "groups(default: ${defaultgroups}): " usergroups
usermod -aG $usergroups $user
echo "Set password "
passwd $user

systemctl enable NetworkManager
systemctl enable iwd

# YAY
git clone https://aur.archlinux.org/yay-git.git yay-git
cd yay-git
makepkg -si 
cd ../
rm -rf yay-git

$aurpkgs = tr '\n' ' ' < aur-packages.txt
yay -Sy $aurpkgs

systemctl enable ly

# Dotfiles

sudo -u someuser bash << EOF
read -e -i "vividsystem/dotfiles" -p "dotfiles (default: vividsystem/dotfiles): " dotfiles
git clone $dotfiles $HOME/dotfiles
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/vividsystem/bullet-train.zsh/master/bullet-train.zsh-theme -o $HOME/.oh-my-zsh/themes
mv $HOME/.zshrc $HOME/.zshrc.default
cp $HOME/dotfiles/.zshrc $HOME/
cp -r $HOME/dotfiles/.config/* $HOME/.config/
cp $HOME/dotfiles/.xinitrc $HOME/
cp -r $HOME/dotfiles/.xmonad $HOME/
git clone https://github.com/lcpz/lain $HOME/.config/awesome/lain
EOF


# GRUB
grub-install --target=x86_64-efi --efi-directory $efidirectory --bootloader-id=GRUB
grub-mkconfig -o $efidirectory/grub/grub.cfg


echo "Finished! Reboot and try your fresh install."