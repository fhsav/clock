require 'yaml'

class Admin < Padrino::Application
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  enable :sessions
  
  directory = File.expand_path(File.dirname(__FILE__))
  config = YAML::load(File.open(File.join(directory, '..', '.fhsclock.yml')))
  
  set :password, config["password"]
end  
