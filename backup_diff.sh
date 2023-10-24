#!/bin/bash

#
# Shows the diff between two snapshots.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

restic diff $1 $2
