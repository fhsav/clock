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
    @schedule = Schedule.activated

    @theme = Theme.find(params[:id]).wallpaper

    @marquees = Marquee.all
    @notices = Notice.all

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
