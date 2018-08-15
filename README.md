# cis-benchmark [![Build Status](https://travis-ci.org/jeff1evesque/cis_benchmark.svg?branch=master)](https://travis-ci.org/jeff1evesque/cis_benchmark)

Puppet hardening module premised on cis benchmark. Specific rules can be nested under
the following yaml keys, placed within a yaml file defined by the `hiera.yaml` of the
corresponding puppetserver:

- `[node-certificate]`
- `cis_benchmark`
- `trusty64`

If the yaml key exists, by the name of the nodes certificate (delimited by underscores),
then the corresponding cis rules will take precedence. Otherwise, if the `cis_benchmark`,
or the `trusty64` yaml key exists, it will load respectively.

The following is the Ubuntu 14.04 implementation:

```yaml
cis_benchmark::trusty64:
    stig:
        cis_1_1_1_1: true
        cis_1_1_1_2: true
        cis_1_1_1_3: true
        cis_1_1_1_4: true
        cis_1_1_1_5: true
        cis_1_1_1_6: true
        cis_1_1_1_7: true
        cis_1_1_1_8: true
        cis_1_1_21: true
        cis_1_3_1: true
        cis_1_3_2: true
        cis_1_4_1: true
        cis_1_4_2: true
        cis_1_4_3: true
        cis_1_5_1: true
        cis_1_5_2: true
        cis_1_5_3: true
        cis_1_5_4: true
        cis_1_7_1_1: true
        cis_1_7_1_2: true
        cis_1_7_1_3: true
        cis_1_7_1_4: true
        cis_1_7_1_5: true
        cis_1_7_1_6: true
        cis_1_7_2: true
        cis_1_8: true
        cis_2_1_1: true
        cis_2_1_2: true
        cis_2_1_3: true
        cis_2_1_4: true
        cis_2_1_5: true
        cis_2_1_10: true
        cis_4_1_2: true
        cis_4_1_4: true
        cis_4_1_5: true
        cis_4_1_6: true
        cis_4_1_7: true
        cis_4_1_8: true
        cis_4_1_9: true
        cis_4_1_10: true
        cis_4_1_11: true
        cis_4_1_13: true
        cis_4_1_15: true
        cis_4_1_16: true
        cis_4_1_17: true
        cis_4_1_18: false
        cis_4_2_1_1: true
        cis_4_2_1_2: true
        cis_4_2_1_4: false
        cis_4_2_1_5: false
        cis_4_2_2_1: false
        cis_4_2_2_2: true
        cis_4_2_2_3: true
        cis_4_2_2_4: false
        cis_4_2_2_5: false
        cis_4_2_4: true
        cis_5_1_1: true
        cis_5_1_2: true
        cis_5_1_3: true
        cis_5_1_4: true
        cis_5_1_5: true
        cis_5_1_6: true
        cis_5_1_7: true
        cis_5_1_8: true
        cis_5_2_1: true
        cis_5_2_2: true
        cis_5_2_3: true
        cis_5_2_4: true
        cis_5_2_5: true
        cis_5_2_6: true
        cis_5_2_7: true
        cis_5_2_8: true
        cis_5_2_9: true
        cis_5_2_10: true
        cis_5_2_11: true
        cis_5_2_12: true
        cis_5_2_13: true
        cis_5_3_1: true
        cis_5_3_2: true
        cis_5_3_3: true
        cis_5_3_4: true
        cis_5_4_1_1: true
        cis_5_4_1_2: true
        cis_5_4_1_3: true
        cis_5_4_1_4: true
        cis_5_4_2: true
        cis_5_4_3: true
        cis_5_4_4: true
        cis_5_5: true
        cis_5_6: true
        cis_6_1_1: true
        cis_6_1_2: true
        cis_6_1_3: true
        cis_6_1_4: true
        cis_6_1_5: true
        cis_6_1_6: true
        cis_6_1_7: true
        cis_6_1_8: true
        cis_6_1_9: true
        cis_6_1_10: false
        cis_6_1_11: true
        cis_6_1_12: true
        cis_6_1_13: true
        cis_6_1_14: true
        cis_6_2_1: true
        cis_6_2_2: true
        cis_6_2_3: true
        cis_6_2_4: true
        cis_6_2_5: true
        cis_6_2_6: true
        cis_6_2_7: true
        cis_6_2_8: true
        cis_6_2_9: true
        cis_6_2_10: true
        cis_6_2_11: true
        cis_6_2_12: true
        cis_6_2_13: true
        cis_6_2_14: true
        cis_6_2_15: true
        cis_6_2_16: true
        cis_6_2_17: true
        cis_6_2_18: true
        cis_6_2_19: true
        cis_6_2_20: true
```

Similar rules can be defined directly in the environment's `site.pp`, as an alternative
approach to the hiera implementation:

```puppet
class { 'cis_benchmark':
    cis_1_1_1_1 => true,
    cis_1_1_1_2 => true,
    cis_1_1_1_3 => true,
}
```

**Note:** additional [properties](https://github.com/jeff1evesque/cis_benchmark/blob/e1fe35ddc0d00ae2b09c2a3cf408c4ed3dab3b8d/data/cis_trusty64.yaml#L12-L135)
can be implemented with the above `cis_benchmark` class.

## Puppetfile

The following are module dependencies:

- [`comment_line`](https://forge.puppet.com/geoffwilliams/comment_line) 
- [`multitemplate`](https://forge.puppet.com/deanwilson/multitemplate/types)
- [`apt`](https://forge.puppet.com/puppetlabs/apt)
- [`cron`](https://forge.puppet.com/puppet/cron)
