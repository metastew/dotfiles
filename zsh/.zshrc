export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

# variables for system message
toptaskdesc=`task rc.verbose: rc.report.next.columns:description rc.report.next.labels:1 limit:1 next`
toptaskdue=`task rc.verbose: rc.report.next.columns:due.relative rc.report.next.labels:1 limit:1 next`

# message
tput bold
printf "Hello, ${USER}@${HOST}\n"
tput sgr0
printf "$(date)\n";
printf "Sysinfo:$(uptime)\n"
tput setaf 2
if [[ ! -z "$toptaskdue" ]]
then
  printf "TODO: ${toptaskdesc} [due: ${toptaskdue}]\n"
else
  printf "TODO: ${toptaskdesc}\n"
fi
tput setaf 3
printf "PROTIP: Don't forget to do a yay -Syu\n"
tput sgr0
printf "\n$(minifortune | cowsay -s)${NC}\n"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
