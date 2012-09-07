require "yaml"

if ENV["MONGOHQ_URL"]
  MongoMapper.config = { PADRINO_ENV => { "uri" => ENV["MONGOHQ_URL"] } }
  MongoMapper.connect(PADRINO_ENV)
else
  MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, ".mongo.yml"))), PADRINO_ENV, :logger => nil)
end

if ENV["REDISTOGO_URL"]
  redis = URI.parse(ENV["REDISTOGO_URL"])

  Ohm.connect(:host => uri.host, :port => uri.port, :password => uri.password)
else
  Ohm.connect
end