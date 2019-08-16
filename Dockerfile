FROM jenkinsci/jnlp-slave:alpine

# Do all installations as root
USER root
RUN su - root

# Update packages
RUN apk update && apk upgrade

# Install python
RUN apk add \
python3 \
py-pip \
&& pip3 install --upgrade pip \
&& ln -sf /usr/bin/python3 /usr/bin/python \
&& ln -sf /usr/bin/pip3 /usr/bin/pip

# Install docker
RUN apk add docker

# Install tools
RUN apk add \
curl \
wget

# Install kubectl
RUN kubectl_version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) \
&& curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl \
&& chmod +x ./kubectl \
&& mv ./kubectl /usr/local/bin/kubectl

# Install awscli
RUN pip install awscli --upgrade

# Switch back to jenkins
RUN su - jenkins
USER jenkins
