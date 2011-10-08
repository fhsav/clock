require 'yaml'

class Admin < Padrino::Application
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  enable :caching
  enable :sessions

  set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache'))
  

  directory = File.expand_path(File.dirname(__FILE__))

  config = YAML::load(File.open(File.join(directory, '..', 'config', 'settings.yml')))
  
  set :password, config["password"]
end
