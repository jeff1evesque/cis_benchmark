###
### params.pp: default class parameters.
###
class cis_benchmark::params {
    ## local variables: conditionally load hiera
    ##
    ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
    ##       corresponding yaml key, implements underscores instead of '.' for
    ##       nodes certificate name.
    ##
    $hiera_node            = lookup([
        regsubst($trusted['certname'], '\.', '_', 'G'),
        'trusty64',
        'cis_benchmark::trusty64'
    ], 'default_value' => false)

    if $hiera_node {
        $stig              = $hiera_node['stig']
        $aide              = $hiera_node['aide']
        $account           = $hiera_node['account']
        $grub              = $hiera_node['grub2']
        $report            = $hiera_node['report']
        $suid              = $hiera_node['suid']
        $sgid              = $hiera_node['sgid']
        $wheel             = $hiera_node['wheel']
        $package_manager   = $hiera_node['package_manager']

        $cis_1_1_1_1       = $stig['cis_1_1_1_1']
        $cis_1_1_1_2       = $stig['cis_1_1_1_2']
        $cis_1_1_1_3       = $stig['cis_1_1_1_3']
        $cis_1_1_1_4       = $stig['cis_1_1_1_4']
        $cis_1_1_1_5       = $stig['cis_1_1_1_5']
        $cis_1_1_1_6       = $stig['cis_1_1_1_6']
        $cis_1_1_1_7       = $stig['cis_1_1_1_7']
        $cis_1_1_1_8       = $stig['cis_1_1_1_8']
        $cis_1_1_21        = $stig['cis_1_1_21']
        $cis_1_3_1         = $stig['cis_1_3_1']
        $cis_1_3_2         = $stig['cis_1_3_2']
        $cis_1_4_1         = $stig['cis_1_4_1']
        $cis_1_4_2         = $stig['cis_1_4_2']
        $cis_1_4_3         = $stig['cis_1_4_3']
        $cis_1_5_1         = $stig['cis_1_5_1']
        $cis_1_5_2         = $stig['cis_1_5_2']
        $cis_1_5_3         = $stig['cis_1_5_3']
        $cis_1_5_4         = $stig['cis_1_5_4']
        $cis_1_7_1_1       = $stig['cis_1_7_1_1']
        $cis_1_7_1_2       = $stig['cis_1_7_1_2']
        $cis_1_7_1_3       = $stig['cis_1_7_1_3']
        $cis_1_7_1_4       = $stig['cis_1_7_1_4']
        $cis_1_7_1_5       = $stig['cis_1_7_1_5']
        $cis_1_7_1_6       = $stig['cis_1_7_1_6']
        $cis_1_7_2         = $stig['cis_1_7_2']
        $cis_1_8           = $stig['cis_1_8']
        $cis_2_1_1         = $stig['cis_2_1_1']
        $cis_2_1_2         = $stig['cis_2_1_2']
        $cis_2_1_3         = $stig['cis_2_1_3']
        $cis_2_1_4         = $stig['cis_2_1_4']
        $cis_2_1_5         = $stig['cis_2_1_5']
        $cis_2_1_10        = $stig['cis_2_1_10']
        $cis_4_1_2         = $stig['cis_4_1_2']
        $cis_4_1_4         = $stig['cis_4_1_4']
        $cis_4_1_5         = $stig['cis_4_1_5']
        $cis_4_1_6         = $stig['cis_4_1_6']
        $cis_4_1_7         = $stig['cis_4_1_7']
        $cis_4_1_8         = $stig['cis_4_1_8']
        $cis_4_1_9         = $stig['cis_4_1_9']
        $cis_4_1_10        = $stig['cis_4_1_10']
        $cis_4_1_11        = $stig['cis_4_1_11']
        $cis_4_1_13        = $stig['cis_4_1_13']
        $cis_4_1_15        = $stig['cis_4_1_15']
        $cis_4_1_16        = $stig['cis_4_1_16']
        $cis_4_1_17        = $stig['cis_4_1_17']
        $cis_4_1_18        = $stig['cis_4_1_18']
        $cis_4_2_1_1       = $stig['cis_4_2_1_1']
        $cis_4_2_1_2       = $stig['cis_4_2_1_2']
        $cis_4_2_1_4       = $stig['cis_4_2_1_4']
        $cis_4_2_1_5       = $stig['cis_4_2_1_5']
        $cis_4_2_2_1       = $stig['cis_4_2_2_1']
        $cis_4_2_2_2       = $stig['cis_4_2_2_2']
        $cis_4_2_2_3       = $stig['cis_4_2_2_3']
        $cis_4_2_2_4       = $stig['cis_4_2_2_4']
        $cis_4_2_2_5       = $stig['cis_4_2_2_5']
        $cis_4_2_4         = $stig['cis_4_2_4']
        $cis_5_1_1         = $stig['cis_5_1_1']
        $cis_5_1_2         = $stig['cis_5_1_2']
        $cis_5_1_3         = $stig['cis_5_1_3']
        $cis_5_1_4         = $stig['cis_5_1_4']
        $cis_5_1_5         = $stig['cis_5_1_5']
        $cis_5_1_6         = $stig['cis_5_1_6']
        $cis_5_1_7         = $stig['cis_5_1_7']
        $cis_5_1_8         = $stig['cis_5_1_8']
        $cis_5_2_1         = $stig['cis_5_2_1']
        $cis_5_2_2         = $stig['cis_5_2_2']
        $cis_5_2_3         = $stig['cis_5_2_3']
        $cis_5_2_4         = $stig['cis_5_2_4']
        $cis_5_2_5         = $stig['cis_5_2_5']
        $cis_5_2_6         = $stig['cis_5_2_6']
        $cis_5_2_7         = $stig['cis_5_2_7']
        $cis_5_2_8         = $stig['cis_5_2_8']
        $cis_5_2_9         = $stig['cis_5_2_9']
        $cis_5_2_10        = $stig['cis_5_2_10']
        $cis_cis_5_2_11    = $stig['cis_5_2_11']
        $cis_5_2_12        = $stig['cis_5_2_12']
        $cis_5_2_13        = $stig['cis_5_2_13']
        $cis_5_3_1         = $stig['cis_5_3_1']
        $cis_5_3_2         = $stig['cis_5_3_2']
        $cis_5_3_3         = $stig['cis_5_3_3']
        $cis_5_3_4         = $stig['cis_5_3_4']
        $cis_5_4_1_1       = $stig['cis_5_4_1_1']
        $cis_5_4_1_2       = $stig['cis_5_4_1_2']
        $cis_5_4_1_3       = $stig['cis_5_4_1_3']
        $cis_5_4_1_4       = $stig['cis_5_4_1_4']
        $cis_5_4_2         = $stig['cis_5_4_2']
        $cis_5_4_3         = $stig['cis_5_4_3']
        $cis_5_4_4         = $stig['cis_5_4_4']
        $cis_5_5           = $stig['cis_5_5']
        $cis_5_6           = $stig['cis_5_6']
        $cis_6_1_1         = $stig['cis_6_1_1']
        $cis_6_1_2         = $stig['cis_6_1_2']
        $cis_6_1_3         = $stig['cis_6_1_3']
        $cis_6_1_4         = $stig['cis_6_1_4']
        $cis_6_1_5         = $stig['cis_6_1_5']
        $cis_6_1_6         = $stig['cis_6_1_6']
        $cis_6_1_7         = $stig['cis_6_1_7']
        $cis_6_1_8         = $stig['cis_6_1_8']
        $cis_6_1_9         = $stig['cis_6_1_9']
        $cis_6_1_10        = $stig['cis_6_1_10']
        $cis_6_1_11        = $stig['cis_6_1_11']
        $cis_6_1_12        = $stig['cis_6_1_12']
        $cis_6_1_13        = $stig['cis_6_1_13']
        $cis_6_1_14        = $stig['cis_6_1_14']
        $cis_6_2_1         = $stig['cis_6_2_1']
        $cis_6_2_2         = $stig['cis_6_2_2']
        $cis_6_2_3         = $stig['cis_6_2_3']
        $cis_6_2_4         = $stig['cis_6_2_4']
        $cis_6_2_5         = $stig['cis_6_2_5']
        $cis_6_2_6         = $stig['cis_6_2_6']
        $cis_6_2_7         = $stig['cis_6_2_7']
        $cis_6_2_8         = $stig['cis_6_2_8']
        $cis_6_2_9         = $stig['cis_6_2_9']
        $cis_6_2_10        = $stig['cis_6_2_10']
        $cis_6_2_11        = $stig['cis_6_2_11']
        $cis_6_2_12        = $stig['cis_6_2_12']
        $cis_6_2_13        = $stig['cis_6_2_13']
        $cis_6_2_14        = $stig['cis_6_2_14']
        $cis_6_2_15        = $stig['cis_6_2_15']
        $cis_6_2_16        = $stig['cis_6_2_16']
        $cis_6_2_17        = $stig['cis_6_2_17']
        $cis_6_2_18        = $stig['cis_6_2_18']
        $cis_6_2_19        = $stig['cis_6_2_19']
        $cis_6_2_20        = $stig['cis_6_2_20']

        $grub_user         = $grub['user']
        $grub_password     = $grub['password']
        $root_password     = $account['root']['password']
        $paths             = $report['stig']['paths']
        $exec_path         = $report['stig']['exec_path']
        $report_path       = $report['stig']['report_path']
        $wheel_users       = $wheel['users']
        $aide_config       = $aide['config_path']
        $aide_path         = $aide['aide_path']
        $aide_cron_hour    = $aide['cron']['hour']
        $aide_cron_minute  = $aide['cron']['minute']
        $aide_db_path      = $aide['db_path']
        $aide_db_temp_path = $aide['db_temp_path']
        $update_frequency  = $package_manager['update_frequency']
    }

