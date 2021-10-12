# code was written and run in Termux
all:
	cd common
	aapt p -f -v -M common/overlay/AndroidManifest.xml -I /system/framework/framework-res.apk -S common/overlay/res -F common/unsigned.apk
	sh tools/zipsigner common/unsigned.apk common/com.android.framework_brightnesstweaks.apk
	rm common/unsigned.apk
	zip -r crDroid-brightness-tweaks.zip . -x .git\* tools/\* Makefile common/overlay\*

clean:
	rm crDroid-brightness-tweaks.zip common/com.android.framework_brightnesstweaks.apk
