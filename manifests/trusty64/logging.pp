##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::logging {
  ## local variables
  $log_dir  = '/var/log'
  $log_perm = '640'

  ## local variables: stig items
  $4_2_4    = $::cis_benchmark::4_2_4

  ## CIS 4.2.4 Ensure permissions on all logfiles are configured (Scored)
  if ($4_2_4) {
    exec { 'enforce-recursive-log-permission':
      command => "find ${log_dir} -type f -exec chmod ${log_perm} {} +",
      onlyif  => "find ${log_dir} -type f ! -perm ${log_perm} | grep -z .",
      path    => ['/bin', '/usr/bin'],
    }
  }
}
