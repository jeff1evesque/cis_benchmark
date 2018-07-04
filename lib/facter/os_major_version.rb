## os_major_version.rb, return the operating system version.

Facter.add('os_major_version') do
  setcode do
    Facter.value('operatingsystemrelease').split('.').first
  end
end
