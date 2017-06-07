# include repository for snap from packagecloud
packagecloud_repo 'intelsdi-x/snap' do
  case platform?
  when 'centos'
    type 'rpm'
  when 'rhel'
    type 'rpm'
  when 'ubuntu'
    type 'deb'
  when 'debian'
    type 'deb'
  end
end
