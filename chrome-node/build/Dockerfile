FROM zenika/alpine-node:9
RUN apk update

# Set timezone
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN apk del tzdata

# Install packages
RUN apk add curl nano
RUN apk add openjdk8-jre

# Install chrome
RUN apk add chromium>68.0.3440.75-r0 chromium-chromedriver>68.0.3440.75-r0

# Removing old dependencies
RUN apk del make gcc g++ python git

# Update & Cleanup
RUN apk upgrade --available --update-cache
RUN rm -rf /var/lib/apt/lists/* \
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

