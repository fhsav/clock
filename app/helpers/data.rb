Clock::Web.helpers do

  # Get the current clock data.
  def clock_data
    @schedule = cache('active_schedule', :expires_in => 86400) do
      @s = Schedule.activated
      partial 'clock/schedule'
    end

    @notices = cache('active_notices', :expires_in => 86400) do
      @n = Notice.all.to_a
      partial 'clock/notices'
    end

    @theme = Theme.activated

    @marquees = cache('active_marquees', :expires_in => 86400) do
      @m = Marquee.all.to_a
      partial 'clock/marquees'
    end
  end
end
