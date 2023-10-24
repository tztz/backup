#!/bin/bash

#
# The "mount" command mounts the repository via fuse to a directory (given as argument).
# This is a read-only mount.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

restic mount $1
