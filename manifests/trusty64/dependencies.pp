##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::dependencies {
  ## local variables
  $paths   = $::cis_benchmark::paths

  ## create reporting directory
  file { $paths:
    ensure => directory,
    mode   => '0700',
    owner  => 'root',
    group  => 'root',
  }
}
