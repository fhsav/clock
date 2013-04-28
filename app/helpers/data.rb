Clock::Web.helpers do

	# Get the current clock data.
	def clock_data
		@main = cache('active_main', :expires_in => 86400) do
      @s = Schedule.activated.first
      @n = Notice.sort(:updated_at)

      partial 'clock/main'
    end

    @theme = Theme.activated

    @marquees = cache('active_marquees', :expires_in => 86400) do
      @m = Marquee.sort(:updated_at)

      partial 'clock/marquees'
    end
	end
end
