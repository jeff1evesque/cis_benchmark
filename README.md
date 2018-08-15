# cis-benchmark [![Build Status](https://travis-ci.org/jeff1evesque/cis_benchmark.svg?branch=master)](https://travis-ci.org/jeff1evesque/cis_benchmark)

Puppet hardening module premised on [cis benchmark](https://www.cisecurity.org/cis-benchmarks/).

## Dependencies

The following modules need to be implemented within the `Puppetfile`:

- [`comment_line`](https://forge.puppet.com/geoffwilliams/comment_line) 
- [`multitemplate`](https://forge.puppet.com/deanwilson/multitemplate/types)
- [`apt`](https://forge.puppet.com/puppetlabs/apt)
- [`cron`](https://forge.puppet.com/puppet/cron)

## Execution

Specific rules can be nested under the following [yaml keys](https://github.com/jeff1evesque/cis_benchmark/blob/a8e94846d048cf8b500886333a4babb9c14cf8ed/manifests/params.pp#L11-L15),
of a yaml file defined from the `hiera.yaml`, of the corresponding puppetserver:

- `[node-certificate]`
- `cis_benchmark`
- `trusty64`

If the yaml key exists, by the name of the nodes certificate (delimited by underscores),
then the corresponding cis rules will take precedence. Otherwise, if the `cis_benchmark`,
or the `trusty64` yaml key exists, it will load the respective rules.

The following is the [Ubuntu 14.04](http://releases.ubuntu.com/14.04/) implementation:

```yaml
cis_benchmark::trusty64:
    stig:
        cis_1_1_1_1: true
        cis_1_1_1_2: true
        cis_1_1_1_3: true
```

**Note:** the [`params.pp`](https://github.com/jeff1evesque/cis_benchmark/blob/master/manifests/params.pp)
can be further reviewed in order to override default cis rules.

Similar rules can be defined directly in the environment's `site.pp`, as an alternative
approach to the hiera implementation:

```puppet
class { 'cis_benchmark':
    cis_1_1_1_1 => true,
    cis_1_1_1_2 => true,
    cis_1_1_1_3 => true,
}
```

**Note:** the [`params.pp`](https://github.com/jeff1evesque/cis_benchmark/blob/master/manifests/params.pp)
can be further reviewed in order to override default cis rules.
