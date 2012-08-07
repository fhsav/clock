require 'yaml'

configuration = YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml')))

if ENV['HEROKU']
  PADRINO_ENV = "heroku"
end

MongoMapper.setup(configuration, PADRINO_ENV, :logger => logger)
