FROM ubuntu:16.10

# Runs docker on docker. Mostly included here because I needed some customizability of the daemon.json 
# files when doing builds in a hosted build agent running on VSTS

COPY docker-install.sh /docker-install.sh

COPY daemon.json /etc/docker/daemon.json

RUN /docker-install.sh

CMD bash -c /setup-insecure.sh
