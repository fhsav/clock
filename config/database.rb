require "yaml"

if heroku?
  m = URI.parse(ENV['MONGOHQ_URL'])

  MongoMapper.connection = Mongo::Connection.new(m.host, m.port, :logger => nil)
  MongoMapper.database = m.path.gsub(/^\//, '')
  MongoMapper.database.authenticate(m.user, m.password)


  r = URI.parse(ENV["REDISTOGO_URL"])

  Ohm.connect(:host => r.host, :port => r.port, :password => r.password)
else
  MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, ".mongo.yml"))), PADRINO_ENV, :logger => nil)
  
  Ohm.connect
end
