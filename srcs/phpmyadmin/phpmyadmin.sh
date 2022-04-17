#!/bin/bash

###############################################################################################
#
# Current phpmyadmin(version 5.0.4) compatible with PHP 7.1 and newer and MySQL 5.5 and newer.
# To install phpMyAdmin, your system must have a database instance running and Nginx web server.
#
###############################################################################################

# While many users need the functuinality of a database management system like MySQL and mariaDB.
# phpMyAdmin was created so that users can interact with MariaDB or MySQL through a web interface.
# phpMyAdmin helps the system administrator to perform databases activities such as creating, deleting, querying, database, tables, columns, etc.

# Let us learn how to install phpMyAdmin with Nginx on Debian 10 buster.
	
# Prerequisites: Install MySQL Server. Standalone Database. LEMP Stack.
# Install php.
# Install phpMyadmin.
# Configure phpMyAdmin.
# Create DB & User.
# Access phpMyAdmin.
# Conclusion.

  # STEP 1 - Installing PHP and Recommended Packages:

#  phpMyAdmin is used to administor Mysql and MariaDB over the web.

# If you haven't already PHP version, its time that you install and configure PHP 7.3 and any required extensions.
# This article will walk you through the process of setting up PHP 7.3 on your Ubuntu Nginx server,
# as well as installing the required and recommended PHP Extensions for WordPress website.
# https://adamlangley.com.au/install-php-7-3-required-php-extensions-for-wordpress-on-ubuntu-nginx/

# Before you begin, make sure:
	# You have sudo or root access.
	# Your server runs Nginx.


##	   ==> Install php 7.3 to your system, install php-7.3 and php7.3-fpm :

#  $ apt install php7.3 php7.3-fpm -y

# Install PHP extensions for phpMyAdmin to connect with database :

#  $ apt install php-json php-mbstring -y

# To ensure that you have all of the required & recommended extensions for running Wordpress websites, run the following:

#  $ apt install php7.3-common php7.3-mysql php7.3-curl php7.3-xml php7.3-zip php7.3-gd php7.3-soap php7.3-ssh2 php7.3-tokenizer -y

#	WordPress have a list of the required and recommended PHP extensions for running WordPress optimal in the Wordpress Server Environment Documentation.


##     ==> Configure PHP 7.3 in your Nginx Configuration:

#   Next, you will need to update your sites Nginx configuration to accomodate the recently installed PHP 7.3.
#   Then you will need to edit the default configuration at "/etc/nginx/sites-available/default":

	# Add index.php to the list if you are using PHP
#	index index.php index.html index.htm index.nginx-debian.html;

	# In the same file decomment the nginx confi file with dollar($) signe: 

#	$ location ~ \.php$ {
#	$	include snippets/fastcgi-php.conf;
	#
   
	#	# With php-fpm (or other unix sockets):
#	$	fastcgi_pass unix:/run/php/php7.3-fpm.sock;
	#	# With php-cgi (or other tcp sockets):
	#	fastcgi_pass 127.0.0.1:9000;
#	$}

#	To test if the php service work : 
# 		 - Create a file index.php in the root '/var/www/html';
#		 - run this command on the file to get system information from PHP : 
#	        	<?php phpinfo(); ?>

#	If you forget to start the php7.3-fpm service, 
#	when trying to access to http://localhost/index.php its gonna download the file index.php 
#	and stil showing the nginx page.

##	   ==>	$ service php7.3-fpm start

##	   ==>  $ service nginx start

# Now it works.

apt install php7.3 php7.3-fpm -y

apt install php-json php-mbstring -y

apt install php7.3-common php7.3-mysql php7.3-curl php7.3-xml php7.3-zip php7.3-gd php7.3-soap php7.3-ssh2 php7.3-tokenizer -y


   # STEP 2 - Installing phpMyAdmin

#     ==> Install phpMyAdmin

# The phpMyAdmin is not available as Deb package in Debian OS repository for Debian 10.
#  So, we will download it from the official website.

	# https://www.phpmyadmin.net/:

