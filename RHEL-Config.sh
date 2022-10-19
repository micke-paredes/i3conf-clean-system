# Initial installation 
sudo yum update -y
sudo yum upgrade -y
sudo yum install filezilla meld youtube-dl ffmpeg rofi ranger git bat vim zsh python3 python3-pip neofetch ansible unzip nmap xclip maim finch lxappearance-devel picom feh-3.8-2.fc36 nitrogen httpd openssh samba firewalld -y

pip3 install awscli
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

# Install snap an packages
sudo apt install snapd &&
# Install snap programs
for product in teams zoom beekeeper-studio code slack arduino; do
  echo "Installing $product..."
  sudo snap install $product --classic
done

# Set fonts
mkdir -p ~/.local/share/fonts/
cd ~/.local/share/fonts/
wget  https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Terminus.zip &&
unzip Terminus.zip &&
rm -rf *.zip
sudo fc-cache -v
