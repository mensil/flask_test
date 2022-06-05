FROM jenkins/jenkins:lts


RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce


#Atualização do username e password
ENV JENKINS_USER admin
ENV JENKINS_PASS ThisIs@StrongP@ssword


RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''



COPY default-user.groovy /

VOLUME /var/jenkins_home