Clock.controllers :clock do
  before do
    @schedule = Schedule.first(:active => true)

    @theme = Theme.first(:active => true)
    @theme = @theme.present? ? "/gridfs/#{@theme.wallpaper.id}" : "/img/default.jpg"

    @marquees = Marquee.all
  end

  get :index do
    redirect url(:clock, :beta)
  end

  get :beta do
    render 'clock/beta', :layout => false
  end
end
