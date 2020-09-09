PACKAGE=$(adb shell pm list packages | grep $1 | cut -f2 -d:| sed -e "s/\r//g")

if [ -z "${PACKAGE}" ]; then
    echo "No packages found named $1"
    exit
else
    echo "Found $PACKAGE"
    mkdir $PACKAGE
    cd $PACKAGE
    APKS=$(awk -F ':' '{print $2}' <<<$(adb shell pm path $PACKAGE))
    echo $APKS
    for APK in $APKS; do
        echo $APK
        adb pull $APK
    done
fi
