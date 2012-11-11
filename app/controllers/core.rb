Clock.controllers do
  before do
    @schedule = Schedule.activated

    theme = Theme.activated
    @theme = Hash.new
    @theme[:url] = theme.present? ? theme.wallpaper[:url] : "/img/default.jpg"
    @theme[:type] = theme.wallpaper[:type]

    @marquees = Marquee.all
    @notices = Notice.all
  end

  get :index do
  	if authenticated?
      render :index
    else
      render 'clock/index', :layout => false
    end
  end

  get :clock do
    render 'clock/index', :layout => false
  end

  get :admin do
  	redirect url(:sessions, :new)
  end
end
