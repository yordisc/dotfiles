#!/bin/bash
# Hecho por Yordis Cujar
# Version 1





tmp_dir=/tmp/dis
########################################################
##  Variables definidas del Diestro
########################################################
installdeb='apt-get install'
installred='dnf install'
installarch='pacman -S'
desinstalldeb='apt-get --purge remove'
desinstallred='dnf remove'
desinstallarch='pacman -R'
updatedeb='apt-get update'
updatered='dnf check-update'
updatearch='pacman -Su'
upgradedeb='apt-get upgrade'
upgradered='dnf upgrade'
upgradearch='pacman -Sy'
autoremovedeb='apt autoremove'
autoremovered='dnf autoremove'
autoremovearch='pacman -R'
reparardeb='apt --fix-broken install'
repararred='dnf distro-sync'
repararearch='pacman -Qdt'
unpackdeb='dpkg -i'
unpackred='rpm -i'
unpackarch='makepkg -si'

##----------------------------------------------------Direcciones y programas----------------------------------##
##----------------------------------#
##----Version NerdFonts DEFINIBLE---##
##----------------------------------#
nerdfontsversion='v2.2.2'
##  https://github.com/ryanoasis/nerd-fonts/releases
##-------------------------------#
##----Keyring DEBIAN DEFINIBLE---#
##-------------------------------#
keyringparrot='parrot-archive-keyring_2021.7+parrot1_all.deb'
keyringkali='kali-archive-keyring_2022.1_all.deb'
keyringkaisen='kaisen-archive-keyring_2020+kaisen1_all.deb'
keyringlinuxmint='linuxmint-keyring_2022.06.21_all.deb'
keyringkxstudio='kxstudio-repos_11.1.0_all.deb'
##----------------------------------#
##----Keyring dirrecciones DEBIAN---#
##----------------------------------#
keyringparrotdir=https://deb.parrot.sh/parrot/pool/main/p/parrot-archive-keyring/$keyringparrot
keyringkalidir=https://archive.kali.org/kali/pool/main/k/kali-archive-keyring/$keyringkali
keyringkaisendir=https://deb.kaisenlinux.org/pool/main/k/kaisen-archive-keyring/$keyringkaisen
keyringlinuxmintdir=http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/$keyringlinuxmint
keyringkxstudiodir=https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/$keyringkxstudio

###########################################################
##  Variables y funciones DEFINIBLES de programas
############################################################

function vscodedeb()

{
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
			sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
			sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
			
}

function vscodered()

{
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

}

chromenamedeb="google-chrome-unstable_current_amd64.deb"
chromenamered="google-chrome-unstable_current_x86_64.rpm"
chromename=$chromenamedeb

function chromedeb()

{
wget https://dl.google.com/linux/direct/$chromename

}

function chromered()

{
wget https://dl.google.com/linux/direct/$chromename

}

slacknamedeb="slack-desktop-latest.deb"
slacknamered="slack-desktop-latest.rpm"
#slacknamearch=
slackname=$slacknamedeb

function slackdeb()

{
wget -q https://slack.com/downloads/instructions/ubuntu -O - \
| tr "\t\r\n'" '   "' \
| grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' \
| sed -e 's/^.*"\([^"]\+\)".*$/\1/g' \
| grep 'slack-desktop' \
| xargs wget -q -O $slacknamedeb

}

function slackred()

{
wget -q https://slack.com/downloads/instructions/fedora -O - \
| tr "\t\r\n'" '   "' \
| grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' \
| sed -e 's/^.*"\([^"]\+\)".*$/\1/g' \
| grep 'slack.*rpm' \
| xargs wget -q -O slack-desktop-latest.rpm

}

zoomnamedeb="zoom_amd64.deb"
zoomnamered="zoom_x86_64.rpm"
zoomname=$zoomdeb
zoomdeb="https://zoom.us/client/latest/zoom_amd64.deb"
zoomred="https://zoom.us/client/latest/zoom_x86_64.rpm"
whatsappdeb=https://ftp5.gwdg.de/pub/linux/debian/mint/packages/pool/import/w/whatsapp-desktop/$whatsappname
teamviewernamedeb="teamviewer_amd64.deb"
teamviewernamered="teamviewer_15.36.8.x86_64.rpm"
teamviewername=$teamviewernamedeb
teamviewerdeb="https://download.teamviewer.com/download/linux/$teamviewernamedeb"
teamviewerred="https://dl.teamviewer.com/download/linux/version_15x/$teamviewernamered"

function githubdesktopdeb()

{
wget -qO - https://mirror.mwt.me/ghd/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
# if you want to use packagecloud.io
			sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list'
# if you want to use the US mirror
			sudo sh -c 'echo "deb [arch=amd64] https://mirror.mwt.me/ghd/deb/ any main" > /etc/apt/sources.list.d/packagecloud-shiftkey-desktop.list'

}


function githubdesktopred()

{
sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'

}

function teamsdeb()

{
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'

}


function teamsred()

{
sudo sh -c 'echo -e "[teams]\nname=teams\nbaseurl=https://packages.microsoft.com/yumrepos/ms-teams\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/teams.repo'
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

}

teamsarch=""


#whatsapparch=""

###########################################################
##  Variables DEFINIBLES del sistema nombre + (deb,feb,arch)
############################################################
#User=$(getent passwd 1000 | awk -F: '{ print $1}')
user=$USER
install=$installdeb
desinstall=$desinstalldeb
update=$updatedeb
upgrade=$upgradedeb
autoremove=$autoremovedeb
reparar=$reparardeb
unpack=$unpackdeb
###############Definibles de programas#########################
vscode=vscodedeb
chrome=chromedeb
slack=slackdeb
zoom=$zoomdeb
whatsapp=$whatsappdeb
teamviewer=$teamviewerdeb
githubdesktop=githubdesktopdeb
teams=teamsdeb


########################################################
#################   MENUS DE INSTALACION   #############
########################################################


	cmddeb=(dialog --title "Debian Proyect" --separate-output --checklist "ESPACIO para seleccionar/ENTER para continuar" 22 80 16)
	cmdred=(dialog --title "RetHat Fundation" --separate-output --checklist "ESPACIO para seleccionar/ENTER para continuar" 22 80 16)
	cmdarch=(dialog --title "ArchLinux" --separate-output --checklist "ESPACIO para seleccionar/ENTER para instalar" 22 80 16)



	debian=(
			0_basic "	Basicos Obligatorios" off
		#A "<----Category: Repositories---->" on
			1_repos "	Grant Standard User Root Access" off
			2_repos "	Contrib and Non-free Repos (DEBIAN)" off
			3_repos "	Respositorios Sid /Kali /Parrot /LinuxMint (DEBIAN)" off
		#B "<----Category: Alternate Installers---->" on
			1_installer "	Snap Packages" off
			2_installer "	Flatpak" off
			3_installer "	Synaptic" off
			4_installer "	PIP" off
		#C "<----Category: Text Editors---->" on
			1_editor "	Nano" off
			2_editor "	Vim" off
			3_editor "	Paquete Nano / nVim" off
			4_editor "	Visual Studio Code" off
		#D "<----Category: Phone---->" on
			1_phone "	android" off
			2_phone "	iphone" off
		#E "<----Category: Terminal Customization---->" on
			1_customize "	Bash" off
			2_customize "	Zsh" off
			3_customize_U "	Oh my Zsh" off
			4_customize_U "	Powerline" off
			5_customize "	Paquete Terminal" off
		#F "<----Category: Web Browsers/Downloaders---->" on
			1_web_U "	Firefox Developer Edition" off
			2_web "	Google Chrome" off
			3_web "	Skype" off
			4_web "	Slack" off
			5_web "	Zoom" off
			6_web "	WhatsApp Desktop" off
			7_web "	Microsoft Teams" off
			8_web "	Transmission/Deluge" off
			9_web "	TeamViewer" off
			10_web "	JDownloader" off
			11_web "	GitHub Desktop" off
			12_web "	GitKraken" off
			13_web "	Docker Desktop" off
		#G "<----Category: Networking---->" on
			1_network "	SAMBA" off
			2_network "	ZFS" off
			3_network_U "	XAMPP" off
			4_network "	ProtonVPN" off
		#H "<----Category: Graphics---->" on
			1_graphics "	Nvidia Driver" off
			2_graphics "	AMD Driver" off
		#I "<----Category: Sound---->" on
			1_sound "	Pulse Audio" off
			2_sound "	ALSA" off
		#J "<----Category: Fonts---->" on
			1_font "	Microsoft fonts" off
			2_font "	Ubuntu fonts" off
			3_font_U "	NerdFonts" off
			4_font_U "	CJK Fonts(6gb Aprox)" off
			5_font_U "	Archcraft Fonts (Bspwm)" off
		#K "<----Category: Media Viewing/Editing/Converting---->" on
			1_media "	VLC" off
			2_media "	Audacity" off
			3_media "	OBS Studio" off
			4_media "	Optical Drive Software" off
			5_media "	FFmpeg" off
		#L "<----Category: Gaming---->" on
			1_gaming "	Steam" off
			2_gaming "	Lutris" off
			3_gaming "	Wine" off
		#N "<----Category: File Explorer---->" on
			#1_files "	Pcmanfm" off
			2_files "	LibreOfficce" off
			3_files_U "	Espanso" off
			4_files_U "	PCloud" off
			5_files "	Paquete Hogar" off
			6_files "	BalenaEtcher" off
		#Ñ "<----Category: Desktop Customization---->" on
			1_desktop_U "	QT matches GTK" off
			2_desktop "	Picom" off
			3_desktop "	I3lock" off
			4_desktop "	Paquete Bspwm" off
		#O "<----Category: Themes/Icons Customization---->" on
			1_themes_U "	Wallpapers" off
			2_themes_U "	Archcraft Themes" off
			3_themes "	Ubuntu Themes" off
			4_themes_U "	Windows Themes" off
			5_themes_U "	MacOS Themes" off
			6_themes_U "	Infinity/Candy/Gruvbox Themes" off
		#P "<----Category: System---->" on
			1_system_U "	Swappiness=10" off
			V "Post Install Auto Clean Up & Update" off)


	redhat=(
			0_basic_rpm "	Basicos Obligatorios" off
		#A "<----Category: Repositories---->" on
		#B "<----Category: Alternate Installers---->" on
			1_installer_rpm "	Snap Packages" off
			2_installer_rpm "	Flatpak" off
			3_installer_rpm "	Yumux" off
			4_installer_rpm "	PIP" off
		#C "<----Category: Text Editors---->" on
			1_editor_rpm "	Nano" off
			2_editor_rpm "	Vim" off
			3_editor_rpm "	Paquete Nano / nVim" off
			4_editor_rpm "	Visual Studio Code" off
		#D "<----Category: Phone---->" on
			1_phone_rpm "	android" off
			2_phone_rpm "	iphone" off
		#E "<----Category: Terminal Customization---->" on
			1_customize_rpm "	Bash" off
			2_customize_rpm "	Zsh" off
			3_customize_U "	Oh my Zsh" off
			4_customize_U "	Powerline" off
			5_customize "	Paquete Terminal" off
		#F "<----Category: Web Browsers/Downloaders---->" on
			1_web_U "	Firefox Developer Edition" off
			2_web_rpm "	Google Chrome" off
			3_web_rpm "	Skype" off
			4_web_rpm "	Slack" off
			5_web_rpm "	Zoom" off
			6_web_rpm "	WhatsApp Desktop" off
			7_web_rpm "	Microsoft Teams" off
			8_web_rpm "	Transmission/Deluge" off
			9_web_rpm "	TeamViewer" off
			10_web_rpm "	JDownloader" off
			11_web_rpm "	GitHub Desktop" off
			12_web_rpm "	GitKraken" off
			13_web_rpm "	Docker Desktop" off
		#G "<----Category: Networking---->" on
			1_network_rpm "	SAMBA" off
			2_network_rpm "	ZFS" off
			3_network_U "	XAMPP" off
			4_network_rpm "	ProtonVPN" off
		#H "<----Category: Graphics---->" on
			1_graphics_rpm "	Nvidia Driver" off
			2_graphics_rpm "	AMD Driver" off
		#I "<----Category: Sound---->" on
			1_sound_rpm "	Pulse Audio" off
			2_sound_rpm "	ALSA" off
		#J "<----Category: Fonts---->" on
			1_font_rpm "	Microsoft fonts" off
			2_font_rpm "	Ubuntu fonts" off
			3_font_U "	NerdFonts" off
			4_font_U "	CJK Fonts(6gb Aprox)" off
			5_font_U "	Archcraft Fonts (Bspwm)" off
		#K "<----Category: Media Viewing/Editing/Converting---->" on
			1_media_rpm "	VLC" off
			2_media_rpm "	Audacity" off
			3_media_rpm "	OBS Studio" off
			4_media_rpm "	Optical Drive Software" off
			5_media_rpm "	FFmpeg" off
		#L "<----Category: Gaming---->" on
			1_gaming_rpm "	Steam" off
			2_gaming_rpm "	Lutris" off
			3_gaming_rpm "	Wine" off
		#N "<----Category: File Explorer---->" on
			#1_files_rpm "	Pcmanfm" off
			2_files_rpm "	LibreOfficce" off
			3_files_U "	Espanso" off
			4_files_U "	PCloud" off
			5_files_rpm "	Paquete Hogar" off
			6_files_rpm "	BalenaEtcher" off
		#Ñ "<----Category: Desktop Customization---->" on
			1_desktop_U "	QT matches GTK" off
			2_desktop_rpm "	Picom" off
			3_desktop_rpm "	I3lock" off
			4_desktop_rpm "	Paquete Bspwm" off
		#O "<----Category: Themes/Icons Customization---->" on
			1_themes_U "	Wallpapers" off
			2_themes_U "	Archcraft Themes" off
			3_themes_rpm "	Ubuntu Themes" off
			4_themes_U "	Windows Themes" off
			5_themes_U "	MacOS Themes" off
			6_themes_U "	Infinity/Candy/Gruvbox Themes" off
		#P "<----Category: System---->" on
			1_system_U "	Swappiness=10" off
			V "Post Install Auto Clean Up & Update" off)


	archlinux=(
			0_basic_aur "	Basicos Obligatorios" off
			1_repos_aur "	Chaotic Aur" off
		#A "<----Category: Repositories---->" on
		#B "<----Category: Alternate Installers---->" on
			1_installer_aur "	Snap Packages" off
			2_installer_aur "	Flatpak" off
			3_installer_aur "	Synaptic" off
			4_installer_aur "	PIP" off
		#C "<----Category: Text Editors---->" on
			1_editor_aur "	Nano" off
			2_editor_aur "	Vim" off
			3_editor_aur "	Paquete Nano / nVim" off
			4_editor_aur "	Visual Studio Code" off
		#D "<----Category: Phone---->" on
			1_phone_aur "	android" off
			2_phone_aur "	iphone" off
		#E "<----Category: Terminal Customization---->" on
			1_customize_aur "	Bash" off
			2_customize_aur "	Zsh" off
			3_customize_U "	Oh my Zsh" off
			4_customize_U "	Powerline" off
			5_customize "	Paquete Terminal" off
		#F "<----Category: Web Browsers/Downloaders---->" on
			1_web_U "	Firefox Developer Edition" off
			2_web_aur "	Google Chrome" off
			3_web_aur "	Skype" off
			4_web_aur "	Slack" off
			5_web_aur "	Zoom" off
			6_web_aur "	WhatsApp Desktop" off
			7_web_aur "	Microsoft Teams" off
			8_web_aur "	Transmission/Deluge" off
			9_web_aur "	TeamViewer" off
			10_web_aur "	JDownloader" off
			11_web_aur "	GitHub Desktop" off
			12_web_U "	GitKraken" off
			13_web_aur "	Docker Desktop" off
		#G "<----Category: Networking---->" on
			1_network_aur "	SAMBA" off
			2_network_aur "	ZFS" off
			3_network_U "	XAMPP" off
			4_network_aur "	ProtonVPN" off
		#H "<----Category: Graphics---->" on
			1_graphics_aur "	Nvidia Driver" off
			2_graphics_aur "	AMD Driver" off
		#I "<----Category: Sound---->" on
			1_sound_aur "	Pulse Audio" off
			2_sound_aur "	ALSA" off
		#J "<----Category: Fonts---->" on
			1_font_aur "	Microsoft fonts" off
			2_font_aur "	Ubuntu fonts" off
			3_font_U "	NerdFonts" off
			4_font_U "	CJK Fonts(6gb Aprox)" off
			5_font_U "	Archcraft Fonts (Bspwm)" off
		#K "<----Category: Media Viewing/Editing/Converting---->" on
			1_media_aur "	VLC" off
			2_media_aur "	Audacity" off
			3_media_aur "	OBS Studio" off
			4_media_aur "	Optical Drive Software" off
			5_media_aur "	FFmpeg" off
		#L "<----Category: Gaming---->" on
			1_gaming_aur "	Steam" off
			2_gaming_aur "	Lutris" off
			3_gaming_aur "	Wine" off
		#N "<----Category: File Explorer---->" on
			#1_files_aur "	Pcmanfm" off
			2_files_aur "	LibreOfficce" off
			3_files_U "	Espanso" off
			4_files_U "	PCloud" off
			5_files_aur "	Paquete Hogar" off
			6_files_aur "	BalenaEtcher" off
		#Ñ "<----Category: Desktop Customization---->" on
			1_desktop_U "	QT matches GTK" off
			2_desktop_aur "	Picom" off
			3_desktop_aur "	I3lock" off
			4_desktop_aur "	Paquete Bspwm" off
		#O "<----Category: Themes/Icons Customization---->" on
			1_themes_U "	Wallpapers" off
			2_themes_U "	Archcraft Themes" off
			3_themes_aur "	Ubuntu Themes" off
			4_themes_U "	Windows Themes" off
			5_themes_U "	MacOS Themes" off
			6_themes_U "	Infinity/Candy/Gruvbox Themes" off
		#P "<----Category: System---->" on
			1_system_U "	Swappiness=10" off
			V "Post Install Auto Clean Up & Update" off)


