Admin.controllers :schedules do
  
  get :index do
    @schedules = Schedule.all
    
    render 'schedules/index'
  end
  
    post :activate do
      schedule = Schedule.find(params[:id])
      
      others = Schedule.all
      others.each do |other|
        other.active = false
      end
      
      schedule.active = true
      
      if schedule.save
        flash[:notice] = "The schedule #{schedule.name} has been activated."
        redirect url(:schedules, :edit, :id => schedule.id)
      else
        flash[:error] = "Something went wrong and the schedule #{schedule.name} was not activated."
        redirect url(:schedules, :edit, :id => schedule.id)
      end
    end
    
    post :create do
      schedule = Schedule.create(params[:schedule])
      
      if schedule.save
        flash[:notice] = "The schedule #{schedule.name} has been created."
        redirect url(:schedules, :edit, :id => schedule.id)
      else
        flash[:error] = "Something went wrong and the schedule was not saved."
        redirect url(:schedules, :index)
      end
    end
    
  get :edit, :with => :id do
    @schedule = Schedule.find(params[:id])
    
    render 'schedules/edit'
  end
  
    put :modify do
      schedule = Schedule.find(params[:id])
      
      if schedule.update_attributes(params[:schedule])
        flash[:notice] = "The schedule #{schedule.name} has been modified"
        redirect url(:schedules, :index)
      else
        flash[:error] = "Something went wrong and the schedule #{schedule.name} was not modified."
        redirect url(:schedules, :edit, :id => schedule.id)
      end
    end
    
    delete :destroy do
      schedule = Schedule.find(params[:id])
      
      if schedule.destroy
        flash[:notice] = "The schedule has been destroyed."
        redirect url(:schedules, :index)
      else
        flash[:error] = "Something went wrong and the schedule #{schedule.name} was not destroyed."
        redirect url(:schedules, :edit, :id => schedule.id)
      end
    end
  
end
