# Dockerized Unifi Controller

Run [Unifi Controller v4](https://www.ubnt.com/enterprise/software/) in a Docker container.

*Features:*

* Minimal-ish dependencies (Ubuntu Trusty).
* Up to date install repo.
* Supports current latest Unifi controller version. ([v4.8.12](http://community.ubnt.com/t5/UniFi-Updates-Blog/UniFi-4-8-12-is-released/ba-p/1468911) at time of writing).
* Includes MongoDB.
* Source: https://github.com/rjocoleman/unifi-docker
* Feedback/Issues: https://github.com/rjocoleman/unifi-docker/issues

## Usage

```
mkdir ~/unifi-data

docker create \
  --name unifi \
  --restart=always \
  -p 3478:3478 \
  -p 8080:8080 \
  -p 8443:8443 \
  -p 8843:8843 \
  -p 8880:8880 \
  -v ~/unifi-data:/var/lib/unifi \
  rjocoleman/unifi:latest

docker start unifi
```

Adoption via Layer 3: https://help.ubnt.com/hc/en-us/articles/204909754-UniFi-Layer-3-methods-for-UAP-adoption-and-management

## Alternatives:

https://github.com/rednut/docker-unifi-controller
https://github.com/jasonrm/docker-unifi
https://github.com/pducharme/UniFi
