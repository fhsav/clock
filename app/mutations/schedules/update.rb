class Schedule
  class Update < Mutations::Command
    required do
      hash :schedule do
        string :id
        string :name
        string :description
      end
    end

    def execute
      s = Schedule.find(schedule[:id])
      s.update_attributes(schedule)
      s.save

      return s
    end
  end
end
