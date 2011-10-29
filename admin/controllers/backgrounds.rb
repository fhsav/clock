Admin.controllers :backgrounds do
  before do
    authenticated?
  end
  
  get :index do
    @backgrounds = Background.all
    
    render 'backgrounds/index'
  end
  
    post :upload do
      background = Background.create(:name => params[:name], :file => File.open('/var/www/fhsclock/public/img/backgrounds/sea-green.jpg', 'r'))
      
      if background.save
        flash[:notice] = "Your background has been uploaded."
        redirect url(:backgrounds, :index)
      else
        flash[:error] = "Something went wrong and your background was not uploaded."
        redirect url(:backgrounds, :index)
      end
    end
    
    post :activate do
      Background.set({:active => true}, :active => false)
    
      background = Background.find(params[:id])
      background.active = true
      
      if background.save
        flash[:notice] = "The background has been created."
        redirect url(:backgrounds, :index)
      else
        flash[:error] = "The background has not been created."
        redirect url(:backgrounds, :index)
      end
    end
    
    delete :destroy do
      background = Background.find(params[:id])
      
      if background.destroy
        flash[:notice] = "The background hath been destroyed."
        redirect url(:backgrounds, :index)
      else
        flash[:error] = "Something went wrong and the background hath not been destroyed."
        redirect url(:backgrounds, :index)
      end
    end
  
end
