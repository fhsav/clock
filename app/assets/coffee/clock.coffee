clock = ->
  d = new Date()
  day = d.getDay()
  month = d.getMonth()
  date = d.getDate()
  year = d.getFullYear()
  hour = d.getHours()
  minute = d.getMinutes()
  second = d.getSeconds()
  dayArray = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
  monthArray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
  date = "0" + date  if date < 10
  if hour >= 12
    am_pm = "PM"
  else am_pm = "AM"  if hour < 12
  minute = "0" + minute  if minute < 10
  second = "0" + second  if second < 10
  hour = (if (hour > 12) then hour - 12 else hour)
  hour = (if (hour == 0) then 12 else hour)
  $("p#date").html dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + ""
  $("p#time").html hour + ":" + minute + ":" + second + " " + am_pm
  $(document).ready ->
    final_period = $("ol#periods li:last-child")
    final_time = final_period.find("time.finish").attr("datetime")
    d = new Date()
    time = (d.getHours() * 3600) + (d.getMinutes() * 60)
    if final_time < time
      $("#after").css "display", "block"
      $("#during").css "display", "none"
    else
      $("#during").css "display", "block"
      $("#after").css "display", "none"
    $("ol#periods li").each (index) ->
      element = $(this)
      start = element.find("time.start").attr("datetime")
      finish = element.find("time.finish").attr("datetime")
      finish = finish - 60
      time = (d.getHours() * 3600) + (d.getMinutes() * 60)
      if time >= start and time <= finish
        element.attr "id", "active"
      else
        element.attr "id", ""
      next = element.next()
      next_start = next.find("time.start").attr("datetime")
      next_start = next_start
      if time > finish and time < next_start
        element.css "border-bottom", "10px solid #000"
      else
        element.css "border-bottom", "1px solid #000"
setInterval "clock()", 0
$(document).ready ->
  $("#marquee").marquee()
