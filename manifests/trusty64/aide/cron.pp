##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide::cron {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node        = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $stig              = $hiera_node['stig']
  $aide              = $hiera_node['aide']
  $path              = $aide['aide_path']
  $hour              = $aide['cron']['hour']
  $minute            = $aide['cron']['minute']

  ## local variables: stig items
  $cis_1_3_2         = $stig['cis_1_3_2']

  ## 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  if ($cis_1_3_2) {
    cron { 'aide':
        command      => "${path} --check",
        user         => 'root',
        hour         => $hour,
        minute       => $minute,
        require      => [Package['aide'], Exec['install-aide-db']]
    }
  else {
    cron { 'aide':
        command      => "${path} --check",
        user         => 'root',
        hour         => '*',
        minute       => '0',
        require      => [Package['aide'], Exec['install-aide-db']]
    }
  }
}
