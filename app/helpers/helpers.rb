Clock.helpers do
  def local(time)
    time = time - 14400
    hour = time.strftime("%I")
    minute = time.strftime("%M")
    ampm = time.strftime("%P")
    
    if hour.to_i < 10
      hour = hour.to_s.slice!(0)
    end
    
    "#{hour}:#{minute}#{ampm}"
  end
  
  def seconds(time)
    time = time - 14400
    hours = time.hour * 3600
    minutes = time.min * 60
    hours + minutes
  end
end
