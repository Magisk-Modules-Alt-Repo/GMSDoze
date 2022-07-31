# GMS Doze (Optimizado y mejorado, basado en GMS Universal Doze 1.8.6) - Bloquea Find My Device

---
## Vista rápida
- Parchea la aplicación de servicios de Google Play y sus procesos en segundo plano para poder utilizar la optimización de la batería
- Bloquea Find My Device, permite mayor ahorro de energía.
- Soporte API 23 o posterior
- Admite instalaciones de Magisk Live o Custom Recovery
---
## Solución de problemas
- Línea de comandos para verificar la optimización (con el complemento instalado):
```
> su -c gmsc

```
- Línea de comandos para verificar la optimización (en general):
Hay una línea escrita `Whitelist (except idle) system apps:` y si la línea `com.google.android.gms` no existe, significa que los servicios de Google Play están optimizados.
```
> su
> dumpsys deviceidle
```

---
#Descarga
- https://github.com/CrazyBytesVE/GMS-Doze-BlockFindMyDevice/releases

---
## Créditos
- [@topjohnwu](https://github.com/topjohnwu) / Magisk - Magisk Module Template
- [@JumbomanXDA](https://github.com/JumbomanXDA) / Custom installation script
- [@Gloeyisk] (https://github.com/gloeyisk/universal-gms-doze) / (GMS Universal Doze).
- CypherCloud (Por facilitar opciones avanzadas)


***ENGLISH VERSION***

# GMS Doze (Optimized and improved, based on GMS Universal Doze 1.8.6) - Lock Find My Device

---
## Quick View
- Patch Google Play services app and its background processes in order to use battery optimization.
- Locks Find My Device, allows more power saving.
- Support API 23 or later
- Supports Magisk Live or Custom Recovery installations
---
## Troubleshooting
- Command line to verify optimization (with plugin installed):
```
> su -c gmsc

```
- Command line to verify optimization (in general):
There is a line written `Whitelist (except idle) system apps:` and if the line `com.google.android.gms` does not exist, it means that Google Play services are optimized.
```
> su
> dumpsys deviceidle
```

---
#Download
- https://github.com/CrazyBytesVE/GMS-Doze-BlockFindMyDevice/releases

---
## Credits
- [@topjohnwu](https://github.com/topjohnwu) / Magisk - Magisk Module Template
- [@JumbomanXDA](https://github.com/JumbomanXDA) / Custom installation script
- [@Gloeyisk](https://github.com/gloeyisk/universal-gms-doze) / (GMS Universal Doze).
- CypherCloud (For providing advanced options)
