class Schedule
  include MongoMapper::Document
  
  key :name, String
  key :description, String
  key :active, Boolean, :default => false
  
  timestamps!
  
  many :periods
  
  validates_presence_of :name

  def activate!
    self.class.set({:active => true}, :active => false)
    self.active = true
  end
end

class Period
  include MongoMapper::Document
  
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time

  belongs_to :schedule
end
