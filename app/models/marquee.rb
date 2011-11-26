class Marquee
  include MongoMapper::Document
  
  # Keys
  key :text, String
  
  timestamps!
  
  # Validations
  validates_presence_of :text
end
