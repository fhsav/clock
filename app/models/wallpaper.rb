class Wallpaper
  include MongoMapper::Document
  plugin Joint
  
  key :name, String
  key :video, Boolean
  key :active, Boolean
  
  attachment :file
end
