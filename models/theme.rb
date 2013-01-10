class Theme
  include MongoMapper::Document

  plugin Joint

  key :name, String
  key :active, Boolean, :default => false

  attachment :wallpaper
  
  validates_presence_of :name

  def self.activated
  	t = self.first(:active => true)

    if t.nil?
      { :url => "/img/default.jpg", :type => "image/jpeg" }
    else
      { :url => url(:themes, :wallpaper, :id => t.id), :type => t.wallpaper.type }
    end
  end
end
