Admin.controllers :periods, :parent => :schedules do
  
  post :create do
    schedule = Schedule.find(params[:id])
    
    period = Period.create(params[:period])
    
    if period.save and schedule.periods << period
      flash[:notice] = "The period has been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    else
      flash[:error] = "Something went wrong and the period has not been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    end
  end
  
  get :edit, :with => :id do
    @period = Period.find(params[:id])
    @schedule = Schedule.find(params[:schedules_id])
    
    render 'periods/edit'
  end
  
    put :modify do
      period = Period.find(params[:id])
      
      if period.update_attributes(params[:period])
        flash[:notice] = "The period has been modified."
        redirect url(:schedules, :edit, :id => params[:s_id])
      else
        flash[:error] = "Somethng went wrong and the period has not been modified."
        redirect url(:schedules, :edit, :id => params[:s_id])
      end
    end
  
    delete :destroy do
      period = Period.find(params[:id])
      
      if period.destroy
        flash[:notice] = "The period has been destroyed."
        redirect url(:schedules, :edit, :id => params[:s_id])
      else
        flash[:error] = "Something went wrong and the period has not been destroyed."
        redirect url(:schedules, :edit, :id => params[:s_id])
      end
    end
  
end
