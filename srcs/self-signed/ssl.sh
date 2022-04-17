#!/bin/sh

#############################################################################################################################################################
#																																							#
# To set up an HTTPS server, in your "/etc/nginx/site-available/default" file:																				#
#																																							#
#		Include the SSL parameter to the listen directive in the server block,																				#
#		Then specify the locations of the server certificate and private key files																			#
#																																							#
#		- The server certificate is a public entity:																										#
#			It is sent to every client that connects to the NGINX or NGINX PLUS server.																		#
#		- The private key:																																	#
#			Is a secure entity and should be stored in a file with restricted access.																		#
#																																							#
#	==> However, the NGINX master process must be able to read this file																					#
#	==> Alternatively, the private key can be stored in the same file as the certificate.																	#
#																																							#
# Note that although the certificate and the key are stored in one file in this case, only the certificate is sent to clients.								#
#																																							#
#	 How to generate server certificate and private key:																									#
#																																							#
#		$ apt-get install -y openssl																														#
#																																							#
#		$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem		#
#																																							#
#############################################################################################################################################################

apt-get install -y openssl

mv nginx-selfsigned.crt /etc/ssl/certs/ssl-cert-snakeoil.pem

mv nginx-selfsigned.key /etc/ssl/private/ssl-cert-snakeoil.key



#######################################################################

# For autoindex :

# You will also need to make sure your server is running with an autoindex that must be able to be disabled.

# By default, Nginx tries to display a directory listing when a particular URL path ends with a /.

# location / {
#	autoindex on;
# }

# To test it use this:

#	$ mv /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian

## Overview:

# https://www.keycdn.com/support/nginx-directory-index
