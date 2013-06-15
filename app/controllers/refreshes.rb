Clock::Web.controllers :refreshes do
  before do
    redirect!
  end

  post :create do
    client = Faye::Client.new('http://localhost:5000/faye')

    if client.publish('/refreshes', 'timestamp' => Time.now)
      flash[:notice] = 'Refreshed!'
      redirect params[:redirect]
    else
      flash[:error] = 'Something has gone awry.'
      redirect params[:redirect]
    end
  end
end
