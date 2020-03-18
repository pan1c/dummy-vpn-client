#!/bin/bash
echo '
pty "pptp '${SERVER}' --nolaunchpppd"
user "'${USER}'"
password "'${PASSWORD}'"
nodeflate
nobsdcomp
noauth
nodefaultroute
persist
maxfail 10
holdoff 15
' > /etc/ppp/peers/vpn
pppd call vpn
sleep 5
[[ -z $GWIP ]] && GWIP=`ip  a s ppp0| grep -oE "peer \b([0-9]{1,3}\.){3}[0-9]{1,3}\b"| cut -d " " -f 2`
ip a s
[[ -z $GWIP ]] && exit
ip r add $DUMMYIP via $GWIP
ip r show
while true; do
    curl -k -X GET https://$DUMMYIP/ >> /dev/null
    sleep $((RANDOM % 30))
    ping -c $((RANDOM % 5)) $DUMMYIP
    sleep $((RANDOM % 30))
done;
