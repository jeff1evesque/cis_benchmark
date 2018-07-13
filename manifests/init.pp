###
### init.pp: apply cis benchmark.
###
class cis_benchmark (
    $cis_1_1_1_1       = $::cis_benchmark::params::cis_1_1_1_1,
    $cis_1_1_1_2       = $::cis_benchmark::params::cis_1_1_1_2,
    $cis_1_1_1_3       = $::cis_benchmark::params::cis_1_1_1_3,
    $cis_1_1_1_4       = $::cis_benchmark::params::cis_1_1_1_4,
    $cis_1_1_1_5       = $::cis_benchmark::params::cis_1_1_1_5,
    $cis_1_1_1_6       = $::cis_benchmark::params::cis_1_1_1_6,
    $cis_1_1_1_7       = $::cis_benchmark::params::cis_1_1_1_7,
    $cis_1_1_1_8       = $::cis_benchmark::params::cis_1_1_1_8,
    $cis_1_1_21        = $::cis_benchmark::params::cis_1_1_21,
    $cis_1_3_1         = $::cis_benchmark::params::cis_1_3_1,
    $cis_1_3_2         = $::cis_benchmark::params::cis_1_3_2,
    $cis_1_4_1         = $::cis_benchmark::params::cis_1_4_1,
    $cis_1_4_2         = $::cis_benchmark::params::cis_1_4_2,
    $cis_1_4_3         = $::cis_benchmark::params::cis_1_4_3,
    $cis_1_5_1         = $::cis_benchmark::params::cis_1_5_1,
    $cis_1_5_2         = $::cis_benchmark::params::cis_1_5_2,
    $cis_1_5_3         = $::cis_benchmark::params::cis_1_5_3,
    $cis_1_5_4         = $::cis_benchmark::params::cis_1_5_4,
    $cis_1_7_1_1       = $::cis_benchmark::params::cis_1_7_1_1,
    $cis_1_7_1_2       = $::cis_benchmark::params::cis_1_7_1_2,
    $cis_1_7_1_3       = $::cis_benchmark::params::cis_1_7_1_3,
    $cis_1_7_1_4       = $::cis_benchmark::params::cis_1_7_1_4,
    $cis_1_7_1_5       = $::cis_benchmark::params::cis_1_7_1_5,
    $cis_1_7_1_6       = $::cis_benchmark::params::cis_1_7_1_6,
    $cis_1_7_2         = $::cis_benchmark::params::cis_1_7_2,
    $cis_1_8           = $::cis_benchmark::params::cis_1_8,
    $cis_2_1_1         = $::cis_benchmark::params::cis_2_1_1,
    $cis_2_1_2         = $::cis_benchmark::params::cis_2_1_2,
    $cis_2_1_3         = $::cis_benchmark::params::cis_2_1_3,
    $cis_2_1_4         = $::cis_benchmark::params::cis_2_1_4,
    $cis_2_1_5         = $::cis_benchmark::params::cis_2_1_5,
    $cis_2_1_10        = $::cis_benchmark::params::cis_2_1_10,
    $cis_4_1_2         = $::cis_benchmark::params::cis_4_1_2,
    $cis_4_1_4         = $::cis_benchmark::params::cis_4_1_4,
    $cis_4_1_5         = $::cis_benchmark::params::cis_4_1_5,
    $cis_4_1_6         = $::cis_benchmark::params::cis_4_1_6,
    $cis_4_1_7         = $::cis_benchmark::params::cis_4_1_7,
    $cis_4_1_8         = $::cis_benchmark::params::cis_4_1_8,
    $cis_4_1_9         = $::cis_benchmark::params::cis_4_1_9,
    $cis_4_1_10        = $::cis_benchmark::params::cis_4_1_10,
    $cis_4_1_11        = $::cis_benchmark::params::cis_4_1_11,
    $cis_4_1_13        = $::cis_benchmark::params::cis_4_1_13,
    $cis_4_1_15        = $::cis_benchmark::params::cis_4_1_15,
    $cis_4_1_16        = $::cis_benchmark::params::cis_4_1_16,
    $cis_4_1_17        = $::cis_benchmark::params::cis_4_1_17,
    $cis_4_1_18        = $::cis_benchmark::params::cis_4_1_18,
    $cis_4_2_1_1       = $::cis_benchmark::params::cis_4_2_1_1,
    $cis_4_2_1_2       = $::cis_benchmark::params::cis_4_2_1_2,
    $cis_4_2_1_4       = $::cis_benchmark::params::cis_4_2_1_4,
    $cis_4_2_1_5       = $::cis_benchmark::params::cis_4_2_1_5,
    $cis_4_2_2_1       = $::cis_benchmark::params::cis_4_2_2_1,
    $cis_4_2_2_2       = $::cis_benchmark::params::cis_4_2_2_2,
    $cis_4_2_2_3       = $::cis_benchmark::params::cis_4_2_2_3,
    $cis_4_2_2_4       = $::cis_benchmark::params::cis_4_2_2_4,
    $cis_4_2_2_5       = $::cis_benchmark::params::cis_4_2_2_5,
    $cis_4_2_4         = $::cis_benchmark::params::cis_4_2_4,
    $cis_5_1_1         = $::cis_benchmark::params::cis_5_1_1,
    $cis_5_1_2         = $::cis_benchmark::params::cis_5_1_2,
    $cis_5_1_3         = $::cis_benchmark::params::cis_5_1_3,
    $cis_5_1_4         = $::cis_benchmark::params::cis_5_1_4,
    $cis_5_1_5         = $::cis_benchmark::params::cis_5_1_5,
    $cis_5_1_6         = $::cis_benchmark::params::cis_5_1_6,
    $cis_5_1_7         = $::cis_benchmark::params::cis_5_1_7,
    $cis_5_1_8         = $::cis_benchmark::params::cis_5_1_8,
    $cis_5_2_1         = $::cis_benchmark::params::cis_5_2_1,
    $cis_5_2_2         = $::cis_benchmark::params::cis_5_2_2,
    $cis_5_2_3         = $::cis_benchmark::params::cis_5_2_3,
    $cis_5_2_4         = $::cis_benchmark::params::cis_5_2_4,
    $cis_5_2_5         = $::cis_benchmark::params::cis_5_2_5,
    $cis_5_2_6         = $::cis_benchmark::params::cis_5_2_6,
    $cis_5_2_7         = $::cis_benchmark::params::cis_5_2_7,
    $cis_5_2_8         = $::cis_benchmark::params::cis_5_2_8,
    $cis_5_2_9         = $::cis_benchmark::params::cis_5_2_9,
    $cis_5_2_10        = $::cis_benchmark::params::cis_5_2_10,
    $cis_5_2_11        = $::cis_benchmark::params::cis_5_2_11,
    $cis_5_2_12        = $::cis_benchmark::params::cis_5_2_12,
    $cis_5_2_13        = $::cis_benchmark::params::cis_5_2_13,
    $cis_5_3_1         = $::cis_benchmark::params::cis_5_3_1,
    $cis_5_3_2         = $::cis_benchmark::params::cis_5_3_2,
    $cis_5_3_3         = $::cis_benchmark::params::cis_5_3_3,
    $cis_5_3_4         = $::cis_benchmark::params::cis_5_3_4,
    $cis_5_4_1_1       = $::cis_benchmark::params::cis_5_4_1_1,
    $cis_5_4_1_2       = $::cis_benchmark::params::cis_5_4_1_2,
    $cis_5_4_1_3       = $::cis_benchmark::params::cis_5_4_1_3,
    $cis_5_4_1_4       = $::cis_benchmark::params::cis_5_4_1_4,
    $cis_5_4_2         = $::cis_benchmark::params::cis_5_4_2,
    $cis_5_4_3         = $::cis_benchmark::params::cis_5_4_3,
    $cis_5_4_4         = $::cis_benchmark::params::cis_5_4_4,
    $cis_5_5           = $::cis_benchmark::params::cis_5_5,
    $cis_5_6           = $::cis_benchmark::params::cis_5_6,
    $cis_6_1_1         = $::cis_benchmark::params::cis_6_1_1,
    $cis_6_1_2         = $::cis_benchmark::params::cis_6_1_2,
    $cis_6_1_3         = $::cis_benchmark::params::cis_6_1_3,
    $cis_6_1_4         = $::cis_benchmark::params::cis_6_1_4,
    $cis_6_1_5         = $::cis_benchmark::params::cis_6_1_5,
    $cis_6_1_6         = $::cis_benchmark::params::cis_6_1_6,
    $cis_6_1_7         = $::cis_benchmark::params::cis_6_1_7,
    $cis_6_1_8         = $::cis_benchmark::params::cis_6_1_8,
    $cis_6_1_9         = $::cis_benchmark::params::cis_6_1_9,
    $cis_6_1_10        = $::cis_benchmark::params::cis_6_1_10,
    $cis_6_1_11        = $::cis_benchmark::params::cis_6_1_11,
    $cis_6_1_12        = $::cis_benchmark::params::cis_6_1_12,
    $cis_6_1_13        = $::cis_benchmark::params::cis_6_1_13,
    $cis_6_1_14        = $::cis_benchmark::params::cis_6_1_14,
    $cis_6_2_1         = $::cis_benchmark::params::cis_6_2_1,
    $cis_6_2_2         = $::cis_benchmark::params::cis_6_2_2,
    $cis_6_2_3         = $::cis_benchmark::params::cis_6_2_3,
    $cis_6_2_4         = $::cis_benchmark::params::cis_6_2_4,
    $cis_6_2_5         = $::cis_benchmark::params::cis_6_2_5,
    $cis_6_2_6         = $::cis_benchmark::params::cis_6_2_6,
    $cis_6_2_7         = $::cis_benchmark::params::cis_6_2_7,
    $cis_6_2_8         = $::cis_benchmark::params::cis_6_2_8,
    $cis_6_2_9         = $::cis_benchmark::params::cis_6_2_9,
    $cis_6_2_10        = $::cis_benchmark::params::cis_6_2_10,
    $cis_6_2_11        = $::cis_benchmark::params::cis_6_2_11,
    $cis_6_2_12        = $::cis_benchmark::params::cis_6_2_12,
    $cis_6_2_13        = $::cis_benchmark::params::cis_6_2_13,
    $cis_6_2_14        = $::cis_benchmark::params::cis_6_2_14,
    $cis_6_2_15        = $::cis_benchmark::params::cis_6_2_15,
    $cis_6_2_16        = $::cis_benchmark::params::cis_6_2_16,
    $cis_6_2_17        = $::cis_benchmark::params::cis_6_2_17,
    $cis_6_2_18        = $::cis_benchmark::params::cis_6_2_18,
    $cis_6_2_19        = $::cis_benchmark::params::cis_6_2_19,
    $cis_6_2_20        = $::cis_benchmark::params::cis_6_2_20,
    $grub_user         = $::cis_benchmark::params::grub_user,
    $grub_password     = $::cis_benchmark::params::grub_password,
    $root_password     = $::cis_benchmark::params::root_password,
    $paths             = $::cis_benchmark::params::paths,
    $exec_path         = $::cis_benchmark::params::exec_path,
    $report_path       = $::cis_benchmark::params::report_path,
    $suid              = $::cis_benchmark::params::suid,
    $sgid              = $::cis_benchmark::params::sgid,
    $wheel_users       = $::cis_benchmark::params::wheel_users,
    $aide_config       = $::cis_benchmark::params::aide_config,
    $aide_path         = $::cis_benchmark::params::aide_path,
    $aide_cron_hour    = $::cis_benchmark::params::aide_cron_hour,
    $aide_cron_minute  = $::cis_benchmark::params::aide_cron_minute,
    $aide_db_path      = $::cis_benchmark::params::aide_db_path,
    $aide_db_temp_path = $::cis_benchmark::params::aide_db_temp_path,
    $update_frequency  = $::cis_benchmark::params::update_frequency,
) inherits ::cis_benchmark::params {
    if (downcase($operatingsystem) == 'centos' and $os_major_version == '7') {

    }
    elsif (
        (downcase($operatingsystem) == 'ubuntu' and $os_major_version == '14') or
        (downcase($operatingsystem) == 'debian' and $os_major_version == '7')
    ) {
        class { 'cis_benchmark::trusty64::apt_get_update': } ->
        class { 'cis_benchmark::trusty64::autofsconf': } ->
        class { 'cis_benchmark::trusty64::banner': } ->
        class { 'cis_benchmark::trusty64::boot_settings': } ->
        class { 'cis_benchmark::trusty64::cron': } ->
        class { 'cis_benchmark::trusty64::dependencies': } ->
        class { 'cis_benchmark::trusty64::filesystem_integrity': }# ->
        class { 'cis_benchmark::trusty64::filesystems': } ->
        class { 'cis_benchmark::trusty64::logging::auditd_rules': } ->
        class { 'cis_benchmark::trusty64::logging::rsyslog': } ->
        class { 'cis_benchmark::trusty64::logging::syslog_ng': } ->
        class { 'cis_benchmark::trusty64::logging': } ->
        class { 'cis_benchmark::trusty64::process_hardening': } ->
        class { 'cis_benchmark::trusty64::ssh': } ->
        class { 'cis_benchmark::trusty64::system_permissions': } ->
        class { 'cis_benchmark::trusty64::user_accounts': } ->
        class { 'cis_benchmark::trusty64::user_settings': } ->
        class { 'cis_benchmark::trusty64::services::inetd': } ->
        class { 'cis_benchmark::trusty64::services::xinetd': } ->
        Class['cis_benchmark']
    }
}
