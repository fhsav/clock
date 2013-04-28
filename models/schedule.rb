class Schedule
  include MongoMapper::Document

  key :name, String
  key :description, String
  key :active, Boolean, :default => false

  timestamps!

  many :periods

  validates_presence_of :name

  scope(:activated) { where(:active => true) }

  def activate!
    self.class.set({:active => true}, :active => false)
    self.active = true
  end
end
