class Clock < Padrino::Application
  register Padrino::Helpers
  register Padrino::Rendering
  register BaristaInitializer
  register CompassInitializer

  use Rack::GridFS, :prefix => "gridfs", :hostname => "localhost", :port => 27017, :database => MongoMapper.database.name
  use Faye::RackAdapter, :mount => "/faye", :timeout => 25

  enable :sessions
end
