class Wallpaper
  include MongoMapper::Document

  plugin Joint
  
  key :name, String
  key :content_type, String
  key :active, Boolean
  
  attachment :file
  
  validates_presence_of :name
  validates_presence_of :file
end
