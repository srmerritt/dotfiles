test_coprophagia.py
==================

A tiny tool whose input is the output of a django test run, and whose output is the failing test cases, formatted as input to the django test-runner.

That's all very circular, so how about an example that silently tests `my_app` and then immediately re-runs any tests that failed:

`./manage.py test my_app 2>&1 | test_coprophagia.py | xargs ./manage.py test`

Or, more usefully (and how my aliases are set up to use the script):

`./manage.py test my_app 2>&1 | tee test_output.log`

Then, later:

`cat test_output.log | test_coprophagia.py | xargs ./manage.py test`

pre-commit
==========

A git pre-commit hook to pass any edits to python files through pyflakes and search for stray occurrences of pdb. This will likely save you a good deal of mockery at the hands of your peers.

This uses `ack` over `grep` due to my own personal habits, but you can change this in `pre-commit` if you do not have `ack` installed.

Move `find_pdbs_from_diff.py` and `pre-commit` into the `.git/hooks` directory of your local git repository.
