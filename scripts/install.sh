#!/bin/env bash
# Written by: vividsystem
# License: MIT

# Run after partitioning and network setup

echo "Install Script for x86_64 uefi devices by vividsystem under MIT License"

# Partitions
read -p "EFI-partition: " efipart
read -p "Swap-partition: " swappart
read -p "Root-partition: " rootpart

# Formating
echo "Formating will now begin"
mkfs.fat -F 32 $efipart
echo "Efi-Partition done"
mkswap $swappart

# Mounting
read -p "Root-partition mount point: " rootmnt
mount $rootpart $rootmnt
echo "Mounted ${rootpart} to ${rootmnt}"
mount --mkdir $efipart $rootmnt/boot
echo "Mounted ${efipart} to ${rootmnt}/boot"
swapon $swappart

# Installing Packages
echo "Starting package install"
pacman -Sy
pacstrap -K /mnt
$pkgs = tr '\n' ' ' < packages.txt
$aurpkgs = tr '\n' ' ' < aur-packages.txt
pacstrap -K $rootmnt $pkgs
echo "Finished package install"

# Fstab
genfstab -U $rootmnt >> $rootmnt/etc/fstab
echo "Done generating Fstab"

# Chroot into root
echo "Chrooting into new root"
arch-chroot $rootmnt chrot-install.sh $rootmnt $aurpkgs