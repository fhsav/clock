Admin.controllers do
  
  before :except => [ :login, :authenticate ] do
    authenticated?
  end
  
  get :index do
    render :index
  end
  
  get :login do
    render :login, :layout => false
  end
  
    post :authenticate do
      if params[:password] == options.password
        authenticate!
      end
      
      redirect url(:index)
    end
    
  get :logout do
    deauthenticate!
  end

end
