Clock.controllers :clock do
  before do
    @schedule = Schedule.first(:active => true)

    @theme = Theme.first(:active => true)
    @theme = @theme.present? ? "/gridfs/#{@theme.wallpaper.id}" : "/img/default.jpg"

    @marquees = Marquee.all
  end

  get :index do
    render 'clock/index', :layout => false
  end
end
