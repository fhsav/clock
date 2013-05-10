class Schedule
  class Activate < Mutations::Command
    required do
      hash :schedule do
        string :id
      end
    end

    def execute
      Schedule.all.each do |s|
        s.active = false
        s.save
      end

      s = Schedule.find(schedule[:id])
      s.active = true
      s.save

      return s
    end
  end
end
