lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'snap/version'

Gem::Specification.new do |spec|
  spec.name = 'snap'
  spec.version = Snap::VERSION
  spec.authors = ['Luis De Siqueira']
  spec.email = %w{louthebrew@gmail.com}
  spec.description = 'A Chef cookbook for managing Snap from Intel.'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/ldesiqueira/chef-snap'
  spec.license = 'Apache 2.0'
  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w{lib}
  spec.add_dependency 'halite', '~> 1.1'
  spec.add_dependency 'poise', '~> 2.5'
  spec.add_development_dependency 'poise-boiler', '~> 1.0'
end
