namespace :db do
  task :cleanse do
    if schedules = Schedule.all
      schedules.each do |schedule|
        schedule.periods.each do |period|
          period.destroy
        end
        
        schedule.destroy
      end
    end
    
    if marquees = Marquee.all
      marquees.each do |marquee|
        marquee.destroy
      end
    end
    
    if notices = Notice.all
      notices.each do |notice|
        notice.destroy
      end
    end
  end
end
