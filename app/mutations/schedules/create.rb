class Schedule
  class Create < Mutations::Command
    required do
      hash :schedule do
        string :name
        string :description, :empty => true
      end
    end

    def execute
      s = Schedule.new(schedule)
      s.save

      return s
    end
  end
end
