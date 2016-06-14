# cas_mysql
cas with mysql backend


## Howto run it:
docker run -d -p 8080:8080 casmysql

## Configuration:

### Default user and password

cas.properties:
accept.authn.users=casuser::Mellon

### Database Authentication

Official docs: JDBC
https://apereo.github.io/cas/4.2.x/installation/Database-Authentication.html

Extra config: Password Encoding
https://github.com/apereo/cas/blob/4.2.x/cas-server-documentation/installation/Configuring-Authentication-Components.md



Extra Notes:
1. add: cas-server-support-jdbc-4.2.2.jar and mysql-connector (check mavenrepository)
    into /usr/local/tomcat/webapps/cas/WEB-INF/lib 
2. add: Password Encoding
    MD5 database field can be MD5(sha256) or plain text. These must be set in the deployerConfigContext.xml.
3. put: webflow and tgc encryption/signing keys into cas.properties.
    Otherwise will always report errors for "Unable to correctly extract the Initialization Vector or ciphertext".
4. Database username field: NOT case sensitive, MUST be unique.
5. Debug logging: 
   https://apereo.github.io/cas/4.2.x/installation/Logging.html

## Yet Another Building Way: cas-overlay
* cas-overlay-template
    https://github.com/crossz/cas-overlay-template
* docker using cas-overlay-template
    https://github.com/apereo/cas/tree/dockerized-caswebapp

### Notes:

1. build and run: mvn clean package jetty:run-forked
2. customized config in: 
    a) src/main/webapp/WEB-INF/ (for beans and property files location etc.)
    b) pom.xml ( for adding other jars: mysql-connector; cas-server-support-jdbc)

    this is the way of "mvn package", which will override these xml/proerties files in the war (cas-server-webapp is declared in the pom.xml); 

    So we just change the "src/main/webapp/WEB-INF/deployerConfigContext.xml" , then mvn clean package to create a new war and corresponding webapp.

3. copy own "etc" directory into /etc/cas, /etc/cas/jetty
