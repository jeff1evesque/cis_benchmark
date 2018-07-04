##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::logging::syslog_ng {
  ## local variables
  ##
  ## @syslog_packages, includes 'syslog-ng' package dependencies.
  ##
  $centralized_log_host = 'loghost.example.com'

  ## local variables: stig items
  $cis_4_2_2_1          = $::cis_benchmark::4_2_2_1
  $cis_4_2_2_2          = $::cis_benchmark::4_2_2_2
  $cis_4_2_2_3          = $::cis_benchmark::4_2_2_3
  $cis_4_2_2_4          = $::cis_benchmark::4_2_2_4
  $cis_4_2_2_5          = $::cis_benchmark::4_2_2_5

  ## CIS 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
  if ($4_2_2_1) {
    ## should not have multiple loggers
    package { 'rsyslog':
      ensure            => absent,
      before            => Package['syslog-ng'],
    }

    ## ensure syslog-ng installed
    package { 'syslog-ng':
      ensure            => present,
      before            => [
        File['/etc/syslog-ng/syslog-ng.conf'],
        File['/etc/syslog-ng/conf.d/custom-syslog-ng.conf'],
      ],
    }

    service { 'syslog-ng':
      ensure            => true,
      enable            => true,
      require           => Package['syslog-ng'],
    }

    file { '/etc/syslog-ng/syslog-ng.conf':
      ensure            => present,
      mode              => '0644',
      owner             => 'root',
      group             => 'root',
      notify            => Service['syslog-ng'],
    }

    ## apply remaining cis stigs
    file { '/etc/syslog-ng/conf.d/custom-syslog-ng.conf':
      ensure            => present,
      mode              => '0644',
      owner             => 'root',
      group             => 'root',
      content           => dos2unix(template('cis/trusty64/syslog-ng/custom-syslog-ng.conf.erb')),
      notify            => Service['syslog-ng'],
    }
  }
}
