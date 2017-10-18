## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::global::cis_modules {
  ## local variables
  $contrib_modules = lookup('modules')['contrib']

  ## install puppet contributed modules
  $contrib_modules = 'puppetlabs-stdlib'
  exec { 'puppet_module_contrib':
      command => "puppet module install ${contrib_modules}",
      unless  => "puppet module list | grep ${contrib_modules}",
      path    => ['/bin', '/opt/puppetlabs/bin']
  }
}
