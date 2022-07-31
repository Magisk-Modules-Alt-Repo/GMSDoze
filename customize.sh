#!/sbin/sh

#
# GMS Doze
# Parchea la aplicación de servicios de Google Play y sus procesos en segundo plano para poder usar la optimización de la batería
#
ui_print "Instalando modulo GMS Doze"
# Comprobación del entorno de instalación
if [ $BOOTMODE = true ]; then
ROOT=$(find `magisk --path` -type d -name "mirror" | head -n 1)
ui_print "- Carpeta ROOT: $ROOT"
else
ROOT=""
fi

# Comprobación de la versión Android
sdk="$(getprop ro.build.version.sdk)"
if [[ !"$sdk" -ge "23" ]]; then
ui_print "- Version Android NO soportada: $sdk"
exit 1
fi

# Parchear el XML y colocar el modificado en el directorio original
ui_print "- Parcheando XMLs"
gms=$(xml=$(find /system/ /product/ /vendor/ -iname "*.xml");for i in $xml; do if grep -q 'allow-in-power-save package="com.google.android.gms"' $ROOT$i 2>/dev/null; then echo "$i";fi; done)
ims=$(xml=$(find /system/ /product/ /vendor/ -iname "*.xml");for i in $xml; do if grep -q 'allow-in-power-save package="com.google.android.ims"' $ROOT$i 2>/dev/null; then echo "$i";fi; done)
pst=$(xml=$(find /system/ /product/ /vendor/ -iname "*.xml");for i in $xml; do if grep -q 'allow-in-power-save package="com.google.android.apps.safetyhub"' $ROOT$i 2>/dev/null; then echo "$i";fi; done)
trb=$(xml=$(find /system/ /product/ /vendor/ -iname "*.xml");for i in $xml; do if grep -q 'allow-in-power-save package="com.google.android.apps.turbo"' $ROOT$i 2>/dev/null; then echo "$i";fi; done)

for i in $gms $ims $pst $trb
do
mkdir -p `dirname $MODPATH$i`
cp -af $ROOT$i $MODPATH$i
sed -i '/allow-in-power-save package="com.google.android.gms"/d;/allow-in-data-usage-save package="com.google.android.gms"/d' $MODPATH$i
sed -i '/allow-in-power-save package="com.google.android.ims"/d;/allow-in-data-usage-save package="com.google.android.ims"/d' $MODPATH$i
sed -i '/allow-in-power-save package="com.google.android.apps.safetyhub"/d;/allow-in-data-usage-save package="com.google.android.apps.safetyhub"/d' $MODPATH$i
sed -i '/allow-in-power-save package="com.google.android.apps.turbo"/d;/allow-in-data-usage-save package="com.google.android.apps.turbo"/d' $MODPATH$i
done

for i in product vendor
do
if [ -d $MODPATH/$i ]; then
if [ ! -d $MODPATH/system/$i ]; then
sleep 1
ui_print "- Moviendo archivos a /system..."
mkdir -p $MODPATH/system/$i
mv -f $MODPATH/$i $MODPATH/system/
else
rm -rf $MODPATH/$i
fi
fi
done

# Buscar y parchear cualquier módulo en conflicto (si está presente)
# Buscar archivos XML conflictivos
conflict1=$(xml=$(find /data/adb -iname "*.xml");for i in $xml; do if grep -q 'allow-unthrottled-location package="com.google.android.gms"' $i 2>/dev/null; then echo "$i";fi; done)
conflict2=$(xml=$(find /data/adb -iname "*.xml");for i in $xml; do if grep -q 'allow-ignore-location-settings package="com.google.android.gms"' $i 2>/dev/null; then echo "$i";fi; done)
for i in $conflict1 $conflict2
do
search=$(echo "$i" | sed -e 's/\// /g' | awk '{print $4}')
ui_print "- Modulos conflictivos detectados..."
ui_print "   $search"
sed -i '/allow-unthrottled-location package="com.google.android.gms"/d;/allow-ignore-location-settings package="com.google.android.gms"/d' $i
done

# Complemento adicional para verificar el estado de GMS
ui_print "- Descomprimiendo add-on..."
mkdir -p $MODPATH/system/bin
mv -f $MODPATH/gmsc $MODPATH/system/bin/gmsc
chmod +x $MODPATH/system/bin/gmsc

ui_print "-Ajustando notificaciones...:"
cd /data/data
find . -type f -name '*gms*' -delete

ui_print "Ordenando la casa..."
sleep 1
ui_print "Todo terminado, reinicie su dispositivo..."

# Limpiando
rm -rf $MODPATH/LICENSE
