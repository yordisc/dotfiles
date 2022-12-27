<p align="center">
 
[//]: <> (site para ícones: https://shields.io/ )
 
<img alt="Maintained" src="https://img.shields.io/badge/Maintained%3F-Yes-green">
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/yordisc/dotfiles">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/yordisc/dotfiles">
<img alt="Bitbucket open issues" src="https://img.shields.io/bitbucket/issues/yordisc/dotfiles">
<img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/y/yordisc/dotfiles">
<a href="#"><img src="https://badges.pufler.dev/visits/yordisc/dotfiles">

<hr>

# Dotfiles
Este Dotfiles esta hecho particularmente para ayudarme a instalar cosas que considero que se pueden hacer mas rapido, Igualmente espero que sea de utilidad para el que lo necesite.

Mi diestro favorito es Debian por lo que mayormente esta pensado para que funcione bien en Debian.

## Dependencias 

```bash
sudo apt install dialog git inxi -y
```

```bash
sudo dnf install dialog git inxi -y
```

```bash
sudo pacman -S dialog git inxi -y
```
### Instalar RPM Fusion Fedora
```bash
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```
### Instalar Chaotic Aur
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

## Instalador
1) Se coloca el nombre del usuario al que se le quiera instalar los programas
2) Se coloca el paquete que se quiera usar según la distribución: Deb , Rpm , Aur.
3) Se selecciona lo que se quiera instalar (hay tres menus asi que si no vas a instalar nada de uno presiona ENTER y ve al siguiente menu)
```bash
git clone https://github.com/yordisc/dotfiles && chmod 777 dotfiles/* -R && cd dotfiles/ && sudo bash dotfiles.sh
```
## Nerdfons completas
```bash
git clone https://github.com/ryanoasis/nerd-fonts
unzip nerd-fonts-master.zip
cd nerd-fonts
sudo bash ./install.sh
```

## Disco automatico

## Diestros recomendados
* [Spiral Linux XFCE](https://spirallinux.github.io/#download)
* [Fedora XFCE](https://spins.fedoraproject.org/xfce/download/index.html)
* [Manjaro XFCE](https://manjaro.org/download/)

## Paginas de interes

## Recursos usados / Creditos