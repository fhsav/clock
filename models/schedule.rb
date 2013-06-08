class Schedule
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :description, :type => String
  field :active, :type => Boolean, :default => false

  has_many :periods

  validates_presence_of :name

  def self.activated
    where(:active => true).first
  end

  def activate!
    self.class.set({:active => true}, :active => false)
    self.active = true
  end
end
