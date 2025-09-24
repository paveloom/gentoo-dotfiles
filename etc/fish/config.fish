# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

if status is-interactive
    ## Bind `Ctrl+Backspace` to delete a word behind the cursor
    bind \b backward-kill-word
end
