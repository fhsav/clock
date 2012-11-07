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

S3 = File.join(PADRINO_ROOT, ".s3.yml")

if File.exist?(S3)
  S3 = YAML::load(File.open(S3))

  AWS::S3::Base.establish_connection!(
    :access_key_id     => S3["id"],
    :secret_access_key => S3["secret"]
  )
else
  AWS::S3::Base.establish_connection!(
    :access_key_id => ENV['S3_ID'],
    :secret_access_key => ENV['S3_SECRET']
  )
end