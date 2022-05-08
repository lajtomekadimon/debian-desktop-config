configure:
	# Basic tools
	sudo apt install -y wget nano git make pulseaudio libcanberra-pulse mpg123 \
	libldap-2.4-2 libpulse0 libxml2 giflib-tools libc6 gtk2-engines gcc \
	gcc-multilib g++ g++-multilib cmake lm-sensors hddtemp
	# Compression tools
	sudo apt install -y rar unrar p7zip p7zip-full p7zip-rar unace zip unzip \
	bzip2 arj lhasa lzip xz-utils
	# Codecs
	sudo apt install -y ffmpeg2theora ffmpegthumbnailer \
	gstreamer1.0-plugins-base gstreamer1.0-nice gstreamer1.0-plugins-good \
	gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav \
	gstreamer1.0-vaapi
	# Keyboards
	sudo apt install -y ibus-anthy ibus-mozc ibus-libpinyin
	# Fonts
	sudo apt install -y fonts-cantarell fonts-liberation fonts-noto \
	ttf-mscorefonts-installer fonts-stix otf-stix \
	fonts-oflb-asana-math fonts-mathjax
	wget https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip && \
	unzip 1.017R.zip && sudo mv source-code-pro-1.017R/OTF/*.otf \
	/usr/local/share/fonts/ && fc-cache -f -v && rm 1.017R.zip && rm -Rf \
	source-code-pro-1.017R
	# Remove software
	sudo apt remove -y gnome-chess aisleriot gnome-klotski \
	iagno tali gnome-sudoku gnome-mahjongg gnome-tetravex \
	gnome-taquin swell-foop gnome-robots quadrapassel gnome-nibbles \
	gnome-mines lightsoff hitori four-in-a-row five-or-more
	# Software
	sudo apt install -y gnome-tweak-tool rhythmbox rhythmbox-plugins \
	simple-scan transmission-gtk gimp inkscape audacity kid3 gparted \
	soundconverter libreoffice mpv blender gnome-clocks gnome-builder \
	anki keepassxc screenfetch neofetch geogebra
	# 32 bits architecture
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt upgrade -y
	sudo apt install -y binutils-multiarch libstdc++6:i386 libgcc1:i386 \
	zlib1g:i386 libncurses5:i386 libcanberra-pulse:i386 libldap-2.4-2:i386 \
	libpulse0:i386 libxml2:i386
	# Autoremove
	sudo apt autoremove -y

nvidia:
	sudo apt install -y linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//')
	sudo apt update
	sudo apt install -y nvidia-driver nvidia-driver-libs:i386 \
	nvidia-vulkan-icd nvidia-vulkan-icd:i386 firmware-misc-nonfree

telegram:
	wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux
	tar -xvf telegram.tar.xz
	rm telegram.tar.xz
	mv Telegram ~/.telegram-desktop-dir
	~/.telegram-desktop-dir/Telegram

programming:
	# NodeJS
	sudo apt install -y nodejs npm
	sudo npm cache clean -f
	sudo npm install -g n
	sudo n stable
	hash -r
	sudo npm update
	sudo npm install -g typescript
	# LaTeX
	sudo apt install -y latexmk luatex
	sudo apt install --install-recommends texlive-full