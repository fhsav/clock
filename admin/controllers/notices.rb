Admin.controllers :notices do

  before do
    authenticated?
  end
  
  # GET /admin/notices
  get :index do
    @notices = Notice.all
    
    render 'notices/index'
  end
  
    # POST /admin/notices/create
    post :create do
      notice = Notice.create(params[:notice])
      notice.urgent = params[:urgent] ? 1 : 0 
      
      if notice.save
        flash[:notice] = "The notice has been created."
        redirect url(:notices, :index)
      else
        flash[:error] = "Something went wrong and the notice has not been created."
        redirect url(:notices, :index)
      end
    end
    
  # GET /admin/notices/edit/:id
  get :edit, :with => :id do
    @notice = Notice.find(params[:id])
    
    render 'notices/edit'
  end
  
    # PUT /admin/notices/modify
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
    
    # DELETE /admin/notices/destroy
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
