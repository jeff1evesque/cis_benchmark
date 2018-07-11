##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis_benchmark::trusty64::logging::auditd_rules {
  ##
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
  $node_architecture = $architecture

  ## local variables: stig items
  $cis_4_1_2         = $::cis_benchmark::cis_4_1_2
  $cis_4_1_4         = $::cis_benchmark::cis_4_1_4
  $cis_4_1_5         = $::cis_benchmark::cis_4_1_5
  $cis_4_1_6         = $::cis_benchmark::cis_4_1_6
  $cis_4_1_7         = $::cis_benchmark::cis_4_1_7
  $cis_4_1_8         = $::cis_benchmark::cis_4_1_8
  $cis_4_1_9         = $::cis_benchmark::cis_4_1_9
  $cis_4_1_10        = $::cis_benchmark::cis_4_1_10
  $cis_4_1_11        = $::cis_benchmark::cis_4_1_11
  $cis_4_1_13        = $::cis_benchmark::cis_4_1_13
  $cis_4_1_15        = $::cis_benchmark::cis_4_1_15
  $cis_4_1_16        = $::cis_benchmark::cis_4_1_16
  $cis_4_1_17        = $::cis_benchmark::cis_4_1_17
  $cis_4_1_18        = $::cis_benchmark::cis_4_1_18

  ## ensure auditd installed
  package { 'auditd':
    ensure           => 'present',
  }

  ## CIS 4.1.2 Ensure auditd service is enabled (Scored)
  if ($cis_4_1_2) {
    service { 'auditd':
      ensure         => true,
      enable         => true,
    }
  }

  ## apply cis stigs
  file { '/etc/audit/audit.rules':
    ensure           => present,
    mode             => '0640',
    owner            => 'root',
    group            => 'root',
    content          => dos2unix(template('cis_benchmark/trusty64/audit.rules.erb')),
    notify           => Service['auditd'],
  }
}
