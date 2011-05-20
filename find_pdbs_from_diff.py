#!/usr/bin/python
import sys
import re

if __name__ == '__main__':
  """ Expects to operate on the output of `diff --U0 --cached` """
  diff = sys.argv[1]
  file_re = re.compile(r'^\+\+\+ \w+\/([\w/.]+)$')
  line_re = re.compile(r'^@@ [^+]+\+(\d+)[^@]*@@')
  pdb_re  = re.compile(r'^\+.*((from|import) pdb|pdb\.)')
  cur_file = "Unknown"
  cur_line = "Unknown"
  pdb_occurrences = []
  for line in diff.split('\n'):
    f_match = file_re.match(line)
    l_match = line_re.match(line)
    p_match = pdb_re.match(line)
    if f_match:
      cur_file = f_match.groups()[0]
    if l_match:
      cur_line = l_match.groups()[0]
    if p_match:
      pdb_occurrences.append('%s:%s\n%s' % (cur_file, cur_line, line))
  print '\n'.join(pdb_occurrences)