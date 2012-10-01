Clock.controllers do
  get :index do
  	if authenticated?
      render :index
    else
      redirect url(:clock, :index)
    end
  end

  get :admin do
  	redirect url(:sessions, :new)
  end

  get :data, :provides => [:json] do
  end
end
