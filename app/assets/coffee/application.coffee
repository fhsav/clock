# FHS Clock
#   file: application.coffee

(clock = ->
  setTimeout (->
    d = new Date()
    day = d.getDay()
    month = d.getMonth()
    date = d.getDate()
    year = d.getFullYear()
    hour = d.getHours()
    minute = d.getMinutes()
    second = d.getSeconds()
    
    dayArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    monthArray = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    minute = "0" + minute if minute < 10
    second = "0" + second if second < 10
    
    if hour >= 12
      am_pm = "PM"
    else
      am_pm = "AM"
    
    hour = (if (hour > 12) then hour - 12 else hour)
    hour = (if (hour is 0) then 12 else hour)
    
    $("p#date").html dayArray[day] + ", " + monthArray[month] + " " + date + ", " + year + ""
    $("p#time").html hour + ":" + minute + ":" + second + " " + am_pm
    
    $(document).ready ->
      final_period = $("ol#periods li:last-child")
      final_time = final_period.find("time.finish").attr("datetime") - 60
      time = (d.getHours() * 3600) + (d.getMinutes() * 60)

      $("#debug").text final_time

      if time > final_time
        $("ol#periods").css "display", "none"
        $("#left").removeClass("sevencol")
        $("#right").removeClass("fivecol").addClass "twelvecol"
        $("#date").css("font-size", "2.5em")
        $("#time").css("font-size", "4em")
      else
        $("ol#periods").css "display", "block"
        $("#left").addClass "sevencol"
        $("#right").removeClass("twelvecol").addClass "fivecol"
        $("#date").css("font-size", "1.75em")
        $("#time").css("font-size", "3em")
      
      $("ol#periods li").each (index) ->
        e = $(this)
        
        start = e.find("time.start").attr("datetime")
        finish = e.find("time.finish").attr("datetime")
        finish = finish - 60
        time = (d.getHours() * 3600) + (d.getMinutes() * 60)
    
        if time >= start and time <= finish
          e.attr "id", "active"
        else
          e.attr "id", ""

        next = e.next()
        next_start = next.find("time.start").attr("datetime")

        if time > finish
          e.fadeOut 'slow', ->
            e.remove()

      clock()
  ), 0
)()

$(document).ready ->
  $("#marquee").marquee pauseOnHover: false
  
  $('video[loop="loop"]').bind "ended", ->
    @play()
  
  $("ol#periods li").fitText 1.2,
    minFontSize: "30px"
    maxFontSize: "36px"
    
  pusher = new Pusher("4f803f0cec789e485391")
  channel = pusher.subscribe("refreshes")
  channel.bind "refresh", (data) ->
    window.location.href = window.location.href;
