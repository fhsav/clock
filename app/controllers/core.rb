Clock.controllers do
  before do
    current_data
  end

  get :index do
  	if authenticated?
      render :index
    else
      render 'clock/index', :layout => false
    end
  end

  get :admin do
  	redirect url(:sessions, :new)
  end
end
