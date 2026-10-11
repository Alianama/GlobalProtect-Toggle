# gp — GlobalProtect start/stop untuk macOS

GlobalProtect dijalankan `launchd` dengan KeepAlive, jadi force close tidak mempan (langsung hidup lagi).
Script ini mematikan/menyalakan service-nya lewat `launchctl`.

## Install

```bash
git clone https://github.com/Alianama/GlobalProtect-Toggle.git gp-toggle
cd gp-toggle
sudo install -m 755 gp /usr/local/bin/gp
```

## Pakai

```bash
gp stop     # matikan GlobalProtect (minta password sudo)
gp start    # nyalakan lagi
gp status   # cek status
```

## Catatan

- Setelah `gp start`, GlobalProtect **tidak** auto-start lagi saat login/restart — nyalakan manual dengan `gp start` kapan perlu.
- Untuk mematikan auto-start tanpa menyalakan VPN:
  `launchctl disable gui/$(id -u)/com.paloaltonetworks.gp.pangpa && launchctl disable gui/$(id -u)/com.paloaltonetworks.gp.pangps`
- Jika Mac dikelola MDM kantor, cek kebijakan IT sebelum mematikan VPN.

## Uninstall

```bash
sudo rm /usr/local/bin/gp
```
