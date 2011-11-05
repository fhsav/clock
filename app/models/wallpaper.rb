class Wallpaper
  include MongoMapper::Document
  plugin Joint
  
  # Keys
  key :name, String
  key :active, Boolean
  
  # Attachments
  attachment :file
  
  # Validations
  validates_presence_of :name
  validates_presence_of :file
end

Wallpaper.ensure_index([['files_id', Mongo::ASCENDING], ['n', Mongo::ASCENDING]], :unique => true) 