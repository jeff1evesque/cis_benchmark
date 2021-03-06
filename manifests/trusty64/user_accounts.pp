##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::user_accounts {
  ## local variables
  $wheel_users     = $::cis_benchmark::wheel_users
  $flattened_users = slice($wheel_users, 1).join(',')

  ## local variables: stig items
  $cis_5_4_1_1     = $::cis_benchmark::cis_5_4_1_1
  $cis_5_4_1_2     = $::cis_benchmark::cis_5_4_1_2
  $cis_5_4_1_3     = $::cis_benchmark::cis_5_4_1_3
  $cis_5_4_1_4     = $::cis_benchmark::cis_5_4_1_4
  $cis_5_4_2       = $::cis_benchmark::cis_5_4_2
  $cis_5_4_3       = $::cis_benchmark::cis_5_4_3
  $cis_5_4_4       = $::cis_benchmark::cis_5_4_4
  $cis_5_5         = $::cis_benchmark::cis_5_5
  $cis_5_6         = $::cis_benchmark::cis_5_6

  ## 5.4.1.x Remaining stig items
  if ($cis_5_4_1_1) or ($cis_5_4_1_2) or ($cis_5_4_1_3) or ($cis_5_4_1_4) {
    file { '/etc/login.defs':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis_benchmark/trusty64/login.defs.erb')),
    }

    file { '/root/chage':
      ensure       => present,
      mode         => '0600',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis_benchmark/trusty64/bash/chage.erb')),
    }

    cron::daily { 'cron-chage':
      command   => 'cd /root && ./chage',
      user      => 'root',
      hour      => '5',
      minute    => '0',
      environment => [ 'PATH="/usr/bin', ],
    }
  }

  ## 5.4.2 Ensure system accounts are non-login (Scored)
  if ($cis_5_4_2) {
    file { 'file-cis-5-4-2':
        path       => '/root/usermod-nologin',
        content    => dos2unix(template('cis_benchmark/trusty64/bash/usermod-nologin.erb')),
        owner      => root,
        group      => root,
        mode       => '0600',
        before     => Exec['exec-cis-5-4-2'],
    }
    exec { 'exec-cis-5-4-2':
      command      => './usermod-nologin change',
      cwd          => '/root',
      path         => [
          '/usr/bin',
          '/usr/sbin',
      ],
      onlyif       => './usermod-nologin check',
      provider     => shell,
    }
  }

  ## 5.4.3 Ensure default group for the root account is GID 0 (Scored)
  if ($cis_5_4_3) {
    group { 'root':
      ensure       => present,
      gid          => '0',
    }
  }

  ## 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
  if ($cis_5_4_4) {
    file { '/etc/bash.bashrc':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis_benchmark/trusty64/bash.bashrc.erb')),
    }

    file { '/etc/profile':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis_benchmark/trusty64/profile.erb')),
    }
  }

  ## 5.5 Ensure root login is restricted to system console (Not Scored)
  if ($cis_5_5) {
    file { '/etc/securetty':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => multitemplate(
        "cis_benchmark/trusty64/cis_5_5/${trusted['certname']}.erb",
        'cis_benchmark/trusty64/securetty.erb',
      ),
    }
  }

  ## 5.6 Ensure access to the su command is restricted (Scored)
  if ($cis_5_6) {
    file { '/etc/pam.d/su':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis_benchmark/trusty64/su.erb')),
    }

    file_line { 'wheel-users':
      path         => '/etc/group',
      line         => "wheel:x:10:${flattened_users}",
      match        => '^wheel:x:10:((?!root\b).)*$',
      multiple     => true,
    }
  }
}
