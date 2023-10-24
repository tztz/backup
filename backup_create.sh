#!/bin/bash

#
# Creates a backup of the specified folder ($BACKUP_SOURCE_PARENT_FOLDER/$BACKUP_SOURCE_FOLDER_NAME) to Amazon S3.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

echo "Backing up ${BACKUP_SOURCE_PARENT_FOLDER}/${BACKUP_SOURCE_FOLDER_NAME}" && \
cd ${BACKUP_SOURCE_PARENT_FOLDER} && \
restic backup ${BACKUP_SOURCE_FOLDER_NAME}
