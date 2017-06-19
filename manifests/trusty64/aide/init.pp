## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::aide {
  anchor { 'cis::trusty64::aide::begin': } ->
  class  { 'cis::trusty64::aide::install': } ->
  class  { 'cis::trusty64::aide::config': } ~>
  class  { 'cis::trusty64::aide::firstrun': } ->
  class  { 'cis::trusty64::aide::cron': } ->
  anchor { 'cis::trusty64::aide::end': }
}
