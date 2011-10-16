class Schedule
  include MongoMapper::Document
  
  # Keys
  key :name, String, :required => true
  key :description, String
  key :active, Boolean
  
  timestamps!
  
  # Associations
  many :periods
end

class Period
  include MongoMapper::Document
  
  # Keys
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time
end
