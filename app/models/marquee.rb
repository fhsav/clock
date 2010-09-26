### Clock.
###   file: app/models/marquee.rb

class Marquee
  include DataMapper::Resource
  
  property :id, Serial
  property :string, String
end
