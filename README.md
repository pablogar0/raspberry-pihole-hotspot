# 🚀 Raspberry Pi Zero 2 WH - Pi-hole + Hotspot Fallback

Este proyecto convierte tu Raspberry Pi Zero 2 WH en un bloqueador de anuncios portátil y una herramienta de configuración de red. Si no encuentra una red Wi-Fi conocida al arrancar, **crea su propia red Wi-Fi (`RedPi`) automáticamente** para que puedas conectarte y configurarla.

---

## ✨ Características principales

- ✅ **Pi-hole preinstalado** para bloquear anuncios a nivel de red
- 📡 **Hotspot automático (`RedPi`)** si no hay Wi-Fi disponible
- 🔧 Script para **añadir nuevas redes Wi-Fi** desde la consola
- 🔍 Muestra su **IP actual + QR** al arrancar para acceder desde el móvil fácilmente
- 💾 Organización limpia para mantenerla como herramienta profesional

---

## 🗂️ Estructura del repositorio

```
raspberry-pihole-hotspot/
├── README.md
├── .gitignore
├── setup-scripts/
│   ├── check_wifi.sh         # Detecta conexión y lanza hotspot si es necesario
│   ├── wifi-config.sh        # Script interactivo para añadir nuevas redes
├── systemd/
│   └── hotspot-fallback.service  # Servicio para activar el script al arrancar
├── network-config/
│   ├── hostapd.conf          # Configuración de la red Wi-Fi 'RedPi'
│   └── dnsmasq.conf          # DHCP para el hotspot
└── docs/
    └── instrucciones.md      # Instrucciones extendidas

```

---

## ⚙️ Cómo usar

### 1. Instala Raspberry Pi OS Lite en tu microSD

Con Raspberry Pi Imager, activa SSH, configura Wi-Fi, y define el usuario `pablopi`.

### 2. Clona este repositorio o copia los archivos

```bash
git clone https://github.com/tuusuario/raspberry-pihole-hotspot.git
```

### 3. Instala dependencias

```bash
sudo apt update && sudo apt install hostapd dnsmasq qrencode -y
```

### 4. Copia archivos y activa servicio

```bash
sudo cp -r setup-scripts/* /usr/local/bin/
sudo cp -r network-config/* /etc/
sudo cp systemd/hotspot-fallback.service /etc/systemd/system/
sudo chmod +x /usr/local/bin/*.sh
sudo systemctl enable hotspot-fallback
```

---

## 🧪 ¿Qué ocurre al arrancar?

- Si **hay Wi-Fi disponible**:
  - Se conecta, muestra IP y QR en consola.
- Si **no hay red conocida**:
  - Crea red Wi-Fi `RedPi`
  - IP fija: `192.168.4.1`
  - Puedes conectarte desde el móvil y configurar una nueva red con `wifi-config.sh`.

---

## 🧠 Recomendaciones

- Usa el panel web de Pi-hole en: `http://<IP>/admin`
- Puedes usar tu Pi como DNS principal en casa o en redes portátiles
- Si usas DNS secundario (como `8.8.8.8`), parte del bloqueo puede fallar

---

## 📸 Vista previa

![Diagrama del sistema](https://user-images.githubusercontent.com/youruser/fake_diagrama.png)
*(añade una captura o esquema si deseas)*

---

## 📄 Licencia

MIT © 2025 tuusuario
