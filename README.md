+ pre-commit
=======
A git pre-commit hook to pass any edits to python files through pyflakes and search for stray occurrences of pdb. This will likely save you a good deal of mockery at the hands of your peers.

This uses `ack` over `grep` due to my own personal habits, but you can change this in `pre-commit` if you do not have `ack` installed.

Move both files into `.git/hooks` directory of your local git repository.
