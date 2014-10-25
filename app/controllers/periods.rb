Clock::Web.controllers :periods, :parent => :schedules do
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

    if time?(params[:period][:start]) && time?(params[:period][:finish])
      p = Period.new(params[:period])
      p.number = number

      if @s.periods << p
        if @s.active
          expire!('active_schedule')
        end

        flash[:notice] = 'The period has been created.'
        redirect url(:schedules, :edit, :id => @s.id)
      else
        flash[:error] = 'Something went wrong and the period has not been created.'
        redirect url(:schedules, :edit, :id => @s.id)
      end
    else
      flash[:error] = "That's not a time!"
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end

  get :edit, :map => '/schedules/:schedule_id/periods/:id/edit' do
    s = Schedule.find(params[:schedule_id])
    @period = s.periods.find(params[:id])

    render 'periods/edit'
  end

  put :modify do
    s = Schedule.find(params[:schedule_id])
    p = s.periods.find(params[:id])

    if p.update_attributes(params[:period])
      if s.active
        expire!('active_schedule')
      end

      flash[:notice] = 'The period has been modified.'
      redirect url(:schedules, :edit, :id => @s.id)
    else
      flash[:error] = 'Somethng went wrong and the period has not been modified.'
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end

  delete :destroy do
    s = Schedule.find(params[:schedule_id])
    p = s.periods.find(params[:id])

    if p.destroy
      if s.active
        expire!('active_schedule')
      end

      flash[:notice] = 'The period has been destroyed.'
      redirect url(:schedules, :edit, :id => @s.id)
    else
      flash[:error] = 'Something went wrong and the period has not been destroyed.'
      redirect url(:schedules, :edit, :id => @s.id)
    end
  end
end
