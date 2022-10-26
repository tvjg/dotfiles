#!/bin/bash
alias ls='ls --color=auto -F --group-directories-first'
alias grep='grep --color=auto'

if [ -x "$(command -v mvim)" ]; then
  alias vim='mvim -v'
fi
