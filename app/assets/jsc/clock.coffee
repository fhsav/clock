# Clock
#   file: clock.coffee

setInterval (->

  # Date variables, etc.
  d = new Date()
  day = d.getDay()
  month = d.getMonth()
  date = d.getDate()
  year = d.getFullYear()
  hour = d.getHours()
  minute = d.getMinutes()
  second = d.getSeconds()

  days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  time = (hour * 3600) + (minute * 60) + second

  minute = "0" + minute if minute < 10
  second = "0" + second if second < 10

  hour = (if (hour > 12) then hour - 12 else hour)
  hour = (if (hour is 0) then 12 else hour)


  # Append date and time to clock.
  $("p#date").html "#{days[day]}, #{months[month]} #{date}, #{year}"
  $("p#time").html "#{hour}:#{minute}:#{second}"


  # Check what period it is and respond appropriately.
  $("#periods ol li").each (index) ->
    e = $(@)

    start = e.find("time.start").attr("datetime")
    finish = e.find("time.finish").attr("datetime")

    if time >= start and time <= finish
      e.addClass "active"
    else
      e.removeClass "active"

    if time > finish and time < e.next().find("time.start").attr("datetime")
      e.css "border-bottom", "10px solid rgba(0, 0, 0, 0.5)"
    else
      e.css "border-bottom", "1px solid rgba(0, 0, 0, 0.5)"

    if time >= finish and $("#periods ol li").size() > 10
      e.slideUp 'slow', ->
        e.hide()


  # Check if it's after school and respond appropriately.
  final = $("#periods ol li:last-child").find("time.finish").attr("datetime")


  # Check if period list is empty.
  if $("#periods ol li").length == 0
    $("#main").addClass "true"


  # Check if schedule exists.
  if time > final or !$("#periods").length
    $("#main").addClass "after"
  else
    $("#main").removeClass "after"

), 1000

setInterval (->
  $.get("/api/health/ping.json", ->
    $('.error').hide()
  ).error ->
    $('.error').show()
    console.log 'Cannot connect to server'
), 60000

# Stuff used once per load.
$(document).ready ->

  # Marquee
  $("#marquee ul").marquee pauseOnHover: false

  console.log "Hello there web traveler! What are you doing here? Check out the code for the Clock on GitHub at https://github.com/fhsav/clock."
