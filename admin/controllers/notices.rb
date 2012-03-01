Admin.controllers :notices do
  before do
    authenticated?
  end
  
  get :index do
    @notices = Notice.all
    
    render 'notices/index'
  end
  
  get :edit, :with => :id do
    @notice = Notice.find(params[:id])
    
    render 'notices/edit'
  end
  
  post :create do
    notice = Notice.new(params[:notice])
    notice.urgent = params[:urgent] ? 1 : 0 
    
    if notice.save
      flash[:notice] = "The notice has been created."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something went wrong and the notice has not been created."
      redirect url(:notices, :index)
    end
  end
  
  put :modify do
    notice = Notice.find(params[:id])
    notice.urgent = params[:urgent] ? 1 : 0 
    
    if notice.update_attributes(params[:notice])
      flash[:notice] = "The notice has been modified."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something went wrong and notice has not been modified."
      redirect url(:notices, :index)
    end
  end
  
  delete :destroy do
    notice = Notice.find(params[:id])
    
    if notice.destroy
      flash[:notice] = "The notice has been destroyed."
      redirect url(:notices, :index)
    else
      flash[:eror] = "Something went wrong and the notice has not been destroyed."
      redirect url(:notices, :index)
    end
  end
end
