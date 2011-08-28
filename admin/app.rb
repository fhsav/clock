class Admin < Padrino::Application
  register Padrino::Cache
  register Padrino::Helpers
  register Padrino::Mailer
  register Padrino::Rendering
  
  enable :caching
  enable :sessions

  set :cache, Padrino::Cache::Store::File.new(Padrino.root('tmp', app_name.to_s, 'cache'))
end
