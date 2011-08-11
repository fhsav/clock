Clock.helpers do
  def local(time)
    time = time.to_i - 14400
    time.strftime("%I:%M%P")
  end
  
  def seconds(time)
    time = time - 14400
    hours = time.hour * 3600
    minutes = time.min * 60
    hours + minutes
  end
end
