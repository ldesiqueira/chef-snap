name ::File.read(::File.join(::File.dirname(::File.join(__FILE__)), 'NAME'))
maintainer 'Luis De Siqueira'
maintainer_email 'louthebrew@jobvite.com'
license 'MIT'
description 'Installs/Configures the snap monitoring framework from Intel'
long_description 'Installs/Configures the snap monitoring framework from Intel'
version ::File.read(::File.join(::File.dirname(::File.join(__FILE__)), 'VERSION'))

depends 'poise'
depends 'packagecloud'
depends 'golang'
