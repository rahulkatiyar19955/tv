#!/bin/sh
# Author : Rahul Katiyar


sudo echo "disable_splash=1" >> /boot/config.txt
sudo echo "disable_overscan=1" >> /boot/config.txt
echo "changing pix script"
sudo cp -f pix.script /usr/share/plymouth/themes/pix/pix.script
echo "changing cmdline.."
sudo replace "console=tty1" "console=tty3" -- /boot/cmdline.txt
sudo cp -f /boot/cmdline.txt cmdline.txt
echo "adding boot screen"
sudo cp -f splash.png /usr/share/plymouth/themes/pix/splash.png
echo "disabling login prompt"
sudo systemctl disable getty@tty1
echo "rebooting"
sudo reboot