require 'yaml'

# MongoDB
Mongoid.load!(Padrino.root('.mongoid.yml'))

# Redis
if Padrino.env == :production
  Ohm.redis = Redic.new(ENV['REDISTOGO_URL'])
else
  Ohm.redis = Redic.new("redis://127.0.0.1:6379")
end

# GridFS
CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = Padrino.root('tmp')
  config.cache_dir = 'uploads'
end
