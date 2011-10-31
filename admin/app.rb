require 'yaml'

class Admin < Padrino::Application
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  use Rack::GridFS, :hostname => 'localhost', :port => 27017, :database => MongoMapper.database.to_s, :prefix => 'gridfs'  
    
  enable :sessions
  
  
  directory = File.expand_path(File.dirname(__FILE__))
  config = YAML::load(File.open(File.join(directory, '..', '.fhsclock.yml')))
  
  set :password, config["password"]
end  
