# Path to your oh-my-zsh installation.
export ZSH=/home/ben/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/.rvm/bin:$HOME/.fzf/bin:$HOME/.rvm/bin:/usr/local/go/bin:$HOME/.meteor:$HOME/.cargo/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin:$HOME/.config/.files/scripts"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export COLORTERM=gnome-terminal
export TERMINAL=gnome-terminal

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias emacs="emacs -nw"
alias e="emacs -nw"
alias ls="exa -lah --git --color-scale"
alias l="exa -laahgmuU@ --git --color-scale"
alias ll="exa -lhgmuU@T --git --color-scale"
alias tree="exa -T"
alias vim="nvim"
alias ced="pushd ~/.config/.files; vim; source ~/.config/zsh/.zshrc; popd"
alias ccd="pushd ~/.config/.files"
alias logout="sudo service lightdm restart"
alias rg="rg --smart-case"
alias rgcss="rg --type-add 'css:*css' -tcss"
alias pgrep="ps aux | rg"
alias hgrep="history | rg"
alias wifi="nmtui"
alias rustfmt="cargo fmt"
alias ccat="pygmentize -g"
alias pushd=">/dev/null pushd"
alias popd=">/dev/null popd"
alias svim="sudo -e"

# extra git stuff
alias gcd="gco development && gup" 
alias gp='git push -u origin $(git symbolic-ref --short HEAD)'

function findr {
  rg -g "*$1*" --files
}

function background {
  feh --bg-scale ~/.wallpapers/2017\ calendar
}

function laptop-mode {
  xrandr --output HDMI2 --off
  xrandr --output eDP1 --mode 2560x1440
  background
}

function 4k-mode {
  xrandr --output HDMI2 --mode 3840x2160 && \
  xrandr --output eDP1 --off
  background
}

function both-mode {
  xrandr --output HDMI2 --mode 3840x2160 && \
  xrandr --output eDP1 --mode 2560x1440 --right-of HDMI2
  background
}

= () {
  calc="${@//p/+}"
  calc="${calc//x/*}"
  echo "$(($calc))"
}

export NVM_DIR="/home/ben/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export GOPATH="/home/ben/go"
export ANDROID_HOME="/home/ben/Android/Sdk"

. /usr/local/lib/node_modules/deepify/hooks/deepify_comp.sh
[[ -s /home/ben/.rsvm/rsvm.sh ]] && . /home/ben/.rsvm/rsvm.sh # This loads RSVM

source /opt/ros/lunar/setup.zsh

# Hook that occurs when you change pwd
function chpwd() {
  if [ -f devel/setup.zsh ]
  then
    source devel/setup.zsh
    echo "Setup for this ROS environment"
    return
  fi

  local up=0
  while true
  do
    local base="$(printf '../%.0s' $(seq 0 $up))"
    local p="$base/devel/setup.zsh"
    if [ -f $p ]
    then
      source $p
      echo "Setup for this ROS environment"
      break
    fi
    up=$(expr $up + 1)
    echo $(readlink -f $base)
    if [ $(readlink -f "$base") = "/" ]
    then
      break
    fi
  done
}

if [ -f /opt/ros/lunar/setup.zsh ]
then
  source /opt/ros/lunar/setup.zsh
fi

if [[ "$FIRE_AND_FORGET" == "1" ]]
then
  ignore-and-spawn() {
    oldwindowid=$(cat /tmp/__last_window)
    BUFFER="$BUFFER > /dev/null 2>&1 disown; xdotool windowfocus $oldwindowid; clear;"
    notify-send "$BUFFER"
    zle .accept-line
  }

  zle -N ignore-and-spawn
  bindkey '^M' ignore-and-spawn
  bindkey '^J' ignore-and-spawn
fi
