require 'yaml'

# MongoDB
Mongoid.load!(Padrino.root('.mongoid.yml'))

# Redis
Ohm.redis = Redic.new("redis://127.0.0.1:6379")

# GridFS
CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = Padrino.root('tmp')
  config.cache_dir = 'uploads'
end
