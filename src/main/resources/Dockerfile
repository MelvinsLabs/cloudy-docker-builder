# Base Image is Debian SID with CURL
FROM buildpack-deps:sid-curl

# Install ps Utilities
RUN apt-get update \
    && apt-get install procps -y

WORKDIR /opt/

# Install Oracle Java Runtime Environment (JRE)
RUN curl -fSL -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jre-8u101-linux-x64.tar.gz -o java.tar.gz \
    && tar -xvzf java.tar.gz \
    && rm -rf java.tar.gz

ENV JAVA_HOME=/opt/jre1.8.0_101
ENV PATH=$JAVA_HOME/bin:$PATH

# Make Directory for WS App
RUN mkdir app

WORKDIR /opt/app

# Copy WS JAR
COPY ${docker.service.name}.jar /opt/app/${docker.service.name}.jar

# Expose Ports
# 8181 : WS Endpoint
EXPOSE 8181

# Copy Starter Script
COPY starter.sh /opt/app/starter.sh

RUN chmod 777 /opt/app/starter.sh

CMD ["/opt/app/starter.sh"]
