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

# The `-b` flag specifies that the output of dircolors is bash specific
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Load any aliases, functions, platform-specific scripts, etc.  Relegating them
# to ~/.bashrc.d keeps things tidy.
# https://blog.sanctum.geek.nz/shell-config-subfiles/
if [ -d "${HOME}"/.bashrc.d ]
then
  for file in "${HOME}"/.bashrc.d/*.sh; do
    [ -r "${file}" ] && source "${file}"
  done
  unset file
fi

# z will take you to the most 'frecent' directory that matches ALL of the
# regexes given on the command line, in order.
# https://github.com/rupa/z
. ~/.local/bin/z
