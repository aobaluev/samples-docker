# 00.Install_init

## Install Docker 

OS: Debian / Ubuntu 

https://docs.docker.com/engine/install/debian/
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

## Init

https://docs.docker.com/engine/install/linux-postinstall/

```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
```

Start on boot with systemd

```
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

## Check version

```
docker --version
Docker version 28.2.2, build e6534b4

docker compose version
Docker Compose version v2.36.2
```

## Run Hello world

```
docker run hello-world
```
Expected
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

...

```
