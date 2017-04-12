## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_user_accounts {
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
  $wheel_users     = $hiera_node['wheel']['users']
  $flattened_users = slice($wheel_users, 1).join(',')

  ## local variables: stig items
  $cis_5_4_1_1     = $stig['cis_5_4_1_1']
  $cis_5_4_1_2     = $stig['cis_5_4_1_2']
  $cis_5_4_1_3     = $stig['cis_5_4_1_3']
  $cis_5_4_1_4     = $stig['cis_5_4_1_4']
  $cis_5_4_2       = $stig['cis_5_4_2']
  $cis_5_4_3       = $stig['cis_5_4_3']
  $cis_5_4_4       = $stig['cis_5_4_4']
  $cis_5_5         = $stig['cis_5_5']
  $cis_5_6         = $stig['cis_5_6']

  file { '/etc/login.defs':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/login.defs.erb')),
    notify  => [
      Exec['chage-pass-max-days'],
      Exec['chage-pass-min-days'],
      Exec['chage-pass-warn-days'],
      Exec['chage-pass-inactive-days'],
    ],
  }

  ## 5.4.1.1 Ensure password expiration is 90 days or less (Scored)
  if ($cis_5_4_1_1) {
    $param = 'maxdays'
    $value = '90'

    exec { 'chage-pass-max-days':
      command     => dos2unix(template('cis/trusty64/chage/chage.erb')),
      refreshonly => true,
      path        => '/usr/bin',
    }
  }

  ## 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored)
  if ($cis_5_4_1_2) {
    $param = 'mindays'
    $value = '7'

    exec { 'chage-pass-min-days':
      command     => dos2unix(template('cis/trusty64/chage/chage.erb')),
      refreshonly => true,
      path        => '/usr/bin',
    }
  }

  ## 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)
  if ($cis_5_4_1_3) {
    $param = 'warndays'
    $value = '7'

    exec { 'chage-pass-warn-days':
      command     => dos2unix(template('cis/trusty64/bash/chage.erb')),
      refreshonly => true,
      path        => '/usr/bin',
    }
  }

  ## 5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)
  if ($cis_5_4_1_4) {
    $param = 'inactive'
    $value = '30'

    exec { 'chage-pass-inactive-days':
      command     => dos2unix(template('cis/trusty64/bash/chage.erb')),
      refreshonly => true,
      path        => '/usr/bin',
    }
  }

  ## 5.4.2 Ensure system accounts are non-login (Scored)
  if ($cis_5_4_2) {
    exec { 'usermod-nologin':
      command => dos2unix(template('cis/trusty64/bash/usermod-nologin.erb')),
      path    => '/usr/bin',
      onlyif  => dos2unix(template('cis/trusty64/bash/verify-nologin.erb')),
    }
  }

  ## 5.4.3 Ensure default group for the root account is GID 0 (Scored)
  if ($cis_5_4_3) {
    group { 'root':
      ensure => present,
      gid    => '0',
    }
  }

  ## 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
  file { '/etc/bash.bashrc':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/bash.bashrc.erb')),
  }

  file { '/etc/profile':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/profile.erb')),
  }

  ## 5.5 Ensure root login is restricted to system console (Not Scored)
  file { '/etc/securetty':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/securetty.erb')),
  }

  ## 5.6 Ensure access to the su command is restricted (Scored)
  file { '/etc/pam.d/su':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => dos2unix(template('cis/trusty64/su.erb')),
  }
  if ($cis_5_6) {
    file_line { 'wheel-users':
      path => '/etc/group',
      line => "wheel:x:10:${flattened_users}",
    }
  }
}
