require 'yaml'

class Admin < Padrino::Application
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  register ProtectionInitializer
  
  enable :sessions
  set :password, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["password"]
  
  layout :application
end  
