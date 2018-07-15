# QSP V2
Updated Version of "Quick Start Project" for starting the front-end of a website
project.

### Frameworks
* Animate JS
* Bootstrap v4
* Font Awesome
* Google Fonts
* Jquery 3.2.1
* Popper.js

### Preprocessor
* HAML
* SASS

### Set-Up Guide
##### REQUIREMENTS
**Ruby 2.0+**

```
Installing Ruby 2.4
-------------------
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.4
```
- Gems Required:   
    - **Haml** 
    ```
    sudo gem install haml
    ```
    - **Observr**
    ```
    sudo gem install observr
    ```

    - **Sass**
    ```
    sudo gem install sass --no-user-install'
    ```
    
    - **Watchr**
    ```
    sudo gem install watchr
    ```
### NGINX REWRITE RULES
  
  These are the nginx config rules I use with Vagrant
- **Guide to Install NGINX/PHP/MYSQL on Ubuntu 16.04 & PHPMyAdmin**
```
https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04
https://devanswers.co/installing-phpmyadmin-nginx-ubuntu-16-04-17-04/
https://websiteforstudents.com/setup-nginx-php-7-1-ubuntu-16-04-17-04/
https://www.howtoforge.com/tutorial/perfect-server-ubuntu-with-nginx-and-ispconfig-3/#-install-postfix-dovecot-mariadb-phpmyadmin-rkhunter-binutils
```

```

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /vagrant/html;
    #change to your root folder
    
    index index.php index.html index.htm index.nginx-debian.html;      
  
    server_name server_domain_or_IP;
    #either localhost, or your online server domain
    
    location / {
        rewrite ^/$ /index.php?page=home;
        try_files $uri $uri/ /index.php?page=$uri;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

```

## How to Use
Run ```observr script.rb``` in terminal, when working in sass, or haml. I already have **Sass** running in my code editor, so i only use this command to auto compile haml.

Edit settings.php (to change project), header.haml, footer.haml, and create new pages inside the haml-pages folder for the theme you are creating. Also Sass _library.sass file has Quick CSS MIXINS for faster css coding.

To auto-compile the new pages edit the script.rb file and add your new pages
```
EXAMPLE:
--------  
def compile_haml
### COMPONENTS ###
    %x[haml components/haml/header.haml components/php/header.php]
    %x[haml components/haml/sidebar.haml components/php/sidebar.php]
    %x[haml components/haml/footer.haml components/php/footer.php]

### PAGES ###
    %x[haml pages/haml/home.haml pages/php/home.php]
    #### ADD MORE PAGES ###

end

watch(".*\.haml$") { |x|
  compile_haml
}  
  
```

For Sass you can edit script.rb and add this:
```
def compile_sass

%x[sass FILENAME.sass OUTPUT-FILENAME.css]
### REPEAT LINE ABOVE FOR MORE PAGES TO AUTO-COMPILE ###

end

sass(".*\.sass$") { |x|
  compile_sass
}
```