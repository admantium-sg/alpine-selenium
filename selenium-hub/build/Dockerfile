FROM gliderlabs/alpine:3.6

# Set timezone 
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    apk del tzdata

#Install packages & cleanup
RUN apk add --update curl \
      openjdk8 && \
    rm -rf /var/lib/apt/lists/* \
      /var/cache/apk/* \
      /usr/share/man \
      /tmp/*

# Copy files
WORKDIR /etc/selenium-hub/
RUN mkdir bin
RUN mkdir lib
RUN mkdir conf
COPY hub.conf.json conf/

# Use 'dumb-init' to start the container
RUN curl -Lo ./bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64
RUN chmod +x ./bin/dumb-init 

# Download Selenium
RUN curl -Lo ./lib/selenium.jar https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
RUN chmod +x ./lib/selenium.jar

# Copy start script and set description
COPY ./start.sh ./bin/start.sh
RUN chmod +x ./bin/start.sh

ENTRYPOINT ["/etc/selenium-hub/bin/dumb-init"]
CMD ["/etc/selenium-hub/bin/start.sh"]