# Lajto's Debian desktop config

My personal configuration for Debian in desktop.

After installation:

```sh
su

gedit /etc/apt/sources.list  # add to all: contrib non-free
# Add:
# # buster-backports
# deb http://httpredir.debian.org/debian bullseye-backports main contrib non-free
# deb-src http://httpredir.debian.org/debian bullseye-backports main contrib non-free

apt update && apt upgrade

gedit /etc/sudoers
# Add:
# lajto   ALL=(ALL) ALL
```

Reboot, and after that:

```sh
sudo apt install git make

git clone https://github.com/lajtomekadimon/debian-desktop-config
cd debian-desktop-config

make -s configure
make -s programming
make -s telegram
make -s nvidia

cd ..
rm -Rf debian-desktop-config
```

Install fonts from files.

Reboot, and after that, install manually:

- VS Code (sync config)
- DBeaver

Configure Firefox properly and change this in `about:config`:

- Set `extensions.pocket.enabled` to `false`.
- Set `middlemouse.paste` to `false`.
- Create new String value called `widget.content.gtk-theme-override`: `Adwaita`.

Configure these programs:

- GNOME
- GNOME Tweaks
- GNOME Terminal
- GNOME Disks
- Gedit
- Nautilus
- Rhythmbox
- Transmission
- VS Code
- Telegram Desktop
- LibreOffice

Create custom GNOME shortcuts:

- Open terminal: `gnome-terminal` (Ctrl+Alt+T)

Reboot, and ready to go!