########################################################
#################   NOMBRE DE FUNCIONES    #############
########################################################


# cambiored
# cambioarch
# update
# installbasicos
# installrootaccess
# installrepositoriodebiannonfree
# installrepositoriodebian
# installsnap
# installflatpak
# installsynaptic
# installpip
# installnano
# installvim
# installnvim
# installvscode
# installandroidsdk
# installiphone
# installbash
# installzsh
# installohmyzsh
# installpowerline
# installpackterminal
# installfirefoxdev
# installgooglechrome
# installskype
# installslack
# installzoom
# installwhatsapp
# installtorrent
# installteamviewer
# installjdownloader
# installgithub
# installgitkraken
# installteams
# installsamba
# installzfs
# installxampp
# installnvidia
# installamd
# installpulseaudio
# installalsa
# installmsfonts
# installubuntufonts
# installnerdfonts
# installcjkfont
# installarchcraftfonts
# installvlc
# installaudacity
# installobs
# installoptical
# installffmpeg
# installsteam
# installlutris
# installwine
# installlibreoffice
# installespanso
# installpcloud
# installpackhome
# installgtk
# installpicom
# installi3lock
# installbspwm
# installwallpapers
# installarchcraft
# installubuntuthemes
# installwindowsthemes
# installmacthemes
# installinfinitythemes
# limpiar
# swappiness10



########################################################
#################       FUNCIONES          #############
########################################################


function cambiored()

{
			install=$installred
			desinstall=$desinstallred
			update=$updatered
			upgrade=$upgradered
			autoremove=$autoremovered
			reparar=$repararred
			unpack=$unpackred

}

function cambioarch()

{
			install=$installarch
			desinstall=$desinstallarch
			update=$updatearch
			upgrade=$upgradearch
			autoremove=$autoremovearch
			reparar=$reparararch
			unpack=$unpackarch
			su $nombre
}

function update()

{
	echo "Updating"
	sudo $update

}


function installbasicos()

{
			sudo $install wget sudo dpkg curl ntfs-3g -yy
			# sudo $desinstall numlockx -yy
			sleep 1s

}


function installrootaccess()

{
			#  Find the standard user you created during installation and make it a variable
			User=$(getent passwd 1000 |  awk -F: '{ print $1}')
			#  Echo the user into the sudoers file
			echo "$User  ALL=(ALL:ALL)  ALL" >> /etc/sudoers
			sleep 1s

}


function installrepositoriodebiannonfree()

{
			echo "#----------------------------Instalando Contrib and Non-free Repos----------------------------#"
			sleep 1s
			cat /etc/apt/sources.list >> /etc/apt/sources.list.bak
			sed -e '/Binary/s/^/#/g' -i /etc/apt/sources.list
			sed -i 's/main/main contrib non-free/gI' /etc/apt/sources.list
			$update
			echo "#----------------------------Instalado Contrib and Non-free Repos----------------------------#"
			sleep 2s

}

function installrepositoriodebian()

{
#Enable Unstable Repos
			echo "#----------------------------Instalando Repositorios SID/Parrot/Kali/LxMint----------------------------#"
			sleep 1s
			sudo $install debian-archive-keyring debian-keyring debian-ports-archive-keyring neurodebian-archive-keyring -yy
			sudo cat /etc/apt/sources.list >> /etc/apt/sources.list.bak
			sudo rm /etc/apt/sources.list
			cd $usuario/dotfiles/
			sudo cp -rf sources.list /etc/apt/
			sudo chmod -R 755 /etc/apt/sources.list
			sudo chown -R $USER /etc/apt/sources.list
			$update
			echo "enabling Extra Repos"
			sudo $install archlinux-keyring pkg-mozilla-archive-keyring ubuntu-archive-keyring ubuntu-keyring -yy
			cd $tmp_dir
			# Kaisen Keyring
			wget $keyringkaisendir
			sudo $unpack $keyringkaisen
			rm kaisen-archive-keyring*
			# Kali Keyring
			wget $keyringkalidir
			sudo $unpack $keyringkali
			rm kali-archive-keyring*
			# Parrot Keyring
			wget $keyringparrotdir
			sudo $unpack $keyringparrot
			rm parrot-archive-keyring*
			# LinuxMint Keyring
			wget $keyringlinuxmint
			sudo $unpack $keyringlinuxmint
			rm linuxmint-keyring*
			# KxStudio Keyring
			wget https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/$keyringkxstudio
			sudo $unpack $keyringkxstudio
			rm kxstudio-repos*
			$update
						echo "
Zsh= sourcesconfig
nano /etc/apt/sources.list
" >> $usuario/Abrir
			echo "#----------------------------Instalado Repositorios SID/Parrot/Kali/LxMint----------------------------#"
			sleep 2s

}

function installsnap()

