# FHS Clock
#   file: application.coffee
 
(clock = ->
  
  # Changing elements. Will change every 0 seconds.
  setTimeout (->
    
    # Date variabes.
    d = new Date()
    day = d.getDay()
    month = d.getMonth()
    date = d.getDate()
    year = d.getFullYear()
    hour = d.getHours()
    minute = d.getMinutes()
    second = d.getSeconds()
    
    # Month and day names.
    dayArray = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
    monthArray = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
    
    # Append a 0 if less than 10.
    date = "0" + date  if date < 10
    minute = "0" + minute  if minute < 10
    second = "0" + second  if second < 10
    
    # AM/PM.
    if hour >= 12
      am_pm = "PM"
    else am_pm = "AM"  if hour < 12
    
    # Not sure...
    hour = (if (hour > 12) then hour - 12 else hour)
    hour = (if (hour is 0) then 12 else hour)
    
    # Append date and time to elements.
    $("p#date").html dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + ""
    $("p#time").html hour + ":" + minute + ":" + second + " " + am_pm
    
    # jQuery st00f.
    $(document).ready ->
      
      ###
      # After-school stuff.
      final_period = $("ol#periods li:last-child")
      final_time = final_period.find("time.finish").attr("datetime")
      
      d = new Date()
      time = (d.getHours() * 3600) + (d.getMinutes() * 60)
      
      if final_time < time or $("ol#periods:empty")
        $("#after").css "display", "block"
        $("ol#periods").css "display", "none"
        $("#left").removeClass("sevencol")
        $("#right").removeClass("fivecol").addClass "twelvecol"
        $("#clock #date").css("font-size", "2.75em")
        $("#clock #time").css("font-size", "4em")
      else
        $("ol#periods").css "display", "block"
        $("#after").css "display", "none"
        $("#left").removeClass("fivecol").addClass "sevencol"
        $("#right").removeClass("twelvecol").addClass "fivecol"
      ###
      
      d = new Date()
      period = $("ol#periods li").last()
      period_time = period.find("time.finish").attr("datetime")
      current_time = (d.getHours() * 3600) + (d.getMinutes() * 60)
      
      # If it is after-school.
      if time < period_time
        $("ol#periods").css "display", "none" # Hide periods.
        $("#left").removeClass("sevencol") # Removed left column.
        $("#right").removeClass("fivecol").addClass "twelvecol" # Expand right column.
        $("#clock #date").css("font-size", "2.75em") # Increase size of date.
        $("#clock #time").css("font-size", "4em") # Increase size of time.
      
      # If it is during school.
      else
        $("ol#periods").css "display", "block" # Show periods.
        $("#left").removeClass("fivecol").addClass "sevencol" # Show left column.
        $("#right").removeClass("twelvecol").addClass "fivecol" # Shrink right column.
      
      # Which period are we currently in?
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
        
        # Border between periods.
        if time > finish and time < next_start
          element.css "border-bottom", "10px solid rgba(0, 0, 0, 0.5)"
        else
          element.css "border-bottom", "1px solid rgba(0, 0, 0, 0.5)"

      clock()
  ), 0
)()

$(document).ready ->
  
  # Stop the marquee from stopping as you hover.
  $("#marquee").marquee pauseOnHover: false
  
  # Try and loop HTML video.
  $("video[loop]").bind "ended", ->
    @play()
  
  # FitText
  $("ol#periods li").fitText 1.2,
    minFontSize: "30px"
    maxFontSize: "36px"


