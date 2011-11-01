Clock.controllers do
  # GET /
  get :index do
    @schedule = Schedule.first(:active => true)
    
    if !@schedule.blank?
      @periods = @schedule.periods.sort(:number.asc)
    end
    
    @marquees = Marquee.all
    @notices = Notice.all
    
    @wallpaper = Wallpaper.first(:active => true)
    
    if @wallpaper
      @wallpaper = "/admin/wallpapers/linked/#{@wallpaper.file.id}"
    else
      @wallpaper = "/img/backgrounds/sea-green.jpg"
    end
    
    render :clock
  end
  
  # GET /ping
  get :ping do
    "pong"
  end
  
end
