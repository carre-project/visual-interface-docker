CARRE/visual-interface
==================

docker image for tomcat7 (with OpenJDK JRE)
based off of stackbrew/debian:jessie


To pull this image:
`docker pull carre/visual-interface`

Example usage:
`docker run -p 8080:8080 -d carre/visual-interface -v /home/$USER/webapps`

To deploy a specific .war file to ROOT, see the commented out section of the `Dockerfile`.

The following environment variables can be passed to the docker image:

`ADMIN_USER` (default: admin)

`ADMIN_PASS` (default: tomcat)

`MAX_UPLOAD_SIZE` (default: 52428800)

`CATALINA_OPTS` (default: "-Xms128m -Xmx1024m -XX:PermSize=128m -XX:MaxPermSize=256m")

If you would like to start tomcat without any applications deployed and have a local volume mounted to be be able to deploy a .war file by dropping it in, here is an example of that process:
```
mkdir -p /data/tomcat_webapps
docker run -i -t -p 8080:8080 -v /data/tomcat_webapps:/opt/tomcat/webapps mbentley/tomcat7
cp helloworld.war /data/tomcat_webapps/ROOT.war
```