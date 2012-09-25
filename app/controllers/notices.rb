Clock.controllers :notices do
  before do
    redirect!
  end
  
  get :index do
    @notices = Notice.all
    
    render 'notices/index'
  end

  post :create do
    n = Notice.new(params[:notice])
    
    if n.save
      flash[:notice] = "The notice has been created."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something went wrong and the notice was not created."
      redirect url(:notices, :index)
    end
  end
  
  get :edit, :map => "/notices/:id/edit" do
    @notice = Notice.find(params[:id])
    
    render 'notices/edit'
  end
  
  put :modify do
    n = Notice.find(params[:id])
    
    if n.update_attributes(params[:notice])
      flash[:notice] = "The notice has been modified."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something went wrong and the notice was not modified."
      redirect url(:notices, :edit, :id => notice.id)
    end
  end
  
  delete :destroy do
    n = Notice.find(params[:id])
    
    if n.destroy
      flash[:notice] = "The notice has been destroyed."
      redirect url(:notices, :index)
    else
      flash[:error] = "Something went wrong and the notice was not destroyed."
      redirect url(:notices, :index)
    end
  end
end
