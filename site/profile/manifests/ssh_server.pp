class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCct59IDyFH+XeXB6gwdWI9sy+BijB3lR8nsacqbKHG0NN4/KuI3D7tI2dfTgU61NHBN9JEY/0uxpt6FiOh0EzodATm9/EeFHX2CETMSF/m3OJj3XgpvJ4T/RFTl8CFGsXPoIVetPduEcRdEcVaVFBBZ3UqkAw/9oRhAZEvqgf1KgW4TIe62onM19rajnWsJaXA2urpMz/simfpFMfNix5Xq85NpdN25/diYlEE+keJIB2Xwm3UAdcmWD3FaHv/XIejfU9PX+E64BB3aB/9MtzUEVgss7fdINc3yxX2QUNp6HS5HA6NUaLbuG9k7fvRE8f2nm6VFIZJ0oJ3npcL2KtT',
	}  
}
