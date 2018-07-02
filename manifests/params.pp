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
    $hiera_node = lookup([
        regsubst($trusted['certname'], '\.', '_', 'G'),
        'trusty64'
    ])
    $stig      = $hiera_node['stig']
    $account   = $hiera_node['account']
    $report    = $hiera_node['report']
    $suid      = $hiera_node['suid']
    $sgid      = $hiera_node['sgid']
    $wheel     = $hiera_node['wheel']

    if $hiera {
        $1_1_1_1: $stig['1_1_1_1']
        $1_1_1_2: $stig['1_1_1_2']
        $1_1_1_3: $stig['1_1_1_3']
        $1_1_1_4: $stig['1_1_1_4']
        $1_1_1_5: $stig['1_1_1_5']
        $1_1_1_6: $stig['1_1_1_6']
        $1_1_1_7: $stig['1_1_1_7']
        $1_1_1_8: $stig['1_1_1_8']
        $1_1_21: $stig['1_1_21']
        $1_3_1: $stig['1_3_1']
        $1_3_2: $stig['1_3_2']
        $1_4_1: $stig['1_4_1']
        $1_4_2: $stig['1_4_2']
        $1_4_3: $stig['1_4_3']
        $1_5_1: $stig['1_5_1']
        $1_5_2: $stig['1_5_2']
        $1_5_3: $stig['1_5_3']
        $1_5_4: $stig['1_5_4']
        $1_7_1_1: $stig['1_7_1_1']
        $1_7_1_2: $stig['1_7_1_2']
        $1_7_1_3: $stig['1_7_1_3']
        $1_7_1_4: $stig['1_7_1_4']
        $1_7_1_5: $stig['1_7_1_5']
        $1_7_1_6: $stig['1_7_1_6']
        $1_7_2: $stig['1_7_2']
        $1_8: $stig['1_8']
        $2_1_1: $stig['2_1_1']
        $2_1_2: $stig['2_1_2']
        $2_1_3: $stig['2_1_3']
        $2_1_4: $stig['2_1_4']
        $2_1_5: $stig['2_1_5']
        $2_1_10: $stig['2_1_10']
        $4_1_2: $stig['4_1_2']
        $4_1_4: $stig['4_1_4']
        $4_1_5: $stig['4_1_5']
        $4_1_6: $stig['4_1_6']
        $4_1_7: $stig['4_1_7']
        $4_1_8: $stig['4_1_8']
        $4_1_9: $stig['4_1_9']
        $4_1_10: $stig['4_1_10']
        $4_1_11: $stig['4_1_11']
        $4_1_13: $stig['4_1_13']
        $4_1_15: $stig['4_1_15']
        $4_1_16: $stig['4_1_16']
        $4_1_17: $stig['4_1_17']
        $4_1_18: $stig['4_1_18']
        $4_2_1_1: $stig['4_2_1_1']
        $4_2_1_2: $stig['4_2_1_2']
        $4_2_1_4: $stig['4_2_1_4']
        $4_2_1_5: $stig['4_2_1_5']
        $4_2_2_1: $stig['4_2_2_1']
        $4_2_2_2: $stig['4_2_2_2']
        $4_2_2_3: $stig['4_2_2_3']
        $4_2_2_4: $stig['4_2_2_4']
        $4_2_2_5: $stig['4_2_2_5']
        $4_2_4: $stig['4_2_4']
        $5_1_1: $stig['5_1_1']
        $5_1_2: $stig['5_1_2']
        $5_1_3: $stig['5_1_3']
        $5_1_4: $stig['5_1_4']
        $5_1_5: $stig['5_1_5']
        $5_1_6: $stig['5_1_6']
        $5_1_7: $stig['5_1_7']
        $5_1_8: $stig['5_1_8']
        $5_2_1: $stig['5_2_1']
        $5_2_2: $stig['5_2_2']
        $5_2_3: $stig['5_2_3']
        $5_2_4: $stig['5_2_4']
        $5_2_5: $stig['5_2_5']
        $5_2_6: $stig['5_2_6']
        $5_2_7: $stig['5_2_7']
        $5_2_8: $stig['5_2_8']
        $5_2_9: $stig['5_2_9']
        $5_2_10: $stig['5_2_10']
        $5_2_11: $stig['5_2_11']
        $5_2_12: $stig['5_2_12']
        $5_2_13: $stig['5_2_13']
        $5_3_1: $stig['5_3_1']
        $5_3_2: $stig['5_3_2']
        $5_3_3: $stig['5_3_3']
        $5_3_4: $stig['5_3_4']
        $5_4_1_1: $stig['5_4_1_1']
        $5_4_1_2: $stig['5_4_1_2']
        $5_4_1_3: $stig['5_4_1_3']
        $5_4_1_4: $stig['5_4_1_4']
        $5_4_2: $stig['5_4_2']
        $5_4_3: $stig['5_4_3']
        $5_4_4: $stig['5_4_4']
        $5_5: $stig['5_5']
        $5_6: $stig['5_6']
        $6_1_1: $stig['6_1_1']
        $6_1_2: $stig['6_1_2']
        $6_1_3: $stig['6_1_3']
        $6_1_4: $stig['6_1_4']
        $6_1_5: $stig['6_1_5']
        $6_1_6: $stig['6_1_6']
        $6_1_7: $stig['6_1_7']
        $6_1_8: $stig['6_1_8']
        $6_1_9: $stig['6_1_9']
        $6_1_10: $stig['6_1_10']
        $6_1_11: $stig['6_1_11']
        $6_1_12: $stig['6_1_12']
        $6_1_13: $stig['6_1_13']
        $6_1_14: $stig['6_1_14']
        $6_2_1: $stig['6_2_1']
        $6_2_2: $stig['6_2_2']
        $6_2_3: $stig['6_2_3']
        $6_2_4: $stig['6_2_4']
        $6_2_5: $stig['6_2_5']
        $6_2_6: $stig['6_2_6']
        $6_2_7: $stig['6_2_7']
        $6_2_8: $stig['6_2_8']
        $6_2_9: $stig['6_2_9']
        $6_2_10: $stig['6_2_10']
        $6_2_11: $stig['6_2_11']
        $6_2_12: $stig['6_2_12']
        $6_2_13: $stig['6_2_13']
        $6_2_14: $stig['6_2_14']
        $6_2_15: $stig['6_2_15']
        $6_2_16: $stig['6_2_16']
        $6_2_17: $stig['6_2_17']
        $6_2_18: $stig['6_2_18']
        $6_2_19: $stig['6_2_19']
        $6_2_20: $stig['6_2_20']
        $grub_user: $account['grub2']['user']
        $grub_password: $account['grub2']['password']
        $root_password: $account['account']['root']['password']
        $paths: $report['stig']['paths']
        $exec_path: $report['stig']['exec_path']
        $report_path: $report['stig']['report_path']
        $paths: $report['stig']['paths']
        $suid: $suid
        $sgid: $sgid
        $wheel_users: $wheel['users']
        $aide_config: $aide['config_path']
        $aide_path: $aide['aide_path']
        $aide_cron_hour: $aide['aide_cron_hour']
        $aide_cron_minute: $aide['aide_cron_minute']
        $aide_db_path: $aide['aide_db_path']
        $aide_db_temp_path: $aide['aide_db_temp_path']
    }

    else {
        $1_1_1_1: true
        $1_1_1_2: true
        $1_1_1_3: true
        $1_1_1_4: true
        $1_1_1_5: true
        $1_1_1_6: true
        $1_1_1_7: true
        $1_1_1_8: true
        $1_1_21: true
        $1_3_1: true
        $1_3_2: true
        $1_4_1: true
        $1_4_2: true
        $1_4_3: true
        $1_5_1: true
        $1_5_2: true
        $1_5_3: true
        $1_5_4: true
        $1_7_1_1: true
        $1_7_1_2: true
        $1_7_1_3: true
        $1_7_1_4: true
        $1_7_1_5: true
        $1_7_1_6: true
        $1_7_2: true
        $1_8: true
        $2_1_1: true
        $2_1_2: true
        $2_1_3: true
        $2_1_4: true
        $2_1_5: true
        $2_1_10: true
        $4_1_2: true
        $4_1_4: true
        $4_1_5: true
        $4_1_6: true
        $4_1_7: true
        $4_1_8: true
        $4_1_9: true
        $4_1_10: true
        $4_1_11: true
        $4_1_13: true
        $4_1_15: true
        $4_1_16: true
        $4_1_17: true
        $4_1_18: false
        $4_2_1_1: true
        $4_2_1_2: true
        $4_2_1_4: false
        $4_2_1_5: false
        $4_2_2_1: false
        $4_2_2_2: true
        $4_2_2_3: true
        $4_2_2_4: false
        $4_2_2_5: false
        $4_2_4: true
        $5_1_1: true
        $5_1_2: true
        $5_1_3: true
        $5_1_4: true
        $5_1_5: true
        $5_1_6: true
        $5_1_7: true
        $5_1_8: true
        $5_2_1: true
        $5_2_2: true
        $5_2_3: true
        $5_2_4: true
        $5_2_5: true
        $5_2_6: true
        $5_2_7: true
        $5_2_8: true
        $5_2_9: true
        $5_2_10: true
        $5_2_11: true
        $5_2_12: true
        $5_2_13: true
        $5_3_1: true
        $5_3_2: true
        $5_3_3: true
        $5_3_4: true
        $5_4_1_1: true
        $5_4_1_2: true
        $5_4_1_3: true
        $5_4_1_4: true
        $5_4_2: true
        $5_4_3: true
        $5_4_4: true
        $5_5: true
        $5_6: true
        $6_1_1: true
        $6_1_2: true
        $6_1_3: true
        $6_1_4: true
        $6_1_5: true
        $6_1_6: true
        $6_1_7: true
        $6_1_8: true
        $6_1_9: true
        $6_1_10: true
        $6_1_11: true
        $6_1_12: true
        $6_1_13: true
        $6_1_14: true
        $6_2_1: true
        $6_2_2: true
        $6_2_3: true
        $6_2_4: true
        $6_2_5: true
        $6_2_6: true
        $6_2_7: true
        $6_2_8: true
        $6_2_9: true
        $6_2_10: true
        $6_2_11: true
        $6_2_12: true
        $6_2_13: true
        $6_2_14: true
        $6_2_15: true
        $6_2_16: true
        $6_2_17: true
        $6_2_18: true
        $6_2_19: true
        $6_2_20: true
        $grub_user: 'root'
        $grub_password: 'grub.pbkdf2.sha512.10000.F2FD2EE0B11137C1AA614B4610E038E67D925E6AFF3987BB0B9BAC5E0E231B835D1B33FC0999226EEEEBBA7A8308CD4B34EA1AB3B82CD53A1D2AE94BE1D494C3.2CECD078C459898879E2B733A6939E1FE64BEAEFB5C096BD6F1F54D7E0C7F6F2B571CF033876BF5721377735CF1E9044048590CE56ECFFC6F8191980BF908031'
        $root_password: 'password'
        $paths: [
            '/root/cis',
            '/root/cis/trusty64',
            '/root/cis/trusty64/exec',
            '/root/cis/trusty64/report',
        ]
        $exec_path: '/root/cis/trusty64/exec'
        $report_path: '/root/cis/trusty64/report'
        $valid_suid: [
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
        $valid_sgid: [
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
        $wheel_users: ['root']
        $aide_config: '/etc/aide/aide.conf'
        $aide_path: '/usr/bin/aide'
        $aide_cron_hour: 5
        $aide_cron_minute: 0
        $aide_db_path: '/var/lib/aide/aide.db.gz'
        $aide_db_temp_path: '/var/lib/aide/aide.db.new'
    }
}
