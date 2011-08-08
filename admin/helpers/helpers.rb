Admin.helpers do
  def local(time)
    time = time.localtime("-04:00")
    time.strftime("%I:%M%P")
  end
end
