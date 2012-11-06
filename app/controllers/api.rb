Clock.controllers :api do
  get :time, :provides => [:json] do
    result = Hash.new
    result[:ms] = (Time.now.to_f * 1000.0).to_i
    result.to_json
  end
end