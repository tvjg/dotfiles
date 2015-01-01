# ~/.bash_profile: executed by the command interpreter for login shells.

# Because of this file's existence, neither ~/.bash_login nor ~/.profile
# will be sourced.

# See /usr/share/doc/bash/examples/startup-files for examples.
# The files are located in the bash-doc package.

# In case of screen, ensure hostname is echoed to status line
# Must be set before PS1
case "$TERM" in
  screen*)
    PROMPT_COMMAND="printf '\033k$(hostname -s)\033\\';"${PROMPT_COMMAND}
    ;;
esac

# Because ~/.profile isn't invoked if this files exists,
# we must source ~/.profile to get its settings:
if [ -r ~/.profile ]; then . ~/.profile; fi

# The following sources ~/.bashrc in the interactive login case,
# because .bashrc isn't sourced for interactive login shells:
case "$-" in *i*) if [ -r ~/.bashrc ]; then . ~/.bashrc; fi;; esac

# The `-b` flag specifies that the output of dircolors is bash specific 
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
