#!/bin/bash

# Use escape sequence to include cwd in the title bar
case $TERM in
  xterm*|rxvt*|screen*)
    TITLEBAR='\[\e]0;\w\a\]';
    ;;
  *)
    TITLEBAR='';
    ;;
esac

unset PROMPT_COMMAND
export PS1="$TITLEBAR[\u@\h \W]\$ "
