class Background
  include MongoMapper::Document
  plugin Joint
  
  key :name, String
  key :active, Boolean
  
  attachment :file
end
