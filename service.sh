#!/sbin/sh

# Sleep before the script executed (in seconds)
sleep 110

# Multi User Support
for i in $(ls /data/user/)
do
# Disable collective Device administrators
pm disable com.google.android.gms/com.google.android.gms.auth.managed.admin.DeviceAdminReceiver
pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver
pm disable com.google.android.gms/.chimera.GmsIntentOperationService
pm disable com.google.android.gms/com.google.android.gms.mdm.receivers.MdmDeviceAdminReceiver

# Disable GMS / IMS / Others run in startup and restart it on boot
cmd appops set com.google.android.gms BOOT_COMPLETED ignore
cmd appops set com.google.android.ims BOOT_COMPLETED ignore
cmd appops set com.google.android.gms BOOT_COMPLETED ignore
cmd appops set com.google.android.ims BOOT_COMPLETED ignore
cmd appops set com.google.android.gms.location.history BOOT_COMPLETED ignore
cmd appops set com.google.android.gm BOOT_COMPLETED ignore
cmd appops set com.google.android.marvin.talkback BOOT_COMPLETED ignore
cmd appops set com.google.android.apps.googleassistant BOOT_COMPLETED ignore
cmd appops set com.google.android.apps.carrier.log BOOT_COMPLETED ignore
cmd appops set com.android.providers.partnerbookmarks BOOT_COMPLETED ignore
cmd appops set com.google.android.apps.wellbeing BOOT_COMPLETED ignore
cmd appops set com.google.android.as BOOT_COMPLETED ignore
cmd appops set com.android.connectivity.metrics BOOT_COMPLETED ignore
cmd appops set com.android.bips BOOT_COMPLETED ignore
cmd appops set com.google.android.printservice.recommendation BOOT_COMPLETED ignore
cmd appops set com.android.hotwordenrollment.xgoogle BOOT_COMPLETED ignore
cmd appops set com.google.android.printservice.recommendation BOOT_COMPLETED ignore
cmd appops set com.android.hotwordenrollment.xgoogle BOOT_COMPLETED ignore


# Disable GMS and IMS run in startup and restart it on boot (custom permissions for Oxygen OS)
cmd appops set com.google.android.gms AUTO_START ignore
cmd appops set com.google.android.ims AUTO_START ignore
cmd appops set com.xiaomi.finddevice AUTO_START ignore
cmd appops set com.miui.analytics AUTO_START ignore
cmd appops set com.google.android.gms.location.history AUTO_START ignore
cmd appops set com.google.android.gm AUTO_START ignore
cmd appops set com.google.android.marvin.talkback AUTO_START ignore
cmd appops set com.google.android.apps.googleassistant AUTO_START ignore
cmd appops set com.google.android.apps.carrier.log AUTO_START ignore
cmd appops set com.android.providers.partnerbookmarks AUTO_START ignore
cmd appops set com.google.android.apps.wellbeing AUTO_START ignore
cmd appops set com.google.android.as AUTO_START ignore
cmd appops set com.android.connectivity.metrics AUTO_START ignore
cmd appops set com.android.bips AUTO_START ignore
cmd appops set com.google.android.printservice.recommendation AUTO_START ignore
cmd appops set com.android.hotwordenrollment.okgoogle AUTO_START ignore
cmd appops set com.android.hotwordenrollment.xgoogle AUTO_START ignore

done

exit 0