{
			echo "#----------------------------Instalando Snap----------------------------#"
			sleep 1s
			sudo $update
			sudo $install dbus-user-session && systemctl --user start dbus.service
			sudo $install snapd -yy
			sudo snap install core
#Agregar lanzadores snap
			sudo cp /var/lib/snapd/desktop/applications/* /usr/share/applications/
			echo "#----------------------------Instalado Snap----------------------------#"
			sleep 2s

}


function installflatpak()

{
			echo "#----------------------------Instalando Flatpak----------------------------#"
			sleep 1s
			sudo $install flatpak -yy
			echo "#----------------------------Instalado Flatpak----------------------------#"
			sleep 2s

}


function installsynaptic()

{
			echo "#----------------------------Instalando Synaptic----------------------------#"
			sleep 1s
			sudo $install synaptic -yy
			echo "#----------------------------Instalado Synaptic----------------------------#"
			sleep 2s

}


function installpip()

{
			echo "#----------------------------Instalando PIP----------------------------#"
			sleep 1s
			sudo $install python-pip python3-pip -yy
			echo "#----------------------------Instalado PIP----------------------------#"
			sleep 1s

}


function installnano()

{
			echo "#----------------------------Instalando Nano----------------------------#"
			sleep 1s
			sudo $install nano -yy
			cp -rf $usuario/dotfiles/.nanorc $usuario &&
			sudo chmod -R 755 $usuario/.nanorc
			sudo chown -R $nombre:$nombre $usuario/.nanorc
			echo "#----------------------------Instalado Nano----------------------------#"
			sleep 2s

}


function installvim()

{
			echo "#----------------------------Instalando Vim----------------------------#"
			sleep 1s
			sudo $install vim vim-doc vim-scripts vim-snippets vim-ultisnips vim-fugitive vim-git-hub vim-gitgutter -yy
			echo "#----------------------------Instalado Vim----------------------------#"
			sleep 2s

}


function installnvim()

{
			echo "#----------------------------Instalando NVim personalizado-----------------------------#"
			sleep 1s
			sudo $install curl xterm ranger fzf rxvt-unicode neovim python3-pip powerline tmux python3-neovim -yy &&
			pip3 install pipenv
			cd $usuario
			sudo mkdir -m 755 $usuario/.nvm
			sudo mkdir -m 755 $usuario/.local/share/nvim/site/autoload/
			sudo mkdir -m 755 $usuario/.vim/autoload/
			git clone https://github.com/nvm-sh/nvm.git $usuario/.nvm
			cd $usuario
			wget -P $usuario/.local/share/nvim/site/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			wget -P $usuario/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			sudo $install npm &&
			sudo npm install --global yarn &&
			sudo npm install -g n latest
			sudo npm install -g npm@latest
			# Locally in your project.
			#sudo npm install -D typescript
			#sudo npm install -D ts-node
			#sudo npm install -D tslib @types/node
			# Or globally with TypeScript.
			sudo npm install -g live-server
			sudo npm install -g typescript
			sudo npm install -g ts-node
			sudo npm install -g tslib @types/node
			#Install Rust
			#curl https://sh.rustup.rs -sSf | sh
			#Install jupyter (requiere PIP)
			sudo pip install jupyter
			#Copy Config
			cp -rf $usuario/dotfiles/vim/.config/* $usuario/.config &&
			cp -rf $usuario/dotfiles/vim/.vimrc $usuario &&
			cp -rf $usuario/dotfiles/vim/.vim /$usuario &&
			sudo chown -R 755 $usuario/.vim
			sudo chown -R 755 $usuario/.config/coc
			sudo chown -R 755 $usuario/.config/nvim
			sudo chown -R 755 $usuario/.config/github-copilot
			sudo chmod -R 755 $usuario/.vim/maps.vim
			sudo chmod -R 755 $usuario/.vim/plugins.vim
			sudo chmod -R 755 $usuario/.vim/pluginsconfig.vim
			sudo chmod -R 755 $usuario/.vimrc
			sudo chown -R $nombre:$nombre $usuario/.vim
			sudo chown -R $nombre:$nombre $usuario/.config/coc
			sudo chown -R $nombre:$nombre $usuario/.config/nvim
			sudo chown -R $nombre:$nombre $usuario/.config/github-copilot
			sudo chown -R $nombre:$nombre $usuario/.vim/maps.vim
			sudo chown -R $nombre:$nombre $usuario/.vim/plugins.vim
			sudo chown -R $nombre:$nombre $usuario/.vimrc
			#Ranger
			sudo mkdir -m 755 $usuario/.config/ranger
			sudo chown -R 755 $usuario/.config/ranger
			sudo chown -R $nombre:$nombre $usuario/.config/ranger
			cp -rf $usuario/dotfiles/bspwm/ranger $usuario/.config/ranger
			#Open IA key api
			touch .open_ai
			echo '### KEY API OPEN-IA
### export OPENAI_API_KEY=""' >> example.sh
			sudo chown -R 755 $usuario/.config/.open_ai
			cd $usuario
			echo "#----------------------------Instalado NVim personalizado-----------------------------#"
			sleep 2s

}


function installvscode()

{
			echo "#----------------------------Instalando Visual Studio Code-----------------------------#"
			sleep 1s
			cd $tmp_dir
			sudo $install wget gpg apt-transport-https
			$vscode
			sudo $update
			sudo $install code
			cd $usuario
			# or code-insiders
			echo "#----------------------------Instalado Visual Studio Code-----------------------------#"
			sleep 2s

}


function installandroidsdk()

{
			echo "#----------------------------Instalando Android SDK, ADB, Fastboot, and Build Tools-----------------------------#"
			sleep 1s
			sudo $install android-sdk adb fastboot android-sdk-build-tools android-sdk-common android-sdk-platform-tools -yy
			echo "#----------------------------Instalado Android SDK, ADB, Fastboot, and Build Tools-----------------------------#"
			sleep 2s

}


function installiphone()

{
			echo "#----------------------------Instalando All Packages for iPhone----------------------------#"
			sleep 1s
			sudo $install ideviceinstaller libimobiledevice-utils python-imobiledevice libimobiledevice6 libplist3 libplist-utils python-plist ifuse usbmuxd libusbmuxd-tools gvfs-backends gvfs-bin gvfs-fuse -yy
			sudo echo "user_allow-other" >> /etc/fuse.conf
			sudo usermod -aG fuse $USER
			echo "#----------------------------Instalado All Packages for iPhone----------------------------#"
			sleep 2s

}


function installbash()

{
			echo "#----------------------------Instalando Bash----------------------------#"
			sleep 1s
			sudo $install bash-completion bash-doc fzf -yy
			cd $usuario
			cp -rf $usuario/dotfiles/.bashrc $usuario
			sudo chmod -R 755 .bashrc
			sudo chown -R $nombre:$nombre .bashrc
			echo "#----------------------------Instalado Bash----------------------------#"
			sleep 2s

}


function installzsh()

{
			echo "#----------------------------Instalando Zsh----------------------------#"
			sleep 1s
			sudo $install zsh -yy
			sudo usermod -s /usr/bin/zsh $(whoami)
			# clone
			git clone https://github.com/powerline/fonts.git --depth=1
			# install
			cd fonts
			./install.sh
			# clean-up a bit
			cd ..
			rm -rf fonts
			fc-cache -vf
			echo "#----------------------------Instalado Zsh----------------------------#"
			sleep 2s

}


function installohmyzsh()

{
echo "#----------------------------Instalando Oh my Zsh----------------------------#"
			sleep 1s
			git clone https://github.com/ohmyzsh/ohmyzsh.git $usuario/.oh-my-zsh
			git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/themes/powerlevel10k &&
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$usuario/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
			sudo git clone https://github.com/kutsan/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting &&
			cp -rf $usuario/dotfiles/.zshrc $usuario
			sudo chmod -R 755 .zshrc
			sudo chown -R $nombre:$nombre .zshrc
			cp -rf $usuario/dotfiles/.p10k.zsh $usuario
			sudo chmod -R 755 .p10k.zsh
			sudo chown -R $nombre:$nombre .p10k.zsh
			cp -rf $usuario/dotfiles/.p10k-portable.zsh $usuario
			sudo chmod -R 755 .p10k-portable.zsh
			sudo chown -R $nombre:$nombre .p10k-portable.zsh
			touch $usuario/Abrir
			echo "
chsh -s $(which zsh) && # Cambiar de Bash a Zsh" >> $usuario/Abrir
			# chsh -s $(which zsh) && # Cambiar de Bash a Zsh
			echo "#--------------------------------Oh my ZSH habilitado--------------------------------#"
			sleep 2s

}


function installpowerline()

{
			echo "#----------------------------Instalando Powerline----------------------------#"
			sleep 1s
			sudo $install powerline git -yy
			#Make a powerline font folder
			sudo mkdir /usr/share/fonts/powerline
			# clone powerline fonts from github
			git clone https://github.com/powerline/fonts $tmp_dir
			# change directories into fonts folder created by cloning powerline from github
			cd $tmp_dir/fonts
			# run installation script for powerline fonts
			sudo chmod -R +x install.sh
			sudo bash install.sh
			# copy powerline fonts into the powerline folder wer created eariler
			sudo cp $usuario/.local.share/fonts/*Powerline* /usr/share/fonts/powerline
			cd $usuario
			#backup the bashrc just to be safe
			sudo cp .bashrc .bashrc.bak
			#enable Powerline Shell
			echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
			    source /usr/share/powerline/bindings/bash/powerline.sh
			fi" >> .bashrc
			# Restart Bash
			. .bashrc
			echo "#----------------------------Instalado Powerline----------------------------#"
			sleep 2s

}


function installpackterminal()

{
			echo "#----------------------------Instalando Pack Personal Terminal----------------------------#"
			sleep 1s
			sudo $install jq curl cmake terminator zsh zsh-common htop feh thefuck fake  caca-utils neofetch ncmpcpp cmatrix piu-piu bat ncat nmap ranger mc googler youtube-dl ytfzf pup tty-clock links2 lynx powerline powerline-gitstatus calc w3m w3m-img calendar chafa lolcat lsd lr sl fzf zplug p7zip p7zip-full unrar-free unzip zip -yy
			curl -sS https://webi.sh/lsd | sh
			chsh -s $(which zsh)
			mkdir -p $usuario/.config/terminator/plugins
			#Ranger
			sudo mkdir -m 755 $usuario/.config/ranger
			sudo chown -R 755 $usuario/.config/ranger
			sudo chown -R $nombre:$nombre $usuario/.config/ranger
			cp -rf $usuario/dotfiles/bspwm/ranger $usuario/.config/ranger
			wget https://git.io/v5Zwz -O $usuario"/.config/terminator/plugins/terminator-themes.py"
### Youtube por terminal
			cd $tmp_dir
			git clone https://github.com/pystardust/ytfzf
			cd ytfzf
			sudo make install
			cd $usuario
			mkdir -p ~/.config/ytfzf
			echo "cache_dir="$HOME/.cache/ytfzf"
history_file="$YTFZF_CACHE/ytfzf_hst"
current_file="$YTFZF_CACHE/ytfzf_cur"
thumb_dir="$YTFZF_CACHE/thumb"
YTFZF_HIST=1
YTFZF_LOOP=0
video_pref="360p"
YTFZF_ENABLE_FZF_DEFAULT_OPTS=1
YTFZF_PLAYER="mpv"
thumbnail_viewer="chafa-16"
show_thumbnails="1"">> ~/.config/ytfzf/conf.sh
### traductor
cd ~
git clone https://github.com/soimort/translate-shell
cd translate-shell
make
sudo make install
cd ~
rm -r translate-shell
cd ~
####
			echo "#----------------------------Instalado Pack Personal Terminal------------------------------#"
			sleep 2s

}


function installfirefoxdev()

{
			echo "#----------------------------Instalando Firefox Dev----------------------------#"
			sleep 1s
			cd $tmp_dir
			sudo rm -rf Firefox*
			wget -O FirefoxSetup.tar.bz2 https://download.mozilla.org/\?product\=firefox-devedition-latest-ssl\&os\=linux64
			sudo tar xvf FirefoxSetup.tar.bz2 -C /opt/
			sudo rm -rf Firefox*
			sudo chown -R $USER /opt/firefox
			sudo rm -rf /usr/share/applications/firefox-developer.desktop
			sudo touch /usr/share/applications/firefox-developer.desktop
			sudo chmod -R 755 /usr/share/applications/firefox-developer.desktop
			sudo chown -R $nombre:$nombre /usr/share/applications/firefox-developer.desktop
			echo "[Desktop Entry]
Name=Firefox Developer 
GenericName=Firefox Developer Edition
Exec=/opt/firefox/firefox %u
Terminal=false
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Type=Application
Categories=Application;Network;X-Developer;
Comment=Firefox Developer Edition Web Browser.
StartupWMClass=Firefox Developer Edition">> /usr/share/applications/firefox-developer.desktop
			cd $usuario
			echo "#----------------------------Instalado Firefox Dev----------------------------#"
			sleep 2s

}


function installgooglechrome()

{
			echo "#----------------------------Instalando Gooogle Chrome----------------------------#"
			sleep 1s
			sudo $install wget -yy
			cd $tmp_dir
			rm google-chrome*
			$chrome
			sudo $unpack $chromename
			rm google-chrome*
			cd $usuario
			echo "#----------------------------Instalado Gooogle Chrome----------------------------#"
			sleep 2s

}


function installslack()

{
			echo "#----------------------------Instalando Slack----------------------------#"
			sleep 1s
			sudo $install wget python3 gvfs-bin libappindicator1 -yy
			cd $tmp_dir
			rm slack-desktop*
			$slack
			sudo $unpack $slackname
			rm $slackname
			cd $usuario
			echo "#----------------------------Instalado Slack----------------------------#"
			sleep 2s

}


function installzoom()

{
			echo "#----------------------------Instalando Zoom----------------------------#"
			sleep 1s
			sudo $install wget -yy
			cd $tmp_dir
			rm zoom*
			$zoom
			sudo $unpack $zoomname
			rm zoom*
			cd $usuario
			echo "#----------------------------Instalado Zoom----------------------------#"
			sleep 2s

}

function installwhatsapp()

{
			echo "#----------------------------Instalando WhatsApp Desktop----------------------------#"
			sleep 1s
			sudo $install wget git sudo -yy
			rm $tmp_dir/whatsapp-d*
			wget -P $tmp_dir $whatsapp
			cd $tmp_dir
			sudo $unpack $whatsappname
			rm $tmp_dir/whatsapp-d*
			cd $usuario
			echo "#----------------------------Instalado WhatsApp Desktop----------------------------#"
			sleep 2s

}


function installtorrent()

{
			echo "#----------------------------Instalando Client Torrent----------------------------#"
			sleep 1s
			sudo $install transmission-gtk deluge-gtk -yy
			echo "#----------------------------Instalado Client Torrent----------------------------#"
			sleep 2s

}


function installteamviewer()

{
			echo "#----------------------------Instalando TeamViewer----------------------------#"
			sleep 1s
			sudo $install wget git sudo -yy
			rm $tmp_dir/teamviewer*
			wget -P $tmp_dir $teamviewer
			sudo $unpack $tmp_dir/$teamviewername
			rm $tmp_dir/teamviewer*
			cd $usuario
			echo "#----------------------------Instalado TeamViewer----------------------------#"
			sleep 2s

}



function installjdownloader()

{
			echo "#----------------------------Instalando JDownloader----------------------------#"
			sleep 1s
			sudo $install default-jre -yy
			#sudo $install default-jdk -yy
			rm $tmp_dir/JD2SilentSetup_x64.sh
			wget -P $tmp_dir http://installer.jdownloader.org/JD2SilentSetup_x64.sh
			sudo chmod -R +x $tmp_dir/JD2SilentSetup_x64.sh
			cd $tmp_dir
			sudo bash JD2SilentSetup_x64.sh
			rm $tmp_dir/JD2SilentSetup_x64.sh
			echo "#----------------------------Instalado JDownloader----------------------------#"
			sleep 2s

}


function installgithub()

{
			echo "#----------------------------Instalando GitHub Desktop----------------------------#"
			sleep 1s
			# GitHub Desktop  https://github.com/shiftkey/desktop
			cd $tmp_dir
			$githubdesktop
			sudo $update
			sudo $install git-all github-desktop
			cd $usuario
			echo "#----------------------------Instalado GitHub Desktop----------------------------#"
			sleep 2s

}

function installgitkraken()

{
			echo "#----------------------------Instalando GitKraken----------------------------#"
			sleep 1s
			cd $tmp_dir
			sudo rm -rf gitkraken*
			wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
			sudo tar -xvzf gitkraken-amd64.tar.gz -C /opt/
			sudo rm -rf gitkraken*
			sudo chown -R $USER /opt/gitkraken
			sudo rm -rf /usr/share/applications/gitkraken.desktop
			sudo touch /usr/share/applications/gitkraken.desktop
			sudo chmod -R 755 /usr/share/applications/gitkraken.desktop
			sudo chown -R $nombre:$nombre /usr/share/applications/gitkraken.desktop
			echo "[Desktop Entry]
Name=GitKraken
GenericName=GitKraken
Exec=/opt/gitkraken/gitkraken %u
Terminal=false
Icon=/opt/gitkraken/gitkraken.png
Type=Application
Categories=Application;X-Developer;
Comment=Firefox GitKraken GUI Desktop on github.
StartupWMClass=GitKraken">> /usr/share/applications/gitkraken.desktop
			cd $usuario
			echo "#----------------------------GitKraken----------------------------#"
			sleep 2s

}

function installteams()

{
			echo "#----------------------------Instalando Microsoft Teams-----------------------------#"
			sleep 1s
			cd $tmp_dir
			sudo $install wget gpg apt-transport-https
			$teams
			sudo $update
			sudo $install teams -y
			cd $usuario
			echo "#----------------------------Instalado Microsoft Teams-----------------------------#"
			sleep 2s

}


function installsamba()

{

			echo "#----------------------------Instalando Samba----------------------------#"
			sleep 1s
			### Dependencias Multiplataforma
			sudo $install samba cups net-tools -yy
			### Config
			#backup smb.conf
			sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
			cd /etc/samba/
			sudo rm smb.conf
			sudo cp -rf $usuario/dotfiles/smb.conf /etc/samba/smb.conf
			sudo chmod -R 755 /etc/samba/smb.conf.bak
			sudo chmod -R 755 /etc/samba/smb.conf
			# sudo grep -v -E "^#|^;" /etc/samba/smb.conf.bak | grep . > /etc/samba/smb.conf
            sudo useradd $nombre
            sudo pdbedit -a -u $nombre
            sudo smbpasswd $nombre
            sudo systemctl restart smbd nmbd
            sudo systemctl start smbd nmbd
            sudo systemctl enable smbd nmbd
            sudo chown -R $nombre:$nombre $usuario/Public
			sudo chmod -R 755 $usuario/Public
			sudo chown -R $nombre:$nombre $usuario/Downloads
			sudo chmod -R 755 $usuario/Downloads
			sudo chown -R $nombre:$nombre $usuario/Desktop
			sudo chmod -R 755 $usuario/Desktop
			echo "
Samba: 
sudo chown -R $nombre:$nombre $usuario/Public
sudo chown -R 755 $usuario/Public
sudo chgrp -R sambashare $usuario/Public
" >> $usuario/Abrir
			echo "#----------------------------Instalado Samba----------------------------#"
			
}


function installzfs()

{
			echo "#----------------------------Instalando ZFS----------------------------#"
			sleep 1s
			echo "Installing the headers for your kernel"
			sudo $install linux-headers-"$(uname -r)" linux-image-amd64 -yy
			echo "Installing the ZFS DKMS and Utilities"
			sudo $install zfs-dkms zfsutils-linux -yy
			echo "Installing kernel modules"
			sudo modprobe zfs
			echo "Enabling ZFS Services"
			sudo systemctl enable zfs.target
			sudo systemctl enable zfs-import-cache
			sudo systemctl enable zfs-mount
			sudo systemctl enable zfs-import.target
			sudo systemctl enable zfs-import-scan
			sudo systemctl enable zfs-share
			echo "Starting ZFS Services"
			sudo systemctl start zfs.target
			sudo systemctl start zfs-import-cache
			sudo systemctl start zfs-mount
			sudo systemctl start zfs-import.target
			sudo systemctl start zfs-import-scan
			sudo systemctl start zfs-share
			echo "#----------------------------Instalado ZFS----------------------------#"
			sleep 2s

}


function installnvidia()

{
			echo "#----------------------------Instalando Nvidia Driver----------------------------#"
			sleep 1s
			sudo $install nvidia-driver -yy
			echo "#----------------------------Instalado Nvidia Driver----------------------------#"
			sleep 2s

}


function installamd()

{
			echo "#----------------------------Instalando AMD firmware for graphics cards----------------------------#"
			sleep 1s
			sudo $install firmware-amd-graphics -yy
			echo "#----------------------------Instalado AMD firmware for graphics cards----------------------------#"
			sleep 2s

}


function installpulseaudio()

{
			echo "#----------------------------Instalando PulseAudio----------------------------#"
			sleep 1s
			sudo $install pulseaudio pulseaudio-utils pavucontrol pavucontrol-qt pulseaudio-module-gsettings pulseaudio-module-jack pulseaudio-utils -yy
			echo "#----------------------------Instalado PulseAudio----------------------------#"
			sleep 2s

}


function installalsa()

{
			echo "#----------------------------Instalando ALSA----------------------------#"
			sleep 1s
			sudo $install alsa-utils gstreamser1.0-alsa alsamixergui alsa-tools alsaplayer-gtk alsa-player-daemon alsa-player-common alsa-player-alsa libao-common libao-dbd libao-dev libao4 libasound2 libasound-data libasoundev-libasound-doc libasound-plugins -yy
			echo "#----------------------------Instalado ALSA----------------------------#"
			sleep 2s

}


function installmsfonts()

{
			echo "#----------------------------Instalando Microsoft fonts----------------------------#"
			sleep 1s
			sudo $install ttf-mscorefonts-installer -yy
			cd $tmp_dir
			wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash
			wget https://gist.githubusercontent.com/maxwelleite/913b6775e4e408daa904566eb375b090/raw/cbfd8eb70184fa509fcab37dad7905676c93d587/ttf-ms-tahoma-installer.sh -q -O - | sudo bash
			sudo mkdir -p /usr/share/fonts/truetype/msttcorefonts/ &&
			cd /usr/share/fonts/truetype/msttcorefonts/ &&
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeui.ttf?raw=true -O segoeui.ttf &&# regular
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuib.ttf && # bold
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuib.ttf?raw=true -O segoeuii.ttf && # italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuiz.ttf?raw=true -O segoeuiz.ttf && # bold italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuil.ttf?raw=true -O segoeuil.ttf && # light
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguili.ttf?raw=true -O seguili.ttf && # light italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/segoeuisl.ttf?raw=true -O segoeuisl.ttf && # semilight
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisli.ttf?raw=true -O seguisli.ttf && # semilight italic
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisb.ttf?raw=true -O seguisb.ttf && # semibold
			sudo wget -q https://github.com/martinring/clide/blob/master/doc/fonts/seguisbi.ttf?raw=true -O seguisbi.ttf && # semibold italic
fc-cache -f /usr/share/fonts/truetype/msttcorefonts/ &&
			cd $usuario
			echo "#----------------------------Instalado Microsoft fonts----------------------------#"
			sleep 2s

}


function installubuntufonts()

{
			echo "#----------------------------Instalando Ubuntu fonts----------------------------#"
			sleep 1s
			cd $tmp_dir
			# make an ubuntu font folder
			sudo mkdir /usr/share/fonts/truetype/ubuntu-fonts
			# download ubuntu font family
			sudo $install wget unzip -yy
			wget -P $tmp_dir https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
			unzip *.zip
			# change directories into unzipped ubuntu folder
			cd $tmp_dir/ubuntu-font-family*
			# move all ttf fonts into the ubuntu font folder we created eariler
			sudo mv *.ttf /usr/share/fonts/truetype/ubuntu-fonts/
			# change directories back home
			cd ..
			# remove all files dending in ".zip"
			rm *.zip
			# remove all folders beginning with "ubuntu-font-family"
			rm -r ubuntu-font-family*
			cd $usuario
			echo "#----------------------------Instalado Ubuntu fonts----------------------------#"
			sleep 2s

}


function installcjkfonts()

{
			echo "#------------------------Instalar fuentes CJK Fonts---6GB-----------------------------#"
			sleep 1s
			git clone https://github.com/googlefonts/noto-cjk.git $tmp_dir
			cd $tmp_dir/noto-cjk
			sudo bash gh-release-noto-cjk-sans.sh
			sudo bash gh-release-noto-cjk-serif.sh
			fc-cache -f -v
			cd $tmp_dir
			rm noto-cjk
			cd $usuario
			echo "#--------------------------------CJK Fonts Instaladas--------------------------------#"
			sleep 2s

}

function installnerdfonts()

{
			echo "#------------------------Instalar fuentes NerdFonts-------------------------#"
			sleep 1s
			cd $tmp_dir
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Ubuntu.zip
			unzip Ubuntu.zip
			rm Ubuntu.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/ubuntu
			sudo mv *.ttf /usr/share/fonts/nerd-fonts/ubuntu
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Inconsolata.zip
			unzip Inconsolata.zip
			rm Inconsolata.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/inconsolata
			sudo mv Inconsolata* /usr/share/fonts/nerd-fonts/inconsolata
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/IBMPlexMono.zip
			unzip IBMPlexMono.zip
			rm IBMPlexMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/IBM-Plex-Mono
			sudo mv Blex* /usr/share/fonts/nerd-fonts/IBM-Plex-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/BitstreamVeraSansMono.zip &&
			unzip BitstreamVeraSansMono.zip
			rm BitstreamVeraSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Bit-stream-Vera-Sans-Mono
			sudo mv Bit* /usr/share/fonts/nerd-fonts/Bit-stream-Vera-Sans-Mono
			rm LICENSE*
			rm readme*
			cd $tmp_dir
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Meslo.zip
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
			wget -P $tmp_dir https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
			unzip Meslo.zip
			rm Meslo.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Meslo
			sudo mv Meslo* /usr/share/fonts/nerd-fonts/Meslo
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/FantasqueSansMono.zip
			unzip FantasqueSansMono.zip
			rm FantasqueSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Fantasque-Vera-Sans-Mono
			sudo mv Fantasque* /usr/share/fonts/nerd-fonts/Fantasque-Vera-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/FiraCode.zip
			unzip FiraCode.zip
			rm FiraCode.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/FiraCode
			sudo mv Fira* /usr/share/fonts/nerd-fonts/FiraCode
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/DejaVuSansMono.zip
			unzip DejaVuSansMono.zip
			rm DejaVuSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/DejaVu-Sans-Mono
			sudo mv DejaVu* /usr/share/fonts/nerd-fonts/DejaVu-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/DroidSansMono.zip
			unzip DroidSansMono.zip
			rm DroidSansMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Droid-Sans-Mono
			sudo mv Droid* /usr/share/fonts/nerd-fonts/Droid-Sans-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Hack.zip
			unzip Hack.zip
			rm Hack.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Hack
			sudo mv Hack* /usr/share/fonts/nerd-fonts/Hack
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/LiberationMono.zip
			unzip LiberationMono.zip
			rm LiberationMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Liberation-Mono
			sudo mv Literation* /usr/share/fonts/nerd-fonts/Liberation-Mono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/JetBrainsMono.zip
			unzip JetBrainsMono.zip
			rm JetBrainsMono.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/JetBrainsMono
			sudo mv JetBrains* /usr/share/fonts/nerd-fonts/JetBrainsMono
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Iosevka.zip
			unzip Iosevka.zip
			rm Iosevka.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/Iosevka
			sudo mv Iose* /usr/share/fonts/nerd-fonts/Iosevka
			rm LICENSE*
			rm readme*
			wget -P $tmp_dir https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfontsversion/Noto.zip
			unzip Noto.zip
			rm Noto.zip
			sudo mkdir -p /usr/share/fonts/nerd-fonts/noto
			sudo mv Noto* /usr/share/fonts/nerd-fonts/noto
			rm LICENSE*
			rm readme*
			fc-cache -f -v
			cd $usuario
			echo "#--------------------------------NerdFonts Instaladas--------------------------------#"
			sleep 2s

}


function installarchcraftfonts()

{
echo "#------------------------Instalar fuentes Sistema-------------------------#"
			sleep 1s
			cd $tmp_dir
			#Scientifica
			wget https://github.com/NerdyPepper/scientifica/releases/download/v2.3/scientifica.tar
			tar xf scientifica-v1.2.tar.gz
			# ttfs are recommended
			sudo mv ttf/* /usr/share/fonts/
			# but you may install the otbs if you want to
			sudo mv otb/* /usr/share/fonts
			# bdfs are not recommended
			sudo mv bdf/* /usr/share/fonts
			rm scienti*
			#Archcraft
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/archcraft.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv archcraft.ttf /usr/share/fonts/icon-fonts/
			#Google mdi
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/google-mdi.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv google-mdi.ttf /usr/share/fonts/icon-fonts/
			#Icomoon
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Icomoon-Feather.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Icomoon-Feather.ttf /usr/share/fonts/icon-fonts/
			#MaterialIcons
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsOutlined-Regular.otf
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsRound-Regular.otf
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/MaterialIconsTwoTone-Regular.otf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv MaterialIcons* /usr/share/fonts/icon-fonts/
			#Siji
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Siji.bdf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Siji.bdf /usr/share/fonts/icon-fonts/
			#Typecons
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/typicons.ttf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv typicons.ttf /usr/share/fonts/icon-fonts/
			#Waffle
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/icon-fonts/Waffle.bdf
			sudo mkdir -p /usr/share/fonts/icon-fonts/
			sudo mv Waffle.bdf /usr/share/fonts/icon-fonts/
			#Typewrite
			wget https://github.com/archcraft-os/archcraft-packages/blob/main/archcraft-fonts/files/normal-fonts/Typewriter.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv Typewriter.ttf /usr/share/fonts/normal-fonts/
			#Confortaa
			wget https://www.wfonts.com/download/data/2016/02/15/comfortaa/comfortaa.zip
			unzip comfortaa
			sudo mkdir -p /usr/share/fonts/normal-fonts/Comfortaa
			sudo mv Comfortaa* /usr/share/fonts/normal-fonts/Comfortaa/
#https://github.com/oblador/react-native-vector-icons/tree/master/Fonts
						#FontAwesome
			wget https://github.com/oblador/react-native-vector-icons/blob/master/Fonts/FontAwesome.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv FontAwesome.ttf /usr/share/fonts/normal-fonts/
									#Feather
			wget https://github.com/oblador/react-native-vector-icons/blob/master/Fonts/Feather.ttf
			sudo mkdir -p /usr/share/fonts/normal-fonts/
			sudo mv Feather.ttf /usr/share/fonts/normal-fonts/
			rm Comfortaa*
			rm sharefonts*
			cd $usuario
			echo "#--------------------------------Fuentes de Sistema Instaladas--------------------------------#"
			sleep 2s

}


function installvlc()

{
			echo "#--------------------------------Instalando VLC--------------------------------#"
			sleep 1s
			sudo $install vlc vlc-plugin-bittorrent vlc-plugin-jack -yy
			echo "#--------------------------------Instalado VLC--------------------------------#"
			sleep 2s

}


function installaudacity()

{
			echo "#--------------------------------Instalando Audacity--------------------------------#"
			sleep 1s
			sudo $install audacity -yy
			echo "#--------------------------------Instalado Audacity--------------------------------#"
			sleep 2s

}


function installobs()

{
			echo "#--------------------------------Instalando OBS-Studio--------------------------------#"
			sleep 1s
			sudo $install obs-studio -yy
			echo "#--------------------------------Instalado OBS-Studio--------------------------------#"
			sleep 2s

}


function installoptical()

{
			echo "#--------------------------------Instalando Optical Drive Software--------------------------------#"
			sleep 1s
			sudo $install k3b asunder -yy
			sudo chmod -R 4711 /usr/bin/cdrdao
			sudo chmod -R 4711 /usr/bin/wodim
			echo "#--------------------------------Instalado Optical Drive Software--------------------------------#"
			sleep 2s

}


function installffmpeg()

{
			echo "#--------------------------------Instalando FFmpeg--------------------------------#"
			sleep 1s
			sudo $install ffmpeg -yy
			echo "#--------------------------------Instalado FFmpeg--------------------------------#"
			sleep 2s

}


function installsteam()

{
			echo "#--------------------------------Instalando Steam--------------------------------#"
			sleep 1s
			#Installing Steam
			ulimit -Hn > ulimit.txt
			# fix permissions for scripting
			sudo chown $USER /etc/apt/sources.list.d
			# add 32bit architecture
			sudo dpkg --add-architecture i386
			# update
			sudo $update -yy
			# Install vulkan and mesa drivers
			sudo $install mesa-vulkan-drivers mesa-vulkan-drivers:i386 -yy
			# Install dxvk
			sudo $install dxvk dxvk-wine32-development dxvk-wine64-development vkd3d-demos -yy
			# Install Steam
			sudo $install steam -yy
			# Install game mode
			sudo $install gamemode -yy
			echo "#--------------------------------Instalado Steam--------------------------------#"
			sleep 2s

}


function installlutris()

{			echo "#--------------------------------Instalando Lutris--------------------------------#"
			sleep 1s
			# import wine gpg key
			sudo chown $USER /etc/apt/sources.list
			sudo chmod -R 755 /etc/apt/sources.list
			sudo chown $USER /etc/apt/sources.list.d/
			sudo chmod -R 755 /etc/apt/sources.list.d/
			sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key
			# add wine gpg key
			sudo apt-get-key add winehq.key
			# add wine repository
			sudo touch /etc/apt/sources.list.d/wine.list
			sudo echo "deb https://dl.winehq.org/wine-builds/debian buster main" > /etc/apt/sources.list.d/wine.list
			# update
			sudo $update -yy
			# Install wine staging
			sudo $install --install-recommends winehq-staging -yy
			# Install wine-tricks
			sudo $install winetricks -yy
			# Install PlayOnLinux
			sudo $install playonlinux -yy
			# Import lutris repository key
			sudo wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_11/Release.key -O- | sudo tee /etc/apt/trusted.gpg.d/lutris.asc
			# Add key with apt-get
			sudo apt-get-key add Release.key
			# Add Lutris Repository
			sudo touch /etc/apt/sources.list.d/lutris.list
			echo "deb https://download.opensuse.org/repositories/home:/strycore/Debian_11/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list
			sudo $install lutris -yy
			# Change Permissions to Root
			sudo chown root:root /etc/apt/sources.list
			sudo chmod -R 600 /etc/apt/sources.list
			sudo chown root:root /etc/apt/sources.list.d/
			sudo chmod -R 600 /etc/apt/sources.list.d/
			echo "#--------------------------------Instalado Lutris--------------------------------#"
			sleep 2s

}


function installwine()

{
			echo "#--------------------------------Instalando Wine--------------------------------#"
			sleep 1s
			# import wine gpg key
			sudo dpkg --add-architecture i386 && sudo $update
			sudo $install wine wine32 wine64 libwine libwine:i386 fonts-wine winetricks q4wine -yy
			winecfg
			sudo cp wine.desktop /usr/share/applications/
cd /usr/share/applications/
sudo chmod -R 755 wine.desktop
			echo "#--------------------------------Instalado Wine--------------------------------#"
			sleep 2s

}


function installlibreoffice()

{
			echo "#--------------------------------Instalando LibreOffice--------------------------------#"
			sleep 1s
			sudo $install libreoffice hyphen-es hunspell-es mythes-es auto-multiple-choice libreoffice-help-es libreoffice-l10n-es libreoffice-mysql-connector libreoffice-qt5 libreoffice-script-provider-bsh libreoffice-script-provider-js libreoffice-script-provider-python -yy
			sudo $install liblibreoffice-java libreoffice-java-common libreoffice-texmaths libreoffice-voikko openclipart-libreoffice -yy
			echo "#--------------------------------Instalado LibreOffice--------------------------------#"
			sleep 2s

}


function installespanso()

{
			echo "#--------------------------------Instalando Espanso--------------------------------#"
			sleep 1s
			# Create the $HOME/opt destination folder
			sudo mkdir -p /opt
			cd /opt
			# Download the AppImage inside it
			sudo wget -O /opt/Espanso.AppImage 'https://github.com/espanso/espanso/releases/download/v2.1.8/Espanso-X11.AppImage'
			# Make it executable
			sudo chmod -R 755 /opt/Espanso.AppImage
			# Create the "espanso" command alias
			sudo /opt/Espanso.AppImage env-path register
			# Register espanso as a systemd service (required only once)
			sudo mkdir $usuario/.config/espanso
			sudo cp -rf $usuario/dotfiles/espanso/* $usuario/.config/espanso
			sudo chown -R 755 $usuario/.config
			sudo chown -R $nombre:$nombre $usuario/.config
			sudo espanso service register
			# Start espanso
			espanso start
			espanso
			cd /opt
			./Espanso.AppImage
			echo "#--------------------------------Instalado Espanso--------------------------------#"
			sleep 2s

}


function installpcloud()

{
			echo "#--------------------------------Instalando PCloud--------------------------------#"
			sleep 1s
			cd $tmp_dir
			sudo wget -P $tmp_dir https://p-def4.pcloud.com/cBZnrXB1wZijGdL3ZZZHrUlc7Z2ZZg0LZkZvP5pVZ9zZNFZ8RZTFZqzZpRZJHZIHZvFZaHZgLZlRZt7ZQ5ZCy4sVZPBbv9xnzaVjDnFdKvFA31VNxtQeV/pcloud
			sudo mv pcloud /usr/bin/
			sudo chmod -R 755 /usr/bin/pcloud 
			pcloud
			echo "#--------------------------------Instalado PCloud--------------------------------#"
			sleep 2s

}


function installpackhome()

{
			echo "#--------------------------------Instalando Paquete Hogar--------------------------------#"
			sleep 1s
			sudo $install bleachbit perl aspell catfish peek galculator gnome-multi-writer gparted lightdm lightdm-gtk-greeter-settings midori mousepad feh putty ristretto simple-scan smartmontools abiword telegram-desktop tlp viewnior yad firewalld exfat-utils -yy
			echo "#--------------------------------Instalado Paquete Hogar--------------------------------#"
			sleep 2s

}


function installgtk()

{
			echo "#--------------------------------Make QT match GTK Themes--------------------------------#"
			sleep 1s
			sudo chown $user /etc/environment
			sudo chmod -R 755 /etc/environment
			sudo echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
			sudo chown root:root /etc/environment
			sudo chmod -R 600 /etc/environment
			echo "#--------------------------------Instalado QT/GTK--------------------------------#"
			sleep 2s

}


function installpicom()

{
			echo "#------------------------------Habilitar PICOM---------------------------------#"
			sleep 1s
			sudo $install gcc meson ninja-build python3 cmake pkg-config libpcre3 libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev -yy
			git clone https://github.com/jonaburg/picom $tmp_dir
			cd $tmp_dir/picom
			meson --buildtype=release . build
			ninja -C build
			sudo ninja -C build install
			cd $tmp_dir
			rm picom
			echo "#------------------------------PICOM habilitado--------------------------------#"
			sleep 2s

}


function installi3lock()

{
echo "#-----------------------------Habilitar I3LOCK---------------------------------#"
			sleep 1s
			sudo $install i3lock autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxcb-xtest0-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -yy
			###i3lock-Color
			git clone https://github.com/Raymo111/i3lock-color.git $tmp_dir
			cd $tmp_dir
			sudo bash install-i3lock-color.sh
			###i3lock-fancy
			git clone https://github.com/meskarune/i3lock-fancy.git $tmp_dir
			cd i3lock-fancy
			sudo make install
			cd $usuario
			echo "#-----------------------------I3LOCK habilitado--------------------------------#"
			sleep 2s

}


function installbspwm()

{
echo "#----------------------------Instalando base BSPWM-----------------------------#"
			sleep 1s
			### Dependencias
			sudo $install xterm terminator rxvt-unicode inxi bspwm sxhkd rofi dunst cava maim bmon nitrogen xbacklight gpick light xsettingsd polybar dmenu pcmanfm lxappearance fzf viewnior zenity arandr gnome-screenshot pavucontrol -yy
			### Agregar Dotfiles
			cp -rf $usuario/dotfiles/bspwm/.Xresources.d $usuario
			sudo chown -R 755 $usuario/Xresources.d
			sudo chown -R $nombre:$nombre $usuario/Xresources.d
			cp -rf $usuario/dotfiles/bspwm/.Xresources $usuario
			sudo chmod -R 755 $usuario/Xresources
			sudo chown -R $nombre:$nombre $usuario/Xresources
			cp -rf $usuario/dotfiles/bspwm/.xsettingsd $usuario
			sudo chmod -R 755 $usuario/.xsettingsd
			sudo chown -R $nombre:$nombre $usuario/.xsettingsd
			cp -rf $usuario/dotfiles/bspwm/.gtkrc-2.0 $usuario
			sudo chmod -R 755 $usuario/.gtkrc-2.0
			sudo chown -R $nombre:$nombre $usuario/.gtkrc-2.0
			cp -rf $usuario/dotfiles/bspwm/.hidden $usuario
			sudo chmod -R 755 $usuario/.hidden
			sudo chown -R $nombre:$nombre $usuario/.hidden
			cp -rf $usuario/dotfiles/bspwm/.dmrc $usuario
			sudo chmod -R 755 $usuario/.dmrc
			sudo chown -R $nombre:$nombre $usuario/.dmrc
			cp -rf $usuario/dotfiles/bspwm/.fehbg $usuario
			sudo chmod -R 755 $usuario/.fehbg
			sudo chown -R $nombre:$nombre $usuario/.fehbg
			sudo mkdir -m 755 $usuario/.config/polybar
			sudo chown -R 755 $usuario/.config/polybar
			sudo chown -R $nombre:$nombre $usuario/.config/polybar
			cp -rf $usuario/dotfiles/polybar/* $usuario/.config/polybar
			cp -rf $usuario/dotfiles/bspwm/.config/* $usuario/.config
			sudo chown -R 755 $usuario/.config
			sudo chown -R $nombre:$nombre $usuario/.config
			cd $tmp_dir
			wget https://github.com/archcraft-os/packages/raw/main/x86_64/archcraft-fonts-1.0-3-any.pkg.tar.zst
			tar -xf archcraft-fonts-1.0-3-any.pkg.tar.zst
			sudo cp -r usr /
			### Configurar servicios
			cd $tmp_dir
			sudo systemctl disable mpd
			sudo systemctl disable bluetooth
			sudo systemctl enable NetworkManager
			sudo systemctl start NetworkManager
			### Extras
			#installi3lock
			#installpicom
			installwallpapers
			cd $HOME/dotfiles/bspwm/.config/bspwm/polybar/
			./configbspwm.sh
			cd $usuario
			echo "#----------------------------Base BSPWM instalada------------------------------#"
			sleep 2s

}

function installwallpapers()

{
			echo "#---------Agregando Wallpapers---------#"

			mkdir $tmp_dir/backgrounds
			git clone https://github.com/yordisc/Wallpapers $tmp_dir/backgrounds
			sudo cp -r $tmp_dir/backgrounds/* /usr/share/backgrounds
			### nitrogen
			sudo echo "
dirs=/usr/share/backgrounds;
" >> $usuario/.config/nitrogen/nitrogen.cfg
			### Feh
			sudo echo "
feh --no-fehbg --bg-fill '/usr/share/backgrounds/gruvbox.png'
" >> $usuario/.fehbg
			echo "#---------------------Wallpapers agregados-------------------#"
			sleep 3s
			clear

}


function installarchcraft()

{
#Lyra Icons themes
			echo "Installing Lyra themes"
			wget -P $tmp_dir https://codeload.github.com/yeyushengfan258/Lyra-icon-theme/zip/refs/heads/master
			cd $tmp_dir
			unzip master
			rm master
			cd $tmp_dir/Lyra-icon-theme-master
			sudo chmod -R 755 install.sh 
			sudo ./install.sh -a --all
			cd $tmp_dir
			rm Lyra-icon-theme*
			cd $usuario
			echo "Installing Archcraft themes"
			cd $tmp_dir
#Archcraft Themes
			git clone https://github.com/archcraft-os/archcraft-themes.git
			sudo mv $tmp_dir/archcraft-themes/archcraft*/files/* /usr/share/themes
#Archcraft Icons
			git clone https://github.com/archcraft-os/archcraft-icons.git
			sudo mv $tmp_dir/archcraft-icons/archcraft*/files/* /usr/share/icons
#Archcraft Cursors
			git clone https://github.com/archcraft-os/archcraft-cursors.git
			sudo mv $tmp_dir/archcraft-cursors/archcraft*/files/* /usr/share/icons
			cd $tmp_dir
			rm archcraft*
			sleep 2s

}


function installubuntuthemes()

{
			echo "Installing Ubuntu themes"
#Ubuntu theme
			sudo $install yaru-theme-icon yaru-theme-gtk yaru-theme-sound yaru-theme-unity arc-theme arctica-greeter gtk2-engines-pixbuf gtk2-engines-murrine git autoconf automake libgdk-pixbuf2.0-dev libglib2.0-dev libxml2-utils pkg-config sassc parallel adapt-geta-gtk-theme adwaita-icon-theme gnome-themes-extra gnome-themes-extra-data gnome-themes-extra-standard adwaita-qt -yy
			wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="/usr/share/icons" sh
			sleep 2s

}


function installwindowsthemes()

{
			echo "Installing Windows themes"
#Windows XP Theme
			cd $tmp_dir
			sudo git clone https://github.com/B00merang-Project/Windows-XP
			cd $tmp_dir/Windows-XP
			sudo mv Win* /usr/share/themes
			cd $tmp_dir
			rm Win*
#Windows XP Icons
			cd $tmp_dir
			sudo git clone https://github.com/B00merang-Artwork/Windows-XP
			cd Windows-XP/
			sudo mkdir /usr/share/icons/Windows-XP
			sudo mv * /usr/share/icons/Windows-XP
			cd $tmp_dir
#Windows 11 Icons themes
			wget -P $tmp_dir https://codeload.github.com/yeyushengfan258/Win11-icon-theme/zip/refs/heads/main
			cd $tmp_dir
			unzip main
			cd $tmp_dir/Win11-icon-theme-main
			sudo chmod -R +x install.sh
			sudo ./install.sh -a
			cd $tmp_dir
			rm Win11*
			cd $usuario
			sleep 2s

}


function installmacthemes()

{
			echo "Installing MacOS themes"
#WhiteSur themes
			cd $tmp_dir
			git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
			cd $tmp_dir/WhiteSur-gtk-theme
			sudo chmod -R +x install.sh
			sudo bash install.sh -c Dark -c Light
			cd $tmp_dir
			rm WhiteSur*
#WhiteSur Icons
			cd $tmp_dir
			git clone https://github.com/vinceliuice/WhiteSur-icon-theme
			cd $tmp_dir/WhiteSur-icon-theme
			sudo chmod -R +x install.sh
			sudo bash install.sh
			cd $tmp_dir
			rm WhiteSur*
#La Sierra Icons themes
			sudo mkdir /usr/share/icons/La-Sierra
			cd $tmp_dir
			wget https://codeload.github.com/btd1337/La-Sierra-Icon-Theme/zip/refs/heads/master
			unzip master
			sudo mv La-Sierra-Icon-Theme-master/* /usr/share/icons/La-Sierra
			rm master*
			rm La-Sierra*
			cd $usuario
			sleep 2s

}


function installinfinitythemes()

{
			echo "Installing Infinity themes"
#Infinity Icons themes
			cd $tmp_dir
			wget https://codeload.github.com/L4ki/Infinity-Plasma-Themes/zip/refs/heads/main
			unzip main
			cd $tmp_dir/Infinity-Plasma-Themes-main/Infinity-Icons
			sudo mv -v Infinity* /usr/share/icons
			cd $tmp_dir/Infinity-Plasma-Themes-main/Infinity-Plasma-Themes
			sudo mv -v Infinity* /usr/share/themes
			cd $tmp_dir
			rm Infinity-Plasma-Themes*
			echo "Installing Candy themes"
#Candy Icons themes
			sudo mkdir /usr/share/icons/candy-icons
			cd $tmp_dir
			wget https://codeload.github.com/EliverLara/candy-icons/zip/refs/heads/master
			unzip master
			sudo mv candy-icons-master/* /usr/share/icons/candy-icons
			rm master*
			rm candy*
			cd $usuario
			echo "Installing Gruvbox themes"
#Gruvbox themes
			wget -P $tmp_dir https://codeload.github.com/TheGreatMcPain/gruvbox-material-gtk/zip/refs/heads/master
			cd $tmp_dir
			unzip master
			rm master
			cd $tmp_dir/gruvbox-material-gtk-master/icons
			sudo mv Gruvbox* /usr/share/icons
			cd $tmp_dir/gruvbox-material-gtk-master/themes
			sudo mv Gruvbox* /usr/share/themes
			cd $tmp_dir
			rm gruvbox*
			sleep 2s

}


function installxampp()

{
#Desistalar XAMPP
			sudo /opt/lampp/lampp stop
			sudo /opt/lampp/uninstall
			sudo rm -rf /opt/lampp
#Instalar XAMPP
xamppversion='8.1.2'
			cd $tmp_dir
			echo "Installing XAMPP"
			wget -O xampp.run https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/$xamppversion/xampp-linux-x64-$xamppversion-0-installer.run
			sudo chmod -R 755 $tmp_dir/xampp.run
			sudo $tmp_dir/xampp.run  > /dev/null
			### Lanzador
			sudo rm -rf /usr/share/applications/xampp-control-panel.desktop
			sudo touch /usr/share/applications/xampp-control-panel.desktop
			sudo chmod -R 755 /usr/share/applications/xampp-control-panel.desktop
			sudo chown -R $nombre:$nombre /usr/share/applications/xampp-control-panel.desktop
			echo "Name=XAMPP Control Panel
GenericName=XAMPP Control Panel
Comment=Start and Stop XAMPP
Exec=/opt/lampp/manager-linux-x64.run
Encoding=UTF-8
Terminal=true
Icon=/opt/lampp/htdocs/favicon.ico
Type=Application
Categories=Development;
Comment=Start and Stop XAMPP
StartupNotify=true">> /usr/share/applications/xampp-control-panel.desktop
####reparar permisos
			#sudo chmod -R 755 /opt/lampp
			#sudo chown -R $USER /opt/lampp
			#sudo chown -R nobody:nogroup /opt/lampp/htdocs
			#sudo chmod -R 777 /opt/lampp/
			#sudo chmod 644 /opt/lampp/etc/my.cnf
			#sudo chown -R mysql:mysql /opt/lampp/var/mysql
			#####
# Permisos de xampp
			sudo groupadd xamppusers
			sudo usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.xamppusers htdocs
			sudo chmod -R 777 htdocs
			groupadd gitusers
			usermod -a -G gitusers $USER
			cd /opt/lampp
			chown root.gitusers htdocs
# Permisos de Servidor
			sudo groupadd ftp
			usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.ftp htdocs
			sudo chmod -R 777 htdocs
# Config
			sudo /usr/sbin/setenforce 0
			sudo mkdir /opt/lampp/phpmyadmin/tmp/
			sudo chmod 777 -R /opt/lampp/phpmyadmin/tmp/
			sudo chown -R mysql:mysql /tmp/user/0/
# firewall
			sudo ufw allow 3306/tcp
			sudo ufw allow mysql
		### Arreglo
cd /opt/lampp/phpmyadmin/
sudo sed -i "29s/\/\/ //" config.inc.php
sudo sed -i "30s/\/\/ //" config.inc.php
sudo sed -i "32s/\/\/ //" config.inc.php
sudo sed -i "43s/\/\/ //" config.inc.php
sudo sed -i "28s/config/cookie/g" config.inc.php
sudo sed -i "32s/localhost/127.0.0.1:3306/g" config.inc.php
sudo sed -i "43s/pma//g" config.inc.php
cd ~
			#### Wordpress ####
						echo Instalar wordpress
			sudo rm -rf /tmp/dis/latest*
			sudo rm -rf /opt/lampp/htdocs/wordpress
			cd /tmp/dis
			wget https://wordpress.org/latest.zip
			sudo unzip -d /opt/lampp/htdocs ./latest.zip
			# Permisos de Servidor
			sudo groupadd ftp
			usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.ftp htdocs
			sudo chmod -R 777 htdocs
			#sudo echo "define( 'FS_METHOD','direct');" >> /opt/lampp/htdocs/wordpress/wp-config.php
			cd $HOME
			echo "#---------------------XAMPP Instalado-------------------#"
			sudo /opt/lampp/lampp start
}

function limpiar()

{
			#Cleanup
			echo "Cleaning up"
			sudo $update
			sudo $autoremove
			sudo $upgrade
			sudo $autoremove
			sudo $reparar
			rm -rf $tmp_dir

}


function swappiness10()

{
			echo "#----------------------------Swappiness 10 ------------------------------#"
			sudo sysctl vm.swappiness=10
			sleep 2s

}


########################################################
#################     Start script        ##############
########################################################


# cp /etc/apt/sources.list /etc/apt/sources.list.original

function chiguire()

{
		clear
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@%#++*###*=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@#***++=-===+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@=-=-+*++++*+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@%*++-+*+**+**+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@#=++#*+++=+++**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@*====--:-=++*####%%@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@=   :=++*****+**####%%%%%@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@#::-=++****+=+++*###########%@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*-==+++**++++++++*********#####%%@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*=++++++++++++++******************%@@@@@@@"
			echo -e "\033[33m@@@@@@@@@+++**+===++++=++****#***********++%@@@@@@"
			echo -e "\033[33m@@@@@@@@@#=++**=-+====+****************++*+=#@@@@@"
			echo -e "\033[33m@@@@@@@@@@#=+++==---:-=+++***+*++*++***+**+==@@@@@"
			echo -e "\033[33m@@@@@@@@@@@*--.-==: .-=-==++++++++**+*****+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@+:.:-==:..:--======*++**+**++*+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@=.:-=-%%-...::::-+**++*+++=++==-#@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@*::=-=@@@%*=:..:=+++++=++==+==-:#@@@@"
			echo -e "\033[33m@@@@@@@@@%%*==.-=--+***+*+:  :-=--=:----:::.-@@@@@"
			echo -e "\033[33m@@@@@@@@%%*++--=----+====-:... ..::::---==+*@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@%%##**####%%%##****##%%%@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			sleep 2s
		clear
}

		clear
		echo " "
			echo -e "\033[4mhttps://github.com/yordisc/"
			sleep 2s
		clear
		chiguire
			sleep 2s
		clear

dialog --title "https://github.com/yordisc/dotfiles" \
       --msgbox "En este dotfiles se encuentra mi configuración personal." 0 0 


		clear
#nombre="admin"
nombre=$(dialog --title "Escribe el nombre del usuario" \
		--stdout \
		--inputbox "Nombre" 0 0)

usuario=/home/$nombre

if [[ $EUID -ne 0 ]]; then
	echo "Este script funciona tipeando: sudo bash ./dotfiles.sh"
	1s
else


	echo "Creating temporary folder"
	rm -rf /tmp/dis
	mkdir -m 755 $tmp_dir


diestro=$(dialog --title "Elige el tipo de paquete: deb / rpm / aur" \
		--stdout \
		--inputbox "Diestro" 0 0)

	deb=$("${cmddeb[@]}" "${debian[@]}" 2>&1 >/dev/tty)
	rpm=$("${cmdred[@]}" "${redhat[@]}" 2>&1 >/dev/tty)
	aur=$("${cmdarch[@]}" "${archlinux[@]}" 2>&1 >/dev/tty)


function deb()

{
choices=$deb

}

function rpm()

{
choices=$rpm

}


function aur()

{
choices=$aur

}


	inicio dialog
		$diestro
		clear
		for choice in $choices
		do
			case $choice in



# Section A -----------------------INSTALADORES----------------------------

		0_basic)
		#Update and Upgrade
		echo "Updating"
		sudo $update
		sudo $reparar
		sudo $autoremove
			installbasicos
			;;


		0_basic_rpm)
			cambiored
			#Update and Upgrade
		echo "Updating"
		sudo $update
		sudo $reparar
		sudo $autoremove
			installbasicos
			;;

		0_basic_aur)
			cambioarch
			#Update and Upgrade
		echo "Updating"
		sudo $update
		sudo $reparar
		sudo $autoremove
			installbasicos
			;;

# Section A -----------------------Repositorios----------------------------

		1_repos)
			installrootaccess
			;;
			
		1_repos_aur)
		    cambioarch
			pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
            pacman-key --lsign-key 3056513887B78AEB
            pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
            sudo pacman-key --init
            sudo pacman -Syyu
            sudo $install yay
            yaourt -S pamac-aur
			;;
			
		2_repos)
			installrepositoriodebiannonfree
			;;
			
		3_repos)
			installrepositoriodebian
			;;

# Section B ---------------------Alternate Installers----------------------------




		1_installer)
			installsnap
			;;


		1_installer_rpm)
			cambiored
			installsnap
			;;

		1_installer_aur)
			cambioarch
			git clone https://aur.archlinux.org/snapd.git $tmp_dir
            cd $tmp_dir/snapd
            $install
            sudo systemctl enable --now snapd.socket
            sudo ln -s /var/lib/snapd/snap /snap
            sudo snap install hello-world
            hello-world
			;;

		2_installer)
			installflatpak
			;;

		2_installer_rpm)
			cambiored
			installflatpak
			;;

		2_installer_aur)
			cambioarch
			installflatpak
			;;

		3_installer)
			installsynaptic
			;;

		3_installer_rpm)
			cambiored
			echo "#--------------------------------Instalando Yumex (Sinaptic para Fedora)--------------------------------#"
			sleep 1s
			sudo dnf copr enable timlau/yumex-dnf
			sudo dnf install yumex-dnf -yy
			echo "#--------------------------------Instalado  Yumex (Sinaptic para Fedora)--------------------------------#"
			sleep 2s
			;;

		3_installer_aur)
			cambioarch
			sudo $install --needed base-devel git wget yajl
			cd $tmp_dir
            git clone https://aur.archlinux.org/package-query.git
            cd package-query/
            $unpack
            cd $tmp_dir
            git clone https://aur.archlinux.org/yaourt.git
            cd yaourt/
            $unpack
            yaourt -S pamac-aur
			;;

		4_installer)
			installpip
			;;

		4_installer_rpm)
			cambiored
			installpip
			;;

		4_installer_aur)
			cambioarch
			sudo pacman -S python2-pip
			sudo pacman -S python-pip
			;;

# Section C ------------------------Text Editors------------------------------

		1_editor)
			installnano
			;;

		1_editor_rpm)
			cambiored
			installnano
			;;
			
		1_editor_aur)
			cambioarch
			installnano
			;;
			
		2_editor)
			installvim
			;;
			
		2_editor_rpm)
			cambiored
			installvim
			;;

			
		2_editor_aur)
			cambioarch
			installvim
			;;

		3_editor)
			installnvim
			wget -P $temp https://github.com/wfxr/code-minimap/releases/download/v0.6.4/code-minimap-musl_0.6.4_amd64.deb
			cd $temp
			sudo dpkg -i ./code-minimap-musl_0.6.4_amd64.deb
			sudo apt install build-essential cmake vim-nox python3-dev
			cd $usuario
			;;

		3_editor_rpm)
			cambiored
			installnvim
			sudo dnf install cmake gcc-c++ make python3-devel
			cd $usuario
			;;

		3_editor_aur)
			cambioarch
			installnvim
			;;

		4_editor)
			installvscode
			;;

		4_editor_rpm)
			cambiored
			vscode=vscodered
			installvscode
			;;


		4_editor_aur)
			cambioarch
			vscode=vscodearch
			pacman -S git
            cd $tmp_dir
            git clone https://AUR.archlinux.org/visual-studio-code-bin.git $tmp_dir
            cd visual-studio-code-bin/
            $unpack
            sudo pacman -U visual-studio-code-bin-*.pkg.tar.xz
            cd $tmp_dir
            sudo rm -rfv visual-studio-code-bin/
			;;

# Section D ---------------------------Phone------------------------------------

		1_phone)
			installandroidsdk
			;;

		1_phone_rpm)
			cambiored
			installandroidsdk
			;;

		1_phone_aur)
			cambioarch
			yaourt android-sdk-platform-tools
            yaourt android-udev
            yaourt android-sdk
            export ANDROID_HOME=/opt/android-sdk
            export PATH=$PATH:$ANDROID_HOME/tools
            export PATH=$PATH:$ANDROID_HOME/platform-tools
			;;

		2_phone)
			installiphone
			;;

		2_phone_rpm)
			cambiored
			installiphone
			;;

		2_phone_aur)
			cambioarch
			git clone https://github.com/libimobiledevice/libimobiledevice.git $tmp_dir
            cd $tmp_dir/libimobiledevice
            ./autogen.sh
            make
            sudo make install
			;;

# Section E -------------------------Terminal Customization--------------------------

		1_customize)
			installbash
			;;

		1_customize_rpm)
			cambiored
			installbash
			;;

		1_customize_aur)
			cambioarch
			installbash
			;;

		2_customize)
			installzsh
			sudo $install zsh-doc zsh-static fzf zplug zsh-autosuggestions thefuck -yy
			;;

		2_customize_rpm)
			cambiored
			installzsh
			sudo $install fzf zsh-autosuggestions thefuck -yy
			;;

		2_customize_aur)
			cambioarch
			installzsh
			sudo $install zsh-completions -yy
			;;

		3_customize_U)
			installohmyzsh
			;;

		3_customize_rpm)
			cambiored
			installohmyzsh
			;;

		3_customize_aur)
			cambioarch
			installohmyzsh
			;;

		4_customize_U)
			installpowerline
			;;



		5_customize)
			installpackterminal
			;;

		5_customize_rpm)
			cambiored
			installpackterminal
			;;

		5_customize_aur)
			cambioarch
			installpackterminal
			;;

# Section F ----------------------------------Web Browsers/Downloaders-------------------------

		1_web_U)
			installfirefoxdev
			;;

		2_web)
			installgooglechrome
			;;

		2_web_rpm)
			cambiored
			chromename=$chromenamered
			chrome=chromered
			sudo $install liberation-fonts
			installgooglechrome
			;;

		2_web_aur)
			cambioarch
			chromename=$chromenamearch
			chrome=chromearch
			cd $tmp_dir
            git clone https://aur.archlinux.org/google-chrome.git $tmp_dir
            cd $tmp_dir/google-chrome/
            $unpack  
			;;

		3_web)
			cd $tmp_dir
			wget https://repo.skype.com/latest/skypeforlinux-64.deb
			sudo dpkg -i skypeforlinux-64.deb
			;;

		3_web_rpm)
			cd $tmp_dir
			cambiored
			sudo dnf install https://go.skype.com/skypeforlinux-64.rpm -y
			;;

		3_web_aur)
			cambioarch
			cd $tmp_dir
			git clone https://aur.archlinux.org/skypeforlinux-stable-bin.git $tmp_dir
			cd skypeforlinux-stable-bin
			makepkg -si
			;;


		4_web)
			installslack
			;;

		4_web_rpm)
			cambiored
			slackname=$slacknamered
			slack=slackred
			installslack
			;;

		4_web_aur)
			cambioarch
			slackname=$slacknamearch
			slack=$slackarch
			sudo pacman -Syu
            sudo pacman -S git base-devel
            cd $tmp_dir
            git clone https://aur.archlinux.org/slack-desktop.git $tmp_dir
            cd $tmp_dir/slack-desktop/
            $unpack
            yay -S slack-desktop
			;;

		5_web)
			installzoom
			;;

		5_web_rpm)
			cambiored
			zoomname=$zoomnamered
			zoom=$zoomred
			installzoom
			;;

		5_web_aur)
			cambioarch
			zoomname=$zoomnamearch
			zoom=zoomarch
			sudo pacman -Syu
            sudo pacman -S git base-devel
            cd $tmp_dir
            git clone https://aur.archlinux.org/zoom.git $tmp_dir
            cd $tmp_dir/zoom/
            $install
			;;

		6_web)
			installwhatsapp
			;;

		6_web_rpm)
			cambiored
			whatsappname=$whatsappnamered
			whatsapp=$whatsappred
			sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
			sudo dnf upgrade
			sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
			sudo subscription-manager repos --enable "rhel-*-optional-rpms" --enable "rhel-*-extras-rpms"
			sudo yum update
			sudo yum install snapd
			sudo systemctl enable --now snapd.socket
			sudo ln -s /var/lib/snapd/snap /snap
			sudo snap install "whatsapp-for-linux"
			;;

		6_web_aur)
			cambioarch
			whatsappname=$whatsappnamearch
			whatsapp=$whatsapparch
			cd $tmp_dir
            git clone https://aur.archlinux.org/snapd.git $tmp_dir
            cd $tmp_dir/snapd
            $install
            sudo systemctl enable --now snapd.socket
            sudo ln -s /var/lib/snapd/snap /snap
            sudo snap install "whatsapp-for-linux"
			;;

		7_web)
			installteams
			;;

		7_web_rpm)
			cambiored
			$team=teamred
			installteams
			;;

		7_web_aur)
			cambioarch
			$team=teamarch
			git clone https://aur.archlinux.org/yay.git $tmp_dir
			cd $tmp_dir/yay
			$install
			sudo yay -S teams
			;;

		8_web)
			installtorrent
			;;

		8_web_rpm)
			cambiored
			installtorrent
			;;

		8_web_aur)
			cambioarch
			installtorrent
			;;

		9_web)
			installteamviewer
			;;

		9_web_rpm)
			cambiored
			teamviewername=$teamviewernamered
			teamviewer=$teamviewerred
			installteamviewer
			;;

		9_web_aur)
			cambioarch
			teamviewername=$teamviewernamearch
			teamviewer=$teamviewerarch
			sudo pacman -Sy
            sudo pacman -S git
            cd $tmp_dir
            git clone https://aur.archlinux.org/teamviewer12.git $tmp_dir
            cd teamviewer12
            $unpack
            sudo pacman -Sy
            $unpack
            sudo pacman -U teamviewer*.pkg.tar.xz
			;;

		10_web)
			installjdownloader
			;;

		10_web_rpm)
			cambiored
			installjdownloader
			;;

		10_web_aur)
			cambioarch
			installjdownloader
			;;

		11_web)
			installgithub
			;;

		11_web_rpm)
			cambiored
			githubdesktop=githubdesktopred
			sudo rpm --import https://rpm.packages.shiftkey.dev/gpg.key
			sudo sh -c 'echo -e "[shiftkey-packages]\nname=GitHub Desktop\nbaseurl=https://rpm.packages.shiftkey.dev/rpm/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://rpm.packages.shiftkey.dev/gpg.key" > /etc/yum.repos.d/shiftkey-packages.repo'
			sudo rpm --import https://mirror.mwt.me/shiftkey-desktop/gpgkey
			sudo sh -c 'echo -e "[mwt-packages]\nname=GitHub Desktop\nbaseurl=https://mirror.mwt.me/shiftkey-desktop/rpm\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://mirror.mwt.me/shiftkey-desktop/gpgkey" > /etc/yum.repos.d/mwt-packages.repo'
			installgithub
			;;

		11_web_aur)
			cambioarch
			githubdesktop=$githubdesktoparch
			git clone https://aur.archlinux.org/github-desktop-bin.git $tmp_dir
			 cd $tmp_dir/github-desktop-bin/
			$install
			#with aur helper yay
			sudo yay -S github-desktop
			;;

		12_web)
						echo "#----------------------------Instalando GitKraken----------------------------#"
			sleep 1s
			cd $tmp_dir
			wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
			sudo dpkg -i gitkraken-amd64.deb
						echo "#----------------------------Instalado GitKraken----------------------------#"
			;;

		12_web_rpm)
						echo "#----------------------------Instalando GitKraken----------------------------#"
			sleep 1s
			cambiored
			cd $tmp_dir
			wget https://release.gitkraken.com/linux/gitkraken-amd64.rpm
			sudo yum install ./gitkraken-amd64.rpm
						echo "#----------------------------Instalado GitKraken----------------------------#"
			;;

		12_web_U)
			sleep 1s
			cambioarch
			installgitkraken
			;;

		13_web)
			cd $tmp_dir
			echo "#----------------------------Instalando Docker----------------------------#"
			#Docker Desktop (Debian)
			sudo modprobe kvm
			#sudo modprobe kvm_intel  ### intel processors
			#sudo modprob kvm_amd ### amd processors
			sudo usermod -aG kvm $USER
			sudo apt remove docker-desktop
			sudo rm -r $HOME/.docker/desktop
			sudo rm /usr/local/bin/com.docker.cli
			sudo apt purge docker-desktop
			sudo apt update -y
			sudo apt install apparmor -y
			curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
			sudo apt update
			sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
			sudo usermod -aG docker $USER
newgrp docker
			wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-amd64.deb
			sudo apt install ./docker-desktop-*-amd64.deb
			echo "#----------------------------Instalado Docker----------------------------#"
			;;

		13_web_rpm)
			cambiored
			echo "#----------------------------Instalando Docker----------------------------#"
			cd $tmp_dir
#Docker para Fedora
			sudo dnf -y install dnf-plugins-core
			sudo dnf config-manager \
				--add-repo \
				https://download.docker.com/linux/fedora/docker-ce.repo
			sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
			sudo systemctl start docker
			sudo docker run hello-world
			wget https://desktop.docker.com/linux/main/amd64/95914/docker-desktop-4.16.2-x86_64.rpm
			sudo dnf install -y docker-desktop-*.rpm
			echo "#----------------------------Instalado Docker----------------------------#"
			;;

		13_web_aur)
			cambioarch
			echo "#----------------------------Instalando Docker---------------------------#"
			cd $tmp_dir
#Docker Arch
			sudo pacman -S docker # (docker, containerd, runc)
docker info
			sudo systemctl enable --now docker
# Docker without sudo:
			sudo usermod -aG docker $USER
			reboot or [logout/login and restart docker.service]
# Docker-Desktop
#>download from https://docs.docker.com/desktop/release-notes/
			wget https://desktop.docker.com/linux/main/amd64/95914/docker-desktop-4.16.2-x86_64.pkg.tar.zst
			sudo pacman -U ./docker-desktop-<version>-<arch>.pkg.tar.zst
# dependencies= docker-compose, docker-scan
# Credentials Management:
			gpg --generate-key
# SIGNIN on Docker-Desktop!
			echo "#----------------------------Instalado Docker----------------------------#"
			;;

# Section G ----------------------------------Networking----------------------------------------------

		1_network)
			installsamba
			sudo $install libcups2 smbclient gvfs-backends network-manager -yy
			;;

		1_network_rpm)
			cambiored
			installsamba
			sudo $install cifs-utils gvfs-smb cups  -yy
			;;

		1_network_aur)
			cambioarch
			installsamba
			;;

		2_network)
			installzfs
			;;

		2_network_rpm)
			cambiored
			installzfs
			;;

		2_network_aur)
			cambioarch
			installzfs
			;;

		3_network_U)
			installxampp
			;;

		4_network)
			cd $tmp_dir
			echo "#----------------------------Instalando ProtonVPN-----------------------------#"
# Descarga la aplicación de ProtonVPN
			wget -O protonvpn-cli.deb https://protonvpn.com/download/protonvpn-cli.deb
			wget -O protonvpn.deb https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb
# Instala la aplicación
			sudo dpkg -i protonvpn-cli.deb
			sudo dpkg -i protonvpn.deb
# Inicia la aplicación
			sudo protonvpn-cli --install
			sudo apt-get update
			sudo apt-get protonvpn
			cd $usuario
echo "#----------------------------ProtonVPN Instalado-----------------------------#"
			;;

		4_network_rpm)
			cambiored
			cd $tmp_dir
echo "#----------------------------Instalando ProtonVPN-----------------------------#"
			sudo dnf install python3-pip
			pip3 install --user 'dnspython>=1.16.0'
# Descarga la aplicación de ProtonVPN
			wget -O protonvpn-cli.rpm https://protonvpn.com/download/protonvpn-cli.rpm
			wget -O protonvpn.rpm https://repo.protonvpn.com/fedora-36-stable/release-packages/protonvpn-stable-release-1.0.1-1.noarch.rpm
# Instala la aplicación
			sudo yum install protonvpn-cli.rpm
			sudo yum install protonvpn.rpm
			sudo dnf install protonvpn
# Inicia la aplicación
			sudo protonvpn-cli --install
			cd $usuario
echo "#----------------------------ProtonVPN Instalado-----------------------------#"
			;;

		4_network_aur)
			cambioarch
			cd $tmp_dir
echo "#----------------------------Instalando ProtonVPN-----------------------------#"
# Descarga la aplicación de ProtonVPN
			wget -O protonvpn-cli.tar.gz https://protonvpn.com/download/protonvpn-cli.tar.gz
# Descomprime el archivo
			tar xvzf protonvpn-cli.tar.gz
# Instala la aplicación
			cd protonvpn-cli
			sudo python setup.py install
# Inicia la aplicación
			sudo protonvpn-cli --install
			pamac update --force-refresh
			pamac search --aur protonvpn
			pamac build protonvpn
			cd $usuario
echo "#----------------------------ProtonVPN Instalado-----------------------------#"
			;;

# Section H -------------------------------Graphics---------------------------------------------------

		1_graphics)
			installnvidia
			;;

		1_graphics_rpm)
			cambiored
			installnvidia
			;;

		1_graphics_aur)
			cambioarch
			installnvidia
			;;

		2_graphics)
			installamd
			;;

		2_graphics_rpm)
			cambiored
			installamd
			;;

		2_graphics_aur)
			cambioarch
			installamd
			;;
# Section I --------------------------------------Sound----------------------------------------------

		1_sound)
			installpulseaudio
			;;

		1_sound_rpm)
			cambiored
			installpulseaudio
			;;

		1_sound_aur)
			cambioarch
			installpulseaudio
			;;

		2_sound)
			installalsa
			;;

		2_sound_rpm)
			cambiored
			installalsa
			;;

		2_sound_aur)
			cambioarch
			installalsa
			;;

# Section J -------------------------------------Fonts------------------------------------------------

		1_font)
			installmsfonts
			;;

		1_font_rpm)
			cambiored
			installmsfonts
			;;

		1_font_aur)
			cambioarch
			installmsfonts
			;;

		2_font)
			installubuntufonts
			;;

		2_font_rpm)
			cambiored
			installubuntufonts
			;;

		2_font_aur)
			cambioarch
			installubuntufonts
			;;

		3_font_U)
			installnerdfonts
			;;

		4_font_U)
			installcjkfonts
			;;

		5_font_U)
			installarchcraftfonts
			;;

# Section K --------------------------Media Viewing/Editing/Converting---------------------------------

		1_media)
			installvlc
			;;

		1_media_rpm)
			cambiored
			installvlc
			;;

		1_media_aur)
			cambioarch
			pacman -S vlc
			;;


		2_media)
			installaudacity
			;;

		2_media_rpm)
			cambiored
			installaudacity
			;;

		2_media_aur)
			cambioarch
			installaudacity
			;;

		3_media)
			installobs
			;;

		3_media_rpm)
			cambiored
			installobs
			;;

		3_media_aur)
			cambioarch
			installobs
			;;

		4_media)
			installoptical
			;;

		4_media_rpm)
			cambiored
			installoptical
			;;

		4_media_aur)
			cambioarch
			installoptical
			;;

		5_media)
			installffmpeg
			;;

		5_media_rpm)
			cambiored
			installffmpeg
			;;

		5_media_aur)
			cambioarch
			installffmpeg
			;;

# Section L --------------------------------Gaming-------------------------------------------------

		1_gaming)
			installsteam
			;;

		1_gaming_rpm)
			cambiored
			su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
			su -c 'dnf -y install xorg-x11-drv-nouveau mesa-libGL.i686 mesa-dri-drivers.i686'
			su -c 'dnf -y install xorg-x11-drv-intel mesa-libGL.i686 mesa-dri-drivers.i686'
			su -c 'dnf -y update'
			su -c 'dnf -y install steam'
			;;

		1_gaming_aur)
			cambioarch
			installsteam
			;;

		2_gaming)
			installlutris
			;;

		2_gaming_rpm)
			cambiored
			installlutris
			;;

		2_gaming_aur)
			cambioarch
			installlutris
			;;

		3_gaming)
			installwine
			;;

		3_gaming_rpm)
			cambiored
			installwine
			;;

		3_gaming_aur)
			cambioarch
			installwine
			;;

# Section N -----------------------------------File Explorers-----------------------------------------------

		2_files)
			installlibreoffice
			;;

		2_files_rpm)
			cambiored
			echo "#--------------------------------Instalando LibreOffice--------------------------------#"
			sleep 1s
			sudo $install libreoffice hyphen-es hunspell-es mythes-es libreoffice-help-es libreoffice-voikko -yy
			echo "#--------------------------------Instalado LibreOffice--------------------------------#"
			sleep 2s
			;;

		2_files_aur)
			cambioarch
			echo "#--------------------------------Instalando LibreOffice--------------------------------#"
			sudo pacman -Syyu
			sudo pacman -S --needed ttf-caladea ttf-carlito ttf-dejavu ttf-liberation ttf-linux-libertine-g noto-fonts adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
			paru ttf-gentium-basic
			#paru hsqldb2-java
			#sudo pacman -S --needed jre-openjdk
			sudo pacman -S libreoffice-fresh
			#sudo pacman -S libreoffice-extension-texmaths libreoffice-extension-writer2latex
			sudo pacman -S hunspell-en_us hunspell-es_es
			paru libreoffice-extension-languagetool
			echo "#--------------------------------Instalado LibreOffice--------------------------------#"
			sleep 2s
			;;

		3_files_U)
			installespanso
			;;

		4_files_U)
			installpcloud
			;;

		5_files)
			installpackhome
			;;

		5_files_rpm)
			cambiored
			installpackhome
			;;

		5_files_aur)
			cambioarch
			installpackhome
			;;

		6_files)
			sudo apt-get install gnome-multi-writer
			curl -1sLf \
   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
   | sudo -E bash
            sudo $update
            sudo $install balena-etcher-electron
            sudo $install git p7zip-full python3-pip python3-wxgtk4.0
sudo pip3 install WoeUSB-ng
			;;

		6_files_rpm)
			cambiored
			sudo dnf install gnome-multi-writer
			curl -1sLf \
   'https://dl.cloudsmith.io/public/balena/etcher/setup.rpm.sh' \
   | sudo -E bash
            sudo $update
            sudo $install balena-etcher-electron
            sudo dnf makecache --refresh
			sudo dnf install git p7zip p7zip-plugins python3-pip python3-wxpython4
			sudo dnf -y install WoeUSB
			;;

		6_files_aur)
			cambioarch
			sudo pacman -S gnome-multi-writer
			sudo yay -S balena-etcher
			sudo pacman -Suy p7zip python-pip python-wxpython
			yay -S woeusb-ng
			;;


# Section Ñ ----------------------------------Desktop Customization---------------------------------------------


		1_desktop_U)
			installgtk
			;;

		2_desktop)
			installpicom
			;;

		2_desktop_rpm)
			cambiored
			installpicom
			;;

		2_desktop_aur)
			cambioarch
			installpicom
			;;

		3_desktop)
			installi3lock
			;;

		3_desktop_rpm)
			cambiored
			installi3lock
			;;

		3_desktop_aur)
			cambioarch
			installi3lock
			;;

		4_desktop)
			sudo $install xfce4-clipman mpd nm-tray light suckless-tools network-manager network-manager network-manager-openvpn ffmpegthumbnailer lxappearance feh policykit-1-gnome pulseaudio pulseaudio-utils pulseaudio-equalizer gstreamer1.0-pulseaudio toilet -yy
			installbspwm
			;;

		4_desktop_rpm)
			cambiored
			installbspwm
			;;

		4_desktop_aur)
			cambioarch
			installbspwm
			;;

# Section O ---------------------Themes personal----------------------------

		1_themes_U)
			installwallpapers
			;;

		2_themes_U)
			installarchcraft
			;;

		3_themes)
			installubuntuthemes
			;;

		3_themes_rpm)
			cambiored
			installubuntuthemes
			;;

		3_themes_aur)
			cambioarch
			installubuntuthemes
			;;

		4_themes_U)
			installwindowsthemes
			;;

		5_themes_U)
			installmacthemes
			;;

		6_themes_U)
			installinfinitythemes
			;;

# Section P ---------------------System----------------------------

		V)
			limpiar
			;;

		V_rpm)
			cambiored
			limpiar
			;;

		V_aur)
			cambioarch
			limpiar
			;;

		1_system_U)
			swappiness10
			;;


		esac
	done
fi



# Hecho por Yordis Cujar