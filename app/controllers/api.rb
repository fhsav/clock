Clock.controllers :api do
  get :time, :provides => [:json] do
    result = Hash.new
    result[:ms] = (Time.now.to_f * 1000.0).to_i
    result.to_json
  end

  get :status, :provides => [:json] do
    result = Hash.new

    if !MongoMapper.connection.database_info.blank? && !Redis.get("password").blank?
      result[:code] = "200 OK"
    else
      result[:code] = "503 UNAVAILABLE"
    end

    result.to_json
  end
end