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
