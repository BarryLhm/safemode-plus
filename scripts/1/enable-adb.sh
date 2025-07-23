#!/system/bin/sh

orig_prop="$(getprop sys.usb.config)"

enable()
{
	if [ "$insecure" != 1 ]
	then	resetprop ro.adb.secure 0
		setprop ctl.stop adbd
		insecure=1
	fi
	setprop sys.usb.config adb
	setprop ctl.start adbd
}

disable()
{
	resetprop ro.adb.secure 1
	setprop sys.usb.config ''
	setprop sys.usb.config "$orig_prop"
}

until false #[ "$(getprop sys.boot_completed)" = 1 ]
do	enable
	sleep 1
done

disable
