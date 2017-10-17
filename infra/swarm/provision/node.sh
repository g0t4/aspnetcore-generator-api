#!/bin/bash

# Install test version of docker engine, also shell completions
curl -fsSL https://get.docker.com/ | sh

# Add the vagrant user to the docker group
usermod -aG docker vagrant

# Configure the docker engine
# Daemon options: https://docs.docker.com/engine/reference/commandline/dockerd/
# Set both unix socket and tcp to make it easy to connect both locally and remote
# You can add TLS for added security (docker-machine does this automagically)
cat > /etc/docker/daemon.json <<END
{
    "hosts": [ 
        "unix://",
        "tcp://0.0.0.0:2375"
    ],
    "experimental": true,
    "debug": true,
    "metrics-addr": "0.0.0.0:9323",
    "insecure-registries" : ["my-registry:55000"]
}
END

# Append my-registry to host file
cat >> /etc/hosts <<END

# Insecure registry for aspnetcore docker course
192.168.0.199 my-registry

END
# You can't pass both CLI args and use the daemon.json for parameters, 
# so I'm using the RPM systemd unit file because it doesn't pass any args 
# This version changes the following as of 17.03:
#  - Removes Requires=docker.socket
#  - Removes docker.socket from After
#  - Sets LimitNOFILE=infinity
#  - Removes -H fd:// from ExecStart 
wget -O /lib/systemd/system/docker.service https://raw.githubusercontent.com/docker/docker/v17.05.0-ce/contrib/init/systemd/docker.service.rpm
systemctl daemon-reload
systemctl restart docker

# optional tools for learning 
apt-get install -y -q ipvsadm tree
# lsns is helpful from util-linux, this is installed already
