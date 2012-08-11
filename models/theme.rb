class Theme
  include MongoMapper::Document

  plugin Joint
  
  key :name, String
  key :active, Boolean, :default => false
  
  attachment :wallpaper
  
  validates_presence_of :name
  validates_presence_of :wallpaper
end
