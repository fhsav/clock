require 'yaml'

c = YAML::load(File.open(File.join(PADRINO_ROOT, '.mongo.yml')))

if ENV['MONGOHQ_URL']
  hq = URI.parse(ENV['MONGOHQ_URL'])

  MongoMapper.connection = Mongo::Connection.new(hq.host, hq.port, :logger => nil)
  MongoMapper.database = hq.path.gsub(/^\//, '')
  MongoMapper.database.authenticate(hq.user, hq.password)
else
  MongoMapper.setup(c, PADRINO_ENV, :logger => nil)
end
