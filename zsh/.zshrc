# Auto start tmux session
if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
  tmux new-session -A -s main
fi

# Check/start znap
[[ -r ~/zsh/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/zsh/znap
source ~/zsh/znap/znap.zsh  # start znap

# znap plugins
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source Aloxaf/fzf-tab
znap source unixorn/fzf-zsh-plugin

# Configure auto-suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)   # history first, then fallback to completion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"        # suggested text is grey
bindkey '^ ' autosuggest-accept                 # ctrl+space accepts suggestion
bindkey '^[[C' autosuggest-accept               # right arrow also accepts

# Configure completion system
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select                                         			# arrow-key navigable menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|=*' 'l:|=* r:|=*'  			# case-insensitive fuzzy
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"                    			# colored entries
zstyle ':completion:*:descriptions' format '[%d]'                         			# group labels
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath 2>/dev/null || echo $word'
zstyle ':fzf-tab:*' switch-group '<' '>'                                                  	# switch groups with < / >

# Configure zsh command history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_ALL_DUPS    # deduplicate (deletes older dup)
setopt HIST_IGNORE_SPACE       # don't record commands prefixed with a space
setopt SHARE_HISTORY           # share history across sessions instantly
setopt EXTENDED_HISTORY        # timestamp + elapsed time per entry
setopt INC_APPEND_HISTORY      # write to history immediately, not on exit
setopt GLOB_DOTS	       # auto complete will recognize . files

# fzf Ctrl+R — full interactive history search
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --cycle"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down:3:wrap --sort"

# Custom soft-clear that preserves history scrollback
function soft_clear() {
  local lines=$((LINES - 2)) 
  printf '%*s' "$lines" '' | tr ' ' '\n' # trick that prints $lines number of spaces, then transforms the spaces into newlines
  zle reset-prompt 2>/dev/null || true # re-draws prompt after the newlines
}
alias clear=soft_clear

# Wrap all ls aliases with -A
alias ls="${aliases[ls]:-ls} -A"

# Aliases [ADD PERSONAL ALIASES HERE]
alias hello="echo 'hi!'"

# Starship
eval "$(starship init zsh)"

