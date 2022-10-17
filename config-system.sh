#!/usr/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install ffmpeg filezilla meld youtube-dl \
    rofi ranger git bat vim zsh python3 python3-pip \
    screenfetch lamp-server^ i3 ansible unzip tmux \
    nmap vlc xclip maim sqlmap finch psutil picom nitrogen lxappearance -y
sudo pip3 install awscli
sudo pip install --user bumblebee-status

# Setting up finch messenger
cd ~/Downloads
wget http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_20.04/amd64/purple-facebook_20210215~e0d7732~22_amd64.deb
sudo dpkg -i purple-facebook*.deb \
&& sudo apt-get install -f -y \ 
&& sudo dpkg -i purple-facebook_*.deb



# Customize Rofi
mkdir ~/.config/rofi/
cd ~/.config/rofi/
wget https://raw.githubusercontent.com/undiabler/nord-rofi-theme/master/nord.rasi
echo "rofi.theme: nord" >> ~/.config/rofi/config


# Install Oh my zsh 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Install ZSH plugins (autosuggestions autocomplete syntax-highlighting fzf)
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

#Installing fzf
~/.fzf/install

# Install node and yarn
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - &&
sudo apt-get update &&
sudo apt install -y nodejs &&
sudo npm install -g yarn@8.5.5 &&

# Setting up ZSH
plugins="git zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting sudo" &&
sed -i "s%plugins=(git)%plugins=($plugins)%g" ~/.zshrc &&
sed -i "s%robbyrussell%jonathan%g" ~/.zshrc &&
echo "screenfetch" >> ~/.zshrc &&
echo alias cat='"bat"' >> ~/.zshrc &&
echo alias mp3-dl='"youtube-dl --extract-audio --audio-format mp3"' >> ~/.zshrc &&
echo alias video-dl='"youtube-dl -f 24"' >> ~/.zshrc &&
echo alias localhost='"cd /var/www/html/"' >> ~/.zshrc &&
echo alias system-update='"sudo apt-get update && sudo apt-get dist-upgrade -y"' >> ~/.zshrc &&
echo alias exit='"history -c && exit"' >> ~/.zshrc &&

#Install snap
cd ~/
mkdir temp
cd temp/
sudo rm /etc/apt/preferences.d/nosnap.pref &&
sudo apt update &&
sudo apt install snapd &&

# Install snap programs
for product in teams zoom beekeeper-studio code slack arduino; do
  echo "Installing $product..."
  sudo snap install $product --classic
done

#Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i  google-chrome-stable_current_amd64.deb &&

cd ~ &&
rm -rf temp/ &&

# Set fonts
cd /usr/local/share/fonts &&
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/ShareTechMono.zip &&
sudo wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip &&
sudo unzip ShareTechMono.zip &&
sudo unzip Terminus.zip &&
sudo rm -rf *.zip

#Install amd gpu
wget https://repo.radeon.com/amdgpu-install/21.50.2/ubuntu/bionic/amdgpu-install_21.50.2.50002-1_all.deb &&
sudo dpkg -i amdgpu-install_21.50.2.50002-1_all.deb &&

# Need reboot to make changes
sudo reboot
