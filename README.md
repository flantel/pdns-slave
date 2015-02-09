# PowerDNS Superslave Container

Container to run a PowerDNS-based Superslave DNS server.

Built on Debian Wheezy

Simply specify the IP address of the Supermaster, and the DNS name of the Slave:

```
docker run --rm --name pdns-slave -e SUPERMASTER_IP=XXX.XXX.XXX.XXX -e SLAVE_DNSNAME=XXX.XXXXX.XXX -p 53:53/udp  barryflanagan/pdns-slave:latest
```

# CoreOS
File pdns-slave.service is a CoreOS service file. I run this as a Global service so instances run on all of my Frontend servers.

# To Do
* Trigger master to do a notify for all domains when a new slave starts up. Could be done via PDNS Web API
* Auto-deleting of domains when deleted on the master, although simply firing up a new instance and removing the old ones would have the same effect.

# Source Code
Source and Dockerfile available at https://github.com/flantel/pdns-slave 

The Docker image is on Docker Hub at barryflanagan/pdns-slave


