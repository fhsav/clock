require 'yaml'

class Admin < Padrino::Application
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  register ProtectionInitializer
  
  enable :sessions
  layout "#{File.join(PADRINO_ROOT, 'admin', 'views', 'application.haml')}"
  
  set :password, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["password"]
end  
