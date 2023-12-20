# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/homebrew/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
