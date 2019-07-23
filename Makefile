vm-rebuild:
	vagrant halt
	vagrant destroy -f
	vagrant up