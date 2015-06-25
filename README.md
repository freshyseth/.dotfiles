.dotfiles
=========
.dotfiles for recreating my environment

Clone this repo into your user root (init.sh expects this to be the repo path).
```
git clone https://github.com/freshyseth/.dotfiles.git .dotfiles
```
Run the `init.sh` script.
```
~/.dotfiles/init.sh
```
You'll likely need to type your password since you're changing your shell to zsh.
The shell will not reflect the change since everything is done in the scripts subshell.
You'll have to logout/login to reflect the changes.
The install does not install patched fonts which are required for the shell prompt and the vim lightline plugin.
