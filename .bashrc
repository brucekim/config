# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend 
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w \$\[\033[00m\] '
    # PS1='\[\e]0;\u: \W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\] \[\033[01;31m\]\w \$\[\033[00m\] \[\033[32m\]$(parse_git_branch)\[\033[00m\]'
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

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="$PS1\[\033[32m\]\$(parse_git_branch)\[\033[00m\] "

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
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# RETROPIE PROFILE START
# Thanks to http://blog.petrockblock.com/forums/topic/retropie-mushroom-motd/#post-3965

function welcome() {
    local upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
    local secs=$((upSeconds%60))
    local mins=$((upSeconds/60%60))
    local hours=$((upSeconds/3600%24))
    local days=$((upSeconds/86400))
    local UPTIME=$(printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs")

    # calculate rough CPU and GPU temperatures:
    local cpuTempC
    local cpuTempF
    local gpuTempC
    local gpuTempF
    if [[ -f "/sys/class/thermal/thermal_zone0/temp" ]]; then
        cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000)) && cpuTempF=$((cpuTempC*9/5+32))
    fi

    if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
        if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
            gpuTempC=${gpuTempC:5:2}
            gpuTempF=$((gpuTempC*9/5+32))
        else
            gpuTempC=""
        fi
    fi

    local df_out=()
    local line
    while read line; do
        df_out+=("$line")
    done < <(df -h /)

}
function welcomemsg() {
echo "$(tput setaf 2)
   .~~.   .~~.    $(date +"%A, %e %B %Y, %r")
  '. \ ' ' / .'   $(uname -srmo)$(tput setaf 1)
   .~ .~~~..~.   
  : .~.'~'.~. :   $(tput setaf 3)${df_out[0]}$(tput setaf 1)
 ~ (   ) (   ) ~  $(tput setaf 7)${df_out[1]}$(tput setaf 1)
( : '~'.~.'~' : ) Uptime.............: ${UPTIME}
 ~ .~       ~. ~  Memory.............: $(grep MemFree /proc/meminfo | awk {'print $2'})kB (Free) / $(grep MemTotal /proc/meminfo | awk {'print $2'})kB (Total)$(tput setaf 7)
  (  $(tput setaf 4) |   | $(tput setaf 7)  )  $(tput setaf 1) Running Processes..: $(ps ax | wc -l | tr -d " ")$(tput setaf 7)
  '~         ~'  $(tput setaf 1) IP Address.........: $(ip route get 8.8.8.8 2>/dev/null | head -1 | cut -d' ' -f8) $(tput setaf 7)
    *--~-~--*    $(tput setaf 1) Temperature........: CPU: $cpuTempC°C/$cpuTempF°F GPU: $gpuTempC°C/$gpuTempF°F

$(tput sgr0)"
}

welcome

# RETROPIE PROFILE END
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/scripts:$PATH"
eval "$(rbenv init -)"


# local config, 2020.03.02
if [ -f $HOME/git/config/skt_config ]; then
    source $HOME/git/config/skt_config
fi

export SCREENDIR=$HOME/.screen

export GOROOT=/usr/local/go     # go가 설치된 디렉토리
export GOPATH=$HOME/go         # go의 workspace 위치를 정의하는 환경변수
export GOBIN=$HOME/go/bin      # go install 명령을 실행했을 때 바이너리 파일이 생성되는 디렉터리를 설정하는 환경변수
export PATH="$GOROOT/bin:$(go env GOBIN):$PATH"
export PATH="$HOME/scripts:$PATH"

# 터미널 커서 깜빡임 활성화
echo -e "\033[?12h"

#CUDA
#export PATH="/usr/local/cuda-11.8/bin:$PATH"
#export LD_LIBRARY_PATH="/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH"

# 마지막 2개 경로만 프롬프트에 보여줌
PROMPT_DIRTRIM=2
