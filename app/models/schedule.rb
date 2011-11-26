class Schedule
  include MongoMapper::Document
  
  # Keys
  key :name, String
  key :description, String
  key :active, Boolean
  
  timestamps!
  
  # Associations
  many :periods
  
  # Validations
  validates_presence_of :name
end

class Period
  include MongoMapper::Document
  
  # Keys
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time
end
