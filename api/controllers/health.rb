Clock::API.controllers :health, :provides => [:json, :xml] do
  get :ping do
    { :status => 200 }.to_json
  end
end
