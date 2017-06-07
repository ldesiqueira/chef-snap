require 'poise'
require 'chef/resource'
require 'chef/provider'

module Snap
  class Resource < Chef::Resource
    include Poise
    provides  :snap
    actions   :install
    property :name, name_attribute: true, kind_of: String
    property :release
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
  end
end
