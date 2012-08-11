require 'yaml'

MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml'))), PADRINO_ENV, :logger => nil)

Ohm.connect