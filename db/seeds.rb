# In case the database is gone, we have some data to start with.

r = Schedule.new(
  :name => "Regular Day",
  :description => "A normal school day with nine periods.",
  :active => true,
  :periods => [
    Period.create(
      :number => 1,
      :text => "Period 1",
      :start => "07:32",
      :finish => "08:14"
    ),
    Period.create(
      :number => 2,
      :text => "Period 2",
      :start => "08:18",
      :finish => "09:01"
    ),
    Period.create(
      :number => 3,
      :text => "Period 3",
      :start => "09:05",
      :finish => "09:47"
    ),
    Period.create(
      :number => 4,
      :text => "Period 4",
      :start => "09:51",
      :finish => "10:33"
    ),
    Period.create(
      :number => 5,
      :text => "Period 5",
      :start => "10:37",
      :finish => "11:19"
    ),
    Period.create(
      :number => 6,
      :text => "Period 6",
      :start => "11:23",
      :finish => "12:05"
    ),
    Period.create(
      :number => 7,
      :text => "Period 7",
      :start => "12:09",
      :finish => "12:51"
    ),
    Period.create(
      :number => 8,
      :text => "Period 8",
      :start => "12:55",
      :finish => "13:37"
    ),
    Period.create(
      :number => 9,
      :text => "Period 9",
      :start => "13:41",
      :finish => "14:23"
    )
  ]
)

if r.save
  puts "=> Regular day schedule created."
end


f = Schedule.new(
  :name => "Friday",
  :description => "A normal day plus homeroom.",
  :active => false,
  :periods => [
    Period.create(
      :number => 1,
      :text => "Period 1",
      :start => "07:32",
      :finish => "08:13"
    ),
    Period.create(
      :number => 2,
      :text => "Period 2",
      :start => "08:17",
      :finish => "08:59"
    ),
    Period.create(
      :number => 3,
      :text => "Homeroom",
      :start => "09:03",
      :finish => "09:13"
    ),
    Period.create(
      :number => 4,
      :text => "Period 3",
      :start => "09:17",
      :finish => "09:58"
    ),
    Period.create(
      :number => 5,
      :text => "Period 4",
      :start => "10:02",
      :finish => "10:43"
    ),
    Period.create(
      :number => 6,
      :text => "Period 5",
      :start => "10:47",
      :finish => "11:27"
    ),
    Period.create(
      :number => 7,
      :text => "Period 6",
      :start => "11:31",
      :finish => "12:11"
    ),
    Period.create(
      :number => 8,
      :text => "Period 7",
      :start => "12:15",
      :finish => "12:55"
    ),
    Period.create(
      :number => 9,
      :text => "Period 8",
      :start => "12:59",
      :finish => "13:39"
    ),
    Period.create(
      :number => 10,
      :text => "Period 9",
      :start => "13:43",
      :finish => "14:23"
    )
  ]
)

if f.save
  puts "=> Friday schedule created."
end
