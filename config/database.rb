require 'yaml'

configuration = YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml')))
logger = Logger.new(File.join(PADRINO_ROOT, "log", "mongodb.log"))

if ENV['HEROKU']
  PADRINO_ENV = "heroku"
end

MongoMapper.setup(configuration, PADRINO_ENV, :logger => logger)

Ohm.connect