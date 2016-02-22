#!/bin/bash

# Use this script as the git pre-commit.
#   ln -s ../../pre-commit.sh .git/hooks/pre-commit

TEST_ROOT="${PWD}"
export PYTHONPATH="${TEST_ROOT}"

# Abort immediately if any of the commands below fails.
set -e
# Run doctest.
echo "Running doctest..."
find "${TEST_ROOT}" -name "*.py" | xargs python -m doctest
# Run py.test tests.
echo "Running py.test..."
py.test "${TEST_ROOT}"
