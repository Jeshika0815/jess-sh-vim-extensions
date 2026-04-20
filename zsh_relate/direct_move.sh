#!/bin/bash

# main function(command name)
drmv(){

local manual="${HOME}/my_env/manual/emp_man.txt"
local opti
local OPTIND=1

while getopts "l:a:s:r:" opti; do
	case "$opti" in
		l) ls -ls "$OPTARG"; return ;;
		a) ls -als "$OPTARG"; return ;;
		s) find ~ -maxdepth 20 -type d | grep  "$OPTARG"; return ;;
		r) find / -maxdepth 20 -type d 2>/dev/null | grep  "$OPTARG"; return ;;
		*) 
			if [[ -f "$manual" ]]; then
				cat $manual
			else
				echo "manual not found"
			fi
			return 1 
			;;	
	esac
done
shift $((OPTIND - 1))

# Not option then
if [ $# -gt 0 ]; then
	fcmd=$(find / -maxdepth 20 -name $1 2>/dev/null | grep -c .)
	if [ $fcmd -eq 1 ] && [ -d $1 ]; then
		cd $(find / -maxdepth 20 -name $1 2>/dev/null)
	else
		local dirs=($(find / -maxdepth 20 -type d 2>/dev/null | grep $1))
		echo "$(${dirs} | grep -c .) Found"
		select dir in "${dirs[@]}"; do
			if [ -n "$dir" ]; then
				cd $dir
				break
			else
				echo "Not found"
			fi
		done
	fi
else
	if [[ -f "$manual" ]]; then
		cat $manual
	else
		echo "manual not found"
	fi
	return 1
fi

}

