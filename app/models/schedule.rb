class Schedule
  include MongoMapper::Document

  # Keys
  key :name, String
  key :description, String
  key :active, Boolean, :default => false
  
  timestamps!
  
  # Associations
  many :periods
  
  # Validations
  validate :only_one_active
  
  def only_one_active
    count = Schedule.where(:active => true).count
    
    if count > 1
      errors.add(:active, "More than one schedule is active.")
    end
  end
  
  # Callbacks
  before_save :activate
  
  # Methods
  def active?
    if self.active == true
      return true
    else
      return false
    end
  end
  
  def activate!(id)
    others = Schedule.all(:active => true)
    
    others.each do |other|
      other.active = false
    end
    
    new = Schedule.find(id)
    new.active = true
  end
  
  # Callbacks, cont.
  def activate
    others = Schedule.all(:active => true)
    
    others.each do |other|
      other.active = false
    end
    
    self.active = true
  end
end

class Period
  include MongoMapper::Document
  
  # Keys
  key :number, String
  key :name, String
  key :start, Time
  key :finish, Time
end
