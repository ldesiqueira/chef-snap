# snap always needs golang
include_recipe 'golang'
directory node['snap']['go']['source']['directory'] do
  recursive true
end
