Clock::API.controller :clock, :provides => [:json, :xml] do
  get :index do
    hsh = {}

    if theme = Theme.activated
      hsh[:theme] = theme
    end

    if schedule = Schedule.where(:active => true).first
      hsh[:schedule] = {
        :name => schedule.name,
        :description => schedule.description
      }

      if periods = schedule.periods
        hsh[:schedule][:periods] = []

        periods.each do |period|
          hsh[:schedule][:periods] << {
            :number => period.number,
            :text => period.text,
            :start => period.start,
            :finish => period.finish
          }
        end
      end
    end

    if marquees = Marquee.all
      hsh[:marquees] = []

      marquees.each do |marquee|
        hsh[:marquees] << marquee.text
      end
    end

    if notices = Notice.all
      hsh[:notices] = []

      notices.each do |notice|
        hsh[:notices] << notice.text
      end
    end

    hsh.to_json
  end
end
