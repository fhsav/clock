class Clock < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register CompassInitializer
  register BaristaInitializer
  
  use Rack::GridFS, :prefix => 'gridfs', :hostname => 'localhost', :port => 27017, :database => "clock_#{PADRINO_ENV}"
  set :video, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["video"]
  
  not_found do
    render 'errors/404'
  end
  
  error do
    redirect url("/500")
  end
end