    else {
        $cis_1_1_1_1       = true
        $cis_1_1_1_2       = true
        $cis_1_1_1_3       = true
        $cis_1_1_1_4       = true
        $cis_1_1_1_5       = true
        $cis_1_1_1_6       = true
        $cis_1_1_1_7       = true
        $cis_1_1_1_8       = true
        $cis_1_1_21        = true
        $cis_1_3_1         = true
        $cis_1_3_2         = true
        $cis_1_4_1         = true
        $cis_1_4_2         = true
        $cis_1_4_3         = true
        $cis_1_5_1         = true
        $cis_1_5_2         = true
        $cis_1_5_3         = true
        $cis_1_5_4         = true
        $cis_1_7_1_1       = true
        $cis_1_7_1_2       = true
        $cis_1_7_1_3       = true
        $cis_1_7_1_4       = true
        $cis_1_7_1_5       = true
        $cis_1_7_1_6       = true
        $cis_1_7_2         = false
        $cis_1_8           = true
        $cis_2_1_1         = true
        $cis_2_1_2         = true
        $cis_2_1_3         = true
        $cis_2_1_4         = true
        $cis_2_1_5         = true
        $cis_2_1_10        = true
        $cis_4_1_2         = true
        $cis_4_1_4         = true
        $cis_4_1_5         = true
        $cis_4_1_6         = true
        $cis_4_1_7         = true
        $cis_4_1_8         = true
        $cis_4_1_9         = true
        $cis_4_1_10        = true
        $cis_4_1_11        = true
        $cis_4_1_13        = true
        $cis_4_1_15        = true
        $cis_4_1_16        = true
        $cis_4_1_17        = true
        $cis_4_1_18        = false
        $cis_4_2_1_1       = true
        $cis_4_2_1_2       = true
        $cis_4_2_1_4       = false
        $cis_4_2_1_5       = false
        $cis_4_2_2_1       = false
        $cis_4_2_2_2       = true
        $cis_4_2_2_3       = true
        $cis_4_2_2_4       = false
        $cis_4_2_2_5       = false
        $cis_4_2_4         = true
        $cis_5_1_1         = true
        $cis_5_1_2         = true
        $cis_5_1_3         = true
        $cis_5_1_4         = true
        $cis_5_1_5         = true
        $cis_5_1_6         = true
        $cis_5_1_7         = true
        $cis_5_1_8         = true
        $cis_5_2_1         = true
        $cis_5_2_2         = true
        $cis_5_2_3         = true
        $cis_5_2_4         = true
        $cis_5_2_5         = true
        $cis_5_2_6         = true
        $cis_5_2_7         = true
        $cis_5_2_8         = true
        $cis_5_2_9         = true
        $cis_5_2_10        = true
        $cis_5_2_11        = true
        $cis_5_2_12        = true
        $cis_5_2_13        = true
        $cis_5_3_1         = true
        $cis_5_3_2         = true
        $cis_5_3_3         = true
        $cis_5_3_4         = true
        $cis_5_4_1_1       = true
        $cis_5_4_1_2       = true
        $cis_5_4_1_3       = true
        $cis_5_4_1_4       = true
        $cis_5_4_2         = true
        $cis_5_4_3         = true
        $cis_5_4_4         = true
        $cis_5_5           = true
        $cis_5_6           = true
        $cis_6_1_1         = true
        $cis_6_1_2         = true
        $cis_6_1_3         = true
        $cis_6_1_4         = true
        $cis_6_1_5         = true
        $cis_6_1_6         = true
        $cis_6_1_7         = true
        $cis_6_1_8         = true
        $cis_6_1_9         = true
        $cis_6_1_10        = false
        $cis_6_1_11        = true
        $cis_6_1_12        = true
        $cis_6_1_13        = true
        $cis_6_1_14        = true
        $cis_6_2_1         = true
        $cis_6_2_2         = true
        $cis_6_2_3         = true
        $cis_6_2_4         = true
        $cis_6_2_5         = true
        $cis_6_2_6         = true
        $cis_6_2_7         = true
        $cis_6_2_8         = true
        $cis_6_2_9         = true
        $cis_6_2_10        = true
        $cis_6_2_11        = true
        $cis_6_2_12        = true
        $cis_6_2_13        = true
        $cis_6_2_14        = true
        $cis_6_2_15        = true
        $cis_6_2_16        = true
        $cis_6_2_17        = true
        $cis_6_2_18        = true
        $cis_6_2_19        = true
        $cis_6_2_20        = true

        $grub_user         = 'root'
        $grub_password     = 'grub.pbkdf2.sha512.10000.F2FD2EE0B11137C1AA614B4610E038E67D925E6AFF3987BB0B9BAC5E0E231B835D1B33FC0999226EEEEBBA7A8308CD4B34EA1AB3B82CD53A1D2AE94BE1D494C3.2CECD078C459898879E2B733A6939E1FE64BEAEFB5C096BD6F1F54D7E0C7F6F2B571CF033876BF5721377735CF1E9044048590CE56ECFFC6F8191980BF908031'
        $root_password     = 'password'
        $paths             = [
            '/root/cis',
            '/root/cis/trusty64',
            '/root/cis/trusty64/exec',
            '/root/cis/trusty64/report',
        ]
        $exec_path         = '/root/cis/trusty64/exec'
        $report_path       = '/root/cis/trusty64/report'
        $valid_suid        = [
            '/usr/bin/at',
            '/usr/bin/gpasswd',
            '/usr/bin/chsh',
            '/usr/bin/traceroute6.iputils',
            '/usr/bin/chfn',
            '/usr/bin/pkexec',
            '/usr/bin/mtr',
            '/usr/bin/passwd',
            '/usr/bin/sudo',
            '/usr/bin/newgrp',
            '/usr/sbin/pppd',
            '/usr/sbin/uuidd',
            '/usr/lib/policykit-1/polkit-agent-helper-1',
            '/usr/lib/eject/dmcrypt-get-device',
            '/usr/lib/openssh/ssh-keysign',
            '/usr/lib/dbus-1.0/dbus-daemon-launch-helper',
            '/bin/ping',
            '/bin/fusermount',
            '/bin/umount',
            '/bin/su',
            '/bin/mount',
            '/bin/ping6',
        ]
        $valid_sgid        = [
            '/usr/bin/at',
            '/usr/bin/chage',
            '/usr/bin/dotlockfile',
            '/usr/bin/ssh-agent',
            '/usr/bin/mail-touchlock',
            '/usr/bin/mail-unlock',
            '/usr/bin/mail-lock',
            '/usr/bin/mlocate',
            '/usr/bin/expiry',
            '/usr/bin/screen',
            '/usr/bin/wall',
            '/usr/bin/crontab',
            '/usr/bin/bsd-write',
            '/usr/sbin/uuidd',
            '/sbin/unix_chkpwd',
        ]
        $wheel_users       = ['root']
        $aide_config       = '/etc/aide/aide.conf'
        $aide_path         = '/usr/bin/aide'
        $aide_cron_hour    = 5
        $aide_cron_minute  = 0
        $aide_db_path      = '/var/lib/aide/aide.db.gz'
        $aide_db_temp_path = '/var/lib/aide/aide.db.new'
        $update_frequency  = 'weekly'
    }
}
