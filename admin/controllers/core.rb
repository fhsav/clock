Admin.controllers do
  before :except => [ :login, :authenticate ] do
    authenticated?
  end
  
  # GET /admin
  get :index do
    render :index
  end
  
  # POST /admin/refresh
  post :refresh do
    Resque.enqueue(Refresh)
    
    flash[:notice] = "Refresh request sent."
    redirect url(:index)
  end

  # GET /admin/login
  get :login do
    render :login, :layout => false
  end
    
  # POST /admin/authenticate
  post :authenticate do
    if encrypt(params[:password]) == settings.password or params[:password] == settings.password
      authenticate!
      
      redirect url(:index)
    else
      flash[:error] = "Wrong password, you dolt."
      redirect url(:login)
    end
  end
  
  # POST /admin/logout
  post :logout do
    deauthenticate!
    
    redirect url(:login)
  end
end
