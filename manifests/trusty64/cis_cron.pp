## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_cron {
  ## local variables: stig items
  $cis_5_1_1 = $hiera_node['cis_5_1_1']

  ## ensure cron installed
  package { 'cron':
    ensure => 'installed',
  }

  ## 5.1.1 Ensure cron daemon is enabled (Scored)
  if ($cis_5_1_1) {
    service { 'cron':
      ensure => true,
      enable => true,
    }
  }
}
