Clock.controllers :clock do
  get :index do
    @schedule = Schedule.first(:active => true)
    @theme = Theme.first(:active => true)    
    @marquees = Marquee.all
    
    render :clock
  end
end
