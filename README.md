# dotfiles


# Terminal
0. sudo apt-get install zsh

1. Install oh my zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# replace our ~/.zshrc with the one included in the templates.
cp ~/.oh-my-zsh/templates/zshrc.zsh-template 
~/.zshrcsource ~/.zshrc

2. Install powerline

3. powerline
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

install menlo powerline modded for vs code
git clone https://github.com/abertsch/Menlo-for-Powerline.git
cd Menlo-for-Powerline
cp "Menlo for Powerline.ttf" ~/.fonts
fc-cache -vf ~/.fonts

auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions



# Download the fonts using wget
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf


# i3
[1](screenshots/i3status.png)
[1](screenshots/polybar.png)


# Further Tweaks
- https://github.com/AryToNeX/Glasscord/
