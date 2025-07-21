#!/system/bin/sh

orig_set="$(settings get global adb_enabled)"
orig_prop="$(getprop sys.usb.config)"

enable()
{
	resetprop ro.adb.secure 0
	setprop sys.usb.config adb
	settings put global adb_enabled 1
}

disable()
{
	resetprop ro.adb.secure 1
	setprop sys.usb.config 0
	settings put global adb_enabled 0
	setprop sys.usb.config "$orig_prop"
	settings put global adb_enabled "$orig_set"
}

while [ "$(getprop "sys.boot_completed")" != 1 ]
do	enable
	sleep 1
done

disable
