require 'yaml'

class Admin < Padrino::Application
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  register ProtectionInitializer
  
  enable :sessions
  set :password, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["password"]
  set :video, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["video"]
  
  layout :application
end  
