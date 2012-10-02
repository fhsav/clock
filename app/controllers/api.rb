Clock.controllers :api do
  get :time, :provides => [:json] do
    # Wed, 09 Aug 1995 00:00:00

    result = Hash.new
    result[:time] = Time.now.strftime("%a, %d %b %Y %H:%M:%S")
    result[:iso] = Time.now.strftime("%a, %F %T")
    result.to_json
  end
end