##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::user_settings {
  ## local variables
  $exec_path     = $::cis_benchmark::exec_path
  $report_path   = $::cis_benchmark::report_path

  ## local variables: stig items
  $cis_6_2_1     = $::cis_benchmark::cis_6_2_1
  $cis_6_2_2     = $::cis_benchmark::cis_6_2_2
  $cis_6_2_3     = $::cis_benchmark::cis_6_2_3
  $cis_6_2_4     = $::cis_benchmark::cis_6_2_4
  $cis_6_2_5     = $::cis_benchmark::cis_6_2_5
  $cis_6_2_6     = $::cis_benchmark::cis_6_2_6
  $cis_6_2_7     = $::cis_benchmark::cis_6_2_7
  $cis_6_2_8     = $::cis_benchmark::cis_6_2_8
  $cis_6_2_9     = $::cis_benchmark::cis_6_2_9
  $cis_6_2_10    = $::cis_benchmark::cis_6_2_10
  $cis_6_2_11    = $::cis_benchmark::cis_6_2_11
  $cis_6_2_12    = $::cis_benchmark::cis_6_2_12
  $cis_6_2_13    = $::cis_benchmark::cis_6_2_13
  $cis_6_2_14    = $::cis_benchmark::cis_6_2_14
  $cis_6_2_15    = $::cis_benchmark::cis_6_2_15
  $cis_6_2_16    = $::cis_benchmark::cis_6_2_16
  $cis_6_2_17    = $::cis_benchmark::cis_6_2_17
  $cis_6_2_18    = $::cis_benchmark::cis_6_2_18
  $cis_6_2_19    = $::cis_benchmark::cis_6_2_19
  $cis_6_2_20    = $::cis_benchmark::cis_6_2_20

  ## 6.2.1 Ensure password fields are not empty (Scored)
  if ($cis_6_2_1) {
    file { 'file-cis-6-2-1':
        path     => "${exec_path}/nonempty-password",
        content  => dos2unix(template('cis/trusty64/bash/nonempty-password.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-1':
        command  => './nonempty-password execute',
        cwd      => $exec_path,
        path     => [
            '/bin',
            '/usr/bin',
        ],
        onlyif   => './nonempty-password check',
        provider => shell,
    }
  }

  ## 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored)
  if ($cis_6_2_2) {
    file_line { 'remove-legacy-passwd-entries':
        ensure            => absent,
        path              => '/etc/passwd',
        line              => '#',
        match             => '^\+\:',
        match_for_absence => true,
        multiple          => true,
    }
  }

  ## 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
  if ($cis_6_2_3) {
    file_line { 'remove-legacy-shadow-entries':
        ensure            => absent,
        path              => '/etc/shadow',
        line              => '#',
        match             => '^\+\:',
        match_for_absence => true,
        multiple          => true,
    }
  }

  ## 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)
  if ($cis_6_2_4) {
    file_line { 'remove-legacy-group-entries':
        ensure            => absent,
        path              => '/etc/group',
        line              => '#',
        match             => '\+\:',
        match_for_absence => true,
        multiple          => true,
    }
  }

  ## 6.2.5 Ensure root is the only UID 0 account (Scored)
  if ($cis_6_2_5) {
    file { 'file-cis-6-2-5':
        path     => "${exec_path}/superuser-privilege",
        content  => dos2unix(template('cis/trusty64/bash/superuser-privilege.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-5':
        command  => './superuser-privilege execute',
        cwd      => $exec_path,
        path     => [
            '/bin',
            '/usr/bin',
        ],
        onlyif   => './superuser-privilege check',
        provider => shell,
    }
  }
  
  ## 6.2.6 Ensure root PATH Integrity (Scored)
  if ($cis_6_2_6) {
    file { 'file-cis-6-2-6':
        path     => "${exec_path}/root-path-report",
        content  => dos2unix(template('cis/trusty64/bash/root-path-report.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-6':
        command  => "./root-path-report execute ${path}",
        cwd      => $exec_path,
        path     => [
            '/bin',
            '/usr/bin',
        ],
        onlyif   => './root-path-report check',
        provider => shell,
    }
  }

  $users = split($homeless_users, ' ')
  $users.each|String $user| {
    ## ensure user exists
    user { $user:
      ensure      => 'present',
    }

    ## 6.2.7 Ensure all users home directories exist (Scored)
    ## 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)
    ## 6.2.9 Ensure users own their home directories (Scored)
    if ($cis_6_2_8) and ($cis_6_2_9) {
        file { "/home/${user}":
            ensure  => directory,
            mode    => '0700',
            owner   => $user,
            group   => $user,
        }
    }
    elsif ($cis_6_2_9) {
        file { "/home/${user}":
            ensure  => directory,
            owner   => $user,
            group   => $user,
        }
    }
    elsif ($cis_6_2_8) {
        file { "/home/${user}":
            ensure  => directory,
            mode    => '0700',
        }
    }
    elsif ($cis_6_2_7) {
        file { "/home/${user}":
            ensure  => directory,
        }
    }
  }

  ## 6.2.10 Ensure users dot files are not group or world writable (Scored)
  if ($cis_6_2_10) {
    file { 'file-cis-6-2-10':
        path     => "${exec_path}/dot-files",
        content  => dos2unix(template('cis/trusty64/bash/dot-files.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-10':
        command  => './dot-files execute',
        cwd      => $exec_path,
        path     => [
            '/bin',
            '/usr/bin',
        ],
        onlyif   => './dot-files check',
        provider => shell,
    }
  }

  ## 6.2.11 Ensure no users have .forward files (Scored)
  if ($cis_6_2_11) {
    file { 'file-cis-6-2-11':
        path     => "${exec_path}/forward-files",
        content  => dos2unix(template('cis/trusty64/bash/forward-files.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-11':
        command  => './forward-files execute',
        cwd      => $exec_path,
        path     => '/bin',
        onlyif   => './forward-files check',
        provider => shell,
    }
  }

  ## 6.2.12 Ensure no users have .netrc files (Scored)
  if ($cis_6_2_12) {
    file { 'file-cis-6-2-12':
        path     => "${exec_path}/netrc-files",
        content  => dos2unix(template('cis/trusty64/bash/netrc-files.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-12':
        command  => './netrc-files execute',
        cwd      => $exec_path,
        path     => '/bin',
        onlyif   => './netrc-files check',
        provider => shell,
    }
  }

  ## 6.2.13 Ensure users .netrc Files are not group or world accessible (Scored)
  if ($cis_6_2_13) {
    file { 'file-cis-6-2-13':
        path     => "${exec_path}/netrc-files-permission",
        content  => dos2unix(template('cis/trusty64/bash/netrc-files-permission.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-13':
        command  => './netrc-files-permission execute',
        cwd      => $exec_path,
        path     => [
            '/bin',
            '/usr/bin',
        ],
        onlyif   => './netrc-files-permission check',
        provider => shell,
    }
  }

  ## 6.2.14 Ensure no users have .rhosts files (Scored)
  if ($cis_6_2_14) {
    file { 'file-cis-6-2-14':
        path     => "${exec_path}/rhosts-files",
        content  => dos2unix(template('cis/trusty64/bash/rhosts-files.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-14':
        command  => './rhosts-files execute',
        cwd      => $exec_path,
        path     => '/bin',
        onlyif   => './rhosts-files check',
        provider => shell,
    }
  }

  ## 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
  if ($cis_6_2_15) {
    group { 'restricted':
        ensure   => 'present',
    }

    file { 'file-cis-6-2-15':
        path     => "${exec_path}/remove-groups",
        content  => dos2unix(template('cis/trusty64/bash/remove-groups.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-15':
        command  => './remove-groups execute',
        cwd      => $exec_path,
        path     => '/bin',
        onlyif   => './remove-groups check',
        provider => shell,
    }
  }

  ## 6.2.16 Ensure no duplicate UIDs exist (Scored)
  if ($cis_6_2_16) {
    file { 'file-cis-6-2-16':
        path     => "${exec_path}/duplicate-uid-report",
        content  => dos2unix(template('cis/trusty64/bash/duplicate-uid-report.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-16':
        command  => './duplicate-uid-report execute',
        cwd      => $exec_path,
        path     => ['/bin', '/usr/bin'],
        onlyif   => './duplicate-uid-report check',
        provider => shell,
    }
  }

  ## 6.2.17 Ensure no duplicate GIDs exist (Scored)
  if ($cis_6_2_17) {
    file { 'file-cis-6-2-17':
        path     => "${exec_path}/duplicate-gid-report",
        content  => dos2unix(template('cis/trusty64/bash/duplicate-gid-report.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-17':
        command  => './duplicate-gid-report execute',
        cwd      => $exec_path,
        path     => ['/bin', '/usr/bin'],
        onlyif   => './duplicate-gid-report check',
       cis_ provider => shell,
    }
  }

  ## 6.2.18 Ensure no duplicate user names exist (Scored)
  if ($6_2_18) {
    file { 'file-cis-6-2-18':
        path     => "${exec_path}/duplicate-username-report",
        content  => dos2unix(template('cis/trusty64/bash/duplicate-username-report.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-18':
        command  => './duplicate-username-report execute',
        cwd      => $exec_path,
        path     => ['/bin', '/usr/bin'],
        onlyif   => './duplicate-username-report check',
        provider => shell,
    }
  }

  ## 6.2.19 Ensure no duplicate group names exist (Scored)
  if ($cis_6_2_19) {
    file { 'file-cis-6-2-19':
        path     => "${exec_path}/duplicate-groupname-report",
        content  => dos2unix(template('cis/trusty64/bash/duplicate-groupname-report.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-19':
        command  => './duplicate-groupname-report execute',
        cwd      => $exec_path,
        path     => ['/bin', '/usr/bin'],
        onlyif   => './duplicate-groupname-report check',
        provider => shell,
    }
  }

  ## 6.2.20 Ensure shadow group is empty (Scored)
  if ($cis_6_2_20) {
    file { 'file-cis-6-2-20':
        path     => "${exec_path}/remove-shadow-group",
        content  => dos2unix(template('cis/trusty64/bash/remove-shadow-group.erb')),
        owner    => root,
        group    => root,
        mode     => '0700',
    }

    exec { 'exec-cis-6-2-20':
        command  => './remove-shadow-group execute',
        cwd      => $exec_path,
        path     => '/bin',
        onlyif   => './remove-shadow-group check',
        provider => shell,
    }
  }
}
