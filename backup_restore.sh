#!/bin/bash

#
# Restores the latest backed up snapshot from Amazon S3.
#
# By default the backup is restored to the original parent folder ($BACKUP_SOURCE_PARENT_FOLDER).
# In order to restore to another folder pass a different parent folder as argument.
# The restored folder is /parent-folder/$BACKUP_SOURCE_FOLDER_NAME (by default $BACKUP_SOURCE_PARENT_FOLDER/$BACKUP_SOURCE_FOLDER_NAME).
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

BACKUP_RESTORE_DEST_PARENT_FOLDER="$1"
if [[ "$BACKUP_RESTORE_DEST_PARENT_FOLDER" == '' ]]; then
    BACKUP_RESTORE_DEST_PARENT_FOLDER="${BACKUP_SOURCE_PARENT_FOLDER}"
fi

ORIGINAL_FOLDER="${BACKUP_RESTORE_DEST_PARENT_FOLDER}/${BACKUP_SOURCE_FOLDER_NAME}"

[ -d "${ORIGINAL_FOLDER}" ] && \
echo "Folder ${ORIGINAL_FOLDER} already exists. Choose another destination folder. Skipping backup restore." && \
exit

[ ! -d "${ORIGINAL_FOLDER}" ] && \
restic restore latest --target ${BACKUP_RESTORE_DEST_PARENT_FOLDER}
