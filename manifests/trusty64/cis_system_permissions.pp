## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_system_permissions {
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
  $stig       = $hiera_node['stig']
  $report_dir = $hiera_node['report']['stig']

  ## local variables: stig items
  $cis_6_1_1  = $stig['cis_6_1_1']
  $cis_6_1_2  = $stig['cis_6_1_2']
  $cis_6_1_3  = $stig['cis_6_1_3']
  $cis_6_1_4  = $stig['cis_6_1_4']
  $cis_6_1_5  = $stig['cis_6_1_5']
  $cis_6_1_6  = $stig['cis_6_1_6']
  $cis_6_1_7  = $stig['cis_6_1_7']
  $cis_6_1_8  = $stig['cis_6_1_8']
  $cis_6_1_9  = $stig['cis_6_1_9']
  $cis_6_1_10 = $stig['cis_6_1_10']
  $cis_6_1_11 = $stig['cis_6_1_11']
  $cis_6_1_12 = $stig['cis_6_1_12']
  $cis_6_1_13 = $stig['cis_6_1_13']
  $cis_6_1_14 = $stig['cis_6_1_14']

  if ($cis_6_1_10) {
    file { $report_dir:
      ensure => directory,
      mode   => '0600',
      owner  => 'root',
      group  => 'root',
    }
  }

  ## CIS 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
  if ($cis_6_1_2) {
    file { '/etc/passwd':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)
  if ($cis_6_1_3) {
    file { '/etc/shadow':
      ensure  => present,
      mode    => '0640',
      owner   => 'root',
      group   => 'shadow',
    }
  }

  ## CIS 6.1.4 Ensure permissions on /etc/group are configured (Scored)
  if ($cis_6_1_4) {
    file { '/etc/group':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored)
  if ($cis_6_1_5) {
    file { '/etc/gshadow':
      ensure  => present,
      mode    => '0640',
      owner   => 'root',
      group   => 'shadow',
    }
  }

  ## CIS 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
  if ($cis_6_1_6) {
    file { '/etc/passwd-':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.7 Ensure permissions on /etc/shadow- are configured (Scored)
  if ($cis_6_1_7) {
    file { '/etc/shadow-':
      ensure  => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.8 Ensure permissions on /etc/group- are configured (Scored)
  if ($cis_6_1_8) {
    file { '/etc/shadow-':
      ensure  => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.9 Ensure permissions on /etc/gshadow- are configured (Scored)
  if ($cis_6_1_9) {
    file { '/etc/gshadow-':
      ensure  => present,
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
    }
  }

  ## CIS 6.1.10 Ensure no world writable files exist (Scored)
  if ($cis_6_1_10) {

  }
}
