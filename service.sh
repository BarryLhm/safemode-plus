#!/system/bin/sh

export MODDIR="$(dirname "$0")"
export PATH="$PATH:$MODDIR/bin"

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
	[ -d "$MODDIR/scripts/$1" ] || return
	for script in "$MODDIR/scripts/$1/"*.sh
	do "$script" &
	done
}

while true
do	keycheck
	ret="$?"
	[ "$(getprop init.svc.bootanim)" = "stopped" ] && break
	trigger "$ret"
done

echo "boot completed"
exit
