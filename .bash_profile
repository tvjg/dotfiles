# In case of screen, ensure hostname is echoed to status line
# Must be set before PS1
case "$TERM" in
screen*)
  PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
  ;;
esac

# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,bash_exports,bash_aliases,bash_functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# eval `keychain --quiet --eval id_ecdsa`
