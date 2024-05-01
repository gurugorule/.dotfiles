my_prompt='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;97m\]\[\033[00m\] \[\033[01;31m\]🔮\[\033[00m\] \[\033[01;97m\]\W\[\033[00m\] \[\033[01;91m\]: \[\033[00m\]$(__git_ps1 "\[\033[01;92m\]\[\033[00m\]\[\033[01;97m\] %s\[\033[00m\]") '

my_tmux_prompt="\[\033[01;97m\]  \[\033[00m\]\[\033[01;91m\]\W\[\033[00m\] \[\033[01;97m\]:  \$(__git_ps1 '%s')\[\033[00m\] "

PS1=$my_prompt 

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'
alias cls='clear'
alias tmx='tmux -u'

if [ -n "$TMUX" ]; then
    export PS1=$my_tmux_prompt
else
    export PS1=$my_prompt 
fi


