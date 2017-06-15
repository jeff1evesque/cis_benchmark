## homeless_users.rb, check if users defined in the '/etc/passwd', have
##     corresponding home directories.
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:homeless_users) do
  confine :osfamily => 'Debian'
  setcode do
    ## debugging: the following was tested in this fact
    ##
    ## works:   cmd = 'echo "here it is"'
    ## fails:   cmd = 'TEMP="here it is"; echo "$TEMP"'
    ## fails:   cmd = 'TEMP="here it is" | echo "$TEMP"'
    ## works:   cmd = 'echo "here it is" | cat'
    ## works:   cmd = 'bash -c \'TEMP="blah"; echo $TEMP\''
    ## works:   cmd = 'bash -c "TEMP=\$(cat /etc/passwd | awk -F: '{print \$1}'); echo \$TEMP"'
    ##

    ## users with no home directory
    cmd = 'bash -c '\
          '"TEMP=(\$(cat /etc/passwd | awk -F: \'{'\
              'if (\$1 != \"nobody\" && \$1 != \"nfsnobody\" \$3 >= 1000 && system(\" [ ! -d \" \$6 \" ]\")) {'\
                  'print \$1'\
              '}'\
          "}')); "\
          'echo \${TEMP[*]}"'
    Facter::Core::Execution.execute(cmd)
  end
end