#   $ wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip

# 	$ apt-get install -y unzip

#   $ unzip phpMyAdmin-5.0.4-all-languages.zip

	#  If you try to login now to : https://localhost/phpmyadmin 
	#		" 404 Not Found "

#  Before trying to access through the browser, 
#  give the repository "phpMyAdmin-5.0.4-all-languages" new name. 

# Move the repository of phpMyAdmin to the location on default file:
#	          " root /var/www/html"

#    $ mv phpMyAdmin-5.0.4-all-languages /var/www/html/newphp

# No need to restart the nginx serive again,
# But if you didn't start the nginx service yet, it's time to do it:

#	 $ service php7.3-fpm start
#	 $ service nginx start

#  Now should work, if you try to login to : https://localhost/newphp
# THE INTERFACE OF PHPMYADMIN show up finally.
#  :)
#  We can rename the repository of phpmyadmin by whatever name, but it would be better if:
#  We gonna use "phpmyadmin" unstead of "newphp" ;)

wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip

apt-get install -y unzip

unzip phpMyAdmin-5.0.4-all-languages.zip

mv phpMyAdmin-5.0.4-all-languages /var/www/html/phpmyadmin


	# STEP 3 - Configure phpMyAdmin.

##############################################################################################
#
# The phpMyAdmin configuration storage is not completely configured, 
#	some extended features have been deactivated. Find out why.
# Or alternately go to 'Operations' tab of any database to set it up there.

#  Configuration of pmadb…  not OK
#  Create a database named 'phpmyadmin' and setup the phpMyAdmin configuration storage there.
#
############################################################################################

#	  ==> Configure phpMyAdmin


# Copy the sample configuration file.

#	 $ cp /var/www/html/phpmyadmin/config.sample.inc.php /var/www/html/newphp/config.inc.php 


# Edit the configuration file:

## --> Uncomment the phpMyAdmin storage settings.

###################################################################
#
# /**
#  * phpMyAdmin configuration storage settings.
# */
#
# /* User used to manipulate with storage */
#  $cfg['Servers'][$i]['controlhost'] = '';
#  $cfg['Servers'][$i]['controlport'] = '';
#  $cfg['Servers'][$i]['controluser'] = 'pma';
#  $cfg['Servers'][$i]['controlpass'] = 'pmapass';
#
# /* Storage database and tables */
#  $cfg['Servers'][$i]['pmadb'] = 'phpmyadmin';
#  $cfg['Servers'][$i]['bookmarktable'] = 'pma__bookmark';
#  $cfg['Servers'][$i]['relation'] = 'pma__relation';
#  $cfg['Servers'][$i]['table_info'] = 'pma__table_info';
#  $cfg['Servers'][$i]['table_coords'] = 'pma__table_coords';
#  $cfg['Servers'][$i]['pdf_pages'] = 'pma__pdf_pages';
#  $cfg['Servers'][$i]['column_info'] = 'pma__column_info';
#  $cfg['Servers'][$i]['history'] = 'pma__history';
#  $cfg['Servers'][$i]['table_uiprefs'] = 'pma__table_uiprefs';
#  $cfg['Servers'][$i]['tracking'] = 'pma__tracking';
#  $cfg['Servers'][$i]['userconfig'] = 'pma__userconfig';
#  $cfg['Servers'][$i]['recent'] = 'pma__recent';
#  $cfg['Servers'][$i]['favorite'] = 'pma__favorite';
#  $cfg['Servers'][$i]['users'] = 'pma__users';
#  $cfg['Servers'][$i]['usergroups'] = 'pma__usergroups';
#  $cfg['Servers'][$i]['navigationhiding'] = 'pma__navigationhiding';
#  $cfg['Servers'][$i]['savedsearches'] = 'pma__savedsearches';
#  $cfg['Servers'][$i]['central_columns'] = 'pma__central_columns';
#  $cfg['Servers'][$i]['designer_settings'] = 'pma__designer_settings';
#  $cfg['Servers'][$i]['export_templates'] = 'pma__export_templates';
#
#####################################################################

