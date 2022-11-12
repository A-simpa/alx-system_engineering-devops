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
    line  => "\tlocation = /redirect_me { return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4; }",
  }

  service {'nginx':
    name   => 'nginx',
    enable => true,
  }
