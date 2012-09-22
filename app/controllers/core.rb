Clock.controllers do
  get :index do
  	if authenticated?
      render :index
    else
      redirect url(:clock, :index)
    end
  end
end
