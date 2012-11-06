Clock.controllers :themes do
  before :except => [:wallpaper] do
    redirect!
  end
  
  get :index do
    @themes = Theme.all
    
    render 'themes/index'
  end
  
  post :create do
    w = params[:theme][:wallpaper]

    AWS::S3::S3Object.store(
      w[:filename], # name in S3
      w[:tempfile], # actual file
      "fhsclock", # bucket,
      :content_type => w[:content_type], # content_type, get from sinatra
      :access => :public_read # make it so people can see it
    )

    t = Theme.new(:name => params[:theme][:name], :wallpaper => { :name => w[:filename], :url => "http://s3.amazonaws.com/fhsclock/#{w[:filename]}" })
    
    if t.save
      flash[:notice] = "Your theme has been saved."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and your theme has not been saved."
      redirect url(:themes, :index)
    end
  end
  
  post :activate do
    Theme.set({:active => true}, :active => false)

    t = Theme.find(params[:id])
    t.active = true

    if t.save
      flash[:notice] = 'The theme "' + t.name + '" has been activated.'
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and your theme has not been activated."
      redirect url(:themes, :index)
    end
  end

  get :view, :map => "/themes/:id" do
    @theme = Theme.find(params[:id])

    render 'themes/view'
  end
  
  delete :destroy do
    t = Theme.find(params[:id])
    
    if t.destroy
      AWS::S3::S3Object.delete t.wallpaper[:name], "fhsclock"

      flash[:notice] = "The theme has been destroyed."
      redirect url(:themes, :index)
    else
      flash[:error] = "Something went wrong, and the theme has not been destroyed."
      redirect url(:themes, :index)
    end
  end

  get :wallpaper, :map => "/themes/:id/wallpaper" do
    file = Theme.find(params[:id]).wallpaper

    [200, {'Content-Type' => file.content_type}, [file.read]]
  end
end
