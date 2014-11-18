# .bashrc

# User specific aliases and functions
cdl () { cd $1; ls -la; }

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#Exports
export EDITOR='/bin/vi'
export PS1='\w: '

#Includes
source ~/.bash_prompt
source ~/.aliases
