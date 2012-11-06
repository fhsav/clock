require "yaml"

if heroku?
  m = URI.parse(ENV['MONGOLAB_URI'])

  MongoMapper.connection = Mongo::Connection.new(m.host, m.port, :logger => logger)
  MongoMapper.database = m.path.gsub(/^\//, '')
  MongoMapper.database.authenticate(m.user, m.password)


  r = URI.parse(ENV["REDISTOGO_URL"])

  Ohm.connect(:host => r.host, :port => r.port, :password => r.password)
else
  MongoMapper.setup(YAML::load(File.open(File.join(PADRINO_ROOT, ".mongo.yml"))), PADRINO_ENV, :logger => nil, :slave_ok => true)
  
  Ohm.connect
end

s3 = YAML::load(File.open(File.join(PADRINO_ROOT, ".s3.yml")))

#AWS = S3::Service.new(:access_key_id => s3["id"], :secret_access_key => s3["secret"])
#AWS = AWS.buckets.find("fhsclock")

AWS::S3::Base.establish_connection!(
  :access_key_id     => s3["id"],
  :secret_access_key => s3["secret"]
)

=begin
AWS::S3::S3Object.store(
  "filename.jpg", # name in S3
  fileobj, # actual file
  "fhsclock", # bucket,
  :content_type => "image/jpeg", # content_type, get from sinatra
  :access => :public_read # make it so people can see it
)
=end