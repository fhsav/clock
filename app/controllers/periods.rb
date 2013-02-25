Clock.controllers :periods, :parent => :schedules do
  before do
    redirect!

    @s = Schedule.find(params[:schedule_id])
  end

  post :create do
    unless time?(params[:period][:start]) == nil and time?(params[:period][:finish]) == nil
      p = Period.new(params[:period])

      if @s.periods << p && @s.save
        flash[:notice] = "The period has been created."
        redirect url(:schedules, :view, :id => @s.id)
      else
        flash[:error] = "Something went wrong and the period has not been created."
        redirect url(:schedules, :view, :id => @s.id)
      end
    else
      flash[:error] = "That's not a time!"
      redirect url(:schedules, :view, :id => @s.id)
    end
  end

  get :edit, :map => "/schedules/:schedule_id/periods/:id/edit" do
    @period = @s.periods.find(params[:id])

    render 'periods/edit'
  end

  patch :update do
    p = @s.periods.find(params[:id])

    if p.update_attributes(params[:period])
      flash[:notice] = "The period has been updated."
      redirect url(:schedules, :view, :id => @s.id)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:schedules, :view, :id => @s.id)
    end
  end

  delete :destroy do
    p = @s.periods.find(params[:id])

    if @s.periods.delete_at(@s.periods.find_index(p))
      flash[:notice] = "The period has been destroyed."
      redirect url(:schedules, :view, :id => @s.id)
    else
      flash[:error] = "Something has gone awry."
      redirect url(:schedules, :view, :id => @s.id)
    end
  end
end
