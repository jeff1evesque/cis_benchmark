###
### init.pp: apply cis benchmark.
###
class cis_benchmark (
    $1_1_1_1           = $::cis_benchmark::params::1_1_1_1,
    $1_1_1_2           = $::cis_benchmark::params::1_1_1_2,
    $1_1_1_3           = $::cis_benchmark::params::1_1_1_3,
    $1_1_1_4           = $::cis_benchmark::params::1_1_1_4,
    $1_1_1_5           = $::cis_benchmark::params::1_1_1_5,
    $1_1_1_6           = $::cis_benchmark::params::1_1_1_6,
    $1_1_1_7           = $::cis_benchmark::params::1_1_1_7,
    $1_1_1_8           = $::cis_benchmark::params::1_1_1_8,
    $1_1_21            = $::cis_benchmark::params::1_1_21,
    $1_3_1             = $::cis_benchmark::params::1_3_1,
    $1_3_2             = $::cis_benchmark::params::1_3_2,
    $1_4_1             = $::cis_benchmark::params::1_4_1,
    $1_4_2             = $::cis_benchmark::params::1_4_2,
    $1_4_3             = $::cis_benchmark::params::1_4_3,
    $1_5_1             = $::cis_benchmark::params::1_5_1,
    $1_5_2             = $::cis_benchmark::params::1_5_2,
    $1_5_3             = $::cis_benchmark::params::1_5_3,
    $1_5_4             = $::cis_benchmark::params::1_5_4,
    $1_7_1_1           = $::cis_benchmark::params::1_7_1_1,
    $1_7_1_2           = $::cis_benchmark::params::1_7_1_2,
    $1_7_1_3           = $::cis_benchmark::params::1_7_1_3,
    $1_7_1_4           = $::cis_benchmark::params::1_7_1_4,
    $1_7_1_5           = $::cis_benchmark::params::1_7_1_5,
    $1_7_1_6           = $::cis_benchmark::params::1_7_1_6,
    $1_7_2             = $::cis_benchmark::params::1_7_2,
    $1_8               = $::cis_benchmark::params::1_8,
    $2_1_1             = $::cis_benchmark::params::2_1_1,
    $2_1_2             = $::cis_benchmark::params::2_1_2,
    $2_1_3             = $::cis_benchmark::params::2_1_3,
    $2_1_4             = $::cis_benchmark::params::2_1_4,
    $2_1_5             = $::cis_benchmark::params::2_1_5,
    $2_1_10            = $::cis_benchmark::params::2_1_10,
    $4_1_2             = $::cis_benchmark::params::4_1_2,
    $4_1_4             = $::cis_benchmark::params::4_1_4,
    $4_1_5             = $::cis_benchmark::params::4_1_5,
    $4_1_6             = $::cis_benchmark::params::4_1_6,
    $4_1_7             = $::cis_benchmark::params::4_1_7,
    $4_1_8             = $::cis_benchmark::params::4_1_8,
    $4_1_9             = $::cis_benchmark::params::4_1_9,
    $4_1_10            = $::cis_benchmark::params::4_1_10,
    $4_1_11            = $::cis_benchmark::params::4_1_11,
    $4_1_13            = $::cis_benchmark::params::4_1_13,
    $4_1_15            = $::cis_benchmark::params::4_1_15,
    $4_1_16            = $::cis_benchmark::params::4_1_16,
    $4_1_17            = $::cis_benchmark::params::4_1_17,
    $4_1_18            = $::cis_benchmark::params::4_1_18,
    $4_2_1_1           = $::cis_benchmark::params::4_2_1_1,
    $4_2_1_2           = $::cis_benchmark::params::4_2_1_2,
    $4_2_1_4           = $::cis_benchmark::params::4_2_1_4,
    $4_2_1_5           = $::cis_benchmark::params::4_2_1_5,
    $4_2_2_1           = $::cis_benchmark::params::4_2_2_1,
    $4_2_2_2           = $::cis_benchmark::params::4_2_2_2,
    $4_2_2_3           = $::cis_benchmark::params::4_2_2_3,
    $4_2_2_4           = $::cis_benchmark::params::4_2_2_4,
    $4_2_2_5           = $::cis_benchmark::params::4_2_2_5,
    $4_2_4             = $::cis_benchmark::params::4_2_4,
    $5_1_1             = $::cis_benchmark::params::5_1_1,
    $5_1_2             = $::cis_benchmark::params::5_1_2,
    $5_1_3             = $::cis_benchmark::params::5_1_3,
    $5_1_4             = $::cis_benchmark::params::5_1_4,
    $5_1_5             = $::cis_benchmark::params::5_1_5,
    $5_1_6             = $::cis_benchmark::params::5_1_6,
    $5_1_7             = $::cis_benchmark::params::5_1_7,
    $5_1_8             = $::cis_benchmark::params::5_1_8,
    $5_2_1             = $::cis_benchmark::params::5_2_1,
    $5_2_2             = $::cis_benchmark::params::5_2_2,
    $5_2_3             = $::cis_benchmark::params::5_2_3,
    $5_2_4             = $::cis_benchmark::params::5_2_4,
    $5_2_5             = $::cis_benchmark::params::5_2_5,
    $5_2_6             = $::cis_benchmark::params::5_2_6,
    $5_2_7             = $::cis_benchmark::params::5_2_7,
    $5_2_8             = $::cis_benchmark::params::5_2_8,
    $5_2_9             = $::cis_benchmark::params::5_2_9,
    $5_2_10            = $::cis_benchmark::params::5_2_10,
    $5_2_11            = $::cis_benchmark::params::5_2_11,
    $5_2_12            = $::cis_benchmark::params::5_2_12,
    $5_2_13            = $::cis_benchmark::params::5_2_13,
    $5_3_1             = $::cis_benchmark::params::5_3_1,
    $5_3_2             = $::cis_benchmark::params::5_3_2,
    $5_3_3             = $::cis_benchmark::params::5_3_3,
    $5_3_4             = $::cis_benchmark::params::5_3_4,
    $5_4_1_1           = $::cis_benchmark::params::5_4_1_1,
    $5_4_1_2           = $::cis_benchmark::params::5_4_1_2,
    $5_4_1_3           = $::cis_benchmark::params::5_4_1_3,
    $5_4_1_4           = $::cis_benchmark::params::5_4_1_4,
    $5_4_2             = $::cis_benchmark::params::5_4_2,
    $5_4_3             = $::cis_benchmark::params::5_4_3,
    $5_4_4             = $::cis_benchmark::params::5_4_4,
    $5_5               = $::cis_benchmark::params::5_5,
    $5_6               = $::cis_benchmark::params::5_6,
    $6_1_1             = $::cis_benchmark::params::6_1_1,
    $6_1_2             = $::cis_benchmark::params::6_1_2,
    $6_1_3             = $::cis_benchmark::params::6_1_3,
    $6_1_4             = $::cis_benchmark::params::6_1_4,
    $6_1_5             = $::cis_benchmark::params::6_1_5,
    $6_1_6             = $::cis_benchmark::params::6_1_6,
    $6_1_7             = $::cis_benchmark::params::6_1_7,
    $6_1_8             = $::cis_benchmark::params::6_1_8,
    $6_1_9             = $::cis_benchmark::params::6_1_9,
    $6_1_10            = $::cis_benchmark::params::6_1_10,
    $6_1_11            = $::cis_benchmark::params::6_1_11,
    $6_1_12            = $::cis_benchmark::params::6_1_12,
    $6_1_13            = $::cis_benchmark::params::6_1_13,
    $6_1_14            = $::cis_benchmark::params::6_1_14,
    $6_2_1             = $::cis_benchmark::params::6_2_1,
    $6_2_2             = $::cis_benchmark::params::6_2_2,
    $6_2_3             = $::cis_benchmark::params::6_2_3,
    $6_2_4             = $::cis_benchmark::params::6_2_4,
    $6_2_5             = $::cis_benchmark::params::6_2_5,
    $6_2_6             = $::cis_benchmark::params::6_2_6,
    $6_2_7             = $::cis_benchmark::params::6_2_7,
    $6_2_8             = $::cis_benchmark::params::6_2_8,
    $6_2_9             = $::cis_benchmark::params::6_2_9,
    $6_2_10            = $::cis_benchmark::params::6_2_10,
    $6_2_11            = $::cis_benchmark::params::6_2_11,
    $6_2_12            = $::cis_benchmark::params::6_2_12,
    $6_2_13            = $::cis_benchmark::params::6_2_13,
    $6_2_14            = $::cis_benchmark::params::6_2_14,
    $6_2_15            = $::cis_benchmark::params::6_2_15,
    $6_2_16            = $::cis_benchmark::params::6_2_16,
    $6_2_17            = $::cis_benchmark::params::6_2_17,
    $6_2_18            = $::cis_benchmark::params::6_2_18,
    $6_2_19            = $::cis_benchmark::params::6_2_19,
    $6_2_20            = $::cis_benchmark::params::6_2_20,
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
) inherits ::cis_benchmark::params {
    class { 'cis_benchmark::trusty64::autofsconf': } ->
    class { 'cis_benchmark::trusty64::banner': } ->
    class { 'cis_benchmark::trusty64::boot_settings': } ->
    class { 'cis_benchmark::trusty64::cron': } ->
    class { 'cis_benchmark::trusty64::dependencies': } ->
    class { 'cis_benchmark::trusty64::filesystem_dependency': } ->
    class { 'cis_benchmark::trusty64::filesystem': } ->
    class { 'cis::trusty64::logging::auditd_rules': } ->
    class { 'cis::trusty64::logging::rsyslog': } ->
    class { 'cis::trusty64::logging::syslog_ng': } ->
    class { 'cis::trusty64::logging::logging': } ->
    class { 'cis::trusty64::logging': } ->
    class { 'cis::trusty64::process_hardening': } ->
    class { 'cis::trusty64::process_hardening': } ->
    class { 'cis::trusty64::ssh': } ->
    class { 'cis::trusty64::system_permissions': } ->
    class { 'cis::trusty64::user_accounts': } ->
    class { 'cis::trusty64::user_settings': } ->
    class { 'cis::trusty64::aide::config': } ->
    class { 'cis::trusty64::aide::cron': } ->
    class { 'cis::trusty64::aide::firstrun': } ->
    class { 'cis::trusty64::aide::install': } ->
    class { 'cis::trusty64::logging::auditd_rules': } ->
    class { 'cis::trusty64::logging::rsyslog': } ->
    class { 'cis::trusty64::logging::syslog_ng': } ->
    class { 'cis::trusty64::services::inetd': } ->
    class { 'cis::trusty64::services': } ->
    Class['cis_benchmark']
}
