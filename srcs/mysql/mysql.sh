#!/bin/bash

#############################################################################################################

#	service --status-all
#
##	==> To do this : "dpkg -i mysql-apt-config_0.8.13-1_all.deb", u need to install some dependencies.
#
#	apt-get install -y lsb-release
#	apt-get install -y wget
#	apt-get install -y gnupg
#	dpkg -i mysql-apt-config_0.8.13-1_all.deb   // NOW IT WORKS
#	apt-get update
#	apt-get install mysql-server
#
#	service --status-all
#
##	==> If this error show up, while you wanna access to mysql shell:
##			"ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)"
##	==> That's mean that u have forget to start mysql using this command : "service mysql nginx"
#
#	 service mysql start
#
##	===> To do this "debconf-get-selections | grep mysql", you need this "apt-get install -y debconf-utils".
#
#	apt-get install -y debconf-utils
#	debconf-get-selections | grep mysql

################################################################################################################

apt-get install -y wget

apt-get install -y gnupg

apt-get install -y lsb-release

apt-get install -y debconf-utils

# $ export DEBIAN_FRONTEND=noninteractive

# $ debconf-set-selections <<< "mysql-community-server	mysql-community-server/re-root-pass	password"
# $ debconf-set-selections <<< "mysql-community-server	mysql-community-server/root-pass	password"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-url	string	http://repo.mysql.com/apt"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-preview	select	Disabled"
# $ debconf-set-selections <<< "mysql-community-server	mysql-community-server/data-dir	note"

# Choices: mysql-5.7, mysql-8.0, mysql-cluster-7.5, mysql-cluster-7.6, mysql-cluster-8.0, None
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-server	select	mysql-5.7"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-tools	select	Enabled"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/unsupported-platform	select	abort"

# Choices: MySQL Server & Cluster (Currently selected: mysql-5.7), MySQL Tools & Connectors (Currently selected: Enabled), MySQL Preview Packages (Currently selected: Disabled), Ok
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-product	select	Ok"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/preview-component	string"
# $ debconf-set-selections <<< "mysql-community-server	mysql-community-server/remove-data-dir	boolean	false"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-codename	select	buster"
# $ debconf-set-selections <<< "mysql-community-server	mysql-community-server/root-pass-mismatch	error"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/tools-component	string	mysql-tools"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/dmr-warning	note"
# $ debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-distro	select	debian"
	

# You can run a script, with some modification:

# $ ENV DEBIAN_FRONTEND noninteractive 
# $ export DEBIAN_FRONTEND="noninteractive mode"

chmod +x debconf_mysql.sh

./debconf_mysql.sh

#   Add the MySQL APT repository to your system's software repository list.
#			$ wget http://repo.mysql.com/mysql-apt-config_0.8.13-1_all.deb
#	The file will download, and you'll see progress in realtime as it does.

# $ apt-get install -y curl
# $ curl https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb > mysql-apt-config_0.8.13-1_all.deb

		#  OR  #

# $ apt-get install -y wget
wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb

# dpkg is used to install, remove, and inspect .deb software packages.
# The -i flag indicates that we’d like to install from the specified file.

dpkg -i mysql-apt-config_0.8.13-1_all.deb

apt-get update

apt-get install -y mysql-server

