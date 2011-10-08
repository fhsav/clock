class String
  def initial
    self[0,1]
  end
end

Clock.helpers do
  def local(time)
    time = time - 14400
    hour = time.strftime("%I")
    minute = time.strftime("%M")
    ampm = time.strftime("%P")
    
    if hour.to_s.initial == "0"
      hour = hour.to_s.slice!(1)
    end
    
    "#{hour}:#{minute}"
  end
  
  def seconds(time)
    time = time - 14400
    hours = time.hour * 3600
    minutes = time.min * 60
    hours + minutes
  end
end
