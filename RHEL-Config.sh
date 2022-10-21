# Initial installation 
sudo yum update -y
sudo yum upgrade -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo yum install filezilla meld youtube-dl ffmpeg rofi ranger git bat vim zsh python3 python3-pip neofetch ansible unzip nmap xclip maim finch lxappearance-devel picom feh-3.8-2.fc36 nitrogen httpd openssh samba firewalld python3-netifaces -y
sudo yum install cmus util-linux-user i3 -y

pip3 install awscli psutil i3ipc
pip install --user bumblebee-status
sudo dnf install powerline-fonts fontawesome-fonts fira-code-fonts


# Customize Rofi
mkdir ~/.config/rofi/
cd ~/.config/rofi/
wget https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi
mv nord.rasi config.rasi

# Install Oh my zsh 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Install ZSH plugins (autosuggestions autocomplete syntax-highlighting fzf)
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

# Set fonts
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip &&
unzip Terminus.zip &&
rm -rf *.zip
sudo fc-cache -v

# Setting up i3
cd ~/Documents
# i3 Lock
git clone https://github.com/meskarune/i3lock-fancy/tree/dualmonitors
cd i3lock-fancy/
sudo make install
# i3 alternate Layouts
git clone https://github.com/olemartinorg/i3-alternating-layout
sudo mv i3-alternating-layout/alternating_layouts.py /bin 
# i3 gaps
sudo yum install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev \ 
libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \ 
libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
rm -rf *
