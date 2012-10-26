Clock.controllers :api do
  get :time, :provides => [:json] do
    result = Hash.new
    result[:ms] = (Time.now.to_f * 1000.0).to_i
    result.to_json
  end

  get :ping, :provides => [:json] do
    result = Hash.new

    if !Schedule.all.blank? && !Redis.get("password").blank?
      result[:code] = "200"
    else
      result[:code] = "503"
    end

    result.to_json
  end
end