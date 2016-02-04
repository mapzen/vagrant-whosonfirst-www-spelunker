setup:
	if ! test -f Vagrantfile; then cp Vagrantfile.example Vagrantfile; fi

start:
	vagrant up
	vagrant ssh

stop:
	vagrant halt

go:
	vagrant ssh

rebuild:
	vagrant up --provision

update:
	vagrant box update
