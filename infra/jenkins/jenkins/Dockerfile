FROM windows-java:jre1.8.0_91

ENV HOME /jenkins
ENV JENKINS_VERSION 2.0
RUN mkdir \jenkins
RUN powershell -Command "wget -Uri https://updates.jenkins-ci.org/download/war/2.0/jenkins.war -UseBasicParsing -OutFile /jenkins/jenkins.war"

EXPOSE 8080
EXPOSE 50000

CMD java -jar C:\\jenkins\\jenkins.war