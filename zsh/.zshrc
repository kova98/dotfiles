# Removes the annoying '%' at the end of commands
PROMPT_EOL_MARK=''

eval "$(starship init zsh)"



# Ctrl+Left / Ctrl+Right — move by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


# Aliases
alias la='ls -la'

# Add autocomplete plugin
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh