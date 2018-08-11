##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::ssh {
  ## local variables: stig items
  $cis_1_7_1_1 = $::cis_benchmark::cis_1_7_1_1
  $cis_5_2_1   = $::cis_benchmark::cis_5_2_1
  $cis_5_2_2   = $::cis_benchmark::cis_5_2_2
  $cis_5_2_3   = $::cis_benchmark::cis_5_2_3
  $cis_5_2_4   = $::cis_benchmark::cis_5_2_4
  $cis_5_2_5   = $::cis_benchmark::cis_5_2_5
  $cis_5_2_6   = $::cis_benchmark::cis_5_2_6
  $cis_5_2_7   = $::cis_benchmark::cis_5_2_7
  $cis_5_2_8   = $::cis_benchmark::cis_5_2_8
  $cis_5_2_9   = $::cis_benchmark::cis_5_2_9
  $cis_5_2_10  = $::cis_benchmark::cis_5_2_10
  $cis_5_2_11  = $::cis_benchmark::cis_5_2_11
  $cis_5_2_12  = $::cis_benchmark::cis_5_2_12
  $cis_5_2_13  = $::cis_benchmark::cis_5_2_13

  ## ensure openssh-server
  package { 'openssh-server':
    ensure     => 'installed',
  }
  service { 'ssh':
    ensure     => true,
    enable     => true,
    require    => Package['openssh-server'],
  }

  ## docstring for sshd_config
  $docstring = [
    '##',
    '## CIS Ubuntu 14.04 LTS Server Benchmark',
    '## v2.0.0 - 09-30-2016',
    '##',
    '## Description: this file is enforced by puppet.',
    '##',
  ]
  $docstring.each |Integer $index, String $line| {
    file_line { "sshd_config_docstring-${index}":
      path     => '/etc/ssh/sshd_config',
      line     => $line,
      multiple => true,
    }
  }

  ## 1.7.1.1 Ensure message of the day is configured properly (Scored)
  if ($cis_1_7_1_1) {
    file_line { 'sshd_config_printmodt_no':
      path     => '/etc/ssh/sshd_config',
      line     => 'PrintMotd no',
      match    => '^PrintMotd[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured
  if ($cis_5_2_1) {
    file { '/etc/ssh/sshd_config':
      ensure   => present,
      mode     => '0600',
      owner    => 'root',
      group    => 'root',
      notify   => Service['ssh'],
      require  => Package['openssh-server'],
    }
  }

  ## CIS 5.2.2 Ensure SSH Protocol is set to 2 (Scored)
  if ($cis_5_2_2) {
    file_line { 'cis_5_2_2':
      path     => '/etc/ssh/sshd_config',
      line     => 'Protocol 2',
      match    => '^Protocol[[:space:]]*(?!1\b)\S+$',
    }
  }

  ## CIS 5.2.3 Ensure SSH LogLevel is set to INFO (Scored)
  if ($cis_5_2_3) {
    file_line { 'cis_5_2_3':
      path     => '/etc/ssh/sshd_config',
      line     => 'LogLevel INFO',
      match    => '^LOGLEVEL[[:space:]]*(?!INFO\b)\S+$',
    }
  }

  ## CIS 5.2.4 Ensure SSH X11 forwarding is disabled (Scored)
  if ($cis_5_2_4) {
    file_line { 'cis_5_2_4':
      path     => '/etc/ssh/sshd_config',
      line     => 'X11Forwarding no',
      match    => '^X11Forwarding[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
  if ($cis_5_2_5) {
    file_line { 'cis_5_2_5':
      path     => '/etc/ssh/sshd_config',
      line     => 'MaxAuthTries 4',
      match    => '^MaxAuthTries[[:space:]]*(?!4\b)\S+$',
    }
  }

  ## CIS 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)
  if ($cis_5_2_6) {
    file_line { 'cis_5_2_6':
      path     => '/etc/ssh/sshd_config',
      line     => 'IgnoreRhosts yes',
      match    => '^IgnoreRhosts[[:space:]]*(?!yes\b)\S+$',
    }
  }

  ## CIS 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)
  if ($cis_5_2_7) {
    file_line { 'cis_5_2_7':
      path     => '/etc/ssh/sshd_config',
      line     => 'HostbasedAuthentication no',
      match    => '^HostbasedAuthentication[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.8 Ensure SSH root login is disabled (Scored)
  if ($cis_5_2_8) {
    file_line { 'cis_5_2_8':
      path     => '/etc/ssh/sshd_config',
      line     => 'PermitRootLogin no',
      match    => '^PermitRootLogin[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)
  if ($cis_5_2_9) {
    file_line { 'cis_5_2_9':
      path     => '/etc/ssh/sshd_config',
      line     => 'PermitEmptyPasswords no',
      match    => '^PermitEmptyPasswords[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)
  if ($cis_5_2_10) {
    file_line { 'cis_5_2_10':
      path     => '/etc/ssh/sshd_config',
      line     => 'PermitUserEnvironment no',
      match    => '^PermitUserEnvironment[[:space:]]*(?!no\b)\S+$',
    }
  }

  ## CIS 5.2.11 Ensure only approved MAC algorithms are used (Scored)
  if ($cis_5_2_11) {
    file_line { 'cis_5_2_11':
      path     => '/etc/ssh/sshd_config',
      line     => 'MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com',
      match    => '^MACs[[:space:]]*((?!hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com).)*$',
    }
  }

  ## CIS 5.2.12 Ensure SSH Idle Timeout Interval is configured (Scored)
  if ($cis_5_2_12) {
    file_line { 'cis_5_2_12_ClientAliveInterval':
      path     => '/etc/ssh/sshd_config',
      line     => 'ClientAliveInterval 300',
      match    => '^ClientAliveInterval[[:space:]]*(?!300\b)\S+',
    }
    file_line { 'cis_5_2_12_ClientAliveCountMax':
      path     => '/etc/ssh/sshd_config',
      line     => 'ClientAliveCountMax 0',
      match    => '^ClientAliveCountMax[[:space:]]*(?!0\b)\S+$',
    }
  }

  ## CIS 5.2.13 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
  if ($cis_5_2_13) {
    file_line { 'cis_5_2_13':
      path     => '/etc/ssh/sshd_config',
      line     => 'LoginGraceTime 60',
      match    => '^LoginGraceTime[[:space:]]*(?!60\b)\S+',
    }
  }
}
