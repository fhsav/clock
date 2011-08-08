class Notice
  include MongoMapper::Document
  
  # Keys
  key :text, String
  key :urgent, Boolean
  
  timestamps!
end
