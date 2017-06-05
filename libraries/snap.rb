require 'poise'
require 'chef/resource'
require 'chef/provider'

module Elasticsearch
  class Resource < Chef::Resource
    include Poise
    provides  :elasticsearch
    actions   :install
  end
  class Provider < Chef::Provider
    include Poise
    provides :elasticsearch
      nil
    end
  end
end
