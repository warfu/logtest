FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD /root/.m2/repository/com/mysoft/log-test/1.0.0/log-test-1.0.0.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar --server.port=8081"]