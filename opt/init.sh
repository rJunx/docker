#!/usr/bin/env bash

APP_NAME[0]="intellij"
APP_URL[0]="https://download.jetbrains.com/idea/ideaIU-2018.1.5-no-jdk.tar.gz"
APP_DST[0]="/opt/intellij"
APP_PARAM[0]=""
APP_CALL[0]=""

APP_NAME[1]="JDK8"
APP_URL[1]="http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz"
APP_DST[1]="/opt/jdk8"
APP_PARAM[1]="-H \"Cookie: oraclelicense=accept-securebackup-cookie\" -H \"Connection: keep-alive\""
APP_CALL[1]=""

APP_NAME[2]="Tomcat8.5"
APP_URL[2]="http://mirror.intergrid.com.au/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz"
APP_DST[2]="/opt/tomcat-8.5"
APP_PARAM[2]=""
APP_CALL[2]="/bin/cp -rf /opt/tomcat-conf /opt/tomcat-8.5"

for ((i=0;i<${#APP_NAME[@]};i++));do
 echo ["Download:" ${APP_NAME[$i]}]
 echo "URL:" ${APP_URL[$i]}
 echo "Folder:" ${APP_DST[$i]}
 if [ -r ${APP_DST[$i]} ]; then
 	echo ${APP_NAME[$i]} "exist...."
 else
 	sudo mkdir -p ${APP_DST[$i]}
 	sudo curl -L ${APP_URL[$i]} ${APP_PARAM[$i]} -O | tar -xvz --strip-components=1 -C ${APP_DST[$i]}
 	eval $APP_CALL[$i]
 fi
 echo 
done
