#!/bin/bash
set -e

echo "🔍 Checking system requirements..."

# 1. Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "❌ This script is designed for macOS only."
  exit 1
fi
echo "🍏 macOS detected."

# 2. Check if bash is installed
if ! command -v bash &>/dev/null; then
  echo "❌ Bash is not installed."
  exit 1
fi
echo "🐚 Bash is installed: $(bash --version | head -n 1)"

# 3. Ensure $EDITOR is set
if [[ -z "$EDITOR" ]]; then
  echo "✏️  Setting \$EDITOR to nano"
  export EDITOR=nano
  # Make it permanent for future shells
  echo "export EDITOR=nano" >> ~/.zshrc
else
  echo "✏️  \$EDITOR is already set to '$EDITOR'"
fi

echo "🔧 Installing Zsh and dependencies..."



echo "🔍 Checking system requirements..."

# 1. Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "❌ This script is designed for macOS only."
  exit 1
fi
echo "🍏 macOS detected."

# 2. Check if bash is installed
if ! command -v bash &>/dev/null; then
  echo "❌ Bash is not installed."
  exit 1
fi
echo "🐚 Bash is installed: $(bash --version | head -n 1)"

echo "🔧 Installing Zsh and dependencies..."

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "📦 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Zsh
brew install zsh

# Make Zsh your default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "🌀 Setting Zsh as default shell..."
  chsh -s "$(which zsh)"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "✨ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "✅ Oh My Zsh already installed."
fi

# Replace .zshrc with the default template
echo "📄 Setting up .zshrc..."
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# Install Powerlevel9k theme
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k" ]; then
  echo "🎨 Installing Powerlevel9k theme..."
  git clone https://github.com/bhilburn/powerlevel9k.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
else
  echo "✅ Powerlevel9k already installed."
fi

# Set theme in .zshrc
sed -i '' 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel9k\/powerlevel9k"/' ~/.zshrc

# Install Menlo for Powerline fonts
FONT_DIR="$HOME/Library/Fonts"
if [ ! -f "$FONT_DIR/Menlo for Powerline.ttf" ]; then
  echo "🔤 Installing Menlo Powerline font..."
  git clone https://github.com/abertsch/Menlo-for-Powerline.git /tmp/Menlo-for-Powerline
  cp "/tmp/Menlo-for-Powerline/Menlo for Powerline.ttf" "$FONT_DIR"
  echo "✅ Font installed to $FONT_DIR"
  rm -rf /tmp/Menlo-for-Powerline
else
  echo "✅ Menlo Powerline font already installed."
fi

# Install Zsh Autosuggestions
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  echo "💡 Installing Zsh Autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  echo "✅ Zsh Autosuggestions already installed."
fi

# Enable plugin in .zshrc
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  sed -i '' 's/^plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc
fi

# Install tmuxinator
if ! command -v tmuxinator &>/dev/null; then
  echo "📦 Installing tmuxinator..."
  brew install tmuxinator
else
  echo "✅ tmuxinator already installed."
fi

# Reload Zsh
echo "🔄 Reloading Zsh configuration..."
source ~/.zshrc

echo "🎉 Setup complete! Restart your terminal or run 'exec zsh' to start using it."
