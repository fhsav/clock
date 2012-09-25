Clock.controllers :clock do
  before do
    @schedule = Schedule.first(:active => true)

    @theme = Theme.first(:active => true)
    @theme = @theme.present? ? url(:themes, :wallpaper, :id => @theme.id) : "/img/default.jpg"

    @marquees = Marquee.all
    @notices = Notice.all
  end

  get :index do
    render 'clock/index', :layout => false
  end
end
