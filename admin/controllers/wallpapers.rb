Admin.controllers :wallpapers do
  before :except => [:linked, :direct] do
    authenticated?
  end
  
  # GET /admin/wallpapers
  get :index do
    @wallpapers = Wallpaper.all
    
    render 'wallpapers/index'
  end
  
  # GET /admin/wallpapers/linked/:id
  get :linked, :with => :id do
    grid(params[:id])
  end
  
  # GET /admin/wallpapers/direct/:id
  get :direct, :with => :id, :provides => [:jpg, :png, :gif] do
    grid(params[:id])
  end
  
  # POST /admin/wallpapers/create
  post :create do
    wallpaper = Wallpaper.new(:name => params[:wallpaper][:name], :file => params[:wallpaper][:file][:tempfile])

    if wallpaper.save
      flash[:notice] = "Your wallpaper has been saved."
      redirect url(:wallpapers, :index)
    else
      flash[:error] = "Something went wrong, and your wallpaper has not been saved."
      redirect url(:wallpapers, :index)
    end
  end
  
  # POST /admin/wallpapers/activate
  post :activate do
    Wallpaper.set({:active => true}, :active => false)
    
    wallpaper = Wallpaper.find(params[:id])
    wallpaper.active = true
    
    if wallpaper.save
      flash[:notice] = 'The wallpaper "' + wallpaper.name + '" has been activated.'
      redirect url(:wallpapers, :index)
    else
      flash[:error] = "Something went wrong, and your wallpaper has not been activated."
      redirect url(:wallpapers, :index)
    end
  end
  
  # DELETE /admin/wallpapers/destroy
  delete :destroy do
    wallpaper = Wallpaper.find(params[:id])
    
    if wallpaper.destroy
      flash[:notice] = "The wallpaper has been destroyed."
      redirect url(:wallpapers, :index)
    else
      flash[:error] = "Something went wrong, and the wallpaper has not been destroyed."
      redirect url(:wallpapers, :index)
    end
  end
end
