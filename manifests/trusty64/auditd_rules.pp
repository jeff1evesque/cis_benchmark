## CIS Ubuntu 14.04 LTS Server Benchmark
## v1.0.0 - 01-07-2015
##
## https://benchmarks.cisecurity.org/tools2/linux/CIS_Ubuntu_14.04_LTS_Server_Benchmark_v1.0.0.pdf
##

class cis::trusty64::auditd_rules {
  ## local variables
  ##
  ## @node_architecture, the following are assumed possible values:
  ##
  ##     - x86_64
  ##     - amd64
  ##     - i386
  ##
  ## Note: https://projects.puppetlabs.com/issues/11511#note-6
  ##
  $node_reference    = $node_name_value
  $node_architecture = $architecture

  ## local variables: conditionally load hiera
  $hiera_node = hiera($node_reference, 'trusty64')

  ## local variables: stig items
  $cis_8_1_4 = $hiera_node['cis_8_1_4']
  $cis_8_1_4 = $hiera_node['cis_8_1_5']
  $cis_8_1_4 = $hiera_node['cis_8_1_6']
  $cis_8_1_4 = $hiera_node['cis_8_1_7']
  $cis_8_1_4 = $hiera_node['cis_8_1_8']
  $cis_8_1_4 = $hiera_node['cis_8_1_9']
  $cis_8_1_4 = $hiera_node['cis_8_1_10']
  $cis_8_1_4 = $hiera_node['cis_8_1_11']
  $cis_8_1_4 = $hiera_node['cis_8_1_13']
  $cis_8_1_4 = $hiera_node['cis_8_1_15']
  $cis_8_1_4 = $hiera_node['cis_8_1_16']
  $cis_8_1_4 = $hiera_node['cis_8_1_17']
  $cis_8_1_4 = $hiera_node['cis_8_1_18']

  ## apply cis rules
  file { '/etc/audit/audit.rules':
    ensure   => present,
    mode     => '0640',
    owner    => 'root',
    template => dos2unix(template('cis/trusty64/audit.rules.erb'))
  }
}