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
# install that package
package 'snap-telemetry'
[
  node['snap']['collectors'],
  node['snap']['processors'],
  node['snap']['publishers'],
].each do |plugin_set|
  plugin_set.each do |plugin|
    remote_file ::File.join node['snap']['plugins']['directory'], plugin[:name] do
      if plugin[:release_override]
        source plugin[:release_override]
      else
        source "#{node['snap']['repo']['base']}#{plugin[:name]}/releases/download/#{plugin[:release]}/#{plugin[:name]}_#{plugin[:platform]}"
      end
      mode node['snap']['mode']
    end
  end
end
