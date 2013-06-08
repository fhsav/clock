require 'yaml'

# MongoDB
Mongoid.load!(Padrino.root('.mongoid.yml'))

# Redis
Ohm.connect

# GridFS
CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = Padrino.root('tmp')
  config.cache_dir = 'uploads'
end
