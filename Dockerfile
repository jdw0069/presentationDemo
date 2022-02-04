FROM ubuntu:20.04

#install terraform
RUN apt-get update && apt-get install -y 
RUN  apt-get install -y gnupg software-properties-common \
curl wget
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform

#install opa
RUN wget https://github.com/open-policy-agent/conftest/releases/download/v0.25.0/conftest_0.25.0_Linux_x86_64.tar.gz
RUN tar xzf conftest_0.25.0_Linux_x86_64.tar.gz
RUN mv conftest /usr/local/bin
RUN rm -rf conftest* && rm -rf README* ## rm -rf LICENSE 


#copy folder to docker
<<<<<<< HEAD
COPY /opa-demo / 
=======
COPY /opa-demo . 

WORKDIR .
>>>>>>> 24639fd49883ead451e702e372e4453ed1b47737






