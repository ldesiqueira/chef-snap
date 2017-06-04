name ::File.read(::File.join(::File.dirname(::File.join(__FILE__)), 'NAME')).strip
maintainer 'Luis De Siqueira'
maintainer_email 'louthebrew@jobvite.com'
license 'MIT'
description 'Installs/Configures the snap monitoring framework from Intel'
long_description 'Installs/Configures the snap monitoring framework from Intel'
version ::File.read(::File.join(::File.dirname(::File.join(__FILE__)), 'VERSION')).strip

depends 'poise'
depends 'packagecloud'
depends 'golang'

source_url 'https://github.com/ldesiqueira/chef-snap'
issues_url 'https://github.com/ldesiqueira/chef-snap/issues/new'
