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
  
  get "/500" do
    if request.env['sinatra_error']
      @error = request.env['sinatra_error'].name
    end
    
    render 'errors/500'
  end
end
