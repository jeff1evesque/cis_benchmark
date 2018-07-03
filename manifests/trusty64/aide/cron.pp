##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide::cron {
  ## local variables
  $path         = $::cis_benchmark::aide_path
  $hour         = $::cis_benchmark::aide_cron_hour
  $minute       = $::cis_benchmark::aide_cron_minute

  ## local variables: stig items
  $cis_1_3_2    = $::cis_benchmark::1_3_2

  ## 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  if ($cis_1_3_2) {
    cron { 'aide':
        command => "${path} --check",
        user    => 'root',
        hour    => $hour,
        minute  => $minute,
        require => [Package['aide'], Exec['install-aide-db']]
    }
  else {
    cron { 'aide':
        command => "${path} --check",
        user    => 'root',
        hour    => '*',
        minute  => '0',
        require => [Package['aide'], Exec['install-aide-db']]
    }
  }
}
