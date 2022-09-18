#configures an ssh config file
file {'/home/vagrant/.ssh/config':
    ensure  => file,
    path    => '/home/vagrant/.ssh/config',
    content => 'Host 44.197.197.53
	IdentityFile ~/.ssh/school
        PasswordAuthentication no'
}
