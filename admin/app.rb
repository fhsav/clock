class Admin < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Cache
  
  enable :sessions
  enable :caching

  set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache'))
end
