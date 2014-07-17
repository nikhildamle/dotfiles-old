function nullnohup() {
  nohup $@ > /dev/null &
}

export -f nullnohup
