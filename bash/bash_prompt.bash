NOCOLOR=$'\e[0m'
GRAY_F=$'\e[38;5;244m'
BLUE_F=$(tput setaf 04)
RED_F=$(tput setaf 01)
ORANGE_F=$(tput setaf 03)

status_text=""
git_branch=""
user_name=""
host_name=""
pwd_name=""

__parse_git_branch () {
  if command_exist __git_ps1; then
    git_branch="\[$GRAY_F\]$(__git_ps1)\[$NOCOLOR\]"
  else
    #To clear the last value set if any.
    git_branch=""
  fi
}

__status_code () {
  if [ $? -eq 0 ]; then
    status_text='\[$GRAY_F\]\$\[$NOCOLOR\]'
  else
    status_text='\[$RED_F\]\$\[$NOCOLOR\]'
  fi
}

__user_name () {
  user_name='\[$BLUE_F\]\u\[$NOCOLOR\]'
}

__host_name () {
  host_name=''
}

__pwd_name () {
  pwd_name='\[$ORANGE_F\]\w\[$NOCOLOR\]'
}

# PROMPT_COMMAND: If set, the value is interpreted as a command to execute before the printing of each primary prompt ($PS1).
# Each console code sequence must be delimited with \[ and \] in the PS1 variable.

export PROMPT_COMMAND=__bash_prompt

__bash_prompt () {
  __status_code # __status_code must be called first
  __user_name
  __host_name
  __pwd_name
  __parse_git_branch
  export PS1="\n$user_name: $pwd_name $git_branch\n$status_text "
}

unset status_text
unset git_branch
unset user_name
unset host_name
unset pwd_name
