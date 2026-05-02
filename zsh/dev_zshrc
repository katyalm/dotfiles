# [ --- AUTO TMUX --- ]
# Auto start tmux session
# if command -v tmux &>/dev/null && [[ -z "$TMUX" ]]; then
  # tmux new-session -A -s main
# fi
# [ --- --------- --- ]

# [ --- SETOPTS --- ]
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt glob_dots
# [ --- ------- --- ]

# [ --- ZINIT SETUP --- ]
# Default ZINIT_HOME path from zdharma-continuum/zinit. Instead of using '~/' (aka $HOME), it uses $XDG_DATA_HOME, which defaults to '~/.local/share'.
# This follows the XDG Base Directory Specification, which basically just says "please stop putting everything in $HOME, it gets too cluttered"
# If you are curious for more info about why it is good to use XDG_DATA_HOME, there is an article that discusses it here https://farbenmeer.de/blog/xdg-basisverzeichnis-spezifikation.
#
# ":-" is an operator that will use the right-side value if that value exists, and the left-side value if the right-side is unset or empty.
# The path expression "${XDG_DATA_HOME:-${HOME}/.local/share}" breaks down as such:
#       Use $XDG_DATA_HOME,
#       unless it is unset or empty,
#       then use '${HOME}/.local/share' (this is the standard path for XDG_DATA_HOME).
#
# Basically, if you haven't modified your XDG_DATA_HOME path, this expression will use your system's default path for it,
# or it will just manually resolve to ~/.local/share, if your system default has no XDG_DATA_HOME value.
# If you *have* modified your XDG_DATA_HOME path, this expression will just use that as the path prefix for zinit.
# If you want to use regular home instead, just change the expression to ${HOME}. The full path string would be "${HOME}/zinit/zinit.git".
# You can also just change any part of the path to whatever you want, just make sure it paths to zinit.git.
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"                                               # Makes the ZINIT_HOME directory if it doesn't exist
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"     # Clones the repo if it doesn't exist
source "${ZINIT_HOME}/zinit.zsh"                                                                        # Starts zinit
# [ --- ----------- --- ]

# [ --- AUTOSUGGEST SETUP --- ]
# This strategy dictates how your suggestions will be generated.
# (history completion) will try to find a suggestion from your command history.
# If it can't, it will then try to find a suggestion using the completion engine (same options as tab-complete).
# If you want to change the order of priority, you can use (completion history), and if you want to remove one of the
# strategies entirely, just take it out. It is valid to have just (history) or just (completion).
#
# One note about (completion history) is that, most of the time, it functions like (completion). This is because
# it is designed to find *something* to suggest for every valid command, and it only falls back to your history
# if it *fails* to find a completion suggestion. In practice, this rarely ever happens. So if you want suggestions
# from your history, I would recommend having at least (history completion) as your strategy.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# If the number of characters in the command exceeds MAX_SIZE, autosuggest will stop suggesting.
# It is mostly intended to prevent autosuggestion trying to run on large amounts of input pasted into the terminal.
# It is also more important if your STRATEGY has completion first, because completion is more expensive than history.
# Recommended MAX_SIZE from the plugin author is 20. Sometimes my directory names are long, so I use 30.
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=30
# [ --- ----------------- --- ]

# [ --- SUBSTRING HISTORY SEARCH --- ]
# These two methods are config/setup for the zsh-history-substring-search plugin.
# The _atinit method are settings that need to be set before the plugin loads,
# and the _atload method are settings that need to be run after it loads.
# I have structured it like this so that it is clean to edit the config for
# the plugin without having to change the zinit ice every time. The ice
# will always just call atinit"_atinit_..." and atload"_atload_...", so
# all you have to do is modify the contents of each method.

# If you want to enable/disable these settings, just comment/uncomment them.
_atinit_history_substring_search() {
  HISTORY_SUBSTRING_SEARCH_PREFIXED=1 		# If disabled, it will search for your current text as a substring in any part of the commands in your history.
  # HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1 	# If enabled, it will only show you unique commands in your history scrollback.
  # HISTORY_SUBSTRING_SEARCH_FUZZY=1 		# If enabled, it will treat anything you have typed as a fuzzy search. i.e. "ab c" will match "*ab*c*".
}

