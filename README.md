# csync
Small bash script which help backing things up

`csync` will backup every directory placed under `~/.csync`. This file has to be in the following format:

```
/srcdir1/subdir;/desdir1/subdir
/srcdir2/subdir/subsubdir;user@192.168.1.2:/destdir2/mydir
```
