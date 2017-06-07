require 'poise'
require 'chef/resource'
require 'chef/provider'

module SnapPlugin
  class Resource < Chef::Resource
    include Poise
    provides  :snap_plugin
    actions   :install
    property :home, name_attribute: true
    property :install_method, default: :package, kind_of: Symbol
  end
  class Provider < Chef::Provider
    include Poise
    provides :snap
    def action_install
      case new_resource.install_method
      when :package
        packagecloud_repo 'intelsdi-x/snap' do
          type 'rpm'
        end
        package 'snap-telemetry'
      end
    end
    def action_remove
      case new_resource.install_method
      when :package
        package 'snap-telemetry' do
          action :remove
        end
      end
    end
  end
end
