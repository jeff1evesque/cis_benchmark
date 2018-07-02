##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::filesystem_integrity {
  include cis::trusty64::dependencies

  ## local variables: stig items
  $exec_path   = $::cis_benchmark::exec_path
  $report_path = $::cis_benchmark::report_path
  $1_3_1       = $::cis_benchmark::1_3_1

  ## 1.3.1 Ensure AIDE is installed (Scored)
  ## 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
  ##
  ## Note: if 1.3.2 is enabled, then the below will remediate the latter.
  ##
  if ($1_3_1) {
    aide::watch { 'aide-cis-1-3-1':
        path   => '/',
        rules  => 'R'
    }
  }
}
