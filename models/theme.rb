require "yaml"

Fog.mock!

S3 = YAML::load(File.open(File.join(PADRINO_ROOT, ".s3.yml")))

S3 = Fog::Storage.new({
  :provider => "AWS",
  :aws_access_key_id => S3["id"],
  :aws_secret_access_key => S3["secret"]
})

S3 = S3.directories.create({
  :key => "fhsclock",
  :public => true
}).files

class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    w[:filename] = w[:filename].gsub(/ /,"+")

    file = S3.create(
      :key => w[:filename],
      :body => w[:tempfile],
      :public => true
    )

    file.save

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = file.public_url
  end

  private

  def delete!
    S3.get(wallpaper[:name]).destroy
  end
end
