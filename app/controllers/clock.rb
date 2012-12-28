Clock.controllers :clock do
  before do
    current_data
  end

  get :index do
    render 'clock/index', :layout => false
  end
end