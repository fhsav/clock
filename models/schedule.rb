class Schedule
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :description, :type => String
  field :active, :type => Boolean, :default => false

  embeds_many :periods, validate: false

  validates_presence_of :name

  def self.activated
    where(:active => true).first
  end

  def activate!
    self.class.all.set(:active, false)
    self.active = true
    self.save
  end
end

class Period
  include Mongoid::Document

  field :number, :type => Integer
  field :text, :type => String
  field :start, :type => Time
  field :finish, :type => Time

  embedded_in :schedule

  validates_presence_of :number, :text, :start, :finish
end
