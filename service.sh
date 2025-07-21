#!/system/bin/sh

dir="$(dirname "$0")"
keycheck="$dir/keycheck"
chmod 0700 "$keycheck"

count=0
trigger()
{
	count="$((count + 1))"
	case "$1" in
	## error
	1) echo "error"; exit;;
	## volume up
	42) echo "action $count"; action "$count";;
	## others
	*) return;;
	esac
}

action()
{
	[ -d "$dir/scripts/$1" ] || return
	for script in "$dir/scripts/$1/"*.sh
	do "$script" &
	done
}

while true
do	"$keycheck"
	ret="$?"
	[ "$(getprop sys.boot_completed)" = "1" ] && break
	trigger "$ret"
done

echo "boot completed"
exit
