## inetd_installed.rb, check if inetd is installed.
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:installed_inetd) do
  confine :osfamily => 'Debian'
  setcode do
    ## bash 'if' like syntax are not valid implementations
    Facter::Core::Execution.exec('dpkg -l inetd > /dev/null 2>&1 && echo "true" || echo "false"')
  end
end