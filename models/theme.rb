class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    w[:filename] = w[:filename].gsub(/ /,"+")

    AWS::S3::S3Object.store(
      w[:filename],
      w[:tempfile],
      "fhsclock",
      :content_type => w[:content_type],
      :access => :public_read
    )

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = "http://s3.amazonaws.com/fhsclock/#{w[:filename]}"
  end

  private

  def delete!
    AWS::S3::S3Object.delete wallpaper[:name], "fhsclock"
  end
end
