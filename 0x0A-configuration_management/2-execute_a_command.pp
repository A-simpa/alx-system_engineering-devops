#kills a program killmenow
exec {'pkill':
    command => '/bin/pkill killmenow',
    path    => shell
}