## --> Generate a blowfish secret and update the secret in the configuration file.

# The configuration file now needs a secret passphrase (blowfish_secret).

#	 $ pwgen -s 32 1
#		==> SQPmk0D3Q9KpqbkxtIQklOSnZbwoI1kz


## --> phpMyAdmin is not able to cache templates and will be slow because of this.

# The $cfg['TempDir'] (/var/www/html/phpmyadmin/tmp/) is not accessible.

# So add this to you phpmyadmin config file:
	# 	$ cfg['TempDir'] = '/tmp';

#########################################################

# /**
#  * Directories for saving/loading files from server
# */
# $cfg['UploadDir'] = '';
# $cfg['SaveDir'] = '';
# $cfg['TempDir'] = '/tmp';

########################################################

## --> Create a tmp directory for phpMyAdmin where phpMyAdmin will store its temporary files and then change the permission.

#	 $ mkdir /var/www/html/phpmyadmin/tmp
#	 $ chmod 777 /var/www/html/phpmyadmin/tmp

## --> Set the ownership of phpMyAdmin directory.

#	 $ chown -R www-data:www-data /var/www/html/phpmyadmin
#    Set www-data as the owner of this directory

# 	 $ chown -R www-data:www-data /var/www/html/phpmyadmin


mv config.inc.php /var/www/html/phpmyadmin

mkdir /var/www/html/phpmyadmin/tmp

chmod 777 /var/www/html/phpmyadmin/tmp

chown -R www-data:www-data /var/www/html/phpmyadmin



	# STEP 4 - Create DB & USER :

####################################################################################################
#
#  mysqli::real_connect(): (HY000/1045): Access denied for user 'pma'@'localhost' (using password: YES)
#  Connection for controluser as defined in your configuration failed.
#
#################################################################################################

#### Before doing anything on mysql u need to start the service, if is not:
#    $ service mysql start

# --> Import the create_tables.sql to create tables for phpMyAdmin.

#	 $ mysql < /var/www/html/phpmyadmin/sql/create_tables.sql

# --> Add the user and grant permission to phpMyAdmin’s database.

#	 $ mysql -e "CREATE USER 'pma'@'localhost' IDENTIFIED BY 'pmapass';"
#	 $ mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost';"

#				-----   OR  ----

#	 $ mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pmapass';"

# --> To update the new changement, restart mysql:

#	 $ mysql -e "FLUSH PRIVILEGES;"

#
###############################################################################

#	 Your server is running with default values for the controluser and password (controlpass) and is open to intrusion; you really should fix this security weakness by changing the password for controluser 'pma'.

# To solve this a little warning, you shoud change the password of 'pma' user by a new one.

# Instead of "pmapass" use "newpass" for example, :).

#  /* User used to manipulate with storage */
#  $cfg['Servers'][$i]['controlhost'] = '';
#  $cfg['Servers'][$i]['controlport'] = '';
#  $cfg['Servers'][$i]['controluser'] = 'pma';
#  $cfg['Servers'][$i]['controlpass'] = 'pmapass';

#		           &&

#	 $ mysql -e "CREATE USER 'pma'@'localhost' IDENTIFIED BY 'newpass';"
#	 $ mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost';"

#############################################################################

service mysql start

mysql < /var/www/html/phpmyadmin/sql/create_tables.sql

mysql -e "CREATE USER 'pma'@'localhost' IDENTIFIED BY 'newpass';"

mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'localhost';"

mysql -e "FLUSH PRIVILEGES;"



# Conclusion.

# Overview :
#	https://kifarunix.com/install-phpmyadmin-with-nginx-on-debian-10-buster/
#	https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10
#   https://subscription.packtpub.com/book/big_data_and_business_intelligence/9781849517782/1/ch01lvl1sec05/installing-phpmyadmin-configuration-storage
# https://www.howtoforge.com/how-to-install-phpmyadmin-with-nginx-on-ubuntu-1804/