# zsh-history-substring-search does not bind any keybinds by default, so we have to do it here.
_atload_history_substring_search() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
# [ --- ----------------------- --- ]

# [ --- COMPSYS ZSTYLE --- ]
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' continuous-trigger 'tab'

# IMPORTANT
# These following settings (PREVIEW, TMUX) are effectively incompatibile with each other.
# The preview options show a preview of the contents of a directory in the tab-completion menu.
# The tmux option shows the completion menu in a popup window.
# HOWEVER the tmux popup window does not scale with the ls preview system, so if you try to enable both, your completion menu will be basically unreadable.
# It is up to you which one you prefer. Only enable one option, and comment out the others: PREVIEW 1, PREVIEW 2, or TMUX.

# PREVIEW 1: only cd and ls have previews.
#     Useful if you want previews when navigating directories, but you find it to be slow enough that you don't want it running on every command.
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:ls:*' fzf-preview 'ls --color $realpath'

# PREVIEW 2: shows directory previews for all tab complete menus (i.e. if you want to vim a file, but you want help navigating dirs to get there).
#     Most robust preview option, but technically it runs $realpath on *every* completion option, even if it is a subcommand like 'checkout' or 'commit' for git completion.
#     So, if you are running this on a system with large filesystems or NFS mounts, and you notice a slowdown when running tab-complete, don't use this option.
# zstyle ':fzf-tab:complete:*:*' fzf-preview '[ -d $realpath ] && ls --color $realpath'

# TMUX: this displays the completion menu in a small popup window above the prompt. Notably, this has NO directory previews at all.
#     This requires tmux v3.2 or higher. This is also probably the most performant option, so if you want the lightest weight config, enable this one (or disable all of these options).
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# [ --- -------------- --- ]

# [ --- PLUGINS --- ]
# The order matters a lot here! Unless you know what you are doing, do not reorder these plugins.
# If you want to add more plugins, make sure you understand where they should be inserted into the load order.

# Load and install the fzf binary from the repo. This does not actually clone the repo, which is why we need the second load below.
# Needs to be loaded first, since we don't want to use turbo mode for this.
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

# Integrates fzf into some shell functions, like Ctrl+R for fuzzy history search.
# In your zinit/ dir, you will see this repo cloned as fzf-shell. We have to rename it so that zinit doesn't try to use the binary from the first load AS the repository.
zinit ice wait lucid id-as"fzf-shell" nocompile multisrc"shell/{key-bindings,completion}.zsh"
zinit light junegunn/fzf

# Expands "completion" dictionary with other common tools (docker, brew, etc.)
zinit ice wait lucid blockf atpull"zinit creinstall -q ."
zinit light zsh-users/zsh-completions

# Transforms tab-complete into a fuzzy-searchable menu of options.
# NOTE: the atinit"zicompinit" will run compinit before loading plugins.
zinit ice wait lucid atinit"zicompinit; zicdreplay"
zinit light Aloxaf/fzf-tab

# Syntax highlighting as you type your command
zinit ice wait lucid atinit"zicdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

# Up/down history search uses current prompt as a prefix
# Needs to be loaded AFTER fast-syntax-highlighting, but BEFORE compinit
zinit ice wait lucid atinit"_atinit_history_substring_search" atload"_atload_history_substring_search"
zinit light zsh-users/zsh-history-substring-search

# Inline suggestions (default based on history, can change to completion)
# Needs to be loaded at the end.
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
# [ --- ------- --- ]

# [ --- SOFT CLEAR --- ]
# Custom soft-clear that preserves history scrollback
function soft_clear() {
  local lines=$((LINES - 2)) 
  printf '%*s' "$lines" '' | tr ' ' '\n' 	# A trick that prints $lines number of spaces, then transforms the spaces into newlines.
  zle reset-prompt 2>/dev/null || true		# This re-draws prompt after the newlines.
}
alias clear=soft_clear
# [ --- ---------- --- ]

# Wrap all ls aliases with -A
alias ls="${aliases[ls]:-ls} -A"

# [ --- ALIASES --- ]
# Add personal aliases here
alias dev="ssh dev"
# [ --- ------- --- ]

# Starship
eval "$(starship init zsh)"

