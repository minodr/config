# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# enabling zsh completion
autoload -U compinit; compinit

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/minase/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='lvim'
else
  export EDITOR='lvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

    # Activate vim mode.
    bindkey -v

    # Remove mode switching delay.
    KEYTIMEOUT=10

    # Change cursor shape for different vi modes.
    function zle-keymap-select {
      if [[ ${KEYMAP} == vicmd ]] ||
         [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'

      elif [[ ${KEYMAP} == main ]] ||
           [[ ${KEYMAP} == viins ]] ||
           [[ ${KEYMAP} = '' ]] ||
           [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
      fi
    }
    zle -N zle-keymap-select

    # Use beam shape cursor on startup.
    echo -ne '\e[5 q'

    # Use beam shape cursor for each new prompt.
    preexec() {
       echo -ne '\e[5 q'
    }

bindkey -M viins 'jk' vi-cmd-mode                          
bindkey -M viins 'kj' vi-cmd-mode                          
bindkey -M viins '^l' clear
bindkey -s '^o' 'lf^m'

alias vim="/home/minase/.local/bin/lvim"
# alias ls="colorls"
alias v='vim'
alias cls='clear'
alias py='python'
alias so='source'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# VI MODE KEYBINDINGS (ins mode)                                      
bindkey -M viins '^a'    beginning-of-line                            
bindkey -M viins '^e'    end-of-line                                  
bindkey -M viins '^k'    kill-line                                    
bindkey -M viins '^p'    up-line-or-history                           
bindkey -M viins '^n'    down-line-or-history                         
bindkey -M viins '^w'    backward-kill-word                          
bindkey -M viins '^u'    backward-kill-line                          
bindkey -M viins '^h'    backward-delete-char                        
bindkey -M viins '\eOH'  beginning-of-line # Home                    
bindkey -M viins '\eOF'  end-of-line       # End                     
                                                                      
# VI MODE KEYBINDINGS (cmd mode)                                      
bindkey -M vicmd '^a'    beginning-of-line                            
bindkey -M vicmd '^e'    end-of-line                                  
bindkey -M vicmd '^k'    kill-line                                    
bindkey -M vicmd '^p'    up-line-or-history                           
bindkey -M vicmd '^n'    down-line-or-history                         
bindkey -M vicmd '^w'    backward-kill-word                          
bindkey -M vicmd '^u'    backward-kill-line                           

export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"
export FZF_BASE=/path/to/fzf/install/dir
POWERLEVEL10K_DISABLE_CONFIGURATION_WIZARD=true

source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

prompt_eol_mark=''
export CHROME_EXECUTABLE=/bin/google-chrome-stable

co() { g++ -std=c++23 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*}}

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH=$PATH:/home/minase/Downloads/platform-tools/
export ANDROID_HOME=/home/minase/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

