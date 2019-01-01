# alpine-selenium
Minimal Selenium Dockerimages based on Alpine Linux. Containers are published on (Dockerhub)[ https://hub.docker.com/u/devcona] 

# images

* _selenium-hub_ Container with a Selenium Hub server.
   * Run with ``docker run -e HUB_PORT=4442 devcona/alpine-selenium-hub``     
* _chrome-node_ Container with the Chrome browser, needs a hub to register to.
   * Needs the selenium-hub to run
   * Run with ``docker run -e HUB_HOST=172.17.0.2 -e HUB_PORT=4442 devcona/alpine-selenium-chrome-node``, and pass the selenium hub IP address 

# what is Selenium?

(Selenium)[https://www.seleniumhq.org/] is a web testing framework in which you write tests that simulate user behavior, for example to browse a page, to click a link, open a popup, filling out a form etc. Selenium provides a the (WebDriver protocol)[https://www.seleniumhq.org/docs/03_webdriver.jsp] with which you can write the tests. Libraries for Java, JavaScript, Python, Ruby and other programming languages exist.

Selenium can be run as a standalone server, or you can create a (Selenium Grid)[https://www.seleniumhq.org/docs/07_selenium_grid.jsp#selenium-grid-2-0]. In a grid, one machine takes the role of a _hub_, a central server to which you execute the tests and with which you register _nodes_. Nodes are machines that  that run multiple instances of a browser and actually execute the tests. 

# what is Alpine?

(Alpine)[https://alpinelinux.org/] is a minimal Linux application that only uses 5MB of disk space in its base form. Its based in busybox und musl libc to reduce dependencies to a minimum and provides a resource-effective runtime environment.