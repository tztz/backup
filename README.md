# Backup via restic to Amazon S3

See <https://restic.readthedocs.io/>

## ENV_VARS

The following ENV_VARS are required and must be stored in the `.backup.env` file.
Make sure having the `.backup.env` file located in the same folder as all the `backup_*.sh` shell scripts.

```bash
AWS_DEFAULT_REGION="..."
RESTIC_REPOSITORY="..."
AWS_ACCESS_KEY_ID="..."
AWS_SECRET_ACCESS_KEY="..."
RESTIC_PASSWORD="..."
```

These ENV_VARS specify the location of the S3 backup and the credentials required for access.
