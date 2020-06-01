## Increase the swap memory
```bash
# Check the available swap memory
$ swapon --show
$ free -h
$ ls -lh /swapfile
$ sudo swapon -s

# OFF the current swap file
$ sudo swapoff /swapfile

# Make sure swapfile is OFF
$ ls -lh /swapfile

# Allocate the swap memory
$ sudo fallocate -l 8G /swapfile
$ sudo mkswap /swapfile
$ sudo swapon /swapfile

# Check new swapfile is used by system
$ swapon --show
