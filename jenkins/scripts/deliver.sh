#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
echo 'volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
#java -jar target/${NAME}-${VERSION}.jar --server.port=8081


echo "删除 Dockerfile"
rm -f ${WORKSPACE}/Dockerfile


echo   "FROM frolvlad/alpine-oraclejdk8:slim" >> ${WORKSPACE}/Dockerfile
echo   "VOLUME /tmp" >> ../Dockerfile
echo   "ADD  $PWD/target/${NAME}-${VERSION}.jar  app.jar"  >> ${WORKSPACE}/Dockerfile
echo   'ENTRYPOINT ["java","-jar","/app.jar"]' >> ${WORKSPACE}/ Dockerfile

echo "生成 Dockerfile"






