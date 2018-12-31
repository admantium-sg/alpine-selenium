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
      
# Copy files
WORKDIR /etc/chrome-node/
RUN mkdir bin
RUN mkdir lib
RUN mkdir conf
COPY ./node.conf.json conf/

# Use 'dumb-init' to start the container
RUN curl -Lo ./bin/init https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64
RUN chmod +x ./bin/init 

# Download Selenium
RUN curl -Lo ./lib/selenium.jar https://selenium-release.storage.googleapis.com/3.141/selenium-server-standalone-3.141.59.jar
RUN chmod +x ./lib/selenium.jar

# Copy start script
COPY ./start.sh ./bin/start.sh
RUN chmod +x ./bin/start.sh

# Start the node
ENTRYPOINT ["/etc/chrome-node/bin/init"]
CMD ["/etc/chrome-node/bin/start.sh"]

