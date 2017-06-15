## path.rb, return the system "$PATH".
##
## Note: http://wiki.apparmor.net/index.php/AppArmor_Failures#Is_AppArmor_enabled.3F
##

Facter.add(:path) do
  setcode do
    Facter::Core::Execution.exec("echo $PATH")
  end
end