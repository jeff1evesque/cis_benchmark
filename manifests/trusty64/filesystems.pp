##
## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::filesystems {
  ## local variables: stig items
  $1_1_1_1       = $::cis_benchmark::1_1_1_1
  $1_1_1_2       = $::cis_benchmark::1_1_1_2
  $1_1_1_3       = $::cis_benchmark::1_1_1_3
  $1_1_1_4       = $::cis_benchmark::1_1_1_4
  $1_1_1_5       = $::cis_benchmark::1_1_1_5
  $1_1_1_6       = $::cis_benchmark::1_1_1_6
  $1_1_1_7       = $::cis_benchmark::1_1_1_7
  $1_1_1_8       = $::cis_benchmark::1_1_1_8

  ## 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
  ## 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
  ## 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
  ## 1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
  ## 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
  ## 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
  ## 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
  ## 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)
  ##
  if (
      $1_1_1_1 or
      $1_1_1_2 or
      $1_1_1_3 or
      $1_1_1_4 or
      $1_1_1_5 or
      $1_1_1_6 or
      $1_1_1_7 or
      $1_1_1_8
  ) {
    file { 'file-cis-1-1-1':
        content  => dos2unix(template('cis/trusty64/CIS.conf.erb')),
        path     => '/etc/modprobe.d/CIS.conf',
        mode     => '0644',
        owner    => root,
        group    => root,
    }
  }
}
