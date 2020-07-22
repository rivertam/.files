# Path to your oh-my-zsh installation.

mount | grep "media\/tb_drive" > /dev/null
if [ $? -eq 0 ]
then
else
  echo "Mounting tb_drive..."
  sudo mount /dev/sda1 /media/tb_drive
fi

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"
# ZSH_THEME="spaceship"

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:$HOME/.rvm/bin:$HOME/.fzf/bin:$HOME/.rvm/bin:/usr/local/go/bin:$HOME/.meteor:$HOME/.cargo/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.yarn/bin:$HOME/.config/.files/scripts:$HOME/.bin:$HOME/.local/share/npm/bin"
export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages"
export PATH="$PATH:/usr/lib/jvm/jdk-12.0.2/bin"
export PATH="$PATH:$HOME/.local/bin"

export PATH_TO_FX="/usr/lib/jvm/javafx-sdk-11.0.2"
export JAVA_HOME="/usr/lib/jvm/jdk-12.0.2"
# export MANPATH="/usr/local/man:$MANPATH"
export NVM_DIR="$HOME/.nvm"
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
alias rg="rg -g \"!*.dae\" -g \"!*.stla\" --smart-case"
alias rgs="rg -g \"*.cpp\" -g \"*.js\" -g \"*.yml\" -g \"*.sh\""
alias rgcss="rg --type-add 'css:*css' -tcss"
alias pgrep="ps aux | rg"
alias hgrep="history | rg"
alias wifi="nmtui"
alias rustfmt="cargo fmt"
alias ccat="pygmentize -g"
alias pushd=">/dev/null pushd"
alias popd=">/dev/null popd"
alias svim="sudo -e"
alias ni="npm install"

# extra git stuff
alias gcd="gco development && gup" 
alias gp='git push -u origin $(git symbolic-ref --short HEAD)'

function findr {
  rg -g "*$1*" --files
}

= () {
  calc="${@//p/+}"
  calc="${calc//x/*}"
  echo "$(($calc))"
}

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/catkin_workspace/devel/setup.zsh

export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:~/frontend/node_modules
# export ROBOT_IP=96.244.40.173
export ROBOT_IP=192.168.0.50
export ROS_MASTER_URI=http://$ROBOT_IP:11311
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$(openrave-config --python-dir)/openravepy/_openravepy_
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.2/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/python2.7/dist-packages/openravepy/_openravepy_/

# export PYTHONPATH="$PYTHONPATH:$HOME/.local/lib/python3.6/site-packages"
# export PYTHONPATH="$PYTHONPATH:/usr/lib/python3/dist-packages"
# export PYTHONPATH="$PYTHONPATH:/usr/lib/python2.7/dist-packages"

# export PATH="$PATH:$HOME/.local/depot_tools"

export LESS="-R"
export LESSOPEN="| bat %s"

export BAT_THEME="TwoDark"

export STANDARD_BOTS_ROBOTICS_REPO=/home/ben/WorkRepos/robotics

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ben/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ben/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ben/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ben/google-cloud-sdk/completion.zsh.inc'; fi

source /home/ben/.config/broot/launcher/bash/br

unset PYTHONPATH

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/ben/.npm/_npx/3669/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/ben/.npm/_npx/3669/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh