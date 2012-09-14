require "yaml"

if ENV["MONGOHQ_URL"]
  hq = URI.parse(ENV['MONGOHQ_URL'])

  MongoMapper.connection = Mongo::Connection.new(hq.host, hq.port, :logger => nil)
  MongoMapper.database = hq.path.gsub(/^\//, '')
  MongoMapper.database.authenticate(hq.user, hq.password)
else
  MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, ".mongo.yml"))), PADRINO_ENV, :logger => nil)
end

if ENV["REDISTOGO_URL"]
  redis = URI.parse(ENV["REDISTOGO_URL"])

  Ohm.connect(:host => uri.host, :port => uri.port, :password => uri.password)
else
  Ohm.connect
end