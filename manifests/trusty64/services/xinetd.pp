## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::services::xinetd {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])

  ## local variables: stig items
  $cis_2_1_1  = $hiera_node['cis_2_1_1']
  $cis_2_1_2  = $hiera_node['cis_2_1_2']
  $cis_2_1_3  = $hiera_node['cis_2_1_3']
  $cis_2_1_4  = $hiera_node['cis_2_1_4']
  $cis_2_1_5  = $hiera_node['cis_2_1_5']
  $cis_2_1_10 = $hiera_node['cis_2_1_10']

  ## apply rules if xinetd installed
  if ($xinetd_installed == 'true') {

    ## ensure base level configurations
    file { '/etc/xinetd.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/xinetd/xinetd.conf.erb')),
    }

    ## CIS 2.1.1 Ensure chargen services are not enabled (Scored)
    if ($cis_2_1_1) {
      file { '/etc/xinetd.d/chargen':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/chargen.erb')),
       }
    }

    ## CIS 2.1.2 Ensure daytime services are not enabled (Scored)
    if ($cis_2_1_2) {
      file { '/etc/xinetd.d/daytime':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/daytime.erb')),
      }
    }

    ## CIS 2.1.3 Ensure discard services are not enabled (Scored)
    if ($cis_2_1_3) {
      file { '/etc/xinetd.d/discard':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/discard.erb')),
      }
    }

    ## CIS 2.1.4 Ensure echo services are not enabled (Scored)
    if ($cis_2_1_4) {
      file { '/etc/xinetd.d/echo':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/echo.erb')),
      }
    }

    ## CIS 2.1.5 Ensure time services are not enabled (Scored)
    if ($cis_2_1_5) {
      file { '/etc/xinetd.d/time':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/time.erb')),
      }
    }

    ## 2.1.10 Ensure xinetd is not enabled (Scored)
    if ($cis_2_1_10) {
      service { 'xinetd':
        ensure => false,
        enable => false,
      }
    }
  }
}
