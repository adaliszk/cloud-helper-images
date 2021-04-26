```
NOTE: Work in Progress!
This project is under construction, it should work but not all use-cases has been tested or implemented yet!
```

This image is a very simple wrapper around the great tool Duplicity that allows you to backup files into many cloud services or any on premise solutions.

## Volumes

By default, the image expects volumes at:
* `/data` to be the thing you want to back up
* `/backups` to be a local volume to store backups

Other volumes are:
* `/logs` to store the output of the console and Duplicity
* `/status` to store Healthcheck status information

## Environment Variables

The image exposes a few custom variables:
- `BACKUP_URL`: The URL that Duplicity uses for the backup, default: `file:///backups/volume`
- `BACKUP_RETENTION`: Time that will tell the backup to make full saves, default: `6h`
- `BACKUP_SAVES`: Number that tells the backup to remove incremental and full saves up until you still have the X amount of saves, default: `12`
- `TZ`: Timezone for displaying dates
