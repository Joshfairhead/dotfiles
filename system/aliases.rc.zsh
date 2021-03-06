# places
alias ..="cd .."
alias code="cd $HOME/Code"

# ls
[[ $(which gls) ]] && LS="gls" || LS="ls"
alias ls="$LS -FH --color"
alias ll="$LS -lhH --group-directories-first --color"
alias lla="$LS -lhAH --group-directories-first --color"
unset LS

# path
alias path='echo $PATH | tr : "\n"'

# fattest directories
alias fatd="gdu -sh *(/D) | gsort -rh | head -10"
alias fatdr="gdu -Sh | gsort -rh | head -10"

# date
[[ $(which gdate) ]] && DATE="gdate" || DATE="date"
alias now="$DATE --rfc-3339=seconds"
unset DATE

# -- Snippets ------------------------------------------------------------------

# Download website for full offline navigation
# Source: http://www.kossboss.com/linux---wget-full-website
if [[ $(which wget) ]]; then
  alias wget-full="wget --recursive --no-parent --page-requisites --adjust-extension --convert-links --timestamping \
                        --user-agent=mozilla --limit-rate=200k --random-wait --execute robots=off"
fi

if [[ $(which xkcdpass) ]]; then
  alias xkcdpass="xkcdpass --interactive --numwords=4 --valid-chars='[a-z]' --max=8 --delimiter='-'"
fi

if [[ $(which lsof) ]]; then
  alias listening="sudo lsof -iTCP -sTCP:LISTEN -n -P"
fi


# -- Compatibility -------------------------------------------------------------

if [[ "$OS" == "Linux" ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

if [[ "$OS" == "Darwin" ]]; then
  alias tac='tail -r'
fi
