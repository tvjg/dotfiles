# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# From here on out, I put in things that are meaningful to interactive shells, like aliases,
# `shopt` invocations, HISTORY control, terminal characteristics, PROMPT, etc.

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# OS X bash completion
if hash brew 2>/dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,bash_exports,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# preexec and precmd hook functions for Bash in the style of Zsh
# https://github.com/rcaloras/bash-preexec
[[ -f ~/.bash_preexec ]] && source ~/.bash_preexec

# z will take you to the most 'frecent' directory that matches ALL of the
# regexes given on the command line, in order.
# https://github.com/rupa/z
export _Z_NO_PROMPT_COMMAND=1
. ~/code/z/z.sh

# using bash-preexec means we need to manage hooking z
z_precmd() {
  z --add "${PWD:A}"
}
precmd_functions+=(z_precmd)

# set the tab titles for screen/tmux
# displays hostname or hostname (running_cmd)
before_cmd() {
  # bash_exports adds timestamp to bash_history
  # remove that with cut and then truncate text
  local RUNNING_CMD=$(echo $1 | cut -d' ' -f3- | awk 'length > 12{$0=substr($0,0,13)"..."}1')
  printf "\033k$HOSTNAME (${PWD##*/}/$RUNNING_CMD)\033\\"
}
after_cmd() { printf "\033k$HOSTNAME (${PWD##*/})\033\\"; }

# TODO: Would be nice to have some kind of $SHLVL check, so that subshells
# don't stomp tmux titles.
case "$TERM" in
  screen*)
    preexec_functions+=(before_cmd)
    precmd_functions+=(after_cmd)
    ;;
esac
