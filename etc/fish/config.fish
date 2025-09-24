# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# Disable the greeting
set -U fish_greeting

if status is-interactive
    # Allow jumping back to Bash if necessary
    alias bash='env NOFISH=1 bash'

    # Bind `Ctrl+Backspace` to delete a word behind the cursor
    bind \b backward-kill-word

    # Enable `fzf` integration
    fzf --fish | source
end
