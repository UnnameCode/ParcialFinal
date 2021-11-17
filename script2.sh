echo "configurando estreama"

sudo systemctl start streama

systemctl enable streama

echo "configurando firewall"

sudo route del -net 0.0.0.0 gw 10.0.2.2 netmask 0.0.0.0 dev eth0



