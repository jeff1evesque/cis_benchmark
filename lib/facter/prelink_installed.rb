## prelink_installed.rb, check if prelink is installed.

Facter.add(:installed_prelink) do
  confine :osfamily => 'Debian'
  setcode do
    ## bash 'if' like syntax are not valid implementations
    Facter::Core::Execution.exec('dpkg -s prelink | grep "Status: install" > /dev/null && echo "true" || echo "false"')
  end
end
