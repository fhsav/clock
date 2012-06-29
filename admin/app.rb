require 'yaml'

class Admin < Padrino::Application
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Rendering
  
  enable :sessions
  set :password, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["password"]
  set :video, YAML::load(File.open(File.join(PADRINO_ROOT, '.fhsclock.yml')))["video"]
  
  enable :caching
  
  if ENV["HEROKU"]
    set :cache, Padrino::Cache::Store::Memory.new(10000)
  else
    set :cache, Padrino::Cache::Store::Mongo.new(::Mongo::Connection.new("localhost", 27017).db('clock_#{PADRINO_ENV}'))
  end
  
  layout :application
  
  not_found do
    redirect url("/404")
  end
  
  error do
    redirect url("/500")
  end
end  
