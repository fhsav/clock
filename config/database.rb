require 'yaml'

# MongoDB
MongoMapper.setup(YAML.load_file(Padrino.root('.mongo.yml')), PADRINO_ENV, :logger => nil)

# Redis
Ohm.connect

# S3
s3 = YAML.load_file(Padrino.root('.s3.yml'))

S3 = Fog::Storage.new({
  :provider => 'AWS',
  :aws_access_key_id => s3['id'],
  :aws_secret_access_key => s3['secret']
})

S3 = S3.directories.create(:key => s3['bucket'], :public => true)

# Pusher
pusher = YAML.load_file(Padrino.root('.pusher.yml'))

Pusher.app_id = pusher['app_id']
Pusher.key = pusher['key']
Pusher.secret = pusher['secret']