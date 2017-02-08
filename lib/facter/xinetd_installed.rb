## xinetd_installed.rb,
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:installed_xinetd) do
  confine :osfamily => 'Debian'
  setcode do
    Facter::Core::Execution.exec("if (dpkg -l xinetd > /dev/null 2>&1); then echo 'true'; else echo 'false'; fi")
  end
end