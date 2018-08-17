##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::ssh {
  ## local variables: stig items
  $cis_1_7_1_1 = $::cis_benchmark::cis_1_7_1_1
  $cis_5_2_1   = $::cis_benchmark::cis_5_2_1
  $cis_5_2_2   = $::cis_benchmark::cis_5_2_2
  $cis_5_2_3   = $::cis_benchmark::cis_5_2_3
  $cis_5_2_4   = $::cis_benchmark::cis_5_2_4
  $cis_5_2_5   = $::cis_benchmark::cis_5_2_5
  $cis_5_2_6   = $::cis_benchmark::cis_5_2_6
  $cis_5_2_7   = $::cis_benchmark::cis_5_2_7
  $cis_5_2_8   = $::cis_benchmark::cis_5_2_8
  $cis_5_2_9   = $::cis_benchmark::cis_5_2_9
  $cis_5_2_10  = $::cis_benchmark::cis_5_2_10
  $cis_5_2_11  = $::cis_benchmark::cis_5_2_11
  $cis_5_2_12  = $::cis_benchmark::cis_5_2_12
  $cis_5_2_13  = $::cis_benchmark::cis_5_2_13

  ## ensure openssh-server
  package { 'openssh-server':
    ensure     => 'installed',
  }
  service { 'ssh':
    ensure     => true,
    enable     => true,
    require    => Package['openssh-server'],
  }

  ## CIS 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured
  if ($cis_5_2_1) {
    file { '/etc/ssh/sshd_config':
      ensure   => present,
      mode     => '0600',
      owner    => 'root',
      group    => 'root',
      content  => dos2unix(template('cis_benchmark/trusty64/sshd_config.erb')),
      notify   => Service['ssh'],
      require  => Package['openssh-server'],
    }
  }
  else {
    file { '/etc/ssh/sshd_config':
      ensure   => present,
      content  => dos2unix(template('cis_benchmark/trusty64/sshd_config.erb')),
      notify   => Service['ssh'],
      require  => Package['openssh-server'],
    }
  }
}
