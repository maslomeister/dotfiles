echo -n -e "\033]0; Terminal \007"

# oh my posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config ~/tokyonight_storm.omp.json)"
fi

export NVM_DIR="$HOME/.nvm"

[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # his loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
#source <(ng completion script)

#alias for clear
alias c="clear"


# IP alias and functions
alias ip="ifconfig -l | xargs -n1 ipconfig getifaddr"
alias myip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"

# Pretty print the PATH
alias path='echo; tr ":" "\n" <<< "$PATH"; echo;'


#pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#kill port
function kill-by-port {
  if [ "$1" != "" ]
  then
    kill -9 $(lsof -ni tcp:"$1" | awk 'FNR==2{print $2}')
  else
    echo "Missing argument! Usage: kill-by-port PORT"
  fi
}

# pnpm
export PNPM_HOME="/Users/maslomeister/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# code
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
# code end

# bun completions
[ -s "/Users/maslomeister/.bun/_bun" ] && source "/Users/maslomeister/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# gpg
export GPG_TTY=$(tty)


#zoxide
eval "$(zoxide init zsh)"

#lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

