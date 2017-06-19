## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide::config {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node    = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $aide          = $hiera_node['aide']
  $conf_path     = $aide['conf_path']

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