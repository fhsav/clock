Admin.controllers do
  
  before :except => [ :login, :authenticate ] do
    authenticated?
  end
  
  # GET /admin
  get :index do
    render :index
  end
  
  # GET /login
  get :login do
    render :login, :layout => false
  end
    
    # POST /authenticate
    post :authenticate do
      if encrypt(params[:password]) == options.password
        authenticate!
      end
      
      redirect url(:index)
    end
    
  # GET /logout
  get :logout do
    deauthenticate!
  end

end
