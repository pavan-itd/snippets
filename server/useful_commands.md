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
## Redis commands
* # Start server
```bash
$ sudo systemctl start redis-server
```
* Stop server
```bash
$ sudo systemctl stop redis-server
```
* Restart server
```bash
$ sudo systemctl restart redis-server
```
* Check status of server
```bash
$ sudo systemctl status redis-server
```
* Check redis log
```bash
$ sudo tail /var/log/redis/redis-server.log
```

## Nginx commands
* Start server
```bash
$ sudo service nginx start
```
* Stop server
```bash
$ sudo service nginx stop
```
* Restart server
```bash
$ sudo service nginx restart
```
* Reload server
```bash
$ sudo service nginx reload
```
* Check status of server
```bash
$ sudo service nginx status
```
## Rails server commands
```
* Clear production log file
```bash
$ bundle exec rake log:clear RAILS_ENV=production
```
* Clear any file contents
```bash
$ truncate -s 0 <file>
```

## GIT
* Reset last pull
```bash
git reset --hard HEAD@{1}
```
