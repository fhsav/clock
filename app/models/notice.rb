class Notice
  include MongoMapper::Document
  
  # Keys
  key :text, String
  key :urgent, Boolean
  
  timestamps!
  
  # Validations
  validates_presence_of :text
end
