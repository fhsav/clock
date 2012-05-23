# FHS Clock
#   file: application.v2.coffee

class Clock
  constructor: ->
    @d = new Date()

  # Update the clock.
  run: ->
    setTimeout (=>
      @clock()
      @highlight()
      @afterschool()

      run()
    ), 0

  # Fill in the time elements.
  clock: =>
    $("p#date").html @currentDate()
    $("p#time").html @currentTime()

  currentDate: =>
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    day = @d.getDay()
    month = @d.getMonth()
    date = @d.getDate()
    year = @d.getFullYear()

    "#{days[day]}, #{months[month]} #{date}, #{year}"

  currentTime: =>
    hour = @d.getHours()
    minute = @d.getMinutes()
    second = @d.getSeconds()

    if minute < 10
      minute = "0" + minute

    if second < 10
      second = "0" + second

    if hour > 12
      hour = hour - 12
    else if hour == 0
      hour = 12
    else
      hour = hour # Placeholder

    "#{hour}:#{minute}:#{second}"

  time: =>
    (@d.getHours() * 3600) + (@d.getMinutes() * 60) + @d.getSeconds()

  highlight: =>
    $("ol#periods li").each (index) =>
      e = $(this)

      start = e.find("time.start").attr("datetime")
      finish = e.find("time.finish").attr("datetime") - 60

      if time >= start and time <= finish # If the current period.
        e.switchClass "", "active", 1000
      else
        e.switchClass "active", "", 1000

      if time > finish
        e.delay(500).slideUp "slow", ->
          e.detach

  afterschool: =>

fhs = new Clock()
fhs.run()

$(document).ready ->
  $("#marquee").marquee pauseOnHover: false
    
  $('video[loop="loop"]').bind "ended", ->
    @play()
    
  pusher = new Pusher("4f803f0cec789e485391")
  channel = pusher.subscribe("refreshes")
  channel.bind "refresh", (data) ->
    window.location.href = window.location.href
