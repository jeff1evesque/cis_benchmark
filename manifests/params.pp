###
### params.pp: default class parameters.
###
class cis_benchmark::params {
  ## local variables: conditionally load hiera
  ##
  ## Note: yaml keys cannot contain '.', so regsubst() is used. Likewise, the
  ##       corresponding yaml key, implements underscores instead of '.' for
  ##       nodes certificate name.
  ##
  $hiera_node = lookup([
      regsubst($trusted['certname'], '\.', '_', 'G'),
      'trusty64'
  ])
  $stig       = $hiera_node['stig']

    if $hiera {
        $1_1_1_1: $stig['1_1_1_1']
        $1_1_1_2: $stig['1_1_1_2']
        $1_1_1_3: $stig['1_1_1_3']
        $1_1_1_4: $stig['1_1_1_4']
        $1_1_1_5: $stig['1_1_1_5']
        $1_1_1_6: $stig['1_1_1_6']
        $1_1_1_7: $stig['1_1_1_7']
        $1_1_1_8: $stig['1_1_1_8']
        $1_1_21: $stig['1_1_21']
        $1_3_1: $stig['1_3_1']
        $1_3_2: $stig['1_3_2']
        $1_4_1: $stig['1_4_1']
        $1_4_2: $stig['1_4_2']
        $1_4_3: $stig['1_4_3']
        $1_5_1: $stig['1_5_1']
        $1_5_2: $stig['1_5_2']
        $1_5_3: $stig['1_5_3']
        $1_5_4: $stig['1_5_4']
        $1_7_1_1: $stig['1_7_1_1']
        $1_7_1_2: $stig['1_7_1_2']
        $1_7_1_3: $stig['1_7_1_3']
        $1_7_1_4: $stig['1_7_1_4']
        $1_7_1_5: $stig['1_7_1_5']
        $1_7_1_6: $stig['1_7_1_6']
        $1_7_2: $stig['1_7_2']
        $1_8: $stig['1_8']
        $2_1_1: $stig['2_1_1']
        $2_1_2: $stig['2_1_2']
        $2_1_3: $stig['2_1_3']
        $2_1_4: $stig['2_1_4']
        $2_1_5: $stig['2_1_5']
        $2_1_10: $stig['2_1_10']
        $4_1_2: $stig['4_1_2']
        $4_1_4: $stig['4_1_4']
        $4_1_5: $stig['4_1_5']
        $4_1_6: $stig['4_1_6']
        $4_1_7: $stig['4_1_7']
        $4_1_8: $stig['4_1_8']
        $4_1_9: $stig['4_1_9']
        $4_1_10: $stig['4_1_10']
        $4_1_11: $stig['4_1_11']
        $4_1_13: $stig['4_1_13']
        $4_1_15: $stig['4_1_15']
        $4_1_16: $stig['4_1_16']
        $4_1_17: $stig['4_1_17']
        $4_1_18: $stig['4_1_18']
        $4_2_1_1: $stig['4_2_1_1']
        $4_2_1_2: $stig['4_2_1_2']
        $4_2_1_4: $stig['4_2_1_4']
        $4_2_1_5: $stig['4_2_1_5']
        $4_2_2_1: $stig['4_2_2_1']
        $4_2_2_2: $stig['4_2_2_2']
        $4_2_2_3: $stig['4_2_2_3']
        $4_2_2_4: $stig['4_2_2_4']
        $4_2_2_5: $stig['4_2_2_5']
        $4_2_4: $stig['4_2_4']
        $5_1_1: $stig['5_1_1']
        $5_1_2: $stig['5_1_2']
        $5_1_3: $stig['5_1_3']
        $5_1_4: $stig['5_1_4']
        $5_1_5: $stig['5_1_5']
        $5_1_6: $stig['5_1_6']
        $5_1_7: $stig['5_1_7']
        $5_1_8: $stig['5_1_8']
        $5_2_1: $stig['5_2_1']
        $5_2_2: $stig['5_2_2']
        $5_2_3: $stig['5_2_3']
        $5_2_4: $stig['5_2_4']
        $5_2_5: $stig['5_2_5']
        $5_2_6: $stig['5_2_6']
        $5_2_7: $stig['5_2_7']
        $5_2_8: $stig['5_2_8']
        $5_2_9: $stig['5_2_9']
        $5_2_10: $stig['5_2_10']
        $5_2_11: $stig['5_2_11']
        $5_2_12: $stig['5_2_12']
        $5_2_13: $stig['5_2_13']
        $5_3_1: $stig['5_3_1']
        $5_3_2: $stig['5_3_2']
        $5_3_3: $stig['5_3_3']
        $5_3_4: $stig['5_3_4']
        $5_4_1_1: $stig['5_4_1_1']
        $5_4_1_2: $stig['5_4_1_2']
        $5_4_1_3: $stig['5_4_1_3']
        $5_4_1_4: $stig['5_4_1_4']
        $5_4_2: $stig['5_4_2']
        $5_4_3: $stig['5_4_3']
        $5_4_4: $stig['5_4_4']
        $5_5: $stig['5_5']
        $5_6: $stig['5_6']
        $6_1_1: $stig['6_1_1']
        $6_1_2: $stig['6_1_2']
        $6_1_3: $stig['6_1_3']
        $6_1_4: $stig['6_1_4']
        $6_1_5: $stig['6_1_5']
        $6_1_6: $stig['6_1_6']
        $6_1_7: $stig['6_1_7']
        $6_1_8: $stig['6_1_8']
        $6_1_9: $stig['6_1_9']
        $6_1_10: $stig['6_1_10']
        $6_1_11: $stig['6_1_11']
        $6_1_12: $stig['6_1_12']
        $6_1_13: $stig['6_1_13']
        $6_1_14: $stig['6_1_14']
        $6_2_1: $stig['6_2_1']
        $6_2_2: $stig['6_2_2']
        $6_2_3: $stig['6_2_3']
        $6_2_4: $stig['6_2_4']
        $6_2_5: $stig['6_2_5']
        $6_2_6: $stig['6_2_6']
        $6_2_7: $stig['6_2_7']
        $6_2_8: $stig['6_2_8']
        $6_2_9: $stig['6_2_9']
        $6_2_10: $stig['6_2_10']
        $6_2_11: $stig['6_2_11']
        $6_2_12: $stig['6_2_12']
        $6_2_13: $stig['6_2_13']
        $6_2_14: $stig['6_2_14']
        $6_2_15: $stig['6_2_15']
        $6_2_16: $stig['6_2_16']
        $6_2_17: $stig['6_2_17']
        $6_2_18: $stig['6_2_18']
        $6_2_19: $stig['6_2_19']
        $6_2_20: $stig['6_2_20']
    }

