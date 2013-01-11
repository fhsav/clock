Clock.controllers :themes do
  before :except => [:wallpaper] do
    redirect!
  end

  get :index do
    @themes = Theme.all

    render 'themes/index'
  end

  post :create do
    t = Theme.new(params[:theme])
    t.wallpaper = params[:wallpaper][:tempfile]

    if t.save
      flash[:notice] = "Your theme has been saved."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:themes, :index)
    end
  end

  post :activate do
    Theme.set({:active => true}, :active => false)

    t = Theme.find(params[:id])
    t.active = true

    if t.save
      flash[:notice] = "The theme \"#{t.name}\" has been activated"
      redirect url(:themes, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:themes, :index)
    end
  end

  get :view, :map => "/themes/:id" do
    @theme = Theme.find(params[:id])

    render 'themes/view'
  end

  get :preview, :map => "/themes/:id/preview" do
    @schedule = Schedule.activated

    @theme = Theme.find(params[:id]).wallpaper

    @marquees = Marquee.all
    @notices = Notice.all

    render 'clock/index', :layout => false
  end

  delete :destroy do
    t = Theme.find(params[:id])

    if t.destroy
      flash[:notice] = "The theme has been destroyed."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:themes, :index)
    end
  end

  get :wallpaper, :map => "/themes/:id/wallpaper" do
    file = Theme.find(params[:id]).wallpaper

    [200, {'Content-Type' => file.content_type}, [file.read]]
  end
end
