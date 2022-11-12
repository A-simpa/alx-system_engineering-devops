#install nginx
#connects through http
#print Hello World!
#configure redirect page

include stdlib


  exec {'update apt-get':
    command => '/usr/bin/apt-get update',
  }

  exec {'install nginx':
    command => '/usr/bin/apt-get -y install nginx',
  }

  file {'/var/www/html/index.html':
    ensure  => present,
    content => 'Hello World!',
  }

  file_line {'redirection':
    path  => '/etc/nginx/sites-enabled/default',
    after => '^\tserver_name _;',
    line  => "\tif (\$request_filename ~ redirect_me) {\n\t\trewrite ^ https://linuxhint.com/find-ip-address-ubuntu/ permanent;\n\t}",
  }

  exec {'restart nginx':
    command => '/usr/sbin/service nginx restart',
  }
