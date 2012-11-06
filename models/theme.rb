class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  key :wallpaper, Hash
  
  validates_presence_of :name
  validates_presence_of :wallpaper
end
