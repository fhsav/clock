### Clock.
###   file: app/models/schedule.rb

class Schedule
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String # A human-readable name for the admin page.
  property :active, Boolean # Only one can be true--will be shown on the clock page.
end

class Period
  include DataMapper::Resource
  
  property :id, Serial
  property :number, Integer # For ordering.
  property :string, String # What is actually displayed.
  property :start_time, Time
  property :end_time, Time
  property :belongs_to, Integer # Schedule ID.
end
