### Automate the process of deployment in php

* Create a file pull.php into the root directory of project
* Assign the permissions by running below command

```bash
# Run this commnad inside /var/www/html
$ sudo chown www-data:www-data -R my-repo/
```

```php
<?php 
function execPrint($command) {
    $result = array();
    exec($command, $result);
    foreach ($result as $line) {
        print($line . "\n");
    }
}
// Print the exec output inside of a pre element
print("<pre>" . execPrint("git pull http://username:password@github.com/ashish27aghera/quick_india.git master") . "</pre>");
```
