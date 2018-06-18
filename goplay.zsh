
####
# Place somewhere in .zshrc to load =>
# . ./path/to/goplay.zsh
####

goplay() {
	
	GO_PLAY_PATH=$HOME/goplay # => Main dir
	PROJECT_PATH=$GO_PLAY_PATH/$1 # => New Project dir

	# Make sure $EDITOR is defined
	if [ ! $EDITOR ]; then
		echo EDITOR must be defined.
		echo " # e.g. export EDITOR=code"
		return;
	fi

	# Make goplay directory if it isn't there
	if [ ! -d $GO_PLAY_PATH ]; then
		mkdir $GO_PLAY_PATH;
	fi

	# List directory with arg list
	if [[ $1 = "list" ]]; then
		ls -1 $GO_PLAY_PATH
		return
	fi

	# nuke directory with arg nuke
	if [[ $1 = "nuke" ]]; then
		read "?Sure? This will remove everything at $GO_PLAY_PATH (y/n) " yn
		if [[ $yn == "y" ]]; then
			rm -rf $GO_PLAY_PATH
		fi
		return
	fi

	# If first arg open, open dir if exists.
	if [[ $1 = "open" ]]; then
		if [[ -d $GO_PLAY_PATH/$2 ]]; then
			$EDITOR $GO_PLAY_PATH/$2
			return
		else 
			echo $2 does not exist.
			return
		fi
		return
	fi

	# Make sure option is not first		
	if [[ $1 = "-"* ]]; then
		echo Dirname must go first
		return
	fi
	
	# Check if dir is already there
	if [ -d $PROJECT_PATH ]; then 
		echo "Project already exists under $1"
		read "?Overwrite it? (y/n) " yn
		
		if [[ $yn == "y" ]]; then
			rm -rf $PROJECT_PATH;
      goplay $1 -o
		elif [[ $yn == "n" ]]; then
			return
		fi
		return
	fi

	
	# Make the playground directory
	mkdir $PROJECT_PATH;
	cd $PROJECT_PATH;
	printf "package main \n import \"fmt\" \n func main() {\nfmt.Println(\"Don't panic.\")\n}" >> main.go && go fmt;
	
	getopts o OPTION
	# If option -o, open it in $EDITOR
	if [[ $2 = "-o" ]]; then
		echo Opening... $PROJECT_PATH
		$EDITOR $PROJECT_PATH
	else
		echo Done.
	fi
}