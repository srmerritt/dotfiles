#! /usr/bin/python

# This file consumes the output of a django test run, parses out lines that
# indicate a test failure, and outputs the failing test cases in a format
# suitable for input to the test-running utility.

def main():
  import sys
  failed_test_cases = []
  for line in sys.stdin.readlines():
    tokens = line.split(' ')
    if len(tokens) == 3:
      (error_level, test_function, package_path) = tokens
      if error_level in ('FAIL:', 'ERROR:'):
        # Get the app name and test class from the full package path
        # package_path should look like "(rdio...tests.app_name.TestClass)"
        app_and_test_class = package_path.split('tests.')[1]
        app_and_test_class = app_and_test_class.rstrip('\r').rstrip('\n').rstrip(')')
        failed_test_cases.append("%s.%s" % (app_and_test_class, test_function))
  print " ".join(failed_test_cases)

if __name__ == '__main__':
  main()

