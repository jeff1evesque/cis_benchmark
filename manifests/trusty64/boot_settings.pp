##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::boot_settings {
  ## local variables
  $grub_user     = $::cis_benchmark::grub_user
  $grub_password = $::cis_benchmark::grub_password
  $root_password = $::cis_benchmark::root_password

  ## local variables: stig items
  $1_4_1         = $::cis_benchmark::1_4_1
  $1_4_2         = $::cis_benchmark::1_4_2
  $1_4_3         = $::cis_benchmark::1_4_3

  ## 1.4.1 Ensure permissions on bootloader config are configured (Scored)
  if ($1_4_1) {
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
  if ($1_4_2) {
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
  if ($1_4_3) {
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
