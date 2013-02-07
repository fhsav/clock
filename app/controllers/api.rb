Clock.controllers :api do
	get :clock, :provides => [:json] do
		clock_data

		result = Hash.new
		result[:theme] = @theme
		result[:schedules] = @schedule
		result[:schedules][:periods] = @schedule.periods
		result[:marquee] = @marquees
		result[:notices] = @notices

		result.to_json
	end
end