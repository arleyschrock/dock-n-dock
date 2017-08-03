# docker
apt update

# prerequisites to docker repository registration with apt
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# docker repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu yakkety stable"

apt update
apt install -y docker-ce