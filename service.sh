#!/system/bin/sh

keycheck="$(dirname "$0")/keycheck"
chmod 0700 "$keycheck"

process()
{
	case "$1" in
	1) echo "error"; exit;;
	41) echo "down"; key=down;;
	42) echo "up"; key=up;;
	esac
}

"$keycheck" || process "$?"
"$keycheck" || process "$?"
"$keycheck" || process "$?"

[ "$(getprop "sys.boot_completed")" = "1" ] && echo "boot completed" && exit

if [ "$key" = up ]
then	rm /data/system/users/0/package-restrictions.*
	settings delete secure enabled_accessibility_services
	reboot
elif [ "$key" = down ]
then :
else :
fi