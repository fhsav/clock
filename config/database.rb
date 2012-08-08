require 'yaml'

c = YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml')))

if ENV['HEROKU']
  PADRINO_ENV = "heroku"
end

MongoMapper.setup(c, PADRINO_ENV, :logger => nil)
