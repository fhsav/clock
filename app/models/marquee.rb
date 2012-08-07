class Marquee
  include MongoMapper::Document
  
  key :text, String
  
  timestamps!
  
  validates_presence_of :text
end
