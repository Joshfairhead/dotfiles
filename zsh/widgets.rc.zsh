# Widgets to be used with `zle`


# -- Debugging ----------------------------------------------------------------

# Source: http://stackoverflow.com/a/2649659
show-buffers() {
  local nl=$'\n' kr
  typeset -T kr KR $'\n'
  KR=($killring)
  typeset +g -a buffers
  buffers+="      Pre: ${PREBUFFER:-$nl}"
  buffers+="  Buffer: $BUFFER$nl"
  buffers+="     Cut: $CUTBUFFER$nl"
  buffers+="       L: $LBUFFER$nl"
  buffers+="       R: $RBUFFER$nl"
  buffers+="AutoSugg: $POSTDISPLAY$nl"
  buffers+="Killring:$nl$nl$kr"
  zle -M "$buffers"
}
zle -N show-buffers


# -- Movement -----------------------------------------------------------------

backward-word-end() {
  [[ $RBUFFER[1] == ' ' ]] && zle backward-char
  zle vi-backward-blank-word-end
  [[ $#LBUFFER != 0 ]] && zle forward-char
}
zle -N backward-word-end

forward-word-end() {
  zle vi-forward-blank-word-end
  zle forward-char
}
zle -N forward-word-end


# -- Completion ---------------------------------------------------------------

# Show dots while waiting to complete. Useful for systems with slow net access,
# like those places where they use giant, slow NFS solutions. (Hint.)
expand-or-complete-with-dots() {
  echo -n "\e[31m...\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots


# -- History control ----------------------------------------------------------

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

# Remove input/suggestion from history
forget-history() {
  local cmd=$BUFFER$POSTDISPLAY
  # Trim trailing whitespace
  cmd=${cmd//[[:space:]]%/}
  # Forget history
  histrm "${cmd}"
  histrl
  # Clean buffer
  region_highlight=("0 ${#cmd} bold,standout")
  BUFFER=${cmd}
  zle send-break
}
zle -N forget-history


# -- Misc ---------------------------------------------------------------------

# Automatically escape URLs when you paste
autoload -U bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

# Enter white spaces around the inserted key
# Based on: http://www.zsh.org/mla/users/2006/msg00690.html
self-insert-padded() {
  setopt localoptions noksharrays
  zle self-insert
  [[ $LBUFFER[-2] != " " ]] && LBUFFER[-1]=" $LBUFFER[-1]"
  LBUFFER[-1]="$LBUFFER[-1] "
}
zle -N self-insert-padded


# -- Plugins ------------------------------------------------------------------

next-suggested-word() {
  [[ $RBUFFER[1] == ' ' ]] && zle .forward-word
  zle .forward-word
}
zle -N next-suggested-word
