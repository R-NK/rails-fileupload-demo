vm-rebuild:
	vagrant halt
	vagrant destroy -f
	vagrant up

rails:
	rails s -b 0.0.0.0