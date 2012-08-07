class Notice
  include MongoMapper::Document
  
  key :text, String
  key :urgent, Boolean
  
  timestamps!
  
  validates_presence_of :text
end
