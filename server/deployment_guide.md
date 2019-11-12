##Postgresql Commands

Dump:
$ pg_dump -U <user-name> <database-name> > <file-name>.dump

Restore:
$ psql -U <user-name> -h localhost  -d <database-name> < <file-name>.dump

Restore without user:
$ pg_restore -U <user-name> -h localhost -v --clean --no-owner --no-privileges --dbname <database-name> < <file-name>.dump
------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
* Application deployment steps 18.04
------------------------------------------------------------------------------------------------------------------------
Step1: Create droplet on Digital Ocean

Step2: Create your server
$ ssh root@<server-ip>

Step3: Creating a Deploy user
$ adduser deploy
$ adduser deploy sudo
$ exit

Step4: Copy ssh key to server
$ ssh-copy-id root@<server-ip>
$ ssh-copy-id deploy@<server-ip>
$ ssh deploy@<server-ip>

Step5: Install Ruby
$ sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ curl -sSL https://get.rvm.io | bash -s stable
$ source ~/.rvm/scripts/rvm
$ rvm install 2.4.0
$ rvm use 2.4.0 --default
$ ruby -v
$ gem install bundler

Step6: Configuring A Web Server
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
$ sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'
$ sudo apt-get update
$ sudo apt-get install -y nginx-extras libnginx-mod-http-passenger
$ if [ ! -f /etc/nginx/modules-enabled/50-mod-http-passenger.conf ]; then sudo ln -s /usr/share/nginx/modules-available/mod-http-passenger.load /etc/nginx/modules-enabled/50-mod-http-passenger.conf ; fi
$ sudo ls /etc/nginx/conf.d/mod-http-passenger.conf

- Change the 'passenger_ruby' with Ruby location
$ sudo nano /etc/nginx/conf.d/mod-http-passenger.conf
$ sudo service nginx start

- Remove default file
$ sudo rm /etc/nginx/sites-enabled/default

- Create a new file with your app name
$ sudo touch /etc/nginx/sites-enabled/<file-name>
$ sudo nano /etc/nginx/sites-enabled/<file-name>

- Copy below code and paste it into the previously created file and modify.
server {
  listen 80;
  listen [::]:80;

  server_name _;
  root /home/deploy/myapp/current/public;

  passenger_enabled on;
  passenger_app_env production;

  location /cable {
    passenger_app_group_name myapp_websocket;
    passenger_force_max_concurrent_requests_per_process 0;
  }

  # Allow uploads up to 100MB in size
  client_max_body_size 100m;

  location ~ ^/(assets|packs) {
    expires max;
    gzip_static on;
  }
}

$ sudo service nginx reload

Step7: Creating A Database
$ sudo apt-get install postgresql postgresql-contrib libpq-dev
$ sudo su - postgres
$ createuser --pwprompt deploy
$ createdb -O deploy <database-name>
$ exit

Step8: Make change to deploy/production.rb|deploy.rb|environments/production.rb
- Add the IP address and user-name of server
- Add the SSH key to the Github account where app repository belongs
- Add git repository

- Check the Capistrano script
$ cap production deploy:check

- Create database.yml and secrets.yml file on the server in shared directory

Step9: Deploy the Application
$ cap production deploy
