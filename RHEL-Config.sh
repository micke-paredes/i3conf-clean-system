# Initial installation 
sudo yum update -y
sudo yum upgrade -y
sudo yum install filezilla meld youtube-dl \
rofi ranger git bat vim zsh python3 \
python3-pip screenfetch ansible unzip nmap \
clip maim finch -y
pip3 install awscli
pip install --user bumblebee-status

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

sudo apt install snapd &&
