# Get current location
workDir=`pwd`

# Initial installation 
sudo yum upgrade -y
sudo yum install -y filezilla meld youtube-dl ffmpeg rofi ranger git bat vim zsh python3 python3-pip neofetch ansible unzip nmap xclip maim finch lxappearance-devel picom feh-3.8-2.fc36 nitrogen httpd openssh samba firewalld python3-netifaces -y
sudo yum install -y cmus util-linux-user i3 xedit.x86_64 
sudo yum install -y i3-gaps-4.19.1-3.fc36 --allowerasing --skip-broken
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y powerline-fonts fontawesome-fonts fira-code-fonts

# pip libraries
pip3 install awscli psutil i3ipc
pip install --user bumblebee-status

# Setting up Wallpaper
mv Wallpaper.jpg ~/Pictures/ 

# i3 config file
mv config ~/.config/i3/

# Setting up samba
chmod +x samba.sh
./samba.sh
rm samba.sh

# Install Oh my zsh 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Make temp directories
mkdir -p ~/.config/rofi/
mkdir -p ~/.config/i3/
mkdir -p ~/.local/share/fonts/
mkdir -p ~/.local/share/rofi/themes/

# Install ZSH plugins (autosuggestions autocomplete syntax-highlighting fzf)
cd ~/.oh-my-zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

#Installing fzf
~/.fzf/install

# Setting up power level 10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sed -i "s%robbyrussell%powerlevel10k/powerlevel10k%g" ~/.zshrc &&

# Setting up zsh settings
plugins="git zsh-autosuggestions zsh-autocomplete zsh-syntax-highlighting sudo" &&
sed -i "s%plugins=(git)%plugins=($plugins)%g" ~/.zshrc &&
echo "neofetch" >> ~/.zshrc &&
echo alias cat='"bat"' >> ~/.zshrc &&
echo alias mp3-dl='"youtube-dl --extract-audio --audio-format mp3"' >> ~/.zshrc &&
echo alias video-dl='"youtube-dl -f 24"' >> ~/.zshrc &&
echo alias exit='"history -c && exit"' >> ~/.zshrc
echo alias clear='"clear && neofetch"' >> ~/.zshrc


# Set fonts
cd $workDir
wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip &&
mv Terminus.zip ~/.local/share/fonts/
unzip ~/.local/share/fonts/Terminus.zip &&
rm -rf *.zip
sudo fc-cache -v

cd $workDir
# i3 Lock
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy/
sudo make install
# i3 alternate Layouts
git clone https://github.com/olemartinorg/i3-alternating-layout.git
sudo mv i3-alternating-layout/alternating_layouts.py /bin 
rm -rf *

# Set Rofi
git clone https://github.com/lr-tech/rofi-themes-collection.git &&
mv rofi-themes-collection/themes/* ~/.local/share/rofi/themes/ &&

# Enable and start services
sudo systemctl start httpd.service
sudo systemctl enable httpd.service

sudo systemctl start ssh.service
sudo systemctl enable ssh.service

# rm -rf $workDir

exit
