class Schedule
  include MongoMapper::Document
  
  key :name, String
  key :description, String
  key :active, Boolean, :default => false
  
  timestamps!
  
  many :periods
  
  validates_presence_of :name
end

class Period
  include MongoMapper::Document
  
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time
end
