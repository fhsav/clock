Clock.controllers do
  before do
    redirect!
  end

  get :index do
    render :index
  end
end
