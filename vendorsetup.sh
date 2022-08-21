lunch_others_targets=()
for device in $(python vendor/aosp/tools/get_official_devices.py)
do
    for var in user userdebug eng; do
        lunch_others_targets+=("aosp_$device-$var")
    done
done

# Android 13 Automatic NDK_Platform changer
# Replaces ndk_platform with ndk for SDK33 Environment
(cd vendor/qcom && find . -type f -exec sed -i 's/ndk_platform/ndk/g' {} + )
(cd hardware && find . -type f -exec sed -i 's/ndk_platform/ndk/g' {} + )
