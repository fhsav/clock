class Period
  class Create < Mutations::Command
    required do
      hash :schedule do
        string :id
      end

      hash :period do
        integer :number
        string :text
        string :start
        string :finish
      end
    end

    def execute
      s = Schedule.find(schedule[:id])

      p = Period.new(period)

      s.periods << p
      s.save

      return p
    end
  end
end
