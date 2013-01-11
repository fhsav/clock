class Theme
  include MongoMapper::Document

  plugin Joint

  key :name, String
  key :active, Boolean, :default => false
  key :url, String

  attachment :wallpaper
  
  validates_presence_of :name

  before_save :url!

  def self.activated
  	t = self.first(:active => true)

    if t.nil?
      { :url => "/img/default.jpg", :type => "image/jpeg" }
    else
      { :url => self.url, :type => t.wallpaper.type }
    end
  end

  def video?
    result = false

    if self.wallpaper.type == "video/mp4"
      result = true
    end

    result
  end

  private

  def url!
    self.url = Clock.url(:themes, :wallpaper, :id => self.id)
  end
end
