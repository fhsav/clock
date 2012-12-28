class Theme
  include MongoMapper::Document

  key :name, String
  key :active, Boolean, :default => false
  
  validates_presence_of :name
end
