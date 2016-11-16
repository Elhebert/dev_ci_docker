FROM debian:jessie
MAINTAINER Dieter Stinglhamber

# Create the jenkins user
RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

# Create the gitlab user
RUN useradd -u 1001 -m -s /bin/bash gitlab

# Create the folders and volume mount points
RUN mkdir -p /var/log/jenkins
RUN mkdir -p /var/log/gitlab
RUN mkdir -p /var/opt/gitlab
RUN mkdir -p /etc/gitlab

RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R gitlab:gitlab /var/log/gitlab
RUN chown -R gitlab:gitlab /var/opt/gitlab
RUN chown -R gitlab:gitlab /etc/gitlab

VOLUME ["/var/log/jenkins", "/var/jenkins_home", "/var/log/gitlab", "/var/opt/gitlab", "/etc/gitlab"]