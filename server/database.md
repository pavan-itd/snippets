## Use this if service showing green status but not connecting.
```
> pg_lsclusters

Ver Cluster Port Status Owner    Data directory              Log file

10  main    5432 down   postgres /var/lib/postgresql/10/main
/var/log/postgresql/postgresql-10-main.log
```

### SOLUTION
```
> sudo chmod 700 -R /var/lib/postgresql/10/main

> sudo -i -u postgres

> postgres@abc:~$ /usr/lib/postgresql/10/bin/pg_ctl restart -D /var/lib/postgresql/10/main

> pg_lsclusters
```

![image](https://github.com/pavan-itd/snippets/assets/56384736/57e26ac2-688a-4e62-afd6-b1a81306b68f)
