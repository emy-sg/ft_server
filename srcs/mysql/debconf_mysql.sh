#!/bin/bash

export DEBIAN_FRONTEND="noninteractive mode"

debconf-set-selections <<< "mysql-community-server	mysql-community-server/re-root-pass	password"
debconf-set-selections <<< "mysql-community-server	mysql-community-server/root-pass	password"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-codename	select	buster"
# Choices: MySQL Server & Cluster (Currently selected: mysql-5.7), MySQL Tools & Connectors (Currently selected: Enabled), MySQL Preview Packages (Currently selected: Disabled), Ok
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-product	select	Ok"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/preview-component	string"
debconf-set-selections <<< "mysql-community-server	mysql-community-server/data-dir	note"
debconf-set-selections <<< "mysql-community-server	mysql-community-server/root-pass-mismatch	error"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/dmr-warning	note"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-tools	select	Enabled"
debconf-set-selections <<< "mysql-community-server	mysql-community-server/remove-data-dir	boolean	false"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-preview	select	Disabled"
# Choices: mysql-5.7, mysql-8.0, mysql-cluster-7.5, mysql-cluster-7.6, mysql-cluster-8.0, None
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/select-server	select	mysql-5.7"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/tools-component	string	mysql-tools"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/unsupported-platform	select	abort"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-distro	select	debian"
debconf-set-selections <<< "mysql-apt-config	mysql-apt-config/repo-url	string	http://repo.mysql.com/apt"

