# chef-snap
**The Snap Telemetry Framework Cookbook**

## Getting Started

This cookbook is simple at the moment but gets the job done with it comes to getting up and running with snap on CentOS7 with some basic plugins.
Contributions to the code are welcome.

# Basic Usage

```
include_recipe 'snap'
```

also

```
include_recipe 'snap::default'
```

also in your run_list

```
run_list = [
  'snap'
]
```

# The Recipes

* recipes/packagecloudrepo.rb

This recipe will attempt to only install the repository for yum or deb depending on your platform.  ubuntu/debian/centos/rhel supported through the chef platform? function.

* recipes/package.rb

This recipe will attempt to install the package via the package resource and also loop through the plugin hash declarations which are declared as default attributes below

* recipes/plugins.rb

This recipe will attempt to install plugins listed in the attributes/defaults.rb or that you have declared as an override in chef.

* recipes/default.rb

This recipe currently acts as a hook for recipes/package.rb  and recipes/plugins.rb which makes using the cookbook as a dropin just using 'snap' easier... it makes it a ...snap :-)

* recipes/source.rb

This recipe is in development and will in the future seek to build snap from source, it installs go 1.7 as a dependency which is required for building snap

# Defaults and Overrides
Some basic overrides are available

In the source recipe that is still being worked on, indicate the go source in the golang cookbook that is inherited

```
default['go']['version'] = '1.7'
```

In the source recipe that is still being worked on, indicate the base repository for snap and its plugins

```
default['snap']['repo']['base'] = 'https://github.com/intelsdi-x/'
```

In the source recipe that is still being worked on, indicate the base directory for snap and its plugins
```
default['snap']['go']['source']['directory'] = ::File.join '/opt', 'go', 'src', 'github.com', 'intelsdi-x'
```

The directory where plugin binaries will be deposited for snap, this anticipates the package installation putting snap in /opt/snap
The reason its an overrride is to maintain future functionality with the plugin installation recipe
```
default['snap']['plugins']['directory'] = ::File.join '/opt', 'snap', 'plugins'
```

Default mode for the plugin files and other files in snap, so far only plugins use this
```
default['snap']['mode'] = 0755
```

There are two possible kinds of hashes for plugin installations and they map to the way the snap plugin repositories are currently organized
It seems that Intel has their game together when it comes to being uniform in the publishing of these plugins but the parties they work with... not always so much.
Plugins in the format of...

```
{
    name: 'snap-plugin-collector-df',
    release: '6',
    platform: 'linux_x86_64'
}
```

Mean that according to their release page for that plugin the download string will be sliced accordingly to the name release and platform.
You can view their plugin catalog to see what I mean. --> https://github.com/intelsdi-x/snap/blob/master/docs/PLUGIN_CATALOG.md

If you encounter a plugin made by someone who is not Intel at the moment it seems they use a different release format, for this there is the release_override variable in the hash
```
{
  name: 'snap-plugin-collector-newrelic',
  release_override: 'https://github.com/inteleon/snap-plugin-collector-newrelic/releases/download/v0.0.5/snap-plugin-collector-newrelic-linux-amd64'
}
```

Your mileage may definitely vary with the non-intel plugins but the ones on the list below I have tested and they do indeed install.
# uncomment or override in order to install the plugins you want
```
default['snap']['collectors'] = [
  {
    name: 'snap-plugin-collector-df',
    release: '6',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-cassandra',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-apache',
  #  release: '5',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-ceph',
  #  release: '6',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-cinder',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-couchbase',
  #  release_override: 'https://github.com/Staples-Inc/snap-plugin-collector-couchbase/releases/download/v2.0/snap-plugin-collector-couchbase'
  #},
  {
    name: 'snap-plugin-collector-cpu',
    release: '6',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-dbi',
  #  release: '4',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-collector-disk',
    release: '4',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-collector-docker',
    release: '8',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-collector-elasticsearch',
    release: '4',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-etcd',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-collector-ethtool',
    release: '5',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-collector-facter',
    release: '10',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-glance',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-haproxy',
  #  release: '4',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-influxdb',
  #  release: '7',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-influxdb-data',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-iostat',
  #  release: '6',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-keystone',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-libvirt',
  #  release: '14',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-collector-load',
    release: '3',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-collector-logs',
    release: '4',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-collector-meminfo',
    release: '3',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-mesos-v1-linux-amd64.gz',
  #  release_override: 'https://github.com/intelsdi-x/snap-plugin-collector-mesos/releases/download/v1/snap-plugin-collector-mesos-v1-linux-amd64.gz'
  #},
  #{
  #  name: 'snap-plugin-collector-mongodb',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-mysql',
  #  release: '4',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-neutron',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-newrelic',
  #  release_override: 'https://github.com/inteleon/snap-plugin-collector-newrelic/releases/download/v0.0.5/snap-plugin-collector-newrelic-linux-amd64',
  #},
  #{
  #  name: 'snap-plugin-collector-node-manager',
  #  release: '7',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-nova',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-openfoam',
  #  release: '4',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-osv',
  #  release: '4',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-perfevents',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-collector-processes',
    release: '8',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-psutil',
  #  release: '10',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-rabbitmq',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-scaleio',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-schedstat',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-scsi',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-smart',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-snapstats',
  #  release_override: 'https://github.com/raintank/snap-plugin-collector-snapstats/releases/download/v0.0.1/snap-plugin-collector-snapstats'
  #},
  #{
  #  name: 'snap-plugin-collector-snmp',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-collector-use',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-collector-users',
    release: '2',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-collector-yarn',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #}
]
default['snap']['processors'] = [
  {
    name: 'snap-plugin-processor-anomalydetection',
    release: '1',
    platform: 'linux_x86_64'
  },
  {
    name: 'snap-plugin-processor-change-detector',
    release: '1',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-processor-logs-openstack',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-logs-regexp',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-movingaverage',
  #  release: '7',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-statistics',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-tag',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-tags-filter',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-processor-threshold',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #}
]
default['snap']['publishers'] = [
  #{
  #  name: 'snap-plugin-publisher-cassandra',
  #  release: '6',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-circonus',
  #  release_override: 'https://github.com/circonus-labs/snap-plugin-publisher-circonus/releases/download/1.0.0/snap-plugin-publisher-circonus.linux.x86_64.gz'
  #},
  #{
  #  name: 'snap-plugin-publisher-cloudwatch',
  #  release_override: 'https://github.com/Ticketmaster/snap-plugin-publisher-cloudwatch/archive/1.tar.gz'
  #},
  #{
  #  name: 'snap-plugin-publisher-elasticsearch',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-etcd',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  {
    name: 'snap-plugin-publisher-file',
    release: '2',
    platform: 'linux_x86_64'
  },
  #{
  #  name: 'snap-plugin-publisher-graphite',
  #  release: '6',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-hana',
  #  release: '6',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-heapster',
  #  release: '1',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-heka',
  #  release: '3',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-influxdb',
  #  release: '22',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-kafka',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-kairosdb',
  #  release: '2',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-mysql',
  #  release: '8',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-opentsdb',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-postgresql',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-RabbitMQ',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #},
  #{
  #  name: 'snap-plugin-publisher-riemann',
  #  release: '9',
  #  platform: 'linux_x86_64'
  #}
]
```


There is a lot more work to be done especially as snap evolves but this chef code got me going through some examples!
