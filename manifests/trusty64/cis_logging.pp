## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_logging {
  ## include
  include cis::trusty64::logging::auditd_rules
  include cis::trusty64::logging::rsyslog
  include cis::trusty64::logging::syslog_ng

  ## local variables
  $log_dir  = '/var/log'
  $log_perm = '640'

  ## local variables: conditionally load hiera
  $node_reference = $node_name_value
  $hiera_node     = hiera($node_reference, 'trusty64')

  ## local variables: stig items
  $cis_4_2_4 = $hiera_node['cis_4_2_4']

  ## CIS 4.2.4 Ensure permissions on all logfiles are configured (Scored)
  if ($cis_4_2_4) {
    exec { 'enforce-recursive-log-permission':
      command => "find ${log_dir} -type f -exec chmod ${log_perm} {} +",
      path   => ['/bin', '/usr/bin'],
      unless => "find ${log_dir} -type f ! -perm ${log_perm}",
    }
  }
}
