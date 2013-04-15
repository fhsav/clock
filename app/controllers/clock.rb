Clock::Web.controllers :clock do
  before do
    clock_data
  end

  get :index do
    render 'clock/index', :layout => false
  end
end
