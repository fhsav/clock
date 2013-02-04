class Schedule
  include MongoMapper::Document
  
  key :name, String
  key :description, String
  key :active, Boolean, :default => false
  
  timestamps!
  
  many :periods
  
  validates_presence_of :name

  def self.activated
    first(:active => true)
  end

  def activate!
    self.class.all.each do |s|
      s.active = false
      s.save
    end

    self.active = true
    self.save
  end
end

class Period
  include MongoMapper::EmbeddedDocument
  
  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time

  embedded_in :schedule

  validates_presence_of :number, :name, :start, :finish

  before_save :number!

  private

  def number!
    if self.number.blank?
      self.number = self.schedule.periods.count
    end
  end
end
