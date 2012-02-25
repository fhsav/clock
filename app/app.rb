class Clock < Padrino::Application
  register BaristaInitializer
  register CompassInitializer
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  use Rack::GridFS, :prefix => 'gridfs', :hostname => 'localhost', :port => 27017, :database => "clock_#{PADRINO_ENV}"
  set :video, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["video"]
  
  enable :caching
  set :cache, Padrino::Cache::Store::Redis.new(::Redis.new(:host => '127.0.0.1', :port => 6379, :db => 0))
  
  not_found do
    render 'errors/404'
  end
  
  error do
    redirect url("/500")
  end
end
