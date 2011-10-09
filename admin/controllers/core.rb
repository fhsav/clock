Admin.controllers do
  
  before :except => [ :login, :authenticate, :refresh ] do
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
