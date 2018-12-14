# csync
Small bash script which help backing things up

`csync` will backup every directory placed under `~/.csync`. This file has to be in the following format:

`source-directory;destination-directory[;group]`

Example:
```
/srcdir1/subdir;/desdir1/subdir;group1
/srcdir2/subdir/subsubdir;user@192.168.1.2:/destdir2/mydir;group2
/srcdir3;user@192.168.1.3:/destdir1
```

Usecase of `csync` command:
* `$ csync` - syncs all the entries (ignoring the groups)
* `$ csync group` - syncs only entries assigned to the `group` (will also sync not assigned entries) 
