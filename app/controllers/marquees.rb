Clock.controllers :marquees do
  before do
    redirect!
  end
  
  get :index do
    @marquees = Marquee.all
    
    render 'marquees/index'
  end

  post :create do
    m = Marquee.new(params[:marquee])
    
    if m.save
      flash[:notice] = "The marquee has been created."
      redirect url(:marquees, :index)
    else
      flash[:error] = "Something went wrong and the marquee was not created."
      redirect url(:marquees, :index)
    end
  end
  
  get :edit, :map => "/marquees/:id/edit" do
    @marquee = Marquee.find(params[:id])
    
    render 'marquees/edit'
  end
  
  patch :update do
    m = Marquee.find(params[:id])
    
    if m.update_attributes(params[:marquee])
      flash[:notice] = "The marquee has been modified."
      redirect url(:marquees, :index)
    else
      flash[:error] = "Something went wrong and the marquee was not modified."
      redirect url(:marquees, :edit, :id => marquee.id)
    end
  end
  
  delete :destroy do
    m = Marquee.find(params[:id])
    
    if m.destroy
      flash[:notice] = "The marquee has been destroyed."
      redirect url(:marquees, :index)
    else
      flash[:error] = "Something went wrong and the marquee was not destroyed."
      redirect url(:marquees, :index)
    end
  end
end
