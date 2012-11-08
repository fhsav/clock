class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    w[:filename] = w[:filename].gsub(/ /,"+")

    file = S3.files.create(
      :key => w[:filename],
      :body => w[:tempfile],
      :content_type => w[:content_type],
      :public => true
    )

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = file.public_url
  end

  private

  def delete!
    S3.files.get(wallpaper[:name]).destroy
  end
end
