Clock.controllers do
  
  # GET /
  get :index do
    @schedule = Schedule.first(:active => true)
    @periods = @schedule.periods.sort(:number.asc)
    @marquees = Marquee.all
    
    render :clock
  end
  
  # GET /ping
  get :ping do
    "pong"
  end
  
end
