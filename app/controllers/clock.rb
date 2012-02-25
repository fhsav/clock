Clock.controllers do
  # GET /
  get :index do
    @schedule = Schedule.first(:active => true)
    
    if !@schedule.blank?
      @periods = @schedule.periods.sort(:number.asc)
    end
    
    @marquees = Marquee.all
    @notices = Notice.all
    
    @wallpaper = cache("wallpaper", :expires_in => 60) do
      Wallpaper.first(:active => true)
    end
    
    render :clock
  end
  
  # GET /ping
  get :ping do
    "pong"
  end
  
  # GET /500
  get "/500" do
    if request.env['sinatra_error']
      @error = request.env['sinatra_error'].name
    end
    
    render 'errors/500'
  end
end
