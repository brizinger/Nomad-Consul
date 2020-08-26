vagrant up

gnome-terminal -- ./server1-consul-init.sh

sleep 1

gnome-terminal -- ./server2-consul-init.sh

sleep 1

gnome-terminal -- ./server3-consul-init.sh

sleep 1

gnome-terminal -- ./server1-nomad-init.sh

sleep 1

gnome-terminal -- ./server2-nomad-init.sh

sleep 1

gnome-terminal -- ./server3-nomad-init.sh

sleep 10

nomad server members --address="http://192.168.50.11:4646"

nomad node status -address="http://192.168.50.11:4646"

nomad ui -address="http://192.168.50.11:4646"