function pretty_git_log() {
  local HASH="%C(yellow)%h%C(reset)"
  local RELATIVE_TIME="%C(green)%ar%C(reset)"
  local AUTHOR="%C(blue)%an%C(reset)"
  local REFS="%C(red)%d%C(reset)"
  local SUBJECT="%s"

  local FORMAT="$HASH-$REFS $SUBJECT-$RELATIVE_TIME-$AUTHOR"

  git log --graph --color --decorate --pretty="tformat:$FORMAT" $* |
  # Looks like column from util-linux package has a bug.
  #column -t -s '}' |
  less -FXRS
}

export -f pretty_git_log
