##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::pam {
  ## local variables: stig items
  $cis_5_3_1  = $::cis_benchmark::5_3_1
  $cis_5_3_2  = $::cis_benchmark::5_3_2
  $cis_5_3_3  = $::cis_benchmark::5_3_3
  $cis_5_3_4  = $::cis_benchmark::5_3_4

  ## CIS 5.3.1 Ensure password creation requirements are configured (Scored)
  if ($cis_5_3_1) {
    package { 'libpam-pwquality':
      ensure  => 'installed',
    }

    ## enforce other pam related items
    file { '/etc/security/pwquality.conf':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/pam/pwquality.conf.erb')),
    }

    file { '/etc/pam.d/common-password':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/pam/common-password.erb')),
    }

    file { '/etc/pam.d/common-auth':
      ensure  => present,
      mode    => '0644',
      owner   => 'root',
      group   => 'root',
      content => dos2unix(template('cis/trusty64/pam/common-auth.erb')),
    }
  }
}
