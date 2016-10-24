if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

brew install ctags
brew install git
brew install neovim/neovim/neovim
brew install node
brew install python
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install tidy-html5
brew install tmux
brew install tree
brew install vim
brew install yarn

