class Clock < Padrino::Application
  register BaristaInitializer
  register CompassInitializer
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Rendering
  
  use Rack::GridFS, :prefix => 'gridfs', :hostname => 'localhost', :port => 27017, :database => "clock_#{PADRINO_ENV}"
  set :video, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["video"]
  
  use StatusCats, :except => 200..301

  enable :caching
  
  if ENV["HEROKU"]
    set :cache, Padrino::Cache::Store::Memory.new(10000)
  else
    set :cache, Padrino::Cache::Store::Mongo.new(::Mongo::Connection.new("localhost", 27017).db('clock_development'))
  end
end
