vagrant ssh nomad-server3 -c "

cd /vagrant/consul/ &&

cp server.json config.json &&

./setup.sh nomad-server3 $(cat token.txt) 192.168.50.13 192.168.50.11 192.168.50.12 &&

sudo consul agent --config-dir /vagrant/consul/config.json"