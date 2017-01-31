## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::syslog_ng {
  ## local variables: conditionally load hiera
  $node_reference = $node_name_value
  $hiera_node     = hiera($node_reference, 'trusty64')

  ## local variables: stig items
  $cis_4_2_2_1 = $hiera_node['cis_4_2_2_1']

  ## CIS 4.2.2.1 Ensure syslog-ng service is enabled (Scored)
  if ($cis_4_2_2_1) {
    ## ensure syslog-ng installed
    package { 'syslog-ng':
      ensure => 'present',
    }

    ## ensure syslog-ng running
    service { 'syslog-ng':
      ensure => true,
      enable => true,
    }
  }
