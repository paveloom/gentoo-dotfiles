# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# Disable the greeting
set -U fish_greeting

# Set the default editor
set -x EDITOR /bin/nvim

# Set the path to the `ripgrep` config
set -x RIPGREP_CONFIG_PATH /etc/ripgrep/config

# Enable the `fzf` integration
fzf --fish | source

# Bind `Ctrl+Backspace` to delete a word behind the cursor
bind ctrl-backspace backward-kill-word

# Make `Ctrl+Left` and `Ctrl+Right` move between words
bind ctrl-left prevd-or-backward-word
bind ctrl-right nextd-or-forward-word
