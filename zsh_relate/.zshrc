# Set up the prompt


# enable to custom configuration
source zsh_exconf.sh
cust_init

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# prompt relations
#edge
LEFT_EARC=$'\ue0b6'
RIGHT_EARC=$'\ue0b4'

PROMPT="%F{238}$LEFT_EARC%f%K{238}%B%m:%F{yellow}%/%f%b%k%f%F{238}$RIGHT_EARC%f > "

# others

