# The container OS must be debian buster :
FROM debian:buster

EXPOSE 80
EXPOSE 443

# COPY srcs/ /
COPY srcs/*  /

ENV DEBIAN_FRONTEND noninteractive

# RUN: RUN COMMAND run the commands while building the image :
#		$ docker build --no-cache -t new_image .

# You must set up a web server with Nginx :
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx

RUN mv default /etc/nginx/sites-available/default

# Your server should be able to use the SSL (Secure Sockets Layer) protocol:
RUN chmod +x ssl.sh && \
	./ssl.sh

# You will also need to make sure your server is running with an autoindex that must be able to be disabled:

# Your web server must be able to run several services at the same time. Wordpress phpMyadmin MySQL.

# FIRST MySQL :
RUN chmod +x mysql.sh  && \
	 ./mysql.sh

# SECOND phpMyAdmin :
RUN chmod +x phpmyadmin.sh && \
	./phpmyadmin.sh

# THIRD Wordpress :
RUN chmod +x wordpress.sh && \
	./wordpress.sh


# start nginx service and keep it while the container is running 
#CMD ["nginx", "-g", "daemon off;"]
CMD ["bash", "./script.sh"]

#		$ docker run -p 80:80 -p 443:443 -d new_image
# run this command to run the container and  
# the options "-d" : "detache mode" to detache the cursor from the terminal, while keepping the container running in the background.

