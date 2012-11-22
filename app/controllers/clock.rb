Clock.controllers :clock do
  before do
    @schedule = Schedule.activated

    @theme = Theme.activated

    @marquees = Marquee.all
    @notices = Notice.all
  end

  get :index do
    render 'clock/index', :layout => false
  end
end