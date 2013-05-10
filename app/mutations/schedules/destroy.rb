class Schedule
  class Destroy < Mutations::Command
    required do
      hash :schedule do
        string :id
      end
    end

    def execute
      s = Schedule.find(schedule[:id])
      s.destroy
    end
  end
end
