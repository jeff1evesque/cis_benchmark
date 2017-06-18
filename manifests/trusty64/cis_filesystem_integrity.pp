## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_filesystem_integrity {
  include cis::trusty64::dependencies

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
  $stig          = $hiera_node['stig']
  $exec_path     = $hiera_node['report']['stig']['exec_path']
  $report_path   = $hiera_node['report']['stig']['report_path']

  ## local variables: stig items
  $cis_1_3_1     = $stig['cis_1_3_1']
  $cis_1_3_2     = $stig['cis_1_3_2']

  ## 1.3.1 Ensure AIDE is installed (Scored)
  if ($cis_1_3_1) {
    aide::watch { 'aide-cis-1-3-1':
        path  => '/',
        rules => 'R'
    }
  }

  ## 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  if ($cis_1_3_2) {
    exec { 'exec-cis-1-3-2':
        command  => '( crontab -l ; echo "0 5 * * * /usr/bin/aide --check" ) | crontab -',
        path     => ['/bin', '/usr/bin'],
        provider => shell,
    }
  }
}
