ui_print "- Adding configuration tweaks to system"
mkdir -p "$MODPATH"/system/product/overlay
cp_ch "$MODPATH"/common/com.android.framework_brightnesstweaks.apk "$MODPATH"/system/product/overlay

ui_print "- Backing up important stuffs to module directory"
mkdir -p "$MODPATH"/backup/
cp /data/system/overlays.xml "$MODPATH"/backup/
	