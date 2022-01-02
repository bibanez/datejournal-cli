#!/usr/bin/env bash

# Configuration: Defaults
EDITOR="vim"
FILE_TYPE=".txt"				# Any file type interpreted by the editor
FORMAT="%d-%m-%Y" 				# For more format options: see DATE(1)
DIR="$HOME/Documents/Journal/" 	# Save directory

##########

# Main Program

# Build the save directory if it isn't found
if [ ! -d "$DIR" ]; then
	mkdir -p $DIR
fi

# Check the number of arguments passed
if [ $# -gt 0 ]; then
	# Open the specified file
	$EDITOR $DIR$@$FILE_TYPE
else
	# If no argument is passed, open/create the entry corresponding to today
	TODAY=$(date +$FORMAT)
	$EDITOR $DIR$TODAY$FILE_TYPE
fi
