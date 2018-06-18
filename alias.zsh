############## ALIAS
# _ for cd
alias _src='cd ~/Source'
alias _memzine='cd ~/Source/memzine.io'
alias _memzine='cd ~/Source/memzine.io'
alias _hhn='cd ~/Source/happy-hour-app'
alias mkdir="mkdir -pv"
alias zshrc="code ~/.zshrc"
alias list="ls -1"
alias scripts="code ~/Scripts"
alias c="clear"
alias init_git="echo node_modules >> .gitignore && git init && git add -A && git commit -m 'initial commit'"

# YARN ALIASES
alias start="yarn start"
alias dev="yarn develop"
alias test="yarn test --watchAll"

alias edit="code ."

# MISC
alias nuke="rm -rf"

alias dns="host -t ns"

# SSH
alias copy_ssh="pbcopy < ~/.ssh/id_rsa.pub && echo 'Copied 📋'"