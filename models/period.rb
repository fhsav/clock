class Period
  include Mongoid::Document

  field :number, :type => Integer
  field :name, :type => String
  field :start, :type => Time
  field :finish, :type => Time

  belongs_to :schedule
end
