Admin.controllers do
  
  before :except => [ :login, :authenticate, :refresh ] do
    authenticated?
  end
  
  # GET /admin
  get :index do
    render :index
  end
  
  # GET /settings
  get :settings do
    render :settings
  end
  
    # POST /settings
    post :settings do
      if encrypt(params[:old]) == options.password and params[:password] == params[:confirmation]
        file = File.open(File.join(PADRINO_ROOT, 'config', 'settings.yml'), "w+")
        file.puts "password: #{encrypt(params[:password])}"
        
        flash[:notice] = "Password saved."
        redirect url(:settings)
      else
        flash[:error] = "Either you entered the wrong password, or the passwords did not match."
        redirect url(:settings)
      end
    end
  
  # GET /login
  get :login do
    render :login, :layout => false
  end
    
    # POST /authenticate
    post :authenticate do
      if encrypt(params[:password]) == options.password or params[:password] == options.password
        authenticate!
        redirect url(:index)
      else
        flash[:error] = "Wrong password, you dolt."
        redirect url(:login)
      end
    end
    
  # POST /logout
  post :logout do
    deauthenticate!
    redirect url(:login)
  end
  
end
