Clock::Web.controllers :settings do
  before do
    redirect! if password?
  end

  get :new, :map => '/setup' do
    render 'settings/new'
  end

  post :create do
    if Redis.set('password', encrypt(params[:password]))
      flash[:notice] = 'Set up complete.'
      redirect url(:sessions, :new)
    else
      flash[:error] = 'Something went wrong...'
      redirect url(:settings, :new)
    end
  end
end
