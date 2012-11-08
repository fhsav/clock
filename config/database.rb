require "yaml"

if heroku?
  m = URI.parse(ENV['MONGOLAB_URI'])
  r = URI.parse(ENV["REDISTOGO_URL"])

  MongoMapper.connection = Mongo::Connection.new(m.host, m.port, :logger => logger)
  MongoMapper.database = m.path.gsub(/^\//, '')
  MongoMapper.database.authenticate(m.user, m.password)

  Ohm.connect(:host => r.host, :port => r.port, :password => r.password)
else
  MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, ".mongo.yml"))), PADRINO_ENV, :logger => nil, :slave_ok => true)
  
  Ohm.connect
end

S3 = YAML::load(File.open(File.join(PADRINO_ROOT, ".s3.yml")))

if PADRINO_ENV == "test"
  Fog.mock!
end

S3 = Fog::Storage.new({
  :provider => "AWS",
  :aws_access_key_id => S3["id"],
  :aws_secret_access_key => S3["secret"]
})

S3 = S3.directories.create(:key => "fhsclock", :public => true)
