# This script will become the bash script that
# installs everything necessary to setup my env
# with everything I need for productivity.

echo ".dotfiles to the rescue! Let's roll!"

# Install .oh-my-zsh
echo "Checking for zsh and .oh-my-zsh"
zsh=$(< /etc/shells grep zsh)
if [[ $zsh != *"zsh"* ]]; then
  echo "Unfortunately, zsh is not an available shell on this system. Sorry!"
elif [ -e ~/.oh-my-zsh ]; then 
  echo "You've already got .oh-my-zsh installed! Great job."
else
  #### Constants
  # From http://ohmyz.sh/
  OH_MY_ZSH_CURL="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
  OH_MY_ZSH_WGET="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

  curl -L $OH_MY_ZSH_CURL | sh || wget $OH_MY_ZSH_WGET  -O - | sh
fi

# Configure .oh-my-zsh 
if [ -f ~/.zshrc ]; then
  echo "Set the theme to agnoster"
  sed -i '' 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/' ~/.zshrc
 
  echo "Set the default user for agnoster theme"
  echo "DEFAULT_USER=$USER" >> ~/.zshrc
  
  echo "Enable command auto-correction"
  sed -i '' 's/# ENABLE_CORRECTION=\"true\"/ENABLE_CORRECTION=\"true\"/' ~/.zshrc

  echo "Use plugins: git, gitfast, git-extras, git-flow-avh"
  sed -i '' 's/plugins=(git)/plugins=(git gitfast git-extras git-flow-avh)/' ~/.zshrc
  
  echo "Add custom aliases"
  cp ~/.dotfiles/.aliases ~/
  echo ". ~/.aliases" >> ~/.zshrc
else
  echo "There is no ~/.zshrc. Make sure .oh-my-zsh was successfully installed."
fi

# Configure git
# git user
echo "Set git user to freshyseth"
git config --global user.name "freshyseth"

# git email
echo "Set git email to freshyseth@gmail.com"
git config --global user.email "freshyseth@gmail.com"

# configure git sugar
echo "Set git alias.stashed"
git config --global alias.stashed "stash list --pretty=format:'%gd: %Cred%h%Creset %Cgreen[%ar]%Creset %s'"

# Configure vim
# install pathogen vim plugin manager
echo "Installing pathogen vim plugin manager"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# copy .vimrc to user root
cp ~/.dotfiles/.vimrc ~/

# Complete
echo "Fin!"
