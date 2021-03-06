##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::logging::rsyslog {
  ## local variables
  $centralized_log_host = 'loghost.example.com'

  ## local variables: stig items
  $cis_4_2_1_1          = $::cis_benchmark::cis_4_2_1_1
  $cis_4_2_1_2          = $::cis_benchmark::cis_4_2_1_2
  $cis_4_2_1_3          = $::cis_benchmark::cis_4_2_1_3
  $cis_4_2_1_4          = $::cis_benchmark::cis_4_2_1_4
  $cis_4_2_1_5          = $::cis_benchmark::cis_4_2_1_5

  ## CIS 4.2.1.1 Ensure logging is configured (Not Scored)
  if ($cis_4_2_1_1) {
    ## ensure rsyslog installed
    package { 'rsyslog':
      ensure            => 'present',
    }

    ## ensure configuration
    file { '/etc/init/rsyslog.conf':
      ensure            => present,
      mode              => '0644',
      owner             => 'root',
      group             => 'root',
      content           => dos2unix(template('cis_benchmark/trusty64/rsyslog/init_rsyslog.conf.erb')),
    }

    ## ensure rsyslog running
    service { 'rsyslog':
      ensure            => true,
      enable            => true,
      require           => Package['rsyslog'],
    }
  }

  ## CIS 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
  if ($cis_4_2_1_3) {
    file { '/etc/rsyslog.conf':
      ensure            => present,
      mode              => '0644',
      owner             => 'root',
      group             => 'root',
      content           => dos2unix(template('cis_benchmark/trusty64/rsyslog/rsyslog.conf.erb')),
    }
  }
  else {
    file { '/etc/rsyslog.conf':
      ensure            => present,
      mode              => '0644',
      owner             => 'root',
      group             => 'root',
    }

    file_line { 'rsyslog-include-config':
      path              => '/etc/rsyslog.conf',
      line              => '$IncludeConfig /etc/rsyslog.d/*.conf',
    }
  }

  ## apply remaining cis stigs
  file { '/etc/rsyslog.d/50-default.conf':
    ensure              => present,
    mode                => '0644',
    owner               => 'root',
    group               => 'root',
    content             => dos2unix(template('cis_benchmark/trusty64/rsyslog/50-default.conf.erb')),
  }

  ## restart rsyslogd
  exec { 'restart-rsyslogd':
      command           => 'pkill -HUP rsyslogd',
      path              => '/usr/bin',
      subscribe         => [
        File['/etc/init/rsyslog.conf'],
        File['/etc/rsyslog.conf'],
        File['/etc/rsyslog.d/50-default.conf'],
      ],
      refreshonly       => true,
  }
}
