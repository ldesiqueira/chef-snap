require 'poise'
require 'chef/resource'

module Snap
  class Resource < Chef::Resource
    include Poise
    provides  :snap
    actions   :install
    property :user, default: 'root', kind_of: String
    property :group, default: 'root', kind_of: String
    property :mode, default: 0755, kind_of: [Integer, String]
    # defaults to package installation per platform like yum and deb
    # can be :source or :package
    property :installation_method, default: :package, kind_of: Symbol
    # Should you run common setup tasks in the common recipe?
    # Good for when using just the resource in subclassed cookbooks
    #attributes :common, default: true, kind_of: [TrueClass, FalseClass]
    # If installation_method is :source this is where go expects its modules for snap
    property :snap_go_source_directory, default: lazy { node['snap']['go']['source']['directory'] }, kind_of: String
    # directory where snap plugins will be installed such that the agent recognizes them on startup
    property :snap_plugins_directory, default: lazy { node['snap']['plugins']['directory'] }, kind_of: String
  end
end
