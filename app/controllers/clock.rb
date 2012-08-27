Clock.controllers :clock do
  get :index do
    redirect url(:clock, :beta)
  end

  get :beta do
    @schedule = Schedule.first(:active => true)
    @theme = Theme.first(:active => true)    
    @marquees = Marquee.all
    
    render 'clock/beta', :layout => false
  end
end
