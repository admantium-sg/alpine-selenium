FROM zenika/alpine-node:9

# Set timezone 
RUN apk add --update tzdata && \
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    apk del tzdata

# Install packages & cleanup
RUN apk add --update curl \
      'chromium=68.0.3440.75-r0' \
      'chromium-chromedriver=68.0.3440.75-r0' \
      openjdk8 && \
    apk del make gcc g++ python git && \
    rm -rf /var/lib/apt/lists/* \
      /var/cache/apk/* \
      /usr/share/man \
      /tmp/*

# Set workdir
WORKDIR /etc/chrome-node/

# Download 'init' and 'selenium.jar'
RUN curl -L https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 --create-dirs -o bin/init && \
    curl -L https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar --create-dirs -o lib/selenium.jar

# Copy start script and set description
COPY start.sh bin/
COPY node.conf.json conf/
RUN chmod +x bin/*

# Start the node
ENTRYPOINT ["/etc/chrome-node/bin/init"]
CMD ["/etc/chrome-node/bin/start.sh"]