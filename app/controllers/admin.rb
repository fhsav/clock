### Clock.
###   file: app/controllers/admin.rb

# Index
get '/admin' do
  @schedules = Schedule.all
  @marquees = Marquee.all

  erb :'admin/index'
end

# Schedule
get '/admin/schedule/:id/edit' do
  @schedule = Schedule.first(:id => params[:id])
  @periods = Period.all(:belongs_to => params[:id], :order => [:number.desc])
  
  erb :'admin/schedule/edit'
end
get '/admin/schedule/:id/delete' do
  @schedule = Schedule.first(:id => params[:id])

  erb :'admin/schedule/delete'
end

# Period
get '/admin/schedule/:s_id/period/:p_id/edit' do
  @schedule = Schedule.first(:id => params[:s_id])
  @period = Period.first(:belongs_to => params[:s_id], :id => params[:p_id])

  erb :'admin/period/edit'
end

get '/admin/schedule/:s_id/period/:p_id/delete' do
  @period = Period.first(:belongs_to => params[:s_id], :id => params[:p_id])

  erb :'admin/period/delete'
end

# Marquee
get '/admin/marquee/:id/edit' do
  @marquee = Marquee.first(:id => params[:id])
  
  erb :'admin/marquee/edit'
end
get '/admin/marquee/:id/delete' do
  @marquee = Marquee.first(:id => params[:id])

  erb :'admin/marquee/delete'
end
