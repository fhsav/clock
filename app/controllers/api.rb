Clock.controllers :api do

  get :marquee, :provides => :json do
    Marquee.all.to_json
  end
  
  get :periods, :provides => :json do
    Schedule.first(:active => true).periods.to_json
  end
  
  get :notices, :provides => :json do
    Notice.all.to_json
  end

end
