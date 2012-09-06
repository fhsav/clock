Clock.controllers :refreshes do
  before do
    redirect!
  end

  post :create do
    client = Faye::Client.new('http://localhost:5000/faye')
    client.publish('/refreshes', 'timestamp' => Time.now)

    flash[:notice] = "Refreshed!"
    redirect params[:redirect]
  end
end