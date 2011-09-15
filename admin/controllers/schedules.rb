Admin.controllers :schedules do
  
  # GET /admin/schedules
  get :index do
    @schedules = Schedule.all
    
    render 'schedules/index'
  end
  
    # POST /admin/schedules/activate
    post :activate do
      Schedule.set({:active => true}, :active => false)
    
      schedule = Schedule.find(params[:id])
      schedule.active = true
      
      if schedule.save
        flash[:notice] = "The schedule #{schedule.name} has been activated."
        redirect url(:schedules, :index)
      else
        flash[:error] = "Something went wrong and the schedule #{schedule.name} was not activated."
        redirect url(:schedules, :index)
      end
    end
    
    # POST /admin/schedules/create
    post :create do
      schedule = Schedule.create(params[:schedule])
      schedule.active = false

      if schedule.save
        flash[:notice] = "The schedule #{schedule.name} has been created."
        redirect url(:schedules, :edit, :id => schedule.id)
      else
        flash[:error] = "Something went wrong and the schedule was not saved."
        redirect url(:schedules, :index)
      end
    end
    
  # GET /admin/schedules/edit/:id
  get :edit, :with => :id do
    @schedule = Schedule.find(params[:id])
    
    render 'schedules/edit'
  end
  
    # PUT /admin/schedules/modify
    put :modify do
      schedule = Schedule.find(params[:id])
      
      if schedule.update_attributes(params[:schedule])
        flash[:notice] = "The schedule #{schedule.name} has been modified"
        redirect url(:schedules, :edit, :id => schedule.id)
      else
        flash[:error] = "Something went wrong and the schedule #{schedule.name} was not modified."
        redirect url(:schedules, :edit, :id => schedule.id)
      end
    end
    
    # DELETE /admin/schedules/destroy
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
