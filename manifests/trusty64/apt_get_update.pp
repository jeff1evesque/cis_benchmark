##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::apt_get_update {
  ## local variables
  $frequency      = $::cis_benchmark::update_frequency

  ## local variables: stig items
  $cis_1_8        = $::cis_benchmark::cis_1_8

  ## 1.8 Ensure updates, patches, and additional security software are installed (Not Scored)
  if ($cis_1_8) {
    exec { 'stabilize-dpkg':
      command     => 'dpkg --configure -a',
      unless      => 'apt-get -y update',
      path        => '/usr/bin',
    }

    class { 'apt':
      update => {
        frequency => $frequency,
      },
    }
  }
}
