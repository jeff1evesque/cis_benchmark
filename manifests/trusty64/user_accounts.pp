##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::user_accounts {
  ## local variables
  $wheel_users     = $hiera_node['wheel']['users']
  $flattened_users = slice($wheel_users, 1).join(',')

  ## local variables: stig items
  $5_4_1_1         = $::cis_benchmark::5_4_1_1
  $5_4_1_2         = $::cis_benchmark::5_4_1_2
  $5_4_1_3         = $::cis_benchmark::5_4_1_3
  $5_4_1_4         = $::cis_benchmark::5_4_1_4
  $5_4_2           = $::cis_benchmark::5_4_2
  $5_4_3           = $::cis_benchmark::5_4_3
  $5_4_4           = $::cis_benchmark::5_4_4
  $5_5             = $::cis_benchmark::5_5
  $5_6             = $::cis_benchmark::5_6

  ## 5.4.1.x Remaining stig items
  if ($5_4_1_1) or ($5_4_1_2) or ($5_4_1_3) or ($5_4_1_4) {
    file { '/etc/login.defs':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis/trusty64/login.defs.erb')),
      notify       => Exec['chage-pass'],
    }

    exec { 'chage-pass':
      command      => dos2unix(template('cis/trusty64/bash/chage.erb')),
      refreshonly  => true,
      path         => '/usr/bin',
      provider     => shell,
    }
  }

  ## 5.4.2 Ensure system accounts are non-login (Scored)
  if ($5_4_2) {
    file { 'file-cis-5-4-2':
        path       => '/root',
        content    => dos2unix(template('cis/trusty64/bash/usermod-nologin.erb')),
        owner      => root,
        group      => root,
        mode       => '0600',
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
  if ($5_4_3) {
    group { 'root':
      ensure       => present,
      gid          => '0',
    }
  }

  ## 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
  if ($5_4_4) {
    file { '/etc/bash.bashrc':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis/trusty64/bash.bashrc.erb')),
    }

    file { '/etc/profile':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis/trusty64/profile.erb')),
    }
  }

  ## 5.5 Ensure root login is restricted to system console (Not Scored)
  if ($5_5) {
    file { '/etc/securetty':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => multitemplate(
        "cis/trusty64/cis_5_5/${trusted['certname']}.erb",
        "cis/trusty64/securetty.erb",
      ),
    }
  }

  ## 5.6 Ensure access to the su command is restricted (Scored)
  if ($5_6) {
    file { '/etc/pam.d/su':
      ensure       => present,
      mode         => '0644',
      owner        => 'root',
      group        => 'root',
      content      => dos2unix(template('cis/trusty64/su.erb')),
    }

    file_line { 'wheel-users':
      path         => '/etc/group',
      line         => "wheel:x:10:${flattened_users}",
      match        => '^wheel:x:10:((?!root\b).)*$',
      multiple     => true,
    }
  }
}
