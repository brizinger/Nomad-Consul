vagrant ssh nomad-server1 -c "

cd /vagrant/consul &&

cp bootstrap.json config.json &&

consul keygen > token.txt &&

./setup.sh nomad-server1 $(cat token.txt) 192.168.50.11 192.168.50.12 192.168.50.13 &&

sudo consul agent --config-dir /vagrant/consul/config.json -ui -client=0.0.0.0"