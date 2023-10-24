#!/bin/bash

#
# Initializes a new repository if not already initialized.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

restic cat config > /dev/null && echo "Already initialized. Skipping." || \
restic init
