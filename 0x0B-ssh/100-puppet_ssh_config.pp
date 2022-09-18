#configures an ssh config file to contain some content
include stdlib

file_line {'/etc/ssh/ssh_config':
    ensure  => present,
    path    => '/etc/ssh/ssh_config',
    line    => '	PasswordAuthentication no',
    replace => true
}

file_line {'/etc/ssh/ssh_config':
    ensure  => present,
    path    => '/etc/ssh/ssh_config',
    line    => '		IdentityFile ~/.ssh/school',
    replace => true
}
