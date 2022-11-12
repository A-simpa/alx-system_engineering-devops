#install nginx
#connects through http
#print Hello World!
#configure redirect page

include stdlib

class {'configure nginx':
  exec {'update apt-get':
    command => '/usr/bin/apt-get update',
  }

  exec {'install nginx':
    command => '/usr/bin/apt-get -y install nginx',
  }

  exec {'firewall allow http':
    command => '/usr/sbin/ufw allow "Nginx HTTP"',
  }

  file {'/var/www/html/index.html':
    content => 'Hello World!',
    ensure  => present,
  }

  file_line {'redirection':
    path  => '/etc/nginx/sites-enabled/default',
    after => '^Server_name _;',
    line  => '		location = /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }',
  }

  service {'nginx':
    name    => 'nginx',
    restart => ,
  }
}
