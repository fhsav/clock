Clock::Web.helpers do

	# Get the current clock data.
	def clock_data
		@schedule = Schedule.activated

    @theme = Theme.activated

    @marquees = Marquee.sort(:updated_at)
    @notices = Notice.sort(:updated_at)
	end
end
