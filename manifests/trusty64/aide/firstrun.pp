## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide::firstrun {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node    = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $aide          = $hiera_node['aide']
  $aide_path     = $aide['aide_path']
  $conf_path     = $aide['conf_path']
  $db_path       = $aide['db_path']
  $db_temp_path  = $aide['db_temp_path']

  exec { 'aide-init':
    command      => "${aide_path} --init --config ${conf_path}",
    user         => 'root',
    refreshonly  => true,
    subscribe    => Concat['aide.conf']
  }

  exec { 'install-aide-db':
    command      => "/bin/cp -f ${db_temp_path} ${db_path}",
    user         => 'root',
    refreshonly  => true,
    subscribe    => Exec['aide-init']
  }

  file { $db_path:
    ensure       => present,
    owner        => root,
    group        => root,
    mode         => '0600',
    require      => Exec['install-aide-db']
  }

  file { '/var/lib/aide/aide.db.new.gz':
    owner        => root,
    group        => root,
    mode         => '0600',
    require      => Exec['aide-init']
  }
}