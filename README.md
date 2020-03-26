# dummy-vpn-client

```
sudo sysctl net.netfilter.nf_conntrack_helper=1
sudo modprobe nf_conntrack_pptp nf_conntrack_proto_gre
```
or
```
pptp_modules.sh
```
Edit docker-compose.yml (example)
```
vpn:
  build: .
  net: bridge
  environment:
    - SERVER=18.8.8.8
    - USER=s.seres
    - PASSWORD=AWFHJAeko
    - DUMMYIP=216.58.215.110
  devices:
    - /dev/ppp
  cap_add:
    - NET_ADMIN
```

```docker-compose build  && docker-compose up -d```


