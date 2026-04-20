#!/bin/zsh

# This script is support under zsh
# Please enable this script and assign functions in your .zshrc(source this_sh_file.sh)
borders='~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'

# Initialize
cust_init(){
	# initialize and activate auto complete
	autoload -Uz compinit && compinit
	
	# enable to use alowkey in auto complete menu and another setting
	zstyle ':completion:*' menu select=long
	zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
	zstyle ':completion:*' use-comptl false
	zstyle ':completion:*' verbose true

	# another setting
	zstyle ':completion:*' auto-description 'specify: %d'
	zstyle ':completion:*' completer _expand _complete _correct _approximate
	zstyle ':completion:*' format 'Completing %d'
	zstyle ':completion:*' group-name ''
	zstyle ':completion:*' menu select=2
	eval "$(dircolors -b)"
	
	# color setting for complete then(ls likely)
	export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46:cd=43:su=37;41:sg=30;43:tw=30;42:ow=34;42'
	zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
	zstyle ':completion:*' list-colors ''
	zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s	 
	zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' 

	# grouping complete descriptions
	zstyle ':completion:*:descriptions' format '%F{220}-- %d --%f'

	# color of error message
	zstyle ':completion:*:warnings' format '%F{red}No matches for: %f %d'

	# kill relations zstyle
	zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31' 
	zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd' 

	# run in startup then
	file_lists

	# extention init including
	read_init
}

# configuration command and aliases

# enable to in cust_init
read_init(){
	# aliases
	# ls relation
	alias ll='ls -alF'
	alias la='ls -A'
	alias l='ls -CF'

	alias cls='clear'

	# font relation
	RIGHT_AL=$'\ue0b0'
} 

# Template of filelists(based ls command)
file_lists(){
	echo $borders
	print -P "%K{yellow}%F{black}Current directory %K{238}%F{yellow}${RIGHT_AL}%F{silver} $(pwd) %k%F{238}${RIGHT_AL}%f"
	echo ''
	ls
	echo $borders
}

# other custom commands
# original cd command
cd(){
	builtin cd "$@"
	file_lists
}

# original clear command
clear(){
	builtin zle clear-screen 2>/dev/null || command clear
	file_lists
}


