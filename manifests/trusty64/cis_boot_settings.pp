## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_boot_settings {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node    = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $stig          = $hiera_node['stig']
  $account       = hiera('account')
  $grub_user     = $stig['grub2']['user']
  $grub_password = $stig['grub2']['password']
  $root_password = $stig['account']['root']['password']

  ## local variables: stig items
  $cis_1_4_1     = $stig['cis_1_4_1']
  $cis_1_4_2     = $stig['cis_1_4_2']
  $cis_1_4_3     = $stig['cis_1_4_3']

  ## 1.4.1 Ensure permissions on bootloader config are configured (Scored)
  if ($cis_1_4_1) {
    file { 'file-cis-1-4-1':
        path     => '/boot/grub/grub.cfg',
        owner    => root,
        group    => root,
        mode     => '0700',
    }
  }

  ## 1.4.2 Ensure permissions on bootloader config are configured (Scored)
  ##
  ## Note: the corresponding password can be (re)created as follows:
  ##
  ##       grub-mkpasswd-pbkdf2
  ##       Enter password: <password>
  ##       Reenter password: <password>
  ##       Your PBKDF2 is <encrypted-password>
  ##
  if ($cis_1_4_2) {
    file { 'file-cis-1-4-2':
        content  => dos2unix(template('cis/trusty64/grub_bootloader.erb')),
        path     => '/etc/grub.d/50_bootloader',
        mode     => '0755',
        owner    => root,
        group    => root,
        notify   => Exec['update-grub'],
    }
  }

  ## 1.4.3 Ensure authentication required for single user mode (Scored)
  if ($cis_1_4_3) {
    user { root:
        ensure   => present,
        password => $root_password,
    }
  }

  ## update grub2 configuration
  ##
  ## Note: without the shell provider, the 'basename: not found' error exists.
  ##
  exec { 'update-grub':
    command      => 'update-grub',
    provider     => shell,
    refreshonly  => true,
  }
}
