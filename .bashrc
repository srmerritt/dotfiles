alias grep='grep --exclude=*00*.py*'
alias bast='ssh smerritt@bastion.int.rdio'
alias cdell='ssh smerritt@craigs-dell'
alias dev2='ssh smerritt@dev2.int.rdio'
alias grep='grep --exclude=*00*.py*'
export PS1="--- \W [\$(cat ~/rdio/.git/HEAD | sed -e 's/ref: refs\/heads\///')] \$ "
alias act="ack -G '^(?!.*tests).*$'"
