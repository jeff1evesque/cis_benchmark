##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::services::xinetd {
  ## local variables: stig items
  $2_1_1      = $::cis_benchmark::2_1_1
  $2_1_2      = $::cis_benchmark::2_1_2
  $2_1_3      = $::cis_benchmark::2_1_3
  $2_1_4      = $::cis_benchmark::2_1_4
  $2_1_5      = $::cis_benchmark::2_1_5
  $2_1_10     = $::cis_benchmark::2_1_10

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
    if ($2_1_1) {
      file { '/etc/xinetd.d/chargen':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/chargen.erb')),
      }
    }

    ## CIS 2.1.2 Ensure daytime services are not enabled (Scored)
    if ($2_1_2) {
      file { '/etc/xinetd.d/daytime':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/daytime.erb')),
      }
    }

    ## CIS 2.1.3 Ensure discard services are not enabled (Scored)
    if ($2_1_3) {
      file { '/etc/xinetd.d/discard':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/discard.erb')),
      }
    }

    ## CIS 2.1.4 Ensure echo services are not enabled (Scored)
    if ($2_1_4) {
      file { '/etc/xinetd.d/echo':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/echo.erb')),
      }
    }

    ## CIS 2.1.5 Ensure time services are not enabled (Scored)
    if ($2_1_5) {
      file { '/etc/xinetd.d/time':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => dos2unix(template('cis/trusty64/xinetd/time.erb')),
      }
    }

    ## 2.1.10 Ensure xinetd is not enabled (Scored)
    if ($2_1_10) {
      service { 'xinetd':
        ensure => false,
        enable => false,
      }

      file_line { 'cis_2_1_10':
        path     => '/etc/init/xinetd.conf',
        line     => '#start on runlevel [2345]',
        match    => '^start on runlevel.*',
        multiple => true,
      }
    }
  }


  ## remove lines starting with particular keywords
  if ($2_1_1) {
    exec {'cis_2_1_1':
      command => 'sed -i /^chargen/d /etc/inetd.conf',
      onlyif  => 'grep ^chargen /etc/inetd.conf',
      path    => '/bin',
    }

    exec { 'cis_2_1_1_recurse':
      command => 'find /etc/inetd.d -type f -print0 | xargs -0 sed -i /^chargen/d',
      path    => ['/bin', '/usr/bin'],
      onlyif  => 'find /etc/inetd.d -type f -print0 | xargs -0 grep ^chargen',
    }
  }

  if ($2_1_2) {
    exec {'cis_2_1_2':
      command => 'sed -i /^daytime/d /etc/inetd.conf',
      onlyif  => 'grep ^daytime /etc/inetd.conf',
      path    => '/bin',
    }

    exec { 'cis_2_1_2_recurse':
      command => 'find /etc/inetd.d -type f -print0 | xargs -0 sed -i /^daytime/d',
      path    => ['/bin', '/usr/bin'],
      onlyif  => 'find /etc/inetd.d -type f -print0 | xargs -0 grep ^daytime',
    }
  }

  if ($2_1_3) {
    exec {'cis_2_1_3':
      command => 'sed -i /^discard/d /etc/inetd.conf',
      onlyif  => 'grep ^discard /etc/inetd.conf',
      path    => '/bin',
    }

    exec { 'cis_2_1_3_recurse':
      command => 'find /etc/inetd.d -type f -print0 | xargs -0 sed -i /^discard/d',
      path    => ['/bin', '/usr/bin'],
      onlyif  => 'find /etc/inetd.d -type f -print0 | xargs -0 grep ^discard',
    }
  }

  if ($2_1_4) {
    exec {'cis_2_1_4':
      command => 'sed -i /^echo/d /etc/inetd.conf',
      onlyif  => 'grep ^echo /etc/inetd.conf',
      path    => '/bin',
    }

    exec { 'cis_2_1_4_recurse':
      command => 'find /etc/inetd.d -type f -print0 | xargs -0 sed -i /^echo/d',
      path    => ['/bin', '/usr/bin'],
      onlyif  => 'find /etc/inetd.d -type f -print0 | xargs -0 grep ^echo',
    }
  }

  if ($2_1_5) {
    exec {'cis_2_1_5':
      command => 'sed -i /^time/d /etc/inetd.conf',
      onlyif  => 'grep ^time /etc/inetd.conf',
      path    => '/bin',
    }

    exec { 'cis_2_1_5_recurse':
      command => 'find /etc/inetd.d -type f -print0 | xargs -0 sed -i /^time/d',
      path    => ['/bin', '/usr/bin'],
      onlyif  => 'find /etc/inetd.d -type f -print0 | xargs -0 grep ^time',
    }
  }
}
