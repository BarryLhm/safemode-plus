#!/system/bin/sh

rm /data/system/users/0/package-restrictions.*
settings delete secure enabled_accessibility_services
reboot
