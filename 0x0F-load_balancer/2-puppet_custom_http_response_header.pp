#install nginx
#connects through http
#print Hello World!
#configure redirect page

include stdlib


exec {'update apt-get':
    command => '/usr/bin/apt-get update',
    before  => Exec['install nginx'],
}

exec {'install nginx':
    command => '/usr/bin/apt-get -y install nginx',
    before  => File['/var/www/html/index.html'],
}


file {'/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World!',
    before  => File['/var/www/html/404_err.html'],
}

file {'/var/www/html/404_err.html':
  content => "Ceci n'est pas une page",
  before  => File_line['redirection'],
}

file_line {'redirection':
    path   => '/etc/nginx/sites-enabled/default',
    after  => '^\tserver_name _;',
    line   => "\tif (\$request_filename ~ redirect_me) {\n\t\trewrite ^ https://linuxhint.com/find-ip-address-ubuntu/ permanent;\n\t}",
    before => File_line['404_error'],
}

file_line {'404_error':
  path   => '/etc/nginx/sites-enabled/default',
  after  => '^\tserver_name _;',
  line   => "\t#error page setup\n\terror_page 404 /404_err.html;\n\
                 \tlocation = /404_err.html {\n\t\troot /var/www/html;\n\t\tinternal;\n\t}",
  before => File_line['header'],
}

file_line {'header':
  path   => '/etc/nginx/nginx.conf',
  after  => '^http {',
  line   => "\tadd_header X-Served-By \$HOSTNAME;",
  before => Exec['restart nginx'],
}

exec {'restart nginx':
    command => '/usr/sbin/service nginx restart',
    require => File_line['header'],
}
