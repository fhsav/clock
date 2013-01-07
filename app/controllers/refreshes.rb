Clock.controllers :refreshes do
  before do
    redirect!
  end

  post :create do
  	if Pusher["refreshes"].trigger!("refresh", { :timestamp => Time.now })
    	flash[:notice] = "Refreshed!"
    	redirect params[:redirect]
    else
    	flash[:error] = "Something has gone awry."
    	redirect params[:redirect]
    end
  end
end