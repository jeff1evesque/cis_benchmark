## apparmor_enabled.rb, checks if apparmor is enabled.
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:apparmor_enabled) do
  confine :osfamily => 'Debian'
  setcode do
    Facter::Core::Execution.exec('cat /sys/module/apparmor/parameters/enabled')
  end
end