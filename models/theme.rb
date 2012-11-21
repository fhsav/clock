require "yaml"

class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name

  after_destroy :delete!

  def self.activated
    t = self.first(:active => true)

    if t.nil?
      { :url => "/img/default.jpg", :type => "image/jpeg" }
    else
      { :url => t.wallpaper[:url], :type => t.wallpaper[:type] }
    end
  end

  def video?
    r = false

    if wallpaper[:type] == "video/mp4"
      r = true
    end

    r
  end

  def wallpaper=(w)
    unless heroku?
      yaml = YAML::load(File.open(File.join(PADRINO_ROOT, ".s3.yml")))
    end

    upload = GirlFriday::WorkQueue.new(:s3_upload, :size => 5) do |w|
      S3.files.create(
        :key => w[:filename],
        :body => w[:tempfile],
        :content_type => w[:type],
        :public => true
      )
    end

    upload << w

    if heroku?
      url = "http://#{ENV["S3_BUCKET"]}.s3.amazonaws.com/#{w[:filename].gsub(/ /,'+')}"
    else
      url = "http://#{yaml["bucket"]}.s3.amazonaws.com/#{w[:filename].gsub(/ /,'+')}"
    end

    wallpaper[:name] = w[:filename]
    wallpaper[:url] = url
    wallpaper[:type] = w[:type]
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
