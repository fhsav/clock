Admin.controllers :periods, :parent => :schedules do
  before do
    authenticated?
  end
  
  get :edit, :with => :id do
    @period = Period.find(params[:id])
    @schedule = Schedule.find(params[:schedule_id])
    
    render 'periods/edit'
  end
  
  post :create do
    schedule = Schedule.find(params[:id])
    
    start = Time.parse(params[:period][:start].to_s)
    finish = Time.parse(params[:period][:finish].to_s)
    
    if !params[:period][:number].blank?
      number = params[:period][:number]
    else
      number = schedule.periods.count + 1
    end
    
    period = Period.new(:number => number, :text => params[:period][:text], :start => start, :finish => finish)

    if period.save and schedule.periods << period
      flash[:notice] = "The period has been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    else
      flash[:error] = "Something went wrong and the period has not been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    end
  end

  put :modify do
    period = Period.find(params[:id])
    
    if !time?(params[:period][:start]) or !time?(params[:period][:finish])
      if !time?(params[:period][:start])
        flash[:error] = "#{params[:period][:start]} isn't a time!"
      else if! !time?(params[:period][:finish])
        flash[:error] = "#{params[:period][:finish]} isn't a time!"
      end
      redirect url(:periods, :edit, :id => period.id, :schedule_id => params[:s_id])
    end
    
    start = Time.parse(params[:period][:start])
    finish = Time.parse(params[:period][:finish])
    
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
