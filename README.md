# safemode-plus

Safe Mode + Magisk module

A magisk module to cooperate with safe mode feature of Magisk/KernelSU/Apatch...

### Important Notice:
Please manually chattr +i the module directory after installation
to keep it not been disabled after entering safe mode. (though it will not be
run in safe mode, it will function on next boot since it's not disabled.)

- Functions:
# Press Volume up button specified times to trigger corresponding function
1 (first press-down):
 Keep `adb` on during boot to simplify debugging/rescue
2 (first key-up)
 (currently nothing)
3 (second press-down):
 Recover disabled/user-uninstalled system apps
