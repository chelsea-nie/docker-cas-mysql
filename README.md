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
