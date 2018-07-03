##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::autofsconf {
  ## local variables: stig items
  $cis_1_1_21      = $::cis_benchmark::1_1_21

  ## 1.1.21 Disable Automounting (Scored)
  if ($cis_1_1_21 and $isfile_autofsconf) {
      comment_line { '1_1_21':
          ensure   => commented
          path     => '/etc/init/autofs.conf',
          match    => 'start',
          require  => cis::global::cis_modules,
      }
  }
}
