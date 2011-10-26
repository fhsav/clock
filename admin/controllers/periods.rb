Admin.controllers :periods, :parent => :schedules do
  
  # POST /admin/schedules/:schedule_id/periods/create
  post :create do
    schedule = Schedule.find(params[:id])
    
    parameters = params[:period]
    
    start = parameters[:start].to_s
    finish = parameters[:finish].to_s
    
    if !start.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/) or !finish.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/)
      flash[:error] = "That isn't a time, you dope. #{start}"
      redirect url(:schedules, :edit, :id => schedule.id)
    end
    
    if parameters[:number].blank?
      parameters[:number] = schedule.periods.count + 1
    end
    
    period = Period.create(
      :number => parameters[:number],
      :text => parameters[:text],
      :start => start,
      :finish => finish
    )
    
    if period.save and schedule.periods << period
      flash[:notice] = "The period has been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    else
      flash[:error] = "Something went wrong and the period has not been created."
      redirect url(:schedules, :edit, :id => schedule.id)
    end
  end
  
  # GET /admin/schedules/:schedule_id/periods/edit/:id
  get :edit, :with => :id do
    @period = Period.find(params[:id])
    @schedule = Schedule.find(params[:schedules_id])
    
    render 'periods/edit'
  end
  
    # PUT /admin/schedules/:schedule_id/periods/modify
    put :modify do
      period = Period.find(params[:id])
      
      parameters = params[:period]
    
      start = parameters[:start].to_s
    finish = parameters[:finish].to_s
      
      if !start.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/) or !finish.match(/^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$/)
        flash[:error] = "That isn't a time!"
        redirect url(:schedules, :edit, :id => params[:s_id])
      end
      
      if period.update_attributes(
        :number => parameters[:number],
        :text => parameters[:text],
        :start => start,
        :finish => finish
      )
        flash[:notice] = "The period has been modified."
        redirect url(:schedules, :edit, :id => params[:s_id])
      else
        flash[:error] = "Somethng went wrong and the period has not been modified."
        redirect url(:schedules, :edit, :id => params[:s_id])
      end
    end
    
    # DELETE /admin/schedules/:schedule_id/periods/destroy
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
