#!/bin/bash

wget https://wordpress.org/latest.zip

unzip latest.zip

mv wordpress /var/www/html/

## Error establishing a database connection

#This either means that the username and password information in your wp-config.php file is incorrect or we can’t contact the database server at localhost. This could mean your host’s database server is down.

#Are you sure you have the correct username and password?
#Are you sure you have typed the correct hostname?
#Are you sure the database server is running?

# Check if the mysql service is already running

#	 $ service mysql start 

#	 $ mysql -e "CREATE USER 'admin_wordpress'@'localhost' IDENTIFIED BY 'pass_wordpress';"

# Don't forget to update the modification on MySQL :

#    $ mysql -e "FLUSH PRIVILEGES;"


service mysql start

mysql -e "CREATE USER 'admin_wordpress'@'localhost' IDENTIFIED BY 'pass_wordpress';"

mysql -e "FLUSH PRIVILEGES;"


##  Can’t select database

# Are you sure it exists?
# Does the user admin_wordpress have permission to use the wordpress database?
# On some systems the name of your database is prefixed with your username, so it would be like username_wordpress. Could that be the problem?

## So, if you access to the phpmyadmin with the username and password, but you're not gonna find any data base, so you should create one:

# --> access to the mysql using your username: -u stands for user and -p stands for passsword

#	 $ mysql -u admin_wordpress -p 

# --> enter the password of this user:

#	 $ pass_wordpress

# --> Then run this command inside the mysql :

#	 $ "CREATE DATABASE wordpress_data;"

#	 $ "GRANT ALL PRIVILEGES ON wordpress_data*. TO 'admin_wordpress_data'@'localhost';"

#	 $ "FLUSH PRIVILEGES;"

#### Buuut, We were able to connect to the database server (which means your username and password is okay) but not able to select the wordpress database.

### So we gonna execute as root:

#mysql -e "CREATE DATABASE wordpress_data;"

#mysql -e "GRANT ALL PRIVILEGES ON wordpress_data.* TO 'admin_wordpress'@'localhost';"

#mysql -e "FLUSH PRIVILEGES;"


mysql < localhost.sql

mysql -e "GRANT ALL PRIVILEGES ON wordpress_data.* TO 'admin_wordpress'@'localhost';"

mysql -e "FLUSH PRIVILEGES;"



## Unable to write to wp-config.php file.

#You can create the wp-config.php file manually and paste the following text into it.

# We’re going to use this information to create a wp-config.php file. If for any reason this automatic file creation doesn’t work, don’t worry. All this does is fill in the database information to a configuration file. You may also simply open wp-config-sample.php in a text editor, fill in your information, and save it as wp-config.php.


mv wp-config.php /var/www/html/wordpress


#Welcome to WordPress. Before getting started, we need some information on the database. You will need to know the following items before proceeding.

# Database name
# Database username
# Database password
# Database host
# Table prefix (if you want to run more than one WordPress in a single database)

## It means it works, congrat ;)


#### OVERVIEW :

# https://www.a2hosting.com/kb/developer-corner/mysql/managing-mysql-databases-and-users-from-the-command-line
#https://linuxize.com/post/how-to-create-mysql-user-accounts-and-grant-privileges/#:~:text=Grant%20Privileges%20to%20a%20MySQL%20User%20Account,-There%20are%20multiple&text=The%20most%20commonly%20used%20privileges,to%20drop%20databases%20and%20tables.

