# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#ADVA OS

export ec_address=10.143.3.24

alias scala-container='sudo /opt/adva/nc/app-tier-scala-container/bin/KARAF-service'
alias karaf='sudo /opt/adva/nc/app-tier-scala-container/bin/KARAF'
alias mount-host='sudo mount -t vboxsf share ~/share'
alias zookeeper='sudo /opt/adva/nc/zookeeper/bin/zkServer.sh'
alias zkClient='sudo /opt/adva/nc/zookeeper/bin/zkCli.sh'
alias prawa_autorskie="git log --author 'Wroniszewski' --pretty=format:'%ad %h %an %s' --date=short | sort -k 4 | sort -s -k 1,1.7"
export PATH=$PATH:$HOME/bin/apache-maven-3.2.1/bin
export PATH=$PATH:$HOME/bin/arc/arcanist/bin
export SIT_AUTOMATION_PATH="$HOME/workspace/aos-sit-automation"
alias scala-run="git --work-tree=$SIT_AUTOMATION_PATH --git-dir=$SIT_AUTOMATION_PATH/.git pull; $SIT_AUTOMATION_PATH/NetworkController/Automation/scala/scala_run.sh"
# alias monolithic-upgrade="git --work-tree=$SIT_AUTOMATION_PATH --git-dir=$SIT_AUTOMATION_PATH/.git pull; $SIT_AUTOMATION_PATH/ElementController/Utilities/monolithic_upgrade.sh $ec_address"
alias monolithic-upgrade="$SIT_AUTOMATION_PATH/ElementController/Utilities/monolithic_upgrade.sh $ec_address"
alias clean-mongo="mongo localhost/nc -u aos -p ChgMeNOW --eval \"db.getCollectionNames().map(function(collection) { var skip = ['system.indexes', 'system.users']; if (skip.indexOf(collection) == -1) { db[collection].drop(); }; })\""
alias ssh-karaf="ssh-keygen -f '$HOME/.ssh/known_hosts' -R [localhost]:8101; ssh -p 8101 karaf@localhost"
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/AOS_BUILD_VE/lib/python2.7/site-packages
export AOS_NE_INSTALL_DIR=$HOME/ec
#export PYTHONPATH=$PYTHONPATH:$AOS_NE_INSTALL_DIR/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$AOS_NE_INSTALL_DIR/lib
#VIRTUAL ENVIRONMENT
export WORKON_HOME=$HOME
source /usr/local/bin/virtualenvwrapper.sh

#UIO
alias ssh-uio='ssh pawelaw@math.uio.no'
alias ssh-dagda='ssh pawelaw@math.uio.no -L 8081:dagda.uio.no:22 -t "ssh dagda"'
alias ssh-omeyocan='ssh pawelaw@math.uio.no -L 8082:omeyocan.uio.no:22 -t "ssh omeyocan"'

alias mount-uio='sshfs pawelaw@math.uio.no: $HOME/work'
alias mount-dagda='sshfs -p 8081 pawelaw@localhost:/work $HOME/work-dagda'
alias mount-omeyocan='sshfs -p 8082 pawelaw@localhost:/work $HOME/work-omeyocan'
alias mount-all='mount-uio; mount-dagda; mount-omeyocan'
alias umount-uio='fusermount -u $HOME/work'
alias umount-dagda='fusermount -u $HOME/work-dagda; umount-uio'
alias umount-omeyocan='fusermount -u $HOME/work-omeyocan'
alias umount-all='fusermount -u $HOME/work;fusermount -u $HOME/work-dagda;fusermount -u $HOME/work-omeyocan'

# gvim () { command gvim --remote-silent "$@" || command gvim "$@"; }
alias gvim='gvim --remote-tab-silent'

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

source $HOME/bin/arc/arcanist/resources/shell/bash-completion

