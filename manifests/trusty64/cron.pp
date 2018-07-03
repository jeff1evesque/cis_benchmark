##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cron {
  ## local variables: stig items
  $cis_5_1_1  = $::cis_benchmark::5_1_1
  $cis_5_1_2  = $::cis_benchmark::5_1_2
  $cis_5_1_3  = $::cis_benchmark::5_1_3
  $cis_5_1_4  = $::cis_benchmark::5_1_4
  $cis_5_1_5  = $::cis_benchmark::5_1_5
  $cis_5_1_6  = $::cis_benchmark::5_1_6
  $cis_5_1_7  = $::cis_benchmark::5_1_7
  $cis_5_1_8  = $::cis_benchmark::5_1_8

  ## ensure cron installed
  package { 'cron':
    ensure    => 'installed',
  }

  ## 5.1.1 Ensure cron daemon is enabled (Scored)
  if ($cis_5_1_1) {
    ## ensure configuration
    file { '/etc/init/cron.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/cron/init_cron.conf.erb')),
    }

    ## ensure running service
    service { 'cron':
      ensure => true,
      enable => true,
    }
  }

  ## 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
  if ($cis_5_1_2) {
    file { '/etc/crontab':
      ensure  => present,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/cron/crontab.erb')),
    }
  }

  ## 5.1.3 Ensure permissions on /etc/cron.hourly are configured (Scored)
  if ($cis_5_1_3) {
    file { '/etc/cron.hourly':
      ensure  => directory,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## 5.1.4 Ensure permissions on /etc/cron.daily are configured (Scored)
  if ($cis_5_1_4) {
    file { '/etc/cron.daily':
      ensure  => directory,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## 5.1.5  Ensure permissions on /etc/cron.weekly are configured (Scored)
  if ($cis_5_1_5) {
    file { '/etc/cron.weekly':
      ensure  => directory,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## 5.1.6 Ensure permissions on /etc/cron.monthly are configured (Scored)
  if ($cis_5_1_6) {
    file { '/etc/cron.monthly':
      ensure  => directory,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## 5.1.7 Ensure permissions on /etc/cron.d are configured (Scored)
  if ($cis_5_1_7) {
    file { '/etc/cron.d':
      ensure  => directory,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## 5.1.8 Ensure at/cron is restricted to authorized users (Scored)
  if ($cis_5_1_8) {
    ## ensure absent
    file { '/etc/cron.deny':
      ensure  => absent,
    }
    file { '/etc/at.deny':
      ensure  => absent,
    }

    ## ensure present
    file { '/etc/cron.allow':
      ensure  => present,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
    file { '/etc/at.allow':
      ensure  => present,
      mode    => '0700',
      owner   => 'root',
      group   => 'root',
    }
  }
}
