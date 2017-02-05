## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_cron {
  ## local variables: stig items
  $cis_5_1_1 = $hiera_node['cis_5_1_1']
  $cis_5_1_2 = $hiera_node['cis_5_1_2']

  ## ensure cron installed
  package { 'cron':
    ensure => 'installed',
  }

  ## 5.1.1 Ensure cron daemon is enabled (Scored)
  if ($cis_5_1_1) {
    file { '/etc/init/cron.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/cron/init_cron.conf.erb')),
    }

    service { 'cron':
      ensure => true,
      enable => true,
    }
  }

  ## 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
  if ($cis_5_1_2) {
    file { '/etc/crontab':
      ensure  => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/cron/crontab.erb')),
    }
  }
}
