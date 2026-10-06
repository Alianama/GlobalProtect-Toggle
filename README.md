# gp — GlobalProtect start/stop untuk macOS

GlobalProtect dijalankan `launchd` dengan KeepAlive, jadi force close tidak mempan (langsung hidup lagi).
Script ini mematikan/menyalakan service-nya lewat `launchctl`.

## Install

```bash
git clone <URL-REPO> gp-toggle
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

- Setelah restart Mac, GlobalProtect jalan otomatis lagi — jalankan `gp stop` kalau tidak dipakai.
- Jika Mac dikelola MDM kantor, cek kebijakan IT sebelum mematikan VPN.

## Uninstall

```bash
sudo rm /usr/local/bin/gp
```
