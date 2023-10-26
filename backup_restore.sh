#!/bin/bash

#
# Restores the latest or specified backed up snapshot from Amazon S3.
#
# By default the backup is restored to the original parent folder ($BACKUP_SOURCE_PARENT_FOLDER).
# In order to restore to another folder pass a different parent folder as first argument.
# The restored folder is /parent-folder/$BACKUP_SOURCE_FOLDER_NAME (by default $BACKUP_SOURCE_PARENT_FOLDER/$BACKUP_SOURCE_FOLDER_NAME).
#
# By default the latest snapshot is restored.
# In order to restore another snapshot pass the snapshot id as second argument.
#
# Examples:
#   backup_restore.sh /tmp/my-latest-snapshot
#   backup_restore.sh /tmp/my-specific-snapshot 2126f900
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set +o allexport
export $(cat "${DIR}/.backup.env" | xargs)

BACKUP_RESTORE_DEST_PARENT_FOLDER="$1"
if [[ "$BACKUP_RESTORE_DEST_PARENT_FOLDER" == '' ]]; then
    BACKUP_RESTORE_DEST_PARENT_FOLDER="${BACKUP_SOURCE_PARENT_FOLDER}"
fi

[ ! -d "${BACKUP_RESTORE_DEST_PARENT_FOLDER}" ] && \
echo "${BACKUP_RESTORE_DEST_PARENT_FOLDER} is not an existing folder. Skipping backup restore." && \
exit

SNAPSHOT_ID="$2"
if [[ "$SNAPSHOT_ID" == '' ]]; then
    SNAPSHOT_ID="latest"
fi

ORIGINAL_FOLDER="${BACKUP_RESTORE_DEST_PARENT_FOLDER}/${BACKUP_SOURCE_FOLDER_NAME}"

[ -d "${ORIGINAL_FOLDER}" ] && \
echo "Folder ${ORIGINAL_FOLDER} already exists. Choose another destination folder. Skipping backup restore." && \
exit

[ ! -d "${ORIGINAL_FOLDER}" ] && \
restic restore "${SNAPSHOT_ID}" --target ${BACKUP_RESTORE_DEST_PARENT_FOLDER}
