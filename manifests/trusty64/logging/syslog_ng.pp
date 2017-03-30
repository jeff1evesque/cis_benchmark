## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::logging::syslog_ng {
  ## local variables
  $centralized_log_host = 'loghost.example.com'

  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])

  ## local variables: stig items
  $cis_4_2_2_1 = $hiera_node['cis_4_2_2_1']
  $cis_4_2_2_2 = $hiera_node['cis_4_2_2_2']
  $cis_4_2_2_3 = $hiera_node['cis_4_2_2_3']
  $cis_4_2_2_4 = $hiera_node['cis_4_2_2_4']
  $cis_4_2_2_5 = $hiera_node['cis_4_2_2_5']

  ## ensure syslog-ng installed
  package { 'syslog-ng-core':
    ensure => 'present',
  }
  package { 'syslog-ng':
    ensure => 'present',
  }

  ## CIS 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
  if ($cis_4_2_2_1) {
    service { 'syslog-ng':
      ensure => true,
      enable => true,
    }
  }

  ## CIS 4.2.2.3 Ensure syslog-ng default file permissions configured (Scored)
  if ($cis_4_2_2_3) {
    file { '/etc/syslog-ng/conf.d/syslog-ng.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/syslog-ng/syslog-ng.conf.erb')),
      notify  => Exec['restart-syslog-ng'],
    }
  }
  else {
    file { '/etc/syslog-ng/conf.d/custom-syslog-ng.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      notify  => Exec['restart-syslog-ng'],
    }
  }

  ## apply remaining cis stigs
  file { '/etc/syslog-ng/custom-syslog-ng.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/syslog-ng/custom-syslog-ng.conf.erb')),
    notify  => Exec['restart-syslog-ng'],
  }

  ## restart syslog-ng
  exec { 'restart-syslog-ng':
      command     => 'pkill -HUP syslog-ng',
      path        => '/usr/bin',
      refreshonly => true,
  }
}
