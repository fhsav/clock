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
    
    days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    time = (d.getHours() * 3600) + (d.getMinutes() * 60)

    minute = "0" + minute if minute < 10
    second = "0" + second if second < 10
    
    hour = (if (hour > 12) then hour - 12 else hour)
    hour = (if (hour is 0) then 12 else hour)

    date = "#{date}"

    dayLastNum = date.substr(1, date.length)
    if dayLastNum == "1"
      suffix = "st"
    else if dayLastNum == "2"
      suffix = "nd"
    else if dayLastNum == "3"
      suffix = "rd"
    else
      suffix = "th"
    
    $("p#date").html "#{days[day]}, #{months[month]} #{date}#{suffix}, #{year}"
    $("p#time").html "#{hour}:#{minute}:#{second}"
    
    $(document).ready ->
      final = $("ol#periods li:last-child").find("time.finish").attr("datetime") - 60

      if time > final
        $("ol#periods").hide()
        $("#left").removeClass("sevencol")
        $("#right").switchClass "fivecol", "twelvecol", 750
        $("#clock").switchClass "during", "after", 1000
      else
        $("ol#periods").show()
        $("#left").addClass "sevencol"
        $("#right").switchClass "twelvecol", "fivecol", 750
        $("#clock").switchClass "after", "during", 1000
      
      $("ol#periods li").each (index) ->
        e = $(this)
        
        start = e.find("time.start").attr("datetime")
        finish = e.find("time.finish").attr("datetime") - 60

        if time >= start and time <= finish
          e.addClass "active"
        else
          e.removeClass "active"

        next = e.next().find("time.start").attr("datetime")

        if time > finish
          e.slideUp 'slow', ->
            e.hide()

      clock()
  ), 0
)()

$(document).ready ->
  $("#marquee").marquee pauseOnHover: false
  
  $('video[loop="loop"]').bind "ended", ->
    @play()
    
  pusher = new Pusher("4f803f0cec789e485391")
  channel = pusher.subscribe("refreshes")
  channel.bind "refresh", (data) ->
    window.location.href = window.location.href;
