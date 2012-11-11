class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def self.activated
    first(:active => true)
  end

  def wallpaper=(w)
    upload = GirlFriday::WorkQueue.new(:s3_upload, :size => 5) do |w|
      S3.files.create(
        :key => w[:filename],
        :body => w[:tempfile],
        :content_type => w[:type],
        :public => true
      )
    end

    upload << w

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = "http://fhsclock.s3.amazonaws.com/#{w[:filename].gsub(/ /,'+')}"
  end

  private

  def delete!
    delete = GirlFriday::WorkQueue.new(:s3_delete, :side => 5) do |w|
      f = S3.files.get(w[:name].to_s)

      if f
        f.destroy
      end
    end

    delete << { :name => wallpaper[:name] }
  end
end
