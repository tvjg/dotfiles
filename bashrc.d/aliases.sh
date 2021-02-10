#!/bin/bash
alias ls='ls --color=auto -F --group-directories-first'
alias grep='grep --color=auto'

if [ -x "$(command -v mvim)" ]; then
  alias vim='mvim -v'
fi

if [ -x "$(command -v mocp)" ]; then
  alias mocp='mocp -M $HOME/.config/moc'
fi
