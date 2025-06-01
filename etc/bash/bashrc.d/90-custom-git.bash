# /etc/bash/bashrc.d/90-custom-git.bash

# Enable support for the Git prompt
source /usr/share/git/git-prompt.sh

# Enable support for Git completions
source /usr/share/bash-completion/completions/git

# Set up the Git prompt
GIT_PS1='__git_ps1 "(%s) "'
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_SHOWCOLORHINTS="yes"
