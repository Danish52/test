FROM jenkins/jenkins:2.319.3-centos7-jdk8

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

#COPY plugins.txt /usr/share/jenkins/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER root
RUN  yum  update  -y
RUN  yum install -y yum-utils device-mapper-persistent-data lvm2
RUN  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install http://mirror.centos.org/centos/7/extras/x86_64/Packages/container-selinux-2.107-3.el7.noarch.rpm -y
RUN   yum install   docker-ce -y
RUN usermod -aG docker jenkins
#RUN  yum  clean
ENV JENKINS_HOME /var/lib/jenkins
WORKDIR /var/lib/jenkins
