source 'https://rubygems.org'

gemspec path: File.expand_path('..', __FILE__)


def dev_gem(name, path: File.join('..', name), github: nil)
  path = File.expand_path(File.join('..', path), __FILE__)
  if File.exist?(path)
    gem name, path: path
  elsif github
    gem name, git: "https://github.com/#{github}.git"
  end
end

dev_gem 'poise-boiler'
dev_gem 'yard'
