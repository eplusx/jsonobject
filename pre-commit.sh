#!/bin/bash

# Use this script as the git pre-commit.
#   ln -s ../../pre-commit.sh .git/hooks/pre-commit

TEST_ROOT="${PWD}"
export PYTHONPATH="${TEST_ROOT}"

# Abort immediately if any of the commands below fails.
set -e
# Run doctest.
echo "Running doctest in Python 2..."
find "${TEST_ROOT}" -name "*.py" | xargs python2 -m doctest
echo "Running doctest in Python 3..."
find "${TEST_ROOT}" -name "*.py" | xargs python3 -m doctest
# Run py.test tests.
echo "Running py.test in Python 2..."
python2 -m pytest "${TEST_ROOT}"
echo "Running py.test in Python 3..."
python3 -m pytest "${TEST_ROOT}"
