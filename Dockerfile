FROM registry.access.redhat.com/jboss-fuse-6/fis-java-openshift:1.0

ARG HAWT_NAME=simple-jetty-app-1.0-SNAPSHOT-app

USER root
WORKDIR /tmp
COPY bin/* /tmp/
# copy the binary in
COPY hawt-app/$HAWT_NAME.tar.gz /tmp/$HAWT_NAME.tar.gz
RUN chmod +x /tmp/setup.sh
# ungzip the file and set permissions
RUN /tmp/setup.sh

USER 1001
