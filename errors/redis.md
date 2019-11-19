### 1. Fix of Redis error (Can't save in background: fork: Cannot allocate memory)

Errors from Laravel logs:
```
MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error.

ERR Error running script (call to f_1af8e79ebe56ad4d7910f2e116e2555983099baf): @user_script:8: @user_script: 8: -MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error.
```

Errors from Redis logs (`/var/log/redis/redis-server.log`):
```
* 1 changes in 900 seconds. Saving...
# Can't save in background: fork: Cannot allocate memory
```

Fix:
```
sudo sysctl vm.overcommit_memory=1
```

***

### 2. MISCONF Redis is configured to save RDB snapshots, but is currently not able to persist on disk

```bash
$ redis-cli
> config set stop-writes-on-bgsave-error no
```
