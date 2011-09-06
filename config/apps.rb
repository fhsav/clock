Padrino.configure_apps do
  enable :sessions
  set :session_secret, 'cbebd3f6c9498c542236e90f8cad6ea9a2fa7978d1072a5c78ab2c3695604f1a'
  set :password, @@yaml["password"]
end

Padrino.mount("Clock").to('/')
Padrino.mount("Admin").to("/admin")
