##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::filesystem_integrity {
  ## local variables
  $timestamp        = generate('/bin/date', '+%Y-%d-%m-%H-%M-%S')
  $aide_log_file    = "/var/log/aide/aidecheck_${timestamp}.txt"

  ## local variables: stig items
  $cis_1_3_1        = $::cis_benchmark::cis_1_3_1
  $cis_1_3_2        = $::cis_benchmark::cis_1_3_2

  ## 1.3.1 Ensure AIDE is installed (Scored)
  if ($cis_1_3_1) {
    package { 'aide':
        ensure      => 'installed',
        notify      => Exec['aideinit'],
    }

    exec { 'aideinit':
        command     => 'aideinit',
        refreshonly => true,
        path        => '/usr/sbin',
    }
  }

  ## 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  if ($cis_1_3_2) {
      file { '/var/log/aide':
          ensure    => 'directory',
          owner     => 'root',
          group     => 'root',
          mode      => '0700',
      }

      cron { 'aide-report':
          command   => "aide -c /etc/aide/aide.conf --check > ${aide_log_file}",
          user      => 'root',
          hour      => 5,
          minute    => 0,
      }
  }
}
