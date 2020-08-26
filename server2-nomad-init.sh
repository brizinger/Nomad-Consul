vagrant ssh nomad-server2 -c "

cd /vagrant/nomad &&

cp base_config.hcl config.hcl &&

./setup.sh 192.168.50.12 /vagrant/nomad/config.hcl &&

sudo nomad agent -config /vagrant/nomad/config.hcl -config server.hcl"