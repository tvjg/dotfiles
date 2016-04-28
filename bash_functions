#!/bin/bash

# Easy extract
function extract() {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Makes directory then moves into it
function mkcdr() {
    mkdir -p -v $1
    cd $1
}

# Echo the folder name and branch of any git repo in the current directory
function git-branches() {
  local git_symbolic_ref
  local git_revision
  for d in $(ls -d */ | sed "s/\/*$//"); do
    if [ -d "$d/.git" ]; then
      git_symbolic_ref="git --git-dir ${d}/.git symbolic-ref --short HEAD"
      git_revision="git --git-dir ${d}/.git rev-parse --short HEAD"
      echo "${d} (`${git_symbolic_ref} 2>/dev/null ||  ${git_revision}`)"
    fi
  done | column -t
}
