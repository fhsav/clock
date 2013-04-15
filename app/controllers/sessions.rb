Clock::Web.controllers :sessions do
  get :new do
    if authenticated?
      redirect url(:index)
    else
      if password?
        render 'sessions/new'
      else
        redirect url(:settings, :new)
      end
    end
  end

  post :create do
    if encrypt(params[:password]) == Redis.get("password")
      session["clock"] ||= 0
      session["clock"] = session_key

      flash[:notice] = "Welcome back!"
      redirect url(:index)
    else
      flash[:error] = "You're an idiot. You can't remember your own password?"
      redirect url(:sessions, :new)
    end
  end

  get :destroy do
    session["clock"] = 0

    flash[:notice] = "Bye bye!"
    redirect url(:sessions, :new)
  end
end
