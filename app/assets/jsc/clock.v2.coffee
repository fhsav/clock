# Clock (v2)
#   file: clock.v2.coffee

class Clock

  # Creates a new Clock instance. Pass in a Date object
  constructor: (time) ->
    days: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

    adjusted_minute = "0" + time.getMinutes() if time.getMinutes() < 10
    adjusted_second = "0" + time.getSeconds() if time.getSeconds() < 10

    time_in_seconds = (time.getHours() * 3600) + (time.getMinutes() * 60) + time.getSeconds()

    @time = {
      day: days[time.getDay()]
      month: months[time.getMonth()]
      date: time.getDate()
      year: time.getFullYear()
      hour: time.getHours()
      minute: adjusted_minute
      second: adjusted_second
      in_seconds: time_in_seconds
    }

    console.log @time


  # Make sure the date and time appear on the right
  clock: ->
    $("p#date").html "#{@time.day}, #{@time.month} #{@time.date}, #{@time.year}"
    $("p#time").html "#{@time.hour}:#{@time.minute}:#{@time.second}"

  # Highlight the right period
  highlighter: ->

  # Transition to after school
  after: ->

setInterval (->
  new Clock(new Date())
), 60000
