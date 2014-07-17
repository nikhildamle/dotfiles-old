source_if_exist source /usr/share/git/completion/git-completion.bash

# Setting GIT_PS1_SHOWDIRTYSTATE to a nonempty value,
# displays unstaged (*) and staged (+) changes will be shown next to the branch name in the __git_ps1 prompt
export GIT_PS1_SHOWDIRTYSTATE=1
source_if_exist /usr/share/git/completion/git-prompt.sh
# Ubuntu completion
source_if_exist /etc/bash_completion
