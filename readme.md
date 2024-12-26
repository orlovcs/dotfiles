# dotfiles

## Ansible Command

```sh
    ansible-playbook -vvv --ask-become-pass -i inventory.yml --limit localhost install_shell.yml
```

## Terminal Setup

1. Install Zsh:

   ```sh
   sudo apt-get install zsh
   ```

2. Install Oh My Zsh:

   ```sh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

3. Replace your [.zshrc](http://_vscodecontentref_/1) with the template included in Oh My Zsh:

   ```sh
   cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
   source ~/.zshrc
   ```

4. Install Powerline:

   ```sh
   git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
   ```

5. Install Menlo Powerline font for VS Code:

   ```sh
   git clone https://github.com/abertsch/Menlo-for-Powerline.git
   cd Menlo-for-Powerline
   cp "Menlo for Powerline.ttf" ~/.fonts
   fc-cache -vf ~/.fonts
   ```

6. Install Zsh Autosuggestions:
   ```sh
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   ```
