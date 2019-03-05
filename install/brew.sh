if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

brew install ctags
brew install editorconfig
brew install figlet
brew install git
brew install git-flow
brew install htop
brew install ispell
brew install macvim
brew install neovim
brew install node
brew install openssl
brew install python
brew install python3
brew install reattach-to-user-namespace
brew install ripgrep
brew install ruby
brew install the_silver_searcher
brew install tidy-html5
brew install tig
brew install tmux
brew install tree
brew install vim
brew install yarn
brew install zsh
brew install zsh-autosuggstions
brew install zsh-completions
brew install zsh-syntax-highlighting

# install nerdfonts

brew tap caskroom/fonts
brew cask install font-hack-nerd-font
