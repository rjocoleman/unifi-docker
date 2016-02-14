FROM ubuntu:trusty
ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_VERSION java-1.7.0-openjdk-amd64

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 && \
  echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' > /etc/apt/sources.list.d/ubiquiti.list && \
  \
  apt-key adv --keyserver keyserver.ubuntu.com --recv EA312927 && \
  echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse' > /etc/apt/sources.list.d/mongodb-org-3.2.list && \
  \
  echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d && \
  apt-get update && \
  apt-get install -y unifi && \
  \
  update-java-alternatives -s $JAVA_VERSION

EXPOSE 8080 8443 8843 8880 3478

VOLUME ["/var/lib/unifi"]
WORKDIR /var/lib/unifi

CMD ["/usr/bin/java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
