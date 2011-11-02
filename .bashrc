alias grep='grep --exclude=*00*.py*'
alias grep='grep --exclude=*00*.py*'
function find_git_branch() {
  local MAYBE_GIT_HEAD="$(pwd | sed 's/\(\/Users\/scottmerritt\/rdio[^/]*\).*/\1\/.git\//')HEAD"
  if [ -f "$MAYBE_GIT_HEAD" ]
  then
    echo "$(cat $MAYBE_GIT_HEAD | sed -e 's/ref: refs\/heads\///')"
  else
    echo "---"
  fi
}
export PS1="--- \W [\$(find_git_branch)] \$ "

alias act="ack -G '^(?!.*tests).*$'"
alias testcc="./test.sh payment.CybersourceInterfaceTests payment.CybersourceSubscriptionTests payment.DelayedBillingTests cybersource"
alias rmpyc="find . -name '*.pyc' | xargs rm"

# Helpers for running django tests
export DJ_TEST_OUT="/Users/scottmerritt/misc_work/djtest/out.log"
function tst() { ./test.sh --verbosity=0 2>&1 "$@" | tee $DJ_TEST_OUT ;}
alias tstfs="cat $DJ_TEST_OUT | ~/.test_coprophagia.py"
alias retst="tst `tstfs`"

# Capture changes to bashrc
alias sbp="source ~/.bashrc"

# Switch between djangos
alias r2="cd ~/rdio2/rdio"
alias r1="cd ~/rdio/rdio"

