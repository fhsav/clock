Clock.helpers do
  def local(time)
    time = time.localtime("-04:00")
    time.strftime("%I:%M%P")
  end
  
  def seconds(time)
    time = time.localtime("-04:00")
    hours = time.hour * 3600
    minutes = time.min * 60
    hours + minutes
  end
end
