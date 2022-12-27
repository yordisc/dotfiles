# Dotfiles
Este Dotfiles esta hecho particularmente para ayudarme a instalar cosas que considero que se pueden hacer mas rapido, Igualmente espero que sea de utilidad para el que lo necesite.

Mi diestro favorito es Debian por lo que mayormente esta pensado para que funcione bien en Debian.

# Dependencias 
## (Debian)
```bash
sudo apt install dialog git inxi -y
```
## (Fedora)
```bash
sudo dnf install dialog git inxi -y
```
## (Arch)
```bash
sudo pacman -S dialog git inxi -y
```

## Instalador
```bash
git clone https://github.com/yordisc/dotfiles && chmod 777 dotfiles/* -R && cd dotfiles/ && sudo bash dotfiles.sh
```

## Instalar RPM Fusion Fedora
```bash
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

## Instalar Chaotic Aur
```bash
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman-key --init
sudo pacman -Syyu
sudo echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> -a /etc/pacman.conf
sudo pacman -Syyu
```

## Remover numlock
## Nerdfons completas
## Disco automatico

## Diestros recomendados
[Spiral Linux XFCE](https://spirallinux.github.io/#download)
[Fedora XFCE](https://spins.fedoraproject.org/xfce/download/index.html)
[Manjaro XFCE](https://manjaro.org/download/)
## Recursos usados / Creditos