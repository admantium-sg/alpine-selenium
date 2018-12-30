# alpine-selenium
Dockerfiles for building ressource-effective images for the [Selenium WebTesting framework](https://www.seleniumhq.org/) based on [Alpine Linux](https://wiki.alpinelinux.org/). 

# images

* _selenium-hub_ Container with a Selenium Hub server.
	* Run with ``docker run -e HUB_PORT=4442 devcona/alpine-selenium-hub``	 	
* _chrome-node_ Container with the Chrome browser, needs a hub to register to.
	* Needs the selenium-hub to run
	* Run with ``docker run -e HUB_HOST=172.17.0.2 -e HUB_PORT=4442 devcona/alpine-selenium-chrome-node``, and pass the selenium hub IP address 