# escape=`

# build master
# docker build -t jenkins-windows:2.0 --target master .
# docker build --build-arg BASE_URL=http://10.0.0.0:8080 -t jenkins_windows_agent:2.0 --target agent .

#######################################
# javabase
#######################################
FROM mcr.microsoft.com/windows/servercore:ltsc2019 AS javabase

RUN powershell -Command `
    wget 'http://javadl.oracle.com/webapps/download/AutoDL?BundleId=210185' -Outfile 'C:\jreinstaller.exe' ; `
    Start-Process -filepath C:\jreinstaller.exe -passthru -wait -argumentlist "/s,INSTALLDIR=c:\Java\jre1.8.0_91" ; `
    del C:\jreinstaller.exe

ENV JAVA_HOME c:\\Java\\jre1.8.0_91
RUN setx PATH %PATH%;%JAVA_HOME%\bin

CMD [ "java.exe" ]

#######################################
# master
# docker build -t jenkins-windows:2.0 --target master .
# docker run --rm -it -p 8181:8080 -p 50000:50000 -d jenkins-windows:2.0
# C:\Users\ContainerAdministrator\.jenkins\secrets\initialAdminPassword
#######################################
FROM javabase AS master

ENV JENKINS_HOME /jenkins_home
ENV JENKINS_VERSION 2.0
RUN mkdir \jenkins
RUN mkdir \jenkins_home
RUN powershell -Command "wget -Uri https://updates.jenkins-ci.org/download/war/2.0/jenkins.war -UseBasicParsing -OutFile /jenkins/jenkins.war"

EXPOSE 8080
EXPOSE 50000

CMD java -jar C:\\jenkins\\jenkins.war

#######################################
# agent
# docker build --build-arg BASE_URL=http://192.168.0.101:8080 -t jenkins_windows_agent:2.0 .
#######################################
FROM javabase AS agent

SHELL ["powershell"]
ARG BASE_URL
ARG SECRET

RUN (New-Object System.Net.WebClient).DownloadFile('{0}/jnlpJars/slave.jar' -f $env:BASE_URL, 'slave.jar') ;
ENTRYPOINT ["C:\\Java\\jre1.8.0_91\\bin\\java.exe", "-jar", ".\\slave.jar"]

