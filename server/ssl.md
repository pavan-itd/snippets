# INSTALLATION

### STEP 1 : Installing Certbot
```bash
// Add repository
sudo add-apt-repository ppa:certbot/certbot

// Install the package
sudo apt install python-certbot-nginx
```

### STEP 2 : Confirming Nginx’s Configuration
```bash
// Open the server block file for your domain using nano
sudo nano /etc/nginx/sites-available/example.com

//Find the existing server_name line. It should look like this:
...
server_name example.com www.example.com;
...

// Test the config file for typos or syntax
sudo nginx -t

// Reload Nginx config with latest changes
sudo systemctl reload nginx
```

### STEP 3 : Allowing HTTPS Through the Firewall
```bash
// Check the firewall status
sudo ufw status
...
Output
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere                  
Nginx HTTP                 ALLOW       Anywhere                  
OpenSSH (v6)               ALLOW       Anywhere (v6)             
Nginx HTTP (v6)            ALLOW       Anywhere (v6)
...

// If firewall is disabled then enable it with below commands.

// Disable HTTP connections
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'

...
Output
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
Nginx Full                 ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
Nginx Full (v6)            ALLOW       Anywhere (v6)
...

// Enable the SSH connections
sudo ufw allow ssh
```

### STEP 4 : Obtaining an SSL Certificate
```bash
sudo certbot --nginx -d example.com -d www.example.com
```

### STEP 5 : Verifying Certbot Auto-Renewal
```bash
sudo certbot renew --dry-run

```

### APACHE2
https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04


# RENEWAL
### Check the status of certificate
```bash
sudo certbot certificates
```

# INSTALL DOWNLOADED SSL CERTIFICATES
- Copy the certificate file to location.
```
sudo cp <cert file> /usr/local/share/ca-certificates/
```
- Update the certificate in system
```
sudo update-ca-certificates
```
