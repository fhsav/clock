class Period
  include MongoMapper::Document

  key :number, Integer
  key :name, String
  key :start, Time
  key :finish, Time

  belongs_to :schedule
end
