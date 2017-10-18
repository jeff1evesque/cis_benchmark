## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_autofsconf {
  include cis::global::cis_modules

  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node      = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $stig            = $hiera_node['stig']

  ## local variables: stig items
  $cis_1_1_21      = $stig['cis_1_1_21']

  ## 1.1.21 Disable Automounting (Scored)
  if ($cis_1_1_21 and $isfile_autofsconf) {
      comment_line { 'cis_1_1_21':
          ensure => commented
          path   => '/etc/init/autofs.conf',
          match  => 'start',
          require => cis::global::cis_modules,
      }
  }
}
