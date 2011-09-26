Clock.controllers do
  
  # GET /
  get :index do
    @schedule = Schedule.first(:active => true)
    
    if !@schedule.blank?
      @periods_exist = true
      @periods = @schedule.periods.sort(:number.asc)
    else
      @periods_exist = false
    end
    
    @marquees = Marquee.all
    @notices = Notice.all
    
    render :clock
  end
  
  # GET /api
  get :api do
    
  end 
  
  # GET /ping
  get :ping do
    "pong"
  end
  
end
