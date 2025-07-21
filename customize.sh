
for file in CHANGELOG.md
do rm "$MODPATH/$file"
done


ui_print "- Setting file permissions"

set_perm_recursive "$MODPATH/bin" 0 0 0755 0755
set_perm_recursive "$MODPATH/scripts" 0 0 0755 0755
set_perm "$MODPATH/service.sh" 0 0 0755
