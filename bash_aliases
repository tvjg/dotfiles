#!/bin/bash
alias ls='ls --color=auto -F --group-directories-first'
alias grep='grep --color=auto'

if [ -x "$(command -v mvim)" ]; then
  alias vim='mvim -v'
fi

# TODO: Make this dependent on presence of keychain
#alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_ecdsa) && ssh'
