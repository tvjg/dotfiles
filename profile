# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.  Note, however, that we will have a ~/.bash_profile and it
# will simply source this file as a matter of course.

# See /usr/share/doc/bash/examples/startup-files for examples.
# The files are located in the bash-doc package.

# From here on out, I basically set up my PATH, LD_LIBRARY_PATH, and anything else I'd like
# global to running programs and how those programs find their libraries.  This is shared by
# `cron`, so we really don't want interactive stuff, here.  Also, I setup my environments
# for brew, macports, and fink here, essentially with setting PATH, and invocation of those
# package initialization file as in:

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Brew and locally compiled stuff:
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# The following line puts gnu utilities without the prefix "g" in the path
# i.e. tar/gtar:
if [ -d "/usr/local/opt/coreutils" ]; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

# manage ruby versions
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# manage nodejs versions
if [ -d "$HOME/.nvm" ]; then
  source ~/.nvm/nvm.sh
fi

if [ -d "$HOME/.cask" ]; then
  export PATH="$HOME/.cask/bin:$PATH"
fi

if [ -f "$HOME/.boot_jvm_options" ]; then
  export BOOT_JVM_OPTIONS=`cat $HOME/.boot_jvm_options`
fi
