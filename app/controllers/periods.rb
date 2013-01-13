Clock.controllers :periods, :parent => :schedules do
  before do
    redirect!

    @s = Schedule.find(params[:schedule_id])
  end
  
  post :create do
    if !params[:period][:number].blank?
      number = params[:period][:number]
    else
      number = @s.periods.count + 1
    end

    unless time?(params[:period][:start]) == nil and time?(params[:period][:finish]) == nil
      p = Period.create(params[:period])
      p.number = number

      if @s.periods << p
        flash[:notice] = "The period has been created."
        redirect url(:schedules, :edit, :id => @s.id)
      else
        flash[:error] = "Something went wrong and the period has not been created."
        redirect url(:schedules, :edit, :id => @s.id)
      end
    else
      flash[:error] = "That's not a time!"
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end
  
  get :edit, :map => "/schedules/:schedule_id/periods/:id/edit" do
    @period = Period.find(params[:id])
    
    render 'periods/edit'
  end

  put :modify do
    p = Period.find(params[:id])
    
    if p.update_attributes(params[:period])
      flash[:notice] = "The period has been modified."
      redirect url(:schedules, :edit, :id => @s.id)
    else
      flash[:error] = "Somethng went wrong and the period has not been modified."
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end
  
  delete :destroy do
    p = Period.find(params[:id])

    if p.destroy
      flash[:notice] = "The period has been destroyed."
      redirect url(:schedules, :edit, :id => @s.id)
    else
      flash[:error] = "Something went wrong and the period has not been destroyed."
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end
end
