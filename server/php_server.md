### Automate the process of deployment in php

* Create a file ***pull.php*** into the root directory of your project on the server and paste be below content into it.

* ***Don't forget to change the github username and password at the last line of below code***

```php
<?php 
function execPrint($command) {
    $result = array();
    exec($command, $result);
    foreach ($result as $line) {
        print($line . "\n");
    }
}

// Replace the username and password with yours
print("<pre>" . execPrint("git pull http://username:password@github.com/ashish27aghera/quick_india.git master") . "</pre>");
```

* Assign the permissions by running below command.

```bash
# Run this commnad inside /var/www/html
$ sudo chown www-data:www-data -R <project-directory>/
```


