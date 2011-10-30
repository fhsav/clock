Admin.controllers :marquees do
  
  # GET /admin/marquees
  get :index do
    @marquees = Marquee.all
    
    render 'marquees/index'
  end
    
    # POST /admin/marquees/create
    post :create do
      marquee = Marquee.create(params[:marquee])
      
      if marquee.save
        flash[:notice] = "The marquee has been created."
        redirect url(:marquees, :index)
      else
        flash[:error] = "Something went wrong and the marquee was not created."
        redirect url(:marquees, :index)
      end
    end
    
  # GET /admin/marquees/edit/:id
  get :edit, :with => :id do
    @marquee = Marquee.find(params[:id])
    
    render 'marquees/edit'
  end
  
    # PUT /admin/marquees/modify
    put :modify do
      marquee = Marquee.find(params[:id])
      
      if marquee.update_attributes(params[:marquee])
        flash[:notice] = "The marquee has been modified."
        redirect url(:marquees, :index)
      else
        flash[:error] = "Something went wrong and the marquee was not modified."
        redirect url(:marquees, :edit, :id => marquee.id)
      end
    end
    
    # DELETE /admin/marquees/destroy
    delete :destroy do
      marquee = Marquee.find(params[:id])
      
      if marquee.destroy
        flash[:notice] = "The marquee has been destroyed."
        redirect url(:marquees, :index)
      else
        flash[:error] = "Something went wrong and the marquee was not destroyed."
        redirect url(:marquees, :index)
      end
    end
  
end
