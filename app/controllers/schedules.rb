Clock.controllers :schedules do
  before do
    redirect!
  end
  
  get :index do
    @schedules = Schedule.sort(:name)
    
    render 'schedules/index'
  end
  
  post :activate do
    Schedule.set({:active => true}, :active => false)

    s = Schedule.find(params[:id])
    s.active = true

    if s.save
      flash[:notice] = "The schedule #{s.name} has been activated."
      redirect url(:schedules, :index)
    else
      flash[:error] = "Something went wrong and the schedule #{s.name} was not activated."
      redirect url(:schedules, :index)
    end
  end
  
  post :create do
    s = Schedule.new(params[:schedule])

    if s.save
      flash[:notice] = "The schedule #{s.name} has been created."
      redirect url(:schedules, :edit, :id => s.id)
    else
      flash[:error] = "Something went wrong and the schedule was not saved."
      redirect url(:schedules, :index)
    end
  end

  get :edit, :map => "/schedules/:id/edit" do
    @schedule = Schedule.find(params[:id])

    render 'schedules/edit'
  end

  put :modify do
    s = Schedule.find(params[:id])
    
    if s.update_attributes(params[:schedule])
      flash[:notice] = "The schedule #{s.name} has been modified."
      redirect url(:schedules, :index)
    else
      flash[:error] = "Something went wrong and the schedule #{s.name} was not modified."
      redirect url(:schedules, :edit, :id => s.id)
    end
  end
  
  delete :destroy do
    s = Schedule.find(params[:id])
    
    if s.destroy
      flash[:notice] = "The schedule has been destroyed."
      redirect url(:schedules, :index)
    else
      flash[:error] = "Something went wrong and the schedule #{s.name} was not destroyed."
      redirect url(:schedules, :view, :id => s.id)
    end
  end
end
