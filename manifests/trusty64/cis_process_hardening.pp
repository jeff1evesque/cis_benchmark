## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_process_hardening {
  include cis::trusty64::dependencies

  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node       = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $exec_path        = $hiera_node['report']['stig']['exec_path']
  $report_path      = $hiera_node['report']['stig']['report_path']
  $stig             = $hiera_node['stig']
  $report           = $hiera_node['report']['stig']
  $paths            = $report['paths']

  ## local variables: stig items
  $cis_1_5_1        = $stig['cis_1_5_1']
  $cis_1_5_2        = $stig['cis_1_5_2']
  $cis_1_5_3        = $stig['cis_1_5_3']
  $cis_1_5_4        = $stig['cis_1_5_4']

  ## 1.5.1 Ensure core dumps are restricted (Scored)
  if ($cis_1_5_1) {
    file { 'file-cis-1-5-1-limits':
        content     => dos2unix(template('cis/trusty64/pam/core-dumps.conf.erb')),
        path        => '/etc/security/limits.d/core-dumps.conf',
        mode        => '0644',
        owner       => root,
        group       => root,
        notify      => Exec['exec-cis-1-5-1-active-kernel'],
    }

    exec { 'exec-cis-1-5-1-active-kernel':
        command     => 'sysctl -w fs.suid_dumpable=0',
        path        => '/sbin',
        refreshonly => true,
    }
  }

  ## 1.5.2 Ensure XD/NX support is enabled (Not Scored)
  if ($cis_1_5_2) {
    file { 'file-cis-1-5-2':
      content       => dos2unix(template('cis/trusty64/bash/xdnx-report.erb')),
      path          => "${exec_path}/xdnx-report",
      mode          => '0700',
      owner         => root,
      group         => root,
      require       => File[$paths],
    }

    exec { 'exec-cis-1-5-2':
      command       => './xdnx-report execute',
      onlyif        => './xdnx-report report',
      path          => $exec_path,
    }
  }

  ## 1.5.3 Ensure address space layout randomization (ASLR) is enabled
  ##
  ## Note: the 'shell' provider allows the inline 'if' to be interpretted.
  ##
  if ($cis_1_5_3) {
    exec { 'exec-cis-1-5-3-active-kernel':
        command     => 'sysctl -w kernel.randomize_va_space=2',
        path        => '/sbin',
        onlyif      => 'if [ $(sysctl -n kernel.randomize_va_space) != 2 ]; then exit 0; else exit 1; fi',
        provider    => shell,
    }
  }

  ## 1.5.1 Ensure core dumps are restricted (Scored)
  ## 1.5.3 Ensure address space layout randomization (ASLR) is enabled
  file { 'file-cis-sysctl':
      content       => dos2unix(template('cis/trusty64/sysctl.conf.erb')),
      path          => '/etc/sysctl.conf',
      mode          => '0644',
      owner         => root,
      group         => root,
  }

  ## 1.5.4 Ensure prelink is disabled (Scored)
  if ($cis_1_5_4) {
    if ($facts['installed_prelink'] == 'true') {
        exec { 'exec-cis-1-5-4':
            command   => 'prelink -ua',
            path      => ['/usr/bin', '/usr/sbin'],
        }
    }

    package { 'prelink':
        ensure      => purged,
    }
  }
}
