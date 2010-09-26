### Clock.
###   file: app/controllers/public.rb

get '/' do
  @schedule = Schedule.first(:active => true)
  @periods = Period.all(:belongs_to => @schedule.id, :order => [:number.desc])
  @marquees = Marquee.all
  
  erb :clock, :layout => false
end
