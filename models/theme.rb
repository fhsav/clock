class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def wallpaper=(w)
    S3_UPLOAD << w

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = "http://fhsclock.s3.amazonaws.com/#{w[:filename].gsub(/ /,'+')}"
  end

  private

  def delete!
    S3_DELETE << { :name => wallpaper[:name] }
  end
end

S3_UPLOAD = GirlFriday::WorkQueue.new(:s3_upload, :size => 5) do |w|
  S3.files.create(
    :key => w[:filename],
    :body => w[:tempfile],
    :content_type => w[:type],
    :public => true
  )
end

S3_DELETE = GirlFriday::WorkQueue.new(:s3_delete, :side => 5) do |w|
  f = S3.files.get(w[:name].to_s)

  if f
    f.destroy
  end
end