    else {
        $1_1_1_1: true
        $1_1_1_2: true
        $1_1_1_3: true
        $1_1_1_4: true
        $1_1_1_5: true
        $1_1_1_6: true
        $1_1_1_7: true
        $1_1_1_8: true
        $1_1_21: true
        $1_3_1: true
        $1_3_2: true
        $1_4_1: true
        $1_4_2: true
        $1_4_3: true
        $1_5_1: true
        $1_5_2: true
        $1_5_3: true
        $1_5_4: true
        $1_7_1_1: true
        $1_7_1_2: true
        $1_7_1_3: true
        $1_7_1_4: true
        $1_7_1_5: true
        $1_7_1_6: true
        $1_7_2: true
        $1_8: true
        $2_1_1: true
        $2_1_2: true
        $2_1_3: true
        $2_1_4: true
        $2_1_5: true
        $2_1_10: true
        $4_1_2: true
        $4_1_4: true
        $4_1_5: true
        $4_1_6: true
        $4_1_7: true
        $4_1_8: true
        $4_1_9: true
        $4_1_10: true
        $4_1_11: true
        $4_1_13: true
        $4_1_15: true
        $4_1_16: true
        $4_1_17: true
        $4_1_18: false
        $4_2_1_1: true
        $4_2_1_2: true
        $4_2_1_4: false
        $4_2_1_5: false
        $4_2_2_1: false
        $4_2_2_2: true
        $4_2_2_3: true
        $4_2_2_4: false
        $4_2_2_5: false
        $4_2_4: true
        $5_1_1: true
        $5_1_2: true
        $5_1_3: true
        $5_1_4: true
        $5_1_5: true
        $5_1_6: true
        $5_1_7: true
        $5_1_8: true
        $5_2_1: true
        $5_2_2: true
        $5_2_3: true
        $5_2_4: true
        $5_2_5: true
        $5_2_6: true
        $5_2_7: true
        $5_2_8: true
        $5_2_9: true
        $5_2_10: true
        $5_2_11: true
        $5_2_12: true
        $5_2_13: true
        $5_3_1: true
        $5_3_2: true
        $5_3_3: true
        $5_3_4: true
        $5_4_1_1: true
        $5_4_1_2: true
        $5_4_1_3: true
        $5_4_1_4: true
        $5_4_2: true
        $5_4_3: true
        $5_4_4: true
        $5_5: true
        $5_6: true
        $6_1_1: true
        $6_1_2: true
        $6_1_3: true
        $6_1_4: true
        $6_1_5: true
        $6_1_6: true
        $6_1_7: true
        $6_1_8: true
        $6_1_9: true
        $6_1_10: true
        $6_1_11: true
        $6_1_12: true
        $6_1_13: true
        $6_1_14: true
        $6_2_1: true
        $6_2_2: true
        $6_2_3: true
        $6_2_4: true
        $6_2_5: true
        $6_2_6: true
        $6_2_7: true
        $6_2_8: true
        $6_2_9: true
        $6_2_10: true
        $6_2_11: true
        $6_2_12: true
        $6_2_13: true
        $6_2_14: true
        $6_2_15: true
        $6_2_16: true
        $6_2_17: true
        $6_2_18: true
        $6_2_19: true
        $6_2_20: true
    }
}
