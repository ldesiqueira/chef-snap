include_recipe 'jobvite_snap::common'
git ::File.join node['snap']['go']['source']['directory'], 'snap' do
  repository "#{node['snap']['repo']}snap.git"
end
ruby_block "make snap" do
  block do
    system "/usr/local/go/bin/go get -d github.com/intelsdi-x/snap && cd #{::File.join node['snap']['go']['source']['directory'], 'snap'} && make"
  end
end
plugins = %w{
  snap-plugin-collector-cpu
}
plugins.each do |plugin|
  plugin_dir = ::File.join node['snap']['go']['source']['directory'], plugin
  directory ::File.join node['snap']['go']['source']['directory'], plugin do
    recursive true
  end
  git ::File.join node['snap']['go']['source']['directory'], plugin do
    repository "#{node['snap']['repo']}#{plugin}.git"
  end
  ruby_block "make #{plugin}" do
    block do
      system "cd #{::File.join node['snap']['go']['source']['directory'], plugin} && make"
    end
  end
end
