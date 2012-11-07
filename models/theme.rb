class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    w[:filename] = w[:filename].gsub(/ /,"+")

    S3.store(
      w[:filename],
      w[:tempfile],
      "fhsclock",
      :content_type => w[:content_type],
      :access => :public_read
    )

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = S3.find(w[:filename], "fhsclock").url
  end

  private

  def delete!
    S3.delete wallpaper[:name], "fhsclock"
  end
end
