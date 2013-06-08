Clock::Web.helpers do

	# Get the current clock data.
	def clock_data
		@main = cache('active_main', :expires_in => 86400) do
      @s = Schedule.activated
      @n = Notice.all.to_a

      partial 'clock/main'
    end

    @theme = Theme.activated

    @marquees = cache('active_marquees', :expires_in => 86400) do
      @m = Marquee.all.to_a

      partial 'clock/marquees'
    end
	end
end
