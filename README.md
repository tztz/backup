# Backup/Restore via restic to/from Amazon S3

See <https://restic.readthedocs.io/>

## Prerequisites

The following environment variables are required and must be stored in a file called `.backup.env`.
Make sure having the `.backup.env` file located in the same folder as all the `backup_*.sh` shell scripts.

```bash
BACKUP_SOURCE_PARENT_FOLDER="..." # e.g. /home/mark
BACKUP_SOURCE_FOLDER_NAME="..." # e.g. mydata or Documents
AWS_DEFAULT_REGION="..." # e.g. eu-central-1
RESTIC_REPOSITORY="..." # e.g. s3:https://s3.amazonaws.com/<your-backup-location>
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
RESTIC_PASSWORD="..."
```

These environment variables specify the folders to backup resp. restore to, the location of the S3 backup, and the credentials required for access.

Do not share your credentials!

## Backup

Execute

```bash
backup_create.sh
```

That's it.

## Restore

Note: Nothing will ever be overwritten! If the destination to restore to already exists, the restore process will do nothing but quit with an error message saying that the destination folder already exists.

### Restore during normal operation

Just execute

```bash
backup_restore.sh
```

That's it.

### Restore backup after a fresh OS installation (aka there's nothing on your computer)

1. Download the `backup_restore.sh` file from this repository to some temporary, empty folder on your machine.
2. Add a `.backup.env` file with your configuration and credentials to the same folder.
3. Execute

   ```bash
   backup_restore.sh
   ```

4. Once the restore is complete you can delete the temporarily created folder.

That's it.
