Clock.helpers do

  # Get the current data.
  def current_data
    @schedule = Schedule.activated

    @theme = Theme.activated

    @marquees = Marquee.all
    @notices = Notice.all
  end
end