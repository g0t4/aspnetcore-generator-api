Make sure to change IP addresses to work in your environment, notably the 192.168. prefix. This setup is currently devised to work on my 192.168.0 network with VMs starting with 201+. And the `my-registry` is mapped to 192.168.0.199.
- [Vagrantfile] - update both network configs: `node.vm.network "public_network", ip: "192.168.0.20#{number}", bridge: "en0: Ethernet"`
- [provision/node.sh] - look for `my-registry` and update accordingly

## Validate things work

```bash
# From Host:
vagrant up m1 w1 w3 # pick which VMs to start up, start with just m1 if you want to test your configuration.

export DOCKER_HOST=192.168.0.201 # replace whatever IP you allocated for m1 here
# powershell use: $env:DOCKER_HOST=X instead of export DOCKER_HOST=X
docker version # should print out server version information if docker is successfully running in the VM

vagrant ssh m1 # ssh into m1 
# From m1:
ping my-registry # test connectivity to custom registry, if wrong, update [provision/node.sh] to fix `/etc/hosts` entry for `my-registry`
curl http://my-registry:55000/v2/_catalog # ensure registry is operational
exit # go back to Host

# If m1 (master) works then workers should too, only difference might be the ip address in the [Vagrantfile]
```

## Init swarm

```bash
# From Host:
export DOCKER_HOST=192.168.0.201
docker swarm init --advertise-addr 192.168.0.201
# m1 is now the master of a single node swarm
# copy the join command in the output for joining a worker and use it to join w1,w2...

export DOCKER_HOST=192.168.0.211 # w1
docker swarm join ... # execute join command on w1

# repeat for w2...

export DOCKER_HOST=192.168.0.201 # go back to m1 when done adding workers, you'll spend most of your time sending in commands to the manager node after the swarm is setup.
docker node ls # list all nodes

```

## Cleanup

```bash
vagrant destory # will confirm destruction of all VMs
vagrant destory m1 # destroy only one VM
```