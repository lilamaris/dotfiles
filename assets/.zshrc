plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  fast-syntax-highlighting
  zsh-syntax-highlighting
)

# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history # path to the history file
HISTSIZE=100000 # number of history items to store in memory
HISTDUP=erase # remove older duplicate entries from history
SAVEHIST=$HISTSIZE # number of history items to save to the history file
 
# Stop zsh autocorrect from suggesting undesired completions
CORRECT_IGNORE_FILE=".*"
CORRECT_IGNORE="_*"
 
# Options
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_expire_dups_first # expire duplicate entries first when trimming history
setopt hist_find_no_dups # don't display duplicate entries in history
setopt hist_ignore_space # ignore commands starting with space
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt hist_save_no_dups # don't save duplicate entries in history
setopt hist_verify # don't execute immediately upon history expansion
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
setopt correct_all # autocorrect commands
setopt interactive_comments # allow comments in interactive shells
 
# Improve autocompletion style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" # colorize filenames
zstyle ':completion:*' menu no # disable menu completion for fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # preview directory contents with cd
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # preview directory contents with zoxide
zstyle ':fzf-tab:*' use-fzf-default-opts yes # use FZF_DEFAULT_OPTS for fzf-tab
 
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
 
# Setup fuzzy finder
export FZF_DEFAULT_OPTS=" \
--color=bg+:#424762,spinner:#b0bec5,hl:#f78c6c \
--color=fg:#bfc7d5,header:#ff9e80,info:#82aaff,pointer:#a5adce \
--color=marker:#89ddff,fg+:#eeffff,prompt:#c792ea,hl+:#ff9e80 \
--color=selected-bg:#424762"
 
if [[ -o interactive ]]; then fastfetch; fi
if [[ -x $(command -v fzf) ]]; then eval "$(fzf --zsh)"; fi

eval "$(starship init zsh)"
