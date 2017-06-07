default['go']['version'] = '1.7'
default['snap']['repo']['base'] = 'https://github.com/intelsdi-x/'
default['snap']['go']['source']['directory'] = ::File.join '/opt', 'go', 'src', 'github.com', 'intelsdi-x'
default['snap']['plugins']['directory'] = ::File.join '/opt', 'snap', 'plugins'
default['snap']['mode'] = 0755
# uncomment or override in order to install the plugins you want
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
