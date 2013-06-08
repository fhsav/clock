require 'yaml'

# MongoDB
Mongoid.load!(Padrino.root('.mongoid.yml'))

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
