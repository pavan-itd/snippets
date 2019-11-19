## Linux commands

* Delete history by line
```bash
$ history -d <line-number>
```

* Get the size of directory
```bash
$ du -sh <flie-location>
```

* Get disk space of server
```bash
df -h
```

* Redis commands
```bash
# Start server
$ sudo systemctl start redis-server

# Stop server
$ sudo systemctl stop redis-server

# Restart server
$ sudo systemctl restart redis-server

# Check status of server
$ sudo systemctl status redis-server

# Check redis log
$ sudo tail /var/log/redis/redis-server.log
```

* Nginx commands
```bash
# Start server
$ sudo service nginx start

# Stop server
$ sudo service nginx stop

# Restart server
$ sudo service nginx restart

# Reload server
$ sudo service nginx reload

# Check status of server
$ sudo service nginx status
```
