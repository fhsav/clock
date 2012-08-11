Clock.controllers :themes do
  before :except => [:serve] do
    authenticated?
  end
  
  get :index do
    @themes = Theme.all
    
    if ENV['HEROKU']
      @disabled = true
    end
    
    render 'themes/index'
  end
  
  get :serve, :with => :id do
    redirect("/gridfs/#{Theme.find(params[:id]).file.id}")
  end
  
  post :create do
    theme = Theme.new(:name => params[:theme][:name], :content_type => params[:theme][:file][:content_type], :file => params[:theme][:file][:tempfile])
    
    if theme.save
      flash[:notice] = "Your theme has been saved."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and your theme has not been saved."
      redirect url(:themes, :index)
    end
  end
  
  post :activate do
    Theme.set({:active => true}, :active => false)
    
    theme = Theme.find(params[:id])
    theme.active = true
    
    if theme.save
      flash[:notice] = 'The theme "' + theme.name + '" has been activated.'
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and your theme has not been activated."
      redirect url(:themes, :index)
    end
  end
  
  delete :destroy do
    theme = Theme.find(params[:id])
    
    if theme.destroy
      flash[:notice] = "The theme has been destroyed."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and the theme has not been destroyed."
      redirect url(:themes, :index)
    end
  end
end
