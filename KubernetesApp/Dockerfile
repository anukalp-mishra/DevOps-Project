# Use the CentOS latest image as the base
FROM centos:latest

# Maintainer information
#MAINTAINER anukalp.info@gmail.com

# Fix the CentOS repository configuration to use vault.centos.org
RUN cd /etc/yum.repos.d/ && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Install required packages
RUN yum -y install java httpd zip unzip

# Copy spering.zip to the image
COPY spering.zip /spering.zip

# Unzip spering.zip and copy contents
RUN unzip -q spering.zip -d spering-html && \
    cp -rvf spering-html/* . && \
    rm -rf spering-html spering.zip

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80