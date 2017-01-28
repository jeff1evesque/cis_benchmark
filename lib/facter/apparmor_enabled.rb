## apparmor_enabled.rb, checks if apparmor is enabled.
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:apparmor_enabled) do
  confine :osfamily => 'Debian'
  setcode do
    Facter::Core::Execution.exec("if [ -f '/sys/module/apparmor/parameters/enabled' ]; then cat /sys/module/apparmor/parameters/enabled; else echo 'N'; fi")
  end
end