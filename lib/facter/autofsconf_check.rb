Facter.add(:isfile_autofsconf) do
  setcode do
      File.file?('/etc/init/autofs.conf')
  end
end
