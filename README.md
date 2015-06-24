.dotfiles
=========
.dotfiles for recreating my environment

## VIM
.vimrc has a dependency on the pathogen plugin manager from https://github.com/tpope/vim-pathogen

Install pathogen:

`mkdir -p ~/.vim/autoload ~/.vim/bundle && \`
`curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim`

Once pathogen is installed you can install lightline:

`git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim`
