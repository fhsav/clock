Clock.controllers :settings do
  before :except => :setup do
    redirect!

    @settings = {
      "password" => Redis.get("password")
    }
  end

  get :index do
    render 'settings/index'
  end

  put :modify do
    if encrypt(params[:password][:old]) == Redis.get("password")
      if params[:password][:new] == params[:password][:confirmation]
        if Redis.set("password", encrypt(params[:password][:new]))
          flash[:notice] = "Your new password has been set."
          redirect url(:settings, :index)
        else
          flash[:error] = "Something went wrong and your password hasn't been set."
          redirect url(:settings, :index)
        end
      else
        flash[:error] = "Please enter matching passwords."
        redirect url(:settings, :index)
      end
    else
      flash[:error] = "Please enter your current password."
      redirect url(:settings, :index)
    end
  end

  get :setup, :map => "/setup" do
    Redis.set("password", encrypt("temporary"))

    flash[:notice] = "You've been given the password <pre>temporary</pre>. Now go in and change that."
    redirect url(:sessions, :new)
  end
end