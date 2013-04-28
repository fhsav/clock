class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash

  timestamps!

  validates_presence_of :name

  after_destroy :delete!

  def self.activated
    t = self.first(:active => true)

    if t.nil?
      { :url => '/img/default.jpg', :type => 'image/jpeg' }
    else
      { :url => t.wallpaper[:url], :type => t.wallpaper[:type] }
    end
  end

  def video?
    r = false

    if wallpaper[:type] == 'video/mp4'
      r = true
    end

    r
  end

  def wallpaper=(file)
    upload = GirlFriday::WorkQueue.new(:s3_upload, :size => 5) do |file|
      S3.files.create(
        :key => file[:filename],
        :body => file[:tempfile],
        :content_type => file[:type],
        :public => true
      )
    end

    upload << file

    url = "http://#{ENV['S3_BUCKET']}.s3.amazonaws.com/#{w[:filename].gsub(/ /, '+')}"

    wallpaper[:name] = file[:filename]
    wallpaper[:url] = url
    wallpaper[:type] = file[:type]
  end

  private

  def delete!
    delete = GirlFriday::WorkQueue.new(:s3_delete, :side => 5) do |w|
      file = S3.files.get(w[:name].to_s)

      file.destroy if file
    end

    delete << { :name => wallpaper[:name] }
  end
end
