# places
alias ..="cd .."
alias code="cd $HOME/Code"

# ls
[[ $(which gls) ]] && LS="gls" || LS="ls"
alias ls="$LS -F --color"
alias ll="$LS -lh --group-directories-first --color"
alias lla="$LS -lhA --group-directories-first --color"
unset LS

# path
alias path='echo $PATH | tr : "\n"'

# Linux fixes
if [[ "$(uname -s)" == "Linux" ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

# OSX fixes
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias tac='tail -r'
fi


# -- Snippets -----------------------------------------------------------------

# Download website for full offline navigation
# Source: http://www.kossboss.com/linux---wget-full-website
if [[ $(which wget) ]]; then
  alias wget-full="wget --limit-rate=200k --no-clobber --convert-links --random-wait -r -p -E -e robots=off -U mozilla -N"
fi
