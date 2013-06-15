class Period
  include Mongoid::Document

  field :number, :type => Integer
  field :text, :type => String
  field :start, :type => Time
  field :finish, :type => Time

  belongs_to :schedule

  validates_presence_of :number, :text, :start, :finish
end
