class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    w[:filename] = w[:filename].gsub(/ /,"+")

    S3_UPLOAD << w

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = "http://s3.fhsclock.com/#{w[:filename]}"
  end

  private

  def delete!
    S3_DELETE << { :name => wallpaper[:name] }
  end
end
