vagrant ssh nomad-server3 -c "

cd /vagrant/nomad &&

cp base_config.hcl config.hcl &&

./setup.sh 192.168.50.13 /vagrant/nomad/config.hcl &&

sudo nomad agent -config /vagrant/nomad/config.hcl -config server.hcl"