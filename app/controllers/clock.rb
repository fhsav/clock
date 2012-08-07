Clock.controllers do
  get :index do
    @schedule = Schedule.first(:active => true)
    
    if !@schedule.blank?
      @periods = @schedule.periods.sort(:number.asc)
    end
    
    @marquees = Marquee.all
    @notices = Notice.all
    
    @wallpaper = Wallpaper.first(:active => true)
    
    render :clock
  end
  
  get :ping do
    "pong"
  end
end
