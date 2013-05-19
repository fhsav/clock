Clock::API.controllers :health, :provides => [:json, :xml] do
  get :ping do
    { :status => response.status }.to_json
  end
end
