# Outputs current device's name in prompt format
android_device_info () {
    local dev
    if [[ ! -z "$ANDROID_SERIAL" ]]; then
        dev=$(adb devices -l | grep model | awk '{print $1,$5}' | awk -v serial=$ANDROID_SERIAL -F':' '{ if (match($1, serial) == 1) {print $2}}')
        echo "[%{$fg_bold[green]%}$dev%{$reset_color%}]"
    fi
}
