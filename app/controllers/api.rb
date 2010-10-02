### Clock.
###   file: app/controllers/api.rb

### Marquee
post '/api/marquee/new' do
  @marquee = Marquee.new
  @marquee.attributes = {
    :string => params[:string]
  }
  @marquee.save
  
  redirect '/admin'
end

put '/api/marquee/edit' do
  @marquee = Marquee.first(:id => params[:id])
  @marquee.update(:string => params[:string])
  @marquee.save
  
  redirect '/admin'
end

delete '/api/marquee/delete' do
  @marquee = Marquee.first(:id => params[:id])
  @marquee.destroy
  
  redirect '/admin'
end

### Schedule
post '/api/schedule/new' do
  @schedule = Schedule.all.update(:active => false)

  @schedule = Schedule.new
  @schedule.attributes = {
    :name => params[:name],
    :active => true
  }
  @schedule.save
  
  redirect '/admin/schedule/' + @schedule.id.to_s + '/edit'
end

put '/api/schedule/edit' do
  @schedule = Schedule.first(:id => params[:id])
  @schedule.update(:name => params[:name])
  @schedule.save
  
  redirect '/admin/schedule' + @schedule.id.to_s + '/edit'
end

delete '/api/schedule/delete' do
  @schedule = Schedule.first(:id => params[:id])
  @schedule.destroy
  
  @periods = Period.all(:belongs_to => params[:id])
  @periods.destroy
  
  redirect '/admin'
end

### Period
post '/api/schedule/period/new' do
  @period = Period.new
  @period.attributes = {
    :string => params[:string],
    :start_time => params[:start_time],
    :end_time => params[:end_time],
    :belongs_to => params[:schedule_id]
  }
  @period.save
  
  redirect '/admin/schedule/' + params[:schedule_id] + '/edit'
end

put '/api/schedule/period/edit' do
  @period = Period.first(:id => params[:id])
  @period.update(:number => params[:name], :string => params[:string])
  @period.save
  
  @belongs_to = @period.belongs_to.to_s
  
  redirect '/admin/schedule/' + @belongs_to + '/edit'
end

delete '/api/schedule/period/delete' do
  @schedule = Schedule.first(:id => params[:schedule_id])

  @period = Period.first(:id => params[:id])
  
  @belongs_to = @period.belongs_to.to_s
  
  @period.destroy
  
  redirect '/admin/schedule/' + @belongs_to + '/edit'
end

### Login/Logout
post '/api/login' do
  password = params[:password]
  username = params[:username]
  
  if password == Clock.password and username == Clock.username
    session["fhsclock"] ||= 0
    session["fhsclock"] = 1
    
    redirect '/admin'
  else
    redirect '/login'
  end
end

post '/api/logout' do
  if session["fhsclock"] != 0
    session["fhsclock"] = 0
    redirect '/admin'    
  end
end
