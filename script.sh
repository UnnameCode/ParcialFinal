echo "configurando firewall"

sudo service firewalld start

firewall-cmd --zone=public --add-interface=eth0

firewall-cmd --zone=internal --add-interface=eth1

firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o eth0 -j MASQUERADE

firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eth1 -o eth0 -j ACCEPT

firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT

firewall-cmd --zone="internal" --add-forward-port=port=80:proto=tcp:toport=8080:toaddr=192.168.50.2

firewall-cmd --zone="internal" --add-forward-port=port=443:proto=tcp:toport=443:toaddr=192.168.50.2

firewall-cmd --zone=internal --add-masquerade

