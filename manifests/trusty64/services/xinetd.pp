## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::services::xinetd {
  ## local variables: conditionally load hiera
  $node_reference = $node_name_value
  $hiera_node     = hiera($node_reference, 'trusty64')

  ## local variables: stig items
  $cis_2_1_1 = $hiera_node['cis_2_1_1']
  $cis_2_1_2 = $hiera_node['cis_2_1_2']
  $cis_2_1_3 = $hiera_node['cis_2_1_3']
  $cis_2_1_4 = $hiera_node['cis_2_1_4']
  $cis_2_1_5 = $hiera_node['cis_2_1_5']
  $cis_2.1.10 = $hiera_node['cis_2.1.10']

  ## apply rules if xinetd installed
  if ($xinetd_installed) {

    ## ensure base level configurations
    file { '/etc/xinetd.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/xinetd/xinetd.conf.erb')),
    }

    ## CIS 2.1.1 Ensure chargen services are not enabled (Scored)
    if ($cis_2.1.1) {
      file { '/etc/xinetd.d/chargen':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd.d/chargen.erb')),
    }

    ## CIS 2.1.2 Ensure daytime services are not enabled (Scored)
    if ($cis_2.1.2) {
      file { '/etc/xinetd.d/daytime':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd.d/daytime.erb')),
    }

    ## CIS 2.1.3 Ensure discard services are not enabled (Scored)
    if ($cis_2.1.3) {
      file { '/etc/xinetd.d/discard':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/xinetd.d/discard.erb')),
    }

    ## CIS 2.1.4 Ensure echo services are not enabled (Scored)
    if ($cis_2.1.4) {
      file { '/etc/xinetd.d/echo':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd.d/echo.erb')),
      }
    }

    ## CIS 2.1.5 Ensure time services are not enabled (Scored)
    if ($cis_2.1.5) {
      file { '/etc/xinetd.d/echo':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd.d/time.erb')),
      }
    }

    ## 2.1.10 Ensure xinetd is not enabled (Scored)
    if ($cis_2.1.10) {
      service { 'xinetd':
        ensure => false,
        enable => false,
      }
    }
  }

}
