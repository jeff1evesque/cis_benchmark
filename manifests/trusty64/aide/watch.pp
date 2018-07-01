##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

define cis::trusty::aide::watch ( $path = $name,
  $type  = 'regular',
  $rules = undef,
  $order = 50
) {
  include cis::trusty64::aide

  $_rules = any2array($rules)
  $_type = downcase($type)

  validate_absolute_path($path)

  $content = $_type ? {
    'regular' => inline_template("${path} <%= @_rules.join('+') %>\n"),
    'equals'  => inline_template("=${path} <%= @_rules.join('+') %>\n"),
    'exclude' => inline_template("!${path}\n"),
    default   => fail("Type field value ${type} is invalid.  Acceptable values are ['regular', 'equals', 'exclude']")
  }

  concat::fragment { $title:
    target    => 'aide.conf',
    order     => $order,
    content   => $content
  }
}
