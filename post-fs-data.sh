#!/data/adb/magisk/busybox ash
# shellcheck shell=dash
# shellcheck disable=SC2034
ASH_STANDALONE=1

OL="com.android.framework_brightnesstweaks"
LIST="/data/system/overlays.xml"
if ! grep -q "$OL" $LIST 2>/dev/null; then
  echo "Clearing caches..."
  rm -rf /data/resource-cache/* /data/dalvik-cache/* /system/package_cache/*
  echo "Forcing the system to register our overlay..."
	sed -i "/item packageName=\"${OL}\"/d" $LIST
	sed -i "s|</overlays>|    <item packageName=\"${OL}\" userId=\"0\" targetPackageName=\"android\" baseCodePath=\"/product/overlay/${OL}.apk\" state=\"6\" isEnabled=\"true\" isStatic=\"true\" priority=\"9999\" /></overlays>|" $LIST
fi