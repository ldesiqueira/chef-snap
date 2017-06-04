require 'poise'
require 'chef/provider'
module Snap
  class Provider < Chef::Provider
    include Poise
    provides :snap
    def create_packagecloud_repo
      case platform?
      when 'ubuntu'
        packagecloud_repo 'intelsdi-x/snap' do
          type 'deb'
        end
      when 'debian'
        packagecloud_repo 'intelsdi-x/snap' do
          type 'deb'
        end
      when 'centos'
        packagecloud_repo 'intelsdi-x/snap' do
          type 'rpm'
        end
      when 'rhel'
        packagecloud_repo 'intelsdi-x/snap' do
          type 'rpm'
        end
      when 'fedora'
        packagecloud_repo 'intelsdi-x/snap' do
          type 'rpm'
        end
      end
    end
    def create_directories
      [
        new_resource.snap_go_source_directory,
        new_resource.snap_plugins_directory,
      ].each do |dir|
        directory dir do
          recursive true
          owner new_resource.user
          group new_resource.group
          mode new_resource.mode
        end
      end
      yield
    end
    def action_install
      create_directories
      create_packagecloud_repo
      package 'snap-telemetry'
    end
  end
end
