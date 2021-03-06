# csync
Small bash script which help backing things up

`csync` will backup every directory placed under `~/.csync`. This file has to be in the following format:

`source-directory;destination-directory;mode[;group]`

* `mode` - can take two values 
** `sync` - will synchronize directories and will remove files (from the target directory) that were deleted in the source directory
** `backup` - will synchronize directories but wil preserve deleted files (in the target directory) that were deleted in the source directory 

Example:
```
/srcdir1/subdir;/desdir1/subdir;sync;group1
/srcdir2/subdir/subsubdir;user@192.168.1.2:/destdir2/mydir;backup;group2
/srcdir3;user@192.168.1.3:/sync;destdir1
```

*csync* syntax: `$ csync [group] [csync-file`]
* `group` - optional parameter for group to be synced (it not set or set to `all` all groups will be synced)
* `csync-file` - optional parameter for csync file name from home directory (if not set `~/.csync` will be taken) 

Usecase of `csync` command:
* `$ csync` - syncs all the entries from `~/.csync` file (ignoring the groups)
* `$ csync group` - syncs only entries assigned to the `group` (will also sync not assigned entries)
* `$ csync group csync-remote` - syncs only entries assigned to the `group` (will also sync not assigned entries) from `~/.csync-remote` file
