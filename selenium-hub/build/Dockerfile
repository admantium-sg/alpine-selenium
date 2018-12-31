FROM gliderlabs/alpine:3.6

# Set timezone 
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    apk del tzdata

# Install packages & cleanup
RUN apk add --update curl \
      openjdk8 && \
    rm -rf /var/lib/apt/lists/* \
      /var/cache/apk/* \
      /usr/share/man \
      /tmp/*

# Copy files
WORKDIR /etc/selenium-hub/

# Download 'init' and 'selenium.jar'
RUN curl -L https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 --create-dirs -o bin/init && \
    curl -L https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar --create-dirs -o lib/selenium.jar

# Copy start script and set description
COPY start.sh bin/
COPY hub.conf.json conf/
RUN chmod +x bin/*

# Set entrypoint and start command
ENTRYPOINT ["/etc/selenium-hub/bin/init"]
CMD ["/etc/selenium-hub/bin/start.sh"]