## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

define cis::trusty64::aide::rule ($rules) {
  include cis::trusty64::aide

  $_rules = any2array($rules)

  concat::fragment { $name:
    target  => 'aide.conf',
    order   => 03,
    content => inline_template("${name} = <%= @_rules.join('+') %>\n")
  }
}