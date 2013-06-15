Clock::Web.controllers :themes do
  before :except => [:wallpaper] do
    redirect!
  end

  get :index do
    @themes = Theme.all.to_a

    render 'themes/index'
  end

  post :create do
    t = Theme.new
    t.name = params[:theme][:name]
    t.wallpaper = params[:theme][:wallpaper]

    if t.save
      flash[:notice] = 'Your theme has been saved.'
      redirect url(:themes, :index)
    else
      flash[:error] = 'Something went wrong, and your theme has not been saved.'
      redirect url(:themes, :index)
    end
  end

  post :activate do
    t = Theme.find(params[:id])

    if t.activate!
      flash[:notice] = "The theme #{t.name} has been activated."
      redirect url(:themes, :index)
    else
      flash[:error] = 'Something went wrong, and your theme has not been activated.'
      redirect url(:themes, :index)
    end
  end

  get :view, :map => '/themes/:id' do
    @theme = Theme.find(params[:id])

    render 'themes/view'
  end

  get :preview, :map => '/themes/:id/preview' do
    @main = cache('preview_main', :expires_in => 15) do
      @s = Schedule.activated
      @n = Notice.all.to_a

      partial 'clock/main'
    end

    @theme = Theme.where(:id => params[:id]).first

    @marquees = cache('preview_marquees', :expires_in => 15) do
      @m = Marquee.all.to_a

      partial 'clock/marquees'
    end

    render 'clock/index', :layout => false
  end

  delete :destroy do
    t = Theme.find(params[:id])

    if t.destroy
      flash[:notice] = 'The theme has been destroyed.'
      redirect url(:themes, :index)
    else
      flash[:error] = 'Something went wrong, and the theme has not been destroyed.'
      redirect url(:themes, :index)
    end
  end

  get :wallpaper, :with => :id do
    theme = Theme.find(params[:id])

    content = theme.wallpaper.read

    content_type theme.wallpaper.file.content_type

    return content
  end
end
