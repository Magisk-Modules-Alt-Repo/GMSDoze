# GMS Doze (Optimizado y mejorado, basado en GMS Universal Doze 1.8.6) - (Bloquea Find My Device)

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
> su
> gmsc
```
- Línea de comandos para verificar la optimización (en general):
Hay una línea escrita `Whitelist (except idle) system apps:` y si la línea `com.google.android.gms` no existe, significa que los servicios de Google Play están optimizados.
```
> su
> dumpsys deviceidle
```
---
## Créditos
- [@topjohnwu](https://github.com/topjohnwu) / Magisk - Magisk Module Template
- [@JumbomanXDA](https://github.com/JumbomanXDA) / Custom installation script
- [@Gloeyisk] (https://github.com/gloeyisk/universal-gms-doze) / (GMS Universal Doze).
- CypherCloud (Por facilitar opciones avanzadas)
