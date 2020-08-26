vagrant ssh nomad-server2 -c "

cd /vagrant/consul &&

cp server.json config.json &&

./setup.sh nomad-server2 $(cat token.txt) 192.168.50.12 192.168.50.11 192.168.50.13 &&

sudo consul agent --config-dir /vagrant/consul/config.json"