##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide::config {
  ## local variables
  $conf_path     = $::cis_benchmark::aide_config

  concat { 'aide.conf':
    path         => $conf_path,
    owner        => 'root',
    group        => 'root',
    mode         => '0600',
    require      => Package['aide']
  }

  concat::fragment { 'aide.conf.header':
    target       => 'aide.conf',
    order        => 01,
    content      => template( 'aide/aide.conf.erb')
  }
}