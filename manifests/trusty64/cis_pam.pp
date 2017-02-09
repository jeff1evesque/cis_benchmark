## CIS Ubuntu 14.04 LTS Server Benchmark
## v2.0.0 - 09-30-2016 
##
## https://github.com/jeff1evesque/machine-learning/files/629747/CIS_Ubuntu_Linux_14.04_LTS_Benchmark_v2.0.0.pdf
##

class cis::trusty64::cis_pam {
  ## local variables: conditionally load hiera
  $node_reference = $node_name_value
  $hiera_node     = hiera($node_reference, 'trusty64')

  ## local variables: stig items
  $cis_5_3_1 = $hiera_node['cis_5_3_1']
  $cis_5_3_2 = $hiera_node['cis_5_3_2']
  $cis_5_3_3 = $hiera_node['cis_5_3_3']
  $cis_5_3_4 = $hiera_node['cis_5_3_4']

  ## ensure openssh-server
  service { 'ssh':
    ensure  => true,
    enable  => true,
    require => Package['openssh-server'],
  }

  ## docstring for configuration files
  $docstring = [
    '##',
    '## CIS Ubuntu 14.04 LTS Server Benchmark',
    '## v2.0.0 - 09-30-2016',
    '##',
    '## Description: this file is enforced by puppet.',
    '##',
  ]

  ## CIS 5.3.1 Ensure password creation requirements are configured (Scored)
  if ($cis_5_3_1) {
    package { 'libpam-pwquality':
      ensure => 'installed',
    }

    file_line { 'common_password_docstring':
      path  => '/etc/pam.d/common-password',
      line  => $docstring,
      after => '#',
    }

    file_line { 'cis_5_3_1_common_password':
      path  => '/etc/pam.d/common-password',
      line  => 'password requisite pam_pwquality.so try_first_pass retry=3',
      match => '^password[[:space:]]*requisite[[:space:]]*pam_pwquality.so[[:space:]]*(try_first_pass)?[[:space:]]*retry=*(?!3\b)\S+$',
    }

    file_line { 'pwquality_docstring':
      path  => '/etc/security/pwquality.conf',
      line  => $docstring,
      after => '#',
    }

    file_line { 'cis_5_3_1_pwquality':
      path  => '/etc/security/pwquality.conf',
      line  => 'minlen=14',
      match => '^(#)?[[:space:]]*minlen[[:space:]]*=[[:space:]]*(?!14\b)\S+$',
    }

    file_line { 'cis_5_3_1_dcredit':
      path  => '/etc/security/pwquality.conf',
      line  => 'dcredit=-1',
      match => '^(#)?[[:space:]]*dcredit[[:space:]]*=[[:space:]]*(?!-1\b)\S+$',
    }

    file_line { 'cis_5_3_1_ucredit':
      path  => '/etc/security/pwquality.conf',
      line  => 'ucredit=-1',
      match => '^(#)?[[:space:]]*ucredit[[:space:]]*=[[:space:]]*(?!-1\b)\S+$',
    }

    file_line { 'cis_5_3_1_ocredit':
      path  => '/etc/security/pwquality.conf',
      line  => 'ocredit=-1',
      match => '^(#)?[[:space:]]*ocredit[[:space:]]*=[[:space:]]*(?!-1\b)\S+$',
    }

    file_line { 'cis_5_3_1_lcredit':
      path  => '/etc/security/pwquality.conf',
      line  => 'lcredit=-1',
      match => '^(#)?[[:space:]]*lcredit[[:space:]]*=[[:space:]]*(?!-1\b)\S+$',
    }
  }

  ## CIS 5.3.2 Ensure lockout for failed password attempts is configured (Not Scored)
  if ($cis_5_3_2) {
    file_line { 'common_auth_docstring':
      path  => '/etc/pam.d/common-auth',
      line  => $docstring,
      after => '#',
    }

    file_line { 'cis_5_3_2_common_auth':
      path  => '/etc/security/pwquality.conf',
      line  => 'auth required pam_tally2.so onerr=fail audit silent deny=5 unlock_time=900',
      match => '^auth[[:space:]]*required[[:space:]]*pam_tally2.so[[:space:]]*onerr=fail[[:space:]]*audit[[:space:]]*silent[[:space:]]*deny=(?!5\b)\S+[[:space:]]*unlock_time=(?!900\b)\d+',
    }
  }

  ## CIS 5.3.3 Ensure password reuse is limited (Scored)
  if ($cis_5_3_3) {
    file_line { 'common_password_docstring':
      path  => '/etc/pam.d/common-password',
      line  => $docstring,
      after => '#',
    }

    file_line { 'cis_5_3_3_password_reuse':
      path  => '/etc/pam.d/common-password',
      line  => 'password sufficient pam_unix.so remember=5',
      match => '^password[[:space:]]*sufficient[[:space:]]*pam_unix.so[[:space:]]*remember=(?!5\b)\S+$',
    }
  }

  ## CIS 5.3.4 Ensure password hashing algorithm is SHA-512 (Scored)
  if ($cis_5_3_4) {
    file_line { 'hashing_algorithm_docstring':
      path  => '/etc/pam.d/common-password',
      line  => $docstring,
      after => '#',
    }

    file_line { 'cis_5_3_4_hash_algorithm':
      path  => '/etc/pam.d/common-password',
      line  => 'password [success=1 default=ignore] pam_unix.so sha512',
      match => '^password[[:space:]]*\[success=(?!1\b)\S+[[:space:]]*default=ignore\][[:space:]]*pam_unix.so[[:space:]]*sha512',
    }
  }
}
