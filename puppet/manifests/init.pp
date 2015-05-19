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


vcsrepo { '/var/www/test':
  ensure   => present,
  provider => git,
  source   => 'git@github.com:dpi247/Wally-CMS.git',
  revision => '1.1.2rc1',
}


#This will ensure our nginx, php and mysql manifests are included during the Vagrant provision (cfr puppet/modules folder.
include nginx, php, mysql


#This notation is declaring a subclass from the vcs_repo module
#class { "vcs_repo": }



#Finally update the system
#include system-update