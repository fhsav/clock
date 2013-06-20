require 'yaml'

# MongoDB
Mongoid.load!(Padrino.root('.mongoid.yml'))

# Redis
if Padrino.env == :production
  Ohm.connect :url => ENV['REDISTOGO_URL']
else
  Ohm.connect
end

# GridFS
CarrierWave.configure do |config|
  config.storage = :grid_fs
  config.root = Padrino.root('tmp')
  config.cache_dir = 'uploads'
end
