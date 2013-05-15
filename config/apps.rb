Padrino.configure_apps do
  enable :sessions

  set :session_secret, 'cbebd3f6c9498c542236e90f8cad6ea9a2fa7978d1072a5c78ab2c3695604f1a'
end

Padrino.mount('Clock::Web', :app_file => Padrino.root('app/app.rb')).to('/')

Padrino.mount('Clock::API', :app_file => Padrino.root('api/app.rb')).to('/api')
