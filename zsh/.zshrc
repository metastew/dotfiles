export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

source ~/.profile
source ~/.zshaliases
source /usr/share/zsh/share/antigen.zsh

zstyle :compinstall filename '/home/craig/.zshrc'
zstyle ':completion:*' menu select
autoload -Uz compinit promptinit
compinit
promptinit
# prompt theme
prompt walters
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
setopt COMPLETE_ALIASES

# antigen

# powerlevel10k theme
antigen theme romkatv/powerlevel10k

# packages
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen apply

# customize prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_VIRTUALENV_BACKGROUND=053
POWERLEVEL9K_VIRTUALENV_FOREGROUND=219
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# message
printf "Hello, ${USER}@${HOST}\n"
printf "Today is, $(date)\n";
printf "Sysinfo: $(uptime)\n"
tput bold
printf "PROTIP: Don't forget to do a yay -Syu\n"
tput sgr0
printf "\n$(minifortune | cowsay -s)${NC}\n"
