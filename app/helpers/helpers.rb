class String
  def initial
    self[0,1]
  end
end

Clock.helpers do
  def local(time)
    if time
      time = TZ.utc_to_local(time)
      
      hour = time.strftime("%I")
      minute = time.strftime("%M")
      
      if hour.to_s.initial == "0"
        hour = hour.to_s.slice!(1)
      end
      
      "#{hour}:#{minute}"
    end
  end
  
  def seconds(time)
    if time
      time = TZ.utc_to_local(time)
      
      hours = time.hour * 3600
      minutes = time.min * 60
      
      hours + minutes
    end
  end
end
