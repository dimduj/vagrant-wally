exec { 'apt-get update':
  path => '/usr/bin',
}

package { 'vim':
  ensure => present,
}
package { 'nano':
  ensure => present,
}

file { '/var/www/':
  ensure => 'directory',
}


#This will ensure our nginx, php and mysql manifests are included during the Vagrant provision (cfr puppet/modules folder.
include nginx, php, mysql
