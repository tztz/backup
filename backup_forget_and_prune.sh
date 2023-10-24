#!/bin/bash

#
# Removes and prunes all snapshots from the S3 bucket according to the specified policy.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

# Policy: Keep
#     hourly snapshots for the last 24 hours
#     daily snapshots for the last 2 weeks (14d)
#     weekly snapshots for the last 3 months
#     monthly snapshots for the last 2 years
#     yearly snapshots for the last 95 years
# and forget all the rest
restic forget --keep-within-hourly 24h --keep-within-daily 14d --keep-within-weekly 3m --keep-within-monthly 2y --keep-within-yearly 95y --prune
