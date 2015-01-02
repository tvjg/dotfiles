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

# init z
# https://github.com/rupa/z
. ~/code/z/z.sh
