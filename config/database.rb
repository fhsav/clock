require 'yaml'

c = YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml')))

MongoMapper.setup(c, PADRINO_ENV, :logger => nil)

Ohm